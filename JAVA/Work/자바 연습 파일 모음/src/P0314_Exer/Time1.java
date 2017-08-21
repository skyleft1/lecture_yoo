package P0314_Exer;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Time1 {
	public static void main(String[] args) {
		LocalDateTime datetime = LocalDateTime.now();  // 현재 날자와 시간 구함
		System.out.println(datetime);
		
		LocalDate date = LocalDate.now();  // 현재 날자 구함
		System.out.println(date);
		
		LocalTime time = LocalTime.now();  // 현재 시간 구함
		System.out.println(time);
		
		System.out.println(datetime.getDayOfYear());
		
	}

	
	


}
