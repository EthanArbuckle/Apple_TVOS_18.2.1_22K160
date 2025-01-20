@interface PDPendingProvisioningManager
- (BOOL)hasPendingProvisioningsOfTypes:(id)a3;
- (BOOL)isTrackingProvisioningOfPass:(id)a3;
- (BOOL)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 success:(BOOL)a5;
- (PDPendingProvisioningManager)init;
- (PDPendingProvisioningManager)initWithDatabaseManager:(id)a3 applicationMessageManager:(id)a4 webServiceCoordinator:(id)a5 carKeyRequirementsChecker:(id)a6 peerPaymentWebServiceCoordinator:(id)a7 notificationStreamManager:(id)a8 cloudStoreCoordinator:(id)a9 sharingChannelManager:(id)a10 notificationManager:(id)a11;
- (PDPendingProvisioningManagerDelegate)delegate;
- (id)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4;
- (id)retrievePendingProvisioningsOfType:(id)a3;
- (void)passAddedOrUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)storePendingProvisioning:(id)a3;
@end

@implementation PDPendingProvisioningManager

- (PDPendingProvisioningManagerDelegate)delegate
{
  return (PDPendingProvisioningManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR___PDPendingProvisioningManager_delegate,  a2);
}

- (void)setDelegate:(id)a3
{
}

- (PDPendingProvisioningManager)init
{
}

- (PDPendingProvisioningManager)initWithDatabaseManager:(id)a3 applicationMessageManager:(id)a4 webServiceCoordinator:(id)a5 carKeyRequirementsChecker:(id)a6 peerPaymentWebServiceCoordinator:(id)a7 notificationStreamManager:(id)a8 cloudStoreCoordinator:(id)a9 sharingChannelManager:(id)a10 notificationManager:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  swift_unknownObjectRetain(a9);
  return (PDPendingProvisioningManager *)sub_10041812C( v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)a9,  a10,  a11);
}

- (void)storePendingProvisioning:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100418E70(v4);
}

- (id)retrievePendingProvisioningsOfType:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = self;
  uint64_t v8 = sub_100419C7C(v4, v6);

  swift_bridgeObjectRelease(v6);
  if (v8)
  {
    sub_100424A90(0LL, &qword_100706E38, &OBJC_CLASS___PKPendingProvisioning_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    v9.super.isa = 0LL;
  }

  return v9.super.isa;
}

- (id)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4
{
  uint64_t v7 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  uint64_t v9 = v8;
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_databaseManager);
  v11 = self;
  NSString v12 = String._bridgeToObjectiveC()();
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v10 pendingProvisioningOfType:v12 withUniqueIdentifier:v13];

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v9);

  return v14;
}

- (BOOL)hasPendingProvisioningsOfTypes:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_databaseManager);
  uint64_t v6 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  LOBYTE(v5) = [v5 hasPendingProvisioningsOfTypes:isa];

  swift_bridgeObjectRelease(v4);
  return (char)v5;
}

- (BOOL)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 success:(BOOL)a5
{
  uint64_t v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  uint64_t v11 = v10;
  NSString v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_databaseManager);
  NSString v13 = self;
  NSString v14 = String._bridgeToObjectiveC()();
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v12 pendingProvisioningOfType:v14 withUniqueIdentifier:v15];

  if (v16)
  {
    sub_100419F30(v16, a5);
    char v18 = v17;

    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v11);
  }

  else
  {

    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v11);
    char v18 = 0;
  }

  return v18 & 1;
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10041A6EC(v4);
}

- (BOOL)isTrackingProvisioningOfPass:(id)a3
{
  v3 = self;
  id v4 = (os_unfair_lock_s *)&(*(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_taskLock))[2];
  id v5 = a3;
  uint64_t v6 = v3;
  os_unfair_lock_lock(v4);
  sub_10041B128((uint64_t)v6, v5, &v8);
  LOBYTE(v3) = v8;
  os_unfair_lock_unlock(v4);

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PDPendingProvisioningManager_peerPaymentWebServiceCoordinator));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___PDPendingProvisioningManager_cloudStoreCoordinator));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PDPendingProvisioningManager_pendingProvisioningMessageManager));
  sub_100424C0C((uint64_t)self + OBJC_IVAR___PDPendingProvisioningManager_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_taskLock));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_taskState);
  uint64_t v4 = *(void *)&self->databaseManager[OBJC_IVAR___PDPendingProvisioningManager_taskState];
  swift_bridgeObjectRelease(*(void *)&self->webServiceCoordinator[OBJC_IVAR___PDPendingProvisioningManager_taskState]);
  swift_bridgeObjectRelease(v4);
  swift_release(v3);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___PDPendingProvisioningManager_passPersonalizationTimer));
}

@end