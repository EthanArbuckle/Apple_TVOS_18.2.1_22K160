@interface CKKSMirrorEntry
+ (id)allWithUUID:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)countsByParentKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsByZoneNameWithContextID:(id)a3 error:(id *)a4;
+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)pcsMirrorKeysForService:(id)a3 matchingKeys:(id)a4 error:(id *)a5;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)matchesCKRecord:(id)a3;
- (BOOL)matchesCKRecord:(id)a3 checkServerFields:(BOOL)a4;
- (CKKSItem)item;
- (CKKSMirrorEntry)initWithCKKSItem:(id)a3;
- (CKKSMirrorEntry)initWithCKRecord:(id)a3 contextID:(id)a4;
- (NSString)uuid;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (unint64_t)wasCurrent;
- (void)setFromCKRecord:(id)a3;
- (void)setItem:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWasCurrent:(unint64_t)a3;
@end

@implementation CKKSMirrorEntry

- (CKKSMirrorEntry)initWithCKKSItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSMirrorEntry;
  v6 = -[CKKSMirrorEntry init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v7->_wasCurrent = 0LL;
  }

  return v7;
}

- (CKKSMirrorEntry)initWithCKRecord:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CKKSMirrorEntry;
  v8 = -[CKKSMirrorEntry init](&v13, "init");
  if (v8)
  {
    objc_super v9 = -[CKKSItem initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSItem),  "initWithCKRecord:contextID:",  v6,  v7);
    item = v8->_item;
    v8->_item = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"server_wascurrent"]);
    v8->_wasCurrent = (unint64_t)[v11 unsignedLongLongValue];
  }

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%@](%@): %@>",  v5,  v7,  v10,  v12));

  return v13;
}

- (void)setFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  [v5 setFromCKRecord:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"server_wascurrent"]);
  self->_wasCurrent = (unint64_t)[v6 unsignedLongLongValue];
}

- (BOOL)matchesCKRecord:(id)a3
{
  return -[CKKSMirrorEntry matchesCKRecord:checkServerFields:](self, "matchesCKRecord:checkServerFields:", a3, 1LL);
}

- (BOOL)matchesCKRecord:(id)a3 checkServerFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  unsigned int v8 = [v7 matchesCKRecord:v6];

  if (v8 && v4)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"server_wascurrent"]);
    if ((v9 || -[CKKSMirrorEntry wasCurrent](self, "wasCurrent"))
      && (v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"server_wascurrent"]),
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  -[CKKSMirrorEntry wasCurrent](self, "wasCurrent"))),  unsigned __int8 v12 = [v10 isEqual:v11],  v11,  v10,  v9,  (v12 & 1) == 0))
    {
      id v13 = sub_1000AA6AC(@"ckksitem", 0LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v16 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "was_current does not match", v16, 2u);
      }

      LOBYTE(v8) = 0;
    }

    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (NSString)uuid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uuid]);

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  [v5 setUuid:v4];
}

- (id)whereClauseToFindSelf
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 whereClauseToFindSelf]);

  return v3;
}

- (id)sqlValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](self, "item"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sqlValues]);
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CKKSMirrorEntry wasCurrent](self, "wasCurrent")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  [v5 setObject:v7 forKeyedSubscript:@"wascurrent"];

  return v5;
}

- (CKKSItem)item
{
  return (CKKSItem *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setItem:(id)a3
{
}

- (unint64_t)wasCurrent
{
  return self->_wasCurrent;
}

- (void)setWasCurrent:(unint64_t)a3
{
  self->_wasCurrent = a3;
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

+ (id)allWithUUID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v20[0] = @"contextID";
  id v9 = a4;
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v12 = v11;

  v20[1] = @"UUID";
  v21[0] = v12;
  id v13 = v8;
  v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v16 = v15;

  v21[1] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v17 error:a5]);

  return v18;
}

+ (id)sqlTable
{
  return @"ckmirror";
}

+ (id)sqlColumns
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem sqlColumns](&OBJC_CLASS___CKKSItem, "sqlColumns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 arrayByAddingObjectsFromArray:&off_1002AE5E0]);

  return v3;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSMirrorEntry);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItem fromDatabaseRow:](&OBJC_CLASS___CKKSItem, "fromDatabaseRow:", v3));
  id v6 = -[CKKSMirrorEntry initWithCKKSItem:](v4, "initWithCKKSItem:", v5);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"wascurrent"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 asString]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v7, "numberFromString:", v9));
  -[CKKSMirrorEntry setWasCurrent:](v6, "setWasCurrent:", [v10 unsignedLongLongValue]);

  return v6;
}

+ (id)countsByParentKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
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
  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  if (v18) {
    id v19 = v18;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v20 = v19;

  v27[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100091134;
  v24[3] = &unk_100285C40;
  v22 = v10;
  v25 = v22;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v13,  v21,  &off_1002AE5F8,  &off_1002AE610,  0LL,  -1LL,  v24,  a5);

  return v22;
}

+ (id)countsByZoneNameWithContextID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "sqlTable");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v20 = @"contextID";
  id v11 = v6;
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v14 = v13;

  v21 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100091090;
  v18[3] = &unk_100285C40;
  id v16 = v7;
  id v19 = v16;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v10,  v15,  &off_1002AE628,  &off_1002AE640,  0LL,  -1LL,  v18,  a4);

  return v16;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10009101C;
  v29 = sub_10009102C;
  id v30 = 0LL;
  id v11 = objc_msgSend((id)objc_opt_class(a1, v10), "sqlTable");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v31[0] = @"contextID";
  id v13 = v8;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v32[0] = v16;
  v31[1] = @"ckzone";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v20 = v19;

  v32[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
  v24[1] = 3221225472LL;
  v24[2] = sub_100091034;
  v24[3] = &unk_100290E08;
  void v24[4] = &v25;
  v24[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v12,  v21,  &off_1002AE658,  0LL,  0LL,  -1LL,  v24,  a5);

  id v22 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v22;
}

+ (id)pcsMirrorKeysForService:(id)a3 matchingKeys:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  v21 = @"pcss";
  id v22 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100090FB0;
  v18[3] = &unk_1002848F8;
  id v19 = v8;
  id v13 = v10;
  v20 = v13;
  id v14 = v8;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v11,  v12,  &off_1002AE670,  0LL,  &off_1002AE688,  0LL,  v18,  a5);

  id v15 = v20;
  id v16 = v13;

  return v16;
}

@end