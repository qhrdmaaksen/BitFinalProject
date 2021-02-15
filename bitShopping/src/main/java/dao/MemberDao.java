package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.CheckBean;
import bean.Member;


@Component("mdao")
public class MemberDao {

	private final String namespace = "MapMember" ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public MemberDao() {	}
	
	
	
	
	public int InsertData(Member member) {
		return this.abcd.insert(namespace + ".InsertData", member);
	}

	public List<CheckBean> GetList(String module, String field, String kind) {		
		// 체크 박스, 라디오 버튼, 콤보 박스의 내용들을 가져옵니다.
		System.out.println(module);
		System.out.println(field);
		System.out.println(kind);
		
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("module", module) ;
		map.put("field", field) ;
		map.put("kind", kind) ;
		return this.abcd.selectList(namespace + ".GetList", map);	
	}




	public Member SelectDataByPk(String id) {
		return this.abcd.selectOne(namespace + ".SelectDataByPk", id);
	}

	public List<Member> SelectDataList(int offset, int limit, String mode, String keyword) {
		// 랭킹을 이용하여 해당 페이지의 데이터를 컬렉션으로 반환 해 줍니다.
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%"); // 키워드를 포함하는
		
		
		return this.abcd.selectList(namespace + ".SelectDataList", map, rowBounds);
	}


	public int SelectTotalCount(String mode, String keyword) {
		// 파라미터 mode와 keyword를 이용하여 총 회원 수를 구합니다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%"); // 키워드를 포함하는
		
		
		return this.abcd.selectOne(namespace + ".SelectTotalCount" , map);
	}

}
