## nGrinder에서 jython으로 스크립트 작성할 때 한글 인코딩 주의점

NVPair로 param 담아서 form-data request 날리는 코드를 짜고 있었다.

주소 관련한 body값에서 한글이 들어갔는데 막상 POST 보내보니까 다 깨져있어서 애먹었는데 해결 방법이 비교적 간단했다.

```python
deliveryAddress = "경기도남양주시가운동"

params = (
...생략... ,NVPair("destinationFullNm", deliveryName.decode('utf-8')),NVPair("dongFullNm", deliveryAddress.decode('utf-8')), ...생략...
)
```

소스코드 맨 위에 `# -*- coding:utf-8 -*-` 써보고 content-type에 charset 맞춰보고 encode도 써보고 별짓 다했는데... decode를 해줘야 되는 것이었다. ㅠㅠ

파이썬을 거의 안써본 상태에서 jython으로 스크립트 급하게 짜다보니 인코딩 관련한 이슈들을 전혀 인지하지 못했다.

왜 decode를 해야 이 사태가 해결되는지에 대해서는 추후 정확하게 공부하고 다시 정리해야겠다.