---
date: 2021-12-29 20:49
description: Foundation Kit?
tags: iOS, Swift
---

## Foundation Kit이란?

<br/>
<img src="/images/foundationImage.png"/>
<br/>

<blockquote><b class="inyong">필수 데이터 유형, 컬렉션 및 운영 체제 서비스에 액세스하여 앱의 기본 기능 계층을 정의합니다.</b></blockquote>

### <b class="heavy">Foundation</b> 프레임워크는 코코아 터치 프레임 워크에 포함된 프레임 워크이자, 원시 데이터 타입, 컬렉션 타입 및 운영체제 서비스를 사용해 <b class="heavy">애플리케이션의 기본적인 기능을 관리</b>하는 프레임워크이다.

### 몇 가지 <b class="heavy">Foundation</b>의 기능들에 대해 알아보자.

## Fundamentals
- <b class="heavy">Number, Data, and Basic Values</b> : 기본적인 변수 타입
- <b class="heavy">Strings and Text</b> : 유니코드 문자열, 정규식에 관련된 처리
- <b class="heavy">Collections</b> : 컬렉션 타입 관련된 처리
- <b class="heavy">Dates and Times</b> : 날짜, 시간 관련된 처리
- <b class="heavy">Units and Measurement</b> : 단위 간의 로케일 관련된 처리
- <b class="heavy">Data Formatting</b>
- <b class="heavy">Filters and Sorting</b> : 컬랙션 검사 및 정렬 관련된 처리

## App Support
- <b class="heavy">Task Management</b> : 앱의 작업을 관리하고 시스템 서비스와 상호작용하는 방식을 관리
- <b class="heavy">Resources</b> : 앱과 함께 번들로 제공되는 자산 및 기타 데이터에 액세스
- <b class="heavy">Notifications</b> : Notification Center등에 관련된 처리
- <b class="heavy">App Extension Support</b> : 앱 확장과 호스팅 앱 간의 상호 작용을 관리
- <b class="heavy">Errors and Exception</b>
- <b class="heavy">Scripting Support</b> : 사용자가 AppleScript 및 기타 자동화 기술로 앱을 제어 등의 기능

## Files and Data Persistence
- <b class="heavy">File System</b> : 파일 시스템에서 파일과 폴더를 만들고, 읽고, 쓰고, 검사 등의 기능
- <b class="heavy">Archives and Serialization</b> : 객체와 값을 속성 목록, JSON 및 기타 플랫 이진 표현으로 또는 그 반대로 변환 등의 기능
- <b class="heavy">Preferences</b> : 앱 구성을 위한 도메인 범위 정보를 지속적으로 저장 등의 기능 (UserDefaults)
- <b class="heavy">Spotlight</b> : 로컬 장치에서 파일 및 기타 항목을 검색하고 검색을 위해 앱 콘텐츠를 인덱싱 등의 기능
- <b class="heavy">iCloud</b> : 사용자의 iCloud 기기 간에 자동으로 동기화되는 파일 및 키-값 데이터를 관리 등의 기능
- <b class="heavy">Optimizing App Data for iCloud Backup</b> : iCloud 백업이 앱 데이터에 필요한 공간과 시간을 최소화 등의 기능

## Networking
- <b class="heavy">URL Loading System</b> : URL과 상호 작용하고 표준 인터넷 프로토콜을 사용하여 서버와 통신 등의 기능
- <b class="heavy">Bonjour</b> : 로컬 네트워크에서 쉽게 검색할 수 있도록 서비스를 광고하거나 다른 사람이 광고한 서비스를 검색 등의 기능

## Low-Level Utillities
- <b class="heavy">XPC</b> : 안전한 프로세스 간 통신 관리 등의 기능
- <b class="heavy">Object Runtime</b> : 기본 Objective-C 기능, Cocoa 디자인 패턴 및 Swift 통합에 대한 하위 수준 지원
- <b class="heavy">Processes and Threads</b> : 호스트 운영 체제 및 기타 프로세스와 앱의 상호 작용을 관리하고 낮은 수준의 동시성 기능
- <b class="heavy">Streams, Sockets, and Ports</b> : 저수준 Unix 기능을 사용하여 파일, 프로세스 및 네트워크 간의 입력 및 출력 관리

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://developer.apple.com/documentation/foundation">Developer Apple</a>
</li>
</ul>
