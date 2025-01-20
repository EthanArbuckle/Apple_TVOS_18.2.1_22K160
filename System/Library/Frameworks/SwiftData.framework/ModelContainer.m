@interface ModelContainer
- (void)_observeRemoteNotifications:(id)a3;
@end

@implementation ModelContainer

- (void)_observeRemoteNotifications:(id)a3
{
  uint64_t v3 = sub_188A7684C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188A76834();
  swift_retain();
  sub_1889A258C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end