@interface TVMusicStackTemplateController
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (TVMusicStackTemplateController)initWithCoder:(id)a3;
- (TVMusicStackTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation TVMusicStackTemplateController

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10012B7F0(v6, (uint64_t)v7);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10012B964(v4);

  return self & 1;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  id v3 = sub_10012BAF0();

  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = self;
  sub_10012BCC0(v9, (uint64_t)a5, x, y);
}

- (TVMusicStackTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
    *(void *)&self->_TVStackTemplateController_opaque[OBJC_IVAR___TVMusicStackTemplateController_lastFocusedView] = 0LL;
    id v8 = a4;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    *(void *)&self->_TVStackTemplateController_opaque[OBJC_IVAR___TVMusicStackTemplateController_lastFocusedView] = 0LL;
    id v10 = a4;
    NSString v9 = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TVMLStackTemplateController();
  v11 = -[TVMusicStackTemplateController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (TVMusicStackTemplateController)initWithCoder:(id)a3
{
  *(void *)&self->_TVStackTemplateController_opaque[OBJC_IVAR___TVMusicStackTemplateController_lastFocusedView] = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVMLStackTemplateController();
  return -[TVMusicStackTemplateController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
}

@end