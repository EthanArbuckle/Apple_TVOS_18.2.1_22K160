@interface MRDFastSyncGroupSession
+ (id)createSessionWithNearbyGroup:(id)a3 asUser:(id)a4 delegate:(id)a5;
+ (id)joinSessionWithNearbyGroup:(id)a3 asUser:(id)a4 hostSigningKey:(id)a5 delegate:(id)a6;
+ (id)stateToString:(int64_t)a3;
- (BOOL)shouldAutomaticallyApproveWithIdentity:(id)a3;
- (MRDFastSyncGroupSession)init;
- (MRDFastSyncGroupSessionParticipant)leaderParticipant;
- (MRDFastSyncGroupSessionParticipant)localParticipant;
- (NSString)identifier;
- (id)prewarmForIdentity:(id)a3;
- (int64_t)state;
- (void)addPendingParticipant:(id)a3;
- (void)cancelPrewarmedIdentifier:(id)a3 forIdentity:(id)a4;
- (void)dealloc;
- (void)end;
- (void)enterLowPowerModeWithCompletion:(id)a3;
- (void)exitLowPowerModeWithCompletion:(id)a3;
- (void)markParticipantAsGuestIfNeeded:(id)a3;
- (void)prepareForAddedMember;
- (void)remoteApprovePendingParticipant:(id)a3;
- (void)remoteRejectPendingParticipant:(id)a3;
- (void)remoteRemoveAllParticipants;
- (void)remoteRemoveParticipantWithIdentifier:(id)a3;
- (void)removeParticipantWithIdentifier:(id)a3;
- (void)removePendingParticipant:(id)a3;
- (void)sendRemoteControlMessage:(id)a3 to:(id)a4 completion:(id)a5;
- (void)setLeaderParticipant:(id)a3;
- (void)start;
@end

@implementation MRDFastSyncGroupSession

- (int64_t)state
{
  v2 = self;
  int64_t v3 = MRDFastSyncGroupSession.state.getter();

  return v3;
}

- (MRDFastSyncGroupSessionParticipant)localParticipant
{
  v2 = self;
  int64_t v3 = (void *)MRDFastSyncGroupSession.localParticipant.getter();

  return (MRDFastSyncGroupSessionParticipant *)v3;
}

- (MRDFastSyncGroupSessionParticipant)leaderParticipant
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_leaderParticipant);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDFastSyncGroupSession_leaderParticipant, v4, 0LL, 0LL);
  return (MRDFastSyncGroupSessionParticipant *)*v2;
}

- (void)setLeaderParticipant:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_leaderParticipant);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDFastSyncGroupSession_leaderParticipant, v7, 1LL, 0LL);
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)identifier
{
  uint64_t v2 = *(void *)&self->pushMessenger[OBJC_IVAR___MRDFastSyncGroupSession_identifier];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

+ (id)createSessionWithNearbyGroup:(id)a3 asUser:(id)a4 delegate:(id)a5
{
  uint64_t v7 = *(void *)((char *)a3 + OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup_nearbyGroup);
  v8 = *(uint64_t (**)(uint64_t))((swift_isaMask & *(void *)a3) + 0x68LL);
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain(a5);
  uint64_t v11 = swift_retain(v7);
  uint64_t v12 = v8(v11);
  uint64_t v14 = v13;
  uint64_t v15 = type metadata accessor for RemoteControlActivity();
  uint64_t v16 = swift_allocObject(v15, 32LL, 7LL);
  *(void *)(v16 + 16) = v12;
  *(void *)(v16 + 24) = v14;
  uint64_t v22 = v16;
  uint64_t v17 = sub_100156B68(&qword_1003F9950);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = NearbyGroupSessionProvider.init(nearbyGroup:activity:)(v7, &v22);
  id v19 = objc_allocWithZone((Class)type metadata accessor for MRDFastSyncGroupSession());
  v20 = (void *)sub_1001B3980(1, v10, v18, (uint64_t)a5);

  return v20;
}

+ (id)joinSessionWithNearbyGroup:(id)a3 asUser:(id)a4 hostSigningKey:(id)a5 delegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  swift_unknownObjectRetain(a6);
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v14 = v13;

  uint64_t v15 = *(void *)((char *)v9 + OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup_nearbyGroup);
  uint64_t v16 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v9) + 0x68LL);
  uint64_t v17 = swift_retain(v15);
  uint64_t v18 = v16(v17);
  uint64_t v20 = v19;
  uint64_t v21 = type metadata accessor for RemoteControlActivity();
  uint64_t v22 = swift_allocObject(v21, 32LL, 7LL);
  *(void *)(v22 + 16) = v18;
  *(void *)(v22 + 24) = v20;
  uint64_t v28 = v22;
  uint64_t v23 = sub_100156B68(&qword_1003F9950);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  uint64_t v24 = NearbyGroupSessionProvider.init(nearbyGroup:activity:)(v15, &v28);
  objc_allocWithZone((Class)type metadata accessor for MRDFastSyncGroupSession());
  id v25 = v10;
  swift_unknownObjectRetain(a6);
  v26 = (void *)sub_1001B3980(0, v25, v24, (uint64_t)a6);
  sub_1001608B8(v12, v14);

  swift_unknownObjectRelease(a6);
  return v26;
}

