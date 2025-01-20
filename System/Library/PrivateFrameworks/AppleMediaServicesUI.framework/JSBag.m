@interface JSBag
- (_TtC14amsengagementd5JSBag)init;
- (id)BOOLean:(id)a3;
- (id)array:(id)a3;
- (id)dictionary:(id)a3;
- (id)double:(id)a3;
- (id)integer:(id)a3;
- (id)string:(id)a3;
- (id)url:(id)a3;
@end

@implementation JSBag

- (id)string:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_1000854CC);

  return v6;
}

- (id)double:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_1000854B4);

  return v6;
}

- (id)integer:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_10008549C);

  return v6;
}

- (id)BOOLean:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_100085484);

  return v6;
}

- (id)array:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_100085454);

  return v6;
}

- (id)dictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_100085424);

  return v6;
}

- (id)url:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000845E8((uint64_t)v4, (uint64_t)sub_10008536C);

  return v6;
}

- (_TtC14amsengagementd5JSBag)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC14amsengagementd5JSBag_bag;
  uint64_t v3 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end