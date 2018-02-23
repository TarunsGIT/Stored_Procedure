package ad.infosys.com.storedprocedure.employee;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeByDepartment implements AutoCloseable {

	public static Connection getConnection() throws ClassNotFoundException,
			SQLException {

		Class.forName("com.mysql.jdbc.Driver");

		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employee_dept", "root", "root");
		System.out.println("1.CONNECTION CREATED");

		return conn;

	}

	public static void closeConnection(Connection conn) throws SQLException {

		if (conn != null) {
			System.out.println("2.CONNECTION CLOSED");
			conn.close();
		}

	}

	public static void getEmployeeByDepart(int dept_ID) {

		String query = "{ call get_employee(?) }";

		ResultSet rs;
		try (Connection conn = getConnection();
				CallableStatement cstmt = conn.prepareCall(query);) {

			cstmt.setInt(1, dept_ID);
			rs = cstmt.executeQuery();

			if (rs.getFetchSize() == 0) {
				System.out
						.println("NO EMPLOYEE FOUND AGAINST THIS DEPARTMENT ID");
			} else {

				while (rs.next()) {
					System.out.println(rs.getInt("Employee_ID") + " "
							+ rs.getString("Employee_FIRST_NAME") + " "
							+ rs.getString("Employee_LAST_NAME") + " "
							+ rs.getInt("Employee_SALARY") + " "
							+ rs.getString("Employee_ADDRESS"));

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// closeConnection(conn);
		}

	}

	public static void main(String[] args) {

		getEmployeeByDepart(5);

	}

	@Override
	public void close() throws Exception {

	}

}
