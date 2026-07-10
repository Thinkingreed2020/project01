import { router } from '@kit.ArkUI'
import { HistoryCard } from '../components/HistoryCard'
import { HistoryRecord } from '../models/HistoryRecord'

@Entry
@Component
struct HistoryPage {
  @State historyList: HistoryRecord[] = [
    {
      id: 1,
      title: 'DONEED连衣裙',
      createTime: '2026-03-24 10:18:40创建',
      status: '询盘结束',
      image: $r('app.media.product1'),
      isHistoryManageActived:false
    },
    {
      id: 2,
      title: 'CHOCOOLATE休闲套装',
      createTime: '2026-03-24 10:18:40创建',
      status: '询盘结束',
      image: $r('app.media.product2'),
      isHistoryManageActived:false
    },
    {
      id: 3,
      title: 'DONEED连衣裙',
      createTime: '2026-03-24 10:18:40创建',
      status: '询盘结束',
      image: $r('app.media.product1'),
      isHistoryManageActived:false
    },
    {
      id: 4,
      title: 'CHOCOOLATE休闲套装',
      createTime: '2026-03-24 10:18:40创建',
      status: '询盘结束',
      image: $r('app.media.product2'),
      isHistoryManageActived:false
    }
  ]
  deleteHistory(index:number){

  }

  build() {
    Column() {
      this.Header()

      if (this.historyList.length === 0) {
        this.EmptyContent()
      } else {
        this.HistoryContent()
        this.BottomActionBar()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F8FF')
  }

  @Builder
  Header() {
    Row() {
      Image($r('app.media.back'))
        .width(39)
        .height(39)
        .objectFit(ImageFit.Contain)
        .onClick(() => {
          router.back()
        })

      Text('历史记录')
        .layoutWeight(1)
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
        .fontColor('#1F2329')
        .textAlign(TextAlign.Center)

      // 与左侧返回按钮等宽，保证标题真正居中
      Blank()
        .width(39)
        .height(39)
    }
    .width('100%')
    .height(64)
    .padding({
      left: 14,
      right: 14
    })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  HistoryContent() {
    List({ space: 14 }) {
      ForEach(
        this.historyList,
        (item: HistoryRecord) => {
          ListItem() {
            HistoryCard({
              item: item
            })
          }
        },
        (item: HistoryRecord) => item.id.toString()
      )
    }
    .width('100%')
    .layoutWeight(1)
    .padding({
      left: 8,
      right: 8,
      top: 12,
      bottom: 12
    })
    .scrollBar(BarState.Off)
  }

  @Builder
  EmptyContent() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(260)
        .height(200)
        .objectFit(ImageFit.Contain)

      Text('暂无收藏')
        .fontSize(16)
        .fontColor('#555B66')
        .margin({
          top: 28
        })
    }
    .width('100%')
    .layoutWeight(1)
    .padding({
      top: 100
    })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  BottomActionBar() {
    Row({ space: 28 }) {
      Button('清空')
        .width(86)
        .height(44)
        .fontSize(15)
        .fontColor('#3288F0')
        .backgroundColor('#E7F1FF')
        .borderRadius(22)
        .onClick(() => {
          this.historyList = []
        })

      Button('管理')
        .layoutWeight(1)
        .height(44)
        .fontSize(16)
        .fontColor(Color.White)
        .backgroundColor('#1677FF')
        .borderRadius(22)
        .onClick(()=>{
          this.historyList[].isHistoryManageActived!=this.historyList[].isHistoryManageActived
        })
    }
    .width('100%')
    .height(76)
    .padding({
      left: 24,
      right: 24,
      top: 12,
      bottom: 12
    })
    .backgroundColor(Color.White)
    .alignItems(VerticalAlign.Center)
  }
}