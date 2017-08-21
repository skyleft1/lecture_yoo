package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import dao.DBConnect;

public class DaoBook2 {
    public static void main(String[] args) {
        // 키보드 정수 입력 받아서
        // 1 --> getSQLSelectAll() 실행
        // 2 --> getSQLSelectLike() 실행
        // 2 --> getSQLSelectInsert() 실행
        // 2 --> getSQLSelectUpdate() 실행

        Scanner scanner = new Scanner(System.in);
        int num1 = scanner.nextInt();
        if (num1 == 1) {
            getSQLSelectAll();
        } else if (num1 == 2) {
            getSQLSelectLike("JAVA");
        } else if (num1 == 3) {
            getSQLSelectEqual("JAVA");
        }

    }

    public static ResultSet getSQLSelectAll() {

        Connection conn = DBConnect.makeConnection();

        String query = "SELECT * FROM book ORDER BY bookname ASC "; // SQL 문장 생성

        ResultSet rs = null;
        rs = factor(conn, query, rs);
        
        /*
        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);

            rs = stmt.executeQuery();

            for (; rs.next(); ) {
                int bookid = rs.getInt("bookid");
                String bookname = rs.getString("bookname");
                String publisher = rs.getString("publisher");
                String year = rs.getString("year");
                int price = rs.getInt("price");
                Date dtm = rs.getDate("dtm");
                boolean use_yn = rs.getBoolean("use_yn");

                String out = String.format(" %d \t %15s \t %10s \t %4s \t %7d \t %10s \t %b", bookid, bookname, publisher, year, price, dtm, use_yn);
                System.out.println(out);
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
                */
        return rs;
    }


    public static ResultSet getSQLSelectLike(String a) {

        Connection conn = DBConnect.makeConnection();
        String query = "SELECT * FROM book WHERE bookname LIKE ?"; // SQL 문장 생성

        ResultSet rs = null;
        rs = factor(a, conn, query, rs);
        
        /*
        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);


            stmt.setString(1, "%" + a + "%"); // ? 에 값을 설정하는 부분
            rs = stmt.executeQuery();

            for (; rs.next(); ) {
                int bookid = rs.getInt("bookid");
                String bookname = rs.getString("bookname");
                String publisher = rs.getString("publisher");
                String year = rs.getString("year");
                int price = rs.getInt("price");
                Date dtm = rs.getDate("dtm");
                boolean use_yn = rs.getBoolean("use_yn");

                String out = String.format(" %d \t %15s \t %10s \t %4s \t %7d \t %10s \t %b", bookid, bookname, publisher, year, price, dtm, use_yn);
                System.out.println(out);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        */
        return rs;
    }


    public static ResultSet getSQLSelectEqual(String a) {
        Connection conn = DBConnect.makeConnection();

        String query = "SELECT * FROM book WHERE bookname = ? "; // SQL 문장 생성

        ResultSet rs = null;
        rs = factor(a, conn, query, rs);
        /*
        ResultSet rs = null;
        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);


            stmt.setString(1, a); // ? 에 값을 설정하는 부분
            rs = stmt.executeQuery();
            for (; rs.next(); ) {
            	
                int bookid = rs.getInt("bookid");
                String bookname = rs.getString("bookname");
                String publisher = rs.getString("publisher");
                String year = rs.getString("year");
                int price = rs.getInt("price");
                Date dtm = rs.getDate("dtm");
                boolean use_yn = rs.getBoolean("use_yn");

                String out = String.format(" %d \t %15s \t %10s \t %4s \t %7d \t %10s \t %b", bookid, bookname, publisher, year, price, dtm, use_yn);
                System.out.println(out);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
                    */
        return rs;

    }

    
    static ResultSet factor(Connection conn, String query, ResultSet rs){
        
        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);

            rs = stmt.executeQuery();
            for (; rs.next(); ) {
                int bookid = rs.getInt("bookid");
                String bookname = rs.getString("bookname");
                String publisher = rs.getString("publisher");
                String year = rs.getString("year");
                int price = rs.getInt("price");
                Date dtm = rs.getDate("dtm");
                boolean use_yn = rs.getBoolean("use_yn");

                String out = String.format(" %d \t %15s \t %10s \t %4s \t %7d \t %10s \t %b", bookid, bookname, publisher, year, price, dtm, use_yn);
                System.out.println(out);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
    
    
    static ResultSet factor(String a, Connection conn, String query, ResultSet rs){
        
        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);


            stmt.setString(1, a); // ? 에 값을 설정하는 부분
            rs = stmt.executeQuery();
            for (; rs.next(); ) {
                int bookid = rs.getInt("bookid");
                String bookname = rs.getString("bookname");
                String publisher = rs.getString("publisher");
                String year = rs.getString("year");
                int price = rs.getInt("price");
                Date dtm = rs.getDate("dtm");
                boolean use_yn = rs.getBoolean("use_yn");

                String out = String.format(" %d \t %15s \t %10s \t %4s \t %7d \t %10s \t %b", bookid, bookname, publisher, year, price, dtm, use_yn);
                System.out.println(out);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
/*
    public static ResultSet printResultSet(ResultSet rs) {
        Connection conn = DBConnect.makeConnection();

        String query = "SELECT * FROM book WHERE bookname = ? "; // SQL 문장 생성


        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);


            stmt.setString(1, rs); // ? 에 값을 설정하는 부분
            rs = stmt.executeQuery();
            for (; rs.next(); ) {
                int bookid = rs.getInt("bookid");
                String bookname = rs.getString("bookname");
                Date dtm = rs.getDate("dtm");
                boolean use_yn = rs.getBoolean("use_yn");
                String publisher = rs.getString("publisher");
                String year = rs.getString("year");
                int price = rs.getInt("price");

                String out = String.format(" %d \t %s \t %s \t %s \t %d \t %s \t %b", bookid, bookname, publisher, year, price, dtm, use_yn);
                System.out.println(out);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
*/

/*
    public static ResultSet setSQLInsert(String a) {
        Connection conn = DBConnect.makeConnection();
        // SQL 문장 생성
        String query = " INSERT INTO \n";
        query += " book( bookid, bookname, publisher, year, price, dtm, use_yn, authid) \n";
        query += " VALUES( ? , ? , ? , ? , ? , ? , ? ) \n";


        try {
            PreparedStatement stmt = null; // 문장 객체 생성
            stmt = conn.prepareStatement(query);
            int bookid = stmt.setInt(1, bookid);
            String bookname = stmt.setString(2, bookname);
            String publisher = stmt.setString(3, publisher);
            String year = stmt.setString(4, year);
            int price = stmt.setInt(5, price);
            String dtm = stmt.setString(6, dtm);
            Boolean use_yn = stmt.setBoolean(7, use_yn);
            int authid = stmt.setInt(8, authid);

            // SQL 문장 실행
            int rs = stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
    */
}