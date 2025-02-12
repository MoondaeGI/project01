package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.EncryptionUtils;
import dao.MemberDAO;
import dto.MemberDTO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		MemberDAO memberDao = MemberDAO.getInstance();
		String ip = request.getRemoteAddr();

		try {
			if (cmd.equals("/signup.member")) {
				response.sendRedirect("/member/signup.jsp");

			} else if (cmd.equals("/create.member")) {
				System.out.println("if안의 호출");
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String encryptPw = EncryptionUtils.encrypt(pw);
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String tel = request.getParameter("tel");
				int post = Integer.parseInt(request.getParameter("post"));
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				System.out.println("가입요청 : " + ip);
				memberDao.createById(new MemberDTO(id, encryptPw, name, email, tel, post, address1, address2));
				response.sendRedirect("/");

			} else if (cmd.equals("/mypage.member")) {
				request.getSession().getAttribute("dto");
				request.getRequestDispatcher("/members/mypage.jsp").forward(request, response);

			} else if (cmd.equals("/update.member")) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String tel = request.getParameter("tel");
				int post = Integer.parseInt(request.getParameter("post"));
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");

				int result = memberDao.updateById(new MemberDTO(id, name, email, tel, post, address1, address2));
				if (result > 0) {
					MemberDTO dto = memberDao.findById(id);// 업데이트후 변경된 정보를 새로 세션에 담기
					request.getSession().setAttribute("dto", dto);
				} else {
					System.out.println("수정실패!");
				}
				response.sendRedirect("/");
			} else if (cmd.equals("/delete.member")) {
				String id = request.getParameter("id");
				int result = memberDao.deleteById(id);
				if (result > 0) {
					request.getSession().invalidate();
				}
				response.sendRedirect("/index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
