@interface CSDHandoffAudioController
+ (NSString)continueHandoffAudioRouteNotification;
+ (NSString)routeIdentifierChangedNotification;
- (CSDHandoffAudioController)init;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)handleContinueHandoffAudioRouteNotification:(id)a3;
- (void)routesChangedForRouteController:(id)a3;
@end

@implementation CSDHandoffAudioController

+ (NSString)routeIdentifierChangedNotification
{
  return (NSString *)static HandoffAudioController.routeIdentifierChangedNotification.getter();
}

+ (NSString)continueHandoffAudioRouteNotification
{
  return (NSString *)static HandoffAudioController.continueHandoffAudioRouteNotification.getter();
}

- (CSDHandoffAudioController)init
{
  return (CSDHandoffAudioController *)HandoffAudioController.init()();
}

- (void)dealloc
{
  v2 = self;
  HandoffAudioController.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (void)handleContinueHandoffAudioRouteNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002AD6B8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HandoffAudioController.conversationManager(_:stateChangedFor:)();
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  HandoffAudioController.routesChanged(for:)();
}

@end