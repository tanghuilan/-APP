import HomeBanner from './components/home/HomeBanner';
import HomeClassify from './components/home/HomeClassify';
import HomeRecommend from './components/home/HomeRecommend';
import HomeSubarea from './components/home/HomeSubarea';
import HomeWelfare from './components/home/HomeWelfare';
import HomeHeader from './components/home/HomeHeader';

@Component
struct Home {
  scroller: Scroller = new Scroller()
  @State message: string = 'Hello World';
  // 是否展示回到顶部按钮
  @State isShowGoTopButton: boolean = false
  aboutToAppear(): void {
  }
  onPageShow(): void {
  }
  build() {
    Column() {
      // 头部
      HomeHeader()
      // 内容主题
      Scroll(this.scroller) {
        Column() {
          // banner滚动部分
          HomeBanner()
          // 分类菜单部分
          HomeClassify()
          // 热门推荐
          HomeWelfare()
          // 商品精选
          HomeRecommend()
          // 往期推荐
          HomeSubarea()
        }
        .width('100%')
        .margin({ bottom: 15 })
      }
      .width('100%')
      .layoutWeight(1)
      .onWillScroll(() => {
        const scrollYOffset = this.scroller.currentOffset().yOffset
          this.isShowGoTopButton = scrollYOffset > 200 ? true : false
      })

      if(this.isShowGoTopButton) Button({ type: ButtonType.Circle, stateEffect: true }) {
        Image($r('app.media.up'))
          .width(20)
          .fillColor('#666')
      }
      .width(35)
      .height(35)
      .backgroundColor('#fff')
      .shadow({
        radius: 3,
        color: '#666',
        offsetX: 2,
        offsetY: 2
      })
      .position({
        bottom: 10,
        right: 10
      })
      .onClick(() => {
        this.scroller.scrollEdge(Edge.Top)
      })
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      colors: [['#36def6de', 0], ['#fefefe', 1]]
    })

  }
}

export default Home