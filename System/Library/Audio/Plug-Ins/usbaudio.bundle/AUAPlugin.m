@interface AUAPlugin
+ (id)sharedNonremotePlugin;
+ (id)sharedRemotePlugin;
- (AUAPlugin)init;
@end

@implementation AUAPlugin

+ (id)sharedRemotePlugin
{
  return sub_100066CF0();
}

+ (id)sharedNonremotePlugin
{
  return sub_100066E98();
}

- (AUAPlugin)init
{
  result = (AUAPlugin *)_swift_stdlib_reportUnimplementedInitializer("AUASDCore.DriverPlugin", 22LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___AUAPlugin_usbDeviceList));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___AUAPlugin_pressuredExitHold), v3);
  swift_release(*(void *)&self->notificationQueue[OBJC_IVAR___AUAPlugin_cancel]);
}

@end