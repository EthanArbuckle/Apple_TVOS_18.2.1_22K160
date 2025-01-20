@interface CKKSPowerCollection
+ (void)CKKSPowerEvent:(id)a3 count:(unint64_t)a4;
+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4;
+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4 count:(unint64_t)a5;
+ (void)OTPowerEvent:(id)a3;
- (CKKSPowerCollection)init;
- (NSMutableDictionary)delete;
- (NSMutableDictionary)store;
- (void)addToStatsDictionary:(id)a3 key:(id)a4;
- (void)commit;
- (void)deletedOQE:(id)a3;
- (void)setDelete:(id)a3;
- (void)setStore:(id)a3;
- (void)storedOQE:(id)a3;
- (void)summary:(id)a3 stats:(id)a4;
@end

@implementation CKKSPowerCollection

- (CKKSPowerCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CKKSPowerCollection;
  v2 = -[CKKSPowerCollection init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v4 = v2->super._private;
    v2->super._private = (id)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v6 = *(void **)&v2->super._private1;
    *(void *)&v2->super._private1 = v5;
  }

  return v2;
}

- (void)addToStatsDictionary:(id)a3 key:(id)a4
{
  uint64_t v5 = (const __CFString *)a4;
  if (!v5) {
    uint64_t v5 = @"access-group-missing";
  }
  v9 = (__CFString *)v5;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v9]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v7 longValue] + 1));
  [v6 setObject:v8 forKeyedSubscript:v9];
}

- (void)storedOQE:(id)a3
{
  id v4 = self->super._private;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 accessgroup]);
  -[CKKSPowerCollection addToStatsDictionary:key:](self, "addToStatsDictionary:key:", v4, v5);
}

- (void)deletedOQE:(id)a3
{
  uint64_t v4 = *(void *)&self->super._private1;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 accessgroup]);
  -[CKKSPowerCollection addToStatsDictionary:key:](self, "addToStatsDictionary:key:", v4, v5);
}

- (void)summary:(id)a3 stats:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        v18[0] = @"operation";
        v18[1] = @"accessgroup";
        v19[0] = v5;
        v19[1] = v11;
        v18[2] = @"items";
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:"));
        v19[2] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
        sub_100018C10(@"CKKSSyncing", v13);

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v8);
  }
}

- (void)commit
{
}

- (NSMutableDictionary)store
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStore:(id)a3
{
}

- (NSMutableDictionary)delete
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDelete:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4
{
  v8[0] = @"operation";
  v8[1] = @"zone";
  v9[0] = a3;
  v9[1] = a4;
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  sub_100018C10(@"CKKSSyncing", v7);
}

+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4 count:(unint64_t)a5
{
  v11[0] = @"operation";
  v11[1] = @"zone";
  v12[0] = a3;
  v12[1] = a4;
  v11[2] = @"count";
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  v12[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  sub_100018C10(@"CKKSSyncing", v10);
}

+ (void)CKKSPowerEvent:(id)a3 count:(unint64_t)a4
{
  v8[0] = @"operation";
  v8[1] = @"count";
  v9[0] = a3;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v9[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  sub_100018C10(@"CKKSSyncing", v7);
}

+ (void)OTPowerEvent:(id)a3
{
  id v5 = @"operation";
  id v6 = a3;
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  sub_100018C10(@"OctagonTrust", v4);
}

@end