@interface GKSupportedTransportVersionCacheObject
+ (id)fetchRequest;
@end

@implementation GKSupportedTransportVersionCacheObject

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"SupportedTransportVersion");
}

@end