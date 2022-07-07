package com.example.springnfc.controller;


import com.example.springnfc.entity.*;
import com.example.springnfc.form.InterventionProviderTravailleurForm;
import com.example.springnfc.repository.InterventionProviderRepository;
import com.example.springnfc.repository.InterventionProviderTravailleurRepository;
import com.example.springnfc.repository.ProviderRepository;
import com.example.springnfc.repository.UtilisateurRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RequestMapping("/api/intervention")
//@PreAuthorize("hasRole('CHEF')")
@RestController
public class InterventionController {

    private final UtilisateurRepository utilisateurRepository;
    private final ProviderRepository providerRepository;
    private final InterventionProviderRepository interventionProviderRepository;
    private final InterventionProviderTravailleurRepository iptRepository;

    public InterventionController(UtilisateurRepository utilisateurRepository, ProviderRepository providerRepository, InterventionProviderRepository interventionProviderRepository, InterventionProviderTravailleurRepository iptRepository) {
        this.utilisateurRepository = utilisateurRepository;
        this.providerRepository = providerRepository;
        this.interventionProviderRepository = interventionProviderRepository;
        this.iptRepository = iptRepository;
    }

    @Transactional
    @GetMapping(path = "/a-intervenir/{idUser}", produces="application/json")
    public List<InterventionProvider> getIntervention(@PathVariable("idUser") Long id){
        Company company = utilisateurRepository.findById(id).get().getCompany();
        List<InterventionProvider> interventionProviderList = new ArrayList<>();
        interventionProviderRepository.findByProvider((Provider)company).forEach(e -> {
            InterventionProvider interventionProvider = new InterventionProvider();
            interventionProvider.setId(e.getId());
            Provider p = new Provider();
            p.setId(e.getProvider().getId());
            p.setName(e.getProvider().getName());
            p.setEmail(e.getProvider().getEmail());
            interventionProvider.setProvider(p);
            Installation i = new Installation();
            i.setId(e.getInstallation().getId());
            i.setTitle(e.getInstallation().getTitle());
            i.setImage(e.getInstallation().getImage());
            i.setDescription(e.getInstallation().getDescription());
            interventionProvider.setInstallation(i);
            interventionProviderList.add(interventionProvider);
        });

        return interventionProviderList;
    }

    @PostMapping("/attribuerInterventionTravailleur")
    public ResponseEntity<?> authenticateUser(@RequestBody InterventionProviderTravailleurForm form) {
        InterventionProviderTravailleur iPT = new InterventionProviderTravailleur();
        InterventionProvider interventionProvider = this.interventionProviderRepository.findById(form.getInterventionProvider()).get();
        interventionProvider.setEstAttribue(true);
        this.interventionProviderRepository.save(interventionProvider);
        iPT.setInterventionProvider(interventionProvider);
        iPT.setTravailleur(this.utilisateurRepository.findById(form.getTravailleurID()).get());

        iptRepository.save(iPT);

        return ResponseEntity.ok(iPT);
    }
}
