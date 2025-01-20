@interface com_apple_AVConference_DiagnosticExtension
+ (id)defaultAVConferenceCachePath;
+ (id)defaultCrashReportPath;
+ (id)defaultRTCReportingPath;
+ (id)defaultSpindumpPath;
- (BOOL)copyFile:(id)a3 withPredicate:(id)a4 toSaveDirectory:(id)a5;
- (id)attachmentList;
- (int)copyDirectory:(id)a3 withPredicate:(id)a4 toSubDirectory:(id)a5;
- (int)copyDumps;
- (int)copyRTCReporting;
- (int)copySpindumps;
- (int)copyStackshotsAndCrashes;
@end

@implementation com_apple_AVConference_DiagnosticExtension

+ (id)defaultCrashReportPath
{
  return @"/private/var/mobile/Library/Logs/CrashReporter/";
}

+ (id)defaultSpindumpPath
{
  return @"/var/mobile/Library/Logs/CrashReporter/";
}

+ (id)defaultAVConferenceCachePath
{
  return @"/var/mobile/Library/Caches/com.apple.VideoConference/logs";
}

+ (id)defaultRTCReportingPath
{
  return @"/var/mobile/Library/Logs/RTCReporting/";
}

- (int)copyDirectory:(id)a3 withPredicate:(id)a4 toSubDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_temporaryDirectoryURL, "stringByAppendingString:", v10));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v38 = [v12 cStringUsingEncoding:4];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] creating new save directory %s",  buf,  0xCu);
  }

  id v30 = 0LL;
  [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v13 = v30;
  if (!v13)
  {
LABEL_8:
    id v28 = v10;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v18 = [v8 cStringUsingEncoding:4];
      *(_DWORD *)buf = 136315138;
      id v38 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] copying files from %s",  buf,  0xCu);
    }

    id v19 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8, v28));
    v36[0] = NSURLNameKey;
    v36[1] = NSURLIsDirectoryKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( [v11 enumeratorAtURL:v20 includingPropertiesForKeys:v21 options:4 errorHandler:&__block_literal_global]);

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v14 = v22;
    id v23 = [v14 countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v23)
    {
      id v24 = v23;
      int v17 = 0;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v14);
          }
          v17 += -[com_apple_AVConference_DiagnosticExtension copyFile:withPredicate:toSaveDirectory:]( self,  "copyFile:withPredicate:toSaveDirectory:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)i),  v9,  v12);
        }

        id v24 = [v14 countByEnumeratingWithState:&v32 objects:v31 count:16];
      }

      while (v24);
    }

    else
    {
      int v17 = 0;
    }

    id v8 = v19;
    id v10 = v29;
  }

  else
  {
    id v14 = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v15 = objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
      id v16 = [v15 cStringUsingEncoding:4];
      *(_DWORD *)buf = 136315138;
      id v38 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] error creating save directory: %s",  buf,  0xCu);
    }

    int v17 = 0;
  }

  return v17;
}

- (BOOL)copyFile:(id)a3 withPredicate:(id)a4 toSaveDirectory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v28 = 0LL;
  [v7 getResourceValue:&v28 forKey:NSURLIsDirectoryKey error:0];
  id v10 = v28;
  if (([v10 BOOLValue] & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -604800.0));
    id v27 = 0LL;
    [v7 getResourceValue:&v27 forKey:NSURLContentModificationDateKey error:0];
    id v13 = v27;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
    unsigned int v15 = [v8 evaluateWithObject:v14];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 earlierDate:v13]);
    if (v15 && v16 == v12)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingFormat:@"/%@", v17]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v26 = 0LL;
      unsigned int v21 = [v20 copyItemAtURL:v7 toURL:v19 error:&v26];
      id v22 = v26;

      if (!v21)
      {

        BOOL v11 = 1;
        goto LABEL_14;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[com_apple_AVConference_DiagnosticExtension copyFile:withPredicate:toSaveDirectory:].cold.1(v22);
      }
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
LABEL_12:
        BOOL v11 = 0;
