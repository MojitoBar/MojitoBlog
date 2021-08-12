import Plot
import Publish
import Foundation

public extension Theme {
    /// The default "Foundation" theme that Publish ships with, a very
    /// basic theme mostly implemented for demonstration purposes.
    static var MyTheme: Self {
        Theme(
            htmlFactory: MyThemeHTMLFactory(),
            resourcePaths: [
                "Resources/MojitoBlog/styles.css",
            ]
        )
    }
}

private struct MyThemeHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .contents(
                    .img(
                        .class("profile_pic"),
                        .src(Path("https://avatars.githubusercontent.com/u/16567811?v=4"))
                    ),
                    .div(
                        .a(
                            .href("/"),
                            .h1(.text("JuSeok's Blog!"))
                        ),
                        .p(
                            .class("description"),
                            .text(context.site.description)
                        )
                    ),
                    .itemList(
                        for: context.allItems(
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body(
                .header(for: context, selectedSection: section.id),
                .contents(
                    .div(
                        .class("flex_div"),
                        .img(
                            .class("profile_pic"),
                            .src(Path("https://avatars.githubusercontent.com/u/16567811?v=4"))
                        ),
                        .div(
                            .a(
                                .href("/"),
                                .h1(.text("JuSeok's Blog!"))
                            ),
                            .p(
                                .class("description"),
                                .text(context.site.description)
                            )
                        )
                    ),
                    .h1(.text(section.title)),
                    .itemList(for: section.items, on: context.site)
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item,
                  on: context.site,
                  stylesheetPaths: ["/styles.css"]),
            .body(
                .class("item-page"),
                .header(for: context, selectedSection: item.sectionID),
                .contents(
                    .article(
                        .div(
                            .class("content"),
                            .contentBody(item.body)
                        ),
                        .span("Tagged with: "),
                        .tagList(for: item, on: context.site)
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .wrapper(.contentBody(page.body)),
                .footer(for: context.site)
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .contents(
                    .h1("Browse all tags"),
                    .ul(
                        .class("all-tags"),
                        .forEach(page.tags.sorted()) { tag in
                            .li(
                                .class("tag"),
                                .a(
                                    .href(context.site.path(for: tag)),
                                    .text(tag.string)
                                )
                            )
                        }
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .contents(
                    .h1(
                        "Tagged with ",
                        .span(.class("tag"), .text(page.tag.string))
                    ),
                    .a(
                        .class("browse-all"),
                        .text("Browse all tags"),
                        .href(context.site.tagListPath)
                    ),
                    .itemList(
                        for: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
    static func contents(_ nodes: Node...) -> Node {
        .div(.class("contents"), .group(nodes))
    }
    
    static func header<T: Website>( for context: PublishingContext<T>, selectedSection: T.SectionID?) -> Node {
        let sectionIDs = T.SectionID.allCases
        return .header(
            .wrapper(
                .a(
                    .href("https://github.com/MojitoBar"),
                    .img(
                        .class("github"),
                        .src(Path("images/github.png"))
                    )
                ),
                .a(
                    .href("https://www.linkedin.com/in/%EB%8F%99%EC%84%9D-%EC%A3%BC-a70903204/"),
                    .img(
                        .class("linkedin"),
                        .src(Path("images/linkedin.png"))
                    )
                )
            ),
            .if(sectionIDs.count > 1,
                .nav(
                    .ul(.forEach(sectionIDs) { section in
                        .li(.a(
                            .class("taglist"),
                            .href(context.sections[section].path),
                            .text(context.sections[section].title)
                        ))
                    })
                )
            )
        )
    }
    
    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.description)
                    )),
                    .p(.text(item.body.html.html2String)),
                    .tagList(for: item, on: site),
                    .p(
                        .class("date"),
                        .text("| " + item.date.description.substring(from: 0, to: 19))
                    )
                ))
            }
        )
    }
    
    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(
            .class("tag-list"),
            .forEach(item.tags) { tag in
                .li(.a(
                    .href(site.path(for: tag)),
                    .text(tag.string)
                ))
            }
        )
    }
    
    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .a(
                    .text("©JuSeok "),
                    .href("https://github.com/MojitoBar")
                ),
                
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            ),
            .p(.a(
                .text("RSS feed"),
                .href("/feed.rss")
            ))
        )
    }
}

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}

extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
