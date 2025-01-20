@interface KTNetworkTimeoutBucket
- (NSString)sysdiagnose;
- (_TtC13transparencyd22KTNetworkTimeoutBucket)init;
- (id)networkTimeoutOperation;
- (id)onQueueNetworkTimeoutOperation;
- (void)networkWithFeedback:(int64_t)a3;
@end

@implementation KTNetworkTimeoutBucket

- (_TtC13transparencyd22KTNetworkTimeoutBucket)init
{
  return (_TtC13transparencyd22KTNetworkTimeoutBucket *)KTNetworkTimeoutBucket.init()();
}

- (NSString)sysdiagnose
{
  v6[2] = self;
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)(sub_1000C92E0, v6, &type metadata for String);

  uint64_t v3 = v6[5];
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (id)networkTimeoutOperation
{
  v5[2] = self;
  v2 = self;
  uint64_t v3 = sub_100072CC4(&qword_1002E1910);
  OS_dispatch_queue.sync<A>(execute:)(sub_1000C8748, v5, v3);

  return (id)v5[5];
}

- (id)onQueueNetworkTimeoutOperation
{
  v2 = self;
  uint64_t v3 = (void *)KTNetworkTimeoutBucket.onQueueNetworkTimeoutOperation()();

  return v3;
}

- (void)networkWithFeedback:(int64_t)a3
{
  NSString v4 = self;
  KTNetworkTimeoutBucket.network(feedback:)(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd22KTNetworkTimeoutBucket_networkTimeout));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13transparencyd22KTNetworkTimeoutBucket_networkTimeoutDependency));
}

@end