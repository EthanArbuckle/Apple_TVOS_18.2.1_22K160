@interface PDDiscoveryManager
- (BOOL)_shouldReprocessForTransaction:(id)a3 previousTransactionProcessingDate:(id)a4;
- (BOOL)loadDialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (BOOL)rulesNeedLocation;
- (BOOL)rulesNeedPlacemark;
- (CLLocation)latestValidLocation;
- (CLPlacemark)latestValidPlacemark;
- (NSSet)identifiersOfCompletedDiscoveryItems;
- (NSSet)identifiersOfDismissedDiscoveryItems;
- (NSSet)identifiersOfExpandedDiscoveryItems;
- (NSSet)identifiersOfTappedDiscoveryItems;
- (PDDiscoveryManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 ruleManager:(id)a5 accountManager:(id)a6 applyManager:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 transitNotificationService:(id)a9 userNotificationManager:(id)a10 transactionProcessor:(id)a11 pushNotificationManager:(id)a12 notificationStreamManager:(id)a13 deviceEnvironmentStore:(id)a14 delegate:(id)a15;
- (id)_deleteMessagesBundle;
- (id)_discoveryArticleLayoutFromBundleForDiscoveryItem:(id)a3 error:(id *)a4;
- (id)_discoveryMessageManifestFromBundle:(id)a3 withError:(id *)a4;
- (id)_filterDiscoveryItemsForOSAndHardwareVersion:(id)a3;
- (id)_filterDiscoveryObjectsForOSAndHardwareVersion:(id)a3;
- (id)_filterEngagementMessagesForOSAndHardwareVersion:(id)a3;
- (id)_filterEngagementMessagesForViewCount:(id)a3;
- (id)_filterItemsForViewCount:(id)a3;
- (id)_filterNotificationsForOSAndHardwareVersion:(id)a3;
- (id)_filterRulesForOSVersion:(id)a3;
- (id)createCurrentNotificationRegistrationState;
- (id)pushNotificationTopics;
- (int64_t)_currentMessagesBundleVersion;
- (void)_articleLayoutForDiscoveryItem:(id)a3 completion:(id)a4;
- (void)_callDelegateWithLayoutsForUpdatedDiscoveryItemsAndMessages;
- (void)_cleanArticleLayoutsDirectories;
- (void)_executeWithLock:(id)a3;
- (void)_fetchAndWriteBundleForDiscoveryItem:(id)a3 completion:(id)a4;
- (void)_fetchAndWriteBundleFromRemoteBundleURL:(id)a3 toLocalBundleURL:(id)a4 processTempBundle:(id)a5 completion:(id)a6;
- (void)_fetchDiscoverManifestWithCompletion:(id)a3;
- (void)_lock_startLocationQueryTimeoutIfNecessary;
- (void)_paymentWebServiceContextChanged;
- (void)_processDiscoveryManifest:(id)a3 completion:(id)a4;
- (void)_processUpdatedNotifications;
- (void)_putLatestValidLocationAndNotify:(id)a3;
- (void)_putLatestValidPlacemarkAndNotify:(id)a3;
- (void)_queue_activeDialogRequestSourcedDiscoveryItems:(id)a3;
- (void)_queue_evaluateRulesAndForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4;
- (void)_queue_insertDiscoveryNotificationsIfNecessary;
- (void)_queue_performNextProcessingDiscoveryObjects;
- (void)_queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:(BOOL)a3 withCompletionBlocks:(id)a4 finalCompletion:(id)a5;
- (void)_queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4;
- (void)_queue_processDiscoveryManifest:(id)a3 completion:(id)a4;
- (void)_queue_processDownloadedMessagesManifest:(id)a3;
- (void)_queue_processExistingDiscoveryUserNotifications:(id)a3;
- (void)_queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:(id)a3;
- (void)_queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:(id)a3;
- (void)_queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:(id)a3;
- (void)_queue_scheduleTaskForNextAction;
- (void)_queue_shouldUpdateDiscoveryManifestWithCompletion:(id)a3;
- (void)_queue_updateDiscoveryEngagementMessageStatusDefaults;
- (void)_queue_updateDiscoveryItemStatusDefaults;
- (void)_queue_updateDiscoveryNotificationsStatusDefaults;
- (void)_queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:(id)a3;
- (void)_queue_updateWithServerDiscoveryItems:(id)a3;
- (void)_queue_updateWithServerEngagementMessages:(id)a3;
- (void)_queue_updateWithServerNotifications:(id)a3;
- (void)_scheduleDayChangedEvent;
- (void)_shouldUpdateDiscoveryManifestWithCompletion:(id)a3;
- (void)_startup;
- (void)_updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:(id)a3;
- (void)_updateDiscoveryItemStatusDefaultsForUpdatedItems:(id)a3;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdatePromotions:(id)a4 oldPromotions:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 scheduledPaymentsChangedForAccountIdentifier:(id)a4;
- (void)applyManager:(id)a3 didAddApplication:(id)a4;
- (void)applyManager:(id)a3 didRemoveApplication:(id)a4;
- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5;
- (void)applyPushNotificationToken:(id)a3;
- (void)beginReporingDiscoveryAnalytics;
- (void)completedDiscoveryItemCTA;
- (void)currentLocaleChanged;
- (void)dealloc;
- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutsWithCompletion:(id)a3;
- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4;
- (void)discoveryItemsWithCompletion:(id)a3;
- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5;
- (void)dismissedDiscoveryItems:(id)a3;
- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8;
- (void)endReporingDiscoveryAnalytics;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7;
- (void)expressPassConfigurationsChanged;
- (void)familyCircleChanged;
- (void)fetchLatestValidLocation:(id)a3;
- (void)fetchLatestValidPlacemark:(id)a3;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)fetchWelcomeCardCount:(id)a3;
- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4;
- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)manifestAllowsMiniCardsWithCompletion:(id)a3;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3;
- (void)processLocationUpdate;
- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3;
- (void)removedAllDiscoveryItems;
- (void)setRulesNeedLocation:(BOOL)a3;
- (void)setRulesNeedPlacemark:(BOOL)a3;
- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transitNotificationService:(id)a3 didAddDCINotificationForMarket:(id)a4;
- (void)transitNotificationService:(id)a3 didAddOpenLoopUpgradeNotificationForMarket:(id)a4;
- (void)transitNotificationService:(id)a3 didAddRenotifyNotificationForMarket:(id)a4;
- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryManifestWithCompletion:(id)a3;
- (void)updateMonitoringRequiringLocation:(BOOL)a3 andPlacemarks:(BOOL)a4;
@end

@implementation PDDiscoveryManager

