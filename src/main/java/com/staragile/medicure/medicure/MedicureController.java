package com.staragile.medicure.medicure;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MedicureController {

    @Autowired
    MedicureService BankingSvc;

    @RequestMapping("hello")
    public String doSomething() {
        return "Hello World";
    }
    
    @RequestMapping("/seeddata")
	public String getBanking(){
		System.out.println("Inside seeddata");
		Medicure p1 = new Medicure("1", "ameen", "Ameen Address", "9876543210");
		BankingSvc.addAccounts(p1);
		
		p1 = new Medicure("2", "naseef", "Naseef Address", "1234567893");
		BankingSvc.addAccounts(p1);
		return "Data seeded successfully!!!";
    }    
    
    

    @RequestMapping("/Doctor/{id}")
    public Optional<Medicure> getBanking(@PathVariable String id) {
        System.out.println("Inside getBanking");
        return BankingSvc.getBanking(id);
    }

    @RequestMapping("/Doctor")
    public List<Medicure> getPolicies() {
        return BankingSvc.getBanking();
    }

    @RequestMapping(method = RequestMethod.POST, value = "/Banking")
    public String addBanking(@RequestBody Medicure Banking) {
        BankingSvc.addAccounts(Banking);
        return "Successfully added!!";
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/Doctor/{id}")
    public String updateBanking(@RequestBody Medicure Banking, @PathVariable String id) {
        BankingSvc.updateAccounts(id, Banking);
        return "Updated successfully";
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/Doctor/{id}")
    public String deleteBanking(@PathVariable String id) {
        BankingSvc.deleteAccounts(id);
        return "Updated successfully";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/Doctor/{id}")
    public Optional<Medicure> getBankingById(@PathVariable String id) {
        System.out.println("Inside getBankingById");
        return BankingSvc.getBanking(id);
    }
}
