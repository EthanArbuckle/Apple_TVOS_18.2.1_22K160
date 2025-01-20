@interface KTDeleteOptInOperation
- (_TtC13transparencyd22KTDeleteOptInOperation)init;
- (void)groupStart;
@end

@implementation KTDeleteOptInOperation

- (void)groupStart
{
  v2 = self;
  KTDeleteOptInOperation.groupStart()();
}

- (_TtC13transparencyd22KTDeleteOptInOperation)init
{
  result = (_TtC13transparencyd22KTDeleteOptInOperation *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTDeleteOptInOperation",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd22KTDeleteOptInOperation_context));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd22KTDeleteOptInOperation_recordID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd22KTDeleteOptInOperation_deletedRecordID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd22KTDeleteOptInOperation_database));
}

@end