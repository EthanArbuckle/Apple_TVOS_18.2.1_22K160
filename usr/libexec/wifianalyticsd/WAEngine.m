@interface WAEngine
- (AnalyticsProcessor)analyticsProcessor;
- (BOOL)_isDPSQuickRecoveryEngineUsed;
- (BOOL)analyticsProcessorIsReady;
- (BOOL)canProcessWiFiAnalyticsMessageJSONFiles:(id)a3;
- (BOOL)didSymptomsConditionRecoverAfterDecision;
- (BOOL)dnsStudyInProgress;
- (BOOL)dpsCurrentlyGatheringConsecutiveSamples;
- (BOOL)dpsNotificationDuringDnsStudy;
- (BOOL)dpsStudyInProgress;
- (BOOL)everAssociated:(BOOL)a3 assocDoneSuccess:(BOOL)a4;
- (BOOL)fetchConfiguredDnsInfo;
- (BOOL)forceStudyErrorFromMsg;
- (BOOL)isAWDLActivitySuspected;
- (BOOL)isAXAssociatoin;
- (BOOL)isAssociated;
- (BOOL)isAssociatedSinceStudyStart;
- (BOOL)isAssociatedStateKnown;
- (BOOL)isCaptiveServerIPResolved;
- (BOOL)isCriticalAppInUse;
- (BOOL)isGatewayReachable;
- (BOOL)isIPv4Address:(id)a3;
- (BOOL)isInternalInstall;
- (BOOL)isInternalScenario;
- (BOOL)isMemoryPressureRequestDeferred;
- (BOOL)isNWActivityInProgress;
- (BOOL)isPingEnqueueFailing;
- (BOOL)isPoorSymptomsDnsConditions;
- (BOOL)isScoreBelowThreshold:(id)a3 type:(unint64_t)a4 instanceId:(unsigned int)a5;
- (BOOL)isUsingCustomDNSSettings;
- (BOOL)isWiFiAppInstalled;
- (BOOL)isWiFiAssociatedToNetwork;
- (BOOL)isWiFiInterfacePrimary;
- (BOOL)isWiFiNetworkCaptive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)persistFileExistedAtPIDLoad;
- (BOOL)populateApProfile:(id)a3;
- (BOOL)queryInfraInterfaceInstanceAndChip;
- (BOOL)readingPersistFile;
- (BOOL)slowWiFiNotificationDuringDnsStudy;
- (BOOL)slowWiFiStudyInProgress;
- (BOOL)submitterMapCheck:(id)a3 group:(int64_t)a4;
- (BOOL)tmpFilesHaveAttemptedProcessingInDataStreamPath;
- (BOOL)workReportTimerRunning;
- (BOOL)writingPersistFile;
- (CADataTransformEngine)transformEngine;
- (DPSQuickRecoveryRecommendationEngine)dpsQuickRecoveryEngine;
- (DatapathMetricStream)datapathMetricStream;
- (ManagedConfiguration)managedConfiguration;
- (NSDate)lastDateDetermineChannelsPerIORPopulatableQueried;
- (NSDate)lastDateWiFiAppInstalledQueried;
- (NSDate)pidLaunchDate;
- (NSDate)profileMegaDisabledDate;
- (NSDate)profileMegaEnabledDate;
- (NSDictionary)nowCacheUsageForTelemetry;
- (NSDictionary)oldCacheUsageForTelemetry;
- (NSMutableArray)accessPointInfoToAppend;
- (NSMutableArray)assocDiffToAppend;
- (NSMutableArray)dpsapToAppend;
- (NSMutableArray)dpscsToAppend;
- (NSMutableArray)dpsnToAppend;
- (NSMutableArray)pendingUntokenedConnections;
- (NSMutableArray)swfnToAppend;
- (NSMutableArray)usbEventNotificationToAppend;
- (NSMutableDictionary)cachedModelObjectsKeyToMessageMap;
- (NSMutableDictionary)cachedUsage;
- (NSMutableDictionary)interfaceNameToApple80211InstanceMap;
- (NSMutableDictionary)probeContextBE;
- (NSMutableDictionary)probeContextBK;
- (NSMutableDictionary)probeContextVI;
- (NSMutableDictionary)probeContextVO;
- (NSMutableDictionary)processTokenToGroupTypeMap;
- (NSMutableDictionary)processTokenToXPCConnectionMap;
- (NSMutableDictionary)studyTimeStamps;
- (NSMutableDictionary)submitterMap;
- (NSString)appleCaptiveServerIP;
- (NSString)infraInterfaceName;
- (NSString)wifiChipSet;
- (NSURL)wifianalyticsTmpDir;
- (NSXPCListener)listener;
- (OS_dispatch_queue)dnsStudyQueue;
- (OS_dispatch_queue)dpsReadWriteSerialQueue;
- (OS_dispatch_queue)engineQ;
- (OS_dispatch_queue)fileHandlingQ;
- (OS_dispatch_queue)manageConfigQueue;
- (OS_dispatch_queue)mutexQueue;
- (OS_dispatch_queue)peerDiagnosticsStudyQueue;
- (OS_dispatch_queue)studyQueue;
- (OS_dispatch_source)jsonFilerReaderTimer;
- (OS_dispatch_source)workReportTimer;
- (OS_os_transaction)dnsStudyTransaction;
- (OS_os_transaction)dpsStudyTransaction;
- (OS_os_transaction)slowwifiStudyTransaction;
- (RecommendationEngine)recommendationEngine;
- (RecommendationPreferences)preferences;
- (WACoreCapture)coreCaptureControl;
- (WAEngine)init;
- (WAIOReporterMessagePopulator)iorMessagePopulator;
- (WAMessageAWDStore)messageStore;
- (double)analyticsAgeOutTimeIntervalSecs;
- (double)analyticsProcessingTimeIntervalSecs;
- (id)DatapathMetricGetter;
- (id)IPv4SubnetMasks;
- (id)IPv6PrefixLengths;
- (id)_DPSQuickRecoveryEngineObj;
- (id)__IPv4StateConfig;
- (id)__IPv6StateConfig;
- (id)__dnsSetupConfig;
- (id)__dnsStateConfig;
- (id)__ipv4SetupConfig;
- (id)_cachedModelObjectsMessageForGroupType:(int64_t)a3 key:(id)a4;
- (id)_createNextWorkReportSnapshot;
- (id)_createWorkReportDictionaryForTelemetryAndRollBucket;
- (id)_getBasePersistenceKeychainQuery;
- (id)_getDataFromKeychain:(id)a3;
- (id)_getDeviceAnalyticsConfiguration;
- (id)_getMessageByUUID:(id)a3 forProcessToken:(id)a4 error:(id *)a5;
- (id)_getMessagesModelForProcessToken:(id)a3 groupType:(int64_t)a4 andError:(id *)a5;
- (id)_getObscureKey;
- (id)_ingestMessage:(id)a3 forProcessToken:(id)a4;
- (id)_rotateObscureKey;
- (id)_setDeviceAnalyticsConfiguration:(id)a3;
- (id)_submitMessage:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5;
- (id)_submitWiFiAnalyticsMessageAdvanced:(id)a3;
- (id)_summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4;
- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessWithToken:(id)a5;
- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessWithToken:(id)a6;
- (id)getValueForKeyFromUserDefaults:(id)a3;
- (id)getW5Client;
- (id)getXPCConnectionForProcessToken:(id)a3;
- (int)dpsAction;
- (int)keybagToken;
- (int)pid;
- (int64_t)dnsServerConfigType;
- (int64_t)driverType;
- (unint64_t)_getTimeInProfileState:(unsigned __int8)a3;
- (unint64_t)abstime_to_ns:(unint64_t)a3;
- (unint64_t)cumulativeAverageCcaSinceStudyStart;
- (unint64_t)dpsNotificationCCA;
- (unint64_t)dpsNotificationTimeInSeconds;
- (unint64_t)impactedServersAtStudyEnd;
- (unint64_t)impactedServersAtStudyStart;
- (unint64_t)netscoreAtStudyEnd;
- (unint64_t)netscoreAtStudyStart;
- (unint64_t)numDataStallScoreBelowThresholdAfterTrap;
- (unint64_t)numDataStallScoreBelowThresholdBeforeTrap;
- (unint64_t)numIPv4DnsServers;
- (unint64_t)numIPv6DnsServers;
- (unint64_t)numLocalDnsServers;
- (unint64_t)numNetScoreBelowThresholdAfterTrap;
- (unint64_t)numNetScoreBelowThresholdBeforeTrap;
- (unint64_t)numRemoteDnsServers;
- (unint64_t)profileMegaDisabledSeconds;
- (unint64_t)profileMegaEnabledSeconds;
- (unint64_t)stallscoreAtStudyEnd;
- (unint64_t)stallscoreAtStudyStart;
- (unint64_t)totalDnsServers;
- (unint64_t)totalLANPingSuccessAfterTrap;
- (unint64_t)totalLANPingSuccessBeforeTrap;
- (unint64_t)totalLANPingsAfterTrap;
- (unint64_t)totalLANPingsBeforeTrap;
- (unint64_t)totalWANPingSuccessAfterTrap;
- (unint64_t)totalWANPingSuccessBeforeTrap;
- (unint64_t)totalWANPingsAfterTrap;
- (unint64_t)totalWANPingsBeforeTrap;
- (unint64_t)workReportSelectingSingleWithinFirstDay;
- (unint64_t)workReportSelectingSingleWithinFirstWeek;
- (unsigned)getIPv4InterfaceNetwork:(unsigned int)a3;
- (unsigned)getIPv4InterfaceSubnet;
- (unsigned)getIPv6InterfacePrefix;
- (unsigned)isMegaEnabled;
- (void)_calculateEstimatedUptime;
- (void)_calculateProcessUsage;
- (void)_calculateProfileUptime;
- (void)_cancelWorkReportRecurringTimer;
- (void)_clearMessageStoreAndReply:(id)a3;
- (void)_convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 forProcessToken:(id)a6 andReply:(id)a7;
- (void)_enableWorkReportRecurringTimer;
- (void)_examinePeerMessageForIntegrity:(id)a3;
- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7;
- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessToken:(id)a6 shouldCheckForPrePopulation:(BOOL)a7 andReply:(id)a8;
- (void)_getNewMessageForKeyWithinPopulatorBlock:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7;
- (void)_handleUnpersistForUsageData;
- (void)_initSubmitterAndQueryableRegistrationForProcessToken:(id)a3 andGroupType:(int64_t)a4;
- (void)_issueIOReportManagementCommand:(unint64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)_killDaemonAndReply:(id)a3;
- (void)_logWorkReport:(id)a3 indent:(int)a4 prefix:(id)a5;
- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)_persist;
- (void)_prepareToTerminate;
- (void)_prepareToTerminateViaEagerExit;
- (void)_processWAMessageForLogging:(id)a3;
- (void)_processWAMessageForNewIORPossibility:(id)a3;
- (void)_purgeGroupTypeIfNecessary:(int64_t)a3;
- (void)_removePersistenceFile;
- (void)_reportWorkReportInterval;
- (void)_saveKeyIVData:(id)a3 andTagData:(id)a4;
- (void)_sendMemoryPressureRequestAndReply:(id)a3;
- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4;
- (void)_trapFWWithReason:(id)a3 andReply:(id)a4;
- (void)_triggerDPSStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3;
- (void)_triggerQueryForNWActivity:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)_triggerSlowWiFiStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)_unpersist;
- (void)_updateProfileStateDate:(unsigned __int8)a3;
- (void)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4;
- (void)clearDnsStudyVariables;
- (void)computeAverageCcaSinceStudyStart:(id)a3;
- (void)convertToIPv6Network:(unsigned int *)a3 prefixLength:(unsigned int)a4;
- (void)createAndStartJsonReaderTimer;
- (void)dealloc;
- (void)fetchSymptomsScores:(unsigned int)a3;
- (void)gatherConsecutiveDatapathReadings:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)gatherConsecutiveLinkQualitySamples:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5;
- (void)gatherDiscoveredPeerInfo:(id)a3;
- (void)getIPv6InterfaceNetwork:(unsigned int *)a3 prefixLength:(unsigned int)a4;
- (void)handleMemoryWarning:(BOOL)a3;
- (void)initDatapathMetricGetterAndFetcher;
- (void)initializeProbeCxt;
- (void)keyBagLockStateChangeNotification;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persist;
- (void)populateChannelInfo:(id)a3;
- (void)prepareToTerminateAnyReply:(id)a3;
- (void)prepareToTerminateViaEagerExit;
- (void)processMetricDictOffEngine:(id)a3 data:(id)a4;
- (void)processMetricDictOnEngine:(id)a3 data:(id)a4;
- (void)processWiFiAnalyticsManagedFault:(id)a3;
- (void)processWiFiAnalyticsMessageJSONFilesInTmpDir:(BOOL)a3;
- (void)processWiFiAnalyticsMessageWAMFile:(id)a3 file:(id)a4;
- (void)resolveAppleCaptiveServer;
- (void)run;
- (void)sendWakeUpNotificationForProcessWithName:(id)a3;
- (void)setAccessPointInfoToAppend:(id)a3;
- (void)setAnalyticsAgeOutTimeIntervalSecs:(double)a3;
- (void)setAnalyticsProcessingTimeIntervalSecs:(double)a3;
- (void)setAnalyticsProcessor:(id)a3;
- (void)setAnalyticsProcessorIsReady:(BOOL)a3;
- (void)setAppleCaptiveServerIP:(id)a3;
- (void)setAssocDiffToAppend:(id)a3;
- (void)setCachedModelObjectsKeyToMessageMap:(id)a3;
- (void)setCachedUsage:(id)a3;
- (void)setCoreCaptureControl:(id)a3;
- (void)setCumulativeAverageCcaSinceStudyStart:(unint64_t)a3;
- (void)setDatapathMetricGetter:(id)a3;
- (void)setDatapathMetricStream:(id)a3;
- (void)setDidSymptomsConditionRecoverAfterDecision:(BOOL)a3;
- (void)setDnsServerConfigType:(int64_t)a3;
- (void)setDnsStudyInProgress:(BOOL)a3;
- (void)setDnsStudyQueue:(id)a3;
- (void)setDnsStudyTransaction:(id)a3;
- (void)setDpsAction:(int)a3;
- (void)setDpsCurrentlyGatheringConsecutiveSamples:(BOOL)a3;
- (void)setDpsNotificationCCA:(unint64_t)a3;
- (void)setDpsNotificationDuringDnsStudy:(BOOL)a3;
- (void)setDpsNotificationTimeInSeconds:(unint64_t)a3;
- (void)setDpsQuickRecoveryEngine:(id)a3;
- (void)setDpsReadWriteSerialQueue:(id)a3;
- (void)setDpsStudyInProgress:(BOOL)a3;
- (void)setDpsStudyTransaction:(id)a3;
- (void)setDpsapToAppend:(id)a3;
- (void)setDpscsToAppend:(id)a3;
- (void)setDpsnToAppend:(id)a3;
- (void)setDriverType:(int64_t)a3;
- (void)setEngineQ:(id)a3;
- (void)setFileHandlingQ:(id)a3;
- (void)setForceStudyErrorFromMsg:(BOOL)a3;
- (void)setImpactedServersAtStudyEnd:(unint64_t)a3;
- (void)setImpactedServersAtStudyStart:(unint64_t)a3;
- (void)setInfraInterfaceName:(id)a3;
- (void)setInterfaceNameToApple80211InstanceMap:(id)a3;
- (void)setIorMessagePopulator:(id)a3;
- (void)setIsAWDLActivitySuspected:(BOOL)a3;
- (void)setIsAssociated:(BOOL)a3;
- (void)setIsAssociatedSinceStudyStart:(BOOL)a3;
- (void)setIsAssociatedStateKnown:(BOOL)a3;
- (void)setIsCaptiveServerIPResolved:(BOOL)a3;
- (void)setIsCriticalAppInUse:(BOOL)a3;
- (void)setIsGatewayReachable:(BOOL)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setIsMegaEnabled:(unsigned __int8)a3;
- (void)setIsMemoryPressureRequestDeferred:(BOOL)a3;
- (void)setIsNWActivityInProgress:(BOOL)a3;
- (void)setIsPingEnqueueFailing:(BOOL)a3;
- (void)setIsPoorSymptomsDnsConditions:(BOOL)a3;
- (void)setIsWiFiAppInstalled:(BOOL)a3;
- (void)setJsonFilerReaderTimer:(id)a3;
- (void)setKeybagToken:(int)a3;
- (void)setLastDateDetermineChannelsPerIORPopulatableQueried:(id)a3;
- (void)setLastDateWiFiAppInstalledQueried:(id)a3;
- (void)setListener:(id)a3;
- (void)setManageConfigQueue:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMessageStore:(id)a3;
- (void)setMutexQueue:(id)a3;
- (void)setNetscoreAtStudyEnd:(unint64_t)a3;
- (void)setNetscoreAtStudyStart:(unint64_t)a3;
- (void)setNowCacheUsageForTelemetry:(id)a3;
- (void)setNumDataStallScoreBelowThresholdAfterTrap:(unint64_t)a3;
- (void)setNumDataStallScoreBelowThresholdBeforeTrap:(unint64_t)a3;
- (void)setNumIPv4DnsServers:(unint64_t)a3;
- (void)setNumIPv6DnsServers:(unint64_t)a3;
- (void)setNumLocalDnsServers:(unint64_t)a3;
- (void)setNumNetScoreBelowThresholdAfterTrap:(unint64_t)a3;
- (void)setNumNetScoreBelowThresholdBeforeTrap:(unint64_t)a3;
- (void)setNumRemoteDnsServers:(unint64_t)a3;
- (void)setOldCacheUsageForTelemetry:(id)a3;
- (void)setPeerDiagnosticsStudyQueue:(id)a3;
- (void)setPendingUntokenedConnections:(id)a3;
- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setPidLaunchDate:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setProbeContextBE:(id)a3;
- (void)setProbeContextBK:(id)a3;
- (void)setProbeContextVI:(id)a3;
- (void)setProbeContextVO:(id)a3;
- (void)setProcessTokenToGroupTypeMap:(id)a3;
- (void)setProcessTokenToXPCConnectionMap:(id)a3;
- (void)setProfileMegaDisabledDate:(id)a3;
- (void)setProfileMegaDisabledSeconds:(unint64_t)a3;
- (void)setProfileMegaEnabledDate:(id)a3;
- (void)setProfileMegaEnabledSeconds:(unint64_t)a3;
- (void)setReadingPersistFile:(BOOL)a3;
- (void)setRecommendationEngine:(id)a3;
- (void)setSlowWiFiNotificationDuringDnsStudy:(BOOL)a3;
- (void)setSlowWiFiStudyInProgress:(BOOL)a3;
- (void)setSlowwifiStudyTransaction:(id)a3;
- (void)setStallscoreAtStudyEnd:(unint64_t)a3;
- (void)setStallscoreAtStudyStart:(unint64_t)a3;
- (void)setStudyQueue:(id)a3;
- (void)setStudyTimeStamps:(id)a3;
- (void)setSubmitterMap:(id)a3;
- (void)setSwfnToAppend:(id)a3;
- (void)setTmpFilesHaveAttemptedProcessingInDataStreamPath:(BOOL)a3;
- (void)setTotalDnsServers:(unint64_t)a3;
- (void)setTotalLANPingSuccessAfterTrap:(unint64_t)a3;
- (void)setTotalLANPingSuccessBeforeTrap:(unint64_t)a3;
- (void)setTotalLANPingsAfterTrap:(unint64_t)a3;
- (void)setTotalLANPingsBeforeTrap:(unint64_t)a3;
- (void)setTotalWANPingSuccessAfterTrap:(unint64_t)a3;
- (void)setTotalWANPingSuccessBeforeTrap:(unint64_t)a3;
- (void)setTotalWANPingsAfterTrap:(unint64_t)a3;
- (void)setTotalWANPingsBeforeTrap:(unint64_t)a3;
- (void)setTransformEngine:(id)a3;
- (void)setUsbEventNotificationToAppend:(id)a3;
- (void)setValueForKeyToUserDefaults:(id)a3 forKey:(id)a4;
- (void)setWifiChipSet:(id)a3;
- (void)setWifianalyticsTmpDir:(id)a3;
- (void)setWorkReportSelectingSingleWithinFirstDay:(unint64_t)a3;
- (void)setWorkReportSelectingSingleWithinFirstWeek:(unint64_t)a3;
- (void)setWorkReportTimer:(id)a3;
- (void)setWorkReportTimerRunning:(BOOL)a3;
- (void)setWritingPersistFile:(BOOL)a3;
- (void)setupAnalyticsProcessorWithCompletionBlock:(id)a3;
- (void)storeWAMessageToDB:(id)a3;
- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3;
- (void)triggerDiagnosticPingWithrequestId:(unsigned int)a3;
- (void)triggerPeerDiagnosticsStudy:(unint64_t)a3 symptomsDnsStats:(id)a4;
- (void)triggerPeerDiscovery;
- (void)xpcConnection:(id)a3 clearMessageStoreAndReply:(id)a4;
- (void)xpcConnection:(id)a3 convertWiFiStatsIntoPercentile:(id)a4 analysisGroup:(int64_t)a5 groupTarget:(id)a6 andReply:(id)a7;
- (void)xpcConnection:(id)a3 establishConnectionWithToken:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 getDeviceAnalyticsConfigurationAndReply:(id)a4;
- (void)xpcConnection:(id)a3 getDpsStatsandReply:(id)a4;
- (void)xpcConnection:(id)a3 getMessagesModelForGroupType:(int64_t)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 getNewMessageForKey:(id)a4 groupType:(int64_t)a5 withCopy:(id)a6 andReply:(id)a7;
- (void)xpcConnection:(id)a3 getUsageStatsandReply:(id)a4;
- (void)xpcConnection:(id)a3 issueIOReportManagementCommand:(unint64_t)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 killDaemonAndReply:(id)a4;
- (void)xpcConnection:(id)a3 lqmCrashTracerNotifyForInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 lqmCrashTracerReceiveBlock:(id)a4 forInterfaceWithName:(id)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 registerMessageGroup:(int64_t)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 sendMemoryPressureRequestAndReply:(id)a4;
- (void)xpcConnection:(id)a3 setDeviceAnalyticsConfiguration:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 submitMessage:(id)a4 groupType:(int64_t)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 submitWiFiAnalyticsMessageAdvanced:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 summarizeDeviceAnalyticsForNetwork:(id)a4 maxAgeInDays:(unint64_t)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a4 andReply:(id)a5;
- (void)xpcConnection:(id)a3 triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a4 waMessage:(id)a5 andReply:(id)a6;
- (void)xpcConnection:(id)a3 triggerDeviceAnalyticsStoreMigrationAndReply:(id)a4;
- (void)xpcConnection:(id)a3 triggerQueryForNWActivity:(int64_t)a4 andReply:(id)a5;
@end

@implementation WAEngine

- (WAEngine)init
{
  v125.receiver = self;
  v125.super_class = (Class)&OBJC_CLASS___WAEngine;
  v2 = -[WAEngine init](&v125, "init");
  if (!v2) {
    goto LABEL_37;
  }
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = v3;

  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifi.analytics.engineQ", v6);
  v8 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = v7;

  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  dispatch_queue_t v11 = dispatch_queue_create(0LL, v10);
  v12 = (void *)*((void *)v2 + 74);
  *((void *)v2 + 74) = v11;

  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v14 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v13;

  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v16 = (void *)*((void *)v2 + 17);
  *((void *)v2 + 17) = v15;

  v17 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.wifianalyticsd");
  v18 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v17;

  v19 = (void *)*((void *)v2 + 14);
  if (!v19) {
    goto LABEL_37;
  }
  [v19 setDelegate:v2];
  v2[53] = 0;
  uint64_t v20 = objc_claimAutoreleasedReturnValue(+[WAUtil wifianalyticsTmpDirectory](&OBJC_CLASS___WAUtil, "wifianalyticsTmpDirectory"));
  v21 = (void *)*((void *)v2 + 73);
  *((void *)v2 + 73) = v20;

  if (!*((void *)v2 + 73)) {
    goto LABEL_37;
  }
  v2[32] = 0;
  v2[42] = 0;
  v2[35] = 0;
  v22 = objc_alloc_init(&OBJC_CLASS___CADataTransformEngine);
  v23 = (void *)*((void *)v2 + 20);
  *((void *)v2 + 20) = v22;

  if (!*((void *)v2 + 20))
  {
    id v112 = WALogCategoryDefaultHandle();
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 419;
    v113 = "%{public}s::%d:Error creating _transformEngine";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, v113, buf, 0x12u);
    goto LABEL_36;
  }

  v24 = objc_alloc_init(&OBJC_CLASS___RecommendationEngine);
  v25 = (void *)*((void *)v2 + 22);
  *((void *)v2 + 22) = v24;

  if (!*((void *)v2 + 22))
  {
    id v114 = WALogCategoryDefaultHandle();
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 422;
    v113 = "%{public}s::%d:Error creating _recommendationEngine";
    goto LABEL_35;
  }

  v26 = objc_alloc_init(&OBJC_CLASS___WACoreCapture);
  v27 = (void *)*((void *)v2 + 63);
  *((void *)v2 + 63) = v26;

  if (!*((void *)v2 + 63))
  {
    id v115 = WALogCategoryDefaultHandle();
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 425;
    v113 = "%{public}s::%d:Error creating _coreCaptureControl";
    goto LABEL_35;
  }

  dispatch_queue_attr_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v29 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v28);
  dispatch_queue_t v30 = dispatch_queue_create("com.apple.wifi.analytics.dpsQ", v29);
  v31 = (void *)*((void *)v2 + 64);
  *((void *)v2 + 64) = v30;

  dispatch_queue_attr_t v32 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v33 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v32);
  dispatch_queue_t v34 = dispatch_queue_create("com.apple.wifi.analytics.dpsReadWriteQ", v33);
  v35 = (void *)*((void *)v2 + 65);
  *((void *)v2 + 65) = v34;

  dispatch_queue_attr_t v36 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v37 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v36);
  dispatch_queue_t v38 = dispatch_queue_create("com.apple.wifi.analytics.peerDiagnosticsQ", v37);
  v39 = (void *)*((void *)v2 + 66);
  *((void *)v2 + 66) = v38;

  dispatch_queue_attr_t v40 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v41 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v40);
  dispatch_queue_t v42 = dispatch_queue_create("com.apple.wifi.analytics.dnsQ", v41);
  v43 = (void *)*((void *)v2 + 61);
  *((void *)v2 + 61) = v42;

  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v45 = (void *)*((void *)v2 + 67);
  *((void *)v2 + 67) = v44;

  v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v47 = (void *)*((void *)v2 + 68);
  *((void *)v2 + 68) = v46;

  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v49 = (void *)*((void *)v2 + 69);
  *((void *)v2 + 69) = v48;

  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v51 = (void *)*((void *)v2 + 70);
  *((void *)v2 + 70) = v50;

  v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v53 = (void *)*((void *)v2 + 60);
  *((void *)v2 + 60) = v52;

  v54 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v55 = (void *)*((void *)v2 + 62);
  *((void *)v2 + 62) = v54;

  v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v57 = (void *)*((void *)v2 + 21);
  *((void *)v2 + 21) = v56;

  *((_DWORD *)v2 + 15) = 0;
  v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v59 = (void *)*((void *)v2 + 71);
  *((void *)v2 + 71) = v58;

  v60 = -[CWFInterface initWithServiceType:](objc_alloc(&OBJC_CLASS___CWFInterface), "initWithServiceType:", 1LL);
  v61 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v60;

  v62 = (void *)*((void *)v2 + 1);
  if (!v62)
  {
    id v116 = WALogCategoryDefaultHandle();
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 444;
    v113 = "%{public}s::%d:Error creating _corewifi";
    goto LABEL_35;
  }

  [v62 resume];
  SCDynamicStoreRef v63 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.wifianalyticsd.wifi.intf", 0LL, 0LL);
  *((void *)v2 + 2) = v63;
  if (!v63)
  {
    id v117 = WALogCategoryDefaultHandle();
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 451;
    v113 = "%{public}s::%d:Error creating _storeRef";
    goto LABEL_35;
  }

  v64 = (void *)*((void *)v2 + 59);
  *((void *)v2 + 59) = 0LL;

  v2[36] = MGGetBoolAnswer(@"apple-internal-install");
  dispatch_queue_attr_t v65 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v66 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v65);
  dispatch_queue_t v67 = dispatch_queue_create("com.apple.wifi.analytics.fileHandlingQ", v66);
  v68 = (void *)*((void *)v2 + 72);
  *((void *)v2 + 72) = v67;

  *((_OWORD *)v2 + 38) = xmmword_100092BE0;
  if (+[WAUtil isKeyBagUnlocked](&OBJC_CLASS___WAUtil, "isKeyBagUnlocked"))
  {
    id v69 = WALogCategoryDefaultHandle();
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[WAEngine init]";
      __int16 v128 = 1024;
      int v129 = 467;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:isKeyBagUnlocked is true, attempting setup setupAnalyticsProcessorWithCompletionBlock",  buf,  0x12u);
    }

    [v2 setupAnalyticsProcessorWithCompletionBlock:0];
  }

  [v2 createAndStartJsonReaderTimer];
  v2[52] = 0;
  uint64_t v71 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v72 = (void *)*((void *)v2 + 18);
  *((void *)v2 + 18) = v71;

  if (*((void *)v2 + 18))
  {
    uint64_t v73 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"dunno"));
    v74 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v73;

    uint64_t v75 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", &stru_1000CF610));
    v76 = (void *)*((void *)v2 + 24);
    *((void *)v2 + 24) = v75;

    *((void *)v2 + 97) = 0LL;
    uint64_t v77 = objc_claimAutoreleasedReturnValue(+[ManagedConfiguration sharedInstance](&OBJC_CLASS___ManagedConfiguration, "sharedInstance"));
    v78 = (void *)*((void *)v2 + 80);
    *((void *)v2 + 80) = v77;

    dispatch_queue_attr_t v79 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v80 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v79);
    dispatch_queue_t v81 = dispatch_queue_create("com.apple.wifi.analytics.config", v80);
    v82 = (void *)*((void *)v2 + 79);
    *((void *)v2 + 79) = v81;

    [*((id *)v2 + 80) scheduleWithQueue:*((void *)v2 + 79)];
    [*((id *)v2 + 80) setDbDelegate:v2];
    uint64_t v83 = objc_claimAutoreleasedReturnValue(+[DatapathMetricStream sharedInstance](&OBJC_CLASS___DatapathMetricStream, "sharedInstance"));
    v84 = (void *)*((void *)v2 + 81);
    *((void *)v2 + 81) = v83;

    [v2 initDatapathMetricGetterAndFetcher];
    v85 = (void *)*((void *)v2 + 81);
    uint64_t v86 = *((void *)v2 + 79);
    v87 = (void *)objc_claimAutoreleasedReturnValue([v2 DatapathMetricGetter]);
    [v85 setDispatchQueueAndAddObservers:v86 withGetter:v87];

    [*((id *)v2 + 81) setDbDelegate:v2];
    uint64_t v88 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    v89 = (void *)*((void *)v2 + 83);
    *((void *)v2 + 83) = v88;

    uint64_t v90 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    v91 = (void *)*((void *)v2 + 84);
    *((void *)v2 + 84) = v90;

    v2[54] = 0;
    *(_WORD *)(v2 + 49) = 0;
    v2[51] = 0;
    v92 = (dispatch_queue_s *)*((void *)v2 + 72);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100043924;
    handler[3] = &unk_1000CCF90;
    v93 = v2;
    v124 = v93;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)v2 + 16, v92, handler);
    [v93 keyBagLockStateChangeNotification];

    v93[37] = 0;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    *((_DWORD *)v93 + 17) = [v94 processIdentifier];

    uint64_t v95 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v96 = (void *)*((void *)v93 + 87);
    *((void *)v93 + 87) = v95;

    uint64_t v97 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](&OBJC_CLASS___RecommendationPreferences, "sharedObject"));
    v98 = (void *)*((void *)v93 + 85);
    *((void *)v93 + 85) = v97;

    uint64_t v99 = *((void *)v93 + 85);
    id v100 = WALogCategoryDefaultHandle();
    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    v102 = v101;
    if (v99)
    {
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      {
        int v103 = *((_DWORD *)v93 + 17);
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        v105 = (void *)objc_claimAutoreleasedReturnValue([v104 globallyUniqueString]);
        *(_DWORD *)buf = 136446978;
        v127 = "-[WAEngine init]";
        __int16 v128 = 1024;
        int v129 = 520;
        __int16 v130 = 1024;
        int v131 = v103;
        __int16 v132 = 2112;
        v133 = v105;
        _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:WAEngine init with pid %d uniqueString %@",  buf,  0x22u);
      }

      v106 = (void *)objc_claimAutoreleasedReturnValue([v93 managedConfiguration]);
      [v106 addObserver:v93 forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled" options:5 context:0];

      *((void *)v93 + 91) = arc4random_uniform(0x18u);
      *((void *)v93 + 92) = arc4random_uniform(0x90u) + 24;
      [v93 _enableWorkReportRecurringTimer];
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
      v108 = (void *)objc_claimAutoreleasedReturnValue([v107 getInfraApple80211]);

      if (v108) {
        [v108 setDbDelegate:v93];
      }

      v109 = v93;
      v122 = v109;
      v110 = (void *)objc_claimAutoreleasedReturnValue( +[WAActivityManager sharedActivityManager]( &OBJC_CLASS___WAActivityManager,  "sharedActivityManager",  _NSConcreteStackBlock,  3221225472LL,  sub_10004392C,  &unk_1000CCD80));
      [v110 setExecuteBeforePossibleEagerExit:&v121];

      v2 = (char *)v122;
      goto LABEL_20;
    }

    if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 518;
    v113 = "%{public}s::%d:Error RecommendationPreferences init";
    goto LABEL_35;
  }

  id v118 = WALogCategoryDefaultHandle();
  v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    __int16 v128 = 1024;
    int v129 = 477;
    v113 = "%{public}s::%d:Error creating _interfaceNameToApple80211InstanceMap";
    goto LABEL_35;
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WAEngine;
  -[WAEngine dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    dispatch_queue_t v11 = v9;
  }
  else {
    dispatch_queue_t v11 = 0LL;
  }
  id v12 = v11;
  if ([v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_enabled"] && v12)
  {
    engineQ = (dispatch_queue_s *)self->_engineQ;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100043B3C;
    v17[3] = &unk_1000CD148;
    id v14 = v12;
    id v18 = v14;
    v19 = self;
    dispatch_async(engineQ, v17);
    id v15 = WALogCategoryDefaultHandle();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "-[WAEngine observeValueForKeyPath:ofObject:change:context:]";
      __int16 v22 = 1024;
      int v23 = 576;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:%@ Preference is %@",  buf,  0x26u);
    }
  }
}

- (id)_DPSQuickRecoveryEngineObj
{
  dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
  if (dpsQuickRecoveryEngine) {
    return dpsQuickRecoveryEngine;
  }
  if (!-[WAEngine _isDPSQuickRecoveryEngineUsed](self, "_isDPSQuickRecoveryEngineUsed"))
  {
    dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
    return dpsQuickRecoveryEngine;
  }

  objc_super v4 = objc_alloc_init(&OBJC_CLASS___DPSQuickRecoveryRecommendationEngine);
  dispatch_queue_attr_t v5 = self->_dpsQuickRecoveryEngine;
  self->_dpsQuickRecoveryEngine = v4;

  dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
  if (dpsQuickRecoveryEngine) {
    return dpsQuickRecoveryEngine;
  }
  id v6 = WALogCategoryDefaultHandle();
  dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[WAEngine _DPSQuickRecoveryEngineObj]";
    __int16 v11 = 1024;
    int v12 = 588;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to alloc DPSQuickRecoveryRecommendationEngine",  (uint8_t *)&v9,  0x12u);
  }

  return 0LL;
}

- (id)getW5Client
{
  velocityClient = self->_velocityClient;
  if (!velocityClient)
  {
    objc_super v4 = (W5Client *)objc_alloc_init((Class)sub_100043C9C());
    dispatch_queue_attr_t v5 = self->_velocityClient;
    self->_velocityClient = v4;

    velocityClient = self->_velocityClient;
  }

  return velocityClient;
}

- (BOOL)_isDPSQuickRecoveryEngineUsed
{
  if (self->_driverType) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getInfraApple80211]);

  if (!v4)
  {
    id v7 = WALogCategoryDefaultHandle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446466;
      int v12 = "-[WAEngine _isDPSQuickRecoveryEngineUsed]";
      __int16 v13 = 1024;
      int v14 = 616;
      int v9 = "%{public}s::%d:invalid apple80211API";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v11, 0x12u);
    }

- (void)_updateProfileStateDate:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  unint64_t v6 = -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 1LL);
  id v7 = -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 0LL);
  id v8 = WALogCategoryDefaultHandle();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136446978;
    v21 = "-[WAEngine _updateProfileStateDate:]";
    __int16 v22 = 1024;
    int v23 = 642;
    __int16 v24 = 2048;
    unint64_t v25 = v6;
    __int16 v26 = 2048;
    id v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:MegaWiFi Profile state change: currentEnabledSeconds %lu currentDisabledSeconds %lu",  (uint8_t *)&v20,  0x26u);
  }

  if (v3 == 1 && !self->_isMegaEnabled)
  {
    id v10 = WALogCategoryDefaultHandle();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      profileMegaEnabledDate = self->_profileMegaEnabledDate;
      profileMegaDisabledDate = self->_profileMegaDisabledDate;
      int v20 = 136447234;
      v21 = "-[WAEngine _updateProfileStateDate:]";
      __int16 v22 = 1024;
      int v23 = 645;
      __int16 v24 = 2112;
      unint64_t v25 = (unint64_t)profileMegaEnabledDate;
      __int16 v26 = 2112;
      id v27 = profileMegaDisabledDate;
      __int16 v28 = 2048;
      unint64_t v29 = (unint64_t)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:MegaWiFi Profile Installed: profileMegaEnabledDate %@ profileMegaDisabledDate %@ - was disabled for %lu seconds",  (uint8_t *)&v20,  0x30u);
    }

    unsigned __int8 v14 = 1;
    uint64_t v15 = 93LL;
    uint64_t v16 = 96LL;
