package com.monkey.app.generator;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.ArrayList;
import java.util.List;

public class AppGenerator {
    private static   void  build(String module,String table){
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();
        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir("E:\\test");
        gc.setAuthor("zhaohejing");
        gc.setOpen(false);
        mpg.setGlobalConfig(gc);
        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://47.94.214.199:3306/newim?useUnicode=true&useSSL=false&characterEncoding=utf8");
        // dsc.setSchemaName("public");
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername("newim");
        dsc.setPassword("zwy0410");
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName(module);
        pc.setParent("com.monkey");
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        List<FileOutConfig> focList = new ArrayList<>();
        focList.add(new FileOutConfig("/templates/mapper.xml.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return  "E:\\test/mapper/"
                        + tableInfo.getEntityName().replace("Base","") + "Repository" + StringPool.DOT_XML;
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);
        mpg.setTemplate(new TemplateConfig().setXml(null));

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        //  strategy.setSuperEntityClass("com.monkey.ant.common.BaseEntity");
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        //  strategy.setSuperControllerClass("com.monkey.ant.common.BaseController");
        strategy.setInclude(table);
        strategy.setSuperEntityColumns("id");
        strategy.setControllerMappingHyphenStyle(true);
        //  strategy.setTablePrefix(pc.getModuleName() + "_");
        mpg.setStrategy(strategy);
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.execute();

    }
    public static void main(String[] args) {
        List<String> list=new ArrayList<String>(){{
            add("on_IMUser");
            add("on_IMGroupMember");
            add("on_IMMessage_1");
            add("on_IMGroupMessage_1");
            add("on_IMRecentSession");
            add("on_IMTransmitFile");
        }};
        for (String x:
             list) {
            build("app",x);
        }
    }
}
