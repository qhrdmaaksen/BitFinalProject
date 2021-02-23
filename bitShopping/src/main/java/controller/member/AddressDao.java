package controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Address;
import dao.SuperDao;

@Component("adao")
public class AddressDao extends SuperDao{
	
	private final String namespace = "MapAddress" ; 
	
	@Autowired
	SqlSessionTemplate abcd ; 
	
	public AddressDao() {	}
	

	public List<Address> SelectDataList(String name, String address1, String address2, String phone) {
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("name", name) ;
		map.put("address1", address1) ;
		map.put("address2", address2) ;
		map.put("phone", phone) ;
		
		return this.abcd.selectList(namespace + ".SelectDataList",  map);
	}
	
}
