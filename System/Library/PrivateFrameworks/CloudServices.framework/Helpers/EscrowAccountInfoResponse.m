@interface EscrowAccountInfoResponse
- (NSArray)accountInfo;
- (id)initFromResponseFilterPCS:(id)a3;
@end

@implementation EscrowAccountInfoResponse

- (NSArray)accountInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"metadataList"]);

  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v3;
  id v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v34;
    *(void *)&__int128 v4 = 138412290LL;
    __int128 v28 = v4;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", @"metadata", v28));
        if (v7)
        {
          v8 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v7,  0LL);
          if (v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  0LL,  0LL));
            v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"label"]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v11,  @"label");

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v9,  @"metadata");
            v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"recordStatus"]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  @"recordStatus");

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v7,  @"encodedMetadata");
            v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"silentAttemptAllowed"]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v13,  @"silentAttemptAllowed");

            v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"FEDERATIONID"]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v14,  @"federationID");

            v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"EXPECTEDFEDERATIONID"]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v15,  @"expectedFederationID");

            v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"remainingAttempts"]);
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v16 integerValue]));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v17,  @"SecureBackupRemainingAttempts");

            v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"coolOffEnd"]);
            v19 = v18;
            if (v18)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 integerValue]));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v20,  @"SecureBackupCoolOffEnd");
            }

            v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"recoveryStatus"]);
            v22 = v21;
            if (v21)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v21 integerValue]));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v23,  @"SecureBackupRecoveryStatus");
            }

            v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"triggerUpdate"]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v24,  @"SecureBackupTriggerUpdate");

            -[NSMutableArray addObject:](v29, "addObject:", v10);
          }

          else
          {
            uint64_t v25 = CloudServicesLog();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              v38 = v7;
              _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "iCloud gave us junk for metadata: %@",  buf,  0xCu);
            }
          }
        }
      }

      id v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v32);
  }

  return (NSArray *)v29;
}

- (id)initFromResponseFilterPCS:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
    v32.receiver = self;
    v32.super_class = (Class)&OBJC_CLASS___EscrowAccountInfoResponse;
    v7 = -[LakituResponse initWithError:](&v32, "initWithError:", v6);

    v8 = v7;
  }

  else
  {
    uint64_t v25 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 responseDictionary]);
    id v24 = [v9 mutableCopy];

    id v26 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 responseDictionary]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"metadataList"]);

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      uint64_t v17 = kEscrowServiceStingrayLabel;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"label"]);
          if (([v20 isEqualToString:v17] & 1) != 0
            || [v20 isEqualToString:@"com.apple.protectedcloudstorage.record.double"])
          {
            uint64_t v21 = CloudServicesLog();
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v34 = v20;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "Filtering PCS record label %@ (due to com.apple.cloudservices/PCS-NoRecord)",  buf,  0xCu);
            }
          }

          else
          {
            [v12 addObject:v19];
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }

      while (v15);
    }

    [v24 setObject:v12 forKeyedSubscript:@"metadataList"];
    v27.receiver = v25;
    v27.super_class = (Class)&OBJC_CLASS___EscrowAccountInfoResponse;
    v8 = -[LakituResponse initWithResponseDictionary:](&v27, "initWithResponseDictionary:", v24);

    id v4 = v26;
  }

  return v8;
}

@end