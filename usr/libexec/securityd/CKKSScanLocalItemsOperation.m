@interface CKKSScanLocalItemsOperation
- (BOOL)areEquivalent:(SecDbItem *)a3 ckksItem:(id)a4 keyCache:(id)a5;
- (BOOL)executeQuery:(id)a3 readWrite:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)onboardItemToCKKS:(SecDbItem *)a3 viewState:(id)a4 keyCache:(id)a5 error:(id *)a6;
- (CKKSOperationDependencies)deps;
- (CKKSScanLocalItemsOperation)init;
- (CKKSScanLocalItemsOperation)initWithDependencies:(id)a3 intending:(id)a4 errorState:(id)a5 ckoperationGroup:(id)a6;
- (CKOperationGroup)ckoperationGroup;
- (NSMutableSet)viewsWithNewCKKSEntries;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)queryPredicatesForViewMapping:(id)a3;
- (unint64_t)missingLocalItemsFound;
- (unint64_t)processedItems;
- (unint64_t)recordsAdded;
- (unint64_t)recordsFound;
- (void)fixUUIDlessItemsInZone:(id)a3 primaryKeys:(id)a4 databaseProvider:(id)a5;
- (void)main;
- (void)onboardItemsInView:(id)a3 uuids:(id)a4 itemClass:(id)a5 databaseProvider:(id)a6;
- (void)retriggerMissingMirrorEntries:(id)a3 databaseProvider:(id)a4;
- (void)setCkoperationGroup:(id)a3;
- (void)setDeps:(id)a3;
- (void)setMissingLocalItemsFound:(unint64_t)a3;
- (void)setNextState:(id)a3;
- (void)setProcessedItems:(unint64_t)a3;
- (void)setRecordsAdded:(unint64_t)a3;
- (void)setRecordsFound:(unint64_t)a3;
- (void)setViewsWithNewCKKSEntries:(id)a3;
@end

@implementation CKKSScanLocalItemsOperation

- (CKKSScanLocalItemsOperation)init
{
  return 0LL;
}

- (CKKSScanLocalItemsOperation)initWithDependencies:(id)a3 intending:(id)a4 errorState:(id)a5 ckoperationGroup:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CKKSScanLocalItemsOperation;
  v15 = -[CKKSResultOperation init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->super._finishingBlock, a3);
    objc_storeStrong((id *)&v16->super._timeoutQueue, a6);
    objc_storeStrong((id *)&v16->super._descriptionUnderlyingError, a5);
    objc_storeStrong((id *)&v16->super._successDependencies, a4);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    recordsFound = (void *)v16->_recordsFound;
    v16->_recordsFound = v17;

    v16->_nextState = 0LL;
    v16->_intendedState = 0LL;
  }

  return v16;
}

