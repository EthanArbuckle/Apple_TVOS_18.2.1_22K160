@interface AKSignInWithAppleDaemonService
- (AKSignInWithAppleDaemonService)init;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (void)cancelAppIconRequestForClientID:(NSString *)a3 completion:(id)a4;
- (void)configureExportedInterface:(id)a3;
- (void)deleteAllItemsFromDepartedGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)fetchAccountsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completion:(id)a5;
- (void)fetchEULAForClientID:(NSString *)a3 completion:(id)a4;
- (void)fetchSharedGroupsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3;
- (void)leaveGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)participantRemovedWithContext:(AKSignInWithAppleRequestContext *)a3 participantID:(NSString *)a4 completion:(id)a5;
- (void)performHealthCheckWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)performTokenRotationWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)revokeAcccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
- (void)shareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 withGroup:(AKSignInWithAppleAccountShareInfo *)a4 completion:(id)a5;
- (void)unshareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4;
@end

@implementation AKSignInWithAppleDaemonService

- (NSString)serviceName
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AKSignInWithAppleDaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s3akd28SignInWithAppleDaemonServiceC26configureExportedInterfaceyySo14NSXPCInterfaceCF_0(v4);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SignInWithAppleDaemonService();
  id v4 = a3;
  v5 = (char *)v11.receiver;
  BOOL v6 = -[AKSignInWithAppleDaemonService shouldAcceptNewConnection:](&v11, "shouldAcceptNewConnection:", v4);
  if (v6)
  {
    id v7 = objc_allocWithZone((Class)&OBJC_CLASS___AKClient);
    id v8 = objc_msgSend(v7, "initWithConnection:", v4, v11.receiver, v11.super_class);
    v9 = *(char **)&v5[OBJC_IVAR___AKSignInWithAppleDaemonService_client];
    *(void *)&v5[OBJC_IVAR___AKSignInWithAppleDaemonService_client] = v8;

    v5 = v9;
  }

  else
  {
  }

  return v6;
}

- (AKSignInWithAppleDaemonService)init
{
  *(void *)&self->AAFService_opaque[OBJC_IVAR___AKSignInWithAppleDaemonService_client] = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SignInWithAppleDaemonService();
  return -[AKSignInWithAppleDaemonService init](&v3, "init");
}

- (void).cxx_destruct
{
}

- (void)fetchAccountsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CD250, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CD278, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020F0F0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CD2A0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020F0F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F100, (uint64_t)v14);
  swift_release(v17);
}

- (void)fetchEULAForClientID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CD1D8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CD200, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020F0D0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CD228, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020F0D8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F0E0, (uint64_t)v14);
  swift_release(v17);
}

- (void)revokeAcccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  objc_super v11 = (void *)swift_allocObject(&unk_1001CD160, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CD188, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020F0B0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CD1B0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020F0B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F0C0, (uint64_t)v14);
  swift_release(v17);
}

- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject(&unk_1001CD0E8, 56LL, 7LL);
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v12, 1LL, 1LL, v15);
  v16 = (void *)swift_allocObject(&unk_1001CD110, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10020F090;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject(&unk_1001CD138, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_10020F098;
  v17[5] = v16;
  uint64_t v18 = a3;
  v19 = self;
  uint64_t v20 = sub_100100A60((uint64_t)v12, (uint64_t)&unk_10020F0A0, (uint64_t)v17);
  swift_release(v20);
}

- (void)cancelAppIconRequestForClientID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CD070, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CD098, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020F070;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CD0C0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020F078;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F080, (uint64_t)v14);
  swift_release(v17);
}

- (void)shareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 withGroup:(AKSignInWithAppleAccountShareInfo *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject(&unk_1001CCFF8, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_1001CD020, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10020F050;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1001CD048, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10020F058;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  uint64_t v20 = sub_100100A60((uint64_t)v11, (uint64_t)&unk_10020F060, (uint64_t)v16);
  swift_release(v20);
}

- (void)unshareAccountWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCF80, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CCFA8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020F030;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCFD0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020F038;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F040, (uint64_t)v14);
  swift_release(v17);
}

- (void)leaveGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCF08, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CCF30, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020F010;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCF58, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020F018;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F020, (uint64_t)v14);
  swift_release(v17);
}

- (void)deleteAllItemsFromDepartedGroupWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCE90, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CCEB8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020EFF0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCEE0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020EFF8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020F000, (uint64_t)v14);
  swift_release(v17);
}

- (void)participantRemovedWithContext:(AKSignInWithAppleRequestContext *)a3 participantID:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject(&unk_1001CCE18, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_1001CCE40, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10020EFD0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1001CCE68, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10020EFD8;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  uint64_t v20 = sub_100100A60((uint64_t)v11, (uint64_t)&unk_10020EFE0, (uint64_t)v16);
  swift_release(v20);
}

- (void)fetchSharedGroupsWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCDA0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CCDC8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020EFB0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCDF0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020EFB8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020EFC0, (uint64_t)v14);
  swift_release(v17);
}

- (void)performTokenRotationWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCD28, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CCD50, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020EF90;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCD78, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020EF98;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020EFA0, (uint64_t)v14);
  swift_release(v17);
}

- (void)performHealthCheckWithContext:(AKSignInWithAppleRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCCB0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CCCD8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020EF70;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1001CCD00, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020ED60;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020EF80, (uint64_t)v14);
  swift_release(v17);
}

- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CCC10, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CCC38, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020EF30;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1001CCC60, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020D190;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020D470, (uint64_t)v12);
  swift_release(v14);
}

@end