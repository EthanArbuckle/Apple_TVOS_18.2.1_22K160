@interface PrivacyCategoryCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade19PrivacyCategoryView)accessibilityCategoryView;
- (_TtC6Arcade33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyCategoryCollectionViewCell

- (_TtC6Arcade33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade33PrivacyCategoryCollectionViewCell *)sub_1001E52C8();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v13.receiver;
  -[PrivacyCategoryCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade33PrivacyCategoryCollectionViewCell_privacyCategoryView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001E4F5C();
}

- (_TtC6Arcade19PrivacyCategoryView)accessibilityCategoryView
{
  return (_TtC6Arcade19PrivacyCategoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC6Arcade33PrivacyCategoryCollectionViewCell_privacyCategoryView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade33PrivacyCategoryCollectionViewCell_privacyCategoryView));
  sub_10000AA2C((uint64_t)self + OBJC_IVAR____TtC6Arcade33PrivacyCategoryCollectionViewCell_itemLayoutContext);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade33PrivacyCategoryCollectionViewCell_privacyCategory));
}

@end