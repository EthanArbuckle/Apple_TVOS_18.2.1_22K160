@interface TrustdFileHelper
- (BOOL)allowTrustdToReadFilesForMigration:(id *)a3;
- (BOOL)changeOwnerOfValidFile:(id)a3 error:(id *)a4;
- (BOOL)changePermissionsOfKeychainDirectoryFile:(id)a3 error:(id *)a4;
- (BOOL)fixTrustSettingsPermissions:(id *)a3;
- (BOOL)fixValidPermissions:(id *)a3;
- (void)allowTrustdToWriteAnalyticsFiles;
- (void)deleteOldFiles;
- (void)deleteSupplementalsAssetsDir;
- (void)deleteSystemDbFiles:(__CFString *)a3;
- (void)fixFiles:(id)a3;
@end

@implementation TrustdFileHelper

- (BOOL)changeOwnerOfValidFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 1;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_10000FF74;
  v17 = sub_10000FF84;
  id v18 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100010258;
  v12[3] = &unk_1000189C0;
  v12[4] = &v13;
  v12[5] = &v19;
  v6 = v12;
  if (qword_10001DBC0 != -1)
  {
    dispatch_once(&qword_10001DBC0, &stru_100018C20);
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    v7 = @"trustd/";
    goto LABEL_6;
  }

  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"trustd/%@",  v5));
LABEL_6:
  v8 = sub_100010C4C(@"private/var/protected/", (uint64_t)v7);

  sub_100010D34(v8, (uint64_t)v6);
  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    if (*a4)
    {
      int v9 = 0;
    }

    else
    {
      *a4 = (id) v14[5];
      int v9 = *((unsigned __int8 *)v20 + 24);
    }
  }

  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)fixValidPermissions:(id *)a3
{
  if (-[TrustdFileHelper changeOwnerOfValidFile:error:]( self,  "changeOwnerOfValidFile:error:",  @"valid.sqlite3",  a3)
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-shm",  @"valid.sqlite3")),  v6 = -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", v5, a3),  v5,  v6)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-wal",  @"valid.sqlite3")),  unsigned int v8 = -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", v7, a3),  v7,  v8))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-journal",  @"valid.sqlite3"));
    unsigned __int8 v10 = -[TrustdFileHelper changeOwnerOfValidFile:error:](self, "changeOwnerOfValidFile:error:", v9, a3);
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return -[TrustdFileHelper changeOwnerOfValidFile:error:]( self,  "changeOwnerOfValidFile:error:",  @".valid_replace",  a3) & v10;
}

- (BOOL)fixTrustSettingsPermissions:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v5 = 1;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/Library/Security/Trust Settings",  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:0 errorHandler:&stru_100018A00]);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    v29 = a3;
    v30 = v7;
    v31 = v6;
    v32 = v4;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v37;
    char v5 = 1;
    v33 = v8;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v34 = 0LL;
        id v35 = 0LL;
        unsigned int v15 = [v14 getResourceValue:&v35 forKey:NSURLIsDirectoryKey error:&v34];
        id v16 = v35;
        id v17 = v34;

        if (v15
          && ([v16 BOOLValue] & 1) == 0
          && (id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]),
              unsigned int v19 = [v18 isEqualToString:@"plist"],
              v18,
              v19)
          && (v20 = (const char *)[v14 fileSystemRepresentation],
              chmod(v20, 0x1A4u)))
        {
          int v21 = *__error();
          NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
          char v22 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to change permissions of %s: %s",  v20,  strerror(v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v45 = v23;
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
          id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v21,  v24));

          v25 = sub_100010B50("SecError");
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = strerror(v21);
            *(_DWORD *)buf = 136315394;
            v41 = v20;
            __int16 v42 = 2080;
            v43 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions of %s: %s",  buf,  0x16u);
          }

          char v5 = 0;
          unsigned int v8 = v33;
        }

        else
        {
          id v11 = v17;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }

    while (v10);
    if ((v29 == 0LL) | v5 & 1)
    {
      unsigned int v6 = v31;
      v4 = v32;
      v7 = v30;
    }

    else
    {
      unsigned int v6 = v31;
      v4 = v32;
      v7 = v30;
      if (*v29)
      {
        char v5 = 0;
      }

      else
      {
        id v11 = v11;
        char v5 = 0;
        id *v29 = v11;
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v5 & 1;
}

- (BOOL)changePermissionsOfKeychainDirectoryFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_10000FF74;
  uint64_t v13 = sub_10000FF84;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FF8C;
  v8[3] = &unk_1000189C0;
  v8[4] = &v9;
  v8[5] = &v15;
  sub_100010DD0((uint64_t)v5, (uint64_t)v8);
  if (a4 && !*a4) {
    *a4 = (id) v10[5];
  }
  char v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)allowTrustdToReadFilesForMigration:(id *)a3
{
  unsigned __int8 v5 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:]( self,  "changePermissionsOfKeychainDirectoryFile:error:",  @"TrustStore.sqlite3",  a3);
  unsigned __int8 v6 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:]( self,  "changePermissionsOfKeychainDirectoryFile:error:",  @"com.apple.security.exception_reset_counter.plist",  a3);
  unsigned __int8 v7 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:]( self,  "changePermissionsOfKeychainDirectoryFile:error:",  @"CTExceptions.plist",  a3);
  unsigned __int8 v8 = -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:]( self,  "changePermissionsOfKeychainDirectoryFile:error:",  @"CARevocation.plist",  a3);
  return -[TrustdFileHelper changePermissionsOfKeychainDirectoryFile:error:]( self,  "changePermissionsOfKeychainDirectoryFile:error:",  @"TransparentConnectionPins.plist",  a3) & v8 & v7 & v6 & v5;
}

