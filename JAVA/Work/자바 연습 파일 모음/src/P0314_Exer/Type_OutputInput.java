package P0314_Exer;

import java.io.*;

public class Type_OutputInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try(
				DataOutputStream out = new DataOutputStream(new FileOutputStream("Type1.txt"));
				)
		{
			out.writeInt(100);
			out.writeDouble(22.5);			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}


