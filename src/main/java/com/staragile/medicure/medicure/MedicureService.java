package com.staragile.medicure.medicure;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MedicureService {
	

	@Autowired
	medicureDAORepository bankingDAORepository;

	public List<Medicure> getBanking(){
		
		
		List<Medicure> bankingList = new ArrayList<Medicure>();
		bankingDAORepository.findAll().forEach(bankingList::add);
		return bankingList;
	}
	
	public Optional<Medicure> getBanking(String id) {
		return bankingDAORepository.findById(id);
	}
	
	public void addAccounts(Medicure banking) {
		bankingDAORepository.save(banking);
	}
	
	public void updateAccounts(String id, Medicure banking) {
		bankingDAORepository.save(banking);
	}
	
	public void viewAccounts(String id, Medicure banking) {
		bankingDAORepository.save(banking);
	}
	
	public void deleteAccounts(String id) {
		bankingDAORepository.deleteById(id);
	}
	
}
