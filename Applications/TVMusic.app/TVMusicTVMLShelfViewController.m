@interface TVMusicTVMLShelfViewController
- (TVMusicTVMLShelfViewController)initWithCoder:(id)a3;
- (TVMusicTVMLShelfViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)scrollInterval;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setScrollInterval:(double)a3;
@end

@implementation TVMusicTVMLShelfViewController

- (double)scrollInterval
{
  return *(double *)&self->_TVShelfViewController_opaque[OBJC_IVAR___TVMusicTVMLShelfViewController_scrollInterval];
}

- (void)setScrollInterval:(double)a3
{
  *(double *)&self->_TVShelfViewController_opaque[OBJC_IVAR___TVMusicTVMLShelfViewController_scrollInterval] = a3;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  v10 = self;
  [v7 bounds];
  id v8 = sub_10013969C(v7, &a5->x);
  if ((v9 & 1) == 0) {
    *(void *)&a5->x = v8;
  }
}

- (TVMusicTVMLShelfViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
    *(void *)&self->_TVShelfViewController_opaque[OBJC_IVAR___TVMusicTVMLShelfViewController_scrollInterval] = 0LL;
    id v8 = a4;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    *(void *)&self->_TVShelfViewController_opaque[OBJC_IVAR___TVMusicTVMLShelfViewController_scrollInterval] = 0LL;
    id v10 = a4;
    NSString v9 = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TVMLShelfViewController();
  v11 = -[TVMusicTVMLShelfViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (TVMusicTVMLShelfViewController)initWithCoder:(id)a3
{
  *(void *)&self->_TVShelfViewController_opaque[OBJC_IVAR___TVMusicTVMLShelfViewController_scrollInterval] = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVMLShelfViewController();
  return -[TVMusicTVMLShelfViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end