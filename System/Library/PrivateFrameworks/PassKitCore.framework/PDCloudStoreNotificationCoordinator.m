@interface PDCloudStoreNotificationCoordinator
- (BOOL)_shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity;
- (BOOL)hasCachedCloudStoreZoneInApplePayContainerForZoneNames:(id)a3;
- (PDApplePayCloudStoreContainer)applePayContainer;
- (PDCloudStoreNotificationCoordinator)initWithPushNotificationManager:(id)a3 sharingIDSManger:(id)a4 databaseManager:(id)a5;
- (PDPassCloudStoreContainer)passContainer;
- (PDPassSyncCloudStoreContainer)passSyncContainer;
- (PDPassSyncCloudStoreContainer)passSyncSecureContainer;
- (double)_nextTimeIntervalForBackgroundInterval:(unint64_t)a3;
- (id)_backgroundActivityNameForBackgroundInterval:(unint64_t)a3;
- (id)_containerForItemType:(unint64_t)a3;
- (id)_containerWithIdentifier:(id)a3;
- (id)_containerWithZoneName:(id)a3 scope:(int64_t)a4;
- (id)_errorWithCode:(int64_t)a3 description:(id)a4;
- (id)changeHistoryForContainerIdentifier:(id)a3;
- (id)passContainerWithName:(id)a3;
- (id)pushNotificationTopics;
- (void)_declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 shouldAlertRecipient:(BOOL)a7 completion:(id)a8;
- (void)_executeNextShareInvitationRequestIfPossible;
- (void)_executeShareInvitationRequest:(id)a3;
- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 shouldScheduleBackgroundActivity:(BOOL)a5 completion:(id)a6;
- (void)_performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:(unint64_t)a3 nextBackgroundInterval:(unint64_t)a4;
- (void)_performPassChangesBackgroundActivity;
- (void)_performPassSyncBackgroundActivity;
- (void)_performZoneShareIntegrityOperation;
- (void)_processCloudStorePushNotificationForContainer:(id)a3 cloudStoreZone:(id)a4 containerDatabse:(id)a5;
- (void)_recordAggdCloudStoreBackgroundContainerSetupResult:(BOOL)a3 forCurrentBackgroundInterval:(unint64_t)a4;
- (void)_registerForPushNotifications;
- (void)_scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:(unint64_t)a3;
- (void)_scheduleFirstCloudStoreContainerSetupBackgroundActivityIfNeccessary;
- (void)_scheduleZoneShareIntegrityActivityForTimeInterval:(double)a3;
- (void)_shareRequest_acceptShareInvitation:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_shareRequest_acceptShareInvitationWithRequestAndSendReponse:(id)a3 completion:(id)a4;
- (void)_shareRequest_bootstrapZoneRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_createShareInvitationForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_declineInvitationForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_requestKeysForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_sendZoneShareInvitationWithRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_shareForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_validateRequestKeysWithRequest:(id)a3 completion:(id)a4;
- (void)_syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3;
- (void)_unregisterForPushNotifications;
- (void)_unscheduleBackgroundContainerSetupActivities;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)applyPushNotificationToken:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreContainer:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6;
- (void)cloudStoreContainer:(id)a3 didChangeContainerState:(unint64_t)a4;
- (void)cloudStoreContainer:(id)a3 reinitializeContainerAndInvalidateFirst:(BOOL)a4;
- (void)cloudStoreContainer:(id)a3 removeZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 qualitOfService:(int64_t)a6 completion:(id)a7;
- (void)cloudStoreContainer:(id)a3 requestsSyncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a4;
- (void)cloudStoreContainer:(id)a3 requestsZoneShareFromHandle:(id)a4 zoneName:(id)a5 completion:(id)a6;
- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitation:(id)a4 recipientHandle:(id)a5 completion:(id)a6;
- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 permission:(int64_t)a6 qualitOfService:(int64_t)a7 completion:(id)a8;
- (void)cloudStoreContainerShouldUnscheduleAllBackgroundActivities:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4;
- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4;
- (void)didReceiveCloudStoreZoneInvitation:(id)a3 invitationError:(id)a4 fromDestination:(id)a5;
- (void)didReceiveCloudStoreZoneInvitationStatus:(int64_t)a3 forInvitation:(id)a4 fromDestination:(id)a5;
- (void)didRequestCloudStoreZoneInvitationData:(id)a3 fromDestination:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)noteAccountAdded;
- (void)noteAccountDeleted;
- (void)noteCloudSyncPassesSwitchChanged;
- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)recreateAllZonesInContainerWithZoneName:(id)a3 completion:(id)a4;
- (void)recreateZones:(id)a3 completion:(id)a4;
- (void)refetchAccountEventsWithUnknownServicingStatusWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7;
- (void)removeItems:(id)a3 completion:(id)a4;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6;
- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromDestination:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5;
- (void)schedulePassChangesBackgroundActivity;
- (void)schedulePassSyncBackgroundActivity;
- (void)scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:(unint64_t)a3;
- (void)setApplePayContainer:(id)a3;
- (void)setPassContainer:(id)a3;
- (void)setPassSyncContainer:(id)a3;
- (void)setPassSyncSecureContainer:(id)a3;
- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4;
- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4;
@end

@implementation PDCloudStoreNotificationCoordinator

- (PDCloudStoreNotificationCoordinator)initWithPushNotificationManager:(id)a3 sharingIDSManger:(id)a4 databaseManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDCloudStoreNotificationCoordinator;
  v12 = -[PDCloudStoreNotificationCoordinator init](&v24, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v13->_sharingIDSManger, a4);
    -[PKSharingIDSManager addDelegate:](v13->_sharingIDSManger, "addDelegate:", v13);
    objc_storeStrong((id *)&v13->_databaseManager, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.passd"]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
    pushTopics = v13->_pushTopics;
    v13->_pushTopics = (NSSet *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    containers = v13->_containers;
    v13->_containers = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    shareRequests = v13->_shareRequests;
    v13->_shareRequests = v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v21;
  }

  return v13;
}

- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", a3));
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v7,  0LL,  v6);
}

- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
}

- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 shouldScheduleBackgroundActivity:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void (**)(void, void, void))v12;
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10032C8BC;
    v15[3] = &unk_100657390;
    v15[4] = self;
    id v16 = v10;
    BOOL v18 = a5;
    v17 = v13;
    [v16 initialCloudDatabaseSetupWithOperationGroupNameSuffix:v11 completion:v15];
  }

  else if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _errorWithCode:description:]( self,  "_errorWithCode:description:",  -4009LL,  @"Cannot initialize a nil container"));
    ((void (**)(void, void, void *))v13)[2](v13, 0LL, v14);
  }
}

- (void)setPassContainer:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_passContainer) {
    -[NSMutableArray removeObject:](self->_containers, "removeObject:");
  }
  objc_storeStrong((id *)&self->_passContainer, a3);
  -[PDCloudStoreContainer setDelegate:](self->_passContainer, "setDelegate:", self);
  -[NSMutableArray safelyAddObject:](self->_containers, "safelyAddObject:", self->_passContainer);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "A new pass container was set. Trying to initialize it now...",  v8,  2u);
    }

    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v5,  PKCloudStoreOperationGroupSuffixPKPassdStartup,  &stru_1006573B0);
  }
}

- (PDPassCloudStoreContainer)passContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_passContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPassSyncContainer:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_passSyncContainer) {
    -[NSMutableArray removeObjectIdenticalTo:](self->_containers, "removeObjectIdenticalTo:");
  }
  objc_storeStrong((id *)&self->_passSyncContainer, a3);
  -[PDCloudStoreContainer setDelegate:](self->_passSyncContainer, "setDelegate:", self);
  -[NSMutableArray safelyAddObject:](self->_containers, "safelyAddObject:", self->_passSyncContainer);
  os_unfair_lock_unlock(&self->_lock);
  id v5 = v6;
  if (v6)
  {
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v6,  PKCloudStoreOperationGroupSuffixPKPassdStartup,  &stru_1006573D0);
    id v5 = v6;
  }
}

