@interface TVLockupView
- (CGRect)jet_focusedFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade12TVLockupView)initWithCoder:(id)a3;
- (_TtC6Arcade12TVLockupView)initWithFrame:(CGRect)a3;
- (_TtC6Arcade16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVLockupView

- (_TtC6Arcade12TVLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade12TVLockupView *)sub_100163834(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade12TVLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10016452C((uint64_t)v3, v4);
}

  ;
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  char v3 = ArtworkView.adjustsImageWhenAncestorFocused.getter(v2);
  id v4 = -[TVLockupView frame](v2, "frame");
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if ((v3 & 1) != 0)
  {
    v23.origin.CGFloat x = ArtworkView.focusedFrame.getter(v4);
    v23.origin.CGFloat y = v13;
    v23.size.CGFloat width = v14;
    v23.size.CGFloat height = v15;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectUnion(v20, v23);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100163D60();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC6Arcade12TVLockupView_metrics);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade12TVLockupView_metrics, v13, 0LL, 0LL);
  sub_100008954(v4, v12);
  double v5 = self;
  double v7 = sub_100132D00(v12, v5, v6);
  double v9 = v8;
  sub_10002D7E8(v12);

  double v10 = v7;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  id v4 = v8.receiver;
  id v5 = a3;
  -[TVLockupView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    sub_100163FC8(*((_BYTE *)v4 + OBJC_IVAR____TtC6Arcade12TVLockupView_state));
  }
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade12TVLockupView_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade12TVLockupView_subtitleLabel));
}

- (void).cxx_destruct
{
}

@end