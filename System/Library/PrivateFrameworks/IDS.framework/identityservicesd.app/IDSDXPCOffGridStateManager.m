@interface IDSDXPCOffGridStateManager
- (BOOL)_isConnectedForIML;
- (BOOL)_isDeviceOnline;
- (BOOL)_isExpiredProvisionedPayload:(id)a3;
- (BOOL)_isIMLRegistered;
- (BOOL)_isStewieAvailableForIML;
- (BOOL)_isStewieAvailableForSMS;
- (BOOL)_needsToRequestForIML;
- (BOOL)_needsToRequestForSMS;
- (BOOL)_needsToRequestForStewie;
- (BOOL)_shouldProvisionOffGridPayloads;
- (BOOL)isConnected;
- (BOOL)isStewieConnectedForIML;
- (BOOL)provisionRequestInProgress;
- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3;
- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3 familyManager:(id)a4 statusClient:(id)a5 connectionMonitor:(id)a6 systemMonitor:(id)a7 persistentMap:(id)a8;
- (IDSFamilyManager)familyManager;
- (IDSPersistentMap)persistentMap;
- (IDSSKStatusClient)statusClient;
- (IMDispatchTimer)clearSendKeyOnConnectTimer;
- (IMDispatchTimer)provisionTimer;
- (IMDispatchTimer)stateResetTimer;
- (IMNetworkConnectionMonitor)connectionMonitor;
- (IMSystemMonitor)systemMonitor;
- (NSData)payloadKeyToSendOnIMLConnect;
- (NSDate)lastProvisionTime;
- (NSDate)onlineSince;
- (NSError)lastProvisionError;
- (NSMutableDictionary)clientRemoteObjects;
- (OS_dispatch_queue)queue;
- (double)_clearSendKeyOnConnectInterval;
- (double)_failedProvisionInterval;
- (double)_payloadValidityDuration;
- (double)_payloadValidityRequirement;
- (double)_payloadValidityShift;
- (double)_provisionOnInviteDebounceTimeInterval;
- (double)_resetStateInterval;
- (double)_statePersistenceTimeInterval;
- (double)_successfulProvisionInterval;
- (id)_errorForDeviceOffline;
- (id)_errorForInvalidState;
- (id)_errorForNoProvisionedPayload;
- (id)_errorForStewieNotAvailable;
- (id)_fetchFamilyContactsWithPhoneNumbersOnly:(BOOL)a3;
- (id)_getDecryptionKeyForProvisionedPayloadWithStatus:(int64_t)a3;
- (id)_statusPayloadForOffGridMode:(int64_t)a3;
- (int)emergencyContactsNotificationToken;
- (int)familyContactsNotificationToken;
- (int64_t)_getRequestReason;
- (int64_t)_offGridModeDisableWhenOnlineForTimeInterval;
- (int64_t)_offGridStatusFromStatusPayload:(id)a3;
- (int64_t)offGridConnectAction;
- (int64_t)offGridMode;
- (int64_t)publishStatus;
- (os_unfair_lock_s)offGridConnectActionLock;
- (os_unfair_lock_s)provisionLock;
- (os_unfair_lock_s)publishLock;
- (unint64_t)_payloadCount;
- (unint64_t)_payloadCountPerDuration;
- (void)_areAllPrimaryContactsIMLReachableWithCompletion:(id)a3;
- (void)_calloutToDelegateWithUpdatedContacts:(id)a3;
- (void)_clearOffGridResetTimer;
- (void)_clearSendKeyOnConnect;
- (void)_clearSendKeyOnConnectTimerFired;
- (void)_connectStewieWithContext:(id)a3 options:(id)a4 withCompletion:(id)a5;
- (void)_contactsDidChange;
- (void)_emergencyContactsDidChange;
- (void)_exitStewieWithCompletion:(id)a3;
- (void)_familyContactsDidChange;
- (void)_fetchEmergencyContactsWithCompletion:(id)a3;
- (void)_initializeOffGridModeAndPublishStatusFromDisk;
- (void)_listenForContactsChangeNotifications;
- (void)_markPayloadAsSentForDecryptionKey:(id)a3;
- (void)_markProvisionRequestCompleted;
- (void)_markProvisionRequestInProgress;
- (void)_offGridPayloadProvisioningTimerFiredShouldForce:(BOOL)a3;
- (void)_offGridResetTimerFired;
- (void)_provisionOffGridPayloadsShouldForce:(BOOL)a3;
- (void)_registerSysdiagnoseBlock;
- (void)_reportOffGridEntryMetricWithService:(int64_t)a3 source:(id)a4 success:(BOOL)a5;
- (void)_reportOffGridModeMetricWithPreviousMode:(int64_t)a3 currentMode:(int64_t)a4 previousPublishStatus:(int64_t)a5 currentPublishStatus:(int64_t)a6 previousStewieConnectionStatus:(BOOL)a7 currentStewieConnectionStatus:(BOOL)a8 previousNetworkConnectionStatus:(BOOL)a9 currentNetworkConnectionStatus:(BOOL)a10 duration:(double)a11;
- (void)_resetOffGridModeIfRequired;
- (void)_scheduleClearSendOnConnectTimer;
- (void)_scheduleOffGridPayloadProvisioningTimerWithInterval:(double)a3 shouldForce:(BOOL)a4;
- (void)_scheduleOffGridResetTimerWithInterval:(double)a3;
- (void)_scheduleOrClearOffGridResetTimerIfRequired;
- (void)_setAndPersistOffGridMode:(int64_t)a3 publishStatus:(int64_t)a4;
- (void)_stewieContextForPayloadKey:(id)a3 completion:(id)a4;
- (void)_updateClientsWithCurrentStateAndError:(id)a3;
- (void)_updateOffGridConnectActionWithPayloadKey:(id)a3;
- (void)connectStewieWithCompletion:(id)a3;
- (void)dealloc;
- (void)disconnectStewieWithCompletion:(id)a3;
- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4;
- (void)fetchContactsOfType:(int64_t)a3 phoneNumbersOnly:(BOOL)a4 completion:(id)a5;
- (void)fetchCurrentOffGridMode:(id)a3;
- (void)fetchCurrentPublishStatus:(id)a3;
- (void)fetchStewieAvailabilityWithCompletion:(id)a3;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6;
- (void)invitedHandlesWithCompletion:(id)a3;
- (void)monitorConnection:(id)a3;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)setClearSendKeyOnConnectTimer:(id)a3;
- (void)setClientRemoteObjects:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setEmergencyContactsNotificationToken:(int)a3;
- (void)setFamilyContactsNotificationToken:(int)a3;
- (void)setFamilyManager:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsStewieConnectedForIML:(BOOL)a3;
- (void)setLastProvisionError:(id)a3;
- (void)setLastProvisionTime:(id)a3;
- (void)setOffGridConnectAction:(int64_t)a3;
- (void)setOffGridConnectActionLock:(os_unfair_lock_s)a3;
- (void)setOffGridMode:(int64_t)a3;
- (void)setOffGridMode:(int64_t)a3 allowOnlineEnablement:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)setOnlineSince:(id)a3;
- (void)setPayloadKeyToSendOnIMLConnect:(id)a3;
- (void)setPersistentMap:(id)a3;
- (void)setProvisionLock:(os_unfair_lock_s)a3;
- (void)setProvisionRequestInProgress:(BOOL)a3;
- (void)setProvisionTimer:(id)a3;
- (void)setPublishLock:(os_unfair_lock_s)a3;
- (void)setPublishStatus:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setStateResetTimer:(id)a3;
- (void)setStatusClient:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setupOffGridStateManagerClient:(id)a3 withUUID:(id)a4 completion:(id)a5;
- (void)statusClient:(id)a3 publishRequestCompletedForStatusPayload:(id)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)systemDidUnlock;
@end

