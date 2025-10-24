const rootStyles = window.getComputedStyle(document.documentElement);
const color_main = rootStyles.getPropertyValue('--main-color');
const color_main_darker = rootStyles.getPropertyValue('--main-color-darker');

$(document).ready(function(){
  /* 공통: 캔버스 HiDPI 세팅 */
  const setup = (canvas)=>{
    const dpr = Math.max(1, window.devicePixelRatio || 1);
    const rect = canvas.getBoundingClientRect();
    canvas.width  = Math.round(rect.width * dpr);
    canvas.height = Math.round(rect.height * dpr);
    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);
    return { ctx, w: rect.width, h: rect.height };
  };

  /* ----- Pie (도넛 + 범례) ----- */
  function drawPie(canvas, data, legendEl){
    const {ctx,w,h} = setup(canvas);
    const cx=w/2, cy=h/2+6, R=Math.min(w,h)/2-14, r=R*0.58;
    const total = data.reduce((s,d)=>s+d.value,0);
    let ang=-Math.PI/2;

    // 섀도우
    ctx.save();
    ctx.shadowColor='rgba(0,0,0,.08)';
    ctx.shadowBlur=12; ctx.shadowOffsetY=4;

    data.forEach(d=>{
      const sweep = (d.value/total)*Math.PI*2;
      ctx.beginPath(); ctx.moveTo(cx,cy);
      ctx.arc(cx,cy,R,ang,ang+sweep); ctx.closePath();
      ctx.fillStyle=d.color; ctx.fill();
      ang+=sweep;
    });
    ctx.restore();

    // 안쪽 구멍(도넛)
    ctx.globalCompositeOperation='destination-out';
    ctx.beginPath(); ctx.arc(cx,cy,r,0,Math.PI*2); ctx.fill();
    ctx.globalCompositeOperation='source-over';

    // 중앙 레이블(가장 큰 값)
    const top = data.reduce((a,b)=> a.value>b.value?a:b);
    ctx.fillStyle='#111';
    ctx.font='700 18px system-ui';
    ctx.textAlign='center';
    ctx.fillText(`${top.label}`, cx, cy-4);
    ctx.fillStyle='#444';
    ctx.font='600 14px system-ui';
    ctx.fillText(`${Math.round((top.value/total)*100)}%`, cx, cy+16);

    // 범례 DOM
    if(legendEl){
      legendEl.innerHTML = data.map(d=>{
        const pct = Math.round((d.value/total)*100);
        return `<li class="item"><span class="dot" style="background:${d.color}"></span>${d.label} <span class="val">${d.value}</span>건 (${pct}%)</li>`;
      }).join('');
    }
  }

  /* ----- Bar (격자선 + 값 라벨 + 라운드 바) ----- */
  function roundRect(ctx,x,y,w,h,r){ const rr=Math.min(r, w/2, h/2);
    ctx.beginPath();
    ctx.moveTo(x+rr,y);
    ctx.arcTo(x+w,y,  x+w,y+h, rr);
    ctx.arcTo(x+w,y+h,x,  y+h, rr);
    ctx.arcTo(x,  y+h,x,  y,   rr);
    ctx.arcTo(x,  y,  x+w,y,   rr);
    ctx.closePath();
  }
  function drawBar(canvas, labels, values){
    const {ctx,w,h} = setup(canvas);
    const pad={l:36,r:14,t:10,b:28}, W=w-pad.l-pad.r, H=h-pad.t-pad.b;
    const max = Math.max(...values)*1.15;
    const step = Math.ceil(max/4);

    ctx.translate(pad.l,pad.t);

    // 그리드
    ctx.strokeStyle='rgba(0,0,0,.08)';
    ctx.lineWidth=1;
    for(let i=0;i<=4;i++){
      const y = H - (H*(i/4));
      ctx.beginPath(); ctx.moveTo(0,y); ctx.lineTo(W,y); ctx.stroke();
      ctx.fillStyle='#6b7280'; ctx.font='12px system-ui';
      ctx.fillText(String(step*i | 0), -10, y+4);
    }

    // 바
    const colW = W/values.length;
    const bw = colW*0.56;
    values.forEach((v,i)=>{
      const x = i*colW + (colW-bw)/2;
      const bh = (v/max)*H;
      ctx.fillStyle=color_main;
      roundRect(ctx, x, H-bh, bw, bh, 6); ctx.fill();

      // 값 라벨
      ctx.fillStyle='#111'; ctx.font='600 12px system-ui';
      ctx.textAlign='center';
      ctx.fillText(v, x+bw/2, H-bh-6);
    });

    // 축 라벨
    ctx.fillStyle='#374151'; ctx.font='12px system-ui'; ctx.textAlign='center';
    labels.forEach((t,i)=> ctx.fillText(t, i*colW+colW/2, H+18));
  }

  /* ----- Line (격자선 + 영역 채우기 + 포인트/라벨) ----- */
  function drawLine(canvas, labels, values){
    const {ctx,w,h} = setup(canvas);
    const pad={l:36,r:14,t:10,b:28}, W=w-pad.l-pad.r, H=h-pad.t-pad.b;
    const max = Math.max(...values)*1.15;
    ctx.translate(pad.l,pad.t);

    // 그리드
    ctx.strokeStyle='rgba(0,0,0,.08)';
    for(let i=0;i<=4;i++){
      const y = H - (H*(i/4));
      ctx.beginPath(); ctx.moveTo(0,y); ctx.lineTo(W,y); ctx.stroke();
    }

    // 라인 + 영역
    const xAt = i => (i/(values.length-1))*W;
    const yAt = v => H-(v/max)*H;

    ctx.beginPath();
    values.forEach((v,i)=> i?ctx.lineTo(xAt(i),yAt(v)):ctx.moveTo(xAt(0),yAt(values[0])));
    ctx.lineWidth=2; ctx.strokeStyle='#111'; ctx.stroke();

    ctx.lineTo(W,H); ctx.lineTo(0,H); ctx.closePath();
    ctx.fillStyle='rgba(42,123,228,.08)'; ctx.fill();

    // 포인트 + 값 라벨
    ctx.fillStyle=color_main;
    values.forEach((v,i)=>{
      const x=xAt(i), y=yAt(v);
      ctx.beginPath(); ctx.arc(x,y,3.5,0,Math.PI*2); ctx.fill();
      ctx.fillStyle='#111'; ctx.font='600 12px system-ui'; ctx.textAlign='center';
      ctx.fillText(v, x, y-8);
      ctx.fillStyle=color_main_darker;
    });

    // x 라벨
    ctx.fillStyle='#374151'; ctx.font='12px system-ui'; ctx.textAlign='center';
    labels.forEach((t,i)=> ctx.fillText(t, xAt(i), H+18));
  }

  /* ----- 렌더 ----- */
  window.addEventListener('load', ()=>{
    // 파이(도넛)
    drawPie(
      document.getElementById('chart-pie'),
      [
        {label:'완료',   value:60, color:'#5CC8D7'},
        {label:'미완료', value:30, color:'#FFD38D'},
        {label:'반려',   value:10, color:'#F59E9E'},
      ],
      document.getElementById('legend-pie')
    );

    // 막대
    drawBar(
      document.getElementById('chart-bar'),
      ['개발','디자인','인사관리','경영지원'],
      [18, 28, 26, 34]
    );

    // KPI
    document.getElementById('kpi-count').textContent = '21';

    // 라인
    drawLine(
      document.getElementById('chart-line'),
      ['1월','2월','3월','4월','5월','6월'],
      [12, 18, 25, 24, 28, 40]
    );
  });
});