- (id)queryPredicatesForViewMapping:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 1 && objc_msgSend(v4, "count"))
  {
    id v67 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);

    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 syncingPolicy]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyViewMapping]);

    id v10 = [v9 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v10)
    {
      id v11 = v10;
      id v68 = 0LL;
      uint64_t v12 = *(void *)v70;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v70 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 view]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
          unsigned int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            if (v68)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoneName]);
              id v23 = sub_1000AA6AC(@"ckksscan", v22);
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
                *(_DWORD *)buf = 138412290;
                id v81 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Too many policy rules for view %@",  buf,  0xCu);
              }

              objc_super v20 = &__NSDictionary0__struct;
              id v4 = v67;
              goto LABEL_34;
            }

            id v68 = v14;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v68 = 0LL;
    }

    id v4 = v67;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    if ([v27 andsCount]) {
      goto LABEL_29;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    if ([v28 orsCount])
    {
LABEL_28:

LABEL_29:
LABEL_30:
      id v31 = sub_1000AA6AC(@"ckksscan", 0LL);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:

        objc_super v20 = &__NSDictionary0__struct;
LABEL_34:

        goto LABEL_35;
      }

      *(_DWORD *)buf = 138412290;
      id v81 = v68;
      v33 = "Policy view rule is complex: %@";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
      goto LABEL_33;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    if ([v29 hasNot])
    {
LABEL_27:

      goto LABEL_28;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    if ([v30 hasExists])
    {

      goto LABEL_27;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    unsigned int v36 = [v35 hasMatch];

    if (!v36) {
      goto LABEL_30;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 match]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 fieldName]);
    if ((-[__CFString isEqualToString:]((id)kSecAttrSyncViewHint, "isEqualToString:", v39) & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
      v65 = (void *)objc_claimAutoreleasedReturnValue([v40 match]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v65 regex]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneName]);
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"^%@$", v43));
      unsigned int v64 = [v41 isEqualToString:v44];

      if (v64)
      {
        CFStringRef v77 = kSecAttrSyncViewHint;
        v45 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
        v78 = v45;
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));

        goto LABEL_34;
      }
    }

    else
    {
    }

    v46 = (__CFString *)kSecAttrAccessGroup;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v47 match]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 fieldName]);
    if ((-[__CFString isEqualToString:]((id)kSecAttrAccessGroup, "isEqualToString:", v49) & 1) != 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 match]);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 regex]);
      unsigned int v53 = [v52 isEqualToString:@"^com\\.apple\\.cfnetwork$"];

      v46 = (__CFString *)kSecAttrAccessGroup;
      if (v53)
      {
        CFStringRef v75 = kSecAttrAccessGroup;
        v76 = @"com.apple.cfnetwork";
        v54 = &v76;
        v55 = &v75;
LABEL_48:
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v55,  1LL));
        goto LABEL_34;
      }
    }

    else
    {
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v56 match]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v57 fieldName]);
    if ((-[__CFString isEqualToString:](v46, "isEqualToString:", v58) & 1) != 0)
    {
      v66 = v46;
      v59 = (void *)objc_claimAutoreleasedReturnValue([v68 matchingRule]);
      v60 = (void *)objc_claimAutoreleasedReturnValue([v59 match]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v60 regex]);
      unsigned int v62 = [v61 isEqualToString:@"^com\\.apple\\.safari\\.credit-cards$"];

      if (v62)
      {
        v73 = v66;
        v74 = @"com.apple.safari.credit-cards";
        v54 = &v74;
        v55 = (CFStringRef *)&v73;
        goto LABEL_48;
      }
    }

    else
    {
    }

    id v63 = sub_1000AA6AC(@"ckksscan", 0LL);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412290;
    id v81 = v68;
    v33 = "Policy view rule is not a match against viewhint: %@";
    goto LABEL_32;
  }

  id v19 = sub_1000AA6AC(@"ckksscan", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v81 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Not acting on exactly one view; not limiting query: %@",
      buf,
      0xCu);
  }

  objc_super v20 = &__NSDictionary0__struct;
LABEL_35:

  return v20;
}

- (BOOL)executeQuery:(id)a3 readWrite:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  BOOL v8 = a4;
  id v10 = (const __CFDictionary *)a3;
  id v11 = a6;
  uint64_t v32 = 0LL;
  v33 = (__CFString **)&v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  id v12 = [self->super._finishingBlock keychainMusrForCurrentAccount];
  uint64_t v13 = sub_1000F8790(v10, v12, -1LL, 0LL, v33 + 3);
  uint64_t v14 = (uint64_t)(v33 + 3);
  if (v33[3])
  {
    id v15 = sub_1000AA6AC(@"ckksscan", 0LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v33[3];
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "couldn't create query: %@", buf, 0xCu);
    }

    unsigned int v18 = v33[3];
    if (a5)
    {
      BOOL v19 = 0;
      *a5 = v18;
    }

    else
    {
      if (v18)
      {
        v33[3] = 0LL;
        CFRelease(v18);
      }

      BOOL v19 = 0;
    }
  }

  else
  {
    objc_super v20 = (const void **)v13;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000A0CDC;
    v28[3] = &unk_100284C60;
    v30 = &v32;
    uint64_t v31 = v13;
    id v29 = v11;
    int v21 = sub_100110ECC(v8, 1, 0LL, v14, (uint64_t)v28);
    if (v8) {
      char v22 = sub_1000F8254((uint64_t)v20, v21, (CFErrorRef *)v33 + 3);
    }
    else {
      char v22 = sub_1000F8150(v20, (CFErrorRef *)v33 + 3);
    }
    if (v33[3]) {
      BOOL v19 = 0;
    }
    else {
      BOOL v19 = v22;
    }
    if (!v19)
    {
      id v23 = sub_1000AA6AC(@"ckksscan", 0LL);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = v33[3];
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "couldn't execute query: %@", buf, 0xCu);
      }

      v26 = v33[3];
      if (a5)
      {
        *a5 = v26;
      }

      else if (v26)
      {
        v33[3] = 0LL;
        CFRelease(v26);
      }
    }
  }

  _Block_object_dispose(&v32, 8);

  return v19;
}

