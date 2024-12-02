import { router } from '@kit.ArkUI'

@Component
export struct HomeWelfare {

  build() {
    Column() {
      Column() {
      // 标题
        Row() {
          Text('热门推荐')
            .fontSize(20)
            .fontWeight(700)
          Blank()
          Text('更多')
            .fontSize(12)
            .fontWeight(600)
          Image($r('app.media.more'))
            .width(14).margin({left:5}).fillColor('#ff9b9a9a')
        }
        .width('100%')
        // 商品
        Row() {
            Column() {
              Image($r('app.media.tuijian01'))
                .width(150).height(120).borderRadius({topLeft:20,topRight:20,bottomLeft:5,bottomRight:5}).margin({bottom:10})
              Row(){
                Image($r('app.media.liping')).width(20).margin(5)
                Text('常吃西兰花有哪些好处？')
                  .width(110)
                  .fontSize(12)
                  .fontColor('#666')
              }.margin({bottom:20})
                Text('已有50人查看>').width(140).fontColor("#666").fontSize(10).textAlign(TextAlign.End)
            }.width(150).height(200).margin({right:10}).borderRadius({topLeft:20,topRight:20}).borderWidth(1).borderColor("#88e0dfdf")
          Column() {
            Image($r('app.media.tuijian02'))
              .width(150).height(120).borderRadius({topLeft:20,topRight:20,bottomLeft:5,bottomRight:5}).margin({bottom:10})
            Row(){
              Image($r('app.media.liping')).width(20).margin(5)
              Text('减30斤你大约需要多久？')
                .width(110)
                .fontSize(12)
                .fontColor('#666')
            }.margin({bottom:20})
            Text('已有80人查看>').width(140).fontColor("#666").fontSize(10).textAlign(TextAlign.End)
          }.width(150).height(200).margin({right:10}).borderRadius({topLeft:20,topRight:20}).borderWidth(1).borderColor("#88e0dfdf")
        }
        .margin({
          top: 20
        })
      }
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(15)
      .padding(15)
    }
    .width('100%')
    .padding({
      left: 12,
      right: 12
    })
    .margin({
      top: 8
    })
  }
}
export default HomeWelfare

