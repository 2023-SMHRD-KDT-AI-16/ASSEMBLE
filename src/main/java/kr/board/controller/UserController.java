package kr.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.entity.Plant;
import kr.board.entity.User;
import kr.board.mapper.UserMapper;

@Controller
public class UserController {

	@Autowired
	private UserMapper userMapper;

	// 회원프로필사진 등록 /imageUpdate.do
//	@PostMapping("/imageUpdate.do")
//	public String imageUpdate(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
//		// 파일업로드 API (cos.jar) -> MultipartRequest객체
//		MultipartRequest multi = null;
//
//		// MultipartRequest객체 생성하기위해서는 매개변수가 필요
//		// 1.요청객체 (request)
//		// 2.이미지를 저장할 폴더의 경로
//		// 3.허용가능한 크기
//		// 4.파일이름에 대한 인코딩
//		// 5.파일명 중복 제거
//
//		// upload폴더 우클릭 -> properties 경로보기
//		// request.getRealPath() -> 하위호완성을 위해 삭제하지는 않았지만 사용하지 않는 걸 권장
//		String savePath = request.getRealPath("resources/upload"); // 현재위치, context위치
////		String savePath = request.getSession().getServletContext().getRealPath("resources/upload"); // 현재위치, context위치
//		System.out.println("savePath1 : " + savePath);
//		int maxSize = 1024 * 1024 * 100; // 100MB 10MB로도 해보기
//		String encoding = "UTF-8";
//		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
//
//		// 2
//		// 기존 가지고 있는 해당 프로필 이미지 삭제
//		// multi객체 생성 전에 삭제 -> 객체 생성하자마자 저장하기 때문
//		// 그러기 위해선 사용자의 memID를 가져온 후 DB에서 그 memID에 해당하는 memProfile 이름을 가져와야함
//		// but, request.getParameter를 사용해서 가져올 수 없음
//		String memID = ((User) session.getAttribute("mvo")).getUser_id();
//		String oldImg = memberMapper.getMember(memID).getMemProfile();
//		File oldFile = new File(savePath + "/" + oldImg); // 기존에 내가 저장해놓은 사진을 파일객체로 가져오기
//		// 존재할 때만 파일 삭제
//		if (oldFile.exists()) {
//			oldFile.delete();
//		}
//
//		// 1
//		try {
//			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
//
//		} catch (IOException e) {
//			// 에러날 경우는 파일크기
//			rttr.addFlashAttribute("msgType", "실패 메세지");
//			rttr.addFlashAttribute("msg", "경로를 찾을 수 없습니다.");
//			return "redirect:/imageForm.do";
//		};
//
//		// 3
//		// img 파일인지 아닌지 판별하기
//		// 내가 보낸 파일을 가져옴
//		File file = multi.getFile("memProfile");
//
//		System.out.println(file.getName());
//		
//		if (file != null) { 
//			// 여기 안에 왔다는 것은 파일을 올린경우
//			//확장자 가져오기
//			// System.out.println(file.getName());               마지막에 존재하는 문자
//			String ext = file.getName().substring(file.getName().lastIndexOf(".") + 1);
//			// 대문자로 통일
//			ext = ext.toUpperCase(); // toLowerCase() -> 소문자로 변환
//			
//			boolean extResult = ext.equals("JPG") || ext.equals("PNG") || ext.equals("GIF");
//			if(!extResult) {
//				// 이미지파일이 아닐때
//				if(file.exists()) {
//					// MultipartRequest객체가 생성되는 순간 무조건 저장
//					file.delete();
//					rttr.addFlashAttribute("msgType","실패 메세지");
//					rttr.addFlashAttribute("msg","이미지 파일만 가능합니다(PNG, JPG, GIF)");
//					return "redirect:/imageForm.do";
//				}
//			}
//		}
//		// 여기까지는 서버에 사진을 등록까지만 한것 지금부터 DB에 저장
//		
//		// 새로운 이미지를 테이블에 저장
//		String newProfile = multi.getFilesystemName("memProfile");
//		// Mapper에 넣기 위한 객체 생성 -> memID, newProfile
//		Member vo = new Member();
//		// memID, 와 memProfile 두개를 받는 생성자를 만들지 않았기 때문에 기본생성자를 사용해서 설정해주기
//		vo.setMemProfile(newProfile);
//		vo.setMemID(memID);
//		memberMapper.profileUpdate(vo); // 이미지 새롭게 업데이트
//		
//		// DB에서 수정된 회원의 정보를 다시 불러와서 session에 저장
//		Member mvo = memberMapper.getMember(memID);
//		
//		session.setAttribute("mvo", mvo);
//		
//		rttr.addFlashAttribute("msgType","성공 메세지");
//		rttr.addFlashAttribute("msg","이미지 변경이 성공했습니다.");
//		return "redirect:/";
//		
//		}
//
//
//	// 회원프로필등록페이지 이동 /imageForm.do
//	@GetMapping("/imageForm.do")
//	public String imageForm() {
//		return "member/imageForm";
//	}
//
//	// 회원정보수정기능 /update.do
//	
//	// 회원수정할 정보를 입력받아 아이디가 일치하는 회원의
//	// 비밀번호, 이름, 나이, 성별, 이메일 수정하기
//	
//	// 조건
//	// 1. 하나라도 누락된 데이터가 있다면 회원정보수정 페이지로 이동 후 
//	//	 "모든 내용을 입력해주세요." 모달창 띄우기
//	// 2. 회원정보수정이 실패했다면 회원정보수정 페이지로 이동 후
//	// 	 "회원정보수정이 실패했습니다." 모달창 띄우기
//	// 3. 회원정보수정 성공 시 수정된 회원의 정보를 세션에 다시 저장 후 메인페이지로 이동
//	// 	 "회원정보수정을 성공했습니다." 모달창 띄우기
//	@PostMapping("/update.do")
//	public String update(Member m, RedirectAttributes rttr, HttpSession session) {
//
//		if (m.getMemID() == null || m.getMemID().equals("") || m.getMemPassword() == null
//				|| m.getMemPassword().equals("") || m.getMemName() == null || m.getMemName().equals("")
//				|| m.getMemAge() == 0 || m.getMemEmail() == null || m.getMemEmail().equals("")) {
//			// 누락된 데이터가 존재하는 부분
//
//			rttr.addFlashAttribute("msgType", "실패 메세지");
//			rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
//			return "redirect:/updateForm.do";
//		} else {
//			// 프로필 파일 이름 빈문자열로 바꿔주기 -> session에 들어갈 때 null로 들어가기 싫어!
//			m.setMemProfile("");
//
//			int cnt = memberMapper.update(m);
//
//			if (cnt == 1) {
//				rttr.addFlashAttribute("msgType", "성공 메세지");
//				rttr.addFlashAttribute("msg", "회원정보 수정에 성공했습니다.");
//				session.setAttribute("mvo", m);
//				return "redirect:/";
//			} else {
//				rttr.addFlashAttribute("msgType", "실패 메세지");
//				rttr.addFlashAttribute("msg", "회원정보 수정에 실패했습니다.");
//				return "redirect:/updateForm.do";
//			}
//		}
//	}
//
//	// 회원정보수정 페이지 이동 /updateForm.do
//	@GetMapping("/updateForm.do")
//	public String updateForm() {
//		return "member/updateForm";
//	}

