package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NoticeDao;
import model.Condition;
import model.Notice;

@Service
public class NoticeCatalogImpl implements NoticeCatalog {
	

	@Autowired
	private NoticeDao noticeDao;
	
	public List<Notice> getNoticeList(Condition cond) {
		return this.noticeDao.findAll(cond);
	}

	public Integer getNoticeCount() {
		return this.noticeDao.getNoticeCount();
	}

	public Notice getNoticeDetail(Integer seqno) {
		return this.noticeDao.getNoticeDetail(seqno);
	}

	public void putNotice(Notice notice) {
		this.noticeDao.putNotice(notice);
		
	}
	public Integer getMaxSeqno() {
		return this.noticeDao.getMaxSeqno();
	}

	public void deleteNotice(Notice notice) {
		this.noticeDao.deleteNotice(notice);
		
	}

	public void updateNotice(Notice notice) {
		this.noticeDao.updateNotice(notice);
		
	}

	
	

}
