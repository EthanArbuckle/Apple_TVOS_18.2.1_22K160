@interface AppSearchResultContentView
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore26AppSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore26AppSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppSearchResultContentView

- (_TtC8AppStore26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26AppSearchResultContentView *)sub_100017354( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001CE44();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100017514();
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_pillView));
}

@end