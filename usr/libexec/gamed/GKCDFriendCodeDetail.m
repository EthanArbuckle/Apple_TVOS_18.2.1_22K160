@interface GKCDFriendCodeDetail
+ (id)fetchRequest;
@end

@implementation GKCDFriendCodeDetail

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"GKCDFriendCodeDetail");
}

@end