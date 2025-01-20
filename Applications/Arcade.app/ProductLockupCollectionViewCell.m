@interface ProductLockupCollectionViewCell
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)accessibilityStandardBadges;
- (NSArray)accessibilityTextualBadges;
- (NSArray)preferredFocusEnvironments;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC6Arcade11OfferButton)accessibilityOfferButton;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityDescriptionHeaderLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityDescriptionTextLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityOfferSubtitleLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityOfferTopLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductLockupCollectionViewCell

- (_TtC6Arcade31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade31ProductLockupCollectionViewCell *)sub_10009B468( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10009C554();
}

- (BOOL)canBecomeFocused
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButton) isFocused] ^ 1;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_1000031E8((uint64_t *)&unk_1002DE0F0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_100233570;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButton);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()(v4);
  id v6 = v5;
  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10009CAD8(v4);

  return self & 1;
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_logoView));
}

- (_TtC6Arcade11OfferButton)accessibilityOfferButton
{
  return (_TtC6Arcade11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                             + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButton));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButtonSubtitleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityOfferTopLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButtonTopLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityDescriptionHeaderLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_descriptionHeaderLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityDescriptionTextLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_descriptionTextLabel));
}

- (NSArray)accessibilityTextualBadges
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_textualBadges);
  type metadata accessor for DynamicTypeLabel(0LL);
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (NSArray)accessibilityStandardBadges
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_standardBadges);
  sub_100006028(0LL, (unint64_t *)&qword_1002DF5F0, &OBJC_CLASS___UIView_ptr);
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_headerContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_detailsContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_headerTitleLabel));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_logoViewTemplateURLString]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_headerLogoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_logoView));
  sub_10009DB84((Class *)((char *)&self->super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_titleStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_descriptionHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_descriptionTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButtonSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_offerButtonTopLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_standardBadges));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_textualBadges));
  sub_10009DBB8((Class *)((char *)&self->super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_layoutMetrics));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade31ProductLockupCollectionViewCell_bannerAction));
}

@end