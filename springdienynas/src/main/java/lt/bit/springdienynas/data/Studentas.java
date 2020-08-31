package lt.bit.springdienynas.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

//** Klasė skirta studentų lentelės modeliui sukurti *//

@Entity
@Table(name = "studentai")
@NamedQueries({
    @NamedQuery(name = "Studentas.findAll", query = "SELECT t FROM Studentas t")})
public class Studentas implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "vardas")
    private String vardas;
    @Basic(optional = false)
    @Column(name = "pavarde")
    private String pavarde;
    @Basic(optional = false)
    @Column(name = "el_pastas")
    private String elPastas;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentas")
    private List<Pazymiai> pazymiaiListas;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVardas() {
        return vardas;
    }

    public void setVardas(String vardas) {
        this.vardas = vardas;
    }

    public String getPavarde() {
        return pavarde;
    }

    public void setPavarde(String pavarde) {
        this.pavarde = pavarde;
    }

    public String getElPastas() {
        return elPastas;
    }

    public void setElPastas(String elPastas) {
        this.elPastas = elPastas;
    }

    public List<Pazymiai> getPazymiaiList() {
        return pazymiaiListas;
    }

    public void setPazymiaiList(List<Pazymiai> pazymiaiList) {
        this.pazymiaiListas = pazymiaiList;
    }
}
