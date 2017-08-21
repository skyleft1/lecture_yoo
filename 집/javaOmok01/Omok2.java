package javaOmok01;

import java.util.Scanner;

import network2.MakePan;

public class Omok2 {
	public static void main(String[] args) {
		MakePan make = new MakePan();
		make.setPan();

		for (; true;) {
			String put = make.입력();
			make.위치입력(put);
			make.승리판단();
		}
	}
}

class MakePan {
	int row = 10;
	int col = 10;
	String[][] pan = new String[row][col]; // 10
	int count;

	void 승리판단() {
		전후좌우판단(1, 1, row, col - 4, "가로");
		전후좌우판단(1, 1, row - 4, col, "세로");
		전후좌우판단(1, 1, row - 4, col - 4, "좌상향");
		전후좌우판단(5, 1, row, col - 4, "우상향");
	}

	void 전후좌우판단(int row_i, int col_j, int row, int col, String 전후좌우) {

		for (int i = row_i; i < row; i++) {
			for (int j = col_j; j < col; j++) {
				int black_win = 0, white_win = 0;

				if (전후좌우 == "가로") {
					for (int u = 0; u < 5; u++) {
						if (pan[i][j + u] == " \u25CB") {
							black_win += 1;
						} else if (pan[i][j + u] == " \u25CF") {
							white_win += 1;
						}
					}
					결과출력(black_win, white_win);

				} else if (전후좌우 == "세로") {
					for (int u = 0; u < 5; u++) {
						if (pan[i + u][j] == " \u25CB") {
							black_win += 1;
						} else if (pan[i + u][j] == " \u25CF") {
							white_win += 1;
						}
					}
					결과출력(black_win, white_win);

				} else if (전후좌우 == "좌상향") {
					for (int u = 0; u < 5; u++) {
						if (pan[i + u][j + u] == " \u25CB") {
							black_win += 1;
						} else if (pan[i + u][j + u] == " \u25CF") {
							white_win += 1;
						}
					}
					결과출력(black_win, white_win);

				} else if (전후좌우 == "우상향") {
					for (int u = 0; u < 5; u++) {
						if (pan[i - u][j + u] == " \u25CB") {
							black_win += 1;
						} else if (pan[i - u][j + u] == " \u25CF") {
							white_win += 1;
						}
					}
					결과출력(black_win, white_win);
				}
			}
		}
	}

	void 결과출력(int black_win, int white_win) {
		if (black_win == 5) {
			System.out.println("black 승");
			System.exit(0);
		} else if (white_win == 5) {
			System.out.println("white 승");
			System.exit(0);
		}
	}

	String 입력() {
		String put = "";
		for (; true;) {
			Scanner scanner = new Scanner(System.in);
			System.out.println("놓을 위치를 입력해라 (ex 33 세로가로순) \n (종료를 원하면 -1입력)");
			put = scanner.next();

			if (put.equals("-1")) {
				System.exit(0);
			} else if (put.length() != 2) {
				System.out.println("1~9의 두자리 수로 입력해주세요. ex) 11, 39 ");
			} else if (!오류점검(put)) {
			} else {
				return put;
			}
		}
	}

	void 위치입력(String put) {

		String put1 = put.substring(0, 1);
		String put2 = put.substring(1, 2);
		int num1 = 0;
		int num2 = 0;
		num1 = Integer.parseInt(put1);
		num2 = Integer.parseInt(put2);

		if (count % 2 == 0) {
			위치입력_white(num1, num2);
		} else {
			위치입력_black(num1, num2);
		}
		count++;
	}

	boolean 오류점검(String put) {
		String put1 = put.substring(0, 1);
		String put2 = put.substring(1, 2);

		for (int i = 0; i < put1.length(); i++) {
			char ch1 = put1.charAt(i);
			char ch2 = put2.charAt(i);
			if ((ch1 < '1' || ch1 > '9') || (ch2 < '1' || ch2 > '9')) {
				System.out.println("1~9의 수를 입력해주세요. ex) 11, 39 ");
				return false;
			}
		}

		int num1 = Integer.parseInt(put1);
		int num2 = Integer.parseInt(put2);
		if (pan[num1][num2] == " \u25CB" || pan[num1][num2] == " \u25CF") {
			System.out.println("이미 그 위치에 돌이 존재합니다.");
			return false;

		} else if (num1 == 0 || num2 == 0) {
			System.out.println("1~9의 수를 입력해주세요. ex) 11, 39 ");
			return false;
		}
		return true;
	}

	void 위치입력_black(int num1, int num2) {
		pan[num1][num2] = " \u25CF";
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				System.out.print(pan[i][j]);
			}
			System.out.println();
		}
	}

	void 위치입력_white(int num1, int num2) {
		pan[num1][num2] = " \u25CB";
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				System.out.print(pan[i][j]);
			}
			System.out.println();
		}
	}

	void setPan() {
		for (int i = 0; i < row; i++) {
			pan[i][0] = " " + String.valueOf(i);
		}
		for (int i = 0; i < col; i++) {
			pan[0][i] = " " + String.valueOf(i) + " ";
		}
		pan[0][0] = "\u2198 ";

		for (int i = 1; i < row; i++) {
			for (int j = 1; j < col; j++) {
				pan[i][j] = " \u25A1";
			}
		}
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				System.out.print(pan[i][j]);
			}
			System.out.println();
		}
	}
}
