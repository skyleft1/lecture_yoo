package javaOmok;

import java.util.Scanner;

public class Omok {
    public static void main(String[] args) {
    	SetBoard setBoard = new SetBoard();
    	setBoard.setBoard();

        for (; true; ) {
            String put = setBoard.입력();
            setBoard.위치입력(put);
            setBoard.승리판단();
        }
    }
}

class SetBoard {
    String[][] board = new String[10][10];
    int count;

    void 승리판단() {

        for (int j = 1; j < 10; j++) {
            for (int i = 1; i < 6; i++) {
                if (board[j][i] == " \u25CB"
                 && board[j][i + 1] == " \u25CB"
                 && board[j][i + 2] == " \u25CB"
                 && board[j][i + 3] == " \u25CB"
                 && board[j][i + 4] == " \u25CB" ) {
                    System.out.println("black 승");
                    System.exit(0);
                } else if (board[j][i] == " \u25CF"
                        && board[j][i + 1] == " \u25CF"
                        && board[j][i + 2] == " \u25CF"
                        && board[j][i + 3] == " \u25CF"
                        && board[j][i + 4] == " \u25CF" ) {
                    System.out.println("white 승");
                    System.exit(0);
                } else {
                    continue;
                }
            }
        }

        for (int j = 1; j < 6; j++) {
            for (int i = 1; i < 10; i++) {
                if (board[j][i] == " \u25CB"
                 && board[j + 1][i] == " \u25CB"
                 && board[j + 2][i] == " \u25CB"
                 && board[j + 3][i] == " \u25CB"
                 && board[j + 4][i] == " \u25CB" ) {
                    System.out.println("black 승");
                    System.exit(0);
                } else if (board[j][i] == " \u25CF"
                        && board[j + 1][i] == " \u25CF"
                        && board[j + 2][i] == " \u25CF"
                        && board[j + 3][i] == " \u25CF"
                        && board[j + 4][i] == " \u25CF" ) {
                    System.out.println("white 승");
                    System.exit(0);
                } else {
                    continue;
                }
            }
        }

        for (int j = 1; j < 6; j++) {
            for (int i = 1; i < 6; i++) {
                if (board[j][i] == " \u25CB"
                 && board[j + 1][i + 1] == " \u25CB"
                 && board[j + 2][i + 2] == " \u25CB"
                 && board[j + 3][i + 3] == " \u25CB"
                 && board[j + 4][i + 4] == " \u25CB" ) {
                    System.out.println("black 승");
                    System.exit(0);
                } else if (board[j][i] == " \u25CF"
                        && board[j][i + 1] == " \u25CF"
                        && board[j][i + 2] == " \u25CF"
                        && board[j][i + 3] == " \u25CF"
                        && board[j][i + 4] == " \u25CF" ) {
                    System.out.println("white 승");
                    System.exit(0);
                } else {
                    continue;
                }
            }
        }
    }


    String 입력() {
        String put = "";
        for (; true; ) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("놓을 위치를 입력해라 (ex 33 세로가로순) \n (종료를 원하면 -1입력)");
            put = scanner.next();

            if (put.equals("-1")) {
                System.exit(0);
            } else if (put.length() != 2) {
                System.out.println("1~9의 두자리 수로 입력해주세요. ex) 11, 39 ");
            } else if ( !오류점검(put)) {
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
                white(num1, num2);
            } else {
                black(num1, num2);
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
        if (board[num1][num2] == " \u25CB" || board[num1][num2] == " \u25CF") {
            System.out.println("이미 그 위치에 돌이 존재합니다.");
            return false;

        } else if (num1 == 0 || num2 == 0) {
            System.out.println("1~9의 수를 입력해주세요. ex) 11, 39 ");
            return false;
        }
        return true;
    }


    void white(int num1, int num2) {
    	board[num1][num2] = " \u25CB";
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                System.out.print(board[i][j]);
            }
            System.out.println();
        }
    }

    void black(int num1, int num2) {
    	board[num1][num2] = " \u25CF";
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                System.out.print(board[i][j]);
            }
            System.out.println();
        }
    }

    void setBoard() {
        for (int i = 0; i < 10; i++) {
        	board[i][0] = " " + String.valueOf(i);
        }
        for (int i = 0; i < 10; i++) {
        	board[0][i] = " " + String.valueOf(i) + " ";
        }
        board[0][0] = "\u2198 ";

        for (int i = 1; i < 10; i++) {
            for (int j = 1; j < 10; j++) {
            	board[i][j] = " \u25A1";
            }
        }
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                System.out.print(board[i][j]);
            }
            System.out.println();
        }
    }
}
