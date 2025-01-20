@interface EscrowRequestServer
+ (id)request:(id *)a3;
+ (id)server;
- (BOOL)escrowCompletedWithinLastSeconds:(double)a3;
- (BOOL)pendingEscrowUpload:(id *)a3;
- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4;
- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5;
- (EscrowRequestController)controller;
- (EscrowRequestServer)initWithLockStateTracker:(id)a3;
- (id)fetchStatuses:(id *)a3;
- (void)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 reply:(id)a5;
- (void)escrowCompletedWithinLastSeconds:(double)a3 reply:(id)a4;
- (void)fetchPrerecord:(id)a3 reply:(id)a4;
- (void)fetchRequestStatuses:(id)a3;
- (void)fetchRequestWaitingOnPasscode:(id)a3;
- (void)resetAllRequests:(id)a3;
- (void)setController:(id)a3;
- (void)setupAnalytics;
- (void)storePrerecordsInEscrow:(id)a3;
- (void)triggerEscrowUpdate:(id)a3 options:(id)a4 reply:(id)a5;
@end

@implementation EscrowRequestServer

- (EscrowRequestServer)initWithLockStateTracker:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___EscrowRequestServer;
  v5 = -[EscrowRequestServer init](&v9, "init");
  if (v5)
  {
    v6 = -[EscrowRequestController initWithLockStateTracker:]( objc_alloc(&OBJC_CLASS___EscrowRequestController),  "initWithLockStateTracker:",  v4);
    controller = v5->_controller;
    v5->_controller = v6;
  }

  return v5;
}

- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4
{
  return -[EscrowRequestServer triggerEscrowUpdate:options:error:]( self,  "triggerEscrowUpdate:options:error:",  a3,  0LL,  a4);
}

- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_10003A548;
  v22 = sub_10003A558;
  id v23 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003A648;
  v15[3] = &unk_1002936A0;
  v17 = &v18;
  v10 = dispatch_semaphore_create(0LL);
  v16 = v10;
  -[EscrowRequestServer triggerEscrowUpdate:options:reply:](self, "triggerEscrowUpdate:options:reply:", v8, v9, v15);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = v19;
  if (a5)
  {
    v12 = (void *)v19[5];
    if (v12)
    {
      *a5 = v12;
      v11 = v19;
    }
  }

  BOOL v13 = v11[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)fetchStatuses:(id *)a3
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10003A548;
  uint64_t v18 = sub_10003A558;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_10003A548;
  v12 = sub_10003A558;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003A5D4;
  v7[3] = &unk_100283D88;
  v7[4] = &v14;
  v7[5] = &v8;
  -[EscrowRequestServer fetchRequestStatuses:](self, "fetchRequestStatuses:", v7);
  if (a3)
  {
    id v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }

  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)pendingEscrowUpload:(id *)a3
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10003A548;
  v33 = sub_10003A558;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10003A548;
  v27 = sub_10003A558;
  id v28 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10003A560;
  v22[3] = &unk_100283D88;
  v22[4] = &v29;
  v22[5] = &v23;
  -[EscrowRequestServer fetchRequestStatuses:](self, "fetchRequestStatuses:", v22);
  if (v24[5])
  {
    id v4 = sub_10001267C("escrow");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v24[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "failed to fetch escrow statuses: %@",  buf,  0xCu);
    }

    if (a3)
    {
      char v7 = 0;
      *a3 = (id) v24[5];
      goto LABEL_21;
    }

- (BOOL)escrowCompletedWithinLastSeconds:(double)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003A534;
  v7[3] = &unk_100283DB0;
  id v9 = &v10;
  id v5 = dispatch_semaphore_create(0LL);
  uint64_t v8 = v5;
  -[EscrowRequestServer escrowCompletedWithinLastSeconds:reply:]( self,  "escrowCompletedWithinLastSeconds:reply:",  v7,  a3);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  id v24 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadFromKeychain:error:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadFromKeychain:error:",  v8,  &v24));
  id v12 = v24;
  if (v12)
  {
    char v13 = v12;
    uint64_t v14 = sub_10001267C("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v13;
      uint64_t v16 = "escrowrequest: unable to load uuid %@: %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  [v11 setSerializedPrerecord:v9];
  id v23 = 0LL;
  [v11 saveToKeychain:&v23];
  id v17 = v23;
  if (v17)
  {
    char v13 = v17;
    __int128 v18 = sub_10001267C("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v13;
      uint64_t v16 = "escrowrequest: unable to save new prerecord for uuid %@: %@";
      goto LABEL_7;
    }

- (void)fetchPrerecord:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void, id))a4;
  id v20 = 0LL;
  char v7 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadFromKeychain:error:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadFromKeychain:error:",  v5,  &v20));
  id v8 = v20;
  if (v8)
  {
    id v9 = sub_10001267C("SecError");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v5;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: unable to load prerecord with uuid %@: %@",  buf,  0x16u);
    }

    v6[2](v6, 0LL, v8);
    goto LABEL_16;
  }

  if ([v7 uploadCompleted])
  {
    uint64_t v11 = sub_10001267C("SecError");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      char v13 = "escrowrequest: prerecord for uuid %@ already uploaded";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  if (![v7 hasSerializedPrerecord])
  {
    __int128 v19 = sub_10001267C("SecError");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v5;
      __int16 v23 = 2112;
      id v24 = 0LL;
      char v13 = "escrowrequest: no prerecord for uuid %@: %@";
      uint64_t v14 = v12;
      uint32_t v15 = 22;
      goto LABEL_14;
    }

- (void)fetchRequestWaitingOnPasscode:(id)a3
{
  id v3 = a3;
  id v34 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v34));
  id v5 = v34;
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v7 isEqualToString:NSOSStatusErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)-25300LL)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
        [v9 setDateProperty:0 forKey:@"ERSPending"];

        (*((void (**)(id, void, void))v3 + 2))(v3, 0LL, 0LL);
        goto LABEL_30;
      }
    }

    else
    {
    }

