@interface KTSelfState
+ (id)fetchRequest;
@end

@implementation KTSelfState

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTSelfState");
}

@end