@interface CWFAutoJoinManager
- (BOOL)__allowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4;
- (BOOL)__allowHotspot:(id)a3 error:(id *)a4;
- (BOOL)__allowJoinCandidate:(id)a3 context:(id)a4 defer:(BOOL *)a5 error:(id *)a6;
- (BOOL)__allowKnownNetwork:(id)a3 context:(id)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 targetQueue:(id)a7 error:(id *)a8;
- (BOOL)__allowOpportunisticNetworkTransitionWithTrigger:(int64_t)a3;
- (BOOL)__calloutToAllowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4;
- (BOOL)__calloutToAllowHotspot:(id)a3 error:(id *)a4;
- (BOOL)__calloutToAllowJoinCandidate:(id)a3 trigger:(int64_t)a4 defer:(BOOL *)a5 error:(id *)a6;
- (BOOL)__calloutToAllowKnownNetwork:(id)a3 trigger:(int64_t)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 queue:(id)a7 error:(id *)a8;
- (BOOL)__calloutToAssociateWithParameters:(id)a3 error:(id *)a4;
- (BOOL)__calloutToConnectToHotspot:(id)a3 error:(id *)a4;
- (BOOL)__candidateSupportsSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 context:(id)a5;
- (BOOL)__connectToHotspot:(id)a3 error:(id *)a4;
- (BOOL)__didRecentlyJoinAny6GHzOnlyNetworks:(id)a3;
- (BOOL)__discoverKnownNetworksWithContext:(id)a3 error:(id *)a4;
- (BOOL)__does6GHzChannelOverlapWithUWB:(id)a3;
- (BOOL)__forceNearbyNetworkRetrySchedule;
- (BOOL)__hasJoinedAnyKnownNetworkSinceBoot;
- (BOOL)__isAnyKnownNetworkNearby;
- (BOOL)__isAutoJoinCancelled:(id *)a3;
- (BOOL)__isAutoJoinRequeued;
- (BOOL)__isDeferrableJoinCandidate:(id)a3;
- (BOOL)__isDeferrableKnownNetwork:(id)a3;
- (BOOL)__isNonPinnedEAPTLSCandidate:(id)a3;
- (BOOL)__matchAndJoinScanResults:(id)a3 allowPreAssociationScan:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (BOOL)__nextRequest;
- (BOOL)__performAutoHotspotWithBrowseTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6;
- (BOOL)__performJoinWithNetwork:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)__preflightMatchKnownNetworksForScanResult:(id)a3;
- (BOOL)__shouldAllowAutoHotspotForTrigger:(int64_t)a3;
- (BOOL)__shouldAllowPreAssocScan;
- (BOOL)__shouldAlwaysUpdateRetrySchedule:(int64_t)a3;
- (BOOL)__shouldBypassLockdownModeCheckForTrigger:(int64_t)a3 targetNetworkSSID:(id)a4 networkSSID:(id)a5;
- (BOOL)__shouldBypassUnusedNetworkPeriodCheckForTrigger:(int64_t)a3 knownNetwork:(id)a4;
- (BOOL)__shouldIgnoreRequestWithTrigger:(int64_t)a3;
- (BOOL)__shouldInvokeImmediatelyForTrigger:(int64_t)a3;
- (BOOL)__shouldPrioritizeRetryOverNewRequest:(int64_t)a3;
- (BOOL)__shouldResetRetryIntervalIndexForTrigger:(int64_t)a3;
- (BOOL)__shouldThrottleAutoJoinTrigger:(int64_t)a3;
- (BOOL)isKnownNetworkDisallowed:(id)a3;
- (BOOL)lockdownModeEnabled;
- (BOOL)maxCompatibilityEnabled;
- (CLLocation)location;
- (CWFAutoJoinManager)init;
- (CWFAutoJoinMetric)metric;
- (CWFAutoJoinStatistics)statistics;
- (CWFScanResult)associatedNetwork;
- (NSSet)knownNetworks;
- (NSSet)supportedChannels;
- (NSString)colocatedScopeID;
- (OS_dispatch_queue)targetQueue;
- (id)__alreadyFoundFollowup6GHzBSSWithSignature:(id)a3;
- (id)__basicChannelRepresentation:(id)a3;
- (id)__browseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6;
- (id)__cachedScanResultsWithChannelList:(id)a3 context:(id)a4;
- (id)__calloutToBrowseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6;
- (id)__calloutToPerformGASQueryWithParameters:(id)a3 GASQueryNetworks:(id *)a4 error:(id *)a5;
- (id)__calloutToScanForNetworksWithParameters:(id)a3 scanChannels:(id *)a4 error:(id *)a5;
- (id)__descriptionForError:(id)a3;
- (id)__knownNetworksList:(id)a3 containsMatchingKnownNetwork:(id)a4;
- (id)__knownNetworksSupportingSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 allowSameSSID:(BOOL)a5 context:(id)a6;
- (id)__morePreferredKnownNetworksWithCandidate:(id)a3 knownNetworks:(id)a4 context:(id)a5;
- (id)__passpointScanResults:(id)a3;
- (id)__perform6GHzFollowupDiscoveryWithScanResults:(id)a3 SSIDList:(id)a4 dwellTime:(unint64_t)a5 context:(id)a6 error:(id *)a7;
- (id)__performGASQueryWithScanResults:(id)a3 ANQPElementIDList:(id)a4 maxCacheAge:(unint64_t)a5 cacheOnly:(BOOL)a6 error:(id *)a7;
- (id)__performPreAssociationScanWithContext:(id)a3 network:(id)a4;
- (id)__performScanWithChannelList:(id)a3 SSIDList:(id)a4 passive:(BOOL)a5 dwellTime:(unint64_t)a6 maxCacheAge:(unint64_t)a7 cacheOnly:(BOOL)a8 isPreAssociationScan:(BOOL)a9 error:(id *)a10;
- (id)__retryInterval;
- (id)__retryIntervalWithScheduleIndex:(unint64_t)a3;
- (id)allowAutoHotspotHandler;
- (id)allowAutoJoinHandler;
- (id)allowHotspotHandler;
- (id)allowJoinCandidateHandler;
- (id)allowKnownNetworkHandler;
- (id)associateToNetworkHandler;
- (id)browseForHotspotsHandler;
- (id)connectToHotspotHandler;
- (id)eventHandler;
- (id)invalidationHandler;
- (id)joinCandidateComparator;
- (id)knownNetworkComparator;
- (id)performAutoJoinWithParameters:(id)a3 reply:(id)a4;
- (id)performGASQueryHandler;
- (id)scanForNetworksHandler;
- (id)updateKnownNetworkHandler;
- (int64_t)__allowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4;
- (int64_t)__calloutToAllowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4;
- (int64_t)__retryTriggerForRetrySchedule:(int64_t)a3;
- (int64_t)retrySchedule;
- (unint64_t)__applyRetryIntervalSkew:(unint64_t)a3;
- (unint64_t)__nextRequestInterval;
- (unsigned)__qosForAutoJoinTrigger:(int64_t)a3;
- (void)__addDependentThrottleInterval:(unint64_t)a3 trigger:(int64_t)a4 dependentTrigger:(int64_t)a5;
- (void)__addDisallowedKnownNetwork:(id)a3;
- (void)__addMatchingThrottleInterval:(unint64_t)a3 triggers:(id)a4;
- (void)__addRequest:(id)a3;
- (void)__addWilcardThrottleInterval:(unint64_t)a3 triggers:(id)a4;
- (void)__invalidateAllowedKnownNetworksCacheForTrigger:(int64_t)a3;
- (void)__performAutoJoin;
- (void)__prepareKnownNetworksContext:(id)a3;
- (void)__removeDisallowedKnownNetwork:(id)a3;
- (void)__removeRedundantRequests:(id)a3;
- (void)__resetRetryIntervalIndex;
- (void)__setupRetryIntervals;
- (void)__setupThrottleIntervals;
- (void)__sortHotspotCandidates:(id)a3;
- (void)__sortJoinCandidates:(id)a3 context:(id)a4;
- (void)__sortKnownNetworks:(id)a3;
- (void)__sortKnownNetworksByJoinTimestamp:(id)a3;
- (void)__updateAutoJoinState:(int64_t)a3;
- (void)__updateCachedMetricAndStatistics:(id)a3;
- (void)__updateDiscoverTimestampForJoinCandidates:(id)a3;
- (void)__updateNextRequestTimer;
- (void)__updateRNRChannel:(id)a3 has6GHzOnlyBSS:(BOOL)a4 joinCandidate:(id)a5;
- (void)__updateRetrySchedule;
- (void)__updateStatisticsWithPreAssocScanChannels:(id)a3;
- (void)__updateStatisticsWithScanChannels:(id)a3;
- (void)cancelAutoJoinWithUUID:(id)a3 error:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)resetStatistics;
- (void)setAllowAutoHotspotHandler:(id)a3;
- (void)setAllowAutoJoinHandler:(id)a3;
- (void)setAllowHotspotHandler:(id)a3;
- (void)setAllowJoinCandidateHandler:(id)a3;
- (void)setAllowKnownNetworkHandler:(id)a3;
- (void)setAssociateToNetworkHandler:(id)a3;
- (void)setAssociatedNetwork:(id)a3;
- (void)setBrowseForHotspotsHandler:(id)a3;
- (void)setColocatedScopeID:(id)a3;
- (void)setConnectToHotspotHandler:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setJoinCandidateComparator:(id)a3;
- (void)setKnownNetworkComparator:(id)a3;
- (void)setKnownNetworks:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLockdownModeEnabled:(BOOL)a3;
- (void)setMaxCompatibilityEnabled:(BOOL)a3;
- (void)setPerformGASQueryHandler:(id)a3;
- (void)setRetrySchedule:(int64_t)a3;
- (void)setScanForNetworksHandler:(id)a3;
- (void)setSupportedChannels:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setUpdateKnownNetworkHandler:(id)a3;
@end

@implementation CWFAutoJoinManager

- (CWFAutoJoinManager)init
{
  v78.receiver = self;
  v78.super_class = (Class)&OBJC_CLASS___CWFAutoJoinManager;
  id v2 = -[CWFAutoJoinManager init](&v78, sel_init);
  if (!v2) {
    goto LABEL_29;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.auto-join", v3);
  v5 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v4;

  if (!*((void *)v2 + 1)) {
    goto LABEL_29;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.auto-join.target", v6);
  v8 = (void *)*((void *)v2 + 68);
  *((void *)v2 + 68) = v7;

  if (!*((void *)v2 + 68)) {
    goto LABEL_29;
  }
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  v10 = (void *)*((void *)v2 + 12);
  *((void *)v2 + 12) = v9;

  if (!*((void *)v2 + 12)) {
    goto LABEL_29;
  }
  id v11 = objc_alloc_init(MEMORY[0x189603FE0]);
  v12 = (void *)*((void *)v2 + 20);
  *((void *)v2 + 20) = v11;

  if (!*((void *)v2 + 20)) {
    goto LABEL_29;
  }
  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
  v14 = (void *)*((void *)v2 + 27);
  *((void *)v2 + 27) = v13;

  if (!*((void *)v2 + 27)) {
    goto LABEL_29;
  }
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  v16 = (void *)*((void *)v2 + 28);
  *((void *)v2 + 28) = v15;

  if (!*((void *)v2 + 28)) {
    goto LABEL_29;
  }
  id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
  v18 = (void *)*((void *)v2 + 29);
  *((void *)v2 + 29) = v17;

  if (!*((void *)v2 + 29)) {
    goto LABEL_29;
  }
  id v19 = objc_alloc_init(MEMORY[0x189603FC8]);
  v20 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v19;

  if (!*((void *)v2 + 11)) {
    goto LABEL_29;
  }
  id v21 = objc_alloc_init(MEMORY[0x189603FC8]);
  v22 = (void *)*((void *)v2 + 21);
  *((void *)v2 + 21) = v21;

  if (!*((void *)v2 + 21)) {
    goto LABEL_29;
  }
  id v23 = objc_alloc_init(MEMORY[0x189603FC8]);
  v24 = (void *)*((void *)v2 + 22);
  *((void *)v2 + 22) = v23;

  if (!*((void *)v2 + 22)) {
    goto LABEL_29;
  }
  id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
  v26 = (void *)*((void *)v2 + 23);
  *((void *)v2 + 23) = v25;

  if (!*((void *)v2 + 23)) {
    goto LABEL_29;
  }
  id v27 = objc_alloc_init(MEMORY[0x189603FE0]);
  v28 = (void *)*((void *)v2 + 24);
  *((void *)v2 + 24) = v27;

  if (!*((void *)v2 + 24)) {
    goto LABEL_29;
  }
  id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
  v30 = (void *)*((void *)v2 + 33);
  *((void *)v2 + 33) = v29;

  if (!*((void *)v2 + 33)) {
    goto LABEL_29;
  }
  v31 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinStatistics);
  v32 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v31;

  if (!*((void *)v2 + 15)) {
    goto LABEL_29;
  }
  objc_msgSend_date(MEMORY[0x189603F50], v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(*((void **)v2 + 15), v38, (uint64_t)v37, v39, v40);

  dispatch_source_t v41 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *((dispatch_queue_t *)v2 + 1));
  v42 = (void *)*((void *)v2 + 16);
  *((void *)v2 + 16) = v41;

  v43 = (dispatch_source_s *)*((void *)v2 + 16);
  if (!v43) {
    goto LABEL_29;
  }
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = sub_18649A1C4;
  handler[3] = &unk_189E5BC10;
  v44 = (CWFAutoJoinManager *)v2;
  v77 = v44;
  dispatch_source_set_event_handler(v43, handler);

  v45 = (dispatch_source_s *)*((void *)v2 + 16);
  dispatch_time_t v46 = dispatch_walltime(0LL, 86400000000000LL);
  dispatch_source_set_timer(v45, v46, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume(*((dispatch_object_t *)v2 + 16));
  v47 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  hiddenNetworkChannels = v44->_hiddenNetworkChannels;
  v44->_hiddenNetworkChannels = v47;

  if (!v44->_hiddenNetworkChannels) {
    goto LABEL_29;
  }
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  cachedKnownNetworksContexts = v44->_cachedKnownNetworksContexts;
  v44->_cachedKnownNetworksContexts = v49;

  if (!v44->_cachedKnownNetworksContexts) {
    goto LABEL_29;
  }
  v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  knownNetworkSSIDMap = v44->_knownNetworkSSIDMap;
  v44->_knownNetworkSSIDMap = v51;

  if (!v44->_knownNetworkSSIDMap) {
    goto LABEL_29;
  }
  v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  knownNetworkPasspointDomainMap = v44->_knownNetworkPasspointDomainMap;
  v44->_knownNetworkPasspointDomainMap = v53;

  v55 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x189603FD0]);
  deferredKnownNetworks = v44->_deferredKnownNetworks;
  v44->_deferredKnownNetworks = v55;

  if (!v44->_deferredKnownNetworks) {
    goto LABEL_29;
  }
  v57 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  knownNetworkAllowCache = v44->_knownNetworkAllowCache;
  v44->_knownNetworkAllowCache = v57;

  if (!v44->_knownNetworkAllowCache) {
    goto LABEL_29;
  }
  v59 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  knownNetworkAllowErrorCache = v44->_knownNetworkAllowErrorCache;
  v44->_knownNetworkAllowErrorCache = v59;

  if (!v44->_knownNetworkAllowErrorCache) {
    goto LABEL_29;
  }
  v61 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  knownNetworkDeferCache = v44->_knownNetworkDeferCache;
  v44->_knownNetworkDeferCache = v61;

  if (!v44->_knownNetworkDeferCache) {
    goto LABEL_29;
  }
  v63 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  updatedAllowCacheKnownNetworks = v44->_updatedAllowCacheKnownNetworks;
  v44->_updatedAllowCacheKnownNetworks = v63;

  if (!v44->_updatedAllowCacheKnownNetworks) {
    goto LABEL_29;
  }
  v65 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  disallowedKnownNetworks = v44->_disallowedKnownNetworks;
  v44->_disallowedKnownNetworks = v65;

  if (v44->_disallowedKnownNetworks)
  {
    objc_msgSend___setupRetryIntervals(v44, v67, v68, v69, v70);
    objc_msgSend___setupThrottleIntervals(v44, v71, v72, v73, v74);
  }

  else
  {
LABEL_29:

    return 0LL;
  }

  return v44;
}

- (void)invalidate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    *(_WORD *)&v2->_invalidated = 257;
    underlyingCancelError = v2->_underlyingCancelError;
    v2->_underlyingCancelError = 0LL;

    internalQueue = (dispatch_queue_s *)v2->_internalQueue;
    qos_class_t v5 = qos_class_self();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18649A580;
    block[3] = &unk_189E5BC10;
    block[4] = v2;
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v5, 0, block);
    dispatch_async(internalQueue, v6);
  }

  objc_sync_exit(v2);
}

- (NSSet)knownNetworks
{
  id v2 = self;
  objc_sync_enter(v2);
  dispatch_queue_t v7 = (void *)objc_msgSend_copy(v2->_knownNetworks, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (NSSet *)v7;
}

- (CWFScanResult)associatedNetwork
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_associatedNetwork;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAssociatedNetwork:(id)a3
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  p_uint64_t associatedNetwork = (void **)&v6->_associatedNetwork;
  uint64_t associatedNetwork = (uint64_t)v6->_associatedNetwork;
  if ((id)associatedNetwork != v5
    && (!v5 || !associatedNetwork || !objc_msgSend_isEqual_(v5, v7, associatedNetwork, v8, v9)))
  {
    goto LABEL_13;
  }

  objc_msgSend_matchingKnownNetworkProfile(v5, v7, associatedNetwork, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v13, v14, v15, v16);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v21)
  {

    goto LABEL_35;
  }

  objc_msgSend_matchingKnownNetworkProfile(v5, v17, v18, v19, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26) {
    goto LABEL_12;
  }
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v22, v23, v24, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {

LABEL_12:
    goto LABEL_13;
  }

  objc_msgSend_matchingKnownNetworkProfile(v5, v27, v28, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v133) = objc_msgSend_isEqual_(v32, v38, (uint64_t)v37, v39, v40);

  if ((v133 & 0x100000000LL) != 0) {
    goto LABEL_35;
  }
LABEL_13:
  CWFGetOSLog();
  dispatch_source_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    CWFGetOSLog();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v42 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v43 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    int v134 = 138543362;
    id v135 = v5;
    LODWORD(v133) = 12;
    v132 = &v134;
    _os_log_send_and_compose_impl();
  }

  if ((v5 != 0LL) == (*p_associatedNetwork == 0LL)) {
    v6->_linkChangeTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  }
  objc_storeStrong((id *)&v6->_associatedNetwork, a3);
  objc_msgSend_matchingKnownNetworkProfile(v6->_steerToNetwork, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v48, v49, v50, v51, v52);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v57) {
    goto LABEL_25;
  }
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v53, v54, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v58, v59, v60, v61, v62);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v67)
  {

LABEL_25:
    goto LABEL_26;
  }

  objc_msgSend_matchingKnownNetworkProfile(v6->_steerToNetwork, v63, v64, v65, v66);
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v68, v69, v70, v71, v72);
  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v74, v75, v76, v77);
  objc_super v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v78, v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v133) = objc_msgSend_isEqual_(v73, v84, (uint64_t)v83, v85, v86);

  if ((v133 & 0x100000000LL) == 0)
  {
LABEL_26:
    steerToNetwork = v6->_steerToNetwork;
    v6->_steerToNetwork = 0LL;

    steerFromNetwork = v6->_steerFromNetwork;
    v6->_steerFromNetwork = 0LL;
  }

  if (v5)
  {
    objc_msgSend_networkProfile(v5, v87, v88, v89, v90);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v93, v94, v95, v96, v97);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      disallowedKnownNetworks = v6->_disallowedKnownNetworks;
      objc_msgSend_identifier(v93, v98, v99, v100, v101);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(disallowedKnownNetworks) = objc_msgSend_containsObject_( disallowedKnownNetworks,  v105,  (uint64_t)v104,  v106,  v107);

      if ((_DWORD)disallowedKnownNetworks)
      {
        v108 = v6->_disallowedKnownNetworks;
        objc_msgSend_identifier(v93, v98, v99, v100, v101);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v108, v110, (uint64_t)v109, v111, v112);
      }
    }

    objc_msgSend_identifier(v93, v98, v99, v100, v101, v132, v133);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (v117)
    {
      failedToJoinKnownNetworkIDs = v6->_failedToJoinKnownNetworkIDs;
      objc_msgSend_identifier(v93, v113, v114, v115, v116);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(failedToJoinKnownNetworkIDs) = objc_msgSend_containsObject_( failedToJoinKnownNetworkIDs,  v120,  (uint64_t)v119,  v121,  v122);

      if ((_DWORD)failedToJoinKnownNetworkIDs)
      {
        v127 = v6->_failedToJoinKnownNetworkIDs;
        objc_msgSend_identifier(v93, v123, v124, v125, v126);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v127, v129, (uint64_t)v128, v130, v131);
      }
    }
  }

- (void)__resetRetryIntervalIndex
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v5 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_1864530EC(self->_retrySchedule, v6, v7, v8, v9);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }

  self->_retryScheduleIndex = 0LL;
  if (self->_isRetryScheduled) {
    objc_msgSend___updateRetrySchedule(self, v10, v11, v12, v13);
  }
}

- (void)setKnownNetworks:(id)a3
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  context = (void *)MEMORY[0x186E3AE7C]();
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t knownNetworks = (uint64_t)v5->_knownNetworks;
  v118 = v4;
  if ((id)knownNetworks != v4
    && (!v4 || !knownNetworks || (objc_msgSend_isEqual_(v4, v6, knownNetworks, v7, v8) & 1) == 0))
  {
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v12 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v124 = 0;
      LODWORD(v116) = 2;
      uint64_t v115 = &v124;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_dictionary(MEMORY[0x189603FC8], v13, v14, v15, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v18, v19, v20, v21);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    id v22 = v4;
    char v24 = 0;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v120, (uint64_t)v125, 16);
    if (v28)
    {
      uint64_t v29 = *(void *)v121;
      do
      {
        for (uint64_t i = 0LL; i != v28; ++i)
        {
          if (*(void *)v121 != v29) {
            objc_enumerationMutation(v22);
          }
          v31 = *(void **)(*((void *)&v120 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v5->_knownNetworks, v25, (uint64_t)v31, v26, v27, v115, v116) & 1) == 0)
          {
            knownNetworkAllowCache = v5->_knownNetworkAllowCache;
            objc_msgSend_identifier(v31, v32, v33, v34, v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowCache, v38, 0, (uint64_t)v37, v39);

            knownNetworkAllowErrorCache = v5->_knownNetworkAllowErrorCache;
            objc_msgSend_identifier(v31, v41, v42, v43, v44);
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v46, 0, (uint64_t)v45, v47);

            knownNetworkDeferCache = v5->_knownNetworkDeferCache;
            objc_msgSend_identifier(v31, v49, v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v54, 0, (uint64_t)v53, v55);
          }

          if ((objc_msgSend_isAutoJoinDisabled(v31, v32, v33, v34, v35) & 1) == 0)
          {
            objc_msgSend_SSID(v31, v25, v56, v26, v27);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              knownNetworkSSIDMap = v5->_knownNetworkSSIDMap;
              objc_msgSend_SSID(v31, v58, v59, v60, v61);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(knownNetworkSSIDMap, v64, (uint64_t)v63, v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v67
                || (uint64_t v72 = objc_msgSend_effectiveSupportedSecurityTypes(v67, v68, v69, v70, v71),
                    v72 != objc_msgSend_effectiveSupportedSecurityTypes(v31, v73, v74, v75, v76)))
              {
                char v24 = 1;
              }

              objc_msgSend_SSID(v31, v68, v69, v70, v71);
              uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v17, v78, (uint64_t)v31, (uint64_t)v77, v79);
            }

            if (objc_msgSend_isPasspoint(v31, v58, v59, v60, v61))
            {
              knownNetworkPasspointDomainMap = v5->_knownNetworkPasspointDomainMap;
              objc_msgSend_domainName(v31, v25, v80, v26, v27);
              uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(knownNetworkPasspointDomainMap, v83, (uint64_t)v82, v84, v85);
              uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v86
                || (uint64_t v91 = objc_msgSend_effectiveSupportedSecurityTypes(v86, v87, v88, v89, v90),
                    v91 != objc_msgSend_effectiveSupportedSecurityTypes(v31, v92, v93, v94, v95)))
              {
                char v24 = 1;
              }

              objc_msgSend_domainName(v31, v87, v88, v89, v90);
              uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v119, v97, (uint64_t)v31, (uint64_t)v96, v98);
            }
          }
        }

        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v120, (uint64_t)v125, 16);
      }

      while (v28);
    }

    uint64_t v103 = objc_msgSend_copy(v22, v99, v100, v101, v102);
    v104 = v5->_knownNetworks;
    v5->_uint64_t knownNetworks = (NSSet *)v103;

    objc_msgSend_setDictionary_(v5->_knownNetworkSSIDMap, v105, (uint64_t)v17, v106, v107);
    objc_msgSend_setDictionary_(v5->_knownNetworkPasspointDomainMap, v108, (uint64_t)v119, v109, v110);
    if ((v24 & 1) != 0)
    {
      v5->_didConfigurationChangeSincePreviousAttempt = 1;
      v5->_resetCachedKnownNetworksContext = 1;
      objc_msgSend___resetRetryIntervalIndex(v5, v111, v112, v113, v114);
    }
  }

  objc_sync_exit(v5);

  objc_autoreleasePoolPop(context);
}

- (NSSet)supportedChannels
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = (void *)objc_msgSend_copy(v2->_supportedChannels, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (NSSet *)v7;
}

- (void)setSupportedChannels:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t supportedChannels = (uint64_t)v5->_supportedChannels;
  if ((id)supportedChannels != v4
    && (!v4 || !supportedChannels || (objc_msgSend_isEqual_(v4, v6, supportedChannels, v7, v8) & 1) == 0))
  {
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v12 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = 0;
      int v25 = 2;
      char v24 = &v26;
      _os_log_send_and_compose_impl();
    }

    uint64_t v16 = (uint64_t)v5->_supportedChannels;
    if (v16) {
      char isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v4, v13, v16, v14, v15);
    }
    else {
      char isSubsetOfSet = 0;
    }
    uint64_t v18 = objc_msgSend_copy(v4, v13, v16, v14, v15, v24, v25);
    uint64_t v19 = v5->_supportedChannels;
    v5->_uint64_t supportedChannels = (NSSet *)v18;

    if ((isSubsetOfSet & 1) == 0)
    {
      v5->_didConfigurationChangeSincePreviousAttempt = 1;
      v5->_resetCachedKnownNetworksContext = 1;
      objc_msgSend___resetRetryIntervalIndex(v5, v20, v21, v22, v23);
    }
  }

  objc_sync_exit(v5);
}

- (CLLocation)location
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v7 = (void *)objc_msgSend_copy(v2->_location, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CLLocation *)v7;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t location = (uint64_t)v5->_location;
  if ((id)location != v4 && (!v4 || !location || (objc_msgSend_isEqual_(v4, v6, location, v7, v8) & 1) == 0))
  {
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v12 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = 0;
      int v22 = 2;
      uint64_t v21 = &v23;
      _os_log_send_and_compose_impl();
    }

    if (!v4
      || (id v17 = v5->_location) == 0LL
      || (objc_msgSend_distanceFromLocation_(v17, v13, (uint64_t)v4, v15, v16), v18 > 20.0))
    {
      v5->_resetCachedKnownNetworksContext = 1;
    }

    uint64_t v19 = objc_msgSend_copy(v4, v13, v14, v15, v16, v21, v22);
    uint64_t v20 = v5->_location;
    v5->_uint64_t location = (CLLocation *)v19;
  }

  objc_sync_exit(v5);
}

- (int64_t)retrySchedule
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t retrySchedule = v2->_retrySchedule;
  objc_sync_exit(v2);

  return retrySchedule;
}

- (BOOL)__shouldAlwaysUpdateRetrySchedule:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (void)setRetrySchedule:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_retrySchedule != a3)
  {
    CWFGetOSLog();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      CWFGetOSLog();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v7 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      sub_1864530EC(v4->_retrySchedule, v8, v9, v10, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      sub_1864530EC(a3, v13, v14, v15, v16);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v28 = 138543618;
      id v29 = v12;
      __int16 v30 = 2114;
      v31 = v17;
      int v27 = 22;
      __int16 v26 = &v28;
      _os_log_send_and_compose_impl();
    }

    v4->_int64_t retrySchedule = a3;
    objc_msgSend___setupThrottleIntervals(v4, v18, v19, v20, v21);
    if (!v4->_invalidated
      && (v4->_isRetryScheduled || objc_msgSend___shouldAlwaysUpdateRetrySchedule_(v4, v22, a3, v24, v25)))
    {
      objc_msgSend___updateRetrySchedule(v4, v22, v23, v24, v25, v26, v27);
    }
  }

  objc_sync_exit(v4);
}

- (void)setMaxCompatibilityEnabled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_maxCompatibilityEnabled = a3;
  objc_sync_exit(obj);
}

- (BOOL)maxCompatibilityEnabled
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL maxCompatibilityEnabled = v2->_maxCompatibilityEnabled;
  objc_sync_exit(v2);

  return maxCompatibilityEnabled;
}

- (id)performAutoJoinWithParameters:(id)a3 reply:(id)a4
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinRequest);
  objc_msgSend_UUID(MEMORY[0x189607AB8], v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUUID_(v8, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setParameters_(v8, v17, (uint64_t)v6, v18, v19);
  objc_msgSend_setReply_(v8, v20, (uint64_t)v7, v21, v22);
  uint64_t v23 = self;
  objc_sync_enter(v23);
  if (v23->_invalidated)
  {
    CWFGetOSLog();
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      CWFGetOSLog();
      int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v28 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v29 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_UUID(v8, v30, v31, v32, v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v34, v35, v36, v37, v38);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v39, v40, 5, v41, v42);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v8, v44, v45, v46, v47);
      int v63 = 138543618;
      unint64_t v64 = (unint64_t)v43;
      v66 = __int16 v65 = 2114;
      _os_log_send_and_compose_impl();
    }

    __uint64_t v48 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      CWFGetOSLog();
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v50 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v51 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      int v63 = 134219010;
      unint64_t v64 = v48 / 0x3B9ACA00;
      __int16 v65 = 2048;
      unint64_t v66 = v48 % 0x3B9ACA00 / 0x3E8;
      __int16 v67 = 2082;
      uint64_t v68 = "-[CWFAutoJoinManager performAutoJoinWithParameters:reply:]";
      __int16 v69 = 2082;
      uint64_t v70 = "CWFAutoJoinManager.m";
      __int16 v71 = 1024;
      int v72 = 747;
      _os_log_send_and_compose_impl();
    }

    targetQueue = (dispatch_queue_s *)v23->_targetQueue;
    qos_class_t v53 = qos_class_self();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18649BE84;
    block[3] = &unk_189E5C2C0;
    id v62 = v7;
    dispatch_block_t v54 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v53, 0, block);
    dispatch_async(targetQueue, v54);
  }

  else
  {
    objc_msgSend___addRequest_(v23, v24, (uint64_t)v8, v25, v26);
  }

  objc_sync_exit(v23);

  objc_msgSend_UUID(v8, v55, v56, v57, v58);
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (void)cancelAutoJoinWithUUID:(id)a3 error:(id)a4 reply:(id)a5
{
  uint64_t v170 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v139 = a4;
  id v137 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  obuint64_t j = v9;
  if (v9->_invalidated)
  {
    CWFGetOSLog();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      CWFGetOSLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v27 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_UUIDString(v8, v28, v29, v30, v31);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v32, v33, 5, v34, v35);
      v161 = int v160 = 138543362;
      _os_log_send_and_compose_impl();
    }

    __uint64_t v36 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      CWFGetOSLog();
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v38 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v39 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      int v160 = 134219010;
      unint64_t v161 = v36 / 0x3B9ACA00;
      __int16 v162 = 2048;
      unint64_t v163 = v36 % 0x3B9ACA00 / 0x3E8;
      __int16 v164 = 2082;
      v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
      __int16 v166 = 2082;
      v167 = "CWFAutoJoinManager.m";
      __int16 v168 = 1024;
      int v169 = 771;
      _os_log_send_and_compose_impl();
    }

    targetQueue = (dispatch_queue_s *)v9->_targetQueue;
    qos_class_t v41 = qos_class_self();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18649CF1C;
    block[3] = &unk_189E5C2C0;
    id v158 = v137;
    dispatch_block_t v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v41, 0, block);
    dispatch_async(targetQueue, v42);
  }

  else if (v8)
  {
    objc_msgSend_UUID(v9->_activeRequest, v10, v11, v12, v13);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    char isEqual = objc_msgSend_isEqual_(v8, v17, (uint64_t)v16, v18, v19);

    if ((isEqual & 1) != 0)
    {
      CWFGetOSLog();
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        CWFGetOSLog();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v26 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v85 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        activeRequest = v9->_activeRequest;
        int v160 = 138543362;
        unint64_t v161 = (unint64_t)activeRequest;
        _os_log_send_and_compose_impl();
      }

      v9->_cancelled = 1;
      uint64_t v91 = objc_msgSend_copy(v139, v87, v88, v89, v90);
      underlyingCancelError = v9->_underlyingCancelError;
      v9->_underlyingCancelError = (NSError *)v91;

      internalQueue = (dispatch_queue_s *)v9->_internalQueue;
      qos_class_t v94 = qos_class_self();
      v155[0] = MEMORY[0x1895F87A8];
      v155[1] = 3221225472LL;
      v155[2] = sub_18649D0E4;
      v155[3] = &unk_189E5C4C8;
      v155[4] = v9;
      id v156 = v137;
      dispatch_block_t v95 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v94, 0, v155);
      dispatch_async(internalQueue, v95);
    }

    else
    {
      for (unint64_t i = 0; i < objc_msgSend_count(v9->_pendingRequests, v21, v22, v23, v24); ++i)
      {
        objc_msgSend_objectAtIndexedSubscript_(v9->_pendingRequests, v46, i, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v49, v50, v51, v52, v53);
        dispatch_block_t v54 = (void *)objc_claimAutoreleasedReturnValue();
        char v58 = objc_msgSend_isEqual_(v8, v55, (uint64_t)v54, v56, v57);

        if ((v58 & 1) != 0)
        {
          CWFGetOSLog();
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
          {
            CWFGetOSLog();
            uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v60 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v96 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            int v160 = 138543362;
            unint64_t v161 = (unint64_t)v49;
            _os_log_send_and_compose_impl();
          }

          __uint64_t v97 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (v98)
          {
            CWFGetOSLog();
            uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v99 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v100 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            int v160 = 134219010;
            unint64_t v161 = v97 / 0x3B9ACA00;
            __int16 v162 = 2048;
            unint64_t v163 = v97 % 0x3B9ACA00 / 0x3E8;
            __int16 v164 = 2082;
            v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
            __int16 v166 = 2082;
            v167 = "CWFAutoJoinManager.m";
            __int16 v168 = 1024;
            int v169 = 807;
            _os_log_send_and_compose_impl();
          }

          uint64_t v101 = (dispatch_queue_s *)v9->_targetQueue;
          qos_class_t v102 = qos_class_self();
          v151[0] = MEMORY[0x1895F87A8];
          v151[1] = 3221225472LL;
          v151[2] = sub_18649D478;
          v151[3] = &unk_189E5C2E8;
          id v103 = v49;
          id v152 = v103;
          id v153 = v139;
          id v154 = v137;
          dispatch_block_t v104 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v102, 0, v151);
          dispatch_async(v101, v104);

          objc_msgSend_removeObjectAtIndex_(v9->_pendingRequests, v105, i, v106, v107);
          goto LABEL_17;
        }
      }

      CWFGetOSLog();
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      if (v119)
      {
        CWFGetOSLog();
        __int128 v120 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        __int128 v120 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v121 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_UUIDString(v8, v122, v123, v124, v125);
        uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v126, v127, 5, v128, v129);
        v161 = int v160 = 138543362;
        _os_log_send_and_compose_impl();
      }

      __uint64_t v130 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue();
      if (v131)
      {
        CWFGetOSLog();
        v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v132 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v133 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
      {
        int v160 = 134219010;
        unint64_t v161 = v130 / 0x3B9ACA00;
        __int16 v162 = 2048;
        unint64_t v163 = v130 % 0x3B9ACA00 / 0x3E8;
        __int16 v164 = 2082;
        v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
        __int16 v166 = 2082;
        v167 = "CWFAutoJoinManager.m";
        __int16 v168 = 1024;
        int v169 = 823;
        _os_log_send_and_compose_impl();
      }

      int v134 = (dispatch_queue_s *)v9->_targetQueue;
      qos_class_t v135 = qos_class_self();
      v149[0] = MEMORY[0x1895F87A8];
      v149[1] = 3221225472LL;
      v149[2] = sub_18649D6D0;
      v149[3] = &unk_189E5C2C0;
      id v150 = v137;
      dispatch_block_t v136 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v135, 0, v149);
      dispatch_async(v134, v136);
    }
  }

  else
  {
    CWFGetOSLog();
    id v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      CWFGetOSLog();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v44 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v61 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v160) = 0;
      _os_log_send_and_compose_impl();
    }

    __int128 v147 = 0u;
    __int128 v148 = 0u;
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    v138 = v9->_pendingRequests;
    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v62, (uint64_t)&v145, (uint64_t)v159, 16);
    if (v63)
    {
      unint64_t v64 = (void *)MEMORY[0x1895F8DA0];
      uint64_t v65 = *(void *)v146;
      do
      {
        for (uint64_t j = 0LL; j != v63; ++j)
        {
          if (*(void *)v146 != v65) {
            objc_enumerationMutation(v138);
          }
          unint64_t v67 = *(void *)(*((void *)&v145 + 1) + 8 * j);
          CWFGetOSLog();
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
          {
            CWFGetOSLog();
            __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v70 = v64;
            __int16 v69 = (os_log_s *)v64;
          }

          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            int v160 = 138543362;
            unint64_t v161 = v67;
            _os_log_send_and_compose_impl();
          }

          __uint64_t v71 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          int v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            CWFGetOSLog();
            uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            id v74 = v64;
            uint64_t v73 = (os_log_s *)v64;
          }

          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            int v160 = 134219010;
            unint64_t v161 = v71 / 0x3B9ACA00;
            __int16 v162 = 2048;
            unint64_t v163 = v71 % 0x3B9ACA00 / 0x3E8;
            __int16 v164 = 2082;
            v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
            __int16 v166 = 2082;
            v167 = "CWFAutoJoinManager.m";
            __int16 v168 = 1024;
            int v169 = 838;
            _os_log_send_and_compose_impl();
          }

          uint64_t v75 = (dispatch_queue_s *)obj->_targetQueue;
          qos_class_t v76 = qos_class_self();
          v143[0] = MEMORY[0x1895F87A8];
          v143[1] = 3221225472LL;
          v143[2] = sub_18649D898;
          v143[3] = &unk_189E5BF78;
          v143[4] = v67;
          id v144 = v139;
          dispatch_block_t v77 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v76, 0, v143);
          dispatch_async(v75, v77);
        }

        uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v78, (uint64_t)&v145, (uint64_t)v159, 16);
      }

      while (v63);
    }

    objc_msgSend_removeAllObjects(obj->_pendingRequests, v79, v80, v81, v82);
    if (obj->_activeRequest)
    {
      CWFGetOSLog();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        CWFGetOSLog();
        uint64_t v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v84 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v108 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v109 = (unint64_t)obj->_activeRequest;
        int v160 = 138543362;
        unint64_t v161 = v109;
        _os_log_send_and_compose_impl();
      }

      obj->_cancelled = 1;
      uint64_t v114 = objc_msgSend_copy(v139, v110, v111, v112, v113);
      uint64_t v115 = obj->_underlyingCancelError;
      obj->_underlyingCancelError = (NSError *)v114;
    }

    uint64_t v116 = (dispatch_queue_s *)obj->_internalQueue;
    qos_class_t v117 = qos_class_self();
    v141[0] = MEMORY[0x1895F87A8];
    v141[1] = 3221225472LL;
    v141[2] = sub_18649DAD4;
    v141[3] = &unk_189E5C4C8;
    v141[4] = obj;
    id v142 = v137;
    dispatch_block_t v118 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v117, 0, v141);
    dispatch_async(v116, v118);
  }

