import router from '@ohos.router';

@Entry
@Component
struct Recrod{
  @State mess_age : string = '年龄'
  @State mess_sex : string = '性别'
  @State mess_height : string = '身高(厘米)'
  @State mess_weight : string = '体重(公斤)'
  @State mess : string = 'BMI计算'
  @State nl : number=0
  @State value : number=0
  @State shengao : number=0
  @State tizhong : number=0
  build() {


      Column() {
         Image($r('app.media.arrow_left_circle')).width(30).height(30).margin({right:350,top:10}).onClick(()=>{
           router.back()
         })
        Row() {
          Column() {
            Text(this.mess)
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
          }.width('100%')
        }
        .height('10%').zIndex(2)

        Row() {
          Row() {
            Column() {
              Text(this.mess_age)
                .fontSize(15)
                .fontWeight(FontWeight.Normal)
                .alignSelf(ItemAlign.Start)
              TextInput({ placeholder: '请输入年龄' })
                .fontSize(25)
                .width('100%')
                .margin({ left: 2, top: 10, right: 2 })
                .alignSelf(ItemAlign.Start)
                .type(InputType.Number)
                .onChange((value: string) => {

                  this.nl = parseInt(value)
                })
            }.width('50%').zIndex(2)

            Column() {
              Text(this.mess_sex)
                .fontSize(15)
                .fontWeight(FontWeight.Normal)
                .alignSelf(ItemAlign.Center)

              Row() {
                Radio({ value: '男', group: 'sexChoose' }).checked(true)
                  .width(30)
                  .height(30)
                Text('男')
                  .fontSize(20)
                Radio({ value: '女', group: 'sexChoose' })
                  .width(30)
                  .height(30)
                Text('女')
                  .fontSize(20)
              }
            }.width('50%')
          }.width('100%')
        }.height('15%').zIndex(2)

        Row() {
          Column() {
            Text(this.mess_height)
              .fontSize(15)
              .fontWeight(FontWeight.Normal)
              .alignSelf(ItemAlign.Start)

            TextInput({ placeholder: '请输入身高' })
              .fontSize(25)
              .width('100%')
              .margin({ left: 2, top: 10, right: 2 })
              .alignSelf(ItemAlign.Start)

              .type(InputType.Number)
              .onChange((value: string) => {

                this.shengao = parseInt(value)
              })
          }
        }.height('15%').width('100%').zIndex(2)

        Row() {
          Column() {
            Text(this.mess_weight)
              .fontSize(15)
              .fontWeight(FontWeight.Normal)
              .alignSelf(ItemAlign.Start)
            TextInput({ placeholder: '请输入体重' })
              .fontSize(25)
              .width('100%')
              .margin({ left: 2, top: 10, right: 2 })
              .alignSelf(ItemAlign.Start)
              .type(InputType.Number)
              .onChange((value: string) => {

                this.tizhong = parseInt(value)
              })
          }
        }.height('15%').width('100%').zIndex(2)

        Row() {
          Column() {
            Text('BMI指数')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .alignSelf(ItemAlign.Start)
            Text('简称体质指数，是通过体重除以身高米数平方得出的数字，是目前国际上常用的衡量人体胖瘦程度以及是否健康的一个标准')
              .fontSize(15)
              .fontWeight(FontWeight.Normal)
              .alignSelf(ItemAlign.Start)
          }.width('100%')
        }.height('20%').width('100%').zIndex(2)

        Row() {
          Button('开始计算')
            .width('100%')
            .height(50)
            .backgroundColor('#86d1b6').fontWeight(700).fontSize(18)
            .onClick(() => {
              //当点击开始计算按钮时，用路由的方法跳转‘pages/BMIcount’这个页面

              //并且以数组方式传参，传的参数值为用户输入的年龄，身高，体重信息

              router.pushUrl({
                url: 'views/BMIcount', params: {
                  nl: this.nl,
                  shengao: this.shengao,
                  tizhong: this.tizhong

                }
              })
            })
        }.height('30%').zIndex(2)

      }.linearGradient({
        // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
        colors: [
          [0xdef9d8, 0.0], // 颜色断点1的颜色和比重，对应组件在180°方向上的起始位置
          [0xffffff, 1.0], // 颜色断点2的颜色和比重，对应组件在180°方向上的终点位置
        ]
      })

    }



}