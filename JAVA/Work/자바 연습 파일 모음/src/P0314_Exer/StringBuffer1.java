package P0314_Exer;

public class StringBuffer1 {
	public static void main(String[] args) {
		StringBuffer aa1 = new StringBuffer();
		aa1.append("À¯³ç");
		aa1.append(" »ç¶ûÇÞ");
		
		System.out.println(aa1);
		
		
		String bb1 = new StringBuffer().append("À¯³ç ").append("»ç¶ûÇØ").toString();
		System.out.println(bb1);
}
}