LABEL_13:

    (&self->super.isa)[v16] = v7;
    objc_storeStrong((id *)&(&self->super.isa)[v15], v5);
    self->_isMegaEnabled = v14;
    goto LABEL_14;
  }

  if (!v3 && self->_isMegaEnabled == 1)
  {
    id v17 = WALogCategoryDefaultHandle();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = self->_profileMegaEnabledDate;
      v19 = self->_profileMegaDisabledDate;
      int v20 = 136447234;
      v21 = "-[WAEngine _updateProfileStateDate:]";
      __int16 v22 = 1024;
      int v23 = 653;
      __int16 v24 = 2112;
      unint64_t v25 = (unint64_t)v18;
      __int16 v26 = 2112;
      id v27 = v19;
      __int16 v28 = 2048;
      unint64_t v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:MegaWiFi Profile Removed: profileMegaEnabledDate %@ profileMegaDisabledDate %@ - was enabled for %lu seconds",  (uint8_t *)&v20,  0x30u);
    }

    unsigned __int8 v14 = 0;
    uint64_t v15 = 94LL;
    uint64_t v16 = 95LL;
    id v7 = (objc_class *)v6;
    goto LABEL_13;
  }

- (unint64_t)_getTimeInProfileState:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[NSDate timeIntervalSinceDate:](self->_pidLaunchDate, "timeIntervalSinceDate:", v5);
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  profileMegaEnabledDate = self->_profileMegaEnabledDate;
  if (v3)
  {
    if (!profileMegaEnabledDate)
    {
      unint64_t profileMegaEnabledSeconds = 0LL;
      goto LABEL_22;
    }

    if (self->_profileMegaDisabledDate)
    {
      unint64_t profileMegaEnabledSeconds = self->_profileMegaEnabledSeconds;
      if (!self->_isMegaEnabled) {
        goto LABEL_22;
      }
LABEL_12:
      -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5, v6);
      if (v9 < 0.0) {
        double v9 = -v9;
      }
      profileMegaEnabledSeconds += (unint64_t)v9;
      goto LABEL_22;
    }

    -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5, v6);
    if (v10 < 0.0) {
      double v10 = -v10;
    }
    unint64_t profileMegaEnabledSeconds = (unint64_t)v10;
  }

  else
  {
    unint64_t profileMegaEnabledSeconds = (unint64_t)v6;
    if (!profileMegaEnabledDate) {
      goto LABEL_22;
    }
    if (self->_profileMegaDisabledDate)
    {
      unint64_t profileMegaEnabledSeconds = self->_profileMegaDisabledSeconds;
      if (self->_isMegaEnabled) {
        goto LABEL_22;
      }
      profileMegaEnabledDate = self->_profileMegaDisabledDate;
      goto LABEL_12;
    }

    -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5);
    if (v11 < 0.0) {
      double v11 = -v11;
    }
    profileMegaEnabledSeconds -= (unint64_t)v11;
  }

- (void)initDatapathMetricGetterAndFetcher
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000442F0;
  v3[3] = &unk_1000CD198;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[WAEngine setDatapathMetricGetter:](self, "setDatapathMetricGetter:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setupAnalyticsProcessorWithCompletionBlock:(id)a3
{
  id v6 = a3;
  block = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  double v10 = sub_100044804;
  double v11 = &unk_1000CCD80;
  int v12 = self;
  if (qword_1000ED010 != -1) {
    dispatch_once(&qword_1000ED010, &block);
  }
  BOOL v4 = -[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady", v6, block, v9, v10, v11, v12);
  id v5 = v7;
  if (v7)
  {
    (*((void (**)(id, BOOL))v7 + 2))(v7, v4);
    id v5 = v7;
  }
}

- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  BOOL v4 = (void (**)(id, NSNumber *, void))a3;
  if (-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    id v5 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", 1LL);
    id v6 = WALogCategoryDeviceStoreHandle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v18 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
      __int16 v19 = 1024;
      int v20 = 818;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - AnalyticsProcessor ready",  buf,  0x12u);
    }

    if (v4) {
      v4[2](v4, v5, 0LL);
    }
  }

  else
  {
    id v8 = WALogCategoryDeviceStoreHandle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v18 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
      __int16 v19 = 1024;
      int v20 = 801;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:AnalyticsProcessor not ready yet",  buf,  0x12u);
    }

    if (+[WAUtil isKeyBagUnlocked](&OBJC_CLASS___WAUtil, "isKeyBagUnlocked"))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100044D84;
      v13[3] = &unk_1000CD1C0;
      unsigned __int8 v14 = v4;
      -[WAEngine setupAnalyticsProcessorWithCompletionBlock:](self, "setupAnalyticsProcessorWithCompletionBlock:", v13);
      id v5 = v14;
    }

    else
    {
      NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
      uint64_t v16 = @"WAErrorCodeKeyBagLocked";
      double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9016LL,  v10));

      id v11 = WALogCategoryDeviceStoreHandle();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v18 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
        __int16 v19 = 1024;
        int v20 = 813;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - Error: WAErrorCodeKeyBagLocke d. KeyBag not unlocked",  buf,  0x12u);
      }

      if (v4) {
        ((void (**)(id, NSNumber *, NSNumber *))v4)[2](v4, 0LL, v5);
      }
    }
  }
}

- (void)keyBagLockStateChangeNotification
{
  id v3 = WALogCategoryDefaultHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[WAEngine keyBagLockStateChangeNotification]";
    __int16 v9 = 1024;
    int v10 = 825;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Received keyBagLockStateChangeNotification",  (uint8_t *)&v7,  0x12u);
  }

  if (+[WAUtil isKeyBagUnlocked](&OBJC_CLASS___WAUtil, "isKeyBagUnlocked"))
  {
    id v5 = WALogCategoryDefaultHandle();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      id v8 = "-[WAEngine keyBagLockStateChangeNotification]";
      __int16 v9 = 1024;
      int v10 = 828;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Got keyBagLockStateChangeNotification isKeyBagUnlocked is true, attempting setup setupAnalyticsPr ocessorWithCompletionBlock",  (uint8_t *)&v7,  0x12u);
    }

    -[WAEngine setupAnalyticsProcessorWithCompletionBlock:](self, "setupAnalyticsProcessorWithCompletionBlock:", 0LL);
  }

- (void)createAndStartJsonReaderTimer
{
  id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fileHandlingQ);
  jsonFilerReaderTimer = self->_jsonFilerReaderTimer;
  self->_jsonFilerReaderTimer = v3;

  id v5 = self->_jsonFilerReaderTimer;
  if (v5)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000451C0;
    handler[3] = &unk_1000CCD80;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    id v6 = WALogCategoryDeviceStoreHandle();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t analyticsProcessingTimeIntervalSecs = (unint64_t)self->_analyticsProcessingTimeIntervalSecs;
      *(_DWORD *)buf = 136446722;
      id v17 = "-[WAEngine createAndStartJsonReaderTimer]";
      __int16 v18 = 1024;
      int v19 = 843;
      __int16 v20 = 2048;
      unint64_t v21 = analyticsProcessingTimeIntervalSecs;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting _jsonFilerReaderTimer to fire in %llu s",  buf,  0x1Cu);
    }

    __int16 v9 = self->_jsonFilerReaderTimer;
    -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
    dispatch_time_t v11 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v10 * 1000000000.0));
    -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
    dispatch_source_set_timer((dispatch_source_t)v9, v11, 1000000000 * (unint64_t)v12, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_jsonFilerReaderTimer);
  }

  else
  {
    id v13 = WALogCategoryDeviceStoreHandle();
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v17 = "-[WAEngine createAndStartJsonReaderTimer]";
      __int16 v18 = 1024;
      int v19 = 836;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to create _jsonFilerReaderTimer",  buf,  0x12u);
    }
  }

- (void)run
{
  id v3 = WALogCategoryDefaultHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v9 = "-[WAEngine run]";
    __int16 v10 = 1024;
    int v11 = 852;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting...", buf, 0x12u);
  }

  engineQ = (dispatch_queue_s *)self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045390;
  block[3] = &unk_1000CCD80;
  block[4] = self;
  dispatch_sync(engineQ, block);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine listener](self, "listener"));
  [v6 resume];
}

- (BOOL)queryInfraInterfaceInstanceAndChip
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getInfraApple80211]);

  if (!v4)
  {
    id v22 = WALogCategoryDefaultHandle();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v24 = 136446466;
    unint64_t v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    __int16 v26 = 1024;
    int v27 = 865;
    unint64_t v21 = "%{public}s::%d:invalid apple80211API";
    goto LABEL_25;
  }

  [v4 setDbDelegate:self];
  infraInterfaceName = self->_infraInterfaceName;
  if (!infraInterfaceName || -[NSString isEqualToString:](infraInterfaceName, "isEqualToString:", @"dunno"))
  {
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue([v4 ifName]);
    int v7 = self->_infraInterfaceName;
    self->_infraInterfaceName = v6;

    id v8 = WALogCategoryDefaultHandle();
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = self->_infraInterfaceName;
      int v24 = 136446722;
      unint64_t v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
      __int16 v26 = 1024;
      int v27 = 871;
      __int16 v28 = 2112;
      unint64_t v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:[apple80211 ifName]%@",  (uint8_t *)&v24,  0x1Cu);
    }
  }

  int v11 = self->_infraInterfaceName;
  if (!v11 || -[NSString isEqualToString:](v11, "isEqualToString:", @"dunno"))
  {
    id v20 = WALogCategoryDefaultHandle();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v24 = 136446466;
    unint64_t v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    __int16 v26 = 1024;
    int v27 = 874;
    unint64_t v21 = "%{public}s::%d:failed to find _infraInterfaceName";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v24, 0x12u);
    goto LABEL_26;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_interfaceNameToApple80211InstanceMap,  "objectForKeyedSubscript:",  self->_infraInterfaceName));

  if (!v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_interfaceNameToApple80211InstanceMap,  "setObject:forKeyedSubscript:",  v4,  self->_infraInterfaceName);
  }
  wifiChipSet = self->_wifiChipSet;
  if (!wifiChipSet || -[NSString isEqualToString:](wifiChipSet, "isEqualToString:", &stru_1000CF610))
  {
    unsigned __int8 v14 = (NSString *)objc_claimAutoreleasedReturnValue([v4 getChipSet]);
    NSErrorUserInfoKey v15 = self->_wifiChipSet;
    self->_wifiChipSet = v14;
  }

  if (!self->_wifiChipSet && [0 isEqualToString:&stru_1000CF610])
  {
    id v23 = WALogCategoryDefaultHandle();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136446466;
      unint64_t v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
      __int16 v26 = 1024;
      int v27 = 884;
      unint64_t v21 = "%{public}s::%d:failed to find _wifiChipSet";
      goto LABEL_25;
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.wifianalytics"]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) != 0)
  {
    id v8 = [[WAXPCConnection alloc] initWithXPCConnection:v5];
    uint64_t v9 = WAXPCRequestDelegateInterface([v8 setDelegate:self]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:v8];
    [v5 resume];
    id v11 = WALogCategoryDefaultHandle();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136447234;
      id v16 = "-[WAEngine listener:shouldAcceptNewConnection:]";
      __int16 v17 = 1024;
      int v18 = 914;
      __int16 v19 = 1024;
      unsigned int v20 = [v5 processIdentifier];
      __int16 v21 = 1024;
      unsigned int v22 = [v5 effectiveUserIdentifier];
      __int16 v23 = 1024;
      unsigned int v24 = [v5 effectiveGroupIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:XPC: ADDED XPC CONNECTION [pid=%d, euid=%d, egid=%d]",  (uint8_t *)&v15,  0x24u);
    }
  }

  else
  {
    id v14 = WALogCategoryDefaultHandle();
    id v8 = (id)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446466;
      id v16 = "-[WAEngine listener:shouldAcceptNewConnection:]";
      __int16 v17 = 1024;
      int v18 = 904;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: Connection from client not entitled, will not accept",  (uint8_t *)&v15,  0x12u);
    }
  }

  return v7;
}

- (void)xpcConnection:(id)a3 establishConnectionWithToken:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, v8);
  objc_initWeak(&v50, self);
  id v11 = v9;
  id v12 = objc_loadWeakRetained(&location);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 connection]);
  objc_initWeak(&from, v13);

  if (v11)
  {
    v37 = 0LL;
    __int16 v19 = v11;
  }

  else
  {
    id v14 = WALogCategoryDefaultHandle();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
      unsigned int v17 = [v16 processIdentifier];
      *(_DWORD *)buf = 136446722;
      v53 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]";
      __int16 v54 = 1024;
      int v55 = 933;
      __int16 v56 = 1024;
      LODWORD(v57) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:XPC: Connection from pid=%d without token. Generating a token for the reply",  buf,  0x18u);
    }

    int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);

    v37 = v19;
  }

  [v8 setToken:v19];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100045E14;
  v46[3] = &unk_1000CD1E8;
  objc_copyWeak(&v47, &location);
  objc_copyWeak(&v48, &from);
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  [v20 setInterruptionHandler:v46];

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100045F7C;
  v42[3] = &unk_1000CD238;
  v42[4] = self;
  objc_copyWeak(&v43, &location);
  objc_copyWeak(&v44, &from);
  objc_copyWeak(&v45, &v50);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  [v21 setInvalidationHandler:v42];

  unsigned int v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046244;
  block[3] = &unk_1000CD260;
  objc_copyWeak(&v41, &v50);
  id v23 = v19;
  id v39 = v23;
  id v24 = v8;
  id v40 = v24;
  dispatch_async(v22, block);

  objc_destroyWeak(&v41);
  id v25 = WALogCategoryDefaultHandle();
  __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = v10;
    id v35 = v11;
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v24 token]);
    id v28 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v27));
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v24 connection]);
    unsigned int v30 = [v29 processIdentifier];
    v31 = (void *)objc_claimAutoreleasedReturnValue([v24 connection]);
    unsigned int v32 = [v31 effectiveUserIdentifier];
    v33 = (void *)objc_claimAutoreleasedReturnValue([v24 connection]);
    unsigned int v34 = [v33 effectiveGroupIdentifier];
    *(_DWORD *)buf = 136447490;
    v53 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]";
    __int16 v54 = 1024;
    int v55 = 967;
    __int16 v56 = 2112;
    id v57 = v28;
    __int16 v58 = 1024;
    unsigned int v59 = v30;
    __int16 v60 = 1024;
    unsigned int v61 = v32;
    __int16 v62 = 1024;
    unsigned int v63 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:XPC: Token: %@ is for: [pid=%d, euid=%d, egid=%d]",  buf,  0x2Eu);

    id v11 = v35;
    id v10 = v36;
  }

  if (v10) {
    (*((void (**)(id, void *, void))v10 + 2))(v10, v37, 0LL);
  }
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 submitMessage:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000463FC;
  v17[3] = &unk_1000CD288;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 submitWiFiAnalyticsMessageAdvanced:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000467B4;
  block[3] = &unk_1000CD300;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getMessagesModelForGroupType:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046B28;
  block[3] = &unk_1000CD170;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 registerMessageGroup:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046E10;
  block[3] = &unk_1000CD170;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getNewMessageForKey:(id)a4 groupType:(int64_t)a5 withCopy:(id)a6 andReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000474F0;
  block[3] = &unk_1000CD2D8;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a5;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 killDaemonAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.wifianalytics.test"]);
  unsigned __int8 v10 = [v9 BOOLValue];

  id v11 = WALogCategoryDefaultHandle();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v25 = "-[WAEngine xpcConnection:killDaemonAndReply:]";
      __int16 v26 = 1024;
      int v27 = 1098;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Received killDaemon via XPC - this shouldn't happen outside of unit tests",  buf,  0x12u);
    }

    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100047AD0;
    block[3] = &unk_1000CD300;
    void block[4] = self;
    objc_copyWeak(&v22, &location);
    id v20 = v6;
    id v21 = v7;
    dispatch_async(v14, block);

    objc_destroyWeak(&v22);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v15));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      unsigned int v18 = [v17 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v25 = "-[WAEngine xpcConnection:killDaemonAndReply:]";
      __int16 v26 = 1024;
      int v27 = 1096;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 1024;
      unsigned int v31 = v18;
      __int16 v32 = 2112;
      v33 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 clearMessageStoreAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.wifianalytics.test"]);
  unsigned __int8 v10 = [v9 BOOLValue];

  id v11 = WALogCategoryDefaultHandle();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v25 = "-[WAEngine xpcConnection:clearMessageStoreAndReply:]";
      __int16 v26 = 1024;
      int v27 = 1122;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Received clearMessageStoreAndReply via XPC - this shouldn't happen outside of unit tests",  buf,  0x12u);
    }

    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100047ED8;
    v19[3] = &unk_1000CD328;
    objc_copyWeak(&v22, &location);
    id v20 = v6;
    id v21 = v7;
    dispatch_async(v14, v19);

    objc_destroyWeak(&v22);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v15));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      unsigned int v18 = [v17 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v25 = "-[WAEngine xpcConnection:clearMessageStoreAndReply:]";
      __int16 v26 = 1024;
      int v27 = 1120;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 1024;
      unsigned int v31 = v18;
      __int16 v32 = 2112;
      v33 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:@"com.apple.private.wifianalytics.fw-trap"]);
  unsigned __int8 v13 = [v12 BOOLValue];

  id v14 = WALogCategoryDefaultHandle();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v29 = "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      __int16 v30 = 1024;
      int v31 = 1145;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Received trapCrashMiniTracerDumpReady via XPC, usually this due to wifid detecting the kApple8021 1DriverAvailabilityFlagHasTrapCrashTracerMiniDump flag in a driver availability message",  buf,  0x12u);
    }

    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000482F4;
    block[3] = &unk_1000CD300;
    objc_copyWeak(&v26, &location);
    id v23 = v8;
    id v24 = v9;
    id v25 = v10;
    dispatch_async(v17, block);

    objc_destroyWeak(&v26);
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 token]);
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v18));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
      unsigned int v21 = [v20 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v29 = "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      __int16 v30 = 1024;
      int v31 = 1143;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 1024;
      unsigned int v35 = v21;
      __int16 v36 = 2112;
      v37 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 lqmCrashTracerNotifyForInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:@"com.apple.private.wifianalytics.fw-trap"]);
  unsigned __int8 v13 = [v12 BOOLValue];

  id v14 = WALogCategoryDefaultHandle();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v29 = "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      __int16 v30 = 1024;
      int v31 = 1168;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Received lqmCrashTracerNotify via XPC",  buf,  0x12u);
    }

    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100048710;
    block[3] = &unk_1000CD300;
    objc_copyWeak(&v26, &location);
    id v23 = v8;
    id v24 = v9;
    id v25 = v10;
    dispatch_async(v17, block);

    objc_destroyWeak(&v26);
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v8 token]);
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v18));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
      unsigned int v21 = [v20 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v29 = "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      __int16 v30 = 1024;
      int v31 = 1166;
      __int16 v32 = 2112;
      id v33 = v19;
      __int16 v34 = 1024;
      unsigned int v35 = v21;
      __int16 v36 = 2112;
      v37 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 lqmCrashTracerReceiveBlock:(id)a4 forInterfaceWithName:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForEntitlement:@"com.apple.private.wifianalytics.fw-trap"]);
  unsigned __int8 v16 = [v15 BOOLValue];

  id v17 = WALogCategoryDefaultHandle();
  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v18;
  if ((v16 & 1) != 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v33 = "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      __int16 v34 = 1024;
      int v35 = 1190;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Received lqmCrashTracerReceiveBlock via XPC",  buf,  0x12u);
    }

    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100048B50;
    v25[3] = &unk_1000CD350;
    objc_copyWeak(&v30, &location);
    id v26 = v10;
    id v27 = v11;
    id v28 = v12;
    id v29 = v13;
    dispatch_async(v20, v25);

    objc_destroyWeak(&v30);
  }

  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 token]);
      id v22 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v21));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
      unsigned int v24 = [v23 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v33 = "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      __int16 v34 = 1024;
      int v35 = 1188;
      __int16 v36 = 2112;
      id v37 = v22;
      __int16 v38 = 1024;
      unsigned int v39 = v24;
      __int16 v40 = 2112;
      id v41 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerQueryForNWActivity:(int64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100048D98;
  block[3] = &unk_1000CD170;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 convertWiFiStatsIntoPercentile:(id)a4 analysisGroup:(int64_t)a5 groupTarget:(id)a6 andReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  unsigned __int8 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000492CC;
  block[3] = &unk_1000CD2D8;
  objc_copyWeak(v26, &location);
  id v22 = v12;
  id v23 = v13;
  v26[1] = (id)a5;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000496E0;
  v17[3] = &unk_1000CD288;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a4;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getDpsStatsandReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100049ABC;
  v11[3] = &unk_1000CD328;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getUsageStatsandReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049ECC;
  block[3] = &unk_1000CD300;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 setDeviceAnalyticsConfiguration:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A330;
  block[3] = &unk_1000CD300;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getDeviceAnalyticsConfigurationAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004A694;
  v11[3] = &unk_1000CD328;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 summarizeDeviceAnalyticsForNetwork:(id)a4 maxAgeInDays:(unint64_t)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004AA3C;
  v17[3] = &unk_1000CD288;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  v21[1] = (id)a5;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerDeviceAnalyticsStoreMigrationAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = WALogCategoryDeviceStoreHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v19 = "-[WAEngine xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:]";
    __int16 v20 = 1024;
    int v21 = 1457;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Received triggerDeviceAnalyticsStoreMigrationAndReply via XPC",  buf,  0x12u);
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004AE64;
  v13[3] = &unk_1000CD328;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 sendMemoryPressureRequestAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.wifianalytics.test"]);
  unsigned __int8 v10 = [v9 BOOLValue];

  id v11 = WALogCategoryDefaultHandle();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      id v25 = "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]";
      __int16 v26 = 1024;
      int v27 = 1493;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Received MemoryPressure request via XPC - this shouldn't happen outside of unit tests",  buf,  0x12u);
    }

    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004B3E0;
    v19[3] = &unk_1000CD328;
    objc_copyWeak(&v22, &location);
    id v20 = v6;
    id v21 = v7;
    dispatch_async(v14, v19);

    objc_destroyWeak(&v22);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v15));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      unsigned int v18 = [v17 processIdentifier];
      *(_DWORD *)buf = 136447234;
      id v25 = "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]";
      __int16 v26 = 1024;
      int v27 = 1490;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 1024;
      unsigned int v31 = v18;
      __int16 v32 = 2112;
      id v33 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 issueIOReportManagementCommand:(unint64_t)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v29 = 0LL;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  __int16 v32 = sub_10004B8C4;
  id v33 = sub_10004B8D4;
  id v34 = 0LL;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForEntitlement:@"com.apple.private.wifianalytics.test"]);
  unsigned __int8 v12 = [v11 BOOLValue];

  id v13 = WALogCategoryDefaultHandle();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v39 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]";
      __int16 v40 = 1024;
      int v41 = 1519;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Received issueIOReportManagementCommand request via XPC - this shouldn't happen outside of unit tests",  buf,  0x12u);
    }

    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004B8DC;
    v24[3] = &unk_1000CD378;
    objc_copyWeak(v28, &location);
    id v25 = v8;
    int v27 = &v29;
    v28[1] = (id)a4;
    id v26 = v9;
    dispatch_async(v16, v24);

    objc_destroyWeak(v28);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 token]);
      id v18 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v17));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
      unsigned int v20 = [v19 processIdentifier];
      *(_DWORD *)buf = 136447234;
      unsigned int v39 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]";
      __int16 v40 = 1024;
      int v41 = 1517;
      __int16 v42 = 2112;
      id v43 = v18;
      __int16 v44 = 1024;
      unsigned int v45 = v20;
      __int16 v46 = 2112;
      id v47 = @"com.apple.private.wifianalytics";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!",  buf,  0x2Cu);
    }

    NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
    id v37 = @"WAErrorCodeClientNotEntitled";
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9030LL,  v21));
    id v23 = (void *)v30[5];
    v30[5] = v22;
  }

  if (v9) {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0LL, v30[5]);
  }
  _Block_object_dispose(&v29, 8);

  objc_destroyWeak(&location);
}

- (BOOL)submitterMapCheck:(id)a3 group:(int64_t)a4
{
  id v6 = a3;
  submitterMap = self->_submitterMap;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](submitterMap, "objectForKeyedSubscript:", v8));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (!v11)
  {
    id v12 = WALogCategoryDefaultHandle();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      unsigned int v15 = [v14 processIdentifier];
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil groupTypeToString:](&OBJC_CLASS___WAUtil, "groupTypeToString:", a4));
      int v20 = 136447490;
      id v21 = "-[WAEngine submitterMapCheck:group:]";
      __int16 v22 = 1024;
      int v23 = 1555;
      __int16 v24 = 1024;
      unsigned int v25 = v15;
      __int16 v26 = 2112;
      int v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2048;
      int64_t v31 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:pid %d proc %@ group %@(%ld) not in submitterMap",  (uint8_t *)&v20,  0x36u);
    }
  }

  return v11 != 0LL;
}

- (id)getXPCConnectionForProcessToken:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  unsigned int v15 = sub_10004B8C4;
  id v16 = sub_10004B8D4;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004BF0C;
  block[3] = &unk_1000CD3A0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)sendWakeUpNotificationForProcessWithName:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004BFF0;
  v7[3] = &unk_1000CD148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)prepareToTerminateViaEagerExit
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004C1DC;
  v4[3] = &unk_1000CCE18;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_prepareToTerminateViaEagerExit
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[WAEngine _prepareToTerminateViaEagerExit]";
    __int16 v9 = 1024;
    int v10 = 1603;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:prepareToTerminate...",  (uint8_t *)&v7,  0x12u);
  }

  -[WAEngine _prepareToTerminate](self, "_prepareToTerminate");
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[WAEngine _prepareToTerminateViaEagerExit]";
    __int16 v9 = 1024;
    int v10 = 1605;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Done", (uint8_t *)&v7, 0x12u);
  }
}

- (void)prepareToTerminateAnyReply:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C4E0;
  block[3] = &unk_1000CD3C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_prepareToTerminate
{
  cachedUsage = self->_cachedUsage;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:]( cachedUsage,  "setObject:forKey:",  v4,  @"Last Graceful Termination Date");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine listener](self, "listener"));
  [v5 suspend];

  id v6 = WALogCategoryDefaultHandle();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446466;
    uint64_t v14 = "-[WAEngine _prepareToTerminate]";
    __int16 v15 = 1024;
    int v16 = 1626;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_persist",  (uint8_t *)&v13,  0x12u);
  }

  -[WAEngine _persist](self, "_persist");
  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446466;
    uint64_t v14 = "-[WAEngine _prepareToTerminate]";
    __int16 v15 = 1024;
    int v16 = 1628;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:persistIORObjects",  (uint8_t *)&v13,  0x12u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  [v10 persistIORObjects:1];

  id v11 = WALogCategoryDefaultHandle();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446466;
    uint64_t v14 = "-[WAEngine _prepareToTerminate]";
    __int16 v15 = 1024;
    int v16 = 1630;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Done", (uint8_t *)&v13, 0x12u);
  }
}

- (void)handleMemoryWarning:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    int v13 = "-[WAEngine handleMemoryWarning:]";
    __int16 v14 = 1024;
    int v15 = 1637;
    __int16 v16 = 2080;
    id v17 = "-[WAEngine handleMemoryWarning:]";
    __int16 v18 = 1024;
    BOOL v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: critical=%d", buf, 0x22u);
  }

  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C964;
  block[3] = &unk_1000CCE40;
  objc_copyWeak(&v9, &location);
  BOOL v10 = v3;
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_getBasePersistenceKeychainQuery
{
  v5[0] = kSecAttrAccount;
  v5[1] = kSecAttrService;
  v6[0] = @"com.apple.wifi.analytics.persistence";
  v6[1] = @"WiFiAnalytics";
  v5[2] = kSecAttrAccessGroup;
  v5[3] = kSecClass;
  v6[2] = @"apple";
  v6[3] = kSecClassGenericPassword;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  4LL));
  id v3 = [v2 mutableCopy];

  return v3;
}

- (id)_rotateObscureKey
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  id v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[WAEngine _getBasePersistenceKeychainQuery](self, "_getBasePersistenceKeychainQuery"));
  id v6 = v5;
  if (!v5)
  {
    id v11 = WALogCategoryDefaultHandle();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v18 = 136446466;
      *(void *)&v18[4] = "-[WAEngine _rotateObscureKey]";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = 1683;
      int v13 = "%{public}s::%d:Failed to get base keychain query for write op";
      __int16 v14 = v12;
      uint32_t v15 = 18;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, v18, v15);
    }

- (id)_getObscureKey
{
  CFTypeRef result = 0LL;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[WAEngine _getBasePersistenceKeychainQuery](self, "_getBasePersistenceKeychainQuery"));
  id v3 = v2;
  if (!v2)
  {
    id v9 = WALogCategoryDefaultHandle();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v18 = "-[WAEngine _getObscureKey]";
      __int16 v19 = 1024;
      int v20 = 1707;
      BOOL v10 = "%{public}s::%d:Failed to get base keychain query for read op";
LABEL_12:
      int v13 = v6;
      uint32_t v14 = 18;
      goto LABEL_13;
    }

- (void)_saveKeyIVData:(id)a3 andTagData:(id)a4
{
  v27[0] = kSecAttrAccount;
  v27[1] = kSecAttrService;
  v28[0] = @"com.apple.wifi.analytics.persistence-iv";
  v28[1] = @"WiFiAnalytics";
  v27[2] = kSecAttrAccessGroup;
  v27[3] = kSecAttrAccessible;
  id v28[2] = @"apple";
  v28[3] = kSecAttrAccessibleAlways;
  v27[4] = kSecClass;
  v28[4] = kSecClassGenericPassword;
  id v18 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  5LL));
  int v7 = (const __CFDictionary *)[v6 mutableCopy];

  v25[0] = kSecAttrAccount;
  v25[1] = kSecAttrService;
  v26[0] = @"com.apple.wifi.analytics.persistence-tag";
  v26[1] = @"WiFiAnalytics";
  v25[2] = kSecAttrAccessGroup;
  v25[3] = kSecAttrAccessible;
  id v26[2] = @"apple";
  v26[3] = kSecAttrAccessibleAlways;
  void v25[4] = kSecClass;
  v26[4] = kSecClassGenericPassword;
  OSStatus v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  5LL));
  id v9 = (const __CFDictionary *)[v8 mutableCopy];

  SecItemDelete(v7);
  SecItemDelete(v9);
  -[__CFDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, kSecValueData);

  -[__CFDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, kSecValueData);
  OSStatus v10 = SecItemAdd(v7, 0LL);
  if (v10)
  {
    OSStatus v12 = v10;
    id v13 = WALogCategoryDefaultHandle();
    uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v20 = "-[WAEngine _saveKeyIVData:andTagData:]";
      __int16 v21 = 1024;
      int v22 = 1750;
      __int16 v23 = 1024;
      OSStatus v24 = v12;
      id v15 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d for IV data";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x18u);
    }

- (id)_getDataFromKeychain:(id)a3
{
  id v3 = a3;
  CFTypeRef result = 0LL;
  v23[0] = kSecAttrAccount;
  v23[1] = kSecAttrService;
  v24[0] = v3;
  v24[1] = @"WiFiAnalytics";
  v23[2] = kSecAttrAccessGroup;
  v23[3] = kSecReturnData;
  v24[2] = @"apple";
  v24[3] = &__kCFBooleanTrue;
  v23[4] = kSecClass;
  void v24[4] = kSecClassGenericPassword;
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  5LL));
  id v5 = (const __CFDictionary *)[v4 mutableCopy];

  OSStatus v6 = SecItemCopyMatching(v5, &result);
  if (v6)
  {
    OSStatus v9 = v6;
    id v10 = WALogCategoryDefaultHandle();
    OSStatus v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v18 = "-[WAEngine _getDataFromKeychain:]";
      __int16 v19 = 1024;
      int v20 = 1773;
      __int16 v21 = 1024;
      LODWORD(v22[0]) = v9;
      WORD2(v22[0]) = 2080;
      *(void *)((char *)v22 + 6) = "-[WAEngine _getDataFromKeychain:]";
      OSStatus v12 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d in %s";
      id v13 = v11;
      uint32_t v14 = 34;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }

- (void)_persist
{
  id v3 = WALogCategoryDefaultHandle();
  OSStatus v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WAEngine Persist",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v5 = (void *)os_transaction_create("com.apple.wifianalytics.persist");
  OSStatus v6 = &OBJC_IVAR___WAEngine__tmpFilesHaveAttemptedProcessingInDataStreamPath;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](&OBJC_CLASS___WAActivityManager, "sharedActivityManager"));
  [v7 osTransactionCreate:"com.apple.wifianalytics.persist" transaction:v5];

  id v8 = v5;
  id v9 = WALogCategoryDefaultHandle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t description = os_transaction_get_description(v8);
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    __int16 v221 = 1024;
    int v222 = 1785;
    __int16 v223 = 2080;
    v224 = (const char *)description;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Started transaction %s",  buf,  0x1Cu);
  }

  char v218 = 0;
  if (self->_readingPersistFile || self->_writingPersistFile)
  {
    id v12 = WALogCategoryDefaultHandle();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint32_t v14 = @"reading";
      BOOL readingPersistFile = self->_readingPersistFile;
      v220 = "-[WAEngine _persist]";
      *(_DWORD *)buf = 136446722;
      if (!readingPersistFile) {
        uint32_t v14 = @"writing";
      }
      __int16 v221 = 1024;
      int v222 = 1791;
      __int16 v223 = 2112;
      v224 = (const char *)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Cannot persist, we're currenlty %@ the persistence file",  buf,  0x1Cu);
    }

LABEL_12:
    id v16 = WALogCategoryDefaultHandle();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = os_transaction_get_description(v8);
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      __int16 v221 = 1024;
      int v222 = 2013;
      __int16 v223 = 2080;
      v224 = (const char *)v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Ending transaction %s",  buf,  0x1Cu);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 + 464 sharedActivityManager]);
    [v19 osTransactionComplete:v8];

    id v20 = WALogCategoryDefaultHandle();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      __int16 v221 = 1024;
      int v222 = 2015;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to persist!", buf, 0x12u);
    }

    id v22 = WALogCategoryDefaultHandle();
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      OSStatus v24 = "Failed";
LABEL_18:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "WAEngine Persist",  v24,  buf,  2u);
      goto LABEL_19;
    }

    goto LABEL_19;
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Persist Calls",  self->_cachedUsage,  self->_engineQ);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Last Persisted Date");
  cachedUsage = self->_cachedUsage;
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v26, @"Last Persisted Date");

  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Last Persisted PID");
  int v27 = self->_cachedUsage;
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", self->_pid));
  -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, @"Last Persisted PID");

  -[WAEngine _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  -[WAEngine _calculateProfileUptime](self, "_calculateProfileUptime");
  -[WAEngine _calculateProcessUsage](self, "_calculateProcessUsage");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int16 v30 = NSHomeDirectory();
  int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@t.out",  v31,  @"/Library/com.apple.wifianalyticsd/.wa/"));
  unsigned __int8 v33 = [v29 fileExistsAtPath:v32];

  if ((v33 & 1) == 0)
  {
    id v34 = WALogCategoryDefaultHandle();
    int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v36 = NSHomeDirectory();
      id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      __int16 v38 = (char *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@t.out",  v37,  @"/Library/com.apple.wifianalyticsd/.wa/"));
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      __int16 v221 = 1024;
      int v222 = 1806;
      __int16 v223 = 2112;
      v224 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Persistence file doesnt yet exist %@",  buf,  0x1Cu);
    }

    -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Persist file creation Date");
    unsigned int v39 = self->_cachedUsage;
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:", v40, @"Persist file creation Date");
  }

  int v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int16 v42 = NSHomeDirectory();
  id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v43,  @"/Library/com.apple.wifianalyticsd/.wa/"));
  unsigned __int8 v45 = [v41 fileExistsAtPath:v44 isDirectory:&v218];

  if ((v45 & 1) != 0)
  {
    id v46 = WALogCategoryDefaultHandle();
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      __int16 v221 = 1024;
      int v222 = 1820;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Directory for persistence exists...",  buf,  0x12u);
    }

    id v48 = 0LL;
  }

  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v50 = NSHomeDirectory();
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v51,  @"/Library/com.apple.wifianalyticsd/.wa/"));
    id v217 = 0LL;
    unsigned __int8 v53 = [v49 createDirectoryAtPath:v52 withIntermediateDirectories:1 attributes:0 error:&v217];
    id v48 = v217;

    id v54 = WALogCategoryDefaultHandle();
    int v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    id v47 = v55;
    if ((v53 & 1) != 0)
    {
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      __int16 v221 = 1024;
      int v222 = 1816;
      __int16 v56 = "%{public}s::%d:Directory for persistence created...";
      id v57 = v47;
      os_log_type_t v58 = OS_LOG_TYPE_DEBUG;
    }

    else
    {
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      __int16 v221 = 1024;
      int v222 = 1814;
      __int16 v56 = "%{public}s::%d:Failed to create directory for persistence file";
      id v57 = v47;
      os_log_type_t v58 = OS_LOG_TYPE_ERROR;
    }

    _os_log_impl((void *)&_mh_execute_header, v57, v58, v56, buf, 0x12u);
  }

