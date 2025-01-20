@interface GKCDContactInfo
+ (id)fetchRequest;
@end

@implementation GKCDContactInfo

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"ContactInfo");
}

@end