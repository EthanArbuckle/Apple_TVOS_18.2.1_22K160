@interface CKKSSQLDatabaseObject
+ (BOOL)_deleteAll:(id *)a3;
+ (BOOL)deleteAll:(id *)a3;
+ (BOOL)deleteAllWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (BOOL)deleteFromTable:(id)a3 where:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6;
+ (BOOL)performCKKSTransaction:(id)a3;
+ (BOOL)queryDatabaseTable:(id)a3 where:(id)a4 columns:(id)a5 groupBy:(id)a6 orderBy:(id)a7 limit:(int64_t)a8 processRow:(id)a9 error:(id *)a10;
+ (BOOL)queryMaxValueForField:(id)a3 inTable:(id)a4 where:(id)a5 columns:(id)a6 processRow:(id)a7;
+ (BOOL)saveToDatabaseTable:(id)a3 row:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6;
+ (id)all:(id *)a3;
+ (id)allParentKeyUUIDsInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)allUUIDsWithContextID:(id)a3 inZones:(id)a4 error:(id *)a5;
+ (id)allUUIDsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)allWhere:(id)a3 error:(id *)a4;
+ (id)allWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fetch:(unint64_t)a3 error:(id *)a4;
+ (id)fetch:(unint64_t)a3 where:(id)a4 error:(id *)a5;
+ (id)fetch:(unint64_t)a3 where:(id)a4 orderBy:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)fromDatabaseWhere:(id)a3 error:(id *)a4;
+ (id)groupByClause:(id)a3;
+ (id)makeWhereClause:(id)a3;
+ (id)orderByClause:(id)a3;
+ (id)quotedString:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabaseWhere:(id)a3 error:(id *)a4;
+ (void)bindWhereClause:(sqlite3_stmt *)a3 whereDict:(id)a4 cferror:(__CFError *)a5;
- (BOOL)_deleteFromDatabase:(id *)a3;
- (BOOL)_saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)deleteFromDatabase:(id *)a3;
- (BOOL)saveToDatabase:(id *)a3;
- (BOOL)saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (NSDictionary)originalSelfWhereClause;
- (id)copyWithZone:(_NSZone *)a3;
- (id)memoizeOriginalSelfWhereClause;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setOriginalSelfWhereClause:(id)a3;
@end

@implementation CKKSSQLDatabaseObject

- (BOOL)saveToDatabase:(id *)a3
{
  return -[CKKSSQLDatabaseObject saveToDatabaseWithConnection:error:]( self,  "saveToDatabaseWithConnection:error:",  0LL,  a3);
}

- (BOOL)saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  v7 = objc_autoreleasePoolPush();
  id v11 = 0LL;
  BOOL v8 = -[CKKSSQLDatabaseObject _saveToDatabaseWithConnection:error:]( self,  "_saveToDatabaseWithConnection:error:",  a3,  &v11);
  id v9 = v11;
  objc_autoreleasePoolPop(v7);
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)_saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject whereClauseToFindSelf](self, "whereClauseToFindSelf"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject originalSelfWhereClause](self, "originalSelfWhereClause"));
  if (!v8) {
    goto LABEL_4;
  }
  v10 = (void *)v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject originalSelfWhereClause](self, "originalSelfWhereClause"));
  unsigned __int8 v12 = [v11 isEqualToDictionary:v7];

  if ((v12 & 1) != 0
    || (id v13 = objc_msgSend((id)objc_opt_class(self, v9), "sqlTable"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13),
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject originalSelfWhereClause](self, "originalSelfWhereClause")),
        unsigned int v16 = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v14,  v15,  a3,  a4),  v15,  v14,  v16))
  {
LABEL_4:
    id v17 = objc_msgSend((id)objc_opt_class(self, v9), "sqlTable");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject sqlValues](self, "sqlValues"));
    BOOL v20 = +[CKKSSQLDatabaseObject saveToDatabaseTable:row:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "saveToDatabaseTable:row:connection:error:",  v18,  v19,  a3,  a4);
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)deleteFromDatabase:(id *)a3
{
  v5 = objc_autoreleasePoolPush();
  id v9 = 0LL;
  BOOL v6 = -[CKKSSQLDatabaseObject _deleteFromDatabase:](self, "_deleteFromDatabase:", &v9);
  id v7 = v9;
  objc_autoreleasePoolPop(v5);
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

- (BOOL)_deleteFromDatabase:(id *)a3
{
  id v5 = objc_msgSend((id)objc_opt_class(self, a2), "sqlTable");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject whereClauseToFindSelf](self, "whereClauseToFindSelf"));
  LOBYTE(a3) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v6,  v7,  0LL,  a3);

  return (char)a3;
}

