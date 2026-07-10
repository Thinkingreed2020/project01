@Component
export struct InputPanel {
  @Prop checkIndex: number
  @State message: string = ''

  build() {
    if (this.checkIndex === 0) {
      this.SupplierPanel()
    } else if (this.checkIndex === 1) {
      this.InquiryPanel()
    } else {
      this.ConsultPanel()
    }
  }

  @Builder
  SupplierPanel() {
    Column() {
      TextArea({
        text: this.message,
        placeholder: '请输入供应商需求'
      })
        .width('100%')
        .height(120)
        .backgroundColor(Color.Transparent)
        .onChange((value: string) => {
          this.message = value
        })

      Row() {
        Blank()

        Button('发送')
          .height(36)
          .borderRadius(18)
      }
      .width('100%')
    }
    .width('90%')
    .height(180)
    .padding({ left: 12, right: 12, top: 8, bottom: 12 })
    .backgroundColor('#F5F5F5')
    .borderRadius(18)
  }

  @Builder
  InquiryPanel() {
    Column() {
      TextArea({
        text: this.message,
        placeholder: '请输入询盘需求'
      })
        .width('100%')
        .height(120)
        .backgroundColor(Color.Transparent)
        .onChange((value: string) => {
          this.message = value
        })

      Row() {
        Row({ space: 6 }) {
          Image($r('app.media.upload'))
            .width(18)
            .height(18)

          Text('上传图片')
            .fontSize(12)
        }
        .padding({ left: 10, right: 10, top: 6, bottom: 6 })
        .borderRadius(16)
        .backgroundColor('#EEF8FF')

        Blank()

        Button('发送')
          .height(36)
          .borderRadius(18)
      }
      .width('100%')
    }
    .width('90%')
    .height(180)
    .padding({ left: 12, right: 12, top: 8, bottom: 12 })
    .backgroundColor('#F5F5F5')
    .borderRadius(18)
  }

  @Builder
  ConsultPanel() {
    Column() {
      TextArea({
        text: this.message,
        placeholder: '请输入想咨询的问题'
      })
        .width('100%')
        .height(120)
        .backgroundColor(Color.Transparent)
        .onChange((value: string) => {
          this.message = value
        })

      Row() {
        Blank()

        Button('发送')
          .height(36)
          .borderRadius(18)
      }
      .width('100%')
    }
    .width('90%')
    .height(180)
    .padding({ left: 12, right: 12, top: 8, bottom: 12 })
    .backgroundColor('#F5F5F5')
    .borderRadius(18)
  }
}