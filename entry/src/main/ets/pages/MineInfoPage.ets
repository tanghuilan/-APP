import { MineInfoView } from '../views/mine/MineInfoView'

@Entry
@Component
struct MineInfoPage {

  build() {
    Row() {
      Column() {
MineInfoView()
      }
      .width('100%')
    }
  }
}