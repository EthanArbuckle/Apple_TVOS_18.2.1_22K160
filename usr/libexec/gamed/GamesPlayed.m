@interface GamesPlayed
+ (id)fetchRequest;
@end

@implementation GamesPlayed

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GamesPlayed");
}

@end