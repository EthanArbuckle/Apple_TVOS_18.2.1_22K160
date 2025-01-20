@interface ProductLockupCollectionViewCell
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)accessibilityStandardBadges;
- (NSArray)accessibilityTextualBadges;
- (NSArray)preferredFocusEnvironments;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionHeaderLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionTextLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityOfferSubtitleLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityOfferTopLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductLockupCollectionViewCell

- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ProductLockupCollectionViewCell *)sub_1000A36A0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000A478C();
}

- (BOOL)canBecomeFocused
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton) isFocused] ^ 1;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_1000038E8((uint64_t *)&unk_1002E1CF0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_100236BD0;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()(v4);
  id v6 = v5;
  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000A4D10(v4);

  return self & 1;
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_logoView));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButtonSubtitleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityOfferTopLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButtonTopLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionHeaderLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_descriptionHeaderLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionTextLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_descriptionTextLabel));
}

- (NSArray)accessibilityTextualBadges
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_textualBadges);
  type metadata accessor for DynamicTypeLabel(0LL);
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (NSArray)accessibilityStandardBadges
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_standardBadges);
  sub_10000DFD4(0LL, (unint64_t *)&qword_1002E27B0, &OBJC_CLASS___UIView_ptr);
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_headerContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_detailsContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_headerTitleLabel));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_logoViewTemplateURLString]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_headerLogoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_logoView));
  sub_1000A5DBC((Class *)((char *)&self->super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_descriptionHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_descriptionTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButtonSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButtonTopLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_standardBadges));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_textualBadges));
  sub_1000A5DF0((Class *)((char *)&self->super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_layoutMetrics));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_bannerAction));
}

@end