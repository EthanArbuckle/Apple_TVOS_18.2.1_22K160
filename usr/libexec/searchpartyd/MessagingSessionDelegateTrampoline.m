@interface MessagingSessionDelegateTrampoline
- (_TtC12searchpartyd34MessagingSessionDelegateTrampoline)init;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
@end

@implementation MessagingSessionDelegateTrampoline

- (void)sessionStarted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100769600();
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_100769804(v6, (uint64_t)a5);
}

- (_TtC12searchpartyd34MessagingSessionDelegateTrampoline)init
{
  result = (_TtC12searchpartyd34MessagingSessionDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.MessagingSessionDelegateTrampoline",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end