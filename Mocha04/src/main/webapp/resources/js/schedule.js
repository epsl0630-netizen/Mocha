// schedule.js 내용

// 가상의 일정 데이터 (date 필드를 startDate와 endDate로 변경)
const events = [
    { id: 1, startDate: '2025-10-08', endDate: '2025-10-08', title: '주간 회의', start: '10:00', end: '11:00', memo: '주요 안건 논의', type: 'team' },
    { id: 2, startDate: '2025-10-08', endDate: '2025-10-08', title: '클라이언트 미팅', start: '14:00', end: '15:30', memo: '프로젝트 A 관련', type: 'personal' },
    { id: 3, startDate: '2025-10-15', endDate: '2025-10-17', title: '팀 워크샵', start: '09:00', end: '18:00', memo: '강원도 출장', type: 'team' }, // 🚨 기간 일정 예시
    { id: 4, startDate: '2025-10-20', endDate: '2025-10-20', title: '분기별 보고서 제출 마감', start: '', end: '', memo: '', type: 'personal' },
    { id: 5, startDate: '2025-09-29', endDate: '2025-09-29', title: '9월 최종 마감', start: '', end: '', memo: '', type: 'team' },
    { id: 6, startDate: '2025-10-08', endDate: '2025-10-08', title: '개인 개발 시간', start: '16:00', end: '18:00', memo: '새 기능 학습', type: 'personal' },
    { id: 7, startDate: '2025-10-15', endDate: '2025-10-15', title: '점심 식사', start: '12:00', end: '13:00', memo: '팀원들과', type: 'personal' },
    { id: 8, startDate: '2025-10-22', endDate: '2025-10-22', title: 'HR 면담', start: '11:00', end: '12:00', memo: '개인 목표 설정', type: 'personal' },
    { id: 9, startDate: '2025-10-22', endDate: '2025-10-22', title: '전사 미팅', start: '14:00', end: '15:00', memo: '연말 계획', type: 'team' },
    { id: 10, startDate: '2025-10-29', endDate: '2025-10-29', title: '코드 리뷰', start: '10:00', end: '11:00', memo: 'PR 검토', type: 'team' },
    { id: 11, startDate: '2025-10-29', endDate: '2025-10-29', title: '기술 세미나', start: '15:00', end: '17:00', memo: '신기술 소개', type: 'team' },
];

// 현재 달력의 연도와 월, 그리고 현재 필터링 상태를 저장할 전역 변수
let currentYear;
let currentMonth; // 0부터 시작 (0=1월, 11=12월)
let selectedDateElement = null; // 현재 선택된 날짜의 <td> 요소를 저장
let currentFilter = 'all'; // 'all', 'personal', 'team' 중 하나

// DOM 요소
const calTitle = document.getElementById('cal-title');
const calBody = document.getElementById('cal-body');
const eventListTitle = document.getElementById('event-list-title');
const eventList = document.getElementById('event-list');
const btnPrev = document.getElementById('btn-prev');
const btnNext = document.getElementById('btn-next');
const btnToday = document.getElementById('btn-today'); // HTML에 없으나 기존 JS에 있어 유지
const btnNew = document.getElementById('btn-new'); // HTML에 없으나 기존 JS에 있어 유지

const eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
const eventForm = document.getElementById('event-form');
// 🚨 event-date 대신 event-start-date와 event-end-date를 사용하도록 변경 가정
const eventStartDateInput = document.getElementById('event-start-date'); 
const eventEndDateInput = document.getElementById('event-end-date'); 
const eventTitleInput = document.getElementById('event-title');
const eventStartInput = document.getElementById('event-start');
const eventEndInput = document.getElementById('event-end');
const eventMemoInput = document.getElementById('event-memo');
const eventIdInput = document.getElementById('event-id');
const btnDelete = document.getElementById('btn-delete');

// 🚨 추가된 필터 버튼 DOM 요소
const btnFilterAll = document.getElementById('btn-filter-all');
const btnFilterPersonal = document.getElementById('btn-filter-personal');
const btnFilterTeam = document.getElementById('btn-filter-team');
// ----------------------------------------------------------------------


