package jspbook.ch04;
/**
 * File : Calc.java
 * Desc : 계산기 클래스
 * @author 이정현(sparklingluz@hansung.ac.kr)
 */
/*public class Calc {
	int result = 0;
	public Calc(int num1, int num2, String op) {
		if(op.equals("+")) {
			result = num1 + num2;
		}
		else if(op.equals("-")) {
			result = num1 - num2;
		}
		else if(op.equals("*")) {
			result = num1 * num2;
		}
		else if(op.equals("/")) {
			result = num1 / num2;
		}
		else if(op.equals("~")) {
			for(int i = num1; i <= num2; i++) {
				result += i;
			}
		}
	}
	public int getResult() { // 계산 결과를 리턴하는 메서드
		return result;
	}
}*/

public class Calc {
	int result = 0;
	public Calc(int num1, int num2, String op) {
		if(op.equals("+")) {
			result = num1 + num2;
		}
		else if(op.equals("-")) {
			result = num1 - num2;
		}
		else if(op.equals("*")) {
			result = num1 * num2;
		}
		else if(op.equals("/")) {
			result = num1 / num2;
		}
	}
	public int getResult() {
		return result;
	}
}
