import router from '@ohos.router'
import http from '@ohos.net.http'
// interface IParams{
//   from:string,
//   data:string
// }

@Component
export struct RegisterView{
  @State email:string = ''
  @State password: string = ''
  @State username: string = ''
  @State usernameColor: number = 0x000000;
  @State passwordColor: number = 0x000000;
  @State emailColor: number = 0x000000;
  @State isEmail:boolean=false
  @State isPsw:boolean=false
  @State isLoading:boolean = false
  private timeOutId = -1
  aboutToDisappear(){
    clearTimeout(this.timeOutId)
    this.timeOutId = -1
  }

  // 表单验证是否成功：
  formIsSuccess() {
    return this.username.trim() !== "" && this.password.trim() !== "" && this.email.trim() !== ""
  }

  regSave() {
    //   1、非空验证
    if (this.username.trim() == "") {
      console.log("用户名不能为空")
      this.usernameColor = 0xff0000;
      return;
    }

    if (this.password.trim() == "") {
      console.log("密码不能为空")
      this.passwordColor = 0xff0000;
      return;
    }
    if (this.email.trim() == "") {
      console.log("邮箱不能为空")
      this.emailColor = 0xff0000;
      return;
    }
    //   2、密码是否一致

    //   3、发送请求，进行注册
    const httpRequest = http.createHttp();
    httpRequest.request("http://localhost:3000/users", {
      method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
      // 开发者根据自身业务需要添加header字段
      header: {
        'Content-Type': 'application/json'
      },
      // 当使用POST请求时此字段用于传递内容
      extraData: {
        username:this.username,
        email:this.email,
        password:this.password
      },
      connectTimeout: 60000, // 可选，默认为60s
      readTimeout: 60000, // 可选，默认为60s
    },(err,data)=>{
      if(!err){
        console.log("data.result",data.result)
        console.log("data.responseCode",data.responseCode)
        if(data.responseCode==201){
          console.log("注册成功")
        }
      }
    })
  }
  build(){
    Column(){
      Row(){
        Image($r('app.media.chevron_left')).width(30).onClick(()=>{
          router.back()
        })
      }.width('100%').justifyContent(FlexAlign.Start).padding(20)
      Column(){
        Blank()
        Text('创建账号').fontSize(26).fontColor('#333').fontWeight(FontWeight
          .Bold)
        Blank()
        TextInput({placeholder:'用户名',text:this.username}).height(50).width('100%').type(InputType.Normal)
          .caretColor('#333').placeholderColor('#999')
          .onChange((value:string)=>{
            this.username = value
          })
        TextInput({placeholder:'邮箱',text:this.email}).height(50).width('100%').type(InputType.Email).margin({top:12})
          .caretColor('#333').placeholderColor('#999')
          .onChange((value:string)=>{
            this.email = value
          })
        TextInput({placeholder:'密码',text:this.password}).height(50).width('100%').type(InputType.Password).margin({top:12})
          .caretColor('#333').placeholderColor('#999').showPasswordIcon(false)
          .onChange((value:string)=>{
            this.password = value
          })
        Button(){
          if(this.isLoading){
            LoadingProgress().width(30).height(30).color(Color.White)
          }else {
            Text('注册').fontColor(Color.White).fontSize(18)

          }
        }.width('100%').height(40).backgroundColor('#7dd082').margin({top:20})
        .enabled(this.formIsSuccess())
        .onClick(()=>{
          this.regSave()
        })
        Blank()
        Row(){
          Text('立即登录').fontColor('#333')
            .onClick(()=>{
              router.pushUrl({
                url:'pages/LoginPage',
              })
            })
          Blank()
          Text('忘记密码?').fontColor('#333')
        }.width('100%')
        Blank()
      }.backgroundColor(Color.White)
      .width('95%').height('45%').padding({left:10,right:10})
      .borderRadius(8)
      .shadow({
        radius:10,
        color:'#F1F3F5',
        offsetX:4,
        offsetY:8
      })

      Row(){
        Blank()
        Divider().width(100).color('#E5E5E5')
        Text('第三方登录')
          .margin({left:10,right:10})
          .fontColor('#333')
          .fontSize(16)
        Divider().width(100).color('#E5E5E5')
        Blank()
      }.width('100%').margin({top:20})
      Row(){
        Blank()
        Image($r('app.media.weibo')).width(60)
          .height(60).objectFit(ImageFit.Contain).interpolation(ImageInterpolation.High)
        Blank()
        Image($r('app.media.wechat')).width(60)
          .height(60).objectFit(ImageFit.Contain).interpolation(ImageInterpolation.High)
        Blank()
      }.width('100%').margin({top:10})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}