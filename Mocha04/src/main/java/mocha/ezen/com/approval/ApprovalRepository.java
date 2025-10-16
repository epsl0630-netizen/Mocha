package mocha.ezen.com.approval;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mocha.ezen.com.schedule.ScheduleDTO;

@Repository
public class ApprovalRepository 
{
	@Autowired
	private SqlSession session;
	private static final String namespace = "mocha";
	
	//게시물 정보를 등록한다.
	//return true : 등록 성공, false : 등록 실패
	public boolean Insert(ApprovalDTO dto)
	{
		session.insert(namespace + ".insert", dto);
		return true;
	}	
	
	//게시물 정보를 읽는다.	
	//IsHit = true : 조회수 증가, false : 조회수 증가 안함.
	public ApprovalDTO Read(String no,boolean IsHit)
	{
		ApprovalDTO dto = session.selectOne(namespace + ".view",no);
		
		if(IsHit == true)
		{
			session.update(namespace + ".hit",no);
		}
		return dto;
	}	
	
	//게시물 정보를 변경한다.
	//return true : 변경 성공, false : 변경 실패
	public boolean Update(ApprovalDTO dto)
	{
		session.update(namespace + ".update", dto);
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
		
	
	
}