- (PDPassSyncCloudStoreContainer)passSyncContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_passSyncContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPassSyncSecureContainer:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_passSyncSecureContainer) {
    -[NSMutableArray removeObjectIdenticalTo:](self->_containers, "removeObjectIdenticalTo:");
  }
  objc_storeStrong((id *)&self->_passSyncSecureContainer, a3);
  -[PDCloudStoreContainer setDelegate:](self->_passSyncSecureContainer, "setDelegate:", self);
  -[NSMutableArray safelyAddObject:](self->_containers, "safelyAddObject:", self->_passSyncSecureContainer);
  os_unfair_lock_unlock(&self->_lock);
  passSyncSecureContainer = self->_passSyncSecureContainer;
  if (passSyncSecureContainer) {
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  passSyncSecureContainer,  PKCloudStoreOperationGroupSuffixPKPassdStartup,  &stru_1006573F0);
  }
}

- (PDPassSyncCloudStoreContainer)passSyncSecureContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_passSyncSecureContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setApplePayContainer:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_applePayContainer) {
    -[NSMutableArray removeObject:](self->_containers, "removeObject:");
  }
  objc_storeStrong((id *)&self->_applePayContainer, a3);
  -[PDCloudStoreContainer setDelegate:](self->_applePayContainer, "setDelegate:", self);
  -[NSMutableArray safelyAddObject:](self->_containers, "safelyAddObject:", self->_applePayContainer);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "A new apple pay container was set. Trying to initialize it now...",  v8,  2u);
    }

    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v5,  PKCloudStoreOperationGroupSuffixPKPassdStartup,  &stru_100657410);
  }
}

- (PDApplePayCloudStoreContainer)applePayContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_applePayContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", v6));
  id v9 = v8;
  if (v8)
  {
    unsigned __int8 v10 = [v8 isSetup];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10032D2B0;
    v13[3] = &unk_100657438;
    id v14 = v7;
    unsigned __int8 v15 = v10;
    [v9 cloudStoreAccountInformationWithCompletion:v13];
  }

  else if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"There is no container associated with container identifier %@",  v6));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _errorWithCode:description:]( self,  "_errorWithCode:description:",  -4009LL,  v11));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v12);
  }
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_containers, "firstObject"));
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containerManager]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerName]);
    -[PDCloudStoreNotificationCoordinator cloudStoreStatusForContainer:completion:]( self,  "cloudStoreStatusForContainer:completion:",  v6,  v7);

LABEL_5:
    goto LABEL_6;
  }

  if (v7)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _errorWithCode:description:]( self,  "_errorWithCode:description:",  -4009LL,  @"There are not containers to check the cloud status for"));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v5);
    goto LABEL_5;
  }

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 item]);
    id v10 = [v9 itemType];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10032D53C;
    v12[3] = &unk_1006464A0;
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", v10));
    id v14 = v6;
    id v15 = v7;
    id v11 = v13;
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v11,  0LL,  v12);
  }

  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)removeItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    id v9 = [v8 itemType];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10032D7B0;
    v11[3] = &unk_1006464A0;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", v9));
    id v13 = v6;
    id v14 = v7;
    id v10 = v12;
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v10,  0LL,  v11);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10032D9DC;
  v17[3] = &unk_10063B418;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", a5));
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v18;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v16,  0LL,  v17);
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10032DBE8;
  v10[3] = &unk_100657460;
  id v12 = a5;
  unint64_t v13 = a3;
  BOOL v14 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", a3));
  id v8 = v12;
  id v9 = v11;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v9,  0LL,  v10);
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10032DD50;
  v15[3] = &unk_10063B418;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", 1LL));
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v16;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v14,  0LL,  v15);
}

- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v8));
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10032DED8;
    v14[3] = &unk_100639688;
    id v15 = v10;
    [v11 resetContainerWithZoneNames:v9 completion:v14];
  }

  else if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"There is no container associated with container identifier %@",  v8));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _errorWithCode:description:]( self,  "_errorWithCode:description:",  -4009LL,  v12));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v13);
  }
}

- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10032DFF4;
  v9[3] = &unk_10063B468;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", a3));
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v8,  0LL,  v9);
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10032E294;
  v15[3] = &unk_100657488;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", a3));
  id v17 = v10;
  unint64_t v19 = a3;
  int64_t v20 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v16;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v14,  0LL,  v15);
}

- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10032E4B0;
  v13[3] = &unk_1006464A0;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", a4));
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v12,  0LL,  v13);
}

- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10032E6A8;
  v13[3] = &unk_1006464A0;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", a4));
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v12,  0LL,  v13);
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10032E8B4;
  v17[3] = &unk_1006574D8;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", a5));
  id v19 = v12;
  BOOL v22 = a6;
  id v20 = v13;
  unint64_t v21 = a3;
  id v14 = v13;
  id v15 = v12;
  id v16 = v18;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v16,  0LL,  v17);
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10032EAD4;
  v11[3] = &unk_1006464A0;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerForItemType:]( self,  "_containerForItemType:",  [v6 itemType]));
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v12;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v10,  0LL,  v11);
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10032ECEC;
  v15[3] = &unk_100657488;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", a3));
  id v17 = v10;
  unint64_t v19 = a3;
  int64_t v20 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v16;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v14,  0LL,  v15);
}

- (void)_executeShareInvitationRequest:(id)a3
{
  v4 = (os_log_s *)a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Share invitation request incoming %@",  buf,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = self->_shareRequests;
  id v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "coalesceWithRequest:", v4, (void)v13))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v18 = v4;
            __int16 v19 = 2112;
            int64_t v20 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Share invitation request coalesced %@ onto existing request %@",  buf,  0x16u);
          }

          id v6 = v4;
          goto LABEL_18;
        }
      }

      id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    -[NSMutableOrderedSet addObject:](self->_shareRequests, "addObject:", v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Share invitation request queued %@",  buf,  0xCu);
    }

    id v7 = (NSMutableOrderedSet *)v4;
LABEL_18:
  }

  os_unfair_lock_unlock(&self->_lock);
  -[PDCloudStoreNotificationCoordinator _executeNextShareInvitationRequestIfPossible]( self,  "_executeNextShareInvitationRequestIfPossible");
}

- (void)_executeNextShareInvitationRequestIfPossible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentShareRequest)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    v4 = (PDCloudStoreShareInvitationRequest *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_shareRequests, "firstObject"));
    currentShareRequest = self->_currentShareRequest;
    self->_currentShareRequest = v4;

    id v6 = self->_currentShareRequest;
    if (v6)
    {
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_shareRequests, "removeObjectAtIndex:", 0LL);
      id v6 = self->_currentShareRequest;
    }

    id v7 = v6;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting share invitation request %@",  buf,  0xCu);
      }

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10032F458;
      v29[3] = &unk_100657528;
      uint64_t v10 = v7;
      v30 = v10;
      v31 = self;
      id v11 = objc_retainBlock(v29);
      switch(-[PDCloudStoreShareInvitationRequest type](v10, "type"))
      {
        case 0uLL:
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_10032F4AC;
          v27[3] = &unk_100639688;
          id v12 = (id *)&v28;
          v28 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_acceptShareInvitationWithRequestAndSendReponse:completion:]( self,  "_shareRequest_acceptShareInvitationWithRequestAndSendReponse:completion:",  v10,  v27);
          goto LABEL_17;
        case 1uLL:
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_10032F51C;
          v25[3] = &unk_100639688;
          id v12 = (id *)&v26;
          v26 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_validateRequestKeysWithRequest:completion:]( self,  "_shareRequest_validateRequestKeysWithRequest:completion:",  v10,  v25);
          goto LABEL_17;
        case 2uLL:
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_10032F58C;
          v23[3] = &unk_10063EB60;
          id v12 = (id *)&v24;
          objc_super v24 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_createShareInvitationForRequest:completion:]( self,  "_shareRequest_createShareInvitationForRequest:completion:",  v10,  v23);
          goto LABEL_17;
        case 3uLL:
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_10032F624;
          v21[3] = &unk_10063EB60;
          id v12 = (id *)&v22;
          BOOL v22 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_sendZoneShareInvitationWithRequest:completion:]( self,  "_shareRequest_sendZoneShareInvitationWithRequest:completion:",  v10,  v21);
          goto LABEL_17;
        case 4uLL:
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_10032F694;
          v19[3] = &unk_100657550;
          id v12 = (id *)&v20;
          int64_t v20 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_declineInvitationForRequest:completion:]( self,  "_shareRequest_declineInvitationForRequest:completion:",  v10,  v19);
          goto LABEL_17;
        case 5uLL:
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_10032F714;
          v17[3] = &unk_10063DA70;
          id v12 = (id *)&v18;
          id v18 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_shareForRequest:completion:]( self,  "_shareRequest_shareForRequest:completion:",  v10,  v17);
          goto LABEL_17;
        case 6uLL:
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_10032F798;
          v15[3] = &unk_100639688;
          id v12 = (id *)&v16;
          __int128 v16 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_requestKeysForRequest:completion:]( self,  "_shareRequest_requestKeysForRequest:completion:",  v10,  v15);
          goto LABEL_17;
        case 7uLL:
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_10032F808;
          v13[3] = &unk_100639688;
          id v12 = (id *)&v14;
          __int128 v14 = v11;
          -[PDCloudStoreNotificationCoordinator _shareRequest_bootstrapZoneRequest:completion:]( self,  "_shareRequest_bootstrapZoneRequest:completion:",  v10,  v13);
