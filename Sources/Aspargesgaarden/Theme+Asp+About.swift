import Plot
import Publish

extension Node where Context == HTML.BodyContext {

  static func renderAbout() -> Node {
    return div(
      .class("flex flex-col"),
      .div(
        .headline("Om oss")
      ),
      .div(
        .class("flex flex-row flex-wrap"),
        .div(
          .class("w-full md:w-1/2 px-5 md:px-24 text-brown-text"),
          .paragraph(
            "Aspargesgården byr på sjarmerende og unike lokaler i landlige omgivelser, ved kysten i Vestfold."
          ),
          .paragraph(
            "Lokalene har bar, scene, skjermer, musikkanlegg og et stort kjøkken med alt av utstyr. I tillegg alt av duker, bestikk, servise og pynt."
          ),
          // .a(.href("https://www.instagram.com/bondenshage/"), .text("Bondens Hage")),
          .paragraph(
            "Bondens Hage har dekorert de vakre blomstene til bildene. Vi formidler gjerne kontakt til profesjonelle kokker og catering."
          ),
          .contact()
        ),
        .div(
          .class("w-full md:w-1/2 flex flex-row flex-wrap justify-center md:pr-24"),
          .forEach([
            "bryllup", "bursdag", "feiring", "nyttaar",
            "julebord", "daap", "konfirmasjon",
            "vitnemaal", "konferanse", "minnestund",
          ]) { icon in
            .img(.src("/ikoner/\(icon).svg"), .alt(icon))
          }
        )
      )
    )
  }

}
