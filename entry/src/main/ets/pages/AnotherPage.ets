import { TopNav } from '../components/TopNav'

@Entry
@Component
struct AnotherPage {
  build() {
    Column() {
      TopNav({
        isBack: true,
        isHistory: false,
        isLove: false
      })


      Text('这是详情页')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 24, right: 24, top: 40 })
  }
}