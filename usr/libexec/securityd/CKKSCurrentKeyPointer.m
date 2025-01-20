@interface CKKSCurrentKeyPointer
+ (BOOL)deleteAll:(id)a3 error:(id *)a4;
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)all:(id)a3 error:(id *)a4;
+ (id)forKeyClass:(id)a3 contextID:(id)a4 withKeyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (NSString)currentKeyUUID;
- (SecCKKSKeyClass)keyclass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForClass:(id)a3 contextID:(id)a4 currentKeyUUID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (void)setCurrentKeyUUID:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setKeyclass:(id)a3;
@end

@implementation CKKSCurrentKeyPointer

- (id)initForClass:(id)a3 contextID:(id)a4 currentKeyUUID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CKKSCurrentKeyPointer;
  v15 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v22,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"currentkey",  a7,  a4,  a6);
  p_isa = (id *)&v15->super.super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keyclass, a3);
    objc_storeStrong(p_isa + 8, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue([p_isa currentKeyUUID]);

    if (!v17)
    {
      id v18 = sub_1000AA6AC(@"currentkey", 0LL);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "created a CKKSCurrentKey with a nil currentKeyUUID. Why?",  v21,  2u);
      }
    }
  }

  return p_isa;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSCurrentKeyPointer(%@, %@) %@: %@>",  v4,  v5,  v6,  v7));

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CKKSCurrentKeyPointer;
  id v5 = -[CKKSCKRecordHolder copyWithZone:](&v11, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setKeyclass:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setCurrentKeyUUID:v9];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CKKSCurrentKeyPointer, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v8 = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    if (![v9 isEqual:v10])
    {
      unsigned __int8 v14 = 0;
LABEL_23:

      goto LABEL_24;
    }

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
    if (v11 || (v23 = (void *)objc_claimAutoreleasedReturnValue([v8 currentKeyUUID])) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue([v8 currentKeyUUID]);
      if (![v12 isEqual:v3])
      {
        unsigned __int8 v14 = 0;
LABEL_19:

        goto LABEL_20;
      }

      objc_super v22 = v12;
      int v13 = 1;
    }

    else
    {
      v23 = 0LL;
      int v13 = 0;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
    if (v15 || (uint64_t v20 = objc_claimAutoreleasedReturnValue([v8 keyclass])) != 0)
    {
      int v24 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass", v20));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 keyclass]);
      unsigned __int8 v14 = [v16 isEqual:v17];

      if (v15)
      {

        if (v24)
        {
          v12 = v22;
          goto LABEL_19;
        }

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned __int8 v9 = [v8 isEqualToString:@"currentkey"];

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) != 0)
    {
      unsigned __int8 v14 = objc_alloc(&OBJC_CLASS___CKReference);
      v15 = objc_alloc(&OBJC_CLASS___CKRecordID);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
      v17 = -[CKRecordID initWithRecordName:zoneID:](v15, "initWithRecordName:zoneID:", v16, v7);
      id v18 = -[CKReference initWithRecordID:action:](v14, "initWithRecordID:action:", v17, 0LL);
      [v6 setObject:v18 forKeyedSubscript:@"parentkeyref"];

      return v6;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 recordName]);
    int v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecord name (%@) was not %@",  v23,  v24));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordNameException",  v25,  0LL));
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v20,  @"currentkey"));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v21,  0LL));
  }

  objc_exception_throw(v22);
  return (id)-[CKKSCurrentKeyPointer matchesCKRecord:](v26, v27, v28);
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"currentkey"];

  if (v6
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]),
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass")),
        unsigned int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v7,
        v10))
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"parentkeyref"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
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
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned __int8 v6 = [v5 isEqualToString:@"currentkey"];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v15,  @"currentkey"));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v16,  0LL));

    objc_exception_throw(v17);
  }

  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  -[CKKSCurrentKeyPointer setKeyclass:](self, "setKeyclass:", v8);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"parentkeyref"]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
  -[CKKSCurrentKeyPointer setCurrentKeyUUID:](self, "setCurrentKeyUUID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  if (!v12)
  {
    id v13 = sub_1000AA6AC(@"currentkey", 0LL);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "No current key UUID in record! How/why? %@",  buf,  0xCu);
    }
  }
}

- (id)whereClauseToFindSelf
{
  v9[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v10[0] = v3;
  v9[1] = @"keyclass";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v10[1] = v4;
  v9[2] = @"ckzone";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  v10[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)sqlValues
{
  v19[0] = @"keyclass";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer keyclass](self, "keyclass"));
  v20[0] = v3;
  v19[1] = @"contextID";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v20[1] = v4;
  v19[2] = @"currentKeyUUID";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer currentKeyUUID](self, "currentKeyUUID"));
  unsigned __int8 v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v8 = v7;

  v20[2] = v8;
  v19[3] = @"ckzone";
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v12 = v11;

  v20[3] = v12;
  v19[4] = @"ckrecord";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);

  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v16 = v15;

  v20[4] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  5LL));

  return v17;
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setKeyclass:(id)a3
{
}

- (NSString)currentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCurrentKeyUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  v16[0] = @"keyclass";
  v16[1] = @"contextID";
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = @"ckzone";
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a5 zoneName]);
  v17[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v13 error:a6]);
  return v14;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  v16[0] = @"keyclass";
  v16[1] = @"contextID";
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = @"ckzone";
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a5 zoneName]);
  v17[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v13 error:a6]);
  return v14;
}

