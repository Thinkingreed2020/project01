import { HistoryRecord } from '../models/HistoryRecord'

@Component
export struct HistoryCard {
  @Prop item: HistoryRecord

  build() {
    Row({ space: 14 }) {
      Image(this.item.image)
        .width(105)
        .height(105)
        .borderRadius(8)
        .objectFit(ImageFit.Cover)

      Column({ space: 13 }) {
        Text(this.item.title)
          .width('100%')
          .fontSize(17)
          .fontWeight(FontWeight.Medium)
          .fontColor('#181B22')
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })

        Text(this.item.createTime)
          .width('100%')
          .fontSize(13)
          .fontColor('#9297A1')

        Text(this.item.status)
          .width('100%')
          .fontSize(14)
          .fontColor('#1687E8')
      }
      .layoutWeight(1)
      .height(105)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }
}