@interface FeedbackLoggerConnection
- (_TtC11FlusherUtil24FeedbackLoggerConnection)init;
- (void)dealloc;
- (void)requestSandboxExtensionForBundleID:(NSString *)a3 completion:(id)a4;
- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4;
@end

@implementation FeedbackLoggerConnection

- (void)dealloc
{
  v2 = self;
  sub_100099BB0();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11FlusherUtil24FeedbackLoggerConnection_fbfAssembly));
}

- (void)scheduleImmediateUploadWithHeaders:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3) {
    a3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  }
  uint64_t v7 = swift_allocObject(&unk_10016F838, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_100099C60((uint64_t)a3, (uint64_t)sub_10009AC8C, v7);

  swift_release(v7);
  swift_bridgeObjectRelease();
}

- (void)requestSandboxExtensionForBundleID:(NSString *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject(&unk_10016F798, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_10009A648((uint64_t)&unk_100187668, (uint64_t)v7);
}

- (_TtC11FlusherUtil24FeedbackLoggerConnection)init
{
}

@end