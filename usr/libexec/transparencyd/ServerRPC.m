@interface ServerRPC
+ (id)fetchRequest;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (id)batchQuery;
- (id)singleQuery;
- (unint64_t)getUnsigned:(SEL)a3;
@end

@implementation ServerRPC

- (id)batchQuery
{
  if (-[ServerRPC rpcType](self, "rpcType") == (id)1) {
    v3 = self;
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"ServerRPC");
}

- (id)singleQuery
{
  if (-[ServerRPC rpcType](self, "rpcType")) {
    v3 = 0LL;
  }
  else {
    v3 = self;
  }
  return v3;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001D6330(self, a3);
}

@end