package com.example.aspect;

import com.example.test.SpecialPerson;

public aspect ItdAspect {
	
	private int SpecialPerson.age;
	
	pointcut newToString(SpecialPerson p): target(p) && call(String SpecialPerson.toString());
	pointcut myts(SpecialPerson p) : target(p) && call(String SpecialPerson.toString());
	pointcut mys(SpecialPerson p) : call(void SpecialPerson.setName(*)) && target(p);
	
	before(SpecialPerson p): myts(p) {
		System.out.println("tostring");
	}
	before(SpecialPerson p): mys(p) {
		System.out.println("set");
	}
	
	String around(SpecialPerson p): newToString(p) {
		String def=proceed(p);
		return def+" "+Integer.toString(p.age);
	}

}