LABEL_17:

          break;
        default:
          break;
      }
    }
  }

- (void)_shareRequest_acceptShareInvitationWithRequestAndSendReponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 invitation]);
  id v9 = [v6 qualityOfService];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10032F960;
  v13[3] = &unk_10063B418;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  -[PDCloudStoreNotificationCoordinator _shareRequest_acceptShareInvitation:qualityOfService:completion:]( self,  "_shareRequest_acceptShareInvitation:qualityOfService:completion:",  v12,  v9,  v13);
}

- (void)_shareRequest_acceptShareInvitation:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v10));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10032FD88;
  v15[3] = &unk_100641AD8;
  id v16 = v11;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v14,  0LL,  v15);
}

- (void)_shareRequest_validateRequestKeysWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 invitation]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recipientHandle]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v10));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10032FFFC;
  v16[3] = &unk_1006575C8;
  int64_t v20 = self;
  id v21 = v6;
  id v17 = v8;
  id v18 = v11;
  id v19 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v6;
  id v15 = v8;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v13,  0LL,  v16);
}

- (void)_shareRequest_createShareInvitationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containerName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 handle]);
  id v11 = [v7 qualityOfService];
  id v12 = [v7 permission];
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v8));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 suffix]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1003305A0;
  v19[3] = &unk_1006575F0;
  id v20 = v13;
  id v21 = v10;
  id v24 = v12;
  id v25 = v11;
  id v22 = v9;
  id v23 = v6;
  id v15 = v6;
  id v16 = v9;
  id v17 = v10;
  id v18 = v13;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v18,  v14,  v19);
}

- (void)_shareRequest_sendZoneShareInvitationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 invitation]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recipientHandle]);

  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Alerting %@ via IDS that they have been added to a zone share invitation %@",  buf,  0x16u);
    }

    sharingIDSManger = self->_sharingIDSManger;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100330838;
    v13[3] = &unk_10063C3B0;
    id v15 = v6;
    id v14 = v8;
    -[PKSharingIDSManager sendCloudStoreZoneInvitation:forHandle:invitationError:completion:]( sharingIDSManger,  "sendCloudStoreZoneInvitation:forHandle:invitationError:completion:",  v14,  v9,  0LL,  v13);
  }

  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003309B8;
  v13[3] = &unk_100657550;
  id v14 = a7;
  id v12 = v14;
  -[PDCloudStoreNotificationCoordinator _declineInvitationForRecipientHandle:zoneName:containerName:qualityOfService:shouldAlertRecipient:completion:]( self,  "_declineInvitationForRecipientHandle:zoneName:containerName:qualityOfService:shouldAlertRecipient:completion:",  a3,  a4,  a5,  a6,  1LL,  v13);
}

- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  a5));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100330AB0;
  v17[3] = &unk_100639688;
  id v18 = v12;
  id v16 = v12;
  -[PDCloudStoreNotificationCoordinator cloudStoreContainer:sendZoneShareInvitationForHandle:zoneName:permission:qualitOfService:completion:]( self,  "cloudStoreContainer:sendZoneShareInvitationForHandle:zoneName:permission:qualitOfService:completion:",  v15,  v14,  v13,  3LL,  a6,  v17);
}

- (void)_declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 shouldAlertRecipient:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationRequestDeclineRequest);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100330C2C;
  v21[3] = &unk_100657618;
  id v22 = v14;
  id v19 = v14;
  id v20 = -[PDCloudStoreShareInvitationRequestDeclineRequest initWithHandle:zoneName:containerName:completion:]( v18,  "initWithHandle:zoneName:containerName:completion:",  v17,  v16,  v15,  v21);

  -[PDCloudStoreShareInvitationRequestDeclineRequest setShouldAlertRecipient:](v20, "setShouldAlertRecipient:", v8);
  -[PDCloudStoreShareInvitationRequest setQualityOfService:](v20, "setQualityOfService:", a6);
  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v20);
}

- (void)_shareRequest_declineInvitationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containerName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 handle]);
  unsigned __int8 v11 = [v7 shouldAlertRecipient];
  id v12 = [v7 qualityOfService];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100330E2C;
  v18[3] = &unk_100657668;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", v8));
  id v20 = v10;
  id v24 = v6;
  id v25 = v12;
  unsigned __int8 v26 = v11;
  id v21 = v9;
  id v22 = v8;
  id v23 = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  id v17 = v19;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v17,  0LL,  v18);
}

- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationRequestGetShare);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10033132C;
  v16[3] = &unk_100657618;
  id v17 = v10;
  id v14 = v10;
  id v15 = -[PDCloudStoreShareInvitationRequestGetShare initWithZoneName:containerName:completion:]( v13,  "initWithZoneName:containerName:completion:",  v12,  v11,  v16);

  -[PDCloudStoreShareInvitationRequest setQualityOfService:](v15, "setQualityOfService:", a5);
  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v15);
}

- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passContainerWithName:](self, "passContainerWithName:", a3));
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10033148C;
    v9[3] = &unk_100657690;
    id v10 = v6;
    [v7 fetchDiagnosticInformation:v9];
  }

  else
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[PKCloudStoreContainerDiagnostics turnedOff]( &OBJC_CLASS___PKCloudStoreContainerDiagnostics,  "turnedOff"));
    (*((void (**)(id, void *, void))v6 + 2))(v6, v8, 0LL);
  }
}

- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passContainerWithName:](self, "passContainerWithName:", a3));
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100331554;
    v8[3] = &unk_1006576B8;
    id v9 = v6;
    [v7 fetchDiagnosticSnapshot:v8];
  }

  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5
{
  BOOL v8 = (void (**)(id, void))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passContainerWithName:](self, "passContainerWithName:", a4));
  id v10 = v9;
  if (v9)
  {
    switch(a3)
    {
      case 1LL:
        [v9 clearSyncToken];
        break;
      case 2LL:
        [v9 synchronizeWithReason:1];
        break;
      case 3LL:
        [v9 resetMigration];
        break;
      case 4LL:
        [v9 clearChangeHistory];
        break;
      case 5LL:
        [v9 processChangeHistory];
        break;
      case 6LL:
        [v9 resetContents];
        break;
      case 7LL:
        uint64_t v11 = PKCloudStoreOperationGroupInitialSetup;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_10033169C;
        v12[3] = &unk_10063DAE8;
        void v12[4] = self;
        id v13 = v9;
        [v13 invalidateCloudStoreWithOperationGroupNameSuffix:v11 clearCache:0 completion:v12];

        break;
      default:
        break;
    }
  }

  v8[2](v8, 0LL);
}