- (void)allowTrustdToWriteAnalyticsFiles
{
}

- (void)deleteSystemDbFiles:(__CFString *)a3
{
  v4 = sub_100010C4C(@"Library/Keychains", (uint64_t)a3);
  sub_100010D34(v4, (uint64_t)&stru_100018A40);
  CFStringRef v5 = CFStringCreateWithFormat(0LL, 0LL, @"%@-shm", a3);
  unsigned __int8 v6 = sub_100010C4C(@"Library/Keychains", (uint64_t)v5);
  sub_100010D34(v6, (uint64_t)&stru_100018A60);
  if (v5) {
    CFRelease(v5);
  }
  CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"%@-wal", a3);
  unsigned __int8 v8 = sub_100010C4C(@"Library/Keychains", (uint64_t)v7);
  sub_100010D34(v8, (uint64_t)&stru_100018A80);
  if (v7) {
    CFRelease(v7);
  }
  CFStringRef v9 = CFStringCreateWithFormat(0LL, 0LL, @"%@-journal", a3);
  id v10 = sub_100010C4C(@"Library/Keychains", (uint64_t)v9);
  sub_100010D34(v10, (uint64_t)&stru_100018AA0);
  if (v9) {
    CFRelease(v9);
  }
}

- (void)deleteSupplementalsAssetsDir
{
  v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"SupplementalsAssets/OTAPKIContext.plist");
  sub_100010D34(v2, (uint64_t)&stru_100018AC0);
  v3 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"SupplementalsAssets/TrustedCTLogs.plist");
  sub_100010D34(v3, (uint64_t)&stru_100018AE0);
  v4 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"SupplementalsAssets/TrustedCTLogs_nonTLS.plist");
  sub_100010D34(v4, (uint64_t)&stru_100018B00);
  CFStringRef v5 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"SupplementalsAssets/AnalyticsSamplingRates.plist");
  sub_100010D34(v5, (uint64_t)&stru_100018B20);
  unsigned __int8 v6 = sub_100010C4C( @"Library/Keychains",  (uint64_t)@"SupplementalsAssets/AppleCertificateAuthorities.plist");
  sub_100010D34(v6, (uint64_t)&stru_100018B40);
  CFStringRef v7 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"SupplementalsAssets");
  sub_100010D34(v7, (uint64_t)&stru_100018B60);
}

- (void)deleteOldFiles
{
  v3 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"crls");
  sub_100010D34(v3, (uint64_t)&stru_100018B80);
  -[TrustdFileHelper deleteSystemDbFiles:](self, "deleteSystemDbFiles:", @"pinningrules.sqlite3");
  -[TrustdFileHelper deleteSupplementalsAssetsDir](self, "deleteSupplementalsAssetsDir");
  sub_100010DD0((uint64_t)@"caissuercache.sqlite3", (uint64_t)&stru_100018BA0);
  -[TrustdFileHelper deleteSystemDbFiles:](self, "deleteSystemDbFiles:", @"ocspcache.sqlite3");
  sub_100010DD0((uint64_t)@"PriorMitmRoots.plist", (uint64_t)&stru_100018BC0);
}

- (void)fixFiles:(id)a3
{
  v4 = (void (**)(id, BOOL, id))a3;
  -[TrustdFileHelper deleteOldFiles](self, "deleteOldFiles");
  -[TrustdFileHelper allowTrustdToWriteAnalyticsFiles](self, "allowTrustdToWriteAnalyticsFiles");
  id v10 = 0LL;
  BOOL v5 = -[TrustdFileHelper allowTrustdToReadFilesForMigration:](self, "allowTrustdToReadFilesForMigration:", &v10);
  id v6 = v10;
  if (!v5)
  {
    CFStringRef v7 = sub_100010B50("SecError");
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions so trustd can read files for migration",  v9,  2u);
    }
  }

  v4[2](v4, v5, v6);
}

@end