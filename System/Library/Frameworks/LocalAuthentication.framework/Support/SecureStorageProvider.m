@interface SecureStorageProvider
+ (id)sharedInstance;
- (id)secureStorage;
- (id)secureStorageWithConfig:(id)a3;
@end

@implementation SecureStorageProvider

+ (id)sharedInstance
{
  if (qword_10003E1A8 != -1) {
    dispatch_once(&qword_10003E1A8, &stru_100030790);
  }
  return (id)qword_10003E1A0;
}

- (id)secureStorage
{
  return objc_alloc_init(&OBJC_CLASS___SecureStorage);
}

- (id)secureStorageWithConfig:(id)a3
{
  id v3 = a3;
  v4 = -[SecureStorage initWithConfig:](objc_alloc(&OBJC_CLASS___SecureStorage), "initWithConfig:", v3);

  return v4;
}

@end