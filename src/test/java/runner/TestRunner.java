package runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/java/features",glue = "steps",plugin = {"pretty","html:target/report.html","io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm","json:target/report.json"},
        stepNotifications = true,tags = "@Run-01")

public class TestRunner {
}