	// 로그인 기능 /login.do
	@PostMapping("/login.do")
	public String login(User m, RedirectAttributes rttr, HttpSession session) {
		System.out.println("여기 입력값" + m);
		// 문제
		// 로그인 기능 구현
		// 입력한 아이디와 비밀번호 일치하는 회원을 검색하여
		// 로그인 성공 시
		// - session에 mvo이름으로 회원의 정보를 저장 index.jsp에서 "로그인에 성공했습니다." 모달창
		// 로그인 실패 시
		// - loginForm.jsp로 이동 후 "아이디와 비밀번호를 다시 입력해주세요." 모달창

		User mvo = userMapper.login(m);
		System.out.println("여기 db에서 나온거" + mvo);
		if (mvo == null) {
			// 로그인 실패
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 입력해주세요.");
			return "redirect:/loginForm.do";
		} else {
			// 로그인 성공
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
			session.setAttribute("mvo", mvo);

			Plant p = null;

			// 발전소를 가지고 있는지 확인
			if (Integer.valueOf(mvo.getPlant_idx()) != null) {
				p = userMapper.getPlant(mvo.getPlant_idx());
				session.setAttribute("plant", p);
			}

			return "redirect:/index";
		}

	}

	// 로그인 페이지 이동 /loginForm.do
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그아웃 기능 /logout.do
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msgType", "로그아웃 메세지");
		rttr.addFlashAttribute("msg", "정상적으로 로그아웃 되었습니다.");
		return "redirect:/";
	}

