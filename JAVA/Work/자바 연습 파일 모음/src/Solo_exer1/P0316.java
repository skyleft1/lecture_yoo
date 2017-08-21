package Solo_exer1;

// 목표 : 가격, 보유 돈, 상품 구입 -> 보유돈 증감 

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
			System.out.println("잔액이 부족합니다. (남은 money =" +money+")");
			return;
		}
		else {
			money -= pro.price;
			point += pro.price * 0.1;
			System.out.println(pro + "를 구매했습니다.");
			System.out.println("point " + (int)(pro.price*0.1) +" 적립 (총 포인트 :" + point + ")" );
			add(pro);
		}
	}
	
	void add(Product pro){
		if(i > cart.length) {
			Product[] tmp = new Product[cart.length*2];
			// 1.1.2 기존의 장바구니의 내용을 새로운 배열에 복사한다.
			System.arraycopy(cart,0,tmp,0,cart.length);
			// 1.1.3 새로운 장바구니와 기존의 장바구니를 바꾼다.
			cart = tmp;
		}
		else {cart[i] = pro; 
		System.out.println(cart[i]+ " 장바구니에 담겼습니다.");
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
		System.out.println("구매 목록 = "+ list);
		System.out.println("사용 money = " + sum);
		System.out.println("남은 money = " + money);
		System.out.println("총 point = " + point);
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