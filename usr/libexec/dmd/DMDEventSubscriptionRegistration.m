@interface DMDEventSubscriptionRegistration
+ (BOOL)automaticallyNotifiesObserversOfPayloadMetadata;
+ (id)fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:(id)a3 payloadIdentifier:(id)a4;
- (id)identifier;
- (void)setPayloadMetadata:(id)a3;
@end

@implementation DMDEventSubscriptionRegistration

- (id)identifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistration payloadMetadata](self, "payloadMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 organization]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistration payloadMetadata](self, "payloadMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v5, v7));

  return v8;
}

+ (BOOL)automaticallyNotifiesObserversOfPayloadMetadata
{
  return 0;
}

- (void)setPayloadMetadata:(id)a3
{
  id v4 = a3;
  -[DMDEventSubscriptionRegistration willChangeValueForKey:](self, "willChangeValueForKey:", @"payloadMetadata");
  -[DMDEventSubscriptionRegistration setPrimitiveValue:forKey:]( self,  "setPrimitiveValue:forKey:",  v4,  @"payloadMetadata");

  -[DMDEventSubscriptionRegistration didChangeValueForKey:](self, "didChangeValueForKey:", @"payloadMetadata");
}

+ (id)fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:(id)a3 payloadIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMDEventSubscriptionRegistration fetchRequest]( &OBJC_CLASS___DMDEventSubscriptionRegistration,  "fetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"payloadMetadata.organization.identifier = %@ AND payloadMetadata.identifier = %@",  v6,  v5));

  [v7 setPredicate:v8];
  return v7;
}

@end