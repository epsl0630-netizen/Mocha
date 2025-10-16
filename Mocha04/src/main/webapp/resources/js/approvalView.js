    document.addEventListener('DOMContentLoaded', function() {
        const fileInput = document.getElementById('bf-file');
        const fileListContainer = document.getElementById('bf-file-list');
        
        // 💡 핵심: 파일을 저장하고 관리하는 JavaScript 배열
        let currentFilesArray = [];

        // 파일 입력 필드에 'change' 이벤트 리스너 추가
        fileInput.addEventListener('change', function() {
            const newlySelectedFiles = fileInput.files;

            // 새로 선택된 파일을 배열에 추가
            Array.from(newlySelectedFiles).forEach(file => {
                // 💡 중복 파일 추가 방지를 위해 이름과 크기가 같은 파일은 제외할 수 있지만, 
                //    여기서는 단순화를 위해 바로 추가합니다.
                currentFilesArray.push(file);
            });
            
            // 파일 입력 필드의 files를 갱신
            updateFileInputFiles();

            // UI를 갱신된 파일 목록으로 렌더링
            renderFileList(currentFilesArray);
            
            // 연속적인 추가를 위해 실제 file input 필드의 value를 비움
            fileInput.value = '';
        });

        // 파일 목록(배열)을 기반으로 fileInput.files를 갱신하는 함수
        function updateFileInputFiles() {
            // DataTransfer 객체를 생성하여 배열의 파일들을 추가
            const dataTransfer = new DataTransfer();
            currentFilesArray.forEach(file => {
                dataTransfer.items.add(file);
            });
            
            // fileInput.files 속성을 새로운 FileList로 갱신
            fileInput.files = dataTransfer.files;
        }

        // 파일 목록을 UI에 렌더링하는 함수
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
                
                // 삭제 버튼 클릭 시 deleteFile 함수 호출
                deleteButton.addEventListener('click', () => {
                    deleteFile(index);
                });

                fileItem.appendChild(fileNameSpan);
                fileItem.appendChild(deleteButton);
                fileListContainer.appendChild(fileItem);
            });
        }

        // 특정 인덱스의 파일을 삭제하는 함수
        function deleteFile(indexToDelete) {
            // 💡 핵심: currentFilesArray에서 해당 인덱스의 파일만 제거
            currentFilesArray.splice(indexToDelete, 1);
            
            // 1. fileInput.files 갱신
            updateFileInputFiles();
            
            // 2. UI를 새로고침
            renderFileList(currentFilesArray); 
        }
        
        // 페이지 로드 시 초기 렌더링
        renderFileList(currentFilesArray); 
    });