@interface GKCDLoadedGame
+ (id)fetchRequest;
@end

@implementation GKCDLoadedGame

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDLoadedGame");
}

@end