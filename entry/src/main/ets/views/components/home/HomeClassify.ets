import { router, Router } from '@kit.ArkUI'

@Component
struct HomeClassify {
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  build() {
    Column(){
      Row(){
        Image($r('app.media.tuijian')).width(30)
        Image($r('app.media.jeidu')).width(30)
        Image($r('app.media.guliang')).width(30)
        Image($r('app.media.xioaji')).width(30).onClick(()=>{
          router.pushUrl({
            url:'views/Activity'
          })
        })
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({bottom:10})
      Row(){
        Text('食品推荐')
        Text('配料解读')
        Text('食物估量')
        Text('减脂小记')
      }.width('100%').justifyContent(FlexAlign.SpaceAround)
    }
  }
}

export default HomeClassify