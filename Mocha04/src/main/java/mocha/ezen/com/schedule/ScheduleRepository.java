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
	
	//�Խù� ������ ����Ѵ�.
	//return true : ��� ����, false : ��� ����
	public boolean Insert(ScheduleDTO dto)
	{
		session.insert(namespace + ".insert", dto);
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
	
	// ���� �Խù� ������ �д´�.	

	public ScheduleDTO Read(String no)
	{
		return  session.selectOne(namespace + ".view",no);	
	}	
	
	// ������ ���
	public List<ScheduleDTO> selectAllEvents(ScheduleDTO dto) 
	{
		return session.selectList(namespace + ".selectAllEvents", dto);
	}
	
	
	
	//�Խù� ������ �����Ѵ�.
	//return true : ���� ����, false : ���� ����
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
