document.addEventListener('DOMContentLoaded', function() {
        
        // =======================================================
        // 1. 테이블 목록 전체 선택/해제 로직 (기존 로직 유지)
        // =======================================================
        const selectAllCheckbox = document.getElementById('selectAll');
        const documentCheckboxes = document.querySelectorAll('input[name="selectDoc"]');

        selectAllCheckbox.addEventListener('change', function() {
            const isChecked = this.checked;
            documentCheckboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
            });
        });

        documentCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const allChecked = Array.from(documentCheckboxes).every(cb => cb.checked);
                selectAllCheckbox.checked = allChecked;
            });
        });

        // =======================================================
        // 2. 문서 구분 전체 선택/해제 로직 (선택자 수정)
        // =======================================================
        const docAll = document.getElementById('doc-all');
        // 'doc-all'을 포함하는 부모 요소(col-md-10) 내부의 다른 모든 체크박스를 찾습니다.
        // ID가 'doc-all'인 체크박스 자신은 제외합니다.
        const docItemsContainer = document.querySelector('label[for="doc-all"]').closest('.row.mb-3').querySelector('.col-md-10');
        const docItems = docItemsContainer ? docItemsContainer.querySelectorAll('input[type="checkbox"]:not(#doc-all)') : [];

        docAll.addEventListener('change', function() {
            const isChecked = this.checked;
            docItems.forEach(item => {
                item.checked = isChecked;
            });
        });
        
        docItems.forEach(item => {
            item.addEventListener('change', function() {
                const allChecked = Array.from(docItems).every(cb => cb.checked);
                docAll.checked = allChecked;
            });
        });

        // =======================================================
        // 3. 결재 상태 전체 선택/해제 로직 (선택자 수정)
        // =======================================================
        const statusAll = document.getElementById('status-all');
        // 'status-all'을 포함하는 부모 요소(col-md-10) 내부의 다른 모든 체크박스를 찾습니다.
        const statusItemsContainer = document.querySelector('label[for="status-all"]').closest('.row.mb-3').querySelector('.col-md-10');
        const statusItems = statusItemsContainer ? statusItemsContainer.querySelectorAll('input[type="checkbox"]:not(#status-all)') : [];
        
        statusAll.addEventListener('change', function() {
            const isChecked = this.checked;
            statusItems.forEach(item => {
                item.checked = isChecked;
            });
        });

        statusItems.forEach(item => {
            item.addEventListener('change', function() {
                const allChecked = Array.from(statusItems).every(cb => cb.checked);
                statusAll.checked = allChecked;
            });
        });
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        // ... (위의 JavaScript 전체 선택/해제 로직) ...
    });