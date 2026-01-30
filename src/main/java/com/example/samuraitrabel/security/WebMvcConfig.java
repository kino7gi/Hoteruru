package com.example.samuraitrabel.security; // 作成した場所に合わせて書き換えてください

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // ブラウザから /storage/** というURLでアクセスが来たら、
        // プロジェクト内の static/storage/ フォルダを見に行くように紐付けます
        registry.addResourceHandler("/storage/**")
                .addResourceLocations("file:src/main/resources/static/storage/");
    }
}