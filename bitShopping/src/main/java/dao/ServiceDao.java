package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Serivce;


@Component("sdao")
public class ServiceDao extends SuperDao{
	private final String namespace = "MapService" ;	
	
	@Autowired
	SqlSessionTemplate abcd;

	public List<Serivce> SelectServicelist(String writer) {
		
		return this.abcd.selectList(namespace+".SelectService", writer);
	}

	public int InsertService(Serivce bean) {
		
		
		return this.abcd.insert(namespace+".InsertData",bean);
	}
	

}
