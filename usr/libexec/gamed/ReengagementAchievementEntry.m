@interface ReengagementAchievementEntry
+ (id)fetchRequest;
@end

@implementation ReengagementAchievementEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"ReengagementAchievementEntry");
}

@end