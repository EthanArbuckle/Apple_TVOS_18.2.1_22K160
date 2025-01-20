@interface GKCDGameSettings
+ (id)fetchRequest;
@end

@implementation GKCDGameSettings

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDGameSettings");
}

@end