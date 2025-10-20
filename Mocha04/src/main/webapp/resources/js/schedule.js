// schedule.js 내용

// =================================================================
// 🚨 1. 전역 스코프 변수 및 데이터
// =================================================================

// 가상의 일정 데이터 (주석 처리 상태 유지)
/*
events = [
    // ... 가상의 데이터 ...
];
*/

let events = []; // DB 데이터를 담을 배열

let currentYear;
let currentMonth; // 0부터 시작 (0=1월, 11=12월)
let selectedDateElement = null;
let currentFilter = 'all'; 
let isInitialLoad = true; 

/**
 * 날짜 객체에서 'YYYY-MM-DD' 형식의 문자열을 반환합니다.
 */
function formatDateString(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}


// =================================================================
// 🚨 2. openEventModal 함수 (변경 없음)
// =================================================================
/**
 * 일정 등록/수정 모달을 엽니다.
 * @param {object} event - 수정할 이벤트 객체. 없으면 등록 모드.
 */
function openEventModal(event = null) {
    // ... (기존 openEventModal 코드 유지) ...
    const eventModalElement = document.getElementById('eventModal');
    if (!eventModalElement) {
        console.error("Error: Modal element with ID 'eventModal' not found.");
        return;
    }
    const eventModal = new bootstrap.Modal(eventModalElement); 
    
    // 모달 내 DOM 요소
    const eventForm = document.getElementById('event-form');
    const btnDelete = document.getElementById('btn-delete');
    const eventStartDateInput = document.getElementById('event-start-date'); 
    const eventEndDateInput = document.getElementById('event-end-date'); 
    const eventTitleInput = document.getElementById('event-title');
    const eventStartInput = document.getElementById('event-start');
    const eventEndInput = document.getElementById('event-end');
    const eventMemoInput = document.getElementById('event-memo');
    const eventIdInput = document.getElementById('event-id');
    const radioPersonal = document.getElementById('event-type-personal');
    const radioTeam = document.getElementById('event-type-team');
    
    eventForm.reset();
    btnDelete.classList.add('d-none');
    
    if (event) {
        // 수정 모드
        document.querySelector('#eventModal .modal-title').textContent = '일정 수정';
        
        eventStartDateInput.value = event.startDate;
        eventEndDateInput.value = event.endDate;
        eventTitleInput.value = event.title;
        eventStartInput.value = event.start;
        eventEndInput.value = event.end;
        eventMemoInput.value = event.memo;
        eventIdInput.value = event.id;
        
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
        
        // 전역 변수 selectedDateElement를 사용하여 기본 날짜 설정
        let defaultDateString = selectedDateElement 
            ? selectedDateElement.getAttribute('data-date') 
            : formatDateString(new Date());

        eventStartDateInput.value = defaultDateString;
        eventEndDateInput.value = defaultDateString;
        
        radioPersonal.checked = true;
    }
    
    eventModal.show();
}


