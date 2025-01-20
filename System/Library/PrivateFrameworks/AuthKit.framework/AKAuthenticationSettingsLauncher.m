@interface AKAuthenticationSettingsLauncher
- (BOOL)launchSettingsForContext:(id)a3 withCheckinID:(id)a4;
- (id)_settingsPaneIDForContext:(id)a3;
@end

@implementation AKAuthenticationSettingsLauncher

- (BOOL)launchSettingsForContext:(id)a3 withCheckinID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:notifyAuthKit=true&authKitContextID=%@",  v9));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationSettingsLauncher _settingsPaneIDForContext:]( self,  "_settingsPaneIDForContext:",  v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);

  id v13 = (id)objc_claimAutoreleasedReturnValue([v8 iCloudAccountForAppleID:v12]);
  v14 = v13;
  if (!v13) {
    goto LABEL_8;
  }
  id v15 = [v8 isPrimaryiCloudAccount:v13];
  if (!(_DWORD)v15)
  {
    id v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", @"APPLE_ACCOUNT");
    if ((_DWORD)v13)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACCOUNTS_AND_PASSWORDS&path=%@",  v18));

      v11 = (__CFString *)v19;
    }

- (id)_settingsPaneIDForContext:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 serviceType];
  v5 = v4 - 1;
  if ((unint64_t)(v4 - 1) < 6 && ((0x3Bu >> (char)v5) & 1) != 0)
  {
    v8 = off_1001C8D48[(void)v5];
  }

  else
  {
    uint64_t v6 = _AKLogSystem(v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100135A54(v3, v7);
    }

    v8 = @"APPLE_ACCOUNT";
  }

  return (id)v8;
}

@end