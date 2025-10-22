package mocha.ezen.com.approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mocha.ezen.com.approver.ApproverDTO;
import mocha.ezen.com.schedule.ScheduleDTO;

@Repository
public class ApprovalRepository 
{
	
	@Autowired
	private SqlSession session;
	private static final String namespace = "approval";
	
	//게시물 정보를 등록한다.
	//return true : 등록 성공, false : 등록 실패
	public int Insert(ApprovalDTO dto)
	{
		int insertedRows = session.insert(namespace + ".insert", dto);
		return insertedRows;
	}	
	
	public List<ApprovalDTO> selectdraftList(ApprovalDTO dto) 
	{
		return session.selectList(namespace + ".selectdraft", dto);
	}

	public List<ApprovalDTO> selectapprovalList(ApprovalDTO dto) 
	{
		return session.selectList(namespace + ".selectapproval", dto);
	}
	
	
	//게시물 단건 조회
	public ApprovalDTO Read(String no)
	{
		ApprovalDTO dto = session.selectOne(namespace + ".view",no);
		
	
		return dto;
	}	
	
	//결재선 조회
	public List<ApproverDTO> approverList(String no) 
	{
		
		return null;
	}

	/*
	//게시물 정보를 변경한다.
	//return true : 변경 성공, false : 변경 실패
	public boolean Update(ApprovalDTO dto)
	{
		session.update(namespace + ".update", dto);
		return true;
	}
	*/
	//게시물 정보를 삭제한다.	
	//return true : 삭제 성공, false : 삭제 실패
	public boolean Delete(String no)
	{
		//해당 게시글을 삭제
		session.delete(namespace + ".delete",no);
		return true;
	}

	
	
	



	
	
}
