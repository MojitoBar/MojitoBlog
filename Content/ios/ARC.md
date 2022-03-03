---
date: 2022-03-03 09:46
description: ARC란 무엇인가?
tags: iOS, Swift
---

## ARC?

### <b class="bold">ARC</b>는 <b class="heavy">Auto Reference Counting</b>, 즉 <b class="heavy">"자동으로 메모리를 관리해주는 친구!"</b> 라고만 알고 있었습니다.
### 이번 기회 <b class="heavy">ARC</b>에 대해 더욱 자세하게 알아보려 합니다.

<br/>
<img src="/images/arcImage.png"/>
<br/>

### Swift 문서에서는 <b class="heavy">ARC</b>를 이렇게 소개합니다.

<blockquote><b class="inyong">Swift는 ARC를 사용하여 앱의 메모리 사용량을 추적하고 관리합니다. ... ARC는 해당 인스턴스에서 사용하는 메모리를 자동으로 해제합니다.</b></blockquote>

### 너무나 정직한 이름을 가진 친구입니다...
### 그 아래 <b class="heavy">ARC</b>가 어떻게 작동하는지도 나와있습니다.

<br/>
<img src="/images/howarcImage.png"/>
<br/>

<blockquote><b class="inyong">클래스의 새 인스턴스를 생성할 때마다 <b class="heavy">ARC</b>는 해당 인스턴스에 대한 정보를 저장하기 위해 메모리 청크를 할당합니다. 이 메모리는 해당 인스턴스와 관련되어 저장된 속성값과 함께 인스턴스 유형에 대한 정보를 보유합니다. ...</b></blockquote>

### 말 그대로 메모리 참조가 일어나는 <b class="heavy">참조 타입</b>(Class)이 생성되는 경우 <b class="heavy">ARC</b>가 증가한다는 뜻입니다.
### 그렇다면 반대로 생성된 참조 타입이 참조를 잃는다면 <b class="heavy">ARC</b>는 감소하겠지요? 그렇게 해제된 메모리는 다른 용도로 사용할 수 있습니다.
### 이것이 <b class="heavy">ARC</b>의 기본적인 작동 원리입니다.


<blockquote><b class="inyong">하지만 이러한 Reference Counting을 자동으로 해주기 때문에 어쩌면 우리가 원하지 않는 타이밍에 메모리를 해지하게 될 수도 있는거 아닌가?? </b></blockquote>
### 라는 생각이 들었습니다.

### Swift는 기본적으로 강력 참조를 함으로써 위와 같은 문제를 막는데 이에 대해선 메모리 참조 방법 <b class="bold">strong & weak & unowned 포스팅</b>에서 더욱 자세히 다루도록 하겠습니다.

## ARC 예제코드

### <b class="heavy">ARC</b>가 어떻게 사용되는 지 간단한 예제 코드를 보며 알아보도록 하겠습니다.

```swift
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
``` 

### 여기 간단한 Person class가 있습니다.

```swift
var reference1: Person?
var reference2: Person?
var reference3: Person?
```

### Optional Person 객체를 3개 선언해보겠습니다. 과연 위 코드만으로 <b class="heavy">ARC</b>가 동작할까요?
### <b class="heavy">당연히 동작하지 않습니다.</b> nil값으로 초기화되기 때문에 Person 인스턴스의 참조자체가 일어나지 않기 때문입니다.

```swift
reference1 = Person(name: "MojitoBar")
```

### 위와 같이 Person객체를 할당해주면 생성자의 print와 동시에 메모리가 할당되고 <b class="heavy">ARC</b>가 증가하게 됩니다.
### 그렇다면 생성되는 동시에 <b class="heavy">ARC</b>가 증가하고 소멸되는 동시에 <b class="heavy">ARC</b>가 감소한다고 생각하면 되는건가?? 라는 의문이 생겼습니다.
### 이 의문에 대해서는 아래 예제를 통해 자세히 알아보겠습니다.

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "MojitoBar")

reference2 = reference1
reference3 = reference1
```

### 위에서 봤던 것과 같은 Person 클래스를 하나 만들어주고 reference1, 2, 3 객체를 3개 만들었습니다.
### 그 중 reference1에만 값을 할당해준 뒤 2, 3은 1을 복사했는데요, class의 default 복사는 <b class="heavy">shallow copy(얕은 복사)</b>입니다.
### 따라서 reference1, 2, 3은 같은 주소값을 갖게 됩니다. 즉, reference1의 name의 변경이 다른 2, 3에 영향을 준다는 것인데요 그렇다면 아래 코드는 어떨까요?

```swift
reference1 = nil
```

### 주소의 값을 바꾸는게 아니라 reference1의 메모리를 해제했습니다. 그럼 reference2, 3의 메모리도 해제되는 걸까요?
### 정답은 <b class="heavy">"그렇지 않다"</b> 입니다.
### 여기서 변수 reference1의 데이터는 <b class="heavy">스택영역</b>에, 인스턴스 Person의 데이터는 <b class="heavy">힙영역</b>에 저장되기때문에 <b class="heavy">스택영역</b>의 reference1을 비워도 <b class="heavy">힙영역</b>에 저장된 Person 인스턴스의 값은 비워지지 않는 것입니다.

<br/>
<br/>

### 예를들어 reference1이 주소 0000을 가르킨다고 가정해봅시다. 만약 reference1 하나만 0000을 가르킨다면 reference1이 nil이 되었을 때 <b class="heavy">스택영역</b>과 <b class="heavy">힙영역</b>에서 메모리가 전부 해제되게 됩니다.
### 그런데 위의 예제와 같이 reference1, 2, 3이 같은 주소 0000을 가르킨다면 <b class="heavy">스택영역</b>의 reference1은 해제될지 몰라도 힙영역의 메모리는 해제되지 않게 되는 것입니다.

### 결과적으로 <b class="heavy">ARC</b>는 이름에서도 알 수 있듯이 주소 카운팅의 역할을 하는 친구이기 때문에 <b class="bold">reference1 = nil</b>을 했다고 해서 ARC에서 <b class="heavy">메모리가 해제되지 않습니다.</b>

<br/>
<br/>

### 이제 우리는 처음 가졌던 의문을 해결할 수 있게 되었습니다.
### 생성자와 소멸자의 호출이 <b class="heavy">ARC</b>에서 메모리 할당과 해제라고 봐도 되는가? 의 답은 <b class="heavy">"그렇다"</b> 입니다.
### 실제로 코드를 실행해보면 class <b class="heavy">shallow 복사</b> 에서는 생성자가 호출되지 않고, <b class="bold">reference1 = nil</b>에서 소멸자가 호출되지 않는다는 것을 알 수 있습니다.

<br/>
<br/>

### 이렇게 ARC가 무엇인지와 작동 방법에 대해 알아봤습니다.
### 잘못된 부분이 있다면 아래 메일을 통해 수정 및 지적 해주시면 정말 감사드리겠습니다.

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html">Swift Docs</a>
</li>
<li>
    <a href="https://0urtrees.tistory.com/132">applebuddy</a>
</li>
</ul>
