package Java_Exercise;

class Exercise9_4 {
	static void printGraph(int[] dataArr, char ch) {
		for(int i =0; i < dataArr.length ; i++ ){

			int a = dataArr[i];
			for(int j = 0 ; j < a ; j++){
				System.out.print(ch);
			}
			System.out.print(dataArr[i]);
			System.out.println();
		}

		
/*
(1) printGraph메서드를 작성하시오.
*/
}
	public static void main(String[] args) {
		printGraph(new int[]{3,7,1,4},'*');
}
}