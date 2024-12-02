import { text } from '@kit.ArkGraphics2D'
import { router } from '@kit.ArkUI'
import { curves } from '@kit.ArkUI';
import { Color } from '@kit.ArkGraphics3D';

@Component
struct Dialog {

  @State answer: string = ''
  @State weight:string=''
  // 创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      // 确认按钮回调函数
      confirm: (val) => {
        this.onAccept(val)
      },
    }),


  })

  // 确认
  onAccept(val: string) {
    this.answer = val
  }
  build() {
    Column(){
      Text(this.answer+'杯').width(130).height(50).fontSize(14).margin({left:100}).textAlign(TextAlign.End).onClick(()=>{
        this.dialogController.open()
      })
    }
  }
}


@Component
struct Kaluli {

  @State answer: string = ''
  @State weight:string=''
  // 创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      // 确认按钮回调函数
      confirm: (val) => {
        this.onAccept(val)
      },
    }),


  })

  // 确认
  onAccept(val: string) {
    this.answer = val
  }
  build() {
    Column(){
      Text(this.answer+'千焦').width(130).height(50).fontSize(14).margin({left:100}).textAlign(TextAlign.End).onClick(()=>{
        this.dialogController.open()
      })
    }
  }
}


@Component
struct Yaowei {

  @State answer: string = ''
  @State weight:string=''
  // 创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      // 确认按钮回调函数
      confirm: (val) => {
        this.onAccept(val)
      },
    }),


  })

  // 确认
  onAccept(val: string) {
    this.answer = val
  }
  build() {
    Column(){
      Text(this.answer+'厘米').width(130).height(50).fontSize(14).margin({left:100}).textAlign(TextAlign.End).onClick(()=>{
        this.dialogController.open()
      })
    }
  }
}


@Builder function Navitem(title:string){
  Text(title)
    .width(100)
    .height(50)
    .fontSize(14)
    .textAlign(TextAlign.Start)
    .fontWeight(700)
    .fontColor('#595959').margin({left:10})

}
@Entry
@Component
struct Activity {
  @State Color:string='#86d2b6'


  @State hoverText:string='点击BMI测试！';

 // @State isHovered: boolean = false;


