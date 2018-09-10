package contents;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;




/**
 * StudentDAO inserts data into the database and also retrieves the data
 * */
public class StudentDAO 
{
	protected Connection createDbConnection(String connectionString, String userName, String password) 
	{
			Connection con = null;
			try 
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(connectionString, userName, password);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			} 
			return con;
	}
	
	public void InsertStudentDetails(StudentBean student,String connectionString,String userName,String password)
	{
		Connection conn = null;
		String insertQuery = "";
	
		try
		{
			conn = createDbConnection(connectionString, userName, password);
			/*String studentlike = "student";
			String studentunvi = "friends";*/
			insertQuery = "insert into swe642_UserDetails "
						+ "VALUES('"+student.getStid()+"','"+student.getName()+"',"
						+ "'"+student.getStraddr()+"','"+student.getZip()+"','"+student.getCity()+"','"+student.getState()+"',"
						+ "'"+student.getTel()+"','"+student.getEmail()+"','"+student.getUrl()+"','"+student.getDate()+"',"
						+ "'"+student.getLikeUni()+"','"+student.getLearn()+"','"+student.getAdcom()+"','"+student.getMonths()+"',"
						+ "'"+student.getYear()+"','"+student.getReco()+"')";
			
			
			PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
			preparedStatement.executeUpdate();	
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				conn.close();
			} 
			catch(SQLException e) 
			{
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<String> getStudentID(String connectionString,String userName,String password)
	{
		Connection conn = null;
		String getStudentIDQuery = "";
		Statement statement = null;
		ArrayList<String> studentIDList = new ArrayList<String>();
		String studentID = "";
		
		
		try
		{
			conn = createDbConnection(connectionString, userName, password);
			statement = conn.createStatement();
			getStudentIDQuery = "SELECT DISTINCT(STUDENTID) FROM SWE642_USERDETAILS ORDER BY STUDENTID ASC";
			ResultSet resultset = statement.executeQuery(getStudentIDQuery);
			while(resultset.next())
			{
				studentID = resultset.getString("STUDENTID");
				studentIDList.add(studentID);
			}
			resultset.close();
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		finally
		{
			try 
			{
				conn.close();
			} 
			catch(SQLException e) 
			{
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return studentIDList;
	}
	
	public StudentBean getStudentDeatils(String stID,String connectionString,
											String userName,String password)
	{
		StudentBean studentBean = new StudentBean();
		Connection conn = null;
		String getStudentDetailsQuery = "";
		Statement statement = null;
		
		try
		{
			conn = createDbConnection(connectionString, userName, password);
			statement = conn.createStatement();
			getStudentDetailsQuery = "SELECT * FROM SWE642_USERDETAILS WHERE STUDENTID=\'" + stID + "\'";
			ResultSet resultset = statement.executeQuery(getStudentDetailsQuery);
			while(resultset.next())
			{
				studentBean.setStid(stID);
				studentBean.setName(resultset.getString("Username"));
				
				studentBean.setStraddr(resultset.getString("Street_Address"));
				studentBean.setZip(resultset.getString("ZipCode"));
				studentBean.setCity(resultset.getString("CITY"));
				studentBean.setState(resultset.getString("STATE"));
				studentBean.setTel(resultset.getString("Telephone_No"));
				studentBean.setEmail(resultset.getString("EMAILID"));
				studentBean.setMonths(resultset.getString("MonthOfGraduation"));
				studentBean.setYear(resultset.getString("YearOfGraduation"));
				studentBean.setUrl(resultset.getString("URL"));
				studentBean.setDate(resultset.getString("DATEOFSURVEY"));
				studentBean.setReco(resultset.getString("RECOMMEND"));
				studentBean.setLearn(resultset.getString("LearnAbtUni"));
				studentBean.setLikeUni(resultset.getString("LikeTheMost"));
				studentBean.setAdcom(resultset.getString("ADDITIONALCOMMENTS"));
					  
			}
			resultset.close();
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				conn.close();
			} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
		}
		return studentBean;
	}
	
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		StudentDAO sd = new StudentDAO();
		sd.getStudentID("jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g", "tkharshi", "stywer");
	}

}
