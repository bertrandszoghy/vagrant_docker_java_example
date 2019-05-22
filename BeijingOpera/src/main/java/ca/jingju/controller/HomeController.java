package ca.jingju.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		//return "Jingju 京剧";
		return "<!DOCTYPE html><html><head><meta charset=\\\"utf-8\\\" /><title>Jingju 京剧 one moment, please...</title><script>window.location.href='./index.html';</script></head><body><h1>Jingju 京剧<br>One moment, please...</h1></body></html>";
	}
}
