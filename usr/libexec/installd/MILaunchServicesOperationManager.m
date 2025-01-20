@interface MILaunchServicesOperationManager
+ (BOOL)_shouldContinueAfterCheckingAttemptCountInDir:(id)a3;
+ (BOOL)_writeLaunchServicesOperation:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)appReferencesEnabled;
+ (id)_appReferenceManagerInstance;
+ (id)_discoverOrderedJournalEntriesInInstanceDir:(id)a3;
+ (id)_instanceForUID:(unsigned int)a3;
+ (id)_mostRecentInstanceDirURLWithinURL:(id)a3;
+ (id)_operationFromURL:(id)a3 error:(id *)a4;
+ (id)_registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7;
+ (id)instanceForCurrentUser;
+ (id)instanceForSystemSharedContent;
+ (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7;
+ (id)registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
+ (id)registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5;
+ (void)_reconcileOperations:(id)a3 unregisterMountPoints:(id *)a4 registerMountPoints:(id *)a5 restartUniqueOperations:(id *)a6;
- (BOOL)_createStorageBaseDirectoryWithError:(id *)a3;
- (BOOL)_onQueue_addPendingLaunchServicesOperation:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_deleteLaunchServicesOperationForSerialNumber:(unint64_t)a3 error:(id *)a4;
- (BOOL)_onQueue_journalLaunchServicesOperation:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
- (BOOL)_onQueue_unregisterAppForBundleID:(id)a3 domain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7;
- (BOOL)_onQueue_unregisterApplicationsAtMountPoint:(id)a3 error:(id *)a4;
- (BOOL)registerUsingDiscoveredInformationForAppBundleID:(id)a3 inDomain:(unint64_t)a4 resultingRecordPromise:(id *)a5 error:(id *)a6;
- (BOOL)setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
- (BOOL)unregisterAppForBundleID:(id)a3 inDomain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7;
- (BOOL)unregisterAppsAtMountPoint:(id)a3 error:(id *)a4;
- (MILaunchServicesOperationManager)initWithUID:(unsigned int)a3;
- (NSMutableDictionary)pendingOperations;
- (NSURL)instanceStorageBaseURL;
- (NSURL)lookAsideStorageBaseURL;
- (NSURL)storageBaseURL;
- (NSUUID)instanceID;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)pendingOperationTransaction;
- (id)_diskImageManagerInstance;
- (id)_lsApplicationWorkspaceInstance;
- (id)_onQueue_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8;
- (id)_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8;
- (id)_setUpLookAsideAtDirAndFindMostRecentInstance:(id)a3;
- (id)_storageURLForOperationSerialNumber:(unint64_t)a3;
- (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7;
- (id)registerInstalledInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 error:(id *)a6;
- (id)registerInstalledInfoForBuiltInAppAtURL:(id)a3 error:(id *)a4;
- (unint64_t)_onQueue_nextSerialNumber;
- (unint64_t)serialNumber;
- (unsigned)targetUID;
- (void)_onQueue_handleLaunchServicesOperationFailureForUUID:(id)a3 error:(id)a4;
- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3;
- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3 dueToLSSave:(BOOL)a4;
- (void)_reconcileOperations:(id)a3;
- (void)operationWithUUID:(id)a3 didFailToSaveWithError:(id)a4;
- (void)operationWithUUIDWasSaved:(id)a3;
- (void)purge;
- (void)reconcile;
- (void)setPendingOperationTransaction:(id)a3;
@end

@implementation MILaunchServicesOperationManager

- (id)_lsApplicationWorkspaceInstance
{
  return +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
}

+ (id)_appReferenceManagerInstance
{
  return +[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager");
}

- (id)_diskImageManagerInstance
{
  return +[MIDiskImageManager sharedInstance](&OBJC_CLASS___MIDiskImageManager, "sharedInstance");
}

+ (id)_registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (![a1 appReferencesEnabled]
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance")),
        unsigned __int8 v16 = [v15 isSharediPad],
        v15,
        (v16 & 1) != 0))
  {
    id v17 = 0LL;
    goto LABEL_4;
  }

  int v22 = sub_10000D79C();
  id v17 = 0LL;
  if (a6 - 1 > 1
    || !v22
    || (v23 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForSystemSharedContent]( MILaunchServicesOperationManager,  "instanceForSystemSharedContent")),  v26 = 0,  v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 registerInstalledInfo:v12 forAppBundleID:v13 personas:v14 inDomain:a6 error:&v26]),  id v17 = v26,  v24,  v23,  v24))
  {
LABEL_4:
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
    id v25 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 registerInstalledInfo:v12 forAppBundleID:v13 personas:v14 inDomain:a6 error:&v25]);
    id v20 = v25;

    id v17 = v20;
    if (!a7) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100050ED0();
  }
  v19 = 0LL;
  if (a7)
  {
LABEL_5:
    if (!v19) {
      *a7 = v17;
    }
  }

+ (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(id)objc_opt_class(a1) _registerInstalledInfo:v14 forAppBundleID:v13 personas:v12 inDomain:a6 error:a7];
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

+ (id)registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  if (![a1 appReferencesEnabled])
  {
    id v16 = 0LL;
    goto LABEL_6;
  }

  uint64_t v12 = sub_10000D79C();
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _appReferenceManagerInstance]);
  id v29 = 0LL;
  id v30 = 0LL;
  unsigned __int8 v14 = [v13 addReferenceForIdentity:v10 inDomain:a5 forUserWithID:v12 resultingPersonaUniqueStrings:&v30 error:&v29];
  id v15 = v30;
  id v16 = v29;

  if ((v14 & 1) != 0)
  {
    if (v15)
    {
LABEL_7:
      id v28 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue( [a1 _registerInstalledInfo:v9 forAppBundleID:v11 personas:v15 inDomain:a5 error:&v28]);
      id v20 = v16;
      id v16 = v28;
      goto LABEL_8;
    }

+ (id)registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  id v25 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v9,  a4,  &v25));
  id v11 = v25;
  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundle]);
    if (v13)
    {
      id v22 = a1;
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]);
      id v24 = v11;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "fetchInfoForBundle:forPersona:inContainer:withError:",  v13,  v14,  v10,  &v24));
      id v16 = v24;

      if (!v15)
      {
        id v17 = 0LL;
        id v11 = v16;
        if (!a5) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }

      id v23 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v22 registerInstalledInfo:v15 forIdentity:v8 inDomain:a4 error:&v23]);
      id v18 = v23;
      id v11 = v16;
    }

    else
    {
      id v19 = sub_1000130F4( (uint64_t)"+[MILaunchServicesOperationManager registerUsingDiscoveredInfoForAppIdentity:inDomain:error:]",  160LL,  MIInstallerErrorDomain,  36LL,  0LL,  0LL,  @"Failed to find bundle in bundle container %@ for %@",  v12,  (uint64_t)v10);
      id v18 = (id)objc_claimAutoreleasedReturnValue(v19);
      id v17 = 0LL;
      id v15 = 0LL;
    }

    id v11 = v18;
    if (!a5) {
      goto LABEL_13;
    }
  }

  else
  {
    id v17 = 0LL;
    id v13 = 0LL;
    id v15 = 0LL;
    if (!a5) {
      goto LABEL_13;
    }
  }

