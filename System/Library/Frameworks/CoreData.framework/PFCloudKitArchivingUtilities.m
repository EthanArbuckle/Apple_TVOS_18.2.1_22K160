@interface PFCloudKitArchivingUtilities
- (id)newArchivedDataForSystemFieldsOfRecord:(uint64_t)a1;
- (id)recordFromEncodedData:(void *)a3 error:;
- (void)shareFromEncodedData:(char *)a3 inZoneWithID:(void *)a4 error:;
@end

@implementation PFCloudKitArchivingUtilities

- (id)newArchivedDataForSystemFieldsOfRecord:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [a2 encodeSystemFieldsWithCoder:v3];
  id v4 = (id)[v3 encodedData];
  [v3 finishEncoding];

  return v4;
}

- (id)recordFromEncodedData:(void *)a3 error:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v22 = 0LL;
  v5 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v6 = [a2 decompressedDataUsingAlgorithm:0 error:&v22];
  if (!v6
    || (uint64_t v7 = v6,
        v8 = (void *)MEMORY[0x189607908],
        getCloudKitCKRecordClass(),
        (id v9 = (id)[v8 unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v22]) == 0))
  {
    id v11 = v22;
    objc_autoreleasePoolPop(v5);
    id v12 = v22;
    if (v12)
    {
      if (a3)
      {
        id v10 = 0LL;
        *a3 = v12;
        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
      v20 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
        __int16 v25 = 1024;
        int v26 = 81;
        _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }

    id v10 = 0LL;
    goto LABEL_11;
  }

  id v10 = v9;
  objc_autoreleasePoolPop(v5);
LABEL_11:

  return v10;
}

- (void)shareFromEncodedData:(char *)a3 inZoneWithID:(void *)a4 error:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v4 = a2;
  id v37 = 0LL;
  if (a2)
  {
    v8 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v9 = [v4 decompressedDataUsingAlgorithm:0 error:&v37];
    if (!v9
      || (uint64_t v10 = v9,
          id v11 = (void *)MEMORY[0x189607908],
          id v12 = (void *)MEMORY[0x189604010],
          getCloudKitCKShareClass(),
          (id v13 = (id)objc_msgSend( v11,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  objc_msgSend(v12, "setWithObject:", objc_opt_class()),  v10,  &v37)) == 0))
    {
      id v25 = v37;
      objc_autoreleasePoolPop(v8);
      id v24 = v37;
      goto LABEL_10;
    }

    id v4 = v13;
    objc_autoreleasePoolPop(v8);
    if ((objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(v4, "recordID"), "zoneID")) & 1) == 0)
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Decoded share zoneID doesn't match row: %@\n%@\n%@"];
      [v4 recordID];
      _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, (uint64_t)a3);
      v21 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v36 = [v4 recordID];
        *(_DWORD *)buf = 138412802;
        v41 = a3;
        __int16 v42 = 2112;
        uint64_t v43 = v36;
        __int16 v44 = 2112;
        uint64_t v45 = a1;
        _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: Decoded share zoneID doesn't match row: %@\n%@\n%@",  buf,  0x20u);
      }

      id v22 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v23 = *MEMORY[0x189607460];
      uint64_t v38 = *MEMORY[0x1896075F0];
      v39 = @"A fatal error has occured trying to decode sharing metadata, please file a bug with a sysdiagnose and attach the application store files if possible.";
      id v24 = (id)objc_msgSend( v22,  "initWithDomain:code:userInfo:",  v23,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      id v37 = v24;
LABEL_10:
      id v26 = v24;
      if (v26)
      {
        if (a4)
        {
          id v4 = 0LL;
          *a4 = v26;
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m");
        v34 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitArchivingUtilities.m";
          __int16 v42 = 1024;
          LODWORD(v43) = 130;
          _os_log_fault_impl( &dword_186681000,  v34,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }

      id v4 = 0LL;
    }
  }

@end