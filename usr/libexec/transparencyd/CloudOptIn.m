@interface CloudOptIn
+ (id)fetchRequest;
@end

@implementation CloudOptIn

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CloudOptIn");
}

@end