import { RegisterView } from '../views/registerview/RegisterView'

@Entry
@Component
struct RegisterPage{
  build(){
    Column(){
      // RegTest1()
      RegisterView()
    }.width('100%').height('100%')
  }
}