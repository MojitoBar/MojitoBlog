---
date: 2021-02-28 19:29
description: SwiftUI 오픈API Xml 파일 형식 받아오기
tags: SwiftUI
---

### SwiftUI OpenAPI XML 파일
공공데이터 포털에서 OpenAPI를 사용하려고 보면 json말고 XML로 값을 리턴해주는 api가 꽤 있다.
json은 Key, value로 값을 가져오면 되지만. XML은 태그를 구분에 데이터 값을 가져오는 방식인 것 같다.

### hospitalViewController.swift
```Swift
class FetchData: NSObject, XMLParserDelegate{
    // 코로나 선별 진료소를 담을 배열
    var hospitals: [Hospital] = []
    private var nHospital: Hospital? = nil
    private var textBuffer: String = ""
    
    override init() {
        super.init()
        let xmlParser = XMLParser(contentsOf: URL(string: API_URL)
        xmlParser!.delegate = self
        xmlParser!.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    // xml 태그가 item일 때 해당 블럭을 Hospital객체 하나를 선언
        if elementName == "item" {
            nHospital = Hospital()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    // switch 문으로 태그별로 알맞은 값을 넣어줌
        switch elementName {
        case "item":
            if let hospital = nHospital{
                hospitals.append(hospital)
            }
        case "adtFrDd":
            nHospital?.adtFrDd = textBuffer
            textBuffer = ""
        case "sgguNm":
            nHospital?.sgguNm = textBuffer
            textBuffer = ""
        case "sidoNm":
            nHospital?.sidoNm = textBuffer
            textBuffer = ""
        case "spclAdmTyCd":
            nHospital?.spclAdmTyCd = textBuffer
            textBuffer = ""
        case "telno":
            nHospital?.telno = textBuffer
            textBuffer = ""
        case "yadmNm":
            nHospital?.yadmNm = textBuffer
            textBuffer = ""
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        textBuffer += string
    }
    
    // Called when a CDATA block is found
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        guard let string = String(data: CDATABlock, encoding: .utf8) else {
            print("CDATA contains non-textual data, ignored")
            return
        }
        textBuffer += string
    }
    
    // For debugging
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
        print("on:", parser.lineNumber, "at:", parser.columnNumber)
    }
}
```

태그를 받아오는 부분이 생각보다 깔끔하지는 않다... 공공데이터가 아니면 xml을 사용할까 싶긴한데 구조를 다시 짜봐야겠다.
<br>
<br>
다른 곳에서 FetchData 클래스를 선언해주기만 하면 된다.
