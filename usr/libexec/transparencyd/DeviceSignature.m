@interface DeviceSignature
+ (id)fetchRequest;
@end

@implementation DeviceSignature

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"DeviceSignature");
}

@end