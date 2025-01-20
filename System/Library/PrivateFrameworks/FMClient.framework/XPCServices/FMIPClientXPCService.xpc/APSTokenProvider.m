@interface APSTokenProvider
- (_TtC20FMIPClientXPCService16APSTokenProvider)init;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
@end

@implementation APSTokenProvider

- (void)dealloc
{
  v2 = self;
  sub_100031E20();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC20FMIPClientXPCService16APSTokenProvider_pendingTopicTokenFutures));
  swift_bridgeObjectRelease(*(void *)&self->topic[OBJC_IVAR____TtC20FMIPClientXPCService16APSTokenProvider_topicAPSToken]);
  swift_bridgeObjectRelease(*(void *)&self->topic[OBJC_IVAR____TtC20FMIPClientXPCService16APSTokenProvider_publicAPSToken]);

  sub_1000396C8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC20FMIPClientXPCService16APSTokenProvider____lazy_storage___apsConnection));
}

- (_TtC20FMIPClientXPCService16APSTokenProvider)init
{
  result = (_TtC20FMIPClientXPCService16APSTokenProvider *)_swift_stdlib_reportUnimplementedInitializer( "FMIPClientXPCService.APSTokenProvider",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v11 = v10;
  }

  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0LL;
    unint64_t v11 = 0xF000000000000000LL;
  }

  sub_100038F88(v9, v11);
  sub_10000AAC8(v9, v11);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  if (a4)
  {
    id v10 = a3;
    id v11 = a5;
    id v12 = a6;
    v13 = self;
    id v14 = v8;
    id v8 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
    unint64_t v16 = v15;

    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = 0LL;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v20 = 0LL;
    goto LABEL_8;
  }

  id v21 = a3;
  id v22 = a5;
  id v23 = a6;
  v24 = self;
  unint64_t v16 = 0xF000000000000000LL;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v18 = v17;

  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v20 = v19;

LABEL_8:
  sub_100039240((uint64_t)v8, v16);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v20);
  sub_10000AAC8((uint64_t)v8, v16);
}

@end