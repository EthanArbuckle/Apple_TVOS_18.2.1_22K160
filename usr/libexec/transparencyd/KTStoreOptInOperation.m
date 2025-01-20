@interface KTStoreOptInOperation
- (_TtC13transparencyd21KTStoreOptInOperation)init;
- (void)groupStart;
@end

@implementation KTStoreOptInOperation

- (void)groupStart
{
  v2 = self;
  KTStoreOptInOperation.groupStart()();
}

- (_TtC13transparencyd21KTStoreOptInOperation)init
{
  result = (_TtC13transparencyd21KTStoreOptInOperation *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTStoreOptInOperation",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_context));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_records));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_storedRecords));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_database));
  swift_bridgeObjectRelease(*(id *)((char *)&self->super.super.super.super._private
                                  + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_type));
}

@end