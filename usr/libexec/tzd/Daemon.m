@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC3tzd6Daemon)init;
- (void)isUpdateWaitingWithReply:(id)a3;
- (void)purgeAllAssetsWithReply:(id)a3;
@end

@implementation Daemon

- (_TtC3tzd6Daemon)init
{
  return (_TtC3tzd6Daemon *)sub_100012F80();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_1000156A8(v7);

  return v9;
}

- (void)isUpdateWaitingWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_10001D248, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v7 = sub_100015A54;
  }

  else
  {
    id v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  v8 = self;
  sub_100013D44((uint64_t)v7, v6);
  sub_100015A20((uint64_t)v7, v6);
}

- (void)purgeAllAssetsWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = (void (*)(const void *, uint64_t, void))*((void *)v4 + 2);
    id v7 = self;
    v6(v5, 1LL, 0LL);
    _Block_release(v5);
  }

  else
  {
    __break(1u);
  }

- (void).cxx_destruct
{
}

@end