https://www.youtube.com/watch?v=7jkIUgLC29I

https://www.youtube.com/watch?v=NLKQEOgBAnw



* 기본적인 2진수 계산이나 2의 보수 개념은 알고 있지만 쉬프트 연산이라거나 마스크를 씌운다거나 하는 개념들이 궁금해서 강의 영상을 봤다.

* 왼쪽으로 밀면 곱하기, 오른쪽으로 밀면 나누기.

  * 끝까지 닿았는데 쉬프트를 더 했을 때는 어떤 일이 일어나는가? -> 기본적인 설명은 들어서 이해했지만 추가로 찾아서 공부할 필요가 있다.

  * 자릿수가 정해져있는 경우 밖으로 밀려난 애들은 쓰레기통으로 가는 느낌으로 기억하고 있다

  * 23(00010111)을 right shift 했을 때는 11.5가 아니라 끝자리가 날아가서 (버림) 11 (00001011)

    ​

https://www.youtube.com/watch?v=QXaW5lj7Rs0

* 이 영상에서 본 기법은 신선했다. 대문자 코드 + 32를 하면 소문자가 나온다는 점을 이용하여 판별하는 코드를 보여주고 있었다.

  	char alphabet = "a";
  	if(alphabet & 0b00100000 == 0) {
  	  // Upper case
  	} else if(alphabet & 0b00100000 == 0b00100000) {
  	  // Lower case
  	}



http://okky.kr/article/135485

* 이것도 읽어보니 이해하는데 도움이 되었다. 실제로 이런 식의 코드를 작성할 일이 있을지 모르겠으나, 소켓 통신에서 이렇게 활용할 수 있다는 점을 알았으니.. 



http://itguru.tistory.com/129

* 홀짝 판별도 끝자리 AND 연산 한번으로 대체할 수 있다.