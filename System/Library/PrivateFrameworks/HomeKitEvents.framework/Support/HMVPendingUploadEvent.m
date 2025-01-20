@interface HMVPendingUploadEvent
- (HMVPendingUploadEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation HMVPendingUploadEvent

- (HMVPendingUploadEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PendingUploadEvent();
  return -[HMVPendingUploadEvent initWithEntity:insertIntoManagedObjectContext:]( &v7,  "initWithEntity:insertIntoManagedObjectContext:",  a3,  a4);
}

@end