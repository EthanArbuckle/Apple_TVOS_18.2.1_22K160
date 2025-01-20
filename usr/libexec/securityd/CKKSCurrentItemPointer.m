@interface CKKSCurrentItemPointer
+ (BOOL)deleteAll:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabaseRow:(id)a3;
+ (id)remoteItemPointers:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6;
- (BOOL)matchesCKRecord:(id)a3;
- (NSString)currentItemUUID;
- (NSString)identifier;
- (SecCKKSProcessedState)state;
- (id)description;
- (id)initForIdentifier:(id)a3 contextID:(id)a4 currentItemUUID:(id)a5 state:(id)a6 zoneID:(id)a7 encodedCKRecord:(id)a8;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (void)setCurrentItemUUID:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setState:(id)a3;
@end

@implementation CKKSCurrentItemPointer

- (id)initForIdentifier:(id)a3 contextID:(id)a4 currentItemUUID:(id)a5 state:(id)a6 zoneID:(id)a7 encodedCKRecord:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CKKSCurrentItemPointer;
  v18 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v21,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"currentitem",  a8,  a4,  a7);
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong(p_isa + 8, a3);
    objc_storeStrong(p_isa + 9, a5);
  }

  return p_isa;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSCurrentItemPointer[%@](%@) %@: %@>",  v3,  v5,  v6,  v7));

  return v8;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned __int8 v9 = [v8 isEqualToString:@"currentitem"];

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) != 0)
    {
      v14 = objc_alloc(&OBJC_CLASS___CKReference);
      id v15 = objc_alloc(&OBJC_CLASS___CKRecordID);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
      id v17 = -[CKRecordID initWithRecordName:zoneID:](v15, "initWithRecordName:zoneID:", v16, v7);
      v18 = -[CKReference initWithRecordID:action:](v14, "initWithRecordID:action:", v17, 0LL);
      [v6 setObject:v18 forKeyedSubscript:@"item"];

      return v6;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 recordName]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecord name (%@) was not %@",  v23,  v24));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordNameException",  v25,  0LL));
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v20,  @"currentitem"));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v21,  0LL));
  }

  objc_exception_throw(v22);
  return (id)-[CKKSCurrentItemPointer matchesCKRecord:](v26, v27, v28);
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"currentitem"];

  if (v6
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]),
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]),
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier")),
        unsigned int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v7,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"item"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
    unsigned __int8 v15 = [v13 isEqualToString:v14];
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)setFromCKRecord:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 recordType]);
  unsigned __int8 v5 = [v4 isEqualToString:@"currentitem"];

  if ((v5 & 1) != 0)
  {
    -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v16);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v16 recordID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
    -[CKKSCurrentItemPointer setIdentifier:](self, "setIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"item"]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
    -[CKKSCurrentItemPointer setCurrentItemUUID:](self, "setCurrentItemUUID:", v10);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v16 recordType]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v11,  @"currentitem"));
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v12,  0LL));

    objc_exception_throw(v13);
    -[CKKSCurrentItemPointer whereClauseToFindSelf](v14, v15);
  }

- (id)whereClauseToFindSelf
{
  v13[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned int v6 = v5;

  v14[0] = v6;
  v13[1] = @"identifier";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v14[1] = v7;
  v13[2] = @"ckzone";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  v14[2] = v9;
  v13[3] = @"state";
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer state](self, "state"));
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));

  return v11;
}

- (id)sqlValues
{
  v26[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned int v6 = v5;

  v27[0] = v6;
  v26[1] = @"identifier";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer identifier](self, "identifier"));
  v27[1] = v7;
  v26[2] = @"currentItemUUID";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer currentItemUUID](self, "currentItemUUID"));
  unsigned __int8 v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v11 = v10;

  v27[2] = v11;
  v26[3] = @"state";
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentItemPointer state](self, "state"));
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  SEL v15 = v14;

  v27[3] = v15;
  v26[4] = @"ckzone";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);

  if (v17) {
    id v18 = v17;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v19 = v18;

  v27[4] = v19;
  v26[5] = @"ckrecord";
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);

  if (v21) {
    id v22 = v21;
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v23 = v22;

  v27[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  6LL));

  return v24;
}

