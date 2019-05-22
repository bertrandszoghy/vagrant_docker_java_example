package ca.jingju.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ca.jingju.model.Performer;
import ca.jingju.repository.PerformerRepository;

@RestController
@RequestMapping("api/v1")
public class PerformerController {
	
	@Autowired
	private PerformerRepository performerRepository;
	
	@RequestMapping(value = "performers", method = RequestMethod.GET)
	public List<Performer> list() {
		//return PerformerStub.list();
		return performerRepository.findAll();
	}
	
	@RequestMapping(value = "performers", method = RequestMethod.POST)
	public Performer create(@RequestBody Performer performer) {
		//return PerformerStub.create(performer);
		return performerRepository.saveAndFlush(performer);
	}
	
	@RequestMapping(value = "performers/{id}", method = RequestMethod.GET)
	public Performer get(@PathVariable Long id) {
		//return PerformerStub.get(id);
		return performerRepository.findOne(id);
	}
	
	@RequestMapping(value = "performers/{id}", method = RequestMethod.PUT)
	public Performer update(@PathVariable Long id, @RequestBody Performer performer) {
		//return PerformerStub.update(id, performer);
		Performer existingPerformer = performerRepository.findOne(id);
		BeanUtils.copyProperties(performer, existingPerformer);
		return performerRepository.saveAndFlush(existingPerformer);
	}
	
	@RequestMapping(value = "performers/{id}", method = RequestMethod.DELETE)
	public Performer delete(@PathVariable Long id) {
		//return PerformerStub.delete(id);
		Performer existingPerformer = performerRepository.findOne(id);
		performerRepository.delete(existingPerformer);
		return existingPerformer;
	}
}
