## 여러개의 조건으로 비교하기 (Java8)

어제 보고 온 코딩 테스트에서 이런 문제가 나왔다.

```
다음 조건에 맞게 정렬해서 출력해주세요.

- 성별, 나이, 노약자
- 여자 > 남자 순서로 우선순위가 높음
- 7세 이하의 사람은 어린이로 정의하고, 어린이인 경우는 나이가 어릴수록 우선순위가 높음. 어린이를 제외하고는 나이가 많을수록 우선순위가 높음.
- 노약자라는 조건이 있는 경우 임산부 > 장애인 > 환자 순으로 우선순위가 높음
```

심지어 들어오는 쿼리에 따라서 이 우선순위를 조정해야했다.

(1 2 3이 들어오면 성별 > 나이 > 노약자 순으로 판별하고 2 1 3이 들어오면 나이 > 성별 > 노약자 순으로 판별)

그냥 Comparator 일일히 작성하는 방법이 있었고 그걸 선택했지만, 코드가 너무 길어졌다...... 총 6개 경우의 수에 맞춰서 일일히 작성한 것이었다.

이미 코딩 테스트는 끝났지만 리팩토링을 시도해봄.

Java8에는 Comparator.comparing(), thenComparing() 이라는 멋진 메서드가 있었다는 걸 뒤늦게 깨달아서 아쉽다..

```java
if(first == 1) {
    if(second == 2) {
        peopleList.sort(new GenderComparator()
                .thenComparing(new AgeComparator())
                .thenComparing(new HandicapComparator()));
    } else if(second == 3) {
        peopleList.sort(new GenderComparator()
                .thenComparing(new HandicapComparator())
                .thenComparing(new AgeComparator()));
    }
} else if(first == 2) {
    if(second == 1) {
        peopleList.sort(new AgeComparator()
                .thenComparing(new GenderComparator())
                .thenComparing(new HandicapComparator()));
    } else if(second == 3) {
        peopleList.sort(new AgeComparator()
                .thenComparing(new HandicapComparator())
                .thenComparing(new GenderComparator()));
    }
} else if(first == 3) {
    if(second == 1) {
        peopleList.sort(new HandicapComparator()
                .thenComparing(new GenderComparator())
                .thenComparing(new AgeComparator()));
    } else if(second == 2) {
        peopleList.sort(new HandicapComparator()
                .thenComparing(new AgeComparator())
                .thenComparing(new GenderComparator()));
    }
}

class AgeComparator implements Comparator<People> {

    @Override
    public int compare(People o1, People o2) {
        boolean childO1 = o1.isChild;
        boolean childO2 = o2.isChild;
        if(!childO1 && !childO2) {
            return o2.age - o1.age;
        } else {
            return o1.age - o2.age;
        }
    }
}

class GenderComparator implements Comparator<People> {

    @Override
    public int compare(People o1, People o2) {
        return o2.gender - o1.gender;
    }
}

class HandicapComparator implements Comparator<People> {

    @Override
    public int compare(People o1, People o2) {
        return o2.handicap - o1.handicap;
    }
}
```

아직 지저분한 면은 많지만, 상당히 짧은 코드로 모든 경우의 수를 처리해줄 수 있었다.

람다식을 이용해서 한 가지 조건으로 정렬해주는건 많이 써봤는데, 이런 것도 가능했다니 자바8은 멋지다. ㅠㅠ

