@interface SyncedSettingsRequestHandler
- (_TtC7imagent28SyncedSettingsRequestHandler)init;
- (void)fetchSettingValueForKey:(int64_t)a3 reply:(id)a4;
- (void)setSettingValue:(id)a3 forKey:(int64_t)a4;
@end

@implementation SyncedSettingsRequestHandler

- (void)fetchSettingValueForKey:(int64_t)a3 reply:(id)a4
{
  v5 = (void (**)(void *, uint64_t))_Block_copy(a4);
  memset(v16, 0, sizeof(v16));
  sub_1000329D4((uint64_t)v16, (uint64_t)v14);
  uint64_t v6 = v15;
  if (v15)
  {
    v7 = sub_10002DED4(v14, v15);
    uint64_t v8 = *(void *)(v6 - 8);
    __chkstk_darwin(v7);
    v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = self;
    uint64_t v12 = _bridgeAnythingToObjectiveC<A>(_:)(v10, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    sub_10002DEF8(v14);
  }

  else
  {
    v13 = self;
    uint64_t v12 = 0LL;
  }

  v5[2](v5, v12);
  swift_unknownObjectRelease(v12);
  sub_100032974((uint64_t)v16);
  _Block_release(v5);
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  uint64_t v6 = self;
  _bridgeAnyObjectToAny(_:)(v7, a3);

  swift_unknownObjectRelease(a3);
  sub_10002DEF8(v7);
}

- (_TtC7imagent28SyncedSettingsRequestHandler)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent28SyncedSettingsRequestHandler_requiredCapabilities) = (Class)0x20000000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedSettingsRequestHandler();
  return -[SyncedSettingsRequestHandler init](&v3, "init");
}

@end