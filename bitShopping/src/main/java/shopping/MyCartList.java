package shopping;

import java.util.HashMap;
import java.util.Map;

//나의 카트를 관리해주는 클래스(카트 관리자)
public class MyCartList {
	//orderlist: 카트에 담은 정보를 저장하고 있는 맵 컬랙션 
	//key는 상품 번호(기본 키), value는 구매 수량 
	
	private Map<Integer, Integer> orderlists = null;
	
	public MyCartList() {
		this.orderlists= new HashMap<Integer, Integer>();
	}
	
	//장바 구니 내역을 결제한 내역만 삭제한다. 
	//이 부분은 주로 결제가 이루어질 때만 사용 된다.
	public void RemoveProductInfo() {
		this.orderlists.clear();
	}

	public Map<Integer, Integer> GetAllOrderLists() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	// 장바구니 내역 정보 반환, 수정, 추가, 삭제 ///////////////////////////
	// 요기는 연경씨 파트 맞죠 ? ㅎㅎ 화이팅 ! 
	

}
