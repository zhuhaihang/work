package com.kcl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 * 启动程序
 *SpringBootApplication包含了
 * -@ComponentScan：组件扫描，可自动发现和装配一些Bean
 * -@Configuration：等同于spring的XML配置文件
 * -@EnableAutoConfiguration自动配置
 * RestController注解是@Controller和@ResponseBody的合集
 * 函数的返回值直 接填入HTTP响应体中
 * Autowired自动导入
 * PathVariable获取参数
 * -@RepositoryRestResourcepublic配合spring-boot-starter-data-rest使用。
 * -@Repository：使用@Repository注解可以确保DAO或者repositories提供异常转译，
 * -@Bean：用@Bean标注方法等价于XML中配置的bean。
 * -@Value：注入Spring boot application.properties配置的属性的值
 * -@Component：泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。
 * -@Inject：等价于默认的@Autowired，只是没有required属性；
 * -@Qualifier：当有多个同一类型的Bean时，可以用@Qualifier(“name”)来指定。与@Autowired配合使用
 * -@Resource(name=”name”,type=”type”)：没有括号内内容的话，默认byName。与@Autowired干类似的事。
 * -@ControllerAdvice：包含@Component。可以被扫描到。统一处理异常。
 * -@ExceptionHandler（Exception.class）：用在方法上面表示遇到这个异常就执行以下方法。
 * @author kcl
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@MapperScan("com.kcl.*.mapper")
@ComponentScan(basePackages = { "com.kcl"})
public class KclApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(KclApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  通用启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       ____     __        \n" +
                " |  _ _   \\      \\   \\   /  /    \n" +
                " | ( ' )  |       \\  _. /  '       \n" +
                " |(_ o _) /        _( )_ .'         \n" +
                " | (_,_).' __  ___(_ o _)'          \n" +
                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                " |  | \\ `'   /|   `-'  /           \n" +
                " |  |  \\    /  \\      /           \n" +
                " ''-'   `'-'    `-..-'              ");
    }
}
