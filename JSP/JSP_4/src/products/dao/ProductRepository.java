package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts= new ArrayList<>();
	
	public ProductRepository() {
		
		Product phone = new Product("P1234", "Galaxy S22", 1200000);
		phone.setDescription("5.25-inch,1334*750 HD display, 16mega-pixel Camera");
		phone.setCategory("SmartPhone");
		phone.setMenufacturer("SamSung");
		phone.setUnitsInStock(1000);
		phone.setCondition("NEW");
		
		Product notebook = new Product("N1235", "LG GRAM", 2000000);
		notebook.setDescription("13.3-inch,IPS FULL HD display, Intel Core Processor");
		notebook.setCategory("Notebook");
		notebook.setMenufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbulished");
		
		Product tablet = new Product("T1236", "Galaxy", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,Super AMOLED display, Octa-Core Processor");
		tablet.setCategory("Tablet");
		tablet.setMenufacturer("APPLE");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
}
