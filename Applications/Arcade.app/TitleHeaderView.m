@interface TitleHeaderView
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)preferredFocusEnvironments;
- (NSString)accessibilityLabel;
- (_TtC6Arcade15TitleHeaderView)initWithCoder:(id)a3;
- (_TtC6Arcade15TitleHeaderView)initWithFrame:(CGRect)a3;
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

- (_TtC6Arcade15TitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade15TitleHeaderView *)sub_100169BFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade15TitleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100172AB4();
}

  ;
}

- (void)didTapWithAccessoryView:(id)a3
{
  id v3 = *(void (**)(void *))((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessoryAction);
  if (v3)
  {
    uint64_t v6 = *(void *)&self->eyebrowText[OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessoryAction];
    v9[3] = sub_100006028(0LL, (unint64_t *)&unk_1002E9738, &OBJC_CLASS___UIControl_ptr);
    v9[0] = a3;
    id v7 = a3;
    v8 = self;
    sub_100017A40((uint64_t)v3, v6);
    v3(v9);
    sub_10000D3D8((uint64_t)v3, v6);
    sub_100006060((uint64_t)v9, (uint64_t *)&unk_1002DF680);
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10016B878(width, height);
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
  sub_10016BBC8();
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
  sub_10016DD34();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_10016DF34();
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
  unsigned __int8 v3 = sub_10016E304();

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
  uint64_t v3 = sub_10016E460();

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
  uint64_t v3 = sub_10016E5F8();

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade15TitleHeaderView_eyebrowArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade15TitleHeaderView_eyebrowArtworkView));

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade15TitleHeaderView_titleArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade15TitleHeaderView_titleArtworkView));

  sub_100046E64( (uint64_t)self + OBJC_IVAR____TtC6Arcade15TitleHeaderView_style,  type metadata accessor for TitleHeaderView.Style);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessoryFocusGuide));
  sub_100172A5C( *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessory),  *(void *)&self->eyebrowText[OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessory],  *(void **)&self->eyebrowText[OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessory + 8],  self->eyebrowLabel[OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessory]);
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessoryAction),  *(void *)&self->eyebrowText[OBJC_IVAR____TtC6Arcade15TitleHeaderView_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade15TitleHeaderView_separatorLineView));
}

@end