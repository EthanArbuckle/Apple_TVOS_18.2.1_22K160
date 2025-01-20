@interface SecuritydXPCServer
- (BOOL)clientHasBooleanEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (SecuritydXPCServer)initWithConnection:(id)a3;
- (SecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3;
- (void)SecItemAddAndNotifyOnSync:(id)a3 syncCallback:(id)a4 complete:(id)a5;
- (void)dealloc;
- (void)findItemPersistentRefByUUID:(id)a3 extraLoggingString:(id)a4 client:(SecurityClient *)a5 complete:(id)a6;
- (void)secItemDeleteForAppClipApplicationIdentifier:(id)a3 completion:(id)a4;
- (void)secItemDigest:(id)a3 accessGroup:(id)a4 complete:(id)a5;
- (void)secItemFetchCurrentItemAcrossAllDevices:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7;
- (void)secItemFetchCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)secItemFetchPCSIdentityByKeyOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)secItemPersistKeychainWritesAtHighPerformanceCost:(id)a3;
- (void)secItemPromoteItemsForAppClip:(id)a3 toParentApp:(id)a4 completion:(id)a5;
- (void)secItemSetCurrentItemAcrossAllDevices:(id)a3 newCurrentItemHash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 oldCurrentItemReference:(id)a8 oldCurrentItemHash:(id)a9 complete:(id)a10;
- (void)secItemUnsetCurrentItemsAcrossAllDevices:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6;
- (void)secKeychainDeleteMultiuser:(id)a3 complete:(id)a4;
- (void)secKeychainForceUpgradeIfNeeded:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation SecuritydXPCServer

- (void)SecItemAddAndNotifyOnSync:(id)a3 syncCallback:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100011540;
  v41[3] = &unk_100282C90;
  id v10 = a5;
  id v42 = v10;
  v11 = objc_retainBlock(v41);
  CFTypeRef cf = 0LL;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.deny"))
  {
    sub_1000194E0( -25291,  (__CFString **)&cf,  @"SecItemAddAndNotifyOnSync: %@ has entitlement %@",  self->_client.task,  @"com.apple.private.keychain.deny");
    goto LABEL_21;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 completedSecCKKSInitialize]);
  [v13 wait:10];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSecAttrDeriveSyncIDFromItemAttributes]);
  if (v14
    || (v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSecAttrPCSPlaintextServiceIdentifier])) != 0
    || (v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSecAttrPCSPlaintextPublicKey])) != 0)
  {
  }

  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSecAttrPCSPlaintextPublicIdentity]);

    if (!v30) {
      goto LABEL_8;
    }
  }

  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.ckks.plaintextfields"))
  {
    sub_1000194E0( -34018,  (__CFString **)&cf,  @"SecItemAddAndNotifyOnSync: %@ does not have entitlement %@, but is using SPI anyway",  self->_client.task,  @"com.apple.private.ckks.plaintextfields");
    goto LABEL_21;
  }

