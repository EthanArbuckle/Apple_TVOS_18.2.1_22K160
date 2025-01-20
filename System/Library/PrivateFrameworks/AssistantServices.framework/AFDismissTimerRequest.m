@interface AFDismissTimerRequest
- (void)_ad_handleTimerRequestWithCompletionHandler:(id)a3;
@end

@implementation AFDismissTimerRequest

- (void)_ad_handleTimerRequestWithCompletionHandler:(id)a3
{
  v4[0] = (void (*)(void, void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void, void))3221225472LL;
  v4[2] = (void (*)(void, void))sub_10016E29C;
  v4[3] = (void (*)(void, void))&unk_1004F3960;
  v4[4] = (void (*)(void, void))self;
  id v5 = a3;
  id v3 = v5;
  sub_100125430(v4);
}

@end