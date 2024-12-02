import router from '@ohos.router'

// interface DatePickerResult {
//   year: number;
//   month: number; // 注意月份是从 1 开始的
//   day: number;
// }
//
// interface TextPickerResult {
//   index: number;
//   value: string;
// }
@Component
  struct nicheng {
  @State answer: string = ''
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
    Column() {
      Row(){
        Text(this.answer.toString())
        Image($r('app.media.more')).width(25)
      }.onClick(()=>{
        this.dialogController.open()
      })
    }
  }
}

@Component
struct xingming {
  @State answer: string = ''
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
    Column() {
      Row(){
        Text(this.answer.toString())
        Image($r('app.media.more')).width(25)
      }.onClick(()=>{
        this.dialogController.open()
      })
    }
  }
}
@Component
struct telephone {
  @State answer: string = ''
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
    Column() {
      Row(){
        Text(this.answer.toString())
        Image($r('app.media.more')).width(25)
      }.onClick(()=>{
        this.dialogController.open()
      })
    }

  }
}

@Component
export struct MineInfoView{
  @State answer:string =''
  @State name:string =''
  private selected: number | number[] = 1
  @State sex:string | string[] =''
  @State phone:string =''
  public  birthday: string = '';
  @State pickList:string[] = ['女','男']
  @State TextPickerShow:boolean = false
  public  selectedDate: Date = new Date();

  build(){
    Column(){
      Row(){
        Image($r('app.media.chevron_left'))
          .width(25)
        Text('个人信息')
          .fontSize(25)
          .padding({left:15})
      }
      .width('100%')
      .padding({left:5,top:10})
      .onClick(()=>{
        router.back()
      })

    Column(){
    //上
      Column() {
        Row() {
          Text('头像')
            .fontSize(18)
          Image($r('app.media.tx'))
            .width(50)
            .borderRadius(50)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({bottom:20})

        Row() {
          Text('昵称').fontSize(18)
          nicheng()
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

      }.width('100%').height(120)
      .backgroundColor(Color.White)
      .margin({top:10})
      .padding({top:10,left:10,right:10})
      .borderRadius(20)
//下
    Column(){
      Row(){
        Text('姓名').fontSize(18)
        Row(){
          xingming()
        }
      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({bottom:10})

      Row(){
        Text('性别')
          .fontSize(18)
        Text(this.sex.toString())
          .fontSize(16)
          .fontColor(Color.Gray)
          .padding({right:5})
      }
      .padding({bottom:10})
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        TextPickerDialog.show({
          range:this.pickList,
          selected:this.selected,
          onAccept:(value:TextPickerResult) => {
            this.selected = value.index
            this.sex = value.value
          },onCancel:() => {
            console.info("TextPickerDialog:onCancel()")
          }
        })
    })
      Row(){
        Text('手机号')
          .fontSize(18)
        telephone()
      }
      .padding({bottom:10})
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        Text('生日').fontSize(18)
        Row(){
          Text(this.birthday)
            .padding({right:10})
            .fontColor(Color.Gray)
          Image($r('app.media.more')).width(25)

        }
      }
      .padding({bottom:10})
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
          DatePickerDialog.show({
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            onDateAccept: (value: Date) => {
                this.selectedDate.setFullYear(value.getFullYear(), value.getMonth(), value.getDate());
                this.birthday = `${value.getFullYear()}-${String(value.getMonth()).padStart(2, '0')}-${String(value.getDate()).padStart(2, '0')}`;
              },
            onCancel: () => {
              console.info("DatePickerDialog:onCancel()");
            }
          });
        });
    }
    .width('100%').height(150)
    .backgroundColor(Color.White)
    .padding({top:10,left:10,right:10})
    .margin({top:20})
    .borderRadius(20)

    }
    Button(){
      Text('保存').fontColor(Color.White).fontSize(18)
    }.width('100%').height(40).backgroundColor('#7dd082').margin({top:20})
    .onClick(()=>{
    router.back()
  })

  }.width('100%').height('100%')
  .padding(10)
  .backgroundColor('#ffefeeee')

  }
}
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  confirm: ((val: string) => void) | null = null;
  answer: string = '0'


  build() {
    Column({ space: 20 }) {
      Text('请输入你的信息')
        .fontSize(20)
      TextInput({
        placeholder: "请输入你的信息",

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

