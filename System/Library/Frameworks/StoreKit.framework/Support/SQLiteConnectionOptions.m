@interface SQLiteConnectionOptions
+ (id)inMemoryDatabaseFlag;
+ (id)inMemoryDatabaseSharedCacheFlag;
- (BOOL)isInMemoryDatabase;
- (BOOL)isReadOnly;
- (NSString)databasePath;
- (NSString)encryptionKeyId;
- (NSString)protectionType;
- (SQLiteConnectionOptions)initWithDatabasePath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInMemoryDatabaseWithName:(id)a3;
- (int64_t)cacheSize;
- (void)setCacheSize:(int64_t)a3;
- (void)setCacheSizeWithNumberOfDatabasePages:(int64_t)a3;
- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3;
- (void)setEncryptionKeyId:(id)a3;
- (void)setProtectionType:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation SQLiteConnectionOptions

- (SQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLiteConnectionOptions;
  v5 = -[SQLiteConnectionOptions init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = v6;

    -[SQLiteConnectionOptions setCacheSizeWithNumberOfKilobytes:](v5, "setCacheSizeWithNumberOfKilobytes:", 64LL);
  }

  return v5;
}

- (id)initInMemoryDatabaseWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteConnectionOptions inMemoryDatabaseFlag]( &OBJC_CLASS___SQLiteConnectionOptions,  "inMemoryDatabaseFlag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteConnectionOptions inMemoryDatabaseSharedCacheFlag]( &OBJC_CLASS___SQLiteConnectionOptions,  "inMemoryDatabaseSharedCacheFlag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"file:%@?%@&%@",  v4,  v5,  v6));

  v8 = -[SQLiteConnectionOptions initWithDatabasePath:](self, "initWithDatabasePath:", v7);
  return v8;
}

- (void)setCacheSizeWithNumberOfDatabasePages:(int64_t)a3
{
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
}

- (BOOL)isInMemoryDatabase
{
  databasePath = self->_databasePath;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteConnectionOptions inMemoryDatabaseFlag]( &OBJC_CLASS___SQLiteConnectionOptions,  "inMemoryDatabaseFlag"));
  LOBYTE(databasePath) = -[NSString containsString:](databasePath, "containsString:", v3);

  return (char)databasePath;
}

+ (id)inMemoryDatabaseFlag
{
  return @"mode=memory";
}

+ (id)inMemoryDatabaseSharedCacheFlag
{
  return @"cache=shared";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    v5[2] = self->_cacheSize;
    id v7 = -[NSString copyWithZone:](self->_databasePath, "copyWithZone:", a3);
    v8 = (void *)v6[3];
    v6[3] = v7;

    id v9 = -[NSString copyWithZone:](self->_encryptionKeyId, "copyWithZone:", a3);
    v10 = (void *)v6[4];
    v6[4] = v9;

    *((_BYTE *)v6 + 8) = self->_readOnly;
  }

  return v6;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (NSString)databasePath
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)encryptionKeyId
{
  return self->_encryptionKeyId;
}

- (void)setEncryptionKeyId:(id)a3
{
}

- (NSString)protectionType
{
  return self->_protectionType;
}

- (void)setProtectionType:(id)a3
{
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
}

@end