- (void)secItemSetCurrentItemAcrossAllDevices:(id)a3 newCurrentItemHash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 oldCurrentItemReference:(id)a8 oldCurrentItemHash:(id)a9 complete:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  v41 = (const __CFString *)a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000114F8;
  v44[3] = &unk_100285010;
  id v22 = a10;
  id v45 = v22;
  CFTypeRef v23 = objc_retainBlock(v44);
  CFTypeRef cf = 0LL;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.deny"))
  {
    sub_1000194E0( -25291,  (__CFString **)&cf,  @"SecItemSetCurrentItemAcrossAllDevices: %@ has entitlement %@",  self->_client.task,  @"com.apple.private.keychain.deny");
    ((void (*)(void *, CFTypeRef))v23[2])(v23, cf);
    CFTypeRef v24 = cf;
    CFTypeID v25 = (__CFString *)v41;
    if (!cf) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  id v40 = v21;
  id v26 = v19;
  p_client = &self->_client;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.ckks.currentitempointers_write"))
  {
    accessGroups = self->_client.accessGroups;
    CFTypeID v25 = (__CFString *)v41;
    if ((sub_10010DD28(accessGroups, v41, (uint64_t)p_client) & 1) != 0)
    {
      CFTypeID v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 completedSecCKKSInitialize]);
      id v31 = [v30 wait:10];

      if (v31)
      {
        __int128 v32 = sub_10001267C("SecError");
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        id v19 = v26;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "SecItemSetCurrentItemAcrossAllDevices: CKKSViewManager not initialized?",  buf,  2u);
        }

        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  9LL,  @"CKKS not yet initialized"));
        ((void (*)(void *, void *))v23[2])(v23, v34);

        id v21 = v40;
        CFTypeID v25 = (__CFString *)v41;
      }

      else
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
        v36 = v35;
        id v19 = v26;
        if (v35)
        {
          id v21 = v40;
          [v35 setCurrentItemForAccessGroup:v16 hash:v17 accessGroup:v41 identifier:v18 viewHint:v19 replacing:v20 hash:v40 complete:v23];
        }

        else
        {
          id v37 = sub_10001267C("SecError");
          id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "SecItemSetCurrentItemAcrossAllDevices: no view manager?",  buf,  2u);
          }

          CFTypeRef v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  9LL,  @"No view manager, cannot forward request"));
          ((void (*)(void *, void *))v23[2])(v23, v39);

          id v21 = v40;
        }

        CFTypeID v25 = (__CFString *)v41;
      }

      goto LABEL_14;
    }

    sub_1000194E0( -34018,  (__CFString **)&cf,  @"SecItemSetCurrentItemAcrossAllDevices: client is missing access-group %@: %@",  v41,  p_client->task);
    ((void (*)(void *, CFTypeRef))v23[2])(v23, cf);
    CFTypeRef v24 = cf;
  }

  else
  {
    sub_1000194E0( -34018,  (__CFString **)&cf,  @"SecItemSetCurrentItemAcrossAllDevices: %@ does not have entitlement %@",  p_client->task,  @"com.apple.private.ckks.currentitempointers_write");
    ((void (*)(void *, CFTypeRef))v23[2])(v23, cf);
    CFTypeRef v24 = cf;
    CFTypeID v25 = (__CFString *)v41;
  }

  id v21 = v40;
  if (v24)
  {
LABEL_13:
    CFTypeRef cf = 0LL;
    CFRelease(v24);
  }

- (void)secItemUnsetCurrentItemsAcrossAllDevices:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000114B0;
  v32[3] = &unk_100285010;
  id v13 = a6;
  id v33 = v13;
  v14 = objc_retainBlock(v32);
  CFTypeRef cf = 0LL;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.deny"))
  {
    sub_1000194E0( -25291,  (__CFString **)&cf,  @"SecItemUnsetCurrentItemsAcrossAllDevices: %@ has entitlement %@",  self->_client.task,  @"com.apple.private.keychain.deny");
    goto LABEL_13;
  }

  p_client = &self->_client;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.ckks.currentitempointers_write"))
  {
    if ((sub_10010DD28(self->_client.accessGroups, v10, (uint64_t)&self->_client) & 1) != 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
      id v17 = v16;
      if (v16)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 completedSecCKKSInitialize]);
        id v19 = [v18 wait:10];

        if (!v19)
        {
          [v17 unsetCurrentItemsForAccessGroup:v10 identifiers:v11 viewHint:v12 complete:v14];
          goto LABEL_21;
        }

        id v20 = sub_10001267C("SecError");
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "SecItemUnsetCurrentItemsAcrossAllDevices: CKKSViewManager not initialized?",  buf,  2u);
        }

        id v22 = @"CKKS not yet initialized";
      }

      else
      {
        CFTypeID v25 = sub_10001267C("SecError");
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "SecItemUnsetCurrentItemsAcrossAllDevices: no view manager?",  buf,  2u);
        }

        id v22 = @"No view manager, cannot forward request";
      }

      CFTypeRef v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  9LL,  v22));
      ((void (*)(void *, void *))v14[2])(v14, v27);

LABEL_21:
      goto LABEL_15;
    }

    CFTypeRef v28 = v10;
    task = (const __CFString *)p_client->task;
    CFTypeRef v23 = @"SecItemUnsetCurrentItemsAcrossAllDevices: client is missing access-group %@: %@";
  }

  else
  {
    CFTypeRef v28 = p_client->task;
    task = @"com.apple.private.ckks.currentitempointers_write";
    CFTypeRef v23 = @"SecItemUnsetCurrentItemsAcrossAllDevices: %@ does not have entitlement %@";
  }

  sub_1000194E0(-34018, (__CFString **)&cf, v23, v28, task);
