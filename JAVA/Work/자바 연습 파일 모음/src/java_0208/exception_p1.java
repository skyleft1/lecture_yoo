package java_0208;

public class exception_p1 {
        public static void main(String[] args) {
            int i = 10;
            int j = 0;
            try{
                int k = divide(i, j);
                System.out.println(k);
            }catch(IllegalArgumentException e){
                System.out.println("0���� ������ �ȵ˴ϴ�.");
            }        
        }

        public static int divide(int i, int j)throws IllegalArgumentException{
            if(j == 0){
            	throw new IllegalArgumentException("0���� ���� �� �����.");
            	}

            int k = i / j;
            return k;
        }
    }