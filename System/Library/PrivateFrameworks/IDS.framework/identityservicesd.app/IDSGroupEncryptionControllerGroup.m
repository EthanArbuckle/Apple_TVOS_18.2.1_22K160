@interface IDSGroupEncryptionControllerGroup
- (BOOL)shortMKIEnabled;
- (IDSEndpointSubscription)endpointSubscription;
- (IDSGroupEncryptionKeyMaterial)mediaKeyMaterial;
- (IDSGroupEncryptionKeyMaterial)stableKeyMaterial;
- (NSSet)allMembers;
- (NSSet)lightweightParticipantPushTokens;
- (NSSet)lightweightParticipants;
- (NSSet)memberURIs;
- (NSSet)participantPushTokens;
- (NSSet)participants;
- (NSSet)standardParticipantPushTokens;
- (NSSet)standardParticipants;
- (NSString)id;
- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)config;
- (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup)init;
- (id)ensureParticipant:(id)a3;
- (id)ensureSessionForID:(id)a3;
- (id)memberForParticipant:(id)a3;
- (id)memberForURI:(id)a3;
- (id)participantForID:(unint64_t)a3;
- (id)participantForToken:(id)a3;
- (id)participantIDsForURIs:(id)a3;
- (id)participantsForMember:(id)a3;
- (id)participantsForURI:(id)a3;
- (id)receiveMKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7;
- (id)receiveSKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7;
- (unint64_t)encryptionSequenceNumber;
- (unint64_t)localParticipantID;
- (unint64_t)preKeyAckCount;
- (void)cancelKMCacheReset;
- (void)cleanUpSessionForID:(id)a3;
- (void)dealloc;
- (void)ensureStableKeyMaterialsSentToClient;
- (void)hardRoll;
- (void)removeAllMembers;
- (void)removeAllParticipants;
- (void)removeParticipant:(id)a3;
- (void)removeParticipantForToken:(id)a3;
- (void)resetKMCaches;
- (void)resetKMCachesAfter:(double)a3;
- (void)resetKeysSentToClient;
- (void)resetKeysToPropagate;
- (void)setEncryptionSequenceNumber:(unint64_t)a3;
- (void)setEndpointSubscription:(id)a3;
- (void)setLocalParticipantID:(unint64_t)a3;
- (void)setPreKeyAckCount:(unint64_t)a3;
- (void)setShortMKIEnabled:(BOOL)a3;
- (void)updateDesiredMaterials;
- (void)updateMembersWithURIs:(id)a3;
- (void)updateMembersWithURIs:(id)a3 lightweightStatusDict:(id)a4;
- (void)updateParticipants:(id)a3 lightweight:(BOOL)a4;
@end

@implementation IDSGroupEncryptionControllerGroup

- (NSString)id
{
  uint64_t v2 = *(void *)&self->id[OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_id];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)config
{
  return (_TtC17identityservicesd31IDSGroupEncryptionConfiguration *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_config);
}

- (unint64_t)preKeyAckCount
{
  uint64_t v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_preKeyAckCount);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_preKeyAckCount,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setPreKeyAckCount:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_preKeyAckCount);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_preKeyAckCount,  v5,  1LL,  0LL);
  unint64_t *v4 = a3;
}

- (unint64_t)localParticipantID
{
  uint64_t v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_localParticipantID);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_localParticipantID,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setLocalParticipantID:(unint64_t)a3
{
  v5 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_localParticipantID);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_localParticipantID,  v7,  1LL,  0LL);
  unint64_t *v5 = a3;
  v6 = self;
  sub_10049ECE4();
}

- (IDSEndpointSubscription)endpointSubscription
{
  uint64_t v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription,  v4,  0LL,  0LL);
  return (IDSEndpointSubscription *)*v2;
}

- (void)setEndpointSubscription:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription,  v7,  1LL,  0LL);
  v5 = *v4;
  unint64_t *v4 = a3;
  id v6 = a3;
}

- (unint64_t)encryptionSequenceNumber
{
  uint64_t v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_encryptionSequenceNumber);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_encryptionSequenceNumber,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setEncryptionSequenceNumber:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_encryptionSequenceNumber);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_encryptionSequenceNumber,  v5,  1LL,  0LL);
  unint64_t *v4 = a3;
}

- (NSSet)memberURIs
{
  uint64_t v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  NSString v3 = self;
  v4 = (os_unfair_lock_s *)v2();
  os_unfair_lock_lock(v4 + 4);
  sub_1004B266C(&v8);
  os_unfair_lock_unlock(v4 + 4);
  uint64_t v5 = v8;

  swift_release(v4);
  sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  sub_100438928((unint64_t *)&unk_1009BAC00, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSSet *)isa;
}

