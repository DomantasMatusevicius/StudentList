package lt.bit.springdienynas.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

//** Klasė skirta pažymių lentelės modeliui sukurti *//

@Entity
@Table(name = "pazymiai")
@NamedQueries({
        @NamedQuery(name = "Pazymiai.findAll", query = "SELECT t FROM Pazymiai t")})
public class Pazymiai implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "studentas_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Studentas studentas;
    @Column(name = "data")
    @Temporal(TemporalType.DATE)
    private Date data;
    @Column(name = "pazymys")
    private Integer pazymys;

    @Override
    public String toString() {
        return pazymys + "";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Studentas getStudentas() {
        return studentas;
    }

    public void setStudentas(Studentas studentas) {
        this.studentas = studentas;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Integer getPazymys() {
        return pazymys;
    }

    public void setPazymys(Integer pazymys) {
        this.pazymys = pazymys;
    }
}