- (SecCKKSProcessedState)state
{
  return (SecCKKSProcessedState *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setState:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)currentItemUUID
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCurrentItemUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  v19[0] = @"contextID";
  v19[1] = @"identifier";
  v20[0] = a4;
  v20[1] = a3;
  v20[2] = a5;
  v19[2] = @"state";
  v19[3] = @"ckzone";
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue([a6 zoneName]);
  v20[3] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v16 error:a7]);
  return v17;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  v19[0] = @"contextID";
  v19[1] = @"identifier";
  v20[0] = a4;
  v20[1] = a3;
  v20[2] = a5;
  v19[2] = @"state";
  v19[3] = @"ckzone";
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue([a6 zoneName]);
  v20[3] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v16 error:a7]);
  return v17;
}

+ (id)remoteItemPointers:(id)a3 contextID:(id)a4 error:(id *)a5
{
  v11[0] = @"state";
  v11[1] = @"ckzone";
  v12[0] = @"remote";
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  v12[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v8 error:a5]);

  return v9;
}

+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5
{
  v11 = @"ckzone";
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v8 error:a5]);

  return v9;
}

+ (BOOL)deleteAll:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  id v12 = @"ckzone";
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);

  id v13 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  LOBYTE(a5) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v8,  v10,  0LL,  a5);

  return (char)a5;
}

+ (id)sqlTable
{
  return @"currentitems";
}