- (id)memoizeOriginalSelfWhereClause
{
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[CKKSSQLDatabaseObject whereClauseToFindSelf](self, "whereClauseToFindSelf"));
  originalSelfWhereClause = self->_originalSelfWhereClause;
  self->_originalSelfWhereClause = v3;

  return self;
}

- (id)sqlValues
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A subclass must override %@",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[CKKSSQLDatabaseObject whereClauseToFindSelf](v6, v7);
}

- (id)whereClauseToFindSelf
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A subclass must override %@",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[CKKSSQLDatabaseObject copyWithZone:](v6, v7, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_originalSelfWhereClause);
  return v4;
}

- (NSDictionary)originalSelfWhereClause
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setOriginalSelfWhereClause:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)saveToDatabaseTable:(id)a3 row:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000326C4;
  v16[3] = &unk_1002839D8;
  id v10 = a4;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  v19 = &v20;
  unsigned __int8 v12 = objc_retainBlock(v16);
  id v13 = v12;
  if (a5) {
    ((void (*)(void *, __OpaqueSecDbConnection *))v12[2])(v12, a5);
  }
  else {
    sub_100110ECC(1, 1, 0LL, (uint64_t)(v21 + 3), (uint64_t)v12);
  }
  v14 = (void *)v21[3];
  if (a6)
  {
    *a6 = v14;
  }

  else if (v14)
  {
    v21[3] = 0LL;
    CFRelease(v14);
  }

  _Block_object_dispose(&v20, 8);
  return v14 == 0LL;
}

+ (id)makeWhereClause:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2020000000LL;
    char v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100032344;
    v6[3] = &unk_100283A00;
    uint64_t v8 = v9;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    SEL v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }

  else
  {
    v4 = (NSMutableString *)&stru_100294B48;
  }

  return v4;
}

+ (id)groupByClause:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2020000000LL;
    char v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000322BC;
    v6[3] = &unk_100283A28;
    uint64_t v8 = v9;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    SEL v7 = v4;
    [v3 enumerateObjectsUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }

  else
  {
    v4 = (NSMutableString *)&stru_100294B48;
  }

  return v4;
}

+ (id)orderByClause:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x2020000000LL;
    char v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100032234;
    v7[3] = &unk_100283A28;
    id v9 = v10;
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    uint64_t v8 = v5;
    [v4 enumerateObjectsUsingBlock:v7];

    _Block_object_dispose(v10, 8);
  }

  else
  {
    id v5 = (NSMutableString *)&stru_100294B48;
  }

  return v5;
}

+ (void)bindWhereClause:(sqlite3_stmt *)a3 whereDict:(id)a4 cferror:(__CFError *)a5
{
  id v7 = a4;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  int v16 = 1;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100031F34;
  void v10[3] = &unk_100283A50;
  id v9 = v7;
  id v11 = v9;
  unsigned __int8 v12 = v15;
  id v13 = a3;
  v14 = a5;
  [v8 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v15, 8);
}

+ (BOOL)deleteFromTable:(id)a3 where:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100031DF0;
  v17[3] = &unk_100283AC0;
  id v11 = a4;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  uint64_t v20 = &v22;
  id v21 = a1;
  id v13 = objc_retainBlock(v17);
  v14 = v13;
  if (a5) {
    ((void (*)(void *, __OpaqueSecDbConnection *))v13[2])(v13, a5);
  }
  else {
    sub_100110ECC(1, 1, 0LL, (uint64_t)(v23 + 3), (uint64_t)v13);
  }
  v15 = (void *)v23[3];
  if (a6)
  {
    *a6 = v15;
  }

  else if (v15)
  {
    v23[3] = 0LL;
    CFRelease(v15);
  }

  _Block_object_dispose(&v22, 8);
  return v15 == 0LL;
}

