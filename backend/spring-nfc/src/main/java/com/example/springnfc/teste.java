package com.example.springnfc;

import com.example.springnfc.entity.Provider;
import com.example.springnfc.repository.InterventionProviderRepository;
import com.example.springnfc.repository.ProviderRepository;

public class teste {
    private final InterventionProviderRepository interventionProviderRepository;
    private final ProviderRepository providerRepository;

    public teste(InterventionProviderRepository interventionProviderRepository, ProviderRepository providerRepository) {
        this.interventionProviderRepository = interventionProviderRepository;
        this.providerRepository = providerRepository;
    }

    public static void main(String[] args) {
        System.out.println();
    }

    public Provider display(){
        Provider provider = this.providerRepository.findById(1L).get();

        return provider;
    }
}
