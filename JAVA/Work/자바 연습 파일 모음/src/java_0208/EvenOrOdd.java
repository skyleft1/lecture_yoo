package java_0208;

	public class EvenOrOdd {
	    String evenOrOdd(int num) {
	    	num = Integer.parseInt(str);
	        String result = "num";
	        return result;
	    }

	    public static void main(String[] args) {
	        String str = "1 2 3 4";
	        EvenOrOdd evenOrOdd = new EvenOrOdd();
	        //아래는 테스트로 출력해 보기 위한 코드입니다.
	        System.out.println("결과 : " + evenOrOdd.evenOrOdd(3));
	        System.out.println("결과 : " + evenOrOdd.evenOrOdd(2));
	    }
	}