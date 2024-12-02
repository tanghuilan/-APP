import { router } from '@kit.ArkUI'
@Component
struct HomeHeader {
  build() {
    Row({space: 10}) {
      Image($r('app.media.logo'))
        .width(40)
      Row() {
        Image($r('app.media.ic_public_search'))
          .width(22)
          .fillColor('#5c5c5d')
        TextInput({
          placeholder: '请输入'
        })
          .backgroundColor(Color.Transparent)

      }
      .backgroundColor('#e5e7e9')
      .borderRadius(20)
      .layoutWeight(1)
      .padding({
        left: 10,
        right: 10
      })

      Image($r('app.media.xiaoxi'))
        .width(20).fillColor('#ffbab8b8')
      Text('登录')
        .fontSize(16)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/RegisterPage'
          })
        })
    }
    .width('100%')
    .height(58)
    .backgroundColor('#f1f3f5')
    .padding({
      left: 10,
      right: 10
    })
    .margin({bottom:10})
  }
}
export default HomeHeader