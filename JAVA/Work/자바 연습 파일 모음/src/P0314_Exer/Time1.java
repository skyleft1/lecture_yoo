package P0314_Exer;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Time1 {
	public static void main(String[] args) {
		LocalDateTime datetime = LocalDateTime.now();  // ���� ���ڿ� �ð� ����
		System.out.println(datetime);
		
		LocalDate date = LocalDate.now();  // ���� ���� ����
		System.out.println(date);
		
		LocalTime time = LocalTime.now();  // ���� �ð� ����
		System.out.println(time);
		
		System.out.println(datetime.getDayOfYear());
		
	}

	
	


}
