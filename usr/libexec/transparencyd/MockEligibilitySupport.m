@interface MockEligibilitySupport
- (NSURL)databaseDir;
- (_TtC13transparencyd22MockEligibilitySupport)init;
- (id)eligibilityContainerPathAndReturnError:(id *)a3;
- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3;
- (void)setDatabaseDir:(id)a3;
@end

@implementation MockEligibilitySupport

- (NSURL)databaseDir
{
  uint64_t v3 = sub_100072CC4(&qword_1002DF250);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir;
  swift_beginAccess(v6, v14, 0LL, 0LL);
  sub_1000782E0((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  v10 = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1LL, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v10;
}

- (void)setDatabaseDir:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF250);
  __chkstk_darwin(v5);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 0LL, 1LL, v8);
  }

  else
  {
    uint64_t v9 = type metadata accessor for URL(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v7, 1LL, 1LL, v9);
  }

  v10 = (char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir, v13, 33LL, 0LL);
  v11 = self;
  sub_1000C10E8((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);
}

- (_TtC13transparencyd22MockEligibilitySupport)init
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_databaseDir;
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v3, 1LL, 1LL, v4);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13transparencyd22MockEligibilitySupport_iCloudAnalyticsFlag) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MockEligibilitySupport(0LL);
  return -[MockEligibilitySupport init](&v6, "init");
}

- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_10027F7F8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_10027F820, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1670;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_10027F848, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1678;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1680, (uint64_t)v12);
  swift_release(v14);
}

- (id)eligibilityContainerPathAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = self;
  int64_t v9 = sub_1000C0FFC(8LL);
  unint64_t v11 = v10;
  Swift::String v12 = Data.base64EncodedString(options:)(0LL);
  sub_100072BE0(v9, v11);
  (*(void (**)(uint64_t, void *))((swift_isaMask & (uint64_t)v8->super.isa) + 0x98))( v12._countAndFlagsBits,  v12._object);

  swift_bridgeObjectRelease(v12._object);
  URL._bridgeToObjectiveC()(v13);
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

- (void).cxx_destruct
{
}

@end