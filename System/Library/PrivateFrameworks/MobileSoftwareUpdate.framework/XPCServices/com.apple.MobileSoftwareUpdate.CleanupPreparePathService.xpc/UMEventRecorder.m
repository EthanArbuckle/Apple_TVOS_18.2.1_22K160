@interface UMEventRecorder
+ (BOOL)diagnosticsAndUsageAllowed:(id)a3;
+ (id)recorder;
+ (id)recorderWithOptions:(id)a3;
- (BOOL)_installInProgress;
- (BOOL)_installInProgressAfterApply;
- (BOOL)_setNvramValue:(id)a3 forKey:(id)a4;
- (BOOL)_setPermissionsOnURL:(id)a3;
- (BOOL)_syncNvram;
- (BOOL)_updateRetryInformationForEvents:(id)a3;
- (BOOL)submissionPending;
- (NSDictionary)eventAttributes;
- (NSDictionary)nvramDict;
- (NSMutableArray)droppedEvents;
- (NSMutableDictionary)attributeDict;
- (NSNumber)installTonight;
- (NSString)baseServerURL;
- (NSString)brainVersion;
- (NSString)context;
- (NSString)dataMountPoint;
- (NSString)installType;
- (NSString)nvramPath;
- (NSString)systemMountPoint;
- (NSString)targetOSVersion;
- (NSString)updateMountPoint;
- (NSString)uuid;
- (UMEventRecorder)init;
- (UMEventRecorder)initWithOptions:(id)a3;
- (UMEventSubmitter)submitter;
- (double)_retryInterval;
- (double)_timeIntervalUntilRetry:(id)a3;
- (id)_copyEscapeStringsForEventData:(id)a3;
- (id)_copyUnsubmittedEventsFromDirectory:(id)a3 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:(BOOL)a4 previouslySubmittedEventSkipped:(BOOL *)a5;
- (id)_currentBaseOSVersion;
- (id)_currentEAPFSMode;
- (id)_currentOSVersion;
- (id)_currentTimeInMilliseconds;
- (id)_defaults;
- (id)_eventDirectory;
- (id)_eventDirectoryWithMountPoint:(id)a3;
- (id)_getDeviceModel;
- (id)_getDiskUsage;
- (id)_getGestaltDiskUsageKey:(__CFString *)a3 inDictionary:(id)a4;
- (id)_getGestaltString:(__CFString *)a3;
- (id)_getGestaltString:(__CFString *)a3 default:(id)a4;
- (id)_getGestaltValue:(__CFString *)a3;
- (id)_installInfoFile;
- (id)_legacyEventDirectory;
- (id)_legacyInstallInfoFile;
- (id)_legacySupportDirectory;
- (id)_loadUnsubmittedEvents;
- (id)_nvramValue:(id)a3;
- (id)_serverURL;
- (id)_submissionBodyForEvents:(id)a3;
- (id)_supportDirectory;
- (id)_supportDirectoryWithMountPoint:(id)a3;
- (id)_topic;
- (int)_serverCompatibilityVersion;
- (int64_t)_uptime;
- (unint64_t)numUnsubmittedEvents;
- (void)_cleanupInstallState;
- (void)_recordEvent:(id)a3 getPowerLog:(BOOL)a4 information:(id)a5 callback:(id)a6;
- (void)_recordEvent:(id)a3 information:(id)a4 callback:(id)a5;
- (void)_removeEvents:(id)a3;
- (void)_saveEvent:(id)a3;
- (void)_scheduleEventSubmissionRetry;
- (void)_submitEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)_submitIndividualEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)_writeInfoFile;
- (void)addPersistentAttribute:(id)a3 forKey:(id)a4;
- (void)commitMetadataToPersistentStorage;
- (void)commitMetadataToPersistentStorage:(id)a3;
- (void)dealloc;
- (void)recordEvent:(id)a3 information:(id)a4;
- (void)recordEvent:(id)a3 information:(id)a4 installIsComplete:(BOOL)a5;
- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4;
- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4 withCallback:(id)a5;
- (void)removePersistentAttributeKey:(id)a3;
- (void)setAttributeDict:(id)a3;
- (void)setBaseServerURL:(id)a3;
- (void)setBrainVersion:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataMountPoint:(id)a3;
- (void)setDroppedEvents:(id)a3;
- (void)setEventAttributes:(id)a3;
- (void)setInstallTonight:(id)a3;
- (void)setInstallType:(id)a3;
- (void)setNvramDict:(id)a3;
- (void)setNvramPath:(id)a3;
- (void)setSubmissionPending:(BOOL)a3;
- (void)setSubmitter:(id)a3;
- (void)setSystemMountPoint:(id)a3;
- (void)setTargetOSVersion:(id)a3;
- (void)setUpdateMountPoint:(id)a3;
- (void)setUuid:(id)a3;
- (void)startRecordingInstall:(id)a3;
- (void)submitEvents;
- (void)submitEventsInBackground:(BOOL)a3;
- (void)submitEventsInBackground:(BOOL)a3 withOptions:(id)a4;
- (void)submitEventsWithUpdateOptions:(id)a3;
@end

@implementation UMEventRecorder

+ (id)recorder
{
  return +[UMEventRecorder recorderWithOptions:](&OBJC_CLASS___UMEventRecorder, "recorderWithOptions:", 0LL);
}

+ (id)recorderWithOptions:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __39__UMEventRecorder_recorderWithOptions___block_invoke;
  block[3] = &__block_descriptor_40_e8_32o_e5_v8__0l;
  block[4] = a3;
  if (recorderWithOptions__once != -1) {
    dispatch_once(&recorderWithOptions__once, block);
  }
  return (id)recorderWithOptions__recorder;
}

UMEventRecorder *__39__UMEventRecorder_recorderWithOptions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  result = -[UMEventRecorder initWithOptions:]( objc_alloc(&OBJC_CLASS___UMEventRecorder),  "initWithOptions:",  *(void *)(a1 + 32));
  recorderWithOptions__recorder = (uint64_t)result;
  return result;
}

+ (BOOL)diagnosticsAndUsageAllowed:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"/private/var";
  }
  v4 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  -[__CFString stringByAppendingPathComponent:]( v3,  "stringByAppendingPathComponent:",  @"/mobile/Library/UserConfigurationProfiles/EffectiveUserSettings.plist"));
  if (!v4) {
    v4 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  -[__CFString stringByAppendingPathComponent:]( v3,  "stringByAppendingPathComponent:",  @"/mobile/Library/ConfigurationProfiles/EffectiveUserSettings.plist"));
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (id v6 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"restrictedBool"),
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && (id v8 = [v6 objectForKey:@"allowDiagnosticSubmission"],
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && (id v10 = [v8 objectForKey:@"value"],
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber),
        (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
  {
    return [v10 BOOLValue];
  }

  else
  {
    return 0;
  }

- (UMEventRecorder)init
{
  return -[UMEventRecorder initWithOptions:](self, "initWithOptions:", 0LL);
}

- (UMEventRecorder)initWithOptions:(id)a3
{
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___UMEventRecorder;
  v4 = -[UMEventRecorder init](&v66, "init");
  uint64_t v5 = v4;
  if (v4)
  {
    -[UMEventRecorder setInstallType:](v4, "setInstallType:", @"ota");
    -[UMEventRecorder setSystemMountPoint:]( v5,  "setSystemMountPoint:",  [a3 objectForKey:@"SystemPartitionMountPath"]);
    -[UMEventRecorder setDataMountPoint:]( v5,  "setDataMountPoint:",  [a3 objectForKey:@"DataPartitionMountPath"]);
    -[UMEventRecorder setUpdateMountPoint:]( v5,  "setUpdateMountPoint:",  [a3 objectForKey:@"UpdatePartitionMountPath"]);
    -[UMEventRecorder setNvramPath:](v5, "setNvramPath:", [a3 objectForKey:@"NVRAMShadowPath"]);
    -[UMEventRecorder setEventAttributes:]( v5,  "setEventAttributes:",  [a3 objectForKeyedSubscript:@"AdditionalEventAttributes"]);
    v5->_nvramDict = (NSDictionary *) +[UMEventCheckpoint lastSyncedNvram:]( &OBJC_CLASS___UMEventCheckpoint,  "lastSyncedNvram:",  -[UMEventRecorder nvramPath](v5, "nvramPath"));
    id v6 = +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  -[UMEventRecorder _installInfoFile](v5, "_installInfoFile"));
    if (v6)
    {
      uint64_t v7 = v6;
      -[UMEventRecorder setUuid:](v5, "setUuid:", -[NSDictionary objectForKey:](v6, "objectForKey:", @"UUID"));
      -[UMEventRecorder setBaseServerURL:]( v5,  "setBaseServerURL:",  -[NSDictionary objectForKey:](v7, "objectForKey:", @"Submission URL"));
      v5->_targetOSVersion = (NSString *)objc_msgSend( -[NSDictionary objectForKey:]( v7,  "objectForKey:",  @"Target OS Version"),  "copy");
      v5->_context = (NSString *)objc_msgSend( -[NSDictionary objectForKey:](v7, "objectForKey:", @"Context"),  "copy");
      v5->_attributeDict = (NSMutableDictionary *)objc_msgSend( -[NSDictionary objectForKey:]( v7,  "objectForKey:",  @"Persistent Attributes"),  "mutableCopy");
    }

    else
    {
      -[UMEventRecorder setUuid:]( v5,  "setUuid:",  -[UMEventRecorder _nvramValue:](v5, "_nvramValue:", @"ota-uuid"));
      -[UMEventRecorder setBaseServerURL:]( v5,  "setBaseServerURL:",  -[UMEventRecorder _nvramValue:](v5, "_nvramValue:", @"ota-submission-url"));
      v5->_targetOSVersion = (NSString *)objc_msgSend( -[UMEventRecorder _nvramValue:](v5, "_nvramValue:", @"ota-os-version"),  "copy");
      v5->_context = (NSString *)objc_msgSend( -[UMEventRecorder _nvramValue:](v5, "_nvramValue:", @"ota-context"),  "copy");
    }

    v5->_droppedEvents = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v5->_submitter = objc_alloc_init(&OBJC_CLASS___UMEventSubmitter);
    v5->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.UpdateMetrics.UMEventRecorderCallback",  0LL);
    id v8 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    v5->_submitQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.UpdateMetrics.UMEventRecorderSubmit", v8);
    uint64_t v9 = -[UMEventRecorder systemMountPoint](v5, "systemMountPoint");
    _log( (uint64_t)v9,  (uint64_t)@"%@: initializing event recorder with systemMountPoint: %@",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v5);
    v16 = -[UMEventRecorder dataMountPoint](v5, "dataMountPoint");
    _log( (uint64_t)v16,  (uint64_t)@"%@: initializing event recorder with dataMountPoint: %@",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v5);
    v23 = -[UMEventRecorder updateMountPoint](v5, "updateMountPoint");
    _log( (uint64_t)v23,  (uint64_t)@"%@: initializing event recorder with updateMountPoint: %@",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)v5);
    v30 = -[UMEventRecorder nvramPath](v5, "nvramPath");
    _log( (uint64_t)v30,  (uint64_t)@"%@: initializing event recorder with nvramPath: %@",  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v5);
    v37 = -[UMEventRecorder targetOSVersion](v5, "targetOSVersion");
    _log( (uint64_t)v37,  (uint64_t)@"%@: initializing event recorder with targetOSVersion: %@",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v5);
    v44 = -[UMEventRecorder context](v5, "context");
    _log( (uint64_t)v44,  (uint64_t)@"%@: initializing event recorder with context: %@",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)v5);
    v51 = -[UMEventRecorder baseServerURL](v5, "baseServerURL");
    _log( (uint64_t)v51,  (uint64_t)@"%@: initializing event recorder with baseServerURL: %@",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)v5);
    v65 = -[UMEventRecorder uuid](v5, "uuid");
    _log( (uint64_t)v65,  (uint64_t)@"%@: initializing event recorder with uuid: %@",  v58,  v59,  v60,  v61,  v62,  v63,  (uint64_t)v5);
  }

  return v5;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_callbackQueue);
  dispatch_release((dispatch_object_t)self->_submitQueue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UMEventRecorder;
  -[UMEventRecorder dealloc](&v3, "dealloc");
}

