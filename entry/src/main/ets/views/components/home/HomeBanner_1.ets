

@Component
@Entry
struct HomeBanner_1 {
  private innerResource: Resource = $rawfile('video.mp4');

  @State text:string='+关注'
  @State text_color:string=''
  build() {
    Column() {

      Video({
        src: this.innerResource,
      }).width('100%').height(200).margin({bottom:20}).loop(true)
      Text('为什么你煮的银耳羹不出胶，教你一招，煮出来粘稠顺滑，香甜好喝').fontSize(26)
      Row(){
        Text('53万次播放').margin({left:10,right:20}).fontColor("#faa9a6a6")
        Text('2022年07月09日').fontColor("#faa9a6a6")
      }.width("100%").justifyContent(FlexAlign.Start).margin({top:20})
      Row(){
        Image($r('app.media.zan')).width(25).margin({right:5}).fillColor(this.text_color).onClick(()=>{
          this.text_color='#fff30202'
        })
        Text('2万').margin({right:20})
        Image($r('app.media.jingbao')).width(25).margin({right:5})
        Text('举报/反馈').margin({right:35})
        Text('服务升级 | 原网页>')
      }.margin({top:10})
      Row(){
        Image($r('app.media.touxiang')).width(50).borderRadius(50)
        Text('家的味道')
        Blank().width(150)
        Button(this.text).onClick(()=>{
          this.text='已关注'
        })
      }.width("90%").borderWidth({top:1,bottom:1}).borderColor("#faa9a6a6").margin({top:10}).padding(5)
    }
  }
}
