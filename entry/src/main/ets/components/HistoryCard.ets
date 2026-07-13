import { HistoryRecord } from '../models/HistoryRecord'

@Component
export struct HistoryCard {
  @Prop item: HistoryRecord

  // 是否显示删除按钮
  @Prop isManaging: boolean = false

  // 删除事件由父组件传入
  onDelete: (id: number) => void = () => {}

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
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })

        Text(this.item.status)
          .width('100%')
          .fontSize(14)
          .fontColor('#1687E8')
      }
      .layoutWeight(1)
      .height(105)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)

      if (this.isManaging) {
        Image($r(`app.media.ashbin`))
          .width(32)
          .backgroundColor('#FFF0F0')
          .borderRadius(18)
          .onClick(() => {
            this.onDelete(this.item.id)
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .alignItems(VerticalAlign.Center)
  }
}