- (id)_defaults
{
  return  -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.UpdateMetrics");
}

- (id)_topic
{
  return @"psr_ota";
}

- (int)_serverCompatibilityVersion
{
  return 2;
}

- (id)_serverURL
{
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%d/%@",  -[UMEventRecorder baseServerURL](self, "baseServerURL"),  -[UMEventRecorder _serverCompatibilityVersion](self, "_serverCompatibilityVersion"),  -[UMEventRecorder _topic](self, "_topic"));
  id result = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2);
  if (!result)
  {
    _log( 0LL,  (uint64_t)@"Malformed URL for update metrics event reporting - %@",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v2);
    return +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://xp.apple.com/report/2/psr_ota");
  }

  return result;
}

- (id)_legacySupportDirectory
{
  else {
    objc_super v3 = @"/var";
  }
  return -[UMEventRecorder _supportDirectoryWithMountPoint:](self, "_supportDirectoryWithMountPoint:", v3);
}

- (id)_supportDirectory
{
  return -[UMEventRecorder _supportDirectoryWithMountPoint:]( self,  "_supportDirectoryWithMountPoint:",  -[UMEventRecorder updateMountPoint](self, "updateMountPoint"));
}

- (id)_supportDirectoryWithMountPoint:(id)a3
{
  uint64_t v18 = 0LL;
  if (a3) {
    uint64_t v8 = (const __CFString *)a3;
  }
  else {
    uint64_t v8 = @"/var/MobileSoftwareUpdate";
  }
  if (!a3) {
    _log( (uint64_t)self,  (uint64_t)@"%s: mountPoint is nil...Using %@ as the mountPoint",  0LL,  v3,  v4,  v5,  v6,  v7,  (uint64_t)"-[UMEventRecorder _supportDirectoryWithMountPoint:]");
  }
  uint64_t v9 = -[NSURL URLByAppendingPathComponent:]( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8),  "URLByAppendingPathComponent:",  @"db/UpdateMetrics");
  v19[0] = NSFileOwnerAccountName;
  v19[1] = NSFileGroupOwnerAccountName;
  v20[0] = @"mobile";
  v20[1] = @"mobile";
  v19[2] = NSFileProtectionKey;
  v20[2] = NSFileProtectionNone;
  uint64_t v10 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v9,  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL),  &v18);
  if ((v10 & 1) == 0) {
    _log( v10,  (uint64_t)@"%s: unable to create support directory at path:%@ error:%@",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"-[UMEventRecorder _supportDirectoryWithMountPoint:]");
  }
  return v9;
}

- (id)_legacyInstallInfoFile
{
  return objc_msgSend( -[UMEventRecorder _legacySupportDirectory](self, "_legacySupportDirectory"),  "URLByAppendingPathComponent:",  @"ota-info.plist");
}

- (id)_installInfoFile
{
  return objc_msgSend( -[UMEventRecorder _supportDirectory](self, "_supportDirectory"),  "URLByAppendingPathComponent:",  @"ota-info.plist");
}

- (double)_retryInterval
{
  return 960.0;
}

- (BOOL)_setPermissionsOnURL:(id)a3
{
  uint64_t v20 = 0LL;
  v21[0] = NSFileOwnerAccountName;
  v21[1] = NSFileGroupOwnerAccountName;
  v22[0] = @"mobile";
  v22[1] = @"mobile";
  v21[2] = NSFilePosixPermissions;
  v21[3] = NSFileProtectionKey;
  v22[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 438LL);
  v22[3] = NSFileProtectionNone;
  uint64_t v4 = -[NSFileManager setAttributes:ofItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4),  [a3 path],  &v20);
  if ((v4 & 1) == 0) {
    _log(v4, (uint64_t)@"unable to set permissions on %@: %@", v5, v6, v7, v8, v9, v10, (uint64_t)a3);
  }
  uint64_t v11 = (uint64_t)objc_msgSend( a3,  "setResourceValue:forKey:error:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  NSURLIsExcludedFromBackupKey,  &v20);
  BOOL v18 = v11;
  if ((v11 & 1) == 0) {
    _log(v11, (uint64_t)@"unable to disable backup for %@: %@", v12, v13, v14, v15, v16, v17, (uint64_t)a3);
  }
  return v18;
}

- (id)_legacyEventDirectory
{
  else {
    uint64_t v3 = @"/var";
  }
  return -[UMEventRecorder _eventDirectoryWithMountPoint:](self, "_eventDirectoryWithMountPoint:", v3);
}

- (id)_eventDirectory
{
  return -[UMEventRecorder _eventDirectoryWithMountPoint:]( self,  "_eventDirectoryWithMountPoint:",  -[UMEventRecorder updateMountPoint](self, "updateMountPoint"));
}

- (id)_eventDirectoryWithMountPoint:(id)a3
{
  uint64_t v24 = 0LL;
  unsigned __int8 v23 = 0;
  id v3 = objc_msgSend( -[UMEventRecorder _supportDirectoryWithMountPoint:](self, "_supportDirectoryWithMountPoint:", a3),  "URLByAppendingPathComponent:",  @"Events");
  v25[0] = NSFileOwnerAccountName;
  v25[1] = NSFileGroupOwnerAccountName;
  v26[0] = @"mobile";
  v26[1] = @"mobile";
  v25[2] = NSFilePosixPermissions;
  v25[3] = NSFileProtectionKey;
  v26[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 511LL);
  v26[3] = NSFileProtectionNone;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL);
  unsigned int v5 = -[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  [v3 path],  &v23);
  int v6 = v23;
  uint64_t v7 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (v5 && v6)
  {
    uint64_t v8 = -[NSFileManager setAttributes:ofItemAtPath:error:]( v7,  "setAttributes:ofItemAtPath:error:",  v4,  [v3 path],  &v24);
    if ((v8 & 1) == 0) {
      _log( v8,  (uint64_t)@"unable to set attributes on directory for update events: %@",  v9,  v10,  v11,  v12,  v13,  v14,  v24);
    }
  }

  else
  {
    uint64_t v15 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v7,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v3,  1LL,  v4,  &v24);
    if ((v15 & 1) == 0) {
      _log(v15, (uint64_t)@"unable to create directory for update events: %@", v16, v17, v18, v19, v20, v21, v24);
    }
  }

  return v3;
}

- (id)_getGestaltValue:(__CFString *)a3
{
  return (id)MGCopyAnswer(a3, 0LL);
}

- (id)_getGestaltString:(__CFString *)a3 default:(id)a4
{
  id v5 = -[UMEventRecorder _getGestaltValue:](self, "_getGestaltValue:", a3);
  if (!v5) {
    return a4;
  }
  int v6 = v5;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0) {
    return a4;
  }
  return v6;
}

- (id)_getGestaltString:(__CFString *)a3
{
  return -[UMEventRecorder _getGestaltString:default:](self, "_getGestaltString:default:", a3, @"unknown");
}

- (id)_getGestaltDiskUsageKey:(__CFString *)a3 inDictionary:(id)a4
{
  return +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  (uint64_t)objc_msgSend(objc_msgSend(a4, "objectForKey:", a3), "longLongValue") / 0x100000);
}

- (id)_getDiskUsage
{
  id v3 = -[UMEventRecorder systemMountPoint](self, "systemMountPoint");
  if (v3 || (id v3 = -[UMEventRecorder dataMountPoint](self, "dataMountPoint")) != 0LL)
  {
    BOOL v11 = is_storage_apfs((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    id v12 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    bzero(&v53, 0x878uLL);
    bzero(&v52, 0x878uLL);
    if (-[UMEventRecorder systemMountPoint](self, "systemMountPoint"))
    {
      statfs( -[NSString fileSystemRepresentation]( -[UMEventRecorder systemMountPoint](self, "systemMountPoint"),  "fileSystemRepresentation"),  &v53);
      if (v11)
      {
        v50[2] = 0LL;
        memset(v51, 0, 12);
        v50[0] = 5LL;
        v50[1] = 2155872256LL;
        if (getattrlist( -[NSString fileSystemRepresentation]( -[UMEventRecorder systemMountPoint](self, "systemMountPoint"),  "fileSystemRepresentation"),  v50,  v51,  0xCuLL,  0))
        {
          uint64_t v13 = __error();
          logfunction( ",  1,  @"getattrlist(ATTR_VOL_SPACEUSED) to get filesystem used space failed: %d\n"",  v14,  v15,  v16,  v17,  v18,  *v13);
          uint64_t v19 = (v53.f_blocks - v53.f_bfree) * v53.f_bsize;
        }

        else
        {
          uint64_t v19 = *(void *)((char *)v51 + 4);
        }

        uint64_t v41 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v19);
        [v12 setObject:v41 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
        uint64_t v24 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      }

      else
      {
        unsigned __int8 v23 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v53.f_blocks * v53.f_bsize);
        [v12 setObject:v23 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
        uint64_t v24 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v53.f_bavail * v53.f_bsize);
      }

      [v12 setObject:v24 forKeyedSubscript:kMGQDiskUsageTotalSystemAvailable];
      uint64_t v22 = v53.f_blocks * v53.f_bsize;
    }

    else
    {
      uint64_t v20 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      [v12 setObject:v20 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
      uint64_t v21 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      [v12 setObject:v21 forKeyedSubscript:kMGQDiskUsageTotalSystemAvailable];
      uint64_t v22 = 0LL;
    }

    if (-[UMEventRecorder dataMountPoint](self, "dataMountPoint"))
    {
      statfs( -[NSString fileSystemRepresentation]( -[UMEventRecorder dataMountPoint](self, "dataMountPoint"),  "fileSystemRepresentation"),  &v52);
      if (v11)
      {
        uint64_t v42 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v52.f_blocks * v52.f_bsize);
        [v12 setObject:v42 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
        uint64_t f_bsize = v52.f_bsize;
        uint64_t v22 = v52.f_blocks * v52.f_bsize;
      }

      else
      {
        if (v53.f_blocks) {
          p_f_bfree = &v53.f_bfree;
        }
        else {
          p_f_bfree = &v52.f_blocks;
        }
        uint64_t v47 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *p_f_bfree * v52.f_bsize);
        [v12 setObject:v47 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
        uint64_t f_bsize = v52.f_bsize;
        v22 += v52.f_blocks * v52.f_bsize;
      }

      uint64_t v45 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v52.f_bavail * f_bsize);
    }

    else
    {
      v44 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      [v12 setObject:v44 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
      uint64_t v45 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    }

    [v12 setObject:v45 forKeyedSubscript:kMGQDiskUsageTotalDataAvailable];
    uint64_t v40 = v22;
    goto LABEL_26;
  }

  if (&_os_variant_is_recovery)
  {
    uint64_t is_recovery = os_variant_is_recovery("com.apple.MobileSoftwareUpdate");
    if ((_DWORD)is_recovery)
    {
      if (!is_storage_apfs(is_recovery, v26, v27, v28, v29, v30, v31, v32)) {
        return 0LL;
      }
      *(void *)&v53.uint64_t f_bsize = 0LL;
      *(void *)&v52.uint64_t f_bsize = 0LL;
      v50[0] = 0LL;
      v51[0] = 0LL;
      get_main_container_space_info(&v53, (uint64_t)&v52, 0LL, (uint64_t)v50, (uint64_t)v51, v33, v34, v35);
      id v12 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      uint64_t v36 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)&v53.f_bsize);
      [v12 setObject:v36 forKeyedSubscript:kMGQDiskUsageTotalSystemCapacity];
      v37 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      [v12 setObject:v37 forKeyedSubscript:kMGQDiskUsageTotalSystemAvailable];
      uint64_t v38 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  v50[0] + *(void *)&v52.f_bsize);
      [v12 setObject:v38 forKeyedSubscript:kMGQDiskUsageTotalDataCapacity];
      uint64_t v39 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v50[0]);
      [v12 setObject:v39 forKeyedSubscript:kMGQDiskUsageTotalDataAvailable];
      uint64_t v40 = v51[0];
LABEL_26:
      uint64_t v48 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v40);
      [v12 setObject:v48 forKeyedSubscript:kMGQDiskUsageTotalDiskCapacity];
      return v12;
    }
  }

  return -[UMEventRecorder _getGestaltValue:](self, "_getGestaltValue:", @"DiskUsage");
}

