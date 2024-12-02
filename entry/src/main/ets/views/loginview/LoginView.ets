import router from '@ohos.router'
import http from '@ohos.net.http'
import { storage } from '../../utils/globaldata'
interface IParams{
  from:string,
  data:string
}

@Component
export struct LoginView{
  @State username: string = ''
  @State email:string = ''
  @State password: string = ''
  @State usernameColor: number = 0x000000;
  @State passwordColor: number = 0x000000;
  @State emailColor: number = 0x000000;
  @State isLoading:boolean = false
  private  timeOutId = -1
  aboutToDisappear(){
    clearTimeout(this.timeOutId)
    this.timeOutId = -1
  }
  formIsSuccess() {
    return this.username.trim() !=="" && this.email.trim() !== "" && this.password.trim() !== "";
  }
  loginCheck() {
    //   1、非空验证
    if (this.username.trim() == "") {
      console.log("用户名不能为空")
      this.usernameColor = 0xff0000;

      return;
    }
    if (this.email.trim() == "") {
      console.log("用户名不能为空")
      this.emailColor = 0xff0000;
      return;
    }
    if (this.password.trim() == "") {
      console.log("密码不能为空")
      this.passwordColor = 0xff0000;
      return;
    }
    //3、发送请求，进行登录
    const httpRequest = http.createHttp();
    // get请求，给后端传递数据的方式一：
    // 请求地址?属性名1=属性值1&属性名2=属性值2
    httpRequest.request(`http://localhost:3000/users?username=${this.username}&email=${this.email}&password=${this.password}`,(err,data)=>{
      // !err 只是表示请求响应没有问题，不代表是否获取到了数据
      if(!err){
        console.log("data.result",data.result)
        // const arr = JSON.parse(data.result)
        const arr:number[]=[]
        if(arr.length===1){
          console.log("登录成功");
          // 保存登录的相关信息（如：用户名，电话号码）
          storage.setOrCreate("username",this.username);
          storage.setOrCreate("email",this.email);
          storage.setOrCreate("password",this.password);
          console.log("from",(router.getParams() as IParams).from)
          // 跳转到我的页面。
          // router.back();
          router.pushUrl({
            url:(router.getParams() as IParams).from,
            params:{
              data:(router.getParams() as IParams).data
            }
          })
        }else{
          console.log("登录失败，邮箱或密码不正确")
        }
      }else{
        console.log("网络出错")
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
        Text('欢迎').fontSize(26).fontColor('#333').fontWeight(FontWeight
          .Bold)
        Blank()
        TextInput({placeholder:'用户名',text:this.username}).height(50).width('100%')
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
          if (this.isLoading){
            LoadingProgress().width(30).height(30).color(Color.White)
          }else {
            Text('登录').fontColor(Color.White).fontSize(18)
          }
        }.width('100%').height(40).backgroundColor('#7dd082').margin({top:20})
        .enabled(this.formIsSuccess())
        .onClick(()=>{
          this.loginCheck();
        })
        Blank()
        Row(){
          Text('注册账号').fontColor('#333')
            .onClick(()=>{
              router.pushUrl({
                url:'pages/RegisterPage'
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
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}