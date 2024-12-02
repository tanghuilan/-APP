import { router, Router } from '@kit.ArkUI'

@Component
export struct HomeBanner {
//轮播
  build() {
    Swiper(){
      Image($r('app.media.lunbo03'))
        .objectFit(ImageFit.Contain)
        .width('100%')
      Image($r('app.media.lunbo02')).onClick(()=>{
        router.pushUrl({
          url:'views/components/home/HomeBanner_1'
        })
      })
        .objectFit(ImageFit.Contain)
        .width('100%')
      Image($r('app.media.lunbo01'))
        .objectFit(ImageFit.Contain)
        .width('100%')
    }
    .margin({
      left: 12,
      right: 12
    })
    .margin({bottom:10})
    .borderRadius(10)
    .autoPlay(true)
    .indicator(
      Indicator.dot()
        .selectedColor(Color.Black)
    )
  }
}

export default HomeBanner