- (CWFAutoJoinMetric)metric
{
  id v2 = self;
  objc_sync_enter(v2);
  id v7 = (void *)objc_msgSend_copy(v2->_cachedMetric, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CWFAutoJoinMetric *)v7;
}

- (CWFAutoJoinStatistics)statistics
{
  id v2 = self;
  objc_sync_enter(v2);
  id v7 = (void *)objc_msgSend_copy(v2->_statistics, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CWFAutoJoinStatistics *)v7;
}

- (void)resetStatistics
{
  id v2 = self;
  objc_sync_enter(v2);
  CWFGetOSLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v5 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinStatistics);
  statistics = v2->_statistics;
  v2->_statistics = v6;

  objc_msgSend_date(MEMORY[0x189603F50], v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(v2->_statistics, v13, (uint64_t)v12, v14, v15);

  statisticsSubmissionTimer = (dispatch_source_s *)v2->_statisticsSubmissionTimer;
  if (statisticsSubmissionTimer)
  {
    dispatch_time_t v17 = dispatch_walltime(0LL, 86400000000000LL);
    dispatch_source_set_timer(statisticsSubmissionTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  objc_sync_exit(v2);
}

- (void)__updateStatisticsWithScanChannels:(id)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v14, v7, v8, v9, v10))
        {
          statistics = self->_statistics;
          uint64_t v20 = objc_msgSend_scanChannelCount2GHz(statistics, v15, v16, v17, v18);
          objc_msgSend_setScanChannelCount2GHz_(statistics, v21, v20 + 1, v22, v23);
        }

        else if (objc_msgSend_is5GHz(v14, v15, v16, v17, v18))
        {
          uint64_t v32 = self->_statistics;
          uint64_t v33 = objc_msgSend_scanChannelCount5GHz(v32, v28, v29, v30, v31);
          objc_msgSend_setScanChannelCount5GHz_(v32, v34, v33 + 1, v35, v36);
        }

        else if (objc_msgSend_is6GHz(v14, v28, v29, v30, v31))
        {
          uint64_t v37 = self->_statistics;
          uint64_t v38 = objc_msgSend_scanChannelCount6GHz(v37, v24, v25, v26, v27);
          objc_msgSend_setScanChannelCount6GHz_(v37, v39, v38 + 1, v40, v41);
        }

        dispatch_block_t v42 = self->_statistics;
        uint64_t v43 = objc_msgSend_scanChannelCount(v42, v24, v25, v26, v27);
        objc_msgSend_setScanChannelCount_(v42, v44, v43 + 1, v45, v46);
      }

      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v47, (uint64_t)v51, 16);
    }

    while (v11);
  }
}

- (void)__updateStatisticsWithPreAssocScanChannels:(id)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v14, v7, v8, v9, v10))
        {
          statistics = self->_statistics;
          uint64_t v20 = objc_msgSend_preAssocScanChannelCount2GHz(statistics, v15, v16, v17, v18);
          objc_msgSend_setPreAssocScanChannelCount2GHz_(statistics, v21, v20 + 1, v22, v23);
        }

        else if (objc_msgSend_is5GHz(v14, v15, v16, v17, v18))
        {
          uint64_t v32 = self->_statistics;
          uint64_t v33 = objc_msgSend_preAssocScanChannelCount5GHz(v32, v28, v29, v30, v31);
          objc_msgSend_setPreAssocScanChannelCount5GHz_(v32, v34, v33 + 1, v35, v36);
        }

        else if (objc_msgSend_is6GHz(v14, v28, v29, v30, v31))
        {
          uint64_t v37 = self->_statistics;
          uint64_t v38 = objc_msgSend_preAssocScanChannelCount6GHz(v37, v24, v25, v26, v27);
          objc_msgSend_setPreAssocScanChannelCount6GHz_(v37, v39, v38 + 1, v40, v41);
        }

        dispatch_block_t v42 = self->_statistics;
        uint64_t v43 = objc_msgSend_preAssocScanChannelCount(v42, v24, v25, v26, v27);
        objc_msgSend_setPreAssocScanChannelCount_(v42, v44, v43 + 1, v45, v46);
      }

      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v47, (uint64_t)v51, 16);
    }

    while (v11);
  }
}

- (void)__updateCachedMetricAndStatistics:(id)a3
{
  id v204 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v9 = objc_msgSend_copy(v204, v5, v6, v7, v8);
  cachedMetric = v4->_cachedMetric;
  v4->_cachedMetric = (CWFAutoJoinMetric *)v9;

  if (objc_msgSend_wasAlreadyAssociated(v204, v11, v12, v13, v14))
  {
    statistics = v4->_statistics;
    uint64_t v20 = objc_msgSend_autoJoinAlreadyAssociatedCount(statistics, v15, v16, v17, v18);
    objc_msgSend_setAutoJoinAlreadyAssociatedCount_(statistics, v21, v20 + 1, v22, v23);
  }

  objc_msgSend_autoJoinTriggerCounts(v4->_statistics, v15, v16, v17, v18);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = (void *)MEMORY[0x189607968];
  objc_msgSend_autoJoinParameters(v204, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);
  objc_msgSend_numberWithInteger_(v25, v36, v35, v37, v38);
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v24, v40, (uint64_t)v39, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = objc_msgSend_unsignedIntegerValue(v43, v44, v45, v46, v47);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v49, v48 + 1, v50, v51);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinTriggerCounts(v4->_statistics, v53, v54, v55, v56);
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  char v58 = (void *)MEMORY[0x189607968];
  objc_msgSend_autoJoinParameters(v204, v59, v60, v61, v62);
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v68 = objc_msgSend_trigger(v63, v64, v65, v66, v67);
  objc_msgSend_numberWithInteger_(v58, v69, v68, v70, v71);
  int v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v57, v73, (uint64_t)v52, (uint64_t)v72, v74);

  objc_msgSend_error(v204, v75, v76, v77, v78);
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    uint64_t v84 = v4->_statistics;
    uint64_t v85 = objc_msgSend_autoJoinAbortedCount(v84, v80, v81, v82, v83);
    objc_msgSend_setAutoJoinAbortedCount_(v84, v86, v85 + 1, v87, v88);
  }

  objc_msgSend_scanChannels(v204, v80, v81, v82, v83);
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___updateStatisticsWithScanChannels_(v4, v90, (uint64_t)v89, v91, v92);

  objc_msgSend_preAssociationScanChannels(v204, v93, v94, v95, v96);
  __uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___updateStatisticsWithPreAssocScanChannels_(v4, v98, (uint64_t)v97, v99, v100);

  uint64_t v101 = v4->_statistics;
  objc_msgSend_followup6GHzScanChannels(v204, v102, v103, v104, v105);
  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v111 = objc_msgSend_count(v106, v107, v108, v109, v110);
  uint64_t v116 = objc_msgSend_followup6GHzScanChannelCount(v101, v112, v113, v114, v115);
  objc_msgSend_setFollowup6GHzScanChannelCount_(v101, v117, v116 + v111, v118, v119);

  __int128 v120 = v4->_statistics;
  objc_msgSend_GASQueryNetworks(v204, v121, v122, v123, v124);
  uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v130 = objc_msgSend_count(v125, v126, v127, v128, v129);
  uint64_t v135 = objc_msgSend_GASQueryCount(v120, v131, v132, v133, v134);
  objc_msgSend_setGASQueryCount_(v120, v136, v135 + v130, v137, v138);

  objc_msgSend_network(v204, v139, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  if (v143)
  {
    __int128 v148 = v4->_statistics;
    uint64_t CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(v148, v144, v145, v146, v147);
    objc_msgSend_setAutoJoinDidFindCandidateCount_(v148, v150, CandidateCount + 1, v151, v152);
    if (objc_msgSend_result(v204, v153, v154, v155, v156))
    {
      v157 = v4->_statistics;
      uint64_t v158 = objc_msgSend_autoJoinDidJoinCount(v157, v144, v145, v146, v147);
      objc_msgSend_setAutoJoinDidJoinCount_(v157, v159, v158 + 1, v160, v161);
    }
  }

  if (objc_msgSend_autoHotspotWasAttempted(v204, v144, v145, v146, v147))
  {
    __int16 v166 = v4->_statistics;
    uint64_t v167 = objc_msgSend_autoHotspotCount(v166, v162, v163, v164, v165);
    objc_msgSend_setAutoHotspotCount_(v166, v168, v167 + 1, v169, v170);
    objc_msgSend_hotspot(v204, v171, v172, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    if (v175)
    {
      v180 = v4->_statistics;
      uint64_t v181 = objc_msgSend_autoHotspotDidFindCandidateCount(v180, v176, v177, v178, v179);
      objc_msgSend_setAutoHotspotDidFindCandidateCount_(v180, v182, v181 + 1, v183, v184);
      if (objc_msgSend_autoHotspotResult(v204, v185, v186, v187, v188))
      {
        v189 = v4->_statistics;
        uint64_t v190 = objc_msgSend_autoHotspotDidJoinCount(v189, v176, v177, v178, v179);
        objc_msgSend_setAutoHotspotDidJoinCount_(v189, v191, v190 + 1, v192, v193);
      }
    }

    objc_msgSend_autoHotspotError(v204, v176, v177, v178, v179);
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    if (v194)
    {
      v199 = v4->_statistics;
      uint64_t v200 = objc_msgSend_autoHotspotAbortedCount(v199, v195, v196, v197, v198);
      objc_msgSend_setAutoHotspotAbortedCount_(v199, v201, v200 + 1, v202, v203);
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)__shouldAllowAutoHotspotForTrigger:(int64_t)a3
{
  return a3 == 61;
}

- (BOOL)__shouldIgnoreRequestWithTrigger:(int64_t)a3
{
  if (a3 != 32)
  {
    if (a3 == 58 || a3 == 34)
    {
      objc_msgSend_associatedNetwork(self, a2, a3, v3, v4);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        CWFGetOSLog();
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          CWFGetOSLog();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v11 = MEMORY[0x1895F8DA0];
        }

        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        sub_18645304C(a3, v12, v13, v14, v15);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        _os_log_send_and_compose_impl();

LABEL_14:
        LOBYTE(activeRequest) = 1;
        return (char)activeRequest;
      }
    }

    goto LABEL_9;
  }

  activeRequest = self->_activeRequest;
  if (!activeRequest) {
    return (char)activeRequest;
  }
  if (!self->_cancelled)
  {
    objc_msgSend_parameters(activeRequest, a2, 32, v3, v4);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_trigger(v17, v18, v19, v20, v21) == 32)
    {
    }

    else
    {
      objc_msgSend_parameters(self->_activeRequest, v22, v23, v24, v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = objc_msgSend_trigger(v26, v27, v28, v29, v30);

      if (v31 != 47) {
        goto LABEL_9;
      }
    }

    CWFGetOSLog();
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      CWFGetOSLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v33 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    sub_18645304C(0x20uLL, v34, v35, v36, v37);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

- (BOOL)__shouldResetRetryIntervalIndexForTrigger:(int64_t)a3
{
  return ((unint64_t)a3 < 0x3C) & (0x90000032010018CuLL >> a3);
}

- (BOOL)__shouldInvokeImmediatelyForTrigger:(int64_t)a3
{
  BOOL result = 0;
  if ((unint64_t)a3 <= 0x3D)
  {
    if (((1LL << a3) & 0x1000800300100000LL) != 0)
    {
      return 1;
    }

    else if (a3 == 61)
    {
      id v5 = self;
      objc_sync_enter(v5);
      unint64_t retryScheduleIndex = v5->_retryScheduleIndex;
      objc_sync_exit(v5);

      return retryScheduleIndex != 0;
    }
  }

  return result;
}

- (BOOL)__shouldPrioritizeRetryOverNewRequest:(int64_t)a3
{
  return a3 == 32 || a3 == 47;
}

- (void)__removeRedundantRequests:(id)a3
{
  uint64_t v194 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_array(MEMORY[0x189603FA8], v5, v6, v7, v8);
  __int16 v166 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v173 = v4;
  if (objc_msgSend_count(self->_pendingRequests, v9, v10, v11, v12))
  {
    uint64_t v16 = 0LL;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_pendingRequests, v13, v16, v14, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v17, v18, v19, v20, v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = objc_msgSend_mode(v22, v23, v24, v25, v26);
      objc_msgSend_parameters(v4, v28, v29, v30, v31);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 == objc_msgSend_mode(v32, v33, v34, v35, v36)) {
        break;
      }

LABEL_24:
    }

    objc_msgSend_parameters(v17, v37, v38, v39, v40);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v41, v42, v43, v44, v45);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(obj, v46, v47, v48, v49);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v4, v51, v52, v53, v54);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v175, v55, v56, v57, v58);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v59, v60, v61, v62, v63);
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == v68)
    {
      uint64_t v174 = v41;
    }

    else
    {
      objc_msgSend_parameters(v17, v64, v65, v66, v67);
      uint64_t v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v172, v69, v70, v71, v72);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v171, v73, v74, v75, v76);
      uint64_t v170 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v170)
      {
        uint64_t v170 = 0LL;
        int v117 = 0;
LABEL_20:

LABEL_21:
        if (v117) {
          objc_msgSend_addObject_(v166, v128, (uint64_t)v17, v129, v130);
        }
        id v4 = v173;
        goto LABEL_24;
      }

      uint64_t v174 = v41;
      objc_msgSend_parameters(v173, v77, v78, v79, v80);
      uint64_t v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v169, v81, v82, v83, v84);
      __int16 v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v168, v85, v86, v87, v88);
      uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v167)
      {
        uint64_t v167 = 0LL;
        int v117 = 0;
        goto LABEL_19;
      }

      objc_msgSend_parameters(v17, v89, v90, v91, v92);
      uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v165, v93, v94, v95, v96);
      uint64_t v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v164, v97, v98, v99, v100);
      uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v173, v102, v103, v104, v105);
      __int16 v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v162, v106, v107, v108, v109);
      uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v161, v110, v111, v112, v113);
      uint64_t v163 = v101;
      uint64_t v160 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v101, v114, (uint64_t)v160, v115, v116))
      {
        int v117 = 0;
LABEL_16:

LABEL_19:
        goto LABEL_20;
      }
    }

    objc_msgSend_parameters(v17, v64, v65, v66, v67);
    uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v123 = objc_msgSend_trigger(v118, v119, v120, v121, v122);
    if (v123 - 44 < 8 || v123 <= 0x3F && ((1LL << v123) & 0xC000000000000010LL) != 0)
    {

      int v117 = 0;
    }

    else
    {
      int v117 = objc_msgSend_allowAutoHotspotFallback(v17, v124, v125, v126, v127) ^ 1;
    }

    uint64_t v41 = v174;
    if (v50 == v68) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }

- (void)__invalidateAllowedKnownNetworksCacheForTrigger:(int64_t)a3
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if ((unint64_t)a3 <= 0x28 && ((1LL << a3) & 0x101A03A0100LL) != 0)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    objc_msgSend_allObjects(self->_knownNetworks, a2, a3, v3, v4);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v54)
    {
      uint64_t v53 = *(void *)v56;
      do
      {
        for (uint64_t i = 0LL; i != v54; ++i)
        {
          if (*(void *)v56 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          objc_msgSend_identifier(v15, v10, v11, v12, v13);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14
              && objc_msgSend_isEAP(v15, v10, v11, v12, v13)
              && (objc_msgSend_isSystemMode(v15, v10, v11, v12, v13) & 1) == 0)
            {
              goto LABEL_19;
            }

            int v17 = 0;
            if (((1LL << a3) & 0x101A00A0100LL) != 0)
            {
              knownNetworkAllowCache = self->_knownNetworkAllowCache;
              objc_msgSend_identifier(v15, v10, v11, v12, v13);
              id v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowCache, v19, (uint64_t)v5, v20, v21);
              uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
              if (v6)
              {
                uint64_t v22 = self->_knownNetworkAllowCache;
                objc_msgSend_identifier(v15, v10, v11, v12, v13);
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)v23, v25, v26);
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                int v17 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31) ^ 1;
              }

              else
              {
                int v17 = 0;
              }
            }

            if (((1LL << a3) & 0x101A00A0100LL) != 0)
            {
            }

            if (v17)
            {
LABEL_19:
              uint64_t v32 = self->_knownNetworkAllowCache;
              objc_msgSend_identifier(v15, v10, v11, v12, v13);
              id v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v32, v34, 0, (uint64_t)v33, v35);

              knownNetworkAllowErrorCache = self->_knownNetworkAllowErrorCache;
              objc_msgSend_identifier(v15, v37, v38, v39, v40);
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v42, 0, (uint64_t)v41, v43);

              knownNetworkDeferCache = self->_knownNetworkDeferCache;
              objc_msgSend_identifier(v15, v45, v46, v47, v48);
              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v50, 0, (uint64_t)v49, v51);
            }
          }
        }

        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v55, (uint64_t)v59, 16);
      }

      while (v54);
    }
  }

- (unsigned)__qosForAutoJoinTrigger:(int64_t)a3
{
  if (((1LL << a3) & 0xC00FF00000000010LL) != 0) {
    return 21;
  }
  if (((1LL << a3) & 0xC0010020010104LL) != 0) {
    return 33;
  }
  else {
    return 25;
  }
}

- (void)__addRequest:(id)a3
{
  uint64_t v424 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CWFGetOSLog();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CWFGetOSLog();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v7 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v415 = 138543362;
    *(void *)v416 = v4;
    int v374 = 12;
    v372 = &v415;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_parameters(v4, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v17 = objc_msgSend_trigger(v12, v13, v14, v15, v16);

  uint64_t v18 = (void *)MEMORY[0x189607968];
  __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  objc_msgSend_numberWithUnsignedLongLong_(v18, v20, v19, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  triggerTimestampMap = self->_triggerTimestampMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v25, v17, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(triggerTimestampMap, v29, (uint64_t)v23, (uint64_t)v28, v30);

  uint64_t v31 = v17;
  if (v17 - 44 >= 8 && (v17 > 0x3F || ((1LL << v17) & 0xC000000000000010LL) == 0)) {
    self->_previousNonRetryTrigger = v17;
  }
  uint64_t v39 = v4;
  if (v17 - 44 >= 8 && (v17 > 0x3F || ((1LL << v17) & 0xC000000000000010LL) == 0))
  {
    uint64_t shouldAllowAutoHotspotForTrigger = objc_msgSend___shouldAllowAutoHotspotForTrigger_(self, v35, v17, v37, v38);
    objc_msgSend_setAllowAutoHotspotFallback_(v4, v41, shouldAllowAutoHotspotForTrigger, v42, v43);
  }

  objc_msgSend___invalidateAllowedKnownNetworksCacheForTrigger_(self, v35, v17, v37, v38);
  activeRequest = self->_activeRequest;
  v377 = self;
  unint64_t v378 = v17;
  v396 = v4;
  if (!activeRequest || self->_cancelled)
  {
    int v376 = 0;
    goto LABEL_39;
  }

  objc_msgSend_parameters(activeRequest, v44, v45, v46, v47);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v49, v50, v51, v52, v53) == v17)
  {
    objc_msgSend_parameters(self->_activeRequest, v54, v55, v56, v57);
    __int128 v58 = v4;
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = objc_msgSend_mode(v59, v60, v61, v62, v63);
    objc_msgSend_parameters(v4, v65, v66, v67, v68);
    __int16 v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64 != objc_msgSend_mode(v69, v70, v71, v72, v73))
    {
      int v376 = 0;
LABEL_37:

      uint64_t v31 = v378;
      uint64_t v39 = v4;
      goto LABEL_38;
    }

    objc_msgSend_parameters(self->_activeRequest, v74, v75, v76, v77);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v78, v79, v80, v81, v82);
    uint64_t v83 = self;
    uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v84, v85, v86, v87, v88);
    uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v58, v90, v91, v92, v93);
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v94, v95, v96, v97, v98);
    uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v99, v100, v101, v102, v103);
    uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89 != v108)
    {
      objc_msgSend_parameters(v83->_activeRequest, v104, v105, v106, v107);
      uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v109, v110, v111, v112, v113);
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v118 = objc_msgSend_identifier(v403, v114, v115, v116, v117);
      if (!v118)
      {
        int v376 = 0;
LABEL_35:

LABEL_36:
        self = v377;
        id v4 = v396;
        goto LABEL_37;
      }

      v399 = (void *)v118;
      v401 = v109;
      objc_msgSend_parameters(v396, v119, v120, v121, v122);
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v397, v123, v124, v125, v126);
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v131 = objc_msgSend_identifier(v395, v127, v128, v129, v130);
      if (!v131)
      {
        int v376 = 0;
LABEL_34:

        uint64_t v109 = v401;
        goto LABEL_35;
      }

      v394 = (void *)v131;
      objc_msgSend_parameters(v377->_activeRequest, v132, v133, v134, v135);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v392, v136, v137, v138, v139);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v390, v140, v141, v142, v143);
      id v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v396, v145, v146, v147, v148);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v388, v149, v150, v151, v152);
      v387 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v387, v153, v154, v155, v156);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v144, v157, (uint64_t)v386, v158, v159))
      {
        int v376 = 0;
LABEL_33:

        goto LABEL_34;
      }

      v385 = v144;
    }

    int v160 = objc_msgSend_allowAutoHotspotFallback(v377->_activeRequest, v104, v105, v106, v107);
    int v376 = v160 ^ objc_msgSend_allowAutoHotspotFallback(v396, v161, v162, v163, v164) ^ 1;
    id v144 = v385;
    if (v89 == v108) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }

  int v376 = 0;
LABEL_38:

LABEL_39:
  __int128 v413 = 0u;
  __int128 v414 = 0u;
  __int128 v411 = 0u;
  __int128 v412 = 0u;
  uint64_t v165 = self->_pendingRequests;
  uint64_t v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v166, (uint64_t)&v411, (uint64_t)v423, 16);
  if (v167)
  {
    uint64_t v172 = v167;
    uint64_t v173 = *(void *)v412;
    uint64_t v389 = *(void *)v412;
    v391 = v165;
LABEL_41:
    uint64_t v174 = 0LL;
    uint64_t v404 = v172;
    while (1)
    {
      if (*(void *)v412 != v173) {
        objc_enumerationMutation(v165);
      }
      v175 = *(void **)(*((void *)&v411 + 1) + 8 * v174);
      objc_msgSend_parameters(v175, v168, v169, v170, v171);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_trigger(v176, v177, v178, v179, v180) != v31) {
        goto LABEL_52;
      }
      objc_msgSend_parameters(v175, v181, v182, v183, v184);
      __int16 v185 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v190 = objc_msgSend_mode(v185, v186, v187, v188, v189);
      objc_msgSend_parameters(v39, v191, v192, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      if (v190 != objc_msgSend_mode(v195, v196, v197, v198, v199))
      {

        uint64_t v172 = v404;
LABEL_52:

        goto LABEL_63;
      }

      objc_msgSend_parameters(v175, v200, v201, v202, v203);
      id v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v204, v205, v206, v207, v208);
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v402, v209, v210, v211, v212);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v39, v214, v215, v216, v217);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v400, v218, v219, v220, v221);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v398, v222, v223, v224, v225);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      if (v213 == v230)
      {
        v231 = v392;
      }

      else
      {
        objc_msgSend_parameters(v175, v226, v227, v228, v229);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v231, v232, v233, v234, v235);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v395, v236, v237, v238, v239);
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v394)
        {
          char v285 = 0;
          v394 = 0LL;
          goto LABEL_61;
        }

        objc_msgSend_parameters(v396, v240, v241, v242, v243);
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v387, v244, v245, v246, v247);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v386, v248, v249, v250, v251);
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v385)
        {
          v385 = 0LL;
          char v285 = 0;
          uint64_t v31 = v378;
          goto LABEL_60;
        }

        v393 = v204;
        objc_msgSend_parameters(v175, v252, v253, v254, v255);
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v384, v256, v257, v258, v259);
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v383, v260, v261, v262, v263);
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parameters(v396, v265, v266, v267, v268);
        v381 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v381, v269, v270, v271, v272);
        v380 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v380, v273, v274, v275, v276);
        v382 = v264;
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v264, v277, (uint64_t)v379, v278, v279))
        {
          char v285 = 0;
          uint64_t v31 = v378;
          id v204 = v393;
LABEL_59:

LABEL_60:
LABEL_61:

          goto LABEL_62;
        }

        uint64_t v31 = v378;
        id v204 = v393;
      }

      char v280 = objc_msgSend_allowAutoHotspotFallback(v175, v226, v227, v228, v229);
      char v285 = v280 ^ objc_msgSend_allowAutoHotspotFallback(v396, v281, v282, v283, v284) ^ 1;
      if (v213 != v230) {
        goto LABEL_59;
      }
LABEL_62:
      v392 = v231;

      uint64_t v39 = v396;
      uint64_t v173 = v389;
      uint64_t v165 = v391;
      uint64_t v172 = v404;
      if ((v285 & 1) != 0)
      {
        v286 = v396;

        v287 = v377;
LABEL_72:
        __uint64_t v303 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        if (v304)
        {
          CWFGetOSLog();
          v305 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v305 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v308 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v305, OS_LOG_TYPE_DEBUG))
        {
          int v415 = 134219010;
          *(void *)v416 = v303 / 0x3B9ACA00;
          *(_WORD *)&v416[8] = 2048;
          *(void *)v417 = v303 % 0x3B9ACA00 / 0x3E8;
          *(_WORD *)&v417[8] = 2082;
          v418 = "-[CWFAutoJoinManager __addRequest:]";
          __int16 v419 = 2082;
          v420 = "CWFAutoJoinManager.m";
          __int16 v421 = 1024;
          int v422 = 1330;
          LODWORD(v375) = 48;
          v373 = &v415;
          _os_log_send_and_compose_impl();
        }

        targetQueue = (dispatch_queue_s *)v287->_targetQueue;
        qos_class_t v310 = qos_class_self();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = sub_1864A0394;
        block[3] = &unk_189E5BC10;
        id v410 = v286;
        dispatch_block_t v311 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v310, 0, block);
        dispatch_async(targetQueue, v311);

        v312 = v410;
LABEL_89:

        goto LABEL_90;
      }

- (BOOL)__nextRequest
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  if (self->_isNextRequestScheduled)
  {
    CWFGetOSLog();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      CWFGetOSLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v8 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v95) = 0;
      int v92 = 2;
      uint64_t v90 = &v95;
      _os_log_send_and_compose_impl();
    }

    self->_isNextRequestScheduled = 0;
    dispatch_source_set_timer( (dispatch_source_t)self->_nextRequestTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
  }

  p_activeRequest = &self->_activeRequest;
  if (self->_activeRequest) {
    goto LABEL_9;
  }
  uint64_t v10 = objc_msgSend_count(self->_pendingRequests, a2, v2, v3, v4);
  if (!v10) {
    return v10;
  }
  uint64_t v19 = 0LL;
  if (objc_msgSend_count(self->_pendingRequests, v11, v12, v13, v14))
  {
    unint64_t v20 = 0LL;
    uint64_t v21 = (void *)MEMORY[0x1895F8DA0];
    do
    {
      if (*p_activeRequest) {
        goto LABEL_28;
      }
      objc_msgSend_objectAtIndexedSubscript_(self->_pendingRequests, v15, v20, v17, v18);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v22, v23, v24, v25, v26);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = objc_msgSend_trigger(v27, v28, v29, v30, v31);
      if (objc_msgSend___shouldThrottleAutoJoinTrigger_(self, v33, v32, v34, v35))
      {
        objc_msgSend_parameters(v22, v36, v37, v38, v39);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v40, v41, v42, v43, v44);
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          if ((objc_msgSend_throttled(v22, v46, v47, v48, v49) & 1) == 0)
          {
            CWFGetOSLog();
            uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              CWFGetOSLog();
              uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v56 = v21;
              uint64_t v51 = (os_log_s *)v21;
            }

            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              int v95 = 138543362;
              *(void *)uint64_t v96 = v22;
              int v92 = 12;
              uint64_t v90 = &v95;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_setThrottled_(v22, v57, 1, v58, v59);
          }

          goto LABEL_21;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_activeRequest, v22);
      uint64_t v19 = v20;
LABEL_21:

      ++v20;
    }

    while (v20 < objc_msgSend_count(self->_pendingRequests, v52, v53, v54, v55));
  }

  if (!*p_activeRequest)
  {
    objc_msgSend___updateNextRequestTimer(self, v15, v16, v17, v18);
LABEL_9:
    LOBYTE(v10) = 0;
    return v10;
  }

- (void)__updateAutoJoinState:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (self->_state != a3)
  {
    self->_state = a3;
    uint64_t v4 = self;
    objc_sync_enter(v4);
    objc_msgSend_UUID(v4->_activeRequest, v5, v6, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v4->_activeRequest, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

    __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v18 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 134219010;
      unint64_t v29 = v15 / 0x3B9ACA00;
      __int16 v30 = 2048;
      unint64_t v31 = v15 % 0x3B9ACA00 / 0x3E8;
      __int16 v32 = 2082;
      uint64_t v33 = "-[CWFAutoJoinManager __updateAutoJoinState:]";
      __int16 v34 = 2082;
      uint64_t v35 = "CWFAutoJoinManager.m";
      __int16 v36 = 1024;
      int v37 = 1485;
      _os_log_send_and_compose_impl();
    }

    targetQueue = (dispatch_queue_s *)v4->_targetQueue;
    qos_class_t v20 = qos_class_self();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864A0F34;
    block[3] = &unk_189E5C970;
    void block[4] = v4;
    id v25 = v9;
    id v26 = v14;
    int64_t v27 = a3;
    id v21 = v9;
    id v22 = v14;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
    dispatch_async(targetQueue, v23);
  }

- (BOOL)__isAnyKnownNetworkNearby
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v3 = self->_cumulativeScanResults;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v26, (uint64_t)v30, 16);
  BOOL v10 = v5 != 0;
  if (!v5)
  {
LABEL_15:

    return v10;
  }

  uint64_t v11 = v5;
  char v12 = 0;
  uint64_t v13 = *(void *)v27;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v3);
      }
      __uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      objc_msgSend_knownNetworks(self, v6, v7, v8, v9);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v16, v17, v18, v19, v20);
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1864528AC(v15, v21);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 |= v22 != 0LL;
    }

    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v26, (uint64_t)v30, 16);
  }

  while (v11);

  if ((v12 & 1) != 0)
  {
    CWFGetOSLog();
    dispatch_block_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      CWFGetOSLog();
      uint64_t v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v3 = (NSMutableSet *)MEMORY[0x1895F8DA0];
      id v24 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    goto LABEL_15;
  }

  return 0;
}

- (id)__descriptionForError:(id)a3
{
  id v3 = a3;
  objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *MEMORY[0x1896075E0];
  objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x1896075E0], v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v3, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x189607798], v20, v21);
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v22, v23, v24, v25, v26);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, v9, v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  __int16 v36 = v22;
  int v37 = v31;
  if (v22 || (__int16 v36 = v3, v37 = v13, v3))
  {
    uint64_t v38 = (void *)NSString;
    uint64_t v39 = objc_msgSend_code(v36, v32, v33, v34, v35);
    objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)@"%ld '%@'", v41, v42, v39, v37);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v43 = 0LL;
  }

  return v43;
}

- (void)__performAutoJoin
{
  v1439[1] = *MEMORY[0x1895F89C0];
  uint64_t v1411 = 0LL;
  v1412 = &v1411;
  uint64_t v1413 = 0x2020000000LL;
  char v1414 = 1;
  unint64_t beginTimestamp = self->_beginTimestamp;
  self->_unint64_t beginTimestamp = 0LL;
  objc_msgSend_associatedNetwork(self, a2, v2, v3, v4);
  v1365 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = self;
  objc_sync_enter(v6);
  obuint64_t j = v6;
  objc_msgSend_parameters(v6->_activeRequest, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v1369 = (void *)objc_msgSend_copy(v11, v12, v13, v14, v15);

  objc_msgSend_UUID(obj->_activeRequest, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v1336 = (void *)objc_msgSend_copy(v20, v21, v22, v23, v24);

  uint64_t retrySchedule = obj->_retrySchedule;
  unint64_t retryScheduleIndex = obj->_retryScheduleIndex;
  int v1333 = objc_msgSend_allowAutoHotspotFallback(obj->_activeRequest, v27, v28, v29, v30);
  objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v31, (uint64_t)&unk_189E888E0, v32, v33);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v1339 = objc_msgSend_unsignedLongValue(v34, v35, v36, v37, v38);

  triggerTimestampMap = obj->_triggerTimestampMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v40, obj->_previousNonRetryTrigger, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(triggerTimestampMap, v44, (uint64_t)v43, v45, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v1337 = objc_msgSend_unsignedLongValue(v47, v48, v49, v50, v51);

  uint64_t previousNonRetryTrigger = obj->_previousNonRetryTrigger;
  uint64_t v52 = obj->_triggerTimestampMap;
  uint64_t v53 = (void *)MEMORY[0x189607968];
  uint64_t v58 = objc_msgSend_trigger(v1369, v54, v55, v56, v57);
  uint64_t v62 = objc_msgSend_numberWithInteger_(v53, v59, v58, v60, v61);
  objc_msgSend_objectForKeyedSubscript_(v52, v63, v62, v64, v65);
  id v66 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1343 = objc_msgSend_unsignedLongValue(v66, v67, v68, v69, v70);

  unint64_t linkChangeTimestamp = obj->_linkChangeTimestamp;
  v1335 = (void *)objc_msgSend_copy(obj->_steerFromNetwork, v71, v72, v73, v74);
  BOOL didConfigurationChangeSincePreviousAttempt = obj->_didConfigurationChangeSincePreviousAttempt;
  obj->_BOOL didConfigurationChangeSincePreviousAttempt = 0;
  LOBYTE(v62) = !obj->_resetCachedKnownNetworksContext;
  obj->_resetCachedKnownNetworksContext = 0;
  objc_sync_exit(obj);

  if ((v62 & 1) == 0) {
    objc_msgSend_removeAllObjects(obj->_cachedKnownNetworksContexts, v76, v77, v78, v79);
  }
  uint64_t v80 = objc_msgSend_trigger(v1369, v76, v77, v78, v79);
  id v1410 = 0LL;
  char v83 = objc_msgSend___allowAutoJoinWithTrigger_error_(obj, v81, v80, (uint64_t)&v1410, v82);
  id v1366 = v1410;
  if ((v83 & 1) == 0)
  {
    __uint64_t v1334 = 0LL;
    v1360 = 0LL;
    v1361 = 0LL;
    v1345 = 0LL;
    v1346 = 0LL;
    v1355 = 0LL;
    v1356 = 0LL;
    id v1350 = 0LL;
    v1351 = 0LL;
    v1373 = 0LL;
    v1354 = 0LL;
    v1357 = 0LL;
    id v1349 = 0LL;
    id v1364 = 0LL;
    id v1341 = 0LL;
    v1342 = 0LL;
LABEL_363:
    unsigned int v1368 = 0;
    goto LABEL_255;
  }

  dispatch_block_t v88 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinMetric);
  metric = obj->_metric;
  obj->_metric = v88;

  obj->_state = 0LL;
  if (!v1365 && objc_msgSend_count(obj->_failedToJoinKnownNetworkIDs, v90, v91, v92, v93))
  {
    CWFGetOSLog();
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      CWFGetOSLog();
      id v95 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v95 = (id)MEMORY[0x1895F8DA0];
      id v96 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v1417) = 0;
      LODWORD(v1329) = 2;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeAllObjects(obj->_failedToJoinKnownNetworkIDs, v97, v98, v99, v100);
  }

  objc_msgSend_removeAllObjects(obj->_deferredColocatedJoinCandidateMap, v90, v91, v92, v93, v1326, v1329);
  objc_msgSend_removeAllObjects(obj->_hiddenNetworkChannels, v101, v102, v103, v104);
  objc_msgSend_removeAllObjects(obj->_deferredKnownNetworks, v105, v106, v107, v108);
  obj->_didDiscoverBSS = 0;
  objc_msgSend_removeAllObjects(obj->_followup6GHzRNRMap, v109, v110, v111, v112);
  objc_msgSend_removeAllObjects(obj->_followup6GHzFILSDMap, v113, v114, v115, v116);
  objc_msgSend_removeAllObjects(obj->_followup6GHzScanResultsMap, v117, v118, v119, v120);
  objc_msgSend_removeAllObjects(obj->_cumulativeScanResults, v121, v122, v123, v124);
  objc_msgSend_removeAllObjects(obj->_updatedAllowCacheKnownNetworks, v125, v126, v127, v128);
  v1367 = obj;
  objc_sync_enter(v1367);
  CWFGetOSLog();
  uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    CWFGetOSLog();
    id v130 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v130 = (id)MEMORY[0x1895F8DA0];
    id v131 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled((os_log_t)v130, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t activeRequest = (unint64_t)obj->_activeRequest;
    int v1417 = 138543362;
    unint64_t v1418 = activeRequest;
    LODWORD(v1330) = 12;
    v1327 = &v1417;
    _os_log_send_and_compose_impl();
  }

  objc_sync_exit(v1367);
  objc_msgSend_setAutoJoinParameters_(obj->_metric, v133, (uint64_t)v1369, v134, v135);
  objc_msgSend_setRetrySchedule_(obj->_metric, v136, retrySchedule, v137, v138);
  objc_msgSend_setRetryScheduleIndex_(obj->_metric, v139, retryScheduleIndex, v140, v141);
  objc_msgSend_setWasAlreadyAssociated_(obj->_metric, v142, v1365 != 0, v143, v144, v1327, v1330);
  objc_msgSend_setAssociatedNetwork_(obj->_metric, v145, (uint64_t)v1365, v146, v147);
  self->_unint64_t beginTimestamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  __uint64_t v1334 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v1370 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinContext);
  objc_msgSend_setAutoJoinParameters_(v1370, v148, (uint64_t)v1369, v149, v150);
  BOOL v155 = objc_msgSend_mode(v1369, v151, v152, v153, v154) == 3;
  objc_msgSend_setCacheOnly_(v1370, v156, v155, v157, v158);
  if (objc_msgSend_mode(v1369, v159, v160, v161, v162) == 3) {
    objc_msgSend_setMaxScanSSIDCount_(v1370, v163, -1, v164, v165);
  }
  else {
    objc_msgSend_setMaxScanSSIDCount_(v1370, v163, 9, v164, v165);
  }
  if (v1365) {
    objc_msgSend_setMinRSSI_(v1370, v166, -70, v167, v168);
  }
  else {
    objc_msgSend_setMinRSSI_(v1370, v166, -80, v167, v168);
  }
  objc_msgSend_setMaxBSSChannelAge_(v1370, v169, 2592000, v170, v171);
  objc_msgSend_setMinBSSLocationAccuracy_(v1370, v172, v173, v174, v175, 100.0);
  objc_msgSend_setMaxBSSLocationDistance_(v1370, v176, v177, v178, v179, 300.0);
  objc_msgSend_setMaxBSSChannelCount_(v1370, v180, 3, v181, v182);
  objc_msgSend_autoJoinParameters(v1370, v183, v184, v185, v186);
  uint64_t v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v187, v188, v189, v190, v191) == 54)
  {

LABEL_27:
    objc_msgSend_setMaxScanChannelCount_(v1370, v196, 1, v197, v198);
LABEL_28:
    objc_msgSend_setMaxScanCacheAge_(v1370, v213, 0, v214, v215);
    goto LABEL_29;
  }

  objc_msgSend_autoJoinParameters(v1370, v192, v193, v194, v195);
  uint64_t v199 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v204 = objc_msgSend_trigger(v199, v200, v201, v202, v203) == 55;

  if (v204) {
    goto LABEL_27;
  }
  objc_msgSend_autoJoinParameters(v1370, v196, v205, v197, v198);
  uint64_t v206 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v211 = objc_msgSend_trigger(v206, v207, v208, v209, v210) == 45;

  if (v211) {
    goto LABEL_27;
  }
  objc_msgSend_autoJoinParameters(v1370, v196, v212, v197, v198);
  __uint64_t v314 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v319 = objc_msgSend_trigger(v314, v315, v316, v317, v318) == 58;

  if (v319)
  {
    objc_msgSend_setMaxScanChannelCount_(v1370, v320, 3, v322, v323);
    goto LABEL_28;
  }

  if (objc_msgSend_mode(v1369, v320, v321, v322, v323) == 1) {
    objc_msgSend_setMaxScanChannelCount_(v1370, v1283, 3, v1284, v1285);
  }
  else {
    objc_msgSend_setMaxScanChannelCount_(v1370, v1283, -1, v1284, v1285);
  }
  unint64_t v1290 = objc_msgSend_trigger(v1369, v1286, v1287, v1288, v1289);
  unsigned int v1291 = (v1290 < 0x40) & (0xC00FF00000000010LL >> v1290);
  if (v1365) {
    BOOL v1292 = 0;
  }
  else {
    BOOL v1292 = !didConfigurationChangeSincePreviousAttempt;
  }
  if (!v1292) {
    unsigned int v1291 = 1;
  }
  if (v1291) {
    goto LABEL_28;
  }
  objc_msgSend_setMaxScanCacheAge_(v1370, v213, 20000, v214, v215);
