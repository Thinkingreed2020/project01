import { router } from '@kit.ArkUI'

@Entry
@Component
struct HistoryPage {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        // 返回按钮
        Image($r('app.media.back'))
          .width(39)
          .height(39)
          .onClick(() => {
            router.back()
          })

        // 标题
        Text('历史记录')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1F2329')

        // 更多按钮
        // 功能暂时搁置
        Image($r('app.media.more'))
          .width(39)
          .height(39)
      }
      .width('100%')
      .height(56)
      .padding({
        left: 15,
        right: 15
      })
      .alignItems(VerticalAlign.Center)

      // 空状态区域
      Column() {
        // 仓库目前没有图中的空状态插画，
        // 需要将图片放入 media，并命名为 history_empty.png
        Image($r('app.media.startIcon'))
          .width(320)
          .height(210)
          .objectFit(ImageFit.Contain)

        Text('暂无收藏')
          .fontSize(16)
          .fontColor('#555B66')
          .margin({
            top: 35
          })
      }
      .width('100%')
      .margin({
        top: 105
      })
      .alignItems(HorizontalAlign.Center)

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8FAFF')
    .padding({
      top: 12
    })
  }
}