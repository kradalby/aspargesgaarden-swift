import Foundation
import Plot
import Publish

struct Webpage: Website, AspargesgaardenWebsite {
  enum SectionID: String, WebsiteSectionID {
    case about
    case stable
    case barn
    case gallery
    case contact
  }

  struct ItemMetadata: WebsiteItemMetadata {
    // Add any site-specific metadata that you want to use here.
  }

  var url = URL(string: "https://aspargesgaarden.no")!
  var name = "Aspargesgården"
  var description = ""
  var language: Language { .norwegianBokmål }
  var imagePath: Path? { "/bilder/laavenbilde.jpg" }
  var favicon: Favicon? { Favicon(path: "/ikoner/favicon.svg", type: "image/svg+xml") }

  var contacts: [(ContactPoint, String)] {
    [
      (.facebook, "aspargesgaarden"),
      (.instagram, "aspargesgaarden"),
    ]
  }
}
try Webpage().publish(
  withTheme: .aspargesgaarden,
  additionalSteps: [])
