import Plot
import Publish

extension Theme where Site: AspargesgaardenWebsite {
  /// The default "Foundation" theme that Publish ships with, a very
  /// basic theme mostly implemented for demonstration purposes.
  public static var aspargesgaarden: Self {
    Theme(
      htmlFactory: AspargesgaardenHTMLFactory()
    )
  }
}

public protocol AspargesgaardenWebsite {
  var contacts: [(ContactPoint, String)] { get }
}

let bodyCss = "antialiased flex flex-col h-screen justify-between"

private struct AspargesgaardenHTMLFactory<Site: Website>: HTMLFactory
where Site: AspargesgaardenWebsite {
  func makeIndexHTML(
    for index: Index,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site),
      .body(
        .class(bodyCss),
        .header(for: context, selectedSection: nil),
        .div(
          .style(
            "background: url(/ikoner/forside.jpg) no-repeat center center fixed; background-size: cover;"
          ),
          .class("h-screen flex flex-col justify-center"),
          .div(
            .class("text-center text-white text-3xl lg:text-4xl tk-rift-soft"),
            .text("Velkommen til")
          ),
          .div(
            .class("text-center text-white text-5xl lg:text-8xl py-6 tk-luxus-brut"),
            .text("Aspargesgården")
          ),
          .contact()
        ),
        .footer(for: context.site)
      )
    )
  }

  func makePageHTML(
    for page: Page,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        .class(bodyCss),
        .header(for: context, selectedSection: nil),
        .renderPage(for: page),
        .footer(for: context.site)
      )
    )
  }

  func makeSectionHTML(
    for section: Section<Site>,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML()
  }

  func makeItemHTML(
    for item: Item<Site>,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML()
  }

  func makeTagListHTML(
    for page: TagListPage,
    context: PublishingContext<Site>
  ) throws -> HTML? {
    HTML()
  }

  func makeTagDetailsHTML(
    for page: TagDetailsPage,
    context: PublishingContext<Site>
  ) throws -> HTML? {
    HTML()
  }
}

extension Node where Context == HTML.BodyContext {
  fileprivate static func header<T: AspargesgaardenWebsite>(
    for context: PublishingContext<T>,
    selectedSection: T.SectionID?
  ) -> Node {
    let sectionIDs = T.SectionID.allCases

    return .header(
      .class("flex flex-wrap items-center px-4 lg:px-16 py-0 lg:py-2 border-b border-brown-border"),
      .div(
        .class("flex flex-1 justify-between items-center"),
        .a(
          .href("/"),
          .img(
            .class("h-28"),
            .src("/ikoner/logo.svg"), .alt("Aspargesgården"))
        )
      ),
      .label(
        .for("menu-toggle"),
        .class("cursor-pointer lg:hidden block"),
        .element(
          named: "svg",
          nodes: [
            .class("fill-current text-brown-link"),
            .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"),
            .attribute(named: "width", value: "20"),
            .attribute(named: "height", value: "20"),
            .attribute(named: "viewBox", value: "0 0 20 20"),
            .element(
              named: "title",
              nodes: [
                .text("menu")
              ]),
            .element(
              named: "path",
              attributes: [
                .attribute(
                  named: "d",
                  value: "M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"
                )
              ]),
          ])
      ),
      .input(
        .class("hidden lg:hidden lg:flex lg:items-center lg:w-auto w-full"),
        .type(.checkbox),
        .id("menu-toggle")),
      .div(
        .class("hidden lg:flex lg:items-center lg:w-auto w-full"),
        .id("menu"),
        .nav(
          .ul(
            .class("lg:flex items-center justify-between, text-base text-brown-link"),
            .id("menu"),
            .forEach(sectionIDs) { section in
              .li(
                .class(
                  "py-3 px-0 lg:p-4 lg:px-6 block"),
                .a(
                  .class("hover:text-brown-link-active font-medium text-xl tk-rift-soft"),
                  .href(context.sections[section].path),
                  .text(self.sectionName(context.sections[section].id as! Webpage.SectionID))
                ))
            })
        )
      )
    )
  }

  static func sectionName(_ sectionID: Webpage.SectionID) -> String {
    switch sectionID {
    case .about:
      return "Om Oss"
    case .stable:
      return "Fjøset"
    case .barn:
      return "Låven"
    case .gallery:
      return "Bilder"
    case .contact:
      return "Kontakt"
    }
  }

  fileprivate static func renderPage(
    for page: Location
  ) -> Node {
    switch page.path {
    case "about":
      return .renderAbout()
    case "stable":
      return .renderStable()
    case "barn":
      return .renderBarn()
    case "gallery":
      return .renderGallery()
    case "contact":
      return .renderContact()
    default:
      return div(.text("404"))
    }
  }

  static func contact() -> Node {
    return div(
      .class("w-36 lg:w-44 py-3 mx-auto"),
      .a(
        .href("/about"),
        .img(.src("/ikoner/takontakt.png"), .alt("Ta kontakt")))
    )
  }

  static func headline(_ text: String) -> Node {
    return h1(
      .class(
        "text-center md:text-left md:pl-24 text-brown text-6xl md:text-8xl pt-10 lg:pt-12 py-6 xl:pt-12 tk-luxus-brut"
      ),
      .text(text)
    )
  }

  static func paragraph(_ text: String) -> Node {
    return p(
      .class("pb-3"),
      .text(
        text
      )
    )
  }

  fileprivate static func footer<T: AspargesgaardenWebsite>(for site: T) -> Node {
    return .footer(
      .class("w-full text-center p-4"),
      .div(
        .forEach(
          site.contacts,
          { (contactPoint, handler) in
            .a(
              .class(
                "inline-block w-14 h-14 p-2 transform transition duration-200 ease-in-out hover:scale-125"
              ), .href(contactPoint.url(handler)), contactPoint.img)
          }
        )
      )
    )
  }
}

public enum ContactPoint {
  case facebook, instagram

  func url(_ handler: String) -> String {
    switch self {
    case .facebook:
      return "https://facebook.com/\(handler)"
    case .instagram:
      return "https://instagram.com/\(handler)"
    }
  }

  var img: Node<HTML.AnchorContext> {
    switch self {
    case .facebook:
      return .img(.src("/ikoner/fb.png"), .alt("Facebook"))
    case .instagram:
      return .img(.src("/ikoner/insta.png"), .alt("Instagram"))
    }
  }
}
