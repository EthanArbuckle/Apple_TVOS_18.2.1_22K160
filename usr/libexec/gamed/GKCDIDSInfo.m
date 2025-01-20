@interface GKCDIDSInfo
+ (id)fetchRequest;
@end

@implementation GKCDIDSInfo

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"IDSInfo");
}

@end