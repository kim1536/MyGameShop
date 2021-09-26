package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.QnaDao;
import model.Condition;
import model.Qna;

@Service
public class QnaCatalogImpl implements QnaCatalog {
	@Autowired
	private QnaDao qnaDao;
	public List<Qna> findAll(Condition cond) {
		return this.qnaDao.findAll(cond);
	}
	public Integer getQnaCount() {
		return this.qnaDao.getQnaCount();
	}
	public Integer selectRownum(Integer seqno) {
		return this.qnaDao.selectRownum(seqno);
	}
	public void insertQna(Qna qna) {
		this.qnaDao.insertQna(qna);
	}
	public void updateQna(Qna qna) {
		this.qnaDao.updateQna(qna);
	}
	public void deleteQna(Qna qna) {
		this.qnaDao.deleteQna(qna);
	}
	public Qna getQna(Integer seqno) {
		return this.qnaDao.getQna(seqno);
	}
	public Integer getMaxSeqno() {
		return this.qnaDao.getMaxSeqno();
	}
	public Integer selectMaxGroupId() {
		return this.qnaDao.selectMaxGroupId();
	}
	public void updateOrderNo(Qna qna) {
		this.qnaDao.updateOrderNo(qna);
	}

}
