@interface CKKSOutgoingQueueEntry
+ (id)allInState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)allWithUUID:(id)a3 states:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fetch:(int64_t)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabaseRow:(id)a3;
+ (id)keyForItem:(SecDbItem *)a3 contextID:(id)a4 zoneID:(id)a5 keyCache:(id)a6 error:(id *)a7;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)tryFromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)withItem:(SecDbItem *)a3 action:(id)a4 contextID:(id)a5 zoneID:(id)a6 keyCache:(id)a7 error:(id *)a8;
+ (int64_t)countByState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)intransactionMarkAsError:(id)a3 viewState:(id)a4 error:(id *)a5;
- (BOOL)intransactionMoveToState:(id)a3 viewState:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (CKKSItem)item;
- (CKKSOutgoingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5 waitUntil:(id)a6 accessGroup:(id)a7;
- (NSDate)waitUntil;
- (NSString)accessgroup;
- (NSString)action;
- (NSString)contextID;
- (NSString)state;
- (NSString)uuid;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setAccessgroup:(id)a3;
- (void)setAction:(id)a3;
- (void)setItem:(id)a3;
- (void)setState:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWaitUntil:(id)a3;
@end

@implementation CKKSOutgoingQueueEntry

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry contextID](self, "contextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry action](self, "action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%@](%@): %@ %@ (%@)>",  v5,  v6,  v9,  v10,  v12,  v13));

  return v14;
}

- (CKKSOutgoingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5 waitUntil:(id)a6 accessGroup:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CKKSOutgoingQueueEntry;
  v17 = -[CKKSOutgoingQueueEntry init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_item, a3);
    objc_storeStrong((id *)&v18->_action, a4);
    objc_storeStrong((id *)&v18->_state, a5);
    objc_storeStrong((id *)&v18->_accessgroup, a7);
    objc_storeStrong((id *)&v18->_waitUntil, a6);
  }

  return v18;
}

- (NSString)contextID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contextID]);

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKKSOutgoingQueueEntry, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 item]);
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v17 = 0;
LABEL_22:

      goto LABEL_23;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry action](self, "action"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 action]);
    if (![v10 isEqual:v11])
    {
      unsigned __int8 v17 = 0;
LABEL_21:

      goto LABEL_22;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
    if (![v12 isEqual:v13])
    {
      unsigned __int8 v17 = 0;
LABEL_20:

      goto LABEL_21;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil"));
    if (v14 || (objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v7 waitUntil])) != 0)
    {
      v27 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v7 waitUntil]);
      v26 = v15;
      objc_msgSend(v15, "timeIntervalSinceDate:");
      if (fabs(v16) >= 1.0)
      {
        unsigned __int8 v17 = 0;
        id v13 = v27;
        goto LABEL_17;
      }

      v23 = v14;
      v24 = v12;
      int v22 = 1;
      id v13 = v27;
    }

    else
    {
      v23 = 0LL;
      v24 = v12;
      objc_super v21 = 0LL;
      int v22 = 0;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry accessgroup](self, "accessgroup"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 accessgroup]);
    unsigned __int8 v17 = [v18 isEqual:v19];

    if (!v22)
    {
      id v14 = v23;
      v12 = v24;
      if (v23) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }

    id v14 = v23;
    v12 = v24;
LABEL_17:

    if (v14)
    {
LABEL_19:

      goto LABEL_20;
    }

- (NSString)uuid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uuid]);

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  [v5 setUuid:v4];
}

- (id)whereClauseToFindSelf
{
  v14[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contextID]);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v6 = v5;

  v15[0] = v6;
  v14[1] = @"UUID";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
  v15[1] = v7;
  v14[2] = @"state";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  v15[2] = v8;
  v14[3] = @"ckzone";
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4LL));

  return v12;
}

- (id)sqlValues
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sqlValues]);
  id v6 = [v5 mutableCopy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry action](self, "action"));
  [v6 setObject:v7 forKeyedSubscript:@"action"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  [v6 setObject:v8 forKeyedSubscript:@"state"];

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil"));
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry waitUntil](self, "waitUntil")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v3, "stringFromDate:", v11)),
        v11,
        v10,
        !v12))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  [v6 setObject:v12 forKeyedSubscript:@"waituntil"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry accessgroup](self, "accessgroup"));
  [v6 setObject:v13 forKeyedSubscript:@"accessgroup"];

  return v6;
}

