package p0305;

public class P0309_1 {
    public static void main(String[] args) {
    	Employee emp = new Employee();
    	emp.name(new Name("ȫ�浿"));
    	emp.phone(new Phone("010-8936-7024"));
    	emp.salary(new Salary(2000));
    }
}

class Employee {
	void name(Name n){
		n.getName();
	}
	void phone(Phone p){
		p.getPhone();
	}
	void salary(Salary s){
		s.getSalary();
	}
}

class Name {
	private String name;
	Name(String name){
		this.name = name;
	}
	void getName(){
		System.out.println(name);
	}
}

class Phone {
	private String phone;
	Phone(String phone){
		this.phone = phone;
	}
	void getPhone(){
		System.out.println(phone);
	}
}

class Salary {
	private int salary;
	Salary(int salary){
		this.salary = salary;
	}
	void getSalary(){
		System.out.println(salary);
	}
}