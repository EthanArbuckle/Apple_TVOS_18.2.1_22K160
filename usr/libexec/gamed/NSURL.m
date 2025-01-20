@interface NSURL
- (void)hasTrustedImageDomainWithStoreBag:(GKStoreBag *)a3 completionHandler:(id)a4;
@end

@implementation NSURL

- (void)hasTrustedImageDomainWithStoreBag:(GKStoreBag *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_100276038, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100188AB4((uint64_t)&unk_1002BA140, (uint64_t)v7);
}

@end