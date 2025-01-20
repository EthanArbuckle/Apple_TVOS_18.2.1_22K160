@interface PDTransitNotificationService
- (BOOL)_hasExistingTransitPassesForMarket:(id)a3;
- (BOOL)_shouldSendDCIRenotifyNotificationForTransitMarket:(id)a3;
- (BOOL)_shouldSendNotificationsPassingBaseRequirementsForTransitMarket:(id)a3;
- (BOOL)_shouldSendOpenLoopRenotifyNotificationForTransitMarket:(id)a3;
- (BOOL)_shouldTrigger;
- (PDTransitNotificationService)initWithPaymentWebServiceCoordinator:(id)a3 notificationManager:(id)a4 userNotificationManager:(id)a5 databaseManager:(id)a6 expressPassManager:(id)a7 upgradeController:(id)a8;
- (PDUserNotificationManager)userNotificationManager;
- (id)_eligibleMarketNames:(id)a3;
- (id)_existingTransitPassesForMarket:(id)a3;
- (id)_expressPaymentNetworkNamesForPass:(id)a3;
- (id)_expressUpgradeableOpenLoopPassesForMarket:(id)a3;
- (id)_hasSentRenotifyNotificationForRenotifyCampaign:(id)a3;
- (id)_sentRenotifyNotificationsForRenotifiyIdentifier:(id)a3;
- (id)_startTime;
- (id)_transitProducts:(id)a3 forMarket:(id)a4;
- (id)createCurrentNotificationRegistrationState;
- (unint64_t)_eligibleNotificationsForTransitMarket:(id)a3;
- (unint64_t)_hasSentNotificationForMarket:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_availableProductsForNotifiableMarkets:(id)a3 filteredForTargetDevice:(id)a4 completion:(id)a5;
- (void)_beginReportingIfNecessary;
- (void)_checkForNotification;
- (void)_cleanupLocationMonitoring;
- (void)_clearTransitNotificationHistory;
- (void)_connect;
- (void)_endReportingIfNecessary;
- (void)_expressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 expressUpgrade:(BOOL)a6 isReferredFromWatch:(BOOL)a7 completion:(id)a8;
- (void)_expressRenotifiableOpenLoopPassesForViableMarkets:(id)a3 completion:(id)a4;
- (void)_expressUpgradesAvailableNotificationForPass:(id)a3 completion:(id)a4;
- (void)_multipleProductsNotificationForMarket:(id)a3 renotify:(BOOL)a4 completion:(id)a5;
- (void)_postNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 transitProducts:(id)a5 upgradeableOpenLoopPasses:(id)a6 renotifiableProducts:(id)a7 renotifiablePasses:(id)a8 completion:(id)a9;
- (void)_productNotificationMessageForMarket:(id)a3 product:(id)a4 renotify:(BOOL)a5 completion:(id)a6;
- (void)_recordNotificationType:(unint64_t)a3 sentForMarket:(id)a4;
- (void)_recordNotificationType:(unint64_t)a3 sentForMarkets:(id)a4;
- (void)_reportEvent:(id)a3 forMarket:(id)a4 eligibleMarkets:(id)a5 pass:(id)a6;
- (void)_reportExpressEnable:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5;
- (void)_reportExpressModeEnableFailed:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5;
- (void)_reportExpressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 pageTag:(id)a6 isReferredFromWatch:(BOOL)a7;
- (void)_scheduleCheckIn;
- (void)_schedulePromotedExpressModeNotificationDemotion:(id)a3;
- (void)_shouldScheduleNotificationActivity:(id)a3;
- (void)_startLocationMonitoring;
- (void)_unscheduleCheckIn;
- (void)_upgradeFromNotificationCountToNotificationTypes;
- (void)checkForNotification;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)noteAccountRemoved;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4;
- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4;
- (void)registerObserver:(id)a3;
- (void)sentTransitNotificationStateWithHandler:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateRegistrationForTriggerEvents;
@end

@implementation PDTransitNotificationService

- (PDTransitNotificationService)initWithPaymentWebServiceCoordinator:(id)a3 notificationManager:(id)a4 userNotificationManager:(id)a5 databaseManager:(id)a6 expressPassManager:(id)a7 upgradeController:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PDTransitNotificationService;
  v18 = -[PDTransitNotificationService init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a3);
    objc_storeStrong((id *)&v19->_notificationManager, a4);
    objc_storeStrong((id *)&v19->_userNotificationManager, a5);
    objc_storeStrong((id *)&v19->_databaseManager, a6);
    objc_storeStrong((id *)&v19->_expressPassManager, a7);
    objc_storeStrong((id *)&v19->_upgradeController, a8);
    v19->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v20;

    -[PDTransitNotificationService _upgradeFromNotificationCountToNotificationTypes]( v19,  "_upgradeFromNotificationCountToNotificationTypes");
    -[PDTransitNotificationService _connect](v19, "_connect");
  }

  return v19;
}

- (void)checkForNotification
{
  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: checking for market support in response to API",  v5,  2u);
  }

  -[PDTransitNotificationService _checkForNotification](self, "_checkForNotification");
}

- (void)noteAccountRemoved
{
}

- (void)_checkForNotification
{
  if (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    unsigned int v4 = [v3 isLowPowerModeEnabled];

    if (v4)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Skipping check because of low power mode",  buf,  2u);
      }
    }

    else
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1002EBD5C;
      v7[3] = &unk_1006426D8;
      id v8 = (id)PDOSTransactionCreate("PDTransitNotificationService.check");
      v9 = self;
      v6 = (os_log_s *)v8;
      -[PDTransitNotificationService _shouldScheduleNotificationActivity:]( self,  "_shouldScheduleNotificationActivity:",  v7);
    }
  }

- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: requested post upgraded Pass Notification for market:%@ pass with uniqueID:%@",  buf,  0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002EBFC8;
  v14[3] = &unk_100654A38;
  v14[4] = self;
  id v15 = v6;
  id v16 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v6, 0LL);
  id v17 = v7;
  id v11 = v7;
  v12 = v16;
  id v13 = v6;
  -[PDTransitNotificationService _expressNotificationForMarket:eligibleMarkets:pass:expressUpgrade:isReferredFromWatch:completion:]( self,  "_expressNotificationForMarket:eligibleMarkets:pass:expressUpgrade:isReferredFromWatch:completion:",  v13,  v12,  v11,  1LL,  1LL,  v14);
}

- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: requested post Upgrade Selection Notification for for market:%@ pass with uniqueID:%@",  buf,  0x16u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002EC254;
  v13[3] = &unk_100654A60;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  -[PDTransitNotificationService _expressUpgradesAvailableNotificationForPass:completion:]( self,  "_expressUpgradesAvailableNotificationForPass:completion:",  v11,  v13);
}

- (id)createCurrentNotificationRegistrationState
{
  return 0LL;
}

- (void)updateRegistrationForTriggerEvents
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_registeredForImmediateTriggerEvents);
  unsigned int v4 = -[PDTransitNotificationService _shouldTrigger](self, "_shouldTrigger");
  if (((v4 ^ ((v3 & 1) == 0)) & 1) == 0)
  {
    unsigned int v5 = v4;
    if ((v3 & 1) != 0)
    {
      -[PDNotificationStreamManager unregisterConsumer:](self->_notificationManager, "unregisterConsumer:", self);
      -[PDTransitNotificationService _unscheduleCheckIn](self, "_unscheduleCheckIn");
    }

    if (v5)
    {
      -[PDNotificationStreamManager registerConsumer:](self->_notificationManager, "registerConsumer:", self);
      -[PDTransitNotificationService _scheduleCheckIn](self, "_scheduleCheckIn");
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        id v8 = "PDTransitNotificationService: registered for triggers";
        v9 = (uint8_t *)&v12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }

    else
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        id v8 = "PDTransitNotificationService: not registered triggers";
        v9 = (uint8_t *)&v11;
        goto LABEL_9;
      }
    }

    atomic_store(v5, (unsigned __int8 *)&self->_registeredForImmediateTriggerEvents);
  }

- (BOOL)_shouldTrigger
{
  if ((PKIsPhone(self, a2) & 1) != 0 || (int v2 = PKIsWatch()) != 0) {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)_shouldScheduleNotificationActivity:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002EC518;
  v8[3] = &unk_1006396B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (unint64_t)_eligibleNotificationsForTransitMarket:(id)a3
{
  id v4 = a3;
  if (-[PDTransitNotificationService _shouldSendNotificationsPassingBaseRequirementsForTransitMarket:]( self,  "_shouldSendNotificationsPassingBaseRequirementsForTransitMarket:",  v4))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 renotifyDCICampaignIdentifier]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 renotifyOpenLoopCampaignIdentifier]);
    BOOL v7 = (v5 | v6) != 0;
    if (PKIgnoreOpenLoopExpressUpgradeLimits())
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: ignoring market notification limits due to internal setting toggled ON",  (uint8_t *)&v29,  2u);
      }

      goto LABEL_13;
    }

    unint64_t v11 = -[PDTransitNotificationService _hasSentNotificationForMarket:](self, "_hasSentNotificationForMarket:", v4);
    if (!v11)
    {
LABEL_13:
      if (!-[PDTransitNotificationService _hasExistingTransitPassesForMarket:]( self,  "_hasExistingTransitPassesForMarket:",  v4))
      {
        if (-[PDExpressTransitUpgradeController hasAttemptedDefaultPassExpressUpgrade]( self->_upgradeController,  "hasAttemptedDefaultPassExpressUpgrade"))
        {
          int v16 = PKIgnoreOpenLoopExpressUpgradeLimits();
          uint64_t v17 = PKLogFacilityTypeGetObject(12LL);
          __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          if (v16)
          {
            if (v19)
            {
              LOWORD(v29) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: ignoring market express upgrade limits due to internal setting toggled ON. Supporting DCI, Open-Loop Express Upgrade, and Open-Loop renotify.",  (uint8_t *)&v29,  2u);
            }

            unint64_t v10 = 11LL;
          }

          else
          {
            if (v19)
            {
              int v29 = 138412290;
              unint64_t v30 = (unint64_t)v4;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: should not send Open-Loop Initial notification for %@ because an automatic express upgrade has been made previously.",  (uint8_t *)&v29,  0xCu);
            }

            if (v6)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                int v29 = 138412290;
                unint64_t v30 = v6;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Open-Loop renotify campaign exists: %@. Supporting DCI or Open-Loop reno tify as eligible initial notifications",  (uint8_t *)&v29,  0xCu);
              }

              unint64_t v10 = 9LL;
            }

            else
            {
              unint64_t v10 = 1LL;
            }
          }
        }

        else
        {
          unint64_t v10 = 3LL;
        }

        goto LABEL_40;
      }

      uint64_t v14 = PKLogFacilityTypeGetObject(12LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        unint64_t v30 = (unint64_t)v4;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: should not send initial market notification for %@.\n We already have a valid transit pass - marking the market as suppressed to prevent future initial notification attempts",  (uint8_t *)&v29,  0xCu);
      }

      -[PDTransitNotificationService _recordNotificationType:sentForMarket:]( self,  "_recordNotificationType:sentForMarket:",  1LL,  v4);
      goto LABEL_39;
    }

    unint64_t v12 = v11;
    if (!(v5 | v6))
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(12LL);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412546;
        unint64_t v30 = (unint64_t)v4;
        __int16 v31 = 2048;
        unint64_t v32 = v12;
        v22 = "PDTransitNotificationService: should not send market notification for %@.\n"
              "Notification of type (%lu) has already been sent and no renotify campaigns exist.";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v29, 0x16u);
      }

- (BOOL)_shouldSendNotificationsPassingBaseRequirementsForTransitMarket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  if (!v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "PDTransitNotificationService: should not send notification because region config is missing";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }

- (BOOL)_shouldSendDCIRenotifyNotificationForTransitMarket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 renotifyDCICampaignIdentifier]);
  if (!v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: should not send DCI renotify notification for %@.\n No campaign identifier exists for the market",  (uint8_t *)&v12,  0xCu);
    }

    goto LABEL_8;
  }

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDTransitNotificationService _hasSentRenotifyNotificationForRenotifyCampaign:]( self,  "_hasSentRenotifyNotificationForRenotifyCampaign:",  v5));
  BOOL v7 = v6 == 0LL;
  if (v6)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(12LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      BOOL v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: should not send DCI renotify notification for %@.\n The campaign has already been notified within another market (%@)",  (uint8_t *)&v12,  0x16u);
    }

