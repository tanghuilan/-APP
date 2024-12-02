import { router } from '@kit.ArkUI';

@Entry
@Component
struct Health3 {
  //声明状态 点赞 颜色数字
  @State likeColor: Resource = $r('app.media.like')
  @State likeCount: number = 255
  //声明状态 收藏 颜色数字
  @State collectColor: Resource = $r('app.media.collect')
  @State collectCount: number = 500

  build() {
    Column(){
      Row(){
        Image($r('app.media.left')).width(30).height(30)
          .onClick(()=>{
            router.back()
          })
          .margin({right:90})
        Text('健康养生').fontSize(18).letterSpacing(1).margin({left:25})
      }.width('100%')
      .padding({left:10,right:10,bottom:5})
      .margin({bottom:10})
      .border({width:{bottom:1},color: '#ffffffff' })

      //滑动部分
      Scroll() {
        Column({ space: 8 }) {
          Text('从中医“五味”学养生，调养身体变简单！').fontSize(20).fontWeight(350).letterSpacing(2)
          Row({ space: 10 }) {
            Text('健康养生').fontSize(14).fontColor('#ff636ab3').letterSpacing(1)
            Text('2024年08月25日').fontSize(14).fontColor('#ff767679').letterSpacing(1)
            Text('10:01').fontSize(14).fontColor('#ff767679').letterSpacing(1)
            Text('北京').fontSize(14).fontColor('#ff767679').letterSpacing(1)
          }.width('100%')
          .margin({ bottom: 15 })
          Column(){
            Image($r('app.media.health3_1'))
            Image($r('app.media.health3_2'))
            Image($r('app.media.health3_3'))
            Image($r('app.media.health3_4'))
          }

          Text('内容来源： 人民卫生出版社\n作者： 陶陶\n编辑： 小王')
            .fontColor('#ff767679')
            .letterSpacing(2)
            .lineHeight(24)
            .width('100%')
            .padding(5)
          Row({space:5}){
            Text('#健康科普').fontSize(15).fontColor('#ff636ab3')
            Text('655').fontSize(15).fontColor('#ff767679')
          }.width('100%')

        }.padding({ left: 10, right: 10 })
      }.layoutWeight(1)

      // 固定在底部的工具栏
      Row() {
        Row({space:8}){
          Image($r('app.media.logo')).width(35).height(35)
          Text('健康养生')
        }.margin({right:120})
        //点赞收藏功能
        Row({space:20}){
          //点赞
          Column({space:3}){
            Image(this.likeColor).width(28).height(28)
            Text(this.likeCount.toString()).fontColor('#7e7e7e')
          }.onClick(()=>{
            //修改颜色 数字
            this.likeColor = $r('app.media.like1')
            this.likeCount += 1
          })
          //收藏
          Column({space:3}){
            Image(this.collectColor).width(25).height(25)
            Text(this.collectCount.toString()).fontColor('#7e7e7e')
          }.onClick(()=>{
            this.collectColor= $r('app.media.collect1')
            this.collectCount += 1
          })
        }
      }.width('100%')
      .height(60)
      .border({width:{top:1},color: '#ffd5d5db'})
      .padding({ left: 20, right: 20 })
      .margin({top:10})

    }
  }
}
