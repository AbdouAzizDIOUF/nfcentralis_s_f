package com.example.springnfc;

import com.example.springnfc.entity.*;
import com.example.springnfc.repository.*;
import com.example.springnfc.service.NFCentralisImpl;
import com.github.javafaker.Faker;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

@SpringBootApplication
public class SpringNfcApplication implements CommandLineRunner {

    private static final String FILENAME = "/Users/Projects/Perso/spring-nfc/src/main/resources/installation.xml";

    private final OrdererRepository ordererRepository;
    private final ProviderRepository providerRepository;
    private final UtilisateurRepository utilisateurRepository;
    private final ClientRepository clientRepository;
    private PasswordEncoder encoder;
    private final RoleRepository roleRepository;
    private NFCentralisImpl nfCentralisImpl;

    public SpringNfcApplication(NFCentralisImpl nfCentralisImpl,
            RepositoryRestConfiguration repositoryRestConfiguration, OrdererRepository ordererRepository,
            ProviderRepository providerRepository, UtilisateurRepository utilisateurRepository,
            ClientRepository clientRepository, PasswordEncoder encoder, RoleRepository roleRepository) {
        this.ordererRepository = ordererRepository;
        this.providerRepository = providerRepository;
        this.utilisateurRepository = utilisateurRepository;
        this.clientRepository = clientRepository;
        this.encoder = encoder;
        this.roleRepository = roleRepository;
        this.nfCentralisImpl = nfCentralisImpl;

        repositoryRestConfiguration.exposeIdsFor(
                Provider.class,
                Orderer.class,
                Utilisateur.class,
                Client.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringNfcApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

        // this.nfCentralisImpl.initOrderer();
        // this.nfCentralisImpl.initProvider();
        // this.nfCentralisImpl.initChefProviders();
        // this.nfCentralisImpl.initRole();
        // this.nfCentralisImpl.initUtilisateurOrderers();
        // this.nfCentralisImpl.initUtilisateurProviders();
        // this.nfCentralisImpl.initChefProviders();
        // this.nfCentralisImpl.initChefOrderers();

        // this.nfCentralisImpl.initClient();

        /*
         * for (int i=0; i<5; i++){
         * Faker faker = new Faker(new Locale("fr-FR"));
         * Orderer orderer = new Orderer();
         * orderer.setName(faker.company().name());
         * orderer.setAdress(faker.address().streetName());
         * orderer.setCity(faker.address().city());
         * orderer.setZipcode(faker.address().buildingNumber());
         * orderer.setPhone(faker.phoneNumber().phoneNumber());
         * orderer.setEmail(faker.internet().emailAddress());
         * orderer.setDescription(faker.lorem().fixedString(100));
         * orderer.setLogo(faker.company().logo());
         * ordererRepository.save(orderer);
         * }
         * 
         * 
         * for (int i=0; i<5; i++){
         * Faker faker = new Faker(new Locale("fr-FR"));
         * Provider provider = new Provider();
         * provider.setName(faker.company().name());
         * provider.setAdress(faker.address().streetName());
         * provider.setCity(faker.address().city());
         * provider.setZipcode(faker.address().buildingNumber());
         * provider.setPhone(faker.phoneNumber().phoneNumber());
         * provider.setEmail(faker.internet().emailAddress());
         * provider.setDescription(faker.lorem().fixedString(100));
         * provider.setLogo(faker.company().logo());
         * providerRepository.save(provider);
         * }
         * 
         * Role role = new Role();
         * role.setName(ERole.ROLE_TRAVAILLEUR);
         * roleRepository.save(role);
         * Role role2 = new Role();
         * role2.setName(ERole.ROLE_CHEF);
         * roleRepository.save(role2);
         * Role role3 = new Role();
         * role3.setName(ERole.ROLE_ADJOIN_CHEF);
         * 
         * 
         * Role role4 = new Role();
         * role4.setName(ERole.ROLE_MODERATOR);
         * roleRepository.save(role4);
         * 
         * Role role5 = new Role();
         * role5.setName(ERole.ROLE_ADMIN);
         * roleRepository.save(role5);
         * 
         * Role role6 = new Role();
         * role6.setName(ERole.ROLE_USER);
         * roleRepository.save(role6);
         * 
         * roleRepository.save(role3);
         * Set <Role> roles = new HashSet();
         * roles.add(role);
         */

        /*
         * ordererRepository.findAll().forEach(orderer -> {
         * 
         * Set<Role> roles = new HashSet<>();
         * 
         * Role userRole = roleRepository.findByName(ERole.ROLE_CHEF)
         * .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
         * roles.add(userRole);
         * 
         * Faker faker = new Faker(new Locale("fr-FR"));
         * Utilisateur utilisateur = new Utilisateur();
         * utilisateur.setFirstName(faker.name().firstName());
         * utilisateur.setLastName(faker.name().lastName());
         * utilisateur.setEmail(faker.internet().emailAddress());
         * utilisateur.setPassword(encoder.encode("passer2022"));
         * utilisateur.setMobile(faker.phoneNumber().phoneNumber());
         * utilisateur.setUserName(faker.name().username());
         * utilisateur.setCompany(orderer);
         * utilisateur.setRoles(roles);
         * utilisateurRepository.save(utilisateur);
         * 
         * });
         * 
         * 
         * providerRepository.findAll().forEach(provider -> {
         * Set<Role> roles = new HashSet<>();
         * 
         * Role userRole = roleRepository.findByName(ERole.ROLE_CHEF)
         * .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
         * roles.add(userRole);
         * 
         * Faker faker = new Faker(new Locale("fr-FR"));
         * Utilisateur utilisateur = new Utilisateur();
         * utilisateur.setFirstName(faker.name().firstName());
         * utilisateur.setLastName(faker.name().lastName());
         * utilisateur.setEmail(faker.internet().emailAddress());
         * utilisateur.setMobile(faker.phoneNumber().phoneNumber());
         * utilisateur.setUserName(faker.name().username());
         * utilisateur.setPassword(encoder.encode("passer2022"));
         * utilisateur.setCompany(provider);
         * utilisateur.setRoles(roles);
         * utilisateurRepository.save(utilisateur);
         * 
         * });
         */

        /*
         * for (int i=0; i<5; i++){
         * Faker faker = new Faker(new Locale("fr-FR"));
         * Client client = new Client();
         * 
         * System.out.printf(faker.company().logo());
         * 
         * client.setName(faker.company().name());
         * client.setAdress(faker.address().streetName());
         * client.setCity(faker.address().city());
         * client.setZipcode(faker.address().buildingNumber());
         * client.setPhone(faker.phoneNumber().phoneNumber());
         * client.setEmail(faker.internet().emailAddress());
         * client.setDescription(faker.chuckNorris().fact());
         * client.setLogo(faker.company().logo());
         * clientRepository.save(client);
         * }
         */

    }

    /*
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Orderer orderer = new Orderer();
     * orderer.setName(faker.company().name());
     * orderer.setAdress(faker.address().streetName());
     * orderer.setCity(faker.address().city());
     * orderer.setZipcode(faker.address().buildingNumber());
     * orderer.setPhone(faker.phoneNumber().phoneNumber());
     * orderer.setEmail(faker.internet().emailAddress());
     * orderer.setDescription(faker.lorem().fixedString(100));
     * orderer.setLogo(faker.company().logo());
     * ordererRepository.save(orderer);
     * }
     * 
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Provider provider = new Provider();
     * provider.setName(faker.company().name());
     * provider.setAdress(faker.address().streetName());
     * provider.setCity(faker.address().city());
     * provider.setZipcode(faker.address().buildingNumber());
     * provider.setPhone(faker.phoneNumber().phoneNumber());
     * provider.setEmail(faker.internet().emailAddress());
     * provider.setDescription(faker.lorem().fixedString(100));
     * provider.setLogo(faker.company().logo());
     * providerRepository.save(provider);
     * }
     * 
     * ordererRepository.findAll().forEach(orderer -> {
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Utilisateur utilisateur = new Utilisateur();
     * utilisateur.setFirstName(faker.name().firstName());
     * utilisateur.setLastName(faker.name().lastName());
     * utilisateur.setEmail(faker.internet().emailAddress());
     * utilisateur.setMobile(faker.phoneNumber().phoneNumber());
     * utilisateur.setUserName(faker.name().username());
     * utilisateur.setCompany(orderer);
     * utilisateurRepository.save(utilisateur);
     * }
     * });
     * 
     * providerRepository.findAll().forEach(provider -> {
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Utilisateur utilisateur = new Utilisateur();
     * utilisateur.setFirstName(faker.name().firstName());
     * utilisateur.setLastName(faker.name().lastName());
     * utilisateur.setEmail(faker.internet().emailAddress());
     * utilisateur.setMobile(faker.phoneNumber().phoneNumber());
     * utilisateur.setUserName(faker.name().username());
     * utilisateur.setCompany(provider);
     * utilisateurRepository.save(utilisateur);
     * }
     * });
     * 
     * 
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Client client = new Client();
     * 
     * System.out.printf(faker.company().logo());
     * 
     * client.setName(faker.company().name());
     * client.setAdress(faker.address().streetName());
     * client.setCity(faker.address().city());
     * client.setZipcode(faker.address().buildingNumber());
     * client.setPhone(faker.phoneNumber().phoneNumber());
     * client.setEmail(faker.internet().emailAddress());
     * client.setDescription(faker.chuckNorris().fact());
     * client.setLogo(faker.company().logo());
     * clientRepository.save(client);
     * }
     */

    // faker.chuckNorris().fact()
    /*
     * ordererRepository.findAll().forEach(orderer -> {
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Utilisateur utilisateur = new Utilisateur();
     * utilisateur.setFirstName(faker.name().firstName());
     * utilisateur.setLastName(faker.name().lastName());
     * utilisateur.setEmail(faker.internet().emailAddress());
     * utilisateur.setMobile(faker.phoneNumber().phoneNumber());
     * utilisateur.setUserName(faker.name().username());
     * utilisateur.setCompany(orderer);
     * utilisateurRepository.save(utilisateur);
     * }
     * });
     * 
     * providerRepository.findAll().forEach(provider -> {
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Utilisateur utilisateur = new Utilisateur();
     * utilisateur.setFirstName(faker.name().firstName());
     * utilisateur.setLastName(faker.name().lastName());
     * utilisateur.setEmail(faker.internet().emailAddress());
     * utilisateur.setMobile(faker.phoneNumber().phoneNumber());
     * utilisateur.setUserName(faker.name().username());
     * utilisateur.setCompany(provider);
     * utilisateurRepository.save(utilisateur);
     * }
     * });
     */

    /*
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Orderer orderer = new Orderer();
     * orderer.setName(faker.company().name());
     * orderer.setAdress(faker.address().streetName());
     * orderer.setCity(faker.address().city());
     * orderer.setZipcode(faker.address().buildingNumber());
     * orderer.setPhone(faker.phoneNumber().phoneNumber());
     * orderer.setEmail(faker.internet().emailAddress());
     * orderer.setDescription(faker.lorem().fixedString(100));
     * ordererRepository.save(orderer);
     * }
     * 
     * for (int i=0; i<5; i++){
     * Faker faker = new Faker(new Locale("fr-FR"));
     * Provider provider = new Provider();
     * provider.setName(faker.company().name());
     * provider.setAdress(faker.address().streetName());
     * provider.setCity(faker.address().city());
     * provider.setZipcode(faker.address().buildingNumber());
     * provider.setPhone(faker.phoneNumber().phoneNumber());
     * provider.setEmail(faker.internet().emailAddress());
     * provider.setDescription(faker.lorem().fixedString(100));
     * providerRepository.save(provider);
     * }
     */
}