LABEL_8:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSendOpenLoopRenotifyNotificationForTransitMarket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 renotifyOpenLoopCampaignIdentifier]);
  if (!v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      unint64_t v11 = "PDTransitNotificationService: should not send Open-Loop renotify campaign notification for %@ because no cam"
            "paign identifier exists for the market";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);
    }

- (void)_startLocationMonitoring
{
  if (self->_monitoringLocation)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "PDTransitNotificationService: already monitoring location";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  if (!PKRelevancyLocationServicesEnabled())
  {
    uint64_t v27 = PKLogFacilityTypeGetObject(12LL);
    unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "PDTransitNotificationService: could not monitor location due to authorization";
      goto LABEL_12;
    }

- (void)_cleanupLocationMonitoring
{
  locationTimer = self->_locationTimer;
  if (locationTimer) {
    dispatch_source_cancel((dispatch_source_t)locationTimer);
  }
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0LL);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  locationMonitorTransaction = self->_locationMonitorTransaction;
  self->_locationMonitorTransaction = 0LL;

  self->_monitoringLocation = 0;
}

- (void)_postNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 transitProducts:(id)a5 upgradeableOpenLoopPasses:(id)a6 renotifiableProducts:(id)a7 renotifiablePasses:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1002EE000;
  v53[3] = &unk_100654B28;
  v53[4] = self;
  id v21 = a9;
  id v55 = v21;
  id v22 = v15;
  id v54 = v22;
  id v23 = objc_retainBlock(v53);
  id v24 = [v17 count];
  if ((unint64_t)v24 >= 2 && PKIsPhone(v24, v25))
  {
    uint64_t v26 = self;
    id v27 = v22;
    uint64_t v28 = 0LL;
LABEL_4:
    -[PDTransitNotificationService _multipleProductsNotificationForMarket:renotify:completion:]( v26,  "_multipleProductsNotificationForMarket:renotify:completion:",  v27,  v28,  v23);
    goto LABEL_21;
  }

  if ([v17 count] == (id)1 && PKIsPhone(1, v29))
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v17 anyObject]);
    -[PDTransitNotificationService _productNotificationMessageForMarket:product:renotify:completion:]( self,  "_productNotificationMessageForMarket:product:renotify:completion:",  v22,  v30,  0LL,  v23);

    goto LABEL_21;
  }

  if (![v18 count])
  {
    id v39 = [v19 count];
    if ((unint64_t)v39 < 2 || !PKIsPhone(v39, v40))
    {
      if ([v19 count] == (id)1 && PKIsPhone(1, v41))
      {
        id v42 = v20;
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v19 anyObject]);
        -[PDTransitNotificationService _productNotificationMessageForMarket:product:renotify:completion:]( self,  "_productNotificationMessageForMarket:product:renotify:completion:",  v22,  v43,  1LL,  v23);
      }

      else
      {
        if (![v20 count]) {
          goto LABEL_21;
        }
        id v42 = v20;
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v20 anyObject]);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_1002EE328;
        v46[3] = &unk_100654BC8;
        v47 = v23;
        -[PDTransitNotificationService _expressNotificationForMarket:eligibleMarkets:pass:expressUpgrade:isReferredFromWatch:completion:]( self,  "_expressNotificationForMarket:eligibleMarkets:pass:expressUpgrade:isReferredFromWatch:completion:",  v22,  v16,  v43,  0LL,  0LL,  v46);
      }

      id v20 = v42;
      goto LABEL_21;
    }

    uint64_t v26 = self;
    id v27 = v22;
    uint64_t v28 = 1LL;
    goto LABEL_4;
  }

  id v44 = v20;
  id v45 = v19;
  __int16 v31 = v16;
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v18 anyObject]);
  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v32 uniqueID]);
    *(_DWORD *)buf = 138412290;
    v57 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: upgrading open loop pass for express mode %@",  buf,  0xCu);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_upgradePending);
  upgradeController = self->_upgradeController;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1002EE18C;
  v48[3] = &unk_100654BA0;
  v48[4] = self;
  id v49 = v22;
  id v50 = v31;
  id v51 = v32;
  v52 = v23;
  id v37 = v32;
  id v16 = v31;
  id v38 = v37;
  -[PDExpressTransitUpgradeController upgradePass:completionHandler:]( upgradeController,  "upgradePass:completionHandler:",  v37,  v48);

  id v20 = v44;
  id v19 = v45;
LABEL_21:
}

- (void)_multipleProductsNotificationForMarket:(id)a3 renotify:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v10 = v8;
  if (v8)
  {
    if ((PKIsPhone(v8, v9) & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Multiple product notification attempted with non phone device. Please file a radar",  buf,  2u);
      }

      goto LABEL_15;
    }

    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 notificationAssetIdentifier]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1002EE5D0;
    v28[3] = &unk_100654BF0;
    BOOL v31 = a4;
    id v12 = v7;
    id v29 = v12;
    id v30 = v10;
    id v13 = objc_retainBlock(v28);
    if (v11)
    {
      if (!PKForceDefaultEmbeddedMarketStrings())
      {
        id v21 = (void *)PDOSTransactionCreate("PDTransitNotificationService.fetch_assets");
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[PKMobileAssetManager sharedInstance](&OBJC_CLASS___PKMobileAssetManager, "sharedInstance"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1002EE758;
        v24[3] = &unk_100654C18;
        id v25 = v21;
        BOOL v27 = a4;
        uint64_t v26 = v13;
        id v23 = v21;
        [v22 fetchMarketNotificationAssetsForIdentifier:v11 isDiscretionary:0 completionHandler:v24];

        goto LABEL_14;
      }

      uint64_t v14 = PKLogFacilityTypeGetObject(12LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v16 = "PDTransitNotificationService: Internal Setting forcing default embedded strings used in multiple transit p"
              "roducts notification.";
        id v17 = v15;
        uint32_t v18 = 2;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }

    else
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(12LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v12;
        id v16 = "PDTransitNotificationService: No market notification asset identifier exists for market: %@";
        id v17 = v15;
        uint32_t v18 = 12;
        goto LABEL_11;
      }
    }

    ((void (*)(void *, void, void))v13[2])(v13, 0LL, 0LL);
LABEL_14:

LABEL_15:
  }
}