- (void)_unpersist
{
  id v3 = WALogCategoryDefaultHandle();
  OSStatus v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WAEngine Unpersist",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v5 = (void *)os_transaction_create("com.apple.wifianalytics.unpersist");
  OSStatus v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](&OBJC_CLASS___WAActivityManager, "sharedActivityManager"));
  [v6 osTransactionCreate:"com.apple.wifianalytics.unpersist" transaction:v5];

  id v7 = v5;
  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t description = os_transaction_get_description(v7);
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2023;
    __int16 v299 = 2080;
    v300 = (const char *)description;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Started transaction %s",  buf,  0x1Cu);
  }

  v257 = v7;

  OSStatus v11 = objc_autoreleasePoolPush();
  size_t v295 = 0LL;
  v273 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _getObscureKey](self, "_getObscureKey"));
  self->_BOOL readingPersistFile = 1;
  id v12 = WALogCategoryDefaultHandle();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = NSHomeDirectory();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = (char *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@t.out",  v15,  @"/Library/com.apple.wifianalyticsd/.wa/"));
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2054;
    __int16 v299 = 2112;
    v300 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Reading persistence file %@",  buf,  0x1Cu);
  }

  id v17 = NSHomeDirectory();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@t.out",  v18,  @"/Library/com.apple.wifianalyticsd/.wa/"));
  id v294 = 0LL;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v19,  1LL,  &v294));
  __int16 v21 = (char *)v294;

  id v22 = v20;
  id v23 = [v20 length];
  char v306 = 0;
  OSStatus v24 = &AnalyticsSendEventLazy_ptr;
  memset(key, 0, sizeof(key));
  if (!v20)
  {
    self->_persistFileExistedAtPIDLoad = 0;
    id v35 = WALogCategoryDefaultHandle();
    NSErrorUserInfoKey v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2068;
      __int16 v299 = 2112;
      v300 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:No persistence file, likely first run after boot (err:%@)",  buf,  0x1Cu);
    }

    unsigned int v25 = v273;
    goto LABEL_16;
  }

  self->_persistFileExistedAtPIDLoad = 1;
  unsigned int v25 = v273;
  if (!v273)
  {
    id v245 = WALogCategoryDefaultHandle();
    v246 = (os_log_s *)objc_claimAutoreleasedReturnValue(v245);
    if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2069;
      _os_log_impl( (void *)&_mh_execute_header,  v246,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Couldn't get key to unobscure persistence file...",  buf,  0x12u);
    }

    -[WAEngine _removePersistenceFile](self, "_removePersistenceFile");
    goto LABEL_16;
  }

  size_t v26 = (size_t)v23;
  v269 = v11;
  size_t v27 = (size_t)v23 + 16;
  [v273 getCString:key maxLength:33 encoding:4];
  dataOut = malloc(v27);
  if (!dataOut)
  {
    id v247 = WALogCategoryDefaultHandle();
    v248 = (os_log_s *)objc_claimAutoreleasedReturnValue(v247);
    OSStatus v11 = v269;
    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2073;
      _os_log_impl( (void *)&_mh_execute_header,  v248,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Couldn't allocate buffer to unobscure persistence data",  buf,  0x12u);
    }

LABEL_16:
    id v37 = 0LL;
    v253 = 0LL;
    v254 = 0LL;
    goto LABEL_38;
  }

  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( -[WAEngine _getDataFromKeychain:]( self,  "_getDataFromKeychain:",  @"com.apple.wifi.analytics.persistence-iv"));
  uint64_t v29 = objc_claimAutoreleasedReturnValue( -[WAEngine _getDataFromKeychain:]( self,  "_getDataFromKeychain:",  @"com.apple.wifi.analytics.persistence-tag"));
  v263 = v28;
  v267 = (void *)v29;
  if (v28 && v29)
  {
    __int16 v30 = (void *)v29;
    int64_t v31 = [v28 bytes];
    int v32 = v31[2];
    uint64_t v303 = *(void *)v31;
    int v304 = v32;
    *(_OWORD *)buf = *(_OWORD *)[v30 bytes];
    unsigned __int8 v33 = dataOut;
    CCCryptorStatus v34 = CCCryptorGCMOneshotDecrypt( 0, key, 32, &v303, 12, 0, 0, [v22 bytes], v26, dataOut, buf, 16);
    size_t v295 = v26;
  }

  else
  {
    id v38 = WALogCategoryDefaultHandle();
    unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2091;
      __int16 v299 = 2080;
      v300 = "-[WAEngine _unpersist]";
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:%s: IV and tag not found",  buf,  0x1Cu);
    }

    size_t dataOutAvailable = v27;
    unsigned __int8 v33 = dataOut;
    CCCryptorStatus v34 = CCCrypt( 1u, 0, 1u, key, 0x20uLL, 0, [v22 bytes], v26, dataOut, dataOutAvailable, &v295);
  }

  self->_BOOL readingPersistFile = 0;
  if (v34)
  {
    id v249 = WALogCategoryDefaultHandle();
    v250 = (os_log_s *)objc_claimAutoreleasedReturnValue(v249);
    if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2098;
      __int16 v299 = 2080;
      v300 = "-[WAEngine _unpersist]";
      __int16 v301 = 1024;
      CCCryptorStatus v302 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v250,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:%s: Failed to unobscure: %d",  buf,  0x22u);
    }

    free(v33);
    v265 = 0LL;
    v253 = 0LL;
    v254 = 0LL;
    id v37 = 0LL;
    OSStatus v11 = v269;
  }

  else
  {
    id obj = v22;
    __int16 v40 = objc_alloc(&OBJC_CLASS___NSData);
    int v41 = -[NSData initWithBytes:length:](v40, "initWithBytes:length:", v33, v295);
    uint64_t v258 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSError);
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
    __int16 v44 = v21;
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___WAField);
    uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSData);
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    uint64_t v252 = v45;
    __int16 v21 = v44;
    id v50 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v258,  v42,  v43,  v252,  v46,  v47,  v48,  v49,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    id v293 = 0LL;
    v265 = v41;
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v51,  v41,  &v293));
    v52 = (char *)v293;

    OSStatus v11 = v269;
    if (v52)
    {
      id v53 = WALogCategoryDefaultHandle();
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2104;
        __int16 v299 = 2112;
        v300 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive root persistence dict: %@",  buf,  0x1Cu);
      }
    }

    free(dataOut);
    id v22 = obj;
    if (v37)
    {
      int v55 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_BUILD_VERSION_PERSIST_KEY"]);

      if (v55)
      {
        __int16 v56 = objc_alloc(&OBJC_CLASS___NSString);
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_BUILD_VERSION_PERSIST_KEY"]);
        os_log_type_t v58 = -[NSString initWithFormat:](v56, "initWithFormat:", @"%@", v57);

        unsigned int v59 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s%s%s",  "WiFiAnalytics_executables-680.21",  "\"WiFiAnalytics_executables-680.21\",  "Nov 10 2024 01:54:15"");
        v254 = v59;
        if (v58)
        {
          v253 = v58;
          unsigned __int8 v60 = -[NSString isEqual:](v58, "isEqual:", v59);
          OSStatus v24 = &AnalyticsSendEventLazy_ptr;
          unsigned int v25 = v273;
          unsigned int v61 = v263;
          if ((v60 & 1) != 0) {
            goto LABEL_37;
          }
LABEL_34:
          -[WAEngine _removePersistenceFile](self, "_removePersistenceFile");

          id v62 = WALogCategoryDefaultHandle();
          id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2119;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Detected out of date persistence file, removing it and abandoning unpersist attempt...",  buf,  0x12u);
          }

          id v37 = 0LL;
          goto LABEL_37;
        }
      }

      else
      {
        v254 = 0LL;
      }

      v253 = 0LL;
      OSStatus v24 = &AnalyticsSendEventLazy_ptr;
      unsigned int v25 = v273;
      unsigned int v61 = v263;
      goto LABEL_34;
    }

    v253 = 0LL;
    v254 = 0LL;
    OSStatus v24 = &AnalyticsSendEventLazy_ptr;
    unsigned int v25 = v273;
  }

  unsigned int v61 = v263;
LABEL_37:

LABEL_38:
  objc_autoreleasePoolPop(v11);
  self->_BOOL readingPersistFile = 0;
  v64 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_USAGE"]);
  id v65 = WALogCategoryDefaultHandle();
  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v67 = (const char *)[v64 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2128;
    __int16 v299 = 2048;
    v300 = v67;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%{public}s::%d:usageData size: %lu", buf, 0x1Cu);
  }

  v274 = v37;
  v270 = v64;
  if (!v64) {
    goto LABEL_46;
  }
  v68 = v24[100];
  uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSDate);
  v72 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v69,  v70,  v71,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  id v292 = 0LL;
  v74 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v68 unarchivedObjectOfClasses:v73 fromData:v64 error:&v292]);
  uint64_t v75 = (char *)v292;

  if (v75)
  {
    id v76 = WALogCategoryDefaultHandle();
    uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2132;
      __int16 v299 = 2112;
      v300 = v75;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive usageData: %@",  buf,  0x1Cu);
    }
  }

  id v37 = v274;
  if (!v74) {
LABEL_46:
  }
    v74 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[WAEngine setCachedUsage:](self, "setCachedUsage:", v74);

  -[WAEngine _handleUnpersistForUsageData](self, "_handleUnpersistForUsageData");
  +[WAUtil logNestedDictionary:indent:prefix:]( &OBJC_CLASS___WAUtil,  "logNestedDictionary:indent:prefix:",  self->_cachedUsage,  0LL,  @"Unpersist engine _cachedUsage");
  v78 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_CHIPSET"]);
  id v79 = WALogCategoryDefaultHandle();
  v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v81 = (const char *)[v78 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2145;
    __int16 v299 = 2048;
    v300 = v81;
    _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:wifiChipSetData size: %lu",  buf,  0x1Cu);
  }

  v268 = v78;
  if (!v78) {
    goto LABEL_55;
  }
  v82 = v24[100];
  uint64_t v83 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  id v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
  id v291 = 0LL;
  v85 = (void *)objc_claimAutoreleasedReturnValue([v82 unarchivedObjectOfClasses:v84 fromData:v78 error:&v291]);
  id v86 = (char *)v291;

  if (v86)
  {
    id v87 = WALogCategoryDefaultHandle();
    uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2149;
      __int16 v299 = 2112;
      v300 = v86;
      _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive wifiChipSet: %@",  buf,  0x1Cu);
    }
  }

  if (!v85) {
LABEL_55:
  }
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", &stru_1000CF610));
  -[WAEngine setWifiChipSet:](self, "setWifiChipSet:", v85);

  id v89 = WALogCategoryDefaultHandle();
  uint64_t v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine wifiChipSet](self, "wifiChipSet"));
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2155;
    __int16 v299 = 2112;
    v300 = v91;
    _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:self.wifiChipSet %@",  buf,  0x1Cu);
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_INFRA_INTERFACE"]);
  id v93 = WALogCategoryDefaultHandle();
  v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v95 = (const char *)[v92 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2158;
    __int16 v299 = 2048;
    v300 = v95;
    _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:infraInterfaceNameData size: %lu",  buf,  0x1Cu);
  }

  v266 = v92;
  if (!v92) {
    goto LABEL_66;
  }
  id v96 = v24[100];
  uint64_t v97 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
  id v290 = 0LL;
  uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([v96 unarchivedObjectOfClasses:v98 fromData:v92 error:&v290]);
  id v100 = (char *)v290;

  if (v100)
  {
    id v101 = WALogCategoryDefaultHandle();
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2162;
      __int16 v299 = 2112;
      v300 = v100;
      _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive infraInterfaceName: %@",  buf,  0x1Cu);
    }
  }

  if (!v99) {
LABEL_66:
  }
    uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"dunno"));
  -[WAEngine setInfraInterfaceName:](self, "setInfraInterfaceName:", v99);

  id v103 = WALogCategoryDefaultHandle();
  id v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    v105 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2168;
    __int16 v299 = 2112;
    v300 = v105;
    _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:self.infraInterfaceName %@",  buf,  0x1Cu);
  }

  v106 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_DPS_WD_BUDGET"]);
  id v107 = WALogCategoryDefaultHandle();
  v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
  {
    v109 = (const char *)[v106 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2172;
    __int16 v299 = 2048;
    v300 = v109;
    _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:dpsWDBudgetData size: %lu",  buf,  0x1Cu);
  }

  v264 = v106;
  if (!v106) {
    goto LABEL_78;
  }
  v110 = v24[100];
  uint64_t v111 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v113 = objc_opt_class(&OBJC_CLASS___NSDate);
  id v114 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v111,  v112,  v113,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  id v289 = 0LL;
  uint64_t v116 = objc_claimAutoreleasedReturnValue([v110 unarchivedObjectOfClasses:v115 fromData:v264 error:&v289]);
  id v117 = (char *)v289;

  if (v117)
  {
    id v118 = WALogCategoryDefaultHandle();
    id v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2176;
      __int16 v299 = 2112;
      v300 = v117;
      _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive dpsWDBudgetData: %@",  buf,  0x1Cu);
    }
  }

  id v37 = v274;
  if (v116)
  {
    int v120 = 0;
    uint64_t v121 = (NSMutableDictionary *)v116;
  }

  else
  {
LABEL_78:
    uint64_t v121 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v116 = 0LL;
    int v120 = 1;
  }

  v272 = (NSMutableDictionary *)v116;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine recommendationEngine](self, "recommendationEngine"));
  [v122 setDpsWDBudgetDict:v121];

  if (v120) {
  id v123 = WALogCategoryDefaultHandle();
  }
  v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v125 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine recommendationEngine](self, "recommendationEngine"));
    id v126 = (char *)objc_claimAutoreleasedReturnValue([v125 dpsWDBudgetDict]);
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2183;
    __int16 v299 = 2112;
    v300 = v126;
    _os_log_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:self.recommendationEngine.dpsWDBudgetDict %@",  buf,  0x1Cu);
  }

  v127 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_DNS_PERSISTDATA"]);
  id v128 = WALogCategoryDefaultHandle();
  unsigned int v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    id v130 = (const char *)[v127 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2186;
    __int16 v299 = 2048;
    v300 = v130;
    _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:dps/dns: unpersisting dnsPersistenceData size: %lu",  buf,  0x1Cu);
  }

  if (v127)
  {
    int v131 = v24[100];
    __int16 v132 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
    id v288 = 0LL;
    id obja = (id)objc_claimAutoreleasedReturnValue([v131 unarchivedObjectOfClasses:v133 fromData:v127 error:&v288]);
    v134 = (char *)v288;

    if (v134)
    {
      id v135 = WALogCategoryDefaultHandle();
      id v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2190;
        __int16 v299 = 2112;
        v300 = v134;
        _os_log_impl( (void *)&_mh_execute_header,  v136,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:dps/dns: Failed to unarchive captiveServerIP: %@",  buf,  0x1Cu);
      }
    }

    objc_storeStrong((id *)&self->_appleCaptiveServerIP, obja);
    id v137 = WALogCategoryDefaultHandle();
    id v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
    {
      appleCaptiveServerIP = self->_appleCaptiveServerIP;
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2194;
      __int16 v299 = 2112;
      v300 = (const char *)appleCaptiveServerIP;
      _os_log_impl( (void *)&_mh_execute_header,  v138,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:dps/dns: setting self->_appleCaptiveServerIP:%@",  buf,  0x1Cu);
    }
  }

  else
  {
    -[WAEngine resolveAppleCaptiveServer](self, "resolveAppleCaptiveServer");
    id obja = 0LL;
  }

  id v140 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));

  v256 = v127;
  if (v140)
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_DPS_QUICK_RECOVERY_WD_BUDGET"]);
    id v142 = WALogCategoryDefaultHandle();
    v143 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v144 = (const char *)[v141 length];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2203;
      __int16 v299 = 2048;
      v300 = v144;
      _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:dpsQuickRecoveryWDBudgetData size: %lu",  buf,  0x1Cu);
    }

    if (v141)
    {
      v145 = v24[100];
      uint64_t v146 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v147 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v148 = objc_opt_class(&OBJC_CLASS___NSDate);
      v149 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v146,  v147,  v148,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
      v150 = (void *)objc_claimAutoreleasedReturnValue(v149);
      id v287 = 0LL;
      v151 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v145 unarchivedObjectOfClasses:v150 fromData:v141 error:&v287]);
      id v152 = (char *)v287;

      if (v152)
      {
        id v153 = WALogCategoryDefaultHandle();
        v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2207;
          __int16 v299 = 2112;
          v300 = v152;
          _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive dpsQuickRecoveryWDBudgetData: %@",  buf,  0x1Cu);
        }
      }

      OSStatus v24 = &AnalyticsSendEventLazy_ptr;
    }

    else
    {
      v151 = v272;
    }

    id v155 = v151;
    if (!v151) {
      id v155 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
    [v156 setDpsQuickRecoveryWDBudgetDict:v155];

    if (!v151) {
    id v157 = WALogCategoryDefaultHandle();
    }
    id v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      int v159 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
      int v160 = (char *)objc_claimAutoreleasedReturnValue([v159 dpsQuickRecoveryWDBudgetDict]);
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2213;
      __int16 v299 = 2112;
      v300 = v160;
      _os_log_impl( (void *)&_mh_execute_header,  v158,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsQuickRecoveryWDBudgetDict %@",  buf,  0x1Cu);
    }

    id v161 = (void *)objc_claimAutoreleasedReturnValue([v274 objectForKeyedSubscript:@"WA_PERSIST_DPS_QUICK_RECOVERY_STATS"]);
    id v162 = WALogCategoryDefaultHandle();
    id v163 = (os_log_s *)objc_claimAutoreleasedReturnValue(v162);
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
    {
      v164 = (const char *)[v161 length];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2216;
      __int16 v299 = 2048;
      v300 = v164;
      _os_log_impl( (void *)&_mh_execute_header,  v163,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:dpsStatsData size: %lu",  buf,  0x1Cu);
    }

    if (!v151) {
      goto LABEL_119;
    }
    v165 = v24[100];
    uint64_t v166 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v167 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v168 = objc_opt_class(&OBJC_CLASS___NSDate);
    id v169 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v166,  v167,  v168,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v170 = (void *)objc_claimAutoreleasedReturnValue(v169);
    id v286 = 0LL;
    v272 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v165 unarchivedObjectOfClasses:v170 fromData:v161 error:&v286]);
    v171 = (char *)v286;

    if (v171)
    {
      id v172 = WALogCategoryDefaultHandle();
      v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2220;
        __int16 v299 = 2112;
        v300 = v171;
        _os_log_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive dpsStats: %@",  buf,  0x1Cu);
      }
    }

    OSStatus v24 = &AnalyticsSendEventLazy_ptr;
    v174 = v272;
    if (v272)
    {
      int v175 = 0;
    }

    else
    {
LABEL_119:
      v174 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v272 = 0LL;
      int v175 = 1;
    }

    unsigned __int8 v176 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
    [v176 setDpsStats:v174];

    if (v175) {
    id v177 = WALogCategoryDefaultHandle();
    }
    v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
    if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
    {
      v179 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
      v180 = (char *)objc_claimAutoreleasedReturnValue([v179 dpsStats]);
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2226;
      __int16 v299 = 2112;
      v300 = v180;
      _os_log_impl( (void *)&_mh_execute_header,  v178,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsStats %@",  buf,  0x1Cu);
    }

    id v37 = v274;
  }

  v181 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_MESSAGE_STORE"]);
  id v182 = WALogCategoryDefaultHandle();
  v183 = (os_log_s *)objc_claimAutoreleasedReturnValue(v182);
  if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
  {
    v184 = (const char *)[v181 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2230;
    __int16 v299 = 2048;
    v300 = v184;
    _os_log_impl( (void *)&_mh_execute_header,  v183,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:messageStoreData size: %lu",  buf,  0x1Cu);
  }

  v260 = v181;
  if (!v181) {
    goto LABEL_133;
  }
  os_log_type_t v185 = v24[100];
  uint64_t v186 = objc_opt_class(&OBJC_CLASS___WAMessageAWDStoreEntry);
  uint64_t v187 = objc_opt_class(&OBJC_CLASS___WAMessageAWDStore);
  uint64_t v188 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t v189 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v190 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
  id v191 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v186,  v187,  v188,  v189,  v190,  objc_opt_class(&OBJC_CLASS___WAField),  0LL);
  id v192 = (void *)objc_claimAutoreleasedReturnValue(v191);
  id v285 = 0LL;
  v193 = (WAMessageAWDStore *)objc_claimAutoreleasedReturnValue([v185 unarchivedObjectOfClasses:v192 fromData:v260 error:&v285]);
  id v194 = (char *)v285;

  if (v194)
  {
    id v195 = WALogCategoryDefaultHandle();
    v196 = (os_log_s *)objc_claimAutoreleasedReturnValue(v195);
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2234;
      __int16 v299 = 2112;
      v300 = v194;
      _os_log_impl( (void *)&_mh_execute_header,  v196,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive WAMessageAWDStore: %@",  buf,  0x1Cu);
    }
  }

  OSStatus v24 = &AnalyticsSendEventLazy_ptr;
  id v37 = v274;
  if (!v193) {
LABEL_133:
  }
    v193 = objc_alloc_init(&OBJC_CLASS___WAMessageAWDStore);
  -[WAEngine setMessageStore:](self, "setMessageStore:", v193);

  v197 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_PROCESS_REGISTRATION"]);
  id v198 = WALogCategoryDefaultHandle();
  v199 = (os_log_s *)objc_claimAutoreleasedReturnValue(v198);
  if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
  {
    v200 = (const char *)[v197 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2242;
    __int16 v299 = 2048;
    v300 = v200;
    _os_log_impl( (void *)&_mh_execute_header,  v199,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:processRegistrationData size: %lu",  buf,  0x1Cu);
  }

  v259 = v197;
  if (!v197) {
    goto LABEL_142;
  }
  v201 = v24[100];
  uint64_t v202 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v203 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v204 = objc_opt_class(&OBJC_CLASS___NSMutableSet);
  uint64_t v205 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v206 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v207 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v202,  v203,  v204,  v205,  v206,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v208 = (void *)objc_claimAutoreleasedReturnValue(v207);
  id v284 = 0LL;
  id v209 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v201 unarchivedObjectOfClasses:v208 fromData:v259 error:&v284]);
  id v210 = (char *)v284;

  if (v210)
  {
    id v211 = WALogCategoryDefaultHandle();
    id v212 = (os_log_s *)objc_claimAutoreleasedReturnValue(v211);
    if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2246;
      __int16 v299 = 2112;
      v300 = v210;
      _os_log_impl( (void *)&_mh_execute_header,  v212,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive process registration map: %@",  buf,  0x1Cu);
    }
  }

  OSStatus v24 = &AnalyticsSendEventLazy_ptr;
  if (!v209) {
LABEL_142:
  }
    id v209 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[WAEngine setProcessTokenToGroupTypeMap:](self, "setProcessTokenToGroupTypeMap:", v209);

  id v213 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"WA_PERSIST_IOREPORTER_REGISTRATIONS"]);
  id v214 = WALogCategoryDefaultHandle();
  id v215 = (os_log_s *)objc_claimAutoreleasedReturnValue(v214);
  if (os_log_type_enabled(v215, OS_LOG_TYPE_DEBUG))
  {
    id v216 = (const char *)[v213 length];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2255;
    __int16 v299 = 2048;
    v300 = v216;
    _os_log_impl( (void *)&_mh_execute_header,  v215,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:iorReporterWrapperData size: %lu",  buf,  0x1Cu);
  }

  v255 = v213;
  if (!v213) {
    goto LABEL_151;
  }
  id v217 = v24[100];
  id v283 = 0LL;
  id v218 = [v217 unarchivedObjectOfClass:objc_opt_class(WAIOReporterMessagePopulator) fromData:v213 error:&v283];
  v219 = (WAIOReporterMessagePopulator *)objc_claimAutoreleasedReturnValue(v218);
  v220 = (char *)v283;
  if (v220)
  {
    __int16 v221 = v220;
    id v222 = WALogCategoryDefaultHandle();
    __int16 v223 = (os_log_s *)objc_claimAutoreleasedReturnValue(v222);
    if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2259;
      __int16 v299 = 2112;
      v300 = v221;
      _os_log_impl( (void *)&_mh_execute_header,  v223,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive WAIOReporterMessagePopulator: %@",  buf,  0x1Cu);
    }
  }

  if (!v219) {
LABEL_151:
  }
    v219 = objc_alloc_init(&OBJC_CLASS___WAIOReporterMessagePopulator);
  -[WAEngine setIorMessagePopulator:](self, "setIorMessagePopulator:", v219);

  v224 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  [v224 setMessageDelegate:self];

  __int16 v225 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  [v225 setPersistenceDelegate:self];

  __int128 v281 = 0u;
  __int128 v282 = 0u;
  __int128 v279 = 0u;
  __int128 v280 = 0u;
  int v226 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v227 = (void *)objc_claimAutoreleasedReturnValue([v226 allKeys]);

  id v228 = [v227 countByEnumeratingWithState:&v279 objects:v297 count:16];
  if (v228)
  {
    id v229 = v228;
    uint64_t v230 = *(void *)v280;
    do
    {
      for (i = 0LL; i != v229; i = (char *)i + 1)
      {
        if (*(void *)v280 != v230) {
          objc_enumerationMutation(v227);
        }
        uint64_t v232 = *(void *)(*((void *)&v279 + 1) + 8LL * (void)i);
        __int128 v275 = 0u;
        __int128 v276 = 0u;
        __int128 v277 = 0u;
        __int128 v278 = 0u;
        v233 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        v234 = (void *)objc_claimAutoreleasedReturnValue([v233 objectForKeyedSubscript:v232]);

        id v235 = [v234 countByEnumeratingWithState:&v275 objects:v296 count:16];
        if (v235)
        {
          id v236 = v235;
          uint64_t v237 = *(void *)v276;
          do
          {
            for (j = 0LL; j != v236; j = (char *)j + 1)
            {
              if (*(void *)v276 != v237) {
                objc_enumerationMutation(v234);
              }
              -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]( self,  "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:",  v232,  [*(id *)(*((void *)&v275 + 1) + 8 * (void)j) integerValue]);
            }

            id v236 = [v234 countByEnumeratingWithState:&v275 objects:v296 count:16];
          }

          while (v236);
        }
      }

      id v229 = [v227 countByEnumeratingWithState:&v279 objects:v297 count:16];
    }

    while (v229);
  }

  id v239 = WALogCategoryDefaultHandle();
  v240 = (os_log_s *)objc_claimAutoreleasedReturnValue(v239);
  if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v241 = os_transaction_get_description(v257);
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2274;
    __int16 v299 = 2080;
    v300 = (const char *)v241;
    _os_log_impl( (void *)&_mh_execute_header,  v240,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Ending transaction %s",  buf,  0x1Cu);
  }

  v242 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](&OBJC_CLASS___WAActivityManager, "sharedActivityManager"));
  [v242 osTransactionComplete:v257];

  id v243 = WALogCategoryDefaultHandle();
  v244 = (os_log_s *)objc_claimAutoreleasedReturnValue(v243);
  if (os_signpost_enabled(v244))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v244,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "WAEngine Unpersist",  (const char *)&unk_1000B76E7,  buf,  2u);
  }
}

- (void)_removePersistenceFile
{
  id v3 = WALogCategoryDefaultHandle();
  OSStatus v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WAEngine RemovePersistenceFile",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  if (self->_readingPersistFile || self->_writingPersistFile)
  {
    id v5 = WALogCategoryDefaultHandle();
    OSStatus v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = @"reading";
      BOOL readingPersistFile = self->_readingPersistFile;
      unsigned int v59 = "-[WAEngine _removePersistenceFile]";
      *(_DWORD *)buf = 136446722;
      if (!readingPersistFile) {
        id v7 = @"writing";
      }
      __int16 v60 = 1024;
      int v61 = 2285;
      __int16 v62 = 2112;
      id v63 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Cannot remove persistence file, we're currenlty %@ it",  buf,  0x1Cu);
    }

    id v9 = 0LL;
    goto LABEL_10;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint32_t v14 = NSHomeDirectory();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@t.out",  v15,  @"/Library/com.apple.wifianalyticsd/.wa/"));
  unsigned int v17 = [v13 isDeletableFileAtPath:v16];

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int16 v19 = NSHomeDirectory();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@t.out",  v20,  @"/Library/com.apple.wifianalyticsd/.wa/"));
    id v57 = 0LL;
    unsigned __int8 v22 = [v18 removeItemAtPath:v21 error:&v57];
    id v23 = v57;

    if ((v22 & 1) == 0)
    {
      id v24 = WALogCategoryDefaultHandle();
      unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        size_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
        *(_DWORD *)buf = 136446722;
        unsigned int v59 = "-[WAEngine _removePersistenceFile]";
        __int16 v60 = 1024;
        int v61 = 2292;
        __int16 v62 = 2112;
        id v63 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error removing file at path: %@",  buf,  0x1Cu);
      }
    }
  }

  else
  {
    id v23 = 0LL;
  }

  size_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
  unsigned int v29 = [v27 isDeletableFileAtPath:v28];

  if (v29)
  {
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    int64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
    id v56 = v23;
    unsigned __int8 v32 = [v30 removeItemAtPath:v31 error:&v56];
    id v33 = v56;

    if ((v32 & 1) == 0)
    {
      id v34 = WALogCategoryDefaultHandle();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        NSErrorUserInfoKey v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v33 localizedDescription]);
        *(_DWORD *)buf = 136446722;
        unsigned int v59 = "-[WAEngine _removePersistenceFile]";
        __int16 v60 = 1024;
        int v61 = 2299;
        __int16 v62 = 2112;
        id v63 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error removing file getIORPopAvailabeIOReportersTempFile at path: %@",  buf,  0x1Cu);
      }
    }
  }

  else
  {
    id v33 = v23;
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUnavailablePredTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUnavailablePredTempFile"));
  unsigned int v39 = [v37 isDeletableFileAtPath:v38];

  if (v39)
  {
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    int v41 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUnavailablePredTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUnavailablePredTempFile"));
    id v55 = v33;
    unsigned __int8 v42 = [v40 removeItemAtPath:v41 error:&v55];
    id v10 = v55;

    if ((v42 & 1) == 0)
    {
      id v43 = WALogCategoryDefaultHandle();
      __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 136446722;
        unsigned int v59 = "-[WAEngine _removePersistenceFile]";
        __int16 v60 = 1024;
        int v61 = 2306;
        __int16 v62 = 2112;
        id v63 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error removing file getUnavailablePredTempFile at path: %@",  buf,  0x1Cu);
      }
    }
  }

  else
  {
    id v10 = v33;
  }

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
  unsigned int v48 = [v46 isDeletableFileAtPath:v47];

  if (v48)
  {
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
    id v54 = v10;
    unsigned __int8 v51 = [v49 removeItemAtPath:v50 error:&v54];
    id v9 = v54;

    if ((v51 & 1) != 0) {
      goto LABEL_11;
    }
    id v52 = WALogCategoryDefaultHandle();
    OSStatus v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
      *(_DWORD *)buf = 136446722;
      unsigned int v59 = "-[WAEngine _removePersistenceFile]";
      __int16 v60 = 1024;
      int v61 = 2313;
      __int16 v62 = 2112;
      id v63 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error removing file getUsageTempFile at path: %@",  buf,  0x1Cu);
    }

- (void)_handleUnpersistForUsageData
{
  id v3 = @"Work Bin: Last PID Work";
  -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Work Bin: Last PID Work");
  __int16 v62 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedUsage, "setObject:forKeyedSubscript:");
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));

  if (!v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedUsage,  "setObject:forKeyedSubscript:",  v5,  @"Work Bin: Previous PIDs Work");
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v6 = -[NSMutableDictionary copy](self->_cachedUsage, "copy");
  id v7 = [v6 countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = @"Work Bin: Previous PIDs Work";
    uint64_t v10 = *(void *)v71;
    uint64_t v64 = *(void *)v71;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v71 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(__CFString **)(*((void *)&v70 + 1) + 8LL * (void)i);
        if ((-[__CFString isEqualToString:](v12, "isEqualToString:", v9) & 1) != 0
          || -[__CFString isEqualToString:](v12, "isEqualToString:", v3))
        {
          id v13 = WALogCategoryDefaultHandle();
          uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446978;
            uint64_t v75 = "-[WAEngine _handleUnpersistForUsageData]";
            __int16 v76 = 1024;
            int v77 = 2340;
            __int16 v78 = 2112;
            id v79 = v3;
            __int16 v80 = 2112;
            dispatch_queue_t v81 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Skipping copying key to %@: %@",  buf,  0x26u);
          }
        }

        else
        {
          id v15 = v9;
          id v16 = v6;
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedUsage, "objectForKey:", v12));
          uint64_t v18 = v3;
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  v3));
          [v19 setObject:v17 forKeyedSubscript:v12];

          -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", v12);
          id v20 = WALogCategoryDefaultHandle();
          uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  v18));
            unsigned __int8 v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v12]);
            *(_DWORD *)buf = 136446978;
            uint64_t v75 = "-[WAEngine _handleUnpersistForUsageData]";
            __int16 v76 = 1024;
            int v77 = 2347;
            __int16 v78 = 2112;
            id v79 = v12;
            __int16 v80 = 2112;
            dispatch_queue_t v81 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:_cachedUsage[kLastPIDBin] now contains key %@ with value %@",  buf,  0x26u);
          }

          id v3 = v18;
          id v6 = v16;
          id v9 = v15;
          uint64_t v10 = v64;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v70 objects:v85 count:16];
    }

    while (v8);
  }

  if (self->_persistFileExistedAtPIDLoad)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"Terminations - Graceful"]);

    if (!v24)
    {
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Terminations - Unknown",  v25,  self->_engineQ);
    }
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  size_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
  id v27 = [v26 copy];

  id v28 = [v27 countByEnumeratingWithState:&v66 objects:v84 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v65 = *(void *)v67;
    id v63 = v27;
    do
    {
      __int16 v30 = 0LL;
      do
      {
        if (*(void *)v67 != v65) {
          objc_enumerationMutation(v27);
        }
        int64_t v31 = *(__CFString **)(*((void *)&v66 + 1) + 8LL * (void)v30);
        if (-[__CFString isEqualToString:](v31, "isEqualToString:", @"Persist file creation Date"))
        {
          unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v31]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
          [v34 setObject:v33 forKeyedSubscript:v31];
        }

        id v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
        NSErrorUserInfoKey v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v31]);
        uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSDate);
        char isKindOfClass = objc_opt_isKindOfClass(v36, v37);

        if ((isKindOfClass & 1) != 0)
        {
          id v39 = WALogCategoryDefaultHandle();
          __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          uint64_t v75 = "-[WAEngine _handleUnpersistForUsageData]";
          __int16 v76 = 1024;
          int v77 = 2364;
          __int16 v78 = 2112;
          id v79 = v31;
          int v41 = v40;
          unsigned __int8 v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: NSDate";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0x1Cu);
          goto LABEL_35;
        }

        if ((-[__CFString isEqualToString:](v31, "isEqualToString:", @"Last Persisted PID") & 1) != 0
          || -[__CFString isEqualToString:](v31, "isEqualToString:", @"Last Terminated PID"))
        {
          id v43 = WALogCategoryDefaultHandle();
          __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          uint64_t v75 = "-[WAEngine _handleUnpersistForUsageData]";
          __int16 v76 = 1024;
          int v77 = 2368;
          __int16 v78 = 2112;
          id v79 = v31;
          int v41 = v40;
          unsigned __int8 v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: kWAPersistedPidKey or kWATerminationPidKey";
          goto LABEL_34;
        }

        __int16 v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v31]);
        uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char v47 = objc_opt_isKindOfClass(v45, v46);

        id v48 = WALogCategoryDefaultHandle();
        __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        BOOL v49 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
        if ((v47 & 1) != 0)
        {
          if (v49)
          {
            id v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
            unsigned __int8 v51 = (__CFString *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v31]);
            id v52 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
            id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v31]);
            *(_DWORD *)buf = 136447234;
            uint64_t v75 = "-[WAEngine _handleUnpersistForUsageData]";
            __int16 v76 = 1024;
            int v77 = 2373;
            __int16 v78 = 2112;
            id v79 = v31;
            __int16 v80 = 2112;
            dispatch_queue_t v81 = v51;
            __int16 v82 = 2112;
            uint64_t v83 = v53;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Summing key %@ of kLastPIDBin %@ to kPreviousPIDsBin %@",  buf,  0x30u);
          }

          __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
          id v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
          +[WAUtil sumNSNumberForKey:dstDict:otherDict:]( &OBJC_CLASS___WAUtil,  "sumNSNumberForKey:dstDict:otherDict:",  v31,  v40,  v54);

          id v27 = v63;
        }

        else if (v49)
        {
          id v55 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
          id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v31]);
          id v57 = (__CFString *)objc_opt_class(v56);
          *(_DWORD *)buf = 136446978;
          uint64_t v75 = "-[WAEngine _handleUnpersistForUsageData]";
          __int16 v76 = 1024;
          int v77 = 2376;
          __int16 v78 = 2112;
          id v79 = v31;
          __int16 v80 = 2112;
          dispatch_queue_t v81 = v57;
          os_log_type_t v58 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: unknown class %@",  buf,  0x26u);

          id v27 = v63;
        }

