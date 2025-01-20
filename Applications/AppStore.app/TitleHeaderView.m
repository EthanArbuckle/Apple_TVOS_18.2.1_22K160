@interface TitleHeaderView
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)preferredFocusEnvironments;
- (NSString)accessibilityLabel;
- (_TtC8AppStore15TitleHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore15TitleHeaderView)initWithFrame:(CGRect)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (unint64_t)accessibilityTraits;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitleHeaderView

- (_TtC8AppStore15TitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15TitleHeaderView *)sub_100171574(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15TitleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100179BF8();
}

  ;
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v3 = *(void (**)(void *))((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction);
  if (v3)
  {
    uint64_t v6 = *(void *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction];
    v9[3] = sub_10000DFD4(0LL, &qword_1002EDAB0, &OBJC_CLASS___UIControl_ptr);
    v9[0] = a3;
    id v7 = a3;
    v8 = self;
    sub_100015CA0((uint64_t)v3, v6);
    v3(v9);
    sub_10000A450((uint64_t)v3, v6);
    sub_1000077E0((uint64_t)v9, (uint64_t *)&unk_1002E3500);
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1001729E4(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100172D34();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TitleHeaderView(0LL);
  v4 = v8.receiver;
  id v5 = a3;
  -[TitleHeaderView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    (*(void (**)(void))((swift_isaMask & *v4) + 0x1A8LL))();
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100174EA0();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1001750A0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
    id v6 = self;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    objc_super v8 = self;
    NSString v7 = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TitleHeaderView(0LL);
  -[TitleHeaderView setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);
}

- (BOOL)isAccessibilityElement
{
  v2 = self;
  unsigned __int8 v3 = sub_100175470();

  return v3 & 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0LL);
  -[TitleHeaderView setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0LL);
  -[TitleHeaderView setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = self;
  uint64_t v3 = sub_1001755CC();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return v4.super.isa;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  uint64_t v3 = sub_100175764();

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowArtworkView));

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_detailLabel));
  sub_10002BDF4( (uint64_t)self + OBJC_IVAR____TtC8AppStore15TitleHeaderView_style,  type metadata accessor for TitleHeaderView.Style);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryFocusGuide));
  sub_100179DA0( *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessory),  *(void *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessory],  *(void **)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessory + 8],  self->eyebrowLabel[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessory]);
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction),  *(void *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_separatorLineView));
}

@end