- (void)_productNotificationMessageForMarket:(id)a3 product:(id)a4 renotify:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v13 = (void (**)(void, void, void))v11;
  if (v11)
  {
    if ((PKIsPhone(v11, v12) & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Product notification attempted with non phone device. Please file a radar",  buf,  2u);
      }

      goto LABEL_17;
    }

    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 displayName]);
    id v15 = v14;
    if (!v14)
    {
      v13[2](v13, 0LL, 0LL);
LABEL_17:

      goto LABEL_18;
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1002EECF8;
    v33[3] = &unk_100654C40;
    BOOL v38 = a5;
    id v15 = v14;
    v34 = v15;
    id v16 = v9;
    id v35 = v16;
    id v36 = v10;
    id v37 = v13;
    id v17 = objc_retainBlock(v33);
    uint32_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 notificationAssetIdentifier]);
    if (v18)
    {
      if (!PKForceDefaultEmbeddedMarketStrings())
      {
        uint64_t v26 = (void *)PDOSTransactionCreate("PDTransitNotificationService.fetch_assets");
        BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(+[PKMobileAssetManager sharedInstance](&OBJC_CLASS___PKMobileAssetManager, "sharedInstance"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_1002EEF40;
        v29[3] = &unk_100654C18;
        id v30 = v26;
        BOOL v32 = a5;
        BOOL v31 = v17;
        id v28 = v26;
        [v27 fetchMarketNotificationAssetsForIdentifier:v18 isDiscretionary:0 completionHandler:v29];

        goto LABEL_16;
      }

      uint64_t v19 = PKLogFacilityTypeGetObject(12LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v21 = "PDTransitNotificationService: Internal Setting forcing default embedded strings used in product notification.";
        id v22 = v20;
        uint32_t v23 = 2;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }

    else
    {
      uint64_t v25 = PKLogFacilityTypeGetObject(12LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v16;
        id v21 = "PDTransitNotificationService: No market notification asset identifier exists for market: %@";
        id v22 = v20;
        uint32_t v23 = 12;
        goto LABEL_13;
      }
    }

    ((void (*)(void *, void, void))v17[2])(v17, 0LL, 0LL);
LABEL_16:

    goto LABEL_17;
  }

- (void)_expressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 expressUpgrade:(BOOL)a6 isReferredFromWatch:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (void (**)(id, void))a8;
  if (v17)
  {
    uint32_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 notificationAssetIdentifier]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
    if (!v19)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: No name to display for pass - cannot generate an express notification for market:%@ ",  buf,  0xCu);
      }

      v17[2](v17, 0LL);
      goto LABEL_18;
    }

    id v20 = [v14 expressUpgradeHideDisableAction];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1002EF4B4;
    v40[3] = &unk_100654C68;
    BOOL v49 = a6;
    id v33 = v14;
    id v41 = v33;
    id v48 = v20;
    v47 = v17;
    id v42 = v19;
    id v43 = v16;
    id v44 = v15;
    id v45 = self;
    BOOL v50 = a7;
    v34 = v18;
    id v21 = v18;
    id v46 = v21;
    id v22 = objc_retainBlock(v40);
    uint64_t v23 = PKLogFacilityTypeGetObject(12LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: will create open loop notification with market asset: %@",  buf,  0xCu);
    }

    if (v21)
    {
      if (!PKForceDefaultEmbeddedMarketStrings())
      {
        id v30 = (void *)PDOSTransactionCreate("PDTransitNotificationService.fetch_assets");
        BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[PKMobileAssetManager sharedInstance](&OBJC_CLASS___PKMobileAssetManager, "sharedInstance"));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_1002EF8CC;
        v35[3] = &unk_100654C90;
        id v36 = v30;
        id v37 = v33;
        BOOL v39 = a6;
        BOOL v38 = v22;
        id v32 = v30;
        [v31 fetchMarketNotificationAssetsForIdentifier:v21 isDiscretionary:0 completionHandler:v35];

        goto LABEL_17;
      }

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v25 = "PDTransitNotificationService: Internal Setting forcing default embedded strings used in express notification.";
        uint64_t v26 = v24;
        uint32_t v27 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }

    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v33;
      uint64_t v25 = "PDTransitNotificationService: No market notification asset identifier exists for market: %@";
      uint64_t v26 = v24;
      uint32_t v27 = 12;
      goto LABEL_14;
    }

    ((void (*)(void *, void, void))v22[2])(v22, 0LL, 0LL);
LABEL_17:
    uint32_t v18 = v34;

LABEL_18:
  }
}

- (void)_expressUpgradesAvailableNotificationForPass:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    id v8 = (void *)v7;
    if (v7)
    {
      int v9 = PKIsWatch(v7);
      BOOL v10 = v9 == 0;
      if (v9) {
        id v11 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_NOTIFICATION_TITLE_WATCH";
      }
      else {
        id v11 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_NOTIFICATION_TITLE";
      }
      if (v10) {
        uint64_t v12 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_MESSAGE_FORMAT";
      }
      else {
        uint64_t v12 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_MESSAGE_FORMAT_WATCH";
      }
      uint64_t v13 = PKLocalizedTransitString(&v11->isa);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = PKLocalizedTransitString(&v12->isa);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = PKStringWithValidatedFormat(v16, @"%@");
      uint32_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = objc_alloc(&OBJC_CLASS___PDPassExpressUpgradesAvailableUserNotification);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueID", v8));
      id v21 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( v19,  "initWithTitle:message:forPassUniqueIdentifier:",  v14,  v18,  v20);

      id v22 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v23 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"prefs:root=PASSBOOK&path=%@",  PKURLActionExpressTransitSettings);
      -[PDUserNotification setCustomActionURLString:](v21, "setCustomActionURLString:", v23);
      v6[2](v6, v21);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: No name to display for pass - cannot generate an express selection required notification",  buf,  2u);
      }

      v6[2](v6, 0LL);
    }
  }
}

- (void)sentTransitNotificationStateWithHandler:(id)a3
{
  unsigned __int8 v3 = (void (**)(id, id, id, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v17 = (id)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"MarketGeoDCINotifications"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"MarketGeoUpgradeNotifications"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"MarketGeoRenotifyNotifications"]);
  id v8 = objc_alloc(&OBJC_CLASS___NSSet);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  BOOL v10 = -[NSSet initWithArray:](v8, "initWithArray:", v9);

  id v11 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v13 = -[NSSet initWithArray:](v11, "initWithArray:", v12);

  id v14 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  id v16 = -[NSSet initWithArray:](v14, "initWithArray:", v15);

  v3[2](v3, v10, v13, v16);
}

