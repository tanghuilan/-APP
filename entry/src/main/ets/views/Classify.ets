import { router } from '@kit.ArkUI';

interface Health {
  title: string;
  time: string;
  imagePath: Resource;
  pagesUrl: string;
}

@Entry
@Component
struct Classify {
  @State health: Health[] = [
    { title: '“伪养生”的坑，你踩了几个？', time: '2024-10-11', imagePath: $r('app.media.health1'), pagesUrl: 'pages/health1' },
    { title: '健康午睡，该睡多长时间 | 科普时间', time: '2024-10-11', imagePath: $r('app.media.health2'), pagesUrl: 'pages/health2' },
    { title: '从中医“无味”学养生，调养身体变简单！', time: '2024-10-11', imagePath: $r('app.media.health3'), pagesUrl: 'pages/health3' },
    { title: '国医大师李济仁的秋季养生法，分享给您，不妨跟着做起来！', time: '2024-10-11', imagePath: $r('app.media.health4'), pagesUrl: 'pages/health2' },
    { title: '秋分养生：宜滋阴润肺，调整作息 | 时令节气与健康', time: '2024-10-11', imagePath: $r('app.media.health5'), pagesUrl: 'pages/health3' }
  ];

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('发现').fontSize(18).letterSpacing(2);

        // 搜索框
        Row({ space: 5 }) {
          Search({placeholder: '请输入内容...'}).layoutWeight(1)
          Text('搜索').fontSize(18).letterSpacing(1).padding(10)
        }.padding({ left: 10, right: 10 })

        // 轮播图
        Swiper() {
          Image($r('app.media.swiper1'))
          Image($r('app.media.swiper2'))
          Image($r('app.media.swiper3'))
        }
        .width('100%')
        .height(150)
        .borderRadius(10)
        .interval(2000)
        .autoPlay(true)

        // 列表显示
        ForEach(this.health, (item: Health) => {
          Row({ space: 10 }) {
            Column({ space: 10 }) {
              Text(item.title).width('60%').fontSize(16)
              Text(item.time).width('60%').fontSize(12).fontColor('#5a566b')
            }

            Image(item.imagePath).width(120).height(80).borderRadius(8).margin({ bottom: 10 })
          }
          .width('100%')
          .margin({ bottom: 10 })
          .border({ width: { bottom: 1 }, color: '#f0f0f2' })
          .onClick(() => {
            router.pushUrl({
              url: item.pagesUrl
            })
          })
        })
      }.padding(10).width('100%')
    }
  }
}
export default Classify