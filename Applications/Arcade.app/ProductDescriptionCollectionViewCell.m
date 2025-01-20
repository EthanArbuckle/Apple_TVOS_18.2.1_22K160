@interface ProductDescriptionCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductDescriptionCollectionViewCell

- (_TtC6Arcade36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade36ProductDescriptionCollectionViewCell *)sub_100131E80( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return *((_BYTE *)&(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                               + OBJC_IVAR____TtC6Arcade36ProductDescriptionCollectionViewCell_bodyTextView))->isa
         + OBJC_IVAR____TtC6Arcade18ExpandableTextView_isCollapsed);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100132004();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade36ProductDescriptionCollectionViewCell_bodyTextView));
}

@end