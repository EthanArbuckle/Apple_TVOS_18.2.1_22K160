@interface BluetoothABCDE
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4;
@end

@implementation BluetoothABCDE

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
  if ([v4 isEqualToString:@"com.apple.symptomsd"])
  {
    v53 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "BluetoothABCDE: DiagnosticExtension for AutoBugCapture launched.",  buf,  2u);
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"bluetoothd-hci.*.pklg",  1LL,  0LL));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"bluetoothd-FWCOREDUMP.*.log",  1LL,  0LL));
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"bluetoothd-UART.*.log",  1LL,  0LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/Bluetooth"));
    v51 = (void *)v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothABCDE filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v9,  v6,  0LL));
    [v8 addObjectsFromArray:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/Bluetooth"));
    v50 = (void *)v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothABCDE filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v11,  v7,  0LL));
    id v59 = v8;
    [v8 addObjectsFromArray:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/Bluetooth"));
    v52 = (void *)v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothABCDE filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v13,  v5,  0LL));

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothABCDE getFilesAtPathSortedByModificationDate:numberOfFirstNFiles:]( self,  "getFilesAtPathSortedByModificationDate:numberOfFirstNFiles:",  v14,  2LL));
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 filesize]);
          id v23 = [v22 unsignedIntegerValue];
        }

        id v18 = [v16 countByEnumeratingWithState:&v69 objects:v78 count:16];
      }

      while (v18);
    }

    v49 = v16;

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Logs/CrashReporter/CoreCapture/BT"));
    v77[0] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/CoreCapture/BT"));
    v77[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/log/CoreCapture/com.apple.driver.AppleMarconiBTDriver"));
    v77[2] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT"));
    v77[3] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT-sysdiagnose"));
    v77[4] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 5LL));

    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id obj = v29;
    id v56 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v56)
    {
      uint64_t v55 = *(void *)v66;
      do
      {
        uint64_t v30 = 0LL;
        do
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v57 = v30;
          uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v49));
          v75[0] = NSURLNameKey;
          v75[1] = NSURLIsDirectoryKey;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 2LL));
          v34 = (void *)objc_claimAutoreleasedReturnValue( [v32 enumeratorAtURL:v31 includingPropertiesForKeys:v33 options:5 errorHandler:0]);

          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          id v58 = v34;
          id v35 = [v58 countByEnumeratingWithState:&v61 objects:v74 count:16];
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = *(void *)v62;
            do
            {
              for (j = 0LL; j != v36; j = (char *)j + 1)
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v58);
                }
                v39 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)j);
                id v60 = 0LL;
                [v39 getResourceValue:&v60 forKey:NSURLNameKey error:0];
                id v40 = v60;
                v41 = (void *)objc_claimAutoreleasedReturnValue([v39 lastPathComponent]);
                v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                v43 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
                v44 = (void *)objc_claimAutoreleasedReturnValue([v42 attributesOfItemAtPath:v43 error:0]);

                v45 = (void *)objc_claimAutoreleasedReturnValue([v44 fileModificationDate]);
                v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v44 fileSize]));
                v47 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:withDisplayName:modificationDate:andFilesize:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:withDisplayName:modificationDate:andFilesize:",  v39,  v41,  v45,  v46));

                [v59 addObject:v47];
              }

              id v36 = [v58 countByEnumeratingWithState:&v61 objects:v74 count:16];
            }

            while (v36);
          }

          uint64_t v30 = v57 + 1;
        }

        while ((id)(v57 + 1) != v56);
        id v56 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      }

      while (v56);
    }

    v4 = v53;
  }

  else
  {
    id v59 = &__NSArray0__struct;
  }

  return v59;
}

- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 sortedArrayUsingComparator:&stru_100004130]);
  id v6 = [v5 count];
  else {
    id v7 = v6;
  }
  if (v7) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 subarrayWithRange:0]);
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  v9 = (void *)v8;

  return v9;
}

@end