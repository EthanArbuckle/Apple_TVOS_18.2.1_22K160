@interface GKBulletinService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthentication;
- (void)sendRefreshContentsForDataTypeToAllClientProxy:(unsigned int)a3;
@end

@implementation GKBulletinService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKBulletinServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 1LL;
}

- (BOOL)requiresAuthentication
{
  return 0;
}

- (void)sendRefreshContentsForDataTypeToAllClientProxy:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000CA88;
  v3[3] = &unk_10026B330;
  unsigned int v4 = a3;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v3);
}

@end