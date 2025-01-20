@interface PBTVProviderIntent
- (BOOL)focusedAppCanHandle:(id)a3;
- (BOOL)shouldFallbackToSettings;
- (BOOL)stbAppCanHandle:(id)a3;
- (NSUserActivity)userActivity;
- (void)dispatchDidFailSetTopBoxAppNotInstalled;
- (void)dispatchDidFailSetTopBoxNotConfigured;
@end

@implementation PBTVProviderIntent

- (BOOL)shouldFallbackToSettings
{
  return 1;
}

- (NSUserActivity)userActivity
{
  v2 = objc_alloc(&OBJC_CLASS___NSUserActivity);
  return  -[NSUserActivity initWithActivityType:]( v2,  "initWithActivityType:",  TVUserActivityTypeBrowsingEntertainmentContent);
}

- (BOOL)focusedAppCanHandle:(id)a3
{
  return 0;
}

- (BOOL)stbAppCanHandle:(id)a3
{
  return 1;
}

- (void)dispatchDidFailSetTopBoxNotConfigured
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  VSPromptTVProviderSettingsSignInURLString));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FBDB0;
  block[3] = &unk_1003CFF08;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, block);
}

- (void)dispatchDidFailSetTopBoxAppNotInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  VSPromptTVProviderSettingsAppInstallURLString));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FBE98;
  block[3] = &unk_1003CFF08;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, block);
}

@end