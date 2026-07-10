import {TabSelector} from '../TabSelector'
import {InputPanel} from '../InputPanel'
@Component
@Entry
export struct Xuanpin{
  private tabItem:string[]=['选供应商','AI询盘','AI咨询']
  @State message:string=''
  @State isShowRecommend:boolean=false
  //@State isActive:boolean=true
  @State checkIndex:number=0
  @State dynamicPlaceHolder:string=''


  @Builder TextAreaBuilder(){
    TextArea({placeholder:this.dynamicPlaceHolder})
}



    // build() {
    //   Column(){
    //     Row({space:12}){
    //       ForEach(this.tabItem,(tab:string,index:number)=>{
    //         Text(tab)
    //           .padding({top:6,bottom:6,left:10,right:10})
    //           .backgroundColor(this.checkIndex===index?'#34CDE4':Color.White)
    //           .borderRadius(15)
    //           .fontSize(12)
    //           .fontColor(this.checkIndex===index?'#fff':'#000')
    //           .onClick(()=>{
    //             this.checkIndex=index
    //           })
    //       },(index:number)=>`{tab.toString()}`)
    //     }.width('100%')
    //     .margin({top:66})
  build(){
    Column(){
      TabSelector({
        tabItems: this.tabItem,
        checkIndex: $checkIndex
      }).width('90%')
      InputPanel({
        checkIndex:this.checkIndex
      }).margin({top:12})
      // TextArea({placeholder:this.dynamicPlaceHolder})
      //   .width('100%')
      //   .height(100)
      //   .backgroundColor('#F1F3F5')
      //   .borderRadius(8)
      //   .padding({left:10})
      //   .fontSize(14)
      //   .fontColor('#000')
      //   .placeholderColor('#C
    }
    .width('100%')




  }




      }
