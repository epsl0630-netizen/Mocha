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
	
	//�Խù� ������ ����Ѵ�.
	//return true : ��� ����, false : ��� ����
	public boolean Insert(ApprovalDTO dto)
	{
		session.insert(namespace + ".insert", dto);
		return true;
	}	
	
	//�Խù� ������ �д´�.	
	//IsHit = true : ��ȸ�� ����, false : ��ȸ�� ���� ����.
	public ApprovalDTO Read(String no,boolean IsHit)
	{
		ApprovalDTO dto = session.selectOne(namespace + ".view",no);
		
		if(IsHit == true)
		{
			session.update(namespace + ".hit",no);
		}
		return dto;
	}	
	
	//�Խù� ������ �����Ѵ�.
	//return true : ���� ����, false : ���� ����
	public boolean Update(ApprovalDTO dto)
	{
		session.update(namespace + ".update", dto);
		return true;
	}
	
	//�Խù� ������ �����Ѵ�.	
	//return true : ���� ����, false : ���� ����
	public boolean Delete(String no)
	{
		//�ش� �Խñ��� ����
		session.delete(namespace + ".delete",no);
		return true;
	}	
		
	
	
}
