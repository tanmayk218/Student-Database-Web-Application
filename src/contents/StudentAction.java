package contents;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


public class StudentAction
{

	private String stid;
	private String name;
	private String straddr;
	private String city;
	private String state;
	private String zip;
	private String tel;
	private String email;
	private String url;
	private String date;
	private String months;
	private String year;
	private String reco;
	private String adcom;
	private String learn;
	private String likeUni;
	private String data;
	private String studentlinks;
	private StudentBean studentBean;
	
	String connectionString = "jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g";
	String userName = "tkharshi";
	String password = "stywer";
	
	
	public String getStid() {
		return stid;
	}
	public void setStid(String stid) {
		this.stid = stid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStraddr() {
		return straddr;
	}
	public void setStraddr(String straddr) {
		this.straddr = straddr;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getReco() {
		return reco;
	}
	public void setReco(String reco) {
		this.reco = reco;
	}
	public String getAdcom() {
		return adcom;
	}
	public void setAdcom(String adcom) {
		this.adcom = adcom;
	}
	public String getLearn() {
		return learn;
	}
	public void setLearn(String learn) {
		this.learn = learn;
	}
	public String getLikeUni() {
		return likeUni;
	}
	public void setLikeUni(String likeUni) {
		this.likeUni = likeUni;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getStudentlinks() {
		return studentlinks;
	}
	public void setStudentlinks(String studentlinks) {
		this.studentlinks = studentlinks;
	}
	public StudentBean getStudentBean() {
		return studentBean;
	}
	public void setStudentBean(StudentBean studentBean) {
		this.studentBean = studentBean;
	}


	
	protected Connection createDbConnection(String connectionString, String userName, String password) 
	{
			Connection con = null;
			System.out.println("------Creating Oracale DB connection-------");
			try 
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(connectionString, userName, password);
			} 
			catch (Exception e) 
			{
				System.out.println("------Error connecting-------");
				e.printStackTrace();
			} 
			return con;
	}

	
	public void InsertStudentDetails(String connectionString,String userName,String password)
	{
		Connection conn = null;
		String insertQuery = "";
		System.out.println("-----------------In InsertStudentDetails function-------------------");

		try
		{
			conn = createDbConnection(connectionString, userName, password);
			/*String studentlike = "student";
			String studentunvi = "friends";*/
			insertQuery = "insert into swe642_UserDetails "
						+ "VALUES('"+stid+"','"+name+"',"
						+ "'"+straddr+"','"+zip+"','"+city+"','"+state+"',"
						+ "'"+tel+"','"+email+"','"+url+"','"+date+"',"
						+ "'"+likeUni+"','"+learn+"','"+adcom+"','"+months+"',"
						+ "'"+year+"','"+reco+"')";
			
			System.out.println("Insert Query is-----"+insertQuery);
			PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
			preparedStatement.executeUpdate();	
		}
		catch(Exception e)
		{
			System.out.println("-----Error in InsertStudentDetails Function------");
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
				System.out.println("------Error closing connection in InsertStudentDetails Function------");
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
		System.out.println("-----------------In getStudentID function-------------------");

		
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
			System.out.println("ArrayList is--"+studentIDList.toString()+"---Length--"+studentIDList.size());

		}
		catch(Exception e)
		{
			System.out.println("-------Exception in getStudentID method------");

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
				System.out.println("------Error closing connection in getStudentID Function------");

				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return studentIDList;
	}

		public StudentBean getStudentDetails(String stID,String connectionString,String userName,String password)
		{
			StudentBean studentBean = new StudentBean();
			Connection conn = null;
			String getStudentDetailsQuery = "";
			Statement statement = null;
			System.out.println("-----------------In getStudentDeatils function-------------------");
			System.out.println("Student ID in getAllStudentDeatils**********"+stID);
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
				System.out.println("-------Error in getStudentDeatils------");

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
					System.out.println("------Error closing connection in getStudentDeatils Function------");

					e.printStackTrace();
				}
			}
			return studentBean;
		}
	
		
		
		/**
		 * overriden execute() method to fill the form.
		 */
		public String fillStudentDetails()
		{
			String result = "";
			DataProcessor dataPro = new DataProcessor();
			ArrayList<String> getStudentIDs = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DataBean databean = new DataBean();
			System.out.println("--------- In StudentAction -----------");
			databean = dataPro.setDataBean(data);
			float mean = databean.getMean();
			
			if(mean > 90.0)
			{
				result = "winner";
			}
			else
			{
				result = "simple";
			}
			
			InsertStudentDetails(connectionString, userName, password);
			getStudentIDs =  getStudentID(connectionString, userName, password);
			
			System.out.println("---Student List is-----"+getStudentIDs.toString());
			System.out.println("---Student List Length-----"+getStudentIDs.size());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("studentIDList", getStudentIDs);
			session.setAttribute("dataBean", databean);
			
			return result;
		}	
		
		
		public String getStudentDetails()
		{
			String result = "";
			StudentBean studentBean = new StudentBean();
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			System.out.println("--------- In getStudentDetailsAction -----------");
			String clickedStudID = getStudentlinks();
			System.out.println("StudentID in getStudentDeatils----->"+clickedStudID);
			
			if(clickedStudID != null && clickedStudID != "")
			{
				result = "studentdetails";
				studentBean = getStudentDetails(clickedStudID, connectionString, userName, password);
				session.setAttribute("studentDetailsBean", studentBean);
				request.setAttribute("studentID", studentlinks);
			}
			else
			{
				result = "nosuchstudent";
			}
			return result;
		}
		
		public static void main(String[] args) 
		{
			// TODO Auto-generated method stub

		}
		
}
