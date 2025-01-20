@interface AppleIDPasskeyVerificationProvider
- (_TtC3akd34AppleIDPasskeyVerificationProvider)initWithServiceController:(id)a3 accountManager:(id)a4;
- (void)performVerificationRequestWith:(AKAppleIDPasskeySetupContext *)a3 completionHandler:(id)a4;
@end

@implementation AppleIDPasskeyVerificationProvider

- (_TtC3akd34AppleIDPasskeyVerificationProvider)initWithServiceController:(id)a3 accountManager:(id)a4
{
  *(void *)self->serviceController = a3;
  *(void *)self->accountManager = a4;
  id v6 = a3;
  id v7 = a4;
  return self;
}

- (void)performVerificationRequestWith:(AKAppleIDPasskeySetupContext *)a3 completionHandler:(id)a4
{
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_1001CAD68, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_1001CAD90, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020D188;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_1001CADB8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020D190;
  v13[5] = v12;
  v14 = a3;
  swift_retain(self);
  uint64_t v15 = sub_100100A60((uint64_t)v8, (uint64_t)&unk_10020D470, (uint64_t)v13);
  swift_release(v15);
}

@end