- (PDDiscoveryManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 ruleManager:(id)a5 accountManager:(id)a6 applyManager:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 transitNotificationService:(id)a9 userNotificationManager:(id)a10 transactionProcessor:(id)a11 pushNotificationManager:(id)a12 notificationStreamManager:(id)a13 deviceEnvironmentStore:(id)a14 delegate:(id)a15
{
  id v97 = a3;
  id v96 = a4;
  id v81 = a5;
  id v95 = a5;
  id v82 = a6;
  id v94 = a6;
  id v83 = a7;
  id v93 = a7;
  id v84 = a8;
  id v92 = a8;
  id v91 = a9;
  id v90 = a10;
  id v89 = a11;
  id v88 = a12;
  v20 = v97;
  id v87 = a13;
  id v86 = a14;
  id v21 = a15;
  v98.receiver = self;
  v98.super_class = (Class)&OBJC_CLASS___PDDiscoveryManager;
  v23 = -[PDDiscoveryManager init](&v98, "init");
  if (v23)
  {
    v23[200] = PKSharedCacheGetBoolForKey(@"PDDiscoveryRulesNeedLocationCacheKey", v22);
    v23[201] = PKSharedCacheGetBoolForKey(@"PDDiscoveryRulesNeedPlacemarkCacheKey", v24);
    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v26 = (void *)*((void *)v23 + 26);
    *((void *)v23 + 26) = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v28 = (void *)*((void *)v23 + 27);
    *((void *)v23 + 27) = v27;

    *((_DWORD *)v23 + 58) = 0;
    objc_storeStrong((id *)v23 + 1, a3);
    objc_storeStrong((id *)v23 + 2, a4);
    [*((id *)v23 + 2) registerObserver:v23];
    v29 = objc_alloc(&OBJC_CLASS___CLLocationManager);
    uint64_t v30 = PKPassKitCoreBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 bundlePath]);
    id v33 = PDDefaultQueue();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( v29,  "initWithEffectiveBundlePath:delegate:onQueue:",  v32,  v23,  v34);
    v36 = (void *)*((void *)v23 + 22);
    *((void *)v23 + 22) = v35;

    id v37 = [*((id *)v23 + 22) setDesiredAccuracy:500.0];
    if (v23[200] || v23[201])
    {
      if (PKLocationServicesEnabled(v37, v38))
      {
        v23[202] = 1;
        [*((id *)v23 + 22) startMonitoringSignificantLocationChanges];
      }
    }

    v39 = objc_alloc_init(&OBJC_CLASS___CLGeocoder);
    v40 = (void *)*((void *)v23 + 23);
    *((void *)v23 + 23) = v39;

    uint64_t v41 = objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US"));
    v42 = (void *)*((void *)v23 + 24);
    *((void *)v23 + 24) = v41;

    objc_storeStrong((id *)v23 + 3, v81);
    objc_storeStrong((id *)v23 + 4, v82);
    [*((id *)v23 + 4) registerObserver:v23];
    objc_storeStrong((id *)v23 + 5, v83);
    [*((id *)v23 + 5) registerObserver:v23];
    objc_storeStrong((id *)v23 + 6, v84);
    [*((id *)v23 + 6) registerObserver:v23];
    objc_storeStrong((id *)v23 + 7, a9);
    [*((id *)v23 + 7) registerObserver:v23];
    objc_storeStrong((id *)v23 + 8, a10);
    objc_storeStrong((id *)v23 + 9, a11);
    [*((id *)v23 + 9) registerObserver:v23];
    objc_storeStrong((id *)v23 + 10, a12);
    [*((id *)v23 + 10) registerConsumer:v23];
    v43 = objc_alloc_init(&OBJC_CLASS___PDDiscoveryAnalytics);
    v44 = (void *)*((void *)v23 + 11);
    *((void *)v23 + 11) = v43;

    objc_storeStrong((id *)v23 + 12, a14);
    v45 = objc_alloc(&OBJC_CLASS___NSSet);
    v99[0] = AMSPushActionTypeBadging;
    v99[1] = AMSPushActionTypeGenericNotification;
    v99[2] = AMSPushActionTypeRichNotification;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v99, 3LL));
    v47 = -[NSSet initWithArray:](v45, "initWithArray:", v46);

    id v48 = [[AMSPushConfiguration alloc] initWithEnabledActionTypes:v47];
    [v48 setUserNotificationExtensionId:@"asd-notification-default"];
    +[AMSMetrics disableBackgroundMetrics](&OBJC_CLASS___AMSMetrics, "disableBackgroundMetrics");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMediaTask bagSubProfile](&OBJC_CLASS___AMSMediaTask, "bagSubProfile"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMediaTask bagSubProfileVersion](&OBJC_CLASS___AMSMediaTask, "bagSubProfileVersion"));
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  v49,  v50));

    v52 = -[AMSPushHandler initWithConfiguration:bag:]( objc_alloc(&OBJC_CLASS___AMSPushHandler),  "initWithConfiguration:bag:",  v48,  v51);
    v53 = (void *)*((void *)v23 + 13);
    *((void *)v23 + 13) = v52;

    v54 = -[AMSEngagement initWithBag:](objc_alloc(&OBJC_CLASS___AMSEngagement), "initWithBag:", v51);
    v55 = (void *)*((void *)v23 + 14);
    *((void *)v23 + 14) = v54;

    uint64_t v56 = PKEngagementWalletService;
    [*((id *)v23 + 14) addObserver:v23 placement:PKEngagementAppleCashDashboardPlacement serviceType:PKEngagementWalletService];
    [*((id *)v23 + 14) addObserver:v23 placement:PKEngagementAppleCardDashboardPlacement serviceType:v56];
    [*((id *)v23 + 14) addObserver:v23 placement:PKEngagementPayLaterDashboardPlacement serviceType:v56];
    [*((id *)v23 + 14) addObserver:v23 placement:PKEngagementSavingsDashboardPlacement serviceType:v56];
    [*((id *)v23 + 14) addObserver:v23 placement:PKEngagementPassesPlacement serviceType:v56];
    v57 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v58 = (void *)*((void *)v23 + 17);
    *((void *)v23 + 17) = v57;

    v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v60 = (void *)*((void *)v23 + 18);
    *((void *)v23 + 18) = v59;

    objc_storeStrong((id *)v23 + 15, a13);
    [*((id *)v23 + 15) registerConsumer:v23];
    objc_storeWeak((id *)v23 + 19, v21);
    v61 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v23 + 2) sharedWebServiceContext]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 configuration]);
    uint64_t v63 = PKCurrentRegion();
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    uint64_t v65 = objc_claimAutoreleasedReturnValue([v62 discoveryManifestURLForRegion:v64]);
    v66 = (void *)*((void *)v23 + 30);
    *((void *)v23 + 30) = v65;

    *(_WORD *)(v23 + 249) = 0;
    v67 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v68 = (void *)*((void *)v23 + 32);
    *((void *)v23 + 32) = v67;

    dispatch_queue_attr_t v69 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v70 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v69);
    dispatch_queue_t v71 = dispatch_queue_create("com.apple.passd.discoverymanager.work", v70);
    v72 = (void *)*((void *)v23 + 33);
    *((void *)v23 + 33) = v71;

    dispatch_queue_t v73 = dispatch_queue_create("com.apple.passd.discoverymanager.reply", v70);
    v74 = (void *)*((void *)v23 + 34);
    *((void *)v23 + 34) = v73;

    *((void *)v23 + 35) = -1LL;
    v75 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v23 + 1) discoveryItems]);
    v23[288] = [v75 count] == 0;

    v76 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v23 + 1) engagementMessages]);
    v23[289] = [v76 count] == 0;

    v77 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v23 + 1) discoveryNotifications]);
    v23[290] = [v77 count] == 0;

    v78 = (void *)*((void *)v23 + 37);
    *((void *)v23 + 37) = 0LL;

    PDScheduledActivityClientRegister(@"PDDiscoveryManager", v23, *((void *)v23 + 33));
    [*((id *)v23 + 12) registerClient:v23 withIdentifier:0];
    [v23 _scheduleDayChangedEvent];
    [v23 _startup];

    v20 = v97;
  }

  return (PDDiscoveryManager *)v23;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDDiscoveryManager;
  -[PDDiscoveryManager dealloc](&v3, "dealloc");
}

- (void)setRulesNeedLocation:(BOOL)a3
{
  if (self->_rulesNeedLocation != a3)
  {
    BOOL v3 = a3;
    self->_rulesNeedLocation = a3;
    PKSharedCacheSetBoolForKey(a3, @"PDDiscoveryRulesNeedLocationCacheKey");
    -[PDDiscoveryManager updateMonitoringRequiringLocation:andPlacemarks:]( self,  "updateMonitoringRequiringLocation:andPlacemarks:",  v3,  self->_rulesNeedPlacemark);
  }

- (void)setRulesNeedPlacemark:(BOOL)a3
{
  if (self->_rulesNeedPlacemark != a3)
  {
    BOOL v3 = a3;
    self->_rulesNeedPlacemark = a3;
    PKSharedCacheSetBoolForKey(a3, @"PDDiscoveryRulesNeedPlacemarkCacheKey");
    -[PDDiscoveryManager updateMonitoringRequiringLocation:andPlacemarks:]( self,  "updateMonitoringRequiringLocation:andPlacemarks:",  self->_rulesNeedLocation,  v3);
  }

- (void)updateMonitoringRequiringLocation:(BOOL)a3 andPlacemarks:(BOOL)a4
{
  BOOL rulesNeedPlacemark = self->_rulesNeedPlacemark;
  self->_rulesNeedLocation = a3;
  self->_BOOL rulesNeedPlacemark = a4;
  if (self->_isMonitoringSignificantLocationChanges == (a3 || a4))
  {
    if (rulesNeedPlacemark != a4) {
      -[PDDiscoveryManager processLocationUpdate](self, "processLocationUpdate");
    }
  }

  else if (a3 || a4)
  {
    if (PKLocationServicesEnabled(self, a2))
    {
      self->_isMonitoringSignificantLocationChanges = 1;
      -[CLLocationManager startMonitoringSignificantLocationChanges]( self->_locationManager,  "startMonitoringSignificantLocationChanges");
    }
  }

  else
  {
    -[CLLocationManager stopMonitoringSignificantLocationChanges]( self->_locationManager,  "stopMonitoringSignificantLocationChanges");
    self->_isMonitoringSignificantLocationChanges = 0;
  }

- (NSSet)identifiersOfExpandedDiscoveryItems
{
  return -[PDDiscoveryAnalytics identifiersOfExpandedDiscoveryItems]( self->_analytics,  "identifiersOfExpandedDiscoveryItems");
}

- (NSSet)identifiersOfDismissedDiscoveryItems
{
  return -[PDDiscoveryAnalytics identifiersOfDismissedDiscoveryItems]( self->_analytics,  "identifiersOfDismissedDiscoveryItems");
}

- (NSSet)identifiersOfTappedDiscoveryItems
{
  return -[PDDiscoveryAnalytics identifiersOfTappedDiscoveryItems]( self->_analytics,  "identifiersOfTappedDiscoveryItems");
}

- (NSSet)identifiersOfCompletedDiscoveryItems
{
  return -[PDDiscoveryAnalytics identifiersOfCompletedDiscoveryItems]( self->_analytics,  "identifiersOfCompletedDiscoveryItems");
}

- (void)_startup
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003B2DE8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_paymentWebServiceContextChanged
{
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  if (!PKPassbookIsCurrentlyDeletedByUser())
  {
    BOOL v3 = objc_alloc(&OBJC_CLASS___NSSet);
    v4 = -[NSSet initWithObjects:](v3, "initWithObjects:", PDDarwinNotificationFamilyCircleChanged, 0LL);
    -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v4,  0LL);
  }

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003B34DC;
  v9[3] = &unk_1006392B0;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workQueue, v9);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v7 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "AMS engagement:didUpdateRequest:placement:service:type: received",  buf,  2u);
  }

  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003B3674;
  v12[3] = &unk_1006392B0;
  id v13 = v7;
  v14 = self;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)workQueue, v12);
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v5 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AMS engagement:handleDialogRequest:completion: recevied",  v8,  2u);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v5 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AMS engagement:handleEngagementRequest:completion recevied",  v8,  2u);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (void)discoveryArticleLayoutsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003B39D0;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003B4358;
    block[3] = &unk_100639AF0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)dismissedDiscoveryItems:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003B4C4C;
    v7[3] = &unk_1006396B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003B4D54;
    v11[3] = &unk_10063C928;
    v11[4] = self;
    id v12 = v8;
    unint64_t v14 = a4;
    id v13 = v9;
    dispatch_async((dispatch_queue_t)workQueue, v11);
  }
}

- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003B55F8;
  block[3] = &unk_10063C450;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003B57E4;
  v15[3] = &unk_10063B440;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (BOOL)loadDialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dialogRequestPromisesByPlacement,  "objectForKeyedSubscript:",  v6));

  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "already fetching AMSEngagementMessageRequests",  buf,  2u);
    }
  }

  else
  {
    id v10 = (os_log_s *)[[AMSEngagementPlacementInfo alloc] initWithPlacement:v6 context:0];
    -[os_log_s setSupportsMultipleMessages:](v10, "setSupportsMultipleMessages:", 1LL);
    id v11 = objc_alloc(&OBJC_CLASS___AMSEngagementMessageEvent);
    id v33 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    id v13 = [v11 initWithServiceType:PKEngagementWalletService placementInfo:v12];

    uint64_t v14 = PKLogFacilityTypeGetObject(45LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = (char *)os_signpost_id_generate(v15);
    id v17 = v15;
    v18 = v17;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v16,  "com.apple.passkit.dashboard.message-fetch",  "",  buf,  2u);
    }

    uint64_t v19 = PKLogFacilityTypeGetObject(16LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "fetching AMSEngagementMessageRequests for placement %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[AMSEngagement enqueueMessageEvent:](self->_AMPEngagement, "enqueueMessageEvent:", v13));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_dialogRequestPromisesByPlacement,  "setObject:forKeyedSubscript:",  v21,  v6);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dialogRequestPromisesByPlacement,  "objectForKeyedSubscript:",  v6));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1003B5CC0;
    v25[3] = &unk_10065B590;
    id v26 = v6;
    v23 = v18;
    v30[1] = v16;
    v27 = v23;
    v28 = self;
    objc_copyWeak(v30, (id *)buf);
    id v29 = v7;
    [v22 addFinishBlock:v25];

    objc_destroyWeak(v30);
    objc_destroyWeak((id *)buf);
  }

  return v8 == 0LL;
}

- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003B6408;
  v13[3] = &unk_10063C928;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v13);
}

- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003B66C0;
  v13[3] = &unk_10063C928;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v13);
}

- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager engagementMessageWithIdentifier:]( self->_databaseManager,  "engagementMessageWithIdentifier:",  a3));
  [v5 incrementViewCount];
  id v4 = -[PDDatabaseManager updateEngagementMessage:](self->_databaseManager, "updateEngagementMessage:", v5);
  -[PDDiscoveryAnalytics displayedEngagementMessage:](self->_analytics, "displayedEngagementMessage:", v5);
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  databaseManager = self->_databaseManager;
  id v15 = a3;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryItemWithIdentifier:](databaseManager, "discoveryItemWithIdentifier:", v15));
  -[PDDiscoveryAnalytics displayedDiscoveryItemWithIdentifier:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:]( self->_analytics,  "displayedDiscoveryItemWithIdentifier:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:",  v15,  v12,  v11,  v10,  a7,  a8);

  if (!v12)
  {
    [v18 incrementViewCount];
    id v16 = -[PDDatabaseManager updateDiscoveryItem:](self->_databaseManager, "updateDiscoveryItem:", v18);
    uint64_t v17 = (uint64_t)[v18 maxViewCount];
    if ([v18 shouldBadge])
    {
      if (v17 <= 0) {
        uint64_t v17 = 5LL;
      }
    }
  }
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7
{
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
}

- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003B6AAC;
  v8[3] = &unk_10065B5B8;
  id v9 = self;
  id v10 = a4;
  int64_t v11 = a3;
  int64_t v12 = a5;
  id v7 = v10;
  -[PDDiscoveryManager updateDiscoveryItemWithIdentifier:forAction:completion:]( v9,  "updateDiscoveryItemWithIdentifier:forAction:completion:",  v7,  2LL,  v8);
}

- (void)completedDiscoveryItemCTA
{
  databaseManager = self->_databaseManager;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDiscoveryAnalytics lastTappedCTAItemIdentifier](self->_analytics, "lastTappedCTAItemIdentifier"));
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryItemWithIdentifier:](databaseManager, "discoveryItemWithIdentifier:", v4));

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained defaultDiscoveryManager:self completedCTAForItem:v6];
  }

  -[PDDiscoveryAnalytics completedDiscoveryItemCTA](self->_analytics, "completedDiscoveryItemCTA");
}

- (void)removedAllDiscoveryItems
{
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003B6BD0;
  v6[3] = &unk_10065B608;
  id v7 = self;
  id v8 = a3;
  unint64_t v9 = a4;
  id v5 = v8;
  -[PDDiscoveryManager discoveryArticleLayoutsWithCompletion:](v7, "discoveryArticleLayoutsWithCompletion:", v6);
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5
{
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5
{
}

- (void)beginReporingDiscoveryAnalytics
{
}

- (void)endReporingDiscoveryAnalytics
{
}

- (void)fetchWelcomeCardCount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003B6D50;
    v7[3] = &unk_10064B710;
    v7[4] = self;
    id v8 = v4;
    -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v7);
  }
}

- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6
{
  unint64_t v9 = (void (**)(void))a6;
  v9[2]();
}

- (void)passAdded:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received pass added event", buf, 2u);
  }

  +[PKEngagementEventTrigger firePassAddedEvent](&OBJC_CLASS___PKEngagementEventTrigger, "firePassAddedEvent");
  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003B6FC4;
  v9[3] = &unk_1006392B0;
  id v10 = v4;
  int64_t v11 = self;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v9);
}

- (void)passRemoved:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received pass removed event", v5, 2u);
  }

  +[PKEngagementEventTrigger firePassRemovedEvent](&OBJC_CLASS___PKEngagementEventTrigger, "firePassRemovedEvent");
}

- (void)expressPassConfigurationsChanged
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Express pass configs changed", v4, 2u);
  }

  +[PKEngagementEventTrigger fireExpressPassInfoChangedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireExpressPassInfoChangedEvent");
}

