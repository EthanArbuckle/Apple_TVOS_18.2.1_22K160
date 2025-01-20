@interface AssetPromise
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NSUUID)requestID;
- (_TtC9appstored12AssetPromise)init;
- (_TtC9appstored12AssetPromise)initWithRequestID:(id)a3 promiseBlock:(id)a4;
- (id)progress;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation AssetPromise

- (NSUUID)requestID
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (id)progress
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored12AssetPromise__progress);
  v3 = (uint64_t *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 32);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_100019A2C(v3, (uint64_t (**)())&aBlock);
  os_unfair_lock_unlock(v4);
  if ((void)aBlock)
  {
    __int128 v9 = aBlock;
    uint64_t v6 = swift_allocObject(&unk_1003DCA68, 32LL, 7LL);
    *(_OWORD *)(v6 + 16) = v9;

    v13 = sub_10001B68C;
    uint64_t v14 = v6;
    *(void *)&__int128 aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256LL;
    v11 = sub_1000198F8;
    v12 = &unk_1003DCA80;
    v7 = _Block_copy(&aBlock);
    swift_release(v14);
    return v7;
  }

  else
  {

    return 0LL;
  }

- (void)setProgress:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (void *)swift_allocObject(&unk_1003DC9F0, 24LL, 7LL);
    uint64_t v6 = (uint64_t)v4;
    v4[2] = v5;
    v7 = sub_10001B660;
  }

  else
  {
    v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  __chkstk_darwin(v4);
  __int128 v9 = (uint64_t *)(v8 + 16);
  v10 = (os_unfair_lock_s *)(v8 + 32);
  v11 = self;
  os_unfair_lock_lock(v10);
  sub_10001B648(v9);
  os_unfair_lock_unlock(v10);
  sub_10001527C((uint64_t)v7, v6);
}

- (BOOL)isCancelled
{
  return sub_100019C7C( (char *)self,  (uint64_t)a2,  (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *))sub_100019B8C);
}

- (BOOL)isFinished
{
  return sub_100019C7C( (char *)self,  (uint64_t)a2,  (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *))sub_100019CFC);
}

- (_TtC9appstored12AssetPromise)initWithRequestID:(id)a3 promiseBlock:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v9 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = swift_allocObject(&unk_1003DC9C8, 24LL, 7LL);
  *(void *)(v10 + 16) = v9;
  return (_TtC9appstored12AssetPromise *)sub_100019D10((uint64_t)v8, (uint64_t)sub_10001B638, v10);
}

- (void)addErrorBlock:(id)a3
{
}

- (void)addFinishBlock:(id)a3
{
}

- (void)addSuccessBlock:(id)a3
{
}

- (void)cancel
{
  uint64_t v3 = type metadata accessor for CancellationError(0LL);
  unint64_t v4 = sub_10001AD34();
  v5 = (void *)swift_allocError(v3, v4, 0LL, 0LL);
  uint64_t v6 = self;
  CancellationError.init()();
  sub_10001A384(v5, 1);
  swift_errorRelease(v5);
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_10001A384(a3, 1);
}

- (void)finishWithResult:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10001A384(a3, 0);
}

- (_TtC9appstored12AssetPromise)init
{
  result = (_TtC9appstored12AssetPromise *)_swift_stdlib_reportUnimplementedInitializer( "appstored.AssetPromise",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9appstored12AssetPromise_requestID;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored12AssetPromise__progress));
}

@end