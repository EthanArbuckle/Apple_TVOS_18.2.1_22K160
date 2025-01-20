@interface FLSQLiteQuery
+ (id)queryWithString:(id)a3;
- (NSString)queryString;
- (id)bindHandler;
- (id)rowHandler;
- (void)setBindHandler:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setRowHandler:(id)a3;
@end

@implementation FLSQLiteQuery

+ (id)queryWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___FLSQLiteQuery);
  -[FLSQLiteQuery setQueryString:](v4, "setQueryString:", v3);

  return v4;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
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