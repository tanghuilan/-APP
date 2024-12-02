import { router } from '@kit.ArkUI'

class Item{
  Image:ResourceStr=''
  Title:string=''
  Text:string=''
  work:string=''
}
@Component
export struct HomeSubarea {
  @State items:Item[]=[
    {Image:$r('app.media.jingxuan01'),Title:'中医建议：秋天养头发',Text:'10/28',work:'阅读2000'},
    {Image:$r('app.media.jingxuan02'),Title:'经常失眠睡不着，可以试试这些安眠方法',Text:'10/29',work:'阅读2500'},
    {Image:$r('app.media.jingxuan03'),Title:'吃玉米对身体有什么好处？',Text:'10/30',work:'阅读2180'},
  ]
  build() {
    Column() {
      //题目
      Column() {
        Row() {
          Text('往期精选')
            .fontSize(20)
            .fontWeight(700)
          Blank()
          Row() {
            Text('更多')
              .fontSize(14)
            Image($r('app.media.more'))
              .width(14).margin({left:5})
              .fillColor('#ff9b9a9a')
          }.onClick(()=>{
            router.pushUrl({
              url:'views/components/home/HomeSubarea_1'
            })
          })
        }.width('100%').margin({bottom:10})
      //内容
          Column(){
          ForEach(this.items,(Item:Item)=>{
            Row() {
              Column() {
                Text(Item.Title).width('60%').fontSize(18).margin({bottom:10})
                Row(){
                  Text(Item.Text).fontColor('#6b868383')
                  Text(Item.work).fontColor('#6b868383')
                }.width('50%').justifyContent(FlexAlign.SpaceBetween)
              }
              Image(Item.Image).width(120).height(100).borderRadius(10).margin({bottom:5}).objectFit(ImageFit.Contain)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({bottom:10}).borderWidth({bottom:1}).borderColor("#37707070")
          })
        }
      }
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(15)
      .padding(15)
      .alignItems(HorizontalAlign.Start)
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

export default HomeSubarea