+ (id)_instanceForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100095BB8);
  v6 = (void *)qword_100095BB0;
  if (!qword_100095BB0)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v8 = (void *)qword_100095BB0;
    qword_100095BB0 = (uint64_t)v7;

    v6 = (void *)qword_100095BB0;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);
  if (!v9)
  {
    id v9 = [objc_alloc((Class)objc_opt_class(a1)) initWithUID:v3];
    [(id)qword_100095BB0 setObject:v9 forKeyedSubscript:v5];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100095BB8);

  return v9;
}

+ (id)instanceForCurrentUser
{
  return [a1 _instanceForUID:sub_10000D79C()];
}

+ (id)instanceForSystemSharedContent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  unsigned int v4 = [v3 isSharediPad];

  if (v4)
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v5) {
      sub_100050F44(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    id v13 = 0LL;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _instanceForUID:0]);
  }

  return v13;
}

- (MILaunchServicesOperationManager)initWithUID:(unsigned int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MILaunchServicesOperationManager;
  unsigned int v4 = -[MILaunchServicesOperationManager init](&v14, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.installd.LSOperationManager", v6);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    pendingOperations = v4->_pendingOperations;
    v4->_pendingOperations = v9;

    v4->_serialNumber = 1LL;
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSUUID);
    instanceID = v4->_instanceID;
    v4->_instanceID = v11;

    v4->_targetUID = a3;
  }

  return v4;
}

+ (BOOL)appReferencesEnabled
{
  return +[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled");
}

- (NSURL)storageBaseURL
{
  if (-[MILaunchServicesOperationManager targetUID](self, "targetUID")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance")),
        unsigned int v3 = [v2 isSharediPad],
        v2,
        !v3))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 currentUserLaunchServicesOperationStorageBaseURL]);
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 launchServicesOperationStorageBaseURL]);
  }

  uint64_t v6 = (void *)v5;

  return (NSURL *)v6;
}

- (NSURL)instanceStorageBaseURL
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager instanceID](self, "instanceID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v5 isDirectory:1]);

  return (NSURL *)v6;
}

- (NSURL)lookAsideStorageBaseURL
{
  if (-[MILaunchServicesOperationManager targetUID](self, "targetUID")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance")),
        unsigned int v3 = [v2 isSharediPad],
        v2,
        !v3))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 currentUserLaunchServicesOperationLookAsideStorageBaseURL]);
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 launchServicesOperationLookAsideStorageBaseURL]);
  }

  uint64_t v6 = (void *)v5;

  return (NSURL *)v6;
}

- (BOOL)_createStorageBaseDirectoryWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL"));
  unsigned int v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 class:4 error:a3];

  unsigned __int8 v8 = 0;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager instanceStorageBaseURL](self, "instanceStorageBaseURL"));
    unsigned __int8 v8 = [v5 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 class:4 error:a3];
  }

  return v8;
}

- (id)_storageURLForOperationSerialNumber:(unint64_t)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager instanceStorageBaseURL](self, "instanceStorageBaseURL"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu.plist", a3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v5 isDirectory:0]);

  return v6;
}

+ (BOOL)_writeLaunchServicesOperation:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v17 = 0LL;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v17));
  id v9 = v17;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v11 = [v10 uid];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v16 = v9;
    unsigned __int8 v13 = objc_msgSend( v8,  "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:",  v7,  420,  v11,  objc_msgSend(v12, "gid"),  4,  1,  &v16);
    id v14 = v16;

    id v9 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if ((v13 & 1) == 0) {
    *a5 = v9;
  }
LABEL_7:

  return v13;
}

- (BOOL)_onQueue_journalLaunchServicesOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _storageURLForOperationSerialNumber:]( self,  "_storageURLForOperationSerialNumber:",  [v6 serialNumber]));
  id v15 = 0LL;
  unsigned __int8 v9 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:]( self,  "_createStorageBaseDirectoryWithError:",  &v15);
  id v10 = v15;
  if ((v9 & 1) == 0)
  {

    id v10 = 0LL;
  }

  id v14 = v10;
  unsigned __int8 v11 = [(id)objc_opt_class(self) _writeLaunchServicesOperation:v6 toURL:v8 error:&v14];
  id v12 = v14;

  if (a4 && (v11 & 1) == 0) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_onQueue_deleteLaunchServicesOperationForSerialNumber:(unint64_t)a3 error:(id *)a4
{
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _storageURLForOperationSerialNumber:]( self,  "_storageURLForOperationSerialNumber:",  a3));
  id v13 = 0LL;
  unsigned __int8 v10 = [v8 removeItemAtURL:v9 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (BOOL)_onQueue_addPendingLaunchServicesOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager pendingOperations](self, "pendingOperations"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 operationUUID]);
  [v8 setObject:v6 forKeyedSubscript:v9];

  if ([v8 count] == (id)1)
  {
    unsigned __int8 v10 = (void *)os_transaction_create("com.apple.installd.pendingLSOperation");
    -[MILaunchServicesOperationManager setPendingOperationTransaction:](self, "setPendingOperationTransaction:", v10);
  }

  id v15 = 0LL;
  BOOL v11 = -[MILaunchServicesOperationManager _onQueue_journalLaunchServicesOperation:error:]( self,  "_onQueue_journalLaunchServicesOperation:error:",  v6,  &v15);
  id v12 = v15;
  id v13 = v12;
  if (v11)
  {
  }

  else if (a4)
  {
    *a4 = v12;
  }

  return v11;
}

- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3 dueToLSSave:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager pendingOperations](self, "pendingOperations"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v10]);
  if (v8)
  {
    [v7 removeObjectForKey:v10];
    -[MILaunchServicesOperationManager _onQueue_deleteLaunchServicesOperationForSerialNumber:error:]( self,  "_onQueue_deleteLaunchServicesOperationForSerialNumber:error:",  [v8 serialNumber],  0);
    if (![v7 count]) {
      -[MILaunchServicesOperationManager setPendingOperationTransaction:](self, "setPendingOperationTransaction:", 0LL);
    }
    uint64_t v9 = qword_100095BF8;
    if (v4)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5) {
LABEL_17:
      }
        MOLogWrite(v9);
    }

    else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      goto LABEL_17;
    }
  }

  else
  {
    uint64_t v9 = qword_100095BF8;
    if (v4)
    {
    }

    else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      goto LABEL_17;
    }
  }
}

- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3
{
}

- (void)_onQueue_handleLaunchServicesOperationFailureForUUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v8);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100050FB8();
  }
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v9 = v6;
    id v10 = v7;
    MOLogWrite(qword_100095BF8);
  }

  -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:]( self,  "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:",  v6,  0LL,  v9,  v10);
}

- (unint64_t)serialNumber
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_serialNumber;
}

- (unint64_t)_onQueue_nextSerialNumber
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  unint64_t result = -[MILaunchServicesOperationManager serialNumber](self, "serialNumber");
  ++self->_serialNumber;
  return result;
}

+ (id)_mostRecentInstanceDirURLWithinURL:(id)a3
{
  id v22 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v22 URLByAppendingPathComponent:@"MostRecent" isDirectory:1]);
  id v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x3032000000LL;
  v41[3] = sub_100047754;
  v41[4] = sub_100047764;
  id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  uint64_t v35 = 0LL;
  __int16 v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000LL;
  __int16 v38 = sub_100047754;
  int v39 = sub_100047764;
  id v40 = 0LL;
  if ([v21 itemExistsAtURL:obj])
  {
    id v3 = obj;
  }

  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10004776C;
    v30[3] = &unk_100081880;
    id v4 = v21;
    id v31 = v4;
    v33 = v41;
    __int16 v34 = &v35;
    uint64_t v5 = v20;
    v32 = v5;
    id v6 = [v4 enumerateURLsForItemsInDirectoryAtURL:v22 ignoreSymlinks:1 withBlock:v30];
    id v7 = v36[5];
    if (v7)
    {
      id v29 = 0LL;
      unsigned int v8 = [v4 moveItemAtURL:v7 toURL:obj error:&v29];
      id v19 = v29;
      if (v8)
      {
        objc_storeStrong(v36 + 5, obj);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10005102C();
        }
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          id v17 = v19;
          MOLogWrite(qword_100095BF8);
        }
      }

      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v9 = v5;
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v43,  16LL);
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            id v24 = 0LL;
            unsigned __int8 v14 = objc_msgSend(v4, "removeItemAtURL:error:", v13, &v24, v17, v18);
            id v15 = v24;
            if ((v14 & 1) == 0 && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
            {
              id v17 = v13;
              id v18 = v15;
              MOLogWrite(qword_100095BF8);
            }
          }

          id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v43,  16LL);
        }

        while (v10);
      }

      id v3 = v36[5];
    }

    else
    {
      id v19 = 0LL;
      id v3 = 0LL;
    }
  }

  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v41, 8);
  return v3;
}

- (id)_setUpLookAsideAtDirAndFindMostRecentInstance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL"));
  if ([v5 itemDoesNotExistOrIsNotDirectoryAtURL:v4])
  {
    [v5 removeItemAtURL:v4 error:0];
    id v7 = [(id)objc_opt_class(self) _mostRecentInstanceDirURLWithinURL:v6];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v51 = 0LL;
      v52 = &v51;
      uint64_t v53 = 0x2020000000LL;
      char v54 = 0;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_100047FD0;
      v50[3] = &unk_1000818A8;
      v50[4] = &v51;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 enumerateURLsForItemsInDirectoryAtURL:v8 ignoreSymlinks:1 withBlock:v50]);
      if (v10)
      {
        uint64_t v11 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          int v39 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
          id v42 = v10;
          MOLogWrite(v11);
        }
      }

      if (*((_BYTE *)v52 + 24))
      {
        id v47 = 0LL;
        unsigned __int8 v12 = [v5 moveItemAtURL:v6 toURL:v4 error:&v47];
        id v13 = v47;
        if ((v12 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
            sub_100051188();
          }
          id v17 = 0LL;
          int v18 = 1;
LABEL_69:

          _Block_object_dispose(&v51, 8);
          if (v18) {
            goto LABEL_70;
          }
LABEL_71:
          id v17 = v17;
          uint64_t v37 = v17;
          goto LABEL_72;
        }

        id v46 = 0LL;
        unsigned __int8 v14 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:]( self,  "_createStorageBaseDirectoryWithError:",  &v46);
        id v15 = v46;
        if ((v14 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
            sub_1000510A0();
          }
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            int v39 = v15;
            MOLogWrite(qword_100095BF8);
          }
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent", v39, v42));
        id v17 = (id)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v16 isDirectory:1]);

        int v18 = 0;
      }

      else
      {
        id v49 = 0LL;
        unsigned __int8 v35 = objc_msgSend(v5, "removeItemAtURL:keepParent:error:", v6, 1, &v49, v39, v42);
        id v13 = v49;
        if ((v35 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
            sub_100051114();
          }
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            id v41 = v13;
            MOLogWrite(qword_100095BF8);
          }
        }

        id v48 = 0LL;
        unsigned __int8 v36 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:]( self,  "_createStorageBaseDirectoryWithError:",  &v48,  v41);
        id v15 = v48;
        if ((v36 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
            sub_1000510A0();
          }
        }

        id v17 = 0LL;
        int v18 = 1;
      }

      goto LABEL_69;
    }
  }

  else
  {
    id v45 = 0LL;
    unsigned __int8 v19 = [v5 removeItemAtURL:v6 keepParent:1 error:&v45];
    id v20 = v45;
    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000512E4();
      }
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        int v39 = v20;
        MOLogWrite(qword_100095BF8);
      }
    }

    id v44 = 0LL;
    unsigned __int8 v21 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:]( self,  "_createStorageBaseDirectoryWithError:",  &v44,  v39);
    id v22 = v44;
    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000510A0();
      }
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v40 = v22;
        MOLogWrite(qword_100095BF8);
      }
    }

    id v23 = [(id)objc_opt_class(self) _mostRecentInstanceDirURLWithinURL:v4];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    if (v24)
    {
      id v17 = (id)v24;

      goto LABEL_71;
    }

    BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v25) {
      sub_100051270(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    id v43 = v20;
    unsigned __int8 v33 = objc_msgSend(v5, "removeItemAtURL:keepParent:error:", v4, 0, &v43, v40);
    id v34 = v43;

    if ((v33 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000511FC();
      }
    }
  }

  id v17 = 0LL;
LABEL_70:
  uint64_t v37 = 0LL;
LABEL_72:

  return v37;
}

