@interface ConversationLinkSyncIDSInteractor
- (_TtC13callservicesd33ConversationLinkSyncIDSInteractor)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation ConversationLinkSyncIDSInteractor

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a3;
  v8 = self;
  sub_1001DF4C0(a3, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a3;
  v8 = self;
  sub_1001DF7E8((uint64_t)v8, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  if (!a5)
  {
    id v25 = a3;
    id v26 = a4;
    id v27 = a6;
    id v28 = a7;
    v20 = self;
    v19 = (void *)0xF000000000000000LL;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = 0LL;
    uint64_t v24 = 0LL;
    goto LABEL_6;
  }

  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = self;
  id v17 = v9;
  id v9 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v19 = v18;

  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  v22 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v24 = v23;

LABEL_6:
  sub_1001DF8B8((uint64_t)v20, v21, (uint64_t)v9, v19, v22, v24);
  swift_bridgeObjectRelease(v24);
  sub_1001BB464((uint64_t)v9, (unint64_t)v19);
}

- (_TtC13callservicesd33ConversationLinkSyncIDSInteractor)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13callservicesd33ConversationLinkSyncIDSInteractor_service));
  sub_1001C954C((uint64_t)self + OBJC_IVAR____TtC13callservicesd33ConversationLinkSyncIDSInteractor_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd33ConversationLinkSyncIDSInteractor_knownDestinations));
}

@end