- (id)passContainerWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PKCloudStorePassesSyncContainerName;
  id v6 = v4;
  id v7 = v5;
  if (v7 == v6)
  {

    goto LABEL_7;
  }

  BOOL v8 = v7;
  if (v6 && v7)
  {
    unsigned int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncContainer](self, "passSyncContainer"));
    goto LABEL_16;
  }

LABEL_9:
  uint64_t v11 = (void *)PKCloudStorePassesSyncSecureContainerName;
  id v12 = v6;
  id v13 = v11;
  if (v13 == v12)
  {
  }

  else
  {
    id v14 = v13;
    if (!v6 || !v13)
    {

LABEL_18:
      id v16 = 0LL;
      goto LABEL_19;
    }

    unsigned int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_18;
    }
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncSecureContainer](self, "passSyncSecureContainer"));
LABEL_16:
  id v16 = (void *)v10;
LABEL_19:

  return v16;
}

- (void)_shareRequest_shareForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 containerName]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003318F8;
  v14[3] = &unk_10063B418;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", v8));
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  id v13 = v15;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v13,  0LL,  v14);
}

- (void)_shareRequest_requestKeysForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recipientHandle]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 invitation]);

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Requesting zone share data from handle %@, %@",  buf,  0x16u);
  }

  sharingIDSManger = self->_sharingIDSManger;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100331BBC;
  v14[3] = &unk_1006424D0;
  id v15 = v6;
  id v13 = v6;
  -[PKSharingIDSManager requestCloudStoreZoneInvitationData:forHandle:completion:]( sharingIDSManger,  "requestCloudStoreZoneInvitationData:forHandle:completion:",  v9,  v8,  v14);
}

- (void)_shareRequest_bootstrapZoneRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 containerName]);

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Bootstrapping zone %{public}@ in container %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator applePayContainer](self, "applePayContainer"));

  if (v12 == v13) {
    [v12 bootstrapZoneWithName:v8 completion:v6];
  }
  else {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)recreateAllZonesInContainerWithZoneName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithZoneName:scope:]( self,  "_containerWithZoneName:scope:",  a3,  2LL));
  BOOL v8 = v7;
  if (v7)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 containerManager]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerName]);

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Recreating zones in container %{public}@",  buf,  0xCu);
    }

    uint64_t v13 = PKCloudStoreOperationGroupSuffixServerPush;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100331F04;
    v16[3] = &unk_10063B418;
    id v17 = v10;
    __int16 v18 = self;
    id v19 = v8;
    id v20 = v6;
    id v14 = v10;
    [v19 invalidateCloudStoreWithOperationGroupNameSuffix:v13 clearCache:1 resultOfZoneRecreation:1 completion:v16];
  }

  else if (v6)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _errorWithCode:description:]( self,  "_errorWithCode:description:",  -4009LL,  @"Cannot initialize a nil container"));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v15);
  }
}

- (void)recreateZones:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithZoneName:scope:]( self,  "_containerWithZoneName:scope:",  v8,  2LL));

  if (v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Recreating zones %{public}@", buf, 0xCu);
    }

    uint64_t v12 = PKCloudStoreOperationGroupSuffixServerPush;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100332398;
    v14[3] = &unk_10063B418;
    id v15 = v6;
    __int16 v16 = self;
    id v17 = v9;
    id v18 = v7;
    [v17 invalidateCloudStoreWithOperationGroupNameSuffix:v12 clearCache:1 resultOfZoneRecreation:1 zoneNames:v15 completion:v14];
  }

  else if (v7)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _errorWithCode:description:]( self,  "_errorWithCode:description:",  -4009LL,  @"Cannot initialize a nil container"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
  }
}

- (void)cloudStoreContainer:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(&self->_lock);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10033276C;
  v14[3] = &unk_100657728;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  int64_t v17 = a6;
  id v11 = v10;
  id v12 = v9;
  [v13 enumerateObjectsUsingBlock:v14];
}

- (void)cloudStoreContainer:(id)a3 didChangeContainerState:(unint64_t)a4
{
  id v6 = a3;
  if (a4 - 2 < 2)
  {
    id v7 = v6;
    -[PDCloudStoreNotificationCoordinator _unregisterForPushNotifications](self, "_unregisterForPushNotifications");
LABEL_5:
    id v6 = v7;
    goto LABEL_6;
  }

  if (a4 == 1)
  {
    id v7 = v6;
    -[PDCloudStoreNotificationCoordinator _registerForPushNotifications](self, "_registerForPushNotifications");
    goto LABEL_5;
  }

- (void)cloudStoreContainerShouldUnscheduleAllBackgroundActivities:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "cloudStoreManagerShouldUnscheduleAllBackgroundActivities delegate called",  v6,  2u);
  }

  -[PDCloudStoreNotificationCoordinator _unscheduleBackgroundContainerSetupActivities]( self,  "_unscheduleBackgroundContainerSetupActivities");
}

- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 permission:(int64_t)a6 qualitOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a5;
  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a3 containerManager]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 containerName]);

  id v19 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationCreateKeysRequest);
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  id v25 = sub_10033298C;
  unsigned __int8 v26 = &unk_100657750;
  id v29 = v15;
  int64_t v30 = a7;
  id v27 = v14;
  v28 = self;
  id v20 = v14;
  id v21 = v15;
  id v22 = -[PDCloudStoreShareInvitationCreateKeysRequest initWithHandle:permission:zoneName:containerName:completion:]( v19,  "initWithHandle:permission:zoneName:containerName:completion:",  v20,  a6,  v16,  v18,  &v23);

  -[PDCloudStoreShareInvitationRequest setQualityOfService:](v22, "setQualityOfService:", a7, v23, v24, v25, v26);
  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v22);
}

- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitation:(id)a4 recipientHandle:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Request to send zone share invitation %@ to %@",  buf,  0x16u);
  }

  id v14 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationSendKeysRequest);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100332CA8;
  v17[3] = &unk_100657618;
  id v18 = v11;
  id v15 = v11;
  id v16 = -[PDCloudStoreShareInvitationSendKeysRequest initWithInvitation:recipientHandle:completion:]( v14,  "initWithInvitation:recipientHandle:completion:",  v9,  v10,  v17);
  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v16);
}

- (void)cloudStoreContainer:(id)a3 removeZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 qualitOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationRequestDeclineRequest);
  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 containerManager]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 containerName]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100332E58;
  v21[3] = &unk_100657618;
  id v22 = v12;
  id v19 = v12;
  id v20 = -[PDCloudStoreShareInvitationRequestDeclineRequest initWithHandle:zoneName:containerName:completion:]( v16,  "initWithHandle:zoneName:containerName:completion:",  v14,  v13,  v18,  v21);

  -[PDCloudStoreShareInvitationRequest setQualityOfService:](v20, "setQualityOfService:", a6);
  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v20);
}

- (void)cloudStoreContainer:(id)a3 requestsZoneShareFromHandle:(id)a4 zoneName:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(&OBJC_CLASS___PKCloudStoreZoneInvitation);
  -[PKCloudStoreZoneInvitation setZoneName:](v14, "setZoneName:", v11);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 containerManager]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 containerName]);
  -[PKCloudStoreZoneInvitation setContainerIdentifier:](v14, "setContainerIdentifier:", v16);

  int64_t v17 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationRequestKeys);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10033301C;
  v20[3] = &unk_100657618;
  id v21 = v10;
  id v18 = v10;
  id v19 = -[PDCloudStoreShareInvitationRequestKeys initWithInvitation:recipientHandle:completion:]( v17,  "initWithInvitation:recipientHandle:completion:",  v14,  v12,  v20);

  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v19);
}

