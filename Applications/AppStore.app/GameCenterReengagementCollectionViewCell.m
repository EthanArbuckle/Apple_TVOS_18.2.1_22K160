@interface GameCenterReengagementCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GameCenterReengagementCollectionViewCell

- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore40GameCenterReengagementCollectionViewCell *)sub_1001DC000( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001DD550();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001DCC14();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_1001DD188(x, y, width, height);

  sub_1000038E8((uint64_t *)&unk_1002E4E00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_pageTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_badgeGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_badge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_heroContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_lockup));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_visualEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_backgroundImage));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore40GameCenterReengagementCollectionViewCell_customBackgroundBlur));
}

@end