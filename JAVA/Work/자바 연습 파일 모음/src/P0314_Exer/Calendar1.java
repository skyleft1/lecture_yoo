package P0314_Exer;

import java.util.Calendar;

public class Calendar1 {
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.get(Calendar.YEAR));
		System.out.println(cal.get(Calendar.HOUR));
		System.out.println(cal.get(Calendar.AM));
		System.out.println(cal.get(Calendar.ALL_STYLES));

		
	    cal.add(Calendar.DAY_OF_YEAR, 100);
	    System.out.println(cal.get(Calendar.YEAR);
		cal.add(Calendar.YEAR, -5);
		System.out.println(cal.get(Calendar.YEAR));
	}
}
