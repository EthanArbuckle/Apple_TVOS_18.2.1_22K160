@interface CSDVoucherManagerImpl
- (CSDVoucherManagerImpl)init;
- (CSDVoucherManagerImpl)initWithIdsService:(id)a3;
- (void)sign:(id)a3 as:(id)a4 completion:(id)a5;
- (void)verify:(id)a3 completion:(id)a4;
@end

@implementation CSDVoucherManagerImpl

- (CSDVoucherManagerImpl)initWithIdsService:(id)a3
{
  return (CSDVoucherManagerImpl *)sub_1000832F0(a3);
}

- (void)sign:(id)a3 as:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v14 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  _Block_copy(v8);
  sub_100085BE8(v11, v13, v10, (char *)v14, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10000BE18(v11, v13);
}

- (void)verify:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100086158(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (CSDVoucherManagerImpl)init
{
  result = (CSDVoucherManagerImpl *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_NeighborhoodActivityConduitService.VoucherManagerImpl",  63LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDVoucherManagerImpl_vouchingEnablement));
  sub_10000F2F0((Class *)((char *)&self->super.isa + OBJC_IVAR___CSDVoucherManagerImpl_idsService));
  sub_10000F2F0((Class *)((char *)&self->super.isa + OBJC_IVAR___CSDVoucherManagerImpl_idsPushHandler));
  v3 = (char *)self + OBJC_IVAR___CSDVoucherManagerImpl_timeout;
  uint64_t v4 = type metadata accessor for DispatchTimeInterval(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end