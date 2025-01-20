@interface DMAnalytics
+ (id)sharedInstance;
- (void)sendLazyEventWithName:(id)a3 payloadBuilder:(id)a4;
@end

@implementation DMAnalytics

+ (id)sharedInstance
{
  if (qword_10002CBC8 != -1) {
    dispatch_once(&qword_10002CBC8, &stru_1000209D0);
  }
  return (id)qword_10002CBC0;
}

- (void)sendLazyEventWithName:(id)a3 payloadBuilder:(id)a4
{
}

@end