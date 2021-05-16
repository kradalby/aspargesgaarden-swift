import Files
import Plot
import Publish

extension Node where Context == HTML.BodyContext {

  static func renderGallery() -> Node {
    let images = getImages()
    let first = images[0]
    let rest = images[1...]
    return div(
      .class("swiper-container w-full md:w-4/5"),
      .div(
        .class("swiper-wrapper"),
        .forEach(images) { image in
          .div(
            .class("swiper-slide"),
            .img(.src("/slides/\(image)"))
          )
        }
      ),
      .div(
        .class("swiper-pagination")
      ),
      .div(
        .class("swiper-button-prev text-brown-link-active")
      ),
      .div(
        .class("swiper-button-next text-brown-link-active")
      ),
      // .script(.src("https://unpkg.com/swiper/swiper-bundle.min.js")),
      // .script(.src("/scripts/slides.js"))
      .script(
        .attribute(named: "type", value: "module"),
        .text(
          """
          import Swiper from "https://unpkg.com/swiper/swiper-bundle.esm.browser.min.js";
          const swiper = new Swiper(".swiper-container", {
            loop: true,

            // If we need pagination
            pagination: {
              el: '.swiper-pagination',
            },

            // Navigation arrows
            navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
            },
            autoplay: {
              delay: 5000,
            },
          });
          """
        ))
    )
  }

  static func getImages() -> [String] {
    do {
      return try Folder(path: "Resources/slides").files.enumerated().map { (index, file) in
        file.name
      }
    } catch {
      return []
    }
  }
}
