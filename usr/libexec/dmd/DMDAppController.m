@interface DMDAppController
+ (BOOL)_stateCanBeResetSafely:(unint64_t)a3;
+ (DMDAppController)sharedController;
+ (NSString)metadataPath;
+ (void)_sendAppStatusChangeNotification;
- (BOOL)_isManagedBundleIdentifier:(id)a3;
- (BOOL)_setMetadata:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_updateMetadataSettingKey:(id)a3 toValue:(id)a4 forBundleIdentifier:(id)a5 error:(id *)a6;
- (BOOL)removePersonaMappingForBundleID:(id)a3 error:(id *)a4;
- (BOOL)setAllowUserToHide:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAllowUserToLock:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAssociatedDomains:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setAssociatedDomainsEnableDirectDownloads:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setCellularSliceUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setContentFilterUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setDNSProxyUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setManagementInformation:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setRelayUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setState:(unint64_t)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setVPNUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)writeManagementInformationToDiskWithError:(id *)a3;
- (DMFOSStateHandler)stateHandler;
- (NSArray)foregroundBundleIdentifiers;
- (NSArray)managedBundleIdentifiers;
- (NSMutableDictionary)manifest;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)DNSProxyUUIDStringForBundleIdentifier:(id)a3;
- (id)VPNUUIDStringForBundleIdentifier:(id)a3;
- (id)_metadataByBundleIdentifier;
- (id)_metadataForBundleIdentifier:(id)a3;
- (id)_newMetadataDictionary;
- (id)allowUserToHideForBundleIdentifier:(id)a3;
- (id)allowUserToLockForBundleIdentifier:(id)a3;
- (id)associatedDomainsEnableDirectDownloadsForBundleIdentifier:(id)a3;
- (id)associatedDomainsForBundleIdentifier:(id)a3;
- (id)cellularSliceUUIDStringForBundleIdentifier:(id)a3;
- (id)configurationForBundleIdentifier:(id)a3;
- (id)contentFilterUUIDStringForBundleIdentifier:(id)a3;
- (id)feedbackForBundleIdentifier:(id)a3;
- (id)initPrivate;
- (id)managementInformationForBundleIdentifier:(id)a3;
- (id)relayUUIDStringForBundleIdentifier:(id)a3;
- (id)removabilityForBundleIdentifier:(id)a3;
- (id)sourceIdentifierForBundleIdentifier:(id)a3;
- (id)tapToPayScreenLockForBundleIdentifier:(id)a3;
- (unint64_t)stateForBundleIdentifier:(id)a3;
- (void)_applyChangeInLifeCycle:(id)a3 stateMap:(id)a4;
- (void)_cleanUpStaleManagementStatesAndStartObservingApps;
- (void)_getEnterpriseAppMetadataForManifestURL:(id)a3 completion:(id)a4;
- (void)_getEnterpriseAppMetadataFromData:(id)a3 completion:(id)a4;
- (void)_resetStateForChangeInLifeCycle:(id)a3 newState:(unint64_t)a4;
- (void)_stopObservingLifeCycle:(id)a3;
- (void)advanceTransientStates;
- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)cancelAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)didFailInstallingForLifeCycle:(id)a3;
- (void)didFinishInstallingForLifeCycle:(id)a3;
- (void)didFinishUninstallingForLifeCycle:(id)a3;
- (void)didFinishUpdatingForLifeCycle:(id)a3;
- (void)didResetStateForLifeCycle:(id)a3 state:(unint64_t)a4;
- (void)didStartInstallingForLifeCycle:(id)a3;
- (void)didStartUpdatingForLifeCycle:(id)a3;
- (void)getBundleIdentifierForAppRequest:(id)a3 completion:(id)a4;
- (void)getBundleIdentifierForManifestURL:(id)a3 completion:(id)a4;
- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5;
- (void)getMetadataForAppRequest:(id)a3 completion:(id)a4;
- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4;
- (void)handleFetchRequest:(id)a3 completion:(id)a4;
- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)resumeAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)sendManagedAppsChangedNotification;
- (void)setRemovability:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setTapToPayScreenLock:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 associatedDomains:(id)a5 enableDirectDownloads:(id)a6 configuration:(id)a7 options:(unint64_t)a8 forBundleIdentifier:(id)a9;
- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 contentFilterUUIDString:(id)a5 DNSProxyUUIDString:(id)a6 relayUUIDString:(id)a7 associatedDomains:(id)a8 enableDirectDownloads:(id)a9 allowUserToHide:(id)a10 allowUserToLock:(id)a11 configuration:(id)a12 options:(unint64_t)a13 sourceIdentifier:(id)a14 forBundleIdentifier:(id)a15;
- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4;
- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4;
- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4;
- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)updateBundleIDPersonaIDMappingForPersonaID:(id)a3 addingBundleID:(id)a4 completionHandler:(id)a5;
@end

@implementation DMDAppController

+ (DMDAppController)sharedController
{
  if (qword_1000CCB90 != -1) {
    dispatch_once(&qword_1000CCB90, &stru_10009D968);
  }
  return (DMDAppController *)(id)qword_1000CCB88;
}

