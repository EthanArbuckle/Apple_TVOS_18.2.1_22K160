@interface MCAirPlaySecurityPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (unint64_t)_accessTypeForPayloadType:(id)a3;
- (unint64_t)_securityTypeForPayloadType:(id)a3;
- (void)_setAccessType:(id)a3 securityType:(id)a4 password:(id)a5;
- (void)_setAirPlaySecurityConfiguration;
- (void)_unsetAirPlaySecurityConfiguration;
- (void)remove;
- (void)setAside;
@end

@implementation MCAirPlaySecurityPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return 1;
}

- (void)setAside
{
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCAirPlaySecurityPayloadHandler _unsetAirPlaySecurityConfiguration](self, "_unsetAirPlaySecurityConfiguration");
  }
}

- (void)_setAirPlaySecurityConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 profile]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v9 setBoolValue:0 forSetting:MCFeatureAirPlaySecuritySettingsUIAllowed sender:v14];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessType]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 securityType]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 password]);
  -[MCAirPlaySecurityPayloadHandler _setAccessType:securityType:password:]( self,  "_setAccessType:securityType:password:",  v11,  v12,  v13);
}

- (void)_unsetAirPlaySecurityConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 profile]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v9 removeBoolSetting:MCFeatureAirPlaySecuritySettingsUIAllowed sender:v10];

  -[MCAirPlaySecurityPayloadHandler _setAccessType:securityType:password:]( self,  "_setAccessType:securityType:password:",  0LL,  0LL,  0LL);
}

- (void)_setAccessType:(id)a3 securityType:(id)a4 password:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
  objc_msgSend( v14,  "setAccessType:",  -[MCAirPlaySecurityPayloadHandler _accessTypeForPayloadType:](self, "_accessTypeForPayloadType:", v10));
  unint64_t v11 = -[MCAirPlaySecurityPayloadHandler _securityTypeForPayloadType:](self, "_securityTypeForPayloadType:", v9);

  [v14 setSecurityType:v11];
  [v14 setPassword:v8];

  LODWORD(v9) = [v10 isEqualToString:kMCAirPlaySecurityAccessTypeWifiOnly];
  if ((_DWORD)v9) {
    CFBooleanRef v12 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v12 = 0LL;
  }
  CFPreferencesSetAppValue(@"restrictToInfraAdvertising", v12, @"com.apple.airplay");
  uint64_t v13 = CFPreferencesAppSynchronize(@"com.apple.airplay");
  MCSendAirPlayPreferencesChangedNotification(v13);
}

- (unint64_t)_accessTypeForPayloadType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kMCAirPlaySecurityAccessTypeWifiOnly])
  {
    unint64_t v4 = 1LL;
  }

  else
  {
    [v3 isEqualToString:kMCAirPlaySecurityAccessTypeAny];
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (unint64_t)_securityTypeForPayloadType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kMCAirPlaySecurityTypePassword])
  {
    unint64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:kMCAirPlaySecurityTypePasscodeAlways])
  {
    unint64_t v4 = 1LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

@end