- (id)_currentOSVersion
{
  id result = -[UMEventRecorder _getGestaltString:default:]( self,  "_getGestaltString:default:",  @"SupplementalBuildVersion",  0LL);
  if (!result) {
    return -[UMEventRecorder _currentBaseOSVersion](self, "_currentBaseOSVersion");
  }
  return result;
}

- (id)_currentBaseOSVersion
{
  return -[UMEventRecorder _getGestaltString:](self, "_getGestaltString:", @"BuildVersion");
}

- (id)_currentTimeInMilliseconds
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  (unint64_t)(v2 * 1000.0));
}

- (int64_t)_uptime
{
  *(void *)uint64_t v6 = 0x1500000001LL;
  v4[0] = 0LL;
  v4[1] = 0LL;
  size_t v5 = 16LL;
  int v2 = sysctl(v6, 2u, v4, &v5, 0LL, 0LL);
  int64_t result = 0LL;
  if (!v2) {
    return time(0LL) - v4[0];
  }
  return result;
}

- (id)_currentEAPFSMode
{
  if (_currentEAPFSMode_onceToken != -1) {
    dispatch_once(&_currentEAPFSMode_onceToken, &__block_literal_global_9);
  }
  return _currentEAPFSMode_eapfsMode;
}

void __36__UMEventRecorder__currentEAPFSMode__block_invoke(id a1)
{
  v1[2] = 0LL;
  v1[0] = 5LL;
  v1[1] = 2147491840LL;
  if (getattrlist("/private/var/mobile", v1, v2, 0x40CuLL, 0) != -1)
  {
    if (-[NSString isEqualToString:]( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (char *)v3 + v3[0],  4LL),  "isEqualToString:",  @"User"))
    {
      _currentEAPFSMode_eapfsMode = @"YES";
    }
  }

- (void)_saveEvent:(id)a3
{
  id v5 = objc_msgSend(-[UMEventRecorder _serverURL](self, "_serverURL"), "absoluteString");
  if (!v5)
  {
    v37 = @"Malformed URL for update metrics event reporting - discarding event";
LABEL_11:
    _log(0LL, (uint64_t)v37, v6, v7, v8, v9, v10, v11, v57);
    return;
  }

  id v12 = v5;
  uint64_t v13 = -[UMEventRecorder uuid](self, "uuid");
  if (!v13)
  {
    v37 = @"Malformed UUID for update metrics event reporting - discarding event";
    goto LABEL_11;
  }

  uint64_t v14 = v13;
  v55[0] = @"Event Data";
  v55[1] = @"Install Id";
  v56[0] = a3;
  v56[1] = v13;
  v55[2] = @"Submission URL";
  v56[2] = v12;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL);
  uint64_t v16 = &AMAuthInstallApImg4EncodeRestoreInfo_ptr;
  id v17 = objc_msgSend( -[UMEventRecorder _eventDirectory](self, "_eventDirectory"),  "URLByAppendingPathComponent:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@-%@-%@-%d.plist",  v14,  objc_msgSend(a3, "objectForKey:", @"event"),  objc_msgSend(a3, "objectForKey:", @"eventTime"),  0));
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [v17 path]))
  {
    uint64_t v18 = 1LL;
    do
    {
      uint64_t v19 = v16;
      id v17 = objc_msgSend( -[UMEventRecorder _eventDirectory](self, "_eventDirectory"),  "URLByAppendingPathComponent:",  objc_msgSend( v16[182],  "stringWithFormat:",  @"%@-%@-%@-%d.plist",  v14,  objc_msgSend(a3, "objectForKey:", @"event"),  objc_msgSend(a3, "objectForKey:", @"eventTime"),  v18));
      uint64_t v20 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      id v21 = [v17 path];
      uint64_t v22 = v20;
      uint64_t v16 = v19;
      uint64_t v18 = (v18 + 1);
    }

    while (-[NSFileManager fileExistsAtPath:](v22, "fileExistsAtPath:", v21));
  }

  unsigned __int8 v23 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v15,  200LL,  0LL,  0LL);
  if (v23)
  {
    uint64_t v54 = 0LL;
    uint64_t v30 = -[NSData writeToURL:options:error:](v23, "writeToURL:options:error:", v17, 1LL, &v54);
    if ((_DWORD)v30)
    {
      -[UMEventRecorder _setPermissionsOnURL:](self, "_setPermissionsOnURL:", v17);
    }

    else
    {
      _log(v30, (uint64_t)@"ERROR - unable to write event to file: '%@'", v31, v32, v33, v34, v35, v36, v54);
      _log( v45,  (uint64_t)@"will try to keep the event in memory and send later",  v46,  v47,  v48,  v49,  v50,  v51,  v53);
      -[NSMutableArray addObject:](-[UMEventRecorder droppedEvents](self, "droppedEvents"), "addObject:", v15);
    }
  }

  else
  {
    _log( 0LL,  (uint64_t)@"ERROR - unable to create property list from dictionary: %@",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)v15);
    _log(v38, (uint64_t)@"discarding event", v39, v40, v41, v42, v43, v44, v52);
  }

- (void)_recordEvent:(id)a3 information:(id)a4 callback:(id)a5
{
}

- (void)_recordEvent:(id)a3 getPowerLog:(BOOL)a4 information:(id)a5 callback:(id)a6
{
  if (!-[UMEventRecorder baseServerURL](self, "baseServerURL", a3, a4))
  {
    _log( 0LL,  (uint64_t)@"event reporting is not enabled, discarding event (%@) - %@\n",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)a3);
    return;
  }

  if (-[UMEventRecorder attributeDict](self, "attributeDict")) {
    id v16 = -[NSMutableDictionary mutableCopy](-[UMEventRecorder attributeDict](self, "attributeDict"), "mutableCopy");
  }
  else {
    id v16 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }
  id v17 = v16;
  if (a5) {
    [v16 addEntriesFromDictionary:a5];
  }
  objc_msgSend( v17,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1),  @"reportVersion");
  [v17 setObject:a3 forKey:@"event"];
  objc_msgSend(v17, "setObject:forKey:", -[UMEventRecorder installType](self, "installType"), @"type");
  objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _currentTimeInMilliseconds](self, "_currentTimeInMilliseconds"),  @"eventTime");
  objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _getGestaltString:](self, "_getGestaltString:", @"DeviceClass"),  @"deviceClass");
  objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _getDeviceModel](self, "_getDeviceModel"),  @"deviceModel");
  objc_msgSend( v17,  "setObject:forKey:",  +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[UMEventRecorder _uptime](self, "_uptime")),  @"uptime");
  uint64_t v18 = -[UMEventRecorder _getGestaltValue:](self, "_getGestaltValue:", @"BatteryCurrentCapacity");
  if (!v18 || (uint64_t v19 = v18, v20 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v19, v20) & 1) == 0)) {
    uint64_t v19 = @"unknown";
  }
  [v17 setObject:v19 forKey:@"batteryLevel"];
  id v21 = -[UMEventRecorder _getGestaltValue:](self, "_getGestaltValue:", @"BatteryIsCharging");
  if (!v21 || (uint64_t v22 = v21, v23 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v22, v23) & 1) == 0)) {
    uint64_t v22 = @"unknown";
  }
  [v17 setObject:v22 forKey:@"batteryIsCharging"];
  id v24 = -[UMEventRecorder _getDiskUsage](self, "_getDiskUsage");
  if (v24 && (id v25 = v24, v26 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v25, v26) & 1) != 0))
  {
    objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:]( self,  "_getGestaltDiskUsageKey:inDictionary:",  kMGQDiskUsageTotalDiskCapacity,  v25),  @"storageCapacity");
    objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:]( self,  "_getGestaltDiskUsageKey:inDictionary:",  kMGQDiskUsageTotalSystemCapacity,  v25),  @"systemFsCapacity");
    objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:]( self,  "_getGestaltDiskUsageKey:inDictionary:",  kMGQDiskUsageTotalSystemAvailable,  v25),  @"systemFsFree");
    objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:]( self,  "_getGestaltDiskUsageKey:inDictionary:",  kMGQDiskUsageTotalDataCapacity,  v25),  @"dataFsCapacity");
    uint64_t v27 = -[UMEventRecorder _getGestaltDiskUsageKey:inDictionary:]( self,  "_getGestaltDiskUsageKey:inDictionary:",  kMGQDiskUsageTotalDataAvailable,  v25);
    uint64_t v28 = v17;
  }

  else
  {
    [v17 setObject:@"unknown" forKey:@"storageCapacity"];
    [v17 setObject:@"unknown" forKey:@"systemFsCapacity"];
    [v17 setObject:@"unknown" forKey:@"systemFsFree"];
    [v17 setObject:@"unknown" forKey:@"dataFsCapacity"];
    uint64_t v28 = v17;
    uint64_t v27 = @"unknown";
  }

  [v28 setObject:v27 forKey:@"dataFsFree"];
  objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _currentOSVersion](self, "_currentOSVersion"),  @"currentOSVersion");
  objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _currentBaseOSVersion](self, "_currentBaseOSVersion"),  @"currentBaseOSVersion");
  uint64_t v29 = -[UMEventRecorder _getGestaltString:default:]( self,  "_getGestaltString:default:",  @"ProductVersionExtra",  0LL);
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = @"unknown";
  }
  if (v29) {
    uint64_t v31 = @"true";
  }
  else {
    uint64_t v31 = @"false";
  }
  [v17 setObject:v30 forKey:@"currentProductVersionExtra"];
  [v17 setObject:v31 forKey:@"rapidSecurityResponseInstalled"];
  id v32 = -[UMEventRecorder _getGestaltString:default:]( self,  "_getGestaltString:default:",  @"ReleaseType",  @"user");
  [v17 setObject:v32 forKey:@"currentOSType"];
  if (-[UMEventRecorder targetOSVersion](self, "targetOSVersion")) {
    objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder targetOSVersion](self, "targetOSVersion"),  @"targetOSVersion");
  }
  if ([v17 objectForKeyedSubscript:@"installTonight"])
  {
    id v33 = [v17 objectForKeyedSubscript:@"installTonight"];
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
      -[UMEventRecorder setInstallTonight:]( self,  "setInstallTonight:",  [v17 objectForKeyedSubscript:@"installTonight"]);
    }
  }

  objc_msgSend( v17,  "setObject:forKey:",  -[UMEventRecorder _currentEAPFSMode](self, "_currentEAPFSMode"),  @"eapfsMode");
  if (-[UMEventRecorder context](self, "context")) {
    objc_msgSend(v17, "setObject:forKey:", -[UMEventRecorder context](self, "context"), @"context");
  }
  if (-[UMEventRecorder brainVersion](self, "brainVersion")) {
    objc_msgSend(v17, "setObject:forKey:", -[UMEventRecorder brainVersion](self, "brainVersion"), @"brainVersion");
  }
  id v35 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"usermanagerd");
  if (v35) {
    [v17 setObject:v35 forKeyedSubscript:@"usermanagerdNVRAM"];
  }
  uint64_t v36 = (NSString *)[v17 objectForKeyedSubscript:@"MobileAssetAssetAudience"];
  if (v36
    && (uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v36, v37),
        (isKindOfClass & 1) != 0))
  {
    _log( isKindOfClass,  (uint64_t)@"Using assetAudience passed in by upper layer(%@) for splunk event",  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)v36);
    id v45 = [v17 setObject:v36 forKey:@"MobileAssetAssetAudience"];
  }

  else
  {
    TypeID = CFPreferencesCopyAppValue(@"MobileAssetAssetAudience", @"com.apple.MobileAsset");
    uint64_t v59 = TypeID;
    if (TypeID && (CFTypeID v60 = CFGetTypeID(TypeID), TypeID = (const void *)CFStringGetTypeID(), (const void *)v60 == TypeID))
    {
      _log((uint64_t)TypeID, (uint64_t)@"Asset audience default is %@", v53, v54, v55, v56, v57, v58, (uint64_t)v59);
      [v17 setObject:v59 forKey:@"MobileAssetAssetAudience"];
    }

    else
    {
      _log( (uint64_t)TypeID,  (uint64_t)@"Unable to determine asset audience from defaults. Assuming default audience for build in use",  v53,  v54,  v55,  v56,  v57,  v58,  v61);
      if (!v36) {
        uint64_t v36 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DefaultAssetAudienceForReleaseType%@",  v32);
      }
      id v45 = [v17 setObject:v36 forKey:@"MobileAssetAssetAudience"];
      if (!v59) {
        goto LABEL_45;
      }
    }

    CFRelease(v59);
  }