- (BOOL)onboardItemToCKKS:(SecDbItem *)a3 viewState:(id)a4 keyCache:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contextID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  id v30 = 0LL;
  id v15 = (SecDbItem *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry withItem:action:contextID:zoneID:keyCache:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "withItem:action:contextID:zoneID:keyCache:error:",  a3,  @"add",  v13,  v14,  v11,  &v30));

  id v16 = v30;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
  id v19 = sub_1000AA6AC(@"ckksscan", v18);
  objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

  if (!v16)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Syncing new item: %@", buf, 0xCu);
    }

    id v29 = 0LL;
    -[SecDbItem saveToDatabase:](v15, "saveToDatabase:", &v29);
    id v22 = v29;
    if (!v22)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](self, "viewsWithNewCKKSEntries"));
      [v27 addObject:v10];

      -[CKKSScanLocalItemsOperation setRecordsAdded:]( self,  "setRecordsAdded:",  (char *)-[CKKSScanLocalItemsOperation recordsAdded](self, "recordsAdded") + 1);
      id v16 = 0LL;
      BOOL v21 = 1;
      goto LABEL_14;
    }

    id v16 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneName]);
    id v25 = sub_1000AA6AC(@"ckksscan", v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Need to upload %@, but can't save to database: %@",  buf,  0x16u);
    }

    -[CKKSResultOperation setError:](self, "setError:", v16);
    goto LABEL_12;
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478083;
    uint64_t v32 = a3;
    __int16 v33 = 2112;
    id v34 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Need to upload %{private}@, but can't create outgoing entry: %@",  buf,  0x16u);
  }

  if (!a6)
  {
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_14;
  }

  id v16 = v16;
  BOOL v21 = 0;
  *a6 = v16;
LABEL_14:

  return v21;
}

- (void)onboardItemsInView:(id)a3 uuids:(id)a4 itemClass:(id)a5 databaseProvider:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v9;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
  id v16 = sub_1000AA6AC(@"ckksscan", v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v36 = [v10 count];
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found %d missing %@ items", buf, 0x12u);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v10;
  id v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      BOOL v21 = 0LL;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v21);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_1000A090C;
        v25[3] = &unk_100290100;
        id v26 = v11;
        uint64_t v27 = v22;
        v28 = self;
        id v29 = v13;
        [v12 dispatchSyncWithSQLTransaction:v25];

        BOOL v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v19);
  }
}

- (void)fixUUIDlessItemsInZone:(id)a3 primaryKeys:(id)a4 databaseProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
  id v13 = sub_1000AA6AC(@"ckksscan", v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v20 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found %d items missing UUIDs", buf, 8u);
  }

  if ([v9 count])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009FF44;
    v15[3] = &unk_100290208;
    id v16 = v9;
    id v17 = v8;
    id v18 = self;
    [v10 dispatchSyncWithSQLTransaction:v15];
  }
}

