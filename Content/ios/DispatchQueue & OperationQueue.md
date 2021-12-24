---
date: 2021-12-24 16:53
description: DispatchQueue & OperationQueue
tags: iOS, Swift
---

## 멀티 스레딩
### 멀티 스레딩은 여러개의 프로세스를 동시에 실행하는 것을 의미한다. 대표적인 예로 로딩 애니메이션과 데이터를 불러오는 <b class="heavy">두 개의 프로세스가 동시에 처리</b> 되어야하는 경우가 있다.
### Swift에서는 <b class="heavy">멀티 스레딩</b>을 처리하기 위해 <b class="bold">GCD</b>와 <b class="bold">Operation</b>, 총 2가지 API를 제공한다.

## GCD
### <b class="heavy">GCD</b>는 Grand Central Dispatch의 약자로 멀티 코어, 멀티 프로세서 환경에서 프로그래머가 보다 편리하게 개발을 할 수 있도록 애플에서 개발한 기술이다. 
### Swift에서는 <b class="heavy">DispatchQueue</b>로 사용할 수 있다.
### <b class="heavy">DispatchQueue</b>를 잘 사용하려면 <b class="bold">Serial</b>, <b class="bold">Concurrent</b>, <b class="bold">Sync</b>, <b class="bold">Async</b>에 대해 먼저 알아야한다.

## Serial, Concurrent
### <b class="heavy">DispatchQueue</b>는 <b class="heavy">Serial</b>(직렬)큐, <b class="heavy">Concurrent</b>(동시)큐, 총 두 종류로 나눌 수 있다.

<br/>
<img src="/images/serialImage.png"/>
<br/>
<blockquote><b class="inyong">Serial의 경우 하나의 스레드에서 모든 테스크를 처리하는 방법이다.</b></blockquote>

<br/>
<img src="/images/concurrentImage.png"/>
<br/>
<blockquote><b class="inyong">Concurrent의 경우 여러개의 테스크를 여러개의 스레드로 분산시켜 처리하는 방법이다.</b></blockquote>

### 이러한 특징 때문에 <b class="heavy">Serial</b>의 경우엔 작업이 끝나는 순서도 명확하다. 당연히 <b class="bold">Queue</b> 니까 먼저 들어온 테스크가 먼저 끝난다.

### 하지만 <b class="heavy">Concurrent</b>의 경우엔 모오하다. 스레드가 달라도 <b class="heavy">Queue</b> 니까 먼저 들어온 테스크가 먼저 끝날 것 같지만 아래의 사진과 같은 경우가 있을 수 있다.

<br/>
<img src="/images/queuetimeImage.png"/>
<br/>

### 이 경우엔 마지막에 들어온 테스크가 가장 먼저 끝나는 것을 알 수 있다. 그래서 <b class="heavy">Concurrent</b>의 경우엔 <b class="bold">Qos</b>를 통해 우선순위를 설정해줄 수 있다.
### 이러한 특징 때문에 순서가 중요한 테스크들의 경우 <b class="heavy">Serial</b>을, 순서보단 속도가 중요한 경우 <b class="heavy">Concurrent</b>를 사용한다. 

## Qos
### <b class="heavy">Qos</b>는 Quality of Service의 약자로 <b class="heavy">Concurrent</b>의 우선순위를 설정하는 역할을 한다.
### 우선순위는 <b class="bold">userInteractive</b>, <b class="bold">userInitiated</b>, <b class="bold">default</b>, <b class="bold">utility</b>, <b class="bold">background</b>, <b class="bold">unspecified</b> 로 총 6개가 있고 나열한 순서대로 우선순위가 빠르다.

## Sync, Async
### 그럼 <b class="bold">Sync</b>와 <b class="bold">Async</b>는 뭘까?
### <b class="heavy">Sync</b>는 동기(동시에 일어나는), <b class="heavy">Async</b>는 비동기(동시에 일어나지 않는)을 의미하는데 여기까지 들으면