// =================================================================
// 🚨 3. $(document).ready 블록: 초기화 및 이벤트 리스너 설정
// =================================================================
$(document).ready(function() {
    
    // DOM 요소 (ready() 내에서만 사용되는 것들)
    const calTitle = document.getElementById('cal-title');
    const calBody = document.getElementById('cal-body');
    const eventListTitle = document.getElementById('event-list-title');
    const eventList = document.getElementById('event-list');
    const btnPrev = document.getElementById('btn-prev');
    const btnNext = document.getElementById('btn-next');
    const eventForm = document.getElementById('event-form');
    const eventStartDateInput = document.getElementById('event-start-date'); 
    const eventEndDateInput = document.getElementById('event-end-date'); 
    const eventTitleInput = document.getElementById('event-title');
    const eventStartInput = document.getElementById('event-start');
    const eventEndInput = document.getElementById('event-end');
    const eventMemoInput = document.getElementById('event-memo');
    const eventIdInput = document.getElementById('event-id');
    const btnDelete = document.getElementById('btn-delete');
    const btnFilterAll = document.getElementById('btn-filter-all');
    const btnFilterPersonal = document.getElementById('btn-filter-personal');
    const btnFilterTeam = document.getElementById('btn-filter-team');
    // ----------------------------------------------------------------------


    /**
     * ⭐️ AJAX: 서버에서 일정 데이터를 불러와 전역 events 배열을 업데이트합니다.
     * (initCalendar 밖으로 이동 - 구조 개선)
     */
    function loadEventsFromDB(callback) {
        $.ajax({
            url: CONTEXT_PATH+'/schedule/eventsData', // Controller에서 추가한 API 경로
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                // ⭐️ 전역 events 배열을 DB 데이터로 업데이트
                events = data; 
                if (callback) {
                    callback();
                }
            },
            error: function(xhr, status, error) {
                console.error("일정 데이터를 불러오는 데 실패했습니다.", error);
                alert("일정 데이터를 불러오지 못했습니다.");
                if (callback) {
                    callback();
                }
            }
        });
    }
    
    // ----------------------------------------------------------------------

    /**
     * 달력의 헤더 제목을 업데이트합니다.
     */
    function updateCalTitle() {
        calTitle.textContent = `${currentYear}. ${String(currentMonth + 1).padStart(2, '0')}`;
    }

    /**
     * 현재 필터 상태에 따라 이벤트를 필터링합니다.
     */
    function getFilteredEvents() {
        if (currentFilter === 'personal') {
            return events.filter(e => e.type === 'personal');
        } else if (currentFilter === 'team') {
            return events.filter(e => e.type === 'team');
        }
        return events;
    }

    /**
     * 필터 버튼의 활성화 상태를 업데이트합니다.
     */
    function updateFilterButtons() {
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
     */
    function changeFilter(filterType) {
        currentFilter = filterType;
        updateFilterButtons();
        renderCalendar();
    }


    /**
     * 달력에 날짜를 그립니다. (내용 변경 없음)
     */
    function renderCalendar() {
        // ... (기존 renderCalendar 코드 유지) ...
        const today = new Date();
        const firstDayOfMonth = new Date(currentYear, currentMonth, 1);
        const lastDayOfMonth = new Date(currentYear, currentMonth + 1, 0);
        const firstDayWeek = firstDayOfMonth.getDay(); 
        const lastDate = lastDayOfMonth.getDate();

        calBody.innerHTML = ''; 
        
        const filteredEvents = getFilteredEvents(); 
        
        const prevSelectedDateString = selectedDateElement ? selectedDateElement.getAttribute('data-date') : null;
        let targetDateString = prevSelectedDateString;
        
        if (!targetDateString || targetDateString.substring(0, 7) !== `${currentYear}-${String(currentMonth + 1).padStart(2, '0')}`) {
            if (currentYear === today.getFullYear() && currentMonth === today.getMonth()) {
                targetDateString = formatDateString(today);
            } else {
                targetDateString = `${currentYear}-${String(currentMonth + 1).padStart(2, '0')}-01`;
            }
        }

        let date = 1;
        let currentRow;

        for (let i = 0; i < 6; i++) {
            currentRow = document.createElement('tr');
            for (let j = 0; j < 7; j++) {
                const cell = document.createElement('td');
                cell.classList.add('p-2', 'align-top', 'calendar-day'); 
                cell.style.height = '120px'; 
                
                if (i === 0 && j < firstDayWeek) {
                    cell.classList.add('bg-light'); 
                } else if (date > lastDate) {
                    cell.classList.add('bg-light'); 
                } else {
                    const day = date;
                    const cellDate = new Date(currentYear, currentMonth, day);
                    const dateString = formatDateString(cellDate); 
                    
                    const dateNumberDiv = document.createElement('div');
                    dateNumberDiv.classList.add('d-flex', 'justify-content-between', 'align-items-center', 'mb-1');
                    
                    const dayStrong = document.createElement('strong');
                    dayStrong.textContent = day;
                    
                    if (j === 0) dayStrong.classList.add('text-danger');
                    else if (j === 6) dayStrong.classList.add('text-primary');
                    else dayStrong.classList.add('text-dark');
                    
                    if (currentYear === today.getFullYear() && currentMonth === today.getMonth() && day === today.getDate()) {
                        dayStrong.style.cssText = 'padding: 2px 7px; background-color: #ffc107; color: white !important; border-radius: 50%; display: inline-block;';
                    }

                    dateNumberDiv.appendChild(dayStrong);
                    cell.appendChild(dateNumberDiv);

                    const eventMarkerContainer = document.createElement('div');
                    eventMarkerContainer.classList.add('small', 'event-markers');
                    eventMarkerContainer.style.cssText = 'max-height: 80px; overflow-y: auto; overflow-x: hidden;';
                    
                    const dayEvents = filteredEvents.filter(e => {
                        return e.startDate <= dateString && e.endDate >= dateString;
                    });
                    
                    dayEvents.forEach(event => {
                        const eventEl = document.createElement('div');
                        const badgeClass = event.type === 'personal' ? 'bg-primary' : 'bg-success'; 
                        
                        eventEl.classList.add('text-truncate', 'badge', badgeClass, 'text-white', 'd-block', 'event-item');
                        eventEl.style.cssText = 'cursor: pointer; margin-bottom: 2px !important; padding: 1px 4px !important;';
                        eventEl.textContent = event.title;
                        eventEl.setAttribute('data-event-id', event.id);
                        eventMarkerContainer.appendChild(eventEl);
                    });
                    
                    cell.appendChild(eventMarkerContainer);
                    cell.setAttribute('data-date', dateString);
                    
                    // 🚨 날짜 클릭 이벤트: selectDate 함수 호출
                    cell.addEventListener('click', () => selectDate(cell));
                    
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

    // --------------------------------------------------------------------------------------------------
    /**
     * 특정 날짜를 선택하고 해당 날짜의 이벤트를 표시합니다. (내용 변경 없음)
     */
    function selectDate(cell) {
        // ... (기존 selectDate 코드 유지) ...
        if (selectedDateElement) {
            selectedDateElement.classList.remove('table-primary');
        }
        
        selectedDateElement = cell;
        cell.classList.add('table-primary');
        
        const selectedDate = cell.getAttribute('data-date'); 
        const [year, month, day] = selectedDate.split('-');
        
        eventListTitle.textContent = `${year}년 ${parseInt(month)}월 ${parseInt(day)}일 일정`;
        
        const filteredEvents = getFilteredEvents();
        const dayEvents = filteredEvents.filter(e => {
            return e.startDate <= selectedDate && e.endDate >= selectedDate;
        }).sort((a, b) => {
            const timeA = a.start || '99:99'; 
            const timeB = b.start || '99:99';
            return timeA.localeCompare(timeB);
        });
        
        eventList.innerHTML = '';
        
        if (dayEvents.length === 0) {
            eventList.innerHTML = '<div class="text-muted small">등록된 일정이 없습니다.</div>';
            
            // 비어있는 날짜를 클릭했고, 초기 로드 상태가 아니라면 모달을 엽니다.
            if (!isInitialLoad) {
                const eventModalElement = document.getElementById('eventModal');
                // 모달이 이미 열려있지 않은 경우에만 openEventModal 호출 (중복 방지)
                if (eventModalElement && !eventModalElement.classList.contains('show')) {
                    openEventModal(null);
                }
            }

        } else {
            dayEvents.forEach(event => {
                
                let timeInfo = (event.start && event.end) ? `${event.start} ~ ${event.end}` : '종일';
                let dateInfo = event.startDate === event.endDate ? '' : ` (${event.startDate.substring(5)} ~ ${event.endDate.substring(5)})`;
                
                const eventItem = document.createElement('a');
                eventItem.href = '#';
                eventItem.classList.add('d-block', 'text-decoration-none', 'text-dark', 'p-2', 'mb-2', 'border', 'rounded', 'shadow-sm', 'event-detail-item');
                
                const badgeClass = event.type === 'personal' ? 'bg-primary' : 'bg-success'; 
                const typeText = event.type === 'personal' ? '내 일정' : '팀 일정';

               eventItem.innerHTML = `
    <strong>${event.title}</strong>
    <span class="badge ${badgeClass} ms-2">${typeText}</span>
    <span class="badge bg-secondary ms-2">${timeInfo}${dateInfo}</span>
    <p class="mb-0 small text-muted">${event.memo || '메모 없음'}</p>
    <div class="small text-secondary mt-1">작성자: ${event.author || '미지정'}</div>
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
    // --------------------------------------------------------------------------------------------------


    /**
     * 달력 초기화 및 이동 기능을 설정합니다.
     * ⭐️ AJAX 로딩 후 렌더링되도록 로직 수정.
     */
    function initCalendar() {
        const today = new Date();
        currentYear = today.getFullYear();
        currentMonth = today.getMonth();
        
        updateCalTitle();
        updateFilterButtons(); 

        // ⭐️ loadEventsFromDB 호출 및 콜백으로 renderCalendar 실행
        loadEventsFromDB(() => {
            renderCalendar();
            
            // 🚨 데이터 로딩과 첫 렌더링 완료 후 isInitialLoad를 false로 설정합니다.
            isInitialLoad = false;
        });

        // -----------------------------------------------------------------

        // 이전 달 버튼
        btnPrev.addEventListener('click', () => {
            currentMonth--;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            }
            updateCalTitle();
            loadEventsFromDB(renderCalendar); // ⭐️ 달 이동 시 데이터 리로드(선택 사항) 및 렌더링
        });

        // 다음 달 버튼
        btnNext.addEventListener('click', () => {
            currentMonth++;
            if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            updateCalTitle();
            loadEventsFromDB(renderCalendar); // ⭐️ 달 이동 시 데이터 리로드(선택 사항) 및 렌더링
        });
        
        // 필터 버튼 이벤트 리스너
        btnFilterAll.addEventListener('click', () => changeFilter('all'));
        btnFilterPersonal.addEventListener('click', () => changeFilter('personal'));
        btnFilterTeam.addEventListener('click', () => changeFilter('team'));
        
        // 폼 제출 (일정 저장)
        eventForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // 💡 전역 openEventModal에서 모달 인스턴스를 얻었으므로, 여기서는 다시 인스턴스를 얻습니다.
            const modalInstance = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
            
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
            
            if (startDate > endDate) {
                alert('종료일은 시작일보다 빠를 수 없습니다.');
                return;
            }

            // ⭐️ AJAX: 일정 등록/수정 요청 (가상 데이터 처리 로직을 대체해야 함)
            const isModify = id !== null;
            const url = isModify ? '/schedule/ScheduleModify' : '/schedule/ScheduleWrite';
            
            const formData = {
                id: id,
                startDate: startDate,
                endDate: endDate,
                title: title,
                start: start,
                end: end,
                memo: memo,
                type: type
                // author는 서버 세션에서 가져와야 합니다.
            };

            $.ajax({
                url: url,
                type: 'POST',
                // data: $(eventForm).serialize(), // form serialize 대신 객체 사용
                data: formData,
                success: function(response) {
                    // response가 성공적인지 확인하는 로직 필요 (예: response.result === "success")
                    alert(isModify ? '일정이 수정되었습니다.' : '일정이 등록되었습니다.');
                    if (modalInstance) {
                        modalInstance.hide(); 
                    }
                    
                    // DB에서 최신 데이터를 다시 불러오고 캘린더를 갱신합니다.
                    loadEventsFromDB(() => {
                        // 저장한 일정이 속한 달로 이동 (선택 사항)
                        const [newYear, newMonth] = startDate.split('-').map(Number);
                        currentYear = newYear;
                        currentMonth = newMonth - 1;
                        
                        updateCalTitle();
                        renderCalendar();
                    });
                },
                error: function(xhr) {
                    alert('일정 저장에 실패했습니다. (서버 통신 오류)');
                    console.error("Save error:", xhr.responseText);
                }
            });
        });
        
        // 삭제 버튼
        btnDelete.addEventListener('click', () => {
            const modalInstance = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
            const id = parseInt(eventIdInput.value);
            
            if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
                // ⭐️ AJAX: 일정 삭제 요청
                $.ajax({
                    url: '/schedule/ScheduleDelete',
                    type: 'POST', // DELETE 대신 POST/PUT 사용 가능
                    data: { id: id },
                    success: function(response) {
                        alert('일정이 삭제되었습니다.');
                        if (modalInstance) {
                            modalInstance.hide(); 
                        }
                        // DB에서 최신 데이터를 다시 불러오고 캘린더를 갱신합니다.
                        loadEventsFromDB(renderCalendar); 
                    },
                    error: function(xhr) {
                        alert('일정 삭제에 실패했습니다. (서버 통신 오류)');
                        console.error("Delete error:", xhr.responseText);
                    }
                });
            }
        });
    }

    // 페이지 로드 시 달력 초기화
    initCalendar();
});