package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Qna;
@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession session;
	
	public List<Qna> findAll(Condition cond) {
		return session.selectList("mapper.qnaMapper.getQnaList", cond);
	}

	public Integer getQnaCount() {
		return session.selectOne("mapper.qnaMapper.getQnaCount");
	}
	public Integer selectRownum(Integer seqno) {
		return session.selectOne("mapper.qnaMapper.selectRownumBySeqno",seqno);
	}

	public void insertQna(Qna qna) {
		session.insert("mapper.qnaMapper.putQna",qna);
		
	}

	public void updateQna(Qna qna) {
		session.update("mapper.qnaMapper.updateQna",qna);
	}

	public void deleteQna(Qna qna) {
		session.delete("mapper.qnaMapper.deleteQna",qna);
		
	}

	public Qna getQna(Integer seqno) {
		return session.selectOne("mapper.qnaMapper.getQna",seqno);
	}

	public Integer getMaxSeqno() {
		return session.selectOne("mapper.qnaMapper.getMaxSeqno");
	}

	public Integer selectMaxGroupId() {
		return session.selectOne("mapper.qnaMapper.getMaxGroupId");
	}

	public void updateOrderNo(Qna qna) {
		session.update("mapper.qnaMapper.updateOrderNo",qna);
		
	}

}
