---
date: 2021-08-11 19:29
description: 스프링부트 정리01 - 스프링의 핵심
tags: Springboot
---


### 스프링이란?
- 스프링은 프레임워크이다.<br>
    Frame - 틀, Work - 일하다. 즉 틀안에서 일하다, 뼈대를 가지고 일하다. 라는 뜻이다.<br>
    <div style="width: 250px; margin: auto;">
    <img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile6.uf.tistory.com%2Fimage%2F274FFB3851C1BF89292CBB"/><br>
    </div>
    예를들어 장난감 키트를 생각해보자, 우리는 직접 플라스틱을 자르거나 나무를 다듬어 장난감을 만들 수도 있지만
    그 보다 더 편리하게 시중의 장난감 키트를 이용할 수 있다. <br>
    이 처럼 여러 메뉴얼과 규약을 정해 쉽게 개발의 생산성과 품질을 높이는 역할을 하는 것이 프레임 워크이다.<br><br>

- 스프링은 오픈소스이다.<br>
    소스코드가 공개되어있어 내부를 뜯어 고칠수가 있다! (굉장히 높은 수준에 다다르면 가능...)<br><br>

- 스프링은 IoC 컨테이너를 가진다.<br>
    IoC (Inversion of Controll) 는 제어의 역전이다. 주도권이 개발자가 아니라 스프링에게 있다는 뜻인데,<br>
    아래의 코드를 보자.<br>
    ```Java
    public void make(){
        의자 s = new 의자();
    }

    public void use(){
        // s의자를 여기서 어떻게 사용하나?
    }
    ```

    위 코드를 보면 make 메소드에서 의자 s를 선언하고 해당 의자를 use 메소드에서 사용하고 싶다면 어떤 방법으로든 넘겨 받아야한다.<br>
    이러한 방법은 클래스와 오프젝트가 많아질수록 해당 로직을 짜기 매우 힘들어진다.<br>
    따라서 스프링에서는 생성된 오브젝트들을 전부 스캔해서 메모리 공간에 띄우게 된다.<br>
    이렇게 제어를 스프링이하는 일련의 역할을 IoC라고 한다.<br><br>
- 스프링은 DI를 지원한다.
    DI (dependency Injection) 의존성 주입이란, <br>
    IoC 제어의 역전을 통해 메모리에 띄워진 오브젝트들을 다른 여러 메소드에서 사용하는 방법이다. (싱글톤 패턴)<br>
    
