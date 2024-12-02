import router from '@ohos.router';
@Entry
@Component
struct BMIcount{
  @State mess_res_title: string = 'BMI计算结果'
  @State mess_res_date: string = '数据分析'
  @State mess_res_hight: string = '身高(厘米)'
  @State mess_res_weight: string = '建议体重(公斤)'
  @State mess_res_log: string = '计算模式及数据由妙健康提供'
  @State results : number = 0
  @State health : string = ''
  @State wei_start : string = ''
  @State wei_end : string = ''
  @State  as_weight : string = ''
@State params:object =router.getParams()
  aboutToAppear():void{

    // 2.通过 as 类型断言 转为具体的类型


    if(this.params['nl']>0){
      this.results =Math.round((this.params['tizhong']/((this.params['shengao']/100)*(this.params['shengao']/100))))
      if(this.results<18.5) {
        this.health = '偏瘦'
        this.as_weight = Math.round((18.5*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
      }else if(this.results>18.5&&this.results<=23.9){
        this.health = '正常'
        this.wei_start = Math.round((18.5*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.wei_end = Math.round((23.9*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.as_weight = (this.wei_start+'~'+this.wei_end)
      }else if(this.results>=24&&this.results<=26.9){
        this.health = '偏胖'
        this.wei_start = Math.round((24*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.wei_end = Math.round((26.9*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.as_weight = (this.wei_start+'~'+this.wei_end)
      }else if(this.results>=27&&this.results<=29.9){
        this.health = '肥胖'
        this.wei_start = Math.round((27*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.wei_end = Math.round((29.9*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.as_weight = (this.wei_start+'~'+this.wei_end)
      }else if(this.results>=30&&this.results<=40){
        this.health = '重度肥胖'
        this.wei_start = Math.round((30*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.wei_end = Math.round((40*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
        this.as_weight = (this.wei_start+'~'+this.wei_end)
      }else if(this.results>=40){
        this.health = '极度肥胖'
        this.as_weight = Math.round((40*((this.params['shengao']/100)*(this.params['shengao']/100)))).toString()
      }
    }
  }

  build(){
    Column(){
      Image($r('app.media.arrow_left_circle')).width(30).height(30).margin({right:350,top:10}).onClick(()=>{
        router.back()
      })
      Row(){
        Column(){
          Text(this.mess_res_title)
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }.width('100%')
      }.height('15%')

      Row(){
        Column(){
          Text('您的BMI指数是:'+this.results.toString())
            .fontSize(30)
            .fontWeight(FontWeight.Bolder)
            .margin({left:40,top:5})

            .alignSelf(ItemAlign.Start)
        }.width('100%')
      }
      .height('10%')


      Row(){
        Column(){
          Text('您的结果是：')
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .margin({left:10,top:0})

            .alignSelf(ItemAlign.Start)
          Text(this.health)
            .fontSize(40)
            .fontWeight(FontWeight.Bolder)
            .margin({left:0,top:30})
            .fontColor('red')
        }.width('100%')
      }
      .height('20%')

      Line()
        .startPoint([320,0])
        .stroke('#9ffff')

      Row(){
        Column(){
          Text(this.mess_res_date)
            .fontSize(15)
            .fontWeight(FontWeight.Normal)
            .margin({left:10,top:0})

            .alignSelf(ItemAlign.Start)
        }.width('100%')
      }
      .height('10%')

      Row(){
        Column(){
          Text(this.mess_res_hight)
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .margin({left:5,top:0})

            .alignSelf(ItemAlign.Start)
        }.width('60%')
        Column(){
          Text(this.params['shengao'].toString())
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .margin({right:10})
        }.width('40%')
      }
      .height('5%')
      Row(){
        Column(){
          Text(this.mess_res_weight)
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .margin({left:5,top:0})

            .alignSelf(ItemAlign.Start)
        }.width('60%')
        Column(){
          Text(this.as_weight)
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .margin({right:10})

          //.alignSelf(ItemAlign.End)
        }.width('50%')
      }
      .height('10%')

      Row(){
        Column(){
          Text(this.mess_res_log)
            .fontSize(15)
        }.width('100%')
      }.height('45%')

    }.linearGradient({
      // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
      colors: [
        [0xdef9d8, 0.0], // 颜色断点1的颜色和比重，对应组件在180°方向上的起始位置
        [0xffffff, 1.0], // 颜色断点2的颜色和比重，对应组件在180°方向上的终点位置
      ]
    })
  }
}