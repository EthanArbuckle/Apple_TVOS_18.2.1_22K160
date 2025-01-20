@interface ProductDescriptionCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductDescriptionCollectionViewCell

- (_TtC8AppStore36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36ProductDescriptionCollectionViewCell *)sub_10013F358( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return *((_BYTE *)&(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                               + OBJC_IVAR____TtC8AppStore36ProductDescriptionCollectionViewCell_bodyTextView))->isa
         + OBJC_IVAR____TtC8AppStore18ExpandableTextView_isCollapsed);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013F4DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ProductDescriptionCollectionViewCell_bodyTextView));
}

@end