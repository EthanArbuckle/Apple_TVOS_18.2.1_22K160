@interface EligibilitySupport
- (_TtC13transparencyd18EligibilitySupport)init;
- (id)eligibilityContainerPathAndReturnError:(id *)a3;
- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3;
@end

@implementation EligibilitySupport

- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_100280098, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1002800C0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1B38;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1002800E8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1B48;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1B58, (uint64_t)v12);
  swift_release(v14);
}

- (id)eligibilityContainerPathAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = self;
  sub_1000CBA44(v7);

  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (_TtC13transparencyd18EligibilitySupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EligibilitySupport();
  return -[EligibilitySupport init](&v3, "init");
}

@end