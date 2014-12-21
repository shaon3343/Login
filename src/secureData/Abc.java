package secureData;

public class Abc{

	private Abc abc = null;
	private Abc(){}
	
	private static Abc a()
	{
		if(abc== null)
		{
			abc = new Abc();
		}
		
		return abc;
	
	}
}


