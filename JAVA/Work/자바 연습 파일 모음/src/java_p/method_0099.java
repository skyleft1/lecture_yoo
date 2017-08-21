package java_p;

public class method_0099 {

	public static void mmmm() {
		for ( int i = 0; i < 10; i++){
			for ( int e = 0; e < 10; e++){
				System.out.println(i+""+e);
			}
		}
	}
	
	
	public static void main(String[] args) {
		// main 여기선 메소드
		// String[] args main 메소드의 파라미터
		// String[] 문자열을 담는 배열  args 
		mmmm();
		System.out.println(args.length);
		for (String e : args) {
			System.out.println(e);
		}
	}
}
