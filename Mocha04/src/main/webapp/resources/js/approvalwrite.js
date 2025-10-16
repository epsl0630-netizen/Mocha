
// jQuery와 Vanilla JS 코드를 모두 담기 위한 안전한 블록
$(document).ready(function() {
  
  // =======================================================
// V. 삭제 및 단계 재정렬 로직 추가
// =======================================================

// 💡 (1) 행 삭제 후 단계 번호와 상태를 재정렬하는 함수
function reindexApprovalSteps($tbody) {
    $tbody.find('tr').each(function(index) {
        const newStep = index + 1;
        const $row = $(this);
        
        // 1. 단계 번호 업데이트
        $row.find('.approval-step-num').text(newStep); 

        // 2. 상태 업데이트 (첫 번째만 '결재대기', 나머지는 '결재예정')
        const $statusCell = $row.find('td').eq(3); // 상태가 4번째 <td> (인덱스 3)에 있다고 가정
        let newStatus;
        if (newStep === 1) {
            newStatus = '결재대기';
            $statusCell.addClass('text-primary');
        } else {
            newStatus = '결재예정';
            $statusCell.removeClass('text-primary');
        }
        $statusCell.text(newStatus);
    });
}


// 💡 (2) 삭제 버튼 이벤트 리스너
$('#mainApprovalTableBody').on('click', '.remove-approver', function() {
    const $rowToRemove = $(this).closest('tr');
    const $tbody = $rowToRemove.parent();
    
    // 1. 행 삭제
    $rowToRemove.remove();
    
    // 2. 남은 행 재정렬 (단계 번호 및 상태 업데이트)
    reindexApprovalSteps($tbody);

    console.log("결재자 삭제 및 재정렬 완료");
});
    
    // =======================================================
    // I. 유틸리티 함수 (체크박스 키 이스케이프)
    // =======================================================
    function escapeSelector(s) {
        // 정규식에서 특수문자들을 이스케이프하고, jQuery 선택자에서 사용할 수 있도록 \를 두 번 씁니다.
        return s.replace(/([!"#$%&'()*+,./:;<=>?@[\\\]^`{|}~])/g, '\\$&'); 
    }


    // =======================================================
    // II. 파일 첨부 로직 (DOMContentLoaded에서 이관)
    // =======================================================
    const fileInput = document.getElementById('bf-file');
    const fileListContainer = document.getElementById('bf-file-list');
    let currentFilesArray = [];

    fileInput.addEventListener('change', function() {
        const newlySelectedFiles = fileInput.files;
        Array.from(newlySelectedFiles).forEach(file => {
            currentFilesArray.push(file);
        });
        updateFileInputFiles();
        renderFileList(currentFilesArray);
        fileInput.value = '';
    });

    function updateFileInputFiles() {
        const dataTransfer = new DataTransfer();
        currentFilesArray.forEach(file => {
            dataTransfer.items.add(file);
        });
        fileInput.files = dataTransfer.files;
    }

    function renderFileList(files) {
        fileListContainer.innerHTML = ''; 
        if (files.length === 0) {
            return;
        }

        files.forEach((file, index) => {
            const fileItem = document.createElement('div');
            fileItem.className = 'd-flex justify-content-between align-items-center p-2 mb-1 border rounded bg-light';

            const fileNameSpan = document.createElement('span');
            fileNameSpan.className = 'text-truncate me-2';
            fileNameSpan.textContent = file.name;
            
            const deleteButton = document.createElement('button');
            deleteButton.type = 'button';
            deleteButton.className = 'btn-close';
            deleteButton.setAttribute('aria-label', 'Close');
            
            deleteButton.addEventListener('click', () => {
                deleteFile(index);
            });

            fileItem.appendChild(fileNameSpan);
            fileItem.appendChild(deleteButton);
            fileListContainer.appendChild(fileItem);
        });
    }

    function deleteFile(indexToDelete) {
        currentFilesArray.splice(indexToDelete, 1);
        updateFileInputFiles();
        renderFileList(currentFilesArray); 
    }
    
    renderFileList(currentFilesArray); 

    // =======================================================
    // III. 모달 내 조직도 및 선택 로직 (jQuery 이벤트)
    // =======================================================
    
  // [수정된 코드]
// 1. 모달이 열릴 때: 기존 선택 내역 초기화 및 조직도 체크박스 상태 강제 초기화
$('#approvalLineModal').on('show.bs.modal', function () {
    const $tableBody = $('#selectedTableBody');
    $tableBody.empty(); // (1) 우측 선택 테이블 초기화 완료

    // (2) 좌측 조직도 내의 모든 체크박스 상태를 강제로 해제
    // ':checkbox' 선택자를 사용하여 HTML에서 모든 체크박스 요소를 확실하게 선택합니다.
    // 만약 '.person' 클래스를 모든 체크박스에 빠짐없이 사용했다면 아래 코드를 사용합니다.
    $('.approval-tree').find(':checkbox').prop('checked', false);
    
    // ⭐ [디버깅 코드] 실제로 몇 개의 체크박스가 리셋되었는지 확인합니다.
    console.log("모달 열림: 초기화된 체크박스 수:", $('.approval-tree').find(':checkbox').length);
});
    // 2. 체크박스 클릭 이벤트: 선택/추가/제거
    $('.approval-tree').on('change', '.person', function() {
        const isChecked = $(this).is(':checked');
        
        // .trim()을 사용하여 데이터 속성 값 앞뒤 공백 제거
        const dept = $(this).data('dept').trim();
        const rank = $(this).data('rank').trim();
        const name = $(this).data('name').trim();
        
        // 부서|직급|이름을 조합하여 고유 키 생성
        const key = `${dept}|${rank}|${name}`;
        
        const $tableBody = $('#selectedTableBody');
        const escapedKey = escapeSelector(key); // 키 이스케이프 처리
        
        if (isChecked) {
            // 중복 방지 체크
            if ($tableBody.find(`tr[data-key="${escapedKey}"]`).length === 0) {
                // 테이블에 행 추가
                const newRow = `
                    <tr data-key="${key}">
                        <td style="width:35%">${dept}</td>
                        <td style="width:20%">${rank}</td>
                        <td style="width:35%">${name}</td>
                        <td style="width:10%" class="text-center"> 
                            <button type="button" class="btn btn-sm btn-outline-danger remove-person" title="제거">
                                <span class="material-symbols-outlined" style="font-size: 14px; transform: translateY(3px);">close</span>
                            </button>
                        </td>
                    </tr>
                `;
                $tableBody.append(newRow);
            }
        } else {
            // 체크 해제된 경우: 테이블에서 해당 행 제거
            $tableBody.find(`tr[data-key="${escapedKey}"]`).remove();
        }

        // 스크롤이 생긴 경우, 맨 아래로 이동
        const $scrollContainer = $tableBody.closest('.approval-scroll');
        if ($scrollContainer.length) {
            $scrollContainer.scrollTop($scrollContainer[0].scrollHeight);
        }
    });

    // 3. 우측 테이블의 '삭제' 버튼 클릭 이벤트: 조직도 체크 해제 동기화
    $('#selectedTableBody').on('click', '.remove-person', function() {
        const $row = $(this).closest('tr');
        const keyToRemove = $row.data('key');
        
        // key를 파싱하여 개별 데이터 추출 (부서|직급|이름)
        const [dept, rank, name] = keyToRemove.split('|');

        // 우측 테이블에서 행 제거
        $row.remove();

        // 좌측 조직도에서 해당 체크박스 찾아서 해제 동기화
        $(`.person[data-dept="${escapeSelector(dept)}"][data-rank="${escapeSelector(rank)}"][data-name="${escapeSelector(name)}"]`).prop('checked', false);
    });
    
    // 4. 검색 (간단 필터) 로직 (DOMContentLoaded에서 이관)
    $('#treeSearch').on('input', function() {
        const term = $(this).val().trim();
        $('#orgTree li').show(); // 모두 보이기
        if (!term) return;

        $('#orgTree li').each(function() {
            const text = $(this).text().replace(/\s+/g,' ').toLowerCase();
            if (!text.includes(term.toLowerCase())) {
                $(this).hide();
            }
        });
    });


    // =======================================================
    // IV. 확인/취소 로직 (btnOk) (DOMContentLoaded에서 이관)
    // =======================================================

    $('#btnOk').on('click', function() {
        const $mainTbody = $('#mainApprovalTableBody'); 
        //$mainTbody.empty(); 
        let currentStepCount = $mainTbody.find('tr').length; 
        // 1. 모달에서 선택된 결재자 목록 가져오기 (jQuery 방식으로 변경)
        const selectedRows = $('#selectedTableBody tr')
            .map((i, tr) => {
                const key = $(tr).data('key');
                if (!key) {
                    console.error("데이터 키(data-key)가 누락되었습니다.");
                    return null;
                }
                const [dept, rank, name] = key.split('|');
                return { dept: dept, rank: rank, name: name, key: key };
            })
            .get() // jQuery map 결과를 배열로 변환
            .filter(p => p !== null); 
        
      

// 2. 메인 테이블에 반영
selectedRows.forEach((person) => {
    
    // 💡 [수정] 현재 단계 번호를 업데이트합니다. (기존에 있던 currentStepCount 변수 사용)
    currentStepCount++; 
    const step = currentStepCount;
    
    // 💡 [수정] 첫 번째 항목만 '결재대기', 나머지는 '결재예정'으로 상태를 설정합니다.
    const status = step === 1 ? '결재대기' : '결재예정';
    const statusClass = status === '결재대기' ? 'text-primary' : '';
    
    const newRow = `
        <tr>
            <td class="approval-step-num">${step}</td> 
            <td>${person.rank}</td>
            <td>${person.name}</td>
            <td class="${statusClass}">${status}</td>
            <td>-</td>
            <td>-</td>
            <td class="text-center delete-cell"> 
                <button type="button" class="btn btn-sm btn-outline-danger remove-approver" title="삭제">
                    <span class="material-symbols-outlined" style="font-size: 14px; transform: translateY(3px);">close</span>
                </button>
            </td>
        </tr>
    `;
    $mainTbody.append(newRow);
});
        // 3. 모달 닫기
        // Bootstrap 5의 JS 메서드를 사용하여 모달 닫기
        const modalElement = document.getElementById('approvalLineModal');
        const modal = bootstrap.Modal.getInstance(modalElement) || new bootstrap.Modal(modalElement);
        modal.hide();
    });

    // 5. 모달이 완전히 닫힌 후 처리 (backdrop 잔류 문제 해결)
     $('#approvalLineModal').on('hidden.bs.modal', function () {
        // 💡 [핵심 수정] body에서 'modal-open' 클래스를 강제로 제거하여 스크롤 복구
        $('body').removeClass('modal-open'); 

        // 혹시라도 남아있을 수 있는 backdrop 제거
        $('.modal-backdrop').remove();
        
        // 검색 필드 초기화
        $('#treeSearch').val('');
        // 조직도 필터 초기화
        $('#orgTree li').show();
        
    });

});
