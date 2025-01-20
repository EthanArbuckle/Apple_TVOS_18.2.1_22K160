@interface MCMachineInfo
+ (id)machineInfoWithKeys:(id)a3 challenge:(id)a4 identity:(__SecIdentity *)a5 additionalInfo:(id)a6 outError:(id *)a7;
+ (id)machineInfoWithKeys:(id)a3 outError:(id *)a4;
@end

@implementation MCMachineInfo

+ (id)machineInfoWithKeys:(id)a3 challenge:(id)a4 identity:(__SecIdentity *)a5 additionalInfo:(id)a6 outError:(id *)a7
{
  id v9 = a3;
  id v57 = a4;
  id v56 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  (char *)[v9 count] + (void)objc_msgSend(v56, "count")));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v61;
    id v58 = v11;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)v15);
        if ([v16 isEqualToString:@"UDID"])
        {
          uint64_t DeviceUUID = MCGestaltGetDeviceUUID();
          v18 = (void *)objc_claimAutoreleasedReturnValue(DeviceUUID);
          v19 = v10;
          v20 = v18;
          v21 = @"UDID";
          goto LABEL_14;
        }

        if ([v16 isEqualToString:@"IMEI"])
        {
          uint64_t v22 = MCCTIMEI();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v19 = v10;
          v20 = v18;
          v21 = @"IMEI";
          goto LABEL_14;
        }

        if ([v16 isEqualToString:@"MEID"])
        {
          uint64_t v23 = MCCTMEID();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v19 = v10;
          v20 = v18;
          v21 = @"MEID";
          goto LABEL_14;
        }

        if ([v16 isEqualToString:@"VERSION"])
        {
          uint64_t v24 = MCProductBuildVersion();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v19 = v10;
          v20 = v18;
          v21 = @"VERSION";
          goto LABEL_14;
        }

        if ([v16 isEqualToString:@"SERIAL"])
        {
          uint64_t v25 = MCIOSerialString();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v25);
          [v10 MCSetObjectIfNotNil:v18 forKey:@"SERIAL"];
LABEL_22:
          id v11 = v58;
          goto LABEL_15;
        }

        if ([v16 isEqualToString:@"PRODUCT"])
        {
          uint64_t ProductName = MCGestaltGetProductName();
          v18 = (void *)objc_claimAutoreleasedReturnValue(ProductName);
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[DMCFeatureOverrides productNameWithDefaultValue:]( &OBJC_CLASS___DMCFeatureOverrides,  "productNameWithDefaultValue:",  v18));
          [v10 MCSetObjectIfNotNil:v27 forKey:@"PRODUCT"];

          goto LABEL_22;
        }

        if ([v16 isEqualToString:@"LANGUAGE"])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
          v28 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
          [v10 MCSetObjectIfNotNil:v28 forKey:@"LANGUAGE"];

          goto LABEL_22;
        }

        id v11 = v58;
        if ([v16 isEqualToString:@"OS_VERSION"])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt marketingVersion](&OBJC_CLASS___DMCMobileGestalt, "marketingVersion"));
          v19 = v10;
          v20 = v18;
          v21 = @"OS_VERSION";
          goto LABEL_14;
        }

        if ([v16 isEqualToString:@"SUPPLEMENTAL_BUILD_VERSION"])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[DMCMobileGestalt supplementalBuildVersion]( &OBJC_CLASS___DMCMobileGestalt,  "supplementalBuildVersion"));
          v19 = v10;
          v20 = v18;
          v21 = @"SUPPLEMENTAL_BUILD_VERSION";
          goto LABEL_14;
        }

        if ([v16 isEqualToString:@"SUPPLEMENTAL_OS_VERSION_EXTRA"])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[DMCMobileGestalt supplementalMarketingVersionExtra]( &OBJC_CLASS___DMCMobileGestalt,  "supplementalMarketingVersionExtra"));
          v19 = v10;
          v20 = v18;
          v21 = @"SUPPLEMENTAL_OS_VERSION_EXTRA";
LABEL_14:
          [v19 MCSetObjectIfNotNil:v20 forKey:v21];
LABEL_15:
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v29 = [v11 countByEnumeratingWithState:&v60 objects:v68 count:16];
      id v13 = v29;
    }

    while (v29);
  }

  if (v57) {
    [v10 setObject:v57 forKey:@"CHALLENGE"];
  }
  [v10 addEntriesFromDictionary:v56];
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  id v59 = 0LL;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  100LL,  0LL,  &v59));
  id v32 = v59;
  if (v32)
  {
    v33 = v32;
    uint64_t v34 = MCOTAProfilesErrorDomain;
    uint64_t v35 = MCErrorArray(@"OTA_CANNOT_CREATE_ATTRIBUTE_DICT");
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v34,  24000LL,  v36,  v33,  MCErrorTypeFatal,  0LL));
    goto LABEL_39;
  }

  if (a5)
  {
    int v38 = SecCMSSignDataAndAttributes(a5, v31, 0LL, v30, 0LL);
    if (v38)
    {
LABEL_38:
      uint64_t v39 = MCOTAProfilesErrorDomain;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v38));
      uint64_t v40 = MCErrorArray(@"OTA_CANNOT_SIGN_ATTRIBUTE_DICT_P_OSSTATUS");
      v33 = (void *)objc_claimAutoreleasedReturnValue(v40);
      id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v39,  24001LL,  v33,  MCErrorTypeFatal,  v36,  0LL));
      goto LABEL_39;
    }

+ (id)machineInfoWithKeys:(id)a3 outError:(id *)a4
{
  return [a1 machineInfoWithKeys:a3 challenge:0 identity:0 additionalInfo:0 outError:a4];
}

@end