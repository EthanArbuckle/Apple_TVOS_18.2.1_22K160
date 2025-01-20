@interface DriverKitSettingsViewController
- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithCoder:(id)a3;
- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation DriverKitSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_4BE8();
}

- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v9 = v8;
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0LL;
    id v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0LL;
    id v11 = a4;
  }

  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[DriverKitSettingsViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC17DriverKitSettings31DriverKitSettingsViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC17DriverKitSettings31DriverKitSettingsViewController____lazy_storage___hostingController] = 0LL;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[DriverKitSettingsViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
}

@end