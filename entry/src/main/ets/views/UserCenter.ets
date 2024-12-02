import { MineInfoView } from './mine/MineInfoView'
import {MineView} from './mine/MineView'


@Entry
@Component
struct UserCenter {
  build() {
    Row() {
      Column() {
        MineView()
      }
      .width('100%').height('100%')
    }
  }
}

export default UserCenter