- (void)_calculateEstimatedUptime
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));

  if (v3)
  {
    id v4 = WALogCategoryDefaultHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));
      [v8 timeIntervalSinceNow];
      double v10 = v9;

      *(_DWORD *)id v27 = 136447234;
      double v11 = -v10;
      *(void *)&v27[4] = "-[WAEngine _calculateEstimatedUptime]";
      if (v10 >= 0.0) {
        double v11 = v10;
      }
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 2392;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      int64_t v31 = v7;
      __int16 v32 = 2048;
      double v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:_cachedUsage[kWAUnpersistedDateKey] %@ now %@ interval %f",  v27,  0x30u);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Estimated Uptime (s)");
    cachedUsage = self->_cachedUsage;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    double v16 = -v15;
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v16,  *(_OWORD *)v27));
    uint64_t v18 = cachedUsage;
LABEL_17:
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, @"Estimated Uptime (s)");
    goto LABEL_18;
  }

  pidLaunchDate = self->_pidLaunchDate;
  id v20 = WALogCategoryDefaultHandle();
  __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  unsigned int v17 = v21;
  if (pidLaunchDate)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v22 = self->_pidLaunchDate;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
      *(_DWORD *)id v27 = 136447234;
      *(void *)&v27[4] = "-[WAEngine _calculateEstimatedUptime]";
      *(_WORD *)&v27[12] = 1024;
      if (v24 < 0.0) {
        double v24 = -v24;
      }
      *(_DWORD *)&v27[14] = 2397;
      __int16 v28 = 2112;
      id v29 = v22;
      __int16 v30 = 2112;
      int64_t v31 = v23;
      __int16 v32 = 2048;
      double v33 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:_pidLaunchDate %@ now %@ interval %f",  v27,  0x30u);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Estimated Uptime (s)");
    unsigned int v25 = self->_cachedUsage;
    -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
    if (v26 < 0.0) {
      double v26 = -v26;
    }
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v26,  *(void *)v27,  *(void *)&v27[8]));
    uint64_t v18 = v25;
    goto LABEL_17;
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v27 = 136446466;
    *(void *)&v27[4] = "-[WAEngine _calculateEstimatedUptime]";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 2402;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s::%d: calculating kWACumulativeUptimeKey unavailable",  v27,  0x12u);
  }

- (void)_calculateProfileUptime
{
  cachedUsage = self->_cachedUsage;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 1LL)));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v4, @"Profile: MegaWiFi Enabled (s)");

  -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Profile: MegaWiFi Uninstalled (s)");
  id v5 = self->_cachedUsage;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 0LL)));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, @"Profile: MegaWiFi Uninstalled (s)");
}

- (unint64_t)abstime_to_ns:(unint64_t)a3
{
  if (qword_1000ED018 != -1) {
    dispatch_once(&qword_1000ED018, &stru_1000CD3E8);
  }
  return (unint64_t)(*(double *)&qword_1000ECB90 * (double)a3);
}

- (void)_calculateProcessUsage
{
  if (!proc_pid_rusage(self->_pid, 4, v11))
  {
    -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Process: current_mem kB");
    cachedUsage = self->_cachedUsage;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v11[9] >> 10));
    -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v4, @"Process: current_mem kB");

    -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Process: lifetime_peak kB");
    id v5 = self->_cachedUsage;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v11[30] >> 10));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, @"Process: lifetime_peak kB");

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Process: cpu_time ns");
    id v7 = self->_cachedUsage;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[WAEngine abstime_to_ns:](self, "abstime_to_ns:", (char *)v11[3] + (unint64_t)v11[2])));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, @"Process: cpu_time ns");

    -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Process: storage_dirtied kB");
    double v9 = self->_cachedUsage;
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v11[29] >> 10));
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"Process: storage_dirtied kB");
  }

- (void)_cancelWorkReportRecurringTimer
{
  if (self->_workReportTimerRunning)
  {
    workReportTimer = self->_workReportTimer;
    if (workReportTimer)
    {
      if (!dispatch_source_testcancel((dispatch_source_t)workReportTimer))
      {
        id v4 = WALogCategoryDefaultHandle();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136446466;
          double v10 = "-[WAEngine _cancelWorkReportRecurringTimer]";
          __int16 v11 = 1024;
          int v12 = 2453;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Timer exists and is valid, Suspending",  (uint8_t *)&v9,  0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_workReportTimer);
        self->_BOOL workReportTimerRunning = 0;
        id v6 = WALogCategoryDefaultHandle();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL workReportTimerRunning = self->_workReportTimerRunning;
          int v9 = 136446722;
          double v10 = "-[WAEngine _cancelWorkReportRecurringTimer]";
          __int16 v11 = 1024;
          int v12 = 2456;
          __int16 v13 = 1024;
          BOOL v14 = workReportTimerRunning;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _workReportTimerRunning %d",  (uint8_t *)&v9,  0x18u);
        }
      }
    }
  }

- (void)_enableWorkReportRecurringTimer
{
  BOOL workReportTimerRunning = self->_workReportTimerRunning;
  id v4 = WALogCategoryDefaultHandle();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (workReportTimerRunning)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136446466;
      BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v50 = 1024;
      int v51 = 2463;
      id v7 = "%{public}s::%d:Persist is already scheduled, ignoring additional request";
      id v8 = v5;
      uint32_t v9 = 18;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_40;
    }

    goto LABEL_40;
  }

  if (v6)
  {
    BOOL v10 = self->_workReportTimerRunning;
    unint64_t v11 = -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds");
    workReportTimer = self->_workReportTimer;
    BOOL v13 = workReportTimer != 0LL;
    if (workReportTimer) {
      BOOL v14 = dispatch_source_testcancel((dispatch_source_t)workReportTimer) != 0;
    }
    else {
      BOOL v14 = 0;
    }
    *(_DWORD *)buf = 136447490;
    BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
    __int16 v50 = 1024;
    int v51 = 2467;
    __int16 v52 = 1024;
    *(_DWORD *)id v53 = v10;
    *(_WORD *)&v53[4] = 2048;
    *(void *)&v53[6] = v11;
    __int16 v54 = 1024;
    BOOL v55 = v13;
    __int16 v56 = 1024;
    BOOL v57 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_workReportTimerRunning is %d work_report_seconds is %lu _workReportTimer exists %d testcancel is %d",  buf,  0x2Eu);
  }

  if (!self->_workReportTimerRunning)
  {
    id v15 = WALogCategoryDefaultHandle();
    double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v50 = 1024;
      int v51 = 2470;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
    }

    unsigned int v17 = self->_workReportTimer;
    if (v17)
    {
      if (!dispatch_source_testcancel((dispatch_source_t)v17))
      {
LABEL_25:
        id v29 = WALogCategoryDefaultHandle();
        __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v31 = -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds");
          *(_DWORD *)buf = 136446722;
          BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v50 = 1024;
          int v51 = 2491;
          __int16 v52 = 2048;
          *(void *)id v53 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s",  buf,  0x1Cu);
        }

        __int16 v32 = self->_workReportTimer;
        dispatch_time_t v33 = dispatch_time( 0xFFFFFFFFFFFFFFFELL,  1000000000 * -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds"));
        dispatch_source_set_timer( (dispatch_source_t)v32,  v33,  1000000000 * -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds"),  0x3B9ACA00uLL);
        id v34 = WALogCategoryDefaultHandle();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v50 = 1024;
          int v51 = 2493;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting dispatch_source_set_timer Done",  buf,  0x12u);
        }

        id v36 = WALogCategoryDefaultHandle();
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v50 = 1024;
          int v51 = 2495;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:dispatch_resume _workReportTimer",  buf,  0x12u);
        }

        dispatch_resume((dispatch_object_t)self->_workReportTimer);
        self->_BOOL workReportTimerRunning = 1;
        id v38 = WALogCategoryDefaultHandle();
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v40 = self->_workReportTimerRunning;
          *(_DWORD *)buf = 136446722;
          BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          __int16 v50 = 1024;
          int v51 = 2499;
          __int16 v52 = 1024;
          *(_DWORD *)id v53 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _workReportTimerRunning %d",  buf,  0x18u);
        }

        goto LABEL_34;
      }
    }

    else
    {
      id v18 = WALogCategoryDefaultHandle();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
        __int16 v50 = 1024;
        int v51 = 2476;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Creating _workReportTimer",  buf,  0x12u);
      }

      id v20 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_engineQ);
      __int16 v21 = self->_workReportTimer;
      self->_workReportTimer = v20;

      id v22 = WALogCategoryDefaultHandle();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
        __int16 v50 = 1024;
        int v51 = 2478;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Creating _workReportTimer Done",  buf,  0x12u);
      }

      if (!self->_workReportTimer)
      {
        id v46 = WALogCategoryDefaultHandle();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "Failed to create _workReportTimer",  buf,  2u);
        }

        goto LABEL_40;
      }
    }

    id v24 = WALogCategoryDefaultHandle();
    unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v50 = 1024;
      int v51 = 2482;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Setting dispatch_source_set_event_handler",  buf,  0x12u);
    }

    double v26 = self->_workReportTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100053510;
    handler[3] = &unk_1000CCD80;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v26, handler);
    id v27 = WALogCategoryDefaultHandle();
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      __int16 v50 = 1024;
      int v51 = 2488;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_25;
  }

- (id)_createNextWorkReportSnapshot
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Telemetry: Work Report Window",  v3,  self->_engineQ);

  -[WAEngine _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  -[WAEngine _calculateProcessUsage](self, "_calculateProcessUsage");
  -[WAEngine _calculateProfileUptime](self, "_calculateProfileUptime");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));

  if (!v4) {
    return 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getCachedUsage]);
  id v7 = [v6 copy];

  if (v7)
  {
    v14[0] = @"Module_Engine";
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
    id v9 = [v8 copy];
    v14[1] = @"Module_IOR";
    v15[0] = v9;
    v15[1] = v7;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  }

  else
  {
    int v12 = @"Module_Engine";
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
    id v8 = [v7 copy];
    id v13 = v8;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  }

  return v10;
}

- (id)_createWorkReportDictionaryForTelemetryAndRollBucket
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine nowCacheUsageForTelemetry](self, "nowCacheUsageForTelemetry"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine oldCacheUsageForTelemetry](self, "oldCacheUsageForTelemetry"));
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_AgeOutAnalytics",  @"AnalyticsProcessor: Age Out Analytics",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_ApProfileForBSSID",  @"AnalyticsProcessor: AP Profile For BSSID",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_ProcessDatapathMetricsStream",  @"AnalyticsProcessor: Datapath Metrics Stream",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_ProcessWAM",  @"AnalyticsProcessor: Process WAM File",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_ProcessWAMessageMetric",  @"AnalyticsProcessor: Process WA Message Metric",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_Prune",  @"AnalyticsProcessor: Prune",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ap_SummarizeForNetwork",  @"AnalyticsProcessor: Summarize Analytics For Network",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_ClearMessageStore",  @"Client: Clear Message Store",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_ClientConfigChangeDelegate",  @"Client: Client Config Change Deligate",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_ConvertWiFiStatsIntoPercentile",  @"Client: Convert WiFi Stats into Percentile",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_EstablishConnection",  @"Client: Establish Connection",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_GetDeviceAnalyticsConfiguration",  @"Client: Get Device Analytics Config",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_GetDpsStats",  @"Client: Get DPS Stats",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_GetMessageModelForGroup",  @"Client: Get Message Model For Group",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_GetNewMessageForKey",  @"Client: Get New Message For Key",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_GetUsageStats",  @"Client: Get Usage Stats",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_IssueIOReportManagementCommand",  @"Client: Issue IOReport Managemen Command",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_KillDaemon",  @"Client: Kill Daemon",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_lqmCrashTracerNotify",  @"Client: LQM Crash Tracer Notify",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_lqmCrashTracerReceive",  @"Client: LQM Crash Tracer Receive",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_RegisterMessageGroup",  @"Client: Register Message Group",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_SendMemoryPressureRequest",  @"Client: Send Memory Pressure Request",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_SetDeviceAnalyticsConfiguration",  @"Client: Set Device Analytics Config",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_SubmitMessage",  @"Client: Submit Message",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_SubmitWiFiAnalayticsMessage",  @"Client: Submit WiFi Analytics Message",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_SubmitWiFiAnalayticsMessageAdvanced",  @"Client: Submit WiFi Analytics Message Advanced",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_SummarizeDeviceAnalyticsForNetwork",  @"Client: Summarize Device Analytics For Network",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_TrapCrashMiniTracerDump",  @"Client: Trap Crash Mini Tracer Dump",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_Trigger11axPerfStudy",  @"Client: Trigger 11ax Perf Study",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_TriggerDatapathDiagnostic",  @"Client: Trigger Datapath Diagnostic",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_TriggerDeviceAnalyticsStoreMigration",  @"Client: Trigger Device Analytics Store Migration",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"client_TriggerQueryForNWActivity",  @"Client: Trigger Query for NW Activity",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"debug_profileUptime",  @"Profile: MegaWiFi Enabled (s)",  @"Module_Engine",  v3,  v4,  v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"debug_profileUptime"));
  id v7 = [v6 unsignedLongValue];

  if (v7) {
    id v8 = &__kCFBooleanTrue;
  }
  else {
    id v8 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"debug_profileInstalled");
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"dispatch_RxMemoryCritical",  @"Dispatch: Received Memory Critical",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"dispatch_RxMemoryWarning",  @"Dispatch: Received Memory Warning",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"engine_PersistCalls",  @"Persist Calls",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"engine_TerminationGraceful",  @"Terminations - Graceful",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"engine_TerminationUnknown",  @"Terminations - Unknown",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"engine_TerminationTryEagerExit",  @"Terminations - Try Eager Exit",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"engine_UnpersistedCalls",  @"Unpersisted Count",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"engine_Uptime",  @"Estimated Uptime (s)",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_BuildStructuredDict",  @"Build Structured Dict Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_CreateSamples",  @"CreateSamples Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_CreateSamplesFailed",  @"CreateSamples Failed Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_CreateSubscription",  @"CreateSubscription Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_CreateSubscriptionFailed",  @"CreateSubscription Failed Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_FindChannels",  @"Find Channels Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_FullTeardown",  @"IOR Full Teardown Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_FullTeardownFailed",  @"IOR Full Teardown Failed Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_FullTeardownRecovered",  @"IOR Full Teardown Recovered Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_LegendQuery",  @"Legend Query Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_LegendQueryFailed",  @"Legend Query Failed",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_PersistCalls",  @"Persist Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_PopulationFailed",  @"IOR Population Failed Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_PopulationSuccess",  @"IOR Population Success Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_PopulationViaIterator",  @"IOR Population via Iterate",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_PopulationViaDictionary",  @"IOR Population via Dict",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RequestDetermine",  @"External: Determine Channels Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RequestPopulate",  @"Populate IOReporter Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RescanDenied",  @"Rescan Denied",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RescanExplore",  @"Rescan Reason: Explore Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RescanHintSignals",  @"Rescan Signal Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RescanLowChannel",  @"Rescan Reason: Low Channel Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RescanNewPhy",  @"IOR Unprepared For Sample Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_RescanPerformed",  @"Rescan Permitted: Last Rescan Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_StaleDriverID",  @"Fault Detection: Stale DriverID Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_TerminationGraceful",  @"Terminations - Graceful",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_TerminationUnknown",  @"Terminations - Unknown",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_UnpersistedCalls",  @"Unpersisted Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_Unprepared",  @"IOR Unprepared For Sample Count",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_UpdateSamples",  @"UpdateSamples Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_UpdateSamplesFailed",  @"UpdateSamples Failed Calls",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"ior_Uptime",  @"Estimated Uptime (s)",  @"Module_IOR",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"log_Datapath",  @"Log: DatapathMetricStream Trigger",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"log_WorkReport",  @"Log: Work Report",  @"Module_Engine",  v3,  v4,  v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Module_Engine"]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Process: current_mem kB"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"process_CurrentMemory");

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Module_Engine"]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Process: lifetime_peak kB"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"process_PeakMemory");

  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"process_StorageDirtied",  @"Process: storage_dirtied kB",  @"Module_Engine",  v3,  v4,  v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]( &OBJC_CLASS___WAUtil,  "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:",  @"process_CPUTime",  @"Process: cpu_time ns",  @"Module_Engine",  v3,  v4,  v5);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"process_CPUTime"));
  if (v13)
  {
    BOOL v14 = (void *)v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"engine_Uptime"));

    if (v15)
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"process_CPUTime"));
      float v17 = (float)(unint64_t)[v16 unsignedLongValue] / 1000000.0;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"engine_Uptime"));
      *(float *)&double v19 = v17 / (float)(unint64_t)[v18 unsignedLongValue];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v19));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  @"process_RunningDuty_ms_per_s");
    }
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v21,  @"reportingInterval");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"build_Debug");
  unint64_t workReportSelectingSingleWithinFirstDay = self->_workReportSelectingSingleWithinFirstDay;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Telemetry: Work Report Window"));
  id v24 = [v23 unsignedIntegerValue];

  if ((id)workReportSelectingSingleWithinFirstDay == v24) {
    unsigned int v25 = &__kCFBooleanTrue;
  }
  else {
    unsigned int v25 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v25,  @"singleAgg_InFirstDay");
  unint64_t workReportSelectingSingleWithinFirstWeek = self->_workReportSelectingSingleWithinFirstWeek;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Telemetry: Work Report Window"));
  id v28 = [v27 unsignedIntegerValue];

  if ((id)workReportSelectingSingleWithinFirstWeek == v28) {
    id v29 = &__kCFBooleanTrue;
  }
  else {
    id v29 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v29,  @"singleAgg_InFirstWeek");

  return v3;
}

- (void)_logWorkReport:(id)a3 indent:(int)a4 prefix:(id)a5
{
  id v7 = a3;
  id v48 = a5;
  id v8 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  0LL,  1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  BOOL v10 = v9;
  if (!v8)
  {
    id v36 = WALogCategoryDefaultHandle();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)__int16 v54 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)&v54[10] = 2666;
    uint64_t v37 = "%{public}s::%d:Failed to create NSSortDescriptor";
    id v38 = v12;
    os_log_type_t v39 = OS_LOG_TYPE_ERROR;
    uint32_t v40 = 18;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v38, v39, v37, buf, v40);
    goto LABEL_26;
  }

  if (![v9 count])
  {
    id v41 = WALogCategoryDefaultHandle();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)__int16 v54 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)&v54[10] = 2667;
    __int16 v55 = 2112;
    id v56 = v48;
    uint64_t v37 = "%{public}s::%d:Zero keys found in dictionary entry %@";
    id v38 = v12;
    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    uint32_t v40 = 28;
    goto LABEL_31;
  }

  __int16 v62 = v8;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingDescriptors:v11]);

  if (-[os_log_s count](v12, "count"))
  {
    __int16 v44 = v10;
    BOOL v45 = v8;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id obj = v12;
    id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v61,  16LL);
    if (!v13) {
      goto LABEL_25;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v50;
    while (1)
    {
      double v16 = 0LL;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        float v17 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v16);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        {

LABEL_12:
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v48,  v17));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
          -[WAEngine _logWorkReport:indent:prefix:]( self,  "_logWorkReport:indent:prefix:",  v24,  (a4 + 4),  v23);
LABEL_13:

          goto LABEL_14;
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        char isKindOfClass = objc_opt_isKindOfClass(v20, v21);

        if ((isKindOfClass & 1) != 0) {
          goto LABEL_12;
        }
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char v27 = objc_opt_isKindOfClass(v25, v26);

        id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
        id v29 = v28;
        if ((v27 & 1) != 0)
        {
          unsigned __int8 v30 = [v28 isEqualToNumber:&off_1000E0318];

          if ((v30 & 1) == 0)
          {
            id v31 = WALogWorkReportHandle();
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
LABEL_23:
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v17]);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)__int16 v54 = a4;
            *(_WORD *)&v54[4] = 2080;
            *(void *)&v54[6] = "";
            __int16 v55 = 2112;
            id v56 = v48;
            __int16 v57 = 2112;
            os_log_type_t v58 = v17;
            __int16 v59 = 2112;
            __int16 v60 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%*s%@ %@ : %@", buf, 0x30u);
            goto LABEL_13;
          }
        }

        else
        {
          uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDate);
          char v33 = objc_opt_isKindOfClass(v29, v32);

          if ((v33 & 1) != 0)
          {
            id v34 = WALogWorkReportHandle();
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
LABEL_14:
          }
        }

        double v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v35 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v61,  16LL);
      id v14 = v35;
      if (!v35)
      {
LABEL_25:
        int v12 = obj;

        BOOL v10 = v44;
        id v8 = v45;
        goto LABEL_26;
      }
    }
  }

  id v42 = WALogCategoryDefaultHandle();
  unint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)__int16 v54 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)&v54[10] = 2670;
    __int16 v55 = 2112;
    id v56 = v48;
    __int16 v57 = 2112;
    os_log_type_t v58 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to create sortedKeys on entry %@ keys %@",  buf,  0x26u);
  }

LABEL_26:
}

- (void)_reportWorkReportInterval
{
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_10004B8C4;
  uint64_t v21 = sub_10004B8D4;
  id v22 = 0LL;
  -[WAEngine setOldCacheUsageForTelemetry:](self, "setOldCacheUsageForTelemetry:", 0LL);
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Engine reportWorkReportInterval",  (const char *)&unk_1000B76E7,  (uint8_t *)buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine nowCacheUsageForTelemetry](self, "nowCacheUsageForTelemetry"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Module_IOR"]);
  -[WAEngine setOldCacheUsageForTelemetry:](self, "setOldCacheUsageForTelemetry:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _createNextWorkReportSnapshot](self, "_createNextWorkReportSnapshot"));
  -[WAEngine setNowCacheUsageForTelemetry:](self, "setNowCacheUsageForTelemetry:", v7);

  if (-[RecommendationPreferences work_report_logs_enabled](self->_preferences, "work_report_logs_enabled"))
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Log: Work Report",  self->_cachedUsage,  self->_engineQ);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[WAEngine _createWorkReportDictionaryForTelemetryAndRollBucket]( self,  "_createWorkReportDictionaryForTelemetryAndRollBucket"));
    id v9 = (void *)v18[5];
    v18[5] = v8;

    -[WAEngine _logWorkReport:indent:prefix:]( self,  "_logWorkReport:indent:prefix:",  v18[5],  0LL,  @"Interval Work Report");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine nowCacheUsageForTelemetry](self, "nowCacheUsageForTelemetry"));
    -[WAEngine _logWorkReport:indent:prefix:]( self,  "_logWorkReport:indent:prefix:",  v10,  0LL,  @"Current Accumulation");
  }

  objc_initWeak(buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_100054ECC;
  v14[3] = &unk_1000CD410;
  objc_copyWeak(&v15, buf);
  v14[4] = &v17;
  AnalyticsSendEventLazy(@"com.apple.wifianalyticsd.workreport", v14);
  id v11 = WALogCategoryDefaultHandle();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Engine reportWorkReportInterval",  (const char *)&unk_1000B76E7,  v13,  2u);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
  _Block_object_dispose(&v17, 8);
}

- (void)_initSubmitterAndQueryableRegistrationForProcessToken:(id)a3 andGroupType:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (!v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
    [v10 setObject:v9 forKeyedSubscript:v6];
  }

  switch(a4)
  {
    case 0LL:
    case 6LL:
      id v11 = WALogCategoryDefaultHandle();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v39 = 136446466;
        uint32_t v40 = "-[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]";
        __int16 v41 = 1024;
        int v42 = 2756;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unhandled WAGroupType trying to init submitter",  (uint8_t *)&v39,  0x12u);
      }

      break;
    case 2LL:
      id v13 = -[WAGeoServicesMessageSubmitter initWithMessageGroupType:]( objc_alloc(&OBJC_CLASS___WAGeoServicesMessageSubmitter),  "initWithMessageGroupType:",  2LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v6]);
      double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
      [v15 setObject:v13 forKeyedSubscript:v16];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v6]);
      uint64_t v20 = 2LL;
      goto LABEL_11;
    case 3LL:
      uint64_t v21 = -[WANWActivityMessageSubmitter initWithMessageGroupType:]( objc_alloc(&OBJC_CLASS___WANWActivityMessageSubmitter),  "initWithMessageGroupType:",  3LL);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v6]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
      [v23 setObject:v21 forKeyedSubscript:v24];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v6]);
      uint64_t v20 = 3LL;
      goto LABEL_11;
    case 4LL:
      unsigned int v25 = -[WADatapathDiagnosticsMessageSubmitter initWithMessageGroupType:]( objc_alloc(&OBJC_CLASS___WADatapathDiagnosticsMessageSubmitter),  "initWithMessageGroupType:",  4LL);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      char v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v6]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 4LL));
      [v27 setObject:v25 forKeyedSubscript:v28];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v6]);
      uint64_t v20 = 4LL;
      goto LABEL_11;
    case 5LL:
      id v29 = -[WAMessageSubmitter initWithMessageGroupType:]( objc_alloc(&OBJC_CLASS___WAMessageSubmitter),  "initWithMessageGroupType:",  5LL);
      unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v6]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 5LL));
      [v31 setObject:v29 forKeyedSubscript:v32];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v6]);
      uint64_t v20 = 5LL;
LABEL_11:
      char v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v33]);
      [v34 setSubmissionDelegate:v17];

      break;
    default:
      break;
  }

  id v35 = WALogCategoryDefaultHandle();
  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil groupTypeToString:](&OBJC_CLASS___WAUtil, "groupTypeToString:", a4));
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v6));
    int v39 = 136447234;
    uint32_t v40 = "-[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]";
    __int16 v41 = 1024;
    int v42 = 2760;
    __int16 v43 = 2112;
    __int16 v44 = v37;
    __int16 v45 = 2048;
    int64_t v46 = a4;
    __int16 v47 = 2112;
    id v48 = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Registered group %@(%lu) for token %@",  (uint8_t *)&v39,  0x30u);
  }
}

- (id)_getMessagesModelForProcessToken:(id)a3 groupType:(int64_t)a4 andError:(id *)a5
{
  int v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil resourcePath](&OBJC_CLASS___WAUtil, "resourcePath"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%ld/", v7, a4));

  id v9 = WALogCategoryDefaultHandle();
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int64_t v46 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
    __int16 v47 = 1024;
    int v48 = 2772;
    __int16 v49 = 2112;
    __int128 v50 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:pathForGrouppathForGroup %@",  buf,  0x1Cu);
  }

  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentsOfDirectoryAtPath:v8 error:0]);

    if ([v12 count])
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (!v14)
      {

        id v18 = 0LL;
        uint64_t v17 = 0LL;
        double v16 = 0LL;
        goto LABEL_27;
      }

      id v15 = v14;
      id v35 = a5;
      double v16 = 0LL;
      uint64_t v17 = 0LL;
      id v18 = 0LL;
      uint64_t v37 = *(void *)v42;
      id v38 = v8;
      id obj = v13;
      while (2)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v16;
        uint64_t v21 = v17;
        id v22 = v18;
        do
        {
          if (*(void *)v42 != v37) {
            objc_enumerationMutation(obj);
          }
          id v23 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v41 + 1) + 8 * (void)v19) componentsSeparatedByString:@"."]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);

          unsigned int v25 = objc_alloc(&OBJC_CLASS___NSData);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@.wam",  v38,  v24));
          char v27 = -[NSData initWithContentsOfFile:options:error:]( v25,  "initWithContentsOfFile:options:error:",  v26,  8LL,  0LL);

          uint64_t v17 = v27;
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
          id v40 = v22;
          double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v28,  v17,  &v40));
          id v18 = v40;

          if (v18)
          {
            id v29 = WALogCategoryDefaultHandle();
            unsigned __int8 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              int64_t v46 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
              __int16 v47 = 1024;
              int v48 = 2783;
              __int16 v49 = 2112;
              __int128 v50 = v24;
              __int16 v51 = 2112;
              id v52 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive a WAMessageAWD instance with key of %@. Error: %@",  buf,  0x26u);
            }
          }

          if (!v16)
          {
            id v32 = WALogCategoryDefaultHandle();
            char v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              int64_t v46 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
              __int16 v47 = 1024;
              int v48 = 2785;
              __int16 v49 = 2112;
              __int128 v50 = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unobscure message for key: %@",  buf,  0x1Cu);
            }

            double v16 = 0LL;
            id v31 = obj;
            goto LABEL_22;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v16, v24);

          uint64_t v19 = (char *)v19 + 1;
          uint64_t v20 = v16;
          uint64_t v21 = v17;
          id v22 = v18;
        }

        while (v15 != v19);
        id v31 = obj;
        id v15 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v15) {
          continue;
        }
        break;
      }

- (id)_cachedModelObjectsMessageForGroupType:(int64_t)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10004B8C4;
  uint64_t v20 = sub_10004B8D4;
  id v21 = 0LL;
  if (a3 >= 1 && v6)
  {
    mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100055B50;
    v12[3] = &unk_1000CD438;
    id v14 = &v16;
    int64_t v15 = a3;
    v12[4] = self;
    id v13 = v6;
    dispatch_sync(mutexQueue, v12);

    uint64_t v8 = (void *)v17[5];
  }

  id v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void))a7;
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[WAEngine _cachedModelObjectsMessageForGroupType:key:]( self,  "_cachedModelObjectsMessageForGroupType:key:",  a4,  v12));
  id v16 = +[WAUtil rotateUUIDsForMessage:](&OBJC_CLASS___WAUtil, "rotateUUIDsForMessage:", v15);
  if (!v15)
  {
    id v26 = WALogCategoryDefaultHandle();
    char v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v32 = "-[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      __int16 v33 = 1024;
      int v34 = 2824;
      __int16 v35 = 2112;
      id v36 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error",  buf,  0x1Cu);
    }

    goto LABEL_11;
  }

  if (!v8
    || (uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator")),
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 originalClassName]),
        unsigned int v19 = [v17 doesMessageNeedPrepopulation:v18],
        v18,
        v17,
        !v19))
  {
LABEL_11:
    v14[2](v14, v15, 0LL);
    goto LABEL_7;
  }

  id v20 = WALogCategoryDefaultHandle();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 key]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 originalClassName]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v13));
    *(_DWORD *)buf = 136447234;
    id v32 = "-[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    __int16 v33 = 1024;
    int v34 = 2827;
    __int16 v35 = 2112;
    id v36 = v22;
    __int16 v37 = 2112;
    id v38 = v23;
    __int16 v39 = 2112;
    id v40 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)",  buf,  0x30u);
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  id v28[2] = sub_100056004;
  v28[3] = &unk_1000CD460;
  unsigned __int8 v30 = v14;
  id v29 = v15;
  [v25 prepopulateMessage:v29 forProcess:v13 groupType:a4 andReply:v28];

LABEL_7:
}

- (void)_getNewMessageForKeyWithinPopulatorBlock:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void))a7;
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[WAEngine _cachedModelObjectsMessageForGroupType:key:]( self,  "_cachedModelObjectsMessageForGroupType:key:",  a4,  v12));
  id v16 = +[WAUtil rotateUUIDsForMessage:](&OBJC_CLASS___WAUtil, "rotateUUIDsForMessage:", v15);
  if (!v15)
  {
    id v26 = WALogCategoryDefaultHandle();
    char v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v32 = "-[WAEngine _getNewMessageForKeyWithinPopulatorBlock:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      __int16 v33 = 1024;
      int v34 = 2845;
      __int16 v35 = 2112;
      id v36 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error",  buf,  0x1Cu);
    }

    goto LABEL_11;
  }

  if (!v8
    || (uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator")),
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 originalClassName]),
        unsigned int v19 = [v17 doesMessageNeedPrepopulation:v18],
        v18,
        v17,
        !v19))
  {
LABEL_11:
    v14[2](v14, v15, 0LL);
    goto LABEL_7;
  }

  id v20 = WALogCategoryDefaultHandle();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 key]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 originalClassName]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v13));
    *(_DWORD *)buf = 136447234;
    id v32 = "-[WAEngine _getNewMessageForKeyWithinPopulatorBlock:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    __int16 v33 = 1024;
    int v34 = 2848;
    __int16 v35 = 2112;
    id v36 = v22;
    __int16 v37 = 2112;
    id v38 = v23;
    __int16 v39 = 2112;
    id v40 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)",  buf,  0x30u);
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  id v28[2] = sub_1000562F8;
  v28[3] = &unk_1000CD460;
  unsigned __int8 v30 = v14;
  id v29 = v15;
  [v25 prepopulateMessageWithinPopulatorBlock:v29 forProcess:v13 groupType:a4 andReply:v28];

LABEL_7:
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessToken:(id)a6 shouldCheckForPrePopulation:(BOOL)a7 andReply:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a6;
  id v16 = (void (**)(id, void *, void))a8;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[WAEngine _cachedModelObjectsMessageForGroupType:key:]( self,  "_cachedModelObjectsMessageForGroupType:key:",  a4,  v14));
  uint64_t v18 = v17;
  if (v11)
  {
    id v19 = [v17 copy];

    uint64_t v18 = v19;
  }

  id v20 = +[WAUtil rotateUUIDsForMessage:](&OBJC_CLASS___WAUtil, "rotateUUIDsForMessage:", v18);
  if (!v18)
  {
    id v30 = WALogCategoryDefaultHandle();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v36 = "-[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      __int16 v37 = 1024;
      int v38 = 2871;
      __int16 v39 = 2112;
      id v40 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error",  buf,  0x1Cu);
    }

    goto LABEL_13;
  }

  if (!v9
    || (id v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator")),
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 originalClassName]),
        unsigned int v23 = [v21 doesMessageNeedPrepopulation:v22],
        v22,
        v21,
        !v23))
  {
LABEL_13:
    v16[2](v16, v18, 0LL);
    goto LABEL_9;
  }

  id v24 = WALogCategoryDefaultHandle();
  unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 key]);
    char v27 = (void *)objc_claimAutoreleasedReturnValue([v18 originalClassName]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v15));
    *(_DWORD *)buf = 136447234;
    id v36 = "-[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    __int16 v37 = 1024;
    int v38 = 2874;
    __int16 v39 = 2112;
    id v40 = v26;
    __int16 v41 = 2112;
    __int128 v42 = v27;
    __int16 v43 = 2112;
    __int128 v44 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)",  buf,  0x30u);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100056608;
  v32[3] = &unk_1000CD460;
  int v34 = v16;
  id v33 = v18;
  [v29 prepopulateMessage:v33 forProcess:v15 groupType:a4 andReply:v32];

LABEL_9:
}

- (id)_ingestMessage:(id)a3 forProcessToken:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
    [v7 updateMessage:v5];

    -[WAEngine _persist](self, "_persist");
    BOOL v8 = 0LL;
  }

  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    id v12 = @"WAErrorCodeInternalError";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v10));
  }

  return v8;
}

- (id)_submitMessage:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v20 = WALogCategoryDefaultHandle();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v30 = "-[WAEngine _submitMessage:groupType:forProcessToken:]";
      __int16 v31 = 1024;
      int v32 = 2898;
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2048;
      int64_t v36 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Process with token: %@ for grouptype: %ld tried to submit a NULL message ",  buf,  0x26u);
    }

    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    uint64_t v28 = @"WAErrorCodeLacksRequiredArgument";
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v22 = 9010LL;
    goto LABEL_11;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  NSErrorUserInfoKey v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

  if (!v13)
  {
    id v23 = WALogCategoryDefaultHandle();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v30 = "-[WAEngine _submitMessage:groupType:forProcessToken:]";
      __int16 v31 = 1024;
      int v32 = 2899;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:no submitter to submit to, has this WAGroupType been registered? ",  buf,  0x12u);
    }

    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    id v26 = @"WAErrorCodeMessageNotRegistered";
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    uint64_t v22 = 9005LL;
LABEL_11:
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  v22,  v14));
    goto LABEL_4;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 submitMessage:v8]);

LABEL_4:
  return v18;
}

- (void)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v7);
  id v9 = WALogCategoryDefaultHandle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  NSErrorUserInfoKey v11 = v10;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      NSErrorUserInfoKey v27 = "-[WAEngine _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      __int16 v28 = 1024;
      int v29 = 2920;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Invalid data passed to JSON serialization for %@",  buf,  0x1Cu);
    }

    uint64_t v17 = 0LL;
    id v19 = 0LL;
    uint64_t v18 = 0LL;
    id v14 = 0LL;
    id v12 = 0LL;
    id v15 = 0LL;
    goto LABEL_8;
  }

  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "_writeWiFiAnalyticsMessageToJSONFile",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"yyyy'-'MM'-'dd-HHmmssSSS");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wifianalytics_%@.json",  v14));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine wifianalyticsTmpDir](self, "wifianalyticsTmpDir"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:v15 isDirectory:0]);

  id v25 = 0LL;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  3LL,  &v25));
  id v19 = v25;
  if (v19
    || (id v20 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v18, 4LL),
        id v24 = 0LL,
        -[NSString writeToURL:atomically:encoding:error:]( v20,  "writeToURL:atomically:encoding:error:",  v17,  1LL,  4LL,  &v24),  id v19 = v24,  v20,  v19))
  {
    id v21 = WALogCategoryDefaultHandle();
    NSErrorUserInfoKey v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      NSErrorUserInfoKey v27 = "-[WAEngine _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      __int16 v28 = 1024;
      int v29 = 2940;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v32 = 2112;
      id v33 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:failed to write to file %@ error %@",  buf,  0x26u);
    }

