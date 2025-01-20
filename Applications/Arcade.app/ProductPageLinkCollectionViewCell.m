@interface ProductPageLinkCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade17DynamicTypeButton)accessibilityButton;
- (_TtC6Arcade33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC6Arcade33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductPageLinkCollectionViewCell

- (_TtC6Arcade33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade33ProductPageLinkCollectionViewCell *)sub_1000BC0FC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC6Arcade33ProductPageLinkCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  uint64_t v7 = OBJC_IVAR____TtC6Arcade33ProductPageLinkCollectionViewCell_button;
  uint64_t v8 = type metadata accessor for DynamicTypeButton(0LL);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v8);
  id v10 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class) [ObjCClassFromMetadata buttonWithType:1];

  result = (_TtC6Arcade33ProductPageLinkCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ProductPageLinkCollectionViewCell.swift",  46LL,  2LL,  34LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000BC4CC();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (_TtC6Arcade17DynamicTypeButton)accessibilityButton
{
  return (_TtC6Arcade17DynamicTypeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC6Arcade33ProductPageLinkCollectionViewCell_button));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade33ProductPageLinkCollectionViewCell_button));
}

@end