package P0314_Exer;

public class Set_Get {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set_Get2<Object> a1 = new Set_Get2<>();
		Set_Get2<String> a2 = new Set_Get2<>();
		Set_Get2<Integer> a3 = new Set_Get2<>();
		
		a1.setObj(new Object());
		Object obj1 = a1.getObj();

		a2.setObj("À¯³ç");
		String obj2 = a2.getObj();
		
		a3.setObj(8);
		int obj3 = a3.getObj();		
		
		System.out.println(obj1);
		System.out.println(obj2);
		System.out.println(obj3);
		
	}
}
	
		
class Set_Get2<T> {
	private T obj;
	
	public void setObj(T obj){
		this.obj = obj;
	}
	
	public T getObj(){
		return obj;
	}
	
}