- (void)_processWAMessageForLogging:(id)a3
{
  id v26 = a3;
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "_processWAMessageForLogging",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (!v25)
  {
    id v24 = WALogCategoryDefaultHandle();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v32 = "-[WAEngine _processWAMessageForLogging:]";
      __int16 v33 = 1024;
      int v34 = 2957;
      __int16 v35 = 2080;
      int64_t v36 = "-[WAEngine _processWAMessageForLogging:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Null logDict", buf, 0x1Cu);
    }

    goto LABEL_16;
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v26 metricInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v10 = kWAMessageOptions;
    uint64_t v11 = kWAMessageValue;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "metricInfo", v25));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v10]);
        unsigned __int8 v17 = [v16 integerValue];

        if ((v17 & 4) != 0)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v11]);
          [v25 setObject:v18 forKey:v13];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }

    while (v8);
  }

  if ([v25 count])
  {
    id v19 = WALogCategoryDefaultHandle();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v26 metricName]);
      *(_DWORD *)buf = 136447234;
      __int16 v32 = "-[WAEngine _processWAMessageForLogging:]";
      __int16 v33 = 1024;
      int v34 = 2969;
      __int16 v35 = 2080;
      int64_t v36 = "-[WAEngine _processWAMessageForLogging:]";
      __int16 v37 = 2112;
      int v38 = v21;
      __int16 v39 = 2112;
      id v40 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:%s: metricName %@ with metricInfo %@",  buf,  0x30u);
    }

- (void)_processWAMessageForNewIORPossibility:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 metricName]);
  if ([v4 isEqualToString:kWAMessageMetricNameLinkChange])
  {

LABEL_5:
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
    [v7 signalPotentialNewIORChannels];

    goto LABEL_6;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 metricName]);
  unsigned int v6 = [v5 isEqualToString:kWAMessageMetricNameClientAssociation];

  if (v6) {
    goto LABEL_5;
  }
LABEL_6:
}

- (id)_submitWiFiAnalyticsMessageAdvanced:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 metricName]);
    *(_DWORD *)buf = 136446722;
    __int16 v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
    __int16 v44 = 1024;
    int v45 = 2992;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received message %@", buf, 0x1Cu);
  }

  if (!v4)
  {
    id v33 = WALogCategoryDefaultHandle();
    int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      __int16 v44 = 1024;
      int v45 = 2994;
      __int16 v46 = 2048;
      uint64_t v47 = 5LL;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:for grouptype: %ld tried to submit a NULL message ",  buf,  0x1Cu);
    }

    NSErrorUserInfoKey v40 = NSLocalizedFailureReasonErrorKey;
    __int16 v41 = @"WAErrorCodeLacksRequiredArgument";
    unsigned __int8 v17 = &v41;
    uint64_t v18 = &v40;
    goto LABEL_11;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 metricName]);
  if (!v8
    || (uint64_t v9 = (void *)v8,
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 metricInfo]),
        v10,
        v9,
        !v10))
  {
    id v15 = WALogCategoryDefaultHandle();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      __int16 v44 = 1024;
      int v45 = 2995;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:NULL metricName or NULL metricInfo",  buf,  0x12u);
    }

    NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
    __int16 v39 = @"WAErrorCodeLacksRequiredArgument";
    unsigned __int8 v17 = &v39;
    uint64_t v18 = &v38;
LABEL_11:
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v18,  1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9010LL,  v19));

    id v12 = 0LL;
    goto LABEL_30;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 metricInfo]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kWAMessageKeyMetricProcessImmediately]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kWAMessageValue]);
    unsigned __int8 v14 = [v13 BOOLValue];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  if (([v4 options] & 0x10) != 0)
  {
    id v25 = WALogCategoryDefaultHandle();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v4 metricName]);
      *(_DWORD *)buf = 136446722;
      __int16 v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      __int16 v44 = 1024;
      int v45 = 3003;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Message has option WiFiAnalyticsMessageTypeManagedFault, processing immediately %@",  buf,  0x1Cu);
    }

    -[WAEngine _processWAMessageForNewIORPossibility:](self, "_processWAMessageForNewIORPossibility:", v4);
  }

  else
  {
    -[WAEngine _processWAMessageForNewIORPossibility:](self, "_processWAMessageForNewIORPossibility:", v4);
    if ((v14 & 1) == 0)
    {
      -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
      if (v21 >= 1.0)
      {
        id v22 = WALogCategoryDefaultHandle();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          __int16 v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
          __int16 v44 = 1024;
          int v45 = 3009;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error! Journals are not intended to be processed Immediately",  buf,  0x12u);
        }

        NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
        __int16 v37 = @"WAErrorCodeLacksRequiredArgument";
        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9010LL,  v24));

        goto LABEL_30;
      }
    }
  }

  id v28 = WALogCategoryDefaultHandle();
  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v4 metricName]);
    *(_DWORD *)buf = 136446722;
    __int16 v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
    __int16 v44 = 1024;
    int v45 = 3011;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v30;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:%@ Process Immediately: read JSON files",  buf,  0x1Cu);
  }

  if (+[WAUtil isWritingWAMessageToJsonAllowed](&OBJC_CLASS___WAUtil, "isWritingWAMessageToJsonAllowed")
    && +[WAUtil isAnalyticsProcessorAllowed](&OBJC_CLASS___WAUtil, "isAnalyticsProcessorAllowed"))
  {
    id v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine fileHandlingQ](self, "fileHandlingQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100057784;
    block[3] = &unk_1000CCD80;
    void block[4] = self;
    dispatch_async(v31, block);
  }

  id v20 = 0LL;
LABEL_30:

  return v20;
}

- (id)_getMessageByUUID:(id)a3 forProcessToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    id v24 = @"WAErrorCodeInternalError";
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v16 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v15);

    uint64_t v13 = 0LL;
    id v12 = 0LL;
    goto LABEL_5;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 messageForUUID:v8]);

    if (v12)
    {
      uint64_t v13 = 0LL;
      goto LABEL_5;
    }

    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    id v20 = @"WAErrorCodeMessageNoMessageForUUID";
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint64_t v18 = 9004LL;
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    id v22 = @"WAErrorCodeInternalError";
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v18 = 9003LL;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  v18,  v17));

  id v12 = 0LL;
  if (a5 && v13)
  {
    id v12 = 0LL;
    *a5 = [v13 copy];
  }

- (void)_killDaemonAndReply:(id)a3
{
  id v4 = a3;
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
  -[WAEngine _prepareToTerminate](self, "_prepareToTerminate");
  exit(143);
}

- (void)_clearMessageStoreAndReply:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
  [v4 clearMessageStore];

  -[WAEngine _persist](self, "_persist");
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    id v5 = v6;
  }
}

- (void)_purgeGroupTypeIfNecessary:(int64_t)a3
{
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v33;
    id obj = v5;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap", obj));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

        id v14 = [v13 countByEnumeratingWithState:&v28 objects:v44 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v29;
          while (2)
          {
            for (j = 0LL; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([*(id *)(*((void *)&v28 + 1) + 8 * (void)j) integerValue] == (id)a3)
              {
                id v18 = v11;

                id v8 = v18;
                goto LABEL_16;
              }
            }

            id v15 = [v13 countByEnumeratingWithState:&v28 objects:v44 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

- (void)_sendMemoryPressureRequestAndReply:(id)a3
{
  id v5 = a3;
  -[WAEngine handleMemoryWarning:](self, "handleMemoryWarning:", 1LL);
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
    id v4 = v5;
  }
}

- (void)_issueIOReportManagementCommand:(unint64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v193 = a5;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, @"Command");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"Success");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  if (!v14)
  {
    id v15 = WALogCategoryDefaultHandle();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3098;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Caller did not register",  buf,  0x12u);
    }

    if (v8)
    {
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v8]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
      unsigned int v20 = [v18 containsObject:v19];

      if (!v20)
      {
        -[WAEngine _purgeGroupTypeIfNecessary:](self, "_purgeGroupTypeIfNecessary:", 3LL);
        NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v8]);

        if (!v22)
        {
          NSErrorUserInfoKey v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
          [v24 setObject:v23 forKeyedSubscript:v8];
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v8]);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
        [v26 addObject:v27];

        -[WAEngine _persist](self, "_persist");
        id v28 = WALogCategoryDefaultHandle();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v8));
          *(_DWORD *)buf = 136446978;
          *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3110;
          __int16 v217 = 2048;
          uint64_t v218 = 3LL;
          __int16 v219 = 2112;
          v220 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:XPC: registering message group type: %ld for process: %@",  buf,  0x26u);
        }

        goto LABEL_11;
      }

      id v178 = WALogCategoryDefaultHandle();
      v179 = (os_log_s *)objc_claimAutoreleasedReturnValue(v178);
      if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3100;
        __int16 v217 = 2048;
        uint64_t v218 = 3LL;
        _os_log_impl( (void *)&_mh_execute_header,  v179,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld",  buf,  0x1Cu);
      }

      NSErrorUserInfoKey v175 = NSLocalizedFailureReasonErrorKey;
    }

    else
    {
      id v173 = WALogCategoryDefaultHandle();
      v174 = (os_log_s *)objc_claimAutoreleasedReturnValue(v173);
      if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3099;
        _os_log_impl( (void *)&_mh_execute_header,  v174,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:couldn't get process name for connection",  buf,  0x12u);
      }

      NSErrorUserInfoKey v175 = NSLocalizedFailureReasonErrorKey;
      NSErrorUserInfoKey v221 = NSLocalizedFailureReasonErrorKey;
      id v222 = @"WAErrorCodeInternalError";
      unsigned __int8 v176 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v222,  &v221,  1LL));
      id v177 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v176));
    }

    NSErrorUserInfoKey v197 = v175;
    id v198 = @"WAErrorCodeInternalError";
    v180 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v198,  &v197,  1LL));
    id v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v180));

    uint64_t v65 = (void (**)(void, void, void))v193;
    (*((void (**)(id, void, void *))v193 + 2))(v193, 0LL, v101);
    goto LABEL_133;
  }

- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[WAEngine setInterfaceNameToApple80211InstanceMap:](self, "setInterfaceNameToApple80211InstanceMap:", v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);

  if (!v11)
  {
    id v12 = -[WAApple80211 initWithInterfaceName:](objc_alloc(&OBJC_CLASS___WAApple80211), "initWithInterfaceName:", v6);
    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      [v13 setObject:v12 forKeyedSubscript:v6];
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v6]);

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v6]);
    [v17 grabAndSubmitFWTrapInfo];
  }

  else
  {
    id v18 = WALogCategoryDefaultHandle();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446466;
      unsigned int v20 = "-[WAEngine _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      __int16 v21 = 1024;
      int v22 = 3357;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No Apple80211 wrapper to process trap crash mini tracer dump with!",  (uint8_t *)&v19,  0x12u);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[WAEngine setInterfaceNameToApple80211InstanceMap:](self, "setInterfaceNameToApple80211InstanceMap:", v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);

  if (!v11)
  {
    id v12 = -[WAApple80211 initWithInterfaceName:](objc_alloc(&OBJC_CLASS___WAApple80211), "initWithInterfaceName:", v6);
    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      [v13 setObject:v12 forKeyedSubscript:v6];
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v6]);

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v6]);
    [v17 grabAndSubmitLqmMetrics];
  }

  else
  {
    id v18 = WALogCategoryDefaultHandle();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446466;
      unsigned int v20 = "-[WAEngine _lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      __int16 v21 = 1024;
      int v22 = 3376;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No Apple80211 wrapper to process lqmCrashTracer with!",  (uint8_t *)&v19,  0x12u);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));

  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[WAEngine setInterfaceNameToApple80211InstanceMap:](self, "setInterfaceNameToApple80211InstanceMap:", v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v9]);

  if (!v14)
  {
    id v15 = -[WAApple80211 initWithInterfaceName:](objc_alloc(&OBJC_CLASS___WAApple80211), "initWithInterfaceName:", v9);
    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      [v16 setObject:v15 forKeyedSubscript:v9];
    }
  }

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v9]);

  if (v18)
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v9]);
    [v20 submitLqmMetrics:v8];
  }

  else
  {
    id v21 = WALogCategoryDefaultHandle();
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136446466;
      NSErrorUserInfoKey v23 = "-[WAEngine _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      __int16 v24 = 1024;
      int v25 = 3395;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No Apple80211 wrapper to process lqmCrashTracer with!",  (uint8_t *)&v22,  0x12u);
    }
  }

  if (v10) {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (void)_trapFWWithReason:(id)a3 andReply:(id)a4
{
  id v6 = (char *)a3;
  id v7 = a4;
  infraInterfaceName = self->_infraInterfaceName;
  if (!infraInterfaceName
    || -[NSString isEqualToString:](infraInterfaceName, "isEqualToString:", @"dunno")
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap")),
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName")),
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]),
        v11,
        v10,
        v9,
        !v11))
  {
    -[WAEngine queryInfraInterfaceInstanceAndChip](self, "queryInfraInterfaceInstanceAndChip");
  }

  if (-[NSString isEqualToString:](self->_infraInterfaceName, "isEqualToString:", @"dunno")
    || (id v12 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap")),
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName")),
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]),
        v14,
        v13,
        v12,
        !v14))
  {
    id v18 = WALogCategoryDefaultHandle();
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136446466;
      NSErrorUserInfoKey v23 = "-[WAEngine _trapFWWithReason:andReply:]";
      __int16 v24 = 1024;
      LODWORD(v25) = 3414;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:failed to find _infraInterfaceName",  (uint8_t *)&v22,  0x12u);
    }

    id v20 = WALogCategoryDefaultHandle();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      id v21 = self->_infraInterfaceName;
      int v22 = 138412546;
      NSErrorUserInfoKey v23 = v6;
      __int16 v24 = 2112;
      int v25 = v21;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "Failed to initiate FW trap reason %@, interface %@",  (uint8_t *)&v22,  0x16u);
    }
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));
    [v17 triggerDpsReset:@"TrapOnSlowDPS"];
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_examinePeerMessageForIntegrity:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"NWAPS_txLatencyBEs"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 repeatableValues]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"NWAPS_txLatencyBEs"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 repeatableValues]);
    __int16 v40 = (char *)[v7 count];
  }

  else
  {
    __int16 v40 = 0LL;
  }

  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v42 = "-[WAEngine _examinePeerMessageForIntegrity:]";
    __int16 v43 = 1024;
    int v44 = 3435;
    __int16 v45 = 2048;
    __int16 v46 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:NWAPS_txLatencyBEs bincount %lu",  buf,  0x1Cu);
  }

  if ((unint64_t)v40 < 0x10)
  {
    if (!v40) {
      goto LABEL_32;
    }
  }

  else
  {
    id v10 = WALogCategoryDefaultHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v42 = "-[WAEngine _examinePeerMessageForIntegrity:]";
      __int16 v43 = 1024;
      int v44 = 3438;
      __int16 v45 = 2048;
      __int16 v46 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:bin count for NWAPS_txLatencyBEs exceeds expected count %lu",  buf,  0x1Cu);
    }
  }

  id v12 = 0LL;
  __int16 v38 = v3;
  while (2)
  {
    char v36 = 0;
    uint64_t v13 = 0LL;
    NSUInteger v39 = v12;
LABEL_13:
    id v14 = v13;
    do
    {
      if (v12 != v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"NWAPS_txLatencyBEs"]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 repeatableValues]);
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v12]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"NWAHB_bin"]);
        int v19 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldForKey:@"NWAPS_txLatencyBEs"]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 repeatableValues]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:v14]);
        int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 fieldForKey:@"NWAHB_bin"]);

        id v3 = v38;
        id v12 = v39;

        if (v18 == v22)
        {
          id v23 = WALogCategoryDefaultHandle();
          __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v38 fieldForKey:@"NWAPS_txLatencyBEs"]);
            int v25 = (void *)objc_claimAutoreleasedReturnValue([v37 repeatableValues]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndex:v39]);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 fieldForKey:@"NWAHB_bin"]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v38 fieldForKey:@"NWAPS_txLatencyBEs"]);
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 repeatableValues]);
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndex:v14]);
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 fieldForKey:@"NWAHB_bin"]);
            *(_DWORD *)buf = 136447490;
            __int16 v42 = "-[WAEngine _examinePeerMessageForIntegrity:]";
            __int16 v43 = 1024;
            int v44 = 3446;
            __int16 v45 = 2048;
            __int16 v46 = v39;
            __int16 v47 = 2112;
            int v48 = v27;
            __int16 v49 = 2048;
            __int128 v50 = v14;
            __int16 v51 = 2112;
            int v52 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Duplicate bin name: i %lu %@ j %lu %@",  buf,  0x3Au);

            id v12 = v39;
            id v3 = v38;
          }

          uint64_t v13 = v14 + 1;
          char v36 = 1;
          if (v40 - 1 == v14) {
            goto LABEL_25;
          }
          goto LABEL_13;
        }
      }

      ++v14;
    }

    while (v40 != v14);
    if ((v36 & 1) != 0)
    {
LABEL_25:
      id v32 = WALogCategoryDefaultHandle();
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Malformed PeerMessage", buf, 2u);
      }

      break;
    }

    if (++v12 != v40) {
      continue;
    }
    break;
  }

  if ((unint64_t)v40 >= 0x10)
  {
    id v34 = WALogCategoryDefaultHandle();
    __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "Too many txLatencyBE bins in PeerMessage",  buf,  2u);
    }
  }

- (void)_triggerQueryForNWActivity:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, uint64_t))a5;
  uint64_t v83 = 0LL;
  id v84 = &v83;
  uint64_t v85 = 0x3032000000LL;
  id v86 = sub_10004B8C4;
  id v87 = sub_10004B8D4;
  id v88 = 0LL;
  uint64_t v77 = 0LL;
  id v78 = &v77;
  uint64_t v79 = 0x3032000000LL;
  id v80 = sub_10004B8C4;
  dispatch_queue_t v81 = sub_10004B8D4;
  id v82 = 0LL;
  if (!a3)
  {
    id v10 = WALogCategoryDefaultHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Engine NWActivity reply style 0",  (const char *)&unk_1000B76E7,  buf,  2u);
    }

    v9[2](v9, 0LL, v78[5]);
    id v12 = WALogCategoryDefaultHandle();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Engine NWActivity reply style 0",  (const char *)&unk_1000B76E7,  buf,  2u);
    }
  }

  id v14 = WALogCategoryDefaultHandle();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Engine NWActivity",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  self->_isNWActivityInProgress = 1;
  if (!a3)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v8]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);
    BOOL v20 = v19 == 0LL;

    if (v20)
    {
      id v21 = WALogCategoryDefaultHandle();
      int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
        __int16 v93 = 1024;
        int v94 = 3483;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Caller did not register",  buf,  0x12u);
      }

      if (!v8)
      {
        id v65 = WALogCategoryDefaultHandle();
        __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          id v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
          __int16 v93 = 1024;
          int v94 = 3484;
          _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:couldn't get process name for connection",  buf,  0x12u);
        }

        NSErrorUserInfoKey v99 = NSLocalizedFailureReasonErrorKey;
        unsigned __int8 v100 = @"WAErrorCodeInternalError";
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
        uint64_t v67 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v29));
        __int128 v68 = (void *)v78[5];
        v78[5] = v67;

        goto LABEL_49;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v8]);
      int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
      unsigned int v26 = [v24 containsObject:v25];

      id v27 = WALogCategoryDefaultHandle();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      __int128 v29 = v28;
      if (v26)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          id v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
          __int16 v93 = 1024;
          int v94 = 3485;
          __int16 v95 = 2048;
          uint64_t v96 = 3LL;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld",  buf,  0x1Cu);
        }

        goto LABEL_49;
      }

      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Engine NWActivity notRegisteredPath",  (const char *)&unk_1000B76E7,  buf,  2u);
      }

      -[WAEngine _purgeGroupTypeIfNecessary:](self, "_purgeGroupTypeIfNecessary:", 3LL);
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v8]);
      BOOL v32 = v31 == 0LL;

      if (v32)
      {
        __int128 v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        [v34 setObject:v33 forKeyedSubscript:v8];
      }

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      char v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v8]);
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
      [v36 addObject:v37];

      -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]( self,  "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:",  v8,  3LL);
      -[WAEngine _persist](self, "_persist");
      id v38 = WALogCategoryDefaultHandle();
      NSUInteger v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v8));
        *(_DWORD *)buf = 136446978;
        id v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
        __int16 v93 = 1024;
        int v94 = 3498;
        __int16 v95 = 2048;
        uint64_t v96 = 3LL;
        __int16 v97 = 2112;
        v98 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:XPC: registering message group type: %ld for process: %@",  buf,  0x26u);
      }

      id v41 = WALogCategoryDefaultHandle();
      __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Engine NWActivity notRegisteredPath",  (const char *)&unk_1000B76E7,  buf,  2u);
      }
    }
  }

  uint64_t v43 = objc_claimAutoreleasedReturnValue( -[WAEngine _cachedModelObjectsMessageForGroupType:key:]( self,  "_cachedModelObjectsMessageForGroupType:key:",  3LL,  @"NWA"));
  int v44 = (void *)v84[5];
  v84[5] = v43;

  if (!v84[5])
  {
    id v58 = WALogCategoryDefaultHandle();
    __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
      __int16 v93 = 1024;
      int v94 = 3504;
      __int16 v95 = 2112;
      uint64_t v96 = (uint64_t)@"NWA";
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error",  buf,  0x1Cu);
    }

    NSErrorUserInfoKey v89 = NSLocalizedFailureReasonErrorKey;
    id v90 = @"WAErrorCodeNotRegistered";
    __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
    uint64_t v60 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9009LL,  v50));
    id v61 = (void *)v78[5];
    v78[5] = v60;

    goto LABEL_39;
  }

  __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([(id)v84[5] originalClassName]);
  unsigned __int8 v47 = [v45 doesMessageNeedPrepopulation:v46];

  id v48 = WALogCategoryDefaultHandle();
  __int16 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  __int128 v50 = v49;
  if ((v47 & 1) == 0)
  {
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
      __int16 v93 = 1024;
      int v94 = 3506;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:doesMessageNeedPrepopulation returned false",  buf,  0x12u);
    }

- (void)_convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 forProcessToken:(id)a6 andReply:(id)a7
{
  id v51 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void, uint64_t))a7;
  uint64_t v55 = 0LL;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  id v58 = sub_10004B8C4;
  __int16 v59 = sub_10004B8D4;
  id v60 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);
  BOOL v19 = v18 == 0LL;

  if (!v19) {
    goto LABEL_11;
  }
  id v20 = WALogCategoryDefaultHandle();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    __int128 v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
    __int16 v67 = 1024;
    int v68 = 3720;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Caller did not register",  buf,  0x12u);
  }

  if (!v13)
  {
    id v43 = WALogCategoryDefaultHandle();
    int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int128 v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      __int16 v67 = 1024;
      int v68 = 3721;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:couldn't get process name for connection",  buf,  0x12u);
    }

    NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
    NSErrorUserInfoKey v73 = NSLocalizedFailureReasonErrorKey;
    v74 = @"WAErrorCodeInternalError";
    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    uint64_t v47 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v46));
    id v48 = (void *)v56[5];
    v56[5] = v47;

    goto LABEL_24;
  }

  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v13]);
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
  unsigned int v25 = [v23 containsObject:v24];

  if (v25)
  {
    id v49 = WALogCategoryDefaultHandle();
    __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int128 v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      __int16 v67 = 1024;
      int v68 = 3722;
      __int16 v69 = 2048;
      uint64_t v70 = 3LL;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld",  buf,  0x1Cu);
    }

    NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
LABEL_24:
    NSErrorUserInfoKey v61 = v45;
    id v62 = @"WAErrorCodeInternalError";
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    uint64_t v41 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v40));
LABEL_16:
    __int16 v42 = (void *)v56[5];
    v56[5] = v41;

    v14[2](v14, 0LL, v56[5]);
    goto LABEL_17;
  }

  -[WAEngine _purgeGroupTypeIfNecessary:](self, "_purgeGroupTypeIfNecessary:", 3LL);
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v13]);
  BOOL v28 = v27 == 0LL;

  if (v28)
  {
    __int128 v29 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
    [v30 setObject:v29 forKeyedSubscript:v13];
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v13]);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
  [v32 addObject:v33];

  -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]( self,  "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:",  v13,  3LL);
  -[WAEngine _persist](self, "_persist");
  id v34 = WALogCategoryDefaultHandle();
  __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    char v36 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](&OBJC_CLASS___WAUtil, "trimTokenForLogging:", v13));
    *(_DWORD *)buf = 136446978;
    __int128 v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
    __int16 v67 = 1024;
    int v68 = 3733;
    __int16 v69 = 2048;
    uint64_t v70 = 3LL;
    __int16 v71 = 2112;
    id v72 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:XPC: registering message group type: %ld for process: %@",  buf,  0x26u);
  }

LABEL_11:
  id v37 = -[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]( objc_alloc(&OBJC_CLASS___NWActivityDistributionStoreDescriptor),  "_initWithGroupAndOptions:groupTarget:",  a4,  v12);
  if (!v37)
  {
    id v38 = WALogCategoryDefaultHandle();
    NSUInteger v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int128 v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      __int16 v67 = 1024;
      int v68 = 3749;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to create NWActivityDistributionStoreDescriptor",  buf,  0x12u);
    }

    NSErrorUserInfoKey v63 = NSLocalizedFailureReasonErrorKey;
    id v64 = @"WAErrorCodeInternalError";
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
    uint64_t v41 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9003LL,  v40));
    goto LABEL_16;
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10005D81C;
  v52[3] = &unk_1000CD4D8;
  id v53 = v14;
  NSErrorUserInfoKey v54 = &v55;
  [v37 findInterpolatedPercentileFromWiFiStats:v51 andReply:v52];

LABEL_17:
  _Block_object_dispose(&v55, 8);
}

- (void)populateChannelInfo:(id)a3
{
  int v20 = 0;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getInfraApple80211]);

  if (!v5)
  {
    id v18 = WALogCategoryDefaultHandle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446466;
    int v22 = "-[WAEngine populateChannelInfo:]";
    __int16 v23 = 1024;
    int v24 = 3773;
    uint64_t v11 = "%{public}s::%d:invalid apple80211API";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }

  if ([v5 currentChannelInfo:&v19])
  {
    if ((v20 & 0x400) != 0) {
      int v6 = 80;
    }
    else {
      int v6 = (v20 << 20 >> 31) & 0xA0;
    }
    if ((v20 & 4) != 0) {
      unsigned int v7 = 40;
    }
    else {
      unsigned int v7 = v6;
    }
    if ((v20 & 2) != 0) {
      uint64_t v8 = 20LL;
    }
    else {
      uint64_t v8 = v7;
    }
    goto LABEL_16;
  }

  id v9 = WALogCategoryDefaultHandle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v22 = "-[WAEngine populateChannelInfo:]";
    __int16 v23 = 1024;
    int v24 = 3776;
    uint64_t v11 = "%{public}s::%d:Error getting channel Info for dpsCounterSample";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0x12u);
  }

- (BOOL)populateApProfile:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 fieldForKey:@"NWA_apProfile"]);
  [v3 setStringValue:&stru_1000CF610];

  return 1;
}

- (BOOL)everAssociated:(BOOL)a3 assocDoneSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3 || a4)
  {
    id v9 = WALogCategoryDefaultHandle();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136446978;
      id v15 = "-[WAEngine everAssociated:assocDoneSuccess:]";
      __int16 v16 = 1024;
      int v17 = 3840;
      __int16 v18 = 1024;
      BOOL v19 = v5;
      __int16 v20 = 1024;
      BOOL v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:everAssociated true due to hasLinkChanged %d hasAssocDoneSuccess %d",  (uint8_t *)&v14,  0x1Eu);
    }

    unsigned __int8 v8 = 1;
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 getInfraApple80211]);

    if (v7)
    {
      unsigned __int8 v8 = -[os_log_s everAssociated](v7, "everAssociated");
    }

    else
    {
      id v11 = WALogCategoryDefaultHandle();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136446466;
        id v15 = "-[WAEngine everAssociated:assocDoneSuccess:]";
        __int16 v16 = 1024;
        int v17 = 3845;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:invalid apple80211API",  (uint8_t *)&v14,  0x12u);
      }

      id v13 = WALogCategoryDefaultHandle();
      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136446466;
        id v15 = "-[WAEngine everAssociated:assocDoneSuccess:]";
        __int16 v16 = 1024;
        int v17 = 3854;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:everAssociated failed",  (uint8_t *)&v14,  0x12u);
      }

      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isAssociated
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getInfraApple80211]);

  if (v3)
  {
    unsigned __int8 v4 = [v3 isAssociated];
  }

  else
  {
    id v6 = WALogCategoryDefaultHandle();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      id v11 = "-[WAEngine isAssociated]";
      __int16 v12 = 1024;
      int v13 = 3864;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:invalid apple80211API",  (uint8_t *)&v10,  0x12u);
    }

    id v8 = WALogCategoryDefaultHandle();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      id v11 = "-[WAEngine isAssociated]";
      __int16 v12 = 1024;
      int v13 = 3872;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:everAssociated failed",  (uint8_t *)&v10,  0x12u);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isAXAssociatoin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getInfraApple80211]);

  if (v3)
  {
    unsigned __int8 v4 = [v3 isAXAssociatoin];
  }

  else
  {
    id v6 = WALogCategoryDefaultHandle();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      id v11 = "-[WAEngine isAXAssociatoin]";
      __int16 v12 = 1024;
      int v13 = 3882;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:invalid apple80211API",  (uint8_t *)&v10,  0x12u);
    }

    id v8 = WALogCategoryDefaultHandle();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      id v11 = "-[WAEngine isAXAssociatoin]";
      __int16 v12 = 1024;
      int v13 = 3890;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:isAXAssociatoin failed",  (uint8_t *)&v10,  0x12u);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)gatherConsecutiveDatapathReadings:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v7 = a4;
  id v70 = a5;
  group = dispatch_group_create();
  dispatch_semaphore_t v63 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  uint64_t v120 = 0LL;
  uint64_t v121 = &v120;
  uint64_t v122 = 0x3032000000LL;
  id v123 = sub_10004B8C4;
  id v124 = sub_10004B8D4;
  id v125 = 0LL;
  v118[0] = 0LL;
  v118[1] = v118;
  v118[2] = 0x3032000000LL;
  v118[3] = sub_10004B8C4;
  v118[4] = sub_10004B8D4;
  id v119 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v112 = 0LL;
  id v113 = &v112;
  uint64_t v114 = 0x3032000000LL;
  id v115 = sub_10004B8C4;
  uint64_t v116 = sub_10004B8D4;
  id v117 = 0LL;
  v110[0] = 0LL;
  v110[1] = v110;
  v110[2] = 0x3032000000LL;
  v110[3] = sub_10004B8C4;
  v110[4] = sub_10004B8D4;
  id v111 = 0LL;
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_10005EDBC;
  v107[3] = &unk_1000CD500;
  id v109 = &v120;
  dispatch_semaphore_t dsema = v8;
  dispatch_semaphore_t v108 = dsema;
  int v68 = v7;
  -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]( self,  "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:",  @"DPSR",  4LL,  v7,  0LL,  v107);
  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL);
  dispatch_semaphore_wait(dsema, v9);
  id v10 = WALogCategoryDefaultHandle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
    __int16 v128 = 1024;
    int v129 = 3916;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:ensureDPSRexists done",  buf,  0x12u);
  }

  if (v121[5])
  {
    if (self->_dnsStudyInProgress)
    {
      unsigned __int8 v67 = -[WAEngine fetchConfiguredDnsInfo](self, "fetchConfiguredDnsInfo");
      -[WAEngine triggerPeerDiscovery](self, "triggerPeerDiscovery");
    }

    else
    {
      unsigned __int8 v67 = 1;
    }

    __int16 v69 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _DPSQuickRecoveryEngineObj](self, "_DPSQuickRecoveryEngineObj"));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v121[5] fieldForKey:@"DPSR_dpsEpiloge"]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subMessageValue]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fieldForKey:@"DPSE_qDpsStats"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 subMessageValue]);
    [v69 updateTimeSincePreviousTriggerForQuickDps:v15];

    id v16 = WALogCategoryDefaultHandle();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v128 = 1024;
      int v129 = 3930;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_dpsStudyInProgress Start",  buf,  0x12u);
    }

    dispatch_group_enter(group);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
    dispatch_time_t v19 = dispatch_time(0, 1000000000 * (void)objc_msgSend(v18, "dps_report_sent_after"));
    dpsReadWriteSerialQueue = (dispatch_queue_s *)self->_dpsReadWriteSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005EEB8;
    block[3] = &unk_1000CCD80;
    dispatch_group_t v61 = group;
    dispatch_group_t v106 = v61;
    dispatch_after(v19, dpsReadWriteSerialQueue, block);

    id v21 = WALogCategoryDefaultHandle();
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v128 = 1024;
      int v129 = 3939;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples TRUE",  buf,  0x12u);
    }

    self->_dpsCurrentlyGatheringConsecutiveSamples = 1;
    v103[0] = 0LL;
    v103[1] = v103;
    v103[2] = 0x2020000000LL;
    char v104 = 1;
    v101[0] = 0LL;
    v101[1] = v101;
    v101[2] = 0x2020000000LL;
    char v102 = 1;
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
    id v71 = objc_msgSend(v23, "dps_duration_between_samples");

    recommendationEngine = self->_recommendationEngine;
    if (self->_dnsStudyInProgress)
    {
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](recommendationEngine, "preferences"));
      id v72 = (char *)objc_msgSend(v25, "dns_symptoms_interrogation_sample_count");

      int v26 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      id v71 = objc_msgSend(v26, "dns_symptoms_duration_between_samples_before_trap");

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      uint64_t v28 = (uint64_t)objc_msgSend(v27, "dns_symptoms_trap_evaluated_at_sample") - 1;
    }

    else
    {
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](recommendationEngine, "preferences"));
      id v72 = (char *)objc_msgSend(v27, "dps_interrogation_sample_count");
      uint64_t v28 = 1LL;
    }

    uint64_t v66 = v28;

    id v29 = WALogCategoryDefaultHandle();
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      __int16 v128 = 1024;
      int v129 = 3955;
      __int16 v130 = 2048;
      *(void *)int v131 = v72;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DPS: interrogationCount: %lu",  buf,  0x1Cu);
    }

    if (v72)
    {
      unint64_t v31 = 0LL;
      unsigned int v32 = 1;
      while (1)
      {
        dispatch_semaphore_t v33 = dispatch_semaphore_create(0LL);
        if (self->_dnsStudyInProgress)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
          BOOL v35 = (unint64_t)objc_msgSend(v34, "dns_symptoms_trap_evaluated_at_sample") > v31;

          if (!v35)
          {
            char v36 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
            id v71 = objc_msgSend(v36, "dns_symptoms_duration_between_samples_after_trap");
          }
        }

        id v37 = WALogCategoryDefaultHandle();
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
          __int16 v128 = 1024;
          int v129 = 3964;
          __int16 v130 = 1024;
          *(_DWORD *)int v131 = v32 - 1;
          *(_WORD *)&v131[4] = 2048;
          *(void *)&v131[6] = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DPS: sample:%u durationBetweenSamples: %lu",  buf,  0x22u);
        }

        dispatch_time_t v39 = dispatch_time(0LL, 1000000LL * (void)v71);
        __int16 v40 = (dispatch_queue_s *)self->_dpsReadWriteSerialQueue;
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472LL;
        v90[2] = sub_10005EF78;
        v90[3] = &unk_1000CD5A0;
        unsigned int v100 = v32 - 1;
        v90[4] = self;
        __int16 v93 = v101;
        int v94 = v103;
        uint64_t v97 = v66;
        v98 = v72;
        uint64_t v99 = 4LL;
        id v91 = v68;
        __int16 v95 = v110;
        uint64_t v41 = v33;
        id v92 = v41;
        uint64_t v96 = &v120;
        dispatch_after(v39, v40, v90);
        dispatch_time_t v42 = dispatch_time(0LL, 20000000000LL);
        dispatch_semaphore_wait(v41, v42);
        id v43 = (dispatch_queue_s *)self->_dpsReadWriteSerialQueue;
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472LL;
        v81[2] = sub_100060290;
        v81[3] = &unk_1000CD5F0;
        id v84 = &v120;
        v81[4] = self;
        unsigned int v88 = v32 - 1;
        id v82 = v69;
        uint64_t v85 = v101;
        id v86 = v118;
        id v83 = v70;
        id v87 = v103;
        unsigned __int8 v89 = v67;
        dispatch_async(v43, v81);

        unint64_t v31 = v32;
      }

      id v45 = WALogCategoryDefaultHandle();
      __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        __int16 v128 = 1024;
        int v129 = 4290;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:kDatapathInterrogationCountMax hit",  buf,  0x12u);
      }

      id v47 = WALogCategoryDefaultHandle();
      id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        __int16 v128 = 1024;
        int v129 = 4291;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples FALSE",  buf,  0x12u);
      }

      self->_dpsCurrentlyGatheringConsecutiveSamples = 0;
    }

