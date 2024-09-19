package com.Appium2_0_Project;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.ios.options.XCUITestOptions;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.Properties;

public class Base {
    public static AppiumDriver driver;
    public static Properties props = new Properties();

    public Base() {
        File file;
        try {
            String environment = System.getProperty("env", "local");
            if ("local".equalsIgnoreCase(environment)) {
                file = new File("src/main/java/com/Appium2_0_Project/Properties/local_config.Properties");
            } else if ("prod".equalsIgnoreCase(environment)) {
                file = new File("src/main/java/com/Appium2_0_Project/Properties/prod_config.Properties");
            } else {
                throw new RuntimeException("Environment not supported!");
            }

            FileInputStream fis = new FileInputStream(file);
            props.load(fis);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void InitializeDriver(String platformName) throws Exception {
        URL url = new URL("http://127.0.0.1:4723/wd/hub");

        String appUrl = Paths.get(System.getProperty("user.dir"), "src", "main", "resources", "ApiDemos-debug.apk").toString();

        switch (platformName) {
            case "Android":
                UiAutomator2Options options = new UiAutomator2Options()
                        .setDeviceName("Pixel 6 API 30")
                        .setPlatformVersion("11")
                       // .setUdid("emulator-5554")
                        .setAutomationName("UiAutomator2")
                        .setApp(appUrl)
                        .setAppPackage("io.appium.android.apis")
                        .setAppActivity("io.appium.android.apis.ApiDemos")
                        .setAvd("Pixel_6_API_30")
                        .setAvdLaunchTimeout(Duration.ofMinutes(3)) // Set a reasonable timeout
                        .setUnlockType("pin")
                        .setUnlockKey("")
                        .setNewCommandTimeout(Duration.ofSeconds(300)); // Set new command timeout

                // Adding unsupported capabilities directly
                options.setCapability("noWindow", true); // Run in headless mode
                options.setCapability("disableWindowAnimation", true); // Disable window animation

                driver = new AndroidDriver(url, options);
                System.out.println("Session id: " + driver.getSessionId());
                break;


            case "IOS":
                XCUITestOptions option =new XCUITestOptions();
                option.setDeviceName("iPhone 13");
                option.setPlatformName("iOS");
                option.setAutomationName("XCUITest");
                option.setBundleId("com.example.apple-samplecode.UICatalog");
                driver = new IOSDriver(url, option);
                break;
            default:
                throw new Exception("Invalid platform");
        }
    }
}