- (id)_nvramValue:(id)a3
{
  nvramDict = self->_nvramDict;
  if (nvramDict) {
    CFTypeRef v5 = -[NSDictionary objectForKey:](nvramDict, "objectForKey:", a3);
  }
  else {
    CFTypeRef v5 = copy_nvram_variable((const __CFString *)a3);
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = (const char *)[v6 bytes];
    uint64_t v9 = -[NSString initWithBytes:length:encoding:]( [NSString alloc],  "initWithBytes:length:encoding:",  v8,  strnlen(v8, (size_t)[v6 length]),  4);
LABEL_8:
    uint64_t v18 = v9;
    goto LABEL_12;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v10);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v9 = (NSString *)[v6 copy];
    goto LABEL_8;
  }

  if (v6) {
    _log( isKindOfClass,  (uint64_t)@"NVRAM variable %@ has unexpected value '%@'",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)a3);
  }
  uint64_t v18 = 0LL;
LABEL_12:

  return v18;
}

- (BOOL)_setNvramValue:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    uint64_t v9 = set_nvram_object((const __CFString *)a4, (BOOL)a3, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
    if ((v9 & 1) != 0) {
      return 1;
    }
  }

  else
  {
    uint64_t v9 = delete_nvram_variable((const __CFString *)a4);
    if ((v9 & 1) != 0) {
      return 1;
    }
  }

  _log(v9, (uint64_t)@"unable to set %@ to %@", v10, v11, v12, v13, v14, v15, (uint64_t)a4);
  return 0;
}

- (BOOL)_syncNvram
{
  BOOL v8 = msu_sync_nvram(1, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  BOOL v15 = v8;
  if (!v8) {
    _log(v8, (uint64_t)@"unable to sync nvram", v9, v10, v11, v12, v13, v14, v17);
  }
  return v15;
}

- (BOOL)_installInProgress
{
  return !access( (const char *)objc_msgSend( -[UMEventRecorder _installInfoFile](self, "_installInfoFile"),  "fileSystemRepresentation"),  0)
      || -[UMEventRecorder uuid](self, "uuid") != 0LL;
}

- (BOOL)_installInProgressAfterApply
{
  CFTypeRef v2 = copy_nvram_variable(@"ota-uuid");
  uint64_t v9 = v2;
  if (v2)
  {
    _log((uint64_t)v2, (uint64_t)@"InstallInProgressAfterApply is true", v3, v4, v5, v6, v7, v8, v11);
    CFRelease(v9);
  }

  else
  {
    _log(0LL, (uint64_t)@"InstallInProgressAfterApply is false\n", v3, v4, v5, v6, v7, v8, v11);
  }

  return v9 != 0LL;
}

- (void)_cleanupInstallState
{
  BOOL v3 = msu_nvram_exists(@"ota-uuid");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-uuid");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-result");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-failure-reason");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-breadcrumbs");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-submission-url");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-os-version");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-original-os-version");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-original-base-os-version");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-install-tonight");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-context");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-brain-version");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"OTA-pre-conversion");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"OTA-post-conversion");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-conv-panic-indicator");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"OTA-fsck-metrics");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"OTA-sealvolume-metrics");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"OTA-migrator-metrics");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"OTA-converter-metrics");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-forced-reset-uptime");
  -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  0LL,  @"ota-initial-forced-reset-uptime");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ramrod-nvram-sequence");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-snapshot-update");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"pre-recovery-ota-failure-uuid");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"recoveryos-initiated-update");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-controllerVersion");
  -[UMEventRecorder _setNvramValue:forKey:](self, "_setNvramValue:forKey:", 0LL, @"ota-updateType");
  if (v3)
  {
    BOOL v4 = msu_nvram_exists(@"ota-uuid");
    if (v4)
    {
      _log( v4,  (uint64_t)@"Value for %@ was not cleared, not syncing",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)@"ota-uuid");
    }

    else
    {
      _log(v4, (uint64_t)@"syncing nvram to clear %@", v5, v6, v7, v8, v9, v10, (uint64_t)@"ota-uuid");
      -[UMEventRecorder _syncNvram](self, "_syncNvram");
    }
  }

  -[UMEventRecorder setUuid:](self, "setUuid:", 0LL);
  -[UMEventRecorder setBaseServerURL:](self, "setBaseServerURL:", 0LL);
  -[UMEventRecorder setTargetOSVersion:](self, "setTargetOSVersion:", 0LL);
  -[UMEventRecorder setContext:](self, "setContext:", 0LL);
  -[UMEventRecorder setAttributeDict:](self, "setAttributeDict:", 0LL);
  if (unlink((const char *)objc_msgSend( -[UMEventRecorder _installInfoFile](self, "_installInfoFile"),  "fileSystemRepresentation"))
    && *__error() != 2)
  {
    id v11 = -[UMEventRecorder _installInfoFile](self, "_installInfoFile");
    uint64_t v12 = __error();
    uint64_t v27 = strerror(*v12);
    _log((uint64_t)v27, (uint64_t)@"unable to remove %@: %s", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
  }

  if (unlink((const char *)objc_msgSend( -[UMEventRecorder _legacyInstallInfoFile](self, "_legacyInstallInfoFile"),  "fileSystemRepresentation")))
  {
    if (*__error() != 2)
    {
      id v19 = -[UMEventRecorder _installInfoFile](self, "_installInfoFile");
      uint64_t v20 = __error();
      uint64_t v28 = strerror(*v20);
      _log((uint64_t)v28, (uint64_t)@"unable to remove %@: %s", v21, v22, v23, v24, v25, v26, (uint64_t)v19);
    }
  }

- (void)_writeInfoFile
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (-[UMEventRecorder baseServerURL](self, "baseServerURL")) {
    objc_msgSend( v3,  "setObject:forKey:",  -[UMEventRecorder baseServerURL](self, "baseServerURL"),  @"Submission URL");
  }
  if (-[UMEventRecorder uuid](self, "uuid")) {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder uuid](self, "uuid"), @"UUID");
  }
  if (-[UMEventRecorder targetOSVersion](self, "targetOSVersion")) {
    objc_msgSend( v3,  "setObject:forKey:",  -[UMEventRecorder targetOSVersion](self, "targetOSVersion"),  @"Target OS Version");
  }
  if (-[UMEventRecorder context](self, "context")) {
    objc_msgSend(v3, "setObject:forKey:", -[UMEventRecorder context](self, "context"), @"Context");
  }
  if (-[UMEventRecorder attributeDict](self, "attributeDict")
    && -[NSMutableDictionary count](-[UMEventRecorder attributeDict](self, "attributeDict"), "count"))
  {
    objc_msgSend( v3,  "setObject:forKey:",  -[UMEventRecorder attributeDict](self, "attributeDict"),  @"Persistent Attributes");
  }

  id v4 = objc_msgSend(v3, "writeToURL:atomically:", -[UMEventRecorder _installInfoFile](self, "_installInfoFile"), 1);
  if ((_DWORD)v4) {
    -[UMEventRecorder _setPermissionsOnURL:]( self,  "_setPermissionsOnURL:",  -[UMEventRecorder _installInfoFile](self, "_installInfoFile"));
  }
  else {
    _log((uint64_t)v4, (uint64_t)@"unable to write install info file", v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)startRecordingInstall:(id)a3
{
  id v5 = [a3 objectForKey:@"Build"];
  if (!v5)
  {
    id v5 = [a3 objectForKey:@"TargetUpdate"];
    if (!v5)
    {
      _log( 0LL,  (uint64_t)@"asset attributes do not include build - update metrics disabled",  v6,  v7,  v8,  v9,  v10,  v11,  v58);
      return;
    }
  }

  if (-[UMEventRecorder _installInProgress](self, "_installInProgress"))
  {
    uint64_t v12 = -[NSString isEqualToString:](self->_targetOSVersion, "isEqualToString:", v5);
    if ((v12 & 1) == 0)
    {
      _log( v12,  (uint64_t)@"startRecordingInstall for %@ found an install currently in progress for %@",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v5);
      -[UMEventRecorder recordEvent:information:installIsComplete:]( self,  "recordEvent:information:installIsComplete:",  @"incompleteInstall",  0LL,  1LL);
    }
  }

  id v19 = [a3 objectForKey:@"BrainVersion"];
  if (v19) {
    -[UMEventRecorder setBrainVersion:](self, "setBrainVersion:", v19);
  }
  uint64_t v20 = (const __CFString *)objc_msgSend( -[UMEventRecorder _defaults](self, "_defaults"),  "stringForKey:",  @"EventRecordingServiceURL");
  if (!v20)
  {
    uint64_t v20 = (const __CFString *)[a3 objectForKey:@"_EventRecordingServiceURL"];
    if (!v20)
    {
      uint64_t v20 = @"https://xp.apple.com/report";
      _log( 0LL,  (uint64_t)@"no url provided - defaulting to %@",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)@"https://xp.apple.com/report");
    }
  }

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v20, v27);
  if ((isKindOfClass & 1) == 0)
  {
    _log(isKindOfClass, (uint64_t)@"bogus event service URL %@", v29, v30, v31, v32, v33, v34, (uint64_t)v20);
    -[UMEventRecorder setBaseServerURL:](self, "setBaseServerURL:", 0LL);
    return;
  }

  -[UMEventRecorder setBaseServerURL:](self, "setBaseServerURL:", v20);
  if (v20)
  {
    -[UMEventRecorder setTargetOSVersion:](self, "setTargetOSVersion:", v5);
    id v35 = (NSString *)[a3 objectForKey:@"UpdateUUID"];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v38 = objc_opt_isKindOfClass(v36, v37);
      if ((v38 & 1) == 0)
      {
LABEL_22:
        _log( v38,  (uint64_t)@"setting uuid in startRecordingInstall to %@",  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)v36);
        -[UMEventRecorder setUuid:](self, "setUuid:", v36);
        -[UMEventRecorder setContext:]( self,  "setContext:",  objc_msgSend(-[UMEventRecorder _defaults](self, "_defaults"), "stringForKey:", @"Context"));
        -[UMEventRecorder _writeInfoFile](self, "_writeInfoFile");
        return;
      }

      id v45 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v36);
      if (v45)
      {

        goto LABEL_22;
      }

      _log( 0LL,  (uint64_t)@"unable to convert provided uuid string (%@) to a valid NSUUID class, setting uuid to nil",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)v36);
    }

    uint64_t v36 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
    _log((uint64_t)v36, (uint64_t)@"generated a new uuid string %@", v52, v53, v54, v55, v56, v57, (uint64_t)v36);
    goto LABEL_22;
  }

