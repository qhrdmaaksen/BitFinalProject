package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import bean.Productreviews;

public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	//게시물 조회 
	@Override
	public Productreviews view(int bno) throws Exception {
		
		return dao.view(bno);
	}

	//게시물 카운트 
	@Override
	public int count() throws Exception {
		
		return dao.count();
	}

	@Override
	public List<Productreviews> list() {
		// TODO Auto-generated method stub
		return null;
	}



}