- (NSSet)allMembers
{
  uint64_t v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  NSString v3 = self;
  v4 = (os_unfair_lock_s *)v2();
  os_unfair_lock_lock(v4 + 4);
  sub_1004B266C(&v8);
  os_unfair_lock_unlock(v4 + 4);
  uint64_t v5 = v8;

  swift_release(v4);
  type metadata accessor for IDSGroupEncryptionControllerMember();
  sub_10040A2B0( (unint64_t *)&qword_1009B8E30,  (uint64_t (*)(uint64_t))type metadata accessor for IDSGroupEncryptionControllerMember,  (uint64_t)&protocol conformance descriptor for NSObject);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSSet *)isa;
}

- (NSSet)participants
{
  return (NSSet *)sub_10049FD54(self, (uint64_t)a2, (uint64_t (*)(void))sub_10049FA48);
}

- (NSSet)standardParticipants
{
  return (NSSet *)sub_10049FD54(self, (uint64_t)a2, sub_10049FAD8);
}

- (NSSet)lightweightParticipants
{
  return (NSSet *)sub_10049FD54(self, (uint64_t)a2, sub_10049FDCC);
}

- (NSSet)participantPushTokens
{
  return (NSSet *)sub_1004A02DC(self, (uint64_t)a2, sub_1004A0048);
}

- (NSSet)standardParticipantPushTokens
{
  return (NSSet *)sub_1004A02DC(self, (uint64_t)a2, sub_1004A036C);
}

- (NSSet)lightweightParticipantPushTokens
{
  return (NSSet *)sub_1004A02DC(self, (uint64_t)a2, sub_1004A0600);
}

- (IDSGroupEncryptionKeyMaterial)mediaKeyMaterial
{
  uint64_t v2 = self;
  id v3 = sub_1004A08B8();

  return (IDSGroupEncryptionKeyMaterial *)v3;
}

- (IDSGroupEncryptionKeyMaterial)stableKeyMaterial
{
  uint64_t v2 = self;
  id v3 = sub_1004A08F4();

  return (IDSGroupEncryptionKeyMaterial *)v3;
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_stateLogger, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_q));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_lock));
  sub_10041C0A0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_config));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_identityController));
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_pushHandler),  v6);
  swift_unknownObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_sessionProvider),  v7);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_cryptoHandler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_sessionsByID));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_participantsLock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_participantsByID));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_participantsByPushToken));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_formerlyActiveParticipantsByID));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_membersByURI));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_endpointSubscription));
  sub_10040A274( (uint64_t)self + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_needsKMCacheResetAfter,  &qword_1009BC130);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup_logStateLock));
}

- (void)removeAllMembers
{
  uint64_t v2 = self;
  sub_1004A0EDC();
}

- (void)updateMembersWithURIs:(id)a3
{
  uint64_t v5 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v6 = sub_100438928((unint64_t *)&unk_1009BAC00, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  uint64_t v8 = *(void (**)(uint64_t, void))((swift_isaMask & (uint64_t)self->super.isa) + 0x2B0);
  v9 = self;
  v8(v7, 0LL);

  swift_bridgeObjectRelease(v7);
}

- (void)updateMembersWithURIs:(id)a3 lightweightStatusDict:(id)a4
{
  uint64_t v7 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v8 = sub_100438928((unint64_t *)&unk_1009BAC00, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  if (a4) {
    uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  &type metadata for Bool,  &protocol witness table for String);
  }
  else {
    uint64_t v10 = 0LL;
  }
  v11 = self;
  sub_1004A10C0(v9, v10);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
}

- (id)memberForURI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1004A262C(v4);

  return v6;
}

- (id)memberForParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_1004A28D0((uint64_t)v4);

  return v6;
}

- (id)participantsForURI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004A2A14(v4);
  uint64_t v7 = v6;

  type metadata accessor for IDSGroupEncryptionControllerParticipant(0LL);
  sub_10040A2B0( (unint64_t *)&unk_1009B97C0,  type metadata accessor for IDSGroupEncryptionControllerParticipant,  (uint64_t)&protocol conformance descriptor for NSObject);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

