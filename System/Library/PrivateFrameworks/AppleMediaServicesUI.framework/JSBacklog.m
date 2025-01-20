@interface JSBacklog
- (_TtC14amsengagementd9JSBacklog)init;
- (id)lookup:(id)a3 :(id)a4 :(id)a5 :(id)a6;
@end

@implementation JSBacklog

- (id)lookup:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  v15 = (void *)sub_100081A80((uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13);

  return v15;
}

- (_TtC14amsengagementd9JSBacklog)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd9JSBacklog_config];
  uint64_t v3 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd9JSBacklog_config + 24];
  swift_bridgeObjectRelease(*(void *)&self->config[OBJC_IVAR____TtC14amsengagementd9JSBacklog_config + 40]);

  swift_bridgeObjectRelease(v3);
}

@end