+ (BOOL)queryDatabaseTable:(id)a3 where:(id)a4 columns:(id)a5 groupBy:(id)a6 orderBy:(id)a7 limit:(int64_t)a8 processRow:(id)a9 error:(id *)a10
{
  id v27 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  context = objc_autoreleasePoolPush();
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000319BC;
  v31[3] = &unk_100283B60;
  id v19 = v15;
  id v32 = v19;
  id v20 = v14;
  id v33 = v20;
  id v21 = v16;
  id v34 = v21;
  id v22 = v17;
  id v35 = v22;
  int64_t v39 = a8;
  id v23 = v27;
  id v36 = v23;
  v38 = &v41;
  id v40 = a1;
  id v24 = v18;
  id v37 = v24;
  sub_100110ECC(1, 1, 0LL, (uint64_t)&v44, (uint64_t)v31);
  uint64_t v25 = (void *)v42[3];

  _Block_object_dispose(&v41, 8);
  objc_autoreleasePoolPop(context);
  if (a10) {
    *a10 = v25;
  }

  return v25 == 0LL;
}

+ (id)quotedString:(id)a3
{
  id v3 = a3;
  v4 = sqlite3_mprintf("%q", [v3 UTF8String]);
  if (!v4) {
    abort();
  }
  id v5 = v4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  sqlite3_free(v5);

  return v6;
}

+ (BOOL)queryMaxValueForField:(id)a3 inTable:(id)a4 where:(id)a5 columns:(id)a6 processRow:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000314C4;
  v24[3] = &unk_100283B88;
  id v31 = a1;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v15;
  id v27 = v19;
  id v20 = v14;
  id v28 = v20;
  v30 = &v32;
  id v21 = v16;
  id v29 = v21;
  sub_100110ECC(0, 1, 0LL, (uint64_t)&v35, (uint64_t)v24);
  id v22 = (const void *)v33[3];
  if (v22)
  {
    v33[3] = 0LL;
    CFRelease(v22);
  }

  _Block_object_dispose(&v32, 8);
  return v22 == 0LL;
}

+ (BOOL)performCKKSTransaction:(id)a3
{
  CFTypeRef cf = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100031330;
  void v9[3] = &unk_100283BD8;
  id v3 = a3;
  id v10 = v3;
  char v4 = sub_100110ECC(1, 1, 0LL, (uint64_t)&cf, (uint64_t)v9);
  if (cf)
  {
    id v5 = sub_1000AA6AC(@"ckkssql", 0LL);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v13 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "error performing database operation, major problems ahead: %@",  buf,  0xCu);
    }

    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v7);
    }
  }

  return v4;
}

+ (BOOL)deleteAll:(id *)a3
{
  id v5 = objc_autoreleasePoolPush();
  id v9 = 0LL;
  unsigned __int8 v6 = [a1 _deleteAll:&v9];
  id v7 = v9;
  objc_autoreleasePoolPop(v5);
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

+ (BOOL)_deleteAll:(id *)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  LOBYTE(a3) = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v4,  0LL,  0LL,  a3);

  return (char)a3;
}

+ (id)fromDatabaseWhere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v6 error:a4]);
  id v9 = (void *)v7;
  if (a4 && !v7)
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ does not exist in database where %@",  objc_opt_class(a1, v8),  v6);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v15 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -25300LL,  v12));
  }

  return v9;
}

+ (id)tryFromDatabaseWhere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  CFTypeRef v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100031208;
  id v16 = sub_100031218;
  id v17 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlColumns]);
  v11[1] = 3221225472LL;
  v11[2] = sub_1000312D8;
  v11[3] = &unk_100283C00;
  v11[4] = &v12;
  v11[5] = a1;
  v11[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v7,  v6,  v8,  0LL,  0LL,  -1LL,  v11,  a4);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)all:(id *)a3
{
  return [a1 allWhere:0 error:a3];
}

