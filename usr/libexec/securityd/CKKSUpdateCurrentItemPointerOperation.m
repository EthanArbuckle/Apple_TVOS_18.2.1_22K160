@interface CKKSUpdateCurrentItemPointerOperation
- (CKFetchRecordsOperation)fetchRecordsOperation;
- (CKKSKeychainViewState)viewState;
- (CKKSOperationDependencies)deps;
- (CKKSUpdateCurrentItemPointerOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 newItem:(id)a5 hash:(id)a6 accessGroup:(id)a7 identifier:(id)a8 replacing:(id)a9 hash:(id)a10 ckoperationGroup:(id)a11;
- (CKModifyRecordsOperation)modifyRecordsOperation;
- (CKOperationGroup)ckoperationGroup;
- (NSData)newerItemPersistentRef;
- (NSData)newerItemSHA1;
- (NSData)oldItemPersistentRef;
- (NSData)oldItemSHA1;
- (NSString)accessGroup;
- (NSString)currentPointerIdentifier;
- (SecDbItem)_onqueueFindSecDbItem:(id)a3 accessGroup:(id)a4 error:(id *)a5;
- (SecDbItem)_onqueueFindSecDbItemWithQuery:(id)a3 error:(id *)a4;
- (SecDbItem)_onqueueFindSecDbItemWithUUID:(id)a3 accessGroup:(id)a4 error:(id *)a5;
- (SecDbItem)newItem;
- (SecDbItem)oldItem;
- (void)_fetchAndUpdateMirrorEntry:(id)a3;
- (void)dealloc;
- (void)groupStart;
- (void)setAccessGroup:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setCurrentPointerIdentifier:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFetchRecordsOperation:(id)a3;
- (void)setModifyRecordsOperation:(id)a3;
- (void)setNewItem:(SecDbItem *)a3;
- (void)setNewerItemPersistentRef:(id)a3;
- (void)setNewerItemSHA1:(id)a3;
- (void)setOldItem:(SecDbItem *)a3;
- (void)setOldItemPersistentRef:(id)a3;
- (void)setOldItemSHA1:(id)a3;
@end

@implementation CKKSUpdateCurrentItemPointerOperation

- (CKKSUpdateCurrentItemPointerOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 newItem:(id)a5 hash:(id)a6 accessGroup:(id)a7 identifier:(id)a8 replacing:(id)a9 hash:(id)a10 ckoperationGroup:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id obj = a7;
  id v18 = a7;
  id v19 = a8;
  id v28 = a9;
  id v27 = a10;
  id v20 = a11;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___CKKSUpdateCurrentItemPointerOperation;
  v21 = -[CKKSGroupOperation init](&v33, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_viewState, a3);
    objc_storeStrong((id *)&v22->super._finishOperation, a4);
    objc_storeStrong((id *)&v22->_fetchRecordsOperation, a5);
    objc_storeStrong((id *)&v22->_ckoperationGroup, a6);
    objc_storeStrong((id *)&v22->_deps, a9);
    objc_storeStrong((id *)&v22->_accessGroup, a10);
    objc_storeStrong((id *)&v22->_modifyRecordsOperation, obj);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v18, v19));
    startOperation = v22->super._startOperation;
    v22->super._startOperation = (NSBlockOperation *)v23;

    objc_storeStrong((id *)&v22->_currentPointerIdentifier, a11);
    -[CKKSUpdateCurrentItemPointerOperation setQualityOfService:](v22, "setQualityOfService:", 25LL);
  }

  return v22;
}

- (void)dealloc
{
  if (self)
  {
    newerItemPersistentRef = self->_newerItemPersistentRef;
    if (newerItemPersistentRef)
    {
      self->_newerItemPersistentRef = 0LL;
      CFRelease(newerItemPersistentRef);
    }

    newerItemSHA1 = self->_newerItemSHA1;
    if (newerItemSHA1)
    {
      self->_newerItemSHA1 = 0LL;
      CFRelease(newerItemSHA1);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CKKSUpdateCurrentItemPointerOperation;
  -[CKKSGroupOperation dealloc](&v5, "dealloc");
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013186C;
  v7[3] = &unk_100290258;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [v6 dispatchSyncWithSQLTransaction:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_fetchAndUpdateMirrorEntry:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSBlockOperation);
  -[NSBlockOperation setName:](v5, "setName:", @"updateCurrentItemPointer-fetchRecordsComplete");
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudKitClassDependencies]);
  id v8 = objc_msgSend(objc_msgSend(v7, "fetchRecordsOperationClass"), "alloc");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 item]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 storedCKRecord]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
  id v31 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  id v13 = [v8 initWithRecordIDs:v12];
  -[CKKSUpdateCurrentItemPointerOperation setFetchRecordsOperation:](self, "setFetchRecordsOperation:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 configuration]);
  [v15 setIsCloudKitSupportOperation:1];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  [v16 setQualityOfService:25];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation ckoperationGroup](self, "ckoperationGroup"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  [v18 setGroup:v17];

  objc_copyWeak(&v29, &location);
  id v19 = v5;
  id v27 = v19;
  id v20 = v4;
  id v28 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation]( self,  "fetchRecordsOperation",  _NSConcreteStackBlock,  3221225472LL,  sub_10013137C,  &unk_100290280));
  [v21 setFetchRecordsCompletionBlock:&v26];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v22);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation deps](self, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 ckdatabase]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation fetchRecordsOperation](self, "fetchRecordsOperation"));
  [v24 addOperation:v25];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (SecDbItem)_onqueueFindSecDbItem:(id)a3 accessGroup:(id)a4 error:(id *)a5
{
  v13[0] = kSecValuePersistentRef;
  v13[1] = kSecAttrAccessGroup;
  v14[0] = a3;
  v14[1] = a4;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  v11 = -[CKKSUpdateCurrentItemPointerOperation _onqueueFindSecDbItemWithQuery:error:]( self,  "_onqueueFindSecDbItemWithQuery:error:",  v10,  a5);
  return v11;
}