- (void)familyCircleChanged
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Family circle changed", v4, 2u);
  }

  +[PKEngagementEventTrigger fireFamilyCircleChangedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireFamilyCircleChangedEvent");
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003B7568;
  v15[3] = &unk_10063B060;
  id v16 = v9;
  id v17 = v10;
  id v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Discovery location Manager error received: %@",  (uint8_t *)&v14,  0xCu);
  }

  if (![v7 code])
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = (objc_class *)objc_opt_class(self, v10);
      id v12 = NSStringFromClass(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 138412546;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Location Manager %@ unable to retreve location, will retry.",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Discovery location authorization updated: %@",  (uint8_t *)&v9,  0xCu);
  }

  if (PKLocationServicesEnabled(v7, v8))
  {
    if (self->_rulesNeedLocation || self->_rulesNeedPlacemark)
    {
      self->_isMonitoringSignificantLocationChanges = 1;
      -[CLLocationManager startMonitoringSignificantLocationChanges]( self->_locationManager,  "startMonitoringSignificantLocationChanges");
    }
  }

  else
  {
    -[CLLocationManager stopMonitoringSignificantLocationChanges]( self->_locationManager,  "stopMonitoringSignificantLocationChanges");
    self->_isMonitoringSignificantLocationChanges = 0;
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  os_unfair_lock_lock(&self->_lock);
  latestValidLocation = self->_latestValidLocation;
  os_unfair_lock_unlock(&self->_lock);
  [v8 horizontalAccuracy];
  if (v10 < 0.0)
  {
    BOOL v11 = 0;
    if (!latestValidLocation) {
      goto LABEL_6;
    }
LABEL_5:
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }

  [v8 horizontalAccuracy];
  BOOL v11 = v12 <= 500.0;
  if (latestValidLocation) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    [v8 horizontalAccuracy];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Discovery manager got location with accuracy: %f",  buf,  0xCu);
  }

  -[PDDiscoveryManager _putLatestValidLocationAndNotify:](self, "_putLatestValidLocationAndNotify:", v8);
  if (self->_rulesNeedPlacemark)
  {
    objc_initWeak((id *)buf, self);
    geocoder = self->_geocoder;
    geocodingLocale = self->_geocodingLocale;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1003B7D74;
    v18[3] = &unk_10065B630;
    objc_copyWeak(&v19, (id *)buf);
    v18[4] = self;
    -[CLGeocoder reverseGeocodeLocation:preferredLocale:completionHandler:]( geocoder,  "reverseGeocodeLocation:preferredLocale:completionHandler:",  v8,  geocodingLocale,  v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 coordinate];
  double v9 = v8;
  double v11 = v10;
  -[CLLocation coordinate](self->_latestValidLocation, "coordinate");
  double v13 = v12;
  double v15 = v14;
  [v7 horizontalAccuracy];
  double v17 = v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 departureDate]);
  [v18 timeIntervalSinceNow];
  double v20 = v19;

  if (v20 <= 0.0)
  {
    double v23 = -v20;
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 arrivalDate]);
    [v21 timeIntervalSinceNow];
    double v23 = -v22;
  }

  v33.latitude = v9;
  v33.longitude = v11;
  if (CLLocationCoordinate2DIsValid(v33))
  {
    BOOL v24 = v9 == v13 || v11 == v15;
    if (!v24 && v17 >= 0.0 && v17 <= 500.0 && v23 <= 3600.0)
    {
      v25 = objc_alloc(&OBJC_CLASS___CLLocation);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      v27 = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:]( v25,  "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:",  v26,  v9,  v11,  0.0,  v17,  -1.0);

      -[PDDiscoveryManager _putLatestValidLocationAndNotify:](self, "_putLatestValidLocationAndNotify:", v27);
      if (self->_rulesNeedPlacemark)
      {
        objc_initWeak(&location, self);
        geocoder = self->_geocoder;
        geocodingLocale = self->_geocodingLocale;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        id v30[2] = sub_1003B80F8;
        v30[3] = &unk_10065B630;
        objc_copyWeak(&v31, &location);
        v30[4] = self;
        -[CLGeocoder reverseGeocodeLocation:preferredLocale:completionHandler:]( geocoder,  "reverseGeocodeLocation:preferredLocale:completionHandler:",  v27,  geocodingLocale,  v30);
        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)processLocationUpdate
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received location update event", v4, 2u);
  }

  +[PKEngagementEventTrigger fireLocationChangedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireLocationChangedEvent");
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received account added event", v6, 2u);
  }

  +[PKEngagementEventTrigger fireAccountAddedEvent](&OBJC_CLASS___PKEngagementEventTrigger, "fireAccountAddedEvent");
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v17 = a4;
  id v6 = a5;
  +[PKEngagementEventTrigger fireAccountUpdatedEvent](&OBJC_CLASS___PKEngagementEventTrigger, "fireAccountUpdatedEvent");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 creditDetails]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountSummary]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v17 creditDetails]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountSummary]);

  if (v8 && v10 && [v6 state] == (id)1 && objc_msgSend(v17, "state") == (id)1)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 creditLimit]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 creditLimit]);
    double v13 = (void *)v12;
    if (v11 && v12 && [v11 compare:v12] == (id)-1) {
      +[PKEngagementEventTrigger fireDefaultCreditAccountCreditLimitIncreasedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireDefaultCreditAccountCreditLimitIncreasedEvent");
    }
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v8 currentBalance]);
    if (objc_msgSend(v14, "pk_isPositiveNumber"))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v10 currentBalance]);
      unsigned int v16 = objc_msgSend(v15, "pk_isZeroNumber");

      if (v16) {
        +[PKEngagementEventTrigger fireDefaultCreditAccountBalancePaidInFullEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireDefaultCreditAccountBalancePaidInFullEvent");
      }
    }

    else
    {
    }
  }
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received account removed event", v6, 2u);
  }

  +[PKEngagementEventTrigger fireAccountRemovedEvent](&OBJC_CLASS___PKEngagementEventTrigger, "fireAccountRemovedEvent");
}

- (void)accountManager:(id)a3 didUpdatePromotions:(id)a4 oldPromotions:(id)a5 accountIdentifier:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  if (!(v11 | v12)
    || v11
    && v12
    && (double v14 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v12),
        double v15 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v11),
        char v16 = PKEqualObjects(v14, v15),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Not reprocessing discovery items since no change to account promotions was detected",  v21,  2u);
    }
  }

  else
  {
    uint64_t v19 = PKLogFacilityTypeGetObject(16LL);
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Reprocessing discovery items after account promotions changed",  buf,  2u);
    }

    -[PDDiscoveryManager processDiscoveryItemsAndMessagesWithCompletion:]( self,  "processDiscoveryItemsAndMessagesWithCompletion:",  &stru_10065B650);
  }
}

- (void)accountManager:(id)a3 scheduledPaymentsChangedForAccountIdentifier:(id)a4
{
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 currentBalance]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 amount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 currentBalance]);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 amount]);
  if (![v9 compare:v11])
  {

    goto LABEL_6;
  }

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 currentBalance]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  if ([v13 compare:v14])
  {
    id v25 = v6;
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v7 currentBalance]);
    BOOL v24 = v8;
    id v16 = v7;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 amount]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
    id v23 = [v17 compare:v18];

    id v7 = v16;
    id v6 = v25;

    if (!v23) {
      goto LABEL_10;
    }
LABEL_6:
    id v19 = [v6 state];
    if (v19 == [v7 state])
    {
      id v20 = [v6 stage];
      if (v20 == [v7 stage]) {
        goto LABEL_13;
      }
    }

    goto LABEL_10;
  }

LABEL_10:
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received peer payment account updated event",  buf,  2u);
  }

  +[PKEngagementEventTrigger firePeerPaymentAccountUpdatedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "firePeerPaymentAccountUpdatedEvent");
LABEL_13:
}

- (void)applyManager:(id)a3 didAddApplication:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received application added event", v6, 2u);
  }

  +[PKEngagementEventTrigger fireFeatureApplicationAddedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireFeatureApplicationAddedEvent");
}

- (void)applyManager:(id)a3 didRemoveApplication:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received application removed event", v6, 2u);
  }

  +[PKEngagementEventTrigger fireFeatureApplicationRemovedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireFeatureApplicationRemovedEvent");
}

- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received application updated event", v7, 2u);
  }

  +[PKEngagementEventTrigger fireFeatureApplicationUpdatedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireFeatureApplicationUpdatedEvent");
}

- (void)transitNotificationService:(id)a3 didAddDCINotificationForMarket:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received DCI-notification-for-market added event",  v6,  2u);
  }

  +[PKEngagementEventTrigger fireDCINotificationForMarketAddedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireDCINotificationForMarketAddedEvent");
}

- (void)transitNotificationService:(id)a3 didAddOpenLoopUpgradeNotificationForMarket:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received open-loop-upgrade-notification added event",  v6,  2u);
  }

  +[PKEngagementEventTrigger fireOpenLoopUpgradeNotificationForMarketAddedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireOpenLoopUpgradeNotificationForMarketAddedEvent");
}

- (void)transitNotificationService:(id)a3 didAddRenotifyNotificationForMarket:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received renotify-notification-for-market added event",  v6,  2u);
  }

  +[PKEngagementEventTrigger fireRenotifyNotificationForMarketAddedEvent]( &OBJC_CLASS___PKEngagementEventTrigger,  "fireRenotifyNotificationForMarketAddedEvent");
}

- (BOOL)_shouldReprocessForTransaction:(id)a3 previousTransactionProcessingDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 updateReasonIsInitialDownload] & 1) != 0
    || ![v5 fullyProcessed])
  {
    unsigned __int8 v7 = 0;
    if (!v6) {
      goto LABEL_4;
    }
LABEL_6:
    double v9 = objc_alloc_init(&OBJC_CLASS___NSDate);
    -[NSDate timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v6);
    double v11 = v10;

    BOOL v8 = v11 >= 3600.0;
    goto LABEL_7;
  }

  unsigned __int8 v7 = +[PDUserEvaluationEnvironment isTransactionRelevant:]( &OBJC_CLASS___PDUserEvaluationEnvironment,  "isTransactionRelevant:",  v5);
  if (v6) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v8 = 1;
LABEL_7:
  BOOL v12 = v7 & v8;

  return v12;
}

- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v5 = a3;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003B8D74;
  v8[3] = &unk_1006392B0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (void)currentLocaleChanged
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003B8E88;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  if ([v6 isEqualToString:@"PDDiscoveryManagerSignificantTimeChangeScheduledActivityIdentifier"])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Running significant time change activity",  buf,  2u);
    }

    PDScheduledActivityRemove( @"PDDiscoveryManager",  @"PDDiscoveryManagerSignificantTimeChangeScheduledActivityIdentifier");
    +[PKEngagementEventTrigger fireDayChangedEvent](&OBJC_CLASS___PKEngagementEventTrigger, "fireDayChangedEvent");
    -[PDDiscoveryManager _scheduleDayChangedEvent](self, "_scheduleDayChangedEvent");
  }

  else
  {
    unsigned int v9 = [v6 isEqualToString:@"PDDiscoveryManagerUpdateNotificationsActivity"];
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(16LL);
      double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = (id)objc_opt_class(self, v12);
        __int16 v36 = 2112;
        id v37 = v6;
        id v13 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Unknown scheduled activity identifier: %@",  buf,  0x16u);
      }
    }

    if (self->_isEvaluatingRules) {
      unsigned int v14 = 0;
    }
    else {
      unsigned int v14 = v9;
    }
    objc_initWeak((id *)buf, self);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v15,  60.0));

    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager discoveryNotificationsRequiringInsertionForDate:]( self->_databaseManager,  "discoveryNotificationsRequiringInsertionForDate:",  v16));
    id v18 = v17;
    if (v14 && [v17 count])
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v20 = v18;
      id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v30;
        do
        {
          id v23 = 0LL;
          do
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v20);
            }
            -[NSMutableSet addObject:](v19, "addObject:", v24);

            id v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }

        while (v21);
      }

      self->_isEvaluatingRules = 1;
      ruleManager = self->_ruleManager;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1003B9334;
      v27[3] = &unk_10065B698;
      objc_copyWeak(&v28, (id *)buf);
      v27[4] = self;
      -[PDRuleManager evaluateRulesWithIdentifiers:completion:]( ruleManager,  "evaluateRulesWithIdentifiers:completion:",  v19,  v27);
      objc_destroyWeak(&v28);
    }

    else
    {
      -[PDDiscoveryManager _queue_scheduleTaskForNextAction](self, "_queue_scheduleTaskForNextAction");
    }

    objc_destroyWeak((id *)buf);
  }
}

- (void)_scheduleDayChangedEvent
{
  uint64_t Criteria = PDScheduledActivityGetCriteria( @"PDDiscoveryManager",  @"PDDiscoveryManagerSignificantTimeChangeScheduledActivityIdentifier");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(Criteria);
  if (!v3)
  {
    id v7 = +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)arc4random_uniform(0x5460u) + 86400.0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v5));
    [v6 setRequireNetworkConnectivity:1];
    [v6 setReason:@"PDDiscoveryManager significant time change"];
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "passd scheduling signficant time change activity: %@",  (uint8_t *)&v11,  0xCu);
    }

    PDScheduledActivityRegister( @"PDDiscoveryManager",  @"PDDiscoveryManagerSignificantTimeChangeScheduledActivityIdentifier",  v6);
    goto LABEL_7;
  }

  uint64_t v4 = PKLogFacilityTypeGetObject(6LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 debugDescription]);
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Signifcant time change already scheduled: %@",  (uint8_t *)&v11,  0xCu);
LABEL_7:
  }
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
}

- (void)fetchLatestValidLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0LL;
    int v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    id v13 = sub_1003B3DC8;
    unsigned int v14 = sub_1003B3DD8;
    id v15 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003B97DC;
    v7[3] = &unk_100659F80;
    v7[4] = self;
    unsigned int v9 = &v10;
    id v6 = (void (**)(void))v4;
    id v8 = v6;
    -[PDDiscoveryManager _executeWithLock:](self, "_executeWithLock:", v7);
    if (v11[5]) {
      v6[2](v6);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)fetchLatestValidPlacemark:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0LL;
    int v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    id v13 = sub_1003B3DC8;
    unsigned int v14 = sub_1003B3DD8;
    id v15 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003B994C;
    v7[3] = &unk_100659F80;
    v7[4] = self;
    unsigned int v9 = &v10;
    id v6 = (void (**)(void))v4;
    id v8 = v6;
    -[PDDiscoveryManager _executeWithLock:](self, "_executeWithLock:", v7);
    if (v11[5]) {
      v6[2](v6);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)_putLatestValidLocationAndNotify:(id)a3
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1003B3DC8;
  id v20 = sub_1003B3DD8;
  id v21 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003B9B78;
  v12[3] = &unk_100643E78;
  id v13 = self;
  id v3 = a3;
  id v14 = v3;
  id v15 = &v16;
  -[PDDiscoveryManager _executeWithLock:](v13, "_executeWithLock:", v12);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v4 = (id)v17[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7) + 16LL))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_putLatestValidPlacemarkAndNotify:(id)a3
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1003B3DC8;
  id v20 = sub_1003B3DD8;
  id v21 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003B9D84;
  v12[3] = &unk_100643E78;
  id v13 = self;
  id v3 = a3;
  id v14 = v3;
  id v15 = &v16;
  -[PDDiscoveryManager _executeWithLock:](v13, "_executeWithLock:", v12);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v4 = (id)v17[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7) + 16LL))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_executeWithLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_startLocationQueryTimeoutIfNecessary
{
  if (!self->_locationTimer)
  {
    objc_initWeak(&location, self);
    id v3 = PDDefaultQueue();
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v4);
    locationTimer = self->_locationTimer;
    self->_locationTimer = v5;

    id v7 = self->_locationTimer;
    dispatch_time_t v8 = dispatch_time(0LL, 15000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    __int128 v9 = self->_locationTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1003B9F38;
    handler[3] = &unk_1006393A0;
    objc_copyWeak(&v11, &location);
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
    dispatch_resume((dispatch_object_t)self->_locationTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (id)pushNotificationTopics
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.apple.pay.engagement");
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  if (-[AMSPushHandler shouldHandleNotification:]( self->_pushNotificationHandler,  "shouldHandleNotification:")) {
    -[AMSPushHandler handleNotification:](self->_pushNotificationHandler, "handleNotification:", v5);
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)updateDiscoveryManifestWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003BA468;
  v4[3] = &unk_100648088;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PDDiscoveryManager _shouldUpdateDiscoveryManifestWithCompletion:]( v5,  "_shouldUpdateDiscoveryManifestWithCompletion:",  v4);
}

- (void)manifestAllowsMiniCardsWithCompletion:(id)a3
{
}

- (void)discoveryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003BA598;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003BA70C;
  v15[3] = &unk_10063B440;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003BA848;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003BAA04;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003BAB80;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003BAC8C;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003BAFE4;
  v11[3] = &unk_10063AC90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, v11);
}

- (void)_shouldUpdateDiscoveryManifestWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003BB0F4;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)_queue_shouldUpdateDiscoveryManifestWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL isUpdatingDiscoveryManifest = self->_isUpdatingDiscoveryManifest;
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (isUpdatingDiscoveryManifest)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Already updating Discovery Manifest...",  buf,  2u);
    }
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating Discovery Manifest...", buf, 2u);
    }

    self->_BOOL isUpdatingDiscoveryManifest = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1003BB210;
    v9[3] = &unk_100648088;
    void v9[4] = self;
    id v10 = v4;
    -[PDDiscoveryManager _fetchDiscoverManifestWithCompletion:](self, "_fetchDiscoverManifestWithCompletion:", v9);
  }
}

- (void)_fetchDiscoverManifestWithCompletion:(id)a3
{
  id v4 = a3;
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003BB3F4;
  v7[3] = &unk_10064B710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v7);
}

- (void)_processDiscoveryManifest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003BB638;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_processDownloadedMessagesManifest:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 notifications]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager _filterNotificationsForOSAndHardwareVersion:]( self,  "_filterNotificationsForOSAndHardwareVersion:",  v7));
  -[PDDiscoveryManager _queue_updateWithServerNotifications:](self, "_queue_updateWithServerNotifications:", v5);
  id v6 = [v4 version];

  self->_currentMessagesBundleVersion = (int64_t)v6;
}

