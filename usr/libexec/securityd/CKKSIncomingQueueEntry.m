@interface CKKSIncomingQueueEntry
+ (BOOL)allIQEsHaveValidUnwrappingKeysInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countNewEntriesByKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fetch:(int64_t)a3 startingAtUUID:(id)a4 state:(id)a5 action:(id)a6 contextID:(id)a7 zoneID:(id)a8 error:(id *)a9;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6;
- (CKKSIncomingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5;
- (CKKSItem)item;
- (NSString)action;
- (NSString)contextID;
- (NSString)state;
- (NSString)uuid;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setAction:(id)a3;
- (void)setItem:(id)a3;
- (void)setState:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CKKSIncomingQueueEntry

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v16 contextID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry action](self, "action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry state](self, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%@](%@): %@ %@ (%@)>",  v5,  v6,  v9,  v10,  v12,  v13));

  return v14;
}

- (CKKSIncomingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSIncomingQueueEntry;
  v12 = -[CKKSIncomingQueueEntry init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    objc_storeStrong((id *)&v13->_action, a4);
    objc_storeStrong((id *)&v13->_state, a5);
  }

  return v13;
}

- (NSString)contextID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contextID]);

  return (NSString *)v3;
}

- (NSString)uuid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uuid]);

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  [v5 setUuid:v4];
}

- (id)whereClauseToFindSelf
{
  v11[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry contextID](self, "contextID"));
  v12[0] = v3;
  v11[1] = @"UUID";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry uuid](self, "uuid"));
  v12[1] = v4;
  v11[2] = @"state";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry state](self, "state"));
  v12[2] = v5;
  v11[3] = @"ckzone";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  v12[3] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));

  return v9;
}

- (id)sqlValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry item](self, "item"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sqlValues]);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry action](self, "action"));
  [v5 setObject:v6 forKeyedSubscript:@"action"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSIncomingQueueEntry state](self, "state"));
  [v5 setObject:v7 forKeyedSubscript:@"state"];

  return v5;
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

- (void).cxx_destruct
{
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"contextID";
  id v13 = v11;
  v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v16 = v15;

  v29[0] = v16;
  v28[1] = @"UUID";
  id v17 = v10;
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v25 error:a6]);

  return v26;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"contextID";
  id v13 = v11;
  v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v16 = v15;

  v29[0] = v16;
  v28[1] = @"UUID";
  id v17 = v10;
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v24 = v23;

  v29[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v25 error:a6]);

  return v26;
}

+ (id)fetch:(int64_t)a3 startingAtUUID:(id)a4 state:(id)a5 action:(id)a6 contextID:(id)a7 zoneID:(id)a8 error:(id *)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v37 = @"contextID";
  id v18 = v16;
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v21 = v20;

  v40[0] = v21;
  v38 = @"state";
  id v22 = v14;
  id v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v25 = v24;

  v40[1] = v25;
  v39 = @"ckzone";
  v26 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
  v27 = v26;
  if (v26) {
    id v28 = v26;
  }
  else {
    id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v29 = v28;

  v40[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  &v37,  3LL));
  id v31 = [v30 mutableCopy];

  [v31 setObject:v15 forKeyedSubscript:@"action"];
  if (v13)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSSQLWhereValue op:value:](&OBJC_CLASS___CKKSSQLWhereValue, "op:value:", 3LL, v13));
    [v31 setObject:v32 forKeyedSubscript:@"UUID"];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetch:where:orderBy:error:", a3, v31, &off_1002AE4D8, a9, a1, a3, a9, v37, v38));

  return v33;
}

+ (id)sqlTable
{
  return @"incomingqueue";
}

+ (id)sqlColumns
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem sqlColumns](&OBJC_CLASS___CKKSItem, "sqlColumns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 arrayByAddingObjectsFromArray:&off_1002AE4F0]);

  return v3;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSIncomingQueueEntry);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem fromDatabaseRow:](&OBJC_CLASS___CKKSItem, "fromDatabaseRow:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"action"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 asString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"state"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 asString]);
  id v10 = -[CKKSIncomingQueueEntry initWithCKKSItem:action:state:](v4, "initWithCKKSItem:action:state:", v5, v7, v9);

  return v10;
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
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005DFF4;
  v24[3] = &unk_100285C40;
  id v22 = v10;
  v25 = v22;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v13,  v21,  &off_1002AE508,  &off_1002AE520,  0LL,  -1LL,  v24,  a5);

  return v22;
}

+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v28 = 0LL;
  v29 = &v28;
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
  v21 = v20;
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
  void v27[2] = sub_10005DFA4;
  v27[3] = &unk_100290E08;
  v27[4] = &v28;
  v27[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v15,  v24,  &off_1002AE538,  0LL,  0LL,  -1LL,  v27,  a6);

  int64_t v25 = v29[3];
  _Block_object_dispose(&v28, 8);

  return v25;
}

+ (id)countNewEntriesByKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = objc_msgSend((id)objc_opt_class(a1, v11), "sqlTable");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
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

  v27[0] = v17;
  v26[1] = @"ckzone";
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  if (v18) {
    id v19 = v18;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  void v26[2] = @"state";
  v27[1] = v20;
  void v27[2] = @"new";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005DF00;
  v24[3] = &unk_100285C40;
  id v22 = v10;
  int64_t v25 = v22;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v13,  v21,  &off_1002AE550,  &off_1002AE568,  0LL,  -1LL,  v24,  a5);

  return v22;
}

+ (BOOL)allIQEsHaveValidUnwrappingKeysInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v38 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSSQLDatabaseObject allParentKeyUUIDsInContextID:zoneID:error:]( &OBJC_CLASS___CKKSIncomingQueueEntry,  "allParentKeyUUIDsInContextID:zoneID:error:",  v7,  v8,  &v38));
  id v10 = v38;
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    id v12 = sub_1000AA6AC(@"ckkskey", v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to find IQE parent keys: %@", buf, 0xCu);
    }

    BOOL v14 = 0;
    if (a5) {
      *a5 = v10;
    }
    goto LABEL_27;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v15 = v9;
  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (!v16)
  {
    BOOL v14 = 1;
    goto LABEL_26;
  }

  id v17 = v16;
  uint64_t v31 = a5;
  v32 = v9;
  uint64_t v18 = *(void *)v35;
  while (2)
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v35 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      id v33 = 0LL;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v20,  v7,  v8,  &v33,  v31));
      id v22 = v33;
      if (v22)
      {
        id v23 = v22;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
        id v25 = sub_1000AA6AC(@"ckksheal", v24);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

        id v9 = v32;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v23;
          __int16 v41 = 2112;
          v42 = v20;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to find key %@: %@", buf, 0x16u);
        }

        if (v31)
        {
          id v23 = v23;
          *uint64_t v31 = v23;
        }

        goto LABEL_25;
      }

      if (!v21)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
        id v28 = sub_1000AA6AC(@"ckkskey", v27);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Some item is encrypted under a non-existent key(%@).",  buf,  0xCu);
        }

        id v23 = 0LL;
        v21 = 0LL;
        id v9 = v32;
LABEL_25:

        BOOL v14 = 0;
        id v10 = 0LL;
        goto LABEL_26;
      }
    }

    id v17 = [v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    BOOL v14 = 1;
    id v9 = v32;
    id v10 = 0LL;
    if (v17) {
      continue;
    }
    break;
  }

@end