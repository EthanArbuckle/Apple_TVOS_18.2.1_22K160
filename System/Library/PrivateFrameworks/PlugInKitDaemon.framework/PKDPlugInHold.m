@interface PKDPlugInHold
- (BOOL)isEqual:(id)a3;
- (NSDate)created;
- (NSSet)blocked;
- (NSString)extensionPointName;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (PKDPlugInHold)initWithPlugIns:(id)a3 extensionPointName:(id)a4 forClient:(id)a5;
- (PKDXpcClient)client;
- (id)description;
- (unint64_t)hash;
- (void)setBlocked:(id)a3;
- (void)setClient:(id)a3;
- (void)setCreated:(id)a3;
- (void)setExtensionPointName:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PKDPlugInHold

- (PKDPlugInHold)initWithPlugIns:(id)a3 extensionPointName:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PKDPlugInHold;
  v11 = -[PKDPlugInHold init](&v17, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[PKDPlugInHold setUuid:](v11, "setUuid:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    -[PKDPlugInHold setBlocked:](v11, "setBlocked:", v13);

    -[PKDPlugInHold setExtensionPointName:](v11, "setExtensionPointName:", v9);
    -[PKDPlugInHold setClient:](v11, "setClient:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PKDPlugInHold setCreated:](v11, "setCreated:", v14);

    v15 = (void *)os_transaction_create("com.apple.pluginkit.pluginhold");
    -[PKDPlugInHold setTransaction:](v11, "setTransaction:", v15);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PKDPlugInHold);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold uuid](self, "uuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    unsigned __int8 v8 = [v6 isEqual:v7];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold uuid](self, "uuid"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold uuid](self, "uuid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold client](self, "client"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold created](self, "created"));
  [v5 timeIntervalSince1970];
  uint64_t v7 = v6;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold extensionPointName](self, "extensionPointName"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugInHold blocked](self, "blocked"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<PKDPlugInHold: %p; uuid = %@, client = %@, created = %f, EP = %@, blocking = %@>",
                    self,
                    v3,
                    v4,
                    v7,
                    v8,
                    v9));

  return v10;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSSet)blocked
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBlocked:(id)a3
{
}

- (PKDXpcClient)client
{
  return (PKDXpcClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
}

- (NSDate)created
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCreated:(id)a3
{
}

- (NSString)extensionPointName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setExtensionPointName:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end