+ (BOOL)_shouldContinueAfterCheckingAttemptCountInDir:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"ReconcileAttempts.txt" isDirectory:0]);
  id v33 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v5,  4LL,  &v33));
  id v7 = v33;
  id v8 = v7;
  if (v6)
  {
    id v9 = (char *)[v6 integerValue];
    if ((unint64_t)(v9 - 5) <= 0xFFFFFFFFFFFFFFFBLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000513E4((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v27 = v9;
        MOLogWrite(qword_100095BF8);
      }

      objc_msgSend(v4, "removeItemAtURL:error:", v3, 0, v27);
LABEL_24:
      BOOL v22 = 0;
      goto LABEL_32;
    }

    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v9 + 1));
    id v32 = v8;
    unsigned int v20 = [v19 writeToURL:v5 atomically:1 encoding:4 error:&v32];
    id v21 = v32;

    if (v20)
    {

      BOOL v22 = 1;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100051464();
      }
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v28 = v21;
        MOLogWrite(qword_100095BF8);
      }

      objc_msgSend(v4, "removeItemAtURL:error:", v3, 0, v28);

      BOOL v22 = 0;
    }

    id v8 = v21;
    goto LABEL_32;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if ([v17 isEqualToString:NSCocoaErrorDomain])
  {
    id v18 = [v8 code];

    if (v18 == (id)260) {
      goto LABEL_18;
    }
  }

  else
  {
  }

  uint64_t v23 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    id v30 = v8;
    MOLogWrite(v23);
  }

+ (id)_operationFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MILaunchServicesOperation);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MILaunchServicesRegisterOperation);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MILaunchServicesSetPersonasOperation);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MILaunchServicesUnregisterOperation);
  uint64_t v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  v9,  objc_opt_class(&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation),  0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v26 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v5,  3LL,  &v26));
  id v13 = v26;
  if (v12)
  {
    id v25 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v11,  v12,  &v25));
    id v15 = v25;

    if (v14) {
      goto LABEL_8;
    }
    uint64_t v16 = (void *)MIInstallerErrorDomain;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    id v19 = sub_1000130F4( (uint64_t)"+[MILaunchServicesOperationManager _operationFromURL:error:]",  694LL,  v16,  4LL,  v15,  0LL,  @"Failed to unarchive registration data from %@",  v18,  (uint64_t)v17);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    id v13 = v15;
  }

  else
  {
    id v21 = (void *)MIInstallerErrorDomain;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    id v23 = sub_1000130F4( (uint64_t)"+[MILaunchServicesOperationManager _operationFromURL:error:]",  688LL,  v21,  4LL,  v13,  0LL,  @"Failed to read registration data from %@",  v22,  (uint64_t)v17);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v23);
  }

  id v15 = (id)v20;

  if (a4)
  {
    id v15 = v15;
    uint64_t v14 = 0LL;
    *a4 = v15;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

+ (id)_discoverOrderedJournalEntriesInInstanceDir:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_100048694;
  id v17 = &unk_1000818D0;
  id v19 = a1;
  uint64_t v7 = v5;
  uint64_t v18 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 enumerateURLsForItemsInDirectoryAtURL:v4 ignoreSymlinks:1 withBlock:&v14]);

  if (v8)
  {
    uint64_t v9 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      id v13 = v8;
      MOLogWrite(v9);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray sortedArrayUsingComparator:]( v7,  "sortedArrayUsingComparator:",  &stru_100081910,  v12,  v13,  v14,  v15,  v16,  v17));

  return v10;
}

+ (void)_reconcileOperations:(id)a3 unregisterMountPoints:(id *)a4 registerMountPoints:(id *)a5 restartUniqueOperations:(id *)a6
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v47;
    id v44 = v10;
    id v45 = v7;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v14);
        objc_opt_class(&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          id v16 = (id)objc_claimAutoreleasedReturnValue([v15 mountPoint]);
          -[NSMutableSet removeObject:](v8, "removeObject:", v16);
          -[NSMutableSet addObject:](v7, "addObject:", v16);
LABEL_22:

          goto LABEL_23;
        }

        objc_opt_class(&OBJC_CLASS___MILaunchServicesRegisterOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          id v16 = v15;
          id v17 = (id)objc_claimAutoreleasedReturnValue([v16 mountPoint]);
          if (v17)
          {
            -[NSMutableSet removeObject:](v7, "removeObject:", v17);
            -[NSMutableSet addObject:](v8, "addObject:", v17);
          }

          else
          {
            unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v24);
          }

          goto LABEL_21;
        }

        objc_opt_class(&OBJC_CLASS___MILaunchServicesUnregisterOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          id v17 = v15;
          id v16 = (id)objc_claimAutoreleasedReturnValue([v17 bundleID]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v16);
LABEL_21:

          goto LABEL_22;
        }

        objc_opt_class(&OBJC_CLASS___MILaunchServicesSetPersonasOperation);
        if ((objc_opt_isKindOfClass(v15) & 1) != 0)
        {
          id v16 = v15;
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v18));
          if (v19)
          {
            objc_opt_class(&OBJC_CLASS___MILaunchServicesRegisterOperation);
            if ((objc_opt_isKindOfClass(v19) & 1) != 0)
            {
              id v20 = v19;
              id v21 = v18;
              uint64_t v22 = v9;
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 personaUniqueStrings]);
              [v20 updatePersonaUniqueStrings:v23];

              id v10 = v44;
              uint64_t v9 = v22;
              uint64_t v18 = v21;
              goto LABEL_33;
            }

            objc_opt_class(&OBJC_CLASS___MILaunchServicesSetPersonasOperation);
            if ((objc_opt_isKindOfClass(v19) & 1) != 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v18);
