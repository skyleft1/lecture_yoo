package java_0210;

public class p1 {
	public static void main(String args[]){
		int score[] = {34, 45, 56, 66, 77, 79, 88, 91, 94, 100};
		int rank = 10;
		
		for(int i=0; i<=100; i++){
			for(int j=0; j<score.length; j++){
				if(i == score[j]){
					
			        System.out.println(rank+ "µî : " + i); 
			        rank--;
				}
					
			}
		}
	}
}