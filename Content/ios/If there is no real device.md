---
date: 2021-12-07 00:00
description: 실제 디바이스가 없을 경우 할 수 있는 것?
tags: iOS, Swift, xcode
---

## Xcode Simulator

### 앱을 개발하다 보면 실 기기대신 <b class="heavy">시뮬레이터</b>를 통해 테스트하는 경우가 대다수였다.
### <b class="heavy">시뮬레이터</b>의 한계는 어디까지일까?

## 시뮬레이터의 한계
### 사실 상식적으로 생각해보면 <b class="heavy">시뮬레이터</b>에서 되는 할 수 있는 것과 없는 것을 나누는 것이 <b class="bold">하드웨어 센서</b> 라는 것을 쉽게 알 수 있다.
<br/>
<a class="juso" href="https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/iOS_Simulator_Guide/TestingontheiOSSimulator/TestingontheiOSSimulator.html">애플 공식 개발 문서
</a>

### 위 주소를 통해 공식 문서를 읽어보면 시뮬레이터에서 제공하지 않는 API 등에 대해 나름 자세히 나와있다.
### 하지만 좀 오래된 문서로 보인다... (예시로 드는 iOS 버전이 8.x...)
<br/>
### 해당 내용을 달달 외우는 것도 좋지만,
### 최대한 나의 경험을 기준으로 가능한 것과 불가능 한 것을 나눠보고자 했다.

## 불가능한 것
### 불가능한 것을 먼저 서술 이유는 이를 제외한 모든 것은 가능하다 볼 수 있기 때문이다.
<br/>
### 위에서도 언급했듯이 하드웨어적으로 센서가 필요한 경우에는 당연히 시뮬레이터에서 테스트 해볼 수 없다. 
### 카메라, 마이크, 전화기능 등이 있다.
### 실제로 카메라 필터앱을 만든 적이 있는데 이 프로젝트를 진행하면서 시뮬레이터를 사용한 적은 없는 것 같다.

<br/>
<br/>
<blockquote><b class="inyong">그럼 하드웨어를 센서를 사용하는 GPS도 못쓰는거 아닌가?</b></blockquote>
<br/>
### 맞다. 실제로 내가 어디있는지, 어디로 이동하는지 등은 체크하기 어렵다. 하지만, 고정값을 설정해줄 수는 있다!

<br/>
<img src="/images/locationImage.png"/>
<br/>

### 해당 경로에서 시뮬레이터의 속성을 변경해주면 된다. 위도와 경도를 입력하면 되는데 서울과 제주도의 위도 차이가 4도인걸 감안한다면 최대한 정확한 값을 입력하는 것이 좋을 것 같다.
<br/>
### 추가적으로 회원가입을 구현하다 키보드가 올라올 때 작동해야하는 UI 애니메이션이 있었는데 시뮬레이터에서 키보드가 안 올라와 실 기기로만 테스트 할 수 있나..? 라고 생각한 적이 있다.
### 다행히도 키보드 역시 시뮬레이터의 속성 변경을 통해 올라오게 할 수 있다.

<br/>
<img src="/images/locationImage.png"/>
<br/>
### 마찬가지로 해당 경로에서 시뮬레이터의 속성을 변경해주면 된다. 해당 속성을 체크하면 실제 노트북과 연결되어 있는 키보드의 입력은 할 수 없게 된다는 점에 유의하자!

## 가능한 것
### 가능한 것이라 명명했지만 사실 시뮬레이터만의 장점에 가깝다.

<br/>
<br/>
<br/>
## 참고자료
https://yagom.net/forums/topic/%EC%8B%A4%EC%A0%9C-%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%EA%B0%80-%EC%97%86%EC%9D%84%EB%95%8C-%ED%95%A0%EC%88%98%EC%9E%88%EB%8A%94%EA%B2%83%EA%B3%BC-%EC%97%86%EB%8A%94%EA%B2%83/

https://fomaios.tistory.com/entry/%EC%8B%A4%EC%A0%9C-%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%EA%B0%80-%EC%97%86%EC%9D%84-%EA%B2%BD%EC%9A%B0-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-%ED%95%A0-%EC%88%98-%EC%9E%88%EB%8A%94-%EA%B2%83%EA%B3%BC-%EC%97%86%EB%8A%94-%EA%B2%83

https://githubmemory.com/repo/iOS-SOPT-iNNovation/iOS_Traning/issues/2
<ul>
<li>
    <a href="https://yagom.net/forums/topic/%EC%95%BC%EA%B3%B0%EB%8B%B7%EB%84%B7-%EC%A7%88%EB%AC%B8%EB%AA%A8%EC%9D%8C-5/">YAGOM 질문모음</a>
</li>
<li>
    <a href="https://zeddios.tistory.com/203">ZeddiOS</a>
</li>
</ul>
