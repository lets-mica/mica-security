/*
 * Copyright (c) 2019-2029, Dreamlu 卢春梦 (596392912@qq.com & www.dreamlu.net).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.dreamlu.config;

import lombok.RequiredArgsConstructor;
import net.dreamlu.mica.captcha.servlet.MicaCaptchaServlet;
import net.dreamlu.secrity.auth.DreamAccessDeniedHandler;
import net.dreamlu.secrity.auth.DreamAuthHandler;
import net.dreamlu.secrity.auth.DreamAuthenticationProvider;
import net.dreamlu.secrity.auth.DreamWebAuthDetailsSource;
import net.dreamlu.secrity.service.DreamUserDetailsService;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.CacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

/**
 * Spring Security 权限控制
 *
 * @author L.cm
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@RequiredArgsConstructor
@EnableConfigurationProperties(DreamSecurityProperties.class)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	private final DreamUserDetailsService userDetailsService;
	private final DreamAuthHandler authHandler;
	private final MicaCaptchaServlet dreamCaptcha;
	private final DreamWebAuthDetailsSource authDetailsSource;
	private final DreamSecurityProperties dreamProperties;
	private final CacheManager cacheManager;
	private final DataSource dataSource;

	@Override
	public void configure(WebSecurity web) {
		// @formatter:off
		web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**")
			.antMatchers("/test/**")
			.antMatchers("/favicon.ico")
			.antMatchers("/error")
			.antMatchers("/static/**")
			.antMatchers("/webjars*")
			.antMatchers("/webjars/**")
			.antMatchers("/captcha.jpg")
			.antMatchers("/excel/**")
			.antMatchers("/swagger-resources/**")
			.antMatchers("/upload/**");
		// @formatter:on
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// @formatter:off
		http.headers()
			.frameOptions()
			.disable();

		http.authorizeRequests()
			.anyRequest()
			.authenticated();

		http.exceptionHandling()
			.accessDeniedHandler(new DreamAccessDeniedHandler("/accessDenied"));

		http.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/session")
			.failureHandler(authHandler)
			.successHandler(authHandler)
			.authenticationDetailsSource(authDetailsSource)
			.permitAll();

		http.rememberMe()
			.tokenRepository(rememberMeTokenRepository())
			.userDetailsService(userDetailsService)
			.tokenValiditySeconds(30 * 24 * 60);

		http.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			.logoutSuccessUrl("/")
			.deleteCookies("JSESSIONID", "remember-me");

		http.csrf()
			.ignoringAntMatchers("/druid/**", "/ueditor")
			.csrfTokenRepository(new CookieCsrfTokenRepository());
		// @formatter:on
	}

	@Override
	protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider());
		auth.eraseCredentials(false);
	}

	@Bean
	public DreamAuthenticationProvider authProvider() {
		final DreamAuthenticationProvider authProvider = new DreamAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService);
		authProvider.setDreamCaptcha(dreamCaptcha);
		authProvider.setDreamProperties(dreamProperties);
		authProvider.setCacheManager(cacheManager);
		authProvider.setPasswordEncoder(encoder());
		return authProvider;
	}

	/**
	 * 记住密码处理
	 */
	@Bean
	public PersistentTokenRepository rememberMeTokenRepository() {
		JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}

	@Bean
	public PasswordEncoder encoder() {
		return new BCryptPasswordEncoder(4);
	}

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

}
