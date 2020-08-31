package lt.bit.springdienynas.dao;

import lt.bit.springdienynas.data.Pazymiai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PazymiaiDAO extends JpaRepository<Pazymiai, Integer> {

    @Query(value = "select avg(pazymys) from Pazymiai")
    public Double avg();

}