- (void)addPersistentAttribute:(id)a3 forKey:(id)a4
{
  uint64_t v7 = -[UMEventRecorder _installInProgress](self, "_installInProgress");
  if ((v7 & 1) != 0)
  {
    if (-[UMEventRecorder attributeDict](self, "attributeDict")) {
      -[NSMutableDictionary setObject:forKey:]( -[UMEventRecorder attributeDict](self, "attributeDict"),  "setObject:forKey:",  a3,  a4);
    }
    else {
      -[UMEventRecorder setAttributeDict:]( self,  "setAttributeDict:",  +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  a3,  a4));
    }
    -[UMEventRecorder _writeInfoFile](self, "_writeInfoFile");
  }

  else
  {
    _log( v7,  (uint64_t)@"Attempt to save attribute %@ when install not in progres",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)a4);
  }

- (void)removePersistentAttributeKey:(id)a3
{
  if (-[UMEventRecorder attributeDict](self, "attributeDict"))
  {
    -[NSMutableDictionary removeObjectForKey:]( -[UMEventRecorder attributeDict](self, "attributeDict"),  "removeObjectForKey:",  a3);
    -[UMEventRecorder _writeInfoFile](self, "_writeInfoFile");
  }

- (void)recordEvent:(id)a3 information:(id)a4 installIsComplete:(BOOL)a5
{
  BOOL v5 = a5;
  -[UMEventRecorder recordEvent:information:](self, "recordEvent:information:", a3, a4);
  if (v5) {
    -[UMEventRecorder _cleanupInstallState](self, "_cleanupInstallState");
  }
}

- (void)recordEvent:(id)a3 information:(id)a4
{
}

- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4
{
}

- (void)recordPostUpdateEvent:(id)a3 additionalInfo:(id)a4 withCallback:(id)a5
{
  id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v10 = [a4 objectForKeyedSubscript:@"rapidSecurityResponseUpdate"];
  id v11 = [a4 objectForKeyedSubscript:@"rapidSecurityResponseRollback"];
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0 && ([v10 BOOLValue] & 1) != 0
    || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    && [v11 BOOLValue])
  {
    id v90 = a3;
    id v91 = a5;
    id v14 = [a4 objectForKeyedSubscript:@"result"];
    id v85 = a4;
    id v15 = [a4 objectForKeyedSubscript:@"failureReason"];
    id v83 = 0LL;
    id v84 = 0LL;
    id v16 = 0LL;
    id v81 = 0LL;
    id v82 = 0LL;
    id v88 = 0LL;
    id v80 = 0LL;
    id v89 = 0LL;
    id v79 = 0LL;
    id v92 = 0LL;
    v86 = 0LL;
    v87 = 0LL;
    uint64_t v17 = 0LL;
    v78 = 0LL;
    id v93 = 0LL;
    id v18 = 0LL;
    id v19 = 0LL;
    id v20 = 0LL;
    uint64_t v21 = 0LL;
    if (v14) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v36 = -[UMEventRecorder _installInProgressAfterApply](self, "_installInProgressAfterApply");
    if ((v36 & 1) == 0)
    {
      _log( v36,  (uint64_t)@"ignoring call to recordPostUpdateEvent when no install is in progress or we haven't performed the apply operation",  v37,  v38,  v39,  v40,  v41,  v42,  v94);
      return;
    }

    id v90 = a3;
    id v91 = a5;
    uint64_t v43 = objc_opt_new(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setFormatterBehavior:]( v43,  "setFormatterBehavior:",  +[NSNumberFormatter defaultFormatterBehavior](&OBJC_CLASS___NSNumberFormatter, "defaultFormatterBehavior"));
    id v14 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-result");
    id v73 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-failure-reason");
    id v74 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-breadcrumbs");
    id v75 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-original-os-version");
    id v76 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-original-base-os-version");
    id v44 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-install-tonight");
    id v93 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-brain-version");
    id v45 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"OTA-pre-conversion");
    v77 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"OTA-post-conversion");
    v86 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-conv-panic-indicator");
    v87 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"OTA-fsck-metrics");
    id v92 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"OTA-sealvolume-metrics");
    id v79 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"OTA-migrator-metrics");
    id v89 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"OTA-converter-metrics");
    id v80 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-forced-reset-uptime");
    id v46 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-initial-forced-reset-uptime");
    id v88 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-snapshot-update");
    id v81 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"pre-recovery-ota-failure-uuid");
    id v47 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"recoveryos-initiated-update");
    id v83 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-controllerVersion");
    v78 = v45;
    id v84 = -[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-updateType");
    id v85 = a4;
    id v82 = v46;
    id v16 = v47;
    if (v44) {
      uint64_t v21 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSNumber BOOLValue](-[NSNumberFormatter numberFromString:](v43, "numberFromString:", v44), "BOOLValue"));
    }
    else {
      uint64_t v21 = 0LL;
    }
    id v18 = v76;
    uint64_t v17 = v77;
    id v20 = v74;
    id v19 = v75;
    id v15 = v73;
    if (v14)
    {
LABEL_6:
      [v9 setObject:v14 forKey:@"result"];
      id v22 = v15;
      id v24 = v92;
      id v23 = v93;
      if (v22) {
        [v9 setObject:v22 forKey:@"failureReason"];
      }
      if (v20) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }

  if (objc_msgSend( -[UMEventRecorder _currentOSVersion](self, "_currentOSVersion"),  "isEqualToString:",  -[UMEventRecorder targetOSVersion](self, "targetOSVersion")))
  {
    id v24 = v92;
    if (-[UMEventRecorder _nvramValue:](self, "_nvramValue:", @"ota-uuid"))
    {
      [v9 setObject:@"unexpected error" forKey:@"result"];
      v69 = @"no result set in NVRAM after update";
      v70 = @"failureReason";
    }

    else
    {
      v69 = @"OTA update not performed";
      v70 = @"result";
    }

    [v9 setObject:v69 forKey:v70];
  }

  else
  {
    [v9 setObject:@"unexpected error" forKey:@"result"];
    [v9 setObject:@"no result set in NVRAM reporting from non-target OS" forKey:@"failureReason"];
    id v24 = v92;
  }

  id v23 = v93;
  if (v20) {
LABEL_9:
  }
    [v9 setObject:v20 forKey:@"breadcrumbs"];
LABEL_10:
  if (v19) {
    [v9 setObject:v19 forKey:@"originalOSVersion"];
  }
  if (v18) {
    [v9 setObject:v18 forKey:@"originalBaseOSVersion"];
  }
  if (v21) {
    [v9 setObject:v21 forKey:@"installTonight"];
  }
  if (v23) {
    [v9 setObject:v23 forKey:@"brainVersion"];
  }
  uint64_t v25 = v86;
  if (v80) {
    [v9 setObject:v80 forKey:@"forcedResetUptime"];
  }
  if (v82) {
    [v9 setObject:v82 forKey:@"initialForcedResetUptime"];
  }
  if (v81) {
    [v9 setObject:v81 forKey:@"preRecoveryClientId"];
  }
  if (v16) {
    [v9 setObject:v16 forKey:@"recoveryInitiated"];
  }
  uint64_t v26 = v87;
  if (v83) {
    [v9 setObject:v83 forKey:@"controllerVersion"];
  }
  if (v84) {
    [v9 setObject:v84 forKey:@"updateType"];
  }
  uint64_t v27 = +[UMEventRecorder diagnosticsAndUsageAllowed:]( &OBJC_CLASS___UMEventRecorder,  "diagnosticsAndUsageAllowed:",  -[UMEventRecorder dataMountPoint](self, "dataMountPoint"));
  if ((v27 & 1) != 0)
  {
    _log(v27, (uint64_t)@"Diagnostic log submission enabled", v28, v29, v30, v31, v32, v33, v71);
    uint64_t v34 = v79;
    id v35 = v78;
    if (!v78) {
      goto LABEL_47;
    }
LABEL_46:
    [v9 setObject:v35 forKey:@"preConv"];
    goto LABEL_47;
  }

  _log(v27, (uint64_t)@"Diagnostic log submission disabled", v28, v29, v30, v31, v32, v33, v71);
  id v35 = @"<Redacted>";
  if (v17) {
    uint64_t v17 = @"<Redacted>";
  }
  else {
    uint64_t v17 = 0LL;
  }
  if (v86) {
    uint64_t v25 = @"<Redacted>";
  }
  else {
    uint64_t v25 = 0LL;
  }
  if (v87) {
    uint64_t v26 = @"<Redacted>";
  }
  else {
    uint64_t v26 = 0LL;
  }
  uint64_t v34 = v79;
  if (v78) {
    goto LABEL_46;
  }
