@interface SimulatedIDSGroupSessionProvider
- (BOOL)isAVLess;
- (CSDIDSGroupSessionProviderDelegate)delegate;
- (NSArray)participantDestinationIDs;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)UUID;
- (NSString)clientUUIDString;
- (NSString)destination;
- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)init;
- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)initWithGroupUUID:(id)a3 participantDestinationIDs:(id)a4 localMember:(id)a5 queue:(id)a6 simulatedConversationManager:(id)a7;
- (uint64_t)setLocalParticipantType:(uint64_t)a3 memberDestinations:(uint64_t)a4;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)joinWithOptions:(id)a3;
- (void)kickParticipants:(id)a3;
- (void)leaveWithOptions:(id)a3;
- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5;
- (void)registerPluginWithOptions:(id)a3;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4;
- (void)sendParticipantData:(id)a3 withContext:(id)a4;
- (void)setClientUUIDString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredLackOfCapabilities:(id)a3;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5;
- (void)updateParticipantInfo:(id)a3;
@end

@implementation SimulatedIDSGroupSessionProvider

- (NSString)clientUUIDString
{
  return (NSString *)sub_1002627D8((uint64_t)self, (uint64_t)a2, sub_10026191C);
}

- (void)setClientUUIDString:(id)a3
{
}

- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)initWithGroupUUID:(id)a3 participantDestinationIDs:(id)a4 localMember:(id)a5 queue:(id)a6 simulatedConversationManager:(id)a7
{
  uint64_t v12 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v12);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  return (_TtC13callservicesd32SimulatedIDSGroupSessionProvider *)sub_10026195C();
}

- (BOOL)isAVLess
{
  return 0;
}

- (NSArray)participantDestinationIDs
{
  v2 = self;
  uint64_t v3 = sub_1002626B4();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSString)destination
{
  return (NSString *)sub_1002627D8((uint64_t)self, (uint64_t)a2, sub_100262808);
}

- (void)setDestination:(id)a3
{
}

- (NSString)UUID
{
  v2 = self;
  sub_100262904((uint64_t)v2);
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CSDIDSGroupSessionProviderDelegate)delegate
{
  return (CSDIDSGroupSessionProviderDelegate *)(id)sub_100262948();
}

- (void)setDelegate:(id)a3
{
  NSString v5 = self;
  sub_1002629A4((uint64_t)a3);
}

- (void)setPreferences:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  swift_bridgeObjectRelease(v3);
}

- (void)joinWithOptions:(id)a3
{
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5
{
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v8 = self;
  if (a4)
  {
    id v9 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v11 = v10;
  }

  else
  {
    unint64_t v11 = 0xF000000000000000LL;
  }

  sub_100262F5C();
  sub_1001BB464((uint64_t)a4, v11);

  swift_bridgeObjectRelease(v7);
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7
{
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  if (a4)
  {
    id v15 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v17 = v16;
  }

  else
  {
    unint64_t v17 = 0xF000000000000000LL;
  }

  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);

  uint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for String);
  sub_100263008();
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v19);
  sub_1001BB464((uint64_t)a4, v17);

  swift_bridgeObjectRelease(v11);
}

- (void)sendParticipantData:(id)a3 withContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v15 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  unint64_t v14 = v13;

  sub_1001BB39C(v12, v14);
  sub_1001BB39C(v9, v11);
}

- (void)updateParticipantInfo:(id)a3
{
  id v5 = a3;
  uint64_t v9 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  sub_1001BB39C(v6, v8);
}

- (void)leaveWithOptions:(id)a3
{
}

- (void)kickParticipants:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  swift_bridgeObjectRelease(v3);
}

- (void)registerPluginWithOptions:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  swift_bridgeObjectRelease(v3);
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  _Block_copy(v6);
  unint64_t v10 = self;
  sub_10026376C(v7, v9, (uint64_t)v10, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4
{
  id v5 = a3;
  if (a3)
  {
    sub_1001D8EA0(0LL, (unint64_t *)&qword_100448780, &OBJC_CLASS___NSNumber_ptr);
    id v5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  }

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v8);
}

- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v10 = v9;

  sub_1001BB39C(v8, v10);
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v11 = v10;

  sub_1001BB39C(v9, v11);
  return a3;
}

- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a4;
  unint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100263A1C(a3, v10, v12, (uint64_t)v13, (void (**)(void, void))v8);
  _Block_release(v8);
  sub_1001BB39C(v10, v12);
}

- (NSSet)requiredCapabilities
{
  return (NSSet *)sub_100263B34((uint64_t)self, (uint64_t)a2, sub_100263AFC);
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (NSSet)requiredLackOfCapabilities
{
  return (NSSet *)sub_100263B34((uint64_t)self, (uint64_t)a2, sub_100263B80);
}

- (void)setRequiredLackOfCapabilities:(id)a3
{
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v4 = a4;
  if (!a3)
  {
    uint64_t v5 = 0LL;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &protocol witness table for String);
  if (v4) {
LABEL_3:
  }
    id v4 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)( v4,  &type metadata for String,  &protocol witness table for String);
LABEL_4:
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
}

- (uint64_t)setLocalParticipantType:(uint64_t)a3 memberDestinations:(uint64_t)a4
{
  uint64_t v5 = sub_1001AFF14(&qword_1004491D0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v5);
  return sub_1001BA48C(v6);
}

- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_groupUUID;
  uint64_t v4 = sub_1001B1234();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_simulatedConversationManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_groupSessionSubscription));
  swift_bridgeObjectRelease(*(void *)&self->clientUUIDString[OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_destination]);
  sub_1001C954C((uint64_t)self + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_requiredCapabilities));
  sub_1001BA48C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_requiredLackOfCapabilities));
}

@end