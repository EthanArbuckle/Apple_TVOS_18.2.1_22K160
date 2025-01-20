@interface PrivacyHeaderCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityBodyLabel;
- (_TtC6Arcade31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)lowMemoryWarning:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PrivacyHeaderCollectionViewCell

- (_TtC6Arcade31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade31PrivacyHeaderCollectionViewCell *)sub_1001756CC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100174A34();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001750D8(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001739AC();
}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_reusePool, v11, 33LL, 0LL);
  v9 = self;
  sub_1000031E8(&qword_1002E27F0);
  ReusePool.drain()();
  swift_endAccess(v11);

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityBodyLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_bodyLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_itemLayoutContext,  (uint64_t *)&unk_1002DDB60);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_pageTraits));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_pageGrid, &qword_1002E5A20);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_actionButtons));
  v3 = (char *)self + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_reusePool;
  uint64_t v4 = sub_1000031E8(&qword_1002E27F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_bodyText));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_actions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31PrivacyHeaderCollectionViewCell_focusGuide));
}

@end