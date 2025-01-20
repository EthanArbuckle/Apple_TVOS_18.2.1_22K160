@interface PushNotificationClient
+ (id)entityFromContext:(id)a3;
@end

@implementation PushNotificationClient

+ (id)entityFromContext:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  @"PushNotificationClient");
}

@end