- (id)initPrivate
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___DMDAppController;
  v2 = -[DMDAppController init](&v37, "init");
  v3 = v2;
  if (!v2) {
    return v3;
  }
  v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.dmd.%@.%p",  objc_opt_class(v2),  v2);
  id v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  id v8 = [(id)objc_opt_class(v3) metadataPath];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v11 = [v10 fileExistsAtPath:v9];

  if (!v11) {
    goto LABEL_9;
  }
  id v36 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v9,  0LL,  &v36));
  id v13 = v36;
  if (v12)
  {
    id v35 = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  1LL,  0LL,  &v35));
    id v15 = v35;
    v16 = v15;
    if (v14)
    {

      v17 = v14;
      manifest = v3->_manifest;
      v3->_manifest = v17;
LABEL_10:

      -[DMDAppController _cleanUpStaleManagementStatesAndStartObservingApps]( v3,  "_cleanUpStaleManagementStatesAndStartObservingApps");
      objc_initWeak(&location, v3);
      v24 = objc_alloc(&OBJC_CLASS___DMFOSStateHandler);
      v25 = v3->_queue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10000DD38;
      v32[3] = &unk_10009D990;
      objc_copyWeak(&v33, &location);
      v26 = -[DMFOSStateHandler initWithQueue:name:stateHandlerBlock:]( v24,  "initWithQueue:name:stateHandlerBlock:",  v25,  @"Apps",  v32);
      stateHandler = v3->_stateHandler;
      v3->_stateHandler = v26;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

      return v3;
    }

    uint64_t v19 = DMFAppLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10006079C();
    }

LABEL_9:
    v38 = @"metadataByBundleID";
    manifest = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v39 = manifest;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    v22 = (NSMutableDictionary *)[v21 mutableCopy];
    v23 = v3->_manifest;
    v3->_manifest = v22;

    v17 = 0LL;
    goto LABEL_10;
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not read app management plist at path: %@, error: %@",  v9,  v13));
  v40 = @"error";
  id v41 = v13;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
  id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v29,  v30));

  objc_exception_throw(v31);
  __break(1u);
  return result;
}

- (NSArray)foregroundBundleIdentifiers
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataByBundleIdentifier](self, "_metadataByBundleIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; Apps: %@>",
                   v3,
                   self,
                   v4));

  return (NSString *)v5;
}

- (void)getBundleIdentifierForManifestURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"DMDAppController.m", 161, @"Invalid parameter not satisfying: %@", @"manifestURL" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v15 handleFailureInMethod:a2, self, @"DMDAppController.m", 162, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v10 = DMFAppLog();
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 host]);
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Get bundle identifier for manifest URL from: %{public}@",  buf,  0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000DFBC;
  v16[3] = &unk_10009D9B8;
  id v17 = v9;
  id v13 = v9;
  -[DMDAppController _getEnterpriseAppMetadataForManifestURL:completion:]( self,  "_getEnterpriseAppMetadataForManifestURL:completion:",  v7,  v16);
}

- (void)getBundleIdentifierForAppRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2, self, @"DMDAppController.m", 174, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v19 handleFailureInMethod:a2, self, @"DMDAppController.m", 175, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v10 = DMFAppLog();
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Get bundle identifier for request: %{public}@",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  if (v12)
  {
    ((void (**)(void, void *, void))v9)[2](v9, v12, 0LL);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 storeItemIdentifier]);
    if (v13)
    {
      uint64_t v14 = DMFAppLog();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Get bundle identifier for store item identifier: %{public}@",  buf,  0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 storeItemIdentifier]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 personaIdentifier]);
      -[DMDAppController getBundleIdentifierForStoreItemIdentifier:personaIdentifier:completion:]( self,  "getBundleIdentifierForStoreItemIdentifier:personaIdentifier:completion:",  v16,  v17,  v9);
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 manifestURL]);
      -[DMDAppController getBundleIdentifierForManifestURL:completion:]( self,  "getBundleIdentifierForManifestURL:completion:",  v16,  v9);
    }
  }
}

- (void)getMetadataForAppRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"DMDAppController.m", 200, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v15 handleFailureInMethod:a2, self, @"DMDAppController.m", 201, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 manifestURL]);

  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 manifestURL]);
    -[DMDAppController _getEnterpriseAppMetadataForManifestURL:completion:]( self,  "_getEnterpriseAppMetadataForManifestURL:completion:",  v11,  v9);
  }

  else
  {
    uint64_t v12 = DMFAppLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Get metadata for non-enterprise app request: %{public}@",  buf,  0xCu);
    }

    -[DMDAppController getMetadataForNonEnterpriseAppRequest:completion:]( self,  "getMetadataForNonEnterpriseAppRequest:completion:",  v7,  v9);
  }
}

- (id)managementInformationForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"DMDAppController.m", 216, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v5));
  if (v6)
  {
    id v7 = (void *)objc_opt_new(&OBJC_CLASS___DMFAppManagementInformation);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"state"]);
    objc_msgSend(v7, "setState:", objc_msgSend(v8, "unsignedIntegerValue"));

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"flags"]);
    objc_msgSend(v7, "setOptions:", objc_msgSend(v9, "unsignedIntegerValue"));

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"RedemptionCode"]);
    [v7 setRedemptionCode:v10];

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UnusedRedemptionCode"]);
    [v7 setUnusedRedemptionCode:v11];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)setManagementInformation:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"DMDAppController.m", 235, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    id v11 = 0LL;
    goto LABEL_8;
  }

  if (!v9) {
    goto LABEL_7;
  }
LABEL_3:
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v10));
  if (!v11) {
    id v11 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 state]));
  [v11 setObject:v12 forKeyedSubscript:@"state"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 options]));
  [v11 setObject:v13 forKeyedSubscript:@"flags"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 redemptionCode]);
  [v11 setObject:v14 forKeyedSubscript:@"RedemptionCode"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 unusedRedemptionCode]);
  [v11 setObject:v15 forKeyedSubscript:@"UnusedRedemptionCode"];

LABEL_8:
  BOOL v17 = -[DMDAppController _setMetadata:forBundleIdentifier:error:]( self,  "_setMetadata:forBundleIdentifier:error:",  v11,  v10,  a5);

  return v17;
}

- (BOOL)writeManagementInformationToDiskWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController manifest](self, "manifest"));
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  a3));

  if (v6)
  {
    id v7 = [(id)objc_opt_class(self) metadataPath];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v8, 0LL));

    id v26 = 0LL;
    unsigned __int8 v10 = objc_msgSend(v6, "dm_atomicWriteToURL:error:", v9, &v26);
    id v11 = v26;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = DMFAppLog();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v14) {
          sub_10006083C((uint64_t)v11, v13, v15, v16, v17, v18, v19, v20);
        }

        if (!a3) {
          goto LABEL_14;
        }
        NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
        id v28 = v11;
        id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
        uint64_t v22 = DMFErrorWithCodeAndUserInfo(4700LL, v21);
        id v23 = objc_claimAutoreleasedReturnValue(v22);
        *a3 = v23;
      }

      else
      {
        if (v14) {
          sub_1000607FC(v13);
        }

        if (!a3) {
          goto LABEL_14;
        }
        uint64_t v24 = DMFErrorWithCodeAndUserInfo(4700LL, 0LL);
        id v21 = objc_claimAutoreleasedReturnValue(v24);
        *a3 = v21;
      }
    }

- (void)updateBundleIDPersonaIDMappingForPersonaID:(id)a3 addingBundleID:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }
}

- (BOOL)removePersonaMappingForBundleID:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)VPNUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"VPNUUID"]);

  return v5;
}

- (BOOL)setVPNUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set VPN UUID for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"VPNUUID",  v8,  v9,  &v16);
  id v13 = v16;
  BOOL v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)cellularSliceUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CellularSliceUUID"]);

  return v5;
}

- (BOOL)setCellularSliceUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set cellular slice UUID for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"CellularSliceUUID",  v8,  v9,  &v16);
  id v13 = v16;
  BOOL v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)contentFilterUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ContentFilterUUID"]);

  return v5;
}

- (BOOL)setContentFilterUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set content filter UUID for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"ContentFilterUUID",  v8,  v9,  &v16);
  id v13 = v16;
  BOOL v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)DNSProxyUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DNSProxyUUID"]);

  return v5;
}

- (BOOL)setDNSProxyUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set DNS proxy UUID for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"DNSProxyUUID",  v8,  v9,  &v16);
  id v13 = v16;
  BOOL v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)relayUUIDStringForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RelayUUID"]);

  return v5;
}

- (BOOL)setRelayUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set relay UUID for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"RelayUUID",  v8,  v9,  &v16);
  id v13 = v16;
  BOOL v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)associatedDomainsForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AssociatedDomains"]);

  return v5;
}

- (BOOL)setAssociatedDomains:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescription]);
    *(_DWORD *)buf = 138543618;
    id v19 = v9;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set associated domains for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v17 = 0LL;
  BOOL v13 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"AssociatedDomains",  v8,  v9,  &v17);
  id v14 = v17;
  uint64_t v15 = v14;
  if (a5 && !v13) {
    *a5 = v14;
  }

  return v13;
}

- (id)associatedDomainsEnableDirectDownloadsForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AssociatedDomainsEnableDirectDownloads"]);

  return v5;
}

- (BOOL)setAssociatedDomainsEnableDirectDownloads:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set associated domains enable direct downloads for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"AssociatedDomainsEnableDirectDownloads",  v8,  v9,  &v16);
  id v13 = v16;
  id v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)removabilityForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Removable"]);

  return v5;
}

- (void)setRemovability:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DMFAppLog();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v9;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Set removability for bundle identifier %{public}@: %{public}@",  buf,  0x16u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000F668;
  v26[3] = &unk_10009D9E0;
  v26[4] = self;
  id v13 = v9;
  id v27 = v13;
  id v28 = v10;
  id v14 = v10;
  uint64_t v15 = objc_retainBlock(v26);
  if (v8)
  {
    unsigned int v16 = [v8 BOOLValue];
    uint64_t v17 = 1LL;
    if (!v16) {
      uint64_t v17 = 2LL;
    }
  }

  else
  {
    uint64_t v17 = 1LL;
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000F780;
  v21[3] = &unk_10009DA30;
  id v24 = v15;
  uint64_t v25 = v17;
  id v22 = v13;
  id v23 = v8;
  id v18 = v8;
  __int16 v19 = v15;
  id v20 = v13;
  +[IXAppInstallCoordinator removabilityForAppWithBundleID:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "removabilityForAppWithBundleID:completion:",  v20,  v21);
}

- (id)tapToPayScreenLockForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TapToPayScreenLock"]);

  return v5;
}

- (void)setTapToPayScreenLock:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }
}

- (id)allowUserToHideForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AllowUserToHide"]);

  return v5;
}

- (BOOL)setAllowUserToHide:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set allow user to hide (%@) for bundle identifier: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"AllowUserToHide",  v8,  v9,  &v16);
  id v13 = v16;
  id v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)allowUserToLockForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AllowUserToLock"]);

  return v5;
}

- (BOOL)setAllowUserToLock:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set allow user to lock (%@) for bundle identifier: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
  BOOL v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:]( self,  "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:",  @"AllowUserToLock",  v8,  v9,  &v16);
  id v13 = v16;
  id v14 = v13;
  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (BOOL)_updateMetadataSettingKey:(id)a3 toValue:(id)a4 forBundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v12));
  if (!v13)
  {
    if (!v11)
    {
      BOOL v15 = 1;
      goto LABEL_10;
    }

    id v13 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Attributes"]);
  [v14 setObject:v11 forKeyedSubscript:v10];

  id v19 = 0LL;
  BOOL v15 = -[DMDAppController _setMetadata:forBundleIdentifier:error:]( self,  "_setMetadata:forBundleIdentifier:error:",  v13,  v12,  &v19);
  id v16 = v19;
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v17 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v17);
    }

    if (a6)
    {
      id v16 = v16;
      *a6 = v16;
    }
  }

