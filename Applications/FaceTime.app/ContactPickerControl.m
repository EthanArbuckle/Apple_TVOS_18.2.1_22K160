@interface ContactPickerControl
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC8FaceTime20ContactPickerControl)init;
- (_TtC8FaceTime20ContactPickerControl)initWithCoder:(id)a3;
- (_TtC8FaceTime20ContactPickerControl)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation ContactPickerControl

- (_TtC8FaceTime20ContactPickerControl)init
{
  return (_TtC8FaceTime20ContactPickerControl *)sub_100092DB0();
}

- (_TtC8FaceTime20ContactPickerControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100096868((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ContactPickerControl((uint64_t)self, (uint64_t)a2);
  v2 = (char *)v4.receiver;
  -[ContactPickerControl layoutSubviews](&v4, "layoutSubviews");
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8FaceTime20ContactPickerControl_floatingContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v8 = sub_100096AE0((uint64_t)v6, v7);

  return v8;
}

- (BOOL)isSelected
{
  return sub_10009388C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_10009388C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_10001C5D0(0LL, &qword_100115998, &OBJC_CLASS___UIPress_ptr);
  uint64_t v8 = sub_10001C230(&qword_1001159A0, &qword_100115998, &OBJC_CLASS___UIPress_ptr);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  if ((sub_100093A20(v9) & 1) != 0)
  {
    -[ContactPickerControl setHighlighted:](v11, "setHighlighted:", 0LL);

    swift_bridgeObjectRelease(v9);
  }

  else
  {
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    v14.receiver = v11;
    v14.super_class = (Class)type metadata accessor for ContactPickerControl((uint64_t)isa, v13);
    -[ContactPickerControl pressesEnded:withEvent:](&v14, "pressesEnded:withEvent:", isa, v10);

    swift_bridgeObjectRelease(v9);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100093FFC((uint64_t)v6, v7);
}

- (_TtC8FaceTime20ContactPickerControl)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_floatingContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_trailingIconView));
  sub_10001C08C( *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8FaceTime20ContactPickerControl_menuProvider),  *(void *)&self->avatarView[OBJC_IVAR____TtC8FaceTime20ContactPickerControl_menuProvider]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8FaceTime20ContactPickerControl____lazy_storage___allowedPressTypes));
}

@end