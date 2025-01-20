@interface RMHeadphoneActivityManager
+ (id)sharedInstance;
- (BOOL)mslLoggingEnabled;
- (CMHeadphoneActivityManager)activityManager;
- (RMHeadphoneActivityManager)init;
- (void)setActivityManager:(id)a3;
- (void)startMslLogging;
- (void)stopMslLogging;
@end

@implementation RMHeadphoneActivityManager

+ (id)sharedInstance
{
  if (qword_100023C88 != -1) {
    dispatch_once(&qword_100023C88, &stru_10001CC88);
  }
  return (id)qword_100023C80;
}

- (RMHeadphoneActivityManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RMHeadphoneActivityManager;
  v2 = -[RMHeadphoneActivityManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___CMHeadphoneActivityManager);
    -[RMHeadphoneActivityManager setActivityManager:](v2, "setActivityManager:", v3);
  }

  return v2;
}

- (BOOL)mslLoggingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneActivityManager activityManager](self, "activityManager"));
  unsigned __int8 v3 = [v2 mslLoggingEnabled];

  return v3;
}

- (void)startMslLogging
{
  id v3 = sub_10000F490();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/HeadphoneActivity/MSL/",  v4));

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneActivityManager activityManager](self, "activityManager"));
  [v5 startMslLoggingWithFilenamePrefix:@"headphoneactivity" filePath:v6];
}

- (void)stopMslLogging
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RMHeadphoneActivityManager activityManager](self, "activityManager"));
  [v2 stopMslLogging];
}

- (CMHeadphoneActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end