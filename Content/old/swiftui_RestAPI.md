---
date: 2021-02-28 19:29
description: SwiftUI RestAPI GET으로 json 데이터 받기
tags: SwiftUI
---



### SwiftUI RestAPI GET으로 json 데이터 받기
SwiftUI에서 RestAPI를 통해 json 데이터를 받아서 처리해야할 때 사용한 코드이다.

### RestAPI GET통신
```Swift
import SwiftUI

class ProgramCardViewModel: ObservableObject{
    init() {
        fetchPrograms()
    }
    
    let url = "http://localhost:8080/user/all"
    
    @Published var Programs: [Program] = []
    
    func fetchPrograms(){
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                self.Programs = try! JSONDecoder().decode([Program].self, from: data!)
            }
        }.resume()
    }
    
    func getPrograms() -> [Program] {
        return Programs
    }
}
```
url에 주소를 저장한 후 URLSession을 통해 데이터를 불러와 JSONDecoder를 이용해 json 형태로 만들었다.

해당 클래스가 생성될 때 서버에서 데이터를 불러와야 했기 때문에 init에서 함수를 호출해 주었다.

불러온 데이터는 Program배열에 저장 되는데 해당 변수를 @Published로 선언해야 변화를 감지할 수 있다.

<br>
<br>
뷰에선 해당 클래스를 선언해준 후 getPrograms 을 통해 배열을 받아와 ForEach로 뿌려주면 된다.