- (SecDbItem)_onqueueFindSecDbItemWithUUID:(id)a3 accessGroup:(id)a4 error:(id *)a5
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = kSecAttrTombstone;
  uint64_t v8 = kSecAttrUUID;
  id v9 = &off_1002898F8;
  v10 = off_10028BA88;
  while (1)
  {
    if (*((_BYTE *)v9 + 8))
    {
      v18[0] = kSecClass;
      v19[0] = *v9;
      v19[1] = kSecAttrSynchronizableAny;
      v18[1] = kSecAttrSynchronizable;
      v18[2] = v7;
      v19[2] = &__kCFBooleanFalse;
      v19[3] = v17;
      v18[3] = v8;
      v18[4] = kSecAttrAccessGroup;
      v19[4] = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  5LL));
      v12 = -[CKKSUpdateCurrentItemPointerOperation _onqueueFindSecDbItemWithQuery:error:]( self,  "_onqueueFindSecDbItemWithQuery:error:",  v11,  a5);

      if (v12) {
        break;
      }
    }

    id v13 = *v10++;
    id v9 = v13;
    if (!v13)
    {
      v12 = 0LL;
      break;
    }
  }

  return v12;
}

- (SecDbItem)_onqueueFindSecDbItemWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  uint64_t v40 = 0LL;
  id v35 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  objc_super v33 = sub_100130FD8;
  v34 = sub_100130FE8;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100130FF0;
  v25[3] = &unk_1002902D0;
  id v6 = a3;
  id v26 = v6;
  id v27 = self;
  id v28 = &v30;
  id v29 = &v37;
  int v7 = sub_100110ECC(1, 1, 0LL, (uint64_t)&cf, (uint64_t)v25);
  uint64_t v8 = v31[5];
  if (!v7)
  {
    if (!v8)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateCurrentItemPointerOperation viewState](self, "viewState"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
      id v19 = sub_1000AA6AC(@"ckkscurrent", v18);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v42 = cf;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Query failed, cferror is %@", buf, 0xCu);
      }

      v21 = (void *)cf;
      uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  -50LL,  @"couldn't run query",  cf));
      uint64_t v23 = (void *)v31[5];
      v31[5] = v22;

      CFTypeRef cf = 0LL;
      if (!*a4) {
        goto LABEL_17;
      }
LABEL_14:
      *a4 = (id) v31[5];
LABEL_15:
      if (cf) {
        CFRelease(cf);
      }
LABEL_17:
      id v9 = 0LL;
      goto LABEL_18;
    }

- (NSString)currentPointerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setCurrentPointerIdentifier:(id)a3
{
}

- (CKKSKeychainViewState)viewState
{
  return (CKKSKeychainViewState *)objc_getProperty(self, a2, 136LL, 1);
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return (CKModifyRecordsOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setModifyRecordsOperation:(id)a3
{
}

- (CKFetchRecordsOperation)fetchRecordsOperation
{
  return (CKFetchRecordsOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFetchRecordsOperation:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSData)newerItemPersistentRef
{
  return (NSData *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setNewerItemPersistentRef:(id)a3
{
}

- (NSData)newerItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setNewerItemSHA1:(id)a3
{
}

- (NSData)oldItemPersistentRef
{
  return (NSData *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setOldItemPersistentRef:(id)a3
{
}

- (NSData)oldItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setOldItemSHA1:(id)a3
{
}

- (SecDbItem)newItem
{
  return (SecDbItem *)self->_newerItemPersistentRef;
}

- (void)setNewItem:(SecDbItem *)a3
{
  self->_newerItemPersistentRef = (NSData *)a3;
}

- (SecDbItem)oldItem
{
  return (SecDbItem *)self->_newerItemSHA1;
}

- (void)setOldItem:(SecDbItem *)a3
{
  self->_newerItemSHA1 = (NSData *)a3;
}

- (void).cxx_destruct
{
}

@end