LABEL_33:
              uint64_t v7 = v45;
            }

            else
            {
              objc_opt_class(&OBJC_CLASS___MILaunchServicesUnregisterOperation);
              char isKindOfClass = objc_opt_isKindOfClass(v19);
              BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
              if ((isKindOfClass & 1) != 0)
              {
                id v10 = v44;
                uint64_t v7 = v45;
                if (v29)
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v51 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoint"
                        "s:restartUniqueOperations:]";
                  __int16 v52 = 2112;
                  uint64_t v53 = v18;
                  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Encountered set personas operation for %@ after unregister operation",  buf,  0x16u);
                }
              }

              else
              {
                uint64_t v7 = v45;
                if (v29)
                {
                  unsigned __int8 v35 = (objc_class *)objc_opt_class(v19);
                  unsigned __int8 v36 = NSStringFromClass(v35);
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                  *(_DWORD *)buf = 136315650;
                  uint64_t v51 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoint"
                        "s:restartUniqueOperations:]";
                  __int16 v52 = 2112;
                  uint64_t v53 = v37;
                  __int16 v54 = 2112;
                  v55 = v18;
                  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Encountered unexpected LS operation of class %@ for bundle ID %@ before set personas operation",  buf,  0x20u);
                }

                id v10 = v44;
                if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                {
                  uint64_t v43 = qword_100095BF8;
                  id v30 = (objc_class *)objc_opt_class(v19);
                  id v31 = NSStringFromClass(v30);
                  int v39 = (void *)objc_claimAutoreleasedReturnValue(v31);
                  MOLogWrite(v43);

                  id v10 = v44;
                }
              }
            }
          }

          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v18);
          }

          goto LABEL_22;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          id v32 = (objc_class *)objc_opt_class(v15);
          id v33 = NSStringFromClass(v32);
          id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = 136315394;
          uint64_t v51 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restar"
                "tUniqueOperations:]";
          __int16 v52 = 2112;
          uint64_t v53 = v34;
          _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Encountered unknown class while enumerating saved operations: %@",  buf,  0x16u);
        }

        uint64_t v25 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          id v26 = (objc_class *)objc_opt_class(v15);
          uint64_t v27 = NSStringFromClass(v26);
          id v16 = (id)objc_claimAutoreleasedReturnValue(v27);
          MOLogWrite(v25);
          goto LABEL_22;
        }

- (void)_reconcileOperations:(id)a3
{
  id v63 = 0LL;
  id v64 = 0LL;
  id v62 = 0LL;
  id v45 = a3;
  [(id)objc_opt_class(self) _reconcileOperations:v45 unregisterMountPoints:&v64 registerMountPoints:&v63 restartUniqueOperations:&v62];
  id v4 = v64;
  id v43 = v63;
  id v42 = v62;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v8);
        id v57 = 0LL;
        unsigned __int8 v10 = -[MILaunchServicesOperationManager unregisterAppsAtMountPoint:error:]( self,  "unregisterAppsAtMountPoint:error:",  v9,  &v57,  v39,  v40);
        id v11 = v57;
        if ((v10 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
            *(_DWORD *)buf = 136315650;
            v66 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            __int16 v67 = 2112;
            *(void *)v68 = v13;
            *(_WORD *)&v68[8] = 2112;
            *(void *)&v68[10] = v11;
            _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to restart unregister operation for mount point %@ : %@",  buf,  0x20u);
          }

          uint64_t v12 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            int v39 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
            id v40 = v11;
            MOLogWrite(v12);
          }
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
    }

    while (v6);
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v14 = v43;
  id v15 = [v14 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _diskImageManagerInstance]( self,  "_diskImageManagerInstance",  v39,  v40));
        [v20 reregisterContentsAtMountPoint:v19];
      }

      id v16 = [v14 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }

    while (v16);
  }

  id v44 = v14;

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v21 = v42;
  id v22 = [v21 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v25);
        objc_opt_class(&OBJC_CLASS___MILaunchServicesRegisterOperation);
        if ((objc_opt_isKindOfClass(v26) & 1) != 0)
        {
          id v27 = v26;
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleID]);
          id v29 = [v27 domain];
          id v48 = 0LL;
          unsigned __int8 v30 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]( self,  "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:",  v28,  v29,  0LL,  &v48);
          id v31 = v48;
          if ((v30 & 1) != 0) {
            goto LABEL_40;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            unsigned int v37 = -[MILaunchServicesOperationManager targetUID](self, "targetUID");
            *(_DWORD *)buf = 136315906;
            v66 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            __int16 v67 = 1024;
            *(_DWORD *)v68 = v37;
            *(_WORD *)&v68[4] = 2112;
            *(void *)&v68[6] = v28;
            *(_WORD *)&v68[14] = 2112;
            *(void *)&v68[16] = v31;
            _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to restart register operation for %u/%@ : %@",  buf,  0x26u);
          }

          uint64_t v32 = qword_100095BF8;
          if (qword_100095BF8)
          {
          }

- (void)reconcile
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager lookAsideStorageBaseURL](self, "lookAsideStorageBaseURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]( self,  "_setUpLookAsideAtDirAndFindMostRecentInstance:",  v3));
  if (v5 && [(id)objc_opt_class(self) _shouldContinueAfterCheckingAttemptCountInDir:v3])
  {
    id v6 = [(id)objc_opt_class(self) _discoverOrderedJournalEntriesInInstanceDir:v5];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MILaunchServicesOperationManager _reconcileOperations:](self, "_reconcileOperations:", v7);
    id v10 = 0LL;
    unsigned __int8 v8 = [v4 removeItemAtURL:v3 error:&v10];
    id v9 = v10;
    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100051564();
      }
    }
  }
}

- (void)purge
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager lookAsideStorageBaseURL](self, "lookAsideStorageBaseURL"));
  id v16 = 0LL;
  unsigned __int8 v5 = [v3 removeItemAtURL:v4 keepParent:0 error:&v16];
  id v6 = v16;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100051664(v4);
    }
    uint64_t v7 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      id v14 = v6;
      MOLogWrite(v7);
    }

    id v6 = 0LL;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager storageBaseURL](self, "storageBaseURL", v12, v14));

  id v15 = v6;
  unsigned __int8 v9 = [v3 removeItemAtURL:v8 keepParent:1 error:&v15];
  id v10 = v15;

  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000515D8(v8);
    }
    uint64_t v11 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      MOLogWrite(v11);
    }
  }
}

