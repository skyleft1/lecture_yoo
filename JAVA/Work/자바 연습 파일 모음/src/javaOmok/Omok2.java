package javaOmok;

import java.util.Scanner;

public class Omok2 {
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);
		
		int size = 19;
		int[][] board = new int[size][size];
		
		for(int i = 0 ; i < size ; i++){
			
			for(int j = 0 ; j < size ; j++){
				board[i][j] = scanner.nextInt();
			}
			
		}
		
	}
}