- (BOOL)intransactionMoveToState:(id)a3 viewState:(id)a4 error:(id *)a5
{
  v8 = (CKKSOutgoingQueueEntry *)a3;
  id v9 = a4;
  if (-[CKKSOutgoingQueueEntry isEqualToString:](v8, "isEqualToString:", @"deleted"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
    v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 claimCallbackForUUID:v11]);

    if (v12) {
      v12[2](v12, 1LL, 0LL);
    }
    id v46 = 0LL;
    -[CKKSSQLDatabaseObject deleteFromDatabase:](self, "deleteFromDatabase:", &v46);
    id v13 = (CKKSOutgoingQueueEntry *)v46;
    if (v13)
    {
      id v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
      id v16 = sub_1000AA6AC(@"ckks", v15);
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        goto LABEL_23;
      }

      *(_DWORD *)buf = 138412546;
      v48 = self;
      __int16 v49 = 2112;
      v50 = v14;
      v18 = "Couldn't delete %@: %@";
      v19 = (os_log_s *)v17;
      uint32_t v20 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_18;
    }

    goto LABEL_32;
  }

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry state](self, "state"));
  if ([v21 isEqualToString:@"inflight"])
  {
    unsigned int v22 = -[CKKSOutgoingQueueEntry isEqualToString:](v8, "isEqualToString:", @"new");

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry item](self, "item"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 contextID]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      id v45 = 0LL;
      v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry tryFromDatabase:state:contextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "tryFromDatabase:state:contextID:zoneID:error:",  v23,  @"new",  v25,  v26,  &v45));
      v27 = (CKKSOutgoingQueueEntry *)v45;

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v29 = sub_1000AA6AC(@"ckksoutgoing", v28);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Couldn't fetch an overwriting OQE, assuming one doesn't exist: %@",  buf,  0xCu);
        }
      }

      else if (v12)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v36 = sub_1000AA6AC(@"ckksoutgoing", v35);
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "New modification has come in behind inflight %@; dropping failed change",
            buf,
            0xCu);
        }

        id v44 = 0LL;
        -[CKKSOutgoingQueueEntry intransactionMoveToState:viewState:error:]( self,  "intransactionMoveToState:viewState:error:",  @"deleted",  v9,  &v44);
        v38 = (CKKSOutgoingQueueEntry *)v44;
        if (v38)
        {
          id v14 = v38;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
          id v40 = sub_1000AA6AC(@"ckksoutgoing", v39);
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v40);

          if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          *(_DWORD *)buf = 138412290;
          v48 = v14;
          v18 = "Couldn't delete in-flight OQE: %@";
          v19 = (os_log_s *)v17;
          uint32_t v20 = 12;
          goto LABEL_7;
        }

- (BOOL)intransactionMarkAsError:(id)a3 viewState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueEntry uuid](self, "uuid"));
  v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 claimCallbackForUUID:v11]);

  if (v12) {
    ((void (**)(void, void, id))v12)[2](v12, 0LL, v8);
  }
  id v18 = 0LL;
  -[CKKSSQLDatabaseObject deleteFromDatabase:](self, "deleteFromDatabase:", &v18);
  id v13 = v18;
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    id v15 = sub_1000AA6AC(@"ckks", v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint32_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Couldn't delete %@ (due to error %@): %@",  buf,  0x20u);
    }

    if (a5) {
      *a5 = v13;
    }
  }

  return v13 == 0LL;
}