@implementation IDSDXPCOffGridStateManager

- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3 familyManager:(id)a4 statusClient:(id)a5 connectionMonitor:(id)a6 systemMonitor:(id)a7 persistentMap:(id)a8
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___IDSDXPCOffGridStateManager;
  v18 = -[IDSDXPCOffGridStateManager init](&v32, "init");
  if (v18)
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Created IDSDXPCOffGridStateManager {self: %p}",  buf,  0xCu);
    }

    objc_storeStrong((id *)&v18->_familyManager, a4);
    objc_storeStrong((id *)&v18->_statusClient, a5);
    -[IDSSKStatusClient setDelegate:](v18->_statusClient, "setDelegate:", v18);
    if (v15) {
      v20 = (IMNetworkConnectionMonitor *)v15;
    }
    else {
      v20 = -[IMNetworkConnectionMonitor initWithRemoteHost:delegate:]( objc_alloc(&OBJC_CLASS___IMNetworkConnectionMonitor),  "initWithRemoteHost:delegate:",  0LL,  v18);
    }
    connectionMonitor = v18->_connectionMonitor;
    v18->_connectionMonitor = v20;

    objc_storeStrong((id *)&v18->_systemMonitor, a7);
    -[IMSystemMonitor addListener:](v18->_systemMonitor, "addListener:", v18);
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_persistentMap, a8);
    provisionTimer = v18->_provisionTimer;
    v18->_provisionTimer = 0LL;

    stateResetTimer = v18->_stateResetTimer;
    v18->_stateResetTimer = 0LL;

    v18->_provisionRequestInProgress = 0;
    v18->_publishLock._os_unfair_lock_opaque = 0;
    v18->_provisionLock._os_unfair_lock_opaque = 0;
    v18->_isConnected = -[IDSDXPCOffGridStateManager _isDeviceOnline](v18, "_isDeviceOnline");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    onlineSince = v18->_onlineSince;
    v18->_onlineSince = (NSDate *)v24;

    v18->_offGridConnectActionLock._os_unfair_lock_opaque = 0;
    payloadKeyToSendOnIMLConnect = v18->_payloadKeyToSendOnIMLConnect;
    v18->_payloadKeyToSendOnIMLConnect = 0LL;
    v18->_offGridConnectAction = 0LL;

    clearSendKeyOnConnectTimer = v18->_clearSendKeyOnConnectTimer;
    v18->_clearSendKeyOnConnectTimer = 0LL;

    -[IDSDXPCOffGridStateManager _registerSysdiagnoseBlock](v18, "_registerSysdiagnoseBlock");
    -[IDSDXPCOffGridStateManager _initializeOffGridModeAndPublishStatusFromDisk]( v18,  "_initializeOffGridModeAndPublishStatusFromDisk");
    -[IDSDXPCOffGridStateManager _listenForContactsChangeNotifications](v18, "_listenForContactsChangeNotifications");
  }

  return v18;
}

- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3
{
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
  v34 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
  id v7 = a3;

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.ids.offgridstatus.sk", v34);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___SKStatusPayload, v9);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SKStatusProvisionPayload, v11);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSSet, v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray, v15);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSData, v19);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDate, v21);
  uint64_t v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v12,  v14,  v16,  v18,  v20,  v22,  objc_opt_class(&OBJC_CLASS___NSNumber, v23),  0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_alloc(&OBJC_CLASS___IDSDXPCOffGridStateManager);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFamilyManager sharedInstance](&OBJC_CLASS___IDSFamilyManager, "sharedInstance"));
  v28 = objc_alloc(&OBJC_CLASS___IDSSKStatusClient);
  id v29 = -[IDSSKStatusClient initWithStatusTypeIdentifier:queue:]( v28,  "initWithStatusTypeIdentifier:queue:",  kIDSOffGridModeStatusTypeIdentifier,  v8);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  id v31 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:migrationBlock:]( objc_alloc(&OBJC_CLASS___IDSPersistentMap),  "initWithIdentifier:versionNumber:decodableClasses:migrationBlock:",  @"com.apple.identityservicesd.offgrid.provisioning.store",  1LL,  v25,  0LL);
  objc_super v32 = -[IDSDXPCOffGridStateManager initWithQueue:familyManager:statusClient:connectionMonitor:systemMonitor:persistentMap:]( v26,  "initWithQueue:familyManager:statusClient:connectionMonitor:systemMonitor:persistentMap:",  v7,  v27,  v29,  0LL,  v30,  v31);

  return v32;
}

- (void)monitorConnection:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDSDXPCOffGridStateManager monitoring new connection {self: %p, connection: %@}",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSDXPCOffGridStateManager;
  -[IDSDXPCOffGridStateManager dealloc](&v3, "dealloc");
}

- (void)_initializeOffGridModeAndPublishStatusFromDisk
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:", @"latest-offgrid-mode"));
  id v15 = v3;
  if (v3) {
    int64_t v4 = (int)[v3 intValue];
  }
  else {
    int64_t v4 = 1LL;
  }
  if (-[IDSDXPCOffGridStateManager _isDeviceOnline](self, "_isDeviceOnline")) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPersistentMap objectForKey:]( self->_persistentMap,  "objectForKey:",  @"latest-publish-status"));
  id v7 = v6;
  int64_t v8 = v5;
  if (v6) {
    int64_t v8 = (int)[v6 intValue];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPersistentMap objectForKey:]( self->_persistentMap,  "objectForKey:",  @"latest-offgrid-mode-date"));
  if (v9
    && (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now")),
        [v10 timeIntervalSinceDate:v9],
        double v12 = v11,
        -[IDSDXPCOffGridStateManager _statePersistenceTimeInterval](self, "_statePersistenceTimeInterval"),
        double v14 = v13,
        v10,
        v12 < v14))
  {
    self->_offGridMode = v4;
    self->_publishStatus = v8;
  }

  else
  {
    self->_offGridMode = 1LL;
    -[IDSDXPCOffGridStateManager _setAndPersistOffGridMode:publishStatus:]( self,  "_setAndPersistOffGridMode:publishStatus:",  1LL,  v5);
  }
}

- (void)fetchCurrentPublishStatus:(id)a3
{
}

- (void)fetchCurrentOffGridMode:(id)a3
{
}