- (void)cloudStoreContainer:(id)a3 requestsSyncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator applePayContainer](self, "applePayContainer"));

  if (v7 == v6)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"ANY";
      if (a4 == 2) {
        id v10 = @"NO";
      }
      if (a4 == 1) {
        id v10 = @"YES";
      }
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "A call to schedule a background task to sync transaction to cloud stor originated on device %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    -[PDCloudStoreNotificationCoordinator scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:]( self,  "scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:",  a4);
  }

- (void)cloudStoreContainer:(id)a3 reinitializeContainerAndInvalidateFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = PKCloudStoreOperationGroupInitialSetup;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100333260;
    v9[3] = &unk_10063DAE8;
    void v9[4] = self;
    id v10 = v6;
    [v10 invalidateCloudStoreWithOperationGroupNameSuffix:v8 clearCache:0 completion:v9];
  }

  else
  {
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v6,  PKCloudStoreOperationGroupInitialSetup,  &stru_100657790);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v5)) {
      -[NSHashTable addObject:](self->_observers, "addObject:", v5);
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)didReceiveCloudStoreZoneInvitation:(id)a3 invitationError:(id)a4 fromDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
  -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v14));

  if (-[NSMutableArray count](v11, "count"))
  {
    id v16 = -[NSMutableArray copy](v11, "copy");
    [v15 reportContainerChangeSignpostEventType:43 stateName:0 objectNames:v16 changeToken:0 error:v9 operationGroupName:0 operationGroupNameSuffix:0];
  }

  else
  {
    [v15 reportContainerChangeSignpostEventType:43 stateName:0 objectNames:0 changeToken:0 error:v9 operationGroupName:0 operationGroupNameSuffix:0];
  }

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v8;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Cannot accept invitation from IDS %@ with error %@",  buf,  0x16u);
    }

    id v20 = (PDCloudStoreShareInvitationAcceptKeysRequest *)[[PKCloudStoreError alloc] initWithError:v9];
    if (-[PDCloudStoreShareInvitationAcceptKeysRequest isParticipantMayNeedVerificationError]( v20,  "isParticipantMayNeedVerificationError"))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v21));

      id v22 = objc_alloc(&OBJC_CLASS___PDCloudStoreShareBootstrapZoneRequest);
      uint64_t v23 = PKCloudStoreTransactionsZoneName;
      int64_t v30 = v15;
      id v24 = v10;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v29 containerManager]);
      unsigned __int8 v26 = self;
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 containerName]);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100333698;
      v31[3] = &unk_1006577B8;
      v31[4] = v26;
      v28 = -[PDCloudStoreShareBootstrapZoneRequest initWithZoneName:containerName:completion:]( v22,  "initWithZoneName:containerName:completion:",  v23,  v27,  v31);

      id v10 = v24;
      id v15 = v30;
      -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:]( v26,  "_executeShareInvitationRequest:",  v28);
    }
  }

  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Attemping to accept invitation from IDS %@",  buf,  0xCu);
    }

    id v20 = -[PDCloudStoreShareInvitationAcceptKeysRequest initWithInvitation:fromDestination:completion:]( objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationAcceptKeysRequest),  "initWithInvitation:fromDestination:completion:",  v8,  v10,  0LL);
    -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v20);
  }
}

- (void)didRequestCloudStoreZoneInvitationData:(id)a3 fromDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Checking if zone share invitation %@ can be shared to %@",  buf,  0x16u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 containerIdentifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v13));

  if (-[NSMutableArray count](v10, "count"))
  {
    id v15 = -[NSMutableArray copy](v10, "copy");
    [v14 reportContainerChangeSignpostEventType:44 stateName:0 objectNames:v15 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  else
  {
    [v14 reportContainerChangeSignpostEventType:44 stateName:0 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDestination]);
  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);

  id v18 = -[PDCloudStoreShareInvitationValidateRequestKeys initWithInvitation:recipientHandle:completion:]( objc_alloc(&OBJC_CLASS___PDCloudStoreShareInvitationValidateRequestKeys),  "initWithInvitation:recipientHandle:completion:",  v6,  v17,  0LL);
  -[PDCloudStoreNotificationCoordinator _executeShareInvitationRequest:](self, "_executeShareInvitationRequest:", v18);
}

- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Removed from cloud store zone with invitiation %@ from destination %@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 containerIdentifier]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v10));

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  -[NSMutableArray safelyAddObject:](v12, "safelyAddObject:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  -[NSMutableArray safelyAddObject:](v12, "safelyAddObject:", v14);

  if (-[NSMutableArray count](v12, "count"))
  {
    id v15 = -[NSMutableArray copy](v12, "copy");
    [v11 reportContainerChangeSignpostEventType:42 stateName:0 objectNames:v15 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  else
  {
    [v11 reportContainerChangeSignpostEventType:42 stateName:0 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100333B2C;
  v19[3] = &unk_10063B2D8;
  id v20 = v7;
  id v21 = v11;
  id v22 = v6;
  id v16 = v6;
  id v17 = v11;
  id v18 = v7;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v17,  0LL,  v19);
}

- (void)didReceiveCloudStoreZoneInvitationStatus:(int64_t)a3 forInvitation:(id)a4 fromDestination:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = PKCloudStoreZoneInvitationStatusToString(a3);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543874;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received cloud store zone share invitation status %{public}@ from invitation %@ from destination %@",  buf,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v14));

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  -[NSMutableArray safelyAddObject:](v16, "safelyAddObject:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
  -[NSMutableArray safelyAddObject:](v16, "safelyAddObject:", v18);

  uint64_t v19 = PKCloudStoreZoneInvitationStatusToString(a3);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (-[NSMutableArray count](v16, "count"))
  {
    id v21 = -[NSMutableArray copy](v16, "copy");
    [v15 reportContainerChangeSignpostEventType:41 stateName:v20 objectNames:v21 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  else
  {
    [v15 reportContainerChangeSignpostEventType:41 stateName:v20 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  if (a3 == 3)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDestination]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v23;
      __int16 v36 = 2112;
      id v37 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "The cloud store share invitation failed and %@ is asking us to removing them and re-add them to the share for zo ne %@. This means they have probably lost the keys and cannot accept the share.",  buf,  0x16u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100333EDC;
    v29[3] = &unk_1006577E0;
    void v29[4] = self;
    id v30 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator _containerWithIdentifier:](self, "_containerWithIdentifier:", v25));
    id v31 = v23;
    id v32 = v24;
    id v33 = v8;
    id v26 = v24;
    id v27 = v23;
    id v28 = v30;
    -[PDCloudStoreNotificationCoordinator _declineInvitationForRecipientHandle:zoneName:containerName:qualityOfService:shouldAlertRecipient:completion:]( self,  "_declineInvitationForRecipientHandle:zoneName:containerName:qualityOfService:shouldAlertRecipient:completion:",  v27,  v26,  v25,  17LL,  0LL,  v29);
  }
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v3 = a3;
  id v13 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v13));
  id v5 = v13;
  if (!v5)
  {
    uint64_t v10 = PKCloudKitApplePayView;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003341C4;
    v11[3] = &unk_10063B3A0;
    id v12 = v3;
    [v4 rpcTLKMissing:v10 reply:v11];
    id v9 = v12;
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Could not check missing TLKs issue because of CKKSControl error: %@",  buf,  0xCu);
  }

  if (v3)
  {
    uint64_t v8 = CKXPCSuitableError(v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v9);
LABEL_7:
  }
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v3 = a3;
  id v14 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v14));
  id v5 = v14;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting TLKs reset...", buf, 2u);
    }

    uint64_t v11 = PKCloudKitApplePayView;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100334448;
    v12[3] = &unk_1006424D0;
    id v13 = v3;
    [v4 rpcResetCloudKit:v11 reason:@"tlk-missing-wallet" reply:v12];
    uint64_t v10 = v13;
    goto LABEL_9;
  }

  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Could not reset apple pay manatee view because of CKKSControl error: %@",  buf,  0xCu);
  }

  if (v3)
  {
    uint64_t v9 = CKXPCSuitableError(v5);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v10);
LABEL_9:
  }
}

