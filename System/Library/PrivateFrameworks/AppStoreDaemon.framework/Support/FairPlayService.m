@interface FairPlayService
+ (NSString)entitlement;
+ (_TtC9appstored15FairPlayService)defaultService;
- (_TtC9appstored15FairPlayService)init;
- (void)generateKeybagRequestForDSID:(unint64_t)a3 completionHandler:(id)a4;
- (void)generateSubscriptionRequestForDSID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importKeybag:(NSData *)a3 completionHandler:(id)a4;
- (void)importSubscriptionKeybag:(NSData *)a3 completionHandler:(id)a4;
@end

@implementation FairPlayService

+ (_TtC9appstored15FairPlayService)defaultService
{
  if (qword_100458000 != -1) {
    swift_once(&qword_100458000, sub_100005C0C);
  }
  return (_TtC9appstored15FairPlayService *)(id)qword_100462880;
}

+ (NSString)entitlement
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (void)generateKeybagRequestForDSID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003DC040, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003DC068, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100458500;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003DC090, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100458508;
  v14[5] = v13;
  v15 = self;
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100458510, (uint64_t)v14);
  swift_release(v16);
}

- (void)generateSubscriptionRequestForDSID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003DBFC8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003DBFF0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1004584E0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003DC018, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004584E8;
  v14[5] = v13;
  v15 = self;
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_1004584F0, (uint64_t)v14);
  swift_release(v16);
}

- (void)importKeybag:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003DBF50, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003DBF78, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1004584C0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003DBFA0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004584C8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  uint64_t v17 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_1004584D0, (uint64_t)v14);
  swift_release(v17);
}

- (void)importSubscriptionKeybag:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003DBED8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1003DBF00, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100458498;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1003DBF28, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004584A0;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  uint64_t v17 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100459580, (uint64_t)v14);
  swift_release(v17);
}

- (_TtC9appstored15FairPlayService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FairPlayService();
  return -[FairPlayService init](&v3, "init");
}

@end