package lt.bit.springdienynas.dao;

import lt.bit.springdienynas.data.Studentas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StudentasDAO extends JpaRepository<Studentas, Integer> {

    @Query("select t from Studentas t order by t.pavarde asc, t.vardas asc")
    public List<Studentas> sortedList();


}
