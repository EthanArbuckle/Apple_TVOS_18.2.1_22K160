@interface PushNotification
+ (id)entityFromContext:(id)a3;
@end

@implementation PushNotification

+ (id)entityFromContext:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  @"PushNotification");
}

@end