- (void)setupOffGridStateManagerClient:(id)a3 withUUID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, int64_t, int64_t, void))a5;
  if (a3)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a3 remoteObjectProxy]);
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    double v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218242;
        uint64_t v20 = self;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Adding OffGrid state manager client {self: %p, uuid: %@}",  (uint8_t *)&v19,  0x16u);
      }

      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager clientRemoteObjects](self, "clientRemoteObjects"));
      if (!v13)
      {
        double v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[IDSDXPCOffGridStateManager setClientRemoteObjects:](self, "setClientRemoteObjects:", v14);
      }

      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager clientRemoteObjects](self, "clientRemoteObjects"));
      -[os_log_s setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v10, v8);
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10069A35C((uint64_t)self, (uint64_t)v8, v12);
    }

    v9[2](v9, self->_offGridMode, self->_publishStatus, 0LL);
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218242;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Removing OffGrid state manager client {self: %p, uuid: %@}",  (uint8_t *)&v19,  0x16u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager clientRemoteObjects](self, "clientRemoteObjects"));
    [v16 setObject:0 forKeyedSubscript:v8];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager clientRemoteObjects](self, "clientRemoteObjects"));
    id v18 = [v17 count];

    if (!v18) {
      -[IDSDXPCOffGridStateManager setClientRemoteObjects:](self, "setClientRemoteObjects:", 0LL);
    }
  }
}

- (void)_setAndPersistOffGridMode:(int64_t)a3 publishStatus:(int64_t)a4
{
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[IDSPersistentMap objectForKey:]( self->_persistentMap,  "objectForKey:",  @"latest-metric-state-changed-date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  self->_offGridMode = a3;
  persistentMap = self->_persistentMap;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[IDSPersistentMap setObject:forKey:](persistentMap, "setObject:forKey:", v9, @"latest-offgrid-mode");

  self->_publishStatus = a4;
  uint64_t v10 = self->_persistentMap;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[IDSPersistentMap setObject:forKey:](v10, "setObject:forKey:", v11, @"latest-publish-status");

  -[IDSPersistentMap setObject:forKey:]( self->_persistentMap,  "setObject:forKey:",  v7,  @"latest-offgrid-mode-date");
  -[IDSDXPCOffGridStateManager _scheduleOrClearOffGridResetTimerIfRequired]( self,  "_scheduleOrClearOffGridResetTimerIfRequired");
}

- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5
{
}

- (void)setOffGridMode:(int64_t)a3 allowOnlineEnablement:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v6 = a4;
  id v9 = (void (**)(id, int64_t, int64_t, id))a6;
  unsigned int v10 = -[IDSDXPCOffGridStateManager _isDeviceOnline](self, "_isDeviceOnline");
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v12) {
      goto LABEL_11;
    }
    int64_t offGridMode = self->_offGridMode;
    int64_t publishStatus = self->_publishStatus;
    id v15 = @"NO";
    if (v10) {
      id v15 = @"YES";
    }
    *(_DWORD *)buf = 134218754;
    int64_t v25 = offGridMode;
    __int16 v26 = 2048;
    int64_t v27 = publishStatus;
    __int16 v28 = 2048;
    int64_t v29 = a3;
    __int16 v30 = 2112;
    id v31 = v15;
    uint64_t v16 = "[Online Enablement Allowed] Received request to set offgrid mode from {Mode:%ld PublishStatus:%ld} to {Mode:%l"
          "d} {isOnline: %@}";
  }

  else
  {
    if (!v12) {
      goto LABEL_11;
    }
    int64_t v17 = self->_offGridMode;
    int64_t v18 = self->_publishStatus;
    int v19 = @"NO";
    if (v10) {
      int v19 = @"YES";
    }
    *(_DWORD *)buf = 134218754;
    int64_t v25 = v17;
    __int16 v26 = 2048;
    int64_t v27 = v18;
    __int16 v28 = 2048;
    int64_t v29 = a3;
    __int16 v30 = 2112;
    id v31 = v19;
    uint64_t v16 = "Received request to set offgrid mode from {Mode:%ld PublishStatus:%ld} to {Mode:%ld} {isOnline: %@}";
  }

  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v16, buf, 0x2Au);
LABEL_11:

  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Stewie is unavailable on this platform.",  buf,  2u);
  }

  -[IDSDXPCOffGridStateManager _setAndPersistOffGridMode:publishStatus:]( self,  "_setAndPersistOffGridMode:publishStatus:",  self->_offGridMode,  2LL);
  __int16 v21 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Stewie is unavailable on this platform.",  NSLocalizedDescriptionKey,  0LL);
  id v22 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v23 = -[NSError initWithDomain:code:userInfo:]( v22,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  1LL,  v21);
  v9[2](v9, self->_offGridMode, self->_publishStatus, v23);
}

- (void)invitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000CE86C;
  v8[3] = &unk_1008F6358;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = @"YES";
    *(_DWORD *)buf = 138412802;
    id v26 = v11;
    __int16 v27 = 2112;
    if (!v12) {
      id v15 = @"NO";
    }
    __int16 v28 = v15;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received request to send invite from sender handle %@ with payload %@ to %@",  buf,  0x20u);
  }

  if (-[IDSDXPCOffGridStateManager _isDeviceOnline](self, "_isDeviceOnline")) {
    goto LABEL_10;
  }
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cannot invite, we are offline", buf, 2u);
  }

  if (!v13)
  {
LABEL_10:
    statusClient = self->_statusClient;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000CEB1C;
    v19[3] = &unk_1008F9610;
    id v20 = v11;
    id v21 = v12;
    id v22 = v10;
    uint64_t v23 = self;
    id v24 = v13;
    -[IDSSKStatusClient inviteHandles:fromSenderHandle:withDictionaryPayload:completion:]( statusClient,  "inviteHandles:fromSenderHandle:withDictionaryPayload:completion:",  v22,  v20,  v21,  v19);

    int64_t v17 = v20;
  }

  else
  {
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager _errorForDeviceOffline](self, "_errorForDeviceOffline"));
    (*((void (**)(id, id, id, id, void *))v13 + 2))(v13, v10, v11, v12, v17);
  }
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received request to remove invite for handles %@",  buf,  0xCu);
  }

  if (-[IDSDXPCOffGridStateManager _isDeviceOnline](self, "_isDeviceOnline")) {
    goto LABEL_8;
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot remove invite, we are offline", buf, 2u);
  }

  if (!v7)
  {
LABEL_8:
    statusClient = self->_statusClient;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000CEE4C;
    v12[3] = &unk_1008F9638;
    id v13 = v6;
    double v14 = self;
    id v15 = v7;
    -[IDSSKStatusClient removeInvitedHandles:completion:](statusClient, "removeInvitedHandles:completion:", v13, v12);

    id v10 = v13;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager _errorForDeviceOffline](self, "_errorForDeviceOffline"));
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v10);
  }
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received request to remove all invites",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSKStatusClient invitedHandles](self->_statusClient, "invitedHandles"));
  statusClient = self->_statusClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000CF08C;
  v10[3] = &unk_1008F9660;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  -[IDSSKStatusClient removeAllInvitedHandlesWithCompletion:]( statusClient,  "removeAllInvitedHandlesWithCompletion:",  v10);
}

- (void)fetchStewieAvailabilityWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received request to fetch Stewie availability",  buf,  2u);
  }

  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Stewie is unavailable on this platform.",  v9,  2u);
  }

  id v6 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Stewie is unavailable on this platform.",  NSLocalizedDescriptionKey,  0LL);
  id v7 = objc_alloc(&OBJC_CLASS___NSError);
  id v8 = -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  1LL,  v6);
  (*((void (**)(id, void, void, NSError *))v3 + 2))(v3, 0LL, 0LL, v8);
}

- (void)connectStewieWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to connect Stewie.", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CF384;
  v7[3] = &unk_1008F9688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[IDSDXPCOffGridStateManager _stewieContextForPayloadKey:completion:]( self,  "_stewieContextForPayloadKey:completion:",  0LL,  v7);
}

- (void)disconnectStewieWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to disconnect Stewie", buf, 2u);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Stewie is unavailable on this platform.",  v8,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager _errorForStewieNotAvailable](self, "_errorForStewieNotAvailable"));
  v4[2](v4, v7);
}

- (void)_exitStewieWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Stewie is unavailable on this platform.",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager _errorForStewieNotAvailable](self, "_errorForStewieNotAvailable"));
  v4[2](v4, v6);
}

- (void)_connectStewieWithContext:(id)a3 options:(id)a4 withCompletion:(id)a5
{
  uint64_t v5 = (void (**)(id, id))a5;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting to connect Stewie.", buf, 2u);
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Stewie is unavailable on this platform.",  v11,  2u);
  }

  id v8 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Stewie is unavailable on this platform.",  NSLocalizedDescriptionKey,  0LL);
  id v9 = objc_alloc(&OBJC_CLASS___NSError);
  id v10 = -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  1LL,  v8);
  v5[2](v5, v10);
}

- (void)fetchContactsOfType:(int64_t)a3 phoneNumbersOnly:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client requested fetch contacts of types: %ld",  (uint8_t *)&buf,  0xCu);
  }

  if ((a3 & 3) != 0 || !v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000LL;
    id v31 = sub_1000CFA48;
    objc_super v32 = sub_1000CFA58;
    id v33 = 0LL;
    dispatch_group_t v14 = dispatch_group_create();
    uint64_t v16 = v14;
    if ((a3 & 2) != 0)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCOffGridStateManager _fetchFamilyContactsWithPhoneNumbersOnly:]( self,  "_fetchFamilyContactsWithPhoneNumbersOnly:",  v5));
      [v13 addObjectsFromArray:v17];
    }

    if ((a3 & 1) != 0)
    {
      dispatch_group_enter(v16);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000CFA60;
      v25[3] = &unk_1008F96B0;
      p___int128 buf = &buf;
      id v26 = v13;
      __int16 v27 = v16;
      -[IDSDXPCOffGridStateManager _fetchEmergencyContactsWithCompletion:]( self,  "_fetchEmergencyContactsWithCompletion:",  v25);
    }

    uint64_t v18 = im_primary_queue(v14, v15);
    int v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000CFAD0;
    v21[3] = &unk_1008F96D8;
    id v22 = v13;
    id v24 = &buf;
    id v23 = v8;
    id v20 = v13;
    dispatch_group_notify(v16, v19, v21);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v10 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    v35 = @"No valid contact type provided.";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    id v12 = -[NSError initWithDomain:code:userInfo:]( v10,  "initWithDomain:code:userInfo:",  IDSOffGridStateManagerErrorDomain,  0LL,  v11);
    (*((void (**)(id, void, NSError *))v8 + 2))(v8, 0LL, v12);
  }
}

- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4
{
}

- (id)_fetchFamilyContactsWithPhoneNumbersOnly:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFamilyManager familyHandles](self->_familyManager, "familyHandles"));
  id v7 = [v6 mutableCopy];

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Completed fetch of family handles %@",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredLocalURIsOnService:IDSServiceNameiMessage]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

  id v22 = (void *)v11;
  [v7 minusSet:v11];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v16);
        if (!v3 || IMStringIsPhoneNumber(*(void *)(*((void *)&v23 + 1) + 8LL * (void)v16)))
        {
          uint64_t v18 = objc_alloc(&OBJC_CLASS___IDSOffGridContactInfo);
          int v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithUnprefixedURI:](&OBJC_CLASS___IDSURI, "URIWithUnprefixedURI:", v17));
          id v20 = -[IDSOffGridContactInfo initWithURI:type:](v18, "initWithURI:type:", v19, 2LL);

          [v5 addObject:v20];
        }

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v14);
  }

  return v5;
}

- (void)_fetchEmergencyContactsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Stewie is unavailable on this platform.",  v8,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridStateManager _errorForStewieNotAvailable](self, "_errorForStewieNotAvailable"));
  v4[2](v4, v5, v7);
}

- (void)_scheduleOrClearOffGridResetTimerIfRequired
{
  if (self->_offGridMode == 1 && self->_publishStatus == 1)
  {
    -[IDSDXPCOffGridStateManager _clearOffGridResetTimer](self, "_clearOffGridResetTimer");
  }

  else
  {
    -[IDSDXPCOffGridStateManager _resetStateInterval](self, "_resetStateInterval");
    -[IDSDXPCOffGridStateManager _scheduleOffGridResetTimerWithInterval:]( self,  "_scheduleOffGridResetTimerWithInterval:");
  }

- (void)_scheduleOffGridResetTimerWithInterval:(double)a3
{
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    double v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduling a timer for resetting state if online for %fsec",  buf,  0xCu);
  }

  id v6 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v8 = im_primary_queue(v6, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D005C;
  v12[3] = &unk_1008F8088;
  void v12[4] = self;
  id v10 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v6,  "initWithQueue:interval:repeats:handlerBlock:",  v9,  (unint64_t)a3,  0LL,  v12);
  stateResetTimer = self->_stateResetTimer;
  self->_stateResetTimer = v10;
}

- (void)_offGridResetTimerFired
{
  stateResetTimer = self->_stateResetTimer;
  self->_stateResetTimer = 0LL;

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "reset state timer fired", buf, 2u);
  }

  uint64_t v7 = im_primary_queue(v5, v6);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D0130;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)_resetOffGridModeIfRequired
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    onlineSince = self->_onlineSince;
    int v12 = 138412290;
    uint64_t v13 = (uint64_t)onlineSince;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "We are online since: %@", (uint8_t *)&v12, 0xCu);
  }

  if (self->_offGridMode == 1 && self->_publishStatus == 1)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = self->_onlineSince;
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Offgrid more is already disabled successfully, not attempting to reset. We are online since %@",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    if (!self->_onlineSince || !-[IDSDXPCOffGridStateManager _isDeviceOnline](self, "_isDeviceOnline"))
    {
      -[IDSDXPCOffGridStateManager _resetStateInterval](self, "_resetStateInterval");
      -[IDSDXPCOffGridStateManager _scheduleOffGridResetTimerWithInterval:]( self,  "_scheduleOffGridResetTimerWithInterval:");
      return;
    }

    uint64_t v7 = -[IDSDXPCOffGridStateManager _offGridModeDisableWhenOnlineForTimeInterval]( self,  "_offGridModeDisableWhenOnlineForTimeInterval");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  self->_onlineSince,  (double)v7));
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reset time: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s earlierDate:](v5, "earlierDate:", v9));

    if (v10 == v5)
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        uint64_t v13 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Disabling offgrid mode as we were online for more than %ldsec",  (uint8_t *)&v12,  0xCu);
      }

      -[IDSDXPCOffGridStateManager _disableOffGridModeViaStatusClient](self, "_disableOffGridModeViaStatusClient");
    }

    else
    {
      -[IDSDXPCOffGridStateManager _resetStateInterval](self, "_resetStateInterval");
      -[IDSDXPCOffGridStateManager _scheduleOffGridResetTimerWithInterval:]( self,  "_scheduleOffGridResetTimerWithInterval:");
    }
  }
}

