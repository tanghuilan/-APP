import text from '@ohos.graphics.text'
import { it } from '@ohos/hypium'
import { router } from '@kit.ArkUI';
class Item{
  name:string
  image:ResourceStr
  price:number
  discount:string

  constructor(name:string,image:ResourceStr,discount:string,price:number=0) {
    this.name=name
    this.image=image
    this.price=price
    this.discount=discount
  }
}
@Entry
@Component
struct shop {
  private items:Item[]=[   //Item类型 （Array<Item>）
    new Item('减脂小零食',$r('app.media.img_4'),'低脂肪小钢筋|全麦，真棒，来一个',50),
    new Item('零卡0果冻',$r('app.media.img_5'),'零卡果冻，OKCALJELLY，KEEPkk',30),
    new Item('BCPAPR园',$r('app.media.img_12'),'碧翠园喵欧全麦面包，BCPAPR园yy',40),
    new Item('LAOBINGTANG',$r('app.media.img_7'),'LAOBINGTANG香甜，可口',20),
    new Item('MiZHIZHUROU',$r('app.media.img_8'),'蜜汁猪肉铺，卡路里ooo000',30),
    new Item('FreeBudsLipstick',$r('app.media.img_9'),'FreeBudsLipstick肉松饼',20),
    new Item('MRJKGUANG',$r('app.media.img_10'),'每日浆果坚果来一颗，保持健康',20),
    new Item('GUOBA',$r('app.media.img_11'),'每日浆果坚果来一点，保持健康',30),
    new Item('SUGGER',$r('app.media.img_13'),'每天一颗糖果，提高含糖量',40),
    new Item('LAOHAIGONG',$r('app.media.img_14'),'老海公夹心海苔芝麻口味',25),
  ]
  private items02:Item[]=[   //Item类型 （Array<Item>）
    new Item('高山味绿茶',$r('app.media.gt'),'高山味绿茶|低糖减肥减脂',50),
    new Item('清脆李子',$r('app.media.lizi'),'MOLILVCHA，OKCALJELLY',40),
    new Item('冰鲜糕绿豆',$r('app.media.lvd'),'LVDOU糕点可口，味香浓可口',40),
    new Item('YANGGUANGPUTAO',$r('app.media.yg'),'YANGGUANGPUTAO香甜，可口',90),
    new Item('MiZHIZHUROU',$r('app.media.mlit'),'茉莉味道的味道绿茶，卡路里000',50),
    new Item('MiZHIZHUROU',$r('app.media.niuy'),'最有营养牛油果，牛油果必选',30),
    new Item('冰鲜的竹笋',$r('app.media.zs'),'FreeBudsLipstickzun',20),
    new Item('GUOBA',$r('app.media.dg'),'每水仙岩来一点，保持健康',30),
    new Item('每日水鲜花',$r('app.media.qtuan'),'FreeBudsLipstick青团',20),
    new Item('金银花茶香味',$r('app.media.mm'),'每日果茶花茶一点，保持健康',30),

  ]
  private items03:Item[]=[   //Item类型 （Array<Item>）
    new Item('原味0ka果汁',$r('app.media.guozhi'),'YUANWEIGUOZHI|低糖',50),
    new Item('零卡0果冻',$r('app.media.img_5'),'零卡果冻，OKCALJELLY，KEEPkk',30),
    new Item('BCPAPR园',$r('app.media.img_12'),'碧翠园喵欧全麦面包，BCPAPR园yy',40),
    new Item('LAOBINGTANG',$r('app.media.img_7'),'LAOBINGTANG香甜，可口',20),
    new Item('MiZHIZHUROU',$r('app.media.img_8'),'蜜汁猪肉铺，卡路里ooo000',30),
    new Item('FreeBudsLipstick',$r('app.media.img_9'),'FreeBudsLipstick肉松饼',20),
    new Item('MRJKGUANG',$r('app.media.img_10'),'每日浆果坚果来一颗，保持健康',20),
    new Item('GUOBA',$r('app.media.img_11'),'每日浆果坚果来一点，保持健康',30),

  ]

