package com.ruby.contact.util;

import java.util.ArrayList;
import java.util.List;

import com.ruby.contact.domain.Contact;
import com.ruby.contact.domain.ContactList;

public class SampleDAO {
	private static String namelist = 
			"원형섭,이선영,원채빈,원재현,김수현,송중기,송혜교,김지원,조진웅,박해진,진구,설현,하니,소진,혜리";
	private static List<Contact> contacts;
	private static long nextNo = 0;
	
	static {
		//데이터 초기화
		String[] names = namelist.split(",");
		contacts = new ArrayList<Contact>();
		for (int i=0; i < names.length; i++) {
			nextNo++;
			String tel = "010-2121-33" + (i+10);
			Contact c = new Contact(nextNo, names[i], tel, "서울시");
			contacts.add(0,c);
		}
	}

	public static ContactList getContacts() {
		ContactList cList =  new ContactList(0, 0, contacts.size(), contacts);
		return cList;
	}

	public static ContactList getContacts(int pageno, int pagesize) {
		int startIndex = (pageno-1) * pagesize;
		int endIndex = startIndex+pagesize-1;
				
		List<Contact> temps = null;
		if (startIndex > contacts.size()-1 || startIndex < 0 || pagesize < 1) {
			temps = new ArrayList<Contact>();
		} else  {
			if (endIndex > contacts.size() - 1){
				endIndex = contacts.size() - 1;
			}
			temps = contacts.subList(startIndex, endIndex+1);
		}

		ContactList cList = new ContactList(pageno, pagesize, contacts.size(), temps);
		return cList;
	}
	
	public static void addContact(Contact c) {
		nextNo++;
		c.setNo(nextNo);
		contacts.add(0, c);
	}
	
	public static int deleteContact(long no) {
		int count = 0;
		for (int i=0; i < contacts.size(); i++) {
			Contact c = contacts.get(i);
			if (c.getNo() == no) {
				contacts.remove(i);
				count++;
				break;
			}
		}
		return count++;
	}
	
	public static int updateContact(Contact c1) {
		long no = c1.getNo();
		int count = 0;
		for (int i=0; i < contacts.size(); i++) {
			Contact c = contacts.get(i);
			if (c.getNo() == no) {
				contacts.set(i, c1);
				count++;
				break;
			}
		}
		return count++;
	}

	public static int updateBatch(ContactList  contactList) {
		int count = 0;
		List<Contact> list = contactList.getContacts();
		if (list.size() > 0) {
			for (Contact c : list) {
				SampleDAO.updateContact(c);
				count++;
			}
		}
		return count;
	}
	
	public static Contact getContactByNo(long no) {
		Contact c = null;
		for (int i=0; i < contacts.size(); i++) {
			Contact temp = contacts.get(i);
			if (temp.getNo() == no) {
				c = temp;
				break;
			}
		}
		return c;
	}
}