LABEL_10:
  return v15;
}

- (id)configurationForBundleIdentifier:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  uint64_t v6 = objc_opt_class(self);
  id v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 handleFailureInMethod:a2, self, @"DMDAppController.m", 628, @"%@ must implement %@", v6, v8 object file lineNumber description];

  return 0LL;
}

- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4, a5));
  uint64_t v8 = objc_opt_class(self);
  id v9 = NSStringFromSelector(a2);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 handleFailureInMethod:a2, self, @"DMDAppController.m", 633, @"%@ must implement %@", v8, v10 object file lineNumber description];

  return 0;
}

- (id)feedbackForBundleIdentifier:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  uint64_t v6 = objc_opt_class(self);
  id v7 = NSStringFromSelector(a2);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 handleFailureInMethod:a2, self, @"DMDAppController.m", 638, @"%@ must implement %@", v6, v8 object file lineNumber description];

  return 0LL;
}

- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4, a5));
  uint64_t v8 = objc_opt_class(self);
  id v9 = NSStringFromSelector(a2);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 handleFailureInMethod:a2, self, @"DMDAppController.m", 643, @"%@ must implement %@", v8, v10 object file lineNumber description];

  return 0;
}

- (BOOL)setSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DMFAppLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Set source ID %@ for bundle identifier: %{public}@",  (uint8_t *)&v18,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v9));
  if (v12)
  {
    id v13 = v12;
    id v14 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"source"]);
  }

  else
  {
    if (!v8)
    {
      BOOL v16 = 1;
      goto LABEL_12;
    }

    id v13 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
    id v14 = v8;
  }

  BOOL v15 = v14;
  [v13 setObject:v8 forKeyedSubscript:@"source"];
  BOOL v16 = -[DMDAppController _setMetadata:forBundleIdentifier:error:]( self,  "_setMetadata:forBundleIdentifier:error:",  v13,  v9,  a5);

LABEL_12:
  return v16;
}

- (id)sourceIdentifierForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"source"]);

  return v4;
}

+ (NSString)metadataPath
{
  return 0LL;
}

- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4, a5));
  uint64_t v7 = objc_opt_class(self);
  id v8 = NSStringFromSelector(a2);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v10 handleFailureInMethod:a2, self, @"DMDAppController.m", 696, @"%@ must implement %@", v7, v9 object file lineNumber description];
}

- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 701, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)handleFetchRequest:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 706, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 711, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 716, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 721, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 726, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 731, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4, a5));
  uint64_t v7 = objc_opt_class(self);
  id v8 = NSStringFromSelector(a2);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v10 handleFailureInMethod:a2, self, @"DMDAppController.m", 737, @"%@ must implement %@", v7, v9 object file lineNumber description];
}

- (void)cancelAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 742, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)resumeAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 747, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppController.m", 752, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

- (void)sendManagedAppsChangedNotification
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v4 = objc_opt_class(self);
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v7 handleFailureInMethod:a2, self, @"DMDAppController.m", 756, @"%@ must implement %@", v4, v6 object file lineNumber description];
}

- (void)didStartInstallingForLifeCycle:(id)a3
{
  v6[0] = &off_1000A5DD8;
  v6[1] = &off_1000A5E08;
  v7[0] = &off_1000A5DF0;
  v7[1] = &off_1000A5DF0;
  v6[2] = &off_1000A5E20;
  v7[2] = &off_1000A5E38;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);
}

- (void)didFailInstallingForLifeCycle:(id)a3
{
  uint64_t v6 = &off_1000A5DF0;
  id v7 = &off_1000A5E50;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);
}

- (void)didFinishInstallingForLifeCycle:(id)a3
{
  uint64_t v6 = &off_1000A5DF0;
  id v7 = &off_1000A5E68;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);
}

- (void)didStartUpdatingForLifeCycle:(id)a3
{
  uint64_t v6 = &off_1000A5E68;
  id v7 = &off_1000A5E80;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);
}

- (void)didFinishUpdatingForLifeCycle:(id)a3
{
  uint64_t v6 = &off_1000A5E80;
  id v7 = &off_1000A5E68;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);
}

- (void)didFinishUninstallingForLifeCycle:(id)a3
{
  uint64_t v6 = &off_1000A5E68;
  id v7 = &off_1000A5DD8;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);
}

- (void)didResetStateForLifeCycle:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = DMFAppLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DMDAppController::didResetStateForLifeCycle(%{public}@)",  (uint8_t *)&v10,  0xCu);
  }

  -[DMDAppController _resetStateForChangeInLifeCycle:newState:]( self,  "_resetStateForChangeInLifeCycle:newState:",  v6,  a4);
}

- (NSArray)managedBundleIdentifiers
{
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_100011030;
  id v13 = sub_100011040;
  id v14 = 0LL;
  objc_initWeak(&location, self);
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDAppController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011048;
  block[3] = &unk_10009DA58;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v3, block);

  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 associatedDomains:(id)a5 enableDirectDownloads:(id)a6 configuration:(id)a7 options:(unint64_t)a8 forBundleIdentifier:(id)a9
{
}

- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 contentFilterUUIDString:(id)a5 DNSProxyUUIDString:(id)a6 relayUUIDString:(id)a7 associatedDomains:(id)a8 enableDirectDownloads:(id)a9 allowUserToHide:(id)a10 allowUserToLock:(id)a11 configuration:(id)a12 options:(unint64_t)a13 sourceIdentifier:(id)a14 forBundleIdentifier:(id)a15
{
  id v80 = a4;
  id v19 = a5;
  id v85 = a6;
  id v84 = a7;
  id v83 = a8;
  id v82 = a9;
  id v20 = a10;
  id v21 = a11;
  id v81 = a12;
  id v22 = a14;
  id v23 = a15;
  id v24 = a3;
  uint64_t v25 = DMFAppLog();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v100 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Bulk set app attributes, configuration, source ID, and management information for bundle identifier: %{public}@",  buf,  0xCu);
  }

  id v98 = 0LL;
  unsigned __int8 v27 = -[DMDAppController setVPNUUIDString:forBundleIdentifier:error:]( self,  "setVPNUUIDString:forBundleIdentifier:error:",  v24,  v23,  &v98);

  id v28 = v98;
  if ((v27 & 1) == 0)
  {
    uint64_t v29 = DMFAppLog();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100060D98();
    }
  }

  id v97 = v28;
  unsigned __int8 v31 = -[DMDAppController setCellularSliceUUIDString:forBundleIdentifier:error:]( self,  "setCellularSliceUUIDString:forBundleIdentifier:error:",  v80,  v23,  &v97,  a3);
  id v32 = v97;

  if ((v31 & 1) == 0)
  {
    uint64_t v33 = DMFAppLog();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100060D38();
    }
  }

  id v96 = v32;
  unsigned __int8 v35 = -[DMDAppController setContentFilterUUIDString:forBundleIdentifier:error:]( self,  "setContentFilterUUIDString:forBundleIdentifier:error:",  v19,  v23,  &v96);
  id v36 = v96;

  if ((v35 & 1) == 0)
  {
    uint64_t v37 = DMFAppLog();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100060CD8();
    }
  }

  id v95 = v36;
  unsigned __int8 v39 = -[DMDAppController setDNSProxyUUIDString:forBundleIdentifier:error:]( self,  "setDNSProxyUUIDString:forBundleIdentifier:error:",  v85,  v23,  &v95);
  id v40 = v95;

  if ((v39 & 1) == 0)
  {
    uint64_t v41 = DMFAppLog();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_100060C78();
    }
  }

  id v94 = v40;
  unsigned __int8 v43 = -[DMDAppController setRelayUUIDString:forBundleIdentifier:error:]( self,  "setRelayUUIDString:forBundleIdentifier:error:",  v84,  v23,  &v94);
  id v44 = v94;

  if ((v43 & 1) == 0)
  {
    uint64_t v45 = DMFAppLog();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_100060C18();
    }
  }

  id v93 = v44;
  unsigned __int8 v47 = -[DMDAppController setAssociatedDomains:forBundleIdentifier:error:]( self,  "setAssociatedDomains:forBundleIdentifier:error:",  v83,  v23,  &v93);
  id v48 = v93;

  if ((v47 & 1) == 0)
  {
    uint64_t v49 = DMFAppLog();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_100060BB8();
    }
  }

  id v92 = v48;
  unsigned __int8 v51 = -[DMDAppController setAssociatedDomainsEnableDirectDownloads:forBundleIdentifier:error:]( self,  "setAssociatedDomainsEnableDirectDownloads:forBundleIdentifier:error:",  v82,  v23,  &v92);
  id v52 = v92;

  if ((v51 & 1) == 0)
  {
    uint64_t v53 = DMFAppLog();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_100060B58();
    }
  }

  id v91 = v52;
  unsigned __int8 v55 = -[DMDAppController setAllowUserToHide:forBundleIdentifier:error:]( self,  "setAllowUserToHide:forBundleIdentifier:error:",  v20,  v23,  &v91);
  id v56 = v91;

  if ((v55 & 1) == 0)
  {
    uint64_t v57 = DMFAppLog();
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_100060AF8();
    }
  }

  id v90 = v56;
  unsigned __int8 v59 = -[DMDAppController setAllowUserToLock:forBundleIdentifier:error:]( self,  "setAllowUserToLock:forBundleIdentifier:error:",  v21,  v23,  &v90);
  id v60 = v90;

  if ((v59 & 1) == 0)
  {
    uint64_t v61 = DMFAppLog();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_100060A98();
    }
  }

  v63 = v21;
  v64 = v19;
  id v89 = v60;
  unsigned __int8 v65 = -[DMDAppController setConfiguration:forBundleIdentifier:error:]( self,  "setConfiguration:forBundleIdentifier:error:",  v81,  v23,  &v89);
  id v66 = v89;

  if ((v65 & 1) == 0)
  {
    uint64_t v67 = DMFAppLog();
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_100060A38();
    }
  }

  id v88 = v66;
  unsigned __int8 v69 = -[DMDAppController setSourceIdentifier:forBundleIdentifier:error:]( self,  "setSourceIdentifier:forBundleIdentifier:error:",  v22,  v23,  &v88);
  id v70 = v88;

  if ((v69 & 1) == 0)
  {
    uint64_t v71 = DMFAppLog();
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      sub_1000609D8();
    }
  }

  v73 = v20;
  v74 = (void *)objc_claimAutoreleasedReturnValue( -[DMDAppController managementInformationForBundleIdentifier:]( self,  "managementInformationForBundleIdentifier:",  v23));
  if (!v74) {
    v74 = (void *)objc_opt_new(&OBJC_CLASS___DMFAppManagementInformation);
  }
  [v74 setOptions:a13];
  id v87 = v70;
  unsigned __int8 v75 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:]( self,  "setManagementInformation:forBundleIdentifier:error:",  v74,  v23,  &v87);
  id v76 = v87;

  if ((v75 & 1) == 0)
  {
    uint64_t v77 = DMFAppLog();
    v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      sub_100060978();
    }
  }
}

