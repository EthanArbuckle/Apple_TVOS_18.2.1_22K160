@interface MTIDCloudKitLocalDB
- (BOOL)deleteIfExists:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordWithID:(id)a3 error:(id *)a4;
- (BOOL)fileExists:(id)a3;
- (BOOL)needsFetchRecords;
- (BOOL)setUserRecordIDName:(id)a3;
- (BOOL)writeData:(id)a3 forName:(id)a4 error:(id *)a5;
- (BOOL)writeRecord:(id)a3 error:(id *)a4;
- (BOOL)zoneCreated;
- (CKRecordZoneID)recordZoneID;
- (MTIDCloudKitLocalDB)initWithContainerIdentifier:(id)a3 recordType:(id)a4 recordZoneID:(id)a5;
- (MTIDCloudKitLocalDBDelegate)delegate;
- (NSString)recordType;
- (NSURL)pathURL;
- (id)allRecords;
- (id)dataForName:(id)a3 error:(id *)a4;
- (id)decodeRecordFromData:(id)a3 recordID:(id)a4 isSynchronized:(BOOL)a5;
- (id)encodeRecord:(id)a3;
- (id)pendingRecordIDs;
- (id)recordWithID:(id)a3 error:(id *)a4;
- (id)syncStatusCode;
- (id)userRecordIDName;
- (void)clearData;
- (void)setDelegate:(id)a3;
- (void)setNeedsFetchRecords:(BOOL)a3;
- (void)setPathURL:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setRecordZoneID:(id)a3;
- (void)setSyncStatusCode:(id)a3;
- (void)setZoneCreated:(BOOL)a3;
@end

@implementation MTIDCloudKitLocalDB

- (MTIDCloudKitLocalDB)initWithContainerIdentifier:(id)a3 recordType:(id)a4 recordZoneID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___MTIDCloudKitLocalDB;
  v11 = -[MTIDCloudKitLocalDB init](&v40, "init");
  v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  -[MTIDCloudKitLocalDB setRecordType:](v11, "setRecordType:", v9);
  -[MTIDCloudKitLocalDB setRecordZoneID:](v12, "setRecordZoneID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTFrameworkEnvironment sharedEnvironment](&OBJC_CLASS___MTFrameworkEnvironment, "sharedEnvironment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localDataPath]);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:@"MetricsIdentifiers"]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:v8]);
  if (v18)
  {
    id v39 = 0LL;
    unsigned __int8 v19 = [v13 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v20 = v39;
    v21 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_7:
      -[MTIDCloudKitLocalDB setPathURL:](v12, "setPathURL:", v18);

LABEL_8:
      return v12;
    }

    v37 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    unsigned int v23 = [v13 fileExistsAtPath:v22 isDirectory:&v38];
    int v24 = v38;

    if (v23 && v24)
    {
      v21 = v37;
      goto LABEL_7;
    }

    id v28 = MTMetricsKitOSLog();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v37;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "MetricsKit: Error: %@", buf, 0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Application doesn't have write access to %@",  v30));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v37 userInfo]);
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"MTIDCloudKitLocalDB",  v31,  v32));
  }

  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MTFrameworkEnvironment.sharedEnvironment.localDataPath is not valid: %@",  v15));
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"MTIDCloudKitLocalDB",  v26,  0LL));
  }

  objc_exception_throw(v27);
  return (MTIDCloudKitLocalDB *)-[MTIDCloudKitLocalDB dataForName:error:](v33, v34, v35, v36);
}

- (id)dataForName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](self, "pathURL"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v6]);

  id v15 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v8,  0LL,  &v15));
  id v10 = v15;
  v11 = v10;
  if (a4 && !v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    if ([v12 isEqualToString:NSCocoaErrorDomain])
    {
      id v13 = [v11 code];

      if (v13 == (id)260) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    *a4 = v11;
  }

- (BOOL)writeData:(id)a3 forName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](self, "pathURL"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v9]);

    unsigned __int8 v12 = [v8 writeToURL:v11 options:1 error:a5];
    id v9 = (id)v11;
  }

  else
  {
    unsigned __int8 v12 = -[MTIDCloudKitLocalDB deleteIfExists:error:](self, "deleteIfExists:error:", v9, a5);
  }

  return v12;
}