- (void)noteAccountAdded
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDCloudStoreNotificationCoordinator: the primary Apple Account has been set. Forcing container reinitialization.",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncContainer](self, "passSyncContainer"));
  if (v5)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting up PDPassSyncCloudStoreContainer standard again.",  v10,  2u);
    }

    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v5,  PKCloudStoreOperationGroupSuffixPKICloudAccountSignIn,  &stru_100657800);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncSecureContainer](self, "passSyncSecureContainer"));
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting up PDPassSyncCloudStoreContainer secure again.",  v9,  2u);
    }

    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v6,  PKCloudStoreOperationGroupSuffixPKICloudAccountSignIn,  &stru_100657820);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passContainer](self, "passContainer"));
  if (v7)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting up PDPassCloudStoreContainer again.",  v8,  2u);
    }

    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v7,  PKCloudStoreOperationGroupSuffixPKICloudAccountSignIn,  &stru_100657840);
  }
}

- (void)noteCloudSyncPassesSwitchChanged
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDCloudStoreNotificationCoordinator: The primary Apple Account has changed. Forcing container reload.",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncContainer](self, "passSyncContainer"));
  if (v5)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Reloading standard PDPassSyncCloudStoreContainer.",  v8,  2u);
    }

    [v5 reload];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncSecureContainer](self, "passSyncSecureContainer"));
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Reloading secure PDPassSyncCloudStoreContainer.",  v7,  2u);
    }

    [v6 reload];
  }
}

- (void)noteAccountDeleted
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDCloudStoreNotificationCoordinator: The primary Apple Account has been deleted.",  buf,  2u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_containers;
  id v6 = self->_applePayContainer;
  currentShareRequest = self->_currentShareRequest;
  self->_currentShareRequest = 0LL;

  -[NSMutableOrderedSet removeAllObjects](self->_shareRequests, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v8 = v5;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    uint64_t v12 = PKCloudStoreOperationGroupSuffixPKICloudAccountSignOut;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(PDApplePayCloudStoreContainer **)(*((void *)&v15 + 1) + 8LL * (void)v13);
        if (v14 != v6) {
          -[PDCloudStoreContainer invalidateCloudStoreWithOperationGroupNameSuffix:clearCache:completion:]( v14,  "invalidateCloudStoreWithOperationGroupNameSuffix:clearCache:completion:",  v12,  1LL,  0LL,  (void)v15);
        }
        id v13 = (char *)v13 + 1;
      }

      while (v10 != v13);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v10);
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Background cloud store setup activity fired with identifier %@.",  (uint8_t *)&v33,  0xCu);
  }

  id v10 = (__CFString *)v6;
  uint64_t v11 = v10;
  if (v10 == @"ContainerSetupShortInterval") {
    goto LABEL_6;
  }
  if (v10)
  {
    unsigned int v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", @"ContainerSetupShortInterval");

    if (v12)
    {
LABEL_6:
      id v13 = self;
      uint64_t v14 = 0LL;
      uint64_t v15 = 1LL;
LABEL_14:
      -[PDCloudStoreNotificationCoordinator _performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:nextBackgroundInterval:]( v13,  "_performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:nextBackgroundInterval:",  v14,  v15);
      goto LABEL_22;
    }

    __int128 v16 = v11;
    if (v16 == @"ContainerSetupMediumInterval"
      || (__int128 v17 = v16,
          unsigned int v18 = -[__CFString isEqualToString:]( v16,  "isEqualToString:",  @"ContainerSetupMediumInterval"),  v17,  v18))
    {
      id v13 = self;
      uint64_t v14 = 1LL;
LABEL_13:
      uint64_t v15 = 2LL;
      goto LABEL_14;
    }

    uint64_t v19 = v17;
    if (v19 == @"ContainerSetupLongInterval"
      || (id v20 = v19,
          unsigned int v21 = -[__CFString isEqualToString:]( v19,  "isEqualToString:",  @"ContainerSetupLongInterval"),  v20,  v21))
    {
      id v13 = self;
      uint64_t v14 = 2LL;
      goto LABEL_13;
    }
  }

  if (-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"PDCloudStoreSyncTransactionDeviceDataActivityIDThisDevice"))
  {
    id v22 = self;
    uint64_t v23 = 1LL;
LABEL_21:
    -[PDCloudStoreNotificationCoordinator _syncTransactionsToCloudStoreOriginatedOnDevice:]( v22,  "_syncTransactionsToCloudStoreOriginatedOnDevice:",  v23);
    goto LABEL_22;
  }

  if (-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"PDCloudStoreSyncTransactionDeviceDataActivityIDAny"))
  {
    id v22 = self;
    uint64_t v23 = 0LL;
    goto LABEL_21;
  }

  if (-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"PDCloudStoreSyncTransactionDeviceDataActivityIDNotThisDevice"))
  {
    id v22 = self;
    uint64_t v23 = 2LL;
    goto LABEL_21;
  }

  id v24 = v11;
  if (v24 == @"PDPassSyncActivityIdentifier") {
    goto LABEL_26;
  }
  if (!v11) {
    goto LABEL_22;
  }
  __int16 v25 = v24;
  unsigned int v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", @"PDPassSyncActivityIdentifier");

  if (v26)
  {
LABEL_26:
    -[PDCloudStoreNotificationCoordinator _performPassSyncBackgroundActivity]( self,  "_performPassSyncBackgroundActivity");
    goto LABEL_22;
  }

  id v27 = v25;
  if (v27 == @"PDPassChangesActivityIdentifier"
    || (id v28 = v27,
        unsigned int v29 = -[__CFString isEqualToString:]( v27,  "isEqualToString:",  @"PDPassChangesActivityIdentifier"),  v28,  v29))
  {
    -[PDCloudStoreNotificationCoordinator _performPassChangesBackgroundActivity]( self,  "_performPassChangesBackgroundActivity");
  }

  else
  {
    id v30 = v28;
    if (v30 == @"PDCloudStoreZoneShareIntegrityActivityID"
      || (id v31 = v30,
          unsigned int v32 = -[__CFString isEqualToString:]( v30,  "isEqualToString:",  @"PDCloudStoreZoneShareIntegrityActivityID"),  v31,  v32))
    {
      -[PDCloudStoreNotificationCoordinator _performZoneShareIntegrityOperation]( self,  "_performZoneShareIntegrityOperation");
    }
  }

- (void)_performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:(unint64_t)a3 nextBackgroundInterval:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator applePayContainer](self, "applePayContainer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100334F88;
  v8[3] = &unk_100657868;
  void v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:shouldScheduleBackgroundActivity:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:shouldScheduleBackgroundActivity:completion:",  v7,  0LL,  0LL,  v8);
}

- (void)scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:(unint64_t)a3
{
  id v5 = @"PDCloudStoreSyncTransactionDeviceDataActivityIDAny";
  if (a3 == 2) {
    id v5 = @"PDCloudStoreSyncTransactionDeviceDataActivityIDNotThisDevice";
  }
  if (a3 == 1) {
    id v5 = @"PDCloudStoreSyncTransactionDeviceDataActivityIDThisDevice";
  }
  id v6 = v5;
  if ((PDScheduledActivityExists(@"PDCloudStoreClientID", v6) & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"ANY";
      if (a3 == 2) {
        id v9 = @"NO";
      }
      if (a3 == 1) {
        id v9 = @"YES";
      }
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Scheduling background task to sync transaction device data to cloud store originating from device %@.",  (uint8_t *)&v13,  0xCu);
    }

    id v10 = PDDefaultQueue();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    PDScheduledActivityClientRegister(@"PDCloudStoreClientID", self, v11);

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
    [v12 setRequireNetworkConnectivity:1];
    [v12 setRequireMainsPower:1];
    [v12 setRepeating:0];
    PDScheduledActivityRegister(@"PDCloudStoreClientID", v6, v12);
  }
}