LABEL_13:
  ((void (*)(void *, CFTypeRef))v14[2])(v14, cf);
  CFTypeRef v24 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v24);
  }

- (void)secItemFetchCurrentItemAcrossAllDevices:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000110A8;
  v37[3] = &unk_100282CE0;
  id v15 = a7;
  id v38 = v15;
  id v16 = objc_retainBlock(v37);
  CFTypeRef cf = 0LL;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.deny"))
  {
    sub_1000194E0( -25291,  (__CFString **)&cf,  @"SecItemFetchCurrentItemAcrossAllDevices: %@ has entitlement %@",  self->_client.task,  @"com.apple.private.keychain.deny");
    goto LABEL_10;
  }

  p_client = &self->_client;
  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.ckks.currentitempointers_read"))
  {
    sub_1000194E0( -25291,  (__CFString **)&cf,  @"SecItemFetchCurrentItemAcrossAllDevices: %@ does not have entitlement %@",  p_client->task,  @"com.apple.private.ckks.currentitempointers_read");
    goto LABEL_10;
  }

  if ((sub_10010DD28(self->_client.accessGroups, v12, (uint64_t)&self->_client) & 1) == 0)
  {
    sub_1000194E0( -34018,  (__CFString **)&cf,  @"SecItemFetchCurrentItemAcrossAllDevices: client is missing access-group %@: %@",  v12,  p_client->task);
LABEL_10:
    ((void (*)(void *, void, void, CFTypeRef))v16[2])(v16, 0LL, 0LL, cf);
    CFTypeRef v24 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v24);
    }

    goto LABEL_12;
  }

  BOOL v27 = v8;
  CFTypeRef v28 = v13;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 completedSecCKKSInitialize]);
  id v20 = [v19 wait:10];

  if (v20)
  {
    id v21 = sub_10001267C("SecError");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "SecItemFetchCurrentItemAcrossAllDevices: CKKSViewManager not initialized?",  buf,  2u);
    }

    CFTypeRef v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  9LL,  @"CKKS not yet initialized"));
    ((void (*)(void *, void, void, void *))v16[2])(v16, 0LL, 0LL, v23);

    id v13 = v28;
  }

  else
  {
    if (qword_1002DEB70 != -1) {
      dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
    }
    if (byte_1002DEB68)
    {
      CFTypeID v25 = (SecurityClient *)malloc(0x38uLL);
      SecSecurityFixUpClientWithPersona(&self->_client, v25);
      p_client = v25;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100011120;
    v29[3] = &unk_100282D30;
    v30 = v12;
    id v31 = v28;
    id v33 = v16;
    __int128 v34 = p_client;
    __int128 v32 = self;
    [v26 getCurrentItemForAccessGroup:v30 identifier:v31 viewHint:v14 fetchCloudValue:v27 complete:v29];

    id v13 = v28;
  }

- (void)secItemFetchCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100010EE4;
  v30[3] = &unk_100285368;
  id v9 = a5;
  id v31 = v9;
  id v10 = objc_retainBlock(v30);
  CFTypeRef cf = 0LL;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.deny"))
  {
    sub_1000194E0( -25291,  (__CFString **)&cf,  @"secItemFetchCurrentItemOutOfBand: %@ has entitlement %@",  self->_client.task,  @"com.apple.private.keychain.deny");
    goto LABEL_9;
  }

  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.ckks.currentitempointers_read"))
  {
    if ([v8 count]
      && (id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]),
          id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 accessGroup]),
          v11,
          v12))
    {
      if ((sub_10010DD28(self->_client.accessGroups, v12, (uint64_t)&self->_client) & 1) == 0)
      {
        sub_1000194E0( -34018,  (__CFString **)&cf,  @"secItemFetchCurrentItemOutOfBand: client is missing access-group %@: %@",  v12,  self->_client.task);
        ((void (*)(void *, void, CFTypeRef))v10[2])(v10, 0LL, cf);
        CFTypeRef v21 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v21);
        }

        goto LABEL_24;
      }

      CFTypeRef v23 = v12;
    }

    else
    {
      CFTypeRef v23 = 0LL;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 completedSecCKKSInitialize]);
    id v16 = [v15 wait:10];

    if (v16)
    {
      id v17 = sub_10001267C("SecError");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "secItemFetchCurrentItemOutOfBand: CKKSViewManager not initialized?",  buf,  2u);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  9LL,  @"CKKS not yet initialized"));
      ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v19);

      id v12 = v23;
    }

    else
    {
      if (qword_1002DEB70 != -1) {
        dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
      }
      id v12 = v23;
      if (byte_1002DEB68)
      {
        p_client = malloc(0x38uLL);
        SecSecurityFixUpClientWithPersona(&self->_client, p_client);
      }

      else
      {
        p_client = &self->_client;
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100010F48;
      v24[3] = &unk_100282D58;
      id v25 = v8;
      id v26 = v10;
      BOOL v27 = p_client;
      [v22 getCurrentItemOutOfBand:v25 forceFetch:v6 complete:v24];
    }

- (void)secItemFetchPCSIdentityByKeyOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100010D20;
  v29[3] = &unk_100285368;
  id v9 = a5;
  id v30 = v9;
  id v10 = objc_retainBlock(v29);
  CFTypeRef cf = 0LL;
  if (!-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.deny"))
  {
    if ([v8 count])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
      CFTypeRef v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 accessGroup]);

      if (v13 && (sub_10010DD28(self->_client.accessGroups, v13, (uint64_t)&self->_client) & 1) == 0)
      {
        sub_1000194E0( -34018,  (__CFString **)&cf,  @"secItemFetchPCSIdentityByKeyOutOfBand: client is missing access-group %@: %@",  v13,  self->_client.task);
        ((void (*)(void *, void, CFTypeRef))v10[2])(v10, 0LL, cf);
        CFTypeRef v14 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v14);
        }

