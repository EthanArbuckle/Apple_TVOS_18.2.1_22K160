@interface IDSDatabase
- (IDSDatabase)init;
- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3;
- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3 filename:(id)a4;
- (NSString)filename;
- (unsigned)dataProtectionClass;
- (void)deleteDatabase;
- (void)ensureDatabaseIsInitialized;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setFilename:(id)a3;
@end

@implementation IDSDatabase

- (IDSDatabase)init
{
  return -[IDSDatabase initWithDataProtectionClass:](self, "initWithDataProtectionClass:", 0LL);
}

- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3
{
  return -[IDSDatabase initWithDataProtectionClass:filename:]( self,  "initWithDataProtectionClass:filename:",  *(void *)&a3,  0LL);
}

- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3 filename:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSDatabase;
  v7 = -[IDSDatabase init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[IDSDatabase setFilename:](v7, "setFilename:", v6);
    -[IDSDatabase setDataProtectionClass:](v8, "setDataProtectionClass:", v4);
  }

  return v8;
}

- (void)ensureDatabaseIsInitialized
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSDatabase filename](self, "filename"));

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1003B0250;
    v4[3] = &unk_1008FCA10;
    v4[4] = self;
    id v3 = objc_retainBlock(v4);
  }

  sub_1003AF9A4(1, self, v3);
}

- (void)deleteDatabase
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDatabase filename](self, "filename"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDatabase filename](self, "filename"));
    CSDBSqliteDeleteDatabase();
  }

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
}

@end