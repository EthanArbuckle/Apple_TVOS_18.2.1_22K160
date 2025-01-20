@interface SnapshotPageTraitEnvironment
- (CGSize)pageContainerSize;
- (UIEdgeInsets)pageMarginInsets;
- (UITraitCollection)traitCollection;
- (_TtC6Arcade28SnapshotPageTraitEnvironment)init;
@end

@implementation SnapshotPageTraitEnvironment

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC6Arcade28SnapshotPageTraitEnvironment_traitCollection));
}

- (CGSize)pageContainerSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC6Arcade28SnapshotPageTraitEnvironment_pageContainerSize);
  double v3 = *(double *)&self->traitCollection[OBJC_IVAR____TtC6Arcade28SnapshotPageTraitEnvironment_pageContainerSize];
  result.height = v3;
  result.width = v2;
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

- (_TtC6Arcade28SnapshotPageTraitEnvironment)init
{
  UIEdgeInsets result = (_TtC6Arcade28SnapshotPageTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.SnapshotPageTraitEnvironment",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end