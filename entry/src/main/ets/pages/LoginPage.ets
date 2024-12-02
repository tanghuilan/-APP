import { LoginView } from '../views/loginview/LoginView'


@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      LoginView()
    }.width('100%').height('100%')
  }
}