LABEL_29:
  objc_msgSend_setMaxANQPCacheAge_(v1370, v216, 3600000, v217, v218);
  objc_msgSend_setMaxScanCycles_(v1370, v219, 1, v220, v221);
  objc_msgSend_setDwellTime_(v1370, v222, 0, v223, v224);
  if (didConfigurationChangeSincePreviousAttempt)
  {
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v225, 1, v227, v228);
  }

  else
  {
    BOOL v233 = objc_msgSend_mode(v1369, v225, v226, v227, v228) == 1;
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v234, v233, v235, v236);
  }

  if (objc_msgSend_trigger(v1369, v229, v230, v231, v232) == 2
    || objc_msgSend_trigger(v1369, v237, v238, v239, v240) == 7
    || objc_msgSend_trigger(v1369, v237, v241, v239, v240) == 59
    || objc_msgSend_trigger(v1369, v237, v242, v239, v240) == 60)
  {
    objc_msgSend_setMaxScanChannelCount_(v1370, v237, 2, v239, v240);
  }

  unint64_t v244 = objc_msgSend_trigger(v1369, v237, v243, v239, v240);
  if (v244 - 44 < 8 || v244 <= 0x3F && ((1LL << v244) & 0xC000000000000010LL) != 0)
  {
    objc_msgSend___retryInterval(v1367, v245, v246, v247, v248);
    uint64_t v249 = (void *)objc_claimAutoreleasedReturnValue();
    v1360 = v249;
    if (v249)
    {
      uint64_t v254 = objc_msgSend_BSSChannelsOnly(v249, v250, v251, v252, v253);
      objc_msgSend_setBSSChannelsOnly_(v1370, v255, v254, v256, v257);
      uint64_t v262 = objc_msgSend_maxBSSChannelCount(v1360, v258, v259, v260, v261);
      objc_msgSend_setMaxBSSChannelCount_(v1370, v263, v262, v264, v265);
      uint64_t v270 = objc_msgSend_maxBSSChannelAge(v1360, v266, v267, v268, v269);
      objc_msgSend_setMaxBSSChannelAge_(v1370, v271, v270, v272, v273);
      uint64_t v278 = objc_msgSend_passiveScan(v1360, v274, v275, v276, v277);
      objc_msgSend_setPassiveScan_(v1370, v279, v278, v280, v281);
      uint64_t v286 = objc_msgSend_dwellTime(v1360, v282, v283, v284, v285);
      objc_msgSend_setDwellTime_(v1370, v287, v286, v288, v289);
      uint64_t v294 = objc_msgSend_includeAdjacent5GHzChannel(v1360, v290, v291, v292, v293);
      objc_msgSend_setIncludeAdjacent5GHzChannel_(v1370, v295, v294, v296, v297);
      uint64_t v302 = objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v1360, v298, v299, v300, v301);
      objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v303, v302, v304, v305);
      uint64_t v310 = objc_msgSend_alwaysInclude6GHzPSCChannels(v1360, v306, v307, v308, v309);
      objc_msgSend_setInclude6GHzChannels_(v1370, v311, v310, v312, v313);
      goto LABEL_47;
    }
  }

  else if (objc_msgSend_trigger(v1369, v245, v246, v247, v248) == 32)
  {
    objc_msgSend_setBSSChannelsOnly_(v1370, v250, 1, v252, v253);
    objc_msgSend_setMaxScanCacheAge_(v1370, v324, 0, v325, v326);
    objc_msgSend_setDwellTime_(v1370, v327, 40, v328, v329);
    objc_msgSend_setMaxBSSChannelAge_(v1370, v330, 0, v331, v332);
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v333, 1, v334, v335);
    objc_msgSend_preferredChannels(v1369, v336, v337, v338, v339);
    uint64_t v340 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v345 = objc_msgSend_copy(v340, v341, v342, v343, v344);
    cachedCarPlayPreferredChannels = v1367->_cachedCarPlayPreferredChannels;
    v1367->_cachedCarPlayPreferredChannels = (NSArray *)v345;
  }

  v1360 = 0LL;
LABEL_47:
  if (objc_msgSend_trigger(v1369, v250, v251, v252, v253) == 47)
  {
    uint64_t v351 = (uint64_t)v1367->_cachedCarPlayPreferredChannels;
    objc_msgSend_autoJoinParameters(v1370, v347, v348, v349, v350);
    uint64_t v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreferredChannels_(v352, v353, v351, v354, v355);

    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v356, 1, v357, v358);
  }

  if (objc_msgSend_mode(v1369, v347, v348, v349, v350) == 4
    && objc_msgSend_trigger(v1369, v359, v360, v361, v362) != 54
    && objc_msgSend_trigger(v1369, v359, v360, v361, v362) != 55)
  {
    objc_msgSend_setBSSChannelsOnly_(v1370, v359, 1, v361, v362);
    objc_msgSend_setMaxBSSChannelCount_(v1370, v363, 2, v364, v365);
    objc_msgSend_setMaxBSSChannelAge_(v1370, v366, 86400, v367, v368);
  }

  objc_msgSend_supportedChannels(v1367, v359, v360, v361, v362);
  v1342 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v1342, v369, v370, v371, v372))
  {
    v1308 = (void *)MEMORY[0x189607870];
    uint64_t v1438 = *MEMORY[0x1896075E0];
    v1439[0] = @"No configured channels";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v373, (uint64_t)v1439, (uint64_t)&v1438, 1);
    id v432 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v1308, v1309, *MEMORY[0x189607688], 6, (uint64_t)v432);
    id v765 = (id)objc_claimAutoreleasedReturnValue();

    v1362 = 0LL;
    id v1364 = 0LL;
    v1345 = 0LL;
    v1346 = 0LL;
    v1355 = 0LL;
    v1356 = 0LL;
    id v1350 = 0LL;
    v1351 = 0LL;
    v1373 = 0LL;
    v1354 = 0LL;
    id v1349 = 0LL;
    v1358 = 0LL;
    unsigned int v1368 = 0;
    goto LABEL_254;
  }

  objc_msgSend___updateAutoJoinState_(v1367, v373, 1, v374, v375);
  objc_msgSend_knownNetworks(v1367, v376, v377, v378, v379);
  v1358 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v1358, v380, v381, v382, v383))
  {
    CWFGetOSLog();
    v1310 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1310)
    {
      CWFGetOSLog();
      id v1311 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v1311 = (id)MEMORY[0x1895F8DA0];
      id v1314 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled((os_log_t)v1311, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_385;
    }
    LOWORD(v1417) = 0;
    LODWORD(v1329) = 2;
    v1326 = &v1417;
    goto LABEL_384;
  }

  if (objc_msgSend_trigger(v1369, v384, v385, v386, v387) == 61 && retryScheduleIndex)
  {
    CWFGetOSLog();
    v1313 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1313)
    {
      CWFGetOSLog();
      id v1311 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v1311 = (id)MEMORY[0x1895F8DA0];
      id v1317 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled((os_log_t)v1311, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_385;
    }
    LOWORD(v1417) = 0;
    LODWORD(v1329) = 2;
    v1326 = &v1417;
LABEL_384:
    _os_log_send_and_compose_impl();
LABEL_385:
    v1362 = 0LL;
    id v1364 = 0LL;
    v1345 = 0LL;
    v1346 = 0LL;
    id v1349 = 0LL;
    id v1350 = 0LL;
    goto LABEL_386;
  }

  objc_msgSend_allObjects(v1358, v388, v389, v390, v391);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKnownNetworks_(obj->_metric, v393, (uint64_t)v392, v394, v395);

  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend_include6GHzChannels(v1370, v396, v397, v398, v399) & 1) == 0)
    {
      objc_msgSend_allObjects(v1358, v400, v401, v402, v403);
      uint64_t v404 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v408 = objc_msgSend___didRecentlyJoinAny6GHzOnlyNetworks_(v1367, v405, (uint64_t)v404, v406, v407);
      objc_msgSend_setInclude6GHzChannels_(v1370, v409, v408, v410, v411);
    }

    CWFGetOSLog();
    __int128 v412 = (void *)objc_claimAutoreleasedReturnValue();
    if (v412)
    {
      CWFGetOSLog();
      id v413 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v413 = (id)MEMORY[0x1895F8DA0];
      id v414 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v413, OS_LOG_TYPE_DEBUG))
    {
      int v419 = objc_msgSend_include6GHzChannels(v1370, v415, v416, v417, v418);
      v420 = "NOT ";
      if (v419) {
        v420 = "";
      }
      int v1417 = 136446210;
      unint64_t v1418 = (unint64_t)v420;
      LODWORD(v1329) = 12;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }
  }

  objc_msgSend_targetNetworkProfile(v1369, v396, v397, v398, v399, v1326, v1329);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v425)
  {
    v1345 = 0LL;
    v1346 = 0LL;
LABEL_86:
    v1362 = v425;
    if (didConfigurationChangeSincePreviousAttempt || self->_beginTimestamp - beginTimestamp >= 0x8BEE643A00LL)
    {
      CWFGetOSLog();
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      if (v464)
      {
        CWFGetOSLog();
        id v465 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v465 = (id)MEMORY[0x1895F8DA0];
        id v466 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled((os_log_t)v465, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v471 = objc_msgSend_count(v1358, v467, v468, v469, v470);
        int v1417 = 134217984;
        unint64_t v1418 = v471;
        LODWORD(v1329) = 12;
        v1326 = &v1417;
        _os_log_send_and_compose_impl();
      }

      __int128 v1405 = 0u;
      __int128 v1406 = 0u;
      __int128 v1403 = 0u;
      __int128 v1404 = 0u;
      id v472 = v1358;
      uint64_t v474 = objc_msgSend_countByEnumeratingWithState_objects_count_(v472, v473, (uint64_t)&v1403, (uint64_t)v1437, 16);
      if (v474)
      {
        uint64_t v475 = *(void *)v1404;
        v476 = (void *)MEMORY[0x1895F8DA0];
        do
        {
          for (uint64_t i = 0LL; i != v474; ++i)
          {
            if (*(void *)v1404 != v475) {
              objc_enumerationMutation(v472);
            }
            unint64_t v478 = *(void *)(*((void *)&v1403 + 1) + 8 * i);
            CWFGetOSLog();
            v479 = (void *)objc_claimAutoreleasedReturnValue();
            if (v479)
            {
              CWFGetOSLog();
              id v480 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v481 = v476;
              id v480 = v476;
            }

            if (os_log_type_enabled((os_log_t)v480, OS_LOG_TYPE_DEFAULT))
            {
              int v1417 = 138543362;
              unint64_t v1418 = v478;
              LODWORD(v1329) = 12;
              v1326 = &v1417;
              _os_log_send_and_compose_impl();
            }
          }

          uint64_t v474 = objc_msgSend_countByEnumeratingWithState_objects_count_( v472,  v482,  (uint64_t)&v1403,  (uint64_t)v1437,  16);
        }

        while (v474);
      }
    }

    objc_msgSend_orderedSet(MEMORY[0x189603FD0], v421, v422, v423, v424, v1326, v1329);
    v483 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedSet(MEMORY[0x189603FD0], v484, v485, v486, v487);
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedSet(MEMORY[0x189603FD0], v489, v490, v491, v492);
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    __uint64_t v494 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v495 = (void *)objc_claimAutoreleasedReturnValue();
    if (v495)
    {
      CWFGetOSLog();
      id v496 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v496 = (id)MEMORY[0x1895F8DA0];
      id v497 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v496, OS_LOG_TYPE_DEBUG))
    {
      int v1417 = 134219010;
      unint64_t v1418 = v494 / 0x3B9ACA00;
      __int16 v1419 = 2048;
      unint64_t v1420 = v494 % 0x3B9ACA00 / 0x3E8;
      __int16 v1421 = 2082;
      *(void *)v1422 = "-[CWFAutoJoinManager __performAutoJoin]";
      *(_WORD *)&v1422[8] = 2082;
      *(void *)&v1422[10] = "CWFAutoJoinManager.m";
      *(_WORD *)&v1422[18] = 1024;
      *(_DWORD *)v1423 = 1847;
      LODWORD(v1329) = 48;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }

    targetQueue = (dispatch_queue_s *)v1367->_targetQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864A4BF8;
    block[3] = &unk_189E5C998;
    id v1341 = v1358;
    id v1396 = v1341;
    v1397 = v1367;
    v1357 = v1370;
    v1398 = v1357;
    id v1364 = v483;
    id v1399 = v1364;
    id v1350 = v488;
    id v1400 = v1350;
    id v1349 = v493;
    id v1401 = v1349;
    v1402 = &v1411;
    dispatch_sync(targetQueue, block);

    if (!v1365 || !objc_msgSend_count(v1364, v499, v500, v501, v502)) {
      goto LABEL_146;
    }
    objc_msgSend_matchingKnownNetworkProfile(v1365, v499, v500, v501, v502);
    v503 = (void *)objc_claimAutoreleasedReturnValue();
    int isCarPlay = objc_msgSend_isCarPlay(v503, v504, v505, v506, v507);

    if (isCarPlay)
    {
      CWFGetOSLog();
      v1315 = (void *)objc_claimAutoreleasedReturnValue();
      if (v1315)
      {
        CWFGetOSLog();
        id v432 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v432 = (id)MEMORY[0x1895F8DA0];
        id v1318 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled((os_log_t)v432, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_400;
      }
      int v1417 = 138543362;
      unint64_t v1418 = (unint64_t)v1365;
      LODWORD(v1329) = 12;
      v1326 = &v1417;
    }

    else
    {
      if (objc_msgSend_trigger(v1369, v509, v510, v511, v512) == 45)
      {
        objc_msgSend_set(MEMORY[0x189603FE0], v513, v514, v515, v516);
        id v432 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_associatedNetwork(v1367, v517, v518, v519, v520);
        v521 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_channel(v521, v522, v523, v524, v525);
        v526 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_is6GHz(v526, v527, v528, v529, v530) & 1) == 0)
        {
          objc_msgSend_channel(v1335, v531, v532, v533, v534);
          v535 = (void *)objc_claimAutoreleasedReturnValue();
          int v540 = objc_msgSend_is6GHz(v535, v536, v537, v538, v539);

          if (!v540) {
            goto LABEL_121;
          }
          objc_msgSend_array(v1364, v541, v542, v543, v544);
          v545 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_matchingKnownNetworkProfile(v1335, v546, v547, v548, v549);
          v550 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_( v1367,  v551,  (uint64_t)v545,  (uint64_t)v550,  v552);
          v521 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v521)
          {
LABEL_120:

LABEL_121:
            objc_msgSend_intersectSet_(v1364, v541, (uint64_t)v432, v543, v544, v1326, v1329);
            if (!objc_msgSend_count(v1364, v568, v569, v570, v571))
            {
              CWFGetOSLog();
              v572 = (void *)objc_claimAutoreleasedReturnValue();
              if (v572)
              {
                CWFGetOSLog();
                id v573 = (id)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v573 = (id)MEMORY[0x1895F8DA0];
                id v1321 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled((os_log_t)v573, OS_LOG_TYPE_DEFAULT))
              {
                int v1417 = 138543362;
                unint64_t v1418 = (unint64_t)v1365;
                LODWORD(v1329) = 12;
                v1326 = &v1417;
                _os_log_send_and_compose_impl();
              }

- (void)__sortKnownNetworks:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x189603FA8];
  id v5 = a3;
  objc_msgSend_array(v4, v6, v7, v8, v9);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_knownNetworkComparator(self, v10, v11, v12, v13);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v14, 0, 0, (uint64_t)v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v34, v18, (uint64_t)v17, v19, v20);
  }

  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v14, (uint64_t)@"lastJoinedAt", 0, v15);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v34, v22, (uint64_t)v21, v23, v24);
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v25, (uint64_t)@"addedAt", 0, v26);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v34, v28, (uint64_t)v27, v29, v30);
  objc_msgSend_sortUsingDescriptors_(v5, v31, (uint64_t)v34, v32, v33);
}

- (void)__sortKnownNetworksByJoinTimestamp:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x189603FA8];
  id v4 = a3;
  objc_msgSend_array(v3, v5, v6, v7, v8);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v9, (uint64_t)@"lastJoinedByUserAt", 0, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v24, v12, (uint64_t)v11, v13, v14);
  objc_msgSend_sortDescriptorWithKey_ascending_( MEMORY[0x189607A20],  v15,  (uint64_t)@"lastJoinedBySystemAt",  0,  v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v24, v18, (uint64_t)v17, v19, v20);
  objc_msgSend_sortUsingDescriptors_(v4, v21, (uint64_t)v24, v22, v23);
}

- (id)__basicChannelRepresentation:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  uint64_t v8 = objc_msgSend_channel(v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_band(v3, v9, v10, v11, v12);

  objc_msgSend_channelWithNumber_band_width_(CWFChannel, v14, v8, v13, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)__knownNetworksList:(id)a3 containsMatchingKnownNetwork:(id)a4
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v57;
LABEL_3:
    uint64_t v15 = 0LL;
    uint64_t v53 = v13;
    while (1)
    {
      if (*(void *)v57 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
      objc_msgSend_identifier(v6, v9, v10, v11, v12);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = objc_msgSend_identifier(v16, v18, v19, v20, v21);
      if (v17 == (void *)v22)
      {

LABEL_17:
        id v51 = v16;
        goto LABEL_18;
      }

      __int128 v27 = (void *)v22;
      uint64_t v28 = objc_msgSend_identifier(v6, v23, v24, v25, v26);
      if (v28)
      {
        uint64_t v33 = (void *)v28;
        uint64_t v34 = objc_msgSend_identifier(v16, v29, v30, v31, v32);
        if (v34)
        {
          uint64_t v39 = (void *)v34;
          objc_msgSend_identifier(v6, v35, v36, v37, v38);
          id v40 = v6;
          uint64_t v41 = v14;
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v16, v43, v44, v45, v46);
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
          int isEqual = objc_msgSend_isEqual_(v42, v48, (uint64_t)v47, v49, v50);

          uint64_t v14 = v41;
          id v6 = v40;
          uint64_t v13 = v53;

          if (isEqual) {
            goto LABEL_17;
          }
          goto LABEL_13;
        }
      }

LABEL_13:
      if (v13 == ++v15)
      {
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v56, (uint64_t)v60, 16);
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v51 = 0LL;
LABEL_18:

  return v51;
}

- (BOOL)__didRecentlyJoinAny6GHzOnlyNetworks:(id)a3
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_location(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v10, v11, v12, v13);
  double v15 = v14;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  id v16 = v4;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v110, (uint64_t)v119, 16);
  if (v18)
  {
    uint64_t v23 = v18;
    uint64_t v24 = *(void *)v111;
    while (2)
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v111 != v24) {
          objc_enumerationMutation(v16);
        }
        uint64_t v26 = *(void **)(*((void *)&v110 + 1) + 8 * v25);
        if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v26, v19, v20, v21, v22, v101, v102))
        {
          objc_msgSend_lastJoinedOnAnyDeviceAt(v26, v19, v20, v21, v22);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v27, v28, v29, v30, v31);
          double v33 = v15 - v32;

          if (v33 <= 2592000.0)
          {
            if (!v9) {
              goto LABEL_33;
            }
            uint64_t v103 = v23;
            uint64_t v104 = v24;
            id v105 = v16;
            __int128 v108 = 0u;
            __int128 v109 = 0u;
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            objc_msgSend_BSSList(v26, v19, v20, v21, v22);
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v106, (uint64_t)v118, 16);
            if (!v36)
            {
LABEL_32:

              id v16 = v105;
LABEL_33:
              CWFGetOSLog();
              uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                CWFGetOSLog();
                dispatch_block_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                dispatch_block_t v88 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v89 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend_identifier(v26, v90, v91, v92, v93);
                uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_redactedForWiFi(v94, v95, v96, v97, v98);
                uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
                int v114 = 138543362;
                uint64_t v115 = v99;
                _os_log_send_and_compose_impl();
              }

              BOOL v86 = 1;
              goto LABEL_40;
            }

            uint64_t v41 = v36;
            char v42 = 0;
            uint64_t v43 = *(void *)v107;
            do
            {
              for (uint64_t i = 0LL; i != v41; ++i)
              {
                if (*(void *)v107 != v43) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v45 = *(void **)(*((void *)&v106 + 1) + 8 * i);
                objc_msgSend_lastAssociatedAt(v45, v37, v38, v39, v40);
                uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSinceReferenceDate(v46, v47, v48, v49, v50);
                double v52 = v15 - v51;

                if (v52 <= 2592000.0)
                {
                  objc_msgSend_location(v45, v37, v38, v39, v40);
                  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v53) {
                    goto LABEL_32;
                  }
                  __int128 v57 = v53;
                  objc_msgSend_distanceFromLocation_(v53, v54, (uint64_t)v9, v55, v56);
                  double v59 = v58;
                  objc_msgSend_horizontalAccuracy(v57, v60, v61, v62, v63);
                  double v65 = v59 - v64;
                  objc_msgSend_horizontalAccuracy(v9, v66, v67, v68, v69);
                  double v71 = v65 - v70;

                  if (v71 <= 3000.0) {
                    goto LABEL_32;
                  }
                  char v42 = 1;
                }
              }

              uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_( v34,  v37,  (uint64_t)&v106,  (uint64_t)v118,  16);
            }

            while (v41);

            id v16 = v105;
            uint64_t v23 = v103;
            uint64_t v24 = v104;
            CWFGetOSLog();
            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
            if (v72)
            {
              CWFGetOSLog();
              uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v73 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v74 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_identifier(v26, v75, v76, v77, v78);
              uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_redactedForWiFi(v79, v80, v81, v82, v83);
              uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
              int v114 = 138543618;
              uint64_t v115 = v84;
              __int16 v116 = 1024;
              int v117 = 3000;
              LODWORD(v102) = 18;
              uint64_t v101 = &v114;
              _os_log_send_and_compose_impl();
            }
          }
        }

        ++v25;
      }

      while (v25 != v23);
      uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v110, (uint64_t)v119, 16);
      uint64_t v23 = v85;
      BOOL v86 = 0;
      if (v85) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v86 = 0;
  }

- (void)__prepareKnownNetworksContext:(id)a3
{
  v1219[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  context = (void *)MEMORY[0x186E3AE7C]();
  v1157 = self;
  objc_msgSend___updateAutoJoinState_(self, v5, 1, v6, v7);
  unint64_t v1162 = v4;
  objc_msgSend_knownNetworks(v4, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_mutableCopy(v12, v13, v14, v15, v16);

  objc_msgSend___sortKnownNetworks_(v1157, v18, v17, v19, v20);
  v1158 = (void *)v17;
  objc_msgSend_setKnownNetworks_(v1162, v21, v17, v22, v23);
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v24, v25, v26, v27);
  v1152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v28, v29, v30, v31);
  uint64_t v1138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v32, v33, v34, v35);
  v1141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v36, v37, v38, v39);
  v1140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v40, v41, v42, v43);
  uint64_t v1137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v44, v45, v46, v47);
  uint64_t v1136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v48, v49, v50, v51);
  v1142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v52, v53, v54, v55);
  __uint64_t v1161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v56, (uint64_t)@"channel", 1, v57);
  v1119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_supportedChannels(v1157, v58, v59, v60, v61);
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  v1219[0] = v1119;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v63, (uint64_t)v1219, 1, v64);
  double v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v62, v66, (uint64_t)v65, v67, v68);
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v1189 = 0u;
  __int128 v1190 = 0u;
  __int128 v1187 = 0u;
  __int128 v1188 = 0u;
  obuint64_t j = v69;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v1187, (uint64_t)v1218, 16);
  if (!v75) {
    goto LABEL_28;
  }
  uint64_t v76 = *(void *)v1188;
  do
  {
    for (uint64_t i = 0LL; i != v75; ++i)
    {
      if (*(void *)v1188 != v76) {
        objc_enumerationMutation(obj);
      }
      uint64_t v78 = *(void **)(*((void *)&v1187 + 1) + 8 * i);
      objc_msgSend_autoJoinParameters(v1162, v71, v72, v73, v74);
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_trigger(v79, v80, v81, v82, v83) == 54)
      {
      }

      else
      {
        objc_msgSend_autoJoinParameters(v1162, v84, v85, v86, v87);
        id v89 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v94 = objc_msgSend_trigger(v89, v90, v91, v92, v93) == 55;

        if (!v94) {
          goto LABEL_10;
        }
      }

- (id)__cachedScanResultsWithChannelList:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v12 = objc_msgSend_maxScanCacheAge(v6, v8, v9, v10, v11);
  objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_( self,  v13,  (uint64_t)v7,  0,  0,  0,  v12,  1,  0,  0);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v14, v15, v16, v17, v18))
  {
    objc_msgSend_set(MEMORY[0x189603FE0], v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ANQPElementIDList(v6, v24, v25, v26, v27);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

    if (v33)
    {
      objc_msgSend___passpointScanResults_(self, v34, (uint64_t)v14, v35, v36);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v37, v38, v39, v40, v41))
      {
        objc_msgSend_ANQPElementIDList(v6, v42, v43, v44, v45);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = objc_msgSend_maxANQPCacheAge(v6, v47, v48, v49, v50);
        objc_msgSend_autoJoinParameters(v6, v52, v53, v54, v55);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v61 = objc_msgSend_mode(v56, v57, v58, v59, v60) == 3;
        uint64_t v63 = objc_msgSend___performGASQueryWithScanResults_ANQPElementIDList_maxCacheAge_cacheOnly_error_( self,  v62,  (uint64_t)v37,  (uint64_t)v46,  v51,  v61,  0);

        if (v63)
        {
          objc_msgSend_addObjectsFromArray_(v23, v64, v63, v65, v66);
          uint64_t v37 = (void *)v63;
        }

        else
        {
          uint64_t v37 = 0LL;
        }
      }
    }

    objc_msgSend_addObjectsFromArray_(v23, v34, (uint64_t)v14, v35, v36);
    objc_msgSend_allObjects(v23, v67, v68, v69, v70);
  }

  else
  {
    uint64_t v23 = 0LL;
    objc_msgSend_allObjects(0, v19, v20, v21, v22);
  }

  double v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (BOOL)__hasJoinedAnyKnownNetworkSinceBoot
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasJoinedAnyKnownNetworkSinceBoot)
  {
    BOOL hasJoinedAnyKnownNetworkSinceBoot = 1;
  }

  else
  {
    CWFGetBootTime();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t knownNetworks = v2->_knownNetworks;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = sub_1864A8028;
    v11[3] = &unk_189E5C9C0;
    id v6 = v4;
    id v12 = v6;
    uint64_t v13 = v2;
    objc_msgSend_enumerateObjectsUsingBlock_(knownNetworks, v7, (uint64_t)v11, v8, v9);

    BOOL hasJoinedAnyKnownNetworkSinceBoot = v2->_hasJoinedAnyKnownNetworkSinceBoot;
  }

  objc_sync_exit(v2);

  return hasJoinedAnyKnownNetworkSinceBoot;
}