+ (id)sqlColumns
{
  return &off_1002AE598;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSCurrentItemPointer);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"identifier"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v20 asString]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v19 asString]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"currentItemUUID"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v18 asString]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"state"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 asString]);
  v8 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 asString]);
  v11 = -[CKRecordZoneID initWithZoneName:ownerName:](v8, "initWithZoneName:ownerName:", v10, CKCurrentUserDefaultName);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckrecord"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 asBase64DecodedData]);
  id v14 = -[CKKSCurrentItemPointer initForIdentifier:contextID:currentItemUUID:state:zoneID:encodedCKRecord:]( v4,  "initForIdentifier:contextID:currentItemUUID:state:zoneID:encodedCKRecord:",  v16,  v5,  v17,  v7,  v11,  v13);

  return v14;
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
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v32[0] = @"contextID";
  id v16 = v11;
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v19 = v18;

  v33[0] = v19;
  v32[1] = @"ckzone";
  v20 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  objc_super v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v23 = v22;

  v32[2] = @"state";
  v33[1] = v23;
  v33[2] = v10;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
  v27[1] = 3221225472LL;
  v27[2] = sub_10008129C;
  v27[3] = &unk_100290E08;
  v27[4] = &v28;
  v27[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v15,  v24,  &off_1002AE5B0,  0LL,  0LL,  -1LL,  v27,  a6);

  int64_t v25 = v29[3];
  _Block_object_dispose(&v28, 8);

  return v25;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!v7) {
    goto LABEL_18;
  }
  v55 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordName]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
  id v58 = 0LL;
  unint64_t v15 = objc_claimAutoreleasedReturnValue( +[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:]( &OBJC_CLASS___CKKSCurrentItemPointer,  "tryFromDatabase:contextID:state:zoneID:error:",  v12,  v10,  @"local",  v14,  &v58));
  id v16 = v58;

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 recordName]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
  id v57 = v16;
  uint64_t v21 = objc_claimAutoreleasedReturnValue( +[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:]( &OBJC_CLASS___CKKSCurrentItemPointer,  "tryFromDatabase:contextID:state:zoneID:error:",  v18,  v10,  @"remote",  v20,  &v57));
  id v22 = v57;

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneID]);
    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
    id v26 = sub_1000AA6AC(@"ckksresync", v25);
    SEL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v60 = (unint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "error loading cip: %@", buf, 0xCu);
    }
  }

  if (v15 | v21)
  {
    if (([(id)v15 matchesCKRecord:v9] & 1) != 0
      || ([(id)v21 matchesCKRecord:v9] & 1) != 0)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 zoneID]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
      id v31 = sub_1000AA6AC(@"ckksresync", v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v60 = (unint64_t)v9;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Already know about this current item pointer, skipping update: %@",  buf,  0xCu);
      }

      goto LABEL_27;
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 zoneID]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneName]);
    id v44 = sub_1000AA6AC(@"ckksresync", v43);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412802;
    unint64_t v60 = v15;
    __int16 v61 = 2112;
    uint64_t v62 = v21;
    __int16 v63 = 2112;
    id v64 = v9;
    v38 = "BUG: Local current item pointer doesn't match resynced CloudKit record(s): %@ %@ %@";
    v39 = v37;
    uint32_t v40 = 32;
    goto LABEL_16;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneName]);
  id v36 = sub_1000AA6AC(@"ckksresync", v35);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v60 = (unint64_t)v9;
    v38 = "BUG: No current item pointer matching resynced CloudKit record: %@";
    v39 = v37;
    uint32_t v40 = 12;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
  }

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"currentitem", v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v48 = @"currentitem";
    __int16 v49 = 2112;
    v50 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CloudKit notification: deleted current item pointer(%@): %@",  buf,  0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString recordName](v8, "recordName"));
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  id v46 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:]( &OBJC_CLASS___CKKSCurrentItemPointer,  "tryFromDatabase:contextID:state:zoneID:error:",  v14,  v9,  @"remote",  v15,  &v46));
  id v17 = (__CFString *)v46;

  if (!v17)
  {
    id v45 = 0LL;
    [v16 deleteFromDatabase:&v45];
    v23 = (__CFString *)v45;
    if (v23)
    {
      id v17 = v23;
      if (a6) {
        *a6 = v23;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
      int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
      id v26 = sub_1000AA6AC(@"currentitem", v25);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412546;
      v48 = v8;
      __int16 v49 = 2112;
      v50 = v17;
      id v22 = "Failed to delete remote CKKSCurrentItemPointer %@: %@";
      goto LABEL_13;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString recordName](v8, "recordName"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    id v44 = 0LL;
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentItemPointer tryFromDatabase:contextID:state:zoneID:error:]( &OBJC_CLASS___CKKSCurrentItemPointer,  "tryFromDatabase:contextID:state:zoneID:error:",  v29,  v9,  @"local",  v30,  &v44));
    id v17 = (__CFString *)v44;

    if (v17)
    {
      if (a6) {
        *a6 = v17;
      }
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 zoneName]);
      id v33 = sub_1000AA6AC(@"currentitem", v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);

      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138412546;
      v48 = v8;
      __int16 v49 = 2112;
      v50 = v17;
      v35 = "Failed to find local CKKSCurrentItemPointer %@: %@";
    }

    else
    {
      id v43 = 0LL;
      -[os_log_s deleteFromDatabase:](v21, "deleteFromDatabase:", &v43);
      id v36 = (__CFString *)v43;
      if (!v36)
      {
        uint32_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 zoneName]);
        id v42 = sub_1000AA6AC(@"currentitem", v41);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v8;
          __int16 v49 = 2112;
          v50 = 0LL;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "CKKSCurrentItemPointer was deleted: %@ error: %@",  buf,  0x16u);
        }

        id v17 = 0LL;
        BOOL v27 = 1;
        goto LABEL_28;
      }

      id v17 = v36;
      if (a6) {
        *a6 = v36;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 zoneName]);
      id v39 = sub_1000AA6AC(@"currentitem", v38);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);

      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_27:
        BOOL v27 = 0;
LABEL_28:

        goto LABEL_15;
      }

      *(_DWORD *)buf = 138412546;
      v48 = v8;
      __int16 v49 = 2112;
      v50 = v17;
      v35 = "Failed to delete local CKKSCurrentItemPointer %@: %@";
    }

    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, 0x16u);
    goto LABEL_27;
  }

  if (a6) {
    *a6 = v17;
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneName]);
  id v20 = sub_1000AA6AC(@"currentitem", v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

  if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    goto LABEL_14;
  }
  *(_DWORD *)buf = 138412546;
  v48 = v8;
  __int16 v49 = 2112;
  v50 = v17;
  id v22 = "Failed to find remote CKKSCurrentItemPointer to delete %@: %@";
LABEL_13:
  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
LABEL_14:
  BOOL v27 = 0;
LABEL_15:

  return v27;
}

@end