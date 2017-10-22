## ChromeDriver 조용하게 실행하기

대충 silent mode로 실행하는걸 말하는데, headless라는 표현이 있었고 이거에 딱 맞는 메서드가 ChromeOptions에 있었다.

Javadoc을 확인해본 결과, `public ChromeOptions setHeadless(boolean headless)` 이런 애가 있는 것을 확인!

```java
System.setProperty("webdriver.chrome.driver", "C:/selenium/chromedriver.exe");
System.setProperty("webdriver.chrome.args", "--disable-logging");
System.setProperty("webdriver.chrome.silentOutput", "true");
ChromeOptions options = new ChromeOptions();
options.addArguments("-incognito");
options.addArguments("start-maximized");
options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation"));
options.setHeadless(true);
driver = new ChromeDriver(options);

driver.get("https://google.com");

WebElement test = driver.findElement(By.name("q"));

test.sendKeys("asdf");

test.sendKeys(Keys.ENTER);

System.out.println(driver.findElement(By.id("resultStats")).getText());

driver.close();
```

* 실행결과
```
검색결과 약 23,700,000개 (0.42초) 
```

테스트 용으로 아무렇게나 작성해본거라 프로퍼티랑 옵션이 많이 들어가있는데, setHeadless만 기억해주면 될 듯.
크롬 창 안나오고 조용히 크롤링 처리해주는 것을 확인하였다.