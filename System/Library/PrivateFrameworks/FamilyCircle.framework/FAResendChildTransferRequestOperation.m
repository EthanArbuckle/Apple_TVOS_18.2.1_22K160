@interface FAResendChildTransferRequestOperation
- (FAResendChildTransferRequestOperation)init;
- (FAResendChildTransferRequestOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 email:(id)a6 isResend:(BOOL)a7;
- (void)cancelChildTransferWithCompletionHandler:(id)a3;
- (void)resendChildTransferWithCompletionHandler:(id)a3;
@end

@implementation FAResendChildTransferRequestOperation

- (FAResendChildTransferRequestOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 email:(id)a6 isResend:(BOOL)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___FAResendChildTransferRequestOperation_email);
  uint64_t *v13 = v12;
  v13[1] = v14;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_aaGrandSlamSigner) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_networkService) = (Class)a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_isResend) = a7;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for FAResendChildTransferRequestOperation();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  return -[FAResendChildTransferRequestOperation init](&v19, "init");
}

- (void)resendChildTransferWithCompletionHandler:(id)a3
{
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject(&unk_100042650, 32LL, 7LL);
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 1LL, 1LL, v9);
  v10 = (void *)swift_allocObject(&unk_100042678, 48LL, 7LL);
  v10[2] = 0LL;
  v10[3] = 0LL;
  v10[4] = &unk_100051F98;
  v10[5] = v8;
  v11 = (void *)swift_allocObject(&unk_1000426A0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100051FA0;
  v11[5] = v10;
  uint64_t v12 = self;
  uint64_t v13 = sub_10002950C((uint64_t)v6, (uint64_t)&unk_100051FA8, (uint64_t)v11);
  swift_release(v13);
}

- (void)cancelChildTransferWithCompletionHandler:(id)a3
{
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject(&unk_1000425D8, 32LL, 7LL);
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 1LL, 1LL, v9);
  v10 = (void *)swift_allocObject(&unk_100042600, 48LL, 7LL);
  v10[2] = 0LL;
  v10[3] = 0LL;
  v10[4] = &unk_100051F78;
  v10[5] = v8;
  v11 = (void *)swift_allocObject(&unk_100042628, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100051F80;
  v11[5] = v10;
  uint64_t v12 = self;
  uint64_t v13 = sub_10002950C((uint64_t)v6, (uint64_t)&unk_100051F88, (uint64_t)v11);
  swift_release(v13);
}

- (FAResendChildTransferRequestOperation)init
{
  result = (FAResendChildTransferRequestOperation *)_swift_stdlib_reportUnimplementedInitializer( "familycircled.FAResendChildTransferRequestOperation",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end