- (void)_syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator applePayContainer](self, "applePayContainer"));
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = @"ANY";
    if (a3 == 2) {
      BOOL v8 = @"NO";
    }
    if (a3 == 1) {
      BOOL v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "syncOriginatingTransactionsToCloudStore called originating from device %@.",  buf,  0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003352A0;
  v10[3] = &unk_100657890;
  id v11 = v5;
  unint64_t v12 = a3;
  id v9 = v5;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v9,  0LL,  v10);
}

- (void)schedulePassSyncBackgroundActivity
{
  if (PKCloudKitPassSyncEnabled(self, a2))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling background task to sync passes transaction",  v8,  2u);
    }

    id v5 = PDDefaultQueue();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    PDScheduledActivityClientRegister(@"PDCloudStoreClientID", self, v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
    [v7 setRequireNetworkConnectivity:1];
    [v7 setRequireMainsPower:0];
    [v7 setRepeating:1];
    [v7 setRepeatInterval:43200.0];
    PDScheduledActivityRegister(@"PDCloudStoreClientID", @"PDPassSyncActivityIdentifier", v7);
  }

- (void)schedulePassChangesBackgroundActivity
{
  if (PKCloudKitPassSyncEnabled(self, a2))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling background task to process changes",  v8,  2u);
    }

    id v5 = PDDefaultQueue();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    PDScheduledActivityClientRegister(@"PDCloudStoreClientID", self, v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
    [v7 setRequireNetworkConnectivity:1];
    [v7 setRequireMainsPower:0];
    [v7 setRepeating:1];
    [v7 setRepeatInterval:2700.0];
    PDScheduledActivityRegister(@"PDCloudStoreClientID", @"PDPassChangesActivityIdentifier", v7);
  }

- (void)_performPassSyncBackgroundActivity
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Performing scheduled background pass sync",  v7,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncContainer](self, "passSyncContainer"));
  [v5 synchronizeWithReason:1];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncSecureContainer](self, "passSyncSecureContainer"));
  [v6 synchronizeWithReason:1];
}

- (void)_performPassChangesBackgroundActivity
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Performing scheduled background pass changes processing",  v7,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncContainer](self, "passSyncContainer"));
  [v5 processPendingChangesWithReason:1];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator passSyncSecureContainer](self, "passSyncSecureContainer"));
  [v6 processPendingChangesWithReason:1];
}

- (void)refetchAccountEventsWithUnknownServicingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager identifiersForAccountServicingEventsWithStatus:]( self->_databaseManager,  "identifiersForAccountServicingEventsWithStatus:",  0LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator applePayContainer](self, "applePayContainer"));
    uint64_t v7 = PKCloudStoreOperationGroupSuffixAccountServicingEventProcessing;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1003357CC;
    v9[3] = &unk_100641010;
    id v10 = v5;
    id v11 = v4;
    void v9[4] = self;
    id v8 = v5;
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v6,  v7,  v9);
  }
}

- (void)_scheduleZoneShareIntegrityActivityForTimeInterval:(double)a3
{
  if (a3 >= 0.0)
  {
    if (PDScheduledActivityExists( @"PDCloudStoreClientID",  @"PDCloudStoreZoneShareIntegrityActivityID")) {
      PDScheduledActivityRemove(@"PDCloudStoreClientID", @"PDCloudStoreZoneShareIntegrityActivityID");
    }
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      double v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Scheduling a timer to check the zone share integrity in %f seconds.",  (uint8_t *)&v12,  0xCu);
    }

    if (a3 == 0.0)
    {
      id v8 = 0LL;
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:a3]);
    }

    id v9 = PDDefaultQueue();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    PDScheduledActivityClientRegister(@"PDCloudStoreClientID", self, v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v8));
    [v11 setRepeating:0];
    PDScheduledActivityRegister(@"PDCloudStoreClientID", @"PDCloudStoreZoneShareIntegrityActivityID", v11);
  }

- (void)_performZoneShareIntegrityOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreNotificationCoordinator applePayContainer](self, "applePayContainer"));
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Zone share integrity activity did fire",  buf,  2u);
  }

  applePayContainer = self->_applePayContainer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100335C4C;
  v8[3] = &unk_10063DAE8;
  id v9 = v3;
  id v10 = self;
  id v7 = v3;
  -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  applePayContainer,  0LL,  v8);
}

- (void)_scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _backgroundActivityNameForBackgroundInterval:]( self,  "_backgroundActivityNameForBackgroundInterval:"));
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Scheduling cloud store setup background activity with activity name %@.",  (uint8_t *)&v13,  0xCu);
  }

  id v8 = PDDefaultQueue();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  PDScheduledActivityClientRegister(@"PDCloudStoreClientID", self, v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PDCloudStoreNotificationCoordinator _nextTimeIntervalForBackgroundInterval:]( self,  "_nextTimeIntervalForBackgroundInterval:",  a3);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:"));

  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v11));
  [v12 setRepeating:0];
  [v12 setRequireNetworkConnectivity:1];
  [v12 setRequireMainsPower:a3 == 2];
  PDScheduledActivityRegister(@"PDCloudStoreClientID", v5, v12);
}

- (double)_nextTimeIntervalForBackgroundInterval:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v3 = PKForceCloudStoreInitializationFailure(self, a2) == 0;
    double result = 86400.0;
    double v5 = 300.0;
  }

  else if (a3 == 1)
  {
    BOOL v3 = PKForceCloudStoreInitializationFailure(self, a2) == 0;
    double result = 3600.0;
    double v5 = 180.0;
  }

  else
  {
    if (a3) {
      return result;
    }
    BOOL v3 = PKForceCloudStoreInitializationFailure(self, a2) == 0;
    double result = 300.0;
    double v5 = 60.0;
  }

  if (!v3) {
    return v5;
  }
  return result;
}

- (id)_backgroundActivityNameForBackgroundInterval:(unint64_t)a3
{
  if (a3 > 2) {
    return 0LL;
  }
  else {
    return *(&off_100657900 + a3);
  }
}

- (void)_recordAggdCloudStoreBackgroundContainerSetupResult:(BOOL)a3 forCurrentBackgroundInterval:(unint64_t)a4
{
  if (a4 == 2)
  {
    uint64_t v4 = PKAggDKeyCloudStoreLongBackgroundTaskFired;
    id v9 = @"success";
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
    id v10 = v5;
    id v6 = &v10;
    id v7 = &v9;
  }

  else if (a4 == 1)
  {
    uint64_t v4 = PKAggDKeyCloudStoreMediumBackgroundTaskFired;
    id v11 = @"success";
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
    int v12 = v5;
    id v6 = &v12;
    id v7 = &v11;
  }

  else
  {
    if (a4) {
      return;
    }
    uint64_t v4 = PKAggDKeyCloudStoreShortBackgroundTaskFired;
    int v13 = @"success";
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
    uint64_t v14 = v5;
    id v6 = &v14;
    id v7 = &v13;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v7,  1LL));
  PKAnalyticsSendEvent(v4, v8);
}

- (void)_scheduleFirstCloudStoreContainerSetupBackgroundActivityIfNeccessary
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Trying to schedule a background task to setup transaction container again...",  buf,  2u);
  }

  if (-[PDCloudStoreNotificationCoordinator _shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity]( self,  "_shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity"))
  {
    -[PDCloudStoreNotificationCoordinator _scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:]( self,  "_scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:",  0LL);
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "A cloud store background task is already scheduled.",  v5,  2u);
    }
  }

- (BOOL)_shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity
{
  if ((PDScheduledActivityExists(@"PDCloudStoreClientID", @"ContainerSetupShortInterval") & 1) != 0
    || (PDScheduledActivityExists(@"PDCloudStoreClientID", @"ContainerSetupMediumInterval") & 1) != 0)
  {
    return 0;
  }

  else
  {
    return PDScheduledActivityExists(@"PDCloudStoreClientID", @"ContainerSetupLongInterval") ^ 1;
  }

- (void)_unscheduleBackgroundContainerSetupActivities
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Unscheduling cloud store setup activity.",  v4,  2u);
  }

  PDScheduledActivityRemove(@"PDCloudStoreClientID", @"ContainerSetupShortInterval");
  PDScheduledActivityRemove(@"PDCloudStoreClientID", @"ContainerSetupMediumInterval");
  PDScheduledActivityRemove(@"PDCloudStoreClientID", @"ContainerSetupLongInterval");
}

