package com.example.springnfc.controller;


import com.example.springnfc.entity.InterventionProvider;
import com.example.springnfc.repository.InterventionProviderRepository;
import com.example.springnfc.repository.ProviderRepository;
import com.example.springnfc.repository.UtilisateurRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/intervention")
//@PreAuthorize("hasRole('CHEF')")
@Transactional
public class InterventionController {

    private UtilisateurRepository utilisateurRepository;
    private ProviderRepository providerRepository;
    private InterventionProviderRepository interventionProviderRepository;

    public InterventionController(UtilisateurRepository utilisateurRepository, ProviderRepository providerRepository, InterventionProviderRepository interventionProviderRepository) {
        this.utilisateurRepository = utilisateurRepository;
        this.providerRepository = providerRepository;
        this.interventionProviderRepository = interventionProviderRepository;
    }

    @GetMapping(path = "/a-intervenir", produces="application/json")
    public InterventionProvider getIntervention(){
        List installationProviders = new ArrayList<>();
        this.interventionProviderRepository.findAll().forEach(i ->{
           //installationProviders.add()
        });
        return this.interventionProviderRepository.findAll().get(0);
    }
}