- (id)__performPreAssociationScanWithContext:(id)a3 network:(id)a4
{
  v732[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v670 = a4;
  objc_msgSend_matchingKnownNetworkProfile(v670, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v12, v13, v14, v15);
  uint64_t v692 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v16, v17, v18, v19);
  uint64_t v679 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v20, (uint64_t)@"channel", 1, v21);
  uint64_t v695 = self;
  objc_msgSend_supportedChannels(self, v23, v24, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v666 = (void *)v22;
  v732[0] = v22;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v28, (uint64_t)v732, 1, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v27, v31, (uint64_t)v30, v32, v33);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v35, v36, v37, v38);
  uint64_t v680 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v704 = 0u;
  __int128 v705 = 0u;
  __int128 v706 = 0u;
  __int128 v707 = 0u;
  obuint64_t j = v34;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v704, (uint64_t)v731, 16);
  if (v40)
  {
    uint64_t v44 = v40;
    uint64_t v45 = *(void *)v705;
    do
    {
      for (uint64_t i = 0LL; i != v44; ++i)
      {
        if (*(void *)v705 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = *(void **)(*((void *)&v704 + 1) + 8 * i);
        objc_msgSend___basicChannelRepresentation_(v695, v41, (uint64_t)v47, v42, v43);
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v692, v49, (uint64_t)v48, v50, v51);
        if ((objc_msgSend_is6GHz(v47, v56, v57, v58, v59) & 1) == 0) {
          objc_msgSend_addObject_(v679, v60, (uint64_t)v48, v61, v62);
        }
      }

      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v704, (uint64_t)v731, 16);
    }

    while (v44);
  }

  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v63, v64, v65, v66);
  uint64_t v671 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v67, v68, v69, v70);
  uint64_t v674 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v71, v72, v73, v74);
  uint64_t v673 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x189603FE0], v75, v76, v77, v78);
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_location(v695, v80, v81, v82, v83);
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v85, v86, v87, v88);
  double v90 = v89;
  objc_msgSend_channel(v670, v91, v92, v93, v94);
  id v95 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v99 = objc_msgSend___basicChannelRepresentation_(v695, v96, (uint64_t)v95, v97, v98);

  objc_msgSend_scanChannels(v695->_metric, v100, v101, v102, v103);
  uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v79, v105, (uint64_t)v104, v106, v107);

  objc_msgSend_preAssociationScanChannels(v695->_metric, v108, v109, v110, v111);
  __int128 v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v79, v113, (uint64_t)v112, v114, v115);

  objc_msgSend_followup6GHzScanChannels(v695->_metric, v116, v117, v118, v119);
  uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v669 = v79;
  objc_msgSend_addObjectsFromArray_(v79, v121, (uint64_t)v120, v122, v123);

  __uint64_t v128 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v695->_beginTimestamp) / 0xF4240;
  uint64_t v682 = v84;
  v683 = v6;
  v667 = (void *)v99;
  __uint64_t v663 = v128;
  if (v99
    && objc_msgSend_age(v670, v124, v125, v126, v127) > v128
    && (objc_msgSend_containsObject_(v79, v124, v99, v126, v127) & 1) == 0)
  {
    uint64_t v465 = (void *)NSString;
    uint64_t v466 = objc_msgSend_shortSSID(v670, v124, v129, v126, v127);
    objc_msgSend_BSSID(v670, v467, v468, v469, v470);
    uint64_t v471 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_channel(v670, v472, v473, v474, v475);
    v476 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v481 = objc_msgSend_channel(v476, v477, v478, v479, v480);
    objc_msgSend_stringWithFormat_(v465, v482, (uint64_t)@"%lu/%@/%lu", v483, v484, v466, v471, v481);
    uint64_t v485 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v489 = objc_msgSend_objectForKeyedSubscript_(v695->_followup6GHzRNRMap, v486, (uint64_t)v485, v487, v488);
    uint64_t v493 = objc_msgSend_objectForKeyedSubscript_(v695->_followup6GHzFILSDMap, v490, (uint64_t)v485, v491, v492);
    if (!(v489 | v493))
    {
      CWFGetOSLog();
      uint64_t v494 = (void *)objc_claimAutoreleasedReturnValue();
      if (v494)
      {
        CWFGetOSLog();
        id v495 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v495 = (id)MEMORY[0x1895F8DA0];
        id v633 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled((os_log_t)v495, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_identifier(v11, v634, v635, v636, v637);
        uint64_t v638 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_redactedForWiFi(v638, v639, v640, v641, v642);
        uint64_t v643 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v648 = objc_msgSend_age(v670, v644, v645, v646, v647);
        int v708 = 138544130;
        uint64_t v709 = v667;
        __int16 v710 = 2114;
        uint64_t v711 = v643;
        __int16 v712 = 2048;
        uint64_t v713 = v648;
        __int16 v714 = 2048;
        __uint64_t v715 = v663;
        LODWORD(v658) = 42;
        BOOL v652 = &v708;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_addObject_(v671, v649, (uint64_t)v667, v650, v651);
      id v6 = v683;
    }

    v668 = 0LL;
    uint64_t v84 = v682;
  }

  else
  {
    objc_msgSend_orderedSetWithObject_(MEMORY[0x189603FD0], v124, (uint64_t)v670, v126, v127);
    v668 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend_BSSList(v11, v130, v131, v132, v133, v652, v658);
  uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_( MEMORY[0x189607A20],  v135,  (uint64_t)@"lastAssociatedAt",  0,  v136);
  uint64_t v664 = (void *)objc_claimAutoreleasedReturnValue();
  v730 = v664;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v137, (uint64_t)&v730, 1, v138);
  uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v665 = v134;
  objc_msgSend_sortedArrayUsingDescriptors_(v134, v140, (uint64_t)v139, v141, v142);
  uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v702 = 0u;
  __int128 v703 = 0u;
  __int128 v700 = 0u;
  __int128 v701 = 0u;
  id v678 = v143;
  uint64_t v685 = objc_msgSend_countByEnumeratingWithState_objects_count_(v678, v144, (uint64_t)&v700, (uint64_t)v729, 16);
  if (v685)
  {
    unint64_t v693 = 0LL;
    char v672 = 0;
    uint64_t v684 = *(void *)v701;
    uint64_t v149 = v692;
    while (1)
    {
      uint64_t v150 = 0LL;
      do
      {
        if (*(void *)v701 != v684) {
          objc_enumerationMutation(v678);
        }
        uint64_t v151 = *(void **)(*((void *)&v700 + 1) + 8 * v150);
        if (!objc_msgSend_maxBSSChannelAge(v6, v145, v146, v147, v148, v653)
          || (objc_msgSend_lastAssociatedAt(v151, v145, v146, v147, v148),
              uint64_t v152 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_timeIntervalSinceReferenceDate(v152, v153, v154, v155, v156),
              double v158 = v90 - v157,
              double v163 = (double)(unint64_t)objc_msgSend_maxBSSChannelAge(v6, v159, v160, v161, v162),
              v152,
              v158 <= v163))
        {
          if (objc_msgSend_maxBSSChannelCount(v6, v145, v146, v147, v148)
            && v693 >= objc_msgSend_maxBSSChannelCount(v6, v164, v165, v166, v167))
          {
            goto LABEL_93;
          }

          uint64_t v168 = objc_msgSend_location(v151, v164, v165, v166, v167);
          int v173 = 0;
          uint64_t v689 = (void *)v168;
          if (v84 && v168)
          {
            objc_msgSend_horizontalAccuracy(v84, v169, v170, v171, v172);
            if (v174 < 0.0) {
              goto LABEL_32;
            }
            objc_msgSend_horizontalAccuracy(v84, v169, v170, v171, v172);
            double v176 = v175;
            objc_msgSend_minBSSLocationAccuracy(v6, v177, v178, v179, v180);
            if (v176 > v181) {
              goto LABEL_32;
            }
            objc_msgSend_horizontalAccuracy(v689, v169, v170, v171, v172);
            if (v182 >= 0.0
              && (objc_msgSend_horizontalAccuracy(v689, v169, v170, v171, v172),
                  double v184 = v183,
                  objc_msgSend_minBSSLocationAccuracy(v6, v185, v186, v187, v188),
                  v184 <= v189)
              && (objc_msgSend_distanceFromLocation_(v689, v169, (uint64_t)v84, v171, v172),
                  double v191 = v190,
                  objc_msgSend_maxBSSLocationDistance(v6, v192, v193, v194, v195),
                  v191 <= v196))
            {
              int v173 = 1;
              char v672 = 1;
            }

            else
            {
LABEL_32:
              int v173 = 0;
            }
          }

          objc_msgSend_channel(v151, v169, v170, v171, v172);
          uint64_t v197 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v202 = objc_msgSend_copy(v197, v198, v199, v200, v201);

          uint64_t v688 = (void *)v202;
          if (v202)
          {
            objc_msgSend_array(MEMORY[0x189603FA8], v203, v204, v205, v206);
            uint64_t v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___basicChannelRepresentation_(v695, v208, v202, v209, v210);
            uint64_t v211 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v220 = v211;
            if (objc_msgSend_is6GHz(v211, v212, v213, v214, v215))
            {
              objc_msgSend_colocated2GHzRNRChannel(v151, v216, v217, v218, v219);
              uint64_t v225 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v686 = v225;
              if (v225)
              {
                objc_msgSend___basicChannelRepresentation_(v695, v221, (uint64_t)v225, v223, v224);
                uint64_t v675 = (void *)objc_claimAutoreleasedReturnValue();
                CWFGetOSLog();
                uint64_t v226 = (void *)objc_claimAutoreleasedReturnValue();
                if (v226)
                {
                  CWFGetOSLog();
                  id v227 = (id)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v227 = (id)MEMORY[0x1895F8DA0];
                  id v228 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled((os_log_t)v227, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_identifier(v11, v229, v230, v231, v232);
                  BOOL v233 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_redactedForWiFi(v233, v234, v235, v236, v237);
                  double v238 = (void *)objc_claimAutoreleasedReturnValue();
                  int v708 = 138543874;
                  uint64_t v709 = v675;
                  __int16 v710 = 2114;
                  uint64_t v711 = v220;
                  __int16 v712 = 2114;
                  uint64_t v713 = (uint64_t)v238;
                  LODWORD(v659) = 32;
                  v653 = &v708;
                  _os_log_send_and_compose_impl();

                  uint64_t v211 = (char *)v220;
                }

                objc_msgSend_addObject_(v207, v239, (uint64_t)v675, v240, v241);
                uint64_t v225 = v686;
              }

              objc_msgSend_colocated5GHzRNRChannel(v151, v221, v222, v223, v224, v653, v659);
              uint64_t v245 = (void *)objc_claimAutoreleasedReturnValue();
              if (v245)
              {
                objc_msgSend___basicChannelRepresentation_(v695, v242, (uint64_t)v245, v243, v244);
                uint64_t v676 = (void *)objc_claimAutoreleasedReturnValue();
                CWFGetOSLog();
                uint64_t v246 = (void *)objc_claimAutoreleasedReturnValue();
                if (v246)
                {
                  CWFGetOSLog();
                  id v247 = (id)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v247 = (id)MEMORY[0x1895F8DA0];
                  id v248 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled((os_log_t)v247, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_identifier(v11, v249, v250, v251, v252);
                  uint64_t v253 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_redactedForWiFi(v253, v254, v255, v256, v257);
                  uint64_t v258 = (void *)objc_claimAutoreleasedReturnValue();
                  int v708 = 138543874;
                  uint64_t v709 = v676;
                  __int16 v710 = 2114;
                  uint64_t v711 = v220;
                  __int16 v712 = 2114;
                  uint64_t v713 = (uint64_t)v258;
                  LODWORD(v659) = 32;
                  v653 = &v708;
                  _os_log_send_and_compose_impl();

                  uint64_t v211 = (char *)v220;
                }

                objc_msgSend_addObject_(v207, v259, (uint64_t)v676, v260, v261);
                uint64_t v225 = v686;
              }
            }

            else
            {
              objc_msgSend_addObject_(v207, v216, (uint64_t)v211, v218, v219);
            }

            uint64_t v687 = v150;
            __int128 v698 = 0u;
            __int128 v699 = 0u;
            __int128 v696 = 0u;
            __int128 v697 = 0u;
            id v262 = v207;
            uint64_t v264 = objc_msgSend_countByEnumeratingWithState_objects_count_( v262,  v263,  (uint64_t)&v696,  (uint64_t)v728,  16);
            if (v264)
            {
              uint64_t v268 = v264;
              uint64_t v269 = *(void *)v697;
              uint64_t v270 = v674;
              if (v173) {
                uint64_t v270 = v673;
              }
              uint64_t v690 = v270;
              do
              {
                uint64_t v271 = 0LL;
                do
                {
                  if (*(void *)v697 != v269) {
                    objc_enumerationMutation(v262);
                  }
                  uint64_t v272 = *(char **)(*((void *)&v696 + 1) + 8 * v271);
                  if (!objc_msgSend_containsObject_(v149, v265, (uint64_t)v272, v266, v267, v653))
                  {
                    CWFGetOSLog();
                    uint64_t v286 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v286)
                    {
                      CWFGetOSLog();
                      id v287 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      id v287 = (id)MEMORY[0x1895F8DA0];
                      id v291 = MEMORY[0x1895F8DA0];
                    }

                    if (os_log_type_enabled((os_log_t)v287, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_identifier(v11, v292, v293, v294, v295);
                      uint64_t v296 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_redactedForWiFi(v296, v297, v298, v299, v300);
                      uint64_t v301 = v11;
                      uint64_t v302 = (void *)objc_claimAutoreleasedReturnValue();
                      int v708 = 138543618;
                      uint64_t v709 = v302;
                      __int16 v710 = 2114;
                      uint64_t v711 = v272;
                      LODWORD(v659) = 22;
                      v653 = &v708;
                      _os_log_send_and_compose_impl();

                      uint64_t v11 = v301;
                      uint64_t v149 = v692;
                    }

                    goto LABEL_71;
                  }

                  if (objc_msgSend_is6GHz(v272, v273, v274, v275, v276))
                  {
                    if ((_os_feature_enabled_impl() & 1) == 0)
                    {
                      CWFGetOSLog();
                      uint64_t v303 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v303)
                      {
                        CWFGetOSLog();
                        id v287 = (id)objc_claimAutoreleasedReturnValue();
                      }

                      else
                      {
                        id v287 = (id)MEMORY[0x1895F8DA0];
                        id v305 = MEMORY[0x1895F8DA0];
                      }

                      if (!os_log_type_enabled((os_log_t)v287, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_71;
                      }
LABEL_83:
                      objc_msgSend_identifier(v11, v306, v307, v308, v309);
                      v677 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_redactedForWiFi(v677, v311, v312, v313, v314);
                      uint64_t v315 = (void *)objc_claimAutoreleasedReturnValue();
                      int v708 = 138543618;
                      uint64_t v709 = v315;
                      __int16 v710 = 2114;
                      uint64_t v711 = v272;
                      LODWORD(v659) = 22;
                      v653 = &v708;
                      _os_log_send_and_compose_impl();

                      goto LABEL_71;
                    }

                    if ((_os_feature_enabled_impl() & 1) == 0
                      && (objc_msgSend_is6GHzPSC(v272, v277, v278, v279, v280) & 1) == 0)
                    {
                      CWFGetOSLog();
                      uint64_t v304 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v304)
                      {
                        CWFGetOSLog();
                        id v287 = (id)objc_claimAutoreleasedReturnValue();
                      }

                      else
                      {
                        id v287 = (id)MEMORY[0x1895F8DA0];
                        id v310 = MEMORY[0x1895F8DA0];
                      }

                      if (!os_log_type_enabled((os_log_t)v287, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_71;
                      }
                      goto LABEL_83;
                    }
                  }

                  objc_msgSend_scanChannels(v695->_metric, v277, v278, v279, v280);
                  uint64_t v281 = (void *)objc_claimAutoreleasedReturnValue();
                  char v285 = objc_msgSend_containsObject_(v281, v282, (uint64_t)v272, v283, v284);

                  if ((v285 & 1) != 0)
                  {
                    uint64_t v211 = (char *)v220;
                    goto LABEL_72;
                  }

                  id v287 = v690;
                  objc_msgSend_addObject_(v287, v288, (uint64_t)v272, v289, v290);
                  ++v693;
LABEL_71:
                  uint64_t v211 = (char *)v220;

LABEL_72:
                  ++v271;
                }

                while (v268 != v271);
                uint64_t v316 = objc_msgSend_countByEnumeratingWithState_objects_count_( v262,  v265,  (uint64_t)&v696,  (uint64_t)v728,  16);
                uint64_t v268 = v316;
              }

              while (v316);
            }

            uint64_t v84 = v682;
            id v6 = v683;
            uint64_t v150 = v687;
          }
        }

        ++v150;
      }

      while (v150 != v685);
      uint64_t v317 = objc_msgSend_countByEnumeratingWithState_objects_count_(v678, v145, (uint64_t)&v700, (uint64_t)v729, 16);
      uint64_t v685 = v317;
      if (!v317) {
        goto LABEL_93;
      }
    }
  }

  char v672 = 0;
LABEL_93:

  objc_msgSend_array(v673, v318, v319, v320, v321);
  uint64_t v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v671, v323, (uint64_t)v322, v324, v325);

  objc_msgSend_array(v674, v326, v327, v328, v329);
  BOOL v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v671, v331, (uint64_t)v330, v332, v333);

  objc_msgSend_networkName(v11, v334, v335, v336, v337);
  uint64_t v342 = (void *)objc_claimAutoreleasedReturnValue();
  if (v342)
  {
    double v347 = v670;
    if (objc_msgSend_hiddenState(v11, v343, v344, v345, v346) != 2) {
      goto LABEL_100;
    }
    uint64_t v353 = objc_msgSend_wasHiddenBefore(v11, v349, v350, v351, v352);
    if (!v353
      || (uint64_t v358 = (void *)v353,
          objc_msgSend_wasHiddenBefore(v11, v354, v355, v356, v357),
          uint64_t v359 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_timeIntervalSinceReferenceDate(v359, v360, v361, v362, v363),
          double v365 = v364,
          v359,
          v358,
          v365 >= 604800.0))
    {
LABEL_95:
      double v348 = 0LL;
    }

    else
    {
LABEL_100:
      objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v349, (uint64_t)v342, v351, v352, v653);
      double v348 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    double v348 = 0LL;
    double v347 = v670;
  }

  CWFGetOSLog();
  uint64_t v366 = (void *)objc_claimAutoreleasedReturnValue();
  if (v366)
  {
    CWFGetOSLog();
    id v367 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v367 = (id)MEMORY[0x1895F8DA0];
    id v368 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled((os_log_t)v367, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_identifier(v11, v369, v370, v371, v372);
    uint64_t v691 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v691, v373, v374, v375, v376);
    uint64_t v381 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v382 = "no";
    uint64_t v694 = v342;
    if ((v672 & 1) != 0) {
      id v383 = "yes";
    }
    else {
      id v383 = "no";
    }
    if (objc_msgSend_count(v348, v377, v378, v379, v380, v653)) {
      uint64_t v382 = "yes";
    }
    uint64_t v388 = objc_msgSend_maxBSSChannelAge(v6, v384, v385, v386, v387);
    objc_msgSend_minBSSLocationAccuracy(v683, v389, v390, v391, v392);
    uint64_t v394 = v393;
    objc_msgSend_maxBSSLocationDistance(v683, v395, v396, v397, v398);
    uint64_t v400 = v399;
    id v405 = v348;
    uint64_t v406 = objc_msgSend_maxBSSChannelCount(v683, v401, v402, v403, v404);
    objc_msgSend_description(v84, v407, v408, v409, v410);
    uint64_t v411 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v411, v412, v413, v414, v415);
    uint64_t v416 = v11;
    uint64_t v417 = (void *)objc_claimAutoreleasedReturnValue();
    int v708 = 138545666;
    uint64_t v709 = v381;
    __int16 v710 = 2082;
    uint64_t v711 = v383;
    double v347 = v670;
    __int16 v712 = 2082;
    uint64_t v713 = (uint64_t)v382;
    __int16 v714 = 2114;
    __uint64_t v715 = (__uint64_t)v673;
    __int16 v716 = 2114;
    uint64_t v717 = v674;
    __int16 v718 = 2048;
    uint64_t v719 = v388;
    id v6 = v683;
    __int16 v720 = 2048;
    uint64_t v721 = v394;
    __int16 v722 = 2048;
    uint64_t v723 = v400;
    __int16 v724 = 2048;
    uint64_t v725 = v406;
    double v348 = v405;
    __int16 v726 = 2114;
    uint64_t v727 = v417;
    LODWORD(v659) = 102;
    v653 = &v708;
    _os_log_send_and_compose_impl();

    uint64_t v11 = v416;
    uint64_t v342 = v694;

    uint64_t v84 = v682;
  }

  objc_msgSend_autoJoinParameters(v6, v418, v419, v420, v421);
  uint64_t v422 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v427 = objc_msgSend_mode(v422, v423, v424, v425, v426);

  if (v427 == 2)
  {
    CWFGetOSLog();
    uint64_t v432 = (void *)objc_claimAutoreleasedReturnValue();
    if (v432)
    {
      CWFGetOSLog();
      id v433 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v433 = (id)MEMORY[0x1895F8DA0];
      id v434 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v433, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v708) = 0;
      LODWORD(v659) = 2;
      v653 = &v708;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_array(v680, v435, v436, v437, v438);
    uint64_t v439 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v671, v440, (uint64_t)v439, v441, v442);
  }

  objc_msgSend_matchingKnownNetworkProfile(v347, v428, v429, v430, v431, v653, v659);
  uint64_t v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastJoinedBySystemAt(v443, v444, v445, v446, v447);
  uint64_t v448 = (void *)objc_claimAutoreleasedReturnValue();
  if (v448)
  {
  }

  else
  {
    objc_msgSend_matchingKnownNetworkProfile(v347, v449, v450, v451, v452);
    uint64_t v453 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v458 = objc_msgSend_addReason(v453, v454, v455, v456, v457);

    if (v458 != 8) {
      goto LABEL_131;
    }
    CWFGetOSLog();
    id v463 = (void *)objc_claimAutoreleasedReturnValue();
    if (v463)
    {
      CWFGetOSLog();
      id v464 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v464 = (id)MEMORY[0x1895F8DA0];
      id v496 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v464, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v708) = 0;
      LODWORD(v660) = 2;
      uint64_t v654 = &v708;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_array(v679, v497, v498, v499, v500);
    uint64_t v443 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v671, v501, (uint64_t)v443, v502, v503);
  }

LABEL_131:
  if ((objc_msgSend___hasJoinedAnyKnownNetworkSinceBoot(v695, v459, v460, v461, v462, v654, v660) & 1) == 0)
  {
    CWFGetOSLog();
    uint64_t v508 = (void *)objc_claimAutoreleasedReturnValue();
    if (v508)
    {
      CWFGetOSLog();
      id v509 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v509 = (id)MEMORY[0x1895F8DA0];
      id v510 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v509, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v708) = 0;
      LODWORD(v661) = 2;
      uint64_t v655 = &v708;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_array(v679, v511, v512, v513, v514);
    uint64_t v515 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v671, v516, (uint64_t)v515, v517, v518);

    objc_msgSend_array(v680, v519, v520, v521, v522);
    uint64_t v523 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v671, v524, (uint64_t)v523, v525, v526);

    objc_msgSend_setDidForceAllRemainingChannels_(v6, v527, 1, v528, v529);
  }

  objc_msgSend_channel(v347, v504, v505, v506, v507, v655, v661);
  uint64_t v530 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_is6GHz(v530, v531, v532, v533, v534))
  {
    objc_msgSend_matchingKnownNetworkProfile(v347, v535, v536, v537, v538);
    uint64_t v539 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastJoinedAt(v539, v540, v541, v542, v543);
    uint64_t v544 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v544)
    {
      CWFGetOSLog();
      uint64_t v549 = (void *)objc_claimAutoreleasedReturnValue();
      if (v549)
      {
        CWFGetOSLog();
        id v550 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v550 = (id)MEMORY[0x1895F8DA0];
        id v551 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled((os_log_t)v550, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v708) = 0;
        LODWORD(v662) = 2;
        uint64_t v656 = &v708;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_array(v679, v552, v553, v554, v555);
      uint64_t v556 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v671, v557, (uint64_t)v556, v558, v559);

      objc_msgSend_array(v680, v560, v561, v562, v563);
      v564 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v671, v565, (uint64_t)v564, v566, v567);

      objc_msgSend_setDidForceAllRemainingChannels_(v6, v568, 1, v569, v570);
    }
  }

  else
  {
  }

  uint64_t v571 = objc_msgSend_count(v671, v545, v546, v547, v548, v656, v662);
  objc_msgSend_minusSet_(v671, v572, (uint64_t)v669, v573, v574);
  if (!objc_msgSend_count(v671, v575, v576, v577, v578))
  {
    uint64_t v581 = CWFGetOSLog();
    uint64_t v582 = (void *)v581;
    if (v571)
    {
      if (v581)
      {
        CWFGetOSLog();
        id v583 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v583 = (id)MEMORY[0x1895F8DA0];
        id v625 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled((os_log_t)v583, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_174;
      }
      LOWORD(v708) = 0;
    }

    else
    {
      if (v581)
      {
        CWFGetOSLog();
        id v583 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v583 = (id)MEMORY[0x1895F8DA0];
        id v626 = MEMORY[0x1895F8DA0];
      }

      if (!os_log_type_enabled((os_log_t)v583, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_174;
      }
      LOWORD(v708) = 0;
    }

    _os_log_send_and_compose_impl();
    goto LABEL_174;
  }

  CWFGetOSLog();
  uint64_t v579 = (void *)objc_claimAutoreleasedReturnValue();
  if (v579)
  {
    CWFGetOSLog();
    id v580 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v580 = (id)MEMORY[0x1895F8DA0];
    id v584 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled((os_log_t)v580, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v708) = 0;
    uint64_t v657 = &v708;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_array(v671, v585, v586, v587, v588);
  uint64_t v589 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v657) = 1;
  objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_( v695,  v590,  (uint64_t)v589,  (uint64_t)v348,  0,  0,  v663,  0,  v657,  0);
  id v583 = (id)objc_claimAutoreleasedReturnValue();

  if (v583)
  {
    uint64_t v595 = v668;
    if (!v668)
    {
      objc_msgSend_orderedSet(MEMORY[0x189603FD0], v591, v592, v593, v594);
      uint64_t v595 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_removeObjectsInArray_(v595, v591, (uint64_t)v583, v593, v594);
    v668 = v595;
    objc_msgSend_addObjectsFromArray_(v595, v596, (uint64_t)v583, v597, v598);
    objc_msgSend_autoJoinParameters(v6, v599, v600, v601, v602);
    uint64_t v603 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_trigger(v603, v604, v605, v606, v607) != 54)
    {
      objc_msgSend_autoJoinParameters(v6, v608, v609, v610, v611);
      v612 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v617 = objc_msgSend_trigger(v612, v613, v614, v615, v616);

      if (v617 == 55)
      {
        uint64_t v84 = v682;
        goto LABEL_174;
      }

      objc_msgSend___perform6GHzFollowupDiscoveryWithScanResults_SSIDList_dwellTime_context_error_( v695,  v618,  (uint64_t)v583,  (uint64_t)v348,  0,  v6,  0);
      uint64_t v603 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v84 = v682;
      if (v603)
      {
        objc_msgSend_removeObjectsInArray_(v595, v619, (uint64_t)v603, v620, v621);
        objc_msgSend_addObjectsFromArray_(v595, v622, (uint64_t)v603, v623, v624);
      }
    }
  }

- (BOOL)__discoverKnownNetworksWithContext:(id)a3 error:(id *)a4
{
  uint64_t v502 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  CWFGetOSLog();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CWFGetOSLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v9 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v494 = 134218752;
    uint64_t v495 = objc_msgSend_maxScanCycles(v6, v10, v11, v12, v13);
    __int16 v496 = 2048;
    uint64_t v497 = objc_msgSend_maxScanChannelCount(v6, v14, v15, v16, v17);
    __int16 v498 = 2048;
    uint64_t v499 = objc_msgSend_maxScanSSIDCount(v6, v18, v19, v20, v21);
    __int16 v500 = 2048;
    uint64_t v501 = objc_msgSend_minRSSI(v6, v22, v23, v24, v25);
    int v461 = 42;
    uint64_t v458 = &v494;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_autoJoinParameters(v6, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);
  id v491 = 0LL;
  int v38 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v36, v35, (uint64_t)&v491, v37);
  id v39 = v491;

  if (!v38)
  {
    v476 = 0LL;
    uint64_t v477 = 0LL;
    uint64_t v91 = 0LL;
    uint64_t v467 = 0LL;
    uint64_t v456 = 0LL;
    uint64_t v67 = 0LL;
    BOOL v160 = 0;
    if (a4) {
      goto LABEL_112;
    }
    goto LABEL_114;
  }

  context = (void *)MEMORY[0x186E3AE7C](v40, v41);
  uint64_t v44 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v42, (uint64_t)@"channel", 1, v43);
  objc_msgSend_supportedChannels(self, v45, v46, v47, v48);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v466 = (void *)v44;
  uint64_t v493 = v44;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v50, (uint64_t)&v493, 1, v51);
  double v52 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = objc_msgSend_sortedArrayUsingDescriptors_(v49, v53, (uint64_t)v52, v54, v55);

  objc_msgSend___updateAutoJoinState_(self, v57, 2, v58, v59);
  uint64_t v467 = (void *)v56;
  if (objc_msgSend_cacheOnly(v6, v60, v61, v62, v63))
  {
    objc_msgSend___cachedScanResultsWithChannelList_context_(self, v64, v56, (uint64_t)v6, v66);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v67, v68, v69, v70, v71))
    {
      shouldAllowPreAssocScauint64_t n = objc_msgSend___shouldAllowPreAssocScan(self, v64, v72, v65, v66);
      id v490 = v39;
      uint64_t v74 = v67;
      char v76 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_( self,  v75,  (uint64_t)v67,  shouldAllowPreAssocScan,  (uint64_t)v6,  &v490);
      id v77 = v490;

      if ((v76 & 1) != 0)
      {
        v476 = 0LL;
        uint64_t v477 = 0LL;
        uint64_t v91 = 0LL;
        BOOL v160 = 1;
        uint64_t v67 = v74;
        goto LABEL_111;
      }

      id v39 = v77;
      uint64_t v67 = v74;
    }
  }

  else
  {
    uint64_t v67 = 0LL;
  }

  objc_msgSend___updateAutoJoinState_(self, v64, 2, v65, v66, v458, v461);
  if (objc_msgSend_cacheOnly(v6, v78, v79, v80, v81))
  {
    v476 = 0LL;
    uint64_t v477 = 0LL;
    uint64_t v91 = 0LL;
    BOOL v160 = 0;
    id v77 = v39;
    goto LABEL_111;
  }

  id v463 = v67;
  id v464 = a4;
  uint64_t v86 = (void *)MEMORY[0x189603FA8];
  objc_msgSend_recentChannelList(v6, v82, v83, v84, v85);
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v86, v88, (uint64_t)v87, v89, v90);
  uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x189603FA8], v92, v93, v94, v95);
  uint64_t v477 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x189603FA8], v96, v97, v98, v99);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v486 = 0u;
  __int128 v487 = 0u;
  __int128 v488 = 0u;
  __int128 v489 = 0u;
  objc_msgSend_remainingChannelList(v6, v100, v101, v102, v103);
  uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v486, (uint64_t)v492, 16);
  if (v106)
  {
    uint64_t v111 = v106;
    uint64_t v112 = *(void *)v487;
    do
    {
      for (uint64_t i = 0LL; i != v111; ++i)
      {
        if (*(void *)v487 != v112) {
          objc_enumerationMutation(v104);
        }
        uint64_t v114 = *(void **)(*((void *)&v486 + 1) + 8 * i);
        else {
          objc_msgSend_addObject_(v476, v115, (uint64_t)v114, v116, v117);
        }
      }

      uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v486, (uint64_t)v492, 16);
    }

    while (v111);
  }

  objc_msgSend_addObjectsFromArray_(v91, v118, (uint64_t)v477, v119, v120);
  objc_msgSend_addObjectsFromArray_(v91, v121, (uint64_t)v476, v122, v123);
  unint64_t v469 = 0LL;
  uint64_t v470 = v91;
  uint64_t v474 = self;
  while (2)
  {
    objc_msgSend_SSIDList(v6, v124, v125, v126, v127);
    __uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSIDList(v6, v129, v130, v131, v132);
    uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v138 = objc_msgSend_count(v133, v134, v135, v136, v137) - v469;
    unint64_t v147 = objc_msgSend_maxScanSSIDCount(v6, v139, v140, v141, v142);
    if (v138 >= v147)
    {
      uint64_t v153 = objc_msgSend_maxScanSSIDCount(v6, v143, v144, v145, v146);
    }

    else
    {
      objc_msgSend_SSIDList(v6, v143, v144, v145, v146);
      uint64_t v468 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v153 = objc_msgSend_count(v468, v148, v149, v150, v151) - v469;
    }

    objc_msgSend_subarrayWithRange_(v128, v152, v469, v153, v154);
    uint64_t v471 = (void *)objc_claimAutoreleasedReturnValue();
    if (v138 < v147) {

    }
    unint64_t v159 = 0LL;
    BOOL v160 = 0;
    v469 += objc_msgSend_count(v471, v155, v156, v157, v158);
    char v165 = 1;
    while (1)
    {
      char v170 = v160 | (v159 >= objc_msgSend_count(v91, v161, v162, v163, v164));
      if ((v170 & 1) != 0 || (v165 & 1) == 0)
      {
        v165 &= v170;
        id v77 = v39;
        goto LABEL_104;
      }

      objc_msgSend_autoJoinParameters(v6, v166, v167, v168, v169);
      uint64_t v171 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v176 = objc_msgSend_trigger(v171, v172, v173, v174, v175);
      id v485 = v39;
      int v179 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v177, v176, (uint64_t)&v485, v178);
      id v77 = v485;

      if (!v179) {
        break;
      }
      uint64_t v184 = objc_msgSend_count(v91, v180, v181, v182, v183);
      objc_msgSend_recentChannelList(v6, v185, v186, v187, v188);
      double v189 = (void *)objc_claimAutoreleasedReturnValue();
      if (v159 >= objc_msgSend_count(v189, v190, v191, v192, v193))
      {
      }

      else
      {
        objc_msgSend_autoJoinParameters(v6, v194, v195, v196, v197);
        uint64_t v198 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v203 = objc_msgSend_mode(v198, v199, v200, v201, v202);

        if (v203 != 2)
        {
          unint64_t v208 = objc_msgSend_maxScanChannelCount(v6, v204, v205, v206, v207);
          objc_msgSend_recentChannelList(v6, v209, v210, v211, v212);
          uint64_t v213 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v184 = objc_msgSend_count(v213, v214, v215, v216, v217);

          int v222 = 0;
          goto LABEL_45;
        }
      }

      if ((objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v6, v204, v205, v206, v207) & 1) != 0
        || self->_didDiscoverBSS)
      {
        CWFGetOSLog();
        uint64_t v223 = (void *)objc_claimAutoreleasedReturnValue();
        if (v223)
        {
          CWFGetOSLog();
          uint64_t v224 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v224 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v225 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v494) = 0;
          LODWORD(v462) = 2;
          uint64_t v459 = &v494;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(self->_metric, v226, 1, v227, v228);
        int v222 = 0;
        unint64_t v208 = -1LL;
      }

      else
      {
        CWFGetOSLog();
        uint64_t v288 = (void *)objc_claimAutoreleasedReturnValue();
        if (v288)
        {
          CWFGetOSLog();
          uint64_t v289 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v289 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v423 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v494) = 0;
          LODWORD(v462) = 2;
          uint64_t v459 = &v494;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_recentChannelList(v6, v424, v425, v426, v427);
        uint64_t v428 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v433 = objc_msgSend_count(v428, v429, v430, v431, v432);
        uint64_t v184 = objc_msgSend_count(v477, v434, v435, v436, v437) + v433;

        unint64_t v208 = -1LL;
        int v222 = 1;
      }

- (void)__updateDiscoverTimestampForJoinCandidates:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_date(MEMORY[0x189603F50], v5, v6, v7, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  obuint64_t j = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v27, (uint64_t)v41, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          CWFGetOSLog();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v18 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v19 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v31 = 134219010;
          unint64_t v32 = v16 / 0x3B9ACA00;
          __int16 v33 = 2048;
          unint64_t v34 = v16 % 0x3B9ACA00 / 0x3E8;
          __int16 v35 = 2082;
          uint64_t v36 = "-[CWFAutoJoinManager __updateDiscoverTimestampForJoinCandidates:]";
          __int16 v37 = 2082;
          int v38 = "CWFAutoJoinManager.m";
          __int16 v39 = 1024;
          int v40 = 3438;
          _os_log_send_and_compose_impl();
        }

        targetQueue = (dispatch_queue_s *)self->_targetQueue;
        qos_class_t v21 = qos_class_self();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = sub_1864AA8F8;
        block[3] = &unk_189E5BEB8;
        void block[4] = self;
        void block[5] = v15;
        id v26 = v9;
        dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
        dispatch_async(targetQueue, v22);
      }

      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v27, (uint64_t)v41, 16);
    }

    while (v12);
  }
}

- (void)__updateRNRChannel:(id)a3 has6GHzOnlyBSS:(BOOL)a4 joinCandidate:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134219010;
    unint64_t v24 = v10 / 0x3B9ACA00;
    __int16 v25 = 2048;
    unint64_t v26 = v10 % 0x3B9ACA00 / 0x3E8;
    __int16 v27 = 2082;
    __int128 v28 = "-[CWFAutoJoinManager __updateRNRChannel:has6GHzOnlyBSS:joinCandidate:]";
    __int16 v29 = 2082;
    __int128 v30 = "CWFAutoJoinManager.m";
    __int16 v31 = 1024;
    int v32 = 3462;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v15 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864AADB4;
  block[3] = &unk_189E5C3B0;
  void block[4] = self;
  id v20 = v9;
  BOOL v22 = a4;
  id v21 = v8;
  id v16 = v9;
  id v17 = v8;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);
}

- (BOOL)__shouldAllowPreAssocScan
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_trigger(v5, v6, v7, v8, v9);

  return v10 != 32 && v10 != 47;
}

- (BOOL)__preflightMatchKnownNetworksForScanResult:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_SSID(v4, v6, v7, v8, v9);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (knownNetworkSSIDMap = v5->_knownNetworkSSIDMap,
        objc_msgSend_SSID(v4, v10, v11, v12, v13),
        id v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(knownNetworkSSIDMap, v17, (uint64_t)v16, v18, v19),
        id v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v14,
        v20))
  {
    BOOL v21 = 1;
  }

  else
  {
    id v20 = 0LL;
    else {
      BOOL v21 = 0;
    }
  }

  objc_sync_exit(v5);
  return v21;
}

- (BOOL)__matchAndJoinScanResults:(id)a3 allowPreAssociationScan:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  BOOL v1174 = a4;
  uint64_t v1278 = *MEMORY[0x1895F89C0];
  id v1173 = a3;
  id v1191 = a5;
  objc_msgSend_autoJoinParameters(v1191, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_trigger(v11, v12, v13, v14, v15);
  id v1266 = 0LL;
  int v19 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v17, v16, (uint64_t)&v1266, v18);
  id v1176 = v1266;

  if (!v19)
  {
    __int128 v1178 = 0LL;
    __int128 v1179 = 0LL;
    __int128 v1175 = 0LL;
    obuint64_t j = 0LL;
    BOOL v713 = 0;
    goto LABEL_359;
  }

  context = (void *)MEMORY[0x186E3AE7C]();
  uint64_t v24 = (void *)objc_msgSend_mutableCopy(v1173, v20, v21, v22, v23);
  objc_msgSend_array(MEMORY[0x189603FA8], v25, v26, v27, v28);
  __int128 v1179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x189603FA8], v29, v30, v31, v32);
  __int128 v1175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_associatedNetwork(self, v33, v34, v35, v36);
  __int128 v1178 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v1264 = 0u;
  __int128 v1265 = 0u;
  __int128 v1262 = 0u;
  __int128 v1263 = 0u;
  obuint64_t j = v24;
  uint64_t v1223 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_( obj,  v43,  (uint64_t)&v1262,  (uint64_t)v1277,  16);
  if (v1223)
  {
    uint64_t v1219 = *(void *)v1263;
    uint64_t v1205 = 138543362LL;
    do
    {
      uint64_t v48 = 0LL;
      do
      {
        if (*(void *)v1263 != v1219) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void **)(*((void *)&v1262 + 1) + 8LL * (void)v48);
        if ((objc_msgSend_isIBSS(v49, v44, v45, v46, v47, v1168, v1170) & 1) == 0)
        {
          objc_msgSend_scanRecord(v49, v44, v45, v46, v47);
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v50, v51, (uint64_t)@"APPLE_P2P_IE", v52, v53);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v55 = v54 == 0LL;

          if (v55 && (objc_msgSend_isFILSDiscoveryFrame(v49, v44, v45, v46, v47) & 1) == 0)
          {
            if (objc_msgSend_isAssociationDisallowed(v49, v44, v45, v46, v47))
            {
              CWFGetOSLog();
              uint64_t v431 = (void *)objc_claimAutoreleasedReturnValue();
              if (v431)
              {
                CWFGetOSLog();
                id v79 = (id)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v79 = (id)MEMORY[0x1895F8DA0];
                id v432 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_DEFAULT))
              {
                int v1268 = 138543362;
                *(void *)uint64_t v1269 = v49;
                LODWORD(v1170) = 12;
                __int128 v1168 = &v1268;
                _os_log_send_and_compose_impl();
              }

              goto LABEL_114;
            }

            uint64_t v60 = (void *)NSString;
            uint64_t v61 = objc_msgSend_shortSSID(v49, v56, v57, v58, v59);
            objc_msgSend_BSSID(v49, v62, v63, v64, v65);
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_channel(v49, v67, v68, v69, v70);
            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v1170 = v66;
            objc_msgSend_channel(v71, v72, v73, v74, v75);
            __int128 v1168 = (int *)v61;
            objc_msgSend_stringWithFormat_(v60, v76, (uint64_t)@"%lu/%@/%lu", v77, v78);
            id v79 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectForKeyedSubscript_(self->_followup6GHzRNRMap, v80, (uint64_t)v79, v81, v82);
            uint64_t v1225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_channel(v49, v83, v84, v85, v86);
            uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_is6GHz(v87, v88, v89, v90, v91)
              || (objc_msgSend_include6GHzChannels(v1191, v92, v93, v94, v95) & 1) != 0)
            {

              goto LABEL_17;
            }

            if (!v1225)
            {

              goto LABEL_34;
            }

            objc_msgSend_channel(v1225, v96, v97, v98, v99);
            uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();
            int v144 = objc_msgSend_is6GHz(v139, v140, v141, v142, v143);

            if (v144)
            {
LABEL_34:
              CWFGetOSLog();
              uint64_t v207 = (void *)objc_claimAutoreleasedReturnValue();
              if (v207)
              {
                CWFGetOSLog();
                id v156 = (id)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v156 = (id)MEMORY[0x1895F8DA0];
                id v208 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled((os_log_t)v156, OS_LOG_TYPE_DEFAULT))
              {
                int v1268 = 138543362;
                *(void *)uint64_t v1269 = v49;
                LODWORD(v1170) = 12;
                __int128 v1168 = &v1268;
                goto LABEL_60;
              }

              goto LABEL_112;
            }

- (BOOL)__isAutoJoinCancelled:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  BOOL cancelled = v4->_cancelled;
  uint64_t v6 = v4->_underlyingCancelError;
  objc_sync_exit(v4);

  if (cancelled)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v7, v8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v11,  v12,  (uint64_t)@"Auto-join has been cancelled",  *MEMORY[0x1896075E0],  v13);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v14, (uint64_t)v6, *MEMORY[0x189607798], v15);
    uint64_t v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = *MEMORY[0x189607688];
    uint64_t v22 = (void *)objc_msgSend_copy(v11, v18, v19, v20, v21);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v23, v17, 89, (uint64_t)v22);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWasCancelled_(v4->_metric, v25, 1, v26, v27);
    if (a3 && v24)
    {
      id v24 = v24;
      *a3 = v24;
    }
  }

  else
  {
    id v24 = 0LL;
  }

  return cancelled;
}

- (BOOL)__isAutoJoinRequeued
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL requeued = v2->_requeued;
  objc_sync_exit(v2);

  return requeued;
}

