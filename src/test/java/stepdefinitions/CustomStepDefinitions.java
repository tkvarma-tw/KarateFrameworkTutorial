package stepdefinitions;

import java.util.Random;

public class CustomStepDefinitions {

    public static String GenerateEmail(String name) {
        Random random = new Random();
        return name + random.nextInt(10000) + "@sample.com";
    }

}
