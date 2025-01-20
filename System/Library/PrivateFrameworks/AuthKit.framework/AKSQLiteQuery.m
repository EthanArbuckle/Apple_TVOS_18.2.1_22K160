@interface AKSQLiteQuery
+ (id)queryWithString:(id)a3;
- (BOOL)_bindStatement:(sqlite3_stmt *)a3 withParameter:(id)a4 atPosition:(int)a5;
- (BOOL)bindingFailure;
- (NSString)queryString;
- (id)bindHandler;
- (id)rowHandler;
- (void)bindParameter:(id)a3 error:(id *)a4;
- (void)bindParameters:(id)a3 error:(id *)a4;
- (void)setBindHandler:(id)a3;
- (void)setBindingFailure:(BOOL)a3;
- (void)setQueryString:(id)a3;
- (void)setRowHandler:(id)a3;
@end

@implementation AKSQLiteQuery

+ (id)queryWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___AKSQLiteQuery);
  -[AKSQLiteQuery setQueryString:](v4, "setQueryString:", v3);

  return v4;
}

- (void)bindParameter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A1B10;
  v10[3] = &unk_1001CA680;
  objc_copyWeak(v12, &location);
  id v11 = v6;
  v12[1] = a4;
  id v7 = v6;
  v8 = objc_retainBlock(v10);
  id bindHandler = self->_bindHandler;
  self->_id bindHandler = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)bindParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A1CC0;
  v10[3] = &unk_1001CA680;
  objc_copyWeak(v12, &location);
  id v11 = v6;
  v12[1] = a4;
  id v7 = v6;
  v8 = objc_retainBlock(v10);
  id bindHandler = self->_bindHandler;
  self->_id bindHandler = v8;

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (BOOL)_bindStatement:(sqlite3_stmt *)a3 withParameter:(id)a4 atPosition:(int)a5
{
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    int v11 = sqlite3_bind_text( a3, a5, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
    BOOL v22 = v11 == 0;
    goto LABEL_11;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber, v10);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
  {
    [v7 doubleValue];
LABEL_5:
    int v11 = sqlite3_bind_double(a3, a5, v14);
    goto LABEL_10;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  if ((objc_opt_isKindOfClass(v7, v15) & 1) != 0)
  {
    int v11 = sqlite3_bind_int(a3, a5, (int)[v7 intValue]);
    goto LABEL_10;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData, v16);
  if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
  {
    id v19 = v7;
    id v20 = [v19 bytes];
    id v21 = [v19 length];

    int v11 = sqlite3_bind_blob64(a3, a5, v20, (sqlite3_uint64)v21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_10;
  }

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDate, v18);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v24);
  if ((isKindOfClass & 1) != 0)
  {
    [v7 timeIntervalSince1970];
    goto LABEL_5;
  }

  uint64_t v26 = _AKLogSystem(isKindOfClass);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_10013FD18(v27, v28, v29, v30, v31, v32, v33, v34);
  }

  BOOL v22 = 0;
LABEL_11:

  return v22;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (BOOL)bindingFailure
{
  return self->_bindingFailure;
}

- (void)setBindingFailure:(BOOL)a3
{
  self->_bindingFailure = a3;
}

- (id)bindHandler
{
  return self->_bindHandler;
}

- (void)setBindHandler:(id)a3
{
}

- (id)rowHandler
{
  return self->_rowHandler;
}

- (void)setRowHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end