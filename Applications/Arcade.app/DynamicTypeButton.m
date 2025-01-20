@interface DynamicTypeButton
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade17DynamicTypeButton)initWithCoder:(id)a3;
- (_TtC6Arcade17DynamicTypeButton)initWithFrame:(CGRect)a3;
- (void)didTriggerPrimaryAction:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeButton

- (_TtC6Arcade17DynamicTypeButton)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade17DynamicTypeButton *)sub_100100E3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade17DynamicTypeButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100102D0C();
}

  ;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_100101444(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_1001017DC(v6, (uint64_t)v7);
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DynamicTypeButton(0LL);
  id v2 = v5.receiver;
  -[DynamicTypeButton tintColorDidChange](&v5, "tintColorDidChange");
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC6Arcade17DynamicTypeButton_titleColorFollowsTintColor) == 1)
  {
    id v3 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
    [v2 setTitleColor:v3 forState:0];

    uint64_t v4 = UIView.highlightedTintColor.getter();
    [v2 setTitleColor:v4 forState:1];

    id v2 = (id)v4;
  }
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3 = sub_100102320( self,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  (uint64_t)a2,  (double (*)(double, double, double, double))sub_100101B10);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3 = sub_100102320( self,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  (uint64_t)a2,  (double (*)(double, double, double, double))sub_100101F58);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10010239C((uint64_t)a3);
}

- (void)didTriggerPrimaryAction:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade17DynamicTypeButton_primaryActionHandler);
  if (v3)
  {
    uint64_t v5 = *(void *)&self->fontUseCaseContentSizeCategory[OBJC_IVAR____TtC6Arcade17DynamicTypeButton_primaryActionHandler];
    id v6 = a3;
    double v8 = self;
    uint64_t v7 = sub_100017A40((uint64_t)v3, v5);
    v3(v7);
    sub_10000D3D8((uint64_t)v3, v5);
  }

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade17DynamicTypeButton_fontUseCaseContentSizeCategory));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade17DynamicTypeButton_fontUseCase, &qword_1002DE930);
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade17DynamicTypeButton_primaryActionHandler),  *(void *)&self->fontUseCaseContentSizeCategory[OBJC_IVAR____TtC6Arcade17DynamicTypeButton_primaryActionHandler]);
}

@end