- (void)_upgradeFromNotificationCountToNotificationTypes
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"PDTransitMarketGeoNotificationSent"]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"]);

    if (!v4)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(12LL);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Migrating notification state from count based to type based",  buf,  2u);
      }

      uint64_t v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v8 = v3;
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            -[NSMutableArray addObject:]( v7,  "addObject:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12),  (void)v14);
            uint64_t v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
        }

        while (v10);
      }

      uint64_t v19 = @"MarketGeoSuppressedNotifications";
      id v20 = v7;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      [v2 setObject:v13 forKey:@"PDTransitNotificationServiceSentNotifications"];
    }

    objc_msgSend(v2, "removeObjectForKey:", @"PDTransitMarketGeoNotificationSent", (void)v14);
  }
}

- (unint64_t)_hasSentNotificationForMarket:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"MarketGeoSuppressedNotifications"]);
  if ([v6 containsObject:v3])
  {
    unint64_t v7 = 1LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"MarketGeoDCINotifications"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v3]);

    if (v9)
    {
      unint64_t v7 = 100LL;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"MarketGeoUpgradeNotifications"]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v3]);

      if (v11) {
        unint64_t v7 = 101LL;
      }
      else {
        unint64_t v7 = 0LL;
      }
    }
  }

  return v7;
}

- (id)_hasSentRenotifyNotificationForRenotifyCampaign:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"]);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MarketGeoSuppressedNotifications"]);
  id v8 = v7;
  if (v4)
  {
    if ([v7 containsObject:v4])
    {
      id v9 = @"SuppressedRenotify";
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransitNotificationService _sentRenotifyNotificationsForRenotifiyIdentifier:]( self,  "_sentRenotifyNotificationsForRenotifiyIdentifier:",  v4));
      if ([v10 count]) {
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      }
      else {
        id v9 = 0LL;
      }
    }
  }

  else
  {
    id v9 = @"NullRenotify";
  }

  return v9;
}

- (id)_sentRenotifyNotificationsForRenotifiyIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"MarketGeoRenotifyNotifications"]);
  unint64_t v7 = v6;
  id v8 = 0LL;
  if (v3 && v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002F03CC;
    v12[3] = &unk_100654CB8;
    id v13 = v3;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v12));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v10]);
  }

  return v8;
}

- (void)_recordNotificationType:(unint64_t)a3 sentForMarket:(id)a4
{
  id v6 = a4;
  unint64_t v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v6, 0LL);

  -[PDTransitNotificationService _recordNotificationType:sentForMarkets:]( self,  "_recordNotificationType:sentForMarkets:",  a3,  v7);
}

- (void)_recordNotificationType:(unint64_t)a3 sentForMarkets:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"]);
  id v8 = (NSMutableDictionary *)[v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"MarketGeoSuppressedNotifications"));
  id v10 = (NSMutableArray *)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v43 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"MarketGeoDCINotifications"));
  uint64_t v12 = (NSMutableDictionary *)[v11 mutableCopy];

  if (!v12) {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"MarketGeoUpgradeNotifications"));
  __int128 v14 = (NSMutableDictionary *)[v13 mutableCopy];

  if (!v14) {
    __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v42 = v14;
  id v40 = v8;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"MarketGeoRenotifyNotifications"));
  __int128 v16 = (NSMutableDictionary *)[v15 mutableCopy];

  __int128 v17 = v43;
  if (!v16) {
    __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v44 = v16;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
        uint64_t v25 = 0LL;
        if ((uint64_t)a3 > 99)
        {
          switch(a3)
          {
            case 'd':
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v26, v24);

              goto LABEL_23;
            case 'e':
              id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v32, v24);

              goto LABEL_34;
            case 'f':
              uint64_t v28 = objc_claimAutoreleasedReturnValue([v23 renotifyDCICampaignIdentifier]);
              goto LABEL_26;
            case 'g':
              uint64_t v28 = objc_claimAutoreleasedReturnValue([v23 renotifyOpenLoopCampaignIdentifier]);
LABEL_26:
              uint64_t v25 = (void *)v28;
              goto LABEL_27;
            default:
              goto LABEL_42;
          }
        }

        if (a3 != 1)
        {
          if (a3 == 2)
          {
LABEL_23:
            uint64_t v27 = objc_claimAutoreleasedReturnValue([v23 renotifyDCICampaignIdentifier]);
          }

          else
          {
            if (a3 != 3) {
              goto LABEL_42;
            }
LABEL_34:
            uint64_t v27 = objc_claimAutoreleasedReturnValue([v23 renotifyOpenLoopCampaignIdentifier]);
          }

          uint64_t v25 = (void *)v27;
          char v31 = 1;
          if (!v27) {
            goto LABEL_42;
          }
LABEL_36:
          if ((v31 & 1) != 0)
          {
            if ((-[NSMutableArray containsObject:](v17, "containsObject:", v25) & 1) == 0)
            {
              if (!-[NSMutableDictionary count](v44, "count")
                || (v33 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransitNotificationService _sentRenotifyNotificationsForRenotifiyIdentifier:]( self,  "_sentRenotifyNotificationsForRenotifiyIdentifier:",  v25)),  v34 = [v33 count],  v33,  __int128 v17 = v43,  !v34))
              {
                -[NSMutableArray addObject:](v17, "addObject:", v25);
              }
            }
          }

          else
          {
            id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v25,  @":",  v24));
            id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v36, v35);

            __int128 v17 = v43;
          }

          goto LABEL_42;
        }

- (void)_clearTransitNotificationHistory
{
  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Clearing transit notification history",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 removeObjectForKey:@"PDTransitNotificationServiceSentNotifications"];
}

- (id)_existingTransitPassesForMarket:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 expressCredentialTypes]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 expressTransitNetworks]);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transitPasses](self->_databaseManager, "transitPasses"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002F0B80;
  v12[3] = &unk_100654CE0;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectsPassingTest:v12]);

  return v10;
}

