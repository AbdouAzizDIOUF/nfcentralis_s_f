package com.example.springnfc;

import com.example.springnfc.entity.*;
import com.example.springnfc.projection.ClientProjection;
import com.example.springnfc.projection.InstallationProjection;
import com.example.springnfc.projection.InterventionProviderProjection;
import com.example.springnfc.projection.UtilisateurProjection;
import com.example.springnfc.repository.*;
import com.example.springnfc.service.NFCentralisImpl;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class SpringNfcApplication implements CommandLineRunner {

    private static final String FILENAME = "/Users/Projects/Perso/spring-nfc/src/main/resources/installation.xml";


    private final OrdererRepository ordererRepository;
    private final ProviderRepository providerRepository;
    private final UtilisateurRepository utilisateurRepository;
    private final ClientRepository clientRepository;
    private PasswordEncoder encoder;
    private final RoleRepository roleRepository;
    private final NFCentralisImpl nfCentralis;

    public SpringNfcApplication(
            RepositoryRestConfiguration repositoryRestConfiguration,
            OrdererRepository ordererRepository,
            ProviderRepository providerRepository,
            UtilisateurRepository utilisateurRepository,
            ClientRepository clientRepository,
            PasswordEncoder encoder, RoleRepository roleRepository, NFCentralisImpl nfCentralis)
    {
        this.ordererRepository = ordererRepository;
        this.providerRepository = providerRepository;
        this.utilisateurRepository = utilisateurRepository;
        this.clientRepository = clientRepository;
        this.encoder = encoder;
        this.roleRepository = roleRepository;
        this.nfCentralis = nfCentralis;
        repositoryRestConfiguration.getProjectionConfiguration()
                .addProjection(InterventionProviderProjection.class)
                .addProjection(UtilisateurProjection.class)
                .addProjection(ClientProjection.class)
                /*.addProjection(ProviderProjectionDesactive.class)*/
                .addProjection(InstallationProjection.class);
        repositoryRestConfiguration.exposeIdsFor(
                Provider.class,
                InterventionProvider.class,
                Orderer.class,
                Utilisateur.class,
                Client.class,
                Installation.class
        );
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringNfcApplication.class, args);
    }


    @Override
    public void run(String... args) throws Exception {
       /* nfCentralis.initOrderer();
        nfCentralis.initProvider();
        nfCentralis.initRole();
        nfCentralis.initChefOrderers();
        nfCentralis.initChefProviders();
        nfCentralis.initUtilisateurOrderers();
        nfCentralis.initUtilisateurProviders();*/
        //nfCentralis.initClient();
        //nfCentralis.initInstallation();
    }
}
