import { router } from '@kit.ArkUI'

class Item{
  Image:ResourceStr=''
  Title:string=''
  Text:string=''
  Price:string=''
}
@Component
export struct HomeRecommend {
  private DISPLAY_COUNT: number = 1
  private MIN_SCALE: number = 0.75
  @State Items:Item[]=[
    {Image:$r('app.media.gt'),Title:'高山味绿茶',Text:'高山味绿茶|低糖减肥减脂',Price:'50'},
    {Image:$r('app.media.lizi'),Title:'清脆李子',Text:'MOLILVCHA，OKCALJELLY',Price:'40'},
    {Image:$r('app.media.mlit'),Title:'MiZHIZHUROU',Text:'茉莉味道的味道绿茶，卡路里000',Price:'50'},
    {Image:$r('app.media.img_9'),Title:'FreeBudsLipstick',Text:'FreeBudsLipstick肉松饼',Price:'20'},
    {Image:$r('app.media.img_7'),Title:'LAOBINGTANG',Text:'LAOBINGTANG香甜，可口',Price:'20'},
  ]
  @State opacityList: number[] = []
  @State scaleList: number[] = []
  @State translateList: number[] = []
  @State zIndexList: number[] = []

  aboutToAppear(): void {
    for (let i = 0; i < this.Items.length; i++) {
      this.opacityList.push(1.0)
      this.scaleList.push(1.0)
      this.translateList.push(0.0)
      this.zIndexList.push(0)
    }
  }
  build() {
    Column() {
      Column() {
        Row() {
          Text('商品精选')
            .fontSize(20)
            .fontWeight(700)
          Blank().width(160)
          Row(){
            Text('更多')
              .fontSize(12)
              .fontWeight(600)
            Image($r('app.media.more'))
              .width(14).margin({left:5}).fillColor('#ff9b9a9a')
          }.margin({left:50}).onClick(()=>{
            router.pushUrl({
              url:'views/shop'
            })
          })
        }.margin({bottom:10})
        Swiper() {
          ForEach(this.Items, (Item: Item, index: number) => {
            Column() {
              Image(Item.Image)
                .width('100%').height(200).borderRadius(5).margin({ bottom: 5 })
              Text(Item.Title)
                .fontSize(16)
                .fontWeight(600)
              Text(Item.Text)
                .fontSize(12)
                .fontColor('#666')
                .margin({
                  top: 5
                })
              Row() {
                Text('￥' + Item.Price + ' 起')
                  .fontSize(13)
                  .fontColor('#000')
                  .fontWeight(600)
                Blank()
                Text('立即购买')
                  .onClick(()=>{
                    router.pushUrl({
                      url:'pages/router_second'
                    })
                  })
                  .fontSize(13)
                  .fontColor('#000')
                  .fontWeight(600)
                  .backgroundColor('#eee')
                  .borderRadius(20)
                  .padding({
                    left: 20,
                    right: 20,
                    top: 8,
                    bottom: 8
                  })
              }
              .width('100%')
              .margin({
                top: 8
              })
              .padding({ bottom: 20 })
            }
            .alignItems(HorizontalAlign.Start)
            .opacity(this.opacityList[index])
            .scale({ x: this.scaleList[index], y: this.scaleList[index] })
            .translate({ x: this.translateList[index] })
            .zIndex(this.zIndexList[index])
          })
        }
        .height(300)
        .indicator(false)
        .displayCount(this.DISPLAY_COUNT, true)
        .customContentTransition({
          timeout: 1000,
          transition: (proxy: SwiperContentTransitionProxy) => {
            const index = proxy.index;
            if (proxy.position <= index % this.DISPLAY_COUNT || proxy.position >= this.DISPLAY_COUNT + index % this.DISPLAY_COUNT) {
              this.opacityList[index] = 1.0;
              this.scaleList[index] = 1.0;
              this.translateList[index] = 0.0;
              this.zIndexList[index] = 0;
            } else {
              if (index % this.DISPLAY_COUNT === 0) {
                this.opacityList[index] = 1 - proxy.position / this.DISPLAY_COUNT;
                this.scaleList[index] = this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - proxy.position / this.DISPLAY_COUNT);
                this.translateList[index] = - proxy.position * proxy.mainAxisLength + (1 - this.scaleList[index]) * proxy.mainAxisLength / 2.0;
              } else {
                this.opacityList[index] = 1 - (proxy.position - 1) / this.DISPLAY_COUNT;
                this.scaleList[index] = this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - (proxy.position - 1) / this.DISPLAY_COUNT);
                this.translateList[index] = - (proxy.position - 1) * proxy.mainAxisLength - (1 - this.scaleList[index]) * proxy.mainAxisLength / 2.0;
              }
              this.zIndexList[index] = -1;
            }
          }
        })
        .onContentDidScroll((selectedIndex: number, index: number, position: number, mainAxisLength: number) => {
          console.info("onContentDidScroll selectedIndex: " + selectedIndex + ", index: " + index + ", position: " + position + ", mainAxisLength: " + mainAxisLength);
        })
      }
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(15)
      .padding({
        left: 15,
        right: 15,
        top: 15
      })
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

export default HomeRecommend

