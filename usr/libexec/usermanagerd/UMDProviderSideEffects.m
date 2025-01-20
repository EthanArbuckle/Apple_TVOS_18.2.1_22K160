@interface UMDProviderSideEffects
+ (id)sideEffects;
- (UMDProviderSideEffects)init;
@end

@implementation UMDProviderSideEffects

+ (id)sideEffects
{
  if (qword_1000DBA60 != -1) {
    dispatch_once(&qword_1000DBA60, &stru_1000CD338);
  }
  return (id)qword_1000DBA58;
}

- (UMDProviderSideEffects)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UMDProviderSideEffects;
  v2 = -[UMDProviderSideEffects init](&v13, "init");
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___UMAppleKeyStoreProvider);
    sub_100082258((uint64_t)v2, v3);

    v4 = objc_alloc_init(&OBJC_CLASS___UMCommPageProvider);
    sub_1000198A4((uint64_t)v2, v4);

    id v5 = objc_alloc_init(&OBJC_CLASS___UMFilesystemProvider);
    sub_1000198B4((uint64_t)v2, v5);

    v6 = objc_alloc_init(&OBJC_CLASS___UMMobileKeyBagProvider);
    sub_1000198C4((uint64_t)v2, v6);

    v7 = objc_alloc_init(&OBJC_CLASS___UMKPersonaProvider);
    sub_1000198D4((uint64_t)v2, v7);

    v8 = objc_alloc_init(&OBJC_CLASS___UMLibNotifyProvider);
    sub_1000198E4((uint64_t)v2, v8);

    v9 = objc_alloc_init(&OBJC_CLASS___UMProcessProvider);
    sub_1000198F4((uint64_t)v2, v9);

    v10 = objc_alloc_init(&OBJC_CLASS___UMSecurityProvider);
    sub_100019904((uint64_t)v2, v10);

    v11 = v2;
  }

  return v2;
}

@end