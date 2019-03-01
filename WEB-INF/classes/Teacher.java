public class Teacher
{
	static int count=0;
	String id;
	int desig;
	int fp[];
	int ecount=0,execount=0;
	boolean ar;
	/*public void read(int np)
	{
		//System.out.println("tc:"+count+" \n");
		id=++count;
		//System.out.println("tc:"+id+" \n");
		fp=new int[np+1];
		Scanner sc=new Scanner(System.in);
		System.out.print("enter schedule for "+id+" :\n1.Lab 1\t2.Class\t3.Lab 2\t4.Free\n");
		String temp[]=sc.nextLine().split(",");
		for(int i=0;i<temp.length;i++)
		{
			int t=Integer.parseInt(temp[i]);
			if(t<=0||t>4)
			{
				//System.out.println("Enter a valid hour in place of "+t+" : ");
				t=sc.nextInt();
			}
			fp[i+1]=t;
		}
		//System.out.println("Enter designation:\n1.HOD\t2.Asst professor\t3.snr faculty\t");
		desig=sc.nextInt();
	}*/
	public int[] getFreePeriods()
	{
		return fp;
	}
	public int isFree(int sp,int ep)
	{
		int test=0;
		for(int i=sp;i<=ep;i++)
			if(fp[i]==4)
			{
				test+=1;
			}
		return test;
	}
	public int isLab2(int sp,int ep)
	{
		int test=0;
		for(int i=sp;i<=ep;i++)
			if(fp[i]==3)
			{
				test+=1;
			}
		return test;
	}
	public int isClass(int sp,int ep)
	{
		int test=0;
		for(int i=sp;i<=ep;i++)
			if(fp[i]==2)
			{
				test+=1;
			}
		return test;
	}
}