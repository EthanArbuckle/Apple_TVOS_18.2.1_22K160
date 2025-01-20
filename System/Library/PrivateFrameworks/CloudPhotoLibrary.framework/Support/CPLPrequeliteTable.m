@interface CPLPrequeliteTable
+ (CPLPrequeliteTable)tableWithName:(id)a3;
- (CPLPrequeliteTable)initWithName:(id)a3;
- (NSData)sql;
- (NSString)description;
- (NSString)injectedTableName;
- (NSString)tableName;
- (id)redactedDescription;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation CPLPrequeliteTable

+ (CPLPrequeliteTable)tableWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4];

  return (CPLPrequeliteTable *)v5;
}

- (CPLPrequeliteTable)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLPrequeliteTable;
  id v5 = -[CPLPrequeliteTable init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    tableName = v5->_tableName;
    v5->_tableName = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[PQLNameInjection nameWithString:](&OBJC_CLASS___PQLNameInjection, "nameWithString:", v4));
    injection = v5->_injection;
    v5->_injection = (PQLNameInjection *)v8;
  }

  return v5;
}

- (NSData)sql
{
  return (NSData *)-[PQLNameInjection sql](self->_injection, "sql");
}

- (NSString)injectedTableName
{
  injectedTableName = self->_injectedTableName;
  if (!injectedTableName)
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSString);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PQLNameInjection sql](self->_injection, "sql"));
    v6 = -[NSString initWithData:encoding:](v4, "initWithData:encoding:", v5, 4LL);
    v7 = self->_injectedTableName;
    self->_injectedTableName = v6;

    injectedTableName = self->_injectedTableName;
  }

  return injectedTableName;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return -[PQLNameInjection bindWithStatement:startingAtIndex:]( self->_injection,  "bindWithStatement:startingAtIndex:",  a3,  *(void *)&a4);
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SQLTable %@>",  self->_tableName);
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SQLTable %@>",  self->_tableName);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
}

@end