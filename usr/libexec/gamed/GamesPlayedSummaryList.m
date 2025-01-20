@interface GamesPlayedSummaryList
+ (id)fetchRequest;
@end

@implementation GamesPlayedSummaryList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GamesPlayedSummaryList");
}

@end