  build() {
Column(){
  Row(){
    Text("商品").fontColor(Color.Green).fontSize(30).margin({
      left:170
    })
  }.width(600).height(40).backgroundImage($r('app.media.img_3')).margin({
    top:-35,
    left:200
  }) .backgroundImageSize(ImageSize.Cover)
Row(){
  Image($r('app.media.fanhui')).width(20).height(20).margin({
    left:10,
    top:22
  }).onClick(()=>{
    router.pushUrl({
      url:'pages/Index'
    })
  })
  Text("商品列表").fontColor(Color.Green).fontSize(20).padding(10).margin({
    top:5,


  })
}.width("100%").height(30)

  Column(){
    Tabs() {
      TabContent() {
        Column() {
          Scroll() {
            Flex({
              wrap: FlexWrap.Wrap,
              justifyContent: FlexAlign.SpaceBetween
            }) {
              ForEach(this.items02,(item:Item) => {
                Column() {
                    Image(item.image)
                    .width(150).height(200).onClick(()=>{
                      router.pushUrl({
                        url:'pages/router_second',

                      },router.RouterMode.Standard,err=>{
                        console.log(err+'---')
                      }
                      )

                    })
                  Column() {
                    Text(item.name)
                      .fontSize(14)
                    Text(item.discount)
                      .fontSize(12)
                      .fontColor('#666')
                      .margin({ top: 6, bottom: 6 })
                      .textOverflow({
                        overflow: TextOverflow.Ellipsis
                      })
                      .maxLines(1)

                    Text('￥'+item.price)
                      .fontSize(14)
                      .fontWeight(600)
                  }
                  .alignItems(HorizontalAlign.Start)
                }
                .width('49%')
                .backgroundColor('#fff')
                .margin({ bottom: 6 })
                .borderRadius(12)
                .padding(8)
              })
            }

          }

        }
      }
      .tabBar('全部商品')

      TabContent() {
        Column() {
          Scroll() {
            Flex({
              wrap: FlexWrap.Wrap,
              justifyContent: FlexAlign.SpaceBetween
            }) {
              ForEach(this.items,(item:Item) => {
                Column() {
                  Image(item.image)
                    .width(150).height(200).onClick(()=>{
                    router.pushUrl({
                      url:'pages/router_second',

                    },router.RouterMode.Standard,err=>{
                      console.log(err+'---')
                    }
                    )

                  })
                  Column() {
                    Text(item.name)
                      .fontSize(14)
                    Text(item.discount)
                      .fontSize(12)
                      .fontColor('#666')
                      .margin({ top: 6, bottom: 6 })
                      .textOverflow({
                        overflow: TextOverflow.Ellipsis
                      })
                      .maxLines(1)

                    Text('￥'+item.price)
                      .fontSize(14)
                      .fontWeight(600)
                  }
                  .alignItems(HorizontalAlign.Start)
                }
                .width('49%')
                .backgroundColor('#fff')
                .margin({ bottom: 6 })
                .borderRadius(12)
                .padding(8)
              })
            }

          }

        }
        // Text('健康轻食').fontSize(30)
      }
      .tabBar('健康轻食')

      TabContent() {
        Column() {
          Scroll() {
            Flex({
              wrap: FlexWrap.Wrap,
              justifyContent: FlexAlign.SpaceBetween
            }) {
              ForEach(this.items,(item:Item) => {
                Column() {
                  Image(item.image)
                    .width(150).height(200).onClick(()=>{
                    router.pushUrl({
                      url:'pages/router_second',

                    },router.RouterMode.Standard,err=>{
                      console.log(err+'---')
                    }
                    )

                  })
                  Column() {
                    Text(item.name)
                      .fontSize(14)
                    Text(item.discount)
                      .fontSize(12)
                      .fontColor('#666')
                      .margin({ top: 6, bottom: 6 })
                      .textOverflow({
                        overflow: TextOverflow.Ellipsis
                      })
                      .maxLines(1)

                    Text('￥'+item.price)
                      .fontSize(14)
                      .fontWeight(600)
                  }
                  .alignItems(HorizontalAlign.Start)
                }
                .width('49%')
                .backgroundColor('#fff')
                .margin({ bottom: 6 })
                .borderRadius(12)
                .padding(8)
              })
            }

          }

        }
      }
      .tabBar('营养推荐')

      TabContent() {
        Column() {
          Scroll() {
            Flex({
              wrap: FlexWrap.Wrap,
              justifyContent: FlexAlign.SpaceBetween
            }) {
              ForEach(this.items03, (item: Item) => {
                Column() {
                  Image(item.image)
                    .width(150).height(200).onClick(() => {
                    router.pushUrl({
                      url: 'pages/router_second',

                    }, router.RouterMode.Standard, err => {
                      console.log(err + '---')
                    }
                    )

                  })
                  Column() {
                    Text(item.name)
                      .fontSize(14)
                    Text(item.discount)
                      .fontSize(12)
                      .fontColor('#666')
                      .margin({ top: 6, bottom: 6 })
                      .textOverflow({
                        overflow: TextOverflow.Ellipsis
                      })
                      .maxLines(1)

                    Text('￥' + item.price)
                      .fontSize(14)
                      .fontWeight(600)
                  }
                  .alignItems(HorizontalAlign.Start)
                }
                .width('49%')
                .backgroundColor('#fff')
                .margin({ bottom: 6 })
                .borderRadius(12)
                .padding(8)
              })
            }

          }

        }
      }
      .tabBar("健康主食")
    }
  }


}.width("100%").height("100%").backgroundImage($r('app.media.img3')).margin({top:40})
  }
}
export default shop