- (void)_triggerDPSStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_semaphore_t v124 = dispatch_semaphore_create(0LL);
  id v13 = WALogCategoryDefaultHandle();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL dpsStudyInProgress = self->_dpsStudyInProgress;
    *(_DWORD *)buf = 136446722;
    v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    __int16 v135 = 1024;
    int v136 = 4499;
    __int16 v137 = 1024;
    LODWORD(v138) = dpsStudyInProgress;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_dpsStudyInProgress is %d",  buf,  0x18u);
  }

  id v16 = WALogCategoryDefaultHandle();
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    __int16 v135 = 1024;
    int v136 = 4500;
    __int16 v137 = 2112;
    id v138 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got WAMessage %@ ", buf, 0x1Cu);
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned int v19 = [v18 isEqualToString:@"DPSN"];

  if (!v19)
  {
    BOOL v26 = 0;
    goto LABEL_63;
  }

  id v20 = +[WAUtil getAWDTimestamp](&OBJC_CLASS___WAUtil, "getAWDTimestamp");
  BOOL v21 = !self->_dpsStudyInProgress;
  if (self->_dpsStudyInProgress)
  {
    BOOL dpsCurrentlyGatheringConsecutiveSamples = self->_dpsCurrentlyGatheringConsecutiveSamples;
    id v23 = WALogCategoryDefaultHandle();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (dpsCurrentlyGatheringConsecutiveSamples)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4570;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples",  buf,  0x12u);
      }
    }

    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4559;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Sampling another dpsStatsContainer",  buf,  0x12u);
      }

      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472LL;
      v130[2] = sub_1000657D4;
      v130[3] = &unk_1000CD690;
      v130[4] = self;
      -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]( self,  "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:",  @"DPSCS",  4LL,  v10,  1LL,  v130);
    }
  }

  else
  {
    if (self->_slowWiFiStudyInProgress)
    {
      id v27 = WALogCategoryDefaultHandle();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4507;
        id v29 = "%{public}s::%d:Got Stall Notification when slowWiFiStudyInProgress, exiting";
        __int128 v30 = v28;
        os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
LABEL_106:
        _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buf, 0x12u);
        goto LABEL_107;
      }

      goto LABEL_107;
    }

    id v32 = v20;
    BOOL v123 = !self->_dpsStudyInProgress;
    dispatch_semaphore_t v33 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
    unsigned int v34 = [v33 int32Value];

    unsigned int v122 = v34;
    if (v34)
    {
      int64_t v35 = a3;
      char v36 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
      unsigned int v37 = [v36 int32Value];

      id v38 = WALogCategoryDefaultHandle();
      dispatch_time_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      uint64_t v28 = v39;
      if (v37 != 4)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
          unsigned int v121 = [v120 int32Value];
          *(_DWORD *)buf = 136446722;
          v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
          __int16 v135 = 1024;
          int v136 = 4533;
          __int16 v137 = 1024;
          LODWORD(v138) = v121;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Got Stall Notification for symptom:%d when not currently in study, so ignore..",  buf,  0x18u);
        }

        goto LABEL_107;
      }

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4517;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS Study triggered by Symptoms DNS trigger",  buf,  0x12u);
      }

      *(_WORD *)&self->_dpsNotificationDuringDnsStudy = 0;
      self->_BOOL dnsStudyInProgress = 1;
      __int16 v40 = (void *)os_transaction_create("com.apple.wifianalytics.dnsStudyTransaction");
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[WAActivityManager sharedActivityManager]( &OBJC_CLASS___WAActivityManager,  "sharedActivityManager"));
      [v41 osTransactionCreate:"com.apple.wifianalytics.dnsStudyTransaction" transaction:v40];

      -[WAEngine setDnsStudyTransaction:](self, "setDnsStudyTransaction:", v40);
      -[WAEngine clearDnsStudyVariables](self, "clearDnsStudyVariables");
      dnsStudyQueue = (dispatch_queue_s *)self->_dnsStudyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100065770;
      block[3] = &unk_1000CCD80;
      void block[4] = self;
      dispatch_sync(dnsStudyQueue, block);
      a3 = v35;
    }

    else
    {
      id v43 = WALogCategoryDefaultHandle();
      int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4514;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DPS Study triggered by stall",  buf,  0x12u);
      }
    }

    int64_t v45 = a3;
    id v46 = WALogCategoryDefaultHandle();
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v135 = 1024;
      int v136 = 4537;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Got Stall Notification when not currently in study, kicking off DPS Study",  buf,  0x12u);
    }

    self->_BOOL dpsStudyInProgress = 1;
    id v48 = (void *)os_transaction_create("com.apple.wifianalytics.dpsStudyTransaction");
    id v49 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](&OBJC_CLASS___WAActivityManager, "sharedActivityManager"));
    [v49 osTransactionCreate:"com.apple.wifianalytics.dpsStudyTransaction" transaction:v48];

    id v50 = v48;
    -[WAEngine setDpsStudyTransaction:](self, "setDpsStudyTransaction:", v50);

    self->_dpsAction = 0;
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_timestamp"]);
    self->_dpsNotificationTimeInSeconds = (unint64_t)[v51 uint64Value] / 0x3E8;

    dispatch_time_t v52 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_cca"]);
    self->_dpsNotificationCCA = [v52 uint32Value];

    if (!v122)
    {
      peerDiagnosticsStudyQueue = (dispatch_queue_s *)self->_peerDiagnosticsStudyQueue;
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472LL;
      v131[2] = sub_1000657A0;
      v131[3] = &unk_1000CD668;
      v131[4] = self;
      v131[5] = 1LL;
      dispatch_async(peerDiagnosticsStudyQueue, v131);
    }

    NSErrorUserInfoKey v54 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_facetimeCallInProgress"]);
    self->_isCriticalAppInUse = [v54 BOOLValue];

    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  v55,  @"start");

    id v56 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_timestamp"]);
    [v56 setUint64Value:v32];

    a3 = v45;
    BOOL v21 = v123;
  }

  id v57 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  BOOL v58 = v21;
  if ([v57 int32Value] == 2)
  {
  }

  else
  {
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
    unsigned int v60 = [v59 int32Value];

    if (v60 != 3) {
      goto LABEL_35;
    }
  }

  self->_dpsAction |= 0x20u;
LABEL_35:
  dispatch_group_t v61 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  if ([v61 int32Value] == 2)
  {
    id v62 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"userToggle"));

    if (v62) {
      goto LABEL_39;
    }
    dispatch_group_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  v61,  @"userToggle");
  }

LABEL_39:
  dispatch_semaphore_t v63 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  if ([v63 int32Value] == 2)
  {
    id v64 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"decisionInstance"));
    if (!v64)
    {
      id v119 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"UserToggleBeforeDecision"));

      if (!v119) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"UserToggleBeforeDecision");
      }
      goto LABEL_43;
    }
  }

LABEL_43:
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  if ([v65 int32Value] == 2
    && (uint64_t v66 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"decisionInstance"))) != 0)
  {
    unsigned __int8 v67 = (void *)v66;
    int v68 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"UserToggleBeforeDecision"));

    if (!v68) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"UserToggleBeforeDecision");
    }
  }

  else
  {
  }

  __int16 v69 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  if ([v69 int32Value] == 3)
  {
    id v70 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"decisionInstance"));

    BOOL v26 = v58;
    if (!v70) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"LinkUpBeforeDecision");
    }
  }

  else
  {

    BOOL v26 = v58;
  }

  id v71 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  if ([v71 int32Value] == 3)
  {
    id v72 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"decisionInstance"));

    if (v72) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"LinkUpAfterDecision");
    }
  }

  else
  {
  }

  NSErrorUserInfoKey v73 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSN_symptom"]);
  if ([v73 int32Value])
  {
  }

  else
  {
    BOOL dnsStudyInProgress = self->_dnsStudyInProgress;

    if (dnsStudyInProgress) {
      self->_dpsNotificationDuringDnsStudy = 1;
    }
  }

  id v75 = WALogCategoryDefaultHandle();
  int64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    __int16 v135 = 1024;
    int v136 = 4607;
    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding DPSR_stallNotifications",  buf,  0x12u);
  }

  -[NSMutableArray addObject:](self->_dpsnToAppend, "addObject:", v11);
LABEL_63:
  if (!self->_dpsStudyInProgress)
  {
    id v86 = WALogCategoryDefaultHandle();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v87 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
      BOOL v88 = self->_dpsStudyInProgress;
      *(_DWORD *)buf = 136446978;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v135 = 1024;
      int v136 = 4612;
      __int16 v137 = 2112;
      id v138 = v87;
      __int16 v139 = 1024;
      BOOL v140 = v88;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Dropping incomming key %@ because _dpsStudyInProgress is %d",  buf,  0x22u);
    }

    goto LABEL_107;
  }

  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned int v78 = [v77 isEqualToString:@"DPSAPS"];

  if (v78)
  {
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"DPSAPS_timestamp"]);
    objc_msgSend(v79, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    id v80 = WALogCategoryDefaultHandle();
    dispatch_queue_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v135 = 1024;
      int v136 = 4619;
      __int16 v137 = 2112;
      id v138 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding DPSR_probeResults %@",  buf,  0x1Cu);
    }

    -[NSMutableArray addObject:](self->_dpsapToAppend, "addObject:", v11);
    BOOL v82 = self->_dpsCurrentlyGatheringConsecutiveSamples;
    id v83 = WALogCategoryDefaultHandle();
    id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
    BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
    if (v82)
    {
      if (v85)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4633;
        _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples",  buf,  0x12u);
      }
    }

    else
    {
      if (v85)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4623;
        _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Sampling another dpsStatsContainer",  buf,  0x12u);
      }

      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472LL;
      v129[2] = sub_100065920;
      v129[3] = &unk_1000CD690;
      v129[4] = self;
      -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]( self,  "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:",  @"DPSCS",  4LL,  v10,  1LL,  v129);
    }
  }

  unsigned __int8 v89 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned int v90 = [v89 isEqualToString:@"WFAAWDWADAAD"];

  if (v90)
  {
    id v91 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"WFAAWDWADAAD_timestamp"]);
    objc_msgSend(v91, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    id v92 = WALogCategoryDefaultHandle();
    __int16 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v135 = 1024;
      int v136 = 4640;
      __int16 v137 = 2112;
      id v138 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding DPSE_associationChanges %@",  buf,  0x1Cu);
    }

    -[NSMutableArray addObject:](self->_assocDiffToAppend, "addObject:", v11);
    int v94 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"WFAAWDWADAAD_eventType"]);
    BOOL v95 = v26;
    if ([v94 int32Value] == 5)
    {
      uint64_t v96 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"decisionInstance"));
      if (v96)
      {
        uint64_t v97 = (void *)v96;
        v98 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_studyTimeStamps,  "objectForKeyedSubscript:",  @"IPConfiguredEventTimeStamp"));

        if (v98) {
          goto LABEL_84;
        }
        uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  v99,  @"IPConfiguredEventTimeStamp");

        int v94 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"WFAAWDWADAAD_additionalInfo"]);
        unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v94 uint32Value]));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_studyTimeStamps,  "setObject:forKeyedSubscript:",  v100,  @"IPAddressTypeOnInterface");
      }
    }

LABEL_84:
    BOOL v101 = self->_dpsCurrentlyGatheringConsecutiveSamples;
    id v102 = WALogCategoryDefaultHandle();
    id v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    BOOL v104 = os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT);
    BOOL v26 = v95;
    if (v101)
    {
      if (v104)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4661;
        _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples",  buf,  0x12u);
      }
    }

    else
    {
      if (v104)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4651;
        _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Sampling another dpsStatsContainer",  buf,  0x12u);
      }

      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472LL;
      v128[2] = sub_100065A3C;
      v128[3] = &unk_1000CD690;
      v128[4] = self;
      -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]( self,  "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:",  @"DPSCS",  4LL,  v10,  1LL,  v128);
    }
  }

  id v105 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned int v106 = [v105 isEqualToString:@"WFAAWDWAAAPI"];

  if (v106)
  {
    id v107 = WALogCategoryDefaultHandle();
    dispatch_semaphore_t v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v135 = 1024;
      int v136 = 4666;
      __int16 v137 = 2112;
      id v138 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding DPSE_accessPointInfo %@",  buf,  0x1Cu);
    }

    -[NSMutableArray addObject:](self->_accessPointInfoToAppend, "addObject:", v11);
  }

  id v109 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned int v110 = [v109 isEqualToString:@"USBEN"];

  if (v110)
  {
    id v111 = WALogCategoryDefaultHandle();
    uint64_t v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      __int16 v135 = 1024;
      int v136 = 4671;
      __int16 v137 = 2112;
      id v138 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding DPSR_usbEvent %@",  buf,  0x1Cu);
    }

    -[NSMutableArray addObject:](self->_usbEventNotificationToAppend, "addObject:", v11);
  }

  if (v26)
  {
    studyQueue = (dispatch_queue_s *)self->_studyQueue;
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472LL;
    v125[2] = sub_100065B58;
    v125[3] = &unk_1000CD6B8;
    v125[4] = self;
    id v126 = v10;
    uint64_t v114 = v124;
    v127 = v114;
    dispatch_async(studyQueue, v125);

    if (a3 == 1)
    {
      id v115 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      dispatch_time_t v116 = dispatch_time(0, 1000000000 * (void)objc_msgSend(v115, "dps_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v114, v116);

      id v117 = WALogCategoryDefaultHandle();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4688;
        id v29 = "%{public}s::%d:unblocking is complete... returning";
LABEL_105:
        __int128 v30 = v28;
        os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_106;
      }
    }

    else
    {
      id v118 = WALogCategoryDefaultHandle();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        __int16 v135 = 1024;
        int v136 = 4690;
        id v29 = "%{public}s::%d:returning immediatley";
        goto LABEL_105;
      }
    }

- (BOOL)isInternalScenario
{
  id v3 = sub_100043C9C();
  if (!objc_opt_class(v3)) {
    return 0;
  }
  id v4 = objc_alloc_init((Class)sub_100043C9C());
  id v11 = 0LL;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 queryDebugConfigurationForPeer:0 error:&v11]);
  id v6 = v11;
  id v7 = WALogCategoryDefaultHandle();
  dispatch_semaphore_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v13 = "-[WAEngine isInternalScenario]";
    __int16 v14 = 1024;
    int v15 = 4705;
    __int16 v16 = 2112;
    int v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Logging:: %@ \n error:%@",  buf,  0x26u);
  }

  BOOL v9 = v5 && [v5 megaWiFiProfile] == (id)1 || self->_isInternalInstall;
  return v9;
}

- (void)triggerPeerDiagnosticsStudy:(unint64_t)a3 symptomsDnsStats:(id)a4
{
  id v6 = a4;
  id v7 = WALogCategoryDefaultHandle();
  dispatch_semaphore_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4712;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: triggerPeerDiagnosticsStudy with type:%d",  buf,  0x18u);
  }

  unsigned __int8 v9 = -[WAEngine isInternalScenario](self, "isInternalScenario");
  if (a3) {
    char v10 = v9;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) != 0)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    id v12 = (void *)os_transaction_create("com.apple.wifianalytics.triggerPeerDiagnosticsStudy");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](&OBJC_CLASS___WAActivityManager, "sharedActivityManager"));
    [v13 osTransactionCreate:"com.apple.wifianalytics.triggerPeerDiagnosticsStudy" transaction:v12];

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    unsigned __int8 v67 = sub_10004B8C4;
    int v68 = sub_10004B8D4;
    id v69 = 0LL;
    uint64_t v53 = 0LL;
    NSErrorUserInfoKey v54 = &v53;
    uint64_t v55 = 0x3032000000LL;
    id v56 = sub_10004B8C4;
    id v57 = sub_10004B8D4;
    id v58 = 0LL;
    if (-[WAEngine isWiFiAssociatedToNetwork](self, "isWiFiAssociatedToNetwork"))
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _DPSQuickRecoveryEngineObj](self, "_DPSQuickRecoveryEngineObj"));
      int v15 = v14;
      if (v14)
      {
        if ([v14 isPeerDiagnosticsTriggerAllowed:a3])
        {
          id v16 = sub_100066590();
          if (objc_opt_class(v16))
          {
            id v17 = sub_100043C9C();
            if (objc_opt_class(v17))
            {
              id v18 = objc_alloc_init((Class)sub_100043C9C());
              if (v18)
              {
                id v19 = [sub_100066590() requestWithTestID:60 configuration:0];
                id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                id v65 = v20;
                BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v65,  1LL));

                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472LL;
                v49[2] = sub_100066644;
                v49[3] = &unk_1000CD6E0;
                id v51 = buf;
                dispatch_time_t v52 = &v53;
                id v50 = v11;
                id v22 = [v18 runDiagnostics:v21 configuration:0 update:0 reply:v49];
              }

              dispatch_time_t v23 = dispatch_time(0LL, 6000000000LL);
              dispatch_semaphore_wait(v11, v23);
              if (!*(void *)(*(void *)&buf[8] + 40LL))
              {
                id v24 = WALogCategoryDefaultHandle();
                BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v26 = v54[5];
                  *(_DWORD *)uint64_t v59 = 136446722;
                  unsigned int v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
                  __int16 v61 = 1024;
                  int v62 = 4745;
                  __int16 v63 = 2112;
                  uint64_t v64 = v26;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:PeerDiagnostics: Data collection failed with err:%@",  v59,  0x1Cu);
                }
              }
            }
          }
        }
      }

      if (a3) {
        goto LABEL_35;
      }
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSR_dpsEpiloge"]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 subMessageValue]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 fieldForKey:@"DPSE_symptomsDnsStats"]);
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 subMessageValue]);
      LODWORD(v48) = self->_cumulativeAverageCcaSinceStudyStart;
      id v31 = [v15 recommendSymptomsDpsRecovery:0 symptomsDnsStats:v30 awdlState:self->_isAWDLActivitySuspected currentSymptomsCondition:self->_isPoorSymptomsDnsConditions isLANPingSuccessful:self->_isGatewayReachable appUsage:self->_isCriticalAppInUse averageCCA:v48];

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      dispatch_semaphore_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v33]);
      LODWORD(v29) = v34 == 0LL;

      if ((_DWORD)v29) {
        -[WAEngine queryInfraInterfaceInstanceAndChip](self, "queryInfraInterfaceInstanceAndChip");
      }
      -[WAEngine _persist](self, "_persist");
      if (v31 == (id)2)
      {
        id v41 = WALogCategoryDefaultHandle();
        dispatch_time_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v59 = 136446466;
          unsigned int v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          __int16 v61 = 1024;
          int v62 = 4768;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: Triggering Reassoc for symptoms-dps",  v59,  0x12u);
        }

        self->_dpsAction |= 0x80u;
        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
        id v43 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
        int v44 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v43]);
        [v44 triggerReassociation:@"ReassociateOnDNSSymptoms"];
      }

      else if (v31 == (id)1)
      {
        id v35 = WALogCategoryDefaultHandle();
        char v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v59 = 136446466;
          unsigned int v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          __int16 v61 = 1024;
          int v62 = 4764;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: Triggering Trap for symptoms-dps",  v59,  0x12u);
        }

        self->_dpsAction |= 0x40u;
        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
        id v38 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
        dispatch_time_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
        [v39 triggerDpsReset:@"TrapOnDNSSymptoms"];
      }

      else
      {
        id v45 = WALogCategoryDefaultHandle();
        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v59 = 136446466;
          unsigned int v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          __int16 v61 = 1024;
          int v62 = 4772;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: No Recovery Action recommended for symptoms-dps",  v59,  0x12u);
        }
      }
    }

    else
    {
      id v47 = WALogCategoryDefaultHandle();
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v59 = 136446466;
        unsigned int v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
        __int16 v61 = 1024;
        int v62 = 4725;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WiFi disassocited during study so not continuing...",  v59,  0x12u);
      }

      int v15 = 0LL;
    }

LABEL_35:
    id v46 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](&OBJC_CLASS___WAActivityManager, "sharedActivityManager"));
    [v46 osTransactionComplete:v12];

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_36;
  }

  id v40 = WALogCategoryDefaultHandle();
  dispatch_semaphore_t v11 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4714;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: peerDiagnosticsStudy disabled",  buf,  0x12u);
  }

- (void)gatherConsecutiveLinkQualitySamples:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v51 = a4;
  id v49 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v79 = 0LL;
  id v80 = &v79;
  uint64_t v81 = 0x3032000000LL;
  BOOL v82 = sub_10004B8C4;
  id v83 = sub_10004B8D4;
  id v84 = 0LL;
  group = dispatch_group_create();
  dispatch_semaphore_t v48 = dispatch_semaphore_create(0LL);
  uint64_t v73 = 0LL;
  id v74 = &v73;
  uint64_t v75 = 0x3032000000LL;
  int64_t v76 = sub_10004B8C4;
  uint64_t v77 = sub_10004B8D4;
  id v78 = 0LL;
  uint64_t v67 = 0LL;
  int v68 = &v67;
  uint64_t v69 = 0x3032000000LL;
  id v70 = sub_10004B8C4;
  id v71 = sub_10004B8D4;
  id v72 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( -[WAEngine _cachedModelObjectsMessageForGroupType:key:]( self,  "_cachedModelObjectsMessageForGroupType:key:",  4LL,  @"SWFR"));
  unsigned __int8 v9 = (void *)v74[5];
  v74[5] = v8;

  id v10 = +[WAUtil rotateUUIDsForMessage:](&OBJC_CLASS___WAUtil, "rotateUUIDsForMessage:", v74[5]);
  dispatch_semaphore_t v11 = (void *)v74[5];
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"SWFR_timestamp"]);
    objc_msgSend(v12, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    dispatch_group_enter(group);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * (void)objc_msgSend(v13, "slow_wifi_report_sent_after"));
    dpsReadWriteSerialQueue = (dispatch_queue_s *)self->_dpsReadWriteSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100066E68;
    block[3] = &unk_1000CCD80;
    dispatch_group_t v46 = group;
    dispatch_group_t v66 = v46;
    dispatch_after(v14, dpsReadWriteSerialQueue, block);

    for (unsigned int i = 0; ; unsigned int i = v18 + 1)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      unint64_t v18 = i;
      BOOL v19 = (unint64_t)objc_msgSend(v17, "slow_wifi_interrogation_sample_count") > i;

      if (!v19) {
        break;
      }
      id v20 = objc_autoreleasePoolPush();
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
      if ((_DWORD)v18)
      {
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
        int64_t v22 = 1000000 * (void)objc_msgSend(v5, "slow_wifi_duration_between_samples");
      }

      else
      {
        int64_t v22 = 0LL;
      }

      dispatch_time_t v23 = dispatch_time(0LL, v22);
      id v24 = (dispatch_queue_s *)self->_dpsReadWriteSerialQueue;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_100066F28;
      v59[3] = &unk_1000CD780;
      uint8_t v59[4] = self;
      uint64_t v64 = 4LL;
      id v60 = v51;
      int v62 = &v79;
      BOOL v25 = v21;
      __int16 v61 = v25;
      __int16 v63 = &v73;
      dispatch_after(v23, v24, v59);
      if ((_DWORD)v18) {

      }
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      BOOL v27 = (char *)objc_msgSend(v26, "slow_wifi_interrogation_sample_count") - 1 == (_BYTE *)v18;

      if (v27)
      {
        id v28 = WALogCategoryDefaultHandle();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          BOOL v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
          __int16 v89 = 1024;
          int v90 = 4899;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:slow_wifi_interrogation_sample_count hit",  buf,  0x12u);
        }
      }

      dispatch_time_t v30 = dispatch_time(0LL, 20000000000LL);
      dispatch_semaphore_wait(v25, v30);

      objc_autoreleasePoolPop(v20);
    }

    id v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_100067C78;
    v52[3] = &unk_1000CD7A8;
    void v52[4] = self;
    uint64_t v55 = &v73;
    id v53 = v51;
    id v56 = &v67;
    id v57 = &v79;
    uint64_t v58 = 4LL;
    id v32 = v48;
    NSErrorUserInfoKey v54 = v32;
    dispatch_group_notify(v46, v31, v52);

    if (a3 == 1)
    {
      dispatch_semaphore_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      dispatch_time_t v34 = dispatch_time(0, 1000000000 * (void)objc_msgSend(v33, "slow_wifi_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v32, v34);

      id v35 = WALogCategoryDefaultHandle();
      char v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      BOOL v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      __int16 v89 = 1024;
      int v90 = 4986;
      unsigned int v37 = "%{public}s::%d:unblocking is complete... returning";
    }

    else
    {
      id v38 = WALogCategoryDefaultHandle();
      char v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 136446466;
      BOOL v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      __int16 v89 = 1024;
      int v90 = 4988;
      unsigned int v37 = "%{public}s::%d:returning immediatley";
    }

    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0x12u);
  }

  else
  {
    id v42 = WALogCategoryDefaultHandle();
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      BOOL v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      __int16 v89 = 1024;
      int v90 = 4791;
      __int16 v91 = 2112;
      id v92 = @"SWFR";
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error",  buf,  0x1Cu);
    }

    NSErrorUserInfoKey v85 = NSLocalizedFailureReasonErrorKey;
    id v86 = @"WAErrorCodeNotRegistered";
    char v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
    uint64_t v44 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9009LL,  v36));
    id v45 = (void *)v68[5];
    v68[5] = v44;
  }

- (void)_triggerSlowWiFiStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v54 = 0LL;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  id v57 = sub_10004B8C4;
  uint64_t v58 = sub_10004B8D4;
  id v59 = 0LL;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  id v14 = WALogCategoryDefaultHandle();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
    *(_DWORD *)buf = 136446722;
    __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
    __int16 v62 = 1024;
    int v63 = 5006;
    __int16 v64 = 2112;
    id v65 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Got WAMessageAWD%@ ",  buf,  0x1Cu);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned int v18 = [v17 isEqualToString:@"WFAAWDSWFN"];

  if (v18)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v11 fieldForKey:@"WFAAWDSWFN_timestamp"]);
    objc_msgSend(v19, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    id v20 = WALogCategoryDefaultHandle();
    dispatch_semaphore_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL slowWiFiStudyInProgress = self->_slowWiFiStudyInProgress;
      *(_DWORD *)buf = 136446722;
      __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
      __int16 v62 = 1024;
      int v63 = 5010;
      __int16 v64 = 1024;
      LODWORD(v65) = slowWiFiStudyInProgress;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_slowWiFiStudyInProgress is %d",  buf,  0x18u);
    }

    BOOL v23 = !self->_slowWiFiStudyInProgress;
    if (!self->_slowWiFiStudyInProgress)
    {
      if (self->_dnsStudyInProgress) {
        self->_slowWiFiNotificationDuringDnsStudy = 1;
      }
      BOOL dpsStudyInProgress = self->_dpsStudyInProgress;
      id v44 = WALogCategoryDefaultHandle();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      BOOL v45 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
      if (dpsStudyInProgress)
      {
        if (!v45) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446466;
        __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v62 = 1024;
        int v63 = 5018;
        char v36 = "%{public}s::%d:Got Slow WiFi Notification when dpsStudyInProgress, exiting";
        id v38 = v35;
        os_log_type_t v39 = OS_LOG_TYPE_DEBUG;
        goto LABEL_23;
      }

      if (v45)
      {
        *(_DWORD *)buf = 136446466;
        __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v62 = 1024;
        int v63 = 5022;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Got Slow WiFi Notification when not currently in study, kicking off Study",  buf,  0x12u);
      }

      self->_BOOL slowWiFiStudyInProgress = 1;
      dispatch_group_t v46 = (void *)os_transaction_create("com.apple.wifianalytics.slowwifiStudyTransaction");
      id v47 = (void *)objc_claimAutoreleasedReturnValue( +[WAActivityManager sharedActivityManager]( &OBJC_CLASS___WAActivityManager,  "sharedActivityManager"));
      [v47 osTransactionCreate:"com.apple.wifianalytics.slowwifiStudyTransaction" transaction:v46];

      -[WAEngine setSlowwifiStudyTransaction:](self, "setSlowwifiStudyTransaction:", v46);
      peerDiagnosticsStudyQueue = (dispatch_queue_s *)self->_peerDiagnosticsStudyQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_100069250;
      v53[3] = &unk_1000CCD80;
      v53[4] = self;
      dispatch_async(peerDiagnosticsStudyQueue, v53);
    }

    id v24 = WALogCategoryDefaultHandle();
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
      __int16 v62 = 1024;
      int v63 = 5035;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding _swfnToAppend",  buf,  0x12u);
    }

    -[NSMutableArray addObject:](self->_swfnToAppend, "addObject:", v11);
  }

  else
  {
    BOOL v23 = 0;
  }

  if (self->_slowWiFiStudyInProgress)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
    unsigned int v27 = [v26 isEqualToString:@"USBEN"];

    if (v27)
    {
      id v28 = WALogCategoryDefaultHandle();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v62 = 1024;
        int v63 = 5040;
        __int16 v64 = 2112;
        id v65 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding _usbEvent %@",  buf,  0x1Cu);
      }

      -[NSMutableArray addObject:](self->_usbEventNotificationToAppend, "addObject:", v11);
    }
  }

  if (v23)
  {
    studyQueue = (dispatch_queue_s *)self->_studyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100069288;
    block[3] = &unk_1000CD7F8;
    void block[4] = self;
    id v50 = v10;
    dispatch_time_t v52 = &v54;
    id v31 = v13;
    id v51 = v31;
    dispatch_async(studyQueue, block);

    if (a3 == 1)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      dispatch_time_t v33 = dispatch_time(0, 1000000000 * (void)objc_msgSend(v32, "slow_wifi_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v31, v33);

      id v34 = WALogCategoryDefaultHandle();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v62 = 1024;
        int v63 = 5060;
        char v36 = "%{public}s::%d:unblocking is complete... returning";
LABEL_22:
        id v38 = v35;
        os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v38, v39, v36, buf, 0x12u);
      }
    }

    else
    {
      id v37 = WALogCategoryDefaultHandle();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        __int16 v62 = 1024;
        int v63 = 5062;
        char v36 = "%{public}s::%d:returning immediatley";
        goto LABEL_22;
      }
    }

- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = sub_10004B8C4;
  id v29 = sub_10004B8D4;
  id v30 = 0LL;
  if (!self->_appleCaptiveServerIP) {
    -[WAEngine resolveAppleCaptiveServer](self, "resolveAppleCaptiveServer");
  }
  dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  if ([v14 isEqualToString:@"DPSAPS"])
  {
LABEL_9:

LABEL_10:
LABEL_11:
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000696F8;
    v24[3] = &unk_1000CD820;
    void v24[5] = &v25;
    id v17 = v24;
    void v24[4] = v12;
    -[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]( self,  "_triggerDPSStudy:forProcessToken:waMessage:andReply:",  a3,  v10,  v11,  v24);
    goto LABEL_12;
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  if ([v15 isEqualToString:@"WFAAWDWADAAD"])
  {
LABEL_8:

    goto LABEL_9;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  if ([v16 isEqualToString:@"WFAAWDWAAAPI"])
  {

    goto LABEL_8;
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  unsigned __int8 v22 = [v18 isEqualToString:@"USBEN"];

  if ((v22 & 1) != 0) {
    goto LABEL_11;
  }
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
  if ([v19 isEqualToString:@"WFAAWDSWFN"])
  {
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 key]);
    unsigned int v21 = [v20 isEqualToString:@"USBEN"];

    if (!v21) {
      goto LABEL_13;
    }
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10006976C;
  v23[3] = &unk_1000CD820;
  void v23[5] = &v25;
  id v17 = v23;
  v23[4] = v12;
  -[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]( self,  "_triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:",  a3,  v10,  v11,  v23);
LABEL_12:

LABEL_13:
  (*((void (**)(id, void, uint64_t))v12 + 2))(v12, 0LL, v26[5]);
  _Block_object_dispose(&v25, 8);
}

- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessWithToken:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = WALogCategoryDefaultHandle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "getNewMessageForKey",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  *(void *)buf = 0LL;
  BOOL v23 = buf;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_10004B8C4;
  uint64_t v26 = sub_10004B8D4;
  id v27 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000699D4;
  v19[3] = &unk_1000CD7D0;
  unsigned int v21 = buf;
  id v12 = dispatch_semaphore_create(0LL);
  id v20 = v12;
  -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]( self,  "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:",  v8,  a4,  v9,  0LL,  v19);
  dispatch_time_t v13 = dispatch_time(0LL, 15000000000LL);
  dispatch_semaphore_wait(v12, v13);
  id v14 = WALogCategoryDefaultHandle();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)unsigned int v18 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "getNewMessageForKey",  (const char *)&unk_1000B76E7,  v18,  2u);
  }

  id v16 = *((id *)v23 + 5);
  _Block_object_dispose(buf, 8);

  return v16;
}

- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessWithToken:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = WALogCategoryDefaultHandle();
  dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "getNewMessageForKey withCopy",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  *(void *)buf = 0LL;
  uint64_t v25 = buf;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_10004B8C4;
  id v28 = sub_10004B8D4;
  id v29 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  id v21[2] = sub_100069C1C;
  v21[3] = &unk_1000CD7D0;
  BOOL v23 = buf;
  id v14 = dispatch_semaphore_create(0LL);
  unsigned __int8 v22 = v14;
  -[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]( self,  "_getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:",  v10,  a4,  v7,  v11,  0LL,  v21);
  dispatch_time_t v15 = dispatch_time(0LL, 15000000000LL);
  dispatch_semaphore_wait(v14, v15);
  id v16 = WALogCategoryDefaultHandle();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)id v20 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "getNewMessageForKey withCopy",  (const char *)&unk_1000B76E7,  v20,  2u);
  }

  id v18 = *((id *)v25 + 5);
  _Block_object_dispose(buf, 8);

  return v18;
}

- (void)persist
{
  engineQ = (dispatch_queue_s *)self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069CC0;
  block[3] = &unk_1000CCD80;
  void block[4] = self;
  dispatch_sync(engineQ, block);
}

- (id)_setDeviceAnalyticsConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_33;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"]);
  if (!v6)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL"]);
    if (!v6)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF"]);
      if (!v6)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF"]);
        if (!v6)
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_ROAM_SAMPLES"]);

          if (v40) {
            goto LABEL_7;
          }
LABEL_33:
          id v41 = WALogCategoryDefaultHandle();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
            __int16 v47 = 1024;
            int v48 = 5165;
            __int16 v49 = 2048;
            uint64_t v50 = 5LL;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:For grouptype: %ld invalid configuration",  buf,  0x1Cu);
          }

          NSErrorUserInfoKey v43 = NSLocalizedFailureReasonErrorKey;
          id v44 = @"WAErrorCodeLacksRequiredArgument";
          id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
          id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9010LL,  v37));
          id v32 = 0LL;
          goto LABEL_29;
        }
      }
    }
  }

LABEL_7:
  id v7 = WALogCategoryDefaultHandle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
    __int16 v47 = 1024;
    int v48 = 5167;
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Received configuration: %@",  buf,  0x1Cu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"]);
  id v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    -[WAEngine setAnalyticsProcessingTimeIntervalSecs:](self, "setAnalyticsProcessingTimeIntervalSecs:");
    id v11 = WALogCategoryDefaultHandle();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
      *(_DWORD *)buf = 136446722;
      dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v47 = 1024;
      int v48 = 5171;
      __int16 v49 = 2048;
      uint64_t v50 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Updated analyticsProcessingTimeInterval to %2.2f seconds",  buf,  0x1Cu);
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL"]);

  if (v14)
  {
    [v14 doubleValue];
    -[WAEngine setAnalyticsAgeOutTimeIntervalSecs:](self, "setAnalyticsAgeOutTimeIntervalSecs:");
    id v15 = WALogCategoryDefaultHandle();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[WAEngine analyticsAgeOutTimeIntervalSecs](self, "analyticsAgeOutTimeIntervalSecs");
      *(_DWORD *)buf = 136446722;
      dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v47 = 1024;
      int v48 = 5177;
      __int16 v49 = 2048;
      uint64_t v50 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Updated analyticsAgeOutTimeInterval to %2.2f seconds",  buf,  0x1Cu);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF"]);

  if (v18)
  {
    id v19 = [v18 unsignedLongValue];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
    [v20 setTestDateDiffDays:v19];

    id v21 = WALogCategoryDefaultHandle();
    unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
      id v24 = [v23 testDateDiffDays];
      *(_DWORD *)buf = 136446722;
      dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v47 = 1024;
      int v48 = 5183;
      __int16 v49 = 2048;
      uint64_t v50 = (uint64_t)v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Updated testDateDiffDays to %lu days",  buf,  0x1Cu);
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF"]);

  if (v25)
  {
    id v26 = [v25 unsignedLongValue];
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
    [v27 setDeploymentMetricDiffDays:v26];

    id v28 = WALogCategoryDefaultHandle();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
      id v31 = [v30 deploymentMetricDiffDays];
      *(_DWORD *)buf = 136446722;
      dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      __int16 v47 = 1024;
      int v48 = 5189;
      __int16 v49 = 2048;
      uint64_t v50 = (uint64_t)v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Updated deploymentMetricDiffDays to %lu days",  buf,  0x1Cu);
    }
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WA_DEVICE_ANALYTICS_CONFIG_ROAM_SAMPLES"]);

  if (!v32)
  {
    id v38 = 0LL;
    goto LABEL_31;
  }

  id v33 = WALogCategoryDefaultHandle();
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    id v35 = [v32 unsignedLongValue];
    *(_DWORD *)buf = 136446722;
    dispatch_group_t v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
    __int16 v47 = 1024;
    int v48 = 5194;
    __int16 v49 = 2048;
    uint64_t v50 = (uint64_t)v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Roam Samples %lu ", buf, 0x1Cu);
  }

  id v36 = [v32 unsignedLongValue];
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  [v37 setNumRoamSamples:v36];
  id v38 = 0LL;
LABEL_29:

LABEL_31:
  return v38;
}

