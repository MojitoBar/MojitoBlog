---
date: 2021-12-16 00:12
description: App Thinning?
tags: iOS, Swift
---

## App Thinning이 뭐지?

### WWDC 15에 <b class="heavy">App Thinning in Xcode</b> 세션이 소개됐다. <a class="juso" href="https://developer.apple.com/videos/play/wwdc2015/404/">WWDC 15</a>

<br/>

### 면접 준비가 아니었다면 볼 일이나 있었을까.. 하는 생각이 들만큼 처음 들어보는 녀석이다.

### <b class="heavy">App Thinning in Xcode</b>은 쉽게 말해 설치 최적화 기술을 의미한다.
### 그 안에는 <b class="bold">Slicing</b>, <b class="bold">Bitcode</b>, <b class="bold">On-Demand Resource</b>가 있는데 하나하나 알아보자. 

<br/>
<img src="/images/whatisappImage.png"/>
<br/>

### 위 사진과 같이 어플은 실행가능한 <b class="heavy">코드</b>들과 <b class="heavy">리소스</b>들로 이루어져있다.
### 우리 프로젝트에는 당장에 <b class="heavy">asset</b>만 생각해 봐도 1x, 2x, 3x 등 설치되는 디바이스에 맞춰서 동작하기 위해 필요 이상의 데이터들이 담겨있다.

<blockquote><b class="inyong">만약 아이폰 13 mini 유저가 어플리케이션을 설치하려한다면 그 많은 에셋을 모두 설치해야만 할까? 필요한 데이터만 설치할 순 없을까?</b></blockquote>

### 그걸 위해 애플에서는 <b class="bold">App Slicing</b>을 지원한다.

## Slicing?

<br/>
<img src="/images/appslicingImage.png"/>
<br/>

### 만약 우리가 <b class="heavy">Universal App</b> 하나를 업로드 하면 앱 스토어가 디바이스의 특성을 보고, 위 그림처럼 필요한 것만 조합해 별도의 <b class="heavy">IPA</b>를 만들게 된다. 

### 이런 최적화는 <b class="heavy">앱 스토어단</b>에서 자동으로 해준다. (기가 막힌다.. AOS도 비슷한 로직인지 궁금해서 찾아본 결과 플레이 스토어에서 자동으로 최적화를 해주는 뭐 그런건 따로 없는 것 같다. 내가 못 찾는 걸 수도..)

### 하지만 애플은 여기서 멈추지 않고 <b class="bold">On Demand Resources(ODR)</b>이란 기능을 소개한다.

## On Demand Resources(ODR)

### ODR은 말 그대로 <b class="heavy">주문형 리소스</b>이다.
### 예를 들어 인 앱 결제를 통해서만 얻을 수 있는 리소스가 있다고 가정해보자.
### 그럼 당연히 결제를 하기 전에는 다운로드 받을 필요가 없다. 이런 리소스들을 필요할 때 앱 스토어에서 그때 그때 받는 것이 <b class="heavy">ODR</b>의 개념이다.
### ODR은 <b class="heavy">Xcode - Build Settings - Enable On Demand Resources</b> 에서 설정할 수 있다.
<br/>

## Bitcode?
### 그럼 <b class="heavy">App Thinning</b>에 포함되어 있는 마지막 <b class="heavy">Bitcode</b>는 뭘까?
### <b class="heavy">Bitcode</b>는 컴파일된 프로그램의 중간표현이라고 한다. (기계언어도 아니고 그렇다고 사람이 읽을 수 있는 코드도 아닌 중간단계의 코드)
### 이 친구가 하는 일도 최적화에 관련이 있다. <b class="heavy">Bitcode</b>를 사용하면 최신 컴파일러용으로 자동으로 앱을 컴파일하고, 특정 아키텍쳐에 맞게 최적화 한다.
### 예를 들어 2013년 iPhone5에서 애플은 64비트 칩셋으로 바꾼 적이 있는데, 이때는 <b class="heavy">Bitcode</b>가 적용 되어있지 않을 때였다. 그래서 개발자들은 코드를 수정하고 앱을 다시 컴파일해서 제출해야 했다고 한다. 이런 상황에서 <b class="heavy">Bitcode</b>가 있었다면 이런 수고를 들일 필요 없이 새로운 아키텍처로 컴파일을 알아서 해줬을 것이다.
### <b class="heavy">Bitcode</b>는 iOS앱의 경우엔 default로 설정되어 있지만, Optional이다. 하지만 watchOS는 Bitcode가 필수라고 한다. Bitcode 설정 역시 <b class="heavy">Xcode - Build Settings - Enable Bitcode</b> 를 통해 설정할 수 있다.

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