- (BOOL)_hasExistingTransitPassesForMarket:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransitNotificationService _existingTransitPassesForMarket:]( self,  "_existingTransitPassesForMarket:",  a3));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(p_observersLock);
    id v7 = PDDefaultQueue();
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002F0E90;
    v10[3] = &unk_10063AC90;
    id v11 = v6;
    id v12 = v4;
    id v9 = v6;
    dispatch_async(v8, v10);
  }
}

- (void)_connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F0FF0;
  block[3] = &unk_100639300;
  block[4] = self;
  if (qword_100707B40 != -1) {
    dispatch_once(&qword_100707B40, block);
  }
}

- (void)_scheduleCheckIn
{
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002F1090;
  v3[3] = &unk_10064C5A0;
  v3[4] = self;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v3);
}

- (void)_schedulePromotedExpressModeNotificationDemotion:(id)a3
{
  id v3 = a3;
  if ([v3 promotionActive])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 promoteEndDate]);
      unint64_t v7 = (unint64_t)[v3 notificationType];
      if (v7 > 0x51) {
        id v8 = @"unknown";
      }
      else {
        id v8 = off_100654FB8[v7];
      }
      int v12 = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      __int128 v15 = v8;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduling Activity for %@ to demote %@'s promoted status: %@",  (uint8_t *)&v12,  0x20u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 promoteEndDate]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v9));

    [v10 setRepeating:1];
    [v10 setRepeatInterval:3600.0];
    [v10 setReason:@"PDTransitNotificationServiceDemoteExpressMode"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 notificationIdentifier]);
    PDScheduledActivityRegister(@"PDTransitNotificationService", v11, v10);
  }
}

- (void)_unscheduleCheckIn
{
}

- (id)_startTime
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingUnit:16 value:1 toDate:v3 options:0]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 components:28 fromDate:v4]);
  [v5 setHour:arc4random_uniform(6u)];
  [v5 setMinute:arc4random_uniform(0x3Cu)];
  [v5 setSecond:arc4random_uniform(0x3Cu)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  [v5 setTimeZone:v6];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 dateFromComponents:v5]);
  return v7;
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"PDTransitNotificationServiceCheckIn"])
  {
    uint64_t v8 = PKCurrentRegion();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 configuration]);
    unsigned int v12 = [v11 shouldEnableTransitServiceCheckInForRegion:v9];

    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: scheduled check in running",  buf,  2u);
      }

      -[PDTransitNotificationService _checkForNotification](self, "_checkForNotification");
    }

    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: scheduled check in ran but asked to be unscheduled",  buf,  2u);
      }

      -[PDTransitNotificationService _unscheduleCheckIn](self, "_unscheduleCheckIn");
    }
  }

  else
  {
    __int16 v16 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v7 reason]);
    if (v16 == @"PDTransitNotificationServiceDemoteExpressMode"
      || (id v17 = v16) != 0LL
      && (unsigned int v18 = -[__CFString isEqualToString:]( v16,  "isEqualToString:",  @"PDTransitNotificationServiceDemoteExpressMode"),  v17,  v17,  v18))
    {
      uint64_t v19 = PKLogFacilityTypeGetObject(12LL);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: Demote Express Mode Notification check running",  buf,  2u);
      }

      userNotificationManager = self->_userNotificationManager;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1002F17B4;
      v22[3] = &unk_100644C98;
      v22[4] = self;
      id v23 = v6;
      -[PDUserNotificationManager userNotificationWithIdentifier:completion:]( userNotificationManager,  "userNotificationWithIdentifier:completion:",  v23,  v22);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: did update location %@",  buf,  0xCu);
    }

    [v6 horizontalAccuracy];
    double v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
    [v11 timeIntervalSinceNow];
    double v13 = v12;

    if (self->_monitoringLocation && v10 <= 500.0 && fabs(v13) < 300.0)
    {
      id v44 = v5;
      dispatch_source_cancel((dispatch_source_t)self->_locationTimer);
      locationTimer = self->_locationTimer;
      self->_locationTimer = 0LL;

      BOOL v15 = dispatch_group_create();
      id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int16 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v36 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      BOOL v38 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      dispatch_group_enter(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 context]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 configuration]);

      id v20 = (void *)PDOSTransactionCreate("PDTransitNotificationService.configure");
      id v42 = v19;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 marketsURL]);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_1002F1D84;
      v53[3] = &unk_100654D58;
      id v54 = v20;
      id v43 = v6;
      id v33 = v6;
      id v55 = v33;
      v56 = self;
      id v34 = v15;
      v57 = v34;
      id v58 = v17;
      id v22 = v16;
      v59 = v22;
      id v23 = v36;
      v60 = v23;
      id v24 = v35;
      v61 = v24;
      uint64_t v25 = v40;
      v62 = v25;
      uint64_t v26 = v38;
      v63 = v26;
      id v41 = v17;
      id v39 = v20;
      +[PKPaymentMarketsConfiguration paymentMarketsConfigurationWithURL:forDeviceClass:version:completion:]( &OBJC_CLASS___PKPaymentMarketsConfiguration,  "paymentMarketsConfigurationWithURL:forDeviceClass:version:completion:",  v21,  0LL,  0LL,  v53);

      id v27 = PDDefaultQueue();
      uint64_t v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002F23B4;
      block[3] = &unk_10063AE60;
      __int128 v46 = v22;
      __int128 v47 = v23;
      __int128 v48 = v24;
      BOOL v49 = v26;
      BOOL v50 = v25;
      id v51 = v33;
      id v52 = self;
      id v37 = v25;
      id v29 = v26;
      id v30 = v24;
      char v31 = v23;
      id v32 = v22;
      dispatch_group_notify(v34, v28, block);

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: stopping location monitoring",  buf,  2u);
      }

      -[PDTransitNotificationService _cleanupLocationMonitoring](self, "_cleanupLocationMonitoring");
      uint64_t v8 = (os_log_s *)v34;
      id v6 = v43;
      id v5 = v44;
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: discarding location",  buf,  2u);
    }
  }
}

- (void)_availableProductsForNotifiableMarkets:(id)a3 filteredForTargetDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1002F2980;
  v18[3] = &unk_100654DD0;
  v18[4] = &v19;
  [v8 enumerateObjectsUsingBlock:v18];
  if (*((_BYTE *)v20 + 24))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002F2A14;
    v15[3] = &unk_10063F520;
    id v16 = v9;
    id v17 = v10;
    [v11 staticFilteredProductsWithDiagnosticReason:@"Transit Notification Service - Location update" completion:v15];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: No markets require products request",  v14,  2u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }

  _Block_object_dispose(&v19, 8);
}

