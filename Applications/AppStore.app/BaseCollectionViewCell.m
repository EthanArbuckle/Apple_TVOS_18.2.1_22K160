@interface BaseCollectionViewCell
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)jet_focusedFrame;
- (_TtC8AppStore22BaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore22BaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BaseCollectionViewCell

- (_TtC8AppStore22BaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22BaseCollectionViewCell *)sub_100068A04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22BaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10006B358();
}

  ;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100069A64(v4);

  return self & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100069B9C(v6, (uint64_t)v7);
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  sub_100069DF0();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BaseCollectionViewCell();
  v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  (*(void (**)(void))((swift_isaMask & *v2) + 0xA0LL))(0LL);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BaseCollectionViewCell();
  double v4 = v9.receiver;
  id v5 = a3;
  -[BaseCollectionViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "traitCollection", v9.receiver, v9.super_class);
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle])
  {
    uint64_t v8 = (*(uint64_t (**)(void))((swift_isaMask & *v4) + 0x98LL))();
    (*(void (**)(uint64_t, void))((swift_isaMask & *v4) + 0x1C8LL))(v8, 0LL);
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_10000DFD4(0LL, (unint64_t *)&qword_1002E14D0, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B300();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  double v11 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for BaseCollectionViewCell();
  -[BaseCollectionViewCell pressesBegan:withEvent:](&v16, "pressesBegan:withEvent:", isa, v10);

  if (((*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v11->super.super.super.super.super.isa) + 0x1D0))() & 1) != 0)
  {
    sub_100066CB4(v9);
    if ((v13 & 1) != 0)
    {
      uint64_t v14 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v11->super.super.super.super.super.isa) + 0xA0))(2LL);
      uint64_t v15 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v11->super.super.super.super.super.isa) + 0x98))(v14);
      (*(void (**)(uint64_t, void))((swift_isaMask & (uint64_t)v11->super.super.super.super.super.isa) + 0xB0))( v15,  0LL);
    }
  }

  swift_bridgeObjectRelease(v9);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_10000DFD4(0LL, (unint64_t *)&qword_1002E14D0, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B300();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  double v11 = self;
  sub_10006A1DC(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->state[OBJC_IVAR____TtC8AppStore22BaseCollectionViewCell_shadowColor];
  double v4 = *(void **)&self->shadowRadius[OBJC_IVAR____TtC8AppStore22BaseCollectionViewCell_shadowColor + 6];
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BaseCollectionViewCell_shadowColor));
  sub_10000B3F0(v3);
  sub_10000B3F0(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BaseCollectionViewCell____lazy_storage___tiltMotionEffectGroup));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BaseCollectionViewCell_focusGuideExtension));
}

@end