- (void)findItemPersistentRefByUUID:(id)a3 extraLoggingString:(id)a4 client:(SecurityClient *)a5 complete:(id)a6
{
  id v23 = a3;
  id v22 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100010CBC;
  v26[3] = &unk_100282D80;
  id v21 = a6;
  id v27 = v21;
  id v20 = objc_retainBlock(v26);
  CFTypeRef v24 = 0LL;
  CFTypeRef cf = 0LL;
  id v9 = &off_1002898F8;
  id v10 = off_10028BA88;
  uint64_t v11 = kSecAttrUUID;
  while (1)
  {
    if (*((_BYTE *)v9 + 8))
    {
      CFTypeRef v12 = cf;
      if (cf)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v12);
      }

      v36[0] = kSecClass;
      v37[0] = **(v10 - 1);
      v37[1] = kSecAttrSynchronizableAny;
      v36[1] = kSecAttrSynchronizable;
      v36[2] = kSecMatchLimit;
      v37[2] = kSecMatchLimitOne;
      v37[3] = v23;
      v36[3] = v11;
      void v36[4] = kSecReturnPersistentRef;
      void v37[4] = &__kCFBooleanTrue;
      sub_100112A08( (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  5LL),  (uint64_t)a5,  (uint64_t *)&v24,  (__CFString **)&cf);
      if (!cf)
      {
        if (v24) {
          goto LABEL_15;
        }
        goto LABEL_10;
      }

      if (CFErrorGetCode((CFErrorRef)cf) != -25300 || v24) {
        break;
      }
    }

