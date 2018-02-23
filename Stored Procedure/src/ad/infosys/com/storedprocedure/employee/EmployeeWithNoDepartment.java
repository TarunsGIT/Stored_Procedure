package ad.infosys.com.storedprocedure.employee;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeWithNoDepartment {

	public static Connection getConnection() throws ClassNotFoundException,
			SQLException, InstantiationException, IllegalAccessException {

		Class.forName("com.mysql.jdbc.Driver").newInstance();

		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employee_dept", "root", "root");
		System.out.println("1.CONNECTION CREATED");

		return conn;

	}

	public static void getEmployeeWithNoDepartment()
			throws InstantiationException, IllegalAccessException {

		String query = "{ call get_no_department_employee() }";
		ResultSet rs;
		try (Connection conn = getConnection();
				CallableStatement cstmt = conn.prepareCall(query);) {

			rs = cstmt.executeQuery();

			if (rs.getFetchSize()<0) {
				System.out.println("All Employee belong to some department");
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
		}

	}

	public static void main(String[] args) throws InstantiationException,
			IllegalAccessException {

		getEmployeeWithNoDepartment();

	}

}