  @State answer: string = ''
  @State weight:string=''
  // 创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      // 确认按钮回调函数
      confirm: (val) => {
        this.onAccept(val)
      },
    }),


  })

  // 确认
  onAccept(val: string) {
    this.answer = val
  }


  @State sportmes:string | string[] ='暂无记录'
  private sportnum: number | number[] = 1
  @State heafulmes:string | string[] ='暂无记录'
  private heafulnum: number | number[] = 1
  @State mes:string | string[] ='暂无记录'
  private num: number | number[] = 1
  private select: number | number[] = 1
  @State message:string | string[] ='暂无记录'
  private choose: string[] =['良好', '一般','极差']
  private heaful: string[] =['经常熬夜', '很少熬夜','不熬夜']
  private sport: string[] =['经常运动', '很少运动','不运动']
  build() {
    Stack() {
      Image($r('app.media.one')).width('100%').height('100%').zIndex(1)
      Column() {

        Column() {
          Text('健康记录')
            .width('100%')
            .height(50)
            .fontColor('#86d2b6')
            .fontWeight(700)
            .textAlign(TextAlign.Center)
            .border({ width: ({ bottom: 2 }), color: ({ bottom: '#bfe8db' }) })
            .fontSize(19)
          Text('体重管理')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(19)
            .fontColor('#86d2b6')
            .position({ top: 100 })
            .fontWeight(700)
          Text(this.answer + 'kg')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(35)
            .fontColor('#86d2b6')
            .position({ top: 120 })
            .fontWeight(700)
        }.width('100%').height(200).zIndex(2)


        Column() {
          Row() {
            Navitem('饮食和运动')
            //TextInput({text:''+'千卡'}).width(130).height(50).fontSize(14).margin({left:100}).textAlign(TextAlign.End).backgroundColor(Color.White)
            Kaluli()
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })

          Row() {
            Text('体重')
              .width(100)
              .height(50)
              .fontSize(14)

              .fontWeight(700)
              .fontColor('#595959')
            Text(this.answer + 'kg')
              .width(130)
              .height(50)
              .fontSize(14)
              .margin({ left: 95 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                this.dialogController.open()
              })
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })

          Row() {
            Text('喝水记录')
              .width(100)
              .height(50)
              .fontSize(14)
              .textAlign(TextAlign.Start)
              .fontWeight(700)
              .fontColor('#595959')
              .margin({ left: 10 })
            // TextInput({text:'   '+'杯'}).width(130).height(50).fontSize(14).margin({left:100}).textAlign(TextAlign.End).backgroundColor(Color.White)
            Dialog()
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })

          Row() {
            Text('排便状态')
              .width(100)
              .height(50)
              .fontSize(14)
              .textAlign(TextAlign.Start)
              .fontWeight(700)
              .fontColor('#595959')
              .margin({ left: 10 })
            Text(this.message.toString())
              .width(130)
              .height(50)
              .fontSize(14)
              .margin({ left: 100 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                TextPickerDialog.show({
                  range: this.choose,
                  selected: this.select,
                  disappearTextStyle: { color: Color.White, font: { size: 15, weight: FontWeight.Lighter } },
                  textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
                  selectedTextStyle: { color: '#c1f1d9', font: { size: 30, weight: FontWeight.Bolder } },
                  onAccept: (value: TextPickerResult) => {
                    // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                    this.select = value.index
                    this.message = value.value

                  },
                  onCancel: () => {
                    console.info("TextPickerDialog:onCancel()")
                  },
                  onChange: (value: TextPickerResult) => {
                    console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
                  }
                })


              })
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })

          Row() {
            Text('睡眠')
              .width(100)
              .height(50)
              .fontSize(14)
              .textAlign(TextAlign.Start)
              .fontWeight(700)
              .fontColor('#595959')
              .margin({ left: 10 })
            Text(this.mes.toString())
              .width(130)
              .height(50)
              .fontSize(14)
              .margin({ left: 100 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                TextPickerDialog.show({
                  range: this.choose,
                  selected: this.num,
                  disappearTextStyle: { color: Color.White, font: { size: 15, weight: FontWeight.Lighter } },
                  textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
                  selectedTextStyle: { color: '#c1f1d9', font: { size: 30, weight: FontWeight.Bolder } },
                  onAccept: (value: TextPickerResult) => {
                    // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                    this.num = value.index
                    this.mes = value.value

                  },
                  onCancel: () => {
                    console.info("TextPickerDialog:onCancel()")
                  },
                  onChange: (value: TextPickerResult) => {
                    console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
                  }
                })


              })
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })


          Row() {
            Text('健康习惯')
              .width(100)
              .height(50)
              .fontSize(14)
              .textAlign(TextAlign.Start)
              .fontWeight(700)
              .fontColor('#595959')
              .margin({ left: 10 })
            Text(this.heafulmes.toString())
              .width(130)
              .height(50)
              .fontSize(14)
              .margin({ left: 100 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                TextPickerDialog.show({
                  range: this.heaful,
                  selected: this.heafulnum,
                  disappearTextStyle: { color: Color.White, font: { size: 15, weight: FontWeight.Lighter } },
                  textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
                  selectedTextStyle: { color: '#c1f1d9', font: { size: 30, weight: FontWeight.Bolder } },
                  onAccept: (value: TextPickerResult) => {
                    // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                    this.heafulnum = value.index
                    this.heafulmes = value.value

                  },
                  onCancel: () => {
                    console.info("TextPickerDialog:onCancel()")
                  },
                  onChange: (value: TextPickerResult) => {
                    console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
                  }
                })
              })
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })


          Row() {
            Text('运动训练')
              .width(100)
              .height(50)
              .fontSize(14)
              .textAlign(TextAlign.Start)
              .fontWeight(700)
              .fontColor('#595959')
              .margin({ left: 10 })
            Text(this.sportmes.toString())
              .width(130)
              .height(50)
              .fontSize(14)
              .margin({ left: 100 })
              .textAlign(TextAlign.End)
              .onClick(() => {
                TextPickerDialog.show({
                  range: this.sport,
                  selected: this.sportnum,
                  disappearTextStyle: { color: Color.White, font: { size: 15, weight: FontWeight.Lighter } },
                  textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
                  selectedTextStyle: { color: '#c1f1d9', font: { size: 30, weight: FontWeight.Bolder } },
                  onAccept: (value: TextPickerResult) => {
                    // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                    this.sportnum = value.index
                    this.sportmes = value.value

                  },
                  onCancel: () => {
                    console.info("TextPickerDialog:onCancel()")
                  },
                  onChange: (value: TextPickerResult) => {
                    console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
                  }
                })
              })
          }.border({ width: ({ bottom: 1 }), color: ({ bottom: '#f5f5f5' }) })


          Row() {
            Navitem('腰围')
            //TextInput({text:''+'厘米'}).width(130).height(50).fontSize(14).margin({left:100}).textAlign(TextAlign.End).backgroundColor(Color.White)
            Yaowei()
          }

        }
        .width(350)
        .height(418)
        .border({ width: 3, color: '#bfe8db' })
        .margin({ top: 10 })
        .borderRadius(10)

    // Button('BMI测试!').height(50).width(200).backgroundColor('#62bec9').margin({top:20}).fontSize(17).fontWeight(700).onClick(()=>{
    //   router.pushUrl({
    //     url:'views/Record'
    //   })
    // })
Column(){
  Row(){
    Button(this.hoverText) .fontColor(Color.White).fontSize(20).fontWeight(700)
    .backgroundColor(this.Color)
    .width(200)
    .height(70)
    .borderRadius(30)

    .onClick(() => {
      router.pushUrl({
            url:'views/Record'
         })

    })




  }.width(200)
  .height(70)
  .justifyContent(FlexAlign.Center)
}.zIndex(2).width(200).height(70).margin({top:10,left:10})

    }.width('100%').height('100%').zIndex(2)


    }

  }



}


@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  confirm: ((val: string) => void) | null = null;
  answer: string = '0'


  build() {
    Column({ space: 20 }) {
      Text('请输入你的身体数据')
        .fontSize(20)
      TextInput({
        placeholder: "请输入你的数据",

      }).onChange((value: string) => {
        this.answer = value;

      })
      Row({ space: 40 }) {
        Button('取消').backgroundColor('#6ba892')
          .onClick(() => {
            if (this.controller) {
              this.controller.close();
            }
          })
        Button('确定').backgroundColor('#6ba892')
          .onClick(() => {
            if (this.controller && this.confirm) {
              this.controller.close();
              this.confirm(this.answer);
            }
          })
      }
    }.padding(20) // 可能需要设置具体的宽度和高度，或者让父容器管理布局
  }
}
export default Activity