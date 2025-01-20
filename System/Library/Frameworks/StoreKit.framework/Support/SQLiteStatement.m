@interface SQLiteStatement
- (BOOL)isReadOnly;
- (NSDictionary)columnIndexByName;
- (NSString)SQL;
- (SQLiteConnection)connection;
- (SQLiteStatement)initWithStatement:(sqlite3_stmt *)a3 onConnection:(id)a4;
- (int)clearBindings;
- (int)finalizeStatement;
- (int)reset;
- (int)step;
- (sqlite3_stmt)sqlite3_stmt;
- (void)bindArray:(id)a3 atPosition:(int)a4;
- (void)bindData:(id)a3 atPosition:(int)a4;
- (void)bindDataCopy:(id)a3 atPosition:(int)a4;
- (void)bindDate:(id)a3 atPosition:(int)a4;
- (void)bindDictionary:(id)a3 atPosition:(int)a4;
- (void)bindDouble:(double)a3 atPosition:(int)a4;
- (void)bindFloat:(float)a3 atPosition:(int)a4;
- (void)bindInt64:(int64_t)a3 atPosition:(int)a4;
- (void)bindInt:(int)a3 atPosition:(int)a4;
- (void)bindNullAtPosition:(int)a3;
- (void)bindNumber:(id)a3 atPosition:(int)a4;
- (void)bindString:(id)a3 atPosition:(int)a4;
- (void)bindStringCopy:(id)a3 atPosition:(int)a4;
- (void)bindURL:(id)a3 atPosition:(int)a4;
- (void)bindUUID:(id)a3 atPosition:(int)a4;
@end

@implementation SQLiteStatement

- (SQLiteStatement)initWithStatement:(sqlite3_stmt *)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SQLiteStatement;
  v8 = -[SQLiteStatement init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_statement = a3;
    objc_storeStrong((id *)&v9->_strongSelf, v9);
  }

  return v9;
}

- (NSDictionary)columnIndexByName
{
  statement = self->_statement;
  if (statement)
  {
    int v4 = sqlite3_column_count(statement);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v4));
    if (v4 >= 1)
    {
      uint64_t v6 = 0LL;
      do
      {
        id v7 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v6);
        v8 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  sqlite3_column_name(self->_statement, v6));
        [v5 setObject:v7 forKey:v8];

        uint64_t v6 = (v6 + 1);
      }

      while (v4 != (_DWORD)v6);
    }
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
    v5 = 0LL;
  }

  return (NSDictionary *)v5;
}

- (int)finalizeStatement
{
  statement = self->_statement;
  if (statement)
  {
    int v4 = sqlite3_finalize(statement);
    strongSelf = self->_strongSelf;
    self->_statement = 0LL;
    self->_strongSelf = 0LL;

    LODWORD(statement) = v4;
  }

  return (int)statement;
}

- (BOOL)isReadOnly
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_stmt_readonly(statement) != 0;
  }
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  return 1;
}

- (int)reset
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_reset(statement);
  }
  else {
    return 21;
  }
}

- (NSString)SQL
{
  statement = self->_statement;
  if (statement)
  {
    v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_sql(statement));
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
    int v4 = &stru_1002FBA48;
  }

  return (NSString *)v4;
}

- (int)step
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_step(statement);
  }
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  return 21;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  a3,  0LL,  0LL));
  -[SQLiteStatement bindData:atPosition:](self, "bindData:atPosition:", v6, v4);
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
  id v6 = a3;
  statement = self->_statement;
  id v9 = v6;
  if (statement)
  {
    id v8 = v6;
    sqlite3_bind_blob(statement, a4, [v8 bytes], (int)objc_msgSend(v8, "length"), 0);
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
  id v6 = a3;
  statement = self->_statement;
  id v9 = v6;
  if (statement)
  {
    id v8 = v6;
    sqlite3_bind_blob( statement,  a4,  [v8 bytes],  (int)objc_msgSend(v8, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [a3 timeIntervalSinceReferenceDate];
  -[SQLiteStatement bindDouble:atPosition:](self, "bindDouble:atPosition:", v4);
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  a3,  0LL,  0LL));
  -[SQLiteStatement bindData:atPosition:](self, "bindData:atPosition:", v6, v4);
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_double(statement, a4, a3);
  }
  else {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized",  a3);
  }
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_double(statement, a4, a3);
  }
  else {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_int(statement, a4, a3);
  }
  else {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_int64(statement, a4, a3);
  }
  else {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindNullAtPosition:(int)a3
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_null(statement, a3);
  }
  else {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
  id v6 = (const __CFNumber *)a3;
  v10 = v6;
  if (!self->_statement)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
    goto LABEL_9;
  }

  CFNumberType Type = CFNumberGetType(v6);
  if ((unint64_t)Type > kCFNumberCGFloatType)
  {
LABEL_8:
    sqlite3_bind_int64(self->_statement, a4, (sqlite3_int64)-[__CFNumber longLongValue](v10, "longLongValue"));
    goto LABEL_9;
  }

  if (((1LL << Type) & 0x38E) == 0)
  {
    if (((1LL << Type) & 0x10060) != 0)
    {
      statement = self->_statement;
      -[__CFNumber doubleValue](v10, "doubleValue");
      sqlite3_bind_double(statement, a4, v9);
      goto LABEL_9;
    }

    goto LABEL_8;
  }

  sqlite3_bind_int(self->_statement, a4, (int)-[__CFNumber intValue](v10, "intValue"));
LABEL_9:
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
  id v6 = (const __CFString *)a3;
  theString = (__CFString *)v6;
  if (self->_statement)
  {
    CFStringEncoding FastestEncoding = CFStringGetFastestEncoding(v6);
    if (FastestEncoding != 256)
    {
      if (FastestEncoding == 134217984)
      {
        CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
        if (CStringPtr)
        {
          double v9 = CStringPtr;
          statement = self->_statement;
          int v11 = a4;
          uint64_t v12 = 0LL;
LABEL_10:
          sqlite3_bind_text(statement, v11, v9, -1, (void (__cdecl *)(void *))v12);
          goto LABEL_11;
        }
      }

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
  statement = self->_statement;
  if (statement) {
    sqlite3_bind_text( statement, a4, (const char *)[a3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Statement already finalized");
  }
}

- (void)bindUUID:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  -[SQLiteStatement bindString:atPosition:](self, "bindString:atPosition:", v6, v4);
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  -[SQLiteStatement bindString:atPosition:](self, "bindString:atPosition:", v6, v4);
}

- (int)clearBindings
{
  statement = self->_statement;
  if (statement) {
    return sqlite3_clear_bindings(statement);
  }
  else {
    return 21;
  }
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (sqlite3_stmt)sqlite3_stmt
{
  return self->_statement;
}

- (void).cxx_destruct
{
}

@end