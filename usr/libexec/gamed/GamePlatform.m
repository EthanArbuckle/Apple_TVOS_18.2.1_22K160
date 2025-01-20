@interface GamePlatform
+ (id)fetchRequest;
@end

@implementation GamePlatform

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GamePlatform");
}

@end