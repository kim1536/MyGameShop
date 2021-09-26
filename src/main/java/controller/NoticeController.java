package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.NoticeCatalog;
import model.Admin;
import model.Condition;
import model.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeCatalog noticeCatalog;
	
	@RequestMapping(value="notice/updateDo.html")
	public ModelAndView updateDo(Notice notice, HttpSession session) {
		Notice before = this.noticeCatalog.getNoticeDetail(notice.getSeqno());
		ModelAndView mav = new ModelAndView("redirect:/notice/notice.html");
		MultipartFile multiFile = notice.getImage();
		String fileName = multiFile.getOriginalFilename();
		String zero = "";
		if(fileName == null || fileName.equals("")) {
			if(before.getImage_url() != null) {
				notice.setImage_url(before.getImage_url());
			}else {
				notice.setImage_url(zero);
			}
			this.noticeCatalog.updateNotice(notice);
		}else {
			String path=null; OutputStream os=null; 
			ServletContext ctx = session.getServletContext();
			path = ctx.getRealPath("/upload/"+fileName);
			try {
				os = new FileOutputStream(path);
				BufferedInputStream bis = new BufferedInputStream(
					multiFile.getInputStream());
				byte[] buffer = new byte[8192]; int read = 0;
				while( (read = bis.read(buffer)) > 0) {
					os.write(buffer, 0, read);
				}
				}catch(Exception e) {}
				notice.setImage_url(fileName);
			}
			this.noticeCatalog.updateNotice(notice);
		return mav;
	}
	@RequestMapping(value="/notice/update.html")
	public ModelAndView updateNotice(Integer seqno) {
		ModelAndView mav = new ModelAndView("notice/notice_update");
		Notice before = this.noticeCatalog.getNoticeDetail(seqno);//글번호로 게시글 검색
		mav.addObject(before);//객체 주입
		return mav;
	}
	@RequestMapping(value="/notice/deleteDo.html")
	public ModelAndView deleteDo(Notice notice) {
		ModelAndView mav = new ModelAndView("redirect:/notice/notice.html");
		this.noticeCatalog.deleteNotice(notice);	
		return mav;
	}
	
	@RequestMapping(value="/notice/delete.html")
	public ModelAndView deleteNotice(Integer seqno) {
		ModelAndView mav = new ModelAndView("notice/notice_delete");
		Notice detail = this.noticeCatalog.getNoticeDetail(seqno);
		mav.addObject(detail);
		return mav;
	}

	@RequestMapping(value="/notice/notice_reg.html")
	public ModelAndView writeForm(@Valid Notice notice, BindingResult br,
			HttpSession session) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("notice/notice_write");
			mav.getModel().putAll(br.getModel());
			System.out.println(br.getErrorCount());
			return mav;
		}
		MultipartFile multiFile = notice.getImage();
		String fileName=null; String path=null; OutputStream os=null;
		if(multiFile != null) {
			fileName = multiFile.getOriginalFilename();
			ServletContext ctx = session.getServletContext();
			path = ctx.getRealPath("/upload/"+fileName);
			System.out.println("업로드 경로:"+path);
			try {
				os = new FileOutputStream(path);
				BufferedInputStream bis = new BufferedInputStream(
						multiFile.getInputStream());
				byte[] buffer = new byte[8156];
				int read = 0;
				while( (read = bis.read(buffer)) > 0) {
					os.write(buffer,0,read);
				}
			}catch(Exception e) {
			}
			notice.setImage_url(fileName);
		}
		
		String admin_id=(String)session.getAttribute("ADMINID");
			notice.setAdmin_id(admin_id);
		
		System.out.println(admin_id);
		
			
		Integer seqno = noticeCatalog.getMaxSeqno();
		if(seqno == null) seqno = 0;
		notice.setSeqno(seqno + 1);
		
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int date = today.get(Calendar.DATE);
		String noticeDate = year + "/";
		if(month < 10) noticeDate = noticeDate + "0" + month+"/";
		else noticeDate = noticeDate + month + "/";
		if(date < 10) noticeDate = noticeDate + "0" + date;
		else noticeDate = noticeDate + date;
		notice.setNotice_date(noticeDate);
		
		this.noticeCatalog.putNotice(notice);
		ModelAndView mav = new ModelAndView("redirect:/notice/notice.html");
		return mav;
	}
	
	@RequestMapping(value="notice/notice_write.html")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView("notice/notice_write");
		mav.addObject(new Notice());
		return mav;
	}
	@RequestMapping(value="/notice/notice_read.html")
	public ModelAndView noticeRead(Integer SEQNO) {
		ModelAndView mav = new ModelAndView("notice/notice_read");
		Notice notice = this.noticeCatalog.getNoticeDetail(SEQNO);
		mav.addObject("NOTICE",notice);
		return mav;
	}
	
	@RequestMapping(value="/notice/notice.html")
	public ModelAndView NoticeList(Integer pageNo){
		ModelAndView mav = new ModelAndView("notice/notice");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = (currentPage * 10);
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Notice> noticeList = noticeCatalog.getNoticeList(cond);
		mav.addObject("NOTICELIST",noticeList);
		Integer totalCount = noticeCatalog.getNoticeCount();
		int pageCount = totalCount / 10;
		if(totalCount % 10 > 0) pageCount++;
		mav.addObject("pageCount",pageCount);
		return mav;
	}
	
	@RequestMapping(value="/notice/home_notice.html")
	public ModelAndView HomeNotice(Integer pageNo) {
		ModelAndView mav = new ModelAndView("notice/home_notice");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = (currentPage - 1) * 4 + 1;
		int endRow = (currentPage * 4);
		Condition cond = new Condition();
		cond.setStartRow(startRow); cond.setEndRow(endRow);
		List<Notice> noticeList = noticeCatalog.getNoticeList(cond);
		mav.addObject("NOTICELIST",noticeList);
		Integer totalCount = noticeCatalog.getNoticeCount();
		int pageCount = totalCount / 4;
		if(totalCount % 4 > 0) pageCount++;
		mav.addObject("pageCount",pageCount);
		System.out.println(noticeList.size());
		return mav;
	}
}
