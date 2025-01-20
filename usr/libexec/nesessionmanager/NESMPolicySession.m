@interface NESMPolicySession
- (NESMPolicySession)init;
- (void)dealloc;
@end

@implementation NESMPolicySession

- (NESMPolicySession)init
{
}

- (void)dealloc
{
  if (self)
  {
    sub_10002BFE8((uint64_t)&OBJC_CLASS___NESMPolicyMasterSession, &stru_1000BDB08);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id Property = objc_getProperty(self, v5, 176LL, 1);
  }

  else
  {
    id Property = 0LL;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
  }

  id v7 = Property;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        sub_10002C08C(self, v12);
        sub_10002C144(self, v12);
        sub_10002C1FC(self, v12);
        sub_10002C2B4((uint64_t)self, v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NESMPolicySession;
  -[NESMPolicySession dealloc](&v13, "dealloc");
}

- (void).cxx_destruct
{
}

@end