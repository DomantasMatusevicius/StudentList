package lt.bit.springdienynas.controllers;

import lt.bit.springdienynas.dao.PazymiaiDAO;
import lt.bit.springdienynas.dao.StudentasDAO;
import lt.bit.springdienynas.data.Studentas;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

//** Ši klasė kartu su failais studentaiList.jsp, studentaiEdit.jsp bei vidurkis.jsp yra skirta gauti studentų listą iš
// duomenų bazės bei juos atvaizduoti naudojantis MVC. */


@Controller
public class StudentasController {

    @Autowired
    private StudentasDAO studentasDAO;

    @Autowired
    private PazymiaiDAO pazymiaiDAO;

    //** Metodas skirtas studentų sąrašo atvaizdavimui *//

    @GetMapping("/")
    public ModelAndView studentaiList() {
        ModelAndView mav = new ModelAndView("studentaiList");
        mav.addObject("list", studentasDAO.sortedList());
        return mav;
    }

    //** Metodas skirtas studentų vidurkio atvaizdavimui kitame puslapyje *//

    @GetMapping("vidurkis")
    public ModelAndView vidurkis() {
        ModelAndView mav = new ModelAndView("vidurkis");
        mav.addObject("vidurkis", pazymiaiDAO.avg());
        System.out.println(pazymiaiDAO.avg());
        return mav;
    }

    //** Metodas skirtas sukurti naują studentą arba pakoreguoti esamo studento duomenims *//

    @GetMapping("/studentaiEdit")
    public ModelAndView studentaiEdit(@RequestParam(name = "id", required = false) Integer id) {
        ModelAndView mav = new ModelAndView("studentaiEdit");
        if (id != null) {
            Studentas value = studentasDAO.getOne(id);
            mav.addObject("value", value);
        }
        return mav;
    }

    //** Metodas skirtas užsaugoti bei išsiųsti POST requestą saugojant studento duomenis *//

    @PostMapping("studentasSave")
    public String studentasSave(
            @RequestParam(name = "id", required = false) Integer id,
            @RequestParam(name = "vardas") String vardas,
            @RequestParam(name = "pavarde") String pavarde,
            @RequestParam(name = "elPastas") String elPastas
            ) {
        Studentas value;
        if (id != null) {
            value = studentasDAO.getOne(id);
            if (value == null) {
                return "redirect:/";
            }
        } else {
            value = new Studentas();
        }
        value.setVardas(vardas);
        value.setPavarde(pavarde);
        value.setElPastas(elPastas);
        studentasDAO.save(value);
        return "redirect:/";
    }

    //** Metodas skirtas ištrinti esamą studentą iš duomenų bazės *//

    @RequestMapping(value = "studentaiDelete", method = {RequestMethod.GET, RequestMethod.POST})
    public String studentaiDelete(@RequestParam(name = "id") Integer id) {
        studentasDAO.deleteById(id);
        return "redirect:/";
    }
}