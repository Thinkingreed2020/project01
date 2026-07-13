@Component
@Preview
export struct CommonNavBar {
  // 传递属性
  @Prop showBack: boolean = true
  @Prop showHistory: boolean = true
  @Prop showFavorite: boolean = true
  @Prop title: string = '标题'
  @Prop backIcon: string = 'app.media.back'
  @Prop historyIcon: string = 'app.media.history'
  @Prop favoriteIcon: string = 'app.media.love'
  // 传递函数
  onBack?: () => void
  onHistory?: () => void
  onFavorite?: () => void

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Text(this.title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#111827')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Row() {
        if (this.showBack) {
          Image($r(this.backIcon))
            .width(42)
            .height(42)
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              this.onBack ? this.onBack() : this.getUIContext().getRouter().back()
            })
        }

        Blank()

        Row({ space: 10 }) {
          if (this.showHistory) {
            Image($r(this.historyIcon))
              .width(42)
              .height(42)
              .objectFit(ImageFit.Contain)
              .onClick(() => {
                this.onHistory && this.onHistory()
              })

          }
          if (this.showFavorite) {
            Image($r(this.favoriteIcon))
              .width(42)
              .height(42)
              .objectFit(ImageFit.Contain)
              .onClick(() => {
                this.onFavorite && this.onFavorite()
              })
          }
        }
      }
      .width('100%')
    }
    .width('100%')
    .height(50)
  }
}