- (void)retriggerMissingMirrorEntries:(id)a3 databaseProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009FB80;
    v11[3] = &unk_1002904C8;
    id v12 = (os_log_s *)v6;
    id v13 = self;
    [v7 dispatchSyncWithSQLTransaction:v11];
    id v8 = v12;
  }

  else
  {
    id v9 = sub_1000AA6AC(@"ckksscan", 0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No missing local items found", v10, 2u);
    }
  }
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v112 = (void *)os_transaction_create("com.apple.securityd.ckks.scan");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v126 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = sub_1000AA6AC(@"ckksscan", 0LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeManagedViews]);
    *(_DWORD *)buf = 138412290;
    *(void *)v165 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scanning for views: %@", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v114 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v171 = kSecurityRTCFieldNumViews;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v117 = (void *)objc_claimAutoreleasedReturnValue([v124 activeManagedViews]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v117 count]));
  v172 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v172,  &v171,  1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeAccount]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 altDSID]);
  uint64_t v16 = kSecurityRTCEventNameScanLocalItems;
  uint64_t v17 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  v115 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v114,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v12,  v15,  v16,  0,  v17,  [v18 sendMetric]);

  __int128 v157 = 0u;
  __int128 v158 = 0u;
  __int128 v155 = 0u;
  __int128 v156 = 0u;
  v125 = self;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activeManagedViews]);

  id v21 = [v20 countByEnumeratingWithState:&v155 objects:v170 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v156;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v156 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v155 + 1) + 8LL * (void)i);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneID]);
        [v10 addObject:v26];

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 viewKeyHierarchyState]);
        unsigned int v28 = [v27 isEqualToString:@"ready"];

        if (v28)
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v25 launch]);
          [v29 addEvent:@"scan-local-items-begin"];
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v155 objects:v170 count:16];
    }

    while (v22);
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 overallLaunch]);
  [v31 addEvent:@"scan-local-items-begin"];

  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472LL;
  v148[2] = sub_10009E390;
  v148[3] = &unk_100284D50;
  id v32 = v119;
  id v149 = v32;
  v150 = v125;
  id v33 = v10;
  id v151 = v33;
  id v34 = v121;
  id v152 = v34;
  id v118 = v123;
  id v153 = v118;
  uint64_t v35 = v115;
  v154 = v35;
  [v126 dispatchSyncWithReadOnlySQLTransaction:v148];
  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v125, "error"));

  if (v36)
  {
    id v37 = sub_1000AA6AC(@"ckksscan", 0LL);
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v125, "error"));
      *(_DWORD *)buf = 138412290;
      *(void *)v165 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Exiting due to previous error: %@",  buf,  0xCu);
    }

    v40 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v125, "error"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v35,  0LL,  v40);
  }

  else
  {
    v108 = v35;
    id v109 = v33;
    v110 = v34;
    id v111 = v32;
    v41 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 activeAccount]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 altDSID]);
    uint64_t v45 = kSecurityRTCEventNameOnboardMissingItems;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
    v107 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v41,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v44,  v45,  0,  v17,  [v46 sendMetric]);

    id v47 = sub_1000AA6AC(@"ckksscan", 0LL);
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v49 = [v118 count];
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 activeManagedViews]);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v165 = v49;
      *(_WORD *)&v165[4] = 2112;
      *(void *)&v165[6] = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Found %d views with missing items for %@",  buf,  0x12u);
    }

    __int128 v146 = 0u;
    __int128 v147 = 0u;
    __int128 v144 = 0u;
    __int128 v145 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v118 allKeys]);
    id v120 = [obj countByEnumeratingWithState:&v144 objects:v169 count:16];
    if (v120)
    {
      uint64_t v116 = *(void *)v145;
      do
      {
        uint64_t v52 = 0LL;
        do
        {
          if (*(void *)v145 != v116) {
            objc_enumerationMutation(obj);
          }
          uint64_t v122 = v52;
          unsigned int v53 = *(void **)(*((void *)&v144 + 1) + 8 * v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue([v118 objectForKeyedSubscript:v53]);
          __int128 v140 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          __int128 v143 = 0u;
          v55 = (void *)objc_claimAutoreleasedReturnValue([v54 allKeys]);
          id v56 = [v55 countByEnumeratingWithState:&v140 objects:v168 count:16];
          if (v56)
          {
            id v57 = v56;
            uint64_t v58 = *(void *)v141;
            do
            {
              for (j = 0LL; j != v57; j = (char *)j + 1)
              {
                if (*(void *)v141 != v58) {
                  objc_enumerationMutation(v55);
                }
                uint64_t v60 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)j);
                v61 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v60]);
                unsigned int v62 = (void *)objc_claimAutoreleasedReturnValue([v53 zoneName]);
                id v63 = sub_1000AA6AC(@"ckksscan", v62);
                unsigned int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);

                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v65 = [v61 count];
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v165 = v65;
                  *(_WORD *)&v165[4] = 2112;
                  *(void *)&v165[6] = v60;
                  __int16 v166 = 2112;
                  v167 = v53;
                  _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Found %d missing %@ items for %@",  buf,  0x1Cu);
                }

                -[CKKSScanLocalItemsOperation onboardItemsInView:uuids:itemClass:databaseProvider:]( v125,  "onboardItemsInView:uuids:itemClass:databaseProvider:",  v53,  v61,  v60,  v126);
              }

              id v57 = [v55 countByEnumeratingWithState:&v140 objects:v168 count:16];
            }

            while (v57);
          }

          uint64_t v52 = v122 + 1;
        }

        while ((id)(v122 + 1) != v120);
        id v120 = [obj countByEnumeratingWithState:&v144 objects:v169 count:16];
      }

      while (v120);
    }

    __int128 v138 = 0u;
    __int128 v139 = 0u;
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    v66 = (void *)objc_claimAutoreleasedReturnValue([v110 allKeys]);
    id v67 = [v66 countByEnumeratingWithState:&v136 objects:v163 count:16];
    if (v67)
    {
      id v68 = v67;
      uint64_t v69 = *(void *)v137;
      do
      {
        for (k = 0LL; k != v68; k = (char *)k + 1)
        {
          if (*(void *)v137 != v69) {
            objc_enumerationMutation(v66);
          }
          uint64_t v71 = *(void *)(*((void *)&v136 + 1) + 8LL * (void)k);
          __int128 v72 = (void *)objc_claimAutoreleasedReturnValue([v110 objectForKeyedSubscript:v71]);
          -[CKKSScanLocalItemsOperation fixUUIDlessItemsInZone:primaryKeys:databaseProvider:]( v125,  "fixUUIDlessItemsInZone:primaryKeys:databaseProvider:",  v71,  v72,  v126);
        }

        id v68 = [v66 countByEnumeratingWithState:&v136 objects:v163 count:16];
      }

      while (v68);
    }

    -[CKKSScanLocalItemsOperation retriggerMissingMirrorEntries:databaseProvider:]( v125,  "retriggerMissingMirrorEntries:databaseProvider:",  v111,  v126);
    __int128 v134 = 0u;
    __int128 v135 = 0u;
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
    v74 = (void *)objc_claimAutoreleasedReturnValue([v73 activeManagedViews]);

    id v75 = [v74 countByEnumeratingWithState:&v132 objects:v162 count:16];
    if (v75)
    {
      id v76 = v75;
      uint64_t v77 = *(void *)v133;
      do
      {
        for (m = 0LL; m != v76; m = (char *)m + 1)
        {
          if (*(void *)v133 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v132 + 1) + 8 * (void)m) zoneID]);
          v80 = (void *)objc_claimAutoreleasedReturnValue([v79 zoneName]);
          +[CKKSPowerCollection CKKSPowerEvent:zone:count:]( &OBJC_CLASS___CKKSPowerCollection,  "CKKSPowerEvent:zone:count:",  @"scanLocalItems",  v80,  -[CKKSScanLocalItemsOperation processedItems](v125, "processedItems"));
        }

        id v76 = [v74 countByEnumeratingWithState:&v132 objects:v162 count:16];
      }

      while (v76);
    }

    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472LL;
    v131[2] = sub_10009ECB4;
    v131[3] = &unk_100290F80;
    v131[4] = v125;
    [v126 dispatchSyncWithSQLTransaction:v131];
    id v81 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](v125, "viewsWithNewCKKSEntries"));
    id v82 = [v81 count];

    uint64_t v35 = v108;
    id v33 = v109;
    v40 = v107;
    if (v82)
    {
      __int128 v129 = 0u;
      __int128 v130 = 0u;
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](v125, "viewsWithNewCKKSEntries"));
      id v84 = [v83 countByEnumeratingWithState:&v127 objects:v161 count:16];
      if (v84)
      {
        id v85 = v84;
        uint64_t v86 = *(void *)v128;
        do
        {
          for (n = 0LL; n != v85; n = (char *)n + 1)
          {
            if (*(void *)v128 != v86) {
              objc_enumerationMutation(v83);
            }
            v88 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v127 + 1) + 8 * (void)n) notifyViewChangedScheduler]);
            [v88 trigger];
          }

          id v85 = [v83 countByEnumeratingWithState:&v127 objects:v161 count:16];
        }

        while (v85);
      }

      v89 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation ckoperationGroup](v125, "ckoperationGroup"));
      if (v89)
      {
        id v90 = sub_1000AA6AC(@"ckksscan", 0LL);
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation ckoperationGroup](v125, "ckoperationGroup"));
          *(_DWORD *)buf = 138412290;
          *(void *)v165 = v92;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "Transferring ckoperation group %@",  buf,  0xCu);
        }

        v93 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation ckoperationGroup](v125, "ckoperationGroup"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
        [v94 setCurrentOutgoingQueueOperationGroup:v93];
      }

      v95 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
      v96 = (void *)objc_claimAutoreleasedReturnValue([v95 flagHandler]);
      [v96 handleFlag:@"process_outgoing_queue"];
    }

    uint64_t v159 = kSecurityRTCFieldNumViewsWithNewEntries;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation viewsWithNewCKKSEntries](v125, "viewsWithNewCKKSEntries"));
    v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v97 count]));
    v160 = v98;
    v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v160,  &v159,  1LL));
    -[AAFAnalyticsEventSecurity addMetrics:](v107, "addMetrics:", v99);

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v125, "error"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v107,  1LL,  v100);

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](v125, "error"));
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v108,  1LL,  v101);

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation intendedState](v125, "intendedState"));
    -[CKKSScanLocalItemsOperation setNextState:](v125, "setNextState:", v102);

    if (-[CKKSScanLocalItemsOperation missingLocalItemsFound](v125, "missingLocalItemsFound"))
    {
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](v125, "deps"));
      v104 = (void *)objc_claimAutoreleasedReturnValue([v103 flagHandler]);
      [v104 handleFlag:@"process_incoming_queue"];
    }

    id v105 = sub_1000AA6AC(@"ckksscan", 0LL);
    v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
    id v34 = v110;
    id v32 = v111;
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Completed scan", buf, 2u);
    }
  }
}

