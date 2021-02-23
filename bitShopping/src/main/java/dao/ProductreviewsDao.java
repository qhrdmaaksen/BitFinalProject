package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Productreviews;

@Component("prrdao")
public class ProductreviewsDao {
	private final String namespace = "MapProductreivews.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public ProductreviewsDao() {}

	public int InsertData(Productreviews bean) {
		//넘겨진 Bean 데이터를 이용하여 추가한다.
		System.out.println(this.getClass() + " : 게시물을 등록합니다." ); 
		System.out.println(bean.toString());
		return this.abcd.insert(namespace + "InsertData", bean);
	}

	public int SelectTotalCount(String mode, String keyword) {
		// 
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%");
		return this.abcd.selectOne(namespace + "SelectTotalCount" , map);
	}

	public List<Productreviews> SelectDataList(int offset, int limit, String mode, String keyword) {
		// 랭킹을 이용하여 해당 페이지의 데이터를 컬랙션으로 반환한다. 
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%");
		return this.abcd.selectList(namespace + "SelectDataList" , map, rowBounds);
	}
	
	public int UpdateReadhit(int bno) {
		//조회수 증가 
		return this.abcd.update(namespace + "UpdateReadhit", bno);
		
	}
	

}
