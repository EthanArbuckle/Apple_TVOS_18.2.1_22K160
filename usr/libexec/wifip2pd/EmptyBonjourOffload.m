@interface EmptyBonjourOffload
- (void)startServiceDiscoveryWithConfiguration:(void *)a3 completionHandler:(void *)aBlock;
@end

@implementation EmptyBonjourOffload

- (void)startServiceDiscoveryWithConfiguration:(void *)a3 completionHandler:(void *)aBlock
{
  v6 = _Block_copy(aBlock);
  v7 = (void (*)(void *, void))v6[2];
  id v8 = a3;
  id v9 = a1;
  v7(v6, 0LL);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC12wifip2pdCore19EmptyBonjourOffload_transaction));
}

@end