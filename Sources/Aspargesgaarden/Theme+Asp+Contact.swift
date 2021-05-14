import Plot
import Publish

extension Node where Context == HTML.BodyContext {

  static func renderContact() -> Node {
    return div(
      .class("flex flex-row flex-wrap"),
      .div(
        .class("w-full md:w-1/2 flex flex-col flex-wrap"),
        .div(
          .headline("Kontakt")
        ),
        .div(
          .class("md:pl-24"),
          .infoBullet(icon: "tlf", text: "+47 90 91 98 12"),
          .infoBullet(icon: "mail", text: "kristine (at) aspargesgaarden (dot) no"),
          .infoBullet(icon: "location", text: "Østbyveien 75, 3280 Tjodalyng")
        )
      ),
      .div(
        .class("w-full md:w-1/2 md:pr-24"),
        .iframe(
          .class("p-2 pt-4 h-96 w-full"),
          .src(
            "https://calendar.google.com/calendar/embed?src=klatrerosen.no_hgf7kiksq8hrmilogq5nd6f4rs%40group.calendar.google.com&ctz=Europe%2FOslo"
          ),
          .frameborder(false)
        )
      )
    )
  }

  static func infoBullet(icon: String, text: String) -> Node {
    return div(
      .class("p-2"),
      .img(
        .class("w-12 pr-2 inline-block"),
        .src("/ikoner/\(icon).svg"),
        .alt(text)),
      .p(
        .class("inline-block text-brown text-lg tk-rift-soft"),
        .text(text)
      )
    )
  }
}
