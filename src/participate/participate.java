package participate;

import java.sql.Connection;
import java.sql.DriverManager;

public class participate {

	public static void main(String[] args) {
		Connection con = null;
		
		String className="org.gjt.mm.mysql.Driver";
		String url ="jdbc:mysql://localhost:3306/shxdb?useSSL=false&useUnicode=true&characterEncoding=euckr";
		String user ="root2";
		String passwd ="1120";
		
		try {
			Class.forName(className);
			con=DriverManager.getConnection(url, user, passwd);
			System.out.println("Connect Success!");
		} catch(Exception e) {
			System.out.println("Connect Failed!");
			e.printStackTrace();
		} finally {
			try {
				if(con!=null && !con.isClosed()) {
					con.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
				
		// TODO Auto-generated method stub

	}

}
