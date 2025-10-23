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

        
       
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        // ... (위의 JavaScript 전체 선택/해제 로직) ...
    });
    

$(document).ready(function() {
	ShowSchedule();
});   
function ShowSchedule() {
	var data = {};
	$("#scheduleSearchFrm").serializeArray().map(function(x){data[x.name] = x.value;}); 
	
	console.log(data);
	
	//let scheduleData = $("#scheduleSearchFrm").serialize()
	try{
		$.ajax({
		url:'adminScheduleListShow',
		data:JSON.stringify(data),
    	contentType: 'application/json; charset=utf-8',
		type:"post",
		success: function(data){
			let html = ""
			/*
			html = "<tr>";
			html = "<td class="text-center"><input class="form-check-input" type="checkbox" name="selectDoc"></td>";
			html = "<th scope="row">${status.count}</th>";
			html = "<td></td>";
			html = "<td></td>";
			html = "</tr>";
			*/
			$("#adminScheduleList").html(data);
		},
		error: function(a,b,c) {
			alert("데이터 전송 실패");
			console.log(a,b,c);
		}		
	});
	}catch(e){
		console.log(e);
	}
	
	return false;
  
}