- (void)_queue_processDiscoveryManifest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  databaseManager = self->_databaseManager;
  id v8 = a3;
  BOOL v9 = -[PDDatabaseManager activeDiscoveryItemRequiringBadgeExistsForRelevantDate:]( databaseManager,  "activeDiscoveryItemRequiringBadgeExistsForRelevantDate:",  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 rules]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDDiscoveryManager _filterRulesForOSVersion:](self, "_filterRulesForOSVersion:", v10));

  ruleManager = self->_ruleManager;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  -[PDRuleManager updateWithRules:](ruleManager, "updateWithRules:", v13);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1003BB954;
  v31[3] = &unk_100648088;
  v31[4] = self;
  id v14 = v6;
  id v32 = v14;
  id v15 = objc_retainBlock(v31);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 messagesMetadata]);

  if (v16)
  {
    uint64_t v17 = -[PDDiscoveryManager _currentMessagesBundleVersion](self, "_currentMessagesBundleVersion");
    if (v17 >= (uint64_t)[v16 version])
    {
      *(_WORD *)&self->_shouldRestoreDiscoveryItemsStatusFromDefaults = 0;
      self->_shouldRestoreNotificationsStatusFromDefaults = 0;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1003BB9AC;
      v27[3] = &unk_1006424D0;
      id v28 = v15;
      -[PDDiscoveryManager _queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:completion:]( self,  "_queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:completion:",  v9,  v27);
      id v21 = v28;
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 messagesBundleURL]);
      id v19 = sub_1003BB9B8();
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1003BBA3C;
      v26[3] = &unk_10065B710;
      v26[4] = self;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1003BBA9C;
      v23[3] = &unk_10065B738;
      v23[4] = self;
      BOOL v25 = v9;
      BOOL v24 = v15;
      -[PDDiscoveryManager _fetchAndWriteBundleFromRemoteBundleURL:toLocalBundleURL:processTempBundle:completion:]( self,  "_fetchAndWriteBundleFromRemoteBundleURL:toLocalBundleURL:processTempBundle:completion:",  v18,  v20,  v26,  v23);

      id v21 = v24;
    }
  }

  else
  {
    id v22 = -[PDDiscoveryManager _deleteMessagesBundle](self, "_deleteMessagesBundle");
    -[PDDiscoveryManager _queue_updateWithServerEngagementMessages:]( self,  "_queue_updateWithServerEngagementMessages:",  0LL);
    -[PDDiscoveryManager _queue_updateWithServerNotifications:](self, "_queue_updateWithServerNotifications:", 0LL);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1003BB9A0;
    v29[3] = &unk_1006424D0;
    id v30 = v14;
    -[PDDiscoveryManager _queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:completion:]( self,  "_queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:completion:",  v9,  v29);
    id v21 = v30;
  }
}

- (void)_processUpdatedNotifications
{
  userNotificationManager = self->_userNotificationManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003BBC4C;
  v4[3] = &unk_10065B760;
  void v4[4] = self;
  objc_copyWeak(&v5, &location);
  -[PDUserNotificationManager userNotificationsOfType:completion:]( userNotificationManager,  "userNotificationsOfType:completion:",  27LL,  v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_callDelegateWithLayoutsForUpdatedDiscoveryItemsAndMessages
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003BBF08;
  v6[3] = &unk_10063ABB8;
  void v6[4] = self;
  -[PDDiscoveryManager discoveryArticleLayoutsWithCompletion:](self, "discoveryArticleLayoutsWithCompletion:", v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    replyQueue = self->_replyQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1003BBFEC;
    v5[3] = &unk_100639300;
    v5[4] = self;
    dispatch_async((dispatch_queue_t)replyQueue, v5);
  }

- (int64_t)_currentMessagesBundleVersion
{
  int64_t currentMessagesBundleVersion = self->_currentMessagesBundleVersion;
  if (currentMessagesBundleVersion < 0)
  {
    id v4 = sub_1003B50E8();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v11 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager _discoveryMessageManifestFromBundle:withError:]( self,  "_discoveryMessageManifestFromBundle:withError:",  v5,  &v11));
    id v7 = v11;

    if (v6)
    {
      if (v7)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(16LL);
        BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to load messages manifest bundle with error: %@",  buf,  0xCu);
        }
      }

      else
      {
        self->_int64_t currentMessagesBundleVersion = (int64_t)[v6 version];
      }
    }

    int64_t currentMessagesBundleVersion = self->_currentMessagesBundleVersion;
  }

  return currentMessagesBundleVersion;
}

- (void)_queue_updateWithServerDiscoveryItems:(id)a3
{
  id v7 = a3;
  if (self->_shouldRestoreDiscoveryItemsStatusFromDefaults)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryItems](self->_databaseManager, "discoveryItems"));
    id v5 = [v4 count];

    if (!v5) {
      -[PDDiscoveryManager _queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:]( self,  "_queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:",  v7);
    }
    self->_shouldRestoreDiscoveryItemsStatusFromDefaults = 0;
  }

  id v6 =  -[PDDatabaseManager updateDiscoveryItemsWithRemoteItems:]( self->_databaseManager,  "updateDiscoveryItemsWithRemoteItems:",  v7);
}

- (void)_queue_updateWithServerEngagementMessages:(id)a3
{
  id v7 = a3;
  if (self->_shouldRestoreDiscoveryMessagesStatusFromDefaults)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager engagementMessages](self->_databaseManager, "engagementMessages"));
    id v5 = [v4 count];

    if (!v5) {
      -[PDDiscoveryManager _queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:]( self,  "_queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:",  v7);
    }
    self->_shouldRestoreDiscoveryMessagesStatusFromDefaults = 0;
  }

  id v6 =  -[PDDatabaseManager updateEngagementMessagesWithRemoteMessages:]( self->_databaseManager,  "updateEngagementMessagesWithRemoteMessages:",  v7);
}

- (void)_queue_updateWithServerNotifications:(id)a3
{
  id v7 = a3;
  if (self->_shouldRestoreNotificationsStatusFromDefaults)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryNotifications](self->_databaseManager, "discoveryNotifications"));
    id v5 = [v4 count];

    if (!v5) {
      -[PDDiscoveryManager _queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:]( self,  "_queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:",  v7);
    }
    self->_shouldRestoreNotificationsStatusFromDefaults = 0;
  }

  id v6 =  -[PDDatabaseManager updateDiscoveryNotificationsWithRemoteNotifications:]( self->_databaseManager,  "updateDiscoveryNotificationsWithRemoteNotifications:",  v7);
}

- (void)_queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4
{
  if (self->_forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects) {
    a3 = 1;
  }
  self->_forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects = a3;
  pendingProcessingDiscoveryObjectsBlocks = self->_pendingProcessingDiscoveryObjectsBlocks;
  id v7 = objc_retainBlock(a4);
  -[NSMutableArray addObject:](pendingProcessingDiscoveryObjectsBlocks, "addObject:", v7);

  -[PDDiscoveryManager _queue_performNextProcessingDiscoveryObjects]( self,  "_queue_performNextProcessingDiscoveryObjects");
}

- (void)_queue_performNextProcessingDiscoveryObjects
{
  if (!self->_isEvaluatingRules)
  {
    if (-[NSMutableArray count](self->_pendingProcessingDiscoveryObjectsBlocks, "count"))
    {
      id v3 = -[NSMutableArray copy](self->_pendingProcessingDiscoveryObjectsBlocks, "copy");
      -[NSMutableArray removeAllObjects](self->_pendingProcessingDiscoveryObjectsBlocks, "removeAllObjects");
      BOOL forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects = self->_forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects;
      self->_BOOL forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects = 0;
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1003BC434;
      v6[3] = &unk_100641610;
      void v6[4] = self;
      objc_copyWeak(&v7, &location);
      id v5 = objc_retainBlock(v6);
      self->_isEvaluatingRules = 1;
      -[PDDiscoveryManager _queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:withCompletionBlocks:finalCompletion:]( self,  "_queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:withCompletionBlocks:finalCompletion:",  forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects,  v3,  v5);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }

- (void)_queue_processExistingDiscoveryUserNotifications:(id)a3
{
  id v4 = a3;
  id v5 = sub_1003B50E8();
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v30 = self;
  id v32 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager discoveryNotificationsThatAreNotExpiredForDate:active:delivered:]( self->_databaseManager,  "discoveryNotificationsThatAreNotExpiredForDate:active:delivered:",  0LL,  0LL,  0LL));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = v4;
  id v33 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v33)
  {
    char v27 = 0;
    uint64_t v31 = *(void *)v40;
    id obj = v6;
    do
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 notificationIdentifier]);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v10 = v32;
        id v11 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v11)
        {
          v34 = v8;
          uint64_t v12 = *(void *)v36;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)j);
              id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PDDiscoveryUserNotification notificationIdentifierForDiscoveryNotification:]( &OBJC_CLASS___PDDiscoveryUserNotification,  "notificationIdentifierForDiscoveryNotification:",  v14));
              unsigned int v16 = [v15 isEqualToString:v9];

              if (v16)
              {
                id v11 = v14;
                goto LABEL_16;
              }
            }

            id v11 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
            if (v11) {
              continue;
            }
            break;
          }

