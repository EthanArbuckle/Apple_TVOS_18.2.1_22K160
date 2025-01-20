@interface RunLoop
- (_TtC14amsengagementd7RunLoop)init;
- (void)runUntilIdleExit;
@end

@implementation RunLoop

- (void)runUntilIdleExit
{
  v2 = self;
  sub_10010D6A8();
}

- (_TtC14amsengagementd7RunLoop)init
{
  return (_TtC14amsengagementd7RunLoop *)sub_10010E920();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14amsengagementd7RunLoop_terminationSignalSource));
}

@end