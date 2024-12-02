import { image } from '@kit.ImageKit'
//router_second.ets
import { Animator as animator, AnimatorOptions,AnimatorResult } from '@kit.ArkUI';

import { router,promptAction } from '@kit.ArkUI';
class Tmp {
  iconStr2: ResourceStr = $r("app.media.gengduo")

  set(val: Resource) {
    this.iconStr2 = val
  }
}

@Entry
@Component
struct router_second {
  @State Rst:promptAction.ShowToastOptions = {'message': '100克添加成功'}
  @State Vst:promptAction.ShowToastOptions = {'message': '150克添加成功'}
  @State Sst:promptAction.ShowToastOptions = {'message': '200克添加成功'}

  @State num:number = 0
  @State num1:number = 0
  @State select: boolean = true
 @State  iconStr1: ResourceStr = $r("app.media.ssc")
  @State  iconStr3: ResourceStr = $r("app.media.ssd")
  @State  iconStr5: ResourceStr = $r("app.media.gg")
  @State  iconStr4: ResourceStr = $r("app.media.gg1")
  private iconStr: ResourceStr = $r("app.media.gengduo")
  private iconStr2: ResourceStr = $r("app.media.gengduo")

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "首页", labelInfo: "主+首页" }).onClick(()=>{
        router.pushUrl({
          url:'pages/Index'})
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

      MenuItemGroup({ header: '更多选择' }) {
        MenuItem({ content: "更多选项" })
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
            let Str: Tmp = new Tmp()
            Str.set($r("app.media.gengduo"))
          })
        MenuItem({
          startIcon: $r("app.media.gengduo"),
          content: "更多选项",
          endIcon: $r("app.media.gengduo"),
          builder: this.SubMenu
        })
      }

    }
  }
  build() {
    Column(){
      Row(){
        Image($r('app.media.fanhui')).margin({
          left:20,
          right:290

        }).width(20).height(20).onClick(()=>{
          router.back(

          )
        })
        Column(){
          Text("营养健康商品").margin({
            left:-280
          })
        }
        Row(){
          Swiper() {
            Image($r('app.media.lv2'))
              .width('95%')
              .height('100%')
              .backgroundColor(Color.Gray)


            Image($r('app.media.gt'))
              .width('95%')
              .height('100%')
              .backgroundColor(Color.Green)


            Image($r('app.media.lv3'))
              .width('95%')
              .height('100%')
              .backgroundColor(Color.Pink)

          }.loop(true).autoPlay(true)
          .interval(1000)

        }.width("95%").height(300).margin({
          top:350,
          left:-310
        })


      }.width("100%").height(30).margin({
        top:-25
      })
      Image($r('app.media.gengduo')).width(20).height(20).margin({
        top:-25,
        left:330
      }) .bindMenu(this.MyMenu)
      Row(){
        Column(){
          Text("¥ 20").fontSize(25).fontWeight(10).margin({
            left:-110,
            top:5
          })
          // Image($r('app.media.ssc')).width(30).height(30).onClick(()=>{
          //  this.iconStr1=this.iconStr3
          // }).margin({top:-30,left:-75})
          RelativeContainer() {
            Image(this.num == 0 ? this.iconStr1 : this.iconStr3).width(35).height(35).onClick(() => {
              this.num == 0 ? this.num = 1 : this.num = 0
            })
          }.margin({
            left:230,
            top:-33
          })
          Text("收藏").fontSize(20).fontWeight(10).margin({
            top:-66,left:270,right:30
          })

          RelativeContainer() {
            Image(this.num1 == 0 ? this.iconStr5 : this.iconStr4).width(25).height(25).onClick(() => {
              this.num1 == 0 ? this.num1 = 1 : this.num1 = 0
            })
          }.margin({top:-27,left:380})
          Text("加购").fontSize(20).fontWeight(10).margin({top:-63,left:400,right:-100})

        }.width("100%").height(40).margin({
          top:-350,
          left:0
        })
        Column(){
          Text("商品详细介绍").fontSize(20).margin({
            right:220,top:2
          }).fontColor('#ff86c170')
        }.width("100%").height(30).margin({
          top:-280,left:-255
        })
        Column(){
          Text("低卡、健康、天然、高纤维、饱腹感强、少糖、无添加、清新、" +
            "美味、轻盈、营养均衡、富含蛋白质、低脂、" +
            "清爽、绿色、纯净、细腻、可口、便捷、安心、精制、" +
            "多样、有益、精选、优质、温和、易消化、持久能量、" ).fontColor('#ff93c387')
        }.width("100%").height(100).margin({
        left:-350,
          top:-140
        })
        Column(){
          Row(){
            Text("商品规格:").margin({
              right:65
            })

            Radio({ value: 'Radio1', group: 'radioGroup' })
              .checked(true)
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                if(isChecked) {
                  // 切换为响铃模式
                  promptAction.showToast(this.Rst)
                }
              })
            Text('100克')
            Radio({ value: 'Radio2', group: 'radioGroup' })
              .checked(true)
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                if(isChecked) {
                  // 切换为响铃模式
                  promptAction.showToast(this.Vst)
                }
              })
            Text('150克')
            Radio({ value: 'Radio3', group: 'radioGroup' })
              .checked(true)
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                if(isChecked) {
                  // 切换为响铃模式
                  promptAction.showToast(this.Sst)
                }
              })
            Text('200克')
          }


        }.width("100%").height(30).margin({
          left:-355
        })
        Column(){
          Row(){
            Text("配送地：")
            //   .margin({
            //   right:270
            // })
            TextInput({placeholder:"广东省东莞市寮步区东莞城市学院"}).width(260).height(40)
            //   .margin({
            //   left:-263
            // })
          }.margin({
            right:70
          })
          Column(){
            Row() {
              Text("商家联系电话:").margin({
                top:20,
                left:-50

              })
              Text("方伟奇 18989898909").margin({
                top:20,left:20

              })
            }

          }.margin({
            right:30
          })




        }.width("100%").height(50).margin({
          top:100,
          left:-330

        })
Column(){
          Row(){
            Image($r('app.media.gw01')).width(40).height(40).margin({
              top:20,
              left:-50
            })
            Button('购买', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8)
              .backgroundColor('#98FB98')
              .width(150)
              .height(40).margin({
              left:60,
              top:20
            }).onClick(()=>{    router.pushUrl({
              url:'pages/gm'
            })
            })
          }.margin({
            right:100
          })
}.width("100%").height(80).margin({
  top:320,left:-322
})


      }.width("90%").height(400).margin({
        top:320,right:190
      })

    }.width("100%").height("100%").backgroundImage($r('app.media.img3')).backgroundImageSize(ImageSize.Cover).margin({
      top:20
    })




  }


}