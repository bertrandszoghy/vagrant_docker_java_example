package ca.jingju.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ca.jingju.model.Performer;

public class PerformerStub {
	private static Map<Long, Performer> performers = new HashMap<Long, Performer>();
	private static Long idIndex = 3L;

	//populate initial performers
	static {
	/*	Performer a = new Performer(1L, "Li Haiyan", "Cheng School", "actress", 1961, 1993);
		performers.put(1L, a);
		Performer b = new Performer(2L, "Zhang Huoding", "Cheng School", "actress", 1971, 1994);
		performers.put(2L, b);
		Performer c = new Performer(3L, "Li Shengsu", "Mei School", "actress", 1965, 1992);
		performers.put(3L, c);*/
	}

	public static List<Performer> list() {
		return new ArrayList<Performer>(performers.values());
	}

	public static Performer create(Performer wreck) {
		idIndex += idIndex;
		wreck.setId(idIndex);
		performers.put(idIndex, wreck);
		return wreck;
	}

	public static Performer get(Long id) {
		return performers.get(id);
	}

	public static Performer update(Long id, Performer performer) {
		performers.put(id, performer);
		return performer;
	}

	public static Performer delete(Long id) {
		return performers.remove(id);
	}
}