- (CKKSItem)item
{
  return (CKKSItem *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setItem:(id)a3
{
}

- (NSString)action
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAction:(id)a3
{
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setState:(id)a3
{
}

- (NSString)accessgroup
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAccessgroup:(id)a3
{
}

- (NSDate)waitUntil
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setWaitUntil:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)keyForItem:(SecDbItem *)a3 contextID:(id)a4 zoneID:(id)a5 keyCache:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = (__objc2_class *)a6;
  if (a3)
  {
    id v14 = sub_1000E7EC0(a3, kSecAttrAccessible);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ([v15 isEqualToString:kSecAttrAccessibleWhenUnlocked])
    {
      id v16 = &off_100291010;
    }

    else
    {
      if (([v15 isEqualToString:kSecAttrAccessibleAlwaysPrivate] & 1) == 0
        && ([v15 isEqualToString:kSecAttrAccessibleAfterFirstUnlock] & 1) == 0)
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"can't pick key class for protection %@",  v15));
        __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  17LL,  v36));

        v37 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        id v38 = sub_1000AA6AC(@"ckks-key", v37);
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412547;
          id v46 = v21;
          __int16 v47 = 2113;
          v48 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "can't pick key class: %@ %{private}@",  buf,  0x16u);
        }

        if (a7)
        {
          __int16 v21 = v21;
          uint32_t v20 = 0LL;
          *a7 = v21;
        }

        else
        {
          uint32_t v20 = 0LL;
        }

        goto LABEL_34;
      }

      id v16 = &off_1002911F8;
    }

    v41 = a7;
    __int16 v21 = *v16;
    if (v13)
    {
      uint64_t v44 = 0LL;
      id v22 = (id *)&v44;
      __int16 v23 = &v44;
      id v24 = v13;
    }

    else
    {
      id v24 = &OBJC_CLASS___CKKSKey;
      uint64_t v43 = 0LL;
      id v22 = (id *)&v43;
      __int16 v23 = &v43;
    }

    v25 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__objc2_class currentKeyForClass:contextID:zoneID:error:]( v24,  "currentKeyForClass:contextID:zoneID:error:",  v21,  v11,  v12,  v23));
    v26 = (SecDbItem *)*v22;
    v27 = v26;
    if (!v25 || v26)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
      id v31 = sub_1000AA6AC(@"ckks-key", v30);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v21;
        __int16 v47 = 2112;
        v48 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Couldn't find current key for %@: %@",  buf,  0x16u);
      }

      uint32_t v20 = 0LL;
      if (v41) {
        id *v41 = v27;
      }
    }

    else
    {
      id v42 = 0LL;
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString ensureKeyLoadedForContextID:cache:error:]( v25,  "ensureKeyLoadedForContextID:cache:error:",  v11,  v13,  &v42));
      id v29 = (SecDbItem *)v42;

      if (v28)
      {
        uint32_t v20 = v25;
      }

      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        id v34 = sub_1000AA6AC(@"ckks-key", v33);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);

        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v46 = v25;
          __int16 v47 = 2112;
          v48 = v29;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't load key(%@): %@", buf, 0x16u);
        }

        uint32_t v20 = 0LL;
        if (v41) {
          id *v41 = v29;
        }
      }
    }

LABEL_34:
    goto LABEL_35;
  }

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  id v18 = sub_1000AA6AC(@"ckks-key", v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Cannot select a key for no item!", buf, 2u);
  }

  uint32_t v20 = 0LL;
  if (a7) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  57LL,  @"can't pick a key class for an empty item"));
  }
LABEL_35:

  return v20;
}

+ (id)withItem:(SecDbItem *)a3 action:(id)a4 contextID:(id)a5 zoneID:(id)a6 keyCache:(id)a7 error:(id *)a8
{
  id v14 = (SecDbItem *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v147 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
  id v19 = sub_1000AA6AC(@"ckksitem", v18);
  uint32_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    v149 = v14;
    __int16 v150 = 2113;
    v151 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Creating a (%@) outgoing queue entry for: %{private}@",  buf,  0x16u);
  }

  id v146 = 0LL;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([a1 keyForItem:a3 contextID:v15 zoneID:v16 keyCache:v17 error:&v146]);
  id v22 = v146;
  __int16 v23 = v22;
  v141 = v14;
  if (!v21 || v22)
  {
    id v36 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  [v22 code],  @"No key for item",  v22));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
    id v38 = sub_1000AA6AC(@"ckksitem", v37);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      v149 = (SecDbItem *)v36;
      __int16 v150 = 2113;
      v151 = a3;
      id v40 = "no key for item: %@ %{private}@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);
    }

+ (id)fromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35[0] = @"contextID";
  id v14 = v12;
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v36[0] = v17;
  v35[1] = @"UUID";
  id v18 = v10;
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  __int16 v21 = v20;

  v36[1] = v21;
  v35[2] = @"state";
  id v22 = v11;
  __int16 v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v25 = v24;

  v36[2] = v25;
  v35[3] = @"ckzone";
  v26 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
  v27 = v26;
  if (v26) {
    id v28 = v26;
  }
  else {
    id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v29 = v28;

  v36[3] = v29;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  4LL));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v30 error:a7]);

  return v31;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"UUID";
  id v17 = v10;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v25 error:a6]);

  return v26;
}

