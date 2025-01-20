@interface CSDFaceTimeInviteDemuxer
- (BOOL)destinationIDsCanUseV2Blobs:(id)a3;
- (CSDFaceTimeInviteDemuxer)init;
- (void)idsPeersForHandle:(id)a3 video:(BOOL)a4 fromID:(id)a5 completionHandler:(id)a6;
@end

@implementation CSDFaceTimeInviteDemuxer

- (CSDFaceTimeInviteDemuxer)init
{
  return (CSDFaceTimeInviteDemuxer *)sub_100290FAC();
}

- (void)idsPeersForHandle:(id)a3 video:(BOOL)a4 fromID:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v13 = v12;
  _Block_copy(v10);
  id v14 = a3;
  v15 = self;
  sub_10029125C(v14, v7, v11, v13, (char *)v15, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v13);
}

- (BOOL)destinationIDsCanUseV2Blobs:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  swift_bridgeObjectRelease(v3);
  return 0;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDFaceTimeInviteDemuxer_idsQueryController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDFaceTimeInviteDemuxer_serverBag));
  sub_100295034( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDFaceTimeInviteDemuxer____lazy_storage___pushTokenForSelf),  *(void *)&self->featureFlags[OBJC_IVAR___CSDFaceTimeInviteDemuxer____lazy_storage___pushTokenForSelf]);
}

@end