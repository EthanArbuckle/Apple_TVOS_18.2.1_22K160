@interface AMSUIDCellularDataInquiry
+ (NSURL)settingsURL;
- (AMSUIDCellularDataInquiry)init;
- (AMSUIDCellularDataInquiry)initWithBundle:(id)a3;
- (BOOL)isEnabledForBundle;
- (BOOL)isEnabledForDevice;
- (BOOL)isSupported;
- (NSBundle)bundle;
@end

@implementation AMSUIDCellularDataInquiry

- (AMSUIDCellularDataInquiry)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSUIDCellularDataInquiry;
  v6 = -[AMSUIDCellularDataInquiry init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundle, a3);
  }

  return v7;
}

- (AMSUIDCellularDataInquiry)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = -[AMSUIDCellularDataInquiry initWithBundle:](self, "initWithBundle:", v3);

  return v4;
}

+ (NSURL)settingsURL
{
  return 0LL;
}

- (BOOL)isSupported
{
  return 0;
}

- (BOOL)isEnabledForDevice
{
  return 0;
}

- (BOOL)isEnabledForBundle
{
  return 0;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
}

@end