- (id)_transitProducts:(id)a3 forMarket:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002F2B94;
  v12[3] = &unk_100654E48;
  id v13 = v5;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v5 closedLoopExpressCredentialTypes]);
  BOOL v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = v15;
  id v8 = v14;
  id v9 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v10 = -[NSMutableSet copy](v7, "copy");
  return v10;
}

- (id)_expressUpgradeableOpenLoopPassesForMarket:(id)a3
{
  id v4 = a3;
  if (PKIgnoreOpenLoopExpressUpgradeLimits())
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: ignoring open loop upgrade check if upgrade has been previously attempted due to i nternal setting toggled ON",  buf,  2u);
    }

    goto LABEL_9;
  }

  if (!-[PDExpressTransitUpgradeController hasAttemptedDefaultPassExpressUpgrade]( self->_upgradeController,  "hasAttemptedDefaultPassExpressUpgrade"))
  {
LABEL_9:
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDTransitNotificationService _defaultPassUniqueIdentifier]( self,  "_defaultPassUniqueIdentifier"));
    if (v8)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v8));
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 openLoopExpressCredentialTypes]);
        double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
        uint64_t v19 = _NSConcreteStackBlock;
        uint64_t v20 = 3221225472LL;
        uint64_t v21 = sub_1002F30E8;
        char v22 = &unk_100654E70;
        id v23 = self;
        id v14 = v11;
        id v24 = v14;
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pk_objectsPassingTest:", &v19));

        if (objc_msgSend(v15, "count", v19, v20, v21, v22, v23)) {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
        }
        else {
          id v9 = 0LL;
        }
      }

      else
      {
        uint64_t v17 = PKLogFacilityTypeGetObject(12LL);
        id v14 = (id)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: no upgradeable open loop passes as the default pass cannot be found",  buf,  2u);
        }

        id v9 = 0LL;
      }
    }

    else
    {
      uint64_t v16 = PKLogFacilityTypeGetObject(12LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: no upgradeable open loop passes as there is no default pass",  buf,  2u);
      }

      id v9 = 0LL;
    }

    goto LABEL_23;
  }

  uint64_t v7 = PKLogFacilityTypeGetObject(12LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDTransitNotificationService: no upgradeable open loop passes because an upgrade has already been attempted",  buf,  2u);
  }

  id v9 = 0LL;
LABEL_23:

  return v9;
}

- (void)_expressRenotifiableOpenLoopPassesForViableMarkets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    expressPassManager = self->_expressPassManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002F3404;
    v10[3] = &unk_10063CBA8;
    void v10[4] = self;
    id v12 = v7;
    id v11 = v6;
    sub_10014BBB0((uint64_t)expressPassManager, 1LL, v10);
  }
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = PKAnalyticsSubjectWalletGeolocation;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKAnalyticsReporter reporterForSubject:]( &OBJC_CLASS___PKAnalyticsReporter,  "reporterForSubject:",  PKAnalyticsSubjectWalletGeolocation));

  if (!v4)
  {
    self->_didBeginReportingSubject = 1;
    +[PKAnalyticsReporter beginSubjectReporting:](&OBJC_CLASS___PKAnalyticsReporter, "beginSubjectReporting:", v3);
  }

- (void)_endReportingIfNecessary
{
  if (self->_didBeginReportingSubject)
  {
    self->_didBeginReportingSubject = 0;
    +[PKAnalyticsReporter endSubjectReporting:]( &OBJC_CLASS___PKAnalyticsReporter,  "endSubjectReporting:",  PKAnalyticsSubjectWalletGeolocation);
  }

- (void)_reportExpressEnable:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  PKAnalyticsReportEventTypeExpressModeEnable,  PKAnalyticsReportEventKey);
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  PKAnalyticsReportExpressModeChangePageTag,  PKAnalyticsReportPageTagKey);
  -[PDTransitNotificationService _reportEvent:forMarket:eligibleMarkets:pass:]( self,  "_reportEvent:forMarket:eligibleMarkets:pass:",  v11,  v10,  v9,  v8);
}

- (void)_reportExpressModeEnableFailed:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  PKAnalyticsReportEventTypeExpressModeEnableFailed,  PKAnalyticsReportEventKey);
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  PKAnalyticsReportExpressModeChangePageTag,  PKAnalyticsReportPageTagKey);
  -[PDTransitNotificationService _reportEvent:forMarket:eligibleMarkets:pass:]( self,  "_reportEvent:forMarket:eligibleMarkets:pass:",  v11,  v10,  v9,  v8);
}

- (void)_reportExpressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 pageTag:(id)a6 isReferredFromWatch:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  PKAnalyticsReportEventTypeViewDidAppear,  PKAnalyticsReportEventKey);
  -[NSMutableDictionary safelySetObject:forKey:](v17, "safelySetObject:forKey:", v12, PKAnalyticsReportPageTagKey);

  uint64_t v16 = &PKAnalyticsReportReferralSourceWatchApp;
  if (!v7) {
    uint64_t v16 = &PKAnalyticsReportReferralSourceWallet;
  }
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", *v16, PKAnalyticsReportReferralSourceKey);
  -[PDTransitNotificationService _reportEvent:forMarket:eligibleMarkets:pass:]( self,  "_reportEvent:forMarket:eligibleMarkets:pass:",  v17,  v15,  v14,  v13);
}