/**
 * 날짜 객체에서 'YYYY-MM-DD' 형식의 문자열을 반환합니다.
 * @param {Date} date - 날짜 객체
 * @returns {string} 'YYYY-MM-DD' 형식의 문자열
 */
function formatDateString(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

/**
 * 달력의 헤더 제목을 업데이트합니다.
 */
function updateCalTitle() {
    calTitle.textContent = `${currentYear}. ${String(currentMonth + 1).padStart(2, '0')}`;
}

/**
 * 현재 필터 상태에 따라 이벤트를 필터링합니다.
 * @returns {Array<object>} 필터링된 이벤트 목록
 */
function getFilteredEvents() {
    if (currentFilter === 'personal') {
        return events.filter(e => e.type === 'personal');
    } else if (currentFilter === 'team') {
        return events.filter(e => e.type === 'team');
    }
    return events; // 'all' 또는 기타의 경우 전체 반환
}

/**
 * 필터 버튼의 활성화 상태를 업데이트합니다.
 */
function updateFilterButtons() {
    // 모든 버튼의 상태 초기화 (primary/outline-primary 클래스 토글)
    [btnFilterAll, btnFilterPersonal, btnFilterTeam].forEach(btn => {
        btn.classList.remove('btn-primary', 'btn-outline-primary');
    });

    if (currentFilter === 'all') {
        btnFilterAll.classList.add('btn-primary');
        btnFilterPersonal.classList.add('btn-outline-primary');
        btnFilterTeam.classList.add('btn-outline-primary');
    } else if (currentFilter === 'personal') {
        btnFilterAll.classList.add('btn-outline-primary');
        btnFilterPersonal.classList.add('btn-primary');
        btnFilterTeam.classList.add('btn-outline-primary');
    } else if (currentFilter === 'team') {
        btnFilterAll.classList.add('btn-outline-primary');
        btnFilterPersonal.classList.add('btn-outline-primary');
        btnFilterTeam.classList.add('btn-primary');
    }
}

/**
 * 필터를 변경하고 달력을 다시 그립니다.
 * @param {string} filterType - 'all', 'personal', 'team' 중 하나
 */
function changeFilter(filterType) {
    currentFilter = filterType;
    updateFilterButtons();
    renderCalendar();
}


/**
 * 달력에 날짜를 그립니다.
 */
function renderCalendar() {
    const today = new Date();
    const firstDayOfMonth = new Date(currentYear, currentMonth, 1);
    const lastDayOfMonth = new Date(currentYear, currentMonth + 1, 0);
    const firstDayWeek = firstDayOfMonth.getDay(); // 0=일요일, 6=토요일
    const lastDate = lastDayOfMonth.getDate();

    calBody.innerHTML = ''; // 기존 내용 초기화
    
    // 🚨 필터링된 이벤트 사용
    const filteredEvents = getFilteredEvents(); 
    
    // 이전에 선택된 날짜 처리 로직 (월 이동 시 선택 유지 또는 초기화)
    const prevSelectedDateString = selectedDateElement ? selectedDateElement.getAttribute('data-date') : null;
    let targetDateString = prevSelectedDateString;
    
    if (!targetDateString || targetDateString.substring(0, 7) !== `${currentYear}-${String(currentMonth + 1).padStart(2, '0')}`) {
        if (currentYear === today.getFullYear() && currentMonth === today.getMonth()) {
            targetDateString = formatDateString(today);
        } else {
            targetDateString = `${currentYear}-${String(currentMonth + 1).padStart(2, '0')}-01`;
        }
    }
    selectedDateElement = null;


    let date = 1;
    let currentRow;

    // 달력 날짜 채우기
    for (let i = 0; i < 6; i++) {
        currentRow = document.createElement('tr');
        for (let j = 0; j < 7; j++) {
            const cell = document.createElement('td');
            cell.classList.add('p-2', 'align-top', 'calendar-day'); 
            cell.style.height = '120px'; 
            
            // 지난달/다음달 빈칸 처리
            if (i === 0 && j < firstDayWeek) {
                cell.classList.add('bg-light'); 
            } else if (date > lastDate) {
                cell.classList.add('bg-light'); 
            } else {
                const day = date;
                const cellDate = new Date(currentYear, currentMonth, day);
                const dateString = formatDateString(cellDate); // 현재 캘린더 칸의 날짜
                
                // 날짜 숫자 표시부 생성
                const dateNumberDiv = document.createElement('div');
                dateNumberDiv.classList.add('d-flex', 'justify-content-between', 'align-items-center', 'mb-1');
                
                const dayStrong = document.createElement('strong');
                dayStrong.textContent = day;
                
                // 요일 색상 설정
                if (j === 0) dayStrong.classList.add('text-danger');
                else if (j === 6) dayStrong.classList.add('text-primary');
                else dayStrong.classList.add('text-dark');
                
                // 오늘 날짜 표시 로직
                if (currentYear === today.getFullYear() && currentMonth === today.getMonth() && day === today.getDate()) {
                    dayStrong.style.cssText = 'padding: 2px 7px; background-color: #ffc107; color: white !important; border-radius: 50%; display: inline-block;';
                }

                dateNumberDiv.appendChild(dayStrong);
                cell.appendChild(dateNumberDiv);

                // 일정 마커 컨테이너 생성 
                const eventMarkerContainer = document.createElement('div');
                eventMarkerContainer.classList.add('small', 'event-markers');
                eventMarkerContainer.style.cssText = 'max-height: 80px; overflow-y: auto; overflow-x: hidden;';
                
                // 🚨 일정 마커 추가 로직: 현재 날짜(dateString)가 일정 기간(startDate ~ endDate)에 포함되는지 확인
                const dayEvents = filteredEvents.filter(e => {
                    return e.startDate <= dateString && e.endDate >= dateString;
                });
                
                dayEvents.forEach(event => {
                    const eventEl = document.createElement('div');
                    
                    // 🚨 일정 타입에 따라 뱃지 색상 및 텍스트 설정
                    const badgeClass = event.type === 'personal' ? 'bg-primary' : 'bg-success'; 
                    
                    eventEl.classList.add('text-truncate', 'badge', badgeClass, 'text-white', 'd-block', 'event-item');
                    eventEl.style.cssText = 'cursor: pointer; margin-bottom: 2px !important; padding: 1px 4px !important;';
                    eventEl.textContent = event.title;
                    eventEl.setAttribute('data-event-id', event.id);
                    eventMarkerContainer.appendChild(eventEl);
                });
                
                cell.appendChild(eventMarkerContainer);
                cell.setAttribute('data-date', dateString);
                
                // 클릭 이벤트 리스너 추가
                cell.addEventListener('click', () => selectDate(cell));
                
                // 선택된 날짜와 일치하면 선택 상태로 표시 준비
                if (dateString === targetDateString) {
                    selectedDateElement = cell;
                }
                
                date++;
            }
            currentRow.appendChild(cell);
        }
        if (date > lastDate && i !== 0) break;
        
        calBody.appendChild(currentRow);
    }
    
    // 렌더링 후, 선택된 날짜를 강조하고 이벤트 목록을 표시
    if (selectedDateElement) {
        selectDate(selectedDateElement);
    } else {
        const firstDateCell = calBody.querySelector('td[data-date]');
        if (firstDateCell) {
             selectDate(firstDateCell);
        }
    }
    
    // 일정 항목 클릭 이벤트 리스너 (일정 수정 모달) - 캘린더 내 마커
    document.querySelectorAll('.event-item').forEach(item => {
        item.addEventListener('click', (e) => {
            e.stopPropagation(); 
            const eventId = parseInt(item.getAttribute('data-event-id'));
            const event = events.find(e => e.id === eventId);
            openEventModal(event);
        });
    });
}

/**
 * 특정 날짜를 선택하고 해당 날짜의 이벤트를 표시합니다.
 * @param {HTMLTableCellElement} cell - 클릭된 <td> 요소
 */
function selectDate(cell) {
    if (selectedDateElement) {
        selectedDateElement.classList.remove('table-primary');
    }
    
    selectedDateElement = cell;
    cell.classList.add('table-primary');
    
    const selectedDate = cell.getAttribute('data-date'); // 현재 선택된 날짜
    const [year, month, day] = selectedDate.split('-');
    
    eventListTitle.textContent = `${year}년 ${parseInt(month)}월 ${parseInt(day)}일 일정`;
    
    // 🚨 필터링된 이벤트 중 선택된 날짜에 포함되는 이벤트만 목록에 표시
    const filteredEvents = getFilteredEvents();
    const dayEvents = filteredEvents.filter(e => {
        // 선택된 날짜(selectedDate)가 일정 기간(startDate ~ endDate)에 포함되는지 확인
        return e.startDate <= selectedDate && e.endDate >= selectedDate;
    }).sort((a, b) => {
        // 시간이 있는 경우 시간으로 정렬, 없는 경우 등록 순
        const timeA = a.start || '99:99'; 
        const timeB = b.start || '99:99';
        return timeA.localeCompare(timeB);
    });
    
    eventList.innerHTML = '';
    
    if (dayEvents.length === 0) {
        eventList.innerHTML = '<div class="text-muted small">등록된 일정이 없습니다.</div>';
    } else {
        dayEvents.forEach(event => {
            
            // 🚨 시간과 기간 표시를 분리
            let timeInfo = (event.start && event.end) ? `${event.start} ~ ${event.end}` : '종일';
            let dateInfo = event.startDate === event.endDate ? '' : ` (${event.startDate.substring(5)} ~ ${event.endDate.substring(5)})`;
            
            const eventItem = document.createElement('a');
            eventItem.href = '#';
            eventItem.classList.add('d-block', 'text-decoration-none', 'text-dark', 'p-2', 'mb-2', 'border', 'rounded', 'shadow-sm', 'event-detail-item');
            
            // 🚨 일정 타입에 따라 뱃지 색상 및 텍스트 설정
            const badgeClass = event.type === 'personal' ? 'bg-primary' : 'bg-success'; 
            const typeText = event.type === 'personal' ? '내 일정' : '팀 일정';

            eventItem.innerHTML = `
                <strong>${event.title}</strong>
                <span class="badge ${badgeClass} ms-2">${typeText}</span>
                <span class="badge bg-secondary ms-2">${timeInfo}${dateInfo}</span>
                <p class="mb-0 small text-muted">${event.memo || '메모 없음'}</p>
            `;
            eventItem.setAttribute('data-event-id', event.id);
            
            // 상세 목록 클릭 시 수정 모달 열기
            eventItem.addEventListener('click', (e) => {
                e.preventDefault();
                openEventModal(event);
            });
            
            eventList.appendChild(eventItem);
        });
    }
}

/**
 * 일정 등록/수정 모달을 엽니다.
 * @param {object} event - 수정할 이벤트 객체. 없으면 등록 모드.
 */
function openEventModal(event = null) {
    eventForm.reset();
    btnDelete.classList.add('d-none');
    
    const radioPersonal = document.getElementById('event-type-personal');
    const radioTeam = document.getElementById('event-type-team');
    
    if (event) {
        // 수정 모드
        document.querySelector('#eventModal .modal-title').textContent = '일정 수정';
        
        // 🚨 [수정] startDate와 endDate 필드에 값 설정
        eventStartDateInput.value = event.startDate;
        eventEndDateInput.value = event.endDate;
        
        eventTitleInput.value = event.title;
        eventStartInput.value = event.start;
        eventEndInput.value = event.end;
        eventMemoInput.value = event.memo;
        eventIdInput.value = event.id;
        
        // 일정 유형 선택
        if (event.type === 'personal') {
            radioPersonal.checked = true;
        } else {
            radioTeam.checked = true;
        }
        
        btnDelete.classList.remove('d-none');
    } else {
        // 등록 모드 (새 일정)
        document.querySelector('#eventModal .modal-title').textContent = '새 일정 등록';
        eventIdInput.value = '';
        
        // 🚨 [수정] 현재 선택된 날짜를 시작일/종료일 모두에 기본 설정
        const defaultDate = selectedDateElement ? selectedDateElement.getAttribute('data-date') : formatDateString(new Date());
        eventStartDateInput.value = defaultDate;
        eventEndDateInput.value = defaultDate;
        
        // 새 일정 기본값은 '내 일정'으로 설정
        radioPersonal.checked = true;
    }
    
    eventModal.show();
}

/**
 * 달력 초기화 및 이동 기능을 설정합니다.
 */
function initCalendar() {
    const today = new Date();
    
    currentYear = today.getFullYear();
    currentMonth = today.getMonth();
    
    updateCalTitle();
    updateFilterButtons(); // 초기 필터 버튼 상태 설정
    renderCalendar();

    // 이전 달 버튼
    btnPrev.addEventListener('click', () => {
        currentMonth--;
        if (currentMonth < 0) {
            currentMonth = 11;
            currentYear--;
        }
        updateCalTitle();
        renderCalendar();
    });

    // 다음 달 버튼
    btnNext.addEventListener('click', () => {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        updateCalTitle();
        renderCalendar();
    });
    
    // 🚨 필터 버튼 이벤트 리스너 추가
    btnFilterAll.addEventListener('click', () => changeFilter('all'));
    btnFilterPersonal.addEventListener('click', () => changeFilter('personal'));
    btnFilterTeam.addEventListener('click', () => changeFilter('team'));
    
    // 폼 제출 (일정 저장) - 가상의 저장 로직
    eventForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        // 🚨 [수정] startDate와 endDate 값 가져오기
        const startDate = eventStartDateInput.value; 
        const endDate = eventEndDateInput.value;    
        const title = eventTitleInput.value;
        const start = eventStartInput.value;
        const end = eventEndInput.value;
        const memo = eventMemoInput.value;
        const id = eventIdInput.value ? parseInt(eventIdInput.value) : null;
        
        const typeElement = document.querySelector('input[name="event-type"]:checked');
        const type = typeElement ? typeElement.value : 'personal'; 

        if (title.trim() === '') {
            alert('일정 제목을 입력해주세요.');
            return;
        }
        
        // 🚨 유효성 검사 추가: 종료일은 시작일보다 빠를 수 없음
        if (startDate > endDate) {
            alert('종료일은 시작일보다 빠를 수 없습니다.');
            return;
        }


        if (id) {
            // 수정
            const index = events.findIndex(e => e.id === id);
            if (index !== -1) {
                // 🚨 [수정] startDate, endDate 저장
                events[index] = { id, startDate, endDate, title, start, end, memo, type }; 
                
                // 현재 달력과 수정된 일정의 시작 달이 다르면 해당 달로 이동
                const [newYear, newMonth] = startDate.split('-').map(Number);
                if (currentYear !== newYear || currentMonth !== newMonth - 1) {
                    currentYear = newYear;
                    currentMonth = newMonth - 1;
                }
            }
            alert('일정이 수정되었습니다.');
        } else {
            // 등록
            const newId = events.length > 0 ? Math.max(...events.map(e => e.id)) + 1 : 1;
            // 🚨 [수정] startDate, endDate 저장
            events.push({ id: newId, startDate, endDate, title, start, end, memo, type }); 
            
            // 등록된 일정의 시작 달로 이동
            const [newYear, newMonth] = startDate.split('-').map(Number);
            currentYear = newYear;
            currentMonth = newMonth - 1;
            
            alert('일정이 등록되었습니다.');
        }
        
        eventModal.hide();
        renderCalendar(); // 달력 다시 그리기 (필터링된 상태 유지)
    });
    
    // 삭제 버튼 - 가상의 삭제 로직
    btnDelete.addEventListener('click', () => {
        const id = parseInt(eventIdInput.value);
        if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
            const index = events.findIndex(e => e.id === id);
            if (index !== -1) {
                events.splice(index, 1);
            }
            eventModal.hide();
            renderCalendar(); // 달력 다시 그리기
            alert('일정이 삭제되었습니다.');
        }
    });
}

// 페이지 로드 시 달력 초기화
document.addEventListener('DOMContentLoaded', initCalendar);