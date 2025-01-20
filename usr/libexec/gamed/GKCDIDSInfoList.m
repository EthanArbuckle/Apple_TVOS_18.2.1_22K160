@interface GKCDIDSInfoList
+ (id)fetchRequest;
@end

@implementation GKCDIDSInfoList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"IDSInfoList");
}

@end