- (void)_clearOffGridResetTimer
{
  stateResetTimer = self->_stateResetTimer;
  if (stateResetTimer)
  {
    -[IMDispatchTimer invalidate](stateResetTimer, "invalidate");
    id v4 = self->_stateResetTimer;
    self->_stateResetTimer = 0LL;
  }

- (void)_calloutToDelegateWithUpdatedContacts:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Contact infos changed - calling out to client delegate { updatedContacts: %@ }",  buf,  0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_clientRemoteObjects, "allKeys", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjects,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10)));
        [v11 contactInfoUpdated:v4];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)_listenForContactsChangeNotifications
{
  p_familyContactsNotificationToken = &self->_familyContactsNotificationToken;
  uint64_t v4 = im_primary_queue(self, a2);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000D0624;
  handler[3] = &unk_1008F9700;
  handler[4] = self;
  uint32_t v6 = notify_register_dispatch("com.apple.family.family_updated", p_familyContactsNotificationToken, v5, handler);

  if (v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10069A3E0(v6, v7);
    }
  }

- (void)_emergencyContactsDidChange
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified emergency contacts changed!", v4, 2u);
  }

  -[IDSDXPCOffGridStateManager _contactsDidChange](self, "_contactsDidChange");
}

- (void)_familyContactsDidChange
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified family contacts changed!", v4, 2u);
  }

  -[IDSDXPCOffGridStateManager _contactsDidChange](self, "_contactsDidChange");
}

- (void)_contactsDidChange
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D079C;
  v4[3] = &unk_1008F9728;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[IDSDXPCOffGridStateManager _fetchFamilyContactsWithPhoneNumbersOnly:]( self,  "_fetchFamilyContactsWithPhoneNumbersOnly:",  1LL));
  uint32_t v6 = self;
  id v3 = v5;
  -[IDSDXPCOffGridStateManager _fetchEmergencyContactsWithCompletion:]( self,  "_fetchEmergencyContactsWithCompletion:",  v4);
}

- (void)_scheduleOffGridPayloadProvisioningTimerWithInterval:(double)a3 shouldForce:(BOOL)a4
{
  BOOL v4 = a4;
  provisionTimer = self->_provisionTimer;
  if (provisionTimer)
  {
    -[IMDispatchTimer invalidate](provisionTimer, "invalidate");
    id v8 = self->_provisionTimer;
    self->_provisionTimer = 0LL;
  }

  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v4) {
      id v10 = @"YES";
    }
    *(_DWORD *)__int128 buf = 134218242;
    double v20 = a3;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scheduling a timer for provisioning payloads in: %fsec shouldForce %@",  buf,  0x16u);
  }

  uint64_t v11 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v13 = im_primary_queue(v11, v12);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000D0968;
  v17[3] = &unk_1008F9750;
  v17[4] = self;
  BOOL v18 = v4;
  __int128 v15 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v11,  "initWithQueue:interval:repeats:handlerBlock:",  v14,  (unint64_t)a3,  0LL,  v17);
  uint64_t v16 = self->_provisionTimer;
  self->_provisionTimer = v15;
}

- (void)_offGridPayloadProvisioningTimerFiredShouldForce:(BOOL)a3
{
  provisionTimer = self->_provisionTimer;
  self->_provisionTimer = 0LL;

  uint32_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Payload provisioning timer fired", buf, 2u);
  }

  uint64_t v9 = im_primary_queue(v7, v8);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D0A54;
  v11[3] = &unk_1008F6418;
  v11[4] = self;
  BOOL v12 = a3;
  dispatch_async(v10, v11);
}

- (BOOL)_isExpiredProvisionedPayload:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 validUntil]);
  uint32_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 laterDate:v5]);
  unsigned int v7 = [v6 isEqualToDate:v4];

  if (v7)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Provisioned payload is expired. { provisionedPayload: %@, currentDate: %@ }",  (uint8_t *)&v10,  0x16u);
    }
  }

  return v7;
}

- (BOOL)_shouldProvisionOffGridPayloads
{
  if (!self->_provisionRequestInProgress)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPersistentMap objectForKey:]( self->_persistentMap,  "objectForKey:",  @"provisioned-payloads"));
    v2 = v5;
    if (v5 && [v5 count])
    {
      uint32_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSPersistentMap objectForKey:]( self->_persistentMap,  "objectForKey:",  @"sent-payload-id"));
      unsigned int v7 = v6;
      if (!v6 || !-[os_log_s count](v6, "count"))
      {
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v9 = v2;
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if (-[IDSDXPCOffGridStateManager _isExpiredProvisionedPayload:]( self,  "_isExpiredProvisionedPayload:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  (void)v16))
              {
                __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "We have an expired payload, should reprovision",  buf,  2u);
                }

                goto LABEL_26;
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        BOOL v3 = 0;
        goto LABEL_27;
      }

      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "We've sent a payload, should reprovision.",  buf,  2u);
      }
    }

    else
    {
      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "We currently have no payloads provisioned, need to provision.",  buf,  2u);
      }
    }

- (void)_provisionOffGridPayloadsShouldForce:(BOOL)a3
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager",  a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10069A450();
  }
}

- (void)_markProvisionRequestInProgress
{
  p_provisionLock = &self->_provisionLock;
  os_unfair_lock_lock(&self->_provisionLock);
  self->_provisionRequestInProgress = 1;
  os_unfair_lock_unlock(p_provisionLock);
}

- (void)_markProvisionRequestCompleted
{
  p_provisionLock = &self->_provisionLock;
  os_unfair_lock_lock(&self->_provisionLock);
  self->_provisionRequestInProgress = 0;
  os_unfair_lock_unlock(p_provisionLock);
}

- (void)_updateOffGridConnectActionWithPayloadKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_offGridConnectActionLock);
  if (v4)
  {
    id v5 = (NSData *)v4;
    int64_t v6 = 1LL;
  }

  else
  {
    id v5 = 0LL;
    int64_t v6 = 0LL;
  }

  payloadKeyToSendOnIMLConnect = self->_payloadKeyToSendOnIMLConnect;
  self->_payloadKeyToSendOnIMLConnect = v5;

  self->_int64_t offGridConnectAction = v6;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_payloadKeyToSendOnIMLConnect;
    int64_t offGridConnectAction = self->_offGridConnectAction;
    int v11 = 134218242;
    int64_t v12 = offGridConnectAction;
    __int16 v13 = 2112;
    __int128 v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updated OffGrid connect action to %ld for payloadKey %@",  (uint8_t *)&v11,  0x16u);
  }

  os_unfair_lock_unlock(&self->_offGridConnectActionLock);
}

- (void)_markPayloadAsSentForDecryptionKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:", @"provisioned-payloads"));
  int64_t v6 = v5;
  if (!v4 || !v5 || ![v5 count])
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v28 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Could not find payload with decryption key %@",  buf,  0xCu);
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  id v10 = v8;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
LABEL_9:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v8);
      }
      __int128 v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "decryptionKey", (void)v22));
      unsigned __int8 v16 = [v15 isEqualToData:v4];

      if ((v16 & 1) != 0) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          goto LABEL_9;
        }
        id v10 = v8;
        goto LABEL_22;
      }
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);

    if (!v10) {
      goto LABEL_23;
    }
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Saving sent payload identifier %@",  buf,  0xCu);
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:", @"sent-payload-id"));
    __int128 v19 = (NSMutableSet *)[v18 mutableCopy];

    if (!v19) {
      __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    }
    -[NSMutableSet addObject:](v19, "addObject:", v10);
    persistentMap = self->_persistentMap;
    id v21 = -[NSMutableSet copy](v19, "copy");
    -[IDSPersistentMap setObject:forKey:](persistentMap, "setObject:forKey:", v21, @"sent-payload-id");
  }

- (id)_getDecryptionKeyForProvisionedPayloadWithStatus:(int64_t)a3
{
  BOOL v3 = self;
  persistentMap = self->_persistentMap;
  if (!persistentMap) {
    return 0LL;
  }
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](persistentMap, "objectForKey:", @"provisioned-payloads"));
  unsigned int v7 = v6;
  if (v6 && [v6 count])
  {
    id v31 = (NSSet *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](v3->_persistentMap, "objectForKey:", @"sent-payload-id"));
    if (!v31) {
      id v31 = objc_alloc_init(&OBJC_CLASS___NSSet);
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v30 = v7;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v42;
      int64_t v37 = a3;
      v38 = v8;
      v35 = v9;
      v36 = v3;
      uint64_t v39 = *(void *)v42;
LABEL_8:
      uint64_t v13 = 0LL;
      id v40 = v11;
      while (1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 statusPayload]);
        if (-[IDSDXPCOffGridStateManager _offGridStatusFromStatusPayload:](v3, "_offGridStatusFromStatusPayload:", v15) == a3)
        {
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 validFrom]);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 earlierDate:v8]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 validFrom]);
          if (v17 == v18)
          {
            -[IDSDXPCOffGridStateManager _payloadValidityRequirement](v3, "_payloadValidityRequirement");
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:"));
            double v20 = (void *)objc_claimAutoreleasedReturnValue([v14 validUntil]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 laterDate:v20]);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v14 validUntil]);
            if (v21 == v22)
            {
              uint64_t v23 = objc_claimAutoreleasedReturnValue([v14 decryptionKey]);
              if (v23)
              {
                id v33 = (void *)v23;
                objc_super v32 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
                unsigned __int8 v34 = -[NSSet containsObject:](v31, "containsObject:", v32);

                a3 = v37;
                id v8 = v38;
                id v9 = v35;
                BOOL v3 = v36;
                uint64_t v12 = v39;
                id v11 = v40;
                if ((v34 & 1) == 0)
                {
                  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)__int128 buf = 138412290;
                    v46 = v14;
                    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Found a valid payload: %@",  buf,  0xCu);
                  }

                  id v25 = v14;
                  if (v25)
                  {
                    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 decryptionKey]);
                    goto LABEL_36;
                  }

                  goto LABEL_25;
                }

                goto LABEL_17;
              }
            }

            a3 = v37;
            id v8 = v38;
            id v9 = v35;
            BOOL v3 = v36;
          }

          uint64_t v12 = v39;
          id v11 = v40;
        }

LABEL_17:
        if (v11 == (id)++v13)
        {
          id v24 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
          id v11 = v24;
          if (v24) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

LABEL_25:
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridStateManager](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridStateManager"));
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      sub_10069A4A8();
    }
    __int128 v26 = 0LL;
LABEL_36:
    unsigned int v7 = v30;
  }

  else
  {
    id v31 = (NSSet *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR)) {
      sub_10069A47C();
    }
    __int128 v26 = 0LL;
  }

  return v26;
}

- (BOOL)_isStewieAvailableForIML
{
  return 0;
}

- (BOOL)_isStewieAvailableForSMS
{
  return 0;
}

- (BOOL)_needsToRequestForStewie
{
  if (-[IDSDXPCOffGridStateManager _needsToRequestForIML](self, "_needsToRequestForIML")) {
    return 1;
  }
  else {
    return -[IDSDXPCOffGridStateManager _needsToRequestForSMS](self, "_needsToRequestForSMS");
  }
}

- (BOOL)_needsToRequestForSMS
{
  return 0;
}

- (BOOL)_isIMLRegistered
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceWithIdentifier:IDSServiceNameiMessageLite]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 registeredAccountsOnService:v3]);

  if (v5)
  {
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_needsToRequestForIML
{
  return 0;
}

- (BOOL)_isConnectedForIML
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isStewieConnectedForIML) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v6 = 138412290;
    BOOL v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "isConnectedForIML %@", (uint8_t *)&v6, 0xCu);
  }

  return self->_isStewieConnectedForIML;
}

- (void)_stewieContextForPayloadKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___CTStewieRequestContext);
  objc_msgSend(v7, "setReason:", -[IDSDXPCOffGridStateManager _getRequestReason](self, "_getRequestReason"));
  id v8 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a3 && ([v7 reason] == (id)8 || objc_msgSend(v7, "reason") == (id)9)) {
    CFDictionarySetValue(v8, kCTStewieRequestWaitForOffGridModeMessage, &__kCFBooleanTrue);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D1958;
  v12[3] = &unk_1008F9778;
  uint64_t v13 = v8;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  -[IDSDXPCOffGridStateManager _areAllPrimaryContactsIMLReachableWithCompletion:]( self,  "_areAllPrimaryContactsIMLReachableWithCompletion:",  v12);
}

- (int64_t)_getRequestReason
{
  if (-[IDSDXPCOffGridStateManager _needsToRequestForIML](self, "_needsToRequestForIML")
    && -[IDSDXPCOffGridStateManager _needsToRequestForSMS](self, "_needsToRequestForSMS"))
  {
    int64_t v3 = 8LL;
  }

  else if (-[IDSDXPCOffGridStateManager _needsToRequestForIML](self, "_needsToRequestForIML"))
  {
    int64_t v3 = 9LL;
  }

  else if (-[IDSDXPCOffGridStateManager _needsToRequestForSMS](self, "_needsToRequestForSMS"))
  {
    int64_t v3 = 10LL;
  }

  else
  {
    int64_t v3 = 0LL;
  }

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = CTStewieRequestReasonAsString(v3);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request reason %s", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)_errorForDeviceOffline
{
  v2 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Device is not connected to the internet",  NSLocalizedDescriptionKey,  0LL);
  int64_t v3 = objc_alloc(&OBJC_CLASS___NSError);
  id v4 = -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  8LL,  v2);

  return v4;
}