- (void)secItemDigest:(id)a3 accessGroup:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = (void (**)(id, void, __CFString *))a5;
  p_client = &self->_client;
  accessGroups = self->_client.accessGroups;
  uint64_t v33 = 0LL;
  __int16 v34 = (__CFString **)&v33;
  uint64_t v35 = 0x2020000000LL;
  v36 = 0LL;
  uint64_t v29 = 0LL;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  if (!v8 || !v9)
  {
    sub_1000194E0(-50, &v36, @"parameter missing: %@", p_client->task);
    v10[2](v10, 0LL, v34[3]);
    id v15 = v34[3];
    if (!v15) {
      goto LABEL_38;
    }
LABEL_18:
    v34[3] = 0LL;
    CFRelease(v15);
    goto LABEL_38;
  }

  if (([v8 isEqualToString:@"inet"] & 1) == 0
    && ([v8 isEqualToString:@"genp"] & 1) == 0)
  {
    sub_1000194E0(-50, v34 + 3, @"class %@ is not supported: %@", v8, p_client->task);
    v10[2](v10, 0LL, v34[3]);
    id v15 = v34[3];
    if (!v15) {
      goto LABEL_38;
    }
    goto LABEL_18;
  }

  if ((sub_10010DD28(accessGroups, v9, (uint64_t)p_client) & 1) == 0)
  {
    sub_1000194E0(-34018, v34 + 3, @"Client is missing access-group %@: %@", v9, p_client->task);
    v10[2](v10, 0LL, v34[3]);
    id v15 = v34[3];
    if (!v15) {
      goto LABEL_38;
    }
    goto LABEL_18;
  }

  v39.length = CFArrayGetCount(accessGroups);
  v39.location = 0LL;
  if (CFArrayContainsValue(accessGroups, v39, @"*")) {
    CFTypeRef v13 = 0LL;
  }
  else {
    CFTypeRef v13 = accessGroups;
  }
  v37[0] = kSecClass;
  v37[1] = kSecAttrAccessGroup;
  v38[0] = v8;
  v38[1] = v9;
  v37[2] = kSecAttrSynchronizable;
  v37[3] = kSecReturnPersistentRef;
  v38[2] = kSecAttrSynchronizableAny;
  v38[3] = &__kCFBooleanTrue;
  CFTypeRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  4LL));
  uint64_t v28 = 0LL;
  *(_OWORD *)CFTypeRef cf = 0u;
  __int128 v27 = 0u;
  __int128 v25 = 0u;
  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68)
  {
    SecSecurityFixUpClientWithPersona(p_client, &v25);
  }

  else
  {
    __int128 v16 = *(_OWORD *)&p_client->allowSystemKeychain;
    __int128 v25 = *(_OWORD *)&p_client->task;
    *(_OWORD *)CFTypeRef cf = v16;
    __int128 v27 = *(_OWORD *)&p_client->keybag;
    uint64_t v28 = *(void *)&p_client->isMusrOverridden;
  }

  uint64_t v17 = sub_1000F8790(v14, cf[1], 0LL, (uint64_t)&v25, v34 + 3);
  if (v17)
  {
    CFTypeRef v18 = (const void **)v17;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100010C18;
    v24[3] = &unk_100282DA8;
    v24[6] = v17;
    v24[7] = v13;
    void v24[4] = &v29;
    v24[5] = &v33;
    sub_100110ECC(0, 1, 0LL, (uint64_t)(v34 + 3), (uint64_t)v24);
    v10[2](v10, v30[3], v34[3]);
    sub_1000F8150(v18, (CFErrorRef *)v34 + 3);
    CFTypeRef v19 = (const void *)v30[3];
    if (v19)
    {
      v30[3] = 0LL;
      CFRelease(v19);
    }

    id v20 = v34[3];
    if (v20)
    {
      v34[3] = 0LL;
      CFRelease(v20);
    }

    if (qword_1002DEB70 != -1) {
      dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
    }
    if (byte_1002DEB68)
    {
      CFTypeRef v21 = cf[1];
      if (cf[1])
      {
        cf[1] = 0LL;
        CFRelease(v21);
      }
    }
  }

  else
  {
    sub_1000194E0(-50, v34 + 3, @"failed to build query: %@", (void)v25);
    v10[2](v10, 0LL, v34[3]);
    id v22 = v34[3];
    if (v22)
    {
      v34[3] = 0LL;
      CFRelease(v22);
    }

    if (qword_1002DEB70 != -1) {
      dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
    }
    if (byte_1002DEB68)
    {
      CFTypeRef v23 = cf[1];
      if (cf[1])
      {
        cf[1] = 0LL;
        CFRelease(v23);
      }
    }
  }

LABEL_38:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

- (void)secKeychainDeleteMultiuser:(id)a3 complete:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, __CFString *))a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = (__CFString **)&v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.keychain.multiuser-admin"))
  {
    sub_1000194E0( -25291,  v17 + 3,  @"secKeychainDeleteMultiuser: %@ need entitlement %@",  self->_client.task,  @"com.apple.keychain.multiuser-admin");
    v7[2](v7, 0LL, v17[3]);
    id v8 = v17[3];
    if (v8) {
      goto LABEL_9;
    }
  }

  else
  {
    id v9 = [v6 length];
    id v10 = v17;
    if (v9 == (id)16)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100010B10;
      v13[3] = &unk_100282DD0;
      id v14 = v6;
      id v15 = &v16;
      uint64_t v11 = sub_100110ECC(1, 1, 0LL, (uint64_t)(v10 + 3), (uint64_t)v13);
      v7[2](v7, v11, v17[3]);
      CFTypeRef v12 = v17[3];
      if (v12)
      {
        v17[3] = 0LL;
        CFRelease(v12);
      }
    }

    else
    {
      sub_1000194E0( -25291,  v17 + 3,  @"secKeychainDeleteMultiuser: %@ uuid have wrong length: %d",  self->_client.task,  [v6 length]);
      v7[2](v7, 0LL, v17[3]);
      id v8 = v17[3];
      if (v8)
      {
LABEL_9:
        v17[3] = 0LL;
        CFRelease(v8);
      }
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (void)secItemDeleteForAppClipApplicationIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.appclipdeletion"))
  {
    uint64_t v7 = sub_1001095C4((uint64_t)v8);
  }

  else
  {
    uint64_t v7 = 4294933278LL;
  }

  v6[2](v6, v7);
}

