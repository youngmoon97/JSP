package myapp2;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class MyUtil {
	public static String getMoneyForm(String str) {
		BigDecimal bigDecimal = new BigDecimal(str);
        DecimalFormat format = new DecimalFormat("###,###"); //포맷팅
        String returnStr = format.format(bigDecimal);
		
        /*String won;
		double bb = Double.parseDouble(b);
		won = NumberFormat.getIntegerInstance().format(bb);
		return won;*/
        
		return returnStr;
		
	}
}
