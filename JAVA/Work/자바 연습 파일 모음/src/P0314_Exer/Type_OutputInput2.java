package P0314_Exer;

import java.io.*;


public class Type_OutputInput2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try(
				DataInputStream in = new DataInputStream(new FileInputStream("Type1.txt"));
				)
		{
			int i = in.readInt();
			double d = in.readDouble();
			System.out.println(i +"+" +d);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}