LABEL_47:
  if (v17) {
    [v9 setObject:v17 forKey:@"postConv"];
  }
  if (v25) {
    [v9 setObject:v25 forKey:@"convPanic"];
  }
  if (v26) {
    [v9 setObject:v26 forKey:@"fsckMetrics"];
  }
  if (v24) {
    [v9 setObject:v24 forKey:@"sealvolumeMetrics"];
  }
  if (objc_msgSend(v34, "length", v35))
  {
    id v48 = [v34 cStringUsingEncoding:4];
    if (&_APFSDecodeMetricsString && v48)
    {
      uint64_t v55 = (void *)APFSDecodeMetricsString();
      if ([v55 length])
      {
        [v9 setObject:v55 forKey:@"migratorMetrics"];

        if (!v89) {
          goto LABEL_65;
        }
      }

      else
      {
        _log( 0LL,  (uint64_t)@"%s: bad decoded metrics",  v56,  v57,  v58,  v59,  v60,  v61,  (uint64_t)"-[UMEventRecorder recordPostUpdateEvent:additionalInfo:withCallback:]");
        if (!v89) {
          goto LABEL_65;
        }
      }

      goto LABEL_64;
    }

    _log( (uint64_t)v48,  (uint64_t)@"%s: failed to find APFSDecodeMetricsString, reporting encoded metrics",  v49,  v50,  v51,  v52,  v53,  v54,  (uint64_t)"-[UMEventRecorder recordPostUpdateEvent:additionalInfo:withCallback:]");
    [v9 setObject:v34 forKey:@"migratorMetrics"];
  }

  if (v89) {
LABEL_64:
  }
    [v9 setObject:v89 forKey:@"converterMetrics"];
LABEL_65:
  if (v88) {
    [v9 setObject:v88 forKey:@"snapshotUpdate"];
  }
  if (-[UMEventRecorder eventAttributes](self, "eventAttributes")) {
    objc_msgSend(v9, "addEntriesFromDictionary:", -[UMEventRecorder eventAttributes](self, "eventAttributes"));
  }
  id v62 = -[UMEventCheckpoint checkpointNvramInfo:]( +[UMEventCheckpoint sharedInstance](&OBJC_CLASS___UMEventCheckpoint, "sharedInstance"),  "checkpointNvramInfo:",  self->_nvramDict);
  if (v62) {
    id v62 = [v9 addEntriesFromDictionary:v62];
  }
  if (v85)
  {
    _log((uint64_t)v62, (uint64_t)@"Adding dictionary to splunk object", v63, v64, v65, v66, v67, v68, v72);
    [v9 addEntriesFromDictionary:v85];
  }

  -[UMEventRecorder _recordEvent:information:callback:](self, "_recordEvent:information:callback:", v90, v9, v91);
  -[UMEventRecorder _cleanupInstallState](self, "_cleanupInstallState");
}

- (id)_copyEscapeStringsForEventData:(id)a3
{
  id v4 = +[NSMutableCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSMutableCharacterSet,  "characterSetWithCharactersInString:",  @"%\\"");
  -[NSMutableCharacterSet formUnionWithCharacterSet:]( v4,  "formUnionWithCharacterSet:",  +[NSCharacterSet controlCharacterSet](&OBJC_CLASS___NSCharacterSet, "controlCharacterSet"));
  -[NSMutableCharacterSet formUnionWithCharacterSet:]( v4,  "formUnionWithCharacterSet:",  +[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  BOOL v5 = +[NSMutableCharacterSet characterSetWithRange:]( &OBJC_CLASS___NSMutableCharacterSet,  "characterSetWithRange:",  0LL,  127LL);
  -[NSMutableCharacterSet formIntersectionWithCharacterSet:]( v5,  "formIntersectionWithCharacterSet:",  -[NSMutableCharacterSet invertedSet](v4, "invertedSet"));
  id v6 = [a3 allKeys];
  id v7 = objc_msgSend( objc_msgSend(a3, "objectsForKeys:notFoundMarker:", v6, +[NSNull null](NSNull, "null")),  "mutableCopy");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3254779904LL;
  v10[2] = __50__UMEventRecorder__copyEscapeStringsForEventData___block_invoke;
  v10[3] = &__block_descriptor_48_e8_32o40o_e15_v32__0_8Q16_B24l;
  v10[4] = v7;
  v10[5] = v5;
  [v7 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = -[NSDictionary initWithObjects:forKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjects:forKeys:",  v7,  v6);

  return v8;
}

uint64_t __50__UMEventRecorder__copyEscapeStringsForEventData___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  *a4 = 0;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t result = objc_opt_isKindOfClass(a2, v7);
  if ((result & 1) != 0) {
    return (uint64_t)objc_msgSend( *(id *)(a1 + 32),  "replaceObjectAtIndex:withObject:",  a3,  objc_msgSend(a2, "stringByAddingPercentEncodingWithAllowedCharacters:", *(void *)(a1 + 40)));
  }
  return result;
}

- (id)_submissionBodyForEvents:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "objectForKey:", @"Install Id");
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3254779904LL;
  v24[2] = __44__UMEventRecorder__submissionBodyForEvents___block_invoke;
  v24[3] = &__block_descriptor_48_e8_32o40o_e29_v32__0__NSDictionary_8Q16_B24l;
  v24[4] = self;
  v24[5] = v6;
  [a3 enumerateObjectsUsingBlock:v24];
  v25[0] = @"clientId";
  v25[1] = @"events";
  v26[0] = v5;
  v26[1] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL);
  uint64_t v8 = +[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v7);
  if ((_DWORD)v8) {
    return +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  0LL,  0LL);
  }
  _log(v8, (uint64_t)@"unable to convert event to JSON", v9, v10, v11, v12, v13, v14, v23);
  _log(v16, (uint64_t)@"event: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v7);
  return 0LL;
}

void __44__UMEventRecorder__submissionBodyForEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend( *(id *)(a1 + 32),  "_copyEscapeStringsForEventData:",  objc_msgSend(a2, "objectForKey:", @"Event Data"));
  [*(id *)(a1 + 40) addObject:v3];
}

- (void)_submitIndividualEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = dispatch_group_create();
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(a3);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        dispatch_group_enter(v10);
        uint64_t v25 = v15;
        uint64_t v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3254779904LL;
        v20[2] = __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke;
        void v20[3] = &__block_descriptor_40_e8_32o_e5_v8__0l;
        v20[4] = v10;
        -[UMEventRecorder _submitEvents:toURL:withOptions:completionHandler:]( self,  "_submitEvents:toURL:withOptions:completionHandler:",  v16,  a4,  a5,  v20);
      }

      id v12 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v12);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke_2;
  block[3] = &__block_descriptor_40_e8_32b_e5_v8__0l;
  block[4] = a6;
  dispatch_group_notify(v10, global_queue, block);
  dispatch_release(v10);
}

void __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke( uint64_t a1)
{
}

uint64_t __79__UMEventRecorder__submitIndividualEvents_toURL_withOptions_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_scheduleEventSubmissionRetry
{
  if (!-[UMEventRecorder submissionPending](self, "submissionPending"))
  {
    -[UMEventRecorder setSubmissionPending:](self, "setSubmissionPending:", 1LL);
    uint64_t v3 = os_transaction_create("com.apple.MobileSoftwareUpdate._scheduleEventSubmissionRetry");
    -[UMEventRecorder _retryInterval](self, "_retryInterval");
    dispatch_time_t v5 = dispatch_time(0LL, (uint64_t)(v4 * 1000000000.0));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3254779904LL;
    v7[2] = __48__UMEventRecorder__scheduleEventSubmissionRetry__block_invoke;
    v7[3] = &__block_descriptor_48_e8_32o40o_e5_v8__0l;
    v7[4] = self;
    v7[5] = v3;
    dispatch_after(v5, global_queue, v7);
  }

void __48__UMEventRecorder__scheduleEventSubmissionRetry__block_invoke(uint64_t a1)
{
}

- (BOOL)_updateRetryInformationForEvents:(id)a3
{
  double v4 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  BOOL v7 = 0;
  uint64_t v8 = *(void *)v25;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      id v11 = [v10 objectForKey:@"Local Path"];
      int v12 = objc_msgSend(objc_msgSend(v10, "objectForKey:", @"Submission Attempts"), "intValue");
      if (v12 < 4)
      {
        uint64_t v20 = (v12 + 1);
        id v21 = [v10 mutableCopy];
        objc_msgSend( v21,  "setObject:forKey:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20),  @"Submission Attempts");
        [v21 setObject:v4 forKey:@"Last Submission Attempt"];
        [v21 removeObjectForKey:@"Local Path"];
        BOOL v7 = 1;
        [v21 writeToFile:v11 atomically:1];
      }

      else if (unlink((const char *)[v11 fileSystemRepresentation]))
      {
        uint64_t v13 = __error();
        __int128 v23 = strerror(*v13);
        _log((uint64_t)v23, (uint64_t)@"unable to remove %@: %s", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
      }
    }

    id v6 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }

  while (v6);
  return v7;
}

- (void)_removeEvents:(id)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      BOOL v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(a3);
        }
        id v8 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) objectForKey:@"Local Path"];
        if (unlink((const char *)[v8 fileSystemRepresentation]))
        {
          uint64_t v9 = __error();
          uint64_t v16 = strerror(*v9);
          _log((uint64_t)v16, (uint64_t)@"unable to remove %@: %s", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
        }

        BOOL v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

- (void)_submitEvents:(id)a3 toURL:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  id v11 = -[UMEventRecorder _submissionBodyForEvents:](self, "_submissionBodyForEvents:");
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3254779904LL;
    v12[2] = __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke;
    v12[3] = &__block_descriptor_72_e8_32o40o48o56o64b_e39_v24__0__NSHTTPURLResponse_8__NSError_16l;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    v12[7] = a5;
    v12[8] = a6;
    -[UMEventSubmitter submitEventData:toURL:withOptions:completionHandler:]( -[UMEventRecorder submitter](self, "submitter"),  "submitEventData:toURL:withOptions:completionHandler:",  v11,  a4,  a5,  v12);
  }

  else if ((unint64_t)[a3 count] < 2)
  {
    -[UMEventRecorder _removeEvents:](self, "_removeEvents:", a3);
    (*((void (**)(id))a6 + 2))(a6);
  }

  else
  {
    -[UMEventRecorder _submitIndividualEvents:toURL:withOptions:completionHandler:]( self,  "_submitIndividualEvents:toURL:withOptions:completionHandler:",  a3,  a4,  a5,  a6);
  }

