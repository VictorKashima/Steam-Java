package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Jogo;
import application.model.JogoRepository;

@Controller
@RequestMapping("/jogo")
public class JogoController {

    @Autowired
    private JogoRepository jogoRepo;

    @RequestMapping("/list")
    public String gameList(Model model) {
        model.addAttribute("jogos", jogoRepo.findAll());
        return "jogo-list";
    }

    @RequestMapping("/insert")
    public String insert() {
        return "jogo-insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String gameInsert(@RequestParam("titulo") String titulo, @RequestParam("anoDeLancamento") String anoDeLancamento) {
        Jogo jogo = new Jogo();
        jogo.setTitulo(titulo);
        jogo.setAnoDeLancamento(anoDeLancamento);

        jogoRepo.save(jogo);

        return "redirect:/jogo/list";
    }

    @RequestMapping("/update")
    public String update(Model model, @RequestParam("id") int id) {
        Optional<Jogo> jogo = jogoRepo.findById(id);

        if(!jogo.isPresent()) {
            return "redirect:/jogo/list";
        }

        model.addAttribute("jogo", jogo.get());
        return "jogo-update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String gameUpdate(
        @RequestParam("id") int id,
        @RequestParam("titulo") String titulo,
        @RequestParam("anoDeLancamento") String anoDeLancamento
    ) {
        Optional<Jogo> jogo = jogoRepo.findById(id);
        if(!jogo.isPresent()) {
            return "redirect:/jogo/list";
        }

        jogo.get().setTitulo(titulo);
        jogo.get().setAnoDeLancamento(anoDeLancamento);

        jogoRepo.save(jogo.get());
        return "redirect:/jogo/list";
    }

    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("id") int id) {
        Optional<Jogo> jogo = jogoRepo.findById(id);

        if(!jogo.isPresent()) {
            return "redirect:/jogo/list";
        }

        model.addAttribute("jogo", jogo.get());
        return "jogo-delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String gameDelete(@RequestParam("id") int id) {
        jogoRepo.deleteById(id);
        return "redirect:/jogo/list";
    }
}