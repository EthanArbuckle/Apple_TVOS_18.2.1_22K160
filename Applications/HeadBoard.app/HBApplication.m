@interface HBApplication
- (HBApplication)init;
- (id)keyCommands;
- (void)dealloc;
- (void)sendEvent:(id)a3;
@end

@implementation HBApplication

- (HBApplication)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HBApplication;
  v2 = -[HBApplication init](&v4, "init");
  if (v2) {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HBApplication;
  -[HBApplication dealloc](&v4, "dealloc");
}

- (id)keyCommands
{
  v2 = (void *)qword_100011DE0;
  if (!qword_100011DE0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 40LL));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithKeyCodes:modifierFlags:buttonType:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithKeyCodes:modifierFlags:buttonType:",  v3,  0LL,  29360168LL));
    v8 = v4;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    v6 = (void *)qword_100011DE0;
    qword_100011DE0 = v5;

    v2 = (void *)qword_100011DE0;
  }

  return v2;
}

- (void)sendEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HBApplication;
  id v3 = a3;
  -[HBApplication sendEvent:](&v5, "sendEvent:", v3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[HBSiriRemoteAnalyticsEventLogger sharedInstance]( &OBJC_CLASS___HBSiriRemoteAnalyticsEventLogger,  "sharedInstance",  v5.receiver,  v5.super_class));
  [v4 receiveEvent:v3];
}

@end