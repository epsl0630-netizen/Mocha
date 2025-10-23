package mocha.ezen.com.schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mocha.ezen.com.common.dto.ScheduleSearchDTO;

@Repository
public class ScheduleRepository 
{
	
	@Autowired
	private SqlSession session;
	private static final String namespace = "schedule";
	
	//게시물 정보를 등록한다.
	//return true : 등록 성공, false : 등록 실패
	public boolean Insert(ScheduleDTO dto)
	{
		session.insert(namespace + ".insert", dto);
		return true;
	}	
	
	
	//게시물 정보를 삭제한다.	
	//return true : 삭제 성공, false : 삭제 실패
	public boolean Delete(String no)
	{
		//해당 게시글을 삭제
		session.delete(namespace + ".delete",no);
		return true;
	}	
	
	// 단일 게시물 정보를 읽는다.	

	public ScheduleDTO Read(String no)
	{
		return  session.selectOne(namespace + ".view",no);	
	}	
	
	// 데이터 목록
	public List<ScheduleDTO> selectAllEvents(ScheduleDTO dto) 
	{
		return session.selectList(namespace + ".selectAllEvents", dto);
	}
	
	
	
	//게시물 정보를 변경한다.
	//return true : 변경 성공, false : 변경 실패
	public boolean Update(ScheduleDTO dto)
	{
		session.update(namespace + ".update", dto);
		return true;
	}


	public List<ScheduleDTO> selectAdminAllEvents(ScheduleSearchDTO searchdto) {
		List<ScheduleDTO> scheduleList = session.selectList(namespace + ".selectAdminAllEvents", searchdto);
		
		return scheduleList;
	}



	
	

}
