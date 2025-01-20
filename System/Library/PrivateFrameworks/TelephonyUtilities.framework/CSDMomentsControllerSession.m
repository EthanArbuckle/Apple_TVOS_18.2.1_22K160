@interface CSDMomentsControllerSession
- (BOOL)isRegistered;
- (CSDAVCMoments)moments;
- (CSDMomentsControllerSession)init;
- (CSDMomentsControllerSession)initWithMoments:(id)a3 remoteIDSDestinations:(id)a4 callCenterObserver:(id)a5;
- (NSDictionary)activeRequestsByTransactionID;
- (NSDictionary)remoteIDSDestinations;
- (NSString)description;
- (id)remoteRequesteeIDSDestinationFor:(id)a3;
- (id)remoteRequesterIDSDestinationFor:(id)a3;
- (void)removeActiveRequestForTransactionID:(id)a3;
- (void)setActiveRequest:(id)a3 forTransactionID:(id)a4;
- (void)setActiveRequestsByTransactionID:(id)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setRemoteIDSDestinations:(id)a3;
@end

@implementation CSDMomentsControllerSession

- (CSDAVCMoments)moments
{
  return (CSDAVCMoments *)(id)sub_100256124();
}

- (NSDictionary)remoteIDSDestinations
{
  uint64_t v2 = sub_1002562C0(&OBJC_IVAR___CSDMomentsControllerSession_remoteIDSDestinations);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (void)setRemoteIDSDestinations:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  v5 = self;
  sub_100256374(v4, &OBJC_IVAR___CSDMomentsControllerSession_remoteIDSDestinations);
}

- (BOOL)isRegistered
{
  return sub_100256218() & 1;
}

- (void)setIsRegistered:(BOOL)a3
{
}

- (NSDictionary)activeRequestsByTransactionID
{
  uint64_t v2 = sub_1002562C0(&OBJC_IVAR___CSDMomentsControllerSession_activeRequestsByTransactionID);
  type metadata accessor for MomentsRequest();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (void)setActiveRequestsByTransactionID:(id)a3
{
  uint64_t v5 = type metadata accessor for MomentsRequest();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v5,  &protocol witness table for String);
  v7 = self;
  sub_100256374(v6, &OBJC_IVAR___CSDMomentsControllerSession_activeRequestsByTransactionID);
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_100256410();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CSDMomentsControllerSession)initWithMoments:(id)a3 remoteIDSDestinations:(id)a4 callCenterObserver:(id)a5
{
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a5);
  return (CSDMomentsControllerSession *)sub_1002566E8((uint64_t)a3, v7, (uint64_t)a5);
}

- (id)remoteRequesteeIDSDestinationFor:(id)a3
{
  return sub_100256E8C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_requesteeID);
}

- (id)remoteRequesterIDSDestinationFor:(id)a3
{
  return sub_100256E8C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_requesterID);
}

- (void)setActiveRequest:(id)a3 forTransactionID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_100256F08(v9, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)removeActiveRequestForTransactionID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100256FD0(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (CSDMomentsControllerSession)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDMomentsControllerSession_remoteIDSDestinations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDMomentsControllerSession_activeRequestsByTransactionID));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDMomentsControllerSession_callCenterObserver));
}

@end