@interface MTHandoffController
- (MTHandoffController)init;
- (NSUserActivity)activity;
- (id)supportedActivityTypes;
- (void)continueActivity:(id)a3;
- (void)continuePlaybackActivity:(id)a3;
- (void)setActivity:(id)a3;
@end

@implementation MTHandoffController

- (MTHandoffController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTHandoffController;
  return -[MTHandoffController init](&v3, "init");
}

- (void)continueActivity:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 activityType]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMPlayerManifest supportedActivityTypes](&OBJC_CLASS___IMPlayerManifest, "supportedActivityTypes"));
}

- (id)supportedActivityTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMPlayerManifest supportedActivityTypes](&OBJC_CLASS___IMPlayerManifest, "supportedActivityTypes"));
  id v3 = [v2 mutableCopy];

  return v3;
}

- (void)continuePlaybackActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E37DC;
  v6[3] = &unk_100240110;
  id v7 = v3;
  id v5 = v3;
  [v4 restoreFromUserActivity:v5 startPlayback:1 reason:2 interactive:0 completion:v6];
}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end