@interface OTManagedConfigurationActualAdapter
- (BOOL)isCloudKeychainSyncAllowed;
@end

@implementation OTManagedConfigurationActualAdapter

- (BOOL)isCloudKeychainSyncAllowed
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2050000000LL;
  v2 = (void *)qword_100268FB0;
  uint64_t v11 = qword_100268FB0;
  if (!qword_100268FB0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001C6A3C;
    v7[3] = &unk_100236E50;
    v7[4] = &v8;
    sub_1001C6A3C((uint64_t)v7);
    v2 = (void *)v9[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedConnection]);
  unsigned __int8 v5 = [v4 isCloudKeychainSyncAllowed];

  return v5;
}

@end