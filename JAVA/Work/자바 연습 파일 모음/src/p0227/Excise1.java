package p0227;

class Excise1 {
	public static void main(String[] args) {
		Buy b = new Buy();
		Tv tv = new Tv();
		Computer com = new Computer();
			
		b.buy(tv);
		b.buy(com);


	System.out.println("���� ���� "+ b.money+" �� �� ���� ��");
	System.out.println("���� ����Ʈ�� "+b.point + " �̴�");
	}
}

class Buy {
	int money = 10000;
	int point = 0;
	
	void buy(Product p){
		if (p.price > money ){
			System.out.println("�ܾ� ����~");
		}
		money -= p.price; 
		point += p.price*0.1;
		System.out.println(p +"�� �����Ͽ�����~");

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