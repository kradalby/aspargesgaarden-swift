import Files
import Plot
import Publish

extension Node where Context == HTML.BodyContext {

  static func renderGallery() -> Node {
    let images = getImages()
    let first = images[0]
    let rest = images[1...]
    return div(
      .class("h-screen"),
      .div(
        .class("relative w-2/3 mx-auto"),
        .div(
          .class("absolute transition-all ease-in-out duration-1000 transform translate-x-0 slide"),
          .img(.src("/bilder/\(first)"))
        ),
        .forEach(rest) { image in
          .div(
            .class(
              "absolute opacity-0 transition-all ease-in-out duration-1000 transform translate-x-full slide"
            ),
            .img(.src("/bilder/\(image)"))
          )
        },
        .script(.src("/scripts/slides.js"))
      )
    )
  }

  static func getImages() -> [String] {
    do {
      return try Folder(path: "Resources/bilder").files.enumerated().map { (index, file) in
        file.name
      }
    } catch {
      return []
    }
  }
}
