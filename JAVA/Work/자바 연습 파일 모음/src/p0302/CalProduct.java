package p0302;

class CalProduct {
	public static void main(String args[]){
		Buy b = new Buy();
		Tv t = new Tv();
		Computer c = new Computer();
		
		b.money = 10000;
		
		b.buy(t);
		b.buy(c);
			System.out.println("���� ����"+ b.money +"�Դϴ�.");
			System.out.println("����Ʈ��"+ b.point +"�Դϴ�.");
			System.out.println(b.toString());
			System.out.println(c);
	}


}



class Buy{
	int money;
	int point;
	void buy(Product p){
		System.out.println(p+"�� �����߽��ϴ�.");
		money -= p.price;
		point += p.price*0.1;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "��ǰ��";
	}
}

class Product{
	int price;
	Product(int price){
		this.price = price;
	}

}

class Tv extends Product{
	Tv(){
		super(350);	
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Tv~";
	}
}

class Computer extends Product{
	Computer(){
		super(200);
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "��ǻ��";
	}
}
