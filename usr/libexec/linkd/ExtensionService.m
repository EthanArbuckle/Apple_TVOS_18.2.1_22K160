@interface ExtensionService
- (_TtC10LinkDaemon16ExtensionService)init;
- (void)getConnectionHostInterfaceForBundleIdentifier:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation ExtensionService

- (void)getConnectionHostInterfaceForBundleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_1001268C0, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1000BC15C((uint64_t)&unk_100133D88, (uint64_t)v7);
}

- (_TtC10LinkDaemon16ExtensionService)init
{
  return (_TtC10LinkDaemon16ExtensionService *)sub_10000F6BC();
}

@end