@interface PBTVGuideIntent
- (BOOL)focusedAppCanHandle:(id)a3;
- (BOOL)shouldFallbackToSettings;
- (BOOL)stbAppCanHandle:(id)a3;
- (NSUserActivity)userActivity;
- (void)didDispatchToForegroundedApp;
- (void)didDispatchToSetTopBoxApp;
@end

@implementation PBTVGuideIntent

- (BOOL)shouldFallbackToSettings
{
  return 0;
}

- (NSUserActivity)userActivity
{
  v2 = objc_alloc(&OBJC_CLASS___NSUserActivity);
  return -[NSUserActivity initWithActivityType:](v2, "initWithActivityType:", TVUserActivityTypeBrowsingChannelGuide);
}

- (BOOL)focusedAppCanHandle:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 applicationInfo]);
  unsigned __int8 v4 = [v3 supportsBrowsingChannelGuideUserActivityType];

  return v4;
}

- (BOOL)stbAppCanHandle:(id)a3
{
  BOOL v3 = -[PBTVGuideIntent focusedAppCanHandle:](self, "focusedAppCanHandle:", a3);
  if (!v3) {
    +[PBDataReportingService noteGuideEventResultForAction:]( &OBJC_CLASS___PBDataReportingService,  "noteGuideEventResultForAction:",  2LL);
  }
  return v3;
}

- (void)didDispatchToForegroundedApp
{
}

- (void)didDispatchToSetTopBoxApp
{
}

@end