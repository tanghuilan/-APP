import router from '@ohos.router';
import { storage } from '../../utils/globaldata';
import { UserHeadInfoView } from './UserHeadInfoView';
import { UserHeadView } from './UserHeadView';

// 获取用户名，并将其转换为布尔值
// 如果用户名存在且非空，则认为已登录；否则认为未登录
const getUsername = (): boolean => {
  const username: string | undefined = storage.get("username"); // 假设 storage.get 返回字符串或 undefined
  return !!username; // 将 undefined 或空字符串转换为 false，其他情况转换为 true
};

@Component
export struct MineView {
  @State isLogin: boolean = getUsername(); // 初始化 isLogin 为 getUsername 的返回值

  build() {
    Column() { // 使用 Column 组件布局
      if (!this.isLogin) { // 判断是否已登录
        UserHeadView() // 未登录时显示 UserHeadView
      } else {
        UserHeadInfoView() // 已登录时显示 UserHeadInfoView
      }
    }.width('100%').height('100%'); // 设置 Column 的宽度和高度
  }
}