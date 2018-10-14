package com.lazz.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.lazz.utils.ValueO;

@Service
public class UtilityServiceImpl implements UtilityService{

	@Override
	public List<ValueO> getMalaysiaStates() {
		List<ValueO> states = new ArrayList<ValueO>();
		ValueO val = null;
		
		val = new ValueO();
		val.setKey("Pahang");
		val.setValue("Pahang");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Selangor");
		val.setValue("Selangor");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Kuala Lumpur");
		val.setValue("Kuala Lumpur");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Putrajaya");
		val.setValue("Putrajaya");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Perak");
		val.setValue("Perak");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Johor");
		val.setValue("Johor");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Terengganu");
		val.setValue("Terengganu");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Kelantan");
		val.setValue("Kelantan");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Perlis");
		val.setValue("Perlis");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Kedah");
		val.setValue("Kedah");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Sabah");
		val.setValue("Sabah");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Sarawak");
		val.setValue("Sarawak");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Negeri Sembilan");
		val.setValue("Negeri Sembilan");
		states.add(val);
		
		val = new ValueO();
		val.setKey("Labuan");
		val.setValue("Labuan");
		states.add(val);
		
		return states;
	}

}
