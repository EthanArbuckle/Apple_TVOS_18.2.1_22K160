@interface PBCaptiveNetworkService
- (void)launchHomeCaptiveViewServiceIfNeeded;
@end

@implementation PBCaptiveNetworkService

- (void)launchHomeCaptiveViewServiceIfNeeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v3 = [v2 BOOLForKey:@"SATVIsTapToSetupModeKey"];
  id v4 = sub_100082844();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TTSU mode: %d", buf, 8u);
  }

  if ((v3 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSUserPresentationService sharedInstance]( &OBJC_CLASS___PBSUserPresentationService,  "sharedInstance"));
    id v7 = sub_100082844();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PBS UI request", buf, 2u);
    }

    v11[0] = PBSUPRDialogCustomViewControllerClassNameKey;
    v11[1] = PBSUPRDialogCustomViewServiceNameKey;
    v12[0] = @"HCVSViewController";
    v12[1] = @"com.apple.HomeCaptiveViewService";
    v11[2] = PBSUPRDialogTypeKey;
    v12[2] = PBSUPRDialogTypeCustom;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
    id v10 = [[PBSUserPresentationRequest alloc] initWithType:0 options:v9];
    [v6 presentUIWithRequest:v10 completion:&stru_1003DBB08];
  }
}

@end