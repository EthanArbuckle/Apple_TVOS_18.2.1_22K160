@interface ChartOrCategoryBrickCollectionViewCell
- (_TtC6Arcade38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC6Arcade38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade38ChartOrCategoryBrickCollectionViewCell *)sub_100083A7C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100083F44();
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self);
  id v6 = v11.receiver;
  id v7 = a4;
  id v8 =  -[ChartOrCategoryBrickCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:]( &v11,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFocusingBaseDuration:", 0.2, v11.receiver, v11.super_class);
    [v9 setUnfocusingBaseDuration:0.2];
    objc_msgSend(v9, "setAs_animationOptions:", 131078);
  }

  return v9;
}

- (void)prepareForReuse
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = sub_1000031E8(&qword_1002E14D8);
  __chkstk_darwin(v4);
  id v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v13.receiver = self;
  v13.super_class = ObjectType;
  id v7 = self;
  -[BaseCollectionViewCell prepareForReuse](&v13, "prepareForReuse");
  ArtworkView.image.setter(0LL);
  sub_10008399C( 0LL,  0LL,  &OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_badgeLabel,  &OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_badgeText);
  sub_10008399C( 0LL,  0LL,  &OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_titleLabel,  &OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_titleText);
  uint64_t v9 = type metadata accessor for ChartOrCategoryBrickContext(0LL, v8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v6, 1LL, 1LL, v9);
  uint64_t v10 = (uint64_t)v7 + OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_brickContext;
  swift_beginAccess( (char *)v7 + OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_brickContext,  v12,  33LL,  0LL);
  sub_1000862A0((uint64_t)v6, v10);
  swift_endAccess(v12);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_badgeText]);
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_titleText]);
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade38ChartOrCategoryBrickCollectionViewCell_brickContext,  &qword_1002E14D8);
}

@end