__n128 __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  __int128 v3 = *(_OWORD *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 48);
  id v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[1] = 3254779904LL;
  block[0] = _NSConcreteStackBlock;
  block[2] = __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke_2;
  block[3] = &__block_descriptor_88_e8_32o40o48o56o64o72o80b_e5_v8__0l;
  block[4] = a3;
  void block[5] = a2;
  __int128 v8 = v3;
  __int128 v9 = v4;
  uint64_t v10 = *(void *)(a1 + 64);
  dispatch_async(v5, block);
  return result;
}

id __69__UMEventRecorder__submitEvents_toURL_withOptions_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (*(void *)(a1 + 32))
  {
    _log(a1, (uint64_t)@"POST failed: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }

  id v9 = [*(id *)(a1 + 40) statusCode];
  if (v9 == (id)200)
  {
    id v16 = [*(id *)(a1 + 56) count];
    _log((uint64_t)v16, (uint64_t)@"%d events successfully submitted", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    __int128 v23 = *(void **)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
LABEL_5:
    [v23 _removeEvents:v24];
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }

  uint64_t v26 = (uint64_t)v9;
  _log((uint64_t)v9, (uint64_t)@"server rejected submission: %d", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  _log(v27, (uint64_t)@"response: %@", v28, v29, v30, v31, v32, v33, *(void *)(a1 + 40));
  if (v26 >= 500)
  {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }

  id v34 = [*(id *)(a1 + 56) count];
  __int128 v23 = *(void **)(a1 + 48);
  uint64_t v24 = *(void *)(a1 + 56);
  return [v23 _submitIndividualEvents:v24 toURL:*(void *)(a1 + 64) withOptions:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 80)];
}

- (double)_timeIntervalUntilRetry:(id)a3
{
  int v4 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"Submission Attempts"), "intValue");
  if (v4 > 4) {
    id v5 = +[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture");
  }
  else {
    id v5 = (NSDate *)objc_msgSend( objc_msgSend(a3, "objectForKey:", @"Last Submission Attempt"),  "dateByAddingTimeInterval:",  (double)(60 << v4));
  }
  -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
  return result;
}

- (void)submitEventsInBackground:(BOOL)a3
{
}

- (void)submitEventsInBackground:(BOOL)a3 withOptions:(id)a4
{
  BOOL v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke;
  block[3] = &__block_descriptor_49_e8_32o40o_e5_v8__0l;
  if (a3) {
    dispatch_qos_class_t v6 = QOS_CLASS_BACKGROUND;
  }
  else {
    dispatch_qos_class_t v6 = QOS_CLASS_UTILITY;
  }
  block[4] = a4;
  void block[5] = self;
  BOOL v10 = a3;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v6, 0, block);
  submitQueue = self->_submitQueue;
  if (v4) {
    dispatch_async((dispatch_queue_t)submitQueue, v7);
  }
  else {
    dispatch_sync((dispatch_queue_t)submitQueue, v7);
  }
  _Block_release(v7);
}

void __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = *(NSMutableDictionary **)(a1 + 32);
  BOOL v10 = +[NSMutableArray arrayWithArray:]( NSMutableArray,  "arrayWithArray:",  [*(id *)(a1 + 40) droppedEvents]);
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "droppedEvents"), "removeAllObjects");
  id v11 = [*(id *)(a1 + 40) _eventDirectory];
  id v12 = [*(id *)(a1 + 40) _legacyEventDirectory];
  if (*(_BYTE *)(a1 + 48))
  {
    id v82 = (id)os_transaction_create("com.apple.MobileSoftwareUpdate.submitEventsInBackground");
    uint64_t v13 = *(void **)(a1 + 32);
    if (v13) {
      uint64_t v14 = (NSMutableDictionary *)[v13 mutableCopy];
    }
    else {
      uint64_t v14 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL);
    }
    id v9 = v14;
    -[NSMutableDictionary setValue:forKey:]( v14,  "setValue:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"IsBackgroundSubmission");
  }

  else
  {
    id v82 = 0LL;
  }

  v85[0] = 0;
  BOOL v20 = ![*(id *)(a1 + 32) objectForKey:@"forceEventResubmission"]
     || (objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"forceEventResubmission"),  "BOOLValue") & 1) == 0;
  logfunction( ",  1,  @"%s: Previously submitted events will %s resubmitted\n\n",  v15,  v16,  v17,  v18,  v19,  (char)"-[UMEventRecorder submitEventsInBackground:withOptions:]_block_invoke"");
  id v21 = [*(id *)(a1 + 40) _copyUnsubmittedEventsFromDirectory:v11 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:v20 previouslySubmittedEventSkipped:(char *)v85 + 1];
  if (v21)
  {
    uint64_t v28 = v21;
    if ([v21 count])
    {
      id v29 = [v28 count];
      _log( (uint64_t)v29,  (uint64_t)@"Found %lu unsubmitted events in update volume",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v29);
      -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v28);
    }

    CFRelease(v28);
  }

  else
  {
    _log( 0LL,  (uint64_t)@"Unable to check for unsubmitted events on the update volume",  v22,  v23,  v24,  v25,  v26,  v27,  v81);
  }

  if (HIBYTE(v85[0])) {
    _log( v36,  (uint64_t)@"Some events from the update volume were skipped since we had previously attempted to submit them and we are within the retry period",  v37,  v38,  v39,  v40,  v41,  v42,  v81);
  }
  id v43 = [*(id *)(a1 + 40) _copyUnsubmittedEventsFromDirectory:v12 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:v20 previouslySubmittedEventSkipped:v85];
  if (v43)
  {
    uint64_t v50 = v43;
    if ([v43 count])
    {
      id v51 = [v50 count];
      _log( (uint64_t)v51,  (uint64_t)@"Found %lu unsubmitted events in data volume",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)v51);
      -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v50);
    }

    CFRelease(v50);
  }

  else
  {
    _log(0LL, (uint64_t)@"Unable to check for events from the data volume", v44, v45, v46, v47, v48, v49, v81);
  }

  if (LOBYTE(v85[0]))
  {
    _log( v58,  (uint64_t)@"Some events from the data volume were skipped since we had previously attempted to submit them and we are within the retry period",  v59,  v60,  v61,  v62,  v63,  v64,  v81);
    BOOL v65 = LOBYTE(v85[0]) == 0;
  }

  else
  {
    BOOL v65 = 1;
  }

  if (HIBYTE(v85[0]) || !v65)
  {
    _log( v58,  (uint64_t)@"Continuing with submissions but scheduling retry for skipped events",  v59,  v60,  v61,  v62,  v63,  v64,  v81);
    [*(id *)(a1 + 40) _scheduleEventSubmissionRetry];
  }

  uint64_t v66 = dispatch_group_create();
  while (-[NSMutableArray count](v10, "count"))
  {
    id v67 = -[NSMutableArray objectAtIndex:](v10, "objectAtIndex:", 0LL);
    id v68 = [v67 objectForKey:@"Submission URL"];
    v69 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v68);
    if (v69)
    {
      id v76 = v69;
      id v77 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      id v78 = [v67 objectForKey:@"Install Id"];
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3254779904LL;
      v84[2] = __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_2;
      v84[3] = &__block_descriptor_56_e8_32o40o48o_e29_v32__0__NSDictionary_8Q16_B24l;
      v84[4] = v78;
      v84[5] = v68;
      v84[6] = v77;
      -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v84);
      dispatch_group_enter(v66);
      id v79 = *(void **)(a1 + 40);
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3254779904LL;
      v83[2] = __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_446;
      v83[3] = &__block_descriptor_40_e8_32o_e5_v8__0l;
      v83[4] = v66;
      [v79 _submitEvents:v77 toURL:v76 withOptions:v9 completionHandler:v83];
      -[NSMutableArray removeObjectsInArray:](v10, "removeObjectsInArray:", v77);
    }

    else
    {
      _log(0LL, (uint64_t)@"invalid url string %@", v70, v71, v72, v73, v74, v75, (uint64_t)v68);
      -[NSMutableArray removeObjectAtIndex:](v10, "removeObjectAtIndex:", 0LL);
    }
  }

  dispatch_group_wait(v66, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_BYTE *)(a1 + 48)) {

  }
  dispatch_release(v66);
}

id __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_2(id *a1, void *a2)
{
  id result = objc_msgSend(a1[4], "isEqualToString:", objc_msgSend(a2, "objectForKey:", @"Install Id"));
  if ((_DWORD)result)
  {
    id result = objc_msgSend(a1[5], "isEqualToString:", objc_msgSend(a2, "objectForKey:", @"Submission URL"));
    if ((_DWORD)result) {
      return [a1[6] addObject:a2];
    }
  }

  return result;
}

void __56__UMEventRecorder_submitEventsInBackground_withOptions___block_invoke_446(uint64_t a1)
{
}

- (void)submitEvents
{
}

- (void)submitEventsWithUpdateOptions:(id)a3
{
  if (a3)
  {
    id v5 = [a3 objectForKey:@"SocksProxySettings"];
    if (v5)
    {
      id v6 = v5;
      dispatch_block_t v7 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL);
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6, @"ProxySettings");
    }

    else
    {
      dispatch_block_t v7 = 0LL;
    }

    if ([a3 objectForKey:@"forceEventResubmission"]) {
      -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"forceEventResubmission"), "BOOLValue")),  @"forceEventResubmission");
    }
  }

  else
  {
    dispatch_block_t v7 = 0LL;
  }

  -[UMEventRecorder submitEventsInBackground:withOptions:](self, "submitEventsInBackground:withOptions:", 0LL, v7);
}