- (void)_queue_insertDiscoveryNotificationsIfNecessary
{
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v16,  60.0));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager discoveryNotificationsRequiringInsertionForDate:]( self->_databaseManager,  "discoveryNotificationsRequiringInsertionForDate:",  v3));
  id v5 = v4;
  if (v4)
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v6 = v4;
    char v7 = 0;
    char v8 = 0;
    id v9 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          if ([v12 passQualifier] == (id)1) {
            char v8 = 1;
          }
          else {
            v7 |= [v12 passQualifier] == (id)2;
          }
        }

        id v9 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }

      while (v9);
    }

    objc_initWeak(&location, self);
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x3032000000LL;
    v31[3] = sub_1003B3DC8;
    v31[4] = sub_1003B3DD8;
    id v32 = 0LL;
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x3032000000LL;
    v29[3] = sub_1003B3DC8;
    void v29[4] = sub_1003B3DD8;
    id v30 = 0LL;
    id v13 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    if ((v8 & 1) != 0)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1003BCD00;
      v27[3] = &unk_10064CE10;
      objc_copyWeak(&v28, &location);
      void v27[4] = v31;
      [v13 addOperation:v27];
      objc_destroyWeak(&v28);
    }

    if ((v7 & 1) != 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1003BCF54;
      v25[3] = &unk_10064CE10;
      objc_copyWeak(&v26, &location);
      void v25[4] = v29;
      [v13 addOperation:v25];
      objc_destroyWeak(&v26);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1003BD1A8;
    v19[3] = &unk_10065B7D8;
    objc_copyWeak(&v24, &location);
    id v22 = v31;
    id v23 = v29;
    id v20 = v6;
    id v21 = self;
    [v13 addOperation:v19];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1003BD48C;
    v17[3] = &unk_10063B830;
    objc_copyWeak(&v18, &location);
    id v15 = [v13 evaluateWithInput:v14 completion:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v24);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

    objc_destroyWeak(&location);
  }
}

- (void)_queue_scheduleTaskForNextAction
{
  databaseManager = self->_databaseManager;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager nextRelevantDiscoveryNotificationForDate:]( databaseManager,  "nextRelevantDiscoveryNotificationForDate:",  v4));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scheduledDeliveryDate]);
    char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v8 = [v6 compare:v7];

    if (v8 == (id)1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:-30.0]);

      id v10 = v9;
      id v6 = v10;
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(16LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        char v19 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Next scheduled delivery date is in the past. Scheduling for 10m out to let things clean up.",  (uint8_t *)&v18,  0xCu);
      }

      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
    }

    uint64_t v12 = v10;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v10));
    PDScheduledActivityRegister( @"PDDiscoveryManager",  @"PDDiscoveryManagerUpdateNotificationsActivity",  v15);
    uint64_t v16 = PKLogFacilityTypeGetObject(16LL);
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      char v19 = self;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@: Scheduled task for next action for: %@",  (uint8_t *)&v18,  0x16u);
    }

LABEL_13:
    goto LABEL_14;
  }

  if (PDScheduledActivityExists( @"PDDiscoveryManager",  @"PDDiscoveryManagerUpdateNotificationsActivity"))
  {
    PDScheduledActivityRemove(@"PDDiscoveryManager", @"PDDiscoveryManagerUpdateNotificationsActivity");
    uint64_t v11 = PKLogFacilityTypeGetObject(16LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      char v19 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "%@: Removing scheduled activity because there is no notification scheduled",  (uint8_t *)&v18,  0xCu);
    }

    goto LABEL_13;
  }

- (void)_queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:(BOOL)a3 withCompletionBlocks:(id)a4 finalCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1003BD9C4;
  v25[3] = &unk_100648088;
  id v10 = v8;
  id v26 = v10;
  id v11 = v9;
  id v27 = v11;
  uint64_t v12 = objc_retainBlock(v25);
  id v13 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_1003B3DC8;
  v23[4] = sub_1003B3DD8;
  id v24 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1003BDAD8;
  v22[3] = &unk_10063BBC8;
  v22[4] = self;
  v22[5] = v23;
  [v13 addOperation:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1003BDD48;
  v20[3] = &unk_10065B800;
  BOOL v21 = a3;
  v20[4] = self;
  v20[5] = v23;
  [v13 addOperation:v20];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1003BDED0;
  v17[3] = &unk_100639778;
  id v15 = v12;
  id v18 = v15;
  char v19 = v23;
  id v16 = [v13 evaluateWithInput:v14 completion:v17];

  _Block_object_dispose(v23, 8);
}

- (void)_queue_activeDialogRequestSourcedDiscoveryItems:(id)a3
{
  id v4 = a3;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_1003B3DC8;
  v18[4] = sub_1003B3DD8;
  char v19 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"fetching discovery cards from AMS");
  id v5 = objc_alloc(&OBJC_CLASS___AMSEngagementPlacementInfo);
  id v6 = [v5 initWithPlacement:PKEngagementPassesPlacement context:0];
  [v6 setSupportsMultipleMessages:1];
  id v7 = objc_alloc(&OBJC_CLASS___AMSEngagementMessageEvent);
  id v20 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v9 = [v7 initWithServiceType:PKEngagementWalletService placementInfo:v8];

  if ((-[AMSPromise isTimedOut](self->_discoveryMessagesPromise, "isTimedOut") & 1) == 0
    && (!-[AMSPromise isFinished](self->_discoveryMessagesPromise, "isFinished")
     || (-[AMSPromise isCancelled](self->_discoveryMessagesPromise, "isCancelled") & 1) == 0))
  {
    -[AMSPromise cancel](self->_discoveryMessagesPromise, "cancel");
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AMSEngagement enqueueMessageEvent:](self->_AMPEngagement, "enqueueMessageEvent:", v9));
  discoveryMessagesPromise = self->_discoveryMessagesPromise;
  p_discoveryMessagesPromise = &self->_discoveryMessagesPromise;
  *p_discoveryMessagesPromise = (AMSPromise *)v10;

  id v13 = *p_discoveryMessagesPromise;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003BE0FC;
  v15[3] = &unk_10065B828;
  unsigned int v17 = v18;
  id v14 = v4;
  id v16 = v14;
  -[AMSPromise addFinishBlock:](v13, "addFinishBlock:", v15);

  _Block_object_dispose(v18, 8);
}

- (void)_queue_evaluateRulesAndForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager discoveryNotificationsThatAreNotExpiredForDate:active:delivered:]( self->_databaseManager,  "discoveryNotificationsThatAreNotExpiredForDate:active:delivered:",  v8,  0LL,  2LL));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)v13) ruleIdentifier]);
        if (v14) {
          -[NSMutableSet addObject:](v7, "addObject:", v14);
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  objc_initWeak(&location, self);
  ruleManager = self->_ruleManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1003BE60C;
  v17[3] = &unk_10065B878;
  void v17[4] = self;
  objc_copyWeak(&v19, &location);
  BOOL v20 = a3;
  id v16 = v6;
  id v18 = v16;
  -[PDRuleManager evaluateRulesWithIdentifiers:completion:]( ruleManager,  "evaluateRulesWithIdentifiers:completion:",  v7,  v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_articleLayoutForDiscoveryItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  if (sub_1003B4B40(v6))
  {
    id v16 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager _discoveryArticleLayoutFromBundleForDiscoveryItem:error:]( self,  "_discoveryArticleLayoutFromBundleForDiscoveryItem:error:",  v6,  &v16));
    id v9 = v16;
    if (v8)
    {
      id v10 = [v8 version];
      if ((uint64_t)v10 >= (uint64_t)[v6 version])
      {
        v7[2](v7, v8, v9);

        goto LABEL_6;
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v12 = sub_1003BEA34(v6);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 removeItemAtURL:v13 error:0];
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003BEAD0;
  v14[3] = &unk_10065B8A0;
  v14[4] = self;
  id v15 = v7;
  -[PDDiscoveryManager _fetchAndWriteBundleForDiscoveryItem:completion:]( self,  "_fetchAndWriteBundleForDiscoveryItem:completion:",  v6,  v14);

LABEL_6:
}

- (void)_fetchAndWriteBundleForDiscoveryItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 layoutBundleURL]);
  id v9 = sub_1003BEA34(v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003BEC84;
  v13[3] = &unk_100651360;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  -[PDDiscoveryManager _fetchAndWriteBundleFromRemoteBundleURL:toLocalBundleURL:processTempBundle:completion:]( self,  "_fetchAndWriteBundleFromRemoteBundleURL:toLocalBundleURL:processTempBundle:completion:",  v8,  v10,  0LL,  v13);
}

- (void)_fetchAndWriteBundleFromRemoteBundleURL:(id)a3 toLocalBundleURL:(id)a4 processTempBundle:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1003BEE0C;
  v19[3] = &unk_10065B918;
  id v20 = v10;
  BOOL v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v19);
}

- (id)_filterRulesForOSVersion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PKOSVersionRequirement fromDeviceVersion](&OBJC_CLASS___PKOSVersionRequirement, "fromDeviceVersion"));
  uint64_t v6 = PKDeviceClass();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "osVersionRequirementRange", (void)v18));
        id v15 = v14;
      }

      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  id v16 = -[NSMutableArray copy](v4, "copy");
  return v16;
}

