package lt.bit.springdienynas.controllers;

import lt.bit.springdienynas.dao.StudentasDAO;
import lt.bit.springdienynas.data.Studentas;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//** Ši klasė kartu su failu pazymiaiList.jsp yra skirta gauti duomenis apie kiekvieno studento pažymius bei juos
//  atvaizduoti naudojantis MVC. */

@Controller
public class PazymiaiController {

    @Autowired
    private StudentasDAO studentasDAO;

    @GetMapping("pazymiaiList")
    public ModelAndView pazymiaiList(@RequestParam(name = "studentasId") Integer studentasId) {
        ModelAndView mav = new ModelAndView("pazymiaiList");
        Studentas studentas = studentasDAO.getOne(studentasId);
        if (studentas != null) {
            mav.addObject("studentas", studentas);
            mav.addObject("list", studentas.getPazymiaiList());
            return mav;
        } else {
            return new ModelAndView("redirect:/");
        }
    }

}
