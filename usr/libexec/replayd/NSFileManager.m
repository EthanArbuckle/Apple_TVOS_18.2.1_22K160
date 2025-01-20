@interface NSFileManager
- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording;
- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording;
- (id)_srGetCreationDateForFile:(id)a3;
- (id)_srTempPath;
- (id)dateSuffix;
- (id)outputPath:(int)a3 bundleID:(id)a4;
- (id)trimmedOutputPath:(id)a3;
- (int64_t)_srDeleteAllAndSystemTempFiles;
- (int64_t)_srDeleteAllTempFiles;
- (int64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:(double)a3 deleteSystemFiles:(BOOL)a4;
- (int64_t)_srSizeOfTempDir:(id *)a3;
- (unint64_t)_srDeviceFreeDiskSpace;
- (void)_srDeleteFilesWithPrefix:(id)a3;
- (void)_srMoveFileFromURL:(id)a3 toURL:(id)a4 completion:(id)a5;
- (void)_srRemoveFile:(id)a3 completion:(id)a4;
- (void)_srSetupTempDirectory;
@end

@implementation NSFileManager

- (id)_srTempPath
{
  return [@"/private/var/mobile/Library/ReplayKit/" stringByExpandingTildeInPath];
}

- (void)_srSetupTempDirectory
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "_srSetupTempDirectory",  buf,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  unsigned __int8 v4 = -[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:", v3, 0LL);

  if ((v4 & 1) != 0)
  {
    -[NSFileManager _srDeleteAllAndSystemTempFiles](self, "_srDeleteAllAndSystemTempFiles");
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
    id v7 = 0LL;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v5,  0LL,  0LL,  &v7);
    id v6 = v7;

    if (v6)
    {
      NSLog(@"error: %@", v6);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100041DC4();
      }
    }
  }

- (id)dateSuffix
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"MM-dd-yyyy HH:mm:ss");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@":" withString:@"-"]);

  return v5;
}

- (id)outputPath:(int)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager dateSuffix](self, "dateSuffix"));
  if (a3 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _srTempPath]);
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/ClipRecording_%@.mp4",  v9,  v7);
  }

  else
  {
    if (a3 != 2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _srTempPath]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v6));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@_%@.mp4",  v9,  v12,  v7));

      goto LABEL_7;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _srTempPath]);
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/ScreenRecording_%@.mp4",  v9,  v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_7:

  return v11;
}

- (id)trimmedOutputPath:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _srTempPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedAppNameFromBundleID:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedAppNameFromBundleID:",  v3));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@_trimmed.mp4",  v5,  v6));
  return v7;
}

- (int64_t)_srSizeOfTempDir:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfItemAtPath:v6 error:a3]);

  id v8 = [v7 fileSize];
  return (int64_t)v8;
}

- (int64_t)_srDeleteAllTempFiles
{
  return -[NSFileManager _srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:]( self,  "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:",  0LL,  0.0);
}

- (int64_t)_srDeleteAllAndSystemTempFiles
{
  return -[NSFileManager _srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:]( self,  "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:",  1LL,  0.0);
}

- (int64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:(double)a3 deleteSystemFiles:(BOOL)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v42 = (int)a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "_srDeleteFilesOlderThanTimeToLiveInSeconds: %i",  buf,  8u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  id v39 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 contentsOfDirectoryAtPath:v8 error:&v39]);
  id v10 = v39;

  sub_100005598(v11, v10);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    int64_t v32 = 0LL;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        if (a4
          || ([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) containsString:@"ScreenRecording_"] & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v17,  v16));

          id v34 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager attributesOfItemAtPath:error:]( self,  "attributesOfItemAtPath:error:",  v18,  &v34));
          id v20 = v34;

          sub_100005598(v21, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v19 fileModificationDate]);
          [v22 timeIntervalSinceDate:v23];
          double v25 = v24;

          id v26 = [v19 fileSize];
          if (a3 == 0.0 || v25 > a3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "deleting old file",  buf,  2u);
            }

            id v33 = v20;
            -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", v18, &v33);
            id v27 = v33;

            sub_100005598(v28, v27);
            if (v27) {
              id v29 = 0LL;
            }
            else {
              id v29 = v26;
            }
            v32 += (int64_t)v29;
            id v20 = v27;
          }

          id v10 = v20;
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v13);
  }

  else
  {
    int64_t v32 = 0LL;
  }

  return v32;
}

- (void)_srRemoveFile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000056B8;
  block[3] = &unk_100070C58;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_srMoveFileFromURL:(id)a3 toURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100005854;
  v16[3] = &unk_100070C80;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)_srDeleteFilesWithPrefix:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000059AC;
  v8[3] = &unk_100070CA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)_srGetCreationDateForFile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v5 error:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:NSFileCreationDate]);

  return v7;
}

- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording
{
  return -[NSFileManager _srDeviceFreeDiskSpace](self, "_srDeviceFreeDiskSpace") > 0x5F5E100;
}

- (unint64_t)_srDeviceFreeDiskSpace
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfFileSystemForPath:v4 error:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSFileSystemFreeSize]);
  id v7 = [v6 unsignedLongValue];

  return (unint64_t)v7;
}

- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording
{
  unint64_t v3 = 2 * -[NSFileManager _srSizeOfTempDir:](self, "_srSizeOfTempDir:", 0LL) + 20000000;
  return v3 < -[NSFileManager _srDeviceFreeDiskSpace](self, "_srDeviceFreeDiskSpace");
}

@end