- (BOOL)__allowOpportunisticNetworkTransitionWithTrigger:(int64_t)a3
{
  char v4 = _os_feature_enabled_impl();
  unint64_t v5 = (0x30C00110100000uLL >> a3) & 1;
  if ((v4 & 1) != 0) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)__allowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  int isAutoJoinRequeued = objc_msgSend___isAutoJoinRequeued(self, a2, a3, (uint64_t)a4, v4);
  if ((isAutoJoinRequeued & 1) != 0)
  {
    id v17 = 0LL;
    int v35 = 0;
  }

  else
  {
    id v48 = 0LL;
    char isAutoJoinCancelled = objc_msgSend___isAutoJoinCancelled_(self, v8, (uint64_t)&v48, v9, v10);
    id v17 = v48;
    if ((isAutoJoinCancelled & 1) != 0)
    {
      int v35 = 1;
    }

    else
    {
      objc_msgSend_allowAutoJoinHandler(self, v13, v14, v15, v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18) {
        goto LABEL_6;
      }
      id v47 = 0LL;
      char v21 = objc_msgSend___calloutToAllowAutoJoinWithTrigger_error_(self, v19, a3, (uint64_t)&v47, v20);
      id v22 = v47;
      uint64_t v27 = v22;
      if ((v21 & 1) != 0)
      {

LABEL_6:
        BOOL v28 = 1;
        if (!a4) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }

      objc_msgSend_dictionary(MEMORY[0x189603FC8], v23, v24, v25, v26);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v29,  v30,  (uint64_t)@"Auto-join is not allowed",  *MEMORY[0x1896075E0],  v31);
      if (v27) {
        objc_msgSend_setObject_forKeyedSubscript_(v29, v32, (uint64_t)v27, *MEMORY[0x189607798], v33);
      }
      uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v32, *MEMORY[0x189607688], 1, (uint64_t)v29);

      int v35 = 0;
      id v17 = (id)v34;
    }
  }

  CWFGetOSLog();
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    CWFGetOSLog();
    __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int16 v37 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v38 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend___descriptionForError_(self, v39, (uint64_t)v17, v40, v41);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    int v49 = 67109634;
    int v50 = isAutoJoinRequeued;
    __int16 v51 = 1024;
    int v52 = v35;
    __int16 v53 = 2114;
    uint64_t v54 = v42;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_setWasAborted_(self->_metric, v43, 1, v44, v45);
  BOOL v28 = 0;
  if (a4)
  {
LABEL_17:
    if (v17) {
      *a4 = v17;
    }
  }

- (BOOL)__shouldBypassUnusedNetworkPeriodCheckForTrigger:(int64_t)a3 knownNetwork:(id)a4
{
  return 1;
}

- (BOOL)__shouldBypassLockdownModeCheckForTrigger:(int64_t)a3 targetNetworkSSID:(id)a4 networkSSID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = v8;
  if (a3 == 7)
  {
    if (v7 == v8)
    {
      char isEqual = 1;
    }

    else
    {
      char isEqual = 0;
      if (v7 && v8) {
        char isEqual = objc_msgSend_isEqual_(v7, v9, (uint64_t)v8, v10, v11);
      }
    }
  }

  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)__isDeferrableKnownNetwork:(id)a3
{
  id v3 = a3;
  BOOL v12 = (objc_msgSend_isCarPlay(v3, v4, v5, v6, v7) & 1) == 0
     && ((objc_msgSend_isHotspot(v3, v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend_isPersonalHotspot(v3, v13, v14, v15, v16) & 1) != 0
      || objc_msgSend_addReason(v3, v17, v18, v19, v20) == 10
      || (objc_msgSend_isOpen(v3, v21, v22, v23, v24) & 1) != 0
      || (objc_msgSend_isOWE(v3, v25, v26, v27, v28) & 1) != 0
      || (objc_msgSend_isWAPI(v3, v29, v30, v31, v32) & 1) != 0
      || objc_msgSend_isPSK(v3, v33, v34, v35, v36)
      && ((objc_msgSend_isWEP(v3, v37, v38, v39, v40) & 1) != 0
       || objc_msgSend_isWPA(v3, v41, v42, v43, v44)));

  return v12;
}

- (BOOL)__does6GHzChannelOverlapWithUWB:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_is6GHz(v3, v4, v5, v6, v7)) {
    BOOL v16 = (unint64_t)objc_msgSend_channel(v3, v8, v9, v10, v11) > 0x5E
  }
       || (unint64_t)objc_msgSend_channel(v3, v12, v13, v14, v15) < 0xEA;
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)__isDeferrableJoinCandidate:(id)a3
{
  id v4 = a3;
  objc_msgSend_matchingKnownNetworkProfile(v4, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isCarPlay(v9, v10, v11, v12, v13))
  {
    char hasWEP40Cipher = 0;
  }

  else
  {
    objc_msgSend_matchingKnownNetworkProfile(v4, v14, v15, v16, v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend___isDeferrableKnownNetwork_(self, v20, (uint64_t)v19, v21, v22) & 1) != 0
      || (objc_msgSend_isHotspot(v4, v23, v24, v25, v26) & 1) != 0
      || (objc_msgSend_isPersonalHotspot(v4, v27, v28, v29, v30) & 1) != 0
      || (objc_msgSend_isOpen(v4, v31, v32, v33, v34) & 1) != 0
      || (objc_msgSend_isOWE(v4, v35, v36, v37, v38) & 1) != 0
      || objc_msgSend_isPSK(v4, v39, v40, v41, v42)
      && ((objc_msgSend_isWEP(v4, v43, v44, v45, v46) & 1) != 0 || (objc_msgSend_isWPA(v4, v47, v48, v49, v50) & 1) != 0)
      || (objc_msgSend_hasTKIPCipher(v4, v43, v44, v45, v46) & 1) != 0
      || (objc_msgSend_hasWEP104Cipher(v4, v51, v52, v53, v54) & 1) != 0)
    {
      char hasWEP40Cipher = 1;
    }

    else
    {
      char hasWEP40Cipher = objc_msgSend_hasWEP40Cipher(v4, v55, v56, v57, v58);
    }
  }

  return hasWEP40Cipher;
}

- (BOOL)__allowKnownNetwork:(id)a3 context:(id)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 targetQueue:(id)a7 error:(id *)a8
{
  uint64_t v290 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v275 = v13;
  id v276 = a7;
  unsigned __int8 v283 = 0;
  objc_msgSend_autoJoinParameters(v13, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_trigger(v19, v20, v21, v22, v23);

  uint64_t v25 = self;
  objc_sync_enter(v25);
  knownNetworkAllowCache = v25->_knownNetworkAllowCache;
  objc_msgSend_identifier(v12, v27, v28, v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowCache, v32, (uint64_t)v31, v33, v34);
  uint64_t v279 = (void *)objc_claimAutoreleasedReturnValue();

  knownNetworkDeferCache = v25->_knownNetworkDeferCache;
  objc_msgSend_identifier(v12, v36, v37, v38, v39);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(knownNetworkDeferCache, v41, (uint64_t)v40, v42, v43);
  uint64_t v277 = (void *)objc_claimAutoreleasedReturnValue();

  knownNetworkAllowErrorCache = v25->_knownNetworkAllowErrorCache;
  objc_msgSend_identifier(v12, v45, v46, v47, v48);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowErrorCache, v50, (uint64_t)v49, v51, v52);
  uint64_t v278 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v25);
  if (objc_msgSend_isAutoJoinDisabled(v12, v53, v54, v55, v56))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v57, v58, v59, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v61,  v62,  (uint64_t)@"Known network profile is disabled",  *MEMORY[0x1896075E0],  v63);
    uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v64, *MEMORY[0x189607688], 1, (uint64_t)v61);
LABEL_3:
    uint64_t v69 = (void *)v65;
LABEL_4:
    LOBYTE(v70) = 0;
    goto LABEL_5;
  }

  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v57, v24, (uint64_t)v12, v60) & 1) == 0
    && ((objc_msgSend_isCaptive(v12, v74, v75, v76, v77) & 1) != 0
     || objc_msgSend_wasCaptive(v12, v74, v161, v162, v77))
    && ((objc_msgSend_isOpen(v12, v74, v161, v162, v77) & 1) != 0
     || objc_msgSend_isOWE(v12, v74, v163, v164, v77)))
  {
    objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v74, v163, v164, v77);
    uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (v167)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v74, v165, v166, v77);
      double v169 = v168;
      objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v170, v171, v172, v173);
      uint64_t v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v174, v175, v176, v177, v178);
      double v180 = v169 - v179;

      if (v180 > 1209600.0)
      {
        objc_msgSend_dictionary(MEMORY[0x189603FC8], v74, v181, v182, v77);
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_( NSString,  v183,  (uint64_t)@"Captive known network profile unused for %d weeks",  v184,  v185,  2);
        uint64_t v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v187, (uint64_t)v186, *MEMORY[0x1896075E0], v188);

        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v189, *MEMORY[0x189607688], 1, (uint64_t)v61);
        goto LABEL_3;
      }
    }
  }

  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v74, v24, (uint64_t)v12, v77) & 1) == 0
    && ((objc_msgSend_isOpen(v12, v78, v79, v80, v81) & 1) != 0
     || objc_msgSend_isOWE(v12, v78, v82, v83, v81)))
  {
    objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v78, v82, v83, v81);
    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v78, v84, v85, v81);
      double v88 = v87;
      objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v89, v90, v91, v92);
      uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v93, v94, v95, v96, v97);
      double v99 = v88 - v98;

      if (v99 > 1209600.0)
      {
        objc_msgSend_dictionary(MEMORY[0x189603FC8], v78, v100, v101, v81);
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_( NSString,  v102,  (uint64_t)@"Open known network profile unused for %d weeks",  v103,  v104,  2);
        uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v106, (uint64_t)v105, *MEMORY[0x1896075E0], v107);

        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v108, *MEMORY[0x189607688], 1, (uint64_t)v61);
        goto LABEL_3;
      }
    }
  }

  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v78, v24, (uint64_t)v12, v81) & 1) == 0)
  {
    objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v111, v112, v113, v114);
    uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v115)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v111, v112, v113, v114);
      double v117 = v116;
      objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v118, v119, v120, v121);
      uint64_t v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v122, v123, v124, v125, v126);
      double v128 = v117 - v127;

      if (v128 > 43545600.0)
      {
        objc_msgSend_dictionary(MEMORY[0x189603FC8], v111, v112, v113, v114);
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_( NSString,  v129,  (uint64_t)@"Known network profile unused for %d weeks",  v130,  v131,  72);
        uint64_t v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v133, (uint64_t)v132, *MEMORY[0x1896075E0], v134);

        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v135, *MEMORY[0x189607688], 1, (uint64_t)v61);
        goto LABEL_3;
      }
    }
  }

  if (!v14 && v279)
  {
    char v136 = objc_msgSend_BOOLValue(v279, v111, v112, v113, v114);
    unsigned __int8 v283 = objc_msgSend_BOOLValue(v277, v137, v138, v139, v140);
    if ((v136 & 1) == 0)
    {
      objc_msgSend_userInfo(v278, v66, v141, v67, v68);
      uint64_t v142 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v61 = (void *)objc_msgSend_mutableCopy(v142, v143, v144, v145, v146);

      objc_msgSend_setObject_forKeyedSubscript_( v61,  v147,  (uint64_t)@"Known network profile is not allowed by daemon (cached)",  *MEMORY[0x1896075E0],  v148);
      uint64_t v149 = (void *)MEMORY[0x189607870];
      objc_msgSend_domain(v278, v150, v151, v152, v153);
      uint64_t v154 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v159 = objc_msgSend_code(v278, v155, v156, v157, v158);
      objc_msgSend_errorWithDomain_code_userInfo_(v149, v160, (uint64_t)v154, v159, (uint64_t)v61);
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }

    goto LABEL_54;
  }

  objc_msgSend_allowKnownNetworkHandler(v25, v111, v112, v113, v114);
  uint64_t v222 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v222)
  {
LABEL_54:
    uint64_t v61 = 0LL;
    uint64_t v69 = 0LL;
    LOBYTE(v70) = 1;
    goto LABEL_5;
  }

  id v282 = 0LL;
  uint64_t v70 = objc_msgSend___calloutToAllowKnownNetwork_trigger_allowForSeamlessSSIDTransition_defer_queue_error_( v25,  v66,  (uint64_t)v12,  v24,  (uint64_t)v14,  &v283,  v276,  &v282);
  id v274 = v282;
  if ((v70 & 1) != 0)
  {
    uint64_t v61 = 0LL;
    uint64_t v69 = 0LL;
    if (!v14) {
      goto LABEL_56;
    }
  }

  else
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v223, v224, v225, v226);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v61,  v227,  (uint64_t)@"Known network profile is not allowed by daemon",  *MEMORY[0x1896075E0],  v228);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v229, (uint64_t)v274, *MEMORY[0x189607798], v230);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v231, *MEMORY[0x189607688], 1, (uint64_t)v61);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_56:
      uint64_t v232 = v25;
      objc_sync_enter(v232);
      objc_msgSend_numberWithBool_(MEMORY[0x189607968], v233, v70, v234, v235);
      uint64_t v236 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v237 = v25->_knownNetworkAllowCache;
      objc_msgSend_identifier(v12, v238, v239, v240, v241);
      uint64_t v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v237, v243, (uint64_t)v236, (uint64_t)v242, v244);

      uint64_t v245 = v25->_knownNetworkAllowErrorCache;
      objc_msgSend_identifier(v12, v246, v247, v248, v249);
      uint64_t v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v245, v251, (uint64_t)v69, (uint64_t)v250, v252);

      objc_msgSend_numberWithBool_(MEMORY[0x189607968], v253, v283, v254, v255);
      uint64_t v256 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v257 = v25->_knownNetworkDeferCache;
      objc_msgSend_identifier(v12, v258, v259, v260, v261);
      uint64_t v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v257, v263, (uint64_t)v256, (uint64_t)v262, v264);

      updatedAllowCacheKnownNetworks = v232->_updatedAllowCacheKnownNetworks;
      objc_msgSend_identifier(v12, v266, v267, v268, v269);
      uint64_t v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(updatedAllowCacheKnownNetworks, v271, (uint64_t)v270, v272, v273);

      objc_sync_exit(v232);
    }
  }

LABEL_5:
  if ((v70 & 1) != 0)
  {
    objc_msgSend___removeDisallowedKnownNetwork_(v25, v71, (uint64_t)v12, v72, v73);
  }

  else
  {
    CWFGetOSLog();
    uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v109)
    {
      CWFGetOSLog();
      uint64_t v110 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v110 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v190 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_identifier(v12, v191, v192, v193, v194);
      uint64_t v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v195, v196, v197, v198, v199);
      __uint64_t v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___descriptionForError_(v25, v201, (uint64_t)v69, v202, v203);
      uint64_t v204 = (void *)objc_claimAutoreleasedReturnValue();
      int v284 = 138543874;
      uint64_t v285 = v200;
      __int16 v286 = 2114;
      id v287 = v204;
      __int16 v288 = 2114;
      id v289 = v12;
      _os_log_send_and_compose_impl();
    }

    if (!v14) {
      objc_msgSend___addDisallowedKnownNetwork_(v25, v205, (uint64_t)v12, v206, v207);
    }
  }

  if (a6 && v283)
  {
    CWFGetOSLog();
    id v208 = (void *)objc_claimAutoreleasedReturnValue();
    if (v208)
    {
      CWFGetOSLog();
      __uint64_t v209 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __uint64_t v209 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v210 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_identifier(v12, v211, v212, v213, v214);
      uint64_t v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v215, v216, v217, v218, v219);
      uint64_t v220 = (void *)objc_claimAutoreleasedReturnValue();
      int v284 = 138543618;
      uint64_t v285 = v220;
      __int16 v286 = 2114;
      id v287 = v12;
      _os_log_send_and_compose_impl();
    }

    *a6 = v283;
  }

  if (a8 && v69) {
    *a8 = v69;
  }

  return v70;
}

- (BOOL)isKnownNetworkDisallowed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_identifier(v4, v6, v7, v8, v9);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    disallowedKnownNetworks = v5->_disallowedKnownNetworks;
    objc_msgSend_identifier(v4, v10, v11, v12, v13);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = objc_msgSend_containsObject_(disallowedKnownNetworks, v17, (uint64_t)v16, v18, v19);
  }

  else
  {
    char v20 = 0;
  }

  objc_sync_exit(v5);
  return v20;
}

- (void)__removeDisallowedKnownNetwork:(id)a3
{
  id v19 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_identifier(v19, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    disallowedKnownNetworks = v4->_disallowedKnownNetworks;
    objc_msgSend_identifier(v19, v10, v11, v12, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(disallowedKnownNetworks, v16, (uint64_t)v15, v17, v18);
  }

  objc_sync_exit(v4);
}

- (void)__addDisallowedKnownNetwork:(id)a3
{
  id v19 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_identifier(v19, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    disallowedKnownNetworks = v4->_disallowedKnownNetworks;
    objc_msgSend_identifier(v19, v10, v11, v12, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(disallowedKnownNetworks, v16, (uint64_t)v15, v17, v18);
  }

  objc_sync_exit(v4);
}

- (id)__knownNetworksSupportingSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 allowSameSSID:(BOOL)a5 context:(id)a6
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult(v11, v10, a5);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v20)
  {
    uint64_t v25 = v20;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v25; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v18);
        }
        uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_( self,  v21,  v28,  (uint64_t)v12,  (uint64_t)v11,  0,  self->_targetQueue,  0)) {
          objc_msgSend_addObject_(v17, v21, v28, v29, v30);
        }
      }

      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, (uint64_t)v37, 16);
    }

    while (v25);
  }

  uint64_t v31 = (void *)objc_msgSend_copy(v17, v21, v22, v23, v24);

  return v31;
}

- (BOOL)__candidateSupportsSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (CWFScanResultSupportsSeamlessSSIDTransition(v9, v8))
  {
    objc_msgSend_matchingKnownNetworkProfile(v8, v11, v12, v13, v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v17 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_( self,  v16,  (uint64_t)v15,  (uint64_t)v10,  (uint64_t)v9,  0,  self->_targetQueue,  0);
  }

  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)__performGASQueryWithScanResults:(id)a3 ANQPElementIDList:(id)a4 maxCacheAge:(unint64_t)a5 cacheOnly:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v223 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  CWFGetOSLog();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CWFGetOSLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v15 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v212 = 67109376;
    *(_DWORD *)uint64_t v213 = v7;
    *(_WORD *)&v213[4] = 2048;
    *(void *)&v213[6] = a5;
    LODWORD(v191) = 18;
    id v190 = &v212;
    _os_log_send_and_compose_impl();
  }

  BOOL v193 = v7;
  unint64_t v198 = a5;

  objc_msgSend_array(MEMORY[0x189603FA8], v16, v17, v18, v19);
  __uint64_t v200 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v207 = 0u;
  __int128 v208 = 0u;
  __int128 v209 = 0u;
  __int128 v210 = 0u;
  obuint64_t j = v11;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v207, (uint64_t)v222, 16);
  if (v21)
  {
    uint64_t v26 = v21;
    uint64_t v27 = *(void *)v208;
    do
    {
      for (uint64_t i = 0LL; i != v26; ++i)
      {
        if (*(void *)v208 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v207 + 1) + 8 * i);
        uint64_t v30 = (void *)NSString;
        objc_msgSend_networkName(v29, v22, v23, v24, v25, v190, v191);
        uint64_t v31 = (int *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_BSSID(v29, v32, v33, v34, v35);
        id v190 = v31;
        uint64_t v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v30, v36, (uint64_t)@"'%@'/%@", v37, v38);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v200, v40, (uint64_t)v39, v41, v42);
      }

      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v207, (uint64_t)v222, 16);
    }

    while (v26);
  }

  CWFGetOSLog();
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    CWFGetOSLog();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v44 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v45 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = objc_msgSend_count(obj, v46, v47, v48, v49);
    objc_msgSend_componentsJoinedByString_(v200, v51, (uint64_t)@", ", v52, v53);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    int v212 = 134218242;
    *(void *)uint64_t v213 = v50;
    *(_WORD *)&v213[8] = 2114;
    *(void *)&v213[10] = v54;
    LODWORD(v191) = 22;
    id v190 = &v212;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    CWFGetOSLog();
    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v56 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v57 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = objc_msgSend_count(v12, v58, v59, v60, v61);
    objc_msgSend_componentsJoinedByString_(v12, v63, (uint64_t)@", ", v64, v65);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
    int v212 = 134218242;
    *(void *)uint64_t v213 = v62;
    *(_WORD *)&v213[8] = 2114;
    *(void *)&v213[10] = v66;
    LODWORD(v191) = 22;
    id v190 = &v212;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v67 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_performGASQueryHandler(self, v68, v69, v70, v71);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v196 = v12;
  if (v72)
  {
    uint64_t v77 = objc_alloc_init(&OBJC_CLASS___CWFANQPParameters);
    objc_msgSend_setScanResults_(v77, v78, (uint64_t)obj, v79, v80);
    objc_msgSend_setANQPElementIDList_(v77, v81, (uint64_t)v12, v82, v83);
    objc_msgSend_setAcceptableCacheAge_(v77, v84, v198, v85, v86);
    id v205 = 0LL;
    id v206 = 0LL;
    objc_msgSend___calloutToPerformGASQueryWithParameters_GASQueryNetworks_error_( self,  v87,  (uint64_t)v77,  (uint64_t)&v206,  (uint64_t)&v205);
    double v88 = (void *)objc_claimAutoreleasedReturnValue();
    id v89 = v206;
    id v94 = v205;
    if (v88)
    {
      if (objc_msgSend_count(v89, v90, v91, v92, v93))
      {
        objc_msgSend_GASQueryNetworks(self->_metric, v95, v96, v97, v98);
        uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
        metric = self->_metric;
        if (v103)
        {
          objc_msgSend_GASQueryNetworks(metric, v99, v100, v101, v102);
          uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayByAddingObjectsFromArray_(v105, v106, (uint64_t)v89, v107, v108);
          id v109 = v89;
          uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setGASQueryNetworks_(self->_metric, v111, (uint64_t)v110, v112, v113);

          id v89 = v109;
        }

        else
        {
          objc_msgSend_setGASQueryNetworks_(metric, v99, (uint64_t)v89, v101, v102);
        }
      }

      id v125 = v88;
      uint64_t v192 = 0LL;
      uint64_t v118 = 0LL;
    }

    else
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v90, v91, v92, v93);
      uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v119,  v120,  (uint64_t)@"Failed to perform GAS/ANQP",  *MEMORY[0x1896075E0],  v121);
      objc_msgSend_setObject_forKeyedSubscript_(v119, v122, (uint64_t)v94, *MEMORY[0x189607798], v123);
      uint64_t v192 = v119;
      uint64_t v118 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v124, *MEMORY[0x189607688], 2, (uint64_t)v119);
    }
  }

  else
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v73, v74, v75, v76);
    uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v114,  v115,  (uint64_t)@"CWFAutoJoinManager.performGASQueryHandler() not configured",  *MEMORY[0x1896075E0],  v116);
    uint64_t v192 = v114;
    uint64_t v118 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v117, *MEMORY[0x189607688], 6, (uint64_t)v114);
    id v89 = 0LL;
    double v88 = 0LL;
  }

  __uint64_t v126 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v67;
  uint64_t v131 = objc_msgSend_GASQueryDuration(self->_metric, v127, v128, v129, v130);
  objc_msgSend_setGASQueryDuration_(self->_metric, v132, v131 + v126 / 0xF4240, v133, v134);
  if (v118)
  {
    objc_msgSend_GASQueryErrors(self->_metric, v135, v136, v137, v138);
    uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v143)
    {
      objc_msgSend_GASQueryErrors(self->_metric, v139, v140, v141, v142);
      uint64_t v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v144, v145, v118, v146, v147);
      uint64_t v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGASQueryErrors_(self->_metric, v149, (uint64_t)v148, v150, v151);
    }

    else
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v139, v118, v141, v142);
      uint64_t v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGASQueryErrors_(self->_metric, v152, (uint64_t)v144, v153, v154);
    }
  }

  CWFGetOSLog();
  uint64_t v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    CWFGetOSLog();
    uint64_t v156 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v156 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v157 = MEMORY[0x1895F8DA0];
  }

  id v197 = (id)v118;

  if (os_log_type_enabled(v156, (os_log_type_t)(16 * (v88 == 0LL))))
  {
    if (v88) {
      uint64_t v161 = "SUCCEEDED";
    }
    else {
      uint64_t v161 = "FAILED";
    }
    objc_msgSend___descriptionForError_(self, v158, v118, v159, v160, v190, v191);
    uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v167 = objc_msgSend_count(v89, v163, v164, v165, v166);
    int v212 = 136447490;
    *(void *)uint64_t v213 = v161;
    *(_WORD *)&v213[8] = 2048;
    *(void *)&v213[10] = v126 / 0xF4240;
    __int16 v214 = 2114;
    uint64_t v215 = v162;
    __int16 v216 = 2048;
    uint64_t v217 = v167;
    __int16 v218 = 1024;
    BOOL v219 = v193;
    __int16 v220 = 2048;
    unint64_t v221 = v198;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  double v168 = (void *)objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    CWFGetOSLog();
    double v169 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    double v169 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v170 = MEMORY[0x1895F8DA0];
  }

  uint64_t v194 = v89;

  if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v175 = objc_msgSend_count(v88, v171, v172, v173, v174);
    int v212 = 134217984;
    *(void *)uint64_t v213 = v175;
    _os_log_send_and_compose_impl();
  }

  __int128 v203 = 0u;
  __int128 v204 = 0u;
  __int128 v201 = 0u;
  __int128 v202 = 0u;
  id v176 = v88;
  uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v177, (uint64_t)&v201, (uint64_t)v211, 16);
  if (v178)
  {
    uint64_t v179 = v178;
    uint64_t v180 = *(void *)v202;
    uint64_t v181 = (void *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t j = 0LL; j != v179; ++j)
      {
        if (*(void *)v202 != v180) {
          objc_enumerationMutation(v176);
        }
        uint64_t v183 = *(void *)(*((void *)&v201 + 1) + 8 * j);
        CWFGetOSLog();
        uint64_t v184 = (void *)objc_claimAutoreleasedReturnValue();
        if (v184)
        {
          CWFGetOSLog();
          uint64_t v185 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v186 = v181;
          uint64_t v185 = (os_log_s *)v181;
        }

        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          int v212 = 138543362;
          *(void *)uint64_t v213 = v183;
          _os_log_send_and_compose_impl();
        }
      }

      uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v187, (uint64_t)&v201, (uint64_t)v211, 16);
    }

    while (v179);
  }

  if (a7 && v197) {
    *a7 = v197;
  }
  id v188 = v176;

  return v188;
}

- (id)__performScanWithChannelList:(id)a3 SSIDList:(id)a4 passive:(BOOL)a5 dwellTime:(unint64_t)a6 maxCacheAge:(unint64_t)a7 cacheOnly:(BOOL)a8 isPreAssociationScan:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a8;
  BOOL v12 = a5;
  uint64_t v279 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  CWFGetOSLog();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    CWFGetOSLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v18 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v19 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v266 = 134218496;
    unint64_t v267 = a6;
    __int16 v268 = 1024;
    *(_DWORD *)uint64_t v269 = v10;
    *(_WORD *)&v269[4] = 2048;
    *(void *)&v269[6] = a7;
    LODWORD(v244) = 28;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    CWFGetOSLog();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v21 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v22 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_msgSend_count(v15, v23, v24, v25, v26);
    objc_msgSend_componentsJoinedByString_(v15, v28, (uint64_t)@", ", v29, v30);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    int v266 = 134218242;
    unint64_t v267 = v27;
    __int16 v268 = 2114;
    *(void *)uint64_t v269 = v31;
    LODWORD(v244) = 22;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    CWFGetOSLog();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v33 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v34 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = objc_msgSend_count(v16, v35, v36, v37, v38);
    objc_msgSend_componentsJoinedByString_(v16, v40, (uint64_t)@", ", v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    int v266 = 134218242;
    unint64_t v267 = v39;
    __int16 v268 = 2114;
    *(void *)uint64_t v269 = v43;
    LODWORD(v244) = 22;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v44 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_scanForNetworksHandler(self, v45, v46, v47, v48);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v249 = v16;
  uint64_t v250 = v15;
  if (v49)
  {
    uint64_t v54 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
    objc_msgSend_setBSSType_(v54, v55, 3, v56, v57);
    objc_msgSend_setPHYMode_(v54, v58, 1, v59, v60);
    objc_msgSend_setNumberOfScans_(v54, v61, 1, v62, v63);
    objc_msgSend_setIncludeHiddenNetworks_(v54, v64, 1, v65, v66);
    objc_msgSend_setChannels_(v54, v67, (uint64_t)v15, v68, v69);
    objc_msgSend_setSSIDList_(v54, v70, (uint64_t)v16, v71, v72);
    objc_msgSend_setDwellTime_(v54, v73, a6, v74, v75);
    objc_msgSend_setScanFlags_(v54, v76, 2592, v77, v78);
    if (v10)
    {
      objc_msgSend_setScanType_(v54, v79, 3, v80, v81);
      objc_msgSend_setMaximumAge_(v54, v82, a7, v83, v84);
    }

    else
    {
      if (v12) {
        objc_msgSend_setScanType_(v54, v79, 2, v80, v81, v243, v244);
      }
      else {
        objc_msgSend_setScanType_(v54, v79, 1, v80, v81, v243, v244);
      }
      objc_msgSend_setAcceptableCacheAge_(v54, v93, a7, v94, v95);
    }

    id v263 = 0LL;
    id v264 = 0LL;
    objc_msgSend___calloutToScanForNetworksWithParameters_scanChannels_error_( self,  v85,  (uint64_t)v54,  (uint64_t)&v264,  (uint64_t)&v263,  v243,  v244);
    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
    id v91 = v264;
    id v100 = v263;
    if (v92)
    {
      if (objc_msgSend_count(v91, v96, v97, v98, v99))
      {
        metric = self->_metric;
        if (a9) {
          objc_msgSend_preAssociationScanChannels(metric, v101, v102, v103, v104);
        }
        else {
          objc_msgSend_scanChannels(metric, v101, v102, v103, v104);
        }
        uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v252 = v91;
        BOOL v246 = v10;
        __uint64_t v245 = v44;
        uint64_t v248 = v106;
        if (v106)
        {
          uint64_t v118 = objc_msgSend_mutableCopy(v106, v107, v108, v109, v110);
        }

        else
        {
          uint64_t v118 = objc_msgSend_array(MEMORY[0x189603FA8], v107, v108, v109, v110);
        }

        uint64_t v119 = (void *)v118;
        __int128 v261 = 0u;
        __int128 v262 = 0u;
        __int128 v259 = 0u;
        __int128 v260 = 0u;
        id v120 = v252;
        uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v121, (uint64_t)&v259, (uint64_t)v278, 16);
        if (v122)
        {
          uint64_t v126 = v122;
          uint64_t v127 = *(void *)v260;
          do
          {
            for (uint64_t i = 0LL; i != v126; ++i)
            {
              if (*(void *)v260 != v127) {
                objc_enumerationMutation(v120);
              }
              objc_msgSend___basicChannelRepresentation_( self,  v123,  *(void *)(*((void *)&v259 + 1) + 8 * i),  v124,  v125);
              uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v119, v130, (uint64_t)v129, v131, v132);
            }

            uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_( v120,  v123,  (uint64_t)&v259,  (uint64_t)v278,  16);
          }

          while (v126);
        }

        uint64_t v136 = self->_metric;
        if (a9) {
          objc_msgSend_setPreAssociationScanChannels_(v136, v133, (uint64_t)v119, v134, v135);
        }
        else {
          objc_msgSend_setScanChannels_(v136, v133, (uint64_t)v119, v134, v135);
        }
        BOOL v10 = v246;
        __uint64_t v44 = v245;

        id v91 = v252;
      }

      id v137 = v92;
      uint64_t v247 = 0LL;
      uint64_t v117 = 0LL;
    }

    else
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v96, v97, v98, v99);
      uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v111,  v112,  (uint64_t)@"Failed to perform scan",  *MEMORY[0x1896075E0],  v113);
      objc_msgSend_setObject_forKeyedSubscript_(v111, v114, (uint64_t)v100, *MEMORY[0x189607798], v115);
      uint64_t v247 = v111;
      uint64_t v117 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v116, *MEMORY[0x189607688], 2, (uint64_t)v111);
    }

    uint64_t v90 = v117;
  }

  else
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v50, v51, v52, v53);
    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v86,  v87,  (uint64_t)@"CWFAutoJoinManager.scanForNetworksHandler() not configured",  *MEMORY[0x1896075E0],  v88);
    uint64_t v247 = v86;
    uint64_t v90 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v89, *MEMORY[0x189607688], 6, (uint64_t)v86);
    id v91 = 0LL;
    uint64_t v92 = 0LL;
  }

  __uint64_t v142 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v44) / 0xF4240;
  uint64_t v143 = self->_metric;
  if (a9)
  {
    uint64_t v144 = objc_msgSend_preAssociationScanDuration(v143, v138, v139, v140, v141);
    objc_msgSend_setPreAssociationScanDuration_(self->_metric, v145, v144 + v142, v146, v147);
    if (!v90) {
      goto LABEL_54;
    }
  }

  else
  {
    uint64_t v152 = objc_msgSend_scanDuration(v143, v138, v139, v140, v141);
    objc_msgSend_setScanDuration_(self->_metric, v153, v152 + v142, v154, v155);
    if (!v90) {
      goto LABEL_54;
    }
  }

  objc_msgSend_scanErrors(self->_metric, v148, v149, v150, v151, v243, v244);
  uint64_t v160 = (void *)objc_claimAutoreleasedReturnValue();
  if (v160)
  {
    objc_msgSend_scanErrors(self->_metric, v156, v157, v158, v159);
    uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObject_(v161, v162, v90, v163, v164);
    uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScanErrors_(self->_metric, v166, (uint64_t)v165, v167, v168);
  }

  else
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v156, v90, v158, v159);
    uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScanErrors_(self->_metric, v169, (uint64_t)v161, v170, v171);
  }

LABEL_54:
  CWFGetOSLog();
  uint64_t v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    CWFGetOSLog();
    uint64_t v173 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v173 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v174 = MEMORY[0x1895F8DA0];
  }

  id v251 = (id)v90;
  if (os_log_type_enabled(v173, (os_log_type_t)(16 * (v92 == 0LL))))
  {
    if (v92) {
      uint64_t v179 = "SUCCEEDED";
    }
    else {
      uint64_t v179 = "FAILED";
    }
    uint64_t v180 = objc_msgSend_count(v92, v175, v176, v177, v178, v243, v244);
    objc_msgSend___descriptionForError_(self, v181, v90, v182, v183);
    uint64_t v184 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v189 = objc_msgSend_count(v91, v185, v186, v187, v188);
    int v266 = 136447746;
    unint64_t v267 = (unint64_t)v179;
    __int16 v268 = 2048;
    *(void *)uint64_t v269 = v142;
    *(_WORD *)&v269[8] = 2048;
    *(void *)&v269[10] = v180;
    __int16 v270 = 2114;
    uint64_t v271 = v184;
    __int16 v272 = 2048;
    uint64_t v273 = v189;
    __int16 v274 = 1024;
    BOOL v275 = v10;
    __int16 v276 = 2048;
    unint64_t v277 = a7;
    LODWORD(v244) = 68;
    uint64_t v243 = &v266;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  id v190 = (void *)objc_claimAutoreleasedReturnValue();
  if (v190)
  {
    CWFGetOSLog();
    uint64_t v191 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v191 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v192 = MEMORY[0x1895F8DA0];
  }

  uint64_t v253 = v91;

  if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      id v197 = " Cache";
    }
    else {
      id v197 = "";
    }
    uint64_t v198 = objc_msgSend_count(v92, v193, v194, v195, v196, v243, v244);
    int v266 = 136446466;
    unint64_t v267 = (unint64_t)v197;
    __int16 v268 = 2048;
    *(void *)uint64_t v269 = v198;
    _os_log_send_and_compose_impl();
  }

  __int128 v257 = 0u;
  __int128 v258 = 0u;
  __int128 v255 = 0u;
  __int128 v256 = 0u;
  id v199 = v92;
  uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v255, (uint64_t)v265, 16);
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v256;
    __int128 v204 = (void *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t j = 0LL; j != v202; ++j)
      {
        if (*(void *)v256 != v203) {
          objc_enumerationMutation(v199);
        }
        id v206 = *(void **)(*((void *)&v255 + 1) + 8 * j);
        CWFGetOSLog();
        __int128 v207 = (void *)objc_claimAutoreleasedReturnValue();
        if (v207)
        {
          CWFGetOSLog();
          __int128 v208 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v209 = v204;
          __int128 v208 = (os_log_s *)v204;
        }

        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
        {
          int v266 = 138543362;
          unint64_t v267 = (unint64_t)v206;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_channel(v206, v210, v211, v212, v213);
        __int16 v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___basicChannelRepresentation_(self, v215, (uint64_t)v214, v216, v217);
        __int16 v218 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_scanChannels(self->_metric, v219, v220, v221, v222);
        uint64_t v223 = (void *)objc_claimAutoreleasedReturnValue();
        int v227 = objc_msgSend_containsObject_(v223, v224, (uint64_t)v218, v225, v226);

        if (v227)
        {
          self->_BOOL didDiscoverBSS = 1;
          objc_msgSend_SSID(v206, v228, v229, v230, v231);
          uint64_t v232 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v237 = objc_msgSend_length(v232, v233, v234, v235, v236);

          if (!v237) {
            objc_msgSend_addObject_(self->_hiddenNetworkChannels, v238, (uint64_t)v218, v239, v240);
          }
        }
      }

      uint64_t v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v241, (uint64_t)&v255, (uint64_t)v265, 16);
    }

    while (v202);
  }

  if (a10 && v251) {
    *a10 = v251;
  }

  return v199;
}

- (id)__alreadyFoundFollowup6GHzBSSWithSignature:(id)a3
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  objc_msgSend_allValues(self->_followup6GHzScanResultsMap, v5, v6, v7, v8);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v58, (uint64_t)v63, 16);
  if (v52)
  {
    uint64_t v51 = *(void *)v59;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v10;
        id v11 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        id v12 = v11;
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v54, (uint64_t)v62, 16);
        if (v14)
        {
          uint64_t v19 = v14;
          uint64_t v20 = *(void *)v55;
LABEL_8:
          uint64_t v21 = 0LL;
          while (1)
          {
            if (*(void *)v55 != v20) {
              objc_enumerationMutation(v12);
            }
            id v22 = *(void **)(*((void *)&v54 + 1) + 8 * v21);
            uint64_t v23 = (void *)NSString;
            uint64_t v24 = objc_msgSend_shortSSID(v22, v15, v16, v17, v18);
            objc_msgSend_BSSID(v22, v25, v26, v27, v28);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_channel(v22, v30, v31, v32, v33);
            id v34 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v39 = objc_msgSend_channel(v34, v35, v36, v37, v38);
            objc_msgSend_stringWithFormat_(v23, v40, (uint64_t)@"%lu/%@/%lu", v41, v42, v24, v29, v39);
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v4)
            {
            }

            if (v19 == ++v21)
            {
              uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v54, (uint64_t)v62, 16);
              if (v19) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }

          id v48 = v22;

          if (v48) {
            goto LABEL_21;
          }
        }

        else
        {
LABEL_16:
        }

        uint64_t v10 = v53 + 1;
      }

      while (v53 + 1 != v52);
      uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v58, (uint64_t)v63, 16);
    }

    while (v52);
  }

  id v48 = 0LL;
