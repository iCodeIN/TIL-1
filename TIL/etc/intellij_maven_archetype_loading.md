## IntelliJ 에서 Maven 프로젝트 만들 때 Loading archetype list 나오는 경우

인텔리제이를 사용하다가 메이븐 프로젝트를 새로 만들려고 했는데 `Loading archetype list..`만 계속 나오고 리스트가 나오질 않는다.

검색해보니 대부분 인텔리제이의 메이븐 세팅에 들어가서 jvm 설정을 바꿔주는걸로 해결하라고 하는데, 내 pc는 그 방법으로도 해결되지 않았다.

jvm에서 쓸 수 있는 메모리의 양을 아무리 늘려줘도 idea.log를 확인해보면 GC가 의미없을 정도로 OOM을 뿜어내고 있었고, 다른 방법으로 완벽히 해결했다.

https://stackoverflow.com/questions/17421103/create-a-maven-project-in-intellij-idea-12-but-alway-in-the-loading-archetype-l

```
윈도우 사용자 폴더 / .IntelliJIdea2017.3 / system / maven / indices 폴더 내에 있는 것들 삭제
```

메이븐 dependency 관련해서 꼬여서 에러 나오면 .m2 폴더 지우고 다시 받아보듯이, 이것도 그런류의 문제인 것 같다. (이유는 명확히 모르겠지만 파일이 꼬인 문제)