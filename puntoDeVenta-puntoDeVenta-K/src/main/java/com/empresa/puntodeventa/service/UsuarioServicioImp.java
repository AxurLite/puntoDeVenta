package com.empresa.puntodeventa.service;

import com.empresa.puntodeventa.dao.UsuarioDao;
import com.empresa.puntodeventa.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UsuarioServicioImp implements UsuarioServicio {

    @Autowired
    private UsuarioDao usuarioDao;

    @Transactional(readOnly = true)
    @Override
    public List<Usuario> findAll() {
        return (List<Usuario>) usuarioDao.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Usuario> findAll(Pageable pageable) {
        return usuarioDao.findAll(pageable);
    }

    @Transactional
    @Override
    public void saveUser(Usuario usuario)  {
        usuario.setNombreCompleto(usuario.getNombreCompleto().toUpperCase());
        usuario.setApellidoMaterno(usuario.getApellidoMaterno().toUpperCase());
        usuario.setApellidoPaterno(usuario.getApellidoPaterno().toUpperCase());
        usuarioDao.save(usuario);
    }

    @Transactional(readOnly = true)
    @Override
    public Usuario findUser(Long idUsuario) {
        return usuarioDao.findById(idUsuario).orElse(null);
    }

    @Transactional
    @Override
    public void deleteUser(Long idUsuario) {
        usuarioDao.deleteById(idUsuario);
    }



}
