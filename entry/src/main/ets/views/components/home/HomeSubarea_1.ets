import { router } from '@kit.ArkUI'
class Item{
  id:number=0
  Image:ResourceStr=''
  Title:string=''
  Text:string=''
  work:string=''
}
@Entry
@Component
struct  HomeSubarea_1{
  @State items:Item[]=[
    {id:1,Image:$r('app.media.health1'),Title:'伪养生”的坑，你踩了几个？',Text:'10/28',work:'阅读2000'},
    {id:2,Image:$r('app.media.health2'),Title:'健康午睡，该睡多长时间 | 科普时间',Text:'10/29',work:'阅读2500'},
    {id:3,Image:$r('app.media.health3'),Title:'从中医“无味”学养生，调养身体变简单！',Text:'10/30',work:'阅读2180'},
    {id:1,Image:$r('app.media.jingxuan01'),Title:'中医建议：秋天养头发',Text:'10/28',work:'阅读2000'},
    {id:2,Image:$r('app.media.jingxuan02'),Title:'经常失眠睡不着，可以试试这些安眠方法',Text:'10/29',work:'阅读2500'},
    {id:3,Image:$r('app.media.jingxuan03'),Title:'吃玉米对身体有什么好处？',Text:'10/30',work:'阅读2180'},
    {id:1,Image:$r('app.media.jingxuan01'),Title:'中医建议：秋天养头发',Text:'10/28',work:'阅读2000'},
    {id:2,Image:$r('app.media.jingxuan02'),Title:'经常失眠睡不着，可以试试这些安眠方法',Text:'10/29',work:'阅读2500'},
    {id:3,Image:$r('app.media.jingxuan03'),Title:'吃玉米对身体有什么好处？',Text:'10/30',work:'阅读2180'},
  ]
  build() {
    Column(){
    Row(){
      Image($r('app.media.back')).width(20).margin({left:10}).onClick(()=>{
        router.back()
      })
      Text("往期精选").width("80%").fontSize(30).textAlign(TextAlign.Center)
    }
    Scroll(){
      Column(){
        ForEach(this.items,(Item:Item)=>{
          Row() {
            Column() {
              Text(Item.Title).width('60%').fontSize(18).margin({bottom:10}).onClick(()=>{
                if (Item.id==1){
                  router.pushUrl({
                    url:'pages/health1'
                  })
                }else if(Item.id==2){
                  router.pushUrl({
                    url:'pages/health2'
                  })
                }else {
                  router.pushUrl({
                    url:'pages/health3'
                  })
                }
              })
              Row(){
                Text(Item.Text).fontColor('#6b868383')
                Text(Item.work).fontColor('#6b868383')
              }.width('50%').justifyContent(FlexAlign.SpaceBetween)
            }
            Image(Item.Image).width(120).height(100).borderRadius(10).margin({bottom:5}).objectFit(ImageFit.Contain)
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({bottom:10}).borderWidth({bottom:1}).borderColor("#37707070")
        })
      }.margin(5)
    }
    }
  }
}