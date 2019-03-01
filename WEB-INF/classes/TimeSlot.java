public class TimeSlot
{
	private int hr,min;
	public TimeSlot()
	{
		hr=0;min=0;
	}
	public TimeSlot(int hr,int min)
	{
		this.hr=hr;
		this.min=min;
	}
	public TimeSlot(String s)
	{
		String st[]=s.split(":");
		this.hr=Integer.parseInt(st[0]);
		this.min=Integer.parseInt(st[1]);
		//return this;
	}
	public TimeSlot addMinutes(int mm)
	{
		min+=mm;
			while(min>60)
			{
				hr++;
				min-=60;
			}
		return this;
	}
	public TimeSlot addHours(int hh)
	{
		this.hr+=hh;
		return this;
	}
	public int compare(TimeSlot ts)//ts time less returns 1 if equal returns 0 else returns -1
	{
		if(ts.hr>this.hr)
			return -1;
		else if(ts.hr==this.hr)
		{
			if(ts.min>this.min)
				return -1;
			else if(ts.min==this.min)
				return 0;
			else
				return 1;
		}
		else
			return 1;
	}
	public TimeSlot add(int hh,int mm)
	{
		this.hr+=hh;
		this.min+=mm;
		while(min>60)
		{
			hr++;
			min-=60;
		}
		return this;
	}
	public TimeSlot add(TimeSlot ts)
	{
		this.hr+=ts.hr;
		this.min+=ts.min;
		while(min>60)
		{
			hr++;
			min-=60;
		}
		return this;
	}
	public String getTime()
	{
		return ""+hr+":"+min;
	}
}