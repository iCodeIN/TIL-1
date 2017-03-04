## 반복주기 2

*   mustache를 활용한 동적인 HTML과 MVC 설명을 여기서 해주신다.

*   STS에서 쓸 수 있는 좋은 단축키를 알았는데, 애노테이션이나 잡다한것을 입력하고 Ctrl+Shift+M을 입력하면 바로 import를 할 수 있다. (기존에는 직접 마우스 가져다대고 추가를 눌렀었다..)
*   mustache를 사용하면 model에서 넘어온 애트리뷰트를 view가 편하게 처리 가능하다.


    A typical Mustache template:
    
    Hello {{name}}
    You have just won {{value}} dollars!
    {{#in_ca}}
    Well, {{taxed_value}} dollars, after taxes.
    {{/in_ca}}
    
    Given the following hash:
    
    {
      "name": "Chris",
      "value": 10000,
      "taxed_value": 10000 - (10000 * 0.4),
      "in_ca": true
    }
    
    Will produce the following:
    
    Hello Chris
    You have just won 10000 dollars!
    Well, 6000.0 dollars, after taxes.
*   Controller 어노테이션과 GetMapping 어노테이션 사용법 숙지
    *   그러고보니 스프링 책에서는 RequestMapping을 많이 사용했었다..
    *   get 방식으로 넘기는건 별로 좋지 않은 방식
*   view에 넘기고 싶은 값은 model.addAttribute(String, Object)
*   return에 view 페이지 이름을 넣어주고 resources/templates에 view 페이지 파일 만들기
*   getter / setter 생성해주는 기능은 알고 있었는데, 포매팅 하는 단축키는 처음 알았다. (Ctrl + Swift + F)
*   옛날엔 VO의 필요성을 전혀 이해하지 못했는데, 실습하면서 소중함? 편리함?을 알게 되었다.
*   return에서 `redirect:/` 이용하면 다른곳으로 보낼 수 있다. (회원 가입 완료 후 list로 보낸다던지)

