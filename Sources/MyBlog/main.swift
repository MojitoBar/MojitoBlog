import Foundation
import Publish
import Plot
import SplashPublishPlugin
// This type acts as the configuration for your website.
struct MyBlog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case ios
        case algorithm
        case old
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "JuSeok's Blog"
    var description = "Swift & iOS Technical Blog"
    var language: Language { .korean }
    var favicon: Favicon = Favicon()
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try MyBlog().publish(withTheme: .MyTheme, plugins: [.splash(withClassPrefix: "hljs-")])
