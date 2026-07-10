import { router } from '@kit.ArkUI'

@Component
export struct TopNav{
  @State message: string = '';
  @State currentTab: number = 0
  @State isShowRecommend: boolean = false
  @Prop isBack:boolean=true
  @Prop isHistory:boolean=true
  @Prop isLove:boolean=true

  build() {
    Column(){

      Row(){
        if (this.isBack){
          Image($r(`app.media.back`)).width(39).height(39)
            .onClick(()=>{
              router.back()
            })
        }

        if (this.isHistory&&this.isLove){
          Row(){
            Image($r(`app.media.history`)).width(39).height(39).margin({right:15})
              .onClick(()=>{
              router.pushUrl({
                url:'pages/HistoryPage'
              })
              })
            Image($r(`app.media.love`)).width(39).height(39)
          }.layoutWeight(1)
          .justifyContent(FlexAlign.End)
        }

      }.width('100%')

      Row(){
        Text('供应链选品官').fontSize(30).fontColor('#5DA6E5')
          .margin({top:30})
      }

      Row(){
        Image($r('app.media.banner')).width(280).height(280)
      }.margin({bottom:80})




      RelativeContainer() {
        Row(){
          Text('选供应商')
            .width(86)
            .height(32)
            .borderRadius(16)
            .backgroundColor(this.currentTab === 0 ? '#45C6F4' : '#FFFFFF')
            .fontSize(13)
            .fontColor(this.currentTab === 0 ? '#FFFFFF' : '#666666')
            .textAlign(TextAlign.Center).onClick(()=>{
            this.currentTab=0
          })



          Text('AI询盘')
            .width(86)
            .height(32)
            .borderRadius(16)
            .backgroundColor(this.currentTab === 1 ? '#45C6F4' : '#FFFFFF')
            .fontSize(13)
            .fontColor(this.currentTab === 1 ? '#FFFFFF' : '#666666')
            .textAlign(TextAlign.Center).onClick(()=>{
            this.currentTab=1
          })
          Text('AI咨询')
            .width(86)
            .height(32)
            .borderRadius(16)
            .backgroundColor(this.currentTab === 2 ? '#45C6F4' : '#FFFFFF')
            .fontSize(13)
            .fontColor(this.currentTab === 2 ? '#FFFFFF' : '#666666')
            .textAlign(TextAlign.Center).onClick(()=>{
            this.currentTab=2
          })
        }.id('tabs')
        .alignRules({
          bottom:{
            anchor:'txt',
            align:VerticalAlign.Top
          }
        })
        .margin({
          left:20,
          right:20,
          bottom:10
        })


        TextArea({
          text: this.message,
          placeholder: '请输入内容'
        }).id('txt')
          .width('90%')
          .height(130)
          .backgroundColor('#FAFAFE')
          .borderRadius(12)
          .padding({
            left: 12,
            right: 90,
            top: 12,
            bottom: 52
          })
          .margin({
            left:20,
            right:20
          })

        Image($r('app.media.send'))
          .id('sendImg')
          .alignRules({
            bottom: { anchor: 'txt', align: VerticalAlign.Bottom },
            right: { anchor: 'txt', align: HorizontalAlign.End }
          })
          .width(28)
          .height(28)
          .align(Alignment.BottomStart)
          .margin({
            left: 12,
            bottom: 12
          })

        Button('AI推荐').fontColor(Color.Black).border({color:Color.Black,width:1,style:BorderStyle.Solid})
          .id('RecommendBtn')
          .backgroundColor(this.isShowRecommend? '#45C6F4' : '#FAFAFE')
          .alignRules({
            bottom: { anchor: 'txt', align: VerticalAlign.Bottom },
            left: { anchor: 'txt', align: HorizontalAlign.Start }
          })
          .height(36)
          .margin({
            right: 12,
            bottom: 10,
            left:10
          })
          .onClick(()=>{
            this.isShowRecommend=!this.isShowRecommend
          })
      }
      .width('100%')
      .height(180)


    }
  }



}
