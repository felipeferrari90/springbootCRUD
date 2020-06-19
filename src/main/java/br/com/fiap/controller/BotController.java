package br.com.fiap.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.fiap.model.BotModel;
import br.com.fiap.repository.BotRepository;


@Controller
@RequestMapping("/bot")
public class BotController {

	@Autowired
	private BotRepository repository;

	@GetMapping
	public String findAll(Model model) {

		model.addAttribute("bots", repository.findAll());

		return "bots";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable Long id, Model model) {

		BotModel botModel = repository.findById(id);
		model.addAttribute("bot", botModel);

		return "bot-detalhe";
	}
	
	@GetMapping("/form")
	public String openForm(@RequestParam String page,
							@RequestParam(required = false) Long id,
							@ModelAttribute("botModel") BotModel botModel,
							Model model) {
		
		if ("bot-editar".equals(page)) {
			model.addAttribute("botModel", repository.findById(id));
		}
		
		return page;
	}

	@PostMapping
	public String save(@Valid BotModel botModel, 
						BindingResult bindingResult,
						RedirectAttributes redirectAttributes) {
		
		if (bindingResult.hasErrors()) {
			return "bot-novo";
		}
		
		repository.save(botModel);
		redirectAttributes.addFlashAttribute("messages", "Bot Salvo");
		
		return "redirect:/bot";		
	}
	
	@PutMapping("/{id}")
	public String update(@PathVariable Long id,
						 @Valid BotModel botModel,
						 BindingResult bindingResult,
						 RedirectAttributes redirectAttributes) {
		
		if (bindingResult.hasErrors()) {
			return "bot-editar";
		}
		
		botModel.setIdBot(id);
		repository.update(botModel);
		
		redirectAttributes.addFlashAttribute("messages", "Bot atualizado com sucesso");
		
		return "redirect:/bot";
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		
		repository.delete(id);
		redirectAttributes.addFlashAttribute("messages", "Categoria removida");
		
		return "redirect:/bot";
	}
}