- (void)triggerEscrowUpdate:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_10001267C("escrowrequest");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Triggering an escrow update request due to '%@'",  (uint8_t *)&v14,  0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestServer controller](self, "controller"));
  [v13 triggerEscrowUpdateRPC:v8 options:v10 reply:v9];
}

- (void)fetchRequestStatuses:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v36 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v36));
  id v5 = v36;
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v7 isEqualToString:NSOSStatusErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)-25300LL)
      {
        id v9 = sub_10001267C("escrowrequest");
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "no extant requests", buf, 2u);
        }

        v3[2](v3, &__NSDictionary0__struct, 0LL);
        goto LABEL_28;
      }
    }

    else
    {
    }

    id v26 = sub_10001267C("SecError");
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: failed to load requests: %@",  buf,  0xCu);
    }

    ((void (**)(id, void *, void *))v3)[2](v3, 0LL, v6);
  }

  else
  {
    id v28 = 0LL;
    __int128 v30 = v3;
    id v11 = sub_10001267C("escrowrequest");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "found requests: %@", buf, 0xCu);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v29 = v4;
    id v14 = v4;
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      __int128 v31 = (const __CFString *)SecEscrowRequestPendingCertificate;
      __int128 v18 = (const __CFString *)SecEscrowRequestPendingPasscode;
      BOOL v19 = (const __CFString *)SecEscrowRequestHavePrecord;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          __int128 v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          if (objc_msgSend(v21, "uploadCompleted", v28))
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);
            __int16 v23 = v13;
            id v24 = @"complete";
          }

          else if ([v21 hasSerializedPrerecord])
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);
            __int16 v23 = v13;
            id v24 = v19;
          }

          else
          {
            unsigned int v25 = [v21 certCached];
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uuid]);
            __int16 v23 = v13;
            if (v25) {
              id v24 = v18;
            }
            else {
              id v24 = v31;
            }
          }

          [v23 setObject:v24 forKeyedSubscript:v22];
        }

        id v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v16);
    }

    id v3 = v30;
    v30[2](v30, v13, 0LL);

    uint64_t v6 = v28;
    id v4 = v29;
  }

- (void)resetAllRequests:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = sub_10001267C("escrowrequest");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting all requests", buf, 2u);
  }

  id v31 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v31));
  id v7 = v31;
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v9 isEqualToString:NSOSStatusErrorDomain])
    {
      id v10 = [v8 code];

      if (v10 == (id)-25300LL)
      {
        id v11 = sub_10001267C("escrowrequest");
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "no extant requests; nothing to delete",
            buf,
            2u);
        }

        v3[2](v3, 0LL);
        goto LABEL_27;
      }
    }

    else
    {
    }

    id v22 = sub_10001267C("escrowrequest");
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "error fetching records: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v3)[2](v3, v8);
  }

  else
  {
    id v24 = v6;
    unsigned int v25 = (void (**)(void, id))v3;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      id v8 = 0LL;
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0LL;
        __int128 v18 = v8;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v19 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v17);
          id v26 = v18;
          objc_msgSend(v19, "deleteFromKeychain:", &v26, v24);
          id v8 = v26;

          if (v8)
          {
            id v20 = sub_10001267C("escrowrequest");
            __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v33 = v19;
              __int16 v34 = 2112;
              id v35 = v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to delete %@: %@", buf, 0x16u);
            }
          }

          uint64_t v17 = (char *)v17 + 1;
          __int128 v18 = v8;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }

      while (v15);
    }

    else
    {
      id v8 = 0LL;
    }

    id v3 = (void (**)(id, void))v25;
    v25[2](v25, v8);
    uint64_t v6 = v24;
  }

- (void)storePrerecordsInEscrow:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001267C("escrowrequest");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "attempting to store a prerecord in escrow",  v8,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestServer controller](self, "controller"));
  [v7 storePrerecordsInEscrowRPC:v4];
}

- (void)escrowCompletedWithinLastSeconds:(double)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  id v21 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v21));
  id v7 = v21;
  id v8 = v7;
  if (!v7)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v12 = v6;
    uint64_t v11 = (uint64_t)[v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (!v11)
    {
LABEL_19:

      goto LABEL_20;
    }

    uint64_t v13 = *(void *)v18;
LABEL_7:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v12);
      }
      id v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
      if (objc_msgSend(v15, "uploadCompleted", (void)v17))
      {
      }

      if (v11 == ++v14)
      {
        uint64_t v11 = (uint64_t)[v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11) {
          goto LABEL_7;
        }
        goto LABEL_19;
      }
    }

- (void)setupAnalytics
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
  id v2 =  [v3 AddMultiSamplerForName:@"escorwrequest-healthSummary" withTimeInterval:&stru_100283DF0 block:SFAnalyticsSamplerIntervalOncePerReport];
}

- (EscrowRequestController)controller
{
  return (EscrowRequestController *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)server
{
  if (qword_1002DE860 != -1) {
    dispatch_once(&qword_1002DE860, &stru_100283D60);
  }
  return (id)qword_1002DE858;
}

+ (id)request:(id *)a3
{
  return +[EscrowRequestServer server](&OBJC_CLASS___EscrowRequestServer, "server", a3);
}

@end