package contents;


/**
 * DataProcessor calculates the mean and standard deviation and also sets them in the DataBean.
 */
public class DataProcessor
{
	public int[] dataService(String data)
	{
		String[] processData = data.split(",");
		int[] dataArray = new int[processData.length];
		
		for(int i = 0; i < processData.length ; i++)
		{
			dataArray[i] = Integer.parseInt(processData[i]);
		}
		
		return dataArray;
	}
	
	public float Mean(String dataArray)
	{
		float mean = 0;
		float sum = 0;
		
		try
		{
			int[] data = dataService(dataArray);
			for(int i = 0; i < data.length; i++)
			{
				sum = sum + data[i];
			}
			mean = sum/data.length;
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return mean;
	}
	
	public float standardDeviation(String dataArray,Float mean)
	{
		float standardDev = 0;
		float sum = 0;
		try
		{
			int[] data = dataService(dataArray);
			
			for(int i = 0; i < data.length; i++)
			{
				sum = (float) (sum + Math.pow((data[i] - mean), 2));
			}
			standardDev = (float) Math.sqrt(sum / (data.length));
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return standardDev;
	}
	
	public DataBean setDataBean(String dataArray)
	{
		DataBean databean = new DataBean();
		try
		{
			float mean = Mean(dataArray);
			float standardDeviation = standardDeviation(dataArray, mean);
			databean.setMean(mean);
			databean.setStandardDeviation(standardDeviation);
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return databean;
	}
	
	

}