- (void)_reportEvent:(id)a3 forMarket:(id)a4 eligibleMarkets:(id)a5 pass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v51 = a5;
  id v12 = a6;
  id v13 = v12;
  if (!v10 || !v12) {
    goto LABEL_27;
  }
  id v14 = [v12 passType];
  else {
    id v15 = off_100655248[(void)v14 + 1];
  }
  [v10 setObject:v15 forKeyedSubscript:PKAnalyticsReportPassTypeKey];

  unint64_t v16 = (unint64_t)[v13 style];
  if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0) {
    uint64_t v17 = off_100655260[v16];
  }
  else {
    uint64_t v17 = (__CFString *)PKAnalyticsReportUnknownValue;
  }
  [v10 setObject:v17 forKeyedSubscript:PKAnalyticsReportPassStyleKey];

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 nfcPayload]);
  uint64_t v19 = PKAnalyticsReportSwitchToggleResultValue(v18 != 0LL);
  uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
  [v10 setObject:v20 forKeyedSubscript:PKAnalyticsReportPassHasNFCKey];

  id v21 = v13;
  if ([v21 passType] == (id)1)
  {
    char v22 = (void *)objc_claimAutoreleasedReturnValue([v21 secureElementPass]);
    id v23 = [v22 cardType];
  }

  else
  {
    uint64_t v20 = @"other";
  }

  [v10 setObject:v20 forKeyedSubscript:PKAnalyticsReportPassProductTypeKey];
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 secureElementPass]);
  if ([v24 isIdentityPass])
  {
    uint64_t v25 = (char *)[v24 identityType];
    if ((unint64_t)(v25 - 1) < 3)
    {
      uint64_t v26 = off_1006552F0[(void)(v25 - 1)];
      goto LABEL_22;
    }
  }

  else if ([v24 isAccessPass])
  {
    unint64_t v27 = (unint64_t)[v24 accessType];
    if (v27 < 7)
    {
      uint64_t v26 = off_100655308[v27];
      goto LABEL_22;
    }
  }

  uint64_t v26 = (__CFString *)PKAnalyticsReportUnknownValue;
LABEL_22:

  [v10 setObject:v26 forKeyedSubscript:PKAnalyticsReportPassProductSubtypeKey];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v21 secureElementPass]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 devicePaymentApplications]);
  BOOL v30 = (unint64_t)[v29 count] > 1;

  uint64_t v31 = PKAnalyticsReportSwitchToggleResultValue(v30);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  [v10 setObject:v32 forKeyedSubscript:PKAnalyticsReportCoBadgeEnableKey];
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v21 secureElementPass]);
  id v34 = PKAnalyticsReportUnknownValue;
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 organizationName]);
  if ([v35 length])
  {
    unint64_t v36 = (unint64_t)[v33 cardType];
    if (v36 <= 4 && ((1LL << v36) & 0x16) != 0)
    {
      id v37 = v35;

      id v34 = v37;
    }
  }

  [v10 setObject:v34 forKeyedSubscript:PKAnalyticsReportIssuerNameKey];
LABEL_27:

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v38 = (id)objc_claimAutoreleasedReturnValue([v13 devicePaymentApplications]);
  id v39 = [v38 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v39)
  {
    id v40 = v39;
    id v41 = 0LL;
    uint64_t v42 = *(void *)v53;
    while (2)
    {
      for (i = 0LL; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(v38);
        }
        id v44 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        if (v41 && v41 != [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) paymentType])
        {

          __int128 v45 = @"multiple";
          goto LABEL_40;
        }

        id v41 = [v44 paymentType];
      }

      id v40 = [v38 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v41 = 0LL;
  }

  uint64_t v46 = PKPaymentMethodTypeToString(v41);
  __int128 v45 = (__CFString *)objc_claimAutoreleasedReturnValue(v46);
LABEL_40:

  [v10 safelySetObject:v45 forKey:PKAnalyticsReportPaymentMethodTypeKey];
  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v11 analyticsReportingNameValue]);
  [v10 safelySetObject:v47 forKey:PKAnalyticsReportMarketNameKey];

  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v11 region]);
  [v10 safelySetObject:v48 forKey:PKAnalyticsReportMarketRegionKey];

  BOOL v49 = (void *)objc_claimAutoreleasedReturnValue(-[PDTransitNotificationService _eligibleMarketNames:](self, "_eligibleMarketNames:", v51));
  [v10 safelySetObject:v49 forKey:PKAnalyticsReportEligibleMarketsKey];

  BOOL v50 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransitNotificationService _expressPaymentNetworkNamesForPass:]( self,  "_expressPaymentNetworkNamesForPass:",  v13));
  [v10 setObject:v50 forKey:PKAnalyticsReportPaymentNetworkNameKey];

  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectWalletGeolocation,  v10);
}

- (id)_eligibleMarketNames:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v9),  "analyticsReportingNameValue",  (void)v13));
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( v4,  "componentsJoinedByString:",  PKAnalyticsReportArraySeparator));
  return v11;
}

- (id)_expressPaymentNetworkNamesForPass:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v25 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentPass]);
  uint64_t v35 = 0LL;
  unint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = sub_1002F44D8;
  id v39 = sub_1002F44E8;
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 targetDevice]);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1002F44F0;
  v33[3] = &unk_100654F10;
  id v9 = v8;
  id v34 = v9;
  unint64_t v27 = objc_retainBlock(v33);
  id v26 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]( objc_alloc(&OBJC_CLASS___PKExpressPassInformation),  "initForPaymentPass:withTechologyTest:",  v6,  v27);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1002F453C;
  v32[3] = &unk_100654F38;
  v32[4] = &v35;
  [v26 enumerateCredentialsWithHandler:v32];
  if ((objc_opt_respondsToSelector(v9, "upgradeRequestForPass:") & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 upgradeRequestForPass:v4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentApplicationIdentifiers]);

    if (v11) {
      [(id)v36[5] addObjectsFromArray:v11];
    }
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v12 = (id)v36[5];
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    uint64_t v15 = PKAnalyticsReportUnknownValue;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v6 devicePaymentApplicationForAID:*(void *)(*((void *)&v28 + 1) + 8 * (void)i)]);
        unsigned int v18 = v17;
        if (v17)
        {
          uint64_t v19 = PKPaymentNetworkNameForPaymentCredentialType([v17 paymentNetworkIdentifier]);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
          id v21 = (void *)v20;
          if (v20) {
            uint64_t v22 = v20;
          }
          else {
            uint64_t v22 = v15;
          }
          -[NSMutableArray addObject:](v5, "addObject:", v22);
        }
      }

      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }

    while (v13);
  }

  if (!-[NSMutableArray count](v5, "count")) {
    -[NSMutableArray addObject:](v5, "addObject:", PKAnalyticsReportUnknownValue);
  }
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( v5,  "componentsJoinedByString:",  PKAnalyticsReportArraySeparator));

  _Block_object_dispose(&v35, 8);
  return v23;
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end