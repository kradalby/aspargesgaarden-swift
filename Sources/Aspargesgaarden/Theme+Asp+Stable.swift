import Plot
import Publish

extension Node where Context == HTML.BodyContext {

  static func renderStable() -> Node {
    return div(
      .class(""),
      .div(
        .headline("Fjøset")
      ),
      .div(
        .class("relative mx-auto lg:w-244"),
        .img(
          .class("relative top-0 left-0"),
          .src("/bilder/fjoset1.jpg"),
          .alt("Dekket bord i fjøset")
        ),
        .img(
          .class("absolute w-36 -bottom-8 left-1/2 md:w-48 lg:w-60"),
          .src("/ikoner/68.png"),
          .alt("68 Personer")
        )
      ),
      .div(
        .class("relative py-10 mx-auto lg:w-236"),
        .img(
          .class("relative top-0 left-0"),
          .src("/bilder/fjoset4.jpg"),
          .alt("Dekket bord i fjøset")
        ),
        .img(
          .class("absolute w-36 bottom-0 left-1/2 md:w-48 lg:w-60"),
          .src("/ikoner/info2.png"),
          .alt("Sonos, skjermer, bar, scene, kjøkken")
        )
      )
    )
  }
}
