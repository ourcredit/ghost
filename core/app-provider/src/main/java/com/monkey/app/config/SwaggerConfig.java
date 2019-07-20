package com.monkey.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket userApi() {
        ParameterBuilder tokenPar = new ParameterBuilder();
        List<Parameter> pars = new ArrayList<Parameter>();
        tokenPar.name("Authorization").description("AccessToken令牌").modelRef(new ModelRef("string")).parameterType("header").required(false).build();
        ParameterBuilder b = new ParameterBuilder();
        b.name("tenantName").description("租户名").modelRef(new ModelRef("string")).parameterType("header").required(true).defaultValue("account").build();
        pars.add(tokenPar.build());
        pars.add(b.build());

        Docket docket = new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
              //  .apis(RequestHandlerSelectors.basePackage("cn.zhangbox.eureka.provider.controller"))//过滤的接口
                .paths(PathSelectors.any())
                .build().globalOperationParameters(pars );
        return docket;
    }
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("app-provider swagger接口").description("app端接口")
                .termsOfServiceUrl("http://contact.leftins.com")
                .license("MIT").licenseUrl("#").version("2.0").build();
    }
}

