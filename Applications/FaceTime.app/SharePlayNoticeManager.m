@interface SharePlayNoticeManager
- (_TtC8FaceTime22SharePlayNoticeManager)init;
@end

@implementation SharePlayNoticeManager

- (_TtC8FaceTime22SharePlayNoticeManager)init
{
  result = (_TtC8FaceTime22SharePlayNoticeManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SharePlayNoticeManager",  31LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime22SharePlayNoticeManager_neighborhoodActivityConduit));
  sub_10001BFEC((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8FaceTime22SharePlayNoticeManager_sharePlayStateManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8FaceTime22SharePlayNoticeManager_sharePlayStateCancellable));
}

@end