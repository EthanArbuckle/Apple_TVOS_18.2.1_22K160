@interface CCDEnrollmentRetrieveCloudConfigurationOperation
- (BOOL)_convertCloudConfigDictionary:(id)a3 toManagedConfiguration:(id *)a4;
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
- (void)_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:(id)a3;
- (void)_setLockdownCloudConfigAvailableKeyIfNeededWithError:(id)a3;
@end

@implementation CCDEnrollmentRetrieveCloudConfigurationOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v6 = a4;
  if (a3 == 401)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](&OBJC_CLASS___CCDError, "cloudConfigErrorInResponse:", v6));
    v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](&OBJC_CLASS___CCDError, "internalErrorWithCode:", 34000LL));
    }
    v7 = v10;
  }

  else if (a3 == 400)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](&OBJC_CLASS___CCDError, "cloudConfigErrorInResponse:", v6));
    -[CCDEnrollmentRetrieveCloudConfigurationOperation _setLockdownCloudConfigAvailableKeyIfNeededWithError:]( self,  "_setLockdownCloudConfigAvailableKeyIfNeededWithError:",  v7);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](&OBJC_CLASS___CCDError, "teslaServiceDownError"));
  }

  return v7;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDFeatures depResponseDataFromData:](&OBJC_CLASS___CCDFeatures, "depResponseDataFromData:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CCDFeatures depResponseContentTypeFromContentType:]( &OBJC_CLASS___CCDFeatures,  "depResponseContentTypeFromContentType:",  v8));

  id v11 = [v10 containsString:@"text/plain"];
  if ((_DWORD)v11)
  {
    v14 = (NSString *)objc_claimAutoreleasedReturnValue( +[CCDError cloudConfigErrorInResponse:]( &OBJC_CLASS___CCDError,  "cloudConfigErrorInResponse:",  v9));
    v17 = *(os_log_s **)(DEPLogObjects(v14, v15, v16) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Got 200 response with error: %@", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString domain](v14, "domain"));
    if (![v18 isEqualToString:@"MCCloudConfigurationErrorDomain"]
      || -[NSString code](v14, "code") == (id)33024
      || -[NSString code](v14, "code") == (id)33025)
    {
    }

    else
    {
      id v45 = -[NSString code](v14, "code");

      if (v45 != (id)33017)
      {
        if (a5)
        {
          v14 = v14;
          v30 = 0LL;
          *a5 = v14;
          goto LABEL_20;
        }

        goto LABEL_19;
      }
    }

    v22 = *(os_log_s **)(DEPLogObjects(v19, v20, v21) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Return an empty configuration and ignore the MDM server error: %@ ",  buf,  0xCu);
    }

- (BOOL)_convertCloudConfigDictionary:(id)a3 toManagedConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  BOOL v8 = +[CCDValidation validateCloudConfiguration:withResultDictionary:]( &OBJC_CLASS___CCDValidation,  "validateCloudConfiguration:withResultDictionary:",  v6,  v7);

  if (v8)
  {
    -[CCDEnrollmentRetrieveCloudConfigurationOperation _setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:]( self,  "_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:",  v7);
    if (a4) {
      *a4 = v7;
    }
  }

  return v8;
}

- (void)_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"UserToken"]);

  BOOL v8 = *(os_log_s **)(DEPLogObjects(v5, v6, v7) + 8);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    uint64_t v12 = @"YES";
    if (!v4) {
      uint64_t v12 = @"NO";
    }
    int v16 = 138412290;
    v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "hasUserInfoInCloudConfiguration: %@",  (uint8_t *)&v16,  0xCu);
  }

  if (!v4)
  {
    uint64_t v13 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Enrolled devices require supervision and enrollment should be mandatory. Setting supervision and mandatory keys.",  (uint8_t *)&v16,  2u);
    }

    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsSupervised"];
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsMandatory"];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"IsMultiUser"]);
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    [v3 removeObjectForKey:@"MAIDHasCredential"];
    [v3 removeObjectForKey:@"MAIDUsername"];
  }
}

- (void)_setLockdownCloudConfigAvailableKeyIfNeededWithError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 code] == (id)33005;
    id v3 = v5;
    if (v4)
    {
      CFPreferencesSetAppValue( @"LockdownCloudConfigurationAvailable",  kCFBooleanFalse,  @"com.apple.managedconfiguration.notbackedup");
      CFPreferencesAppSynchronize(@"com.apple.managedconfiguration.notbackedup");
      id v3 = v5;
    }
  }
}

@end