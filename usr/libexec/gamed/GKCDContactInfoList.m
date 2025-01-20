@interface GKCDContactInfoList
+ (id)fetchRequest;
@end

@implementation GKCDContactInfoList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"ContactInfoList");
}

@end