@interface ArcadeFooterCollectionViewCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC6Arcade30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeFooterCollectionViewCell

- (_TtC6Arcade30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade30ArcadeFooterCollectionViewCell *)sub_1000EE51C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000EEA14();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC6Arcade30ArcadeFooterCollectionViewCell_buttonView);
  v3 = self;
  if ([v2 isFocused])
  {
    v4 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v5 = sub_1000031E8((uint64_t *)&unk_1002DE0F0);
    uint64_t v6 = swift_allocObject(v5, 40LL, 7LL);
    *(_OWORD *)(v6 + 16) = xmmword_100233570;
    *(void *)(v6 + 32) = v2;
    v10 = (void *)v6;
    specialized Array._endMutation()(v6);
    v4 = v10;
    id v7 = v2;
  }

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (BOOL)canBecomeFocused
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade30ArcadeFooterCollectionViewCell_buttonView) isFocused] ^ 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30ArcadeFooterCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30ArcadeFooterCollectionViewCell_buttonView));
}

@end