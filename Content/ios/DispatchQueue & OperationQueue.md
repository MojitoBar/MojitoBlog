---
date: 2021-12-24 16:53
description: DispatchQueue & OperationQueue
tags: iOS, Swift
---

## 멀티 스레딩
### 멀티 스레딩은 여러개의 프로세스를 동시에 실행하는 것을 의미한다. 대표적인 예로 로딩 애니메이션과 데이터를 불러오는 두 개의 프로세스가 동시에 처리되어야하는 경우가 있다.
### Swift에서는 멀티 스레딩을 처리하기 위해 GCD와 Operation, 총 2가지 API를 제공한다.

## GCD
### GCD는 Grand Central Dispatch의 약자로 멀티 코어, 멀티 프로세서 환경에서 프로그래머가 보다 편리하게 개발을 할 수 있도록 애플에서 개발한 기술이다. 
### Swift에서는 DispatchQueue로 사용할 수 있다.
### DispatchQueue를 잘 사용하려면 Serial, Concurrent, Sync, Async에 대해 먼저 알아야한다.

## Serial, Concurrent
### DispatchQueue는 Serial(직렬)큐, Concurrent(동시)큐, 총 두 종류로 나눌 수 있다.

--- 직렬 큐 사진

### 위 사진과 같이 Serial의 경우 하나의 스레드에서 모든 테스크를 처리하는 방법이다.

--- 동시 큐 사진

### 위 사진과 같이 Concurrent의 경우 여러개의 테스크를 여러개의 스레드로 분산시켜 처리하는 방법이다.
### 이러한 특징 때문에 Serial의 경우엔 작업이 끝나는 순서도 명확하다. 당연히 Queue 니까 먼저 들어온 테스크가 먼저 끝난다.

### 하지만 Concurrent의 경우엔 모오하다. 스레드가 달라도 Queue 니까 먼저 들어온 테스크가 먼저 끝날 것 같지만 아래의 사진과 같은 경우가 있을 수 있다.

--- 동시 큐 테스크 실행시간 차이

### 이 경우엔 마지막에 들어온 테스크가 가장 먼저 끝나는 것을 알 수 있다. 그래서 Concurrent의 경우엔 Qos를 통해 우선순위를 설정해줄 수 있다.
### 이러한 특징 때문에 순서가 중요한 테스크들의 경우 Serial을, 순서보단 속도가 중요한 경우 Concurrent를 사용한다. 

## Qos
### Qos는 Quality of Service의 약자로 Concurrent의 우선순위를 설정하는 역할을 한다.
### 우선순위는 userInteractive, userInitiated, default, utility, background, unspecified 로 총 6개가 있고 나열한 순서대로 우선순위가 빠르다.

## Sync, Async
### 그럼 Sync와 Async는 뭘까?
### Sync는 동기(동시에 일어나는), Async는 비동기(동시에 일어나지 않는)을 의미하는데 여기까지 들으면 '어 그럼 Sync가 Serial, Async가 Concurrent !?!?!?'라 생각할 수 있지만 이를 혼동해서는 안된다. 전혀 다른 것을 의미하는 녀석들이다.

### Concurrent & Serial은 Queue로 보내진 테스크를 한 개의 스레드로 보내냐, 여러개의 스레드로 보내냐 에 대해 다루는 것이고
### Sync & Async는 테스크를 보내는 시점에서 진행중이던 테스크의 흐름을 멈추냐 안 멈추냐에 대해 다루는 것이다.

### 때문에 SerialQueue.sync, SerialQueue.Async, ConcurrentQueue.sync, ConcurrentQueue.Async 이렇게 총 4개의 조합이 가능한데 코드를 보면 단박에 이해할 수 있다.

--- 4개의 코드사진과 설명

### DispatchQueue의 생성자에 대한 내용은 https://developer.apple.com/documentation/dispatch/dispatchqueue/2300059-init 를 참고하자


## OperationQueue
### 이때까지 GCD에 대한 내용을 배웠는데 그럼 OperationQueue는 뭘까?
### OperationQueue는 

--- 간단한 설명 후 예시 및 GCD와의 차이




### 면접에 자주 나오는 단골질문이라 하니 잊지 않게 잘 숙지해놔야겠다..

<br/>
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://zeddios.tistory.com/655">ZeddiOS</a>
</li>
<li>
    <a href="https://developer.apple.com/videos/play/wwdc2015/404/">wwdc2015</a>
</li>
<li>
    <a href="https://velog.io/@zeke/App-thinning-%EC%9D%B4%EB%9E%80">zeke</a>
</li>
<li>
    <a href="https://ttuk-ttak.tistory.com/42">개발하는 뚝딱이</a>
</li>
</ul>
