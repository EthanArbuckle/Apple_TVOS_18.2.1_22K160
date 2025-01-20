@interface KTRequestFailure
+ (id)fetchRequest;
@end

@implementation KTRequestFailure

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestFailure");
}

@end