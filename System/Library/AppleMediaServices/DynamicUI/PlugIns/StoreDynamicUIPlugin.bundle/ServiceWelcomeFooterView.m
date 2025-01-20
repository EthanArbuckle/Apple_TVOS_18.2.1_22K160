@interface ServiceWelcomeFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceWelcomeFooterView

- (_TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView *)sub_9DFF8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9E23C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_9E2C0((uint64_t)a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_9E50C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_9EC54((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_9EA30(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)didTapButton:(id)a3
{
  if (a3)
  {
    id v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v8, 0, sizeof(v8));
    double v7 = self;
  }

  sub_9EB20((uint64_t)v8);

  sub_ACC4((uint64_t)v8, &qword_F6300);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButton));
  sub_AC90( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler),  *(void *)&self->actionButton[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler]);
}

@end