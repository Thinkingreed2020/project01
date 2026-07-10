
import { router } from '@kit.ArkUI'
import { TopNav,Xuanpin } from '../components/Xuanpin/Index'

@Entry
@Component
struct Index {
  @State isBack:boolean=true
  @State isHistory:boolean=true
  @State isLove:boolean=true

  build() {
    Column(){
      TopNav()
      Button('goToAnotherPage').onClick(()=>{
        router.push({
          url:'pages/AnotherPage'
        })
      })
    }

}
}