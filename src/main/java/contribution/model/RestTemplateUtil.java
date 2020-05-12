package contribution.model;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

@Configuration
public class RestTemplateUtil {
	  //http요청 처리하는 RestTemplate  객체 생성
	
	
	@Bean
	public RestTemplate getCustomRestTemplate() {
		
		HttpComponentsClientHttpRequestFactory httpRequestFactory =new HttpComponentsClientHttpRequestFactory();
		httpRequestFactory.setConnectTimeout(2000);
		httpRequestFactory.setReadTimeout(60000);
		HttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(200).setMaxConnPerRoute(20).build();
		httpRequestFactory.setHttpClient(httpClient);
		return new RestTemplate(httpRequestFactory);
		
	} 
	
	
}