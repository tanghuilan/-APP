import router from '@ohos.router'
import { storage } from '../../utils/globaldata';

interface MenuToType{
  title:string;
  url:Resource;
  onClick:()=>void;
}
@Component
export struct UserHeadInfoView{
  @State username:string|undefined = storage.get("username");
  @State MenuList:MenuToType[] = [
    {
      title:"个人信息",
      url:$r('app.media.info'),
      onClick:this.navigateToInfo
    },
    {
      title:"制定计划",
      url:$r('app.media.plan'),
      onClick:this.navigateToPlan
    },
    {
      title:"退出登录",
      url:$r('app.media.exit'),
      onClick:this.logout
    }
  ];

  navigateToInfo(){
    router.pushUrl({
      url:'pages/MineInfoPage'
    })
  }

  navigateToPlan() {
    // 实现导航逻辑
    console.log("Navigating to Plan");
  }

  // 退出登录的方法
  logout() {
    //实现退出登录逻辑
      storage.delete("username");
      router.replaceUrl({
        // url:"pages/Index"
        url:"pages/MinePage"
      })
    // console.log("Logging out");
    }



  build(){
    Column(){
      Column(){
        Row({space:10}){
          Image($r('app.media.tx')).width(60).interpolation(ImageInterpolation.High).borderRadius(50)
          Column({space:4}){
            Text(this.username)
              .fontSize(18)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
            Text('健康饮食每一天')
              .fontSize(14)
              .fontColor(Color.White)
          }.alignItems(HorizontalAlign.Start)
          Blank()
          Row({space:10}){
            Image($r('app.media.setting')).width(24).onClick(()=>{

            })
            Image($r('app.media.msg')).width(24).onClick(()=>{

            })
          }
        }.width('100%').padding({left:10,right:10,top:20,bottom:30})
        Row(){
          Column(){
            Text('9')
              .fontColor('#fff')
              .fontSize(18)
            Row(){
              Text('浏览记录')
                .fontSize(14)
                .fontColor('#fff')
            }
          }

          Column(){
            Text('1')
              .fontColor('#fff')
              .fontSize(18)
            Row(){
              Text('我的商品')
                .fontSize(14)
                .fontColor('#fff')
            }
          }

          Column(){
            Text('100')
              .fontColor('#fff')
              .fontSize(18)
            Row(){
              Text('加入天数')
                .fontSize(14)
                .fontColor('#fff')
            }
          }
        }
        .width('100%')
        .padding({left: 25, right: 25,bottom:35})
        .margin({top: 10})
        .justifyContent(FlexAlign.SpaceAround)
        Image($r('app.media.VIP'))
          .width('80%')
          .padding({bottom:20})
          .borderRadius(20)
      }
      .width('100%')
      .backgroundColor('#7dd082')

      Column(){
        ForEach(this.MenuList, (item:MenuToType) => {
          Row(){
            Row(){
              Image(item.url)
                .width(20)
                .margin({right:10})
              Text(item.title)
                .fontSize(14)
            }
            Image($r('app.media.more'))
              .width(15)

          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .borderWidth({bottom:1})
          .borderColor('#ffefeeee')
          .padding({top:12,bottom:12})
          .onClick(() => {
            item.onClick();
          });
        })
      }
      .backgroundColor('#ffffff')
      .borderRadius(15)
      .padding(15)
      .width('100%')
      .margin({top:10})

    }.width('100%').justifyContent(FlexAlign.Center)
    // .padding({left:10,right:10})



  }
}
