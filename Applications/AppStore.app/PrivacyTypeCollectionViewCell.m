@interface PrivacyTypeCollectionViewCell
- (BOOL)canBecomeFocused;
- (NSArray)accessibilityCategoryViews;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)layoutSubviews;
- (void)lowMemoryWarning:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PrivacyTypeCollectionViewCell

- (_TtC8AppStore29PrivacyTypeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29PrivacyTypeCollectionViewCell *)sub_100021550();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10001FF5C();
}

- (BOOL)canBecomeFocused
{
  v2 = self;
  char v3 = sub_1000206F4();

  return v3 & 1;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self);
  id v6 = v11.receiver;
  id v7 = a4;
  id v8 =  -[PrivacyTypeCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:]( &v11,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v7);
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
  v2 = self;
  sub_100020B20();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100020C78((uint64_t)a3);
}

- (void)lowMemoryWarning:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryReusePool,  v11,  33LL,  0LL);
  v9 = self;
  sub_1000038E8(&qword_1002E25B8);
  ReusePool.drain()();
  swift_endAccess(v11);

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_detailLabel));
}

- (NSArray)accessibilityCategoryViews
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryViews, v6, 0LL, 0LL);
  uint64_t v3 = *v2;
  type metadata accessor for PrivacyCategoryView();
  swift_bridgeObjectRetain(v3);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_detailLabel));
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_itemLayoutContext,  (uint64_t *)&unk_1002E1D40);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_pageTraits));
  sub_1000077E0((uint64_t)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_pageGrid, &qword_1002EA410);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_artwork));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categories));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_categoryReusePool;
  uint64_t v4 = sub_1000038E8(&qword_1002E25B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8AppStore29PrivacyTypeCollectionViewCell_style;
  uint64_t v6 = type metadata accessor for PrivacyTypeStyle(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

@end