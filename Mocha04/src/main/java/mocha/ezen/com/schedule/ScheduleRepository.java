package mocha.ezen.com.schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleRepository 
{
	
	@Autowired
	private SqlSession session;
	private static final String namespace = "schedule";
	
	//�Խù� ������ ����Ѵ�.
	//return true : ��� ����, false : ��� ����
	public boolean Insert(ScheduleDTO dto)
	{
		session.insert(namespace + ".insert", dto);
		return true;
	}	
	
	/*
	//�Խù� ������ �����Ѵ�.	
	//return true : ���� ����, false : ���� ����
	public boolean Delete(String no)
	{
		//�ش� �Խñ��� ����
		session.delete(namespace + ".delete",no);
		return true;
	}	
	
	//�Խù� ������ �д´�.	
	//IsHit = true : ��ȸ�� ����, false : ��ȸ�� ���� ����.
	public ScheduleDTO Read(String no,boolean IsHit)
	{
		ScheduleDTO dto = session.selectOne(namespace + ".view",no);
		
		if(IsHit == true)
		{
			session.update(namespace + ".hit",no);
		}
		return dto;
	}	
	
	//�Խù� ������ �����Ѵ�.
	//return true : ���� ����, false : ���� ����
	public boolean Update(ScheduleDTO dto)
	{
		session.update(namespace + ".update", dto);
		return true;
	}
	
	*/
	
	

}
