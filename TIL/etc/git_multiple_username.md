## Git 사용하면서 특정 repo 유저 이름 / 이메일 변경하고 싶을 때

이런 상황이 생겼다.

* 회사 컴으로 TIL을 써서 올렸는데 회사 gitlab용으로 세팅한 username / email로 올라갔다.
* 그래서 TIL 쓸 때만 github에서 사용하던 username / email 쓰도록 설정을 바꾸고 싶어졌다.

global 세팅과 별개로 해당 repo clone 해놓은 폴더에서 username / email 설정 해주면 된다.

* 참고 링크 : https://stackoverflow.com/questions/4220416/can-i-specify-multiple-users-for-myself-in-gitconfig

```
특정 repo 설정
git config user.name "Your Name Here"
git config user.email your@email.com

글로벌 설정
git config --global user.name "Your Name Here"
git config --global user.email your@email.com
```

변경 한 뒤에 잘 적용됐는지 확인하려면 git config 파일을 체크하면 된다.

```
글로벌 설정 : { 윈도우 사용자 폴더 / .gitconfig 파일 }
특정 repo 설정 : { 해당 repo 폴더 / .git 폴더 / config 파일 }
```