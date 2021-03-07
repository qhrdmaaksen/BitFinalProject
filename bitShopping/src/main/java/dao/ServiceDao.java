package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Service;


@Component("sdao")
public class ServiceDao extends SuperDao{
	private final String namespace = "MapService" ;	
	
	@Autowired
	SqlSessionTemplate abcd;

	public List<Service> SelectServicelist(String writer) {
		
		return this.abcd.selectList(namespace+".SelectService", writer);
	}

	public int InsertService(Service bean) {
		
		return this.abcd.insert(namespace+".InsertData",bean);
	}
	

}
