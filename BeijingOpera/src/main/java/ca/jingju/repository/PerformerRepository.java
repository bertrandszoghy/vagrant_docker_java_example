package ca.jingju.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ca.jingju.model.Performer;

public interface PerformerRepository extends JpaRepository<Performer, Long> {

	

}
