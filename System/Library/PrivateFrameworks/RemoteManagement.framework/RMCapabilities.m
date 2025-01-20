@interface RMCapabilities
+ (BOOL)isClassItemSupported:(Class)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (BOOL)isConfigurationSchemaItemSupported:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (BOOL)isStatusSchemaItemSupported:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (NSMutableDictionary)capabilitiesByCapabilitiesType;
+ (id)_clientCapabilitiesModelForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedActivationsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedAssetsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedClasses:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (id)_supportedConfigurationSchemas:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (id)_supportedConfigurationsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedManagementForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedPayloadsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedStatusClasses:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (id)_supportedStatusItemsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
+ (id)_supportedStatusSchemas:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6;
+ (id)capabilitiesForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5;
- (NSString)versionHash;
- (RMCapabilities)initWithClientCapabilitiesModel:(id)a3;
- (RMModelStatusManagementClientCapabilities)status;
@end

@implementation RMCapabilities

+ (id)capabilitiesForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld-%ld-%lu",  a3,  a4,  a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 capabilitiesByCapabilitiesType]);
  v11 = (RMCapabilities *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

  if (!v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___RMCapabilities);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMCapabilities _clientCapabilitiesModelForEnrollmentType:scope:protocolType:]( &OBJC_CLASS___RMCapabilities,  "_clientCapabilitiesModelForEnrollmentType:scope:protocolType:",  a3,  a4,  a5));
    v11 = -[RMCapabilities initWithClientCapabilitiesModel:](v12, "initWithClientCapabilitiesModel:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 capabilitiesByCapabilitiesType]);
    [v14 setObject:v11 forKeyedSubscript:v9];
  }

  return v11;
}

+ (BOOL)isClassItemSupported:(Class)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  return -[objc_class isSupportedForPlatform:scope:enrollmentType:]( a3,  "isSupportedForPlatform:scope:enrollmentType:",  +[RMModelSharedDefinitions currentPlatform]( &OBJC_CLASS___RMModelSharedDefinitions,  "currentPlatform",  a3,  a4,  a5,  a6),  a5,  a4);
}

+ (BOOL)isConfigurationSchemaItemSupported:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  id v8 = a3;
  LOBYTE(a5) = objc_msgSend( v8,  "isSupportedForPlatform:scope:enrollmentType:",  +[RMModelSharedDefinitions currentPlatform]( RMModelSharedDefinitions,  "currentPlatform"),  a5,  a4);

  return a5;
}

+ (BOOL)isStatusSchemaItemSupported:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  id v8 = a3;
  LOBYTE(a5) = objc_msgSend( v8,  "isSupportedForPlatform:scope:enrollmentType:",  +[RMModelSharedDefinitions currentPlatform]( RMModelSharedDefinitions,  "currentPlatform"),  a5,  a4);

  return a5;
}

+ (NSMutableDictionary)capabilitiesByCapabilitiesType
{
  if (qword_1000CEF90 != -1) {
    dispatch_once(&qword_1000CEF90, &stru_1000B8E98);
  }
  return (NSMutableDictionary *)(id)qword_1000CEF88;
}

- (RMCapabilities)initWithClientCapabilitiesModel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RMCapabilities;
  v6 = -[RMCapabilities init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_status, a3);
    id v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serializeWithType:1]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v9,  10LL,  0LL));

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 RMModelSHA1HexString]);
    versionHash = v7->_versionHash;
    v7->_versionHash = (NSString *)v11;
  }

  return v7;
}

+ (id)_clientCapabilitiesModelForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  &__NSDictionary0__struct));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedPayloadsForEnrollmentType:a3 scope:a4 protocolType:a5]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusManagementClientCapabilities buildWithSupportedVersions:supportedFeatures:supportedPayloads:]( &OBJC_CLASS___RMModelStatusManagementClientCapabilities,  "buildWithSupportedVersions:supportedFeatures:supportedPayloads:",  &off_1000BEAD0,  v9,  v10));

  return v11;
}

+ (id)_supportedPayloadsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_supportedActivationsForEnrollmentType:scope:protocolType:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedAssetsForEnrollmentType:a3 scope:a4 protocolType:a5]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedConfigurationsForEnrollmentType:a3 scope:a4 protocolType:a5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedManagementForEnrollmentType:a3 scope:a4 protocolType:a5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedStatusItemsForEnrollmentType:a3 scope:a4 protocolType:a5]);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations buildWithActivations:assets:configurations:management:]( &OBJC_CLASS___RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations,  "buildWithActivations:assets:configurations:management:",  v9,  v10,  v11,  v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusManagementClientCapabilities_SupportedPayloads buildWithDeclarations:statusItems:]( &OBJC_CLASS___RMModelStatusManagementClientCapabilities_SupportedPayloads,  "buildWithDeclarations:statusItems:",  v14,  v13));

  return v15;
}