- (unint64_t)stateForBundleIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"state"]);
    unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  }

  else
  {
    unint64_t v6 = 19LL;
  }

  return v6;
}

- (BOOL)setState:(unint64_t)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = DMFAppLog();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  a3));
    int v19 = 138543618;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Set state: %{public}@, for bundle identifier: %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v8));
  if (!v12) {
    id v12 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"state"]);
  id v14 = v13;
  if (v13) {
    uint64_t v15 = (uint64_t)[v13 unsignedIntegerValue];
  }
  else {
    uint64_t v15 = 19LL;
  }
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v12 setObject:v16 forKeyedSubscript:@"state"];

  BOOL v17 = -[DMDAppController _setMetadata:forBundleIdentifier:error:]( self,  "_setMetadata:forBundleIdentifier:error:",  v12,  v8,  a5);
  if (v15 != a3) {
    [(id)objc_opt_class(self) _sendAppStatusChangeNotification];
  }

  return v17;
}

- (void)advanceTransientStates
{
  uint64_t v3 = DMFAppLog(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Advance transient app states", buf, 2u);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](self, "managedBundleIdentifiers"));
  id v5 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v5)
  {
    id v7 = v5;
    id v8 = 0LL;
    uint64_t v39 = *(void *)v44;
    *(void *)&__int128 v6 = 138543874LL;
    __int128 v37 = v6;
    while (1)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_autoreleasePoolPush();
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[DMDAppController managementInformationForBundleIdentifier:]( self,  "managementInformationForBundleIdentifier:",  v10));
        id v13 = (char *)[v12 state];
        if ((unint64_t)(v13 - 9) >= 3)
        {
          if (v13 == (char *)15)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue( +[DMDAppLifeCycle lifeCycleForBundleIdentifier:]( &OBJC_CLASS___DMDAppLifeCycle,  "lifeCycleForBundleIdentifier:",  v10));
            id v21 = [v20 currentState];

            if (v21) {
              uint64_t v22 = 7LL;
            }
            else {
              uint64_t v22 = 8LL;
            }
            id v41 = v8;
            unsigned __int8 v23 = -[DMDAppController setState:forBundleIdentifier:error:]( self,  "setState:forBundleIdentifier:error:",  v22,  v10,  &v41,  v37);
            id v24 = v41;

            if ((v23 & 1) == 0)
            {
              uint64_t v27 = DMFAppLog(v25, v26);
              id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v36 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v22));
                *(_DWORD *)buf = v37;
                id v48 = v36;
                __int16 v49 = 2114;
                id v50 = v10;
                __int16 v51 = 2114;
                id v52 = v24;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Could not set state to %{public}@ for bundle identifier: %{public}@, error: %{public}@",  buf,  0x20u);
              }
            }

            goto LABEL_22;
          }

          if (v13 != (char *)18)
          {
            id v24 = v8;
LABEL_22:
            int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unusedRedemptionCode", v37));
            if (v19)
            {
              [v12 setUnusedRedemptionCode:0];
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v12 redemptionCode]);
              unsigned int v30 = [v29 isEqualToString:v19];

              if (v30) {
                [v12 setRedemptionCode:0];
              }
              id v40 = v24;
              unsigned __int8 v31 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:]( self,  "setManagementInformation:forBundleIdentifier:error:",  v12,  v10,  &v40);
              id v15 = v40;

              if ((v31 & 1) == 0)
              {
                uint64_t v34 = DMFAppLog(v32, v33);
                unsigned __int8 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  id v48 = v10;
                  __int16 v49 = 2114;
                  id v50 = v15;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Could not set management information for bundle identifier: %{public}@, error: %{public}@",  buf,  0x16u);
                }
              }
            }

            else
            {
              id v15 = v24;
            }

            goto LABEL_30;
          }
        }

        id v42 = v8;
        unsigned __int8 v14 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:]( self,  "setManagementInformation:forBundleIdentifier:error:",  0LL,  v10,  &v42,  v37);
        id v15 = v42;

        if ((v14 & 1) != 0) {
          goto LABEL_31;
        }
        uint64_t v18 = DMFAppLog(v16, v17);
        int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v48 = v10;
          __int16 v49 = 2114;
          id v50 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Could not remove management information for bundle identifier: %{public}@, error: %{public}@",  buf,  0x16u);
        }

- (void)_cleanUpStaleManagementStatesAndStartObservingApps
{
  v2 = self;
  uint64_t v3 = DMFAppLog(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clean up stale app states", buf, 2u);
  }

  if (qword_1000CCBA0 != -1) {
    dispatch_once(&qword_1000CCBA0, &stru_10009DA78);
  }
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](v2, "managedBundleIdentifiers"));
  id v27 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v27)
  {
    id v28 = 0LL;
    uint64_t v26 = *(void *)v31;
    id v5 = &OBJC_CLASS___NSISO8601DateFormatter_ptr;
    uint64_t v25 = v2;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v8 = objc_autoreleasePoolPush();
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDAppController managementInformationForBundleIdentifier:]( v2,  "managementInformationForBundleIdentifier:",  v7));
        int v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMDAppLifeCycle lifeCycleForBundleIdentifier:]( &OBJC_CLASS___DMDAppLifeCycle,  "lifeCycleForBundleIdentifier:",  v7));
        [v10 addObserver:v2];
        uint64_t v11 = (void *)qword_1000CCB98;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[8], "numberWithUnsignedInteger:", objc_msgSend(v9, "state")));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

        if (v13)
        {
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[8], "numberWithUnsignedInteger:", objc_msgSend(v10, "currentState")));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

          if (v15)
          {
            id v16 = [v15 unsignedIntegerValue];
            id v29 = v28;
            unsigned __int8 v17 = -[DMDAppController setState:forBundleIdentifier:error:]( v2,  "setState:forBundleIdentifier:error:",  v16,  v7,  &v29);
            id v18 = v29;

            if ((v17 & 1) == 0)
            {
              uint64_t v21 = DMFAppLog(v19, v20);
              uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v16));
                *(_DWORD *)buf = 138543874;
                unsigned __int8 v35 = v23;
                __int16 v36 = 2114;
                uint64_t v37 = v7;
                __int16 v38 = 2114;
                id v39 = v18;
                _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Could not set state to %{public}@ for bundle identifier: %{public}@, error: %{public}@",  buf,  0x20u);
              }
            }
          }

          else
          {
            id v18 = v28;
          }

          id v28 = v18;
          v2 = v25;
          id v5 = &OBJC_CLASS___NSISO8601DateFormatter_ptr;
        }

        objc_autoreleasePoolPop(v8);
      }

      id v27 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }

    while (v27);
  }

  else
  {
    id v28 = 0LL;
  }
}

