@interface SDNearbyPeerPaymentReceiverCoordinator
+ (BOOL)nearbyReceiverIsEligible;
+ (id)verifyReceiverEligibility;
- (PKNearbyPeerPaymentReceiverCoordinator)coordinator;
- (SDNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3;
- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completion:(id)a4;
- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4;
- (void)setCoordinator:(id)a3;
@end

@implementation SDNearbyPeerPaymentReceiverCoordinator

+ (id)verifyReceiverEligibility
{
  else {
    return  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NearbyPeerPaymentError",  1LL,  0LL);
  }
}

+ (BOOL)nearbyReceiverIsEligible
{
  return [sub_100093B3C() nearbyReceiverIsEligible];
}

- (SDNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDNearbyPeerPaymentReceiverCoordinator;
  v5 = -[SDNearbyPeerPaymentReceiverCoordinator init](&v9, "init");
  if (v5)
  {
    v6 = (PKNearbyPeerPaymentReceiverCoordinator *)[objc_alloc((Class)sub_100093B3C()) initWithSenderMetadata:v4];
    coordinator = v5->_coordinator;
    v5->_coordinator = v6;
  }

  return v5;
}

- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyPeerPaymentReceiverCoordinator coordinator](self, "coordinator"));
  [v8 recipientMetadataWithContactID:v7 completion:v6];
}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyPeerPaymentReceiverCoordinator coordinator](self, "coordinator"));
  [v8 nearbyReceiverRequiresConfirmationWithContactID:v7 completionHandler:v6];
}

- (PKNearbyPeerPaymentReceiverCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end