+ (id)stateToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    int64_t v6 = a3;
    id result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)( &type metadata for MRDFastSyncGroupSessionState,  &v6,  &type metadata for MRDFastSyncGroupSessionState,  &type metadata for Int);
    __break(1u);
  }

  else
  {
    uint64_t v3 = *(void *)&aInvalida[8 * a3 + 8];
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
    return v4;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v2 = self;
  MRDFastSyncGroupSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_groupMessenger));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession____lazy_storage___joinTimings));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___MRDFastSyncGroupSession____lazy_storage___sessionTimings));

  sub_100183478((uint64_t)self + OBJC_IVAR___MRDFastSyncGroupSession_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_connectionManager));

  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_presenceTask));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_joinProviderTask));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_observeSessionTask));

  swift_bridgeObjectRelease();
  sub_100162944( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_lowPowerCompletion),  *(void *)&self->pushMessenger[OBJC_IVAR___MRDFastSyncGroupSession_lowPowerCompletion]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)start
{
  uint64_t v2 = self;
  MRDFastSyncGroupSession.start()();
}

- (void)end
{
  uint64_t v2 = self;
  MRDFastSyncGroupSession.end()();
}

- (id)prewarmForIdentity:(id)a3
{
  id v4 = a3;
  v5 = self;
  MRDFastSyncGroupSession.prewarm(for:)(v4);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)cancelPrewarmedIdentifier:(id)a3 forIdentity:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a4;
  id v10 = self;
  MRDFastSyncGroupSession.cancel(prewarmedIdentifier:for:)(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)prepareForAddedMember
{
  uint64_t v2 = self;
  MRDFastSyncGroupSession.prepareForAddedMember()();
}

- (BOOL)shouldAutomaticallyApproveWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = MRDFastSyncGroupSession.shouldAutomaticallyApprove(identity:)(v4);

  return self & 1;
}

- (void)removeParticipantWithIdentifier:(id)a3
{
}

- (void)markParticipantAsGuestIfNeeded:(id)a3
{
}

- (void)addPendingParticipant:(id)a3
{
}

- (void)removePendingParticipant:(id)a3
{
}

- (void)remoteApprovePendingParticipant:(id)a3
{
}

- (void)remoteRejectPendingParticipant:(id)a3
{
}

- (void)remoteRemoveParticipantWithIdentifier:(id)a3
{
}

- (void)remoteRemoveAllParticipants
{
  uint64_t v2 = self;
  MRDFastSyncGroupSession.remoteRemoveAllParticipants()();
}

- (void)enterLowPowerModeWithCompletion:(id)a3
{
}

- (void)exitLowPowerModeWithCompletion:(id)a3
{
}

- (void)sendRemoteControlMessage:(id)a3 to:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v16 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v10,  &type metadata for String,  &protocol witness table for String);
  uint64_t v15 = swift_allocObject(&unk_1003A6050, 24LL, 7LL);
  *(void *)(v15 + 16) = v8;
  MRDFastSyncGroupSession.sendRemoteControlMessage(_:to:completion:)(v11, v13, v14, (uint64_t)sub_1001EF4F4, v15);
  swift_bridgeObjectRelease();
  swift_release(v15);
  sub_1001608B8(v11, v13);
}

- (MRDFastSyncGroupSession)init
{
  id result = (MRDFastSyncGroupSession *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.MRDFastSyncGroupSession",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end