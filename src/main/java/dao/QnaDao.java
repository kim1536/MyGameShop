package dao;

import java.util.List;

import model.Condition;
import model.Qna;

public interface QnaDao {
	List<Qna> findAll(Condition cond);
	Integer getQnaCount();
	
	Integer selectRownum(Integer seqno);//글번호로 일련번호 검색
	void insertQna(Qna qna);//이미지 게시글 삽입
	void updateQna(Qna qna);//이미지 게시글 수정
	void deleteQna(Qna qna);//이미지 게시글 삭제
	Qna getQna(Integer seqno);//글번호로 게시글 검색
	Integer getMaxSeqno();//가장 큰 게시글번호 검색
	Integer selectMaxGroupId();//가장 큰 그룹번호 검색
	void updateOrderNo(Qna qna);//순서번호 변경(답글 시)
}