- (id)_onQueue_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v60 = a5;
  id v61 = a7;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v15);

  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  v74 = sub_100047754;
  v75 = sub_100047764;
  id v76 = 0LL;
  id v16 = objc_opt_new(&OBJC_CLASS___NSUUID);
  uint64_t v17 = -[MILaunchServicesOperationManager targetUID](self, "targetUID");
  uint64_t v18 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v17));
  [v18 setTargetUserID:v19];

  id v20 = -[MILaunchServicesRegisterOperation initWithBundleID:domain:personas:mountPoint:operationUUID:serialNumber:]( objc_alloc(&OBJC_CLASS___MILaunchServicesRegisterOperation),  "initWithBundleID:domain:personas:mountPoint:operationUUID:serialNumber:",  v60,  a6,  v61,  v14,  v16,  -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  id v70 = 0LL;
  LOBYTE(a6) = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:]( self,  "_onQueue_addPendingLaunchServicesOperation:error:",  v20,  &v70);
  id v21 = v70;
  if ((a6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100051764();
    }
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      __int128 v50 = v20;
      id v54 = v21;
      MOLogWrite(qword_100095BF8);
    }
  }

  __int128 v58 = v20;
  char v69 = 0;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance", v50, v54));
  unsigned int v23 = [v22 isRunningInTestMode:&v69 outError:0];
  if (v69) {
    unsigned int v24 = v23;
  }
  else {
    unsigned int v24 = 0;
  }
  if (v24 == 1)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    unsigned __int8 v26 = [v25 isPlaceholder];

    if ((v26 & 1) == 0)
    {
      if ([v22 testFlagsAreSet:8])
      {
        uint64_t v48 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v49 bundleIdentifier]);
          MOLogWrite(v48);
        }

        exit(1);
      }

      if ([v22 testFlagsAreSet:16])
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 testFileSentinelForSyncURL]);

        id v68 = 0LL;
        LODWORD(v27) = [&stru_100082BD0 writeToURL:v28 atomically:1 encoding:4 error:&v68];
        int v55 = v17;
        id v56 = v13;
        id v57 = v68;
        if ((_DWORD)v27)
        {
          while (1)
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v51));
            unsigned int v30 = [v29 itemExistsAtURL:v28];

            if (!v30) {
              break;
            }
            uint64_t v31 = qword_100095BF8;
            if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
            {
              __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v28 path]);
              MOLogWrite(v31);
            }

            sleep(1u);
          }
        }

        else
        {
          uint64_t v32 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v28 path]);
            MOLogWrite(v32);
          }
        }

        id v13 = v56;
        LODWORD(v17) = v55;
      }
    }
  }

  id v33 = v21;

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100049E40;
  v63[3] = &unk_100081938;
  __int16 v67 = &v71;
  v63[4] = self;
  id v34 = (id)objc_claimAutoreleasedReturnValue( +[ICLBundleRecord bundleRecordArrayToInfoDictionaryArray:]( &OBJC_CLASS___ICLBundleRecord,  "bundleRecordArrayToInfoDictionaryArray:",  v13));
  id v64 = v34;
  unsigned __int8 v35 = v16;
  v65 = v35;
  id v36 = v18;
  id v66 = v36;
  id v37 = sub_10000D944(v63);
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  if (v72[5])
  {
    unsigned int v39 = [(id)objc_opt_class(self) appReferencesEnabled];
    if ((_DWORD)v17) {
      unsigned int v40 = v39;
    }
    else {
      unsigned int v40 = 0;
    }
    if (v61 && v40)
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _lsApplicationWorkspaceInstance]( self,  "_lsApplicationWorkspaceInstance"));
      id v42 = objc_opt_new(&OBJC_CLASS___NSUUID);
      id v62 = v38;
      unsigned __int8 v43 = [v41 setPersonaUniqueStrings:v61 forApplicationWithBundleIdentifier:v60 operationUUID:v42 requestContext:v36 s aveObserver:0 error:&v62];
      id v44 = v62;

      if ((v43 & 1) != 0)
      {
        unsigned int v38 = v44;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_1000516F0();
        }

        unsigned int v38 = 0LL;
      }
    }
  }

  else
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:]( self,  "_onQueue_removePendingLaunchServicesOperationForUUID:",  v35);
  }

  id v45 = (void *)v72[5];
  if (a8 && !v45)
  {
    *a8 = v38;
    id v45 = (void *)v72[5];
  }

  id v46 = v45;

  _Block_object_dispose(&v71, 8);
  return v46;
}

- (id)_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  unsigned __int8 v43 = sub_100047754;
  id v44 = sub_100047764;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  unsigned __int8 v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  id v37 = sub_100047754;
  unsigned int v38 = sub_100047764;
  id v39 = 0LL;
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A0D4;
  block[3] = &unk_100081960;
  uint64_t v31 = &v40;
  block[4] = self;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  id v21 = v16;
  id v29 = v21;
  unint64_t v33 = a6;
  id v22 = v17;
  id v30 = v22;
  uint64_t v32 = &v34;
  dispatch_sync(v18, block);

  unsigned int v23 = (void *)v41[5];
  if (a8 && !v23)
  {
    *a8 = (id) v35[5];
    unsigned int v23 = (void *)v41[5];
  }

  id v24 = v23;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  return -[MILaunchServicesOperationManager _registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]( self,  "_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:",  a3,  0LL,  a4,  a6,  a5,  a7);
}

- (id)registerInstalledInfoForBuiltInAppAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v18 = 0LL;
  uint64_t v7 = -[MIExecutableBundle initWithBundleURL:error:]( objc_alloc(&OBJC_CLASS___MIExecutableBundle),  "initWithBundleURL:error:",  v6,  &v18);

  id v8 = v18;
  if (v7)
  {
    id v17 = v8;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "fetchInfoForBundle:forPersona:inContainer:withError:",  v7,  0LL,  0LL,  &v17));
    id v10 = v17;

    if (v9)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
      id v16 = v10;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager registerInstalledInfo:forAppBundleID:personas:inDomain:error:]( self,  "registerInstalledInfo:forAppBundleID:personas:inDomain:error:",  v9,  v12,  0LL,  1LL,  &v16));
      id v8 = v16;

      if (!a4) {
        goto LABEL_10;
      }
    }

    else
    {
      id v13 = 0LL;
      id v8 = v10;
      if (!a4) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    unsigned __int8 v9 = 0LL;
    id v13 = 0LL;
    if (!a4) {
      goto LABEL_10;
    }
  }

  if (!v13) {
    *a4 = v8;
  }
LABEL_10:
  id v14 = v13;

  return v14;
}

- (id)registerInstalledInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v14 = [v13 deviceHasPersonas];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 primaryPersonaString]);
    id v17 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v16));
  }

  else
  {
    id v17 = objc_opt_new(&OBJC_CLASS___NSSet);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:]( self,  "_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:",  v12,  v11,  v10,  3LL,  v17,  a6));

  return v18;
}

