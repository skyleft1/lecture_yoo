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
		// main ���⼱ �޼ҵ�
		// String[] args main �޼ҵ��� �Ķ����
		// String[] ���ڿ��� ��� �迭  args 
		mmmm();
		System.out.println(args.length);
		for (String e : args) {
			System.out.println(e);
		}
	}
}
