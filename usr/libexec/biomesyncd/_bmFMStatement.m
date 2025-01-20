@interface _bmFMStatement
- (BOOL)inUse;
- (NSString)query;
- (id)description;
- (int64_t)useCount;
- (void)close;
- (void)dealloc;
- (void)reset;
- (void)setInUse:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setStatement:(void *)a3;
- (void)setUseCount:(int64_t)a3;
- (void)statement;
@end

@implementation _bmFMStatement

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____bmFMStatement;
  -[_bmFMStatement dealloc](&v3, "dealloc");
}

- (void)close
{
  statement = (sqlite3_stmt *)self->_statement;
  if (statement)
  {
    sqlite3_finalize(statement);
    self->_statement = 0LL;
  }

  self->_inUse = 0;
}

- (void)reset
{
  statement = (sqlite3_stmt *)self->_statement;
  if (statement) {
    sqlite3_reset(statement);
  }
  self->_inUse = 0;
}

- (id)description
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___NSString);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____bmFMStatement;
  id v4 = -[_bmFMStatement description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ %ld hit(s) for query %@",  v5,  self->_useCount,  self->_query);

  return v6;
}

- (int64_t)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(int64_t)a3
{
  self->_useCount = a3;
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQuery:(id)a3
{
}

- (void)statement
{
  return self->_statement;
}

- (void)setStatement:(void *)a3
{
  self->_statement = a3;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (void).cxx_destruct
{
}

@end