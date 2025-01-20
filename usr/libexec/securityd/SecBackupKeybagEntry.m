@interface SecBackupKeybagEntry
+ (id)fromDatabase:(id)a3 error:(id *)a4;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)state:(id)a3;
+ (id)tryFromDatabase:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)musr;
- (NSData)publickey;
- (NSData)publickeyHash;
- (SecBackupKeybagEntry)initWithPublicKey:(id)a3 publickeyHash:(id)a4 user:(id)a5;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setMusr:(id)a3;
- (void)setPublickey:(id)a3;
- (void)setPublickeyHash:(id)a3;
@end

@implementation SecBackupKeybagEntry

- (SecBackupKeybagEntry)initWithPublicKey:(id)a3 publickeyHash:(id)a4 user:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SecBackupKeybagEntry;
  v12 = -[SecBackupKeybagEntry init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_publickey, a3);
    objc_storeStrong((id *)&v13->_publickeyHash, a4);
    objc_storeStrong((id *)&v13->_musr, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SecBackupKeybagEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickeyHash](self, "publickeyHash"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 publickeyHash]);

    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)whereClauseToFindSelf
{
  uint64_t v5 = @"publickeyHash";
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickeyHash](self, "publickeyHash"));
  id v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

- (id)sqlValues
{
  v11[0] = @"publickey";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickey](self, "publickey"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);
  v12[0] = v4;
  v11[1] = @"publickeyHash";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry publickeyHash](self, "publickeyHash"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);
  v12[1] = v6;
  v11[2] = @"musr";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecBackupKeybagEntry musr](self, "musr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
  v12[2] = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  return v9;
}

- (NSData)publickeyHash
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPublickeyHash:(id)a3
{
}

- (NSData)publickey
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPublickey:(id)a3
{
}

- (NSData)musr
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMusr:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)state:(id)a3
{
  id v3 = a3;
  id v9 = 0LL;
  id v4 = (SecBackupKeybagEntry *)objc_claimAutoreleasedReturnValue( +[SecBackupKeybagEntry tryFromDatabase:error:]( &OBJC_CLASS___SecBackupKeybagEntry,  "tryFromDatabase:error:",  v3,  &v9));
  id v5 = v9;
  if (v5)
  {
    id v6 = sub_10001267C("SecError");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CKKS: error fetching SecBackupKeybagEntry(%@): %@",  buf,  0x16u);
    }
  }

  if (!v4) {
    id v4 = -[SecBackupKeybagEntry initWithPublicKey:publickeyHash:user:]( objc_alloc(&OBJC_CLASS___SecBackupKeybagEntry),  "initWithPublicKey:publickeyHash:user:",  0LL,  v3,  0LL);
  }

  return v4;
}

+ (id)fromDatabase:(id)a3 error:(id *)a4
{
  id v10 = @"publickeyHash";
  id v11 = a3;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v7 error:a4]);
  return v8;
}

+ (id)tryFromDatabase:(id)a3 error:(id *)a4
{
  id v10 = @"publickeyHash";
  id v11 = a3;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));

  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v7 error:a4]);
  return v8;
}

+ (id)sqlTable
{
  return @"backup_keybag";
}

+ (id)sqlColumns
{
  return &off_1002AE748;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"publickey"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 asBase64DecodedData]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"publickeyHash"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 asBase64DecodedData]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"musr"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 asBase64DecodedData]);

  id v10 = 0LL;
  if (v5 && v7 && v9) {
    id v10 = -[SecBackupKeybagEntry initWithPublicKey:publickeyHash:user:]( objc_alloc(&OBJC_CLASS___SecBackupKeybagEntry),  "initWithPublicKey:publickeyHash:user:",  v5,  v7,  v9);
  }

  return v10;
}

@end