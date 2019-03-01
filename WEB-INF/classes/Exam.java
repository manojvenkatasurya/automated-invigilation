public class Exam
{
	String name,date;
	Period p[];
	static TimeSlot st,et;
	String allocate[];
	private int sp,ep;
	int rin,c;
	int eType;
		//sp=start period
		//ep=end period
	/*public void read()
	{
		Scanner sc=new Scanner(System.in);
		//System.out.println("enter time in hh:mm format\n\nenter starting and ending time of exam:");
		String sst=sc.next(),set=sc.next();
		st=new TimeSlot(sst);
		et=new TimeSlot(set);
		//System.out.println("1.Internal\t2.External\n");
		eType=sc.nextInt();
		readInvis();
	}*/
	public Teacher[] getSorted(Teacher [] data)
	{
		Teacher temp,t[]=data;
		for(int i=1;i<t.length;i++)
			for(int j=i+1;j<t.length;j++)
			{
				if(t[i].ecount>t[j].ecount)
				{
					temp=t[i];
					t[i]=t[j];
					t[j]=temp;
				}
			}
		return t;
	}
	public Teacher[] exgetSorted(Teacher [] data)
	{
		Teacher temp,t[]=data;
		for(int i=1;i<t.length;i++)
			for(int j=i+1;j<t.length;j++)
			{
				if(t[i].execount>t[j].ecount)
				{
					temp=t[i];
					t[i]=t[j];
					t[j]=temp;
				}
			}
		return t;
	}
	
	/*public void readInvis()
	{
		Scanner sc=new Scanner(System.in);
		//System.out.println("Enter req no of invisilators:");
		rin=sc.nextInt();
		allocate=new Teacher[rin+1];
		c=rin;
	}*/
	public void calculateExamPeriods(Period p[])
	{
		//finding starting period
		int np=p.length-1;
		for(int i=1;i<=np;i++)
		{
			int t=st.compare(p[i].st);
		//System.out.println(t);
			if(t==-1)
			{
				sp=i-1;
				//System.out.println("sp:"+sp+"i:"+i);
				break;
			}
			else if(t==0)
			{
				sp=i;
				//System.out.println("sp:"+sp+"i:"+i);
				break;
			}
		}
		for(int i=sp;i<=np;i++)
		{
			//System.out.println("sp:"+sp+"i:"+i);
			int t=et.compare(p[i].et);
			if(t==-1||t==0)
			{
				ep=i;
				break;
			}
		}
	}
	public int getStartPeriod()
	{
		return sp;
	}
	public int getEndPeriod()
	{
		return ep;
	}
}