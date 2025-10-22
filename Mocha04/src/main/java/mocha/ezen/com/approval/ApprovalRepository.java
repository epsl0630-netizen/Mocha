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
	
	//�Խù� ������ ����Ѵ�.
	//return true : ��� ����, false : ��� ����
	public int Insert(ApprovalDTO dto)
	{
		int insertedRows = session.insert(namespace + ".insert", dto);
		return insertedRows;
	}	
	
	public int Insert(ApproverDTO dto)
	{
		int insertedRows = session.insert(namespace + ".approverinsert", dto);
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
	
	
	//�Խù� �ܰ� ��ȸ
	public ApprovalDTO Read(String no)
	{
		ApprovalDTO dto = session.selectOne(namespace + ".view",no);
		
		return dto;
	}	
	

	public ApprovalDTO raftRead(String no) 
	{
		ApprovalDTO dto = session.selectOne(namespace + ".view",no);
		return dto;
	}

	
	//���缱 ��ȸ
	public List<ApproverDTO> approverList(ApproverDTO dto) 
	{
		return session.selectList(namespace + ".approver", dto);
	}

	/*
	//�Խù� ������ �����Ѵ�.
	//return true : ���� ����, false : ���� ����
	public boolean Update(ApprovalDTO dto)
	{
		session.update(namespace + ".update", dto);
		return true;
	}
	*/
	//�Խù� ������ �����Ѵ�.	
	//return true : ���� ����, false : ���� ����
	public boolean Delete(String no)
	{
		//�ش� �Խñ��� ����
		session.delete(namespace + ".delete",no);
		return true;
	}

	public ApprovalDTO draftRead(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ApproverDTO> approverviewList(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	



	
	
}
