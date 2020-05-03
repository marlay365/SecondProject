package com.java;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@EnableJpaRepositories(basePackages="com.java.dao")
@EnableElasticsearchRepositories(basePackages = "com.java.elasticsearch")
public class SecondProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SecondProjectApplication.class, args);
	}

	@Bean
	public Client client() throws UnknownHostException {
	    Settings settings = Settings.builder()
	             .put("client.transport.sniff", true)
	             .put("path.home", "C:\\kibana-7.6.2-windows-x86_64\\elasticsearch-7.6.2")
	                .put("cluster.name", "cluster-2").build();
	    TransportClient client = new PreBuiltTransportClient(settings);
	     client.addTransportAddress(new TransportAddress(new InetSocketAddress("localhost", 9300)));
	     return client;
	}
	

	@Bean
	public ElasticsearchOperations elasticsearchTemplate() throws UnknownHostException {
	    return new ElasticsearchTemplate(client());
	}
}