LABEL_21:

  return v48;
}

- (id)__perform6GHzFollowupDiscoveryWithScanResults:(id)a3 SSIDList:(id)a4 dwellTime:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
  uint64_t v610 = *MEMORY[0x1895F89C0];
  id v526 = a3;
  id v525 = a4;
  id v538 = a6;
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v10, v11, v12, v13);
  uint64_t v547 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x189603FE0], v14, v15, v16, v17);
  uint64_t v560 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_supportedChannels(self, v18, v19, v20, v21);
  __int128 v589 = 0u;
  __int128 v590 = 0u;
  __int128 v591 = 0u;
  __int128 v592 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v589, (uint64_t)v609, 16);
  if (v23)
  {
    uint64_t v27 = v23;
    uint64_t v28 = *(void *)v590;
    do
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v590 != v28) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend___basicChannelRepresentation_(self, v24, *(void *)(*((void *)&v589 + 1) + 8 * i), v25, v26);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v560, v31, (uint64_t)v30, v32, v33);
      }

      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v589, (uint64_t)v609, 16);
    }

    while (v27);
  }

  objc_msgSend_sortedArrayUsingComparator_(v526, v34, (uint64_t)&unk_189E5CA30, v35, v36);
  __int128 v585 = 0u;
  __int128 v586 = 0u;
  __int128 v587 = 0u;
  __int128 v588 = 0u;
  id v528 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v554 = self;
  uint64_t v532 = objc_msgSend_countByEnumeratingWithState_objects_count_(v528, v37, (uint64_t)&v585, (uint64_t)v608, 16);
  if (!v532)
  {
    id v563 = 0LL;
    goto LABEL_121;
  }

  id v563 = 0LL;
  uint64_t v530 = *(void *)v586;
  do
  {
    uint64_t v42 = 0LL;
    do
    {
      if (*(void *)v586 != v530)
      {
        uint64_t v43 = v42;
        objc_enumerationMutation(v528);
        uint64_t v42 = v43;
      }

      uint64_t v533 = v42;
      __uint64_t v44 = *(void **)(*((void *)&v585 + 1) + 8 * v42);
      id v558 = v44;
      if (objc_msgSend_isFILSDiscoveryFrame(v44, v38, v39, v40, v41, v519, v521)
        && (objc_msgSend_channel(v44, v45, v46, v47, v48),
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(),
            int v54 = objc_msgSend_is6GHz(v49, v50, v51, v52, v53),
            v49,
            v54))
      {
        objc_msgSend_channel(v44, v45, v46, v47, v48);
        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___basicChannelRepresentation_(self, v56, (uint64_t)v55, v57, v58);
        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_containsObject_(v560, v60, (uint64_t)v59, v61, v62))
        {
          id v551 = v59;
          objc_msgSend_SSID(v44, v63, v64, v65, v66);
          __uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v72 = objc_msgSend_shortSSID(v44, v68, v69, v70, v71);
          __int128 v581 = 0u;
          __int128 v582 = 0u;
          __int128 v583 = 0u;
          __int128 v584 = 0u;
          objc_msgSend_knownNetworks(v538, v73, v74, v75, v76);
          id v555 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v555, v77, (uint64_t)&v581, (uint64_t)v607, 16);
          if (!v78) {
            goto LABEL_57;
          }
          uint64_t v83 = v78;
          uint64_t v561 = *(void *)v582;
          while (1)
          {
            for (uint64_t j = 0LL; j != v83; ++j)
            {
              if (*(void *)v582 != v561) {
                objc_enumerationMutation(v555);
              }
              uint64_t v85 = *(void **)(*((void *)&v581 + 1) + 8 * j);
              objc_msgSend_SSID(v85, v79, v80, v81, v82);
              uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v91 = objc_msgSend_shortSSID(v85, v87, v88, v89, v90);
              uint64_t v96 = v91;
              if (v86) {
                BOOL v97 = v67 == 0LL;
              }
              else {
                BOOL v97 = 1;
              }
              if (v97)
              {
                if (!v72 || v72 != v91) {
                  goto LABEL_55;
                }
              }

              else
              {
                char isEqual = objc_msgSend_isEqual_(v86, v92, (uint64_t)v67, v94, v95);
                if (v72) {
                  BOOL v99 = v72 == v96;
                }
                else {
                  BOOL v99 = 0;
                }
                char v100 = v99;
                if ((isEqual & 1) == 0 && (v100 & 1) == 0) {
                  goto LABEL_55;
                }
              }

              uint64_t v101 = (void *)NSString;
              objc_msgSend_BSSID(v44, v92, v93, v94, v95);
              uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_channel(v44, v103, v104, v105, v106);
              uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v112 = objc_msgSend_channel(v107, v108, v109, v110, v111);
              objc_msgSend_stringWithFormat_(v101, v113, (uint64_t)@"%lu/%@/%lu", v114, v115, v72, v102, v112);
              uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();

              CWFGetOSLog();
              uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();
              if (v117)
              {
                CWFGetOSLog();
                id v118 = (id)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                id v118 = (id)MEMORY[0x1895F8DA0];
                id v119 = MEMORY[0x1895F8DA0];
              }

              self = v554;

              if (os_log_type_enabled((os_log_t)v118, OS_LOG_TYPE_DEFAULT))
              {
                int v594 = 138543618;
                uint64_t v595 = (uint64_t)v558;
                __int16 v596 = 2114;
                unint64_t v597 = (unint64_t)v85;
                LODWORD(v522) = 22;
                uint64_t v520 = &v594;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_objectForKeyedSubscript_(v554->_followup6GHzFILSDMap, v120, (uint64_t)v116, v121, v122);
              uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v123) {
                objc_msgSend_setObject_forKeyedSubscript_( v554->_followup6GHzFILSDMap,  v124,  (uint64_t)v558,  (uint64_t)v116,  v126);
              }
              objc_msgSend___alreadyFoundFollowup6GHzBSSWithSignature_( v554,  v124,  (uint64_t)v116,  v125,  v126,  v520,  v522);
              uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue();
              if (v127)
              {
                CWFGetOSLog();
                uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
                if (v128)
                {
                  CWFGetOSLog();
                  id v129 = (id)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v129 = (id)MEMORY[0x1895F8DA0];
                  id v180 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled((os_log_t)v129, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v594) = 0;
                  LODWORD(v521) = 2;
                  id v519 = &v594;
                  _os_log_send_and_compose_impl();
                }

                uint64_t v185 = v563;
                if (!v563)
                {
                  objc_msgSend_array(MEMORY[0x189603FA8], v181, v182, v183, v184);
                  uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue();
                }

                id v563 = v185;
                objc_msgSend_addObject_(v185, v181, (uint64_t)v127, v183, v184, v519, v521);
              }

              else
              {
                uint64_t v130 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
                objc_msgSend_networkName(v85, v131, v132, v133, v134);
                uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setSSID_(v130, v136, (uint64_t)v135, v137, v138);

                objc_msgSend_BSSID(v558, v139, v140, v141, v142);
                uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setBSSID_(v130, v144, (uint64_t)v143, v145, v146);

                id v606 = v551;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v147, (uint64_t)&v606, 1, v148);
                uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setChannels_(v130, v150, (uint64_t)v149, v151, v152);

                self = v554;
                objc_msgSend_setBSSType_(v130, v153, 3, v154, v155);
                objc_msgSend_setPHYMode_(v130, v156, 1, v157, v158);
                objc_msgSend_setNumberOfScans_(v130, v159, 1, v160, v161);
                objc_msgSend_setIncludeHiddenNetworks_(v130, v162, 1, v163, v164);
                objc_msgSend_setAcceptableCacheAge_(v130, v165, 0, v166, v167);
                objc_msgSend_setDwellTime_(v130, v168, a5, v169, v170);
                objc_msgSend_setScanFlags_(v130, v171, 1056, v172, v173);
                objc_msgSend_setScanType_(v130, v174, 1, v175, v176);
                objc_msgSend_addObject_(v547, v177, (uint64_t)v130, v178, v179);
              }

              __uint64_t v44 = v558;
LABEL_55:
            }

            uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_( v555,  v79,  (uint64_t)&v581,  (uint64_t)v607,  16);
            if (!v83)
            {
LABEL_57:

              goto LABEL_58;
            }
          }
        }

        CWFGetOSLog();
        uint64_t v312 = (void *)objc_claimAutoreleasedReturnValue();
        if (v312)
        {
          CWFGetOSLog();
          uint64_t v313 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v313 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v314 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
        {
          int v594 = 138543362;
          uint64_t v595 = (uint64_t)v59;
          LODWORD(v521) = 12;
          id v519 = &v594;
          _os_log_send_and_compose_impl();
        }

        uint64_t v187 = v313;
      }

      else
      {
LABEL_58:
        objc_msgSend_RNRBSSList(v44, v45, v46, v47, v48);
        uint64_t v186 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v577 = 0u;
        __int128 v578 = 0u;
        __int128 v579 = 0u;
        __int128 v580 = 0u;
        uint64_t v187 = v186;
        id v540 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_( v187,  v188,  (uint64_t)&v577,  (uint64_t)v605,  16);
        if (v540)
        {
          uint64_t v536 = v187;
          uint64_t v539 = *(void *)v578;
          do
          {
            for (uint64_t k = 0LL; k != v540; uint64_t k = (char *)k + 1)
            {
              if (*(void *)v578 != v539) {
                objc_enumerationMutation(v536);
              }
              uint64_t v194 = *(void **)(*((void *)&v577 + 1) + 8LL * (void)k);
              objc_msgSend_channel(v194, v189, v190, v191, v192, v519, v521);
              uint64_t v195 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_is6GHz(v195, v196, v197, v198, v199))
              {
                uint64_t v208 = objc_msgSend_shortSSID(v194, v200, v201, v202, v203);
                if (v208
                  || objc_msgSend_isSameSSID(v194, v204, v205, v206, v207)
                  && (uint64_t v208 = objc_msgSend_shortSSID(v558, v209, v210, v211, v212)) != 0)
                {
                  objc_msgSend_BSSID(v194, v204, v205, v206, v207);
                  uint64_t v217 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v217)
                  {
                    uint64_t v542 = k;
                    __int128 v575 = 0u;
                    __int128 v576 = 0u;
                    __int128 v573 = 0u;
                    __int128 v574 = 0u;
                    objc_msgSend_knownNetworks(v538, v213, v214, v215, v216);
                    id v552 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v219 = objc_msgSend_countByEnumeratingWithState_objects_count_( v552,  v218,  (uint64_t)&v573,  (uint64_t)v604,  16);
                    if (v219)
                    {
                      uint64_t v224 = v219;
                      id v556 = v194;
                      uint64_t v562 = *(void *)v574;
                      do
                      {
                        uint64_t v225 = 0LL;
                        do
                        {
                          if (*(void *)v574 != v562) {
                            objc_enumerationMutation(v552);
                          }
                          uint64_t v226 = *(void **)(*((void *)&v573 + 1) + 8 * v225);
                          if (v208 == objc_msgSend_shortSSID(v226, v220, v221, v222, v223, v519, v521))
                          {
                            int v227 = (void *)NSString;
                            uint64_t v228 = objc_msgSend_channel(v195, v220, v221, v222, v223);
                            objc_msgSend_stringWithFormat_( v227,  v229,  (uint64_t)@"%lu/%@/%lu",  v230,  v231,  v208,  v217,  v228);
                            uint64_t v232 = (void *)objc_claimAutoreleasedReturnValue();
                            CWFGetOSLog();
                            uint64_t v233 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v233)
                            {
                              CWFGetOSLog();
                              id v234 = (id)objc_claimAutoreleasedReturnValue();
                            }

                            else
                            {
                              id v234 = (id)MEMORY[0x1895F8DA0];
                              id v235 = MEMORY[0x1895F8DA0];
                            }

                            if (os_log_type_enabled((os_log_t)v234, OS_LOG_TYPE_DEFAULT))
                            {
                              int v594 = 138543874;
                              uint64_t v595 = (uint64_t)v558;
                              __int16 v596 = 2114;
                              unint64_t v597 = (unint64_t)v556;
                              __int16 v598 = 2114;
                              uint64_t v599 = (uint64_t)v226;
                              LODWORD(v521) = 32;
                              id v519 = &v594;
                              _os_log_send_and_compose_impl();
                            }

                            objc_msgSend___basicChannelRepresentation_(self, v236, (uint64_t)v195, v237, v238);
                            uint64_t v239 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend_containsObject_(v560, v240, (uint64_t)v239, v241, v242))
                            {
                              objc_msgSend_objectForKeyedSubscript_( self->_followup6GHzRNRMap,  v243,  (uint64_t)v232,  v244,  v245);
                              BOOL v246 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v246) {
                                objc_msgSend_setObject_forKeyedSubscript_( self->_followup6GHzRNRMap,  v247,  (uint64_t)v558,  (uint64_t)v232,  v249);
                              }
                              uint64_t v250 = objc_msgSend___alreadyFoundFollowup6GHzBSSWithSignature_( self,  v247,  (uint64_t)v232,  v248,  v249,  v519,  v521);
                              if (v250)
                              {
                                id v251 = (id)v250;
                                CWFGetOSLog();
                                uint64_t v252 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v252)
                                {
                                  CWFGetOSLog();
                                  id v253 = (id)objc_claimAutoreleasedReturnValue();
                                }

                                else
                                {
                                  id v253 = (id)MEMORY[0x1895F8DA0];
                                  id v303 = MEMORY[0x1895F8DA0];
                                }

                                if (os_log_type_enabled((os_log_t)v253, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(v594) = 0;
                                  LODWORD(v521) = 2;
                                  id v519 = &v594;
                                  _os_log_send_and_compose_impl();
                                }

                                self = v554;
                                uint64_t v308 = v563;
                                if (!v563)
                                {
                                  objc_msgSend_array(MEMORY[0x189603FA8], v304, v305, v306, v307);
                                  uint64_t v308 = (void *)objc_claimAutoreleasedReturnValue();
                                }

                                id v563 = v308;
                                objc_msgSend_addObject_(v308, v304, (uint64_t)v251, v306, v307, v519, v521);
                              }

                              else
                              {
                                uint64_t v254 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
                                objc_msgSend_networkName(v226, v255, v256, v257, v258);
                                __int128 v259 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_setSSID_(v254, v260, (uint64_t)v259, v261, v262);

                                objc_msgSend_setBSSID_(v254, v263, (uint64_t)v217, v264, v265);
                                uint64_t v603 = v239;
                                objc_msgSend_arrayWithObjects_count_( MEMORY[0x189603F18],  v266,  (uint64_t)&v603,  1,  v267);
                                __int16 v268 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_setChannels_(v254, v269, (uint64_t)v268, v270, v271);

                                objc_msgSend_setBSSType_(v254, v272, 3, v273, v274);
                                objc_msgSend_setPHYMode_(v254, v275, 1, v276, v277);
                                objc_msgSend_setNumberOfScans_(v254, v278, 1, v279, v280);
                                objc_msgSend_setIncludeHiddenNetworks_(v254, v281, 1, v282, v283);
                                objc_msgSend_setAcceptableCacheAge_(v254, v284, 0, v285, v286);
                                objc_msgSend_setDwellTime_(v254, v287, a5, v288, v289);
                                else {
                                  objc_msgSend_setScanFlags_(v254, v294, 1056, v295, v296);
                                }
                                objc_msgSend_setScanType_(v254, v297, 1, v298, v299);
                                objc_msgSend_addObject_(v547, v300, (uint64_t)v254, v301, v302);

                                id v251 = 0LL;
                              }
                            }

                            else
                            {
                              CWFGetOSLog();
                              uint64_t v309 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v309)
                              {
                                CWFGetOSLog();
                                id v251 = (id)objc_claimAutoreleasedReturnValue();
                              }

                              else
                              {
                                id v251 = (id)MEMORY[0x1895F8DA0];
                                id v310 = MEMORY[0x1895F8DA0];
                              }

                              if (os_log_type_enabled((os_log_t)v251, OS_LOG_TYPE_DEFAULT))
                              {
                                int v594 = 138543362;
                                uint64_t v595 = (uint64_t)v239;
                                LODWORD(v521) = 12;
                                id v519 = &v594;
                                _os_log_send_and_compose_impl();
                              }
                            }
                          }

                          ++v225;
                        }

                        while (v224 != v225);
                        uint64_t v311 = objc_msgSend_countByEnumeratingWithState_objects_count_( v552,  v220,  (uint64_t)&v573,  (uint64_t)v604,  16);
                        uint64_t v224 = v311;
                      }

                      while (v311);
                    }

                    uint64_t k = v542;
                  }
                }
              }
            }

            id v540 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_( v536,  v189,  (uint64_t)&v577,  (uint64_t)v605,  16);
          }

          while (v540);
          uint64_t v187 = v536;
        }

        __int128 v59 = v187;
      }

      uint64_t v42 = v533 + 1;
    }

    while (v533 + 1 != v532);
    uint64_t v315 = objc_msgSend_countByEnumeratingWithState_objects_count_(v528, v38, (uint64_t)&v585, (uint64_t)v608, 16);
    uint64_t v532 = v315;
  }

  while (v315);
LABEL_121:

  if (objc_msgSend_count(v547, v316, v317, v318, v319))
  {
    objc_msgSend_followup6GHzScanChannels(self->_metric, v320, v321, v322, v323);
    uint64_t v324 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v523 = v324;
    if (v324)
    {
      uint64_t v329 = (void *)objc_msgSend_mutableCopy(v324, v325, v326, v327, v328);
    }

    else
    {
      objc_msgSend_array(MEMORY[0x189603FA8], v325, v326, v327, v328);
      uint64_t v329 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v531 = v329;

    __int128 v571 = 0u;
    __int128 v572 = 0u;
    __int128 v569 = 0u;
    __int128 v570 = 0u;
    id v541 = v547;
    uint64_t v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v541, v331, (uint64_t)&v569, (uint64_t)v602, 16);
    if (v332)
    {
      uint64_t v336 = v332;
      id v537 = 0LL;
      id v559 = 0LL;
      uint64_t v337 = (void *)MEMORY[0x1895F8DA0];
      id v557 = *(id *)v570;
      uint64_t v535 = *MEMORY[0x1896075E0];
      uint64_t v527 = *MEMORY[0x189607798];
      uint64_t v534 = *MEMORY[0x189607688];
      do
      {
        id v338 = 0LL;
        uint64_t v546 = v336;
        do
        {
          if (*(id *)v570 != v557) {
            objc_enumerationMutation(v541);
          }
          uint64_t v339 = *(void **)(*((void *)&v569 + 1) + 8LL * (void)v338);
          objc_msgSend_objectForKeyedSubscript_( v554->_followup6GHzScanResultsMap,  v333,  (uint64_t)v339,  v334,  v335,  v519,  v521);
          id v340 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v341 = CWFGetOSLog();
          uint64_t v342 = (void *)v341;
          if (v340)
          {
            if (v341)
            {
              CWFGetOSLog();
              uint64_t v343 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v345 = v337;
              uint64_t v343 = (os_log_s *)v337;
            }

            if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_SSID(v339, v346, v347, v348, v349);
              uint64_t v350 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v543 = objc_msgSend_shortSSID(v339, v351, v352, v353, v354);
              objc_msgSend_BSSID(v339, v355, v356, v357, v358);
              uint64_t v548 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_redactedForWiFi(v548, v359, v360, v361, v362);
              uint64_t v363 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_channels(v339, v364, v365, v366, v367);
              uint64_t v368 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v368, v369, v370, v371, v372);
              id v373 = v338;
              uint64_t v374 = (void *)objc_claimAutoreleasedReturnValue();
              int v594 = 138544130;
              uint64_t v595 = (uint64_t)v350;
              __int16 v596 = 2048;
              unint64_t v597 = v543;
              __int16 v598 = 2114;
              uint64_t v599 = (uint64_t)v363;
              __int16 v600 = 2114;
              id v601 = v374;
              LODWORD(v521) = 42;
              id v519 = &v594;
              _os_log_send_and_compose_impl();

              id v338 = v373;
              uint64_t v336 = v546;
            }

            uint64_t v379 = v563;
            if (!v563)
            {
              objc_msgSend_array(MEMORY[0x189603FA8], v375, v376, v377, v378);
              uint64_t v379 = (void *)objc_claimAutoreleasedReturnValue();
            }

            id v563 = v379;
            objc_msgSend_addObjectsFromArray_(v379, v375, (uint64_t)v340, v377, v378, v519, v521);
            self = v554;
          }

          else
          {
            if (v341)
            {
              CWFGetOSLog();
              id v344 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v380 = v337;
              id v344 = v337;
            }

            if (os_log_type_enabled((os_log_t)v344, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_SSID(v339, v381, v382, v383, v384);
              uint64_t v385 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v544 = objc_msgSend_shortSSID(v339, v386, v387, v388, v389);
              objc_msgSend_BSSID(v339, v390, v391, v392, v393);
              uint64_t v549 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_redactedForWiFi(v549, v394, v395, v396, v397);
              id v398 = v338;
              uint64_t v399 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_channels(v339, v400, v401, v402, v403);
              uint64_t v404 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v404, v405, v406, v407, v408);
              double v409 = (void *)objc_claimAutoreleasedReturnValue();
              int v594 = 138544130;
              uint64_t v595 = (uint64_t)v385;
              __int16 v596 = 2048;
              unint64_t v597 = v544;
              __int16 v598 = 2114;
              uint64_t v599 = (uint64_t)v399;
              __int16 v600 = 2114;
              id v601 = v409;
              LODWORD(v521) = 42;
              id v519 = &v594;
              _os_log_send_and_compose_impl();

              id v338 = v398;
            }

            __uint64_t v410 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
            uint64_t v411 = v554;
            objc_msgSend_scanForNetworksHandler(v554, v412, v413, v414, v415);
            int v416 = (void *)objc_claimAutoreleasedReturnValue();

            id v553 = v338;
            if (v416)
            {
              id v568 = 0LL;
              objc_msgSend___calloutToScanForNetworksWithParameters_scanChannels_error_( v554,  v417,  (uint64_t)v339,  0,  (uint64_t)&v568);
              id v421 = (void *)objc_claimAutoreleasedReturnValue();
              id v422 = v568;
              uint64_t v550 = v422;
              if (v421)
              {
                objc_msgSend_channels(v339, v423, v424, v425, v426);
                uint64_t v427 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_firstObject(v427, v428, v429, v430, v431);
                id v432 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_addObject_(v531, v433, (uint64_t)v432, v434, v435);
                uint64_t v440 = v563;
                if (!v563)
                {
                  objc_msgSend_array(MEMORY[0x189603FA8], v436, v437, v438, v439);
                  uint64_t v440 = (void *)objc_claimAutoreleasedReturnValue();
                }

                id v563 = v440;
                objc_msgSend_addObjectsFromArray_(v440, v436, (uint64_t)v421, v438, v439, v519, v521);
                uint64_t v411 = v554;
                objc_msgSend_setObject_forKeyedSubscript_( v554->_followup6GHzScanResultsMap,  v441,  (uint64_t)v421,  (uint64_t)v339,  v442);
              }

              else
              {
                uint64_t v447 = (uint64_t)v422;
                objc_msgSend_dictionary(MEMORY[0x189603FC8], v423, v424, v425, v426);
                uint64_t v448 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_setObject_forKeyedSubscript_( v448,  v449,  (uint64_t)@"Failed to perform 6GHz followup scan",  v535,  v450);
                objc_msgSend_setObject_forKeyedSubscript_(v448, v451, v447, v527, v452);
                objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v453, v534, 2, (uint64_t)v448);
                id v432 = v559;
                id v537 = v448;
                id v559 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v411 = v554;
              }
            }

            else
            {
              objc_msgSend_dictionary(MEMORY[0x189603FC8], v417, v418, v419, v420);
              uint64_t v443 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_setObject_forKeyedSubscript_( v443,  v444,  (uint64_t)@"CWFAutoJoinManager.scanForNetworksHandler() not configured",  v535,  v445);
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v446, v534, 6, (uint64_t)v443);
              id v421 = 0LL;
              uint64_t v550 = 0LL;
              id v432 = v559;
              id v537 = v443;
              id v559 = (id)objc_claimAutoreleasedReturnValue();
            }

            __uint64_t v454 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v410;
            uint64_t v459 = objc_msgSend_followup6GHzScanDuration(v411->_metric, v455, v456, v457, v458);
            objc_msgSend_setFollowup6GHzScanDuration_(v411->_metric, v460, v459 + v454 / 0xF4240, v461, v462);
            if (v559)
            {
              objc_msgSend_scanErrors(v554->_metric, v463, v464, v465, v466);
              uint64_t v471 = (void *)objc_claimAutoreleasedReturnValue();
              if (v471)
              {
                objc_msgSend_scanErrors(v554->_metric, v467, v468, v469, v470);
                uint64_t v472 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_arrayByAddingObject_(v472, v473, (uint64_t)v559, v474, v475);
                uint64_t v476 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setScanErrors_(v554->_metric, v477, (uint64_t)v476, v478, v479);
              }

              else
              {
                objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v467, (uint64_t)v559, v469, v470);
                uint64_t v472 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setScanErrors_(v554->_metric, v480, (uint64_t)v472, v481, v482);
              }
            }

            CWFGetOSLog();
            id v483 = (void *)objc_claimAutoreleasedReturnValue();
            if (v483)
            {
              CWFGetOSLog();
              id v484 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v485 = v337;
              id v484 = v337;
            }

            if (os_log_type_enabled((os_log_t)v484, (os_log_type_t)(16 * (v421 == 0LL))))
            {
              if (v563) {
                uint64_t v490 = "SUCCEEDED";
              }
              else {
                uint64_t v490 = "FAILED";
              }
              uint64_t v491 = objc_msgSend_count(v421, v486, v487, v488, v489, v519, v521);
              objc_msgSend___descriptionForError_(v554, v492, (uint64_t)v559, v493, v494);
              id v495 = (id)objc_claimAutoreleasedReturnValue();
              int v594 = 136446978;
              uint64_t v595 = (uint64_t)v490;
              __int16 v596 = 2048;
              unint64_t v597 = v454 / 0xF4240;
              __int16 v598 = 2048;
              uint64_t v599 = v491;
              __int16 v600 = 2114;
              id v601 = v495;
              LODWORD(v521) = 42;
              id v519 = &v594;
              _os_log_send_and_compose_impl();
            }

            CWFGetOSLog();
            __int16 v496 = (void *)objc_claimAutoreleasedReturnValue();
            if (v496)
            {
              CWFGetOSLog();
              id v497 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v498 = v337;
              id v497 = v337;
            }

            self = v554;

            if (os_log_type_enabled((os_log_t)v497, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v503 = objc_msgSend_count(v421, v499, v500, v501, v502);
              int v594 = 134217984;
              uint64_t v595 = v503;
              LODWORD(v521) = 12;
              id v519 = &v594;
              _os_log_send_and_compose_impl();
            }

            __int128 v566 = 0u;
            __int128 v567 = 0u;
            __int128 v564 = 0u;
            __int128 v565 = 0u;
            id v340 = v421;
            uint64_t v505 = objc_msgSend_countByEnumeratingWithState_objects_count_( v340,  v504,  (uint64_t)&v564,  (uint64_t)v593,  16);
            if (v505)
            {
              uint64_t v506 = v505;
              uint64_t v507 = *(void *)v565;
              do
              {
                for (uint64_t m = 0LL; m != v506; ++m)
                {
                  if (*(void *)v565 != v507) {
                    objc_enumerationMutation(v340);
                  }
                  uint64_t v509 = *(void *)(*((void *)&v564 + 1) + 8 * m);
                  CWFGetOSLog();
                  id v510 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v510)
                  {
                    CWFGetOSLog();
                    id v511 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  else
                  {
                    id v512 = v337;
                    id v511 = v337;
                  }

                  if (os_log_type_enabled((os_log_t)v511, OS_LOG_TYPE_DEFAULT))
                  {
                    int v594 = 138543362;
                    uint64_t v595 = v509;
                    LODWORD(v521) = 12;
                    id v519 = &v594;
                    _os_log_send_and_compose_impl();
                  }

                  self = v554;
                }

                uint64_t v506 = objc_msgSend_countByEnumeratingWithState_objects_count_( v340,  v513,  (uint64_t)&v564,  (uint64_t)v593,  16);
              }

              while (v506);
            }

            uint64_t v336 = v546;
            id v338 = v553;
          }

          id v338 = (char *)v338 + 1;
        }

        while (v338 != (id)v336);
        uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(v541, v333, (uint64_t)&v569, (uint64_t)v602, 16);
      }

      while (v336);
    }

    else
    {
      id v537 = 0LL;
      id v559 = 0LL;
    }

    objc_msgSend_setFollowup6GHzScanChannels_(self->_metric, v514, (uint64_t)v531, v515, v516);
    if (a7)
    {
      uint64_t v330 = v537;
      if (v559)
      {
        id v559 = v559;
        *a7 = v559;
      }
    }

    else
    {
      uint64_t v330 = v537;
    }
  }

  else
  {
    id v559 = 0LL;
    uint64_t v330 = 0LL;
  }

  id v517 = v563;

  return v517;
}

- (id)__passpointScanResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isPasspoint(v14, v6, v7, v8, v9))
        {
          if (!v11)
          {
            objc_msgSend_array(MEMORY[0x189603FA8], v6, v7, v8, v9);
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend_addObject_(v11, v6, (uint64_t)v14, v8, v9);
        }
      }

      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
    }

    while (v10);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v15 = (void *)objc_msgSend_copy(v11, v6, v7, v8, v9);

  return v15;
}

- (BOOL)__isNonPinnedEAPTLSCandidate:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_acceptedEAPTypes(v5, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_189E889D0, v16, v17);

  objc_msgSend_acceptedEAPTypes(v5, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v27 = objc_msgSend_containsObject_(v23, v24, (uint64_t)&unk_189E889E8, v25, v26);

  if (v18 && v27)
  {
    objc_msgSend_acceptedEAPTypes(v5, v28, v29, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = objc_msgSend_count(v32, v33, v34, v35, v36);

    if (v37 != 2)
    {
LABEL_9:
      BOOL v53 = 0;
      goto LABEL_10;
    }
  }

  else
  {
    if ((v18 | v27) != 1) {
      goto LABEL_9;
    }
    objc_msgSend_acceptedEAPTypes(v5, v28, v29, v30, v31);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = objc_msgSend_count(v42, v43, v44, v45, v46);

    if (v47 != 1) {
      goto LABEL_9;
    }
  }

  objc_msgSend_TLSTrustedServerNames(v5, v38, v39, v40, v41);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v53 = objc_msgSend_count(v48, v49, v50, v51, v52) == 0;

LABEL_10:
  return v53;
}

- (BOOL)__allowJoinCandidate:(id)a3 context:(id)a4 defer:(BOOL *)a5 error:(id *)a6
{
  uint64_t v211 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  BOOL v204 = 0;
  objc_msgSend_autoJoinParameters(v11, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_trigger(v16, v17, v18, v19, v20);

  failedToJoinKnownNetworkIDs = self->_failedToJoinKnownNetworkIDs;
  objc_msgSend_matchingKnownNetworkProfile(v10, v23, v24, v25, v26);
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v27, v28, v29, v30, v31);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(failedToJoinKnownNetworkIDs) = objc_msgSend_containsObject_( failedToJoinKnownNetworkIDs,  v33,  (uint64_t)v32,  v34,  v35);

  if ((_DWORD)failedToJoinKnownNetworkIDs)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v36, v37, v38, v39);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v40,  v41,  (uint64_t)@"Already failed to auto-join known network profile",  *MEMORY[0x1896075E0],  v42);
LABEL_18:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v43, *MEMORY[0x189607688], 1, (uint64_t)v40);
    id v107 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v108 = 0;
LABEL_19:

    goto LABEL_20;
  }

  objc_msgSend_channel(v10, v36, v37, v38, v39);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_is6GHz(v44, v45, v46, v47, v48)
    && !objc_msgSend_maxCompatibilityEnabled(self, v49, v50, v51, v52))
  {
    objc_msgSend_matchingKnownNetworkProfile(v10, v53, v54, v55, v56);
    BOOL v99 = (void *)objc_claimAutoreleasedReturnValue();
    int isStandalone6G = objc_msgSend_isStandalone6G(v99, v100, v101, v102, v103);

    if (isStandalone6G) {
      goto LABEL_17;
    }
  }

  else
  {
  }

  objc_msgSend_channel(v10, v57, v58, v59, v60);
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_is6GHz(v61, v62, v63, v64, v65))
  {

    if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0x36)
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v66, v67, v68, v69);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v40,  v70,  (uint64_t)@"6G is not allowed with current trigger",  *MEMORY[0x1896075E0],  v71);
      goto LABEL_18;
    }
  }

  else
  {
  }

  objc_msgSend_channel(v10, v66, v67, v68, v69);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
  char v77 = objc_msgSend_is6GHz(v72, v73, v74, v75, v76);

  if ((v77 & 1) == 0 && v21 == 45)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v78, v79, v80, v81);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v40,  v82,  (uint64_t)@"non-6G is not allowed with current trigger",  *MEMORY[0x1896075E0],  v83);
    goto LABEL_18;
  }

  objc_msgSend_channel(v10, v78, v79, v80, v81);
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_is6GHz(v84, v85, v86, v87, v88) & 1) == 0)
  {

    goto LABEL_43;
  }

  objc_msgSend_matchingKnownNetworkProfile(v10, v89, v90, v91, v92);
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v98 = objc_msgSend_disable6EMode(v93, v94, v95, v96, v97);

  if (v98 == 2)
  {
LABEL_17:
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v57, v58, v59, v60);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v40,  v105,  (uint64_t)@"6G is not allowed with this network",  *MEMORY[0x1896075E0],  v106);
    goto LABEL_18;
  }

- (BOOL)__performJoinWithNetwork:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v503 = *MEMORY[0x1895F89C0];
  uint64_t v487 = (char *)a3;
  id v482 = a4;
  uint64_t v488 = self;
  objc_msgSend_associatedNetwork(self, v7, v8, v9, v10);
  uint64_t v476 = (void *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v494 = 138543362;
    id v495 = v487;
    LODWORD(v458) = 12;
    uint64_t v457 = &v494;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v473 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_associateToNetworkHandler(v488, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v19, v20, v21, v22);
    uint64_t v475 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v475,  v61,  (uint64_t)@"CWFAutoJoinManager.associateToNetworkHandler() not configured",  *MEMORY[0x1896075E0],  v62);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v63, *MEMORY[0x189607688], 6, (uint64_t)v475);
    id v485 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = 0LL;
    uint64_t v479 = 0LL;
    int v483 = 0;
    goto LABEL_56;
  }

  uint64_t v479 = objc_alloc_init(&OBJC_CLASS___CWFAssocParameters);
  objc_msgSend_setScanResult_(v479, v23, (uint64_t)v487, v24, v25);
  objc_msgSend_SSID(v487, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v476, v31, v32, v33, v34);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 == v39)
  {
  }

  else
  {
    objc_msgSend_SSID(v487, v35, v36, v37, v38);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend_SSID(v476, v40, v41, v42, v43);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        objc_msgSend_SSID(v487, v45, v46, v47, v48);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v476, v51, v52, v53, v54);
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          int v60 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_( v488,  v59,  (uint64_t)v487,  (uint64_t)v476,  (uint64_t)v482);
        }
      }

      else
      {
        int v60 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_( v488,  v45,  (uint64_t)v487,  (uint64_t)v476,  (uint64_t)v482);
      }

      if (v60) {
        goto LABEL_20;
      }
LABEL_15:
      BOOL v70 = 0;
      goto LABEL_41;
    }

    char v69 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_( v488,  v40,  (uint64_t)v487,  (uint64_t)v476,  (uint64_t)v482);

    if ((v69 & 1) == 0) {
      goto LABEL_15;
    }
  }

- (void)__sortJoinCandidates:(id)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x189603FA8];
  id v141 = a3;
  objc_msgSend_array(v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinParameters(v6, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v142 = v6;
  if (objc_msgSend_trigger(v17, v18, v19, v20, v21) == 54)
  {
  }

  else
  {
    objc_msgSend_autoJoinParameters(v6, v22, v23, v24, v25);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);

    if (v35 != 55) {
      goto LABEL_5;
    }
  }

  objc_msgSend_associatedNetwork(self, v26, v27, v28, v29);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v36, v37, v38, v39, v40);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)MEMORY[0x189607A20];
  uint64_t v43 = MEMORY[0x1895F87A8];
  v148[0] = MEMORY[0x1895F87A8];
  v148[1] = 3221225472LL;
  v148[2] = sub_1864B3F1C;
  v148[3] = &unk_189E5BCE8;
  id v149 = v41;
  id v139 = v41;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v42, v44, 0, 0, (uint64_t)v148);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v46, (uint64_t)v45, v47, v48);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_( MEMORY[0x189607A20],  v49,  (uint64_t)@"matchingKnownNetworkProfile",  0,  (uint64_t)&unk_189E5CA90);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v51, (uint64_t)v50, v52, v53);
  uint64_t v54 = self;
  uint64_t v55 = (void *)MEMORY[0x189607A20];
  v146[0] = v43;
  v146[1] = 3221225472LL;
  v146[2] = sub_1864B4108;
  v146[3] = &unk_189E5BCE8;
  id v147 = v36;
  id v56 = v36;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v55, v57, 0, 0, (uint64_t)v146);
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v59, (uint64_t)v58, v60, v61);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v62, 0, 0, (uint64_t)&unk_189E5CAB0);
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v64, (uint64_t)v63, v65, v66);

  self = v54;