+ (id)tryFromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35[0] = @"contextID";
  id v14 = v12;
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v36[0] = v17;
  v35[1] = @"UUID";
  id v18 = v10;
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  __int16 v21 = v20;

  v36[1] = v21;
  v35[2] = @"state";
  id v22 = v11;
  id v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v25 = v24;

  v36[2] = v25;
  v35[3] = @"ckzone";
  v26 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
  v27 = v26;
  if (v26) {
    id v28 = v26;
  }
  else {
    id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v29 = v28;

  v36[3] = v29;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  4LL));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v30 error:a7]);

  return v31;
}

+ (id)fetch:(int64_t)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  v35[0] = @"contextID";
  id v14 = v11;
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v36[0] = v17;
  v35[1] = @"state";
  id v18 = v10;
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  __int16 v21 = v20;

  v36[1] = v21;
  v35[2] = @"ckzone";
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);

  id v32 = v17;
  if (v22) {
    id v23 = v22;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v17));
  }
  id v24 = v23;

  v36[2] = v24;
  v35[3] = @"waituntil";
  v25 = objc_alloc(&OBJC_CLASS___CKKSSQLWhereNullOrValue);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v13, "stringFromDate:", v26));
  id v28 = -[CKKSSQLWhereValue initWithOperation:value:](v25, "initWithOperation:value:", 4LL, v27);
  v36[3] = v28;
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  4LL));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([a1 fetch:a3 where:v29 error:a7]);

  return v30;
}

+ (id)allInState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"state";
  id v17 = v10;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v25 error:a6]);

  return v26;
}

+ (id)allWithUUID:(id)a3 states:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32[0] = @"contextID";
  id v14 = v12;
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v33[0] = v17;
  v32[1] = @"UUID";
  id v18 = v10;
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  __int16 v21 = v20;

  v33[1] = v21;
  v32[2] = @"state";
  id v22 = -[CKKSSQLWhereIn initWithValues:](objc_alloc(&OBJC_CLASS___CKKSSQLWhereIn), "initWithValues:", v11);
  v33[2] = v22;
  v32[3] = @"ckzone";
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
  id v24 = v23;
  if (v23) {
    id v25 = v23;
  }
  else {
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v26 = v25;

  v33[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v27 error:a7]);

  return v28;
}

+ (id)sqlTable
{
  return @"outgoingqueue";
}

+ (id)sqlColumns
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem sqlColumns](&OBJC_CLASS___CKKSItem, "sqlColumns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 arrayByAddingObjectsFromArray:&off_1002AE478]);

  return v3;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSOutgoingQueueEntry);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem fromDatabaseRow:](&OBJC_CLASS___CKKSItem, "fromDatabaseRow:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"action"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 asString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"state"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 asString]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"waituntil"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 asISO8601Date]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"accessgroup"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 asString]);
  id v14 = -[CKKSOutgoingQueueEntry initWithCKKSItem:action:state:waitUntil:accessGroup:]( v4,  "initWithCKKSItem:action:state:waitUntil:accessGroup:",  v5,  v7,  v9,  v11,  v13);

  return v14;
}

+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = objc_msgSend((id)objc_opt_class(a1, v11), "sqlTable");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v26[0] = @"contextID";
  id v14 = v8;
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v26[1] = @"ckzone";
  v27[0] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  if (v18) {
    id v19 = v18;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v27[1] = v20;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005C904;
  v24[3] = &unk_100285C40;
  id v22 = v10;
  id v25 = v22;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v13,  v21,  &off_1002AE490,  &off_1002AE4A8,  0LL,  -1LL,  v24,  a5);

  return v22;
}

+ (int64_t)countByState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = -1LL;
  id v14 = objc_msgSend((id)objc_opt_class(a1, v13), "sqlTable");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v32[0] = @"contextID";
  id v16 = v11;
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v19 = v18;

  v33[0] = v19;
  v32[1] = @"ckzone";
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  __int16 v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v23 = v22;

  v32[2] = @"state";
  v33[1] = v23;
  v33[2] = v10;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
  v27[1] = 3221225472LL;
  void v27[2] = sub_10005C8B4;
  v27[3] = &unk_100290E08;
  v27[4] = &v28;
  v27[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v15,  v24,  &off_1002AE4C0,  0LL,  0LL,  -1LL,  v27,  a6);

  int64_t v25 = v29[3];
  _Block_object_dispose(&v28, 8);

  return v25;
}

@end