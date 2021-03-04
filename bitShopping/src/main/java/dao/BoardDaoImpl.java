package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bean.Productreviews;

@Repository
public class BoardDaoImpl implements BoardDao{
	private static String namespace = "com.board.mappers.board";

	@Autowired
	SqlSessionTemplate abcd;
	
	//게시물 조회 
	public Productreviews view(int bno) throws Exception {
		return abcd.selectOne(namespace + ".view", bno);
	}

	//게시물 총 개수 
	public int count() throws Exception {
		return abcd.selectOne(namespace + ".count");
	}

	@Override
	public List<Productreviews> list() {
		// TODO Auto-generated method stub
		return null;
	}

}