- (id)_errorForNoProvisionedPayload
{
  v2 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"No provisioned key for offgrid provisioned payload.",  NSLocalizedDescriptionKey,  0LL);
  int64_t v3 = objc_alloc(&OBJC_CLASS___NSError);
  id v4 = -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  5LL,  v2);

  return v4;
}

- (id)_errorForInvalidState
{
  v2 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Invalid state requested.",  NSLocalizedDescriptionKey,  0LL);
  int64_t v3 = objc_alloc(&OBJC_CLASS___NSError);
  id v4 = -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  7LL,  v2);

  return v4;
}

- (id)_errorForStewieNotAvailable
{
  v2 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Stewie is not available.",  NSLocalizedDescriptionKey,  0LL);
  int64_t v3 = objc_alloc(&OBJC_CLASS___NSError);
  id v4 = -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  1LL,  v2);

  return v4;
}

- (void)_reportOffGridModeMetricWithPreviousMode:(int64_t)a3 currentMode:(int64_t)a4 previousPublishStatus:(int64_t)a5 currentPublishStatus:(int64_t)a6 previousStewieConnectionStatus:(BOOL)a7 currentStewieConnectionStatus:(BOOL)a8 previousNetworkConnectionStatus:(BOOL)a9 currentNetworkConnectionStatus:(BOOL)a10 duration:(double)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  id v18 = objc_alloc(&OBJC_CLASS___IDSOffTheGridModeMetric);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a11));
  LOWORD(v29) = __PAIR16__(a10, a9);
  id v24 = objc_msgSend( v18,  "initWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionState:curr entStewieConnectionState:previousNetworkConnectionState:currentNetworkConnectionState:duration:",  v19,  v20,  v21,  v22,  v13,  v12,  v29,  v23);

  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v24 dictionaryRepresentation]);
    *(_DWORD *)__int128 buf = 138412546;
    id v31 = v26;
    __int16 v32 = 2112;
    id v33 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Metrics: Reporting %@ with %@", buf, 0x16u);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v28 logMetric:v24];
}

- (void)_reportOffGridEntryMetricWithService:(int64_t)a3 source:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___IDSOffGridEntryMetric);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v12 = [v8 initWithService:v9 source:v7 date:v10 success:v5];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v11 logMetric:v12];
}

- (void)_areAllPrimaryContactsIMLReachableWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D1FF0;
  v5[3] = &unk_1008F97A0;
  id v6 = a3;
  id v4 = v6;
  -[IDSDXPCOffGridStateManager fetchContactsOfType:completion:](self, "fetchContactsOfType:completion:", 3LL, v5);
}

- (void)_scheduleClearSendOnConnectTimer
{
  clearSendKeyOnConnectTimer = self->_clearSendKeyOnConnectTimer;
  if (clearSendKeyOnConnectTimer)
  {
    -[IMDispatchTimer invalidate](clearSendKeyOnConnectTimer, "invalidate");
    id v4 = self->_clearSendKeyOnConnectTimer;
    self->_clearSendKeyOnConnectTimer = 0LL;
  }

  -[IDSDXPCOffGridStateManager _clearSendKeyOnConnectInterval](self, "_clearSendKeyOnConnectInterval");
  double v6 = v5;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    double v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Scheduling a timer for clearSendKeyOnConnectTimer in: %f",  buf,  0xCu);
  }

  id v8 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v10 = im_primary_queue(v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000D2340;
  v14[3] = &unk_1008F8088;
  v14[4] = self;
  id v12 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v8,  "initWithQueue:interval:repeats:handlerBlock:",  v11,  (unint64_t)v6,  0LL,  v14);
  BOOL v13 = self->_clearSendKeyOnConnectTimer;
  self->_clearSendKeyOnConnectTimer = v12;
}

- (void)_clearSendKeyOnConnectTimerFired
{
  clearSendKeyOnConnectTimer = self->_clearSendKeyOnConnectTimer;
  self->_clearSendKeyOnConnectTimer = 0LL;

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "clearSendPayloadKeyOnConnectTimer fired",  buf,  2u);
  }

  uint64_t v7 = im_primary_queue(v5, v6);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D2414;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)_clearSendKeyOnConnect
{
  if (self->_payloadKeyToSendOnIMLConnect)
  {
    int64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10069A4D4();
    }

    id v4 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Timed out while sending provisioned key on IML connect",  NSLocalizedDescriptionKey,  0LL);
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v6 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  6LL,  v4);
    -[IDSDXPCOffGridStateManager _updateOffGridConnectActionWithPayloadKey:]( self,  "_updateOffGridConnectActionWithPayloadKey:",  0LL);
    -[IDSDXPCOffGridStateManager _setAndPersistOffGridMode:publishStatus:]( self,  "_setAndPersistOffGridMode:publishStatus:",  self->_offGridMode,  2LL);
    -[IDSDXPCOffGridStateManager _updateClientsWithCurrentStateAndError:]( self,  "_updateClientsWithCurrentStateAndError:",  v6);
  }

- (void)_updateClientsWithCurrentStateAndError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t offGridMode = self->_offGridMode;
    int64_t publishStatus = self->_publishStatus;
    *(_DWORD *)__int128 buf = 134218240;
    int64_t v20 = offGridMode;
    __int16 v21 = 2048;
    int64_t v22 = publishStatus;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updating clients: Current OffGrid Mode: {%ld} Publish Status: {%ld}",  buf,  0x16u);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_clientRemoteObjects, "allKeys", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjects,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12)));
        [v13 offGridModeUpdated:self->_offGridMode publishStatus:self->_publishStatus error:v4];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (BOOL)_isDeviceOnline
{
  return -[IMNetworkConnectionMonitor isImmediatelyReachable]( self->_connectionMonitor,  "isImmediatelyReachable");
}

- (void)statusClient:(id)a3 publishRequestCompletedForStatusPayload:(id)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  int64_t v9 = -[IDSDXPCOffGridStateManager _offGridStatusFromStatusPayload:](self, "_offGridStatusFromStatusPayload:", a4);
  if (v10 || !v6 || !v9) {
    -[IDSDXPCOffGridStateManager _setAndPersistOffGridMode:publishStatus:]( self,  "_setAndPersistOffGridMode:publishStatus:",  self->_offGridMode,  2LL);
  }
  -[IDSDXPCOffGridStateManager _updateClientsWithCurrentStateAndError:]( self,  "_updateClientsWithCurrentStateAndError:",  v10);
}

