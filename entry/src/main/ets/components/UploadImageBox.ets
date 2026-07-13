import { BusinessError } from '@kit.BasicServicesKit'
// 引入图片选择器
import { photoAccessHelper } from '@kit.MediaLibraryKit'

@Component
export struct TextAreaXP {
  @State selectedUri: string = ''
  onUpload: (uri: string) => void = () => {}

  async selectPhoto(): Promise<void> {
    // 选择图片
    // 1. 初始化选择器
    const options = new photoAccessHelper.PhotoSelectOptions()
    // 2. 设置选择器选项
    options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE
    // 3. 设置最大选择数量
    options.maxSelectNumber = 1

    try {
      // 4. 打开选择器
      const picker = new photoAccessHelper.PhotoViewPicker()
      // 5. 处理选择结果
      const result: photoAccessHelper.PhotoSelectResult = await picker.select(options)
      if (result.photoUris.length === 0) {
        return
      }
      // 6. 处理选择结果
      // 6.1 保存选择的图片URI
      this.selectedUri = result.photoUris[0]
      // 6.2 调用上传回调，把图片的地址返回给父组件
      this.onUpload(this.selectedUri)
    } catch (error) {
      const businessError = error as BusinessError
      console.error(`选择图片失败，code: ${businessError.code}, message: ${businessError.message}`)
    }
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.selectedUri.length > 0) {
        Image(this.selectedUri)
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Contain)
          .borderRadius(10)

        Column() {
          Blank()
          Row() {
            Blank()
            Text('重新选择')
              .fontSize(13)
              .fontColor('#FFFFFF')
              .padding({ left: 14, right: 14, top: 7, bottom: 7 })
              .backgroundColor('#99000000')
              .borderRadius(16)
          }
          .width('100%')
        }
        .width('100%')
        .height('100%')
        .padding({ right: 12, bottom: 12 })
      } else {
        Column({ space: 20 }) {
          Image($r('app.media.upload'))
            .width(47)
            .height(47)
          Text('上传商品图')
            .fontSize(19)
            .fontWeight(FontWeight.Bold)
          Text('支持JPG/PNG格式文件，大小不超过5MB')
            .fontSize(12)
            .fontColor('#333333')
        }
        .alignItems(HorizontalAlign.Center)
      }
    }
    .onClick(() => {
      this.selectPhoto()
    })
    .width('100%')
    .height(182)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .borderWidth(1)
    .borderColor('#EEEEEE')
    .borderStyle(BorderStyle.Dashed)
  }
}
