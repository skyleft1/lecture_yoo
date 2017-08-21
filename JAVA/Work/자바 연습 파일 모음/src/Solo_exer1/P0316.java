package Solo_exer1;

// ��ǥ : ����, ���� ��, ��ǰ ���� -> ������ ���� 

public class P0316 {
	public static void main(String[] args) {

		Computer com = new Computer();
		Doll dol = new Doll();
		Drink dri = new Drink(); 
		Buy buy = new Buy();
		
		buy.money = 440000;
		buy.buy(com);
		buy.buy(dol);
		buy.buy(com);
		buy.buy(dri);
		buy.buy(com);
		buy.buy(com);
		
		buy.summary();
		}
}

class Buy {
	int money;
	int point;
	int i = 0;
	Product[] cart = new Product[7];
	void buy (Product pro) {
		if(money < pro.price) {
			System.out.println("�ܾ��� �����մϴ�. (���� money =" +money+")");
			return;
		}
		else {
			money -= pro.price;
			point += pro.price * 0.1;
			System.out.println(pro + "�� �����߽��ϴ�.");
			System.out.println("point " + (int)(pro.price*0.1) +" ���� (�� ����Ʈ :" + point + ")" );
			add(pro);
		}
	}
	
	void add(Product pro){
		if(i > cart.length) {
			Product[] tmp = new Product[cart.length*2];
			// 1.1.2 ������ ��ٱ����� ������ ���ο� �迭�� �����Ѵ�.
			System.arraycopy(cart,0,tmp,0,cart.length);
			// 1.1.3 ���ο� ��ٱ��Ͽ� ������ ��ٱ��ϸ� �ٲ۴�.
			cart = tmp;
		}
		else {cart[i] = pro; 
		System.out.println(cart[i]+ " ��ٱ��Ͽ� �����ϴ�.");
		System.out.println();
		i++;
		}
	}
	
	void summary(){
		String list = null; 
		int sum = 0;
		
		for(int i=0; i <cart.length; i++){
			if(cart[i]==null)
				break;
			list += cart[i] + ",";
			sum += cart[i].price;
		}
		System.out.println("���� ��� = "+ list);
		System.out.println("��� money = " + sum);
		System.out.println("���� money = " + money);
		System.out.println("�� point = " + point);
	}
}

class Product {
	int price;
	Product(int price){
		this.price = price;
	}
}

class Computer extends Product {
	Computer(){
		super(100000);
	}
	public String toString(){
		return "<Computer>";
	}
}

class Doll extends Product {
	Doll(){
		super(35000);
	}
	public String toString(){
		return "<Doll>";
	}
}

class Drink extends Product {
	Drink(){
		super(9000);
	}
	public String toString(){
		return "<Drink>";
	}
}