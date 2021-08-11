---
date: 2021-02-28 19:29
description: Swift AccessControl
tags: Swift
---

### Access Controll 이란?
먼저 접근제한자 (Access Controll) 이란,</br>
접근제한자는 다른 소스 파일이나 모듈이 코드로 접근하는 것을 제하는 것이다.

이렇게 함으로써, 우리는 코드의 세부 구현 사항을 숨길 수 있다 (은닉화)

접근제한자는 클래스, 구조체 및 열거와 같은 개별 타입과, 해당 타입에 속하는 프로퍼티, 메소드, 이니셜라이저에 사용할 수 있다.


### Access Controll의 종류
접근제한자의 종류로는 `open, public, internal, fileprivate, private` 이렇게 총 5개가 있다.

- open : 모듈 외부에서 access가능 (Class만 사용 가능)</br>
    - 일반적으로 Framework에 공용 인터페이스를 지정할 때 사용
- public : open과 동일, 하지만 외부 상속 불가 & class 멤버 override 불가</br>
    - 일반적으로 Framework에 공용 인터페이스를 지정할 때 사용
- internal : 같은 모듈 안에서 access 가능, (따로 접근 제한자를 명시하지 않으면 internal)</br>
    - 일반적으로 App이나 Framework의 내부 구조를 정의할 때 사용
- fileprivate : 같은 파일 안에서 access 가능</br>
    - 전체 파일 내에서 특정 기능의 세부 구현 정보를 숨기고자 할 때 사용
- private : 같은 스코프 ({}) 안에서 access가능


은닉 정도 : (제약 적음) open < public < internal < fileprivate < private (제약 많음)


##### 훨씬 더 복잡한 내용을 함축하고 있지만 실전에서 써보지 않는 이상 쉽게 감이 잡히지 않는다... 직접 써보며 차이점을 체감해봐야 할 듯
