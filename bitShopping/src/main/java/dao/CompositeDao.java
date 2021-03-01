package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Postcode;
import bean.Product;

@Component("cdao")
public class CompositeDao {
	private final String namespace = "MapperComposite" ;	

	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public CompositeDao() { }


	public List<Product> SelectDataList1(String keyword) { // 메인에서 이름으로 검색
		//System.out.println(keyword);
		Map<String, String> mapk = new HashMap<String, String>() ;
		mapk.put("keyword", "%" + keyword + "%") ;
		//System.out.println(mapk.get(keyword));
		return this.abcd.selectList(namespace + ".SelectDataList1", mapk);
	}
	
	public List<Product> SelectDataList2(String mode1, String mode2) { // 과일 & 채소 목록
		//System.out.println("여기까지는 왔나");
		Map<String, String> map1 = new HashMap<String, String>() ;
		map1.put("mode1", mode1) ;
		map1.put("mode2", mode2) ;
		//System.out.println(mode1);
		//System.out.println(mode2);
		return this.abcd.selectList(namespace + ".SelectDataList2", map1);
	}
	
	public List<Product> SelectDataList3(String mode3, String mode4) { // 베이커리 & 간식 목록
		Map<String, String> map2 = new HashMap<String, String>() ;
		map2.put("mode3", mode3) ;
		map2.put("mode4", mode4) ;
		return this.abcd.selectList(namespace + ".SelectDataList3", map2);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<Postcode> SelectDataZipcode(String dong) {
		//return this.abcd.selectOne(namespace + ".SelectDataByPk", dong);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("dong", "%" + dong + "%");
		return this.abcd.selectList(namespace + ".SelectDataByPk" , map);
		
	}
	
	
}