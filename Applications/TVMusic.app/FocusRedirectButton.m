@interface FocusRedirectButton
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation FocusRedirectButton

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if (-[FocusRedirectButton isFocused](self, "isFocused", a3, a4))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000303E8;
    v6[3] = &unk_100268CF0;
    v6[4] = self;
    v5 = v6;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100030464;
    block[3] = &unk_100268D60;
    id v8 = v5;
    dispatch_async(&_dispatch_main_q, block);
  }

@end