@interface RPCBatchQuery
+ (id)fetchRequest;
@end

@implementation RPCBatchQuery

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"RPCBatchQuery");
}

@end