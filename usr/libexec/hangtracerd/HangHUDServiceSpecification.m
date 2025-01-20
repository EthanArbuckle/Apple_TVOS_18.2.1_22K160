@interface HangHUDServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)clientContextIdentifierKey;
+ (NSString)domainName;
+ (NSString)identifier;
+ (NSString)machName;
@end

@implementation HangHUDServiceSpecification

+ (NSString)domainName
{
  return (NSString *)@"com.apple.HangHUD";
}

+ (NSString)machName
{
  return (NSString *)@"com.apple.HangHUD";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.HangHUD.service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)+[BSServiceQuality userInteractive](&OBJC_CLASS___BSServiceQuality, "userInteractive");
}

+ (BSServiceInterface)interface
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000160EC;
  block[3] = &unk_100049168;
  block[4] = a1;
  if (qword_10005BA78 != -1) {
    dispatch_once(&qword_10005BA78, block);
  }
  return (BSServiceInterface *)(id)qword_10005BA70;
}

+ (NSString)clientContextIdentifierKey
{
  return (NSString *)@"identifier";
}

@end