- (id)pushNotificationTopics
{
  return self->_pushTopics;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = (os_log_s *)a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received message from push topic: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v7));
  id v11 = (os_log_s *)[v10 notificationType];
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 containerIdentifier]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CloudKit push for container %@", buf, 0xCu);
  }

  switch((unint64_t)v11)
  {
    case 1uLL:
    case 3uLL:
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v31 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unexpected CloudKit push notification type %ld",  buf,  0xCu);
      }

      int v13 = v9;
      goto LABEL_33;
    case 2uLL:
      __int128 v16 = v10;
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s recordZoneID](v16, "recordZoneID"));
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 zoneName]);

      uint64_t v15 = (uint64_t)-[os_log_s databaseScope](v16, "databaseScope");
      uint64_t v18 = CKDatabaseScopeString(v15);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v13;
        __int16 v32 = 2114;
        int v33 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CloudKit push notification for record zone named %@ scope: %{public}@",  buf,  0x16u);
      }

      goto LABEL_16;
    case 4uLL:
      uint64_t v15 = (uint64_t)[v10 databaseScope];
      uint64_t v19 = CKDatabaseScopeString(v15);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CloudKit push notification for database scope \"%{public}@\"",  buf,  0xCu);
      }

      int v13 = 0LL;
      __int128 v16 = v9;
LABEL_16:

      goto LABEL_17;
    default:
      uint64_t v14 = 0LL;
      int v13 = 0LL;
      uint64_t v15 = 2LL;
LABEL_17:
      id v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator _containerWithIdentifier:]( self,  "_containerWithIdentifier:",  v12));
      unsigned int v21 = v20;
      if (v20)
      {
        unsigned int v29 = v14;
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 containerManager]);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 databaseForScope:v15]);

        if (!v23)
        {
          uint64_t v14 = v29;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v13;
            __int16 v32 = 2114;
            int v33 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "There is no database associated with zone %@ in scope %{public}@",  buf,  0x16u);
          }

          goto LABEL_31;
        }

        id v28 = v7;
        id v24 = self;
        if (v13)
        {
          __int16 v25 = v6;
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v21 containerManager]);
          uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 cloudStoreZoneForZoneName:v13 inContainerDatabase:v23]);

          id v6 = v25;
          if (!v27)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v31 = v13;
              __int16 v32 = 2112;
              int v33 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "There is no cloud store zone associated with zone %@ in database %@",  buf,  0x16u);
            }

            goto LABEL_30;
          }
        }

        else
        {
          uint64_t v27 = 0LL;
        }

        -[PDCloudStoreNotificationCoordinator _processCloudStorePushNotificationForContainer:cloudStoreZone:containerDatabse:]( v24,  "_processCloudStorePushNotificationForContainer:cloudStoreZone:containerDatabse:",  v21,  v27,  v23,  v28);
        id v9 = (os_log_s *)v27;
LABEL_30:
        id v7 = v28;
        uint64_t v14 = v29;
LABEL_31:

        goto LABEL_32;
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "There is no container associated with zone: %@",  buf,  0xCu);
      }

      uint64_t v23 = v9;
LABEL_32:

LABEL_33:
      return;
  }

- (void)_processCloudStorePushNotificationForContainer:(id)a3 cloudStoreZone:(id)a4 containerDatabse:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  uint64_t v11 = CKDatabaseScopeString([(id)v10 scope]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 zoneName]);
    *(_DWORD *)buf = 138543618;
    id v31 = v15;
    __int16 v32 = 2114;
    int v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning to process push for zone: %{public}@ in scope: %{public}@",  buf,  0x16u);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 containerManager]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allPossibleZoneIDsByDatabaseIdentifier]);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 containerManager]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 containerName]);
    *(_DWORD *)buf = 138412802;
    id v31 = v19;
    __int16 v32 = 2114;
    int v33 = v12;
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "All possible zones for container %@ in scope %{public}@: %@",  buf,  0x20u);
  }

  BOOL v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v9 | v10)
  {
    if (v20)
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 zoneName]);
      *(_DWORD *)buf = 138412802;
      id v31 = v8;
      __int16 v32 = 2114;
      int v33 = v21;
      __int16 v34 = 2114;
      id v35 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetching changed records from CloudKit for container %@, zone name %{public}@, scope %{public}@",  buf,  0x20u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 zoneName]);
    if (v22)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 zoneName]);
      unsigned int v29 = v23;
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  1LL));
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    [v8 reportContainerChangeSignpostEventType:14 stateName:0 objectNames:v14 changeToken:0 error:0 operationGroupName:PKCloudStoreOperationGroupPushTriggered operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixServerPush];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100336AA0;
    v24[3] = &unk_10063A340;
    id v25 = v8;
    unsigned int v26 = self;
    id v27 = (id)v9;
    id v28 = (id)v10;
    -[PDCloudStoreNotificationCoordinator _initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:]( self,  "_initialCloudDatabaseSetupForContainer:operationGroupNameSuffix:completion:",  v25,  0LL,  v24);
  }

  else if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Either a cloud store zone or container database in order to process cloud store push. Bailing out.",  buf,  2u);
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_containerWithZoneName:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1003370A0;
  id v31 = sub_1003370B0;
  id v32 = 0LL;
  os_unfair_lock_lock(&self->_lock);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  obj = self->_containers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 containerManager]);
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 databaseForScope:a4]);

        int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 containerManager]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allPossibleZoneIDsInContainerDatabase:v12]);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1003370B8;
        v19[3] = &unk_1006578E0;
        id v15 = v6;
        unsigned int v21 = v10;
        id v22 = &v27;
        id v20 = v15;
        [v14 enumerateObjectsUsingBlock:v19];
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (id)_containerWithIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self->_containers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = *(void *)v19;
  while (2)
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "containerManager", (void)v18));
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 containerName]);

      id v13 = v4;
      id v14 = v12;
      if (v14 == v13)
      {

        goto LABEL_16;
      }

      id v15 = v14;
      if (v4 && v14)
      {
        id v16 = [v13 caseInsensitiveCompare:v14];

        if (!v16)
        {
          id v13 = v15;
LABEL_16:
          id v7 = v10;

          goto LABEL_17;
        }
      }

      else
      {
      }
    }

    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v7) {
      continue;
    }
    break;
  }

- (id)_errorWithCode:(int64_t)a3 description:(id)a4
{
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = NSLocalizedFailureReasonErrorKey;
  v10[0] = a4;
  v10[1] = a4;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  a3,  v6));

  return v7;
}

- (id)_containerForItemType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3 - 1 > 9) {
    id v6 = 0LL;
  }
  else {
    id v6 = *(id *)((char *)&self->super.isa + qword_1004D7238[a3 - 1]);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_registerForPushNotifications
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering for CloudKit push notifications",  v5,  2u);
  }

  -[PDPushNotificationManager registerConsumer:](self->_pushNotificationManager, "registerConsumer:", self);
  -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
}

- (void)_unregisterForPushNotifications
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = self->_containers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) isSetup])
        {

          os_unfair_lock_unlock(p_lock);
          return;
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unregistering for CloudKit push notifications",  v11,  2u);
  }

  -[PDPushNotificationManager unregisterConsumer:](self->_pushNotificationManager, "unregisterConsumer:", self);
  -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
}

- (BOOL)hasCachedCloudStoreZoneInApplePayContainerForZoneNames:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self->_applePayContainer, "containerManager"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend( v5,  "cloudStoreZoneExistsForZoneName:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)i),  (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)changeHistoryForContainerIdentifier:(id)a3
{
  return -[PDDatabaseManager cloudStoreContainerChangeEventsForContainerIdentifier:]( self->_databaseManager,  "cloudStoreContainerChangeEventsForContainerIdentifier:",  a3);
}

- (void).cxx_destruct
{
}

@end