- (void)secItemPersistKeychainWritesAtHighPerformanceCost:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.performance_impacting_api"))
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    uint64_t v18 = 0LL;
    v5 = sub_10001267C("item");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Performing keychain database checkpoint",  buf,  2u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100010ABC;
    v14[3] = &unk_100282DF8;
    v14[4] = &v15;
    if ((sub_100110ECC(1, 1, 0LL, (uint64_t)(v16 + 3), (uint64_t)v14) & 1) != 0)
    {
      uint64_t v7 = sub_10001267C("item");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Keychain database checkpoint succeeded",  buf,  2u);
      }

      uint64_t v9 = 0LL;
    }

    else
    {
      uint64_t v11 = sub_10001267C("SecError");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v16[3];
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "item: keychain database checkpoint failed: %@",  buf,  0xCu);
      }

      uint64_t v9 = 4294941020LL;
    }

    v4[2](v4, v9, v16[3]);
    CFTypeRef v13 = (const void *)v16[3];
    if (v13)
    {
      v16[3] = 0LL;
      CFRelease(v13);
    }

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -34018LL,  0LL));
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 4294933278LL, v10);
  }
}

- (void)secItemPromoteItemsForAppClip:(id)a3 toParentApp:(id)a4 completion:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  if (-[SecuritydXPCServer clientHasBooleanEntitlement:]( self,  "clientHasBooleanEntitlement:",  @"com.apple.private.keychain.appclipdeletion"))
  {
    id v10 = (os_log_s *)sub_10001267C("item");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Request to promote keychain items for app clip '%@' to parent app '%@'",  buf,  0x16u);
    }

    uint64_t v44 = 0LL;
    id v45 = &v44;
    uint64_t v46 = 0x2000000000LL;
    uint64_t v47 = 0LL;
    uint64_t v40 = 0LL;
    v41 = &v40;
    uint64_t v42 = 0x2000000000LL;
    char v43 = 1;
    uint64_t v36 = 0LL;
    id v37 = &v36;
    uint64_t v38 = 0x2000000000LL;
    CFRange v39 = (__CFDictionary *)0xAAAAAAAAAAAAAAAALL;
    CFRange v39 = sub_1000D5B04( kCFAllocatorDefault,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (void *)kSecAttrAccessGroup,  (uint64_t)v35);
    CFDictionaryRef v25 = sub_100107FA8( kCFAllocatorDefault,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)@"clip",  (uint64_t)kCFBooleanFalse);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 0x40000000LL;
    *(void *)&uint8_t buf[16] = sub_1001099B8;
    v51 = &unk_1002871D8;
    v52 = &v44;
    v53 = &v36;
    v54 = &v40;
    CFDictionaryRef v55 = v25;
    char v26 = sub_100110ECC(1, 1, 0LL, (uint64_t)(v45 + 3), (uint64_t)buf);
    if (*((_BYTE *)v41 + 24)) {
      char v27 = v26;
    }
    else {
      char v27 = 0;
    }
    *((_BYTE *)v41 + 24) = v27;
    uint64_t v28 = (const void *)v37[3];
    if (v28)
    {
      v37[3] = 0LL;
      CFRelease(v28);
    }

    if (v25) {
      CFRelease(v25);
    }
    int v29 = *((unsigned __int8 *)v41 + 24);
    __int16 v30 = (os_log_s *)sub_10001267C("item");
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)v48 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Promotion reports success, now deleting leftover app clip items",  v48,  2u);
      }

      uint64_t Code = sub_1001095C4((uint64_t)v35);
    }

    else
    {
      if (v31)
      {
        uint64_t v33 = v45[3];
        *(_DWORD *)v48 = 138412290;
        uint64_t v49 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "App clip item promotion failed: %@",  v48,  0xCu);
      }

      uint64_t Code = CFErrorGetCode((CFErrorRef)v45[3]);
      __int16 v34 = (const void *)v45[3];
      if (v34)
      {
        v45[3] = 0LL;
        CFRelease(v34);
      }
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }

  else
  {
    uint64_t Code = 4294933278LL;
  }

  v9[2](v9, Code);
}

