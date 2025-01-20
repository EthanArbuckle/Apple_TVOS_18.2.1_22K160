@interface SRCarPlayCardViewController
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
@end

@implementation SRCarPlayCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10004A3CC();
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = qword_1000D8A20;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_10004ADF0(v7, (uint64_t)qword_1000D9988);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  sub_1000681D8(v8, 0x10uLL, 0xD000000000000017LL, 0x8000000100089620LL, 0xD000000000000036LL, 0x8000000100089640LL);
  uint64_t v9 = *(uint64_t *)((char *)&v6->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate);
  uint64_t v10 = *(void *)&v6->super.isRightHandDrive[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate];
  uint64_t ObjectType = swift_getObjectType(v9);
  v12 = *(void (**)(_TtC4Siri27SRCarPlayCardViewController *, uint64_t, uint64_t))(v10 + 24);
  swift_unknownObjectRetain(v9);
  v12(v6, ObjectType, v10);

  swift_unknownObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardSnippet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_widthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_heightConstraint));
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10004ABF4(width, height);
}

@end