- (void)_applyChangeInLifeCycle:(id)a3 stateMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  unsigned __int8 v9 = -[DMDAppController _isManagedBundleIdentifier:](self, "_isManagedBundleIdentifier:", v8);

  if ((v9 & 1) != 0)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);

    unint64_t v11 = -[DMDAppController stateForBundleIdentifier:](self, "stateForBundleIdentifier:", v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);

    if (v13)
    {
      id v16 = [v13 unsignedIntegerValue];
      uint64_t v18 = DMFAppLog(v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v11));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v16));
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        __int16 v36 = v21;
        __int16 v37 = 2114;
        __int16 v38 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Observed change in life cycle from old state: %{public}@ to new state: %{public}@ for bundle identifier: %{public}@",  buf,  0x20u);
      }

      id v32 = 0LL;
      unsigned __int8 v22 = -[DMDAppController setState:forBundleIdentifier:error:]( self,  "setState:forBundleIdentifier:error:",  v16,  v10,  &v32);
      id v23 = v32;
      uint64_t v25 = v23;
      if ((v22 & 1) == 0)
      {
        uint64_t v26 = DMFAppLog(v23, v24);
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v16));
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v31;
          __int16 v35 = 2114;
          __int16 v36 = v10;
          __int16 v37 = 2114;
          __int16 v38 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Could not set new state: %{public}@, for bundle identifier: %{public}@, error: %{public}@",  buf,  0x20u);
        }
      }

      [(id)objc_opt_class(self) _sendAppStatusChangeNotification];
    }

    else
    {
      uint64_t v28 = DMFAppLog(v14, v15);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v11));
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v30;
        __int16 v35 = 2114;
        __int16 v36 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Observed change in life cycle from old state: %{public}@ to missing new state for bundle identifier: %{public}@",  buf,  0x16u);
      }

      [(id)objc_opt_class(self) _sendAppStatusChangeNotification];
    }
  }

  else
  {
    -[DMDAppController _stopObservingLifeCycle:](self, "_stopObservingLifeCycle:", v7);
    int v10 = v7;
  }
}

- (void)_resetStateForChangeInLifeCycle:(id)a3 newState:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = DMFAppLog(v6, v7);
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    *(_DWORD *)buf = 138543362;
    __int16 v38 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DMDAppController::_resetStateForChangeInLifeCycle(%{public}@)",  buf,  0xCu);
  }

  if (qword_1000CCBB0 != -1) {
    dispatch_once(&qword_1000CCBB0, &stru_10009DA98);
  }
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  unsigned __int8 v12 = -[DMDAppController _isManagedBundleIdentifier:](self, "_isManagedBundleIdentifier:", v11);

  if ((v12 & 1) != 0)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    unint64_t v14 = -[DMDAppController stateForBundleIdentifier:](self, "stateForBundleIdentifier:", v13);
    id v15 = [(id)objc_opt_class(self) _stateCanBeResetSafely:v14];
    if ((_DWORD)v15)
    {
      uint64_t v17 = (void *)qword_1000CCBA8;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);
      id v20 = [v19 unsignedIntegerValue];

      uint64_t v23 = DMFAppLog(v21, v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v14));
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v20));
        *(_DWORD *)buf = 138543874;
        __int16 v38 = v25;
        __int16 v39 = 2114;
        id v40 = v26;
        __int16 v41 = 2114;
        id v42 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Reset state due to change in life cycle, old state: %{public}@ to new state: %{public}@ for bundle identifier: %{public}@",  buf,  0x20u);
      }

      id v36 = 0LL;
      unsigned __int8 v27 = -[DMDAppController setState:forBundleIdentifier:error:]( self,  "setState:forBundleIdentifier:error:",  v20,  v13,  &v36);
      uint64_t v28 = (os_log_s *)v36;
      __int128 v30 = v28;
      if ((v27 & 1) == 0)
      {
        uint64_t v31 = DMFAppLog(v28, v29);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v20));
          *(_DWORD *)buf = 138543874;
          __int16 v38 = v35;
          __int16 v39 = 2114;
          id v40 = v13;
          __int16 v41 = 2114;
          id v42 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Could not set new state: %{public}@, for bundle identifier: %{public}@, error: %{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      uint64_t v33 = DMFAppLog(v15, v16);
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v14));
        *(_DWORD *)buf = 138543618;
        __int16 v38 = v34;
        __int16 v39 = 2114;
        id v40 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Reset state due to change in life cycle, old state preserved: %{public}@, for bundle identifier: %{public}@",  buf,  0x16u);
      }
    }

    [(id)objc_opt_class(self) _sendAppStatusChangeNotification];
  }

  else
  {
    -[DMDAppController _stopObservingLifeCycle:](self, "_stopObservingLifeCycle:", v6);
  }
}