- (BOOL)fileExists:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](self, "pathURL"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

  return v9;
}

- (BOOL)deleteIfExists:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](self, "pathURL"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v6]);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = 0LL;
  unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v15];
  id v11 = v15;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  if (![v12 isEqualToString:NSCocoaErrorDomain])
  {

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  id v13 = [v11 code];

  if (v13 == (id)4) {
    unsigned __int8 v10 = 1;
  }
  if (a4)
  {
LABEL_7:
    if ((v10 & 1) == 0) {
      *a4 = v11;
    }
  }

- (id)encodeRecord:(id)a3
{
  id v3 = a3;
  id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  [v3 encodeSystemFieldsWithCoder:v4];
  v5 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));
  -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v6, @"systemFields");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"namespace"]);
  -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v7, @"namespace");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"secretKey"]);
  -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v8, @"secretKey");

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"expiration"]);
  -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v9, @"expiration");

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_secretValue"));
  -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v10, @"secretValue");

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v5, "encodedData"));
  return v11;
}

- (id)decodeRecordFromData:(id)a3 recordID:(id)a4 isSynchronized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v9,  0LL);

  -[NSKeyedUnarchiver setRequiresSecureCoding:](v10, "setRequiresSecureCoding:", 1LL);
  id v11 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSData),  @"systemFields");
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    v14 = 0LL;
    if (v8) {
      goto LABEL_5;
    }
LABEL_8:
    v29 = 0LL;
    goto LABEL_9;
  }

  id v13 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v12,  0LL);
  -[NSKeyedUnarchiver setRequiresSecureCoding:](v13, "setRequiresSecureCoding:", 1LL);
  v14 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v13);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v14, "recordType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB recordType](self, "recordType"));
    unsigned __int8 v17 = [v15 isEqualToString:v16];

    if ((v17 & 1) != 0) {
      goto LABEL_6;
    }
  }

  if (!v8) {
    goto LABEL_8;
  }
LABEL_5:
  v18 = objc_alloc(&OBJC_CLASS___CKRecord);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB recordType](self, "recordType"));
  id v20 = -[CKRecord initWithRecordType:recordID:](v18, "initWithRecordType:recordID:", v19, v8);

  BOOL v5 = 0LL;
  v14 = v20;
LABEL_6:
  id v21 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  @"namespace");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[CKRecord setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v22, @"namespace");

  id v23 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  @"secretKey");
  int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[CKRecord setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v24, @"secretKey");

  id v25 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSDate),  @"expiration");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  -[CKRecord setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v26, @"expiration");

  id v27 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  @"secretValue");
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[CKRecord mt_setSecretValue:](v14, "mt_setSecretValue:", v28);

  -[CKRecord mt_setSynchronized:](v14, "mt_setSynchronized:", v5);
  v14 = v14;
  v29 = v14;
LABEL_9:

  return v29;
}

- (id)userRecordIDName
{
  id v8 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB dataForName:error:](self, "dataForName:error:", @"UserRecordID", &v8));
  id v3 = v8;
  if (v3)
  {
    id v4 = MTMetricsKitOSLog();
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to load user record ID with error %@",  buf,  0xCu);
    }
  }

  else if (v2)
  {
    id v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v2, 4LL);
    goto LABEL_8;
  }

  id v6 = 0LL;
LABEL_8:

  return v6;
}

