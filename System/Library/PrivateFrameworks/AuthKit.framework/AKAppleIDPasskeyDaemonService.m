@interface AKAppleIDPasskeyDaemonService
- (AKAppleIDPasskeyDaemonService)init;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (void)appleIDPasskeyStatusWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
- (void)configureExportedInterface:(id)a3;
- (void)setupAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
- (void)unenrollAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
- (void)verifyAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4;
@end

@implementation AKAppleIDPasskeyDaemonService

- (NSString)serviceName
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AKAppleIDPasskeyDaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s3akd27AppleIDPasskeyDaemonServiceC26configureExportedInterfaceyySo14NSXPCInterfaceCF_0(v4);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppleIDPasskeyDaemonService();
  id v4 = a3;
  v5 = (char *)v11.receiver;
  BOOL v6 = -[AKAppleIDPasskeyDaemonService shouldAcceptNewConnection:](&v11, "shouldAcceptNewConnection:", v4);
  if (v6)
  {
    id v7 = objc_allocWithZone((Class)&OBJC_CLASS___AKClient);
    id v8 = objc_msgSend(v7, "initWithConnection:", v4, v11.receiver, v11.super_class);
    v9 = *(char **)&v5[OBJC_IVAR___AKAppleIDPasskeyDaemonService_client];
    *(void *)&v5[OBJC_IVAR___AKAppleIDPasskeyDaemonService_client] = v8;

    v5 = v9;
  }

  else
  {
  }

  return v6;
}

- (AKAppleIDPasskeyDaemonService)init
{
  *(void *)&self->AAFService_opaque[OBJC_IVAR___AKAppleIDPasskeyDaemonService_client] = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppleIDPasskeyDaemonService();
  return -[AKAppleIDPasskeyDaemonService init](&v3, "init");
}

- (void).cxx_destruct
{
}

- (void)setupAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CBC98, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CBCC0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E180;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CBCE8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E188;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E190, (uint64_t)v14);
  swift_release(v17);
}

- (void)verifyAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CBC20, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CBC48, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E160;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CBC70, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E168;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E170, (uint64_t)v14);
  swift_release(v17);
}

- (void)unenrollAppleIDPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CBBA8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CBBD0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E140;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CBBF8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020E148;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020E150, (uint64_t)v14);
  swift_release(v17);
}

- (void)appleIDPasskeyStatusWithContext:(AKAppleIDPasskeySetupContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CBB30, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CBB58, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020E130;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CBB80, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020D190;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020D470, (uint64_t)v14);
  swift_release(v17);
}

@end