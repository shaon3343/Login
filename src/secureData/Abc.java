package secureData;

public class Abc{

	// whats wrong with this code ?? 
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


/**************


see answer below:



/*********************
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
























Inside static block variables should be static too. 
Solution: make abc static on line 6  

****************************/