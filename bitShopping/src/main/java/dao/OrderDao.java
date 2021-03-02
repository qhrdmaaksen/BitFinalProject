package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import bean.ShoppingInfo;

@Component("odao")
public class OrderDao extends SuperDao{
	
	private final String namespace = "MapOrder.";
	
	SqlSessionTemplate abcd ; 
	
	public List<ShoppingInfo> SelectDataList(ShoppingInfo loginfo) {
		// TODO Auto-generated method stub
		return this.abcd.selectList(namespace + "SelectDataList", loginfo);
	}

}
