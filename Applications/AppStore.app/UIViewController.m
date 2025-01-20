@interface UIViewController
- (CGSize)pageContainerSize;
- (UIEdgeInsets)pageMarginInsets;
- (_TtP8AppStore20PageTraitEnvironment_)snapshotPageTraitEnvironment;
@end

@implementation UIViewController

- (CGSize)pageContainerSize
{
  v2 = self;
  v3 = -[UIViewController view](v2, "view");
  if (v3)
  {
    v6 = v3;
    -[UIView bounds](v3, "bounds");
    double v8 = v7;
    double v10 = v9;

    double v4 = v8;
    double v5 = v10;
  }

  else
  {
    __break(1u);
  }

  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)pageMarginInsets
{
  double v2 = 80.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 80.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (_TtP8AppStore20PageTraitEnvironment_)snapshotPageTraitEnvironment
{
  double v2 = self;
  -[UIViewController pageContainerSize](v2, "pageContainerSize");
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  id v7 = -[UIViewController traitCollection](v2, "traitCollection");
  double v8 = (objc_class *)type metadata accessor for SnapshotPageTraitEnvironment();
  double v9 = (char *)objc_allocWithZone(v8);
  double v10 = &v9[OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_pageContainerSize];
  *(void *)double v10 = v4;
  *((void *)v10 + 1) = v6;
  *(void *)&v9[OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_traitCollection] = v7;
  v13.receiver = v9;
  v13.super_class = v8;
  v11 = -[UIViewController init](&v13, "init");

  return (_TtP8AppStore20PageTraitEnvironment_ *)v11;
}

@end