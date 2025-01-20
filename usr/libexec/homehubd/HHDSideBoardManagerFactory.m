@interface HHDSideBoardManagerFactory
- (id)createApplicationControllerWithQueue:(id)a3;
- (id)createWiFiControllerWithQueue:(id)a3;
@end

@implementation HHDSideBoardManagerFactory

- (id)createApplicationControllerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___SIBCApplicationController);
  v5 = objc_opt_new(&OBJC_CLASS___HHDApplicationFactory);
  v6 = -[SIBCApplicationController initWithAppFactory:queue:](v4, "initWithAppFactory:queue:", v5, v3);

  return v6;
}

- (id)createWiFiControllerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = -[SIBCWiFiController initWithQueue:](objc_alloc(&OBJC_CLASS___SIBCWiFiController), "initWithQueue:", v3);

  return v4;
}

@end