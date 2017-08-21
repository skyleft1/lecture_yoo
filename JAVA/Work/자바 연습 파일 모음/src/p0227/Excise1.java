package p0227;

class Excise1 {
	public static void main(String[] args) {
		Buy b = new Buy();
		Tv tv = new Tv();
		Computer com = new Computer();
			
		b.buy(tv);
		b.buy(com);


	System.out.println("남은 돈은 "+ b.money+" 임 님 거지 ㅋ");
	System.out.println("냠은 포인트는 "+b.point + " 이다");
	}
}

class Buy {
	int money = 10000;
	int point = 0;
	
	void buy(Product p){
		if (p.price > money ){
			System.out.println("잔액 없다~");
		}
		money -= p.price; 
		point += p.price*0.1;
		System.out.println(p +"를 구입하였구나~");

		}
	}


class Product {
	int price ;
	int point ;
	Product (int price){
		this.price = price;
	}
}

class Tv extends Product {
	Tv () {
		super(100);
	}
}

class Computer extends Product {
	Computer(){
		super(200);
	}
}