@interface PagingArrow
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PagingArrow

- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow_visualEffectBackground;
  id v6 = objc_allocWithZone(&OBJC_CLASS___UIVisualEffectView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow_arrowImageView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone(UIImageView) init];

  result = (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/HeroCarouselCollectionViewCell.swift",  45LL,  2LL,  516LL,  0);
  __break(1u);
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_1002E10B8;
  v4 = self;
  if (v3 != -1) {
    swift_once(&qword_1002E10B8, sub_1001C9F44);
  }
  unsigned __int128 v5 = xmmword_1002EF528;

  *(void *)&double v7 = v5 >> 64;
  *(void *)&double v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PagingArrow();
  v2 = (char *)v10.receiver;
  -[PagingArrow layoutSubviews](&v10, "layoutSubviews");
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow_visualEffectBackground];
  objc_msgSend(v2, "bounds", v10.receiver, v10.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow_arrowImageView];
  [v4 sizeToFit];
  [v2 bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  objc_msgSend(v4, "setCenter:", MidX, CGRectGetMidY(v12));
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1001CA4BC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1001CA590((uint64_t)a3);
}

- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.PagingArrow",  20LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow_visualEffectBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D311PagingArrow_arrowImageView));
}

@end