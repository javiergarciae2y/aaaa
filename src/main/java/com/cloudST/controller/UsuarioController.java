package com.cloudST.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cloudST.model.Usuario;
import com.cloudST.service.PrivilegiosService;
import com.cloudST.service.UsuarioService;
import com.cloudST.service.exception.UsuarioException;
 

@Controller
public class UsuarioController {

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private PrivilegiosService privilegiosService;

	@PostMapping("/login")
	public String login(Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String userName = request.getParameter("userName").toString();
        String password = request.getParameter("password").toString();

		Usuario usuario = null;
		try {
			usuario = usuarioService.authentication(userName, password);
		} catch (UsuarioException e) {
			model.addAttribute(e.getMessage());
			return "index";
		}
		
		session.setAttribute("idUserSession", usuario.getIdUsuario());
    	
    	session.setAttribute("permisos", privilegiosService.findByIdUser(usuario.getIdUsuario()).getTipo());
    	
    	return "welcome";
	}
	
	@GetMapping ("/logout")
	public String logOut(Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		session.removeAttribute("idUserSession");
		session.removeAttribute("permisos");
		return "index";
	}
	
	@GetMapping("/user")
	public String userProfile(Model model, HttpServletRequest request){
		Usuario usuario = new Usuario();
		
		HttpSession session = request.getSession();
		Integer idUser = (Integer) session.getAttribute("idUserSession");
		usuario = usuarioService.findById(idUser);
		model.addAttribute("usuario",usuario);
		return "usuario";
	}
	
	@GetMapping("/editUser")
	public String editProfile(Model model,  HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer idUser;
		
		if(request.getParameter("idUser") == null){
			idUser = (Integer) session.getAttribute("idUserSession");
		}else{
			idUser = Integer.parseInt(request.getParameter("idUser"));
			model.addAttribute("idUser",idUser);
		}
		Usuario usuario = usuarioService.findById(idUser);
		model.addAttribute("usuario", usuario);
		return "editUsuario";
	}
	
	@PostMapping("/userEdit")
	public String newValueUser(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		
		String nombre = request.getParameter("name").toString();
		String email = request.getParameter("email").toString();

		try {
			if(request.getParameter("idUser") == null){
				Integer idUser = (Integer) session.getAttribute("idUserSession"); 
				usuarioService.update(idUser, nombre, email, request.getParameter("password").toString(),
						request.getParameter("password2").toString());
				
			}else{
				Integer idUser = Integer.parseInt(request.getParameter("idUser"));
				usuarioService.updateAdmin(idUser,nombre, email, request.getParameter("username").toString(),
						request.getParameter("valido").toString());		
			}
		} catch (UsuarioException e) {
			model.addAttribute("Msg",e.getMessage());
			return "redirect:/editUser";
		}
		model.addAttribute("Msg","User has been successfully modified");
		if(request.getParameter("idUser") == null){
			return "redirect:/user";
		}else{
			return "redirect:/userList";
		}
	}
	
	
	@GetMapping("/newUser")
	public String newUser(Model model){
		return "addUsuario";
	}
	
	@PostMapping("/userAdd")
	public String userAdd(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String username = request.getParameter("userName");
		String email = request.getParameter("email");
		String name = request.getParameter("name").toLowerCase();

		try {
			Usuario usuario = usuarioService.create(username, name, email, password, password2);
		    privilegiosService.create(0, usuario.getIdUsuario());

			model.addAttribute("Msg", "User successfully added");

			if(session.getAttribute("idUserSession")==null){return "index";}

			return "welcome";
		} catch (UsuarioException e) {
			model.addAttribute("Msg", e.getMessage());
			return "addUsuario";
		}
	}
	 
	 
	@GetMapping("/userList")
	public String listUsers(Model model, HttpServletRequest request){
		
		 model.addAttribute("usuarios", usuarioService.listaUsuario());
		 return "listaUser";
	}
	  
	  @GetMapping("/delAdminUser")
	  public String deleteAdminUser(Model model, HttpServletRequest request){
		  
		  usuarioService.delete(Integer.parseInt(request.getParameter("idUser")));
		  		
		  return "redirect:/userList";
	  }
}
