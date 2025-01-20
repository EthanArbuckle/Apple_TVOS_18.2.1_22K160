@interface ConnectionManager
- (_TtC18CompanionUIService17ConnectionManager)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation ConnectionManager

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100003B70(v9);

  swift_unknownObjectRelease(a5);
}

- (_TtC18CompanionUIService17ConnectionManager)init
{
  return (_TtC18CompanionUIService17ConnectionManager *)sub_1000036FC();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18CompanionUIService17ConnectionManager_server));
}

@end