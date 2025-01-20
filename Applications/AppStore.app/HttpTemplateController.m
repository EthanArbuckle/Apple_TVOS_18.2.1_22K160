@interface HttpTemplateController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC8AppStore22HttpTemplateController)init;
- (void)dealloc;
- (void)textFieldDidChange:(id)a3;
@end

@implementation HttpTemplateController

- (void)dealloc
{
  v3 = (void *)objc_opt_self(&OBJC_CLASS___NSNotificationCenter);
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HttpTemplateController();
  -[HttpTemplateController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8AppStore22HttpTemplateController_textFields));
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  sub_1000A24E8(v11, location, length);
  LOBYTE(length) = v13;

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (void)textFieldDidChange:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8AppStore22HttpTemplateController_hasRequiredParameters) == 1)
  {
    uint64_t v9 = self;
    sub_1000A2228();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8AppStore22HttpTemplateController)init
{
  result = (_TtC8AppStore22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.HttpTemplateController",  31LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end