<blockquote><b class="inyong">'어 그럼 Sync가 Serial, Async가 Concurrent !?!?!?'</b></blockquote>

### 라 생각할 수 있지만 이를 혼동해서는 안된다. 전혀 다른 것을 의미하는 녀석들이다.

### <b class="heavy">Concurrent & Serial</b>은 Queue로 보내진 테스크를 한 개의 스레드로 보내냐, 여러개의 스레드로 보내냐 에 대해 다루는 것이고
### <b class="heavy">Sync & Async</b>는 테스크를 보내는 시점에서 진행중이던 테스크의 흐름을 멈추냐 안 멈추냐에 대해 다루는 것이다.

### 때문에 <b class="bold">SerialQueue.sync</b>, <b class="bold">SerialQueue.Async</b>, <b class="bold">ConcurrentQueue.sync</b>, <b class="bold">ConcurrentQueue.Async</b> 이렇게 총 4개의 조합이 가능하다.

### 예를 들어 <b class="heavy">ConcurrentQueue.Async</b>는 큐에 들어오는 테스크는 여러개의 스레드로 분산시켜 동시에 작업하지만 <b class="heavy">Async</b>하기 때문에 해당 큐가 끝날 때 까지 다른 작업은 하지 못한다. (큐의 작업과 기존의 흐름을 혼동하지 말자!!) 

## OperationQueue
### <b class="heavy">OperationQueue</b>는 <b class="heavy">GCD</b>에 기반해서 여러가지 기능을 추가한 추상 클래스라고 보면 된다.
### <b class="heavy">GCD</b>에 비해 다양한 기능을 추가로 제공하기 때문인데 그 중 대표적인 기능은 아래 2가지이다.

- 데이터와 기능을 캡슐화했기 때문에 재사용이 가능하다.
- 해당 작업의 실행 상태(실행, 정지, 대기 등)을 알 수 있고 이를 통해 Operation들을 취소 혹은 순서를 지정할 수 있다.

### 예를 들어 이미지가 들어있는 UITableView가 빠르게 스크롤 된다고 가정해보자.
### <b class="heavy">GCD</b>로 구현한다면 부드러운 스크롤을 위해 이미지를 불러오는 코드를 <b class="heavy">ConcurrentQueue</b>로 구현할 것이다.
### 그런데 이렇게 구현하면 이미지를 다 받아서 화면에 뿌리기도 전에 스크롤이 넘어가 있을 수도 있다. 우리는 굳이 넘어간 이미지를 계속해서 다운받을 필요는 없다.
### 이런 경우에 <b class="heavy">Operation</b>을 취소하는 기능이 담긴 <b class="heavy">OperationQueue</b>를 사용하는 것이다.

<br/>
### 결국 둘의 차이는 <b class="heavy">OperationQueue</b>는 <b class="heavy">GCD</b>가 할 수 있는 기능에 추가해 Operation의 최대 수, 일시 중지, 다시 시작, 취소 등의 기능을 할 수 있다는 것이고 <b class="heavy">GCD</b>는 그러한 기능은 없지만 더 쉽고 간편하게 사용할 수 있다는 점이 있다.

<br/>
<br/>

<blockquote><b class="inyong">기회가 되면 두 가지를 직접 기능 구현에 사용해보고 코드로 차이를 확인해봐야겠다.</b></blockquote>
<blockquote><b class="inyong">면접에 자주 나오는 단골질문이라 하니 잊지 않게 잘 숙지해놔야겠다..</b></blockquote>

<br/>
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://caution-dev.github.io/ios/2019/03/15/iOS-GCD-vs-Operation-Queue.html">주희하세요!</a>
</li>
<li>
    <a href="https://developer.apple.com/documentation/foundation/operation">Apple Developer</a>
</li>
<li>
    <a href="https://tong94.tistory.com/17">Tong's Blog</a>
</li>
</ul>
