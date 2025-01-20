@interface AppInstallInfo
- (AppInstallInfo)init;
- (void)dealloc;
@end

@implementation AppInstallInfo

- (AppInstallInfo)init
{
  return (AppInstallInfo *)sub_10031DB1C(self, &off_10040D3D8, &__NSDictionary0__struct);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___AppInstallInfo;
  -[AppInstallInfo dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
}

@end