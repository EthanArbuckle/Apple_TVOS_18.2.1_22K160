@interface AMSTokenStorage
- (AMSTokenStorage)init;
- (id)loadWithName:(id)a3;
- (void)save:(NSDictionary *)a3 name:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation AMSTokenStorage

- (void)save:(NSDictionary *)a3 name:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject(&unk_1001B4900, 48LL, 7LL);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_10015C474((uint64_t)&unk_1001D04C8, (uint64_t)v9);
}

- (id)loadWithName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_10015C54C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (AMSTokenStorage)init
{
  return result;
}

@end