package P0314_Exer;

public class StringBuffer1 {
	public static void main(String[] args) {
		StringBuffer aa1 = new StringBuffer();
		aa1.append("����");
		aa1.append(" �����");
		
		System.out.println(aa1);
		
		
		String bb1 = new StringBuffer().append("���� ").append("�����").toString();
		System.out.println(bb1);
}
}
