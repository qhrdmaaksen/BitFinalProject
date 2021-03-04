package dao;

import java.util.List;

import bean.Productreviews;

public interface BoardDao {
	
	//게시물 조회 
	public Productreviews view(int bno) throws Exception;
	
	
	//게시물 총 개수 
	
	public int count () throws Exception;


	public List<Productreviews> list();



}
