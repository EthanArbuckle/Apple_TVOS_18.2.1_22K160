@interface _CPLPrequeliteScopeIsEqual
+ (void)initialize;
- (NSData)sql;
- (_CPLPrequeliteScopeIsEqual)initWithIdentifier:(id)a3;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLPrequeliteScopeIsEqual

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS____CPLPrequeliteScopeIsEqual) == a1)
  {
    v2 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  "scopeIdentifier = ?",  19LL);
    v3 = (void *)qword_1002A3920;
    qword_1002A3920 = (uint64_t)v2;
  }

- (_CPLPrequeliteScopeIsEqual)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____CPLPrequeliteScopeIsEqual;
  v5 = -[_CPLPrequeliteScopeIsEqual init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }

  return v5;
}

- (NSData)sql
{
  return (NSData *)(id)qword_1002A3920;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 1;
}

- (id)bindValuesToKeepAlive
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end