@interface SQLiteStatement
- (int)clearBindings;
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

- (void).cxx_destruct
{
}

@end