+ (id)allWhere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  CFTypeRef v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100031208;
  id v16 = sub_100031218;
  id v17 = (NSMutableArray *)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlColumns]);
  v11[1] = 3221225472LL;
  v11[2] = sub_10003127C;
  v11[3] = &unk_100283C00;
  v11[4] = &v12;
  v11[5] = a1;
  v11[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v7,  v6,  v8,  0LL,  0LL,  -1LL,  v11,  a4);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)fetch:(unint64_t)a3 error:(id *)a4
{
  return [a1 fetch:a3 where:0 orderBy:0 error:a4];
}

+ (id)fetch:(unint64_t)a3 where:(id)a4 error:(id *)a5
{
  return [a1 fetch:a3 where:a4 orderBy:0 error:a5];
}

+ (id)fetch:(unint64_t)a3 where:(id)a4 orderBy:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_100031208;
  id v21 = sub_100031218;
  id v22 = (NSMutableArray *)0xAAAAAAAAAAAAAAAALL;
  id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  CFTypeRef v13 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlColumns]);
  v16[1] = 3221225472LL;
  v16[2] = sub_100031220;
  v16[3] = &unk_100283C00;
  void v16[4] = &v17;
  v16[5] = a1;
  v16[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v12,  v10,  v13,  0LL,  v11,  a3,  v16,  a6);

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A subclass must override %@",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return +[CKKSSQLDatabaseObject sqlTable](v9, v10);
}

+ (id)sqlTable
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A subclass must override %@",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return +[CKKSSQLDatabaseObject sqlColumns](v6, v7);
}

+ (id)sqlColumns
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A subclass must override %@",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (id)sub_100031208(v6, v7);
}

+ (id)allUUIDsWithContextID:(id)a3 inZones:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_100055A38;
  uint64_t v34 = sub_100055A48;
  id v35 = (id)0xAAAAAAAAAAAAAAAALL;
  id v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  SEL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)i) zoneName]);
        [v10 addObject:v15];
      }

      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }

    while (v12);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  v36[0] = @"contextID";
  id v17 = v8;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v36[1] = @"ckzone";
  v37[0] = v20;
  id v21 = -[CKKSSQLWhereIn initWithValues:](objc_alloc(&OBJC_CLASS___CKKSSQLWhereIn), "initWithValues:", v10);
  v37[1] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100055B18;
  v25[3] = &unk_100290E08;
  v25[4] = &v30;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v16,  v22,  &off_1002AE430,  0LL,  0LL,  -1LL,  v25,  a5);

  id v23 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v23;
}

+ (id)allUUIDsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = sub_100055A38;
  __int128 v27 = sub_100055A48;
  __int128 v28 = (NSMutableArray *)0xAAAAAAAAAAAAAAAALL;
  __int128 v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  SEL v10 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  v29[0] = @"contextID";
  id v11 = v8;
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v14 = v13;

  v30[0] = v14;
  v29[1] = @"ckzone";
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  id v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v18 = v17;

  v30[1] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  v22[1] = 3221225472LL;
  v22[2] = sub_100055AB4;
  v22[3] = &unk_100290E08;
  v22[4] = &v23;
  v22[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v10,  v19,  &off_1002AE448,  0LL,  0LL,  -1LL,  v22,  a5);

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

+ (id)allParentKeyUUIDsInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = sub_100055A38;
  __int128 v27 = sub_100055A48;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  SEL v10 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  v29[0] = @"contextID";
  id v11 = v8;
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v14 = v13;

  v30[0] = v14;
  v29[1] = @"ckzone";
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  id v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v18 = v17;

  v30[1] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  v22[1] = 3221225472LL;
  v22[2] = sub_100055A50;
  v22[3] = &unk_100290E08;
  v22[4] = &v23;
  v22[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v10,  v19,  &off_1002AE460,  0LL,  0LL,  -1LL,  v22,  a5);

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

+ (id)allWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v13 = v12;

  v21[1] = @"ckzone";
  v22[0] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v22[1] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v18 error:a5]);

  return v19;
}

+ (BOOL)deleteAllWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 sqlTable]);
  v21[0] = @"contextID";
  id v11 = v8;
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v14 = v13;

  v21[1] = @"ckzone";
  v22[0] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  if (v15) {
    id v16 = v15;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v22[1] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  BOOL v19 = +[CKKSSQLDatabaseObject deleteFromTable:where:connection:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "deleteFromTable:where:connection:error:",  v10,  v18,  0LL,  a5);

  return v19;
}

@end