+ (id)_supportedActivationsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelClasses allActivationClasses](&OBJC_CLASS___RMModelClasses, "allActivationClasses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedClasses:v9 enrollmentType:a3 scope:a4 protocolType:a5]);

  return v10;
}

+ (id)_supportedAssetsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelClasses allAssetClasses](&OBJC_CLASS___RMModelClasses, "allAssetClasses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedClasses:v9 enrollmentType:a3 scope:a4 protocolType:a5]);

  return v10;
}

+ (id)_supportedConfigurationsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelClasses allConfigurationClasses](&OBJC_CLASS___RMModelClasses, "allConfigurationClasses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedClasses:v9 enrollmentType:a3 scope:a4 protocolType:a5]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelConfigurationSchema schemas](&OBJC_CLASS___RMModelConfigurationSchema, "schemas"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allValues]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedConfigurationSchemas:v12 enrollmentType:a3 scope:a4 protocolType:a5]);

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v10 arrayByAddingObjectsFromArray:v13]);
  id v15 = [v14 mutableCopy];

  [v15 sortUsingSelector:"caseInsensitiveCompare:"];
  return v15;
}

+ (id)_supportedManagementForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelClasses allManagementClasses](&OBJC_CLASS___RMModelClasses, "allManagementClasses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedClasses:v9 enrollmentType:a3 scope:a4 protocolType:a5]);

  return v10;
}

+ (id)_supportedStatusItemsForEnrollmentType:(int64_t)a3 scope:(int64_t)a4 protocolType:(unint64_t)a5
{
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelClasses allStatusItemClasses](&OBJC_CLASS___RMModelClasses, "allStatusItemClasses"));
  id v10 = [v9 mutableCopy];

  if (a5) {
    objc_msgSend(v10, "removeObject:", objc_opt_class(RMModelStatusManagementPushToken, v11));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedStatusClasses:v10 enrollmentType:a3 scope:a4 protocolType:a5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelStatusSchema schemas](&OBJC_CLASS___RMModelStatusSchema, "schemas"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allValues]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _supportedStatusSchemas:v14 enrollmentType:a3 scope:a4 protocolType:a5]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v15]);
  id v17 = [v16 mutableCopy];

  [v17 sortUsingSelector:"caseInsensitiveCompare:"];
  return v17;
}

+ (id)_supportedClasses:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  id v9 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "registeredIdentifier", v18));
        if (+[RMFeatureFlags isAllowedDeclarationType:](&OBJC_CLASS___RMFeatureFlags, "isAllowedDeclarationType:", v16)
          && [a1 isClassItemSupported:v15 enrollmentType:a4 scope:a5 protocolType:a6])
        {
          [v18 addObject:v16];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  [v18 sortUsingSelector:"caseInsensitiveCompare:"];
  return v18;
}

+ (id)_supportedConfigurationSchemas:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  id v9 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configurationType", v18));
        if (+[RMFeatureFlags isAllowedDeclarationType:](&OBJC_CLASS___RMFeatureFlags, "isAllowedDeclarationType:", v16)
          && [a1 isConfigurationSchemaItemSupported:v15 enrollmentType:a4 scope:a5 protocolType:a6])
        {
          [v18 addObject:v16];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  [v18 sortUsingSelector:"caseInsensitiveCompare:"];
  return v18;
}

+ (id)_supportedStatusClasses:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  id v9 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "statusItemType", v18));
        if (+[RMFeatureFlags isAllowedStatusItem:](&OBJC_CLASS___RMFeatureFlags, "isAllowedStatusItem:", v16)
          && [a1 isClassItemSupported:v15 enrollmentType:a4 scope:a5 protocolType:a6])
        {
          [v18 addObject:v16];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  [v18 sortUsingSelector:"caseInsensitiveCompare:"];
  return v18;
}

+ (id)_supportedStatusSchemas:(id)a3 enrollmentType:(int64_t)a4 scope:(int64_t)a5 protocolType:(unint64_t)a6
{
  id v9 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "statusType", v18));
        if (+[RMFeatureFlags isAllowedDeclarationType:](&OBJC_CLASS___RMFeatureFlags, "isAllowedDeclarationType:", v16)
          && [a1 isStatusSchemaItemSupported:v15 enrollmentType:a4 scope:a5 protocolType:a6])
        {
          [v18 addObject:v16];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  [v18 sortUsingSelector:"caseInsensitiveCompare:"];
  return v18;
}

- (RMModelStatusManagementClientCapabilities)status
{
  return self->_status;
}

- (NSString)versionHash
{
  return self->_versionHash;
}

- (void).cxx_destruct
{
}

@end