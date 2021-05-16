import Plot
import Publish

extension Node where Context == HTML.BodyContext {

  static func renderBarn() -> Node {
    return div(
      .class(""),
      .div(
        .headline("Låven")
      ),
      .div(
        .class("relative mx-auto lg:w-244"),
        .img(
          .class("relative top-0 left-0"),
          .src("/bilder/laavenbilde.jpg"),
          .alt("Dekket bord i fjøset")
        ),
        .img(
          .class("w-36 md:w-48 lg:w-60 lg:w-72 absolute top-8 left-2/3"),
          .src("/ikoner/120.png"),
          .alt("120 Personer")
        )
      ),
      .div(
        .class("relative mx-auto lg:w-236 py-8 md:py-12"),
        .img(
          .class("relative top-0 left-0"),
          .src("/bilder/laaven2.jpg"),
          .alt("Dekket bord i fjøset")
        ),
        .img(
          .class("w-36 md:w-48 lg:w-60 lg:w-72 absolute top-16 left-2/3"),
          .src("/ikoner/info.png"),
          .alt("Sonos, skjermer, bar, scene, kjøkken")
        )
      )
    )
  }
}
