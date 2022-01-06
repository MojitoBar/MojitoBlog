---
date: 2022-01-06 13:46
description: URLSession이란?
tags: iOS, Swift
---

## URLSession?
### 애플에서는 URLSession을 아래와 같이 설명한다.

<br/>
<img src="/images/urlsessionImage.png"/>
<blockquote><b class="inyong">관련된 네트워크 데이터 전송 작업 그룹을 조정하는 개체입니다.</b></blockquote>
### <b class="bold">URLSession</b>은 iOS에서 제공하는 HTTP를 이용한 네트워킹을 통해 데이터를 주고 받을 수 있게 도와주는 API를 제공하는 클래스이다.

### <b class="heavy">URLSession</b>은 <b class="heavy">Thread-Safty</b>하기 때문에 어떤 스레드에서든 자유롭게 <b class="bold">Session</b>과 <b class="bold">Task</b>를 생성할 수 있다.

### <b class="heavy">URLSession</b>은 <b class="heavy">URLSessionConfiguration</b>을 통해 생성할 수 있다.
### 이렇게 생성된 <b class="heavy">URLSession</b>을 통해 한 개 이상의 <b class="heavy">URLSessionTask</b>를 생성할 수 있으며, 이 <b class="heavy">URLSessionTask</b>를 통해 실제로 서버와 통신을 할 수 있다.

## URLSessionConfiguration
### <b class="heavy">URLSessionConfiguration</b>은 아래 세가지 타입을 가진다.
- <b class="heavy">Default</b>: 기본적인 네트워킹 정책을 사용
- <b class="heavy">Ephemeral</b>: 쿠키와 캐시를 저장하지 않을 때 사용
- <b class="heavy">Background</b>: 앱이 background에 있을 때 컨텐츠를 다운로드 혹은 업로드할 때 사용

## URLSessionTask
### <b class="heavy">URLSessionTask</b> 또한 작업에 따라 세가지로 분류할 수 있다.
- <b class="heavy">URLSessionDataTask</b>: 데이터를 받는 작업 수행 시 사용합니다. background 세션에 대한 지원을 하지 않습니다.
- <b class="heavy">URLSessionUploadTask</b>: 데이터 업로드 시 사용합니다.
- <b class="heavy">URLSessionDownloadTask</b>: 데이터 다운로드 시 사용합니다.


## URLSession 실습
```swift
// URLSessionConfiguration default로 생성
let config = URLSessionConfiguration.default
// config로 session 생성
let session = URLSession(configuration: config)

// URL 객체 생성
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song&term=BTS")!
let requestURL = urlComponents.url!

// 만들어둔 URL 객체로 data task 생성
let dataTask = session.dataTask(with: requestURL) { (data, response, error) in

    guard error == nil else {
        return
    }
    
    // HTTP 응답 여부 확인
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
        return
    }
    
    // HTTP 응답 성공 범위
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        return
    }
    
    // 네트워크를 통해 받은 데이터를 resultData에 저장
    guard let resultData = data else { return }
    
    // 데이터 파싱 및 결과 출력
    do {
        let decoder = JSONDecoder()
        // 여기서 Response는 JSON정보를 담기 위해 임의로 만들어둔 구조체 
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("--> tracks: \(tracks)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }
}

dataTask.resume()
```

### URLSession을 이용한 네트워킹을 좀 더 간편하게 하기위해 Alamofire나 Moya와 같은 유명한 라이브러리들이 있는데, 후에 프로젝트에서 통신 기능을 개발하며 사용해봐야겠다.


<br/>
## 참고자료
<ul>
<li>
    <a href="https://velog.io/@folw159/iOS-URLSession">jaekyeong.log</a>
</li>
<li>
    <a href="https://developer.apple.com/documentation/foundation/urlsession">Developer Apple</a>
</li>
</ul>