- (BOOL)registerUsingDiscoveredInformationForAppBundleID:(id)a3 inDomain:(unint64_t)a4 resultingRecordPromise:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v43 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v10,  a4,  &v43));
  id v12 = v43;
  id v13 = v12;
  if (v11)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 bundle]);
    if (v15)
    {
      unsigned int v38 = a5;
      id v41 = v13;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "fetchInfoForBundle:forPersona:inContainer:withError:",  v15,  0LL,  v11,  &v41));
      id v17 = v41;

      if (!v16)
      {
        id v21 = 0LL;
        id v23 = 0LL;
        LOBYTE(v24) = 0;
        id v13 = v17;
        goto LABEL_20;
      }

      id v37 = a6;
      id v18 = [(id)objc_opt_class(self) _appReferenceManagerInstance];
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v40 = v17;
      id v20 = [v19 personaUniqueStringsForAppWithBundleID:v10 domain:a4 forUserWithID:sub_10000D79C() error:&v40];
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v22 = v40;

      if (v21)
      {
        id v39 = v22;
        id v23 = (id)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager registerInstalledInfo:forAppBundleID:personas:inDomain:error:]( self,  "registerInstalledInfo:forAppBundleID:personas:inDomain:error:",  v16,  v10,  v21,  a4,  &v39));
        id v13 = v39;

        unsigned int v24 = v23 != 0LL;
        goto LABEL_24;
      }

      uint64_t v31 = (void *)MIInstallerErrorDomain;
      uint64_t v32 = MIStringForInstallationDomain(a4);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v32);
      id v34 = sub_1000130F4( (uint64_t)"-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resu ltingRecordPromise:error:]",  1157LL,  v31,  4LL,  v22,  0LL,  @"Failed to fetch persona unique strings for %@ in domain %@",  v33,  (uint64_t)v10);
      id v13 = (id)objc_claimAutoreleasedReturnValue(v34);

      a6 = v37;
    }

    else
    {
      id v30 = sub_1000130F4( (uint64_t)"-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resu ltingRecordPromise:error:]",  1146LL,  MIInstallerErrorDomain,  36LL,  0LL,  0LL,  @"Failed to find bundle in bundle container %@ for %@",  v14,  (uint64_t)v11);
      id v16 = 0LL;
      uint64_t v25 = v13;
      id v13 = (id)objc_claimAutoreleasedReturnValue(v30);
    }

    goto LABEL_18;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  if (![v25 isEqualToString:MIContainerManagerErrorDomain])
  {
    id v16 = 0LL;
    id v15 = 0LL;
LABEL_18:

    id v21 = 0LL;
    goto LABEL_19;
  }

  unsigned int v38 = a5;
  id v26 = [v13 code];

  if (v26 != (id)21)
  {
    id v21 = 0LL;
    id v16 = 0LL;
    id v15 = 0LL;
LABEL_19:
    id v23 = 0LL;
    LOBYTE(v24) = 0;
    goto LABEL_20;
  }

  id v37 = a6;

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 builtInApplicationBundleIDs]);
  unsigned int v29 = [v28 containsObject:v10];

  if (v29)
  {
    id v13 = 0LL;
    id v23 = 0LL;
    id v15 = 0LL;
    id v16 = 0LL;
    id v21 = 0LL;
    unsigned int v24 = 1;
  }

  else
  {
    unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(+[LSPrecondition emptyPrecondition](&OBJC_CLASS___LSPrecondition, "emptyPrecondition"));
    id v42 = 0LL;
    unsigned int v24 = -[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]( self,  "unregisterAppForBundleID:inDomain:operationType:precondition:error:",  v10,  a4,  3LL,  v35,  &v42);
    id v13 = v42;

    id v23 = 0LL;
    id v15 = 0LL;
    id v16 = 0LL;
    id v21 = 0LL;
  }

- (BOOL)_onQueue_setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v12);

  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  id v13 = objc_opt_new(&OBJC_CLASS___NSUUID);
  uint64_t v14 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[MILaunchServicesOperationManager targetUID](self, "targetUID")));
  [v14 setTargetUserID:v15];

  id v16 = -[MILaunchServicesSetPersonasOperation initWithBundleID:domain:personas:registrationUUID:serialNumber:]( objc_alloc(&OBJC_CLASS___MILaunchServicesSetPersonasOperation),  "initWithBundleID:domain:personas:registrationUUID:serialNumber:",  v11,  a5,  v10,  v13,  -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  id v34 = 0LL;
  unsigned __int8 v17 = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:]( self,  "_onQueue_addPendingLaunchServicesOperation:error:",  v16,  &v34);
  id v18 = v34;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000517D8();
    }
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10004AAB4;
  v28[3] = &unk_100081988;
  uint64_t v33 = &v35;
  v28[4] = self;
  id v19 = v10;
  id v29 = v19;
  id v20 = v11;
  id v30 = v20;
  id v21 = v13;
  uint64_t v31 = v21;
  id v22 = v14;
  id v32 = v22;
  id v23 = sub_10000D944(v28);
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (*((_BYTE *)v36 + 24))
  {
    int v25 = 1;
  }

  else
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:]( self,  "_onQueue_removePendingLaunchServicesOperationForUUID:",  v21);
    int v25 = *((unsigned __int8 *)v36 + 24);
    if (a6 && !*((_BYTE *)v36 + 24))
    {
      *a6 = v24;
      int v25 = *((unsigned __int8 *)v36 + 24);
    }
  }

  BOOL v26 = v25 != 0;

  _Block_object_dispose(&v35, 8);
  return v26;
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100047754;
  id v32 = sub_100047764;
  id v33 = 0LL;
  uint64_t v24 = 0LL;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004ACE8;
  v18[3] = &unk_1000819B0;
  id v21 = &v24;
  v18[4] = self;
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v22 = &v28;
  unint64_t v23 = a5;
  id v20 = v14;
  dispatch_sync(v12, v18);

  int v15 = *((unsigned __int8 *)v25 + 24);
  if (a6 && !*((_BYTE *)v25 + 24))
  {
    *a6 = (id) v29[5];
    int v15 = *((unsigned __int8 *)v25 + 24);
  }

  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

