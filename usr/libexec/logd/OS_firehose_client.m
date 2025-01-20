@interface OS_firehose_client
- (OS_firehose_client)init;
- (id)debugDescription;
- (void)dealloc;
@end

@implementation OS_firehose_client

- (OS_firehose_client)init
{
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_firehose_client;
  -[OS_firehose_client dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  return 0LL;
}

@end