@Component
export struct TabSelector {
  @Prop tabItems: string[]
  @Link checkIndex: number

  build() {
    Row({ space: 12 }) {
      ForEach(this.tabItems, (tab: string, index: number) => {
        Text(tab)
          .padding({ top: 6, bottom: 6, left: 10, right: 10 })
          .backgroundColor(this.checkIndex === index ? '#34CDE4' : Color.White)
          .borderRadius(15)
          .fontSize(12)
          .fontColor(this.checkIndex === index ? '#fff' : '#000')
          .onClick(() => {
            this.checkIndex = index
          })
      }, (tab: string) => tab)
    }
    .width('100%')
  }
}