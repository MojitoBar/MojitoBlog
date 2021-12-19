---
date: 2021-12-19 22:48
description: 앱이 Foreground와 Background에 있을 때
tags: iOS, Swift
---

## App State

### <b class="bold">Foreground</b>와 <b class="bold">Background</b>는 앱의 상태를 뜻한다.
### 앱은 크게 5가지 상태를 가지는데, <b class="heavy">not Running</b>, <b class="heavy">Inactive</b>, <b class="heavy">Active</b>, <b class="heavy">Background</b>, <b class="heavy">Suspend</b>가 있다.

<br/>
<img src="/images/appstateImage.png"/>
<br/>

- <b class="heavy">not Running</b>: 앱이 실행되지 않은 상태
- <b class="heavy">Foreground 상태</b>
    - <b class="heavy">Inactive</b>: 앱이 실행중이지만 아직 아무런 이벤트를 받지 않은 상태 (Foreground 상태에서 전화가 왔을 때, 잠금상태, 멀티태스킹 스크린에서는 InActive 상태를 가진다.)
    - <b class="heavy">Active</b>: 앱이 실행중이며 현재 이벤트를 받고 있고 발생한 상태
    
- <b class="heavy">Background</b>: 앱이 백그라운드에 있는 상태이지만 여전히 실행되고 있는 코드가 있는 상태
- <b class="heavy">Suspend</b>: 앱이 백그라운드에 있고 실행되는 코드가 없는 상태 (App은 여전히 메모리에 존재하며 Suspend 상태가 될 당시의 상태를 저장하고 있지만, CPU나 배터리를 소모하지 않는다. 언제든지 메모리 부족등의 이유로 종료됨.)
    
## Foreground
### <b class="bold">Foreground mode</b>는 메모리 및 기타 시스템 리소스에 높은 우선순위를 가지며 시스템은 이러한 리소스를 사용할 수 있도록 <b class="heavy">필요에 따라 background 앱을 종료한다.</b> (예를 들어 아이폰 램을 테스트한다고 게임과 카메라를 번갈아가며 실행하는 유튜버를 본 적이 있다. 리소스가 적은 기종의 경우 게임이 로딩부터 재시작 된다.)

## Background
### <b class="bold">Background mode</b>는 <b class="heavy">가능한 적은 메모리공간</b>을 사용해야한다. 사용자 이벤트를 받기 어렵고 공유 시스템 리소스를 해제하고 이미지 객체 참조 등 메모리에 제한이 있다.
### <b class="heavy">Xcode - Capabilities - Background Modes</b>에서 Background 상태에서 이벤트를 처리할 수 있도록 지원해준다.

<br/>
<img src="/images/backgroundmodeImage.png"/>
<br/>

### 위 사진에 포함된 기능 중 몇 가지 설명해보면
- <b class="heavy">Audio, AirPlay and Picture in Picture</b>: Audio를 지속적으로 실행 할 수 있다. 음악, 영상 관련앱이 아닌 경우 이 기능을 체크하면 AppStore 심사 시 Reject을 받게 된다.
- <b class="heavy">Location updates</b>: GPS가 변할 때 마다 Event를 처리할 수 있다.
- <b class="heavy">Remote notifications</b>: FCM payload에 "content-available": true가 포함된 경우 App을 깨워 Event를 처리할 수 있습니다. (백그라운드 푸시 알림을 사용할 때 체크한다. 관련 기능 개발 때 자세히 알아봐야겠다.)

<br/>
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://exception-log.tistory.com/184">Exception Log</a>
</li>
<li>
    <a href="https://medium.com/cashwalk/ios-background-mode-9bf921f1c55b">cashwalk's medium</a>
</li>
</ul>
