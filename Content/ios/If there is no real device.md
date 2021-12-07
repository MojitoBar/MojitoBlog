---
date: 2021-12-08 00:11
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
<br/>
<img src="/images/appledocumentImage.png"/>
<br/>
<blockquote><b class="inyong">
하지만 좀 오래된 문서로 보인다... (예시로 드는 iOS 버전이 8.x...)</b></blockquote>
<br/>
### 해당 내용을 달달 외우는 것도 좋지만,
### 최대한 <b class="heavy">나의 경험</b>을 기준으로 가능한 것과 불가능 한 것을 나눠보고자 했다.

## 불가능한 것
### 불가능한 것을 먼저 서술 이유는 <b class="heavy">이를 제외한 모든 것은 가능하다</b> 볼 수 있기 때문이다.
<br/>
### 위에서도 언급했듯이 하드웨어적으로 센서가 필요한 경우에는 당연히 시뮬레이터에서 테스트 해볼 수 없다. 
### <b class="bold">카메라</b>, <b class="bold">마이크</b>, <b class="bold">전화 기능</b> 등이 있다.
### (검색해본 결과 특이하게 하드웨어 센서를 사용하는 <b class="bold">페이스 아이디</b> 는 시뮬레이터에서 테스트해볼 수 있다는 것 같다. 나중에 인증 관련한 기능을 구현할 때 한번 실험해봐야 겠다.)
### 실제로 <b class="heavy">카메라 필터 앱</b>을 만든 적이 있는데 이 프로젝트를 진행하면서 <b class="heavy">시뮬레이터</b>를 사용한 적은 없는 것 같다.

<br/>
<br/>
<blockquote><b class="inyong">그럼 하드웨어를 센서를 사용하는 <b class="bold">GPS</b>도 못쓰는거 아닌가?</b></blockquote>
<br/>
### 맞다. 실제로 내가 어디있는지, 어디로 이동하는지 등은 체크하기 어렵다. 하지만, <b class="bold">고정값</b>을 설정해줄 수는 있다!

<br/>
<img src="/images/locationImage.png"/>
<br/>

### 해당 경로에서 시뮬레이터의 속성을 변경해주면 된다. 위도와 경도를 입력하면 되는데 서울과 제주도의 위도 차이가 4도인걸 감안한다면 최대한 정확한 값을 입력하는 것이 좋을 것 같다.
<br/>
### 추가적으로 회원가입을 구현하다 <b class="heavy">키보드</b> 올라올 때 작동해야하는 UI 애니메이션이 있었는데 시뮬레이터에서 키보드가 안 올라와 실 기기로만 테스트 할 수 있나..? 라고 생각한 적이 있다.
### 다행히도 키보드 역시 시뮬레이터의 속성 변경을 통해 올라오게 할 수 있다.

<br/>
<img src="/images/locationImage.png"/>
<br/>
### 마찬가지로 해당 경로에서 시뮬레이터의 속성을 변경해주면 된다. 해당 속성을 체크하면 실제 노트북과 연결되어 있는 <b class="heavy">하드웨어 키보드</b>의 입력은 할 수 없게 된다는 점에 유의하자!

## 가능한 것
### 가능한 것이라 명명했지만 사실 불가능한 것 이외에는 모두 가능하기 때문에 아래에 서술되는 내용을 시뮬레이터의 <b class="bold">장점</b>이자 <b class="bold">특징</b>에 가깝다.
<br/>
### 먼저 <b class="heavy">갤러리</b> 관련해서 테스트하기가 실 기기보다 편했다.
### 갤러리에서 기프티콘을 찾아주는 프로젝트를 진행한 적이 있었는데 실제 기기로 테스트할때는 사진의 양이 많아 시간도 오래 걸리고 테스트용 사진 <b class="heavy">추가</b>, <b class="heavy">삭제</b>가 용이하지 않았다. 하지만 <b class="heavy">시뮬레이터</b>로 테스트할 땐 테스트용 사진 추가 삭제가 매우 용이했다.
<br/>
### <b class="bold">기기별</b> 테스트가 용이하다.
### 사실 이 이유 때문에 시뮬레이터를 가장 적극적으로 사용한 것 같다. 프로젝트를 진행하며 오토레이아웃을 적용한다고 생각하고 개발을 해도 아직 미숙해서 그런지, 디바이스별로 직접 확인을 해보면 문제가 생기는 경우가 많았다. 이럴 때 다양한 디바이스로 테스트를 해볼 수 있다는 점은 <b class="heavy">시뮬레이터</b>의 가장 큰 특징인 것 같다.
<br/>
<br/>
<blockquote><b class="inyong">잘못된 정보나 수정될 정보가 있으면 메일로 알려주시면 감사드리겠습니다.</b></blockquote>
<br/>
<br/>

## 참고자료
<ul>
<li>
    <a href="https://yagom.net/forums/topic/%EC%8B%A4%EC%A0%9C-%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%EA%B0%80-%EC%97%86%EC%9D%84%EB%95%8C-%ED%95%A0%EC%88%98%EC%9E%88%EB%8A%94%EA%B2%83%EA%B3%BC-%EC%97%86%EB%8A%94%EA%B2%83/">YAGOM QnA</a>
</li>
<li>
    <a href="https://fomaios.tistory.com/entry/%EC%8B%A4%EC%A0%9C-%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%EA%B0%80-%EC%97%86%EC%9D%84-%EA%B2%BD%EC%9A%B0-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-%ED%95%A0-%EC%88%98-%EC%9E%88%EB%8A%94-%EA%B2%83%EA%B3%BC-%EC%97%86%EB%8A%94-%EA%B2%83">Fomagran tistory blog</a>
</li>
</ul>