- (id)participantsForMember:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x258);
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = v4();
  id v8 = v5;
  Swift::Int v9 = sub_1004B20F0(v7, v8);

  type metadata accessor for IDSGroupEncryptionControllerParticipant(0LL);
  sub_10040A2B0( (unint64_t *)&unk_1009B97C0,  type metadata accessor for IDSGroupEncryptionControllerParticipant,  (uint64_t)&protocol conformance descriptor for NSObject);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_release(v9);
  return isa;
}

- (id)participantForToken:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x258);
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = v4();
  id v8 = v5;
  sub_1004B1A1C(v7, (uint64_t)v8);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease(v7);
  return v10;
}

- (id)participantForID:(unint64_t)a3
{
  id v3 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  id v4 = self;
  id v5 = (os_unfair_lock_s *)v3();
  os_unfair_lock_lock(v5 + 4);
  sub_1004B266C(&v8);
  os_unfair_lock_unlock(v5 + 4);
  uint64_t v6 = v8;

  swift_release(v5);
  return v6;
}

- (id)participantIDsForURIs:(id)a3
{
  uint64_t v5 = sub_10041D3C4(0LL, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v6 = sub_100438928((unint64_t *)&unk_1009BAC00, (unint64_t *)&unk_1009BC270, &OBJC_CLASS___IDSURI_ptr);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  id v8 = self;
  sub_1004A2FBC(v7);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease(v7);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (void)updateParticipants:(id)a3 lightweight:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = sub_10041D3C4(0LL, &qword_1009BB7E0, &OBJC_CLASS___IDSGroupSessionActiveParticipant_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v9 = self;
  sub_1004A3668(v8, v4);

  swift_bridgeObjectRelease(v8);
}

- (id)ensureParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1004A529C(v4);

  return v6;
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004A5EC4(v4);
}

- (void)removeParticipantForToken:(id)a3
{
  uint64_t v5 = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)a3;
  uint64_t v8 = self;
  uint64_t v6 = v4(v5);
  if (v6)
  {
    uint64_t v7 = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)v6;
    (*(void (**)(void))((swift_isaMask & (uint64_t)v8->super.isa) + 0x300))();

    uint64_t v5 = v8;
    uint64_t v8 = v7;
  }
}

- (void)removeAllParticipants
{
  uint64_t v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  id v3 = self;
  id v4 = (os_unfair_lock_s *)v2();
  os_unfair_lock_lock(v4 + 4);
  sub_1004B25D0();
  os_unfair_lock_unlock(v4 + 4);

  swift_release(v4);
}

- (id)receiveMKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7
{
  return sub_1004A66D4(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, 0LL);
}

- (id)receiveSKMWithKeyMaterialDictionary:(id)a3 fromPushToken:(id)a4 fromURI:(id)a5 sessionID:(id)a6 isFromSender:(BOOL)a7
{
  return sub_1004A66D4(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t)a6, a7, 1LL);
}

- (void)resetKeysToPropagate
{
  uint64_t v2 = self;
  sub_1004AA3C0();
}

- (void)resetKMCachesAfter:(double)a3
{
  id v3 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  id v4 = self;
  uint64_t v5 = (os_unfair_lock_s *)v3();
  os_unfair_lock_lock(v5 + 4);
  sub_1004B25D0();
  os_unfair_lock_unlock(v5 + 4);
  uint64_t v6 = swift_release(v5);
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v4->super.isa) + 0x378))(v6);
}

- (void)resetKMCaches
{
  uint64_t v2 = self;
  sub_1004AA7C4();
}

- (void)cancelKMCacheReset
{
  uint64_t v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x110);
  id v3 = self;
  id v4 = (os_unfair_lock_s *)v2();
  os_unfair_lock_lock(v4 + 4);
  sub_1004B25D0();
  os_unfair_lock_unlock(v4 + 4);

  swift_release(v4);
}

- (void)updateDesiredMaterials
{
  uint64_t v2 = self;
  sub_1004AB300();
}

- (void)resetKeysSentToClient
{
  uint64_t v2 = self;
  sub_1004AB49C();
}

- (void)hardRoll
{
  uint64_t v2 = self;
  sub_1004AB64C();
}

- (void)ensureStableKeyMaterialsSentToClient
{
  uint64_t v2 = self;
  sub_1004AB7FC();
}

- (id)ensureSessionForID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1004AB9AC(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  return v9;
}

- (void)cleanUpSessionForID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1004ABF8C(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (BOOL)shortMKIEnabled
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC17identityservicesd33IDSGroupEncryptionControllerGroup__shortMKIEnabled);
}

- (void)setShortMKIEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1004AC168(a3);
}

- (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup)init
{
  result = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionControllerGroup",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end