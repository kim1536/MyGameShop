package model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import dao.CartDao;

@Service
@Scope("session")
public class Cart {
	@Autowired
	private CartDao cartDao;
	private ArrayList<String> codeList = new ArrayList<String>();//상품코드 목록
	private ArrayList<Integer> numList = new ArrayList<Integer>();//상품갯수 목록 
	private String id;//장바구니 주인 계정
	public Cart() {}//생성자
	public Cart(String id) {this.id = id;}//계정을 이용한 생성자
	
	public void deleteAll(String user_id) {
		this.cartDao.deleteAll(user_id);
	}
	
	public void deleteItem(String code, String id) {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				codeList.remove(i); numList.remove(i);
				CartItem item = new CartItem();
				item.setItem_id(code); item.setUser_id(id);
				this.cartDao.deleteCart(item);//DB에서 삭제
				return;//메서드 종료
			}//삭제할 상품번호가 일치하는 경우
		}
	}
	public void modifyItem(String code, int num, String id) {
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				numList.set(i, num);//i번째 상품의 갯수를 변경
				this.updateCart(code, num, id);
				return;//메서드 종료
			}
		}
	}
	
	public List<CartItem> getCart(String id){//해당 계정으로 장바구니 정보 검색
		return this.cartDao.selectCart(id);
	}
	
	public void empty() {
		this.codeList = new ArrayList<String>();
		this.numList = new ArrayList<Integer>();
	}
	
	public void addCart(String code, int num, String id) {
		this.id = id;//계정 저장
		for(int i=0; i < codeList.size(); i++) {
			if(codeList.get(i).equals(code)) {
				numList.set(i, numList.get(i) + num);//갯수만 증가
				updateCart(code, numList.get(i), id);//DB에서 변경
				return;//메서드 종료
			}//이미 장바구니에 담긴 상품인 경우
		}
		codeList.add(code); numList.add(num);
		insertCart(code,num,id);//DB에 삽입
	}//장바구니에 상품 코드와 갯수를 담는 메서드
	private void insertCart(String code, int num, String id) {
		Integer seqno = this.cartDao.getMaxCartId();
		if(seqno == null) seqno = 1;
		else seqno = seqno + 1;
		CartItem item = new CartItem();
		item.setSeqno(seqno); item.setItem_id(code); item.setQuantity(num); item.setUser_id(id);
		this.cartDao.insertCart(item);
		System.out.println("삽입:"+seqno+","+code+","+num+","+id);
	}
	private void updateCart(String code, int num, String id) {
		CartItem item = new CartItem();
		item.setItem_id(code); item.setQuantity(num); item.setUser_id(id);
		this.cartDao.updateCart(item);
	}
	public void setCodeList(int index, String code) {
		this.codeList.add(index, code);//index번째에 code(상품번호)를 저장,세터
	}
	public void setNumList(int index, Integer num) {
		this.numList.add(index, num);//index번째에 num(상품갯수)를 저장,세터
	}
	public ArrayList<String> getCodeList(){return codeList;}//게터 메서드
	public ArrayList<Integer> getNumList(){return numList;}//게터 메서드
	public String getId() {return id;}//게터 메서드
	public void setId(String id) {this.id = id;}//세터 메서드
}


