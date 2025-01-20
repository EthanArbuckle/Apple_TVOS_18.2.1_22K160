@interface CachedServerDataService
+ (_TtC12amsaccountsd23CachedServerDataService)sharedService;
- (_TtC12amsaccountsd23CachedServerDataService)init;
- (void)accountAuthSyncFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4;
- (void)changeAutoPlayFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5;
- (void)changePersonalizationFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5;
- (void)dataWithAccounts:(NSArray *)a3 completionHandler:(id)a4;
- (void)performOnStartup;
- (void)queueMetricsEventFor:(NSDate *)a3 appID:(NSString *)a4 completionHandler:(id)a5;
- (void)removeDataFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4;
@end

@implementation CachedServerDataService

+ (_TtC12amsaccountsd23CachedServerDataService)sharedService
{
  return (_TtC12amsaccountsd23CachedServerDataService *)sub_100081928();
}

- (_TtC12amsaccountsd23CachedServerDataService)init
{
  return (_TtC12amsaccountsd23CachedServerDataService *)sub_10008197C();
}

- (void)dataWithAccounts:(NSArray *)a3 completionHandler:(id)a4
{
}

- (void)changeAutoPlayFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)changePersonalizationFor:(AMSAccountIdentity *)a3 to:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)removeDataFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4
{
}

- (void)accountAuthSyncFor:(AMSAccountIdentity *)a3 completionHandler:(id)a4
{
}

- (void)performOnStartup
{
  v2 = self;
  sub_10008600C();
}

- (void)queueMetricsEventFor:(NSDate *)a3 appID:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject(&unk_1000DA248, 48LL, 7LL);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_10008183C((uint64_t)&unk_1000F16C8, (uint64_t)v9);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12amsaccountsd23CachedServerDataService_accountDataActors));

  sub_100054930((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12amsaccountsd23CachedServerDataService_metrics));
}

@end