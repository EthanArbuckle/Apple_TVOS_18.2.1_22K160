@interface ArtworkDisplayingViewController
- (_TtC6Arcade31ArtworkDisplayingViewController)initWithCoder:(id)a3;
- (_TtC6Arcade31ArtworkDisplayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ArtworkDisplayingViewController

- (void)loadView
{
  v4 = self;
  if ((-[ArtworkDisplayingViewController isViewLoaded](v4, "isViewLoaded") & 1) != 0)
  {
    v2 = v4;
  }

  else
  {
    v3 = (_TtC6Arcade31ArtworkDisplayingViewController *)objc_msgSend( objc_allocWithZone(UIImageView),  "initWithFrame:",  0.0,  0.0,  0.0,  0.0);
    -[ArtworkDisplayingViewController setView:](v4, "setView:", v3);

    v2 = v3;
  }
}

- (_TtC6Arcade31ArtworkDisplayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v9 = v8;
    id v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    id v11 = a4;
  }

  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[ArtworkDisplayingViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC6Arcade31ArtworkDisplayingViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[ArtworkDisplayingViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end