LABEL_14:

        goto LABEL_15;
      }

      BOOL v23 = v16 == v12;
      id v22 = objc_claimAutoreleasedReturnValue([v7 absoluteString]);
      id v24 = [v22 cStringUsingEncoding:4];
      *(_DWORD *)buf = 67109634;
      unsigned int v30 = v15;
      __int16 v31 = 1024;
      BOOL v32 = v23;
      __int16 v33 = 2080;
      id v34 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] skipping file copy (predicateMatch=%d, isNotTooOld=%d) for path=%s",  buf,  0x18u);
    }

    goto LABEL_12;
  }

  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (int)copyStackshotsAndCrashes
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] Beginning stackshot and crash file copy process",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[com_apple_AVConference_DiagnosticExtension defaultCrashReportPath]( &OBJC_CLASS___com_apple_AVConference_DiagnosticExtension,  "defaultCrashReportPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF MATCHES[c] %@",  @".*(audiomxd|captured|mediaserver|avconference|stacks-).*"));
  unsigned int v5 = -[com_apple_AVConference_DiagnosticExtension copyDirectory:withPredicate:toSubDirectory:]( self,  "copyDirectory:withPredicate:toSubDirectory:",  v3,  v4,  @"/CrashesAndSpins");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[com_apple_AVConference_DiagnosticExtension defaultCrashReportPath]( &OBJC_CLASS___com_apple_AVConference_DiagnosticExtension,  "defaultCrashReportPath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"Retired/"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF MATCHES[c] %@",  @".*(audiomxd|captured|mediaserver|avconference|stacks-).*"));
  unsigned int v9 = -[com_apple_AVConference_DiagnosticExtension copyDirectory:withPredicate:toSubDirectory:]( self,  "copyDirectory:withPredicate:toSubDirectory:",  v7,  v8,  @"/CrashesAndSpins/Retired");

  return v9 + v5;
}

- (int)copySpindumps
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] Beginning Spindump and Tailspin file copy process",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[com_apple_AVConference_DiagnosticExtension defaultSpindumpPath]( &OBJC_CLASS___com_apple_AVConference_DiagnosticExtension,  "defaultSpindumpPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF MATCHES[c] %@",  @".*(audiomxd|captured|mediaserver|avconference).*"));
  int v5 = -[com_apple_AVConference_DiagnosticExtension copyDirectory:withPredicate:toSubDirectory:]( self,  "copyDirectory:withPredicate:toSubDirectory:",  v3,  v4,  @"/CrashesAndSpins");

  return v5;
}

- (int)copyDumps
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] Beginning dump file copy process",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[com_apple_AVConference_DiagnosticExtension defaultAVConferenceCachePath]( &OBJC_CLASS___com_apple_AVConference_DiagnosticExtension,  "defaultAVConferenceCachePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF CONTAINS[c] %@",  @"dump"));
  int v5 = -[com_apple_AVConference_DiagnosticExtension copyDirectory:withPredicate:toSubDirectory:]( self,  "copyDirectory:withPredicate:toSubDirectory:",  v3,  v4,  @"/Dumps");

  return v5;
}

- (int)copyRTCReporting
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] Beginning RTCReporting file copy process",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[com_apple_AVConference_DiagnosticExtension defaultRTCReportingPath]( &OBJC_CLASS___com_apple_AVConference_DiagnosticExtension,  "defaultRTCReportingPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF LIKE %@",  @"*"));
  int v5 = -[com_apple_AVConference_DiagnosticExtension copyDirectory:withPredicate:toSubDirectory:]( self,  "copyDirectory:withPredicate:toSubDirectory:",  v3,  v4,  @"/RTCReporting");

  return v5;
}

- (id)attachmentList
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___NSUUID, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  int v5 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/private/var/tmp/avconference/%@/AVCDiagnosticExtensionLogs",  v4));
  temporaryDirectoryURL = self->_temporaryDirectoryURL;
  self->_temporaryDirectoryURL = v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v7 = -[NSString cStringUsingEncoding:](self->_temporaryDirectoryURL, "cStringUsingEncoding:", 4LL);
    *(_DWORD *)buf = 136315138;
    unsigned int v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] beginning to copy AVConference DiagnosticExtension files to %s",  buf,  0xCu);
  }

  id v8 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"file copy results - ");
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @"stackshots/crashes=%d ",  -[com_apple_AVConference_DiagnosticExtension copyStackshotsAndCrashes](self, "copyStackshotsAndCrashes"));
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @"dumps=%d ",  -[com_apple_AVConference_DiagnosticExtension copyDumps](self, "copyDumps"));
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @"rtcReports=%d ",  -[com_apple_AVConference_DiagnosticExtension copyRTCReporting](self, "copyRTCReporting"));
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @"spins=%d ",  -[com_apple_AVConference_DiagnosticExtension copySpindumps](self, "copySpindumps"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  self->_temporaryDirectoryURL));
  [v9 setDisplayName:@"AVCDiagnosticExtensionLogs"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v10 = (const char *)-[NSMutableString cStringUsingEncoding:]( v8, "cStringUsingEncoding:", 4LL);
    *(_DWORD *)buf = 136315138;
    unsigned int v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[AVCDiagnosticExtension] finishing AVConference DiagnosticExtension file copy process -> %s",  buf,  0xCu);
  }

  id v13 = v9;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  return v11;
}

- (void).cxx_destruct
{
}

- (void)copyFile:(void *)a1 withPredicate:toSaveDirectory:.cold.1(void *a1)
{
  id v1 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v2 = 136315138;
  id v3 = [v1 cStringUsingEncoding:4];
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[AVCDiagnosticExtension] error copying file! %s",  (uint8_t *)&v2,  0xCu);
}

@end