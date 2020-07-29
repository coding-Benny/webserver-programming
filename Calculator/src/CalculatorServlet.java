package jspbook.ch04;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 * File : CalculatorServlet.java
 * Desc : 계산기 서블릿 과제
 * @author 이정현(sparklingluz@hansung.ac.kr)
 */
@WebServlet(description = "Calculator 서블릿", urlPatterns = { "/CalculatorServlet" })
public class CalculatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// GET 요청을 처리하기 위한 메서드
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// doPost()로 포워딩
		doPost(req, res);
	}
	// POST 요청을 처리하기 위한 메서드
	// doGet()에서도 호출하고 있기 때문에 모든 요청은 doPost()에서 처리되는 구조이다.

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 변수 선언
		int num1, num2;
		int result;
		String op;
		// 클라이언트 응답시 전달될 컨텐트에 대한 타입 설정과 캐릭터셋 지정
		res.setContentType("text/html; charset=UTF-8");
		// 클라이언트 응답을 위한 출력 스트림 확보
		PrintWriter out = res.getWriter();
		// HTML 폼을 통해 전달된 num1, num2 파라미터 값을 변수에 할당한다.
		// 이때 getParameter() 메서드는 문자열을 리턴하므로 숫자형 데이터의 경우 Integer.parseInt()를 통해 int로 변환한다.
		num1 = Integer.parseInt(req.getParameter("num1"));
		num2 = Integer.parseInt(req.getParameter("num2"));
		op = req.getParameter("operator");
		// Calc 클래스 인스턴스 생성 후 getResult 메서드 호출로 결과 받음
		Calc calc = new Calc(num1, num2, op);
		result = calc.getResult();
		// 출력스트림을 통한 화면 구성
		out.println("<HTML>");
		out.println("<HEAD><TITLE>계산기</TITLE></HEAD>");
		out.println("<BODY><center>");
		out.println("<H2>계산결과</H2>");
		out.println("<HR>");
		if(op.equals("~")) {
			out.println(num1 + "부터 " + num2 + "까지의 합은 " + result);
		}
		else {
			out.println(num1 + " " + op + " " + num2 + " = " + result);
		}
		out.println("</BODY></HTML>");
	}
}
