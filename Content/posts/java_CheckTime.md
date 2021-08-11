---
date: 2021-02-28 19:29
description: Java 소스코드 실행 시간 측정하기
tags: Algorithm, Java
---

### Java 프로그램 실행 시간 측정
- 알고리즘 문제를 풀다보면 자신의 코드가 시간이 얼마나 걸리는지, 어느부분이 느린지 확인해야 하는 경우가 종종 있다.

그럴 때 유용하게 사용할 수 있는 코드이다.

```java
long beforeTime = System.currentTimeMillis(); // 알고리즘 시작 시간 받아오기
        
// 알고리즘 코드 실행
        
long afterTime = System.currentTimeMillis(); // 알고리즘 끝난 시간 받아오기
long secDiffTime = (afterTime - beforeTime)/1000; // 두 시간에 차 계산

System.out.println("시간차이(m) : "+secDiffTime);
```
