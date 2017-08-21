package P0314_Exer;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Map1 {
	public static void main(String[] args) {
		Map<String, String> m1 = new HashMap<>();
		m1.put("001", "ÃÖÀ±¿µ");
		m1.put("002", "¶Ë½Î°³");
		m1.put("003", "±Ã´óÀÌ");
		m1.put("001", "Ä¼Ä¼Ä¼Ä¼Ä¼Ä¼Ä¼"); // ¶È°°Àº Å° ¿¬½À (±âÁ¸ °ªÀ» »õ·Î¿î °ªÀ¸·Î ´ëÃ¼ÇÏ¿© Ä¼Ä¼Ä¼ Ãâ·Â)
		
		System.out.println(m1.size());
		System.out.println(m1.get("001"));
		
		Set<String> m2 = m1.keySet();
		Iterator<String> iter1 = m2.iterator();
		while(iter1.hasNext()){
			String mm1 = iter1.next();
			mm1.get
			System.out.println(mm1);
		}

		
		System.out.println(m1.keySet());
		System.out.println(m1.values());
		System.out.println(m1);
	}
}
