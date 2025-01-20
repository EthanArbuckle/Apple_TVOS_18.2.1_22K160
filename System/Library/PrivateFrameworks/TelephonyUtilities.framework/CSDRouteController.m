@interface CSDRouteController
+ (id)makeLocalRouteController;
+ (id)makePairedHostDeviceRouteController;
- (CSDRouteController)init;
- (NSDictionary)routesByUniqueIdentifier;
- (id)pickedRouteDidChangeHandler;
- (id)routeWasPickedHandler;
- (id)routesDidChangeHandler;
- (id)timedOutPickingRouteHandler;
- (void)clearState;
- (void)handleUpdatedPairedHostDeviceRoutes:(id)a3;
- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4;
- (void)setPickedRouteDidChangeHandler:(id)a3;
- (void)setRouteWasPickedHandler:(id)a3;
- (void)setRoutesDidChangeHandler:(id)a3;
- (void)setTimedOutPickingRouteHandler:(id)a3;
@end

@implementation CSDRouteController

- (NSDictionary)routesByUniqueIdentifier
{
  v2 = self;
  uint64_t v3 = sub_10025B758();

  sub_1001D8EA0(0LL, (unint64_t *)&qword_10044CAD0, &OBJC_CLASS___TURoute_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (id)routesDidChangeHandler
{
  return sub_1001E69FC( (uint64_t)self,  (uint64_t)a2,  (uint64_t (*)(void))sub_10025B83C,  (uint64_t)sub_1002356BC,  (uint64_t)&unk_1003E43D0);
}

- (void)setRoutesDidChangeHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003E43B8, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001B5D68;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001CDC58((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_routesDidChangeHandler, sub_1001B5D3C);
}

- (id)pickedRouteDidChangeHandler
{
  return sub_1001E69FC( (uint64_t)self,  (uint64_t)a2,  (uint64_t (*)(void))sub_10025B910,  (uint64_t)sub_10025B930,  (uint64_t)&unk_1003E4380);
}

- (void)setPickedRouteDidChangeHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003E4368, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_100260A90;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001CDC58((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_pickedRouteDidChangeHandler, sub_1001D8ED8);
}

- (id)routeWasPickedHandler
{
  return sub_1001E69FC( (uint64_t)self,  (uint64_t)a2,  (uint64_t (*)(void))sub_10025B9E8,  (uint64_t)sub_10025B930,  (uint64_t)&unk_1003E4330);
}

- (void)setRouteWasPickedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003E4318, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_100260A90;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001CDC58((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_routeWasPickedHandler, sub_1001D8ED8);
}

- (id)timedOutPickingRouteHandler
{
  return sub_1001E69FC( (uint64_t)self,  (uint64_t)a2,  (uint64_t (*)(void))sub_10025BABC,  (uint64_t)sub_10025B930,  (uint64_t)&unk_1003E42E0);
}

- (void)setTimedOutPickingRouteHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003E42C8, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001FBB44;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001CDC58((uint64_t)v4, v5, &OBJC_IVAR___CSDRouteController_timedOutPickingRouteHandler, sub_1001D8ED8);
}

+ (id)makeLocalRouteController
{
  return v2;
}

+ (id)makePairedHostDeviceRouteController
{
  return v2;
}

- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4
{
  uint64_t v6 = v5;
  v7 = self;
  sub_10025CA88();

  swift_bridgeObjectRelease(v6);
}

- (void)clearState
{
  id v2 = self;
  sub_10025DB6C();
}

- (void)handleUpdatedPairedHostDeviceRoutes:(id)a3
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10025DE30();

  swift_bridgeObjectRelease(v6);
}

- (CSDRouteController)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDRouteController__routesByUniqueIdentifier));
  sub_1001D8F9C(OBJC_IVAR___CSDRouteController_routesDidChangeHandler);
  sub_1001D8F9C(OBJC_IVAR___CSDRouteController_pickedRouteDidChangeHandler);
  sub_1001D8F9C(OBJC_IVAR___CSDRouteController_routeWasPickedHandler);
  sub_1001D8F9C(OBJC_IVAR___CSDRouteController_timedOutPickingRouteHandler);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDRouteController_routeProviders));
  sub_10025E68C( *(void **)((char *)&self->super.isa + OBJC_IVAR___CSDRouteController_pendingRouteContext),  *(void *)&self->_routesByUniqueIdentifier[OBJC_IVAR___CSDRouteController_pendingRouteContext]);
  swift_bridgeObjectRelease(*(void *)&self->_routesByUniqueIdentifier[OBJC_IVAR___CSDRouteController_pickWhenAvailableRouteIdentifier]);
}

@end