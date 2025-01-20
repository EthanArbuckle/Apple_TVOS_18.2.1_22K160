@interface SmallBreakoutCollectionViewCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (UIColor)backgroundColor;
- (_TtC8AppStore19BreakoutDetailsView)accessibilityDetailsView;
- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SmallBreakoutCollectionViewCell

- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31SmallBreakoutCollectionViewCell *)sub_1001E67A4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for BreakoutDetailsView.Config(0LL);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_itemLayoutContext;
  uint64_t v9 = type metadata accessor for ItemLayoutContext(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_backgroundArtwork) = 0LL;
  uint64_t v10 = OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView;
  uint64_t v11 = qword_1002E0B38;
  id v12 = a3;
  if (v11 != -1) {
    swift_once(&qword_1002E0B38, sub_1000F0674);
  }
  uint64_t v13 = sub_10000A634(v5, (uint64_t)qword_1002F4338);
  sub_10004B5C4(v13, (uint64_t)v7);
  id v14 = objc_allocWithZone((Class)type metadata accessor for BreakoutDetailsView(0LL));
  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)sub_1000F0B50((uint64_t)v7);

  result = (_TtC8AppStore31SmallBreakoutCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/SmallBreakoutCollectionViewCell.swift",  46LL,  2LL,  80LL,  0);
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SmallBreakoutCollectionViewCell backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  -[SmallBreakoutCollectionViewCell setBackgroundColor:](&v12, "setBackgroundColor:", v6);
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView);
  v11.receiver = v7;
  v11.super_class = ObjectType;
  id v9 = v8;
  uint64_t v10 = -[SmallBreakoutCollectionViewCell backgroundColor](&v11, "backgroundColor");
  ArtworkView.backgroundColor.setter(v10);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  objc_super v3 = sub_1001E6E98();

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)canBecomeFocused
{
  v2 = self;
  char v3 = sub_1001E6F90();

  return v3 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E7018();
}

- (void)prepareForReuse
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v4 = self;
  -[SmallBreakoutCollectionViewCell prepareForReuse](&v10, "prepareForReuse");
  sub_1000EFB54();
  v9.receiver = v4;
  v9.super_class = ObjectType;
  -[SmallBreakoutCollectionViewCell setBackgroundColor:](&v9, "setBackgroundColor:", 0LL);
  uint64_t v5 = *(Class *)((char *)&v4->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView);
  v8.receiver = v4;
  v8.super_class = ObjectType;
  id v6 = v5;
  v7 = -[SmallBreakoutCollectionViewCell backgroundColor](&v8, "backgroundColor");
  ArtworkView.backgroundColor.setter(v7);
}

- (_TtC8AppStore19BreakoutDetailsView)accessibilityDetailsView
{
  return (_TtC8AppStore19BreakoutDetailsView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView));
}

@end