- (id)_statusPayloadForOffGridMode:(int64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, IDSOffGridStatusPayloadStatusKey);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushToken]);

  if (v7)
  {
    id v8 = v7;
    CFDictionarySetValue((CFMutableDictionaryRef)v4, IDSOffGridStatusPayloadStatusTokenKey, v8);
  }

  else
  {
    int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10069A500();
    }
  }

  id v10 = objc_msgSend( objc_alloc((Class)IMWeakLinkClass(@"SKStatusPayload", @"StatusKit")),  "initWithDictionary:",  v4);
  return v10;
}

- (int64_t)_offGridStatusFromStatusPayload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 payloadDictionary]);
  if (!v5) {
    goto LABEL_5;
  }
  BOOL v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadDictionary]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  uint64_t v9 = IDSOffGridStatusPayloadStatusKey;
  unsigned __int8 v10 = [v8 containsObject:IDSOffGridStatusPayloadStatusKey];

  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadDictionary]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);
    id v13 = [v12 integerValue];
  }

  else
  {
LABEL_5:
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10069A52C((uint64_t)v4, v14);
    }

    id v13 = 0LL;
  }

  return (int64_t)v13;
}

- (double)_payloadValidityDuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-status-payload-validity-sec"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 5184000.0;
  }

  return v7;
}

- (double)_payloadValidityShift
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-status-publish-expiration-sec"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 2592000.0;
  }

  return v7;
}

- (double)_payloadValidityRequirement
{
  return v2 + -1.0;
}

- (unint64_t)_payloadCount
{
  unint64_t v2 = 1LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"shared-channels-cp-status-payload-intervals"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    unint64_t v2 = (unint64_t)[v4 integerValue];
  }

  return v2;
}

- (unint64_t)_payloadCountPerDuration
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-status-payloads-per-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unint64_t v6 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v6 = 5LL;
  }

  return v6;
}

- (double)_successfulProvisionInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-successful-provision-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 2592000.0;
  }

  return v7;
}

- (double)_failedProvisionInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-failed-provision-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 600.0;
  }

  return v7;
}

- (double)_resetStateInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-reset-state-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 300.0;
  }

  return v7;
}

- (double)_clearSendKeyOnConnectInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-send-key-on-connect-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  double v6 = 10.0;
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v6 = v7;
  }

  return v6;
}

- (double)_statePersistenceTimeInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-state-persistence-time-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 2592000.0;
  }

  return v7;
}

- (double)_provisionOnInviteDebounceTimeInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKey:@"shared-channels-cp-provision-on-invitation-debounce-delay-time-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 120.0;
  }

  return v7;
}

- (int64_t)_offGridModeDisableWhenOnlineForTimeInterval
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"shared-channels-cp-disable-when-online-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    int64_t v6 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v6 = 900LL;
  }
  if (+[IMUserDefaults offGridModeDisableWhenOnlineForTimeInterval]( &OBJC_CLASS___IMUserDefaults,  "offGridModeDisableWhenOnlineForTimeInterval") >= 1) {
    int64_t v6 = +[IMUserDefaults offGridModeDisableWhenOnlineForTimeInterval]( &OBJC_CLASS___IMUserDefaults,  "offGridModeDisableWhenOnlineForTimeInterval");
  }

  return v6;
}

- (void)systemDidUnlock
{
  unint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridStateManager]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridStateManager"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "System did unlock.", v3, 2u);
  }
}

- (void)_registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000D3080;
  v6[3] = &unk_1008F97C8;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = im_primary_queue(v2, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100301AD8(v6, (uint64_t)@"IDS-OffGrid-State-Manager", (uint64_t)v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (IDSFamilyManager)familyManager
{
  return self->_familyManager;
}

- (void)setFamilyManager:(id)a3
{
}

- (IDSSKStatusClient)statusClient
{
  return self->_statusClient;
}

- (void)setStatusClient:(id)a3
{
}

- (IMNetworkConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (int64_t)offGridMode
{
  return self->_offGridMode;
}

- (void)setOffGridMode:(int64_t)a3
{
  self->_int64_t offGridMode = a3;
}

- (int64_t)publishStatus
{
  return self->_publishStatus;
}

- (void)setPublishStatus:(int64_t)a3
{
  self->_int64_t publishStatus = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSDate)onlineSince
{
  return self->_onlineSince;
}

- (void)setOnlineSince:(id)a3
{
}

- (IMDispatchTimer)stateResetTimer
{
  return self->_stateResetTimer;
}

- (void)setStateResetTimer:(id)a3
{
}

- (BOOL)isStewieConnectedForIML
{
  return self->_isStewieConnectedForIML;
}

- (void)setIsStewieConnectedForIML:(BOOL)a3
{
  self->_isStewieConnectedForIML = a3;
}

- (os_unfair_lock_s)publishLock
{
  return self->_publishLock;
}

- (void)setPublishLock:(os_unfair_lock_s)a3
{
  self->_publishLock = a3;
}

- (BOOL)provisionRequestInProgress
{
  return self->_provisionRequestInProgress;
}

- (void)setProvisionRequestInProgress:(BOOL)a3
{
  self->_provisionRequestInProgress = a3;
}

- (os_unfair_lock_s)provisionLock
{
  return self->_provisionLock;
}

- (void)setProvisionLock:(os_unfair_lock_s)a3
{
  self->_provisionLock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)clientRemoteObjects
{
  return self->_clientRemoteObjects;
}

- (void)setClientRemoteObjects:(id)a3
{
}

- (IMDispatchTimer)provisionTimer
{
  return self->_provisionTimer;
}

- (void)setProvisionTimer:(id)a3
{
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (NSDate)lastProvisionTime
{
  return self->_lastProvisionTime;
}

- (void)setLastProvisionTime:(id)a3
{
}

- (NSError)lastProvisionError
{
  return self->_lastProvisionError;
}

- (void)setLastProvisionError:(id)a3
{
}

- (IMDispatchTimer)clearSendKeyOnConnectTimer
{
  return self->_clearSendKeyOnConnectTimer;
}

- (void)setClearSendKeyOnConnectTimer:(id)a3
{
}

- (NSData)payloadKeyToSendOnIMLConnect
{
  return self->_payloadKeyToSendOnIMLConnect;
}

- (void)setPayloadKeyToSendOnIMLConnect:(id)a3
{
}

- (int64_t)offGridConnectAction
{
  return self->_offGridConnectAction;
}

- (void)setOffGridConnectAction:(int64_t)a3
{
  self->_int64_t offGridConnectAction = a3;
}

- (os_unfair_lock_s)offGridConnectActionLock
{
  return self->_offGridConnectActionLock;
}

- (void)setOffGridConnectActionLock:(os_unfair_lock_s)a3
{
  self->_offGridConnectActionLock = a3;
}

- (int)emergencyContactsNotificationToken
{
  return self->_emergencyContactsNotificationToken;
}

- (void)setEmergencyContactsNotificationToken:(int)a3
{
  self->_emergencyContactsNotificationToken = a3;
}

- (int)familyContactsNotificationToken
{
  return self->_familyContactsNotificationToken;
}

- (void)setFamilyContactsNotificationToken:(int)a3
{
  self->_familyContactsNotificationToken = a3;
}

- (void).cxx_destruct
{
}

@end