LABEL_5:
  uint64_t v68 = objc_msgSend_joinCandidateComparator(self, v26, v27, v28, v29);
  if (v68)
  {
    objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v67, 0, 0, v68);
    char v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v12, v70, (uint64_t)v69, v71, v72);
  }

  objc_msgSend_sortDescriptorWithKey_ascending_comparator_( MEMORY[0x189607A20],  v67,  (uint64_t)@"matchingKnownNetworkProfile",  0,  (uint64_t)&unk_189E5CAD0);
  uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v73, (uint64_t)v140, v74, v75);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_( MEMORY[0x189607A20],  v76,  0,  0,  (uint64_t)sel_compareLowDataModes_);
  id v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v77, (uint64_t)v138, v78, v79);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v80, 0, 0, (uint64_t)&unk_189E5CAF0);
  uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v81, (uint64_t)v137, v82, v83);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v84, 0, 0, (uint64_t)&unk_189E5CB10);
  uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v85, (uint64_t)v136, v86, v87);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_( MEMORY[0x189607A20],  v88,  0,  0,  (uint64_t)sel_compareSupportedPHYModes_);
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v90, (uint64_t)v89, v91, v92);
  uint64_t v93 = MEMORY[0x1895F87A8];
  v145[0] = MEMORY[0x1895F87A8];
  v145[1] = 3221225472LL;
  v145[2] = sub_1864B47AC;
  v145[3] = &unk_189E5CB38;
  v145[4] = self;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_( MEMORY[0x189607A20],  v94,  (uint64_t)@"channel",  0,  (uint64_t)v145);
  uint64_t v135 = (void *)v68;
  uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v96, (uint64_t)v95, v97, v98);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v99, 0, 0, (uint64_t)&unk_189E5CB58);
  uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v101, (uint64_t)v100, v102, v103);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_( MEMORY[0x189607A20],  v104,  (uint64_t)@"matchingKnownNetworkProfile",  0,  (uint64_t)sel_compareSupportedSecurityTypes_);
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v106, (uint64_t)v105, v107, v108);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_( MEMORY[0x189607A20],  v109,  0,  0,  (uint64_t)sel_compareSupportedSecurityTypes_);
  uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v111, (uint64_t)v110, v112, v113);
  objc_msgSend_associatedNetwork(self, v114, v115, v116, v117);
  uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v119 = (void *)MEMORY[0x189607A20];
  v143[0] = v93;
  v143[1] = 3221225472LL;
  v143[2] = sub_1864B4B98;
  v143[3] = &unk_189E5BCE8;
  id v144 = v118;
  id v120 = v118;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v119, v121, 0, 0, (uint64_t)v143);
  uint64_t v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v123, (uint64_t)v122, v124, v125);
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v126, (uint64_t)@"RSSI", 0, v127);
  uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v129, (uint64_t)v128, v130, v131);
  objc_msgSend_sortUsingDescriptors_(v141, v132, (uint64_t)v12, v133, v134);
}

- (id)__morePreferredKnownNetworksWithCandidate:(id)a3 knownNetworks:(id)a4 context:(id)a5
{
  uint64_t v193 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_orderedSet(MEMORY[0x189603FD0], v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v184 = v9;
  objc_msgSend_autoJoinParameters(v9, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_trigger(v19, v20, v21, v22, v23);

  objc_msgSend_lastJoinedAt(v7, v25, v26, v27, v28);
  uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastDiscoveredAt(v7, v29, v30, v31, v32);
  uint64_t v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkGroupID(v7, v33, v34, v35, v36);
  uint64_t v187 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v182 = objc_msgSend_networkGroupPriority(v7, v37, v38, v39, v40);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v41, v42, v43, v44);
  double v46 = v45;
  __int128 v188 = 0u;
  __int128 v189 = 0u;
  __int128 v190 = 0u;
  __int128 v191 = 0u;
  obuint64_t j = v8;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v188, (uint64_t)v192, 16);
  if (v48)
  {
    uint64_t v53 = v48;
    uint64_t v54 = *(void *)v189;
    unint64_t v185 = v24 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      uint64_t v55 = 0LL;
      do
      {
        if (*(void *)v189 != v54) {
          objc_enumerationMutation(obj);
        }
        id v56 = *(void **)(*((void *)&v188 + 1) + 8 * v55);
        objc_msgSend_identifier(v7, v49, v50, v51, v52);
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v56, v58, v59, v60, v61);
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqual = objc_msgSend_isEqual_(v57, v63, (uint64_t)v62, v64, v65);

        if ((isEqual & 1) == 0 && (objc_msgSend_isPersonalHotspot(v56, v49, v50, v51, v52) & 1) == 0)
        {
          if (objc_msgSend_compareUserPriority_(v7, v49, (uint64_t)v56, v51, v52) == -1)
          {
            objc_msgSend_addedAt(v56, v67, v68, v69, v70);
            uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastJoinedAt(v56, v81, v82, v83, v84);
            uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastDiscoveredAt(v56, v86, v87, v88, v89);
            uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v91, v92, v93, v94);
            if (v46 - v99 < 1209600.0) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v90, v95, v96, v97, v98);
            if (v46 - v104 < 1209600.0) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v80, v100, v101, v102, v103);
            if (v46 - v109 < 1209600.0) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v105, v106, v107, v108);
            double v111 = v110;
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v112, v113, v114, v115);
            if (v111 > v120) {
              goto LABEL_27;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v90, v116, v117, v118, v119);
            double v122 = v121;
            objc_msgSend_timeIntervalSinceReferenceDate(v180, v123, v124, v125, v126);
            if (v122 > v131) {
              goto LABEL_27;
            }
            if (!v85 || !v181) {
              goto LABEL_22;
            }
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v127, v128, v129, v130);
            double v133 = floor(v132);
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v134, v135, v136, v137);
            double v139 = v133 - floor(v138);
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v140, v141, v142, v143);
            double v145 = floor(v144);
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v146, v147, v148, v149);
            double v151 = v145 - floor(v150);
            if (v139 < 0.0) {
              double v151 = -v151;
            }
            if (v151 < 1209600.0)
            {
LABEL_27:
              char v152 = 0;
            }

            else
            {
LABEL_22:
              char v152 = 1;
              if (v90 && v180)
              {
                objc_msgSend_timeIntervalSinceReferenceDate(v90, v127, v128, v129, v130);
                double v154 = floor(v153);
                objc_msgSend_timeIntervalSinceReferenceDate(v180, v155, v156, v157, v158);
                double v160 = v154 - floor(v159);
                objc_msgSend_timeIntervalSinceReferenceDate(v90, v161, v162, v163, v164);
                double v166 = floor(v165);
                objc_msgSend_timeIntervalSinceReferenceDate(v180, v167, v168, v169, v170);
                double v172 = v166 - floor(v171);
                if (v160 < 0.0) {
                  double v172 = -v172;
                }
                if (v172 < 1209600.0) {
                  goto LABEL_27;
                }
                char v152 = 1;
              }
            }

            if (v185 == 52 || (v152 & 1) != 0) {
              goto LABEL_35;
            }
LABEL_30:
            if (objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_( self,  v49,  (uint64_t)v56,  (uint64_t)v184,  0,  0,  self->_targetQueue,  0))
            {
              if (!v14)
              {
                objc_msgSend_orderedSet(MEMORY[0x189603FD0], v49, v50, v51, v52);
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
              }

              objc_msgSend_addObject_(v14, v49, (uint64_t)v56, v51, v52);
            }

            goto LABEL_35;
          }

          objc_msgSend_networkGroupID(v56, v67, v68, v69, v70);
          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v187, v72, (uint64_t)v71, v73, v74) & 1) == 0)
          {

            goto LABEL_35;
          }

          unint64_t v79 = objc_msgSend_networkGroupPriority(v56, v75, v76, v77, v78);

          if (v182 < v79) {
            goto LABEL_30;
          }
        }

- (BOOL)__connectToHotspot:(id)a3 error:(id *)a4
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v6 = (char *)a3;
  CWFGetOSLog();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CWFGetOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v9 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v82 = 138543362;
    uint64_t v83 = v6;
    int v80 = 12;
    unint64_t v79 = &v82;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v15 = objc_msgSend_connectToHotspotHandler(self, v11, v12, v13, v14);

  if (v15)
  {
    id v81 = 0LL;
    LODWORD(v15) = objc_msgSend___calloutToConnectToHotspot_error_(self, v16, (uint64_t)v6, (uint64_t)&v81, v19);
    id v24 = v81;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    if ((v15 & 1) == 0)
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v20, v21, v22, v23);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v25,  v27,  (uint64_t)@"Failed to connect to hotspot",  *MEMORY[0x1896075E0],  v28);
      uint64_t v29 = (void *)MEMORY[0x189607870];
      uint64_t v30 = *MEMORY[0x189607688];
      uint64_t v35 = objc_msgSend_code(v24, v31, v32, v33, v34);
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v36, v30, v35, (uint64_t)v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v16, v17, v18, v19);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v25,  v37,  (uint64_t)@"CWFAutoJoinManager.connectToHotspotHandler() not configured",  *MEMORY[0x1896075E0],  v38);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v39, *MEMORY[0x189607688], 6, (uint64_t)v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __uint64_t v40 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v10;
  uint64_t v45 = objc_msgSend_autoHotspotJoinDuration(self->_metric, v41, v42, v43, v44);
  objc_msgSend_setAutoHotspotJoinDuration_(self->_metric, v46, v45 + v40 / 0xF4240, v47, v48);
  if (v26)
  {
    objc_msgSend_autoHotspotJoinErrors(self->_metric, v49, v50, v51, v52);
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend_autoHotspotJoinErrors(self->_metric, v53, v54, v55, v56);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v58, v59, (uint64_t)v26, v60, v61);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAutoHotspotJoinErrors_(self->_metric, v63, (uint64_t)v62, v64, v65);
    }

    else
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v53, (uint64_t)v26, v55, v56);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAutoHotspotJoinErrors_(self->_metric, v66, (uint64_t)v58, v67, v68);
    }
  }

  objc_msgSend_setHotspot_(self->_metric, v49, (uint64_t)v6, v51, v52, v79, v80);
  CWFGetOSLog();
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    CWFGetOSLog();
    uint64_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v70 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v71 = MEMORY[0x1895F8DA0];
  }

  if ((_DWORD)v15) {
    os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v72 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v70, v72))
  {
    if ((_DWORD)v15) {
      uint64_t v76 = "SUCCEEDED";
    }
    else {
      uint64_t v76 = "FAILED";
    }
    objc_msgSend___descriptionForError_(self, v73, (uint64_t)v26, v74, v75);
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
    int v82 = 136446978;
    uint64_t v83 = v76;
    __int16 v84 = 2048;
    unint64_t v85 = v40 / 0xF4240;
    __int16 v86 = 2114;
    uint64_t v87 = v77;
    __int16 v88 = 2114;
    uint64_t v89 = v6;
    _os_log_send_and_compose_impl();
  }

  if (a4 && v26) {
    *a4 = v26;
  }

  return v15;
}

- (id)__browseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v109 = *MEMORY[0x1895F89C0];
  CWFGetOSLog();
  __uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    CWFGetOSLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v11 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v12 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      uint64_t v13 = " [cache-only]";
    }
    else {
      uint64_t v13 = "";
    }
    int v95 = 136446722;
    uint64_t v96 = (uint64_t)v13;
    __int16 v97 = 2048;
    unint64_t v98 = a3;
    __int16 v99 = 2048;
    unint64_t v100 = a4;
    int v85 = 32;
    __int16 v84 = &v95;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_browseForHotspotsHandler(self, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    id v93 = 0LL;
    objc_msgSend___calloutToBrowseForHotspotsWithTimeout_maxCacheAge_cacheOnly_error_(self, v20, a3, a4, v6, &v93);
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v29 = v93;
    if (v24)
    {
      id v30 = v24;
      __int16 v86 = 0LL;
      uint64_t v31 = 0LL;
    }

    else
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v25, v26, v27, v28);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v36,  v37,  (uint64_t)@"Failed to browse for hotspots",  *MEMORY[0x1896075E0],  v38);
      objc_msgSend_setObject_forKeyedSubscript_(v36, v39, (uint64_t)v29, *MEMORY[0x189607798], v40);
      __int16 v86 = v36;
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v41, *MEMORY[0x189607688], 2, (uint64_t)v36);
    }
  }

  else
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v20, v21, v22, v23);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_( v32,  v33,  (uint64_t)@"CWFAutoJoinManager.browseForHotspotsHandler() not configured",  *MEMORY[0x1896075E0],  v34);
    __int16 v86 = v32;
    uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v35, *MEMORY[0x189607688], 6, (uint64_t)v32);
    id v24 = 0LL;
  }

  __uint64_t v42 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v14) / 0xF4240;
  objc_msgSend_setAutoHotspotBrowseDuration_(self->_metric, v43, v42, v44, v45);
  objc_msgSend_setAutoHotspotBrowseError_(self->_metric, v46, v31, v47, v48);
  CWFGetOSLog();
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    CWFGetOSLog();
    uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v50 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v51 = MEMORY[0x1895F8DA0];
  }

  __int16 v88 = (void *)v31;

  if (os_log_type_enabled(v50, (os_log_type_t)(16 * (v24 == 0LL))))
  {
    if (v6) {
      uint64_t v56 = " [cache-only]";
    }
    else {
      uint64_t v56 = "";
    }
    if (v24) {
      uint64_t v57 = "SUCCEEDED";
    }
    else {
      uint64_t v57 = "FAILED";
    }
    uint64_t v58 = objc_msgSend_count(v24, v52, v53, v54, v55, v84, v85);
    objc_msgSend___descriptionForError_(self, v59, (uint64_t)v88, v60, v61);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    int v95 = 136447746;
    uint64_t v96 = (uint64_t)v56;
    __int16 v97 = 2082;
    unint64_t v98 = (unint64_t)v57;
    __int16 v99 = 2048;
    unint64_t v100 = v42;
    __int16 v101 = 2048;
    uint64_t v102 = v58;
    __int16 v103 = 2114;
    double v104 = v62;
    __int16 v105 = 2048;
    unint64_t v106 = a3;
    __int16 v107 = 2048;
    unint64_t v108 = a4;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    CWFGetOSLog();
    uint64_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v64 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v65 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v70 = objc_msgSend_count(v24, v66, v67, v68, v69);
    int v95 = 134217984;
    uint64_t v96 = v70;
    _os_log_send_and_compose_impl();
  }

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id v71 = v24;
  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v89, (uint64_t)v94, 16);
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v90;
    uint64_t v76 = (void *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v74; ++i)
      {
        if (*(void *)v90 != v75) {
          objc_enumerationMutation(v71);
        }
        uint64_t v78 = *(void *)(*((void *)&v89 + 1) + 8 * i);
        CWFGetOSLog();
        unint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          CWFGetOSLog();
          int v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v81 = v76;
          int v80 = (os_log_s *)v76;
        }

        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          int v95 = 138543362;
          uint64_t v96 = v78;
          _os_log_send_and_compose_impl();
        }
      }

      uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v82, (uint64_t)&v89, (uint64_t)v94, 16);
    }

    while (v74);
  }

  if (a6 && v88) {
    *a6 = v88;
  }

  return v71;
}

- (void)__sortHotspotCandidates:(id)a3
{
  v24[5] = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)MEMORY[0x189607A20];
  id v4 = a3;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v3, v5, 0, 1, (uint64_t)&unk_189E5CB98);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x189607A20], v7, 0, 1, (uint64_t)&unk_189E5CBB8);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v9, (uint64_t)@"networkType", 0, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v12, (uint64_t)@"signalStrength", 0, v13);
  __uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v15, (uint64_t)@"batteryLife", 0, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v14;
  v24[4] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v18, (uint64_t)v24, 5, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortUsingDescriptors_(v4, v21, (uint64_t)v20, v22, v23);
}

- (int64_t)__allowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v42 = 0LL;
  char isAutoJoinCancelled = objc_msgSend___isAutoJoinCancelled_(self, a2, (uint64_t)&v42, (uint64_t)a4, v4);
  id v13 = v42;
  if ((isAutoJoinCancelled & 1) == 0)
  {
    objc_msgSend_allowAutoHotspotHandler(self, v9, v10, v11, v12);
    __uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      id v41 = 0LL;
      int64_t v17 = objc_msgSend___calloutToAllowAutoHotspotWithTrigger_error_(self, v15, a3, (uint64_t)&v41, v16);
      id v18 = v41;
      uint64_t v23 = v18;
      if (v17)
      {

        if (!a4) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }

      objc_msgSend_dictionary(MEMORY[0x189603FC8], v19, v20, v21, v22);
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_( v24,  v25,  (uint64_t)@"Auto-hotspot is not allowed",  *MEMORY[0x1896075E0],  v26);
      if (v23) {
        objc_msgSend_setObject_forKeyedSubscript_(v24, v27, (uint64_t)v23, *MEMORY[0x189607798], v28);
      }
      uint64_t v29 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v27, *MEMORY[0x189607688], 1, (uint64_t)v24);

      id v13 = (id)v29;
    }
  }

  CWFGetOSLog();
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    CWFGetOSLog();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v31 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v32 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend___descriptionForError_(self, v33, (uint64_t)v13, v34, v35);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    int v43 = 138543362;
    uint64_t v44 = v36;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_setAutoHotspotWasAborted_(self->_metric, v37, 1, v38, v39);
  int64_t v17 = 0LL;
  if (a4)
  {
LABEL_15:
    if (v13) {
      *a4 = v13;
    }
  }

- (BOOL)__allowHotspot:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_msgSend_allowHotspotHandler(self, v7, v8, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    goto LABEL_4;
  }
  id v35 = 0LL;
  int v14 = objc_msgSend___calloutToAllowHotspot_error_(self, v12, (uint64_t)v6, (uint64_t)&v35, v13);
  id v15 = v35;
  uint64_t v20 = v15;
  if (v14)
  {

    id v11 = 0LL;
LABEL_4:
    BOOL v21 = 1;
    goto LABEL_5;
  }

  objc_msgSend_dictionary(MEMORY[0x189603FC8], v16, v17, v18, v19);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v23,  v24,  (uint64_t)@"Hotspot is not allowed by daemon",  *MEMORY[0x1896075E0],  v25);
  if (v20) {
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v20, *MEMORY[0x189607798], v27);
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v26, *MEMORY[0x189607688], 1, (uint64_t)v23);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CWFGetOSLog();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v29 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v30 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend___descriptionForError_(self, v31, (uint64_t)v11, v32, v33);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    int v36 = 138543618;
    id v37 = v6;
    __int16 v38 = 2114;
    uint64_t v39 = v34;
    _os_log_send_and_compose_impl();
  }

  BOOL v21 = 0;
  if (a4 && v11)
  {
    id v11 = v11;
    BOOL v21 = 0;
    *a4 = v11;
  }

- (BOOL)__performAutoHotspotWithBrowseTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  v164[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = self;
  objc_sync_enter(v9);
  objc_msgSend_UUID(v9->_activeRequest, v10, v11, v12, v13);
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v143 = (void *)objc_msgSend_copy(v14, v15, v16, v17, v18);

  objc_msgSend_parameters(v9->_activeRequest, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = objc_msgSend_trigger(v23, v24, v25, v26, v27);

  objc_sync_exit(v9);
  if (objc_msgSend___isAnyKnownNetworkNearby(v9, v29, v30, v31, v32))
  {
    uint64_t v134 = (void *)MEMORY[0x189607870];
    uint64_t v163 = *MEMORY[0x1896075E0];
    v164[0] = @"Known network is nearby";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v33, (uint64_t)v164, (uint64_t)&v163, 1);
    uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v134, v136, *MEMORY[0x189607688], 1, (uint64_t)v135);
    id v144 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v35 = 0LL;
    goto LABEL_33;
  }

  id v153 = 0LL;
  uint64_t v139 = v28;
  uint64_t v35 = objc_msgSend___allowAutoHotspotWithTrigger_error_(v9, v33, v28, (uint64_t)&v153, v34);
  id v144 = v153;
  if ((v35 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_33:
    objc_msgSend_setAutoHotspotMode_(v9->_metric, v36, v35, v37, v38);
    LOBYTE(v97) = 0;
    id v98 = 0LL;
    id v140 = 0LL;
    uint64_t v63 = 0LL;
    id v66 = 0LL;
    goto LABEL_28;
  }

  CWFGetOSLog();
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    CWFGetOSLog();
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v40 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v41 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    sub_186452FAC(v35, v42, v43, v44, v45);
    double v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v143, v47, v48, v49, v50);
    id v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v51, v52, 5, v53, v54);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    int v154 = 138543618;
    uint64_t v155 = (uint64_t)v46;
    __int16 v156 = 2114;
    uint64_t v157 = v55;
    LODWORD(v138) = 22;
    uint64_t v137 = &v154;
    _os_log_send_and_compose_impl();
  }

  __uint64_t v142 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend___updateAutoJoinState_(v9, v56, 2, v57, v58);
  objc_msgSend_array(MEMORY[0x189603FA8], v59, v60, v61, v62);
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  id v152 = 0LL;
  objc_msgSend___browseForHotspotsWithTimeout_maxCacheAge_cacheOnly_error_(v9, v64, a3, a4, v6, &v152);
  id v65 = (void *)objc_claimAutoreleasedReturnValue();
  id v140 = v152;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  id v66 = v65;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v148, (uint64_t)v162, 16);
  if (v70)
  {
    uint64_t v71 = *(void *)v149;
    do
    {
      for (uint64_t i = 0LL; i != v70; ++i)
      {
        if (*(void *)v149 != v71) {
          objc_enumerationMutation(v66);
        }
        uint64_t v73 = *(void *)(*((void *)&v148 + 1) + 8 * i);
        id v147 = 0LL;
        int v74 = objc_msgSend___allowHotspot_error_(v9, v68, v73, (uint64_t)&v147, v69, v137, v138);
        id v78 = v147;
        if (v74) {
          objc_msgSend_addObject_(v63, v75, v73, v76, v77);
        }
      }

      uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v68, (uint64_t)&v148, (uint64_t)v162, 16);
    }

    while (v70);
  }

  if (objc_msgSend_count(v63, v79, v80, v81, v82))
  {
    id v146 = v144;
    uint64_t v35 = objc_msgSend___allowAutoHotspotWithTrigger_error_(v9, v83, v139, (uint64_t)&v146, v85);
    id v86 = v146;

    if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend___sortHotspotCandidates_(v9, v83, (uint64_t)v63, v84, v85);
      objc_msgSend___updateAutoJoinState_(v9, v87, 3, v88, v89);
      objc_msgSend_firstObject(v63, v90, v91, v92, v93);
      uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
      id v145 = 0LL;
      uint64_t v97 = objc_msgSend___connectToHotspot_error_(v9, v95, (uint64_t)v94, (uint64_t)&v145, v96);
      id v98 = v145;
    }

    else
    {
      id v98 = 0LL;
      uint64_t v97 = 0LL;
    }

    id v144 = v86;
  }

  else
  {
    id v98 = 0LL;
    uint64_t v97 = 0LL;
  }

  objc_msgSend_setAutoHotspotMode_(v9->_metric, v83, v35, v84, v85, v137, v138);
  if (v142)
  {
    __uint64_t v99 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    objc_msgSend_setAutoHotspotWasAttempted_(v9->_metric, v100, 1, v101, v102);
    objc_msgSend_setAutoHotspotDuration_(v9->_metric, v103, (v99 - v142) / 0xF4240, v104, v105);
    objc_msgSend_setAutoHotspotResult_(v9->_metric, v106, v97, v107, v108);
    objc_msgSend_setAutoHotspotError_(v9->_metric, v109, (uint64_t)v144, v110, v111);
    CWFGetOSLog();
    uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v112)
    {
      CWFGetOSLog();
      uint64_t v113 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v113 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v114 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v119 = objc_msgSend_autoHotspotDuration(v9->_metric, v115, v116, v117, v118);
      objc_msgSend_UUIDString(v143, v120, v121, v122, v123);
      uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v124, v125, 5, v126, v127);
      uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___descriptionForError_(v9, v129, (uint64_t)v144, v130, v131);
      double v132 = (void *)objc_claimAutoreleasedReturnValue();
      int v154 = 134218754;
      uint64_t v155 = v119;
      __int16 v156 = 2114;
      uint64_t v157 = v128;
      __int16 v158 = 1024;
      int v159 = v97;
      __int16 v160 = 2114;
      uint64_t v161 = v132;
      _os_log_send_and_compose_impl();
    }
  }

- (void)__addDependentThrottleInterval:(unint64_t)a3 trigger:(int64_t)a4 dependentTrigger:(int64_t)a5
{
  v34[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinThrottle);
  objc_msgSend_setTrigger_(v9, v10, a4, v11, v12);
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v13, a5, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = v16;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v17, a3, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)v34, (uint64_t)&v33, 1);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIntervalsBasedOnTriggerTimestamp_(v9, v23, (uint64_t)v22, v24, v25);

  throttleIntervalMap = self->_throttleIntervalMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v27, a4, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(throttleIntervalMap, v31, (uint64_t)v9, (uint64_t)v30, v32);
}

- (void)__addMatchingThrottleInterval:(unint64_t)a3 triggers:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  obuint64_t j = a4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_integerValue(v15, v8, v9, v10, v11);
        uint64_t v33 = v15;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v17, a3, v18, v19);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = v20;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)&v34, (uint64_t)&v33, 1);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_autoJoinThrottleWithTrigger_intervals_( CWFAutoJoinThrottle,  v23,  v16,  (uint64_t)v22,  v24);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_throttleIntervalMap, v26, (uint64_t)v25, (uint64_t)v15, v27);
      }

      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v35, 16);
    }

    while (v12);
  }
}

- (void)__addWilcardThrottleInterval:(unint64_t)a3 triggers:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  obuint64_t j = a4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_integerValue(v15, v8, v9, v10, v11);
        uint64_t v33 = &unk_189E88958;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v17, a3, v18, v19);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = v20;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v21, (uint64_t)&v34, (uint64_t)&v33, 1);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_autoJoinThrottleWithTrigger_intervals_( CWFAutoJoinThrottle,  v23,  v16,  (uint64_t)v22,  v24);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_throttleIntervalMap, v26, (uint64_t)v25, (uint64_t)v15, v27);
      }

      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v35, 16);
    }

    while (v12);
  }
}

- (void)__setupThrottleIntervals
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  objc_msgSend_removeAllObjects(self->_throttleIntervalMap, a2, v2, v3, v4);
  switch(self->_retrySchedule)
  {
    case 3LL:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_189E8AA40, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v8, 0, (uint64_t)&unk_189E8AA58, v9);
      if (os_variant_has_internal_content())
      {
        objc_msgSend_standardUserDefaults(MEMORY[0x189604038], v10, v11, v12, v13);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v14, v15, (uint64_t)@"assoc_retry_awdl_rt_throttle_interval", v16, v17);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          CWFGetOSLog();
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            CWFGetOSLog();
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v20 = (os_log_s *)MEMORY[0x1895F8DA0];
            id v31 = MEMORY[0x1895F8DA0];
          }

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v43 = 134218240;
            uint64_t v44 = 900LL;
            __int16 v45 = 2048;
            uint64_t v46 = objc_msgSend_unsignedIntegerValue(v18, v32, v33, v34, v35);
            int v42 = 22;
            id v41 = &v43;
            _os_log_send_and_compose_impl();
          }

          uint64_t v30 = objc_msgSend_unsignedIntegerValue(v18, v36, v37, v38, v39);
        }

        else
        {
          uint64_t v30 = 900LL;
        }

        objc_msgSend___addDependentThrottleInterval_trigger_dependentTrigger_(self, v40, v30, 45, 57, v41, v42);
      }

      else
      {
        objc_msgSend___addDependentThrottleInterval_trigger_dependentTrigger_(self, v10, 900, 45, 57);
      }

      break;
    case 5LL:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_189E8AA10, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v24, 0, (uint64_t)&unk_189E8AA28, v25);
      break;
    case 8LL:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_189E8A9E0, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v26, 0, (uint64_t)&unk_189E8A9F8, v27);
      break;
    case 9LL:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_189E8A998, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v28, 0, (uint64_t)&unk_189E8A9B0, v29);
      uint64_t v21 = &unk_189E8A9C8;
      uint64_t v22 = self;
      uint64_t v23 = 900LL;
      goto LABEL_11;
    default:
      uint64_t v21 = &unk_189E8AA70;
      uint64_t v22 = self;
      uint64_t v23 = 60LL;
LABEL_11:
      MEMORY[0x189616718](v22, sel___addMatchingThrottleInterval_triggers_, v23, v21, v7);
      break;
  }

- (BOOL)__shouldThrottleAutoJoinTrigger:(int64_t)a3
{
  uint64_t v196 = *MEMORY[0x1895F89C0];
  __uint64_t v168 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  throttleIntervalMap = self->_throttleIntervalMap;
  unint64_t v161 = a3;
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v6, a3, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(throttleIntervalMap, v10, (uint64_t)v9, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_throttleIntervalMap, v14, (uint64_t)&unk_189E88958, v16, v17);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __int128 v186 = 0u;
  __int128 v187 = 0u;
  __int128 v184 = 0u;
  __int128 v185 = 0u;
  objc_msgSend_intervals(v13, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v18, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v169 = self;
  uint64_t v170 = v13;
  uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v184, (uint64_t)v195, 16);
  if (v162)
  {
    uint64_t v29 = *(void *)v185;
    double v166 = v23;
    uint64_t v159 = *(void *)v185;
    do
    {
      uint64_t v30 = 0LL;
      do
      {
        if (*(void *)v185 != v29) {
          objc_enumerationMutation(v23);
        }
        uint64_t v164 = v30;
        id v31 = *(void **)(*((void *)&v184 + 1) + 8 * v30);
        __int128 v180 = 0u;
        __int128 v181 = 0u;
        __int128 v182 = 0u;
        __int128 v183 = 0u;
        objc_msgSend_allKeys(self->_throttleTimestampMap, v25, v26, v27, v28);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v180, (uint64_t)v194, 16);
        if (v33)
        {
          uint64_t v38 = v33;
          uint64_t v39 = *(void *)v181;
          while (2)
          {
            for (uint64_t i = 0LL; i != v38; ++i)
            {
              if (*(void *)v181 != v39) {
                objc_enumerationMutation(obj);
              }
              id v41 = *(void **)(*((void *)&v180 + 1) + 8 * i);
              uint64_t v42 = objc_msgSend_integerValue(v31, v34, v35, v36, v37);
              if (v42 == objc_msgSend_integerValue(v41, v43, v44, v45, v46))
              {
                objc_msgSend_objectForKeyedSubscript_(self->_throttleTimestampMap, v34, (uint64_t)v41, v36, v37);
                uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_intervals(v13, v48, v49, v50, v51);
                uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)v31, v54, v55);
                uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (v47) {
                  BOOL v61 = v56 == 0LL;
                }
                else {
                  BOOL v61 = 1;
                }
                if (!v61)
                {
                  uint64_t v62 = objc_msgSend_unsignedLongLongValue(v47, v57, v58, v59, v60);
                  unint64_t v67 = objc_msgSend_unsignedLongValue(v56, v63, v64, v65, v66);
                  unint64_t v72 = 1000000000 * objc_msgSend_unsignedLongValue(v56, v68, v69, v70, v71);
                  uint64_t v77 = objc_msgSend_unsignedLongValue(v56, v73, v74, v75, v76);
                  unint64_t v78 = 1000000000 * v77;
                  BOOL v79 = v67 > v72;
                  self = v169;
                  uint64_t v13 = v170;
                  if (v79) {
                    unint64_t v78 = v77;
                  }
                  if (v168 - v62 < v78)
                  {
                    CWFGetOSLog();
                    id v144 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v144)
                    {
                      CWFGetOSLog();
                      id v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      id v145 = (os_log_s *)MEMORY[0x1895F8DA0];
                      id v147 = MEMORY[0x1895F8DA0];
                    }

                    uint64_t v89 = v166;

                    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
                    {
                      sub_18645304C(v161, v148, v149, v150, v151);
                      id v152 = (void *)objc_claimAutoreleasedReturnValue();
                      int v190 = 138543618;
                      __int128 v191 = v170;
                      __int16 v192 = 2114;
                      uint64_t v193 = v152;
LABEL_60:
                      _os_log_send_and_compose_impl();
                    }

- (void)__updateNextRequestTimer
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!self->_nextRequestTimer)
  {
    BOOL v6 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_internalQueue);
    nextRequestTimer = self->_nextRequestTimer;
    self->_nextRequestTimer = v6;

    uint64_t v8 = self->_nextRequestTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = sub_1864B787C;
    handler[3] = &unk_189E5BC10;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    dispatch_source_set_timer( (dispatch_source_t)self->_nextRequestTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
    dispatch_resume((dispatch_object_t)self->_nextRequestTimer);
  }

  if ((unint64_t)objc_msgSend___nextRequestInterval(self, a2, v2, v3, v4) > 0x7FFFFFFFFFFFFFFELL)
  {
    int64_t RequestInterval = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }

  int64_t RequestInterval = objc_msgSend___nextRequestInterval(self, v9, v10, v11, v12);
  if (RequestInterval >= 1)
  {
LABEL_9:
    CWFGetOSLog();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v18 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (self->_isNextRequestScheduled) {
        uint64_t v19 = @"Re-scheduling";
      }
      else {
        uint64_t v19 = @"Scheduling";
      }
      int v25 = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2048;
      unint64_t v28 = RequestInterval / 0xF4240uLL;
      _os_log_send_and_compose_impl();
    }

    self->_isNextRequestScheduled = 1;
    uint64_t v20 = self->_nextRequestTimer;
    dispatch_time_t v21 = dispatch_walltime(0LL, RequestInterval);
    uint64_t v22 = v20;
    goto LABEL_18;
  }

  if (!self->_isNextRequestScheduled) {
    return;
  }
  CWFGetOSLog();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    CWFGetOSLog();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v23 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_send_and_compose_impl();
  }

  self->_isNextRequestScheduled = 0;
  uint64_t v22 = self->_nextRequestTimer;
  dispatch_time_t v21 = -1LL;
LABEL_18:
  dispatch_source_set_timer((dispatch_source_t)v22, v21, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

- (unint64_t)__nextRequestInterval
{
  uint64_t v208 = *MEMORY[0x1895F89C0];
  __uint64_t v178 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __int128 v199 = 0u;
  __int128 v200 = 0u;
  __int128 v201 = 0u;
  __int128 v202 = 0u;
  obuint64_t j = self->_pendingRequests;
  uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v199, (uint64_t)v207, 16);
  unint64_t v8 = 0LL;
  if (v166)
  {
    uint64_t v165 = *(void *)v200;
    __int128 v180 = self;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v200 != v165) {
          objc_enumerationMutation(obj);
        }
        uint64_t v167 = v9;
        throttleIntervalMap = self->_throttleIntervalMap;
        uint64_t v11 = (void *)MEMORY[0x189607968];
        objc_msgSend_parameters(*(void **)(*((void *)&v199 + 1) + 8 * v9), v4, v5, v6, v7);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = objc_msgSend_trigger(v12, v13, v14, v15, v16);
        objc_msgSend_numberWithInteger_(v11, v18, v17, v19, v20);
        dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(throttleIntervalMap, v22, (uint64_t)v21, v23, v24);
        int v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          objc_msgSend_objectForKeyedSubscript_(v180->_throttleIntervalMap, v26, (uint64_t)&unk_189E88958, v28, v29);
          int v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        __int128 v197 = 0u;
        __int128 v198 = 0u;
        __int128 v195 = 0u;
        __int128 v196 = 0u;
        objc_msgSend_intervals(v25, v26, v27, v28, v29);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v30, v31, v32, v33, v34);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

        id v168 = v35;
        __int128 v179 = v25;
        uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v195, (uint64_t)v206, 16);
        if (v172)
        {
          uint64_t v170 = *(void *)v196;
          self = v180;
          do
          {
            uint64_t v41 = 0LL;
            do
            {
              if (*(void *)v196 != v170) {
                objc_enumerationMutation(v168);
              }
              uint64_t v174 = v41;
              uint64_t v42 = *(void **)(*((void *)&v195 + 1) + 8 * v41);
              __int128 v191 = 0u;
              __int128 v192 = 0u;
              __int128 v193 = 0u;
              __int128 v194 = 0u;
              objc_msgSend_allKeys(self->_throttleTimestampMap, v37, v38, v39, v40);
              int v43 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_( v43,  v44,  (uint64_t)&v191,  (uint64_t)v205,  16);
              if (v45)
              {
                uint64_t v50 = v45;
                uint64_t v51 = *(void *)v192;
                do
                {
                  uint64_t v52 = 0LL;
                  uint64_t v181 = v50;
                  do
                  {
                    if (*(void *)v192 != v51) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v53 = *(void **)(*((void *)&v191 + 1) + 8 * v52);
                    uint64_t v54 = objc_msgSend_integerValue(v42, v46, v47, v48, v49);
                    if (v54 == objc_msgSend_integerValue(v53, v55, v56, v57, v58))
                    {
                      objc_msgSend_objectForKeyedSubscript_(self->_throttleTimestampMap, v46, (uint64_t)v53, v48, v49);
                      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_intervals(v25, v60, v61, v62, v63);
                      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v42, v66, v67);
                      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v68 && v59)
                      {
                        uint64_t v176 = objc_msgSend_unsignedLongValue(v59, v69, v70, v71, v72);
                        uint64_t v77 = v42;
                        uint64_t v78 = v51;
                        BOOL v79 = v43;
                        unint64_t v80 = objc_msgSend_unsignedLongValue(v68, v73, v74, v75, v76);
                        unint64_t v85 = 1000000000 * objc_msgSend_unsignedLongValue(v68, v81, v82, v83, v84);
                        uint64_t v90 = objc_msgSend_unsignedLongValue(v68, v86, v87, v88, v89);
                        unint64_t v91 = 1000000000 * v90;
                        BOOL v92 = v80 > v85;
                        int v43 = v79;
                        uint64_t v51 = v78;
                        uint64_t v42 = v77;
                        int v25 = v179;
                        self = v180;
                        if (v92) {
                          unint64_t v91 = v90;
                        }
                        unint64_t v93 = v91 - (v178 - v176);
                        if (v8 >= v93) {
                          unint64_t v94 = v91 - (v178 - v176);
                        }
                        else {
                          unint64_t v94 = v8;
                        }
                        if (v8) {
                          unint64_t v93 = v94;
                        }
                        if (v91 > v178 - v176) {
                          unint64_t v8 = v93;
                        }
                      }

                      uint64_t v50 = v181;
                    }

                    ++v52;
                  }

                  while (v50 != v52);
                  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_( v43,  v46,  (uint64_t)&v191,  (uint64_t)v205,  16);
                }

                while (v50);
              }

              uint64_t v41 = v174 + 1;
            }

            while (v174 + 1 != v172);
            uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_( v168,  v37,  (uint64_t)&v195,  (uint64_t)v206,  16);
          }

          while (v172);
        }

        else
        {
          self = v180;
        }

        __int128 v189 = 0u;
        __int128 v190 = 0u;
        __int128 v187 = 0u;
        __int128 v188 = 0u;
        objc_msgSend_intervalsBasedOnTriggerTimestamp(v25, v95, v96, v97, v98);
        uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v99, v100, v101, v102, v103);
        uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();

        id v169 = v104;
        uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v187, (uint64_t)v204, 16);
        if (v173)
        {
          uint64_t v171 = *(void *)v188;
          do
          {
            uint64_t v110 = 0LL;
            do
            {
              if (*(void *)v188 != v171) {
                objc_enumerationMutation(v169);
              }
              uint64_t v175 = v110;
              uint64_t v111 = *(void **)(*((void *)&v187 + 1) + 8 * v110);
              __int128 v183 = 0u;
              __int128 v184 = 0u;
              __int128 v185 = 0u;
              __int128 v186 = 0u;
              objc_msgSend_allKeys(self->_triggerTimestampMap, v106, v107, v108, v109);
              uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_( v112,  v113,  (uint64_t)&v183,  (uint64_t)v203,  16);
              if (v114)
              {
                uint64_t v119 = v114;
                uint64_t v120 = *(void *)v184;
                do
                {
                  uint64_t v121 = 0LL;
                  uint64_t v182 = v119;
                  do
                  {
                    if (*(void *)v184 != v120) {
                      objc_enumerationMutation(v112);
                    }
                    uint64_t v122 = *(void **)(*((void *)&v183 + 1) + 8 * v121);
                    uint64_t v123 = objc_msgSend_integerValue(v111, v115, v116, v117, v118);
                    if (v123 == objc_msgSend_integerValue(v122, v124, v125, v126, v127))
                    {
                      objc_msgSend_objectForKeyedSubscript_(self->_triggerTimestampMap, v115, (uint64_t)v122, v117, v118);
                      uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_intervalsBasedOnTriggerTimestamp(v25, v129, v130, v131, v132);
                      uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v133, v134, (uint64_t)v111, v135, v136);
                      uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v137 && v128)
                      {
                        uint64_t v177 = objc_msgSend_unsignedLongValue(v128, v138, v139, v140, v141);
                        id v146 = v111;
                        uint64_t v147 = v120;
                        __int128 v148 = v112;
                        unint64_t v149 = objc_msgSend_unsignedLongValue(v137, v142, v143, v144, v145);
                        unint64_t v154 = 1000000000 * objc_msgSend_unsignedLongValue(v137, v150, v151, v152, v153);
                        uint64_t v159 = objc_msgSend_unsignedLongValue(v137, v155, v156, v157, v158);
                        unint64_t v160 = 1000000000 * v159;
                        BOOL v92 = v149 > v154;
                        uint64_t v112 = v148;
                        uint64_t v120 = v147;
                        uint64_t v111 = v146;
                        int v25 = v179;
                        self = v180;
                        if (v92) {
                          unint64_t v160 = v159;
                        }
                        unint64_t v161 = v160 - (v178 - v177);
                        if (v8 >= v161) {
                          unint64_t v162 = v160 - (v178 - v177);
                        }
                        else {
                          unint64_t v162 = v8;
                        }
                        if (v8) {
                          unint64_t v161 = v162;
                        }
                        if (v160 > v178 - v177) {
                          unint64_t v8 = v161;
                        }
                      }

                      uint64_t v119 = v182;
                    }

                    ++v121;
                  }

                  while (v119 != v121);
                  uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_( v112,  v115,  (uint64_t)&v183,  (uint64_t)v203,  16);
                }

                while (v119);
              }

              uint64_t v110 = v175 + 1;
            }

            while (v175 + 1 != v173);
            uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_( v169,  v106,  (uint64_t)&v187,  (uint64_t)v204,  16);
          }

          while (v173);
        }

        uint64_t v9 = v167 + 1;
      }

      while (v167 + 1 != v166);
      uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v199, (uint64_t)v207, 16);
    }

    while (v166);
  }

  return v8;
}