- (BOOL)_onQueue_unregisterAppForBundleID:(id)a3 domain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v14);

  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  int v15 = objc_opt_new(&OBJC_CLASS___NSUUID);
  BOOL v16 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[MILaunchServicesOperationManager targetUID](self, "targetUID")));
  [v16 setTargetUserID:v17];

  id v18 = -[MILaunchServicesUnregisterOperation initWithBundleID:domain:registrationUUID:serialNumber:]( objc_alloc(&OBJC_CLASS___MILaunchServicesUnregisterOperation),  "initWithBundleID:domain:registrationUUID:serialNumber:",  v12,  a4,  v15,  -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  id v37 = 0LL;
  unsigned __int8 v19 = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:]( self,  "_onQueue_addPendingLaunchServicesOperation:error:",  v18,  &v37);
  id v20 = v37;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005191C();
    }
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10004B0E0;
  v30[3] = &unk_1000819D8;
  uint64_t v35 = &v38;
  void v30[4] = self;
  id v21 = v12;
  id v31 = v21;
  id v22 = v15;
  id v32 = v22;
  unsigned int v36 = a5;
  id v23 = v13;
  id v33 = v23;
  id v24 = v16;
  id v34 = v24;
  id v25 = sub_10000D944(v30);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  if (*((_BYTE *)v39 + 24))
  {
    int v27 = 1;
  }

  else
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:]( self,  "_onQueue_removePendingLaunchServicesOperationForUUID:",  v22);
    int v27 = *((unsigned __int8 *)v39 + 24);
    if (a7 && !*((_BYTE *)v39 + 24))
    {
      *a7 = v26;
      int v27 = *((unsigned __int8 *)v39 + 24);
    }
  }

  BOOL v28 = v27 != 0;

  _Block_object_dispose(&v38, 8);
  return v28;
}

- (BOOL)unregisterAppForBundleID:(id)a3 inDomain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a6;
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  if (a4 == 1) {
    a4 = 2LL;
  }
  uint64_t v41 = 0LL;
  v42[0] = &v41;
  v42[1] = 0x3032000000LL;
  v42[2] = sub_100047754;
  v42[3] = sub_100047764;
  id v43 = 0LL;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004B5BC;
  block[3] = &unk_100081A00;
  id v37 = &v44;
  block[4] = self;
  id v15 = v12;
  id v35 = v15;
  unint64_t v39 = a4;
  int v40 = v9;
  id v16 = v13;
  id v36 = v16;
  uint64_t v38 = &v41;
  dispatch_sync(v14, block);

  if (*((_BYTE *)v45 + 24))
  {
    id v17 = 0LL;
    goto LABEL_24;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v42[0] + 40) domain]);
  if ([v18 isEqualToString:LSApplicationWorkspaceErrorDomain])
  {
    BOOL v19 = [*(id *)(v42[0] + 40) code] == (id)117;

    if (v19)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v31 = v9;
        id v32 = v16;
        MOLogWrite(qword_100095BF8);
      }

      id v33 = 0LL;
      unsigned __int8 v20 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]( self,  "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:",  v15,  a4,  0LL,  &v33,  v31,  v32);
      id v21 = v33;
      id v22 = v21;
      *((_BYTE *)v45 + 24) = v20;
      if ((v20 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100051990((uint64_t)v15, (uint64_t)v42, v9);
        }
        id v17 = 0LL;
      }

      else
      {
        id v22 = v21;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100051A38();
        }
        if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
        {
          id v17 = v22;
        }

        else
        {
          MOLogWrite(qword_100095BF8);
          id v17 = v22;
        }
      }

      goto LABEL_23;
    }
  }

  else
  {
  }

  id v17 = *(id *)(v42[0] + 40LL);
  id v23 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    uint64_t v24 = MIStringForInstallationDomain(a4);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    sub_100051AAC((uint64_t)v15, v25, (uint64_t)v17, (uint64_t)v48);
  }

  uint64_t v26 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    uint64_t v27 = MIStringForInstallationDomain(a4);
    id v22 = (id)objc_claimAutoreleasedReturnValue(v27);
    MOLogWrite(v26);
LABEL_23:
  }

- (BOOL)_onQueue_unregisterApplicationsAtMountPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = objc_opt_new(&OBJC_CLASS___NSUUID);
  uint64_t v9 = sub_10000D79C();
  id v10 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
  [v10 setTargetUserID:v11];

  uint64_t v12 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    uint64_t v24 = (MILaunchServicesUnregisterMountPointOperation *)objc_claimAutoreleasedReturnValue([v6 path]);
    MOLogWrite(v12);
  }

  id v13 = -[MILaunchServicesUnregisterMountPointOperation initWithMountPoint:operationUUID:serialNumber:]( objc_alloc(&OBJC_CLASS___MILaunchServicesUnregisterMountPointOperation),  "initWithMountPoint:operationUUID:serialNumber:",  v6,  v8,  -[MILaunchServicesOperationManager _onQueue_nextSerialNumber](self, "_onQueue_nextSerialNumber"));
  id v26 = 0LL;
  unsigned __int8 v14 = -[MILaunchServicesOperationManager _onQueue_addPendingLaunchServicesOperation:error:]( self,  "_onQueue_addPendingLaunchServicesOperation:error:",  v13,  &v26);
  id v15 = v26;
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100051B20();
    }
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v24 = v13;
      id v25 = v15;
      MOLogWrite(qword_100095BF8);
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MILaunchServicesOperationManager _lsApplicationWorkspaceInstance]( self,  "_lsApplicationWorkspaceInstance",  v24,  v25));
  unsigned __int8 v17 = [v16 unregisterApplicationsAtMountPoint:v6 operationUUID:v8 saveObserver:self requestContext:v10];

  if ((v17 & 1) == 0)
  {
    -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:]( self,  "_onQueue_removePendingLaunchServicesOperationForUUID:",  v8);
    id v18 = (void *)MIInstallerErrorDomain;
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v21 = sub_1000130F4( (uint64_t)"-[MILaunchServicesOperationManager _onQueue_unregisterApplicationsAtMountPoint:error:]",  1372LL,  v18,  4LL,  0LL,  0LL,  @"Failed to unregister applications at mount point %@",  v20,  (uint64_t)v19);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (a4)
    {
      id v15 = v22;
      *a4 = v15;
    }

    else
    {
      id v15 = v22;
    }
  }

  return v17;
}

- (BOOL)unregisterAppsAtMountPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v16 = 0LL;
  unsigned __int8 v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  BOOL v19 = sub_100047754;
  uint64_t v20 = sub_100047764;
  id v21 = 0LL;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004BA10;
  v12[3] = &unk_100080EA8;
  unsigned __int8 v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }

  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)operationWithUUIDWasSaved:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004BB34;
  v7[3] = &unk_100080ED0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  MIRunTransactionalTask(v5, "LS operation saved", v7);
}

- (void)operationWithUUID:(id)a3 didFailToSaveWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperationManager internalQueue](self, "internalQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004BC08;
  v11[3] = &unk_100080F20;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  MIRunTransactionalTask(v8, "LS operation failed to save", v11);
}

- (NSUUID)instanceID
{
  return self->_instanceID;
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (OS_os_transaction)pendingOperationTransaction
{
  return self->_pendingOperationTransaction;
}

- (void)setPendingOperationTransaction:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end