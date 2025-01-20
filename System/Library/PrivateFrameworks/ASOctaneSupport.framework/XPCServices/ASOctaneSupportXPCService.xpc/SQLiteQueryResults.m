@interface SQLiteQueryResults
- (BOOL)hasRows;
- (NSNumber)firstNumberValue;
- (SQLiteQueryResults)initWithStatement:(id)a3;
- (int)clearBindings;
- (int64_t)firstInt64Value;
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
- (void)enumerateRowsUsingBlock:(id)a3;
@end

@implementation SQLiteQueryResults

- (SQLiteQueryResults)initWithStatement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLiteQueryResults;
  v6 = -[SQLiteQueryResults init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statement, a3);
  }

  return v7;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[SQLiteCursor initWithStatement:]( objc_alloc(&OBJC_CLASS___SQLiteCursor),  "initWithStatement:",  self->_statement);
  v6 = -[SQLiteStatement sqlite3_stmt](self->_statement, "sqlite3_stmt");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteStatement connection](self->_statement, "connection"));
  id v17 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007A5C;
  v13[3] = &unk_10026F328;
  v16 = v6;
  id v8 = v4;
  id v15 = v8;
  objc_super v9 = v5;
  v14 = v9;
  unsigned int v10 = [v7 executeWithError:&v17 usingBlock:v13];
  id v11 = v17;

  if (v10)
  {
    -[SQLiteStatement reset](self->_statement, "reset");
  }

  else
  {
    char v12 = 0;
    (*((void (**)(id, void, id, char *))v8 + 2))(v8, 0LL, v11, &v12);
  }
}

- (int64_t)firstInt64Value
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007B54;
  v4[3] = &unk_10026F350;
  v4[4] = &v5;
  -[SQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSNumber)firstNumberValue
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_100007C5C;
  objc_super v9 = sub_100007C6C;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007C74;
  v4[3] = &unk_10026F350;
  v4[4] = &v5;
  -[SQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (BOOL)hasRows
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007D64;
  v4[3] = &unk_10026F350;
  v4[4] = &v5;
  -[SQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
}

- (void)bindNullAtPosition:(int)a3
{
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindUUID:(id)a3 atPosition:(int)a4
{
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
}

- (int)clearBindings
{
  return -[SQLiteStatement clearBindings](self->_statement, "clearBindings");
}

- (void).cxx_destruct
{
}

@end