@interface KTFailureEvent
+ (id)fetchRequest;
@end

@implementation KTFailureEvent

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTFailureEvent");
}

@end