- (BOOL)areEquivalent:(SecDbItem *)a3 ckksItem:(id)a4 keyCache:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  id v46 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:]( &OBJC_CLASS___CKKSIncomingQueueOperation,  "decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:",  v8,  v9,  v10,  &v46));
  id v12 = (__CFString *)v46;
  id v13 = [v11 mutableCopy];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSScanLocalItemsOperation deps](self, "deps"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 keychainMusrForCurrentAccount]);
  [v13 setObject:v15 forKeyedSubscript:kSecAttrMultiUser];

  v40 = v13;
  if (!v13 || v12)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
    id v31 = sub_1000AA6AC(@"ckksscan", v30);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v49 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Could not decrypt item for comparison: %@",  buf,  0xCu);
    }

    BOOL v28 = 1;
  }

  else
  {
    uint64_t v45 = 0LL;
    uint64_t v16 = sub_1000E6EA4(a3, 0x10000LL, 0LL, &v45);
    uint64_t v17 = v16;
    id v12 = v45;
    if (!v16 || v45)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
      id v35 = sub_1000AA6AC(@"ckksscan", v34);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v49 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Could not get item contents for comparison: %@",  buf,  0xCu);
      }

      BOOL v28 = 0;
    }

    else
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v18 = v16;
      id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
      if (v19)
      {
        id v20 = v19;
        id v37 = v17;
        id v38 = v9;
        id v39 = v8;
        uint64_t v21 = *(void *)v42;
        uint64_t v22 = kSecAttrSHA1;
        while (2)
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v42 != v21) {
              objc_enumerationMutation(v18);
            }
            v24 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            if (([v24 isEqual:kSecAttrCreationDate] & 1) == 0
              && ([v24 isEqual:kSecAttrModificationDate] & 1) == 0
              && ([v24 isEqual:v22] & 1) == 0)
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v24));
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v24]);
              unsigned int v27 = [v25 isEqual:v26];

              if (!v27)
              {
                BOOL v28 = 0;
                goto LABEL_24;
              }
            }
          }

          id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
          if (v20) {
            continue;
          }
          break;
        }

        BOOL v28 = 1;
LABEL_24:
        id v9 = v38;
        id v8 = v39;
        uint64_t v17 = v37;
      }

      else
      {
        BOOL v28 = 1;
      }
    }
  }

  return v28;
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (unint64_t)recordsFound
{
  return (unint64_t)self->_nextState;
}

- (void)setRecordsFound:(unint64_t)a3
{
  self->_nextState = (OctagonStateString *)a3;
}

- (unint64_t)recordsAdded
{
  return (unint64_t)self->_intendedState;
}

- (void)setRecordsAdded:(unint64_t)a3
{
  self->_intendedState = (OctagonStateString *)a3;
}

- (unint64_t)missingLocalItemsFound
{
  return (unint64_t)self->_ckoperationGroup;
}

- (void)setMissingLocalItemsFound:(unint64_t)a3
{
  self->_ckoperationGroup = (CKOperationGroup *)a3;
}

- (unint64_t)processedItems
{
  return (unint64_t)self->_deps;
}

- (void)setProcessedItems:(unint64_t)a3
{
  self->_deps = (CKKSOperationDependencies *)a3;
}

- (NSMutableSet)viewsWithNewCKKSEntries
{
  return (NSMutableSet *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setViewsWithNewCKKSEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end