- (BOOL)setUserRecordIDName:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB userRecordIDName](self, "userRecordIDName"));
  if (v5 == v4 || ([v4 isEqual:v5] & 1) != 0)
  {
    BOOL v6 = 0;
  }

  else
  {
    id v7 = MTMetricsKitOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MetricsKit: CloudKit user has changed", buf, 2u);
    }

    -[MTIDCloudKitLocalDB clearData](self, "clearData");
    if (v4) {
      -[MTIDCloudKitLocalDB setNeedsFetchRecords:](self, "setNeedsFetchRecords:", 1LL);
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
    id v15 = 0LL;
    unsigned __int8 v10 = -[MTIDCloudKitLocalDB writeData:forName:error:]( self,  "writeData:forName:error:",  v9,  @"UserRecordID",  &v15);
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      id v12 = MTMetricsKitOSLog();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to write user record ID with error %@",  buf,  0xCu);
      }
    }

    -[MTIDCloudKitLocalDB setZoneCreated:](self, "setZoneCreated:", 0LL);

    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)needsFetchRecords
{
  return -[MTIDCloudKitLocalDB fileExists:](self, "fileExists:", @"NeedsFetch");
}

- (void)setNeedsFetchRecords:(BOOL)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([@"1" dataUsingEncoding:4]);
    id v9 = 0LL;
    -[MTIDCloudKitLocalDB writeData:forName:error:](self, "writeData:forName:error:", v4, @"NeedsFetch", &v9);
    id v5 = v9;

    if (!v5) {
      goto LABEL_8;
    }
  }

  else
  {
    id v8 = 0LL;
    -[MTIDCloudKitLocalDB deleteIfExists:error:](self, "deleteIfExists:error:", @"NeedsFetch", &v8);
    id v5 = v8;
    if (!v5) {
      goto LABEL_8;
    }
  }

  id v6 = MTMetricsKitOSLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to write fetch file with error %@",  buf,  0xCu);
  }

LABEL_8:
}

- (id)syncStatusCode
{
  id v8 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB dataForName:error:](self, "dataForName:error:", @"SyncEngineStatus", &v8));
  id v3 = v8;
  if (v3)
  {
    id v4 = MTMetricsKitOSLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to load sync engine status with error %@",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  else if (v2)
  {
    id v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v2, 4LL);
  }

  else
  {
    id v6 = @"Starting";
  }

  return v6;
}

- (void)setSyncStatusCode:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  id v9 = 0LL;
  unsigned __int8 v5 = -[MTIDCloudKitLocalDB writeData:forName:error:]( self,  "writeData:forName:error:",  v4,  @"SyncEngineStatus",  &v9);
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = MTMetricsKitOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to write sync engine status with error %@",  buf,  0xCu);
    }
  }
}

- (BOOL)writeRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mt_syncingFileName"));

  if (!objc_msgSend(v6, "mt_isSynchronized"))
  {
    id v17 = MTMetricsKitOSLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 recordName]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"namespace"]);
      int v27 = 138412546;
      id v28 = v20;
      __int16 v29 = 2112;
      v30 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Saving unsynchronized record with ID %@ for namespace %@",  (uint8_t *)&v27,  0x16u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mt_syncedFileName"));
    unsigned int v24 = -[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v23, a4);

    if (v24) {
      goto LABEL_9;
    }
LABEL_11:
    LOBYTE(a4) = 0;
    goto LABEL_12;
  }

  id v10 = MTMetricsKitOSLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"namespace"]);
    int v27 = 138412546;
    id v28 = v13;
    __int16 v29 = 2112;
    v30 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Saving synchronized record with ID %@ for namespace %@",  (uint8_t *)&v27,  0x16u);
  }

  if (!-[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v9, a4)) {
    goto LABEL_11;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mt_syncedFileName"));

  id v9 = (void *)v16;
LABEL_9:
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB encodeRecord:](v7, "encodeRecord:", v6));
  LODWORD(a4) = -[MTIDCloudKitLocalDB writeData:forName:error:](v7, "writeData:forName:error:", v25, v9, a4);

  if ((_DWORD)a4)
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB delegate](v7, "delegate"));
    [a4 cloudKitLocalDB:v7 didChangeRecord:v6];

    LOBYTE(a4) = 1;
  }

