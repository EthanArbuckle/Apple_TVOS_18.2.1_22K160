@interface MCProfileConnection
- (BOOL)pb_appRestrictionsProfileInstalled;
- (BOOL)pb_usesManagedDiagnostics;
- (NSString)pb_diagnosticsUploadURLString;
@end

@implementation MCProfileConnection

- (BOOL)pb_usesManagedDiagnostics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileConnection pb_diagnosticsUploadURLString](self, "pb_diagnosticsUploadURLString"));
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)pb_diagnosticsUploadURLString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileConnection cloudConfigurationDetails](self, "cloudConfigurationDetails"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMCCCDiagnosticsUploadURL]);
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (BOOL)pb_appRestrictionsProfileInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  uint64_t v3 = MCFeatureMaximumAppsRating;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 parametersForValueSetting:MCFeatureMaximumAppsRating]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveParametersForValueSetting:v3]);

  uint64_t v7 = MCSettingParameterRangeMaximumKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:MCSettingParameterRangeMaximumKey]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKey:v7]);
  v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    LOBYTE(v12) = 0;
  }
  else {
    unsigned int v12 = [v8 isEqual:v9] ^ 1;
  }

  return v12;
}

@end