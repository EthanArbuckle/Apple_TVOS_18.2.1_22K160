@interface SmallLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC8AppStore15SmallLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore15SmallLockupView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SmallLockupView

- (_TtC8AppStore15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15SmallLockupView *)sub_1000B1D8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15SmallLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B290C((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000B227C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v4 = self;
  double v5 = sub_1000B1458(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_1000B2518();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  id v4 = v8.receiver;
  id v5 = a3;
  -[SmallLockupView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    sub_1000B210C();
  }
}

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore15SmallLockupView_artworkView));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore15SmallLockupView_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore15SmallLockupView_subtitleLabel));
}

- (void).cxx_destruct
{
}

@end