+ (BOOL)_stateCanBeResetSafely:(unint64_t)a3
{
  return (a3 > 0x11) | (0x1CFE7u >> a3) & 1;
}

- (BOOL)_isManagedBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](self, "managedBundleIdentifiers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self == %@",  v4));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  BOOL v9 = v8 != 0LL;

  return v9;
}

- (void)_stopObservingLifeCycle:(id)a3
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing lifecycle observer for an app that is no longer managed: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  [v4 removeObserver:self];
  [(id)objc_opt_class(self) _sendAppStatusChangeNotification];
}

+ (void)_sendAppStatusChangeNotification
{
}

- (id)_metadataForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100011030;
  uint64_t v18 = sub_100011040;
  id v19 = 0LL;
  objc_initWeak(&location, self);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDAppController queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100012DA0;
  v9[3] = &unk_10009DAC0;
  unint64_t v11 = &v14;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, v9);

  id v7 = (id)v15[5];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)_setMetadata:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = DMFAppLog(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Set metadata for bundle identifier: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100011030;
  id v32 = sub_100011040;
  id v33 = 0LL;
  objc_initWeak(&location, self);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMDAppController queue](self, "queue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100013044;
  v18[3] = &unk_10009DAE8;
  objc_copyWeak(&v23, &location);
  id v14 = v9;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  uint64_t v21 = &v25;
  p___int128 buf = &buf;
  dispatch_sync(v13, v18);

  if (a5) {
    *a5 = *(id *)(*((void *)&buf + 1) + 40LL);
  }
  BOOL v16 = *((_BYTE *)v26 + 24) != 0;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (id)_metadataByBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController manifest](self, "manifest"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"metadataByBundleID"]);

  return v3;
}

- (id)_newMetadataDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
  [v2 setObject:v3 forKeyedSubscript:@"Attributes"];

  return v2;
}

- (void)_getEnterpriseAppMetadataForManifestURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, self, @"DMDAppController.m", 1224, @"Invalid parameter not satisfying: %@", @"manifestURL" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v20 handleFailureInMethod:a2, self, @"DMDAppController.m", 1225, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v11 = DMFAppLog(v8, v9);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 host]);
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Get metadata for manifest URL from: %{public}@",  buf,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v7));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v15));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000133FC;
  v21[3] = &unk_10009DB10;
  void v21[4] = self;
  id v22 = v10;
  id v17 = v10;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 dataTaskWithRequest:v14 completionHandler:v21]);
  [v18 resume];
}

- (void)_getEnterpriseAppMetadataFromData:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, DMDAppMetadata *, void))a4;
  uint64_t v29 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  0LL,  &v29));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"items"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && [v8 count])
    {
      if ((unint64_t)[v8 count] < 2)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"metadata"]);
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"kind"]);
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0
              && ([v17 isEqualToString:@"software"] & 1) != 0)
            {
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"bundle-identifier"]);
              uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
              {
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"title"]);
                uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
                if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
                {
                  id v23 = objc_opt_new(&OBJC_CLASS___DMDAppMetadata);
                  -[DMDAppMetadata setBundleIdentifier:](v23, "setBundleIdentifier:", v19);
                  -[DMDAppMetadata setStoreItemIdentifier:](v23, "setStoreItemIdentifier:", 0LL);
                  -[DMDAppMetadata setDisplayName:](v23, "setDisplayName:", v21);
                  -[DMDAppMetadata setIsStoreApp:](v23, "setIsStoreApp:", 0LL);
                  -[DMDAppMetadata setIsFree:](v23, "setIsFree:", 0LL);
                  -[DMDAppMetadata setIsUserLicensed:](v23, "setIsUserLicensed:", 0LL);
                  v5[2](v5, v23, 0LL);
                }

                else
                {
                  uint64_t v28 = DMFErrorWithCodeAndUserInfo(2604LL, 0LL);
                  id v23 = (DMDAppMetadata *)objc_claimAutoreleasedReturnValue(v28);
                  ((void (**)(id, DMDAppMetadata *, DMDAppMetadata *))v5)[2](v5, 0LL, v23);
                }
              }

              else
              {
                uint64_t v27 = DMFErrorWithCodeAndUserInfo(2604LL, 0LL);
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v27);
                ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0LL, v21);
              }
            }

            else
            {
              uint64_t v26 = DMFErrorWithCodeAndUserInfo(2604LL, 0LL);
              id v19 = (void *)objc_claimAutoreleasedReturnValue(v26);
              ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0LL, v19);
            }
          }

          else
          {
            uint64_t v25 = DMFErrorWithCodeAndUserInfo(2604LL, 0LL);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(v25);
            ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0LL, v17);
          }
        }

        else
        {
          uint64_t v24 = DMFErrorWithCodeAndUserInfo(2604LL, 0LL);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v24);
          ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0LL, v15);
        }

        goto LABEL_9;
      }

      uint64_t v10 = 2609LL;
    }

    else
    {
      uint64_t v10 = 2604LL;
    }

    uint64_t v12 = DMFErrorWithCodeAndUserInfo(v10, 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0LL, v13);
LABEL_9:

    goto LABEL_10;
  }

  uint64_t v11 = DMFErrorWithCodeAndUserInfo(2604LL, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
  ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0LL, v8);
LABEL_10:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (DMFOSStateHandler)stateHandler
{
  return self->_stateHandler;
}

- (void).cxx_destruct
{
}

@end