// import router from '@ohos.router';
import {promptAction } from '@kit.ArkUI';
import { router } from '@kit.ArkUI';
interface item{
  imgUrl:string
  title:string
  text:string
  price:number
  num:number
}
interface item02{
  imgUrl:string
  title:string
  price:number
  imgUrl02:string
}
class Tmp {
  iconStr2: ResourceStr = $r("app.media.gengduo")

  set(val: Resource) {
    this.iconStr2 = val
  }
}

@Entry
@Component
struct gm {
  @State count: number =20.2
  @State num:number=1
  @State select: boolean = true
  private scroller:Scroller = new Scroller()
  @State itemlite:item[] =[
    {imgUrl:'img_12',title:'巧克力花饼',text:'jiaying Chrysanthemum Tea',price:33.00,num:1},
    {imgUrl:'gt',title:'清新小绿茶',text:'jiaying Chrysanthemum Tea',price:40.00,num:2},
    {imgUrl:'mlit',title:'茉莉花绿茶',text:'jiaying Chrysanthemum Tea',price:50.00,num:1}
  ]
  @State itemlite02:item02[] = [
    {imgUrl:'lvd',title:'LVDOUBINGSAO',price:48,imgUrl02:'gw'},
    {imgUrl:'niuy',title:'NIUYOUGUO',price:50,imgUrl02:'gw'}
  ]
  @State itemlite03:item02[] = [
    {imgUrl:'xli',title:'BINGTIANXUELI',price:90,imgUrl02:'gw'},
    {imgUrl:'yg',title:'RGPTHUACHA',price:90,imgUrl02:'gw'}
  ]
  @State itemlite04:item02[] = [
    {imgUrl:'lizi',title:'CUIPIHUALI',price:89,imgUrl02:'gw'},
    {imgUrl:'zs',title:'ZHUSUNPP',price:61,imgUrl02:'gw'}
  ]
  @State message: string = 'Hello World';
  @State total:number = this.itemlite[0].price + this.itemlite[1].price + this.itemlite[2].price
  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "详情页", labelInfo: "详情+详情页" }).onClick(()=> {
        router.pushUrl({
          url: 'pages/router_second'
        })
      })
      MenuItem({ content: "商品页", labelInfo: "点击+购物" }).onClick(()=>{    router.pushUrl({
        url:'views/shop'
      })
      })
    }
  }

  @Builder
  MyMenu() {
    Menu() {

      MenuItemGroup({ header: '设置' }) {
        // MenuItem({ content: "更多选项" })
        //   .selectIcon(true)
        //   .selected(this.select)
        //   .onChange((selected) => {
        //     console.info("menuItem select" + selected);
        //     let Str: Tmp = new Tmp()
        //     Str.set($r("app.media.gengduo"))
        //   })
        MenuItem({
          startIcon: $r("app.media.gengduo"),
          content: "设置跳转选项",
          endIcon: $r("app.media.gengduo"),
          builder: this.SubMenu
        })
      }

    }
  }
  build() {
    RelativeContainer() {
      Scroll(this.scroller){
        Column(){
          Column(){
            //header
            Column(){
              Row(){
                Text()
                Text('我的购物车')
                  .fontSize(20)
                  .fontWeight(600)
                // .margin({right:100})
                Image($r('app.media.sz')).bindMenu(this.MyMenu)
                  .margin({right:10})
                  .width(20)
              }
              .height(20)
              .width("100%")
              .justifyContent(FlexAlign.SpaceBetween)
              // .backgroundColor("#bbffaa")
            }
            //body
            Column(){
              ForEach(this.itemlite,(item:item)=>{
                Column(){
                  Column(){
                    Row(){
                      Image($r(`app.media.${item.imgUrl}`)).onClick(()=>{
                        router.pushUrl({
                          url:'pages/router_second'
                        })

                      })
                        .borderRadius(10)
                        // .backgroundColor("red")
                        .width(100)
                        .height(100)
                        .margin({right:5})
                      Column({space:5}){
                        Text(item.title)
                          .fontColor('white')
                        Text(item.text)
                          .fontSize(8)
                          .fontColor("white")
                        Row({space:5}){
                          Text("新品上市")
                            .fontSize(10)
                            .fontColor("#45655A")
                            .backgroundColor("#d2efe2")
                            .border({
                              radius:3,
                              width:1,
                              style:BorderStyle.Solid,
                              color:'#84b29c'
                            })
                          Text("限时折扣")
                            .fontSize(10)
                            .fontColor("#45655A")
                            .backgroundColor("#d2efe2")
                            .border({
                              radius:3,
                              width:1,
                              style:BorderStyle.Solid,
                              color:'#84b29c'
                            })
                        }
                        Row(){
                          Row(){
                            Text('￥')
                              .fontColor("white")
                              .fontSize(14)
                              .margin({right:2})
                            Text(item.price.toFixed(2))
                              .fontColor("white")
                              .fontSize(22)
                            Text('/盒')
                              .fontColor("white")
                              .fontSize(14)
                          }
                          Row({space:5}){
                            Text('-').onClick(()=>{
                              this.num--


                            })
                              .fontColor("white")
                              .width(30)
                              .height(15)
                              .lineHeight(15)
                              .textAlign(TextAlign.Center)
                              .border({
                                radius:20,
                                color:'#fff',
                                width:1,
                                style:BorderStyle.Solid
                              })
                            Text(item.num+"")
                              .fontColor("white")
                              .fontSize(14)
                            Text("+").onClick(()=>{

                              this.num++


                            })
                              .fontColor("white")
                              .width(30)
                              .height(15)
                              .lineHeight(15)
                              .textAlign(TextAlign.Center)
                              .border({
                                radius:20,
                                color:'#fff',
                                width:1,
                                style:BorderStyle.Solid
                              })
                          }
                        }
                        .width("65%")
                        // .backgroundColor("red")
                        .justifyContent(FlexAlign.SpaceBetween)
                      }
                      .width("100%")
                      .alignItems(HorizontalAlign.Start)
                    }
                    .margin({top:10,left:10})
                  }
                  .borderRadius(10)
                  .alignItems(HorizontalAlign.Center)
                  .width("90%")
                  .height(130)
                  .backgroundImage($r('app.media.bg03'))
                  .backgroundImageSize(ImageSize.Cover)
                  .margin({top:10})
                }
                .margin({top:10})
                .alignItems(HorizontalAlign.Center)
                .width("100%")
              })
            }
            .margin({top:10})

            Column(){
              Text('为您推荐')
                .fontColor("black")
                .margin({top:30})
                .fontSize(18)
                .fontWeight(600)
              Column(){
                Row(){
                  ForEach(this.itemlite02,(item:item02)=>{
                    Row(){
                      Column(){
                        Image($r(`app.media.${item.imgUrl}`))
                          .width(150)
                          .height(130)
                          // .margin({ top:-9 })
                        Column({space:5}){
                          Text(item.title)
                            .margin({top:5})
                          Row(){
                            Text('￥')
                              .fontColor("red")
                            Text(item.price.toFixed(2))
                              .fontColor("red")
                            Text('/盒')
                              .fontColor("red")
                            Row(){
                              Image($r(`app.media.${item.imgUrl02}`))
                                .width(20)
                            }
                            .justifyContent(FlexAlign.End)
                            .width("35%")
                            // .backgroundColor("red")
                          }
                        }
                        .padding({left:10})
                        .alignItems(HorizontalAlign.Start)
                        .borderRadius({bottomLeft:10,bottomRight:10})
                        .width("100%")
                        .height(70)
                        .backgroundColor("white")
                      }
                      .width("100%")
                      .alignItems(HorizontalAlign.Center)
                    }
                    .borderRadius(10)
                    .margin({right:5})
                    .width(160)
                    .height(200)
                    // .backgroundColor("red")
                  })
                }
                .margin({bottom:10})
                .width("100%")
                Row(){
                  ForEach(this.itemlite03,(item:item02)=>{
                    Row(){
                      Column(){
                        Image($r(`app.media.${item.imgUrl}`))
                          .width(150)
                          .height(130)
                        Column({space:5}){
                          Text(item.title)
                            .margin({top:5})
                          Row(){
                            Text('￥')
                              .fontColor("red")
                            Text(item.price.toFixed(2))
                              .fontColor("red")
                            Text('/盒')
                              .fontColor("red")
                            Row(){
                              Image($r(`app.media.${item.imgUrl02}`))
                                .width(20)
                            }
                            .justifyContent(FlexAlign.End)
                            .width("35%")
                            // .backgroundColor("red")
                          }
                        }
                        .padding({left:10})
                        .alignItems(HorizontalAlign.Start)
                        .borderRadius({bottomLeft:10,bottomRight:10})
                        .width("100%")
                        .height(70)
                        .backgroundColor("white")
                      }
                      .width("100%")
                      .alignItems(HorizontalAlign.Center)
                    }
                    .borderRadius(10)
                    .margin({right:5})
                    .width(160)
                    .height(200)
                    // .backgroundColor("red")
                  })
                }
                .margin({bottom:10})
                .width("100%")
                Row(){
                  ForEach(this.itemlite04,(item:item02)=>{
                    Row(){
                      Column(){
                        Image($r(`app.media.${item.imgUrl}`))
                          .width(150).height(130)
                        Column({space:5}){
                          Text(item.title)
                            .margin({top:5})
                          Row(){
                            Text('￥')
                              .fontColor("red")
                            Text(item.price.toFixed(2))
                              .fontColor("red")
                            Text('/盒')
                              .fontColor("red")
                            Row(){
                              Image($r(`app.media.${item.imgUrl02}`))
                                .width(20)
                            }
                            .justifyContent(FlexAlign.End)
                            .width("35%")
                            // .backgroundColor("red")
                          }
                        }
                        .padding({left:10})
                        .alignItems(HorizontalAlign.Start)
                        .borderRadius({bottomLeft:10,bottomRight:10})
                        .width("100%")
                        .height(70)
                        .backgroundColor("white")
                      }
                      .width("100%")
                      .alignItems(HorizontalAlign.Center)
                    }
                    .borderRadius(10)
                    .margin({right:5})
                    .width(160)
                    .height(200)
                    // .backgroundColor("red")
                  })
                }
                .margin({bottom:10})
                .width("100%")
              }
              .margin({top:20})
              .width("90%")
              .alignItems(HorizontalAlign.Center)
            }
            .borderRadius(10)
            .margin({top:30})
            .backgroundImage($r('app.media.cc1'))
          }
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      // shopping
      Column(){
        Row(){
          Row(){
            Column(){
              Row(){
                Text('合计:')
                  .fontColor("white")
                Text('￥')
                  .fontColor("white")
                // Text('0')
                Text(this.total+'')
                  .fontColor("white")
              }
              Text('含运费')
                .fontSize(12)
                .fontColor("white")
            }
            Row(){
              Button('去结算')
                .onClick(()=>{
                  AlertDialog.show(
                    {
                      message:'购买成功',
                      autoCancel: true,
                      alignment: DialogAlignment.Center,
                      gridCount: 3,
                      confirm:{
                        value:'确定',
                        fontColor:'#a1cab3',
                        action:()=>{
                          console.log('点击成功回调');
                          router.pushUrl({ url:'views/shop'})
                        }
                      },
                    }
                  )
                })
                .backgroundColor(0x317aff)
                .height(20)
                .backgroundColor("#59786d")
            }
            .borderRadius(30)
            .backgroundColor("#59786d")
            .width(80)
            .height(40)
          }
          .width("100%")
          .justifyContent(FlexAlign.SpaceAround)
        }
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .width("80%")
        .height(50)
        .backgroundColor("#a1cab3")
      }
      .position({
        left:0,
        bottom:40
      })
      .width("100%")
    }
    .backgroundImage($r('app.media.img3'))
    .backgroundImageSize(ImageSize.Cover)
    .height('100%')
    .width('100%')
  }
}