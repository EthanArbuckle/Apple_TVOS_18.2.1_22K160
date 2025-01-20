@interface PineBoardBulletinManager
- (_TtC8FaceTime24PineBoardBulletinManager)init;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
@end

@implementation PineBoardBulletinManager

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v9 = a4;
  v10 = self;
  sub_10006A30C(a4, a5);
  swift_unknownObjectRelease(a3);
}

- (_TtC8FaceTime24PineBoardBulletinManager)init
{
  result = (_TtC8FaceTime24PineBoardBulletinManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.PineBoardBulletinManager",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8FaceTime24PineBoardBulletinManager_bulletinService));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8FaceTime24PineBoardBulletinManager_presentedBulletins));
}

@end