- (id)_getDeviceAnalyticsConfiguration
{
  v11[0] = @"WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL";
  -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12[0] = v3;
  v11[1] = @"WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL";
  -[WAEngine analyticsAgeOutTimeIntervalSecs](self, "analyticsAgeOutTimeIntervalSecs");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12[1] = v4;
  v11[2] = @"WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 testDateDiffDays]));
  v12[2] = v6;
  v11[3] = @"WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 deploymentMetricDiffDays]));
  v12[3] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));

  return v9;
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
}

- (void)setValueForKeyToUserDefaults:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v9 = WALogCategoryDefaultHandle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      id v11 = "-[WAEngine setValueForKeyToUserDefaults:forKey:]";
      __int16 v12 = 1024;
      int v13 = 5222;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:key is nil",  (uint8_t *)&v10,  0x12u);
    }

    goto LABEL_4;
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  if (v7)
  {
    id v8 = v7;
    -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v5, v6);
    -[os_log_s synchronize](v8, "synchronize");
LABEL_4:
  }
}

- (id)getValueForKeyFromUserDefaults:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:v3]);
  }

  else
  {
    id v7 = WALogCategoryDefaultHandle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446466;
      int v10 = "-[WAEngine getValueForKeyFromUserDefaults:]";
      __int16 v11 = 1024;
      int v12 = 5237;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:key is nil",  (uint8_t *)&v9,  0x12u);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (void)storeWAMessageToDB:(id)a3
{
  id v4 = a3;
  if (!-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    id v15 = WALogCategoryDefaultHandle();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136446466;
    unsigned __int8 v22 = "-[WAEngine storeWAMessageToDB:]";
    __int16 v23 = 1024;
    int v24 = 5247;
    id v16 = "%{public}s::%d:AnalyticsProcessor not ready";
    uint64_t v17 = v9;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x12u);
    goto LABEL_6;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

  if (!v5)
  {
    id v19 = WALogCategoryDefaultHandle();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136446466;
    unsigned __int8 v22 = "-[WAEngine storeWAMessageToDB:]";
    __int16 v23 = 1024;
    int v24 = 5248;
    id v16 = "%{public}s::%d:analyticsProcessor nil";
    uint64_t v17 = v9;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }

  id v6 = WALogCategoryDeviceStoreHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "storeWAMessageToDB",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  engineQ = (dispatch_queue_s *)self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A90C;
  block[3] = &unk_1000CCD80;
  void block[4] = self;
  dispatch_sync(engineQ, block);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 metricName]);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 metricInfo]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kWAMessageValue]);
  -[os_log_s processWAMessageMetric:data:](v9, "processWAMessageMetric:data:", v10, v12);

LABEL_6:
  id v13 = WALogCategoryDeviceStoreHandle();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "storeWAMessageToDB",  (const char *)&unk_1000B76E7,  buf,  2u);
  }
}

- (void)processMetricDictOffEngine:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_engineQ);
  engineQ = (dispatch_queue_s *)self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A9E4;
  block[3] = &unk_1000CD6B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(engineQ, block);
}

- (void)processMetricDictOnEngine:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_engineQ);
  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "processMetricDictOnEngine",  (const char *)&unk_1000B76E7,  (uint8_t *)&v19,  2u);
  }

  if (-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

    if (v10)
    {
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"AnalyticsProcessor: Process Metric",  self->_cachedUsage,  self->_engineQ);
      -[AnalyticsProcessor processWAMessageMetric:data:]( self->_analyticsProcessor,  "processWAMessageMetric:data:",  v6,  v7);
      goto LABEL_6;
    }

    id v18 = WALogCategoryDefaultHandle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446466;
      id v20 = "-[WAEngine processMetricDictOnEngine:data:]";
      __int16 v21 = 1024;
      int v22 = 5284;
      id v15 = "%{public}s::%d:AnalyticsProcessor nil";
      id v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
  }

  else
  {
    id v13 = WALogCategoryDefaultHandle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136446466;
      id v20 = "-[WAEngine processMetricDictOnEngine:data:]";
      __int16 v21 = 1024;
      int v22 = 5283;
      id v15 = "%{public}s::%d:AnalyticsProcessor not ready";
      id v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v19, 0x12u);
    }
  }

LABEL_6:
  id v11 = WALogCategoryDefaultHandle();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "processMetricDictOnEngine",  (const char *)&unk_1000B76E7,  (uint8_t *)&v19,  2u);
  }
}

- (id)_summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAEngine fileHandlingQ](self, "fileHandlingQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006AD04;
  block[3] = &unk_1000CCD80;
  void block[4] = self;
  dispatch_sync(v7, block);

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"AnalyticsProcessor: Summarize Analytics For Network",  self->_cachedUsage,  self->_engineQ);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 summarizeAnalyticsForNetwork:v6 maxAgeInDays:a4]);

  return v9;
}

- (void)processWiFiAnalyticsManagedFault:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metricInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kWAMessageKeyFaultName]);
  uint64_t v7 = kWAMessageValue;
  id v8 = (char *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kWAMessageValue]);

  id v9 = WALogCategoryDefaultHandle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    __int16 v42 = 1024;
    int v43 = 5313;
    __int16 v44 = 2112;
    BOOL v45 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:processWiFiAnalyticsManagedFault: FaultName %@",  buf,  0x1Cu);
  }

  if (!-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    id v34 = WALogCategoryDefaultHandle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    __int16 v42 = 1024;
    int v43 = 5316;
    id v35 = "%{public}s::%d:AnalyticsProcessor not ready";
    id v36 = v14;
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, 0x12u);
    goto LABEL_30;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

  id v12 = WALogCategoryDefaultHandle();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (!v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    __int16 v42 = 1024;
    int v43 = 5317;
    id v35 = "%{public}s::%d:analyticsProcessor nil";
    id v36 = v14;
    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
    goto LABEL_37;
  }

  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "processWiFiAnalyticsManagedFault",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Operation: Forwarded Fault",  self->_cachedUsage,  self->_engineQ);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[WAEngine getW5Client](self, "getW5Client"));
  if (v14)
  {
    if ([v8 containsString:@"FaultReasonSiriTimedOut"])
    {
      uint64_t v15 = 3LL;
    }

    else if ([v8 containsString:@"FaultReasonAirplayRealtimeAudioUnderrun"])
    {
      uint64_t v15 = 1LL;
    }

    else if ([v8 containsString:@"FaultReasonAirplayBufferedAudioUnderrun"])
    {
      uint64_t v15 = 2LL;
    }

    else if ([v8 containsString:@"FaultReasonHomeKitFault"])
    {
      uint64_t v15 = 4LL;
    }

    else if ([v8 containsString:@"FaultReasonAirplayConnectionStall"])
    {
      uint64_t v15 = 6LL;
    }

    else
    {
      id v16 = WALogCategoryDefaultHandle();
      os_log_type_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
        __int16 v42 = 1024;
        int v43 = 5345;
        __int16 v44 = 2112;
        BOOL v45 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:processWiFiAnalyticsManagedFault: Unhnandled FaultName %@",  buf,  0x1Cu);
      }

      id v18 = WALogCategoryDefaultHandle();
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v8;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "processWiFiAnalyticsManagedFault: Unhnandled FaultName %@",  buf,  0xCu);
      }

      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }

    id v20 = objc_alloc_init(&OBJC_CLASS___W5Event);
    [v20 setEventID:38];
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 metricInfo]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kWAMessageKeyFaultDate]);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v7]);
    [v23 timeIntervalSinceReferenceDate];
    objc_msgSend(v20, "setTimestamp:");

    int v48 = @"FaultType";
    int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
    __int16 v49 = v24;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    [v20 setInfo:v25];

    id v39 = 0LL;
    -[os_log_s submitFaultEvent:error:](v14, "submitFaultEvent:error:", v20, &v39);
    id v26 = v39;
    id v27 = WALogCategoryDefaultHandle();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = v28;
    if (v26)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v30 = objc_claimAutoreleasedReturnValue([v26 description]);
        id v31 = (char *)[v30 UTF8String];
        *(_DWORD *)buf = 136446722;
        id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
        __int16 v42 = 1024;
        int v43 = 5357;
        __int16 v44 = 2080;
        BOOL v45 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:[W5Client submitFaultEvent:error:] failed, (error=%s)",  buf,  0x1Cu);
      }
    }

    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
      __int16 v42 = 1024;
      int v43 = 5359;
      __int16 v44 = 2112;
      BOOL v45 = v8;
      __int16 v46 = 2112;
      id v47 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:[W5Client submitFaultEvent:error:] FaultName: %@ FaultEventDescription %@",  buf,  0x26u);
    }
  }

  else
  {
    id v38 = WALogCategoryDefaultHandle();
    id v26 = (id)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
      __int16 v42 = 1024;
      int v43 = 5329;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unable to create velocity client",  buf,  0x12u);
    }
  }

LABEL_30:
  id v32 = WALogCategoryDefaultHandle();
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "processWiFiAnalyticsManagedFault",  (const char *)&unk_1000B76E7,  buf,  2u);
  }
}

- (BOOL)canProcessWiFiAnalyticsMessageJSONFiles:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    LOBYTE(v6) = 0;
    goto LABEL_20;
  }

  -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
  if (v5 != 0.0
    && (+[WAUtil shouldProcessAnalyticsImmediately]( &OBJC_CLASS___WAUtil,  "shouldProcessAnalyticsImmediately") & 1) == 0)
  {
    if ((unint64_t)[v4 count] >= 0x32)
    {
      id v7 = WALogCategoryDeviceStoreHandle();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 136446466;
        id v20 = "-[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:]";
        __int16 v21 = 1024;
        int v22 = 5389;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Unprocessed file count crossed the threshold. Should process them.",  (uint8_t *)&v19,  0x12u);
      }

      LOBYTE(v6) = 1;
LABEL_19:

      goto LABEL_20;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[WAEngine getValueForKeyFromUserDefaults:]( self,  "getValueForKeyFromUserDefaults:",  @"WA_LAST_JSON_PROCESSED_DATE"));
    double v11 = 0.0;
    if (v10 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
    {
      id v8 = v10;
      [v9 timeIntervalSinceDate:v8];
      double v11 = v13;
      -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
      if (v11 < v14)
      {
        BOOL v6 = 0;
LABEL_16:
        id v15 = WALogCategoryDeviceStoreHandle();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
          int v19 = 136447746;
          id v20 = "-[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:]";
          __int16 v21 = 1024;
          int v22 = 5413;
          __int16 v23 = 1024;
          BOOL v24 = v6;
          __int16 v25 = 2112;
          id v26 = v8;
          __int16 v27 = 2048;
          double v28 = v11;
          __int16 v29 = 2048;
          uint64_t v30 = v17;
          __int16 v31 = 2048;
          id v32 = [v4 count];
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:canProcess: %d lastProcessedDate: %@ secondsBetween:%2.2f interval:%2.2f pendingJSONs:%lu",  (uint8_t *)&v19,  0x40u);
        }

        goto LABEL_19;
      }
    }

    else
    {
      id v8 = 0LL;
    }

    -[WAEngine setValueForKeyToUserDefaults:forKey:]( self,  "setValueForKeyToUserDefaults:forKey:",  v9,  @"WA_LAST_JSON_PROCESSED_DATE");
    BOOL v6 = 1;
    goto LABEL_16;
  }

  LOBYTE(v6) = 1;
LABEL_20:

  return v6;
}

- (void)processWiFiAnalyticsMessageJSONFilesInTmpDir:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    id v68 = WALogCategoryDefaultHandle();
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v98 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
      __int16 v99 = 1024;
      int v100 = 5426;
      uint64_t v69 = "%{public}s::%d:AnalyticsProcessor not ready";
      id v70 = v65;
      os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
      uint32_t v72 = 18;
LABEL_79:
      _os_log_impl((void *)&_mh_execute_header, v70, v71, v69, buf, v72);
    }

- (void)processWiFiAnalyticsMessageWAMFile:(id)a3 file:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WALogCategoryDeviceStoreHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "processWiFiAnalyticsMessageWAMFile",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v10, "setDateFormat:", @"yyyy'-'MM'-'dd-HHmmssSSS");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", objc_msgSend(@"wifianalytics_", "length")));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", objc_msgSend(@"yyyy-MM-dd-HHmmssSSS", "length")));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v10, "dateFromString:", v12));

  double v14 = objc_autoreleasePoolPush();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6));
  id v16 = v15;
  if (v15)
  {
    engineQ = (dispatch_queue_s *)self->_engineQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006C8C0;
    block[3] = &unk_1000CD6B8;
    void block[4] = self;
    id v23 = v15;
    id v24 = v13;
    dispatch_async(engineQ, block);
  }

  else
  {
    id v18 = WALogCategoryDeviceStoreHandle();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v26 = "-[WAEngine processWiFiAnalyticsMessageWAMFile:file:]";
      __int16 v27 = 1024;
      int v28 = 5550;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to dataWithContentsOfFile",  buf,  0x12u);
    }
  }

  objc_autoreleasePoolPop(v14);
  id v20 = WALogCategoryDeviceStoreHandle();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "processWiFiAnalyticsMessageWAMFile",  (const char *)&unk_1000B76E7,  buf,  2u);
  }
}

- (void)clearDnsStudyVariables
{
  *(_WORD *)&self->_isAWDLActivitySuspected = 256;
  *(_DWORD *)&self->_isCaptiveServerIPResolved = 256;
  self->_isPingEnqueueFailing = 0;
  *(_OWORD *)&self->_cumulativeAverageCcaSinceStudyStart = 0u;
  *(_OWORD *)&self->_totalLANPingSuccessBeforeTrap = 0u;
  *(_OWORD *)&self->_totalWANPingSuccessBeforeTrap = 0u;
  *(_OWORD *)&self->_totalLANPingSuccessAfterTrap = 0u;
  *(_OWORD *)&self->_totalWANPingSuccessAfterTrap = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
  id v4 = objc_msgSend(v3, "dns_symptoms_interrogation_sample_count");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
  self->_numNetScoreBelowThresholdAfterTrap = v4 - (_BYTE *)objc_msgSend(v5, "dns_symptoms_trap_evaluated_at_sample");

  *(_OWORD *)&self->_impactedServersAtStudyStart = 0u;
  *(_OWORD *)&self->_stallscoreAtStudyEnd = 0u;
  *(_OWORD *)&self->_numRemoteDnsServers = 0u;
  *(_OWORD *)&self->_netscoreAtStudyStart = 0u;
  *(_OWORD *)&self->_totalDnsServers = 0u;
  *(_OWORD *)&self->_numIPv6DnsServers = 0u;
  *(_OWORD *)&self->_numDataStallScoreBelowThresholdBeforeTrap = 0u;
}

- (id)__ipv4SetupConfig
{
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  v3,  kSCEntNetIPv4)) != 0LL)
  {
    double v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }

    else
    {
      id v8 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)__IPv4StateConfig
{
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v3,  kSCEntNetIPv4)) != 0LL)
  {
    double v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }

    else
    {
      id v8 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)__IPv6StateConfig
{
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v3,  kSCEntNetIPv6)) != 0LL)
  {
    double v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }

    else
    {
      id v8 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)__dnsStateConfig
{
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v3,  kSCEntNetDNS)) != 0LL)
  {
    double v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }

    else
    {
      id v8 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)__dnsSetupConfig
{
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainSetup,  v3,  kSCEntNetDNS)) != 0LL)
  {
    double v5 = NetworkServiceEntity;
    id v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 copy];
      CFRelease(v7);
    }

    else
    {
      id v8 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)isUsingCustomDNSSettings
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dnsStudyQueue = (dispatch_queue_s *)self->_dnsStudyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10006CE8C;
  v5[3] = &unk_1000CD848;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dnsStudyQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)fetchConfiguredDnsInfo
{
  uint64_t v92 = 0LL;
  uint64_t v93 = 0LL;
  uint64_t v65 = 0LL;
  id v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  id v68 = sub_10004B8C4;
  uint64_t v69 = sub_10004B8D4;
  id v70 = 0LL;
  if (-[WAEngine isUsingCustomDNSSettings](self, "isUsingCustomDNSSettings"))
  {
    self->_dnsServerConfigType = 2LL;
    char v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine __dnsSetupConfig](self, "__dnsSetupConfig"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kSCPropNetDNSServerAddresses]);
    double v5 = (void *)v66[5];
    v66[5] = v4;
  }

  else
  {
    self->_dnsServerConfigType = 1LL;
  }

  dnsStudyQueue = (dispatch_queue_s *)self->_dnsStudyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006D870;
  block[3] = &unk_1000CCF20;
  void block[4] = self;
  void block[5] = &v65;
  dispatch_sync(dnsStudyQueue, block);
  id v7 = (void *)v66[5];
  if (v7) {
    uint64_t v8 = (char *)[v7 count];
  }
  else {
    uint64_t v8 = 0LL;
  }
  unsigned int v53 = -[WAEngine getIPv4InterfaceSubnet](self, "getIPv4InterfaceSubnet");
  unsigned int v52 = -[WAEngine getIPv4InterfaceNetwork:](self, "getIPv4InterfaceNetwork:", v53);
  uint64_t v9 = -[WAEngine getIPv6InterfacePrefix](self, "getIPv6InterfacePrefix");
  -[WAEngine getIPv6InterfaceNetwork:prefixLength:](self, "getIPv6InterfaceNetwork:prefixLength:", &v92, v9);
  unsigned int v51 = v9;
  uint64_t v50 = v8;
  uint64_t v58 = self;
  id v10 = WALogCategoryDefaultHandle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5797;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = v52;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: interface IPv4 Network: %08x",  buf,  0x18u);
  }

  id v12 = WALogCategoryDefaultHandle();
  double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5798;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = v92;
    *(_WORD *)&_BYTE buf[24] = 1024;
    *(_DWORD *)&buf[26] = HIDWORD(v92);
    *(_WORD *)&buf[30] = 1024;
    *(_DWORD *)&buf[32] = v93;
    *(_WORD *)&buf[36] = 1024;
    *(_DWORD *)&buf[38] = HIDWORD(v93);
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: interface IPv6 Network: %08x %08x %08x %08x",  buf,  0x2Au);
  }

  id v14 = WALogCategoryDefaultHandle();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v66[5];
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5799;
    *(_WORD *)&_BYTE buf[18] = 2112;
    *(void *)&buf[20] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: dnsServers: %@",  buf,  0x1Cu);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = (id)v66[5];
  id v17 = [obj countByEnumeratingWithState:&v60 objects:v91 count:16];
  if (v17)
  {
    char v54 = 0;
    unint64_t v55 = 0LL;
    unint64_t v56 = 0LL;
    unint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = *(void *)v61;
    *(void *)&__int128 v18 = 136447490LL;
    __int128 v49 = v18;
    for (uint64_t i = *(void *)v61; ; uint64_t i = *(void *)v61)
    {
      if (i != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v60 + 1) + 8 * v20);
      if (-[WAEngine isIPv4Address:](v58, "isIPv4Address:", v23, v49))
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 componentsSeparatedByString:@"."]);
        *(_DWORD *)id v78 = 0;
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);
        if ([v25 integerValue] == (id)127)
        {

          goto LABEL_20;
        }

        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);
        if ([v29 integerValue] == (id)169)
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:1]);
          BOOL v31 = [v30 integerValue] == (id)254;

          if (!v31) {
            goto LABEL_36;
          }
LABEL_20:
          ++v19;
          char v54 = 1;
        }

        else
        {

LABEL_36:
          if (inet_aton((const char *)[v23 UTF8String], (in_addr *)v78))
          {
            unsigned int v32 = bswap32(*(unsigned int *)v78);
            id v33 = WALogCategoryDefaultHandle();
            id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 5813;
              *(_WORD *)&_BYTE buf[18] = 1024;
              *(_DWORD *)&buf[20] = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: IPv4 DNS address:%08x",  buf,  0x18u);
            }

            BOOL v35 = v32 - 1 < 0xFFFFFFFE;
            int v36 = v32 & v53;
            id v37 = WALogCategoryDefaultHandle();
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 5820;
              *(_WORD *)&_BYTE buf[18] = 1024;
              *(_DWORD *)&buf[20] = v36;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: IPv4 DNS network:%08x",  buf,  0x18u);
            }

            v54 |= v35;
            if (v36 == v52) {
              ++v19;
            }
          }
        }

        ++v55;
        goto LABEL_59;
      }

      int8x16_t v90 = 0uLL;
      int8x16_t v59 = 0uLL;
      memset(buf, 0, 47);
      if (([v23 getCString:buf maxLength:47 encoding:4] & 1) == 0)
      {
        id v27 = WALogCategoryDefaultHandle();
        int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v78 = 136446466;
          uint64_t v79 = "-[WAEngine fetchConfiguredDnsInfo]";
          __int16 v80 = 1024;
          int v81 = 5835;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:DNS-config: encoding failed!",  v78,  0x12u);
        }

        goto LABEL_58;
      }

      if (inet_pton(30, buf, &v59))
      {
        if (v59.u8[0] == 254 && (v59.u8[1] > 0xBFu || (v59.i8[1] & 0xC0) == 0x80)
          || (__int32 v26 = v59.i32[0] | v59.i32[1] | v59.i32[2]) == 0 && v59.i32[3] == 0x1000000)
        {
          ++v19;
        }

        else
        {
          if (v59.i32[3]) {
            BOOL v39 = 0;
          }
          else {
            BOOL v39 = v26 == 0;
          }
          if (v39) {
            goto LABEL_58;
          }
          int8x16_t v90 = vrev32q_s8(v59);
          id v40 = WALogCategoryDefaultHandle();
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v78 = v49;
            uint64_t v79 = "-[WAEngine fetchConfiguredDnsInfo]";
            __int16 v80 = 1024;
            int v81 = 5852;
            __int16 v82 = 1024;
            __int32 v83 = v90.i32[0];
            __int16 v84 = 1024;
            __int32 v85 = v90.i32[1];
            __int16 v86 = 1024;
            __int32 v87 = v90.i32[2];
            __int16 v88 = 1024;
            __int32 v89 = v90.i32[3];
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: IPv6 DNS address:%08x %08x %08x %08x",  v78,  0x2Au);
          }

          -[WAEngine convertToIPv6Network:prefixLength:](v58, "convertToIPv6Network:prefixLength:", &v90, v51);
          id v42 = WALogCategoryDefaultHandle();
          int v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v78 = v49;
            uint64_t v79 = "-[WAEngine fetchConfiguredDnsInfo]";
            __int16 v80 = 1024;
            int v81 = 5854;
            __int16 v82 = 1024;
            __int32 v83 = v90.i32[0];
            __int16 v84 = 1024;
            __int32 v85 = v90.i32[1];
            __int16 v86 = 1024;
            __int32 v87 = v90.i32[2];
            __int16 v88 = 1024;
            __int32 v89 = v90.i32[3];
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: IPv6 DNS network:%08x %08x %08x %08x",  v78,  0x2Au);
          }

          if (v90.i64[0] == v92 && v90.i64[1] == v93) {
            ++v19;
          }
        }

        char v54 = 1;
      }

- (unsigned)getIPv4InterfaceSubnet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine IPv4SubnetMasks](self, "IPv4SubnetMasks"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  uint64_t v4 = v3;
  if (v3)
  {
    v10.s_addr = 0;
    if (inet_aton((const char *)[v3 UTF8String], &v10))
    {
      unsigned int v5 = bswap32(v10.s_addr);
      id v6 = WALogCategoryDefaultHandle();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        id v12 = "-[WAEngine getIPv4InterfaceSubnet]";
        __int16 v13 = 1024;
        int v14 = 5884;
        __int16 v15 = 1024;
        unsigned int v16 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: interface IPv4 subnet: %08x",  buf,  0x18u);
      }
    }

    else
    {
      id v8 = WALogCategoryDefaultHandle();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v12 = "-[WAEngine getIPv4InterfaceSubnet]";
        __int16 v13 = 1024;
        int v14 = 5886;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:DNS-config: interface IPv4 subnet: invalid conversion logic",  buf,  0x12u);
      }

      unsigned int v5 = 0;
    }
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unsigned)getIPv4InterfaceNetwork:(unsigned int)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface IPv4Addresses](self->_corewifi, "IPv4Addresses"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = v5;
  if (v5)
  {
    v12.s_addr = 0;
    if (inet_aton((const char *)[v5 UTF8String], &v12))
    {
      unsigned int v7 = bswap32(v12.s_addr);
      id v8 = WALogCategoryDefaultHandle();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        int v14 = "-[WAEngine getIPv4InterfaceNetwork:]";
        __int16 v15 = 1024;
        int v16 = 5901;
        __int16 v17 = 1024;
        unsigned int v18 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: interface IPv4 Address: %08x",  buf,  0x18u);
      }
    }

    else
    {
      id v10 = WALogCategoryDefaultHandle();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        int v14 = "-[WAEngine getIPv4InterfaceNetwork:]";
        __int16 v15 = 1024;
        int v16 = 5903;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:DNS-config: interface IPv4 Address: invalid conversion logic",  buf,  0x12u);
      }

      unsigned int v7 = 0;
    }
  }

  else
  {
    unsigned int v7 = 0;
  }

  return v7 & a3;
}

- (unsigned)getIPv6InterfacePrefix
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine IPv6PrefixLengths](self, "IPv6PrefixLengths"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 unsignedIntValue];
    id v6 = WALogCategoryDefaultHandle();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446722;
      id v10 = "-[WAEngine getIPv6InterfacePrefix]";
      __int16 v11 = 1024;
      int v12 = 5915;
      __int16 v13 = 1024;
      unsigned int v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNS-config: interface IPv6 prefix length: %u",  (uint8_t *)&v9,  0x18u);
    }
  }

  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (void)getIPv6InterfaceNetwork:(unsigned int *)a3 prefixLength:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface IPv6Addresses](self->_corewifi, "IPv6Addresses"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  int v9 = v8;
  if (v8)
  {
    *(void *)a3 = 0LL;
    *((void *)a3 + 1) = 0LL;
    int8x16_t v23 = 0uLL;
    memset(v36, 0, 47);
    if ([v8 getCString:v36 maxLength:47 encoding:4])
    {
      if (!inet_pton(30, (const char *)v36, &v23))
      {
LABEL_10:
        -[WAEngine convertToIPv6Network:prefixLength:](self, "convertToIPv6Network:prefixLength:", a3, v4);
        goto LABEL_11;
      }

      *(int8x16_t *)a3 = vrev32q_s8(v23);
      id v10 = WALogCategoryDefaultHandle();
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = *a3;
        unsigned int v13 = a3[1];
        unsigned int v14 = a3[2];
        unsigned int v15 = a3[3];
        *(_DWORD *)buf = 136447490;
        __int16 v25 = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
        __int16 v26 = 1024;
        int v27 = 5938;
        __int16 v28 = 1024;
        unsigned int v29 = v12;
        __int16 v30 = 1024;
        unsigned int v31 = v13;
        __int16 v32 = 1024;
        unsigned int v33 = v14;
        __int16 v34 = 1024;
        unsigned int v35 = v15;
        int v16 = "%{public}s::%d:DNS-config: interface IPv6 Address:%08x %08x %08x %08x";
        __int16 v17 = v11;
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        uint32_t v19 = 42;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
      }
    }

    else
    {
      id v20 = WALogCategoryDefaultHandle();
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v25 = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
        __int16 v26 = 1024;
        int v27 = 5933;
        int v16 = "%{public}s::%d:DNS-config: encoding failed!";
        __int16 v17 = v11;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 18;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }

  id v21 = WALogCategoryDefaultHandle();
  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int v36 = 136446466;
    *(void *)&v36[4] = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
    *(_WORD *)&v36[12] = 1024;
    *(_DWORD *)&v36[14] = 5926;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:DNS-config: No IPv6 address found",  v36,  0x12u);
  }

LABEL_11:
}

- (void)convertToIPv6Network:(unsigned int *)a3 prefixLength:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 3LL;
    do
    {
      if (a4 <= 0x1F)
      {
        unsigned int v5 = a3[v4];
        if (v5)
        {
          unsigned int v6 = a4;
          do
          {
            unsigned int v7 = v5;
            v5 >>= 1;
            a4 = v6 - 1;
            if (v7 < 2) {
              break;
            }
            --v6;
          }

          while (v6);
        }
      }

      else
      {
        unsigned int v5 = 0;
        a4 -= 32;
      }

      a3[v4] = v5;
      BOOL v8 = v4-- != 0;
    }

    while (v8 && a4);
  }

- (BOOL)isIPv4Address:(id)a3
{
  return [a3 rangeOfString:@"."] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)IPv4SubnetMasks
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine __IPv4StateConfig](self, "__IPv4StateConfig"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSCPropNetIPv4SubnetMasks]);

  return v3;
}

- (id)IPv6PrefixLengths
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine __IPv6StateConfig](self, "__IPv6StateConfig"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSCPropNetIPv6PrefixLength]);

  return v3;
}

- (void)triggerPeerDiscovery
{
  if (!-[WAEngine isWiFiAssociatedToNetwork](self, "isWiFiAssociatedToNetwork"))
  {
    id v9 = WALogCategoryDefaultHandle();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v12 = "-[WAEngine triggerPeerDiscovery]";
      __int16 v13 = 1024;
      int v14 = 5979;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WiFi disassocited during study so not continuing...",  buf,  0x12u);
    }

    goto LABEL_6;
  }

  id v2 = sub_100066590();
  if (objc_opt_class(v2))
  {
    id v3 = sub_100043C9C();
    if (objc_opt_class(v3))
    {
      uint64_t v4 = (os_log_s *)objc_alloc_init((Class)sub_100043C9C());
      if (v4)
      {
        id v5 = [sub_100066590() requestWithTestID:62 configuration:0];
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
        id v10 = v6;
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

        id v8 =  -[os_log_s runDiagnostics:configuration:update:reply:]( v4,  "runDiagnostics:configuration:update:reply:",  v7,  0LL,  0LL,  &stru_1000CD888);
      }

- (void)gatherDiscoveredPeerInfo:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v48 = dispatch_semaphore_create(0LL);
  uint64_t v59 = 0LL;
  __int128 v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  __int128 v62 = sub_10004B8C4;
  __int128 v63 = sub_10004B8D4;
  id v64 = 0LL;
  uint64_t v53 = 0LL;
  char v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  unint64_t v56 = sub_10004B8C4;
  id v57 = sub_10004B8D4;
  id v58 = 0LL;
  if (!-[WAEngine isWiFiAssociatedToNetwork](self, "isWiFiAssociatedToNetwork"))
  {
    id v47 = WALogCategoryDefaultHandle();
    uint32_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
      __int16 v67 = 1024;
      int v68 = 6007;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WiFi disassocited during study so not continuing...",  buf,  0x12u);
    }

    goto LABEL_36;
  }

  id v5 = sub_100066590();
  if (objc_opt_class(v5))
  {
    id v6 = sub_100043C9C();
    if (objc_opt_class(v6))
    {
      id v7 = objc_alloc_init((Class)sub_100043C9C());
      if (v7)
      {
        id v8 = [sub_100066590() requestWithTestID:61 configuration:0];
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        unint64_t v75 = v9;
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));

        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_10006E9F8;
        v49[3] = &unk_1000CD6E0;
        unsigned int v51 = &v59;
        unsigned int v52 = &v53;
        __int16 v11 = v48;
        uint64_t v50 = v11;
        id v12 = [v7 runDiagnostics:v10 configuration:0 update:0 reply:v49];
        dispatch_time_t v13 = dispatch_time(0LL, 5000000000LL);
        dispatch_semaphore_wait(v11, v13);
        if (!v60[5])
        {
          id v14 = WALogCategoryDefaultHandle();
          unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = (os_log_s *)v54[5];
            *(_DWORD *)buf = 136446722;
            id v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
            __int16 v67 = 1024;
            int v68 = 6021;
            __int16 v69 = 2112;
            id v70 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:PeerDiscovery: Data collection failed with err:%@",  buf,  0x1Cu);
          }
        }
      }
    }
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v60[5] firstObject]);
  os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 info]);
  uint32_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"PeerDevicesInfo"]);

  id v20 = WALogCategoryDefaultHandle();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
    __int16 v67 = 1024;
    int v68 = 6026;
    __int16 v69 = 2112;
    id v70 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiscovery: parsed result:%@",  buf,  0x1Cu);
  }

  if (v19)
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    int8x16_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](v19, "allKeys"));
    if ([v23 containsObject:@"Timestamp"])
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForKey:](v19, "valueForKey:", @"Timestamp"));

      if (v24)
      {
        [v22 timeIntervalSinceDate:v24];
        uint64_t v26 = (int)(v25 / 60.0);
LABEL_19:
        id v27 = WALogCategoryDefaultHandle();
        __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136447234;
          id v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
          __int16 v67 = 1024;
          int v68 = 6035;
          __int16 v69 = 2112;
          id v70 = (os_log_s *)v22;
          __int16 v71 = 2112;
          __int16 v72 = v24;
          __int16 v73 = 2048;
          uint64_t v74 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiscovery: current_time:%@ update_time:%@ minutesBetweenDates:%ld",  buf,  0x30u);
        }

        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
        BOOL v30 = v26 < (int)((unint64_t)objc_msgSend(v29, "dps_report_sent_after") / 0x3C);

        if (v30)
        {
          unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](v19, "allKeys"));
          if ([v31 containsObject:@"numberOfIOSDevices"])
          {
            __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForKey:](v19, "valueForKey:", @"numberOfIOSDevices"));
            id v33 = [v32 unsignedIntValue];
          }

          else
          {
            id v33 = 0LL;
          }

          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](v19, "allKeys"));
          if ([v34 containsObject:@"numberOfMacOSDevices"])
          {
            unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForKey:](v19, "valueForKey:", @"numberOfMacOSDevices"));
            id v36 = [v35 unsignedIntValue];
          }

          else
          {
            id v36 = 0LL;
          }

          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](v19, "allKeys"));
          if ([v37 containsObject:@"numberOfTVOSDevices"])
          {
            id v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForKey:](v19, "valueForKey:", @"numberOfTVOSDevices"));
            id v39 = [v38 unsignedIntValue];
          }

          else
          {
            id v39 = 0LL;
          }

          id v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allKeys](v19, "allKeys"));
          if ([v40 containsObject:@"numberOfWatchOSDevices"])
          {
            id v41 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s valueForKey:](v19, "valueForKey:", @"numberOfTVOSDevices"));
            unsigned int v42 = [v41 unsignedIntValue];
          }

          else
          {
            unsigned int v42 = 0;
          }

          int v43 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"WFAAWDWAPDI_numPeersDiscovered"]);
          [v43 setUint32Value:(_DWORD)v36 + (_DWORD)v33 + v39 + v42];

          id v44 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"WFAAWDWAPDI_iOSPeers"]);
          [v44 setUint32Value:v33];

          id v45 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"WFAAWDWAPDI_tvOSPeers"]);
          [v45 setUint32Value:v39];

          id v46 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"WFAAWDWAPDI_macOSPeers"]);
          [v46 setUint32Value:v36];
        }

LABEL_36:
        goto LABEL_37;
      }
    }

    else
    {

      id v24 = 0LL;
    }

    uint64_t v26 = 0x7FFFFFFFLL;
    goto LABEL_19;
  }

- (void)resolveAppleCaptiveServer
{
  if (!-[WAEngine isWiFiInterfacePrimary](self, "isWiFiInterfacePrimary"))
  {
    id v12 = WALogCategoryDefaultHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v18 = "-[WAEngine resolveAppleCaptiveServer]";
      __int16 v19 = 1024;
      int v20 = 6058;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WiFi interface not primary...aborting DNS resolution",  buf,  0x12u);
    }

    goto LABEL_8;
  }

  id v3 = sub_100066590();
  if (objc_opt_class(v3))
  {
    id v4 = sub_100043C9C();
    if (objc_opt_class(v4))
    {
      id v5 = (os_log_s *)objc_alloc_init((Class)sub_100043C9C());
      if (v5)
      {
        id v6 = [sub_100066590() requestWithTestID:7 configuration:0];
        id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        int v16 = v7;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));

        id v9 = WALogCategoryDefaultHandle();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v18 = "-[WAEngine resolveAppleCaptiveServer]";
          __int16 v19 = 1024;
          int v20 = 6065;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DNSResolution: enqueuing",  buf,  0x12u);
        }

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10006ED88;
        v13[3] = &unk_1000CD8B0;
        objc_copyWeak(&v14, &location);
        id v11 =  -[os_log_s runDiagnostics:configuration:update:reply:]( v5,  "runDiagnostics:configuration:update:reply:",  v8,  0LL,  0LL,  v13);
        objc_destroyWeak(&v14);
      }

