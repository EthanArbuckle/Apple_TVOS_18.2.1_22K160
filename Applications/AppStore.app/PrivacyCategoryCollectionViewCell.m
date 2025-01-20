@interface PrivacyCategoryCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore19PrivacyCategoryView)accessibilityCategoryView;
- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyCategoryCollectionViewCell

- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33PrivacyCategoryCollectionViewCell *)sub_1001EC388();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v13.receiver;
  -[PrivacyCategoryCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView];
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
  sub_1001EC01C();
}

- (_TtC8AppStore19PrivacyCategoryView)accessibilityCategoryView
{
  return (_TtC8AppStore19PrivacyCategoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView));
  sub_10000B314((uint64_t)self + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_itemLayoutContext);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategory));
}

@end