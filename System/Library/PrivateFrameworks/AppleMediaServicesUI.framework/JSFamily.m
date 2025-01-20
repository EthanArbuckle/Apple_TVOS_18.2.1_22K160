@interface JSFamily
- (_TtC14amsengagementd8JSFamily)init;
- (id)lookUpEligibility:(id)a3;
- (id)lookup:(id)a3;
@end

@implementation JSFamily

- (id)lookup:(id)a3
{
  return sub_10009517C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_100092DC4);
}

- (id)lookUpEligibility:(id)a3
{
  return sub_10009517C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1000940A8);
}

- (_TtC14amsengagementd8JSFamily)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14amsengagementd8JSFamily_config;
  v4 = *(void **)&self->accountStore[OBJC_IVAR____TtC14amsengagementd8JSFamily_config];
  uint64_t v5 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd8JSFamily_config + 16];
  swift_bridgeObjectRelease(*((void *)v3 + 6));

  swift_bridgeObjectRelease(v5);
}

@end