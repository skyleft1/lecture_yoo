package P0314_Exer;

import java.io.*;

public class File_Char_InputOutput2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BufferedReader br = null;
		PrintWriter pw = null;
		try {
			br = new BufferedReader(new FileReader("src/P0314/Time1.java"));
			pw = new PrintWriter("test3.txt");
			String line = null;
			try {
				while((line = br.readLine()) != null){
					pw.println(line);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			try {
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pw.close();
		}
// 파일("src/P0314/Time1")로부터 입력받아 콘솔에 출력

	}

}