- (void)initializeProbeCxt
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    appleCaptiveServerIP = self->_appleCaptiveServerIP;
    int v30 = 136446722;
    unsigned int v31 = "-[WAEngine initializeProbeCxt]";
    __int16 v32 = 1024;
    int v33 = 6093;
    __int16 v34 = 2112;
    unsigned int v35 = appleCaptiveServerIP;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:initializing ProbeCxt self->_appleCaptiveServerIP:%@",  (uint8_t *)&v30,  0x1Cu);
  }

  if (!self->_probeContextBE)
  {
    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    probeContextBE = self->_probeContextBE;
    self->_probeContextBE = v6;

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBE,  "setObject:forKeyedSubscript:",  v8,  @"PingCount");

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1300LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBE,  "setObject:forKeyedSubscript:",  v9,  @"PingDataLength");

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBE,  "setObject:forKeyedSubscript:",  v10,  @"PingTimeout");

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBE,  "setObject:forKeyedSubscript:",  v11,  @"PingTrafficClass");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBE,  "setObject:forKeyedSubscript:",  self->_appleCaptiveServerIP,  @"IPAddress");
  }

  if (!self->_probeContextBK)
  {
    id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    probeContextBK = self->_probeContextBK;
    self->_probeContextBK = v12;

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBK,  "setObject:forKeyedSubscript:",  v14,  @"PingCount");

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1300LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBK,  "setObject:forKeyedSubscript:",  v15,  @"PingDataLength");

    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBK,  "setObject:forKeyedSubscript:",  v16,  @"PingTimeout");

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 200LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBK,  "setObject:forKeyedSubscript:",  v17,  @"PingTrafficClass");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextBK,  "setObject:forKeyedSubscript:",  self->_appleCaptiveServerIP,  @"IPAddress");
  }

  if (!self->_probeContextVI)
  {
    os_log_type_t v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    probeContextVI = self->_probeContextVI;
    self->_probeContextVI = v18;

    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVI,  "setObject:forKeyedSubscript:",  v20,  @"PingCount");

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1300LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVI,  "setObject:forKeyedSubscript:",  v21,  @"PingDataLength");

    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVI,  "setObject:forKeyedSubscript:",  v22,  @"PingTimeout");

    int8x16_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 700LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVI,  "setObject:forKeyedSubscript:",  v23,  @"PingTrafficClass");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVI,  "setObject:forKeyedSubscript:",  self->_appleCaptiveServerIP,  @"IPAddress");
  }

  if (!self->_probeContextVO)
  {
    id v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    probeContextVO = self->_probeContextVO;
    self->_probeContextVO = v24;

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVO,  "setObject:forKeyedSubscript:",  v26,  @"PingCount");

    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1300LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVO,  "setObject:forKeyedSubscript:",  v27,  @"PingDataLength");

    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVO,  "setObject:forKeyedSubscript:",  v28,  @"PingTimeout");

    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 800LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVO,  "setObject:forKeyedSubscript:",  v29,  @"PingTrafficClass");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_probeContextVO,  "setObject:forKeyedSubscript:",  self->_appleCaptiveServerIP,  @"IPAddress");
  }

- (void)triggerDiagnosticPingWithrequestId:(unsigned int)a3
{
  if (!-[WAEngine isWiFiInterfacePrimary](self, "isWiFiInterfacePrimary"))
  {
    id v36 = WALogCategoryDefaultHandle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v70 = 136446722;
      *(void *)&v70[4] = "-[WAEngine triggerDiagnosticPingWithrequestId:]";
      *(_WORD *)&v70[12] = 1024;
      *(_DWORD *)&v70[14] = 6130;
      *(_WORD *)&v70[18] = 1024;
      *(_DWORD *)&v70[20] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WiFi interface not primary...aborting ping instance:%d",  v70,  0x18u);
    }

    goto LABEL_20;
  }

  id v5 = sub_100066590();
  if (objc_opt_class(v5))
  {
    id v6 = sub_100043C9C();
    if (objc_opt_class(v6))
    {
      id v7 = (os_log_s *)objc_alloc_init((Class)sub_100043C9C());
      *(void *)id v70 = 0LL;
      *(void *)&v70[8] = v70;
      *(void *)&v70[16] = 0x3032000000LL;
      __int16 v71 = sub_10004B8C4;
      __int16 v72 = sub_10004B8D4;
      id v73 = 0LL;
      uint64_t v53 = 0LL;
      char v54 = &v53;
      uint64_t v55 = 0x3032000000LL;
      unint64_t v56 = sub_10004B8C4;
      id v57 = sub_10004B8D4;
      id v58 = 0LL;
      uint64_t v47 = 0LL;
      dispatch_semaphore_t v48 = &v47;
      uint64_t v49 = 0x3032000000LL;
      uint64_t v50 = sub_10004B8C4;
      unsigned int v51 = sub_10004B8D4;
      id v52 = 0LL;
      uint64_t v41 = 0LL;
      unsigned int v42 = &v41;
      uint64_t v43 = 0x3032000000LL;
      id v44 = sub_10004B8C4;
      id v45 = sub_10004B8D4;
      id v46 = 0LL;
      dnsStudyQueue = (dispatch_queue_s *)self->_dnsStudyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006FA90;
      block[3] = &unk_1000CD8D8;
      void block[4] = self;
      void block[5] = v70;
      void block[6] = &v53;
      block[7] = &v47;
      block[8] = &v41;
      dispatch_sync(dnsStudyQueue, block);
      if (!v7)
      {
LABEL_19:
        _Block_object_dispose(&v41, 8);

        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v53, 8);

        _Block_object_dispose(v70, 8);
LABEL_20:

        goto LABEL_21;
      }

      id v9 = [sub_100066590() requestWithTestID:3 configuration:*(void *)(*(void *)&v70[8] + 40)];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v69[0] = v10;
      id v11 = [sub_100066590() requestWithTestID:3 configuration:v54[5]];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v69[1] = v12;
      id v13 = [sub_100066590() requestWithTestID:3 configuration:v42[5]];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v69[2] = v14;
      id v15 = [sub_100066590() requestWithTestID:3 configuration:v48[5]];
      int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v69[3] = v16;
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 4LL));

      id v18 = [sub_100066590() requestWithTestID:6 configuration:*(void *)(*(void *)&v70[8] + 40)];
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v68[0] = v19;
      id v20 = [sub_100066590() requestWithTestID:6 configuration:v54[5]];
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v68[1] = v21;
      id v22 = [sub_100066590() requestWithTestID:6 configuration:v42[5]];
      int8x16_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v68[2] = v23;
      id v24 = [sub_100066590() requestWithTestID:6 configuration:v48[5]];
      double v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v68[3] = v25;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 4LL));

      if (self->_appleCaptiveServerIP) {
        id v27 = (id)objc_claimAutoreleasedReturnValue([v17 arrayByAddingObjectsFromArray:v26]);
      }
      else {
        id v27 = v17;
      }
      __int16 v28 = v27;
      if (!a3) {
        self->_isCaptiveServerIPResolved = self->_appleCaptiveServerIP != 0LL;
      }
      id v29 = WALogCategoryDefaultHandle();
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        appleCaptiveServerIP = self->_appleCaptiveServerIP;
        *(_DWORD *)buf = 136446978;
        uint64_t v61 = "-[WAEngine triggerDiagnosticPingWithrequestId:]";
        __int16 v62 = 1024;
        int v63 = 6158;
        __int16 v64 = 1024;
        unsigned int v65 = a3;
        __int16 v66 = 2112;
        __int16 v67 = appleCaptiveServerIP;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Ping: instanceId:%u equeueing...  CaptiveServerIP:%@",  buf,  0x22u);
      }

      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      BOOL v33 = (unint64_t)objc_msgSend(v32, "dns_symptoms_trap_evaluated_at_sample") > a3;

      if (v33)
      {
        self->_totalLANPingsBeforeTrap += 4LL;
        if (self->_appleCaptiveServerIP)
        {
          uint64_t v34 = 33LL;
LABEL_17:
          (&self->super.isa)[v34] = (Class)((char *)(&self->super.isa)[v34] + 4);
        }
      }

      else
      {
        self->_totalLANPingsAfterTrap += 4LL;
        if (self->_appleCaptiveServerIP)
        {
          uint64_t v34 = 37LL;
          goto LABEL_17;
        }
      }

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10006FB64;
      v37[3] = &unk_1000CD928;
      objc_copyWeak(&v38, &location);
      unsigned int v39 = a3;
      id v35 =  -[os_log_s runDiagnostics:configuration:update:reply:]( v7,  "runDiagnostics:configuration:update:reply:",  v28,  0LL,  0LL,  v37);
      objc_destroyWeak(&v38);

      goto LABEL_19;
    }
  }

- (void)fetchSymptomsScores:(unsigned int)a3
{
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (&_managed_event_fetch)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "-[WAEngine fetchSymptomsScores:]";
      __int16 v16 = 1024;
      int v17 = 6226;
      __int16 v18 = 1024;
      unsigned int v19 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Netscore: instanceId:%u enqueuing...",  buf,  0x18u);
    }

    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000703A8;
    v10[3] = &unk_1000CD978;
    objc_copyWeak(&v11, &location);
    unsigned int v12 = a3;
    if ((managed_event_fetch(1LL, v10) & 1) == 0)
    {
      id v8 = WALogCategoryDefaultHandle();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        id v15 = "-[WAEngine fetchSymptomsScores:]";
        __int16 v16 = 1024;
        int v17 = 6272;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:managed_event_fetch failed",  buf,  0x12u);
      }
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v15 = "-[WAEngine fetchSymptomsScores:]";
      __int16 v16 = 1024;
      int v17 = 6222;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:managed_event_fetch not available",  buf,  0x12u);
    }
  }

- (BOOL)isScoreBelowThreshold:(id)a3 type:(unint64_t)a4 instanceId:(unsigned int)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"AWD-info"]);
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"dns-total"]);
    unsigned int v12 = [v11 intValue];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"dns-impacted"]);
    unsigned int v14 = [v13 intValue];

    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    unsigned int v14 = 0;
    unsigned int v12 = 0;
    if (a4)
    {
LABEL_3:
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"data-stalls-score"]);
      unsigned int v16 = [v15 intValue];

      if (a5)
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
        __int16 v18 = (char *)objc_msgSend(v17, "dns_symptoms_interrogation_sample_count") - 1;

        if (v18 != (char *)a5)
        {
LABEL_17:
          unsigned int v24 = v12;
LABEL_18:
          double v25 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
          BOOL v23 = (int)v16 <= (int)objc_msgSend(v25, "reset_score_threshold");

          unsigned int v12 = v24;
          goto LABEL_19;
        }

        uint64_t v19 = 53LL;
      }

      else
      {
        uint64_t v19 = 50LL;
      }

      (&self->super.isa)[v19] = (Class)v16;
      goto LABEL_17;
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"net-score"]);
  unsigned int v16 = [v20 intValue];

  uint64_t v21 = 52LL;
  if (!a5) {
    uint64_t v21 = 49LL;
  }
  uint64_t v22 = 54LL;
  if (!a5) {
    uint64_t v22 = 51LL;
  }
  (&self->super.isa)[v21] = (Class)v16;
  (&self->super.isa)[v22] = (Class)v14;
  if (v12)
  {
    BOOL v23 = 0;
    if (v14)
    {
      unsigned int v24 = v14;
      if (v12 == v14) {
        goto LABEL_18;
      }
    }
  }

  else
  {
    BOOL v23 = 1;
  }

- (BOOL)isWiFiAssociatedToNetwork
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkName](self->_corewifi, "networkName"));
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = "Not Associated";
    id v8 = "-[WAEngine isWiFiAssociatedToNetwork]";
    int v7 = 136446722;
    if (v2) {
      id v5 = "Associated";
    }
    __int16 v9 = 1024;
    int v10 = 6327;
    __int16 v11 = 2080;
    unsigned int v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:isWiFiAssociatedToNetwork result: %s",  (uint8_t *)&v7,  0x1Cu);
  }

  return v2 != 0LL;
}

- (void)computeAverageCcaSinceStudyStart:(id)a3
{
  id v29 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v29 fieldForKey:@"DPSR_dpsCounterSamples"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 repeatableValues]);
  id v5 = (char *)[v4 count];

  if (v5)
  {
    id v6 = 0LL;
    double v7 = 0.0;
    for (i = v5; i != v6; id v5 = i)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v29 fieldForKey:@"DPSR_dpsCounterSamples"]);
      __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 repeatableValues]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v6]);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fieldForKey:@"DPSCS_peerStats"]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subMessageValue]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fieldForKey:@"NWAPS_obssCCA"]);
      unsigned int v14 = [v13 uint32Value];

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v29 fieldForKey:@"DPSR_dpsCounterSamples"]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 repeatableValues]);
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v6]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"DPSCS_peerStats"]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 subMessageValue]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fieldForKey:@"NWAPS_interferenceCCA"]);
      unsigned int v21 = [v20 uint32Value];

      id v22 = WALogCategoryDefaultHandle();
      BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        unsigned int v31 = "-[WAEngine computeAverageCcaSinceStudyStart:]";
        __int16 v32 = 1024;
        int v33 = 6343;
        __int16 v34 = 2048;
        *(void *)unsigned int v35 = v6;
        *(_WORD *)&v35[8] = 1024;
        *(_DWORD *)__int16 v36 = v14;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:AvgCCAComputation: instance:%lu obssCCA:%d interferenceCCA:%d",  buf,  0x28u);
      }

      double v7 = v7 + (double)(v21 + v14);

      ++v6;
    }
  }

  else
  {
    double v7 = 0.0;
  }

  double v24 = v7 / (double)(unint64_t)v5;
  id v25 = WALogCategoryDefaultHandle();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    unsigned int v31 = "-[WAEngine computeAverageCcaSinceStudyStart:]";
    __int16 v32 = 1024;
    int v33 = 6346;
    __int16 v34 = 1024;
    *(_DWORD *)unsigned int v35 = (int)v24;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = (int)v7;
    *(_WORD *)__int16 v36 = 2048;
    *(void *)&v36[2] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:AvgCCAComputation: result:%d sumCCA:%d count:%lu",  buf,  0x28u);
  }

  self->_cumulativeAverageCcaSinceStudyStart = v24;
}

- (BOOL)isWiFiInterfacePrimary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv4NetworkServiceID](self->_corewifi, "globalIPv4NetworkServiceID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv6NetworkServiceID](self->_corewifi, "globalIPv6NetworkServiceID"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  BOOL v8 = ([v7 isEqualToString:v4] & 1) != 0
    || [v7 isEqualToString:v6];
  id v9 = WALogCategoryDefaultHandle();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = "-[WAEngine isWiFiInterfacePrimary]";
    __int16 v15 = 1024;
    __int16 v11 = "NO";
    int v16 = 6365;
    __int16 v17 = 2080;
    int v13 = 136447234;
    if (v8) {
      __int16 v11 = "YES";
    }
    __int16 v18 = v11;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:isWiFiInterfacePrimary result:%s IPv4interface:%@ IPv6Interface:%@ ",  (uint8_t *)&v13,  0x30u);
  }

  return v8;
}

- (BOOL)isWiFiNetworkCaptive
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](self->_corewifi, "currentKnownNetworkProfile"));
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 isCaptive];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSMutableDictionary)submitterMap
{
  return self->_submitterMap;
}

- (void)setSubmitterMap:(id)a3
{
}

- (NSMutableDictionary)processTokenToGroupTypeMap
{
  return self->_processTokenToGroupTypeMap;
}

- (void)setProcessTokenToGroupTypeMap:(id)a3
{
}

- (OS_dispatch_queue)engineQ
{
  return self->_engineQ;
}

- (void)setEngineQ:(id)a3
{
}

- (WAMessageAWDStore)messageStore
{
  return self->_messageStore;
}

- (void)setMessageStore:(id)a3
{
}

- (WAIOReporterMessagePopulator)iorMessagePopulator
{
  return self->_iorMessagePopulator;
}

- (void)setIorMessagePopulator:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)processTokenToXPCConnectionMap
{
  return self->_processTokenToXPCConnectionMap;
}

- (void)setProcessTokenToXPCConnectionMap:(id)a3
{
}

- (NSMutableArray)pendingUntokenedConnections
{
  return self->_pendingUntokenedConnections;
}

- (void)setPendingUntokenedConnections:(id)a3
{
}

- (NSMutableDictionary)cachedModelObjectsKeyToMessageMap
{
  return self->_cachedModelObjectsKeyToMessageMap;
}

- (void)setCachedModelObjectsKeyToMessageMap:(id)a3
{
}

- (NSMutableDictionary)interfaceNameToApple80211InstanceMap
{
  return self->_interfaceNameToApple80211InstanceMap;
}

- (void)setInterfaceNameToApple80211InstanceMap:(id)a3
{
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
}

- (CADataTransformEngine)transformEngine
{
  return self->_transformEngine;
}

- (void)setTransformEngine:(id)a3
{
}

- (NSMutableDictionary)studyTimeStamps
{
  return self->_studyTimeStamps;
}

- (void)setStudyTimeStamps:(id)a3
{
}

- (RecommendationEngine)recommendationEngine
{
  return self->_recommendationEngine;
}

- (void)setRecommendationEngine:(id)a3
{
}

- (BOOL)dpsStudyInProgress
{
  return self->_dpsStudyInProgress;
}

- (void)setDpsStudyInProgress:(BOOL)a3
{
  self->_BOOL dpsStudyInProgress = a3;
}

- (BOOL)dpsCurrentlyGatheringConsecutiveSamples
{
  return self->_dpsCurrentlyGatheringConsecutiveSamples;
}

- (void)setDpsCurrentlyGatheringConsecutiveSamples:(BOOL)a3
{
  self->_BOOL dpsCurrentlyGatheringConsecutiveSamples = a3;
}

- (BOOL)slowWiFiStudyInProgress
{
  return self->_slowWiFiStudyInProgress;
}

- (void)setSlowWiFiStudyInProgress:(BOOL)a3
{
  self->_BOOL slowWiFiStudyInProgress = a3;
}

- (BOOL)isNWActivityInProgress
{
  return self->_isNWActivityInProgress;
}

- (void)setIsNWActivityInProgress:(BOOL)a3
{
  self->_isNWActivityInProgress = a3;
}

- (DPSQuickRecoveryRecommendationEngine)dpsQuickRecoveryEngine
{
  return self->_dpsQuickRecoveryEngine;
}

- (void)setDpsQuickRecoveryEngine:(id)a3
{
}

- (NSString)wifiChipSet
{
  return self->_wifiChipSet;
}

- (void)setWifiChipSet:(id)a3
{
}

- (unint64_t)dpsNotificationTimeInSeconds
{
  return self->_dpsNotificationTimeInSeconds;
}

- (void)setDpsNotificationTimeInSeconds:(unint64_t)a3
{
  self->_dpsNotificationTimeInSeconds = a3;
}

- (unint64_t)dpsNotificationCCA
{
  return self->_dpsNotificationCCA;
}

- (void)setDpsNotificationCCA:(unint64_t)a3
{
  self->_dpsNotificationCCA = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BOOL)isMemoryPressureRequestDeferred
{
  return self->_isMemoryPressureRequestDeferred;
}

- (void)setIsMemoryPressureRequestDeferred:(BOOL)a3
{
  self->_isMemoryPressureRequestDeferred = a3;
}

- (OS_os_transaction)dpsStudyTransaction
{
  return self->_dpsStudyTransaction;
}

- (void)setDpsStudyTransaction:(id)a3
{
}

- (OS_os_transaction)dnsStudyTransaction
{
  return self->_dnsStudyTransaction;
}

- (void)setDnsStudyTransaction:(id)a3
{
}

- (OS_os_transaction)slowwifiStudyTransaction
{
  return self->_slowwifiStudyTransaction;
}

- (void)setSlowwifiStudyTransaction:(id)a3
{
}

- (BOOL)dpsNotificationDuringDnsStudy
{
  return self->_dpsNotificationDuringDnsStudy;
}

- (void)setDpsNotificationDuringDnsStudy:(BOOL)a3
{
  self->_dpsNotificationDuringDnsStudy = a3;
}

- (BOOL)slowWiFiNotificationDuringDnsStudy
{
  return self->_slowWiFiNotificationDuringDnsStudy;
}

- (void)setSlowWiFiNotificationDuringDnsStudy:(BOOL)a3
{
  self->_slowWiFiNotificationDuringDnsStudy = a3;
}

- (BOOL)isPingEnqueueFailing
{
  return self->_isPingEnqueueFailing;
}

- (void)setIsPingEnqueueFailing:(BOOL)a3
{
  self->_isPingEnqueueFailing = a3;
}

- (BOOL)isCriticalAppInUse
{
  return self->_isCriticalAppInUse;
}

- (void)setIsCriticalAppInUse:(BOOL)a3
{
  self->_isCriticalAppInUse = a3;
}

- (BOOL)dnsStudyInProgress
{
  return self->_dnsStudyInProgress;
}

- (void)setDnsStudyInProgress:(BOOL)a3
{
  self->_BOOL dnsStudyInProgress = a3;
}

- (BOOL)isCaptiveServerIPResolved
{
  return self->_isCaptiveServerIPResolved;
}

- (void)setIsCaptiveServerIPResolved:(BOOL)a3
{
  self->_isCaptiveServerIPResolved = a3;
}

- (BOOL)isPoorSymptomsDnsConditions
{
  return self->_isPoorSymptomsDnsConditions;
}

- (void)setIsPoorSymptomsDnsConditions:(BOOL)a3
{
  self->_isPoorSymptomsDnsConditions = a3;
}

- (BOOL)didSymptomsConditionRecoverAfterDecision
{
  return self->_didSymptomsConditionRecoverAfterDecision;
}

- (void)setDidSymptomsConditionRecoverAfterDecision:(BOOL)a3
{
  self->_didSymptomsConditionRecoverAfterDecision = a3;
}

- (BOOL)isGatewayReachable
{
  return self->_isGatewayReachable;
}

- (void)setIsGatewayReachable:(BOOL)a3
{
  self->_isGatewayReachable = a3;
}

- (BOOL)isAWDLActivitySuspected
{
  return self->_isAWDLActivitySuspected;
}

- (void)setIsAWDLActivitySuspected:(BOOL)a3
{
  self->_isAWDLActivitySuspected = a3;
}

- (BOOL)isAssociatedSinceStudyStart
{
  return self->_isAssociatedSinceStudyStart;
}

- (void)setIsAssociatedSinceStudyStart:(BOOL)a3
{
  self->_isAssociatedSinceStudyStart = a3;
}

- (BOOL)isAssociatedStateKnown
{
  return self->_isAssociatedStateKnown;
}

- (void)setIsAssociatedStateKnown:(BOOL)a3
{
  self->_isAssociatedStateKnown = a3;
}

- (void)setIsAssociated:(BOOL)a3
{
  self->_isAssociated = a3;
}

- (BOOL)forceStudyErrorFromMsg
{
  return self->_forceStudyErrorFromMsg;
}

- (void)setForceStudyErrorFromMsg:(BOOL)a3
{
  self->_forceStudyErrorFromMsg = a3;
}

- (unint64_t)cumulativeAverageCcaSinceStudyStart
{
  return self->_cumulativeAverageCcaSinceStudyStart;
}

- (void)setCumulativeAverageCcaSinceStudyStart:(unint64_t)a3
{
  self->_cumulativeAverageCcaSinceStudyStart = a3;
}

- (unint64_t)totalLANPingsBeforeTrap
{
  return self->_totalLANPingsBeforeTrap;
}

- (void)setTotalLANPingsBeforeTrap:(unint64_t)a3
{
  self->_totalLANPingsBeforeTrap = a3;
}

- (unint64_t)totalLANPingSuccessBeforeTrap
{
  return self->_totalLANPingSuccessBeforeTrap;
}

- (void)setTotalLANPingSuccessBeforeTrap:(unint64_t)a3
{
  self->_totalLANPingSuccessBeforeTrap = a3;
}

- (unint64_t)totalWANPingsBeforeTrap
{
  return self->_totalWANPingsBeforeTrap;
}

- (void)setTotalWANPingsBeforeTrap:(unint64_t)a3
{
  self->_totalWANPingsBeforeTrap = a3;
}

- (unint64_t)totalWANPingSuccessBeforeTrap
{
  return self->_totalWANPingSuccessBeforeTrap;
}

- (void)setTotalWANPingSuccessBeforeTrap:(unint64_t)a3
{
  self->_totalWANPingSuccessBeforeTrap = a3;
}

- (unint64_t)totalLANPingsAfterTrap
{
  return self->_totalLANPingsAfterTrap;
}

- (void)setTotalLANPingsAfterTrap:(unint64_t)a3
{
  self->_totalLANPingsAfterTrap = a3;
}

- (unint64_t)totalLANPingSuccessAfterTrap
{
  return self->_totalLANPingSuccessAfterTrap;
}

- (void)setTotalLANPingSuccessAfterTrap:(unint64_t)a3
{
  self->_totalLANPingSuccessAfterTrap = a3;
}

- (unint64_t)totalWANPingsAfterTrap
{
  return self->_totalWANPingsAfterTrap;
}

- (void)setTotalWANPingsAfterTrap:(unint64_t)a3
{
  self->_totalWANPingsAfterTrap = a3;
}

- (unint64_t)totalWANPingSuccessAfterTrap
{
  return self->_totalWANPingSuccessAfterTrap;
}

- (void)setTotalWANPingSuccessAfterTrap:(unint64_t)a3
{
  self->_totalWANPingSuccessAfterTrap = a3;
}

- (unint64_t)numNetScoreBelowThresholdBeforeTrap
{
  return self->_numNetScoreBelowThresholdBeforeTrap;
}

- (void)setNumNetScoreBelowThresholdBeforeTrap:(unint64_t)a3
{
  self->_numNetScoreBelowThresholdBeforeTrap = a3;
}

- (unint64_t)numNetScoreBelowThresholdAfterTrap
{
  return self->_numNetScoreBelowThresholdAfterTrap;
}

- (void)setNumNetScoreBelowThresholdAfterTrap:(unint64_t)a3
{
  self->_numNetScoreBelowThresholdAfterTrap = a3;
}

- (unint64_t)numDataStallScoreBelowThresholdBeforeTrap
{
  return self->_numDataStallScoreBelowThresholdBeforeTrap;
}

- (void)setNumDataStallScoreBelowThresholdBeforeTrap:(unint64_t)a3
{
  self->_numDataStallScoreBelowThresholdBeforeTrap = a3;
}

- (unint64_t)numDataStallScoreBelowThresholdAfterTrap
{
  return self->_numDataStallScoreBelowThresholdAfterTrap;
}

- (void)setNumDataStallScoreBelowThresholdAfterTrap:(unint64_t)a3
{
  self->_numDataStallScoreBelowThresholdAfterTrap = a3;
}

- (unint64_t)totalDnsServers
{
  return self->_totalDnsServers;
}

- (void)setTotalDnsServers:(unint64_t)a3
{
  self->_totalDnsServers = a3;
}

- (unint64_t)numIPv4DnsServers
{
  return self->_numIPv4DnsServers;
}

- (void)setNumIPv4DnsServers:(unint64_t)a3
{
  self->_numIPv4DnsServers = a3;
}

- (unint64_t)numIPv6DnsServers
{
  return self->_numIPv6DnsServers;
}

- (void)setNumIPv6DnsServers:(unint64_t)a3
{
  self->_numIPv6DnsServers = a3;
}

- (unint64_t)numLocalDnsServers
{
  return self->_numLocalDnsServers;
}

- (void)setNumLocalDnsServers:(unint64_t)a3
{
  self->_numLocalDnsServers = a3;
}

- (unint64_t)numRemoteDnsServers
{
  return self->_numRemoteDnsServers;
}

- (void)setNumRemoteDnsServers:(unint64_t)a3
{
  self->_numRemoteDnsServers = a3;
}

- (int64_t)dnsServerConfigType
{
  return self->_dnsServerConfigType;
}

- (void)setDnsServerConfigType:(int64_t)a3
{
  self->_dnsServerConfigType = a3;
}

- (unint64_t)netscoreAtStudyStart
{
  return self->_netscoreAtStudyStart;
}

- (void)setNetscoreAtStudyStart:(unint64_t)a3
{
  self->_netscoreAtStudyStart = a3;
}

- (unint64_t)stallscoreAtStudyStart
{
  return self->_stallscoreAtStudyStart;
}

- (void)setStallscoreAtStudyStart:(unint64_t)a3
{
  self->_stallscoreAtStudyStart = a3;
}

- (unint64_t)impactedServersAtStudyStart
{
  return self->_impactedServersAtStudyStart;
}

- (void)setImpactedServersAtStudyStart:(unint64_t)a3
{
  self->_impactedServersAtStudyStart = a3;
}

- (unint64_t)netscoreAtStudyEnd
{
  return self->_netscoreAtStudyEnd;
}

- (void)setNetscoreAtStudyEnd:(unint64_t)a3
{
  self->_netscoreAtStudyEnd = a3;
}

- (unint64_t)stallscoreAtStudyEnd
{
  return self->_stallscoreAtStudyEnd;
}

- (void)setStallscoreAtStudyEnd:(unint64_t)a3
{
  self->_stallscoreAtStudyEnd = a3;
}

- (unint64_t)impactedServersAtStudyEnd
{
  return self->_impactedServersAtStudyEnd;
}

- (void)setImpactedServersAtStudyEnd:(unint64_t)a3
{
  self->_impactedServersAtStudyEnd = a3;
}

- (NSMutableDictionary)probeContextBE
{
  return self->_probeContextBE;
}

- (void)setProbeContextBE:(id)a3
{
}

- (NSMutableDictionary)probeContextBK
{
  return self->_probeContextBK;
}

- (void)setProbeContextBK:(id)a3
{
}

- (NSMutableDictionary)probeContextVI
{
  return self->_probeContextVI;
}

- (void)setProbeContextVI:(id)a3
{
}

- (NSMutableDictionary)probeContextVO
{
  return self->_probeContextVO;
}

- (void)setProbeContextVO:(id)a3
{
}

- (NSString)appleCaptiveServerIP
{
  return self->_appleCaptiveServerIP;
}

- (void)setAppleCaptiveServerIP:(id)a3
{
}

- (NSMutableArray)accessPointInfoToAppend
{
  return self->_accessPointInfoToAppend;
}

- (void)setAccessPointInfoToAppend:(id)a3
{
}

- (OS_dispatch_queue)dnsStudyQueue
{
  return self->_dnsStudyQueue;
}

- (void)setDnsStudyQueue:(id)a3
{
}

- (NSMutableArray)usbEventNotificationToAppend
{
  return self->_usbEventNotificationToAppend;
}

- (void)setUsbEventNotificationToAppend:(id)a3
{
}

- (WACoreCapture)coreCaptureControl
{
  return self->_coreCaptureControl;
}

- (void)setCoreCaptureControl:(id)a3
{
}

- (OS_dispatch_queue)studyQueue
{
  return self->_studyQueue;
}

- (void)setStudyQueue:(id)a3
{
}

- (OS_dispatch_queue)dpsReadWriteSerialQueue
{
  return self->_dpsReadWriteSerialQueue;
}

- (void)setDpsReadWriteSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)peerDiagnosticsStudyQueue
{
  return self->_peerDiagnosticsStudyQueue;
}

- (void)setPeerDiagnosticsStudyQueue:(id)a3
{
}

- (NSMutableArray)dpsnToAppend
{
  return self->_dpsnToAppend;
}

- (void)setDpsnToAppend:(id)a3
{
}

- (NSMutableArray)dpsapToAppend
{
  return self->_dpsapToAppend;
}

- (void)setDpsapToAppend:(id)a3
{
}

- (NSMutableArray)dpscsToAppend
{
  return self->_dpscsToAppend;
}

- (void)setDpscsToAppend:(id)a3
{
}

- (NSMutableArray)assocDiffToAppend
{
  return self->_assocDiffToAppend;
}

- (void)setAssocDiffToAppend:(id)a3
{
}

- (NSMutableArray)swfnToAppend
{
  return self->_swfnToAppend;
}

- (void)setSwfnToAppend:(id)a3
{
}

- (int)dpsAction
{
  return self->_dpsAction;
}

- (void)setDpsAction:(int)a3
{
  self->_dpsAction = a3;
}

- (BOOL)tmpFilesHaveAttemptedProcessingInDataStreamPath
{
  return self->_tmpFilesHaveAttemptedProcessingInDataStreamPath;
}

- (void)setTmpFilesHaveAttemptedProcessingInDataStreamPath:(BOOL)a3
{
  self->_tmpFilesHaveAttemptedProcessingInDataStreamPath = a3;
}

- (OS_dispatch_queue)fileHandlingQ
{
  return self->_fileHandlingQ;
}

- (void)setFileHandlingQ:(id)a3
{
}

- (NSURL)wifianalyticsTmpDir
{
  return self->_wifianalyticsTmpDir;
}

- (void)setWifianalyticsTmpDir:(id)a3
{
}

- (OS_dispatch_queue)mutexQueue
{
  return self->_mutexQueue;
}

- (void)setMutexQueue:(id)a3
{
}

- (AnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
}

- (double)analyticsProcessingTimeIntervalSecs
{
  return self->_analyticsProcessingTimeIntervalSecs;
}

- (void)setAnalyticsProcessingTimeIntervalSecs:(double)a3
{
  self->_unint64_t analyticsProcessingTimeIntervalSecs = a3;
}

- (double)analyticsAgeOutTimeIntervalSecs
{
  return self->_analyticsAgeOutTimeIntervalSecs;
}

- (void)setAnalyticsAgeOutTimeIntervalSecs:(double)a3
{
  self->_analyticsAgeOutTimeIntervalSecs = a3;
}

- (BOOL)analyticsProcessorIsReady
{
  return self->_analyticsProcessorIsReady;
}

- (void)setAnalyticsProcessorIsReady:(BOOL)a3
{
  self->_analyticsProcessorIsReady = a3;
}

- (int)keybagToken
{
  return self->_keybagToken;
}

- (void)setKeybagToken:(int)a3
{
  self->_keybagToken = a3;
}

- (OS_dispatch_source)jsonFilerReaderTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 624LL, 1);
}

- (void)setJsonFilerReaderTimer:(id)a3
{
}

- (OS_dispatch_queue)manageConfigQueue
{
  return self->_manageConfigQueue;
}

- (void)setManageConfigQueue:(id)a3
{
}

- (ManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (DatapathMetricStream)datapathMetricStream
{
  return self->_datapathMetricStream;
}

- (void)setDatapathMetricStream:(id)a3
{
}

- (id)DatapathMetricGetter
{
  return self->_DatapathMetricGetter;
}

- (void)setDatapathMetricGetter:(id)a3
{
}

- (NSDate)lastDateDetermineChannelsPerIORPopulatableQueried
{
  return self->_lastDateDetermineChannelsPerIORPopulatableQueried;
}

- (void)setLastDateDetermineChannelsPerIORPopulatableQueried:(id)a3
{
}

- (NSDate)lastDateWiFiAppInstalledQueried
{
  return self->_lastDateWiFiAppInstalledQueried;
}

- (void)setLastDateWiFiAppInstalledQueried:(id)a3
{
}

- (BOOL)isWiFiAppInstalled
{
  return self->_isWiFiAppInstalled;
}

- (void)setIsWiFiAppInstalled:(BOOL)a3
{
  self->_isWiFiAppInstalled = a3;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSMutableDictionary)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)pidLaunchDate
{
  return (NSDate *)objc_getProperty(self, a2, 696LL, 1);
}

- (void)setPidLaunchDate:(id)a3
{
}

- (BOOL)persistFileExistedAtPIDLoad
{
  return self->_persistFileExistedAtPIDLoad;
}

- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3
{
  self->_persistFileExistedAtPIDLoad = a3;
}

- (BOOL)readingPersistFile
{
  return self->_readingPersistFile;
}

- (void)setReadingPersistFile:(BOOL)a3
{
  self->_BOOL readingPersistFile = a3;
}

- (BOOL)writingPersistFile
{
  return self->_writingPersistFile;
}

- (void)setWritingPersistFile:(BOOL)a3
{
  self->_writingPersistFile = a3;
}

- (NSDictionary)nowCacheUsageForTelemetry
{
  return self->_nowCacheUsageForTelemetry;
}

- (void)setNowCacheUsageForTelemetry:(id)a3
{
}

- (NSDictionary)oldCacheUsageForTelemetry
{
  return self->_oldCacheUsageForTelemetry;
}

- (void)setOldCacheUsageForTelemetry:(id)a3
{
}

- (OS_dispatch_source)workReportTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 720LL, 1);
}

- (void)setWorkReportTimer:(id)a3
{
}

- (BOOL)workReportTimerRunning
{
  return self->_workReportTimerRunning;
}

- (void)setWorkReportTimerRunning:(BOOL)a3
{
  self->_BOOL workReportTimerRunning = a3;
}

- (unint64_t)workReportSelectingSingleWithinFirstDay
{
  return self->_workReportSelectingSingleWithinFirstDay;
}

- (void)setWorkReportSelectingSingleWithinFirstDay:(unint64_t)a3
{
  self->_unint64_t workReportSelectingSingleWithinFirstDay = a3;
}

- (unint64_t)workReportSelectingSingleWithinFirstWeek
{
  return self->_workReportSelectingSingleWithinFirstWeek;
}

- (void)setWorkReportSelectingSingleWithinFirstWeek:(unint64_t)a3
{
  self->_unint64_t workReportSelectingSingleWithinFirstWeek = a3;
}

- (unsigned)isMegaEnabled
{
  return self->_isMegaEnabled;
}

- (void)setIsMegaEnabled:(unsigned __int8)a3
{
  self->_isMegaEnabled = a3;
}

- (NSDate)profileMegaEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 744LL, 1);
}

- (void)setProfileMegaEnabledDate:(id)a3
{
}

- (NSDate)profileMegaDisabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 752LL, 1);
}

- (void)setProfileMegaDisabledDate:(id)a3
{
}

- (unint64_t)profileMegaEnabledSeconds
{
  return self->_profileMegaEnabledSeconds;
}

- (void)setProfileMegaEnabledSeconds:(unint64_t)a3
{
  self->_unint64_t profileMegaEnabledSeconds = a3;
}

- (unint64_t)profileMegaDisabledSeconds
{
  return self->_profileMegaDisabledSeconds;
}

- (void)setProfileMegaDisabledSeconds:(unint64_t)a3
{
  self->_profileMegaDisabledSeconds = a3;
}

- (int64_t)driverType
{
  return self->_driverType;
}

- (void)setDriverType:(int64_t)a3
{
  self->_driverType = a3;
}

- (void).cxx_destruct
{
}

@end