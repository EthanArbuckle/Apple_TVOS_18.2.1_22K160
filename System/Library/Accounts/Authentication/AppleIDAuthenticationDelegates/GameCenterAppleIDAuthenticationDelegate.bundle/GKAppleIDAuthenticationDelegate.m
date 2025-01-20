@interface GKAppleIDAuthenticationDelegate
- (NSString)delegateServiceIdentifier;
- (void)didReceiveAuthenticationResponseParameters:(id)a3 accountStore:(id)a4 account:(id)a5 completion:(id)a6;
@end

@implementation GKAppleIDAuthenticationDelegate

- (NSString)delegateServiceIdentifier
{
  return (NSString *)GKGameCenterIdentifier;
}

- (void)didReceiveAuthenticationResponseParameters:(id)a3 accountStore:(id)a4 account:(id)a5 completion:(id)a6
{
  v9 = (__CFString *)a3;
  id v10 = a4;
  v11 = (__CFString *)a5;
  v12 = (void (**)(void))a6;
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GameCenterAppleID AuthenticationDelegate/GKAppleIDAuthenticationDelegate.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (completion != ((void *)0))\n[%s (%s:%d)]",  v13,  "-[GKAppleIDAuthenticationDelegate didReceiveAuthenticationResponseParameters:accountStore:account:completion:]",  [v15 UTF8String],  75));

    v12 = 0LL;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  v17 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  v211 = -[NSUserDefaults initWithSuiteName:](v17, "initWithSuiteName:", GKDaemonIdentifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v211, "objectForKey:", GKOptedOutOfGameCenter));
  unsigned int v19 = [v18 BOOLValue];

  if (v19)
  {
    v21 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v22 = (id)GKOSLoggers(v20);
      v21 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate ignoring authentication response since user has opted out of game center.",  buf,  2u);
    }

@end