@interface KTRequestID
+ (id)fetchRequest;
@end

@implementation KTRequestID

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"KTRequestID");
}

@end