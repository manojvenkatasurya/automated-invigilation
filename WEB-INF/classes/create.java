import java.sql.*;
import java.util.*;
public class create
{
	public void create_tab()
	{
		try
		{
		Connection cc=connect.getConnection();
		Statement st=cc.createStatement();
		ResultSet rs=st.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='test' ");
		rs.last();
		int nt=rs.getRow();
		if(nt<=0)
		{
			st.executeUpdate("create table allocation(emp_id varchar(20),e_name varchar(50),date varchar(10),start_time varchar(10),end_time varchar(10))");
			st.executeUpdate("create table exam(slno int(11) primary key,exam_name varchar(50),year int(11),type int(11),nd int(11),start_time varchar(9),end_time varchar(9))");
			st.executeUpdate("create table exam_data(name varchar(50),year int(11),date varchar(10),nt int(11),checked int(11))");
			st.executeUpdate("create table exam_dup(name varchar(50),year int(11),date varchar(10),nt int(11),checked int(11))");
			st.executeUpdate("create table records(emp_id varchar(20),e_name varchar(50),date varchar(10),start_time varchar(10),end_time varchar(10),type int(11))");
			st.executeUpdate("create table periods(p_name varchar(9),start_time varchar(5),end_time varchar(5))");
			st.executeUpdate("create table teacher(emp_id varchar(50) primary key,name varchar(50),count int(11),designation int(11),email_id varchar(20),contact varchar(13),ec int(11))");
			st.executeUpdate("create table validate(name varchar(18),password varchar(25))");
			PreparedStatement ps=cc.prepareStatement("insert ignore into validate values('admin','admin')");
			ps.execute();
			ps=cc.prepareStatement("insert ignore into validate values('teacher','teacher')");
			ps.execute();
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}