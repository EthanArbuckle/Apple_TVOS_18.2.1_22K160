@interface BluetoothPacketLoggerExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4;
@end

@implementation BluetoothPacketLoggerExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v41 = a3;
  char v68 = 0;
  int v67 = -1;
  sub_100002FF8(buf, "HCITraces");
  sub_100002FF8(__p, "UnlimitedHCIFileSize");
  getBoolValue((uint64_t *)buf, (uint64_t *)__p, &v68);
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  if (v66 < 0) {
    operator delete(*(void **)buf);
  }
  sub_100002FF8(buf, "HCITraces");
  sub_100002FF8(__p, "MaxFileSize");
  int IntValue = getIntValue((uint64_t *)buf, (uint64_t *)__p, &v67);
  if (v64 < 0) {
    operator delete(__p[0]);
  }
  if (v66 < 0) {
    operator delete(*(void **)buf);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
  if (!v68 || (v67 > 209715200 ? (int v5 = IntValue) : (int v5 = 0), v5 == 1))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ERROR: Extension launch failed. Use extension only when UnlimitedHCIFileSize is enabled or maxFileSize is less than 200MB.",  buf,  2u);
    }

    goto LABEL_43;
  }

  if (![v40 isEqualToString:@"com.apple.taptoradard"])
  {
LABEL_43:
    id v49 = &__NSArray0__struct;
    goto LABEL_44;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "BluetoothPacketLoggerExtension: DiagnosticExtension for PacketLogger launched.",  buf,  2u);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"bluetoothd-hci.*.pklg",  1LL,  0LL));
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"bluetoothd-FWCOREDUMP.*.log",  1LL,  0LL));
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"bluetoothd-UART.*.log",  1LL,  0LL));
  id v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/Bluetooth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothPacketLoggerExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v6,  v38,  0LL));
  [v49 addObjectsFromArray:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/Bluetooth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothPacketLoggerExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v8,  v39,  0LL));
  [v49 addObjectsFromArray:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/Bluetooth"));
  id obja = (id)objc_claimAutoreleasedReturnValue( -[BluetoothPacketLoggerExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v10,  v37,  0LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothPacketLoggerExtension getFilesAtPathSortedByModificationDate:numberOfFirstNFiles:]( self,  "getFilesAtPathSortedByModificationDate:numberOfFirstNFiles:",  obja,  2LL));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 filesize]);
        BOOL v17 = (unint64_t)[v16 unsignedIntegerValue] < 0xC800001;

        if (v17) {
          [v49 addObject:v15];
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v59 objects:v73 count:16];
    }

    while (v12);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Logs/CrashReporter/CoreCapture/BT"));
  v72 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v42 = v19;
  id v44 = [v42 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v56;
    do
    {
      for (j = 0LL; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v42);
        }
        uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v70[0] = NSURLNameKey;
        v70[1] = NSURLIsDirectoryKey;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 2LL));
        v23 = (void *)objc_claimAutoreleasedReturnValue( [v21 enumeratorAtURL:v20 includingPropertiesForKeys:v22 options:5 errorHandler:0]);

        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v48 = v23;
        id v24 = [v48 countByEnumeratingWithState:&v51 objects:v69 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v52;
          do
          {
            for (k = 0LL; k != v24; k = (char *)k + 1)
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v48);
              }
              v27 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)k);
              id v50 = 0LL;
              [v27 getResourceValue:&v50 forKey:NSURLNameKey error:0];
              id v28 = v50;
              v29 = (void *)objc_claimAutoreleasedReturnValue([v27 lastPathComponent]);
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              v31 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
              v32 = (void *)objc_claimAutoreleasedReturnValue([v30 attributesOfItemAtPath:v31 error:0]);

              v33 = (void *)objc_claimAutoreleasedReturnValue([v32 fileModificationDate]);
              v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v32 fileSize]));
              v35 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:withDisplayName:modificationDate:andFilesize:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:withDisplayName:modificationDate:andFilesize:",  v27,  v29,  v33,  v34));

              [v49 addObject:v35];
            }

            id v24 = [v48 countByEnumeratingWithState:&v51 objects:v69 count:16];
          }

          while (v24);
        }
      }

      id v44 = [v42 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }

    while (v44);
  }

LABEL_44:
  return v49;
}

- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a3 sortedArrayUsingComparator:&stru_1000041D8]);
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