- (void)secKeychainForceUpgradeIfNeeded:(id)a3
{
  uint64_t v10 = 0LL;
  v3 = (void (**)(id, uint64_t))a3;
  v4 = sub_10001267C("secKeychainForceUpgradeIfNeeded");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Performing keychain database upgrade if needed",  buf,  2u);
  }

  if ((sub_100110ECC(0, 1, 0LL, (uint64_t)&v10, (uint64_t)&stru_100282E38) & 1) != 0)
  {
    id v6 = sub_10001267C("secKeychainForceUpgradeIfNeeded");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "succeeded", buf, 2u);
    }

    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v9 = sub_10001267C("SecError");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "secKeychainForceUpgradeIfNeeded: failed: %@",  buf,  0xCu);
    }

    uint64_t v8 = 4294941020LL;
  }

  v3[2](v3, v8);
}

- (SecuritydXPCServer)initWithConnection:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SecuritydXPCServer;
  v5 = -[SecuritydXPCServer init](&v11, "init");
  id v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  objc_storeWeak((id *)&v5->_connection, v4);
  int v7 = [v4 effectiveUserIdentifier];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  else {
LABEL_6:
  }
    uint64_t v8 = v6;

  return v8;
}

- (SecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3
{
  v3 = (char *)a3;
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___SecuritydXPCServer;
    id v4 = -[SecuritydXPCServer init](&v11, "init");
    v5 = v4;
    if (v4)
    {
      objc_storeWeak((id *)&v4->_connection, 0LL);
      id v6 = *(__SecTask **)v3;
      if (*(void *)v3) {
        CFRetain(*(CFTypeRef *)v3);
      }
      v5->_client.task = v6;
      int v7 = (__CFArray *)*((void *)v3 + 1);
      if (v7) {
        CFRetain(*((CFTypeRef *)v3 + 1));
      }
      v5->_client.accessGroups = v7;
      v5->_client.allowSystemKeychain = v3[16];
      *(_WORD *)&v5->_client.isNetworkExtension = *(_WORD *)(v3 + 17);
      v5->_client.uid = *((_DWORD *)v3 + 5);
      uint64_t v8 = (__CFData *)*((void *)v3 + 3);
      if (v8) {
        CFRetain(*((CFTypeRef *)v3 + 3));
      }
      v5->_client.musr = v8;
      v5->_client.keybag = *((_DWORD *)v3 + 8);
      uint64_t v9 = (__CFString *)*((void *)v3 + 5);
      if (v9) {
        CFRetain(*((CFTypeRef *)v3 + 5));
      }
      v5->_client.applicationIdentifier = v9;
      v5->_client.isAppClip = v3[37];
      v5->_client.allowKeychainSharing = v3[49];
    }

    self = v5;
    v3 = (char *)self;
  }

  return (SecuritydXPCServer *)v3;
}

- (BOOL)clientHasBooleanEntitlement:(id)a3
{
  return sub_10000D754(self->_client.task, (const __CFString *)a3);
}

- (void)dealloc
{
  task = self->_client.task;
  if (task)
  {
    self->_client.task = 0LL;
    CFRelease(task);
  }

  accessGroups = self->_client.accessGroups;
  if (accessGroups)
  {
    self->_client.accessGroups = 0LL;
    CFRelease(accessGroups);
  }

  musr = self->_client.musr;
  if (musr)
  {
    self->_client.musr = 0LL;
    CFRelease(musr);
  }

  applicationIdentifier = self->_client.applicationIdentifier;
  if (applicationIdentifier)
  {
    self->_client.applicationIdentifier = 0LL;
    CFRelease(applicationIdentifier);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SecuritydXPCServer;
  -[SecuritydXPCServer dealloc](&v7, "dealloc");
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end