- (id)_filterDiscoveryItemsForOSAndHardwareVersion:(id)a3
{
  return -[PDDiscoveryManager _filterDiscoveryObjectsForOSAndHardwareVersion:]( self,  "_filterDiscoveryObjectsForOSAndHardwareVersion:",  a3);
}

- (id)_filterEngagementMessagesForOSAndHardwareVersion:(id)a3
{
  return -[PDDiscoveryManager _filterDiscoveryObjectsForOSAndHardwareVersion:]( self,  "_filterDiscoveryObjectsForOSAndHardwareVersion:",  a3);
}

- (id)_filterNotificationsForOSAndHardwareVersion:(id)a3
{
  return -[PDDiscoveryManager _filterDiscoveryObjectsForOSAndHardwareVersion:]( self,  "_filterDiscoveryObjectsForOSAndHardwareVersion:",  a3);
}

- (id)_filterDiscoveryObjectsForOSAndHardwareVersion:(id)a3
{
  id v3 = a3;
  __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[PKOSVersionRequirement fromDeviceVersion](&OBJC_CLASS___PKOSVersionRequirement, "fromDeviceVersion"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PKDeviceVersion fromCurrentDeviceVersion](&OBJC_CLASS___PKDeviceVersion, "fromCurrentDeviceVersion"));
  uint64_t v5 = PKDeviceClass();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 osVersionRange]);
        id v14 = v13;
        BOOL v15 = v13 && ![v13 versionMeetsRequirements:v21 deviceClass:v6];
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 hardwareVersionRange]);
        id v17 = v16;
        if (v16)
        {
LABEL_12:
          -[NSMutableArray addObject:](v20, "addObject:", v12);
          goto LABEL_13;
        }

        if (!v15) {
          goto LABEL_12;
        }
LABEL_13:

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v18 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v9 = v18;
    }

    while (v18);
  }

  return v20;
}

- (id)_filterItemsForViewCount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v10, "maxViewCount", (void)v14);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableArray copy](v4, "copy");
  return v12;
}

- (id)_filterEngagementMessagesForViewCount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(v10, "maxViewCount", (void)v15);
        if (v11) {
          uint64_t v12 = (uint64_t)v11;
        }
        else {
          uint64_t v12 = 5LL;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = -[NSMutableArray copy](v4, "copy");
  return v13;
}

- (id)_discoveryArticleLayoutFromBundleForDiscoveryItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v19 = 0LL;
  id v6 = objc_alloc(&OBJC_CLASS___NSBundle);
  id v7 = sub_1003BEA34(v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[NSBundle initWithURL:](v6, "initWithURL:", v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSBundle URLForResource:withExtension:]( v9,  "URLForResource:withExtension:",  @"layout",  @"json"));
  if (!v10)
  {
    id v12 = 0LL;
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKDiscoveryErrorDomain,  3LL,  0LL));
    if (!v19) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v10,  0LL,  &v19));
  id v12 = 0LL;
  if (!v19)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  &v19));
    id v12 = 0LL;
    if (!v19)
    {
      id v12 = [[PKDiscoveryArticleLayout alloc] initWithDictionary:v13];
      if (!v12) {
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKDiscoveryErrorDomain,  4LL,  0LL));
      }
    }
  }

  if (v19)
  {
LABEL_10:
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v15 = sub_1003BEA34(v5);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
    [v14 removeItemAtPath:v17 error:0];

    if (a4) {
      *a4 = v19;
    }
  }

- (id)_discoveryMessageManifestFromBundle:(id)a3 withError:(id *)a4
{
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 URLForResource:@"messages" withExtension:@"json"]);
  if (!v6)
  {
    id v8 = 0LL;
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKDiscoveryErrorDomain,  3LL,  0LL));
    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v6,  0LL,  &v12));
  id v8 = 0LL;
  if (!v12)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v12));
    id v8 = 0LL;
    if (!v12) {
      id v8 = [[PKDiscoveryMessagesManifest alloc] initWithDictionary:v9];
    }
  }

  if (v12)
  {
LABEL_9:
    id v10 = -[PDDiscoveryManager _deleteMessagesBundle](self, "_deleteMessagesBundle");
    if (a4) {
      *a4 = v12;
    }
  }

- (id)_deleteMessagesBundle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  self->_int64_t currentMessagesBundleVersion = -1LL;
  id v4 = sub_1003BB9B8();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);

  if ([v3 fileExistsAtPath:v6])
  {
    id v11 = 0LL;
    [v3 removeItemAtPath:v6 error:&v11];
    id v7 = v11;
    if (v7)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(16LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Error deleting messages bundle: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_cleanArticleLayoutsDirectories
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003BFEC4;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"PDDiscoveryItemStatus"]);
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "restoring from userDefaults for discovery items: %@",  buf,  0xCu);
  }

  if ([v6 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003C03CC;
    v11[3] = &unk_10065B9A8;
    id v12 = v6;
    id v9 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v11);
    if ([v9 count])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "restoring status of discovery items: %@",  buf,  0xCu);
      }

      id v10 = -[PDDatabaseManager setDiscoveryItems:](self->_databaseManager, "setDiscoveryItems:", v9);
    }
  }
}

- (void)_queue_updateDiscoveryItemStatusDefaults
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryItems](self->_databaseManager, "discoveryItems"));
  -[PDDiscoveryManager _updateDiscoveryItemStatusDefaultsForUpdatedItems:]( self,  "_updateDiscoveryItemStatusDefaultsForUpdatedItems:",  v3);
}

- (void)_updateDiscoveryItemStatusDefaultsForUpdatedItems:(id)a3
{
  id v4 = a3;
  if (self->_shouldRestoreDiscoveryItemsStatusFromDefaults)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ignoring update to Discovery Items defaults because they haven't been restored yet",  buf,  2u);
    }
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (objc_msgSend(v13, "isTerminalStatus", (void)v16))
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 status]));
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, v15);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v10);
    }

    -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v7, @"PDDiscoveryItemStatus");
  }
}

- (void)_queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (PDDiscoveryManager *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"PDDiscoveryEngagementMessageStatus"]);
  uint64_t Object = PKLogFacilityTypeGetObject(16LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "restoring from userDefaults for discovery message: %@",  buf,  0xCu);
  }

  if (-[PDDiscoveryManager count](v6, "count"))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003C083C;
    v11[3] = &unk_10065B9D0;
    id v12 = v6;
    id v9 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v11);
    if ([v9 count])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Restoring status of discovery messages: %@",  buf,  0x16u);
      }

      id v10 = -[PDDatabaseManager updateEngagementMessages:](self->_databaseManager, "updateEngagementMessages:", v9);
    }
  }
}

- (void)_queue_updateDiscoveryEngagementMessageStatusDefaults
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager engagementMessages](self->_databaseManager, "engagementMessages"));
  -[PDDiscoveryManager _updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:]( self,  "_updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:",  v3);
}

- (void)_updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:(id)a3
{
  id v4 = a3;
  if (self->_shouldRestoreDiscoveryMessagesStatusFromDefaults)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ignoring update to Discovery Messages defaults because they haven't been restored yet",  buf,  2u);
    }
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (objc_msgSend(v13, "isTerminalStatus", (void)v16))
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 status]));
            __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, v15);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v10);
    }

    -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v7, @"PDDiscoveryEngagementMessageStatus");
  }
}

- (void)_queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"PDDiscoveryNotificationsStatus"]);
  if ([v6 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003C0C54;
    v11[3] = &unk_10065B9F8;
    id v12 = v6;
    id v7 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v11);
    if ([v7 count])
    {
      uint64_t Object = PKLogFacilityTypeGetObject(16LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "restoring status of discovery notifications %@",  buf,  0xCu);
      }

      id v10 =  -[PDDatabaseManager updateDiscoveryNotifications:]( self->_databaseManager,  "updateDiscoveryNotifications:",  v7);
    }
  }
}

- (void)_queue_updateDiscoveryNotificationsStatusDefaults
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryNotifications](self->_databaseManager, "discoveryNotifications"));
  -[PDDiscoveryManager _queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:]( self,  "_queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:",  v3);
}

- (void)_queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:(id)a3
{
  id v4 = a3;
  if (self->_shouldRestoreNotificationsStatusFromDefaults)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ignoring update to Discovery Notification defaults because they haven't been restored yet",  buf,  2u);
    }
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (objc_msgSend(v13, "isTerminalStatus", (void)v16))
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 status]));
            __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, v15);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v10);
    }

    -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v7, @"PDDiscoveryNotificationsStatus");
  }
}

- (CLLocation)latestValidLocation
{
  return self->_latestValidLocation;
}

- (CLPlacemark)latestValidPlacemark
{
  return self->_latestValidPlacemark;
}

- (BOOL)rulesNeedLocation
{
  return self->_rulesNeedLocation;
}

- (BOOL)rulesNeedPlacemark
{
  return self->_rulesNeedPlacemark;
}

- (void).cxx_destruct
{
}

@end