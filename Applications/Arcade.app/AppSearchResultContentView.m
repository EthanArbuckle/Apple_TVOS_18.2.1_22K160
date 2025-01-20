@interface AppSearchResultContentView
- (_TtC6Arcade15SmallLockupView)accessibilityLockupView;
- (_TtC6Arcade26AppSearchResultContentView)initWithCoder:(id)a3;
- (_TtC6Arcade26AppSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppSearchResultContentView

- (_TtC6Arcade26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade26AppSearchResultContentView *)sub_1000190F4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001EBD8();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000192B4();
}

- (_TtC6Arcade15SmallLockupView)accessibilityLockupView
{
  return (_TtC6Arcade15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                 + OBJC_IVAR____TtC6Arcade26AppSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26AppSearchResultContentView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26AppSearchResultContentView_pillView));
}

@end