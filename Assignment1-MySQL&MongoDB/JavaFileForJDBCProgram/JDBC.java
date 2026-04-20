import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBC {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/guvi_db";
        String user = "root";
        String password = "guvimysql@2026";

        try {
            // Step 1: Establish Connection
            Connection con = DriverManager.getConnection(url, user, password);

            System.out.println("Connected to DB!");

            // Step 2: Prepare Query
            String query = "INSERT INTO employee_jdbc VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            Object[][] data = {
                    {101, "Jenny", 25, 10000},
                    {102, "Jacky", 30, 20000},
                    {103, "Joe", 20, 40000},
                    {104, "John", 40, 80000},
                    {105, "Shameer", 25, 90000}
            };

            for (Object[] row : data) {
                ps.setInt(1, (int) row[0]);
                ps.setString(2, (String) row[1]);
                ps.setInt(3, (int) row[2]);
                ps.setDouble(4, (int) row[3]);
                ps.addBatch();
            }

            ps.executeBatch();

            System.out.println("Data inserted successfully!");

            String selectQuery = "SELECT * FROM employee_jdbc";
            PreparedStatement ps2 = con.prepareStatement(selectQuery);

            ResultSet rs = ps2.executeQuery();


            System.out.println("\nEmployee Data:");
            System.out.println("-----------------------------");

            while (rs.next()){
                int id = rs.getInt("empcode");
                String name = rs.getString("empname");
                int age = rs.getInt("empage");
                double salary = rs.getDouble("salary");

                System.out.println(id + " | " + name + " | " + age + " | " + salary);
            }


            // Step 5: Close everything
            rs.close();
            ps.close();
            ps2.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
