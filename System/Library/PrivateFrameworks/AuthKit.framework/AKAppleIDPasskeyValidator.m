@interface AKAppleIDPasskeyValidator
- (AKAppleIDPasskeyValidator)init;
- (AKAppleIDPasskeyValidator)initWithAccount:(id)a3 accountManager:(id)a4 featureManager:(id)a5 configuration:(id)a6 device:(id)a7 cdpFactory:(id)a8 authenticationController:(id)a9;
- (BOOL)canVerifyPasskey;
- (void)canCreatePasskeyWithForced:(BOOL)a3 completionHandler:(id)a4;
- (void)canDeleteAllPasskeysWithCompletionHandler:(id)a3;
- (void)canUnenrollPasskeyWithForced:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation AKAppleIDPasskeyValidator

- (AKAppleIDPasskeyValidator)initWithAccount:(id)a3 accountManager:(id)a4 featureManager:(id)a5 configuration:(id)a6 device:(id)a7 cdpFactory:(id)a8 authenticationController:(id)a9
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_account) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_accountManager) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_featureManager) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_configuration) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_device) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_cdpFactory) = (Class)a8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_authenticationController) = (Class)a9;
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for AppleIDPasskeyValidator();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  swift_unknownObjectRetain(a9);
  return -[AKAppleIDPasskeyValidator init](&v22, "init");
}

- (void)canCreatePasskeyWithForced:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1001CB298, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CB2C0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020D4A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CB2E8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020D4A8;
  v14[5] = v13;
  id v15 = self;
  uint64_t v16 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020D4B0, (uint64_t)v14);
  swift_release(v16);
}

- (void)canUnenrollPasskeyWithForced:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1001CB220, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CB248, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020D480;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CB270, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020D488;
  v14[5] = v13;
  id v15 = self;
  uint64_t v16 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020D490, (uint64_t)v14);
  swift_release(v16);
}

- (BOOL)canVerifyPasskey
{
  v2 = self;
  char v3 = sub_1000B9EDC();

  return v3 & 1;
}

- (void)canDeleteAllPasskeysWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CB1A8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CB1D0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020D460;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1001CB1F8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020D190;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020D470, (uint64_t)v12);
  swift_release(v14);
}

- (AKAppleIDPasskeyValidator)init
{
  result = (AKAppleIDPasskeyValidator *)_swift_stdlib_reportUnimplementedInitializer( "akd.AppleIDPasskeyValidator",  27LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKAppleIDPasskeyValidator_authenticationController));
}

@end