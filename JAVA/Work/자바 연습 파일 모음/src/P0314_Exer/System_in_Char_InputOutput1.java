package P0314_Exer;

import java.io.*;

public class System_in_Char_InputOutput1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
// Ű����(System.in)�κ��� �Է¹޾� �ֿܼ� ���
		String line = null;
		try {
			line = br.readLine();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(line);
	}

}