//	// 회원아이디 중복체크 기능 /registerCheck.do
//	@GetMapping("/registerCheck.do")
//	public @ResponseBody int registerCheck(@RequestParam("memID") String memID) {
//
//		Member m = memberMapper.registerCheck(memID);
//
//		if (memID.equals("") || m != null) {
//			return 0; // 이미 존재하거나 아이디를 아에 입력 X
//		} else {
//			return 1; // 사용할 수 있음
//		}
//	}

	// 회원가입 페이지 이동 /joinForm.do
	@GetMapping("/join.do")
	public String joinForm() {
		return "member/join";
	}

	@GetMapping("/idCheck.do")
	public @ResponseBody int idCheck(@RequestParam("user_id") String user_id) {

		User mvo = userMapper.idCheck(user_id);

		int num = 0;
		if (mvo == null) {
			num = 1;
		}
		return num;
	}

	@GetMapping("/nickCheck.do")
	public @ResponseBody int nickCheck(@RequestParam("nickName") String user_nick) {

		User mvo = userMapper.nickCheck(user_nick);

		int num = 0;
		if (mvo == null) {
			num = 1;
		}
		return num;
	}

	@PostMapping("/emailCheck.do")
	public @ResponseBody int checkEmail(@RequestParam("user_email") String user_email) {

		User mvo = userMapper.checkEmail(user_email);

		int num = 0;
		if (mvo == null) {
			num = 1;
		}
		return num;
	}

	@PostMapping("/phoneCheck.do")
	public @ResponseBody int checkPhone(@RequestParam("user_phone") String user_phone) {

		User mvo = userMapper.checkPhone(user_phone);

		int num = 0;
		if (mvo == null) {
			num = 1;
		}
		return num;
	}

	
	  @PostMapping("/updateUser_info.do")
	  public String update(User user, RedirectAttributes rttr, HttpSession session) {
		  
		    User sessionUser = (User) session.getAttribute("mvo");

		    if (sessionUser != null) {
		        if (user.getUser_email() != null) sessionUser.setUser_email(user.getUser_email());
		        if (user.getUser_phone() != null) sessionUser.setUser_phone(user.getUser_phone());
		        if (user.getUser_id() != null) sessionUser.setUser_id(user.getUser_id());
		        // 필요한 다른 필드도 동일하게 설정
		    }

		    int cnt = userMapper.update(sessionUser);

		    if (cnt == 1) {
		        rttr.addFlashAttribute("msgType", "성공 메세지");
		        rttr.addFlashAttribute("msg", "정보가 변경되었습니다.");
		        session.setAttribute("mvo", sessionUser);
		    } else {
		        rttr.addFlashAttribute("msgType", "실패 메세지");
		        rttr.addFlashAttribute("msg", "정보변경에 실패했습니다.");
		        session.setAttribute("mvo", sessionUser);
		    }

		    return "redirect:/updateMain.do";
	  }

	// 회원가입
	@PostMapping("/join.do")
	public String join(User m, HttpSession session, RedirectAttributes rttr) {

		int cnt = userMapper.join(m);

		if (cnt == 1) {
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
			// 회원가입 성공하면 로그인이 된 채로 main 페이지로 갈 거임
			session.setAttribute("mvo", m);
			return "redirect:/index";
		} else {
			// 회원가입 실패
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");

			return "redirect:/joinForm.do";
		}
	}

	// 마이 페이지 이동 /updateMain.do
	@GetMapping("/updateMain.do")
	public String updateMain() {
		return "member/updateMain";
	}

	// 이미지파일 받기 백업
	@PostMapping("/profileUpdate.do")
	public String profileUpdate(@RequestParam("user_profile") MultipartFile file, RedirectAttributes rttr,
			HttpSession session, HttpServletRequest req) {

		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어냄
		long size = file.getSize(); // 파일 사이즈

		// 확장자
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

		String uploadDir = "/resources/images"; // 가상의 업로드 경로
		String uploadFolder = session.getServletContext().getRealPath(uploadDir);

		boolean extResult = fileExtension.equals(".JPG") || fileExtension.equals(".PNG") || fileExtension.equals(".GIF")
				|| fileExtension.equals(".jpg") || fileExtension.equals(".png") || fileExtension.equals(".gif")
				|| fileExtension.equals(".jpeg") || fileExtension.equals(".JPEG");

		if (!extResult) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "이미지 파일만 가능합니다 (PNG, JPG, GIF)");
			return "redirect:/updateMain.do";
		}

		// 기존 파일 지우기
		User vo = (User) session.getAttribute("mvo");
		String oldImg = userMapper.getMember(vo.getUser_id()).getUser_profile();

		// 기존 파일
		if (oldImg != null) {
			File oldFile = new File(uploadFolder + "/" + oldImg);
			oldFile.delete();
		}

		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileRealName);

		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// uuid 설정된 파일
		String newFileName = uniqueName + fileRealName;
		vo.setUser_profile(newFileName);

		// db 에 업로드
		userMapper.profileUpdate(vo);

		// 세션에 셋팅
		session.setAttribute("mvo", vo);

		return "redirect:/updateMain.do";

	}

	@PostMapping("/pwChange.do")
	public String pwChange(@RequestParam("user_pw") String user_pw, User m, HttpSession session,
			RedirectAttributes rttr) {

		String user_id = ((User) session.getAttribute("mvo")).getUser_id();

		User vo = new User();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);

		userMapper.pwChange(vo);

		User temp = userMapper.getMember(user_id);

		System.out.println(temp.toString());

		session.setAttribute("mvo", temp);

		return "redirect:/updateMain.do";
	}

	@GetMapping("plantInsert.do")
	public String plantInsert(Plant p, HttpSession session, RedirectAttributes rttr) {

		int num = 0;
		num = userMapper.plantInsert(p);

		System.out.println(p.getPlant_idx());

		if (num == 1) {
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "발전소 정보를 입력했습니다.");

			// 플랜트정보를 mvo에 plant_idx로 인서트해서 다시 세션화
			User m = ((User) session.getAttribute("mvo"));
			m.setPlant_idx(p.getPlant_idx());
			userMapper.plantUpdateUser(m);
			session.setAttribute("mvo", m);
			session.setAttribute("plant", p);

		} else {
			// 회원가입 실패
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "입력에 실패했습니다.");
		}

		return "redirect:/updateMain.do";

	}

	@GetMapping("plantUpdate.do")
	public String plantUpdate(Plant p, HttpSession session, RedirectAttributes rttr) {

		int num = userMapper.plantUpdate(p);

		session.setAttribute("plant", p);

		rttr.addFlashAttribute("msgType", "성공 메세지");
		rttr.addFlashAttribute("msg", "발전소 정보를 입력했습니다.");

		return "redirect:/updateMain.do";
	}
	
	@PostMapping("setDefaultImage.do")
	public String setDefaultImage(@RequestParam("user_id") String user_id, @RequestParam("user_profile") String user_profile,
			HttpSession session, RedirectAttributes rttr) {

		userMapper.setDefaultImage(user_id);
		User mvo = userMapper.getMember(user_id);
		if(mvo != null) {
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "정보가 변경되었습니다.");
			session.setAttribute("mvo", mvo);
		}else {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "정보 변경에 실패했습니다.");
			session.setAttribute("mvo", mvo);
		}

		return "redirect:/updateMain.do";
	}
		
}