- (void)__setupRetryIntervals
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v7, v8, 0, v9, v10);
  objc_msgSend_setMaxBSSChannelAge_(v7, v11, 2592000, v12, v13);
  objc_msgSend_setMaxBSSChannelCount_(v7, v14, 3, v15, v16);
  objc_msgSend_setPassiveScan_(v7, v17, 1, v18, v19);
  objc_msgSend_setDwellTime_(v7, v20, 110, v21, v22);
  uint64_t v27 = (void *)objc_msgSend_copy(v7, v23, v24, v25, v26);
  objc_msgSend_setAllowAutoHotspotFallback_(v27, v28, 1, v29, v30);
  id v31 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v31, v32, 1, v33, v34);
  objc_msgSend_setMaxBSSChannelAge_(v31, v35, 0, v36, v37);
  objc_msgSend_setMaxBSSChannelCount_(v31, v38, 3, v39, v40);
  objc_msgSend_setDwellTime_(v31, v41, 110, v42, v43);
  uint64_t v513 = objc_alloc_init(&OBJC_CLASS___CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v513, v44, 1, v45, v46);
  objc_msgSend_setMaxBSSChannelAge_(v513, v47, 604800, v48, v49);
  objc_msgSend_setMaxBSSChannelCount_(v513, v50, 3, v51, v52);
  objc_msgSend_setDwellTime_(v513, v53, 110, v54, v55);
  objc_msgSend_setPassiveScan_(v513, v56, 1, v57, v58);
  uint64_t v63 = (void *)objc_msgSend_copy(v31, v59, v60, v61, v62);
  objc_msgSend_setDwellTime_(v63, v64, 40, v65, v66);
  uint64_t v71 = (void *)objc_msgSend_copy(v63, v67, v68, v69, v70);
  objc_msgSend_setIncludeAdjacent5GHzChannel_(v71, v72, 1, v73, v74);
  id v512 = (void *)objc_msgSend_copy(v31, v75, v76, v77, v78);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v512, v79, 1, v80, v81);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v512, v82, 1, v83, v84);
  uint64_t v89 = (void *)objc_msgSend_copy(v7, v85, v86, v87, v88);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v89, v90, 1, v91, v92);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v89, v93, 1, v94, v95);
  id v511 = (void *)objc_msgSend_copy(v89, v96, v97, v98, v99);
  objc_msgSend_setAllowAutoHotspotFallback_(v511, v100, 1, v101, v102);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v103, 0, 1, v104);
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v106, (uint64_t)v105, v107, v108);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v109, 20, 1, v110);
  uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v112, (uint64_t)v111, v113, v114);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v115, 120, 1, v116);
  uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v118, (uint64_t)v117, v119, v120);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v121, 240, 1, v122);
  uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v124, (uint64_t)v123, v125, v126);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v127, 480, -1, v128);
  uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v130, (uint64_t)v129, v131, v132);

  uint64_t v137 = (void *)objc_msgSend_copy(v6, v133, v134, v135, v136);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v138, (uint64_t)v137, (uint64_t)&unk_189E88C10, v139);

  objc_msgSend_removeAllObjects(v6, v140, v141, v142, v143);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v144, 0, 1, v145);
  id v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v147, (uint64_t)v146, v148, v149);

  int v150 = 5;
  objc_msgSend_autoJoinRetryInterval_count_(v31, v151, 5, 2, v152);
  uint64_t v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v154, (uint64_t)v153, v155, v156);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v157, 10, 1, v158);
  uint64_t v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v160, (uint64_t)v159, v161, v162);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v163, 120, 1, v164);
  uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v166, (uint64_t)v165, v167, v168);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v169, 240, 1, v170);
  uint64_t v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v172, (uint64_t)v171, v173, v174);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v175, 480, -1, v176);
  uint64_t v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v178, (uint64_t)v177, v179, v180);

  __int128 v185 = (void *)objc_msgSend_copy(v6, v181, v182, v183, v184);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v186, (uint64_t)v185, (uint64_t)&unk_189E88C28, v187);

  objc_msgSend_removeAllObjects(v6, v188, v189, v190, v191);
  objc_msgSend_autoJoinRetryInterval_count_(v512, v192, 0, 1, v193);
  __int128 v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v195, (uint64_t)v194, v196, v197);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v198, 5, 2, v199);
  __int128 v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v201, (uint64_t)v200, v202, v203);

  objc_msgSend_autoJoinRetryInterval_count_(v511, v204, 10, 12, v205);
  uint64_t v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v207, (uint64_t)v206, v208, v209);

  objc_msgSend_autoJoinRetryInterval_count_(v511, v210, 20, -1, v211);
  uint64_t v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v213, (uint64_t)v212, v214, v215);

  uint64_t v220 = (void *)objc_msgSend_copy(v6, v216, v217, v218, v219);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v221, (uint64_t)v220, (uint64_t)&unk_189E888E0, v222);

  objc_msgSend_removeAllObjects(v6, v223, v224, v225, v226);
  objc_msgSend_autoJoinRetryInterval_count_(v513, v227, 120, 1, v228);
  uint64_t v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v230, (uint64_t)v229, v231, v232);

  objc_msgSend_autoJoinRetryInterval_count_(v513, v233, 240, 1, v234);
  uint64_t v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v236, (uint64_t)v235, v237, v238);

  objc_msgSend_autoJoinRetryInterval_count_(v513, v239, 480, -1, v240);
  uint64_t v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v242, (uint64_t)v241, v243, v244);

  uint64_t v249 = (void *)objc_msgSend_copy(v6, v245, v246, v247, v248);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v250, (uint64_t)v249, (uint64_t)&unk_189E88A48, v251);

  objc_msgSend_removeAllObjects(v6, v252, v253, v254, v255);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v256, 20, 1, v257);
  uint64_t v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v259, (uint64_t)v258, v260, v261);

  objc_msgSend_autoJoinRetryInterval_count_(v31, v262, 60, 4, v263);
  uint64_t v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v265, (uint64_t)v264, v266, v267);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v268, 120, 1, v269);
  uint64_t v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v271, (uint64_t)v270, v272, v273);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v274, 240, 1, v275);
  uint64_t v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v277, (uint64_t)v276, v278, v279);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v280, 480, -1, v281);
  uint64_t v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v283, (uint64_t)v282, v284, v285);

  uint64_t v290 = (void *)objc_msgSend_copy(v6, v286, v287, v288, v289);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v291, (uint64_t)v290, (uint64_t)&unk_189E88C40, v292);

  objc_msgSend_removeAllObjects(v6, v293, v294, v295, v296);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v297, 20, 1, v298);
  uint64_t v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v300, (uint64_t)v299, v301, v302);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v303, 20, 1, v304);
  uint64_t v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v306, (uint64_t)v305, v307, v308);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v309, 120, 1, v310);
  uint64_t v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v312, (uint64_t)v311, v313, v314);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v315, 240, 1, v316);
  uint64_t v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v318, (uint64_t)v317, v319, v320);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v321, 480, -1, v322);
  uint64_t v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v324, (uint64_t)v323, v325, v326);

  uint64_t v331 = (void *)objc_msgSend_copy(v6, v327, v328, v329, v330);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v332, (uint64_t)v331, (uint64_t)&unk_189E88AA8, v333);

  objc_msgSend_removeAllObjects(v6, v334, v335, v336, v337);
  do
  {
    objc_msgSend_autoJoinRetryInterval_count_(v63, v338, 0, 2, v339);
    uint64_t v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v341, (uint64_t)v340, v342, v343);

    objc_msgSend_autoJoinRetryInterval_count_(v71, v344, 0, 2, v345);
    uint64_t v346 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v347, (uint64_t)v346, v348, v349);

    objc_msgSend_autoJoinRetryInterval_count_(v7, v350, 0, 1, v351);
    uint64_t v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v353, (uint64_t)v352, v354, v355);

    objc_msgSend_autoJoinRetryInterval_count_(v63, v356, 1, 1, v357);
    uint64_t v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v359, (uint64_t)v358, v360, v361);

    --v150;
  }

  while (v150);
  uint64_t v364 = (void *)objc_msgSend_copy(v6, v338, v362, v363, v339);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v365, (uint64_t)v364, (uint64_t)&unk_189E88A30, v366);

  objc_msgSend_removeAllObjects(v6, v367, v368, v369, v370);
  objc_msgSend_autoJoinRetryInterval_count_(v7, v371, 360, 1, v372);
  id v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v374, (uint64_t)v373, v375, v376);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v377, 900, -1, v378);
  uint64_t v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v380, (uint64_t)v379, v381, v382);

  uint64_t v387 = (void *)objc_msgSend_copy(v6, v383, v384, v385, v386);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v388, (uint64_t)v387, (uint64_t)&unk_189E88928, v389);

  objc_msgSend_removeAllObjects(v6, v390, v391, v392, v393);
  objc_msgSend_autoJoinRetryInterval_count_(v7, v394, 900, -1, v395);
  uint64_t v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v397, (uint64_t)v396, v398, v399);

  uint64_t v404 = (void *)objc_msgSend_copy(v6, v400, v401, v402, v403);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v405, (uint64_t)v404, (uint64_t)&unk_189E88B20, v406);

  objc_msgSend_removeAllObjects(v6, v407, v408, v409, v410);
  objc_msgSend_autoJoinRetryInterval_count_(v89, v411, 0, 1, v412);
  uint64_t v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v414, (uint64_t)v413, v415, v416);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v417, 5, 2, v418);
  uint64_t v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v420, (uint64_t)v419, v421, v422);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v423, 10, 2, v424);
  uint64_t v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v426, (uint64_t)v425, v427, v428);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v429, 20, 16, v430);
  uint64_t v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v432, (uint64_t)v431, v433, v434);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v435, 120, 1, v436);
  uint64_t v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v438, (uint64_t)v437, v439, v440);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v441, 240, 1, v442);
  id v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v444, (uint64_t)v443, v445, v446);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v447, 480, -1, v448);
  uint64_t v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v450, (uint64_t)v449, v451, v452);

  uint64_t v457 = (void *)objc_msgSend_copy(v6, v453, v454, v455, v456);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v458, (uint64_t)v457, (uint64_t)&unk_189E88C58, v459);

  objc_msgSend_removeAllObjects(v6, v460, v461, v462, v463);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v464, 0, 1, v465);
  int v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v467, (uint64_t)v466, v468, v469);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v470, 5, 2, v471);
  uint64_t v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v473, (uint64_t)v472, v474, v475);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v476, 30, 5, v477);
  uint64_t v478 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v479, (uint64_t)v478, v480, v481);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v482, 60, 5, v483);
  uint64_t v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v485, (uint64_t)v484, v486, v487);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v488, 480, -1, v489);
  __int128 v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v491, (uint64_t)v490, v492, v493);

  __int16 v498 = (void *)objc_msgSend_copy(v6, v494, v495, v496, v497);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v499, (uint64_t)v498, (uint64_t)&unk_189E88C70, v500);

  objc_msgSend_removeAllObjects(v6, v501, v502, v503, v504);
  CWFGetOSLog();
  uint64_t v505 = (void *)objc_claimAutoreleasedReturnValue();
  if (v505)
  {
    CWFGetOSLog();
    uint64_t v506 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v506 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v507 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v506, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_retryIntervalMap, v508, (uint64_t)&unk_189E5CBF8, v509, v510);
}

- (BOOL)__forceNearbyNetworkRetrySchedule
{
  unint64_t v2 = self->_retrySchedule - 3;
  return (v2 >= 7 || ((0x67u >> v2) & 1) == 0)
      && self->_lowRSSICandidateFoundTimestamp
      && clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_lowRSSICandidateFoundTimestamp < 0x45D964B800LL;
}

- (id)__retryIntervalWithScheduleIndex:(unint64_t)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  int64_t retrySchedule = self->_retrySchedule;
  if (objc_msgSend___forceNearbyNetworkRetrySchedule(self, a2, a3, v3, v4))
  {
    CWFGetOSLog();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      CWFGetOSLog();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v13 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v41[0] = 67109376;
      v41[1] = 300;
      __int16 v42 = 1024;
      int v43 = -90;
      int v35 = 14;
      uint64_t v34 = v41;
      _os_log_send_and_compose_impl();
    }

    int64_t retrySchedule = 10LL;
  }

  retryIntervalMap = self->_retryIntervalMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v8, retrySchedule, v9, v10, v34, v35);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(retryIntervalMap, v16, (uint64_t)v15, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v20 = v19;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v22)
  {
    uint64_t v27 = v22;
    unint64_t v28 = 0LL;
    uint64_t v29 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v20);
        }
        id v31 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (__CFADD__(v28, objc_msgSend_count(v31, v23, v24, v25, v26))) {
          unint64_t v28 = -1LL;
        }
        else {
          v28 += objc_msgSend_count(v31, v23, v24, v25, v26);
        }
        if (v28 > a3)
        {
          id v32 = v31;
          goto LABEL_21;
        }
      }

      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v36, (uint64_t)v40, 16);
      if (v27) {
        continue;
      }
      break;
    }
  }

  id v32 = 0LL;
LABEL_21:

  return v32;
}

- (id)__retryInterval
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  objc_msgSend___retryIntervalWithScheduleIndex_(v2, v3, v2->_retryScheduleIndex, v4, v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)__applyRetryIntervalSkew:(unint64_t)a3
{
  double v3 = (double)a3 * 0.1;
  unint64_t v4 = a3 - (unint64_t)v3;
  unint64_t v5 = (unint64_t)v3 + a3;
  uint32_t v6 = arc4random();
  return v4
       + (v5 - v4) * (unint64_t)((double)(v6 + ((v6 / 0x7FFFFFFF) | ((v6 / 0x7FFFFFFF) << 31))) / 2147483650.0);
}

- (int64_t)__retryTriggerForRetrySchedule:(int64_t)a3
{
  else {
    return qword_18653E500[a3 - 2];
  }
}

- (void)__updateRetrySchedule
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  if (!self->_retryTimer)
  {
    dispatch_get_global_queue(0LL, 0LL);
    unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint32_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v5);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v6;

    unint64_t v8 = self->_retryTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = sub_1864B93D8;
    handler[3] = &unk_189E5BC10;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }

  if (!self->_activeRequest)
  {
    objc_msgSend___retryIntervalWithScheduleIndex_(self, a2, self->_retryScheduleIndex, v2, v3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v9;
    if (v9)
    {
      unint64_t v15 = objc_msgSend_interval(v9, v10, v11, v12, v13);
      unint64_t v20 = 1000000000 * objc_msgSend_interval(v14, v16, v17, v18, v19);
      uint64_t v25 = objc_msgSend_interval(v14, v21, v22, v23, v24);
      if (v15 <= v20) {
        unint64_t v29 = objc_msgSend___applyRetryIntervalSkew_(self, v26, 1000000000 * v25, v27, v28);
      }
      else {
        unint64_t v29 = objc_msgSend___applyRetryIntervalSkew_(self, v26, v25, v27, v28);
      }
      if (v29 > 0x7FFFFFFFFFFFFFFELL)
      {
        unint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
      }

      else
      {
        unint64_t v34 = objc_msgSend_interval(v14, v30, v31, v32, v33);
        unint64_t v39 = 1000000000 * objc_msgSend_interval(v14, v35, v36, v37, v38);
        uint64_t v44 = objc_msgSend_interval(v14, v40, v41, v42, v43);
        if (v34 <= v39) {
          uint64_t v48 = objc_msgSend___applyRetryIntervalSkew_(self, v45, 1000000000 * v44, v46, v47);
        }
        else {
          uint64_t v48 = objc_msgSend___applyRetryIntervalSkew_(self, v45, v44, v46, v47);
        }
        unint64_t v49 = v48;
      }

      CWFGetOSLog();
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        CWFGetOSLog();
        uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v55 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v56 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_isRetryScheduled) {
          uint64_t v61 = @"Re-scheduling";
        }
        else {
          uint64_t v61 = @"Scheduling";
        }
        sub_1864530EC(self->_retrySchedule, v57, v58, v59, v60);
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t retryScheduleIndex = self->_retryScheduleIndex;
        int v83 = 138544386;
        uint64_t v84 = v61;
        __int16 v85 = 2048;
        unint64_t v86 = v49 / 0xF4240;
        __int16 v87 = 2114;
        uint64_t v88 = v62;
        __int16 v89 = 2048;
        unint64_t v90 = retryScheduleIndex;
        __int16 v91 = 2114;
        uint64_t v92 = v14;
        _os_log_send_and_compose_impl();
      }

      self->_BOOL isRetryScheduled = 1;
      uint64_t v64 = self->_retryTimer;
      dispatch_time_t v65 = dispatch_walltime(0LL, v49);
      uint64_t v66 = v64;
    }

    else
    {
      BOOL isRetryScheduled = self->_isRetryScheduled;
      uint64_t v51 = CWFGetOSLog();
      uint64_t v52 = (void *)v51;
      if (!isRetryScheduled)
      {
        if (v51)
        {
          CWFGetOSLog();
          uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v67 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v75 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          sub_1864530EC(self->_retrySchedule, v76, v77, v78, v79);
          uint64_t v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
          unint64_t v81 = self->_retryScheduleIndex;
          int v83 = 138543618;
          uint64_t v84 = v80;
          __int16 v85 = 2048;
          unint64_t v86 = v81;
          _os_log_send_and_compose_impl();
        }

        goto LABEL_33;
      }

      if (v51)
      {
        CWFGetOSLog();
        uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v53 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v68 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        sub_1864530EC(self->_retrySchedule, v69, v70, v71, v72);
        uint64_t v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unint64_t v74 = self->_retryScheduleIndex;
        int v83 = 138543618;
        uint64_t v84 = v73;
        __int16 v85 = 2048;
        unint64_t v86 = v74;
        _os_log_send_and_compose_impl();
      }

      self->_BOOL isRetryScheduled = 0;
      uint64_t v66 = self->_retryTimer;
      dispatch_time_t v65 = -1LL;
    }

    dispatch_source_set_timer((dispatch_source_t)v66, v65, 0xFFFFFFFFFFFFFFFFLL, 0LL);
LABEL_33:
  }

- (BOOL)__calloutToAllowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1864B9818;
  uint64_t v31 = sub_1864B9828;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CC18);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v11 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v37 = 134219010;
    unint64_t v38 = v8 / 0x3B9ACA00;
    __int16 v39 = 2048;
    unint64_t v40 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v41 = 2082;
    uint64_t v42 = "-[CWFAutoJoinManager __calloutToAllowAutoJoinWithTrigger:error:]";
    __int16 v43 = 2082;
    uint64_t v44 = "CWFAutoJoinManager.m";
    __int16 v45 = 1024;
    int v46 = 6676;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864B9834;
  block[3] = &unk_189E5CC68;
  void block[4] = self;
  uint64_t v21 = &v33;
  uint64_t v22 = &v27;
  uint64_t v23 = v25;
  int64_t v24 = a3;
  id v14 = v7;
  id v20 = v14;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v15);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    uint64_t v16 = (void *)v28[5];
    if (v16) {
      *a4 = v16;
    }
  }

  BOOL v17 = *((_BYTE *)v34 + 24) != 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (BOOL)__calloutToAllowKnownNetwork:(id)a3 trigger:(int64_t)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 queue:(id)a7 error:(id *)a8
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a5;
  uint64_t v19 = (dispatch_queue_s *)a7;
  uint64_t v65 = 0LL;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000LL;
  char v68 = 0;
  uint64_t v61 = 0LL;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000LL;
  char v64 = 0;
  uint64_t v55 = 0LL;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  uint64_t v58 = sub_1864B9818;
  uint64_t v59 = sub_1864B9828;
  id v60 = 0LL;
  if (v19)
  {
    v53[0] = 0LL;
    v53[1] = v53;
    v53[2] = 0x2020000000LL;
    int v54 = 0;
    dispatch_block_t v20 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CC88);
    __uint64_t v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      CWFGetOSLog();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v23 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v30 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v71 = 134219010;
      unint64_t v72 = v21 / 0x3B9ACA00;
      __int16 v73 = 2048;
      unint64_t v74 = v21 % 0x3B9ACA00 / 0x3E8;
      __int16 v75 = 2082;
      uint64_t v76 = "-[CWFAutoJoinManager __calloutToAllowKnownNetwork:trigger:allowForSeamlessSSIDTransition:defer:queue:error:]";
      __int16 v77 = 2082;
      uint64_t v78 = "CWFAutoJoinManager.m";
      __int16 v79 = 1024;
      int v80 = 6717;
      _os_log_send_and_compose_impl();
    }

    qos_class_t v31 = qos_class_self();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1864BA07C;
    block[3] = &unk_189E5CCD8;
    void block[4] = self;
    id v45 = v13;
    int64_t v52 = a4;
    uint64_t v48 = &v65;
    unint64_t v49 = &v61;
    uint64_t v50 = &v55;
    uint64_t v51 = v53;
    id v46 = v14;
    id v47 = v20;
    id v32 = v20;
    dispatch_block_t v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v31, 0, block);
    dispatch_async(v19, v33);

    dispatch_block_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v53, 8);
  }

  else
  {
    objc_msgSend_allowKnownNetworkHandler(self, v15, v16, v17, v18);
    int64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_allowKnownNetworkHandler(self, v25, v26, v27, v28);
      uint64_t v29 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1895F87A8];
      v43[1] = 3221225472LL;
      v43[2] = sub_1864BA408;
      v43[3] = &unk_189E5CD00;
      v43[4] = &v65;
      v43[5] = &v61;
      v43[6] = &v55;
      ((void (**)(void, id, int64_t, id, void *))v29)[2](v29, v13, a4, v14, v43);
    }

    else
    {
      int v37 = (void *)MEMORY[0x189607870];
      uint64_t v69 = *MEMORY[0x1896075E0];
      uint64_t v70 = @"CWFAutoJoinManager.allowKnownNetworkHandler() not configured";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v25, (uint64_t)&v70, (uint64_t)&v69, 1);
      unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, *MEMORY[0x189607688], 6, (uint64_t)v38);
      __int16 v41 = (void *)v56[5];
      v56[5] = v40;
    }
  }

  if (a6 && *((_BYTE *)v62 + 24)) {
    *a6 = 1;
  }
  if (a8)
  {
    unint64_t v34 = (void *)v56[5];
    if (v34) {
      *a8 = v34;
    }
  }

  BOOL v35 = *((_BYTE *)v66 + 24) != 0;
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v35;
}

- (id)__calloutToScanForNetworksWithParameters:(id)a3 scanChannels:(id *)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v53 = 0LL;
  int v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  id v56 = sub_1864B9818;
  uint64_t v57 = sub_1864B9828;
  id v58 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  uint64_t v50 = sub_1864B9818;
  uint64_t v51 = sub_1864B9828;
  id v52 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  uint64_t v44 = sub_1864B9818;
  id v45 = sub_1864B9828;
  id v46 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  int v40 = 0;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CD20);
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v59 = 134219010;
    unint64_t v60 = v10 / 0x3B9ACA00;
    __int16 v61 = 2048;
    unint64_t v62 = v10 % 0x3B9ACA00 / 0x3E8;
    __int16 v63 = 2082;
    char v64 = "-[CWFAutoJoinManager __calloutToScanForNetworksWithParameters:scanChannels:error:]";
    __int16 v65 = 2082;
    uint64_t v66 = "CWFAutoJoinManager.m";
    __int16 v67 = 1024;
    int v68 = 6776;
    int v31 = 48;
    id v30 = &v59;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v15 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BA804;
  block[3] = &unk_189E5CD70;
  void block[4] = self;
  id v16 = v8;
  id v33 = v16;
  BOOL v35 = &v53;
  char v36 = &v47;
  int v37 = &v41;
  unint64_t v38 = v39;
  id v17 = v9;
  id v34 = v17;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    uint64_t v23 = (void *)v48[5];
    if (v23) {
      *a4 = v23;
    }
  }

  if (a5)
  {
    int64_t v24 = (void *)v42[5];
    if (v24) {
      *a5 = v24;
    }
  }

  id v28 = (id)v54[5];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v28;
}

- (id)__calloutToPerformGASQueryWithParameters:(id)a3 GASQueryNetworks:(id *)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = sub_1864B9818;
  uint64_t v48 = sub_1864B9828;
  id v49 = 0LL;
  uint64_t v38 = 0LL;
  __int16 v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = sub_1864B9818;
  uint64_t v42 = sub_1864B9828;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  BOOL v35 = sub_1864B9818;
  char v36 = sub_1864B9828;
  id v37 = 0LL;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  int v31 = 0;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CD90);
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v50 = 134219010;
    unint64_t v51 = v10 / 0x3B9ACA00;
    __int16 v52 = 2048;
    unint64_t v53 = v10 % 0x3B9ACA00 / 0x3E8;
    __int16 v54 = 2082;
    uint64_t v55 = "-[CWFAutoJoinManager __calloutToPerformGASQueryWithParameters:GASQueryNetworks:error:]";
    __int16 v56 = 2082;
    uint64_t v57 = "CWFAutoJoinManager.m";
    __int16 v58 = 1024;
    int v59 = 6827;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v15 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BAF64;
  block[3] = &unk_189E5CD70;
  void block[4] = self;
  id v16 = v8;
  id v24 = v16;
  uint64_t v26 = &v44;
  uint64_t v27 = &v38;
  id v28 = &v32;
  uint64_t v29 = v30;
  id v17 = v9;
  id v25 = v17;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    uint64_t v19 = (void *)v39[5];
    if (v19) {
      *a4 = v19;
    }
  }

  if (a5)
  {
    uint64_t v20 = (void *)v33[5];
    if (v20) {
      *a5 = v20;
    }
  }

  id v21 = (id)v45[5];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v21;
}

- (BOOL)__calloutToAllowJoinCandidate:(id)a3 trigger:(int64_t)a4 defer:(BOOL *)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  uint64_t v34 = 0LL;
  BOOL v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  id v37 = sub_1864B9818;
  uint64_t v38 = sub_1864B9828;
  id v39 = 0LL;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  int v33 = 0;
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CDB0);
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CWFGetOSLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v15 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v48 = 134219010;
    unint64_t v49 = v12 / 0x3B9ACA00;
    __int16 v50 = 2048;
    unint64_t v51 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v52 = 2082;
    unint64_t v53 = "-[CWFAutoJoinManager __calloutToAllowJoinCandidate:trigger:defer:error:]";
    __int16 v54 = 2082;
    uint64_t v55 = "CWFAutoJoinManager.m";
    __int16 v56 = 1024;
    int v57 = 6874;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v17 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BB6B0;
  block[3] = &unk_189E5CDD8;
  void block[4] = self;
  id v18 = v10;
  id v25 = v18;
  uint64_t v27 = &v44;
  id v28 = &v40;
  uint64_t v29 = &v34;
  id v30 = v32;
  int64_t v31 = a4;
  id v19 = v11;
  id v26 = v19;
  dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v17, 0, block);
  dispatch_async(targetQueue, v20);

  dispatch_block_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && *((_BYTE *)v41 + 24)) {
    *a5 = 1;
  }
  if (a6)
  {
    id v21 = (void *)v35[5];
    if (v21) {
      *a6 = v21;
    }
  }

  BOOL v22 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v22;
}

- (BOOL)__calloutToAssociateWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1864B9818;
  int64_t v31 = sub_1864B9828;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CDF8);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v11 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134219010;
    unint64_t v34 = v8 / 0x3B9ACA00;
    __int16 v35 = 2048;
    unint64_t v36 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v37 = 2082;
    uint64_t v38 = "-[CWFAutoJoinManager __calloutToAssociateWithParameters:error:]";
    __int16 v39 = 2082;
    uint64_t v40 = "CWFAutoJoinManager.m";
    __int16 v41 = 1024;
    int v42 = 6917;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BBD4C;
  block[3] = &unk_189E5CE48;
  void block[4] = self;
  id v14 = v6;
  id v21 = v14;
  uint64_t v23 = &v27;
  id v24 = v25;
  id v15 = v7;
  id v22 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  qos_class_t v17 = (void *)v28[5];
  if (a4 && v17)
  {
    *a4 = v17;
    qos_class_t v17 = (void *)v28[5];
  }

  BOOL v18 = v17 == 0LL;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (int64_t)__calloutToAllowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1864B9818;
  int64_t v31 = sub_1864B9828;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CE68);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v11 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v37 = 134219010;
    unint64_t v38 = v8 / 0x3B9ACA00;
    __int16 v39 = 2048;
    unint64_t v40 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v41 = 2082;
    int v42 = "-[CWFAutoJoinManager __calloutToAllowAutoHotspotWithTrigger:error:]";
    __int16 v43 = 2082;
    uint64_t v44 = "CWFAutoJoinManager.m";
    __int16 v45 = 1024;
    int v46 = 6954;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BC3BC;
  block[3] = &unk_189E5CC68;
  void block[4] = self;
  id v21 = &v33;
  id v22 = &v27;
  uint64_t v23 = v25;
  int64_t v24 = a3;
  id v14 = v7;
  id v20 = v14;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v15);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    dispatch_block_t v16 = (void *)v28[5];
    if (v16) {
      *a4 = v16;
    }
  }

  int64_t v17 = v34[3];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (BOOL)__calloutToAllowHotspot:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  int64_t v31 = sub_1864B9818;
  id v32 = sub_1864B9828;
  id v33 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CEB0);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v11 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v38 = 134219010;
    unint64_t v39 = v8 / 0x3B9ACA00;
    __int16 v40 = 2048;
    unint64_t v41 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v42 = 2082;
    __int16 v43 = "-[CWFAutoJoinManager __calloutToAllowHotspot:error:]";
    __int16 v44 = 2082;
    __int16 v45 = "CWFAutoJoinManager.m";
    __int16 v46 = 1024;
    int v47 = 6992;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BCA64;
  block[3] = &unk_189E5CED8;
  void block[4] = self;
  id v14 = v6;
  id v21 = v14;
  uint64_t v23 = &v34;
  int64_t v24 = &v28;
  id v25 = v26;
  id v15 = v7;
  id v22 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    int64_t v17 = (void *)v29[5];
    if (v17) {
      *a4 = v17;
    }
  }

  BOOL v18 = *((_BYTE *)v35 + 24) != 0;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

- (id)__calloutToBrowseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t v39 = 0LL;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  __int16 v42 = sub_1864B9818;
  __int16 v43 = sub_1864B9828;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = sub_1864B9818;
  char v37 = sub_1864B9828;
  id v38 = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  int v32 = 0;
  dispatch_block_t v11 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CEF8);
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  qos_class_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CWFGetOSLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v15 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v45 = 134219010;
    unint64_t v46 = v12 / 0x3B9ACA00;
    __int16 v47 = 2048;
    unint64_t v48 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v49 = 2082;
    __int16 v50 = "-[CWFAutoJoinManager __calloutToBrowseForHotspotsWithTimeout:maxCacheAge:cacheOnly:error:]";
    __int16 v51 = 2082;
    __int16 v52 = "CWFAutoJoinManager.m";
    __int16 v53 = 1024;
    int v54 = 7030;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v17 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BD110;
  block[3] = &unk_189E5CF48;
  unint64_t v28 = a3;
  unint64_t v29 = a4;
  BOOL v30 = a5;
  void block[4] = self;
  id v25 = &v39;
  int v26 = &v33;
  int v27 = v31;
  id v18 = v11;
  id v24 = v18;
  dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v17, 0, block);
  dispatch_async(targetQueue, v19);

  dispatch_block_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    id v20 = (void *)v34[5];
    if (v20) {
      *a6 = v20;
    }
  }

  id v21 = (id)v40[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v21;
}

- (BOOL)__calloutToConnectToHotspot:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v27 = 0LL;
  unint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  BOOL v30 = sub_1864B9818;
  int64_t v31 = sub_1864B9828;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0LL, &unk_189E5CF68);
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v11 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134219010;
    unint64_t v34 = v8 / 0x3B9ACA00;
    __int16 v35 = 2048;
    unint64_t v36 = v8 % 0x3B9ACA00 / 0x3E8;
    __int16 v37 = 2082;
    id v38 = "-[CWFAutoJoinManager __calloutToConnectToHotspot:error:]";
    __int16 v39 = 2082;
    __int16 v40 = "CWFAutoJoinManager.m";
    __int16 v41 = 1024;
    int v42 = 7067;
    _os_log_send_and_compose_impl();
  }

  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  qos_class_t v13 = qos_class_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BD7AC;
  block[3] = &unk_189E5CE48;
  void block[4] = self;
  id v14 = v6;
  id v21 = v14;
  uint64_t v23 = &v27;
  id v24 = v25;
  id v15 = v7;
  id v22 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  qos_class_t v17 = (void *)v28[5];
  if (a4 && v17)
  {
    *a4 = v17;
    qos_class_t v17 = (void *)v28[5];
  }

  BOOL v18 = v17 == 0LL;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (id)allowAutoJoinHandler
{
  return objc_getProperty(self, a2, 424LL, 1);
}

- (void)setAllowAutoJoinHandler:(id)a3
{
}

- (id)allowKnownNetworkHandler
{
  return objc_getProperty(self, a2, 432LL, 1);
}

- (void)setAllowKnownNetworkHandler:(id)a3
{
}

- (id)knownNetworkComparator
{
  return objc_getProperty(self, a2, 440LL, 1);
}

- (void)setKnownNetworkComparator:(id)a3
{
}

- (id)scanForNetworksHandler
{
  return objc_getProperty(self, a2, 448LL, 1);
}

- (void)setScanForNetworksHandler:(id)a3
{
}

- (id)performGASQueryHandler
{
  return objc_getProperty(self, a2, 456LL, 1);
}

- (void)setPerformGASQueryHandler:(id)a3
{
}

- (id)allowJoinCandidateHandler
{
  return objc_getProperty(self, a2, 464LL, 1);
}

- (void)setAllowJoinCandidateHandler:(id)a3
{
}

- (id)joinCandidateComparator
{
  return objc_getProperty(self, a2, 472LL, 1);
}

- (void)setJoinCandidateComparator:(id)a3
{
}

- (id)associateToNetworkHandler
{
  return objc_getProperty(self, a2, 480LL, 1);
}

- (void)setAssociateToNetworkHandler:(id)a3
{
}

- (id)allowAutoHotspotHandler
{
  return objc_getProperty(self, a2, 488LL, 1);
}

- (void)setAllowAutoHotspotHandler:(id)a3
{
}

- (id)allowHotspotHandler
{
  return objc_getProperty(self, a2, 496LL, 1);
}

- (void)setAllowHotspotHandler:(id)a3
{
}

- (id)browseForHotspotsHandler
{
  return objc_getProperty(self, a2, 504LL, 1);
}

- (void)setBrowseForHotspotsHandler:(id)a3
{
}

- (id)connectToHotspotHandler
{
  return objc_getProperty(self, a2, 512LL, 1);
}

- (void)setConnectToHotspotHandler:(id)a3
{
}

- (id)updateKnownNetworkHandler
{
  return objc_getProperty(self, a2, 520LL, 1);
}

- (void)setUpdateKnownNetworkHandler:(id)a3
{
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 528LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 536LL, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 544LL, 1);
}

- (void)setTargetQueue:(id)a3
{
}

- (NSString)colocatedScopeID
{
  return self->_colocatedScopeID;
}

- (void)setColocatedScopeID:(id)a3
{
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (void).cxx_destruct
{
}

@end