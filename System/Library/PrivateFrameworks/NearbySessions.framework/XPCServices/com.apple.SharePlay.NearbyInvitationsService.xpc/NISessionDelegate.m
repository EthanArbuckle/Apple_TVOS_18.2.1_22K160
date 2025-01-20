@interface NISessionDelegate
- (_TtC44com_apple_SharePlay_NearbyInvitationsServiceP33_7363818DEECEA212EB4728A56115524617NISessionDelegate)init;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didUpdateAlgorithmState:(id)a4 forObject:(id)a5;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)sessionDidStartRunning:(id)a3;
@end

@implementation NISessionDelegate

- (void)sessionDidStartRunning:(id)a3
{
  id v4 = a3;
  v5 = self;
  NISessionDelegate.sessionDidStartRunning(_:)(v4);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  NISessionDelegate.session(_:didFailWithError:)(v6, (uint64_t)v8);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  NISessionDelegate.session(_:didInvalidateWith:)(v6, (uint64_t)v8);
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized NISessionDelegate.session(_:suspendedWith:)(v6, a4);
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  id v8 = a3;
  v9 = self;
  NISessionDelegate.session(_:suspensionReasonEnded:isNoLongerSuspended:)(v8, a4, a5);
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  specialized NISessionDelegate.session(_:didDiscover:)(v7);
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  specialized NISessionDelegate.session(_:object:didUpdateRegion:previousRegion:)(v11, a5);
}

- (void)session:(id)a3 didUpdateAlgorithmState:(id)a4 forObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  specialized NISessionDelegate.session(_:didUpdateAlgorithmState:for:)(v9, v10);
}

- (_TtC44com_apple_SharePlay_NearbyInvitationsServiceP33_7363818DEECEA212EB4728A56115524617NISessionDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsServiceP33_7363818DEECEA212EB4728A56115524617NISessionDelegate_devices;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  swift_weakInit( (char *)v4 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsServiceP33_7363818DEECEA212EB4728A56115524617NISessionDelegate_scanner,  0LL);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NISessionDelegate();
  return -[NISessionDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsServiceP33_7363818DEECEA212EB4728A56115524617NISessionDelegate_devices));
  swift_weakDestroy( (char *)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsServiceP33_7363818DEECEA212EB4728A56115524617NISessionDelegate_scanner);
}

@end