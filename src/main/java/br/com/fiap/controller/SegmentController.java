package br.com.fiap.controller;

import java.sql.SQLException;

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


import br.com.fiap.model.SegmentModel;
import br.com.fiap.repository.BotRepository;
import br.com.fiap.repository.SegmentRepository;

@Controller
@RequestMapping("/segment")
public class SegmentController {
	
	@Autowired
	public SegmentRepository repository;
	
	@Autowired
	private BotRepository botRepository;
	
	@GetMapping("/form")
	public String open(@RequestParam String page, 
					   @RequestParam(required = false) Long id,
					   @ModelAttribute("segmentModel") SegmentModel segmentModel, 
					   Model model) {
		
		if("segmento-editar".equals(page)) {
			model.addAttribute("segmentModel", repository.findById(id));
		}
		
		model.addAttribute("bots", botRepository.findAll());
		
		return page;
	}

	@GetMapping
	public String findAll(Model model) {

		model.addAttribute("segmentos", repository.findAll());
		return "segmento";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable("id") long id, Model model) {
		
		model.addAttribute("segmento", repository.findById(id));
		return "segmento-detalhe";
	}
	
	@PostMapping()
	public String save(@Valid SegmentModel segmentModel, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if(bindingResult.hasErrors()) {
			return "segmento-novo";
		}
		
		repository.save(segmentModel);
		redirectAttributes.addFlashAttribute("messages", "Segmento cadastrado com sucesso!");
		
		return "redirect:/segment";
	}
	
	@PutMapping("/{id}")
	public String update(@PathVariable("id") long id, @Valid SegmentModel segmentModel, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if(bindingResult.hasErrors()) {
			return "segmento-editar";
		}
		
		segmentModel.setIdSegment(id);
		repository.update(segmentModel);
		redirectAttributes.addFlashAttribute("messages", "Segmento alterado com sucesso!");
		
		return "redirect:/segment";
	}
	
	@DeleteMapping("/{id}")
	public String deleteById(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		
		repository.deleteById(id);
		redirectAttributes.addFlashAttribute("messages", "Segmento excluido com sucesso!");

		return "redirect:/segment";
	}

}
