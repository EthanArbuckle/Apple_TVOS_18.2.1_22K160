@interface AMSAccountAuthenticationPluginQueue
- (AMSAccountAuthenticationPluginQueue)init;
- (id)enqueuePromiseBlock:(id)a3;
@end

@implementation AMSAccountAuthenticationPluginQueue

- (id)enqueuePromiseBlock:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_14838, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  v7 = (void *)sub_CCF8();

  swift_release(v5);
  return v7;
}

- (AMSAccountAuthenticationPluginQueue)init
{
  return (AMSAccountAuthenticationPluginQueue *)sub_CD98();
}

- (void).cxx_destruct
{
}

@end