- (id)_copyUnsubmittedEventsFromDirectory:(id)a3 skipEventsIfPreviouslySubmittedAndWithinBackoffTime:(BOOL)a4 previouslySubmittedEventSkipped:(BOOL *)a5
{
  if (!a3)
  {
    _log( (uint64_t)self,  (uint64_t)@"Invalid directory passed to %s",  0LL,  a4,  (uint64_t)a5,  v5,  v6,  v7,  (uint64_t)"-[UMEventRecorder _copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime :previouslySubmittedEventSkipped:]");
    return 0LL;
  }

  BOOL v9 = a4;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = -[NSFileManager enumeratorAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "enumeratorAtPath:",  [a3 path]);
  if (!v13)
  {
    id v14 = [a3 path];
    _log( (uint64_t)v14,  (uint64_t)@"failed to create enumerator of path: %@",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v14);
  }

  id v21 = -[NSDirectoryEnumerator nextObject](v13, "nextObject");
  if (v21)
  {
    id v22 = v21;
    v107 = v12;
    v104 = a5;
    v105 = self;
    BOOL v106 = v9;
    uint64_t v23 = @"failed to create url to event file";
    uint64_t v24 = @"plist";
    uint64_t v25 = &AMAuthInstallApImg4EncodeRestoreInfo_ptr;
    while (1)
    {
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v22, v26);
      if ((isKindOfClass & 1) == 0) {
        break;
      }
      uint64_t isKindOfClass = (uint64_t)[a3 URLByAppendingPathComponent:v22];
      if (!isKindOfClass)
      {
        v100 = v23;
        goto LABEL_32;
      }

      uint64_t v34 = (void *)isKindOfClass;
      if ((objc_msgSend(objc_msgSend((id)isKindOfClass, "lastPathComponent"), "hasPrefix:", @".") & 1) != 0
        || !objc_msgSend(objc_msgSend(v34, "pathExtension"), "isEqualToString:", v24))
      {
        goto LABEL_33;
      }

      id v35 = [v25[172] dictionaryWithContentsOfURL:v34];
      if (v35)
      {
        uint64_t v42 = v35;
        id v43 = v23;
        uint64_t v44 = v24;
        uint64_t v45 = (uint64_t)[v35 objectForKey:@"Install Id"];
        if (v45
          && (uint64_t v52 = v45,
              uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString),
              uint64_t v45 = objc_opt_isKindOfClass(v52, v53),
              (v45 & 1) != 0))
        {
          uint64_t v54 = (uint64_t)[v42 objectForKey:@"Event Data"];
          if (v54
            && (uint64_t v61 = v54,
                uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSDictionary),
                uint64_t v54 = objc_opt_isKindOfClass(v61, v62),
                (v54 & 1) != 0))
          {
            uint64_t v63 = (uint64_t)[v42 objectForKey:@"Submission URL"];
            if (v63
              && (uint64_t v70 = v63,
                  uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString),
                  uint64_t v63 = objc_opt_isKindOfClass(v70, v71),
                  (v63 & 1) != 0))
            {
              id v72 = [v42 objectForKey:@"Submission Attempts"];
              if (v72
                && (uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSNumber), v74 = objc_opt_isKindOfClass(v72, v73), (v74 & 1) == 0))
              {
                _log( v74,  (uint64_t)@"%@ has bogus submission attempt count",  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)v34);
              }

              else
              {
                uint64_t v81 = (uint64_t)[v42 objectForKey:@"Last Submission Attempt"];
                uint64_t v88 = v81;
                if (!v81
                  || (uint64_t v103 = v81,
                      uint64_t v89 = objc_opt_class(&OBJC_CLASS___NSDate),
                      uint64_t v81 = objc_opt_isKindOfClass(v103, v89),
                      uint64_t v88 = v103,
                      (v81 & 1) != 0))
                {
                  BOOL v90 = v72 != 0LL;
                  if (v88)
                  {
                    BOOL v90 = 0;
                    BOOL v91 = v72 == 0LL;
                  }

                  else
                  {
                    BOOL v91 = 0;
                  }

                  uint64_t v24 = v44;
                  if (!v91 && !v90)
                  {
                    uint64_t v23 = v43;
                    if (v88)
                    {
                      if (v106)
                      {
                        id v92 = -[UMEventRecorder _timeIntervalUntilRetry:](v105, "_timeIntervalUntilRetry:", v42);
                        if (v99 > 0.0)
                        {
                          _log( (uint64_t)v92,  (uint64_t)@"Skipped copying of %@ since it was previoulsy submitted and we are within the retry timeout",  v93,  v94,  v95,  v96,  v97,  v98,  (uint64_t)v34);
                          uint64_t v25 = &AMAuthInstallApImg4EncodeRestoreInfo_ptr;
                          if (v104) {
                            BOOL *v104 = 1;
                          }
                          goto LABEL_33;
                        }
                      }
                    }

                    objc_msgSend(v42, "setObject:forKey:", objc_msgSend(v34, "path"), @"Local Path");
                    -[NSMutableArray addObject:](v107, "addObject:", v42);
                    goto LABEL_41;
                  }

                  _log( v81,  (uint64_t)@"%@ has incomplete last submission attempt data",  v82,  v83,  v84,  v85,  v86,  v87,  (uint64_t)v34);
LABEL_40:
                  uint64_t v23 = v43;
LABEL_41:
                  uint64_t v25 = &AMAuthInstallApImg4EncodeRestoreInfo_ptr;
                  goto LABEL_33;
                }

                _log( v81,  (uint64_t)@"%@ has bogus last submission attempt date",  v82,  v83,  v84,  v85,  v86,  v87,  (uint64_t)v34);
              }
            }

            else
            {
              _log( v63,  (uint64_t)@"%@ has missing or bogus submission URL",  v64,  v65,  v66,  v67,  v68,  v69,  (uint64_t)v34);
            }
          }

          else
          {
            _log(v54, (uint64_t)@"%@ has missing or bogus event data", v55, v56, v57, v58, v59, v60, (uint64_t)v34);
          }
        }

        else
        {
          _log( v45,  (uint64_t)@"%@ has missing or bogus install identifier",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)v34);
        }

        uint64_t v24 = v44;
        goto LABEL_40;
      }

      _log(0LL, (uint64_t)@"unable to load event from %@", v36, v37, v38, v39, v40, v41, (uint64_t)v34);
LABEL_33:
      id v22 = -[NSDirectoryEnumerator nextObject](v13, "nextObject");
      if (!v22) {
        return v107;
      }
    }

    v100 = @"file in enumerator is nil or not a string";
LABEL_32:
    _log(isKindOfClass, (uint64_t)v100, v28, v29, v30, v31, v32, v33, v102);
    goto LABEL_33;
  }

  return v12;
}

- (id)_loadUnsubmittedEvents
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = -[UMEventRecorder _eventDirectory](self, "_eventDirectory");
  id v5 = -[UMEventRecorder _legacyEventDirectory](self, "_legacyEventDirectory");
  _log((uint64_t)v5, (uint64_t)@"Loading unsubmitted events from update volume", v6, v7, v8, v9, v10, v11, v60);
  id v12 = -[UMEventRecorder _copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:]( self,  "_copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:",  v4,  0LL,  0LL);
  if (v12)
  {
    uint64_t v19 = v12;
    if ([v12 count])
    {
      id v26 = [v19 count];
      _log( (uint64_t)v26,  (uint64_t)@"Found %lu unsubmitted events in update volume",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)v26);
      [v3 addObjectsFromArray:v19];
    }

    else
    {
      _log(0LL, (uint64_t)@"No unsubmitted events found in update volume", v20, v21, v22, v23, v24, v25, v61);
    }

    CFRelease(v19);
  }

  else
  {
    _log( 0LL,  (uint64_t)@"Unable to determine state of unsubmitted events(if any) on update volume",  v13,  v14,  v15,  v16,  v17,  v18,  v61);
  }

  id v33 = -[UMEventRecorder _copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:]( self,  "_copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:",  v5,  0LL,  0LL);
  if (v33)
  {
    uint64_t v40 = v33;
    if ([v33 count])
    {
      id v47 = [v40 count];
      _log( (uint64_t)v47,  (uint64_t)@"Found %lu unsubmitted events in data volume",  v48,  v49,  v50,  v51,  v52,  v53,  (uint64_t)v47);
      [v3 addObjectsFromArray:v40];
    }

    else
    {
      _log(0LL, (uint64_t)@"No unsubmitted events found in data volume", v41, v42, v43, v44, v45, v46, v62);
    }

    CFRelease(v40);
  }

  else
  {
    _log( 0LL,  (uint64_t)@"Unable to determine state of unsubmitted events(if any) on data volume",  v34,  v35,  v36,  v37,  v38,  v39,  v62);
  }

  [v3 count];
  logfunction( ",  1,  @"[%s] total numUnsubmittedEvents = %lu\n\n",  v54,  v55,  v56,  v57,  v58,  (char)"-[UMEventRecorder _loadUnsubmittedEvents]"");
  return v3;
}

- (unint64_t)numUnsubmittedEvents
{
  return (unint64_t)objc_msgSend( -[UMEventRecorder _loadUnsubmittedEvents](self, "_loadUnsubmittedEvents"),  "count");
}

- (void)commitMetadataToPersistentStorage
{
}

- (void)commitMetadataToPersistentStorage:(id)a3
{
  if (-[UMEventRecorder uuid](self, "uuid") && -[UMEventRecorder baseServerURL](self, "baseServerURL"))
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setFormatterBehavior:]( v5,  "setFormatterBehavior:",  +[NSNumberFormatter defaultFormatterBehavior](&OBJC_CLASS___NSNumberFormatter, "defaultFormatterBehavior"));
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder uuid](self, "uuid"),  @"ota-uuid");
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder baseServerURL](self, "baseServerURL"),  @"ota-submission-url");
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder targetOSVersion](self, "targetOSVersion"),  @"ota-os-version");
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder _currentOSVersion](self, "_currentOSVersion"),  @"ota-original-os-version");
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder _currentBaseOSVersion](self, "_currentBaseOSVersion"),  @"ota-original-base-os-version");
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[NSNumberFormatter stringFromNumber:]( v5,  "stringFromNumber:",  -[UMEventRecorder installTonight](self, "installTonight")),  @"ota-install-tonight");
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder context](self, "context"),  @"ota-context");
    if (-[UMEventRecorder brainVersion](self, "brainVersion")) {
      -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  -[UMEventRecorder brainVersion](self, "brainVersion"),  @"ota-brain-version");
    }
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  [a3 valueForKey:@"controllerVersion"],  @"ota-controllerVersion");
    if ([a3 valueForKey:@"updateType"]) {
      -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  [a3 valueForKey:@"updateType"],  @"ota-updateType");
    }
    -[UMEventRecorder _setNvramValue:forKey:]( self,  "_setNvramValue:forKey:",  @"IONVRAM-FORCESYNCNOW-PROPERTY",  @"IONVRAM-FORCESYNCNOW-PROPERTY");
  }

- (id)_getDeviceModel
{
  return -[UMEventRecorder _getGestaltString:](self, "_getGestaltString:", @"HWModelStr");
}

- (NSString)installType
{
  return self->_installType;
}

- (void)setInstallType:(id)a3
{
}

- (UMEventSubmitter)submitter
{
  return self->_submitter;
}

- (void)setSubmitter:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)baseServerURL
{
  return self->_baseServerURL;
}

- (void)setBaseServerURL:(id)a3
{
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (void)setTargetOSVersion:(id)a3
{
}

- (NSNumber)installTonight
{
  return self->_installTonight;
}

- (void)setInstallTonight:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)submissionPending
{
  return self->_submissionPending;
}

- (void)setSubmissionPending:(BOOL)a3
{
  self->_submissionPending = a3;
}

- (NSString)systemMountPoint
{
  return self->_systemMountPoint;
}

- (void)setSystemMountPoint:(id)a3
{
}

- (NSString)dataMountPoint
{
  return self->_dataMountPoint;
}

- (void)setDataMountPoint:(id)a3
{
}

- (NSString)updateMountPoint
{
  return self->_updateMountPoint;
}

- (void)setUpdateMountPoint:(id)a3
{
}

- (NSString)nvramPath
{
  return self->_nvramPath;
}

- (void)setNvramPath:(id)a3
{
}

- (NSDictionary)eventAttributes
{
  return self->_eventAttributes;
}

- (void)setEventAttributes:(id)a3
{
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (void)setBrainVersion:(id)a3
{
}

- (NSDictionary)nvramDict
{
  return self->_nvramDict;
}

- (void)setNvramDict:(id)a3
{
}

- (NSMutableDictionary)attributeDict
{
  return self->_attributeDict;
}

- (void)setAttributeDict:(id)a3
{
}

- (NSMutableArray)droppedEvents
{
  return self->_droppedEvents;
}

- (void)setDroppedEvents:(id)a3
{
}

@end