package p0223;

class Exercise6_5 {
	public static void main(String args[]) {
		Student s = new Student("ȫ�浿",1,1,100,60,76);
		System.out.println(s.info());
		}
}


class Student {
	String name ; 
	int ban ;
	int no ;
	int kor ;
	int eng ;
	int math ;
	
	Student(String name, int ban, int no, int kor, int eng, int math ){
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	
	int getTotal(){
		int total;
		return total = kor + eng + math;
	}
	
	float getAverage(){
		int total = getTotal();
		float average ;
		return average = (int)((total / 3f + 0.05)*10) / 10f; 
	}
	public String info (){
		return name + ban + no + getTotal();
	}
}