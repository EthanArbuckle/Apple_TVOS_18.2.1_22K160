@interface CaptureDeviceManager
- (_TtC8FaceTime20CaptureDeviceManager)init;
- (void)dealloc;
@end

@implementation CaptureDeviceManager

- (_TtC8FaceTime20CaptureDeviceManager)init
{
  return (_TtC8FaceTime20CaptureDeviceManager *)sub_1000877F0();
}

- (void)dealloc
{
  v2 = self;
  sub_100087B64((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8FaceTime20CaptureDeviceManager_captureDeviceStateSubject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime20CaptureDeviceManager_deviceDiscoverySessionKVOToken));
}

@end