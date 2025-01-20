@interface CachedData
+ (id)fetchRequest;
@end

@implementation CachedData

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CachedData");
}

@end