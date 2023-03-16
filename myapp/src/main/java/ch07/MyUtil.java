package ch07;
import javax.servlet.http.HttpServletRequest;

public class MyUtil {
	public static int pareInt(HttpServletRequest request,
			String name) {
		return Integer.parseInt(request.getParameter(name));
	}
}
