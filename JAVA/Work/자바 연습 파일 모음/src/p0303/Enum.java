package p0303;

public class Enum {

	enum Fruit{
	    APPLE, PEACH, BANANA;
	    Fruit(){
	        System.out.println("Call Constructor "+this);
	    }
	}
	 
	enum Company{
	    GOOGLE, APPLE, ORACLE;
	}
	 
public class ExerEnum {
	     
	 public static void main(String[] args) {
	     
	        /*
	        if(Fruit.APPLE == Company.APPLE){
	            System.out.println("과일 애플과 회사 애플이 같다.");
	        }
	        */
	        Fruit type = Fruit.APPLE;
	        switch(type){
	            case APPLE:
	                System.out.println(57+" kcal");
	                break;
	            case PEACH:
	                System.out.println(34+" kcal");
	                break;
	            case BANANA:
	                System.out.println(93+" kcal");
	                break;
	        }
	    }
	}