+ (id)forKeyClass:(id)a3 contextID:(id)a4 withKeyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v22 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabase:v12 contextID:v13 zoneID:v15 error:&v22]);
  id v17 = v22;
  id v18 = v17;
  if (v17)
  {
    id v19 = 0LL;
    if (a7) {
      *a7 = v17;
    }
  }

  else
  {
    if (v16)
    {
      [v16 setCurrentKeyUUID:v14];
      id v20 = v16;
    }

    else
    {
      id v20 = -[CKKSCurrentKeyPointer initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:]( objc_alloc(&OBJC_CLASS___CKKSCurrentKeyPointer),  "initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:",  v12,  v13,  v14,  v15,  0LL);
    }

    id v19 = v20;
  }

  return v19;
}

+ (id)all:(id)a3 error:(id *)a4
{
  id v10 = @"ckzone";
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v7 error:a4]);

  return v8;
}

+ (BOOL)deleteAll:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  id v11 = @"ckzone";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);

  id v12 = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  LOBYTE(a4) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v7,  v9,  0LL,  a4);

  return (char)a4;
}

+ (id)sqlTable
{
  return @"currentkeys";
}

+ (id)sqlColumns
{
  return &off_1002AE5C8;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSCurrentKeyPointer);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"keyclass"]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v20 asString]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v19 asString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"currentKeyUUID"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 asString]);
  unsigned __int8 v9 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 asString]);
  id v12 = -[CKRecordZoneID initWithZoneName:ownerName:](v9, "initWithZoneName:ownerName:", v11, CKCurrentUserDefaultName);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckrecord"]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 asBase64DecodedData]);
  id v15 = v4;
  v16 = (void *)v5;
  id v17 = -[CKKSCurrentKeyPointer initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:]( v15,  "initForClass:contextID:currentKeyUUID:zoneID:encodedCKRecord:",  v5,  v6,  v8,  v12,  v14);

  return v17;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v10 = (CKKSCurrentKeyPointer *)a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
  id v65 = 0LL;
  id v17 = (CKKSCurrentKeyPointer *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  v14,  v11,  v16,  &v65));
  id v18 = (CKKSCurrentKeyPointer *)v65;

  v63 = v18;
  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneName]);
    id v22 = sub_1000AA6AC(@"ckkskey", v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "error loading ckp: %@", buf, 0xCu);
    }
  }

  if (v8)
  {
    if (v17)
    {
      unsigned __int8 v24 = -[CKKSCurrentKeyPointer matchesCKRecord:](v17, "matchesCKRecord:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneID]);
      SEL v27 = (void *)objc_claimAutoreleasedReturnValue([v26 zoneName]);
      id v28 = sub_1000AA6AC(@"ckksresync", v27);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

      if ((v24 & 1) != 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v10;
          v30 = "Current key pointer has 'changed', but it matches our local copy: %@";
          v31 = v29;
          os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
          uint32_t v37 = 12;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, buf, v37);
        }
      }

      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v17;
        __int16 v68 = 2112;
        v69 = v10;
        v30 = "BUG: Local current key pointer doesn't match resynced CloudKit record: %@ %@";
        v31 = v29;
        os_log_type_t v32 = OS_LOG_TYPE_ERROR;
        uint32_t v37 = 22;
        goto LABEL_15;
      }
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneName]);
      id v36 = sub_1000AA6AC(@"ckksresync", v35);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v10;
        v30 = "BUG: No current key pointer matching resynced CloudKit record: %@";
        v31 = v29;
        os_log_type_t v32 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
  }

  v38 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSCurrentKeyPointer),  "initWithCKRecord:contextID:",  v10,  v11);
  id v64 = 0LL;
  unsigned __int8 v39 = -[CKKSSQLDatabaseObject saveToDatabase:](v38, "saveToDatabase:", &v64);
  v40 = (CKKSCurrentKeyPointer *)v64;
  if (v40) {
    BOOL v41 = 0;
  }
  else {
    BOOL v41 = v39;
  }
  if (v41)
  {
    if (-[CKKSCurrentKeyPointer matchesCKRecord:](v17, "matchesCKRecord:", v10))
    {
      v61 = v17;
      id v42 = v12;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 zoneID]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 zoneName]);
      id v46 = sub_1000AA6AC(@"ckkskey", v45);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Current key pointer modification doesn't change anything interesting; skipping reprocess: %@",
          buf,
          0xCu);
      }

      id v12 = v42;
      id v17 = v61;
    }

    else
    {
      [v12 _onqueueHandleFlag:@"key_process_requested"];
    }
  }

  else
  {
    v62 = v17;
    id v48 = v12;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 zoneID]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 zoneName]);
    id v52 = sub_1000AA6AC(@"ckkskey", v51);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);

    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v38;
      __int16 v68 = 2112;
      v69 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Couldn't save current key pointer to database: %@: %@",  buf,  0x16u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeyPointer recordID](v10, "recordID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 zoneID]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 zoneName]);
    id v57 = sub_1000AA6AC(@"ckkskey", v56);
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);

    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "CKRecord was %@", buf, 0xCu);
    }

    id v12 = v48;
    id v17 = v62;
    if (a7) {
      *a7 = v40;
    }
  }

  return v41;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
  id v25 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  v9,  v8,  v10,  &v25));

  id v12 = v25;
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
    id v15 = sub_1000AA6AC(@"ckkskey", v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "error loading ckp: %@", buf, 0xCu);
    }

    BOOL v17 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  else if (v11)
  {
    id v24 = 0LL;
    [v11 deleteFromDatabase:&v24];
    id v18 = v24;
    BOOL v17 = v18 == 0LL;
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneName]);
      id v21 = sub_1000AA6AC(@"ckkskey", v20);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "error deleting ckp: %@", buf, 0xCu);
      }

      if (a5) {
        *a5 = v18;
      }
    }
  }

  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

@end