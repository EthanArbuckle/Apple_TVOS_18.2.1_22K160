@interface PrivacyHeaderCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityBodyLabel;
- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)lowMemoryWarning:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PrivacyHeaderCollectionViewCell

- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31PrivacyHeaderCollectionViewCell *)sub_10017C838();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10017BBA0();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10017C244(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10017AB18();
}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_reusePool, v11, 33LL, 0LL);
  v9 = self;
  sub_1000038E8(&qword_1002E6DF0);
  ReusePool.drain()();
  swift_endAccess(v11);

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityBodyLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_itemLayoutContext,  (uint64_t *)&unk_1002E1D40);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_pageTraits));
  sub_1000077E0((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_pageGrid, &qword_1002EA410);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_actionButtons));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_reusePool;
  uint64_t v4 = sub_1000038E8(&qword_1002E6DF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyText));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_actions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_focusGuide));
}

@end