- (id)recordWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_syncedFileName"));
  BOOL v9 = -[MTIDCloudKitLocalDB fileExists:](v7, "fileExists:", v8);
  if (!v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_syncingFileName"));

    id v8 = (void *)v10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB dataForName:error:](v7, "dataForName:error:", v8, a4));
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDCloudKitLocalDB decodeRecordFromData:recordID:isSynchronized:]( v7,  "decodeRecordFromData:recordID:isSynchronized:",  v11,  v6,  v9));
    if (!v12)
    {
      id v18 = 0LL;
      unsigned __int8 v13 = -[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v8, &v18);
      id v14 = v18;
      if ((v13 & 1) == 0)
      {
        id v15 = MTMetricsKitOSLog();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v8;
          __int16 v21 = 2112;
          id v22 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to delete corrupted data file %@ error %@",  buf,  0x16u);
        }
      }
    }
  }

  else
  {
    id v12 = 0LL;
  }

  objc_sync_exit(v7);
  return v12;
}

- (BOOL)deleteRecordWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_syncingFileName"));
  if (-[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v8, a4))
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_syncedFileName"));
    unsigned __int8 v10 = -[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v9, a4);
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  objc_sync_exit(v7);
  return v10;
}

- (id)pendingRecordIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecordID mt_syncingFileExtension](&OBJC_CLASS___CKRecordID, "mt_syncingFileExtension"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](v2, "pathURL"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 enumeratorAtPath:v7]);
  BOOL v9 = 0LL;
LABEL_2:

  unsigned __int8 v10 = v9;
  while (1)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);

    if (!v9) {
      break;
    }
    unsigned __int8 v10 = v9;
    if ([v9 hasSuffix:v5])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "substringToIndex:",  (_BYTE *)objc_msgSend(v9, "length") - (_BYTE *)objc_msgSend(v5, "length")));
      id v11 = objc_alloc(&OBJC_CLASS___CKRecordID);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB recordZoneID](v2, "recordZoneID"));
      id v12 = -[CKRecordID initWithRecordName:zoneID:](v11, "initWithRecordName:zoneID:", v6, v7);
      [v4 addObject:v12];

      goto LABEL_2;
    }
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)clearData
{
  id v3 = MTMetricsKitOSLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Clearing local CloudKit record cache",  buf,  2u);
  }

  unsigned __int8 v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](v5, "pathURL"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0]);

  BOOL v9 = 0LL;
  *(void *)&__int128 v10 = 138412546LL;
  __int128 v17 = v10;
  while (1)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject", v17));

    if (!v11) {
      break;
    }
    id v18 = 0LL;
    unsigned __int8 v12 = [v6 removeItemAtURL:v11 error:&v18];
    id v13 = v18;
    if (v13) {
      char v14 = v12;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0)
    {
      id v15 = MTMetricsKitOSLog();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v17;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to remove local record data %@ with error %@",  buf,  0x16u);
      }
    }

    BOOL v9 = (void *)v11;
  }

  objc_sync_exit(v5);
}

- (id)allRecords
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDCloudKitLocalDB pathURL](self, "pathURL"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 nextObject]);
  if (v7)
  {
    id v8 = (void *)v7;
    do
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v8,  0LL,  0LL));
      if (v9)
      {
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecordID mt_syncedFileExtension](&OBJC_CLASS___CKRecordID, "mt_syncedFileExtension"));
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDCloudKitLocalDB decodeRecordFromData:recordID:isSynchronized:]( self,  "decodeRecordFromData:recordID:isSynchronized:",  v9,  0,  [v10 hasSuffix:v11]));

        if (v12) {
          [v6 addObject:v12];
        }
      }

      uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 nextObject]);
      id v8 = (void *)v13;
    }

    while (v13);
  }

  return v6;
}

- (MTIDCloudKitLocalDBDelegate)delegate
{
  return (MTIDCloudKitLocalDBDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
}

- (NSURL)pathURL
{
  return self->_pathURL;
}

- (void)setPathURL:(id)a3
{
}

- (BOOL)zoneCreated
{
  return self->_zoneCreated;
}

- (void)setZoneCreated:(BOOL)a3
{
  self->_zoneCreated = a3;
}

- (void).cxx_destruct
{
}

@end