@interface TVButtonHeaderView
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (NSArray)preferredFocusEnvironments;
- (_TtC8Podcasts18TVButtonHeaderView)initWithCoder:(id)a3;
- (_TtC8Podcasts18TVButtonHeaderView)initWithFrame:(CGRect)a3;
- (id)action;
- (void)buttonAction;
- (void)layoutSubviews;
- (void)setAction:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVButtonHeaderView

- (id)action
{
  uint64_t v2 = *(void *)&self->action[OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action];
  v6[4] = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action);
  uint64_t v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_10013D2D8;
  v6[3] = &unk_100248008;
  v3 = _Block_copy(v6);
  uint64_t v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setAction:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v4 = (void *)swift_allocObject(&unk_100247FF0, 24LL, 7LL);
    v4[2] = v5;
    v6 = sub_100167220;
  }

  else
  {
    v6 = 0LL;
  }

  uint64_t v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action);
  uint64_t v8 = *(void *)&self->action[OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action];
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1001341FC(v9, v8);
}

- (void)setButtonTitle:(id)a3
{
  uint64_t v5 = v4;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_button);
  uint64_t v7 = self;
  id v8 = String._bridgeToObjectiveC()();
  [v6 setTitle:v8 forState:0];

  swift_bridgeObjectRelease(v5);
}

- (_TtC8Podcasts18TVButtonHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8Podcasts18TVButtonHeaderView *)sub_10016690C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)buttonAction
{
  uint64_t v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action);
  if (v2)
  {
    uint64_t v3 = *(void *)&self->action[OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action];
    uint64_t v5 = self;
    uint64_t v4 = sub_10013397C((uint64_t)v2, v3);
    v2(v4);
    sub_1001341FC((uint64_t)v2, v3);
  }

- (_TtC8Podcasts18TVButtonHeaderView)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_action);
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC8Podcasts18TVButtonHeaderView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010021A280LL,  "Podcasts/TVButtonHeaderView.swift",  33LL,  2LL,  37LL,  0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TVButtonHeaderView();
  id v4 = a3;
  id v5 = v6.receiver;
  -[TVButtonHeaderView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_100166BD0();
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = self;
  double v3 = sub_100166D84();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  sub_100166E9C();
}

- (BOOL)canBecomeFocused
{
  return [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_button) isFocused] ^ 1;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_100126450((uint64_t *)&unk_1002B6160);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1001C4170;
  double v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts18TVButtonHeaderView_button);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()(v4);
  id v6 = v5;
  sub_100126450((uint64_t *)&unk_1002B6400);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
}

@end