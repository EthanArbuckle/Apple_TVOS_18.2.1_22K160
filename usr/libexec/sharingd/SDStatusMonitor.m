@interface SDStatusMonitor
+ (BOOL)b332PairingEnabled;
+ (BOOL)enableAirDropHUDScene;
+ (BOOL)enableOOBPCredentialLogging;
+ (BOOL)enableShareSheetVectorSlots;
+ (BOOL)isBuddyCompleted;
+ (SDStatusMonitor)sharedMonitor;
+ (double)b332BTAddressRotationDelay;
+ (float)airDropProgressUIMaxPercentage;
+ (int64_t)mrQLProgressUpdateFreqMsec;
+ (int64_t)shareSheetMaxSuggestions;
- (BOOL)_isEveryoneModeExpired;
- (BOOL)_multipleUsersLoggedIn;
- (BOOL)airDropPublished;
- (BOOL)airplaneModeEnabled;
- (BOOL)allEnabled;
- (BOOL)altDSIDNeedsFixing;
- (BOOL)alwaysAutoAccept;
- (BOOL)alwaysSendPayload;
- (BOOL)asynchronousProxyLoadingEnabled;
- (BOOL)backlightOn;
- (BOOL)bluetoothEnabled;
- (BOOL)bluetoothEnabledIncludingRestricted;
- (BOOL)bonjourEnabled;
- (BOOL)browseAllInterfaces;
- (BOOL)bypassLTKeyAbort;
- (BOOL)carplayConnected;
- (BOOL)coalesceMe;
- (BOOL)computerToComputer;
- (BOOL)connectedEnabled;
- (BOOL)contactIdentifierIsBlocked:(id)a3;
- (BOOL)contactIsBlocked:(id)a3;
- (BOOL)contactsContainsShortHashes:(id)a3;
- (BOOL)controlCenterVisible;
- (BOOL)currentConsoleUser;
- (BOOL)deviceInBiolockout;
- (BOOL)deviceIsInClassD;
- (BOOL)deviceKeyBagDisabled;
- (BOOL)deviceKeyBagLocked;
- (BOOL)deviceKeyBagLocking;
- (BOOL)deviceKeyBagUnlocked;
- (BOOL)deviceKeyBagUnlockedAndScreenOn;
- (BOOL)deviceRequiresNewRanging;
- (BOOL)deviceSupportsRanging;
- (BOOL)deviceUIUnlocked;
- (BOOL)deviceWasUnlockedOnce;
- (BOOL)disableAutoAccept;
- (BOOL)disableAutoAcceptForPhotosAssetBundles;
- (BOOL)disableCompression;
- (BOOL)disableContinuityTLS;
- (BOOL)disableExtractMediaFromBundles;
- (BOOL)disablePeopleSuggestions;
- (BOOL)disablePictureQuery;
- (BOOL)disablePipelining;
- (BOOL)disableQuarantine;
- (BOOL)disableRotation;
- (BOOL)disableTLS;
- (BOOL)disableTransformingPhotosAssetBundlesToFolders;
- (BOOL)dockHasDownloadsFolder;
- (BOOL)eduModeEnabled;
- (BOOL)enableAirDropAdvertising;
- (BOOL)enableAirDropReceiving;
- (BOOL)enableAllRecents;
- (BOOL)enableBugs;
- (BOOL)enableContinuity;
- (BOOL)enableDVZip;
- (BOOL)enableDebugMode;
- (BOOL)enableDemoMode;
- (BOOL)enableHotspotFallback;
- (BOOL)enablePKZip;
- (BOOL)enablePKZipCompression;
- (BOOL)enableStrangers;
- (BOOL)enableStreamDebugging;
- (BOOL)enableWebloc;
- (BOOL)enableXML;
- (BOOL)familyHotspotEnabled;
- (BOOL)finderAirDropEnabled;
- (BOOL)forceAWDL;
- (BOOL)forceP2P;
- (BOOL)handoffVisible;
- (BOOL)iCloudSharedPhotoLibraryEnabled;
- (BOOL)ignoreIconDiskCache;
- (BOOL)internetSharingEnabled;
- (BOOL)isAirDropAllowed;
- (BOOL)isAirDropReady;
- (BOOL)isClarityBoardEnabled;
- (BOOL)isEmail:(id)a3;
- (BOOL)isLocalDeviceMeDevice;
- (BOOL)isMirroringActive;
- (BOOL)isMulticastAdvertisementsDisabled;
- (BOOL)isTourModeEnabled;
- (BOOL)isUsing2GHzWifi;
- (BOOL)isWifiPersonalHotspot;
- (BOOL)lostModeEnabled;
- (BOOL)lowPowerModeEnabled;
- (BOOL)lteConnectionShows4G;
- (BOOL)multipleUsersLoggedIn;
- (BOOL)myAppleIDIsManaged;
- (BOOL)personalHotspotAllowed;
- (BOOL)registerAllInterfaces;
- (BOOL)runningAsSetupUser;
- (BOOL)screenOn;
- (BOOL)screenStateSupportsAirDrop;
- (BOOL)showMeInWormhole;
- (BOOL)showThisComputer;
- (BOOL)signedIntoPrimaryiCloudAccount;
- (BOOL)simStateReady;
- (BOOL)sleepModeOn;
- (BOOL)smartCoverIsClosed;
- (BOOL)smbConfiguration:(__SCPreferences *)a3 netBiosName:(id *)a4 workgroup:(id *)a5;
- (BOOL)supportsFitnessPlusPairing;
- (BOOL)supportsXcodePairing;
- (BOOL)testDiskFull;
- (BOOL)verifyAndParseValidationRecordData:(id)a3 intoDictionary:(id *)a4;
- (BOOL)wifiUserPowerPreference;
- (BOOL)wirelessAccessPoint;
- (BOOL)wirelessCarPlay;
- (BOOL)wirelessCritical;
- (BOOL)wirelessEnabled;
- (CNContact)meCard;
- (NSArray)awdlPeerList;
- (NSArray)myAppleIDEmailAddresses;
- (NSArray)myAppleIDPhoneNumbers;
- (NSData)bluetoothAddress;
- (NSData)myMediumHashes;
- (NSData)myShortHashesForAirDrop;
- (NSDate)lastDarkWakeDate;
- (NSDate)lastDeviceUnlockDate;
- (NSDictionary)awdlInfo;
- (NSDictionary)awdlState;
- (NSDictionary)myAppleIDValidationRecord;
- (NSSet)effectiveBlockedAppBundleIDs;
- (NSString)bonjourName;
- (NSString)computerName;
- (NSString)consoleUser;
- (NSString)description;
- (NSString)deviceInformation;
- (NSString)discoverableMode;
- (NSString)localHostName;
- (NSString)modelCode;
- (NSString)modelName;
- (NSString)myAccountAppleID;
- (NSString)myAltDSID;
- (NSString)myAppleID;
- (NSString)myAppleIDCommonName;
- (NSString)myAppleIDEmailHash;
- (NSString)myAppleIDPhoneHash;
- (NSString)myEmail;
- (NSString)myGivenName;
- (NSString)myName;
- (NSString)myPrimaryEmail;
- (NSString)netbiosName;
- (NSString)nextAirDropID;
- (NSString)someComputerName;
- (NSString)workgroup;
- (SDAirDropServer)finderServer;
- (SDStatusMonitor)init;
- (SFPowerSource)localPowerSource;
- (__SecCertificate)_copyMyAppleIDCertificate;
- (__SecCertificate)_copyMyAppleIDIntermediateCertificate;
- (__SecCertificate)copyCertificateForRealName:(id)a3;
- (__SecCertificate)copyMyAppleIDCertificate;
- (__SecCertificate)copyMyAppleIDIntermediateCertificate;
- (__SecIdentity)_copyMyAppleIDSecIdentity;
- (__SecIdentity)copyMyAppleIDSecIdentity;
- (__WiFiManagerClient)wifiManager;
- (double)_currentEveryoneModeExpiryInterval;
- (double)_everyoneModeExpiryInterval;
- (id)_everyoneModeExpiryDate;
- (id)_myAppleID;
- (id)addAdditionalInformationToMeCard:(id)a3;
- (id)awdlDevice;
- (id)awdlInfoForPeerWithServiceName:(id)a3;
- (id)awdlNetwork;
- (id)awdlStateInfo;
- (id)commonNameForCertificate:(__SecCertificate *)a3;
- (id)contactIdentifierForMediumHashes:(id)a3;
- (id)contactWithContactIdentifier:(id)a3;
- (id)contactWithPreferredIdentifierForContacts:(id)a3;
- (id)contactsForEmailHash:(id)a3 phoneHash:(id)a4;
- (id)contactsWithPhoneNumberOrEmail:(id)a3 keys:(id)a4;
- (id)createHostNameKey:(id)a3;
- (id)defaultDiscoverableMode;
- (id)defaultWiFiDevice;
- (id)emailAddressesForAppleID:(id)a3;
- (id)emailOrPhoneForEmailHash:(id)a3 phoneHash:(id)a4;
- (id)emailsForContact:(id)a3;
- (id)instantMessageEmailsForContact:(id)a3;
- (id)mountPointsForServer:(id)a3;
- (id)newDiscoverableMode;
- (id)odiskMountPointsForServer:(id)a3;
- (id)phoneNumbersForAppleID:(id)a3;
- (id)phoneNumbersForContact:(id)a3;
- (id)reconciledDiscoverableMode;
- (id)serverNameForHost:(id)a3;
- (id)stringForWatchWristState:(int64_t)a3;
- (id)systemMonitor;
- (id)unifiedAppleIDInfo;
- (id)verifiedIdentityForAppleID:(id)a3;
- (id)wifiSSIDForSSIDHash:(id)a3;
- (int)minPersonImageSize;
- (int)pairedWatchLockState;
- (int)sidebarMaxCount;
- (int)workgroupThreshold;
- (int64_t)appleIDAccountState;
- (int64_t)autoHotspotState;
- (int64_t)deviceKeyBagState;
- (int64_t)discoverableLevel;
- (int64_t)familyHotspotStateForAltDSID:(id)a3;
- (int64_t)mediaAccessControlSetting;
- (int64_t)pairedWatchWristState;
- (int64_t)signalStrength;
- (int64_t)watchWristState;
- (unsigned)networkType;
- (unsigned)systemUIFlags;
- (unsigned)wifiPasswordSharingAvailability;
- (void)_cancelCheckForEveryoneModeExpiry;
- (void)_checkEveryoneModeExpiry;
- (void)_expireEveryoneModeAndOnlySetDefault:(BOOL)a3;
- (void)_scheduleCheckForEveryoneModeExpiry;
- (void)_updateEveryoneModeExpiryDateOnChange:(id)a3;
- (void)activate;
- (void)activateSystemMonitor;
- (void)addPreventExitForLocaleReason:(id)a3;
- (void)addServerName:(id)a3 forHostName:(id)a4;
- (void)airDropTransactionBegin:(BOOL)a3;
- (void)airDropTransactionEnd:(BOOL)a3;
- (void)airplaneModeChanged;
- (void)appleIDAccountInfoChanged:(id)a3;
- (void)bluetoothActivatedWithError:(id)a3;
- (void)bluetoothAddressChanged;
- (void)bluetoothDidSetPowerStateWithError:(id)a3;
- (void)bluetoothMonitorInvalidated;
- (void)bluetoothStateChanged;
- (void)cacheCertificate:(__SecCertificate *)a3 forRealName:(id)a4;
- (void)cacheIdentity:(id)a3;
- (void)cellularDataEnabled:(BOOL *)a3 airplaneMode:(BOOL *)a4;
- (void)clearComputerName;
- (void)clearConsoleUser;
- (void)clearLocalHostName;
- (void)clearMonitorCache;
- (void)clearMyAppleIDInfo;
- (void)clearMyIconAndHash;
- (void)clearWirelessState;
- (void)contactStoreDidChange:(id)a3;
- (void)d2dEncryptionAvailableWithCompletionHandler:(id)a3;
- (void)d2dEncryptionChanged;
- (void)fixAltDSIDIfNeeded;
- (void)forceAWDLDeviceRefresh:(__WiFiDeviceClient *)a3;
- (void)handleAWDLState:(id)a3;
- (void)handleAppleAccountSignIn;
- (void)handleAppleAccountSignOut;
- (void)handleDynamicStoreCallback:(__SCDynamicStore *)a3 changedKeys:(__CFArray *)a4;
- (void)handleMISStateChanged:(id)a3;
- (void)handleNameMonitorCallBack:(const char *)a3 flags:(unsigned int)a4 error:(int)a5;
- (void)handleSleepWakeCallBack:(unsigned int)a3 messageArguement:(void *)a4;
- (void)handleWiFiPasswordSharingChanged;
- (void)installAirPlayPreferencesMonitor;
- (void)installAppleIDAccountInfoMonitor;
- (void)installAppleIDUsernameMonitor;
- (void)installBluetoothMonitor;
- (void)installBonjourNameMonitor;
- (void)installContactsMonitor;
- (void)installD2DEncryptionMonitor;
- (void)installDisplaySleepMonitor;
- (void)installDynamicStoreCallBack;
- (void)installKeyBagUnlockMonitor;
- (void)installLocaleChangeMonitor;
- (void)installMISMonitor;
- (void)installManagedConfigurationMonitor;
- (void)installSSIDCacheMonitor;
- (void)installSleepWakeCallBack;
- (void)installSmartCoverStatusMonitor;
- (void)installWiFiPasswordSharingMonitor;
- (void)installWifiInterfaceMonitor;
- (void)installWirelessMonitor;
- (void)logAirDropTransactionForClientServer:(BOOL)a3 beginEnd:(BOOL)a4 count:(int)a5;
- (void)logWiFiPowerState;
- (void)managedConfigurationSettingsChanged:(id)a3;
- (void)meCardChanged:(id)a3;
- (void)postNotification:(id)a3;
- (void)postNotification:(id)a3 userInfo:(id)a4;
- (void)pushDateForPreventExitForLocaleReason:(id)a3 expirationDate:(id)a4;
- (void)reloadSMBConfInfo;
- (void)removePreventExitForLocaleReason:(id)a3;
- (void)removeServerName:(id)a3;
- (void)resetMeCardWithReason:(id)a3;
- (void)restartBonjourNameMonitor;
- (void)retryInstallBluetoothMonitor;
- (void)setAirDropPublished:(BOOL)a3;
- (void)setBluetoothEnabled:(BOOL)a3;
- (void)setDiscoverableMode:(id)a3;
- (void)setFinderServer:(id)a3;
- (void)setNextAirDropID:(id)a3;
- (void)setODiskMountPoints:(id)a3;
- (void)setServerMountPoints:(id)a3;
- (void)setWirelessEnabled:(BOOL)a3;
- (void)uninstallBonjourNameMonitor;
- (void)updateAWDLStateInfo;
- (void)updateAirDropAllowed;
- (void)updateAutoHotspotState;
- (void)updateBlacklistedAppBundleIDs;
- (void)updateDiscoverableMode;
- (void)updateFamilyHotspotState;
- (void)updateLocalPowerSource:(id)a3;
- (void)updateMediaAccessControlSetting:(BOOL)a3;
- (void)updatePairedWatchLockState:(int)a3;
- (void)updatePairedWatchWristState:(int64_t)a3;
- (void)updatePersonalHotspotAllowed;
- (void)updateWatchWristState:(int64_t)a3;
- (void)updateWifiState:(int64_t)a3;
- (void)updateWirelessCritical:(BOOL)a3;
- (void)updateWirelessDevice;
@end

@implementation SDStatusMonitor

+ (SDStatusMonitor)sharedMonitor
{
  if (qword_1006571D0 != -1) {
    dispatch_once(&qword_1006571D0, &stru_1005CF5C0);
  }
  [(id)qword_1006571D8 activate];
  return (SDStatusMonitor *)(id)qword_1006571D8;
}

- (SDStatusMonitor)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SDStatusMonitor;
  v2 = -[SDStatusMonitor init](&v32, "init");
  v3 = v2;
  if (v2)
  {
    myAppleID = v2->_myAppleID;
    v2->_myAppleID = 0LL;

    myAppleIDCommonName = v3->_myAppleIDCommonName;
    v3->_myAppleIDCommonName = 0LL;

    workgroup = v3->_workgroup;
    v3->_workgroup = 0LL;

    localHostName = v3->_localHostName;
    v3->_localHostName = 0LL;

    consoleUser = v3->_consoleUser;
    v3->_consoleUser = 0LL;

    computerName = v3->_computerName;
    v3->_computerName = 0LL;

    bonjourName = v3->_bonjourName;
    v3->_bonjourName = 0LL;

    netbiosName = v3->_netbiosName;
    v3->_netbiosName = 0LL;

    myEmailHashes = v3->_myEmailHashes;
    v3->_myEmailHashes = 0LL;

    myPhoneHashes = v3->_myPhoneHashes;
    v3->_myPhoneHashes = 0LL;

    serverNames = v3->_serverNames;
    v3->_serverNames = 0LL;

    identities = v3->_identities;
    v3->_identities = 0LL;

    mountPoints = v3->_mountPoints;
    v3->_mountPoints = 0LL;

    deviceUIUnlocked = v3->_deviceUIUnlocked;
    v3->_deviceUIUnlocked = 0LL;

    deviceKeyBagState = v3->_deviceKeyBagState;
    v3->_deviceKeyBagState = 0LL;

    currentDiscoverableMode = v3->_currentDiscoverableMode;
    v3->_currentDiscoverableMode = 0LL;

    deviceSupportsWAPI = v3->_deviceSupportsWAPI;
    v3->_deviceSupportsWAPI = 0LL;

    deviceInformation = v3->_deviceInformation;
    v3->_deviceInformation = 0LL;

    awdlState = v3->_awdlState;
    v3->_awdlState = 0LL;

    preventLocaleRestart = v3->_preventLocaleRestart;
    v3->_preventLocaleRestart = 0LL;

    screenOn = v3->_screenOn;
    v3->_screenOn = 0LL;

    systemMonitor = v3->__systemMonitor;
    v3->__systemMonitor = 0LL;

    backlightOn = v3->_backlightOn;
    v3->_backlightOn = 0LL;

    objc_storeWeak((id *)&v3->_finderServer, 0LL);
    handoffVisible = v3->_handoffVisible;
    v3->_handoffVisible = 0LL;

    odisksMountPoints = v3->_odisksMountPoints;
    v3->_odisksMountPoints = 0LL;

    v3->_dynamicStoreSource = 0LL;
    v3->_smbPreferences = 0LL;
    v3->_notifyPortRef = 0LL;
    v3->_nameMonitor = 0LL;
    v3->_rootPort = 0;
    v3->_myAppleIDCertificate = 0LL;
    v3->_myAppleIDSecIdentity = 0LL;
    v3->_myAppleIDIntermediateCertificate = 0LL;
    v3->_wifiDevice = 0LL;
    v3->_wifiManager = 0LL;
    v3->_awdlDevice = 0LL;
    *(_WORD *)&v3->_wifiDeviceAttachmentRegistered = 0;
    *(void *)&v3->_airDropCount = 0xFFFFFFFF00000000LL;
    v3->_airPlayPrefsToken = -1;
    v3->_notifierObject = 0;
    v3->_consoleUserID = -1;
    v3->_uiLockStatusToken = 0;
    v3->_keyBagUnlockToken = 0;
    v3->_backlightLevelToken = 0;
    v3->_airDropPublished = 0;
    v3->_deviceIsHighPriority = 0;
    v3->_deviceWasUnlockedOnce = 0;
    v3->_finderAirDropEnabled = 0;
    v3->_screenBlankedToken = -1;
    v3->_pairedWatchWristState = 0LL;
    v33 = @"ExtendedDeviceLockState";
    v34 = &__kCFBooleanTrue;
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    mkbOptions = v3->_mkbOptions;
    v3->_mkbOptions = (NSDictionary *)v29;

    v3->_sleepModeOn = 0;
    v3->_mediaAccessControlSetting = 0LL;
  }

  return v3;
}

- (void)activate
{
  if (!self->_activateStarted)
  {
    self->_activateStarted = 1;
    -[SDStatusMonitor installSleepStateMonitor](self, "installSleepStateMonitor");
    -[SDStatusMonitor installManagedConfigurationMonitor](self, "installManagedConfigurationMonitor");
    -[SDStatusMonitor installFinderSidebarPrefsMonitor](self, "installFinderSidebarPrefsMonitor");
    -[SDStatusMonitor installWirelessCarPlayMonitor](self, "installWirelessCarPlayMonitor");
    -[SDStatusMonitor installSMBPreferencesMonitor](self, "installSMBPreferencesMonitor");
    -[SDStatusMonitor installCarPlayStatusMonitor](self, "installCarPlayStatusMonitor");
    -[SDStatusMonitor installDynamicStoreCallBack](self, "installDynamicStoreCallBack");
    -[SDStatusMonitor installLocaleChangeMonitor](self, "installLocaleChangeMonitor");
    -[SDStatusMonitor installSpringBoardStateMonitor](self, "installSpringBoardStateMonitor");
    -[SDStatusMonitor installBacklightServicesMonitor](self, "installBacklightServicesMonitor");
    -[SDStatusMonitor installSystemUIMonitor](self, "installSystemUIMonitor");
    -[SDStatusMonitor installMirroringMonitor](self, "installMirroringMonitor");
    -[SDStatusMonitor installDisplaySleepMonitor](self, "installDisplaySleepMonitor");
    -[SDStatusMonitor installDisplayConfigurationMonitor](self, "installDisplayConfigurationMonitor");
    -[SDStatusMonitor installClamshellStateChangeMonitor](self, "installClamshellStateChangeMonitor");
    -[SDStatusMonitor installSmartCoverStatusMonitor](self, "installSmartCoverStatusMonitor");
    uint64_t v3 = MKBDeviceUnlockedSinceBoot(-[SDStatusMonitor installBonjourNameMonitor](self, "installBonjourNameMonitor"));
    if ((_DWORD)v3 == 1)
    {
      self->_deviceWasUnlockedOnce = 1;
      uint64_t v4 = daemon_log(v3);
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device has already been unlocked", v6, 2u);
      }

      -[SDStatusMonitor installContactsMonitor](self, "installContactsMonitor");
    }

    -[SDStatusMonitor installKeyBagUnlockMonitor](self, "installKeyBagUnlockMonitor");
    -[SDStatusMonitor installUserPictureMonitor](self, "installUserPictureMonitor");
    -[SDStatusMonitor installUILockStatusMonitor](self, "installUILockStatusMonitor");
    -[SDStatusMonitor installSleepWakeCallBack](self, "installSleepWakeCallBack");
    -[SDStatusMonitor installBluetoothMonitor](self, "installBluetoothMonitor");
    -[SDStatusMonitor installD2DEncryptionMonitor](self, "installD2DEncryptionMonitor");
    -[SDStatusMonitor installWirelessMonitor](self, "installWirelessMonitor");
    -[SDStatusMonitor installAppleIDAccountInfoMonitor](self, "installAppleIDAccountInfoMonitor");
    -[SDStatusMonitor installAppleIDUsernameMonitor](self, "installAppleIDUsernameMonitor");
    -[SDStatusMonitor installVolumesMonitor](self, "installVolumesMonitor");
    -[SDStatusMonitor installBacklightMonitor](self, "installBacklightMonitor");
    -[SDStatusMonitor installSleepNotification](self, "installSleepNotification");
    -[SDStatusMonitor installWiFiPasswordSharingMonitor](self, "installWiFiPasswordSharingMonitor");
    -[SDStatusMonitor installWifiInterfaceMonitor](self, "installWifiInterfaceMonitor");
    -[SDStatusMonitor installSSIDCacheMonitor](self, "installSSIDCacheMonitor");
    -[SDStatusMonitor installWristStateMonitor](self, "installWristStateMonitor");
    -[SDStatusMonitor installMISMonitor](self, "installMISMonitor");
    -[SDStatusMonitor installCoreTelephonyMonitor](self, "installCoreTelephonyMonitor");
    -[SDStatusMonitor installAirplaneModeMonitor](self, "installAirplaneModeMonitor");
    -[SDStatusMonitor installAirPlayPreferencesMonitor](self, "installAirPlayPreferencesMonitor");
    -[SDStatusMonitor installLowPowerModeMonitor](self, "installLowPowerModeMonitor");
    -[SDStatusMonitor installSystemStateInterfaces](self, "installSystemStateInterfaces");
    self->_multipleUsersLoggedIn = -[SDStatusMonitor _multipleUsersLoggedIn](self, "_multipleUsersLoggedIn");
    -[SDStatusMonitor activateSystemMonitor](self, "activateSystemMonitor");
  }

- (id)systemMonitor
{
  systemMonitor = self->__systemMonitor;
  if (!systemMonitor)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    v5 = self->__systemMonitor;
    self->__systemMonitor = v4;

    -[CUSystemMonitor setDispatchQueue:](self->__systemMonitor, "setDispatchQueue:", &_dispatch_main_q);
    systemMonitor = self->__systemMonitor;
  }

  return systemMonitor;
}

- (void)activateSystemMonitor
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  [v2 activateWithCompletion:0];
}

- (void)clearMonitorCache
{
  uint64_t v3 = daemon_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "clearMonitorCache", v17, 2u);
  }

  bonjourName = self->_bonjourName;
  self->_bonjourName = 0LL;

  computerName = self->_computerName;
  self->_computerName = 0LL;

  consoleUser = self->_consoleUser;
  self->_consoleUser = 0LL;

  localHostName = self->_localHostName;
  self->_localHostName = 0LL;

  netbiosName = self->_netbiosName;
  self->_netbiosName = 0LL;

  screenOn = self->_screenOn;
  self->_screenOn = 0LL;

  backlightOn = self->_backlightOn;
  self->_backlightOn = 0LL;

  workgroup = self->_workgroup;
  self->_workgroup = 0LL;

  myAppleIDCertificate = self->_myAppleIDCertificate;
  if (myAppleIDCertificate)
  {
    CFRelease(myAppleIDCertificate);
    self->_myAppleIDCertificate = 0LL;
  }

  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  if (myAppleIDIntermediateCertificate)
  {
    CFRelease(myAppleIDIntermediateCertificate);
    self->_myAppleIDIntermediateCertificate = 0LL;
  }

  myAppleIDSecIdentity = self->_myAppleIDSecIdentity;
  if (myAppleIDSecIdentity)
  {
    CFRelease(myAppleIDSecIdentity);
    self->_myAppleIDSecIdentity = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDStatusMonitor clearMonitorCache]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v16);
}

- (NSString)description
{
  id v19 = 0LL;
  NSAppendPrintF(&v19, "-- SDStatusMonitor --\n");
  id v3 = v19;
  id v18 = v3;
  NSAppendPrintF(&v18, "Current Discoverable Mode:    %@\n", self->_currentDiscoverableMode);
  id v4 = v18;

  id v17 = v4;
  if (-[SDStatusMonitor isAirDropAvailable](self, "isAirDropAvailable")) {
    v5 = "yes";
  }
  else {
    v5 = "no";
  }
  NSAppendPrintF(&v17, "AirDrop Available:            %s\n", v5);
  id v6 = v17;

  id v16 = v6;
  if (-[SDStatusMonitor isAirDropAllowed](self, "isAirDropAllowed")) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  NSAppendPrintF(&v16, "AirDrop Allowed:              %s\n", v7);
  id v8 = v16;

  id v15 = v8;
  if (-[SDStatusMonitor enableAirDropAdvertising](self, "enableAirDropAdvertising")) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  NSAppendPrintF(&v15, "AirDrop Advertising:          %s\n", v9);
  id v10 = v15;

  id v14 = v10;
  if (-[SDStatusMonitor enableAirDropReceiving](self, "enableAirDropReceiving")) {
    v11 = "yes";
  }
  else {
    v11 = "no";
  }
  NSAppendPrintF(&v14, "AirDrop Receiving:            %s\n", v11);
  id v12 = v14;

  return (NSString *)v12;
}

- (void)addServerName:(id)a3 forHostName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  pthread_mutex_lock(&stru_100643A38);
  if (!self->_serverNames)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    serverNames = self->_serverNames;
    self->_serverNames = v7;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor createHostNameKey:](self, "createHostNameKey:", v6));
  if (v9) {
    -[NSMutableDictionary setValue:forKey:](self->_serverNames, "setValue:forKey:", v10, v9);
  }
  pthread_mutex_unlock(&stru_100643A38);
}

- (void)airDropTransactionBegin:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100643A38);
  -[SDStatusMonitor logAirDropTransactionForClientServer:beginEnd:count:]( self,  "logAirDropTransactionForClientServer:beginEnd:count:",  v3,  1LL,  self->_airDropCount);
  pthread_mutex_unlock(&stru_100643A38);
}

- (void)airDropTransactionEnd:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100643A38);
  --self->_airDropCount;
  -[SDStatusMonitor logAirDropTransactionForClientServer:beginEnd:count:]( self,  "logAirDropTransactionForClientServer:beginEnd:count:",  v3,  0LL);
  pthread_mutex_unlock(&stru_100643A38);
}

- (id)createHostNameKey:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 length];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);

  id v6 = [v5 mutableCopy];
  return v6;
}

- (id)defaultDiscoverableMode
{
  return kSFOperationDiscoverableModeOff;
}

- (int64_t)discoverableLevel
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self, "discoverableMode"));
  if (CFEqual(v2, kSFOperationDiscoverableModeEveryone)) {
    int64_t v3 = 2LL;
  }
  else {
    int64_t v3 = CFEqual(v2, kSFOperationDiscoverableModeContactsOnly) != 0;
  }

  return v3;
}

- (NSString)discoverableMode
{
  currentDiscoverableMode = self->_currentDiscoverableMode;
  if (!currentDiscoverableMode)
  {
    -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
    currentDiscoverableMode = self->_currentDiscoverableMode;
  }

  return currentDiscoverableMode;
}

- (BOOL)isAirDropReady
{
  unsigned int v3 = -[SDStatusMonitor wirelessEnabled](self, "wirelessEnabled");
  unsigned int v4 = -[SDStatusMonitor wirelessCarPlay](self, "wirelessCarPlay");
  unsigned int v5 = -[SDStatusMonitor bluetoothEnabledIncludingRestricted](self, "bluetoothEnabledIncludingRestricted");
  unsigned int v6 = -[SDStatusMonitor enableAirDropReceiving](self, "enableAirDropReceiving");
  int IsVirtualMachine = SFDeviceIsVirtualMachine();
  unsigned int v8 = -[SDStatusMonitor isClarityBoardEnabled](self, "isClarityBoardEnabled");
  BOOL v9 = -[SDStatusMonitor isMulticastAdvertisementsDisabled](self, "isMulticastAdvertisementsDisabled");
  BOOL v10 = v6 & v5 & v3 ^ 1 | v4 | v8 | v9;
  if (v10)
  {
    BOOL v11 = v9;
    uint64_t v12 = airdrop_log(v9);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67110400;
      v15[1] = v3;
      __int16 v16 = 1024;
      unsigned int v17 = v5;
      __int16 v18 = 1024;
      unsigned int v19 = v4;
      __int16 v20 = 1024;
      unsigned int v21 = v6;
      __int16 v22 = 1024;
      int v23 = IsVirtualMachine;
      __int16 v24 = 1024;
      BOOL v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "AirDrop not ready: wifi=%d, bluetooth=%d, carplay=%d, receivingEnabled=%d, isVirtualMachine=%d isMulticastAdvert isementsDisabled=%d",  (uint8_t *)v15,  0x26u);
    }
  }

  return !v10;
}

- (BOOL)isClarityBoardEnabled
{
  return 0;
}

- (id)mountPointsForServer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100643A38);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_mountPoints, "objectForKeyedSubscript:", v4));

  id v6 = [v5 copy];
  pthread_mutex_unlock(&stru_100643A38);

  return v6;
}

- (id)newDiscoverableMode
{
  if (!-[SDStatusMonitor isAirDropAllowed](self, "isAirDropAllowed"))
  {
    unsigned int v8 = (id *)&kSFOperationDiscoverableModeDisabled;
    return *v8;
  }

  if (!-[SDStatusMonitor isAirDropReady](self, "isAirDropReady"))
  {
    unsigned int v8 = (id *)&kSFOperationDiscoverableModeOff;
    return *v8;
  }

  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor reconciledDiscoverableMode](self, "reconciledDiscoverableMode"));
  unint64_t v4 = -[SDStatusMonitor appleIDAccountState](self, "appleIDAccountState");
  BOOL v5 = -[SDStatusMonitor eduModeEnabled](self, "eduModeEnabled");
  BOOL v6 = v5;
  if (v4 == 1 && !v5) {
    return v3;
  }
  uint64_t v9 = airdrop_log(v5);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 0xE) {
      BOOL v11 = @"?";
    }
    else {
      BOOL v11 = (const __CFString *)*((void *)&off_1005CF708 + v4);
    }
    int v13 = 138412546;
    id v14 = v11;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Discoverable mode off: appleIDAccountState=%@ eduModeEnabled=%d",  (uint8_t *)&v13,  0x12u);
  }

  id v12 = kSFOperationDiscoverableModeOff;
  return v12;
}

- (id)odiskMountPointsForServer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100643A38);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_odisksMountPoints, "objectForKeyedSubscript:", v4));

  id v6 = [v5 copy];
  pthread_mutex_unlock(&stru_100643A38);

  return v6;
}

- (id)reconciledDiscoverableMode
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSFOperationDiscoverableModeKey]);
  if (v4)
  {
    BOOL v5 = v4;
    id v6 = @"User Defaults";
  }

  else
  {
    requestedDiscoverableMode = self->_requestedDiscoverableMode;
    if (requestedDiscoverableMode) {
      unsigned int v8 = requestedDiscoverableMode;
    }
    else {
      unsigned int v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor defaultDiscoverableMode](self, "defaultDiscoverableMode"));
    }
    BOOL v5 = (__CFString *)v8;
    if (self->_requestedDiscoverableMode) {
      uint64_t v9 = @"Requested";
    }
    else {
      uint64_t v9 = @"Default";
    }
    id v4 = v9;
    id v6 = v4;
  }

  uint64_t v10 = airdrop_log(v4);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    __int16 v15 = v5;
    __int16 v16 = 2112;
    unsigned int v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Reconciled discoverable mode: %@ (%@)",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = v5;
  return v12;
}

- (void)removeServerName:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&stru_100643A38);
  if (self->_serverNames)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor createHostNameKey:](self, "createHostNameKey:", v5));
    if (v4) {
      -[NSMutableDictionary removeObjectForKey:](self->_serverNames, "removeObjectForKey:", v4);
    }
  }

  pthread_mutex_unlock(&stru_100643A38);
}

- (id)serverNameForHost:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100643A38);
  if (self->_serverNames)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor createHostNameKey:](self, "createHostNameKey:", v4));
    if (v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_serverNames, "objectForKeyedSubscript:", v5));
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  pthread_mutex_unlock(&stru_100643A38);

  return v6;
}

- (void)setODiskMountPoints:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&stru_100643A38);
  if (sub_10008E314(self->_odisksMountPoints, v5))
  {
    objc_storeStrong((id *)&self->_odisksMountPoints, a3);
    pthread_mutex_unlock(&stru_100643A38);
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.ODiskMountPointsChanged");
  }

  else
  {
    pthread_mutex_unlock(&stru_100643A38);
  }
}

- (void)setDiscoverableMode:(id)a3
{
  id v4 = (NSString *)a3;
  pthread_mutex_lock(&stru_100643A38);
  requestedDiscoverableMode = self->_requestedDiscoverableMode;
  self->_requestedDiscoverableMode = v4;

  pthread_mutex_unlock(&stru_100643A38);
  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
}

- (void)setServerMountPoints:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&stru_100643A38);
  if (sub_10008E314(self->_mountPoints, v5))
  {
    objc_storeStrong((id *)&self->_mountPoints, a3);
    pthread_mutex_unlock(&stru_100643A38);
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.MountPointsChanged");
  }

  else
  {
    pthread_mutex_unlock(&stru_100643A38);
  }
}

- (void)updateDiscoverableMode
{
  id v3 = -[SDStatusMonitor newDiscoverableMode](self, "newDiscoverableMode");
  pthread_mutex_lock(&stru_100643A38);
  id v4 = self->_currentDiscoverableMode;
  unsigned __int8 v5 = [v3 isEqual:v4];
  objc_storeStrong((id *)&self->_currentDiscoverableMode, v3);
  pthread_mutex_unlock(&stru_100643A38);
  if ((v5 & 1) == 0 && v4) {
    -[SDStatusMonitor _updateEveryoneModeExpiryDateOnChange:](self, "_updateEveryoneModeExpiryDateOnChange:", v3);
  }
  if ((v5 & 1) == 0)
  {
    id v6 = -[SDStatusMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.DiscoverableModeChanged");
    if (self->_airDropModeNotifyToken != -1)
    {
      if ([v3 isEqual:kSFOperationDiscoverableModeOff])
      {
        uint64_t v7 = 1LL;
      }

      else if ([v3 isEqual:kSFOperationDiscoverableModeContactsOnly])
      {
        uint64_t v7 = 2LL;
      }

      else if ([v3 isEqual:kSFOperationDiscoverableModeEveryone])
      {
        uint64_t v7 = 3LL;
      }

      else
      {
        uint64_t v7 = [v3 isEqual:kSFOperationDiscoverableModeDisabled];
      }

      notify_set_state(self->_airDropModeNotifyToken, v7);
      id v6 = (id)notify_post("com.apple.sharing.airdrop-mode-changed");
    }

    uint64_t v8 = airdrop_log(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      BOOL v11 = v4;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Discoverable mode changed from %@ to %@, posting notification",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (int64_t)appleIDAccountState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));

  if (v3)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 accountStatusForAppleID:v6]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"AccountState"]);
    unint64_t v9 = CFGetInt64(v8, 0LL);
  }

  else
  {
    unint64_t v9 = 13LL;
  }

  uint64_t v10 = airdrop_log(v4);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 0xE) {
      __int16 v12 = @"?";
    }
    else {
      __int16 v12 = (const __CFString *)*((void *)&off_1005CF708 + v9);
    }
    int v14 = 138412290;
    __int16 v15 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Apple ID account state: %@",  (uint8_t *)&v14,  0xCu);
  }

  return v9;
}

- (BOOL)verifyAndParseValidationRecordData:(id)a3 intoDictionary:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = SFAppleIDParseValidationRecordDataSync(v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    uint64_t v10 = airdrop_log(v9);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = mach_absolute_time();
      int v14 = 134217984;
      uint64_t v15 = UpTicksToMilliseconds(v12 - v6);
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Verified validation record data (%ld ms)\n",  (uint8_t *)&v14,  0xCu);
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v8 != 0LL;
}

- (void)cacheCertificate:(__SecCertificate *)a3 forRealName:(id)a4
{
  id v9 = a4;
  pthread_mutex_lock(&stru_100643A38);
  if (!self->_certificates)
  {
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    certificates = self->_certificates;
    self->_certificates = v6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 lowercaseString]);
  if (v8) {
    -[NSMutableDictionary setValue:forKey:](self->_certificates, "setValue:forKey:", a3, v8);
  }
  pthread_mutex_unlock(&stru_100643A38);
}

- (void)cacheIdentity:(id)a3
{
  id v8 = a3;
  pthread_mutex_lock(&stru_100643A38);
  if (!self->_identities)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    identities = self->_identities;
    self->_identities = v4;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 emailOrPhone]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lowercaseString]);

  if (v7) {
    -[NSMutableDictionary setValue:forKey:](self->_identities, "setValue:forKey:", v8, v7);
  }
  pthread_mutex_unlock(&stru_100643A38);
}

- (void)clearMyAppleIDInfo
{
  uint64_t v3 = daemon_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clear my Apple ID called", v13, 2u);
  }

  pthread_mutex_lock(&stru_100643A38);
  myAppleID = self->_myAppleID;
  self->_myAppleID = 0LL;

  myAppleIDCommonName = self->_myAppleIDCommonName;
  self->_myAppleIDCommonName = 0LL;

  myEmailHashes = self->_myEmailHashes;
  self->_myEmailHashes = 0LL;

  myPhoneHashes = self->_myPhoneHashes;
  self->_myPhoneHashes = 0LL;

  myAppleIDCertificate = self->_myAppleIDCertificate;
  if (myAppleIDCertificate)
  {
    CFRelease(myAppleIDCertificate);
    self->_myAppleIDCertificate = 0LL;
  }

  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  if (myAppleIDIntermediateCertificate)
  {
    CFRelease(myAppleIDIntermediateCertificate);
    self->_myAppleIDIntermediateCertificate = 0LL;
  }

  myAppleIDSecIdentity = self->_myAppleIDSecIdentity;
  if (myAppleIDSecIdentity)
  {
    CFRelease(myAppleIDSecIdentity);
    self->_myAppleIDSecIdentity = 0LL;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDStatusMonitor clearMyAppleIDInfo]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v12);

  pthread_mutex_unlock(&stru_100643A38);
}

- (id)commonNameForCertificate:(__SecCertificate *)a3
{
  uint64_t v3 = (const __CFArray *)SecCertificateCopyCommonNames(a3, a2);
  if (v3)
  {
    uint64_t v4 = v3;
    if (CFArrayGetCount(v3))
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, 0LL);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(ValueAtIndex);
    }

    else
    {
      uint64_t v9 = daemon_log(0LL);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001426A0();
      }

      uint64_t v6 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    uint64_t v7 = daemon_log(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100142674();
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (__SecCertificate)copyCertificateForRealName:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100643A38);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);

  id v6 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_certificates,  "objectForKeyedSubscript:",  v5));
  pthread_mutex_unlock(&stru_100643A38);

  return (__SecCertificate *)v6;
}

- (__SecCertificate)copyMyAppleIDCertificate
{
  uint64_t v3 = -[SDStatusMonitor _copyMyAppleIDCertificate](self, "_copyMyAppleIDCertificate");
  pthread_mutex_unlock(&stru_100643A38);
  return v3;
}

- (__SecCertificate)_copyMyAppleIDCertificate
{
  if (!self->_myAppleIDCertificate)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 myAccount]);

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
      self->_myAppleIDCertificate = (__SecCertificate *)[v5 copyCertificate];
    }
  }

  result = self->_myAppleIDIntermediateCertificate;
  if (result)
  {
    CFRetain(result);
    return self->_myAppleIDIntermediateCertificate;
  }

  return result;
}

- (__SecCertificate)copyMyAppleIDIntermediateCertificate
{
  return -[SDStatusMonitor _copyMyAppleIDIntermediateCertificate](self, "_copyMyAppleIDIntermediateCertificate");
}

- (__SecCertificate)_copyMyAppleIDIntermediateCertificate
{
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  pthread_mutex_unlock(&stru_100643A38);
  if (!myAppleIDIntermediateCertificate)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 myAccount]);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
      uint64_t v7 = (__SecCertificate *)[v6 copyIntermediateCertificate];

      pthread_mutex_lock(&stru_100643A38);
      self->_myAppleIDIntermediateCertificate = v7;
      pthread_mutex_unlock(&stru_100643A38);
    }
  }

  pthread_mutex_lock(&stru_100643A38);
  id v8 = self->_myAppleIDIntermediateCertificate;
  if (v8)
  {
    CFRetain(v8);
    uint64_t v9 = self->_myAppleIDIntermediateCertificate;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  pthread_mutex_unlock(&stru_100643A38);
  return v9;
}

- (__SecIdentity)copyMyAppleIDSecIdentity
{
  uint64_t v3 = -[SDStatusMonitor _copyMyAppleIDSecIdentity](self, "_copyMyAppleIDSecIdentity");
  pthread_mutex_unlock(&stru_100643A38);
  return v3;
}

- (__SecIdentity)_copyMyAppleIDSecIdentity
{
  result = self->_myAppleIDSecIdentity;
  if (result) {
    goto LABEL_5;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    self->_myAppleIDSecIdentity = (__SecIdentity *)[v5 copyIdentityForAppleID:v4];
  }

  result = self->_myAppleIDSecIdentity;
  if (result)
  {
LABEL_5:
    CFRetain(result);
    return self->_myAppleIDSecIdentity;
  }

  return result;
}

- (id)emailAddressesForAppleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountForAppleID:v3]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contactInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 validatedEmailAddresses]);

  return v7;
}

- (void)fixAltDSIDIfNeeded
{
  if (-[SDStatusMonitor altDSIDNeedsFixing](self, "altDSIDNeedsFixing"))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    id v4 = sub_100114D1C(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100138714;
      v9[3] = &unk_1005CF5E8;
      uint64_t v10 = v3;
      id v11 = v5;
      uint64_t v12 = self;
      -[ACAccountStore aa_updatePropertiesForAppleAccount:completion:]( v10,  "aa_updatePropertiesForAppleAccount:completion:",  v11,  v9);

      id v6 = (os_log_s *)v10;
    }

    else
    {
      uint64_t v7 = tethering_log();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No primary account, not fixing appleID",  v8,  2u);
      }
    }
  }

- (void)handleAppleAccountSignIn
{
  uint64_t v3 = daemon_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple Account signed in", v5, 2u);
  }

  -[SDStatusMonitor clearMyAppleIDInfo](self, "clearMyAppleIDInfo");
  -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.AppleAccountSignIn");
}

- (void)handleAppleAccountSignOut
{
  uint64_t v3 = daemon_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple Account signed out", v5, 2u);
  }

  -[SDStatusMonitor clearMyAppleIDInfo](self, "clearMyAppleIDInfo");
  -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.AppleAccountSignOut");
}

- (id)phoneNumbersForAppleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountForAppleID:v3]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contactInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 validatedPhoneNumbers]);

  return v7;
}

- (id)unifiedAppleIDInfo
{
  id v3 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self, "copyMyAppleIDSecIdentity");
  if (v3)
  {
    id v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDEmailAddresses](self, "myAppleIDEmailAddresses"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDPhoneNumbers](self, "myAppleIDPhoneNumbers"));
    if ([v5 count] || objc_msgSend(v35, "count"))
    {
      id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v42;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v42 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = sub_100116524(*(void **)(*((void *)&v41 + 1) + 8LL * (void)v12), 1);
            int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

            uint64_t v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }

        while (v10);
      }

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v15 = v35;
      id v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v38;
        do
        {
          unsigned int v19 = 0LL;
          do
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = sub_100116604(*(void **)(*((void *)&v37 + 1) + 8LL * (void)v19));
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

            unsigned int v19 = (char *)v19 + 1;
          }

          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }

        while (v17);
      }

      unint64_t v22 = (unint64_t)-[NSMutableArray count](v6, "count");
      unint64_t v23 = (unint64_t)-[NSMutableArray count](v7, "count");
      if (v22 | v23)
      {
        unint64_t v24 = v23;
        BOOL v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        if (v22 <= v24) {
          unint64_t v26 = v24;
        }
        else {
          unint64_t v26 = v22;
        }
        if (v26)
        {
          for (unint64_t i = 0LL; i != v26; ++i)
          {
            if (i < v22)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", i));
              -[NSMutableArray addObject:](v25, "addObject:", v28);
            }

            if (i < v24)
            {
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i));
              -[NSMutableArray addObject:](v25, "addObject:", v29);
            }
          }
        }
      }

      else
      {
        uint64_t v31 = daemon_log(v23);
        objc_super v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "No normalized emails or phone numbers",  buf,  2u);
        }

        BOOL v25 = 0LL;
      }
    }

    else
    {
      uint64_t v34 = daemon_log(0LL);
      id v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "No emails or phone numbers",  buf,  2u);
      }

      BOOL v25 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    uint64_t v30 = daemon_log(0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "No Apple ID certificate", buf, 2u);
    }

    BOOL v25 = 0LL;
  }

  return v25;
}

- (id)verifiedIdentityForAppleID:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100643A38);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identities, "objectForKeyedSubscript:", v5));
  pthread_mutex_unlock(&stru_100643A38);

  return v6;
}

- (id)awdlDevice
{
  awdlDevice = self->_awdlDevice;
  if (!awdlDevice)
  {
    -[SDStatusMonitor updateWirelessDevice](self, "updateWirelessDevice");
    awdlDevice = self->_awdlDevice;
  }

  return awdlDevice;
}

- (id)awdlInfoForPeerWithServiceName:(id)a3
{
  id v4 = a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlPeerList](self, "awdlPeerList"));
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    id v9 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
    do
    {
      for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(v9[194]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          id v13 = v11;
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"STATION_AWDL_SERVICES"]);
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v22;
            while (2)
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v22 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ([*(id *)(*((void *)&v21 + 1) + 8 * (void)j) containsString:v4])
                {

                  goto LABEL_21;
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v9 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      id v13 = 0LL;
    }

    while (v7);
  }

  else
  {
    id v13 = 0LL;
  }

- (id)awdlNetwork
{
  id v19 = 0LL;
  wifiDevice = self->_wifiDevice;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = v19;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = kWiFiNetworkRoleKey;
    while (2)
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t Property = WiFiNetworkGetProperty(v10, v8);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(Property);
        id v13 = v12;
        if (v12 && objc_msgSend(v12, "intValue", (void)v15) == 4)
        {
          id v14 = v10;

          goto LABEL_15;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_15:

  return v14;
}

- (NSDictionary)awdlState
{
  id v3 = -[NSDictionary copy](self->_awdlState, "copy");
  pthread_mutex_unlock(&stru_100643A38);
  return (NSDictionary *)v3;
}

- (id)addAdditionalInformationToMeCard:(id)a3
{
  id v4 = [a3 mutableCopy];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountForAppleID:v5]);

    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 givenName]);
      id v10 = [v9 length];

      if (!v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 contactInfo]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstName]);
        [v4 setGivenName:v12];
      }

      v55 = v5;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 familyName]);
      id v14 = [v13 length];

      if (!v14)
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 contactInfo]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastName]);
        [v4 setFamilyName:v16];
      }

      v57 = v4;
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumbers]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v17));

      v56 = v7;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 contactInfo]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 validatedPhoneNumbers]);

      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v21 = v20;
      id v22 = [v21 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v63;
        do
        {
          for (unint64_t i = 0LL; i != v23; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v63 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)i);
            __int128 v27 = objc_alloc(&OBJC_CLASS___CNLabeledValue);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[CNPhoneNumber phoneNumberWithStringValue:]( &OBJC_CLASS___CNPhoneNumber,  "phoneNumberWithStringValue:",  v26));
            uint64_t v29 = -[CNLabeledValue initWithLabel:value:](v27, "initWithLabel:value:", &stru_1005E3958, v28);

            [v18 addObject:v29];
          }

          id v23 = [v21 countByEnumeratingWithState:&v62 objects:v75 count:16];
        }

        while (v23);
      }

      [v57 setPhoneNumbers:v18];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v57 emailAddresses]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v30));

      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue([v7 contactInfo]);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 validatedEmailAddresses]);

      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v34 = v33;
      id v35 = [v34 countByEnumeratingWithState:&v58 objects:v74 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v59;
        do
        {
          for (j = 0LL; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v59 != v37) {
              objc_enumerationMutation(v34);
            }
            __int128 v39 = -[CNLabeledValue initWithLabel:value:]( objc_alloc(&OBJC_CLASS___CNLabeledValue),  "initWithLabel:value:",  &stru_1005E3958,  *(void *)(*((void *)&v58 + 1) + 8LL * (void)j));
            [v31 addObject:v39];
          }

          id v36 = [v34 countByEnumeratingWithState:&v58 objects:v74 count:16];
        }

        while (v36);
      }

      id v4 = v57;
      uint64_t v40 = daemon_log([v57 setEmailAddresses:v31]);
      __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v57 givenName]);
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v57 familyName]);
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v21 componentsJoinedByString:@","]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v34 componentsJoinedByString:@","]);
        *(_DWORD *)buf = 138413059;
        v67 = v42;
        __int16 v68 = 2112;
        v69 = v43;
        __int16 v70 = 2113;
        v71 = v44;
        __int16 v72 = 2113;
        v73 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Enhanced meCard: fn=%@,ln=%@,pnums=[%{private}@],emails=[%{private}@]",  buf,  0x2Au);

        id v4 = v57;
      }

      id v46 = v4;
      id v5 = v55;
      uint64_t v7 = v56;
    }

    else
    {
      uint64_t v50 = daemon_log(v8);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1001427E0((uint64_t)v5, v51, v52);
      }

      id v53 = v4;
    }
  }

  else
  {
    uint64_t v47 = daemon_log(0LL);
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_1001427B4();
    }

    id v49 = v4;
  }

  return v4;
}

- (void)clearMyIconAndHash
{
  uint64_t v3 = daemon_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clear my icon and hash requested", v6, 2u);
  }

  pthread_mutex_lock(&stru_100643A38);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDStatusMonitor clearMyIconAndHash]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v5);

  pthread_mutex_unlock(&stru_100643A38);
}

- (id)contactsForEmailHash:(id)a3 phoneHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropContactHashManager contactsForCombinedHash:]( self->_contactHashManager,  "contactsForCombinedHash:",  v6));
    -[NSMutableSet unionSet:](v8, "unionSet:", v9);
  }

  if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropContactHashManager contactsForCombinedHash:]( self->_contactHashManager,  "contactsForCombinedHash:",  v7));
    -[NSMutableSet unionSet:](v8, "unionSet:", v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v8));

  return v11;
}

- (id)contactIdentifierForMediumHashes:(id)a3
{
  return -[SDAirDropContactHashManager contactIdentifierForMediumHashes:]( self->_contactHashManager,  "contactIdentifierForMediumHashes:",  a3);
}

- (BOOL)contactIdentifierIsBlocked:(id)a3
{
  return 0;
}

- (BOOL)contactIsBlocked:(id)a3
{
  return 0;
}

- (BOOL)contactsContainsShortHashes:(id)a3
{
  return -[SDAirDropContactHashManager contactsContainsShortHashes:]( self->_contactHashManager,  "contactsContainsShortHashes:",  a3);
}

- (id)contactWithPreferredIdentifierForContacts:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 anyObject]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    id obj = v6;
    while (2)
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) != 0)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
          id v6 = obj;

          goto LABEL_13;
        }

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        id v18 = [v16 compare:v17];

        if (v18 == (id)1)
        {
          id v19 = v11;

          id v5 = v19;
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v6 = obj;
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v5 = v5;
  id v20 = v5;
LABEL_13:

  return v20;
}

- (BOOL)isEmail:(id)a3
{
  return [a3 containsString:@"@"];
}

- (id)contactsWithPhoneNumberOrEmail:(id)a3 keys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (-[SDStatusMonitor isEmail:](self, "isEmail:", v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingEmailAddress:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingEmailAddress:",  v7));
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](&OBJC_CLASS___CNPhoneNumber, "phoneNumberWithStringValue:", v7));

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingPhoneNumber:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingPhoneNumber:",  v9));
    id v7 = (id)v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:]( self->_contactStore,  "unifiedContactsMatchingPredicate:keysToFetch:error:",  v8,  v6,  0LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

  return v11;
}

- (id)contactWithContactIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  }

  else
  {
    uint64_t v23 = 0LL;
    __int128 v24 = &v23;
    uint64_t v25 = 0x3032000000LL;
    __int128 v26 = sub_100139DBC;
    __int128 v27 = sub_100139DCC;
    id v28 = 0LL;
    uint64_t v9 = objc_alloc(&OBJC_CLASS___CNContactFetchRequest);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager GeneralContactKeysToFetch]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "GeneralContactKeysToFetch"));
    uint64_t v11 = -[CNContactFetchRequest initWithKeysToFetch:](v9, "initWithKeysToFetch:", v10);

    id v29 = v4;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsWithIdentifiers:]( &OBJC_CLASS___CNContact,  "predicateForContactsWithIdentifiers:",  v12));
    -[CNContactFetchRequest setPredicate:](v11, "setPredicate:", v13);

    contactStore = self->_contactStore;
    id v22 = 0LL;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100139DD4;
    v21[3] = &unk_1005CF610;
    v21[4] = &v23;
    unsigned __int8 v15 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]( contactStore,  "enumerateContactsWithFetchRequest:error:usingBlock:",  v11,  &v22,  v21);
    id v16 = v22;
    __int128 v17 = v16;
    if ((v15 & 1) == 0)
    {
      uint64_t v18 = airdrop_log(v16);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10014285C();
      }
    }

    id v8 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }

  return v8;
}

- (id)emailsForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses", 0));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) value]);
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)emailOrPhoneForEmailHash:(id)a3 phoneHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropContactHashManager emailOrPhoneForCombinedHash:]( self->_contactHashManager,  "emailOrPhoneForCombinedHash:",  v6));
    if (!v8) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    if (!v7) {
      goto LABEL_7;
    }
  }

  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropContactHashManager emailOrPhoneForCombinedHash:]( self->_contactHashManager,  "emailOrPhoneForCombinedHash:",  v8));
  }
LABEL_7:

  return v9;
}

- (id)instantMessageEmailsForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instantMessageAddresses", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) value]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
        [v11 rangeOfString:@"@"];
        if (v12) {
          -[NSMutableArray addObject:](v4, "addObject:", v11);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

- (CNContact)meCard
{
  meCard = self->___meCard;
  if (!meCard)
  {
    contactStore = self->_contactStore;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager GeneralContactKeysToFetch]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "GeneralContactKeysToFetch"));
    id v20 = 0LL;
    id v6 = (CNContact *)objc_claimAutoreleasedReturnValue( -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:]( contactStore,  "_crossPlatformUnifiedMeContactWithKeysToFetch:error:",  v5,  &v20));
    id v7 = v20;

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v9 = -[CNContact isEqual:](v6, "isEqual:", v8);

    if ((v9 & 1) != 0 || !v6)
    {
      uint64_t v11 = airdrop_log(v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      __int128 v13 = v12;
      if (v7)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100142928();
        }
      }

      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        sub_1001428FC();
      }

      __int128 v14 = objc_opt_new(&OBJC_CLASS___CNContact);
      id v6 = v14;
    }

    uint64_t v15 = airdrop_log(v10);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1001428D0();
    }

    __int128 v17 = (CNContact *)objc_claimAutoreleasedReturnValue( -[SDStatusMonitor addAdditionalInformationToMeCard:]( self,  "addAdditionalInformationToMeCard:",  v6));
    uint64_t v18 = self->___meCard;
    self->___meCard = v17;

    -[SDAirDropContactHashManager setMeCard:](self->_contactHashManager, "setMeCard:", self->___meCard);
    meCard = self->___meCard;
  }

  return meCard;
}

- (void)resetMeCardWithReason:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013A2F8;
  v5[3] = &unk_1005CB480;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (id)phoneNumbersForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumbers", 0));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) value]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);
        -[NSMutableArray addObject:](v4, "addObject:", v11);

        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (int64_t)autoHotspotState
{
  personalHotspotAutoState = self->_personalHotspotAutoState;
  if (!personalHotspotAutoState)
  {
    unsigned int AutoInstantHotspotMode = WiFiManagerClientGetAutoInstantHotspotMode(self->_wifiManager, a2);
    if (AutoInstantHotspotMode <= 2) {
      uint64_t v5 = AutoInstantHotspotMode;
    }
    else {
      uint64_t v5 = 0LL;
    }
    id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
    id v7 = self->_personalHotspotAutoState;
    self->_personalHotspotAutoState = v6;

    personalHotspotAutoState = self->_personalHotspotAutoState;
  }

  return -[NSNumber integerValue](personalHotspotAutoState, "integerValue");
}

- (void)updateAutoHotspotState
{
  unint64_t v3 = -[NSNumber integerValue](self->_personalHotspotAutoState, "integerValue");
  unsigned int AutoInstantHotspotMode = WiFiManagerClientGetAutoInstantHotspotMode(self->_wifiManager, v4);
  if (AutoInstantHotspotMode <= 2) {
    uint64_t v6 = AutoInstantHotspotMode;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  personalHotspotAutoState = self->_personalHotspotAutoState;
  self->_personalHotspotAutoState = v7;

  NSInteger v9 = -[NSNumber integerValue](self->_personalHotspotAutoState, "integerValue");
  if (v3 != v9)
  {
    uint64_t v10 = daemon_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v3 > 2) {
        uint64_t v12 = "?";
      }
      else {
        uint64_t v12 = off_1005CF780[v3];
      }
      unint64_t v13 = -[NSNumber integerValue](self->_personalHotspotAutoState, "integerValue");
      if (v13 > 2) {
        __int128 v14 = "?";
      }
      else {
        __int128 v14 = off_1005CF780[v13];
      }
      int v15 = 136315394;
      __int128 v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Auto Hotspot state changed %s -> %s",  (uint8_t *)&v15,  0x16u);
    }

    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.HotspotAutoStateChanged");
  }

- (void)cellularDataEnabled:(BOOL *)a3 airplaneMode:(BOOL *)a4
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
}

- (BOOL)lteConnectionShows4G
{
  return 0;
}

- (int64_t)familyHotspotStateForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_personalHotspotFamilyStates)
  {
    -[SDStatusMonitor updateFamilyHotspotState](self, "updateFamilyHotspotState");
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    int64_t v7 = -1LL;
    goto LABEL_6;
  }

  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_personalHotspotFamilyStates,  "objectForKeyedSubscript:",  v5));
  int64_t v7 = (int64_t)[v6 integerValue];

LABEL_6:
  return v7;
}

- (void)updateFamilyHotspotState
{
  personalHotspotFamilyStates = self->_personalHotspotFamilyStates;
  if (!personalHotspotFamilyStates)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = self->_personalHotspotFamilyStates;
    self->_personalHotspotFamilyStates = v4;
  }

  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v6 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"Family Hotspot State: ");
  int64_t v7 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences(self->_wifiManager);
  id v8 = [v7 count];
  int v9 = (int)v8;
  uint64_t v10 = daemon_log(v8);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v38) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Family hotspot entries: %d", buf, 8u);
  }

  if (!v9) {
    *((_BYTE *)v30 + 24) = 1;
  }
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_10013A9FC;
  id v22 = &unk_1005CF638;
  BOOL v28 = personalHotspotFamilyStates == 0LL;
  uint64_t v12 = v6;
  uint64_t v23 = v12;
  id v13 = v7;
  id v24 = v13;
  uint64_t v25 = self;
  __int128 v26 = &v33;
  __int128 v27 = &v29;
  id v14 = [v13 enumerateObjectsUsingBlock:&v19];
  BOOL personalHotspotFamilyEnabled = self->_personalHotspotFamilyEnabled;
  self->_BOOL personalHotspotFamilyEnabled = *((_BYTE *)v30 + 24) ^ 1;
  if (!personalHotspotFamilyStates)
  {
    uint64_t v16 = daemon_log(v14);
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v30 + 24)) {
        uint64_t v18 = @"Disabled";
      }
      else {
        uint64_t v18 = &stru_1005E3958;
      }
      *(_DWORD *)buf = 138412546;
      __int128 v38 = v12;
      __int16 v39 = 2112;
      uint64_t v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
    }
  }

  if (*((_BYTE *)v34 + 24) || personalHotspotFamilyEnabled != self->_personalHotspotFamilyEnabled) {
    -[SDStatusMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.HotspotFamilyStateChanged",  v19,  v20,  v21,  v22,  v23);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

- (BOOL)familyHotspotEnabled
{
  if (!self->_personalHotspotFamilyStates) {
    -[SDStatusMonitor updateFamilyHotspotState](self, "updateFamilyHotspotState");
  }
  return self->_personalHotspotFamilyEnabled;
}

- (unsigned)networkType
{
  return 0;
}

- (BOOL)personalHotspotAllowed
{
  personalHotspotAllowed = self->_personalHotspotAllowed;
  if (!personalHotspotAllowed)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isPersonalHotspotModificationAllowed]));
    uint64_t v6 = self->_personalHotspotAllowed;
    self->_personalHotspotAllowed = v5;

    personalHotspotAllowed = self->_personalHotspotAllowed;
  }

  return -[NSNumber BOOLValue](personalHotspotAllowed, "BOOLValue");
}

- (void)updatePersonalHotspotAllowed
{
  unsigned int v3 = -[NSNumber BOOLValue](self->_personalHotspotAllowed, "BOOLValue");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isPersonalHotspotModificationAllowed]));
  personalHotspotAllowed = self->_personalHotspotAllowed;
  self->_personalHotspotAllowed = v5;

  if (v3 != -[NSNumber BOOLValue](self->_personalHotspotAllowed, "BOOLValue")) {
    -[SDStatusMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.PersonalHotspotAllowedChanged");
  }
}

- (int64_t)signalStrength
{
  return -1LL;
}

- (BOOL)simStateReady
{
  return 0;
}

- (void)addPreventExitForLocaleReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013AE7C;
  v7[3] = &unk_1005CB480;
  id v8 = v4;
  int v9 = v5;
  id v6 = v4;
  dispatch_async(&_dispatch_main_q, v7);

  objc_sync_exit(v5);
}

- (void)pushDateForPreventExitForLocaleReason:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = self;
    objc_sync_enter(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013AFEC;
    block[3] = &unk_1005CBC20;
    id v10 = v6;
    uint64_t v11 = v8;
    id v12 = v7;
    dispatch_async(&_dispatch_main_q, block);

    objc_sync_exit(v8);
  }
}

- (void)removePreventExitForLocaleReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013B138;
  v7[3] = &unk_1005CB480;
  id v8 = v4;
  int v9 = v5;
  id v6 = v4;
  dispatch_async(&_dispatch_main_q, v7);

  objc_sync_exit(v5);
}

- (void)postNotification:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 postNotificationName:v6 object:0 userInfo:v5];
}

- (void)postNotification:(id)a3
{
}

- (BOOL)_multipleUsersLoggedIn
{
  return 0;
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (id)defaultWiFiDevice
{
  wifiDevice = self->_wifiDevice;
  if (!wifiDevice)
  {
    -[SDStatusMonitor updateWirelessDevice](self, "updateWirelessDevice");
    wifiDevice = self->_wifiDevice;
  }

  return wifiDevice;
}

- (unsigned)wifiPasswordSharingAvailability
{
  unsigned int v3 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self, "copyMyAppleIDSecIdentity");
  if (v3)
  {
    CFRelease(v3);
    int v4 = 0;
  }

  else
  {
    int v4 = 4;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v6 = [v5 isPasswordProximityAutoFillRequestingAllowed];

  if (v6) {
    int v7 = v4;
  }
  else {
    int v7 = v4 | 0x40;
  }
  if (-[SDStatusMonitor bluetoothEnabled](self, "bluetoothEnabled")) {
    int v8 = v7;
  }
  else {
    int v8 = v7 | 2;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));

  if (v9) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = v8 | 0x20;
  }
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self, "myAppleIDValidationRecord"));
  if (!v11
    || (id v12 = (void *)v11,
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self, "myAppleIDValidationRecord")),
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"]),
        v14,
        v13,
        v12,
        !v14))
  {
    v10 |= 8u;
  }

  uint64_t v15 = daemon_log(v11);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PWS availability: %ud\n", (uint8_t *)v18, 8u);
  }

  return v10;
}

- (id)wifiSSIDForSSIDHash:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pthread_mutex_lock(&stru_100643A38);
  if (!self->_ssidHashes)
  {
    uint64_t v8 = daemon_log(v5);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Generating SSID hashes", (uint8_t *)&v24, 2u);
    }

    unsigned int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ssidHashes = self->_ssidHashes;
    self->_ssidHashes = v10;

    if (self->_wifiManager)
    {
      id v12 = (const __CFArray *)WiFiManagerClientCopyNetworks();
      if (v12)
      {
        id v13 = v12;
        CFIndex Count = CFArrayGetCount(v12);
        if (Count >= 1)
        {
          CFIndex v15 = Count;
          for (CFIndex i = 0LL; i != v15; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v13, i);
            if (WiFiNetworkGetShareMode() == 3)
            {
              uint64_t SSID = WiFiNetworkGetSSID(ValueAtIndex);
              id v19 = objc_claimAutoreleasedReturnValue(SSID);
              uint64_t v20 = (const char *)[v19 UTF8String];
              if (v20)
              {
                id v21 = v20;
                __int128 v24 = 0u;
                __int128 v25 = 0u;
                CC_LONG v22 = strlen(v20);
                CC_SHA256(v21, v22, (unsigned __int8 *)&v24);
                uint64_t v23 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  &v24,  3LL);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_ssidHashes,  "setObject:forKeyedSubscript:",  v19,  v23,  v24,  v25);
              }
            }
          }
        }

        CFRelease(v13);
      }
    }
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ssidHashes, "objectForKeyedSubscript:", v4));
  pthread_mutex_unlock(&stru_100643A38);

  return v6;
}

- (BOOL)airDropPublished
{
  return self->_airDropPublished;
}

- (void)setAirDropPublished:(BOOL)a3
{
  self->_airDropPublished = a3;
  if (a3) {
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.AirDropPublished");
  }
}

- (NSString)nextAirDropID
{
  return self->_nextAirDropID;
}

- (void)setNextAirDropID:(id)a3
{
}

- (BOOL)bluetoothEnabledIncludingRestricted
{
  if ((SFDeviceIsVirtualMachine(self, a2) & 1) != 0) {
    return 1;
  }
  bluetoothController = self->_bluetoothController;
  if (!bluetoothController) {
    return SFIsBluetoothEnabled();
  }
  if (-[CBController bluetoothState](bluetoothController, "bluetoothState") == (id)5) {
    return 1;
  }
  return -[CBController bluetoothState](self->_bluetoothController, "bluetoothState") == (id)10;
}

- (BOOL)bluetoothEnabled
{
  if ((SFDeviceIsVirtualMachine(self, a2) & 1) != 0) {
    return 1;
  }
  bluetoothController = self->_bluetoothController;
  if (bluetoothController) {
    return -[CBController bluetoothState](bluetoothController, "bluetoothState") == (id)5;
  }
  else {
    return SFIsBluetoothEnabled();
  }
}

- (void)setBluetoothEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100643A38);
  if (v3) {
    uint64_t v5 = 5LL;
  }
  else {
    uint64_t v5 = 4LL;
  }
  id location = 0LL;
  objc_initWeak(&location, self);
  bluetoothController = self->_bluetoothController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013B7AC;
  v7[3] = &unk_1005CF660;
  objc_copyWeak(&v8, &location);
  -[CBController setPowerState:completion:](bluetoothController, "setPowerState:completion:", v5, v7);
  pthread_mutex_unlock(&stru_100643A38);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (SDAirDropServer)finderServer
{
  id to = 0LL;
  objc_copyWeak(&to, (id *)&self->_finderServer);
  pthread_mutex_unlock(&stru_100643A38);
  id v3 = objc_loadWeakRetained(&to);
  objc_destroyWeak(&to);
  return (SDAirDropServer *)v3;
}

- (void)setFinderServer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100643A38);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finderServer);

  objc_storeWeak((id *)&self->_finderServer, v4);
  pthread_mutex_unlock(&stru_100643A38);
  if (WeakRetained != v4)
  {
    -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.FinderAirDropChanged");
  }

- (BOOL)wirelessEnabled
{
  LOBYTE(self) = self->_wirelessEnabled;
  pthread_mutex_unlock(&stru_100643A38);
  return (char)self;
}

- (void)setWirelessEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100643A38);
  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    WiFiManagerClientSetPower(wifiManager, v3);
  }

  else
  {
    uint64_t v6 = daemon_log(0LL);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10014298C();
    }
  }

  pthread_mutex_unlock(&stru_100643A38);
}

- (BOOL)airplaneModeEnabled
{
  return 0;
}

- (BOOL)isMulticastAdvertisementsDisabled
{
  return sub_10008E24C(@"NoMulticastAdvertisements", 0LL) != 0;
}

+ (float)airDropProgressUIMaxPercentage
{
  return (float)(int)sub_1001166FC(@"AirDropProgressUIMaxPercentage", 40LL) / 100.0;
}

- (NSDictionary)awdlInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlState](self, "awdlState"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlStateInfo](self, "awdlStateInfo"));
  }
  uint64_t v6 = v5;

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AWDL_INFO"]);
  return (NSDictionary *)v7;
}

- (NSArray)awdlPeerList
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlState](self, "awdlState"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlStateInfo](self, "awdlStateInfo"));
  }
  uint64_t v6 = v5;

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"LINK_CHANGED_PEER_LIST"]);
  return (NSArray *)v7;
}

- (id)awdlStateInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlDevice](self, "awdlDevice"));

  if (v3)
  {
    id v12 = 0LL;
    uint64_t v5 = WiFiDeviceClientCopyInterfaceStateInfo(self->_awdlDevice, &v12);
    if ((_DWORD)v5)
    {
      uint64_t v6 = daemon_log(v5);
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100142A10();
      }
    }

    else
    {
      int v9 = v12;
      if (v12) {
        return v9;
      }
      uint64_t v11 = daemon_log(0LL);
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001429E4();
      }
    }
  }

  else
  {
    uint64_t v8 = daemon_log(v4);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001429B8();
    }
  }

  int v9 = 0LL;
  return v9;
}

- (NSData)bluetoothAddress
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bluetoothAddressData]);

  return (NSData *)v3;
}

- (NSString)bonjourName
{
  bonjourName = self->_bonjourName;
  if (bonjourName)
  {
    uint64_t v4 = bonjourName;
  }

  else
  {
    uint64_t v5 = (__CFString *)SCDynamicStoreCopyComputerName(0LL, 0LL);
    uint64_t v4 = (NSString *)-[__CFString copy](v5, "copy");
  }

  pthread_mutex_unlock(&stru_100643A38);
  return v4;
}

- (NSString)computerName
{
  computerName = self->_computerName;
  if (!computerName)
  {
    uint64_t v4 = (__CFString *)SCDynamicStoreCopyComputerName(0LL, 0LL);
    uint64_t v5 = (NSString *)-[__CFString copy](v4, "copy");
    uint64_t v6 = self->_computerName;
    self->_computerName = v5;

    computerName = self->_computerName;
  }

  int v7 = computerName;
  pthread_mutex_unlock(&stru_100643A38);
  return v7;
}

- (void)clearComputerName
{
  computerName = self->_computerName;
  self->_computerName = 0LL;

  pthread_mutex_unlock(&stru_100643A38);
}

- (NSString)consoleUser
{
  BOOL v3 = self->_consoleUser;
  pthread_mutex_unlock(&stru_100643A38);
  return v3;
}

- (void)clearConsoleUser
{
  consoleUser = self->_consoleUser;
  self->_consoleUser = 0LL;

  self->_consoleUserID = -1;
  pthread_mutex_unlock(&stru_100643A38);
}

- (NSString)deviceInformation
{
  BOOL v3 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
  if (!self->_deviceInformation)
  {
    v34[0] = @"BuildVersion";
    v34[1] = @"IsSimulator";
    v34[2] = @"marketing-name";
    v34[3] = @"ProductName";
    v34[4] = @"ProductType";
    v34[5] = @"ProductVersion";
    v34[6] = @"ReleaseType";
    uint64_t v4 = (void *)MGCopyMultipleAnswers( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 7LL),  0LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"IsSimulator"]);
    unsigned int v6 = [v5 BOOLValue];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ReleaseType"]);
    uint64_t v8 = (void *)v7;
    int v9 = @"Production";
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    unsigned int v10 = v9;
    char v32 = v10;

    uint64_t v11 = @"Simulator";
    if (!v6) {
      uint64_t v11 = v10;
    }
    id v12 = v11;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"marketing-name"]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductType"]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@)",  v31,  v13));
    CFIndex v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductName"]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProductVersion"]);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BuildVersion"]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ (%@)",  v15,  v16,  v17));
    id v19 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@, %@, ",  v12,  v14,  v18));

    deviceInformation = self->_deviceInformation;
    self->_deviceInformation = v19;

    BOOL v3 = &IDSSendMessageOptionForceLocalDeliveryKey_ptr;
  }

  v33[0] = @"BatteryCurrentCapacity";
  v33[1] = @"BatteryIsCharging";
  id v21 = (void *)MGCopyMultipleAnswers( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL),  0LL);
  CC_LONG v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"BatteryIsCharging"]);
  unsigned int v23 = [v22 BOOLValue];

  __int128 v24 = @"not charging";
  if (v23) {
    __int128 v24 = @"charging";
  }
  __int128 v25 = v24;
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"BatteryCurrentCapacity"]);
  id v27 = [v26 integerValue];

  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v3[230] stringWithFormat:@"%d%% (%@)", v27, v25]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_deviceInformation, "stringByAppendingString:", v28));

  return (NSString *)v29;
}

- (int64_t)deviceKeyBagState
{
  deviceKeyBagState = self->_deviceKeyBagState;
  if (!deviceKeyBagState)
  {
    uint64_t v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", MKBGetDeviceLockState(self->_mkbOptions));
    uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(v4);
    unsigned int v6 = self->_deviceKeyBagState;
    self->_deviceKeyBagState = v5;

    deviceKeyBagState = self->_deviceKeyBagState;
  }

  return -[NSNumber integerValue](deviceKeyBagState, "integerValue");
}

- (NSString)localHostName
{
  localHostName = self->_localHostName;
  if (!localHostName)
  {
    uint64_t v4 = (__CFString *)SCDynamicStoreCopyLocalHostName(0LL);
    uint64_t v5 = self->_localHostName;
    self->_localHostName = &v4->isa;

    localHostName = self->_localHostName;
  }

  unsigned int v6 = localHostName;
  pthread_mutex_unlock(&stru_100643A38);
  return v6;
}

- (void)clearLocalHostName
{
  localHostName = self->_localHostName;
  self->_localHostName = 0LL;

  pthread_mutex_unlock(&stru_100643A38);
}

+ (double)b332BTAddressRotationDelay
{
  return (double)(int)sub_1001166FC(@"B332BTAddressRotationDelayMsec", 100LL) / 1000.0;
}

- (int)minPersonImageSize
{
  return sub_1001166FC(@"MinPersonImageSize", 32LL);
}

- (NSString)modelCode
{
  size_t v6 = 256LL;
  *(void *)uint64_t v7 = 0x100000006LL;
  uint64_t v2 = sysctl(v7, 2u, v8, &v6, 0LL, 0LL);
  if (!(_DWORD)v2) {
    return (NSString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v8));
  }
  uint64_t v3 = daemon_log(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100142A70(v4);
  }

  return (NSString *)0LL;
}

- (NSString)modelName
{
  uint64_t v2 = (__CFString *)MGCopyAnswer(@"DeviceName", 0LL);
  unsigned int v3 = -[__CFString isEqualToString:](v2, "isEqualToString:", @"iPod");
  uint64_t v4 = @"iPod touch";
  if (!v3) {
    uint64_t v4 = v2;
  }
  uint64_t v5 = v4;
  if (v5) {
    size_t v6 = v5;
  }
  else {
    size_t v6 = @"iOS";
  }
  pthread_mutex_unlock(&stru_100643A38);

  return (NSString *)v6;
}

- (NSString)myAccountAppleID
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = sub_100114D1C(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);

  return (NSString *)v5;
}

+ (int64_t)mrQLProgressUpdateFreqMsec
{
  return (int)sub_1001166FC(@"MRQLProgFreqMsec", 200LL);
}

- (NSString)myAltDSID
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = sub_100114D1C(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));

  return (NSString *)v5;
}

- (NSString)myAppleID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v3;
}

- (id)_myAppleID
{
  myAppleID = self->_myAppleID;
  if (!myAppleID)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    id v5 = sub_100114D1C(v4);
    size_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 username]);
    uint64_t v8 = self->_myAppleID;
    self->_myAppleID = v7;

    myAppleID = self->_myAppleID;
  }

  return myAppleID;
}

- (NSString)myAppleIDCommonName
{
  if (!self->_myAppleIDCommonName)
  {
    id v3 = -[SDStatusMonitor _copyMyAppleIDSecIdentity](self, "_copyMyAppleIDSecIdentity");
    if (v3)
    {
      uint64_t v4 = v3;
      SecCertificateRef certificateRef = 0LL;
      uint64_t v5 = SecIdentityCopyCertificate(v3, &certificateRef);
      if ((_DWORD)v5)
      {
        uint64_t v6 = daemon_log(v5);
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100142AF8();
        }
      }

      else
      {
        uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue( -[SDStatusMonitor commonNameForCertificate:]( self,  "commonNameForCertificate:",  certificateRef));
        myAppleIDCommonName = self->_myAppleIDCommonName;
        self->_myAppleIDCommonName = v8;

        CFRelease(certificateRef);
      }

      CFRelease(v4);
    }
  }

  unsigned int v10 = self->_myAppleIDCommonName;
  pthread_mutex_unlock(&stru_100643A38);
  return v10;
}

- (NSArray)myAppleIDEmailAddresses
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor emailAddressesForAppleID:](self, "emailAddressesForAppleID:", v3));

  pthread_mutex_unlock(&stru_100643A38);
  return (NSArray *)v4;
}

- (NSString)myAppleIDEmailHash
{
  if (!self->_myEmailHashes)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
    uint64_t v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor emailAddressesForAppleID:](self, "emailAddressesForAppleID:", v3));

    if (v4)
    {
      Mutable = (NSMutableString *)CFStringCreateMutable(0LL, 0LL);
      myEmailHashes = self->_myEmailHashes;
      self->_myEmailHashes = Mutable;

      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v8 = 0LL;
        if (Count >= 8) {
          uint64_t v9 = 8LL;
        }
        else {
          uint64_t v9 = Count;
        }
        do
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v8);
          id v11 = sub_100116524(ValueAtIndex, 0);
          id v12 = (const __CFString *)objc_claimAutoreleasedReturnValue(v11);
          id v13 = (__CFString *)v12;
          if (v12)
          {
            uint64_t v14 = sub_100114EC8(v12);
            if (v14)
            {
              CFIndex v15 = (const void *)v14;
              -[NSMutableString appendString:](self->_myEmailHashes, "appendString:", v14);
              if (v9 - 1 != v8) {
                -[NSMutableString appendString:](self->_myEmailHashes, "appendString:", @",");
              }
              CFRelease(v15);
            }
          }

          ++v8;
        }

        while (v9 != v8);
      }

      CFRelease(v4);
    }
  }

  uint64_t v16 = self->_myEmailHashes;
  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v16;
}

- (NSString)myAppleIDPhoneHash
{
  if (!self->_myPhoneHashes)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
    uint64_t v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor phoneNumbersForAppleID:](self, "phoneNumbersForAppleID:", v3));

    if (v4)
    {
      Mutable = (NSMutableString *)CFStringCreateMutable(0LL, 0LL);
      myPhoneHashes = self->_myPhoneHashes;
      self->_myPhoneHashes = Mutable;

      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v8 = 0LL;
        if (Count >= 8) {
          uint64_t v9 = 8LL;
        }
        else {
          uint64_t v9 = Count;
        }
        do
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v8);
          id v11 = (const __CFString *)sub_100116604(ValueAtIndex);
          if (v11)
          {
            uint64_t v12 = sub_100114EC8(v11);
            if (v12)
            {
              id v13 = (const void *)v12;
              -[NSMutableString appendString:](self->_myPhoneHashes, "appendString:", v12);
              if (v9 - 1 != v8) {
                -[NSMutableString appendString:](self->_myPhoneHashes, "appendString:", @",");
              }
              CFRelease(v13);
            }
          }

          ++v8;
        }

        while (v9 != v8);
      }

      CFRelease(v4);
    }
  }

  uint64_t v14 = self->_myPhoneHashes;
  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v14;
}

- (NSArray)myAppleIDPhoneNumbers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _myAppleID](self, "_myAppleID"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor phoneNumbersForAppleID:](self, "phoneNumbersForAppleID:", v3));

  pthread_mutex_unlock(&stru_100643A38);
  if (v4) {
    uint64_t v5 = (void *)v4;
  }
  else {
    uint64_t v5 = &__NSArray0__struct;
  }
  return (NSArray *)v5;
}

- (NSDictionary)myAppleIDValidationRecord
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self, "myAppleID"));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 validationRecordInfoForAppleID:v2]);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (NSString)myEmail
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 emailAddresses]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);

  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v6;
}

- (NSString)myName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactFormatter stringFromContact:style:]( &OBJC_CLASS___CNContactFormatter,  "stringFromContact:style:",  v3,  0LL));

  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v4;
}

- (NSString)myGivenName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor meCard](self, "meCard"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 givenName]);

  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v4;
}

- (NSString)myPrimaryEmail
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = sub_100114D1C(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryEmail"));

  return (NSString *)v5;
}

- (NSData)myMediumHashes
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor unifiedAppleIDInfo](self, "unifiedAppleIDInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager obfuscatedMediumHashDataForStrings:]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "obfuscatedMediumHashDataForStrings:",  v2));

  return (NSData *)v3;
}

- (NSData)myShortHashesForAirDrop
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor unifiedAppleIDInfo](self, "unifiedAppleIDInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager btleAdvertisementDataForStrings:]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "btleAdvertisementDataForStrings:",  v2));

  return (NSData *)v3;
}

- (NSString)netbiosName
{
  p_netbiosName = &self->_netbiosName;
  if (self->_netbiosName)
  {
    id v4 = 0LL;
  }

  else
  {
    smbPreferences = self->_smbPreferences;
    id v7 = 0LL;
    -[SDStatusMonitor smbConfiguration:netBiosName:workgroup:]( self,  "smbConfiguration:netBiosName:workgroup:",  smbPreferences,  &v7,  0LL);
    id v4 = v7;
  }

  objc_storeStrong((id *)p_netbiosName, v4);
  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v4;
}

- (int)sidebarMaxCount
{
  return sub_1001166FC(@"SidebarMaxCount", 7LL);
}

+ (int64_t)shareSheetMaxSuggestions
{
  return (int)sub_1001166FC(@"ShareSheetMaxSuggestions", 12LL);
}

- (NSString)someComputerName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor computerName](self, "computerName"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor modelName](self, "modelName"));
  }
  return (NSString *)v3;
}

- (unsigned)systemUIFlags
{
  LODWORD(self) = self->_systemUIFlags;
  pthread_mutex_unlock(&stru_100643A38);
  return self;
}

- (NSString)workgroup
{
  p_workgroup = &self->_workgroup;
  if (self->_workgroup)
  {
    id v4 = 0LL;
  }

  else
  {
    smbPreferences = self->_smbPreferences;
    id v7 = 0LL;
    -[SDStatusMonitor smbConfiguration:netBiosName:workgroup:]( self,  "smbConfiguration:netBiosName:workgroup:",  smbPreferences,  0LL,  &v7);
    id v4 = v7;
  }

  objc_storeStrong((id *)p_workgroup, v4);
  pthread_mutex_unlock(&stru_100643A38);
  return (NSString *)v4;
}

- (int)workgroupThreshold
{
  return sub_1001166FC(@"WorkgroupThreshold", 6LL);
}

- (BOOL)isAirDropAllowed
{
  airDropAllowed = self->_airDropAllowed;
  if (!airDropAllowed)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isAirDropAllowed]));
    uint64_t v6 = self->_airDropAllowed;
    self->_airDropAllowed = v5;

    airDropAllowed = self->_airDropAllowed;
  }

  return -[NSNumber BOOLValue](airDropAllowed, "BOOLValue");
}

- (void)updateAirDropAllowed
{
  unsigned int v3 = -[NSNumber BOOLValue](self->_airDropAllowed, "BOOLValue");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  uint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isAirDropAllowed]));
  airDropAllowed = self->_airDropAllowed;
  self->_airDropAllowed = v5;

  if (v3 != -[NSNumber BOOLValue](self->_airDropAllowed, "BOOLValue")) {
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.AirDropAllowedChanged");
  }
}

- (BOOL)isTourModeEnabled
{
  return 0;
}

- (BOOL)lowPowerModeEnabled
{
  return 0;
}

- (BOOL)iCloudSharedPhotoLibraryEnabled
{
  self->_iCloudSharedPhotoLibraryEnabled = 0;
  return 0;
}

- (BOOL)isLocalDeviceMeDevice
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  unsigned __int8 v3 = [v2 meDeviceIsMe];

  return v3;
}

- (BOOL)allEnabled
{
  return 1;
}

- (BOOL)altDSIDNeedsFixing
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = sub_100114D1C(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryEmail"));
      unsigned int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        uint64_t v9 = tethering_log();
        unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100142B84();
        }
      }

      else
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
        unsigned int v14 = [v6 isEqualToString:v13];

        if (!v14)
        {
          BOOL v11 = 0;
          goto LABEL_13;
        }

        uint64_t v15 = tethering_log();
        unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100142BB0();
        }
      }
    }

    else
    {
      uint64_t v12 = tethering_log();
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100142B58();
      }
    }

    BOOL v11 = 1;
LABEL_13:

    goto LABEL_14;
  }

  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)alwaysAutoAccept
{
  return sub_10008E24C(@"AlwaysAutoAccept", 0LL) != 0;
}

- (BOOL)alwaysSendPayload
{
  return sub_10008E24C(@"AlwaysSendPayload", 0LL) != 0;
}

+ (BOOL)b332PairingEnabled
{
  return sub_10008E24C(@"B332PairingEnabled", 1LL) != 0;
}

- (BOOL)backlightOn
{
  return 1;
}

- (BOOL)bonjourEnabled
{
  return 1;
}

- (BOOL)browseAllInterfaces
{
  return sub_10008E1C8((uint64_t)self, (uint64_t)a2) != 0;
}

+ (BOOL)isBuddyCompleted
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SetupDone", @"com.apple.purplebuddy", 0LL);
  return (AppBooleanValue | CFPreferencesGetAppBooleanValue(@"ForceNoBuddy", @"com.apple.purplebuddy", 0LL)) != 0;
}

- (BOOL)bypassLTKeyAbort
{
  uint64_t v2 = sub_10008E24C(@"BypassLTKeyAbort", 0LL);
  if ((_DWORD)v2) {
    LOBYTE(v2) = IsAppleInternalBuild(v2, v3) != 0;
  }
  return v2;
}

- (BOOL)carplayConnected
{
  return 0;
}

- (BOOL)coalesceMe
{
  return sub_10008E24C(@"CoalesceMe", 0LL) != 0;
}

- (BOOL)connectedEnabled
{
  return 1;
}

- (BOOL)currentConsoleUser
{
  return 1;
}

- (BOOL)deviceInBiolockout
{
  uint64_t v2 = daemon_log(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100142BDC();
  }

  return 0;
}

- (BOOL)deviceIsInClassD
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  char v3 = [v2 firstUnlocked] ^ 1;

  return v3;
}

- (BOOL)deviceKeyBagDisabled
{
  return (id)-[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState") == (id)3;
}

- (BOOL)deviceKeyBagLocked
{
  int64_t v3 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
  char v4 = v3 + 8;
  if ((unint64_t)(v3 + 8) < 0x10 && ((0xFF01u >> v4) & 1) != 0)
  {
    return (0x76FFu >> v4) & 1;
  }

  else
  {
    uint64_t v5 = daemon_log(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      int64_t v10 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unknown keybag state: %ld File a radar against Sharing | all",  (uint8_t *)&v9,  0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)deviceKeyBagLocking
{
  return (id)-[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState") == (id)2;
}

- (BOOL)deviceKeyBagUnlocked
{
  int64_t v3 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
  char v4 = v3 + 8;
  if ((unint64_t)(v3 + 8) < 0x10 && ((0xFF01u >> v4) & 1) != 0)
  {
    return (0x8900u >> v4) & 1;
  }

  else
  {
    uint64_t v5 = daemon_log(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      int64_t v10 = -[SDStatusMonitor deviceKeyBagState](self, "deviceKeyBagState");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unknown keybag state: %ld File a radar against Sharing | all",  (uint8_t *)&v9,  0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)deviceKeyBagUnlockedAndScreenOn
{
  BOOL v3 = -[SDStatusMonitor deviceKeyBagUnlocked](self, "deviceKeyBagUnlocked");
  if (v3) {
    LOBYTE(v3) = -[SDStatusMonitor screenOn](self, "screenOn");
  }
  return v3;
}

- (BOOL)deviceRequiresNewRanging
{
  return 0;
}

- (BOOL)deviceSupportsRanging
{
  BOOL v3 = (void *)WiFiDeviceClientCopyProperty(self->_wifiDevice, kWiFiDeviceCapabilitiesKey);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (CFIndex i = 0LL; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "integerValue", (void)v14) == (id)58)
        {
          LODWORD(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (BOOL)deviceUIUnlocked
{
  return 1;
}

- (BOOL)deviceWasUnlockedOnce
{
  return self->_deviceWasUnlockedOnce;
}

- (BOOL)disableAutoAccept
{
  return sub_10008E24C(@"DisableAutoAccept", 0LL) != 0;
}

- (BOOL)disableAutoAcceptForPhotosAssetBundles
{
  return sub_10008E24C(@"DisableAutoAcceptForPhotosAssetBundles", 1LL) != 0;
}

- (BOOL)disableCompression
{
  return sub_10008E24C(@"DisableCompression", 0LL) != 0;
}

- (BOOL)disableContinuityTLS
{
  return sub_10008E24C(@"DisableContinuityTLS", 0LL) != 0;
}

- (BOOL)disablePeopleSuggestions
{
  return sub_10008E24C(@"DisablePeopleSuggestions", 0LL) != 0;
}

- (BOOL)disablePictureQuery
{
  return sub_10008E24C(@"DisablePictureQuery", 0LL) != 0;
}

- (BOOL)disablePipelining
{
  return sub_10008E24C(@"DisablePipelining", 0LL) != 0;
}

- (BOOL)disableQuarantine
{
  return sub_10008E24C(@"DisableQuarantine", 0LL) != 0;
}

- (BOOL)disableExtractMediaFromBundles
{
  return sub_10008E24C(@"DisableExtractMediaFromBundles", 0LL) != 0;
}

- (BOOL)disableTransformingPhotosAssetBundlesToFolders
{
  return sub_10008E24C(@"DisableTransformingPhotosAssetBundlesToFolders", 0LL) != 0;
}

- (BOOL)disableRotation
{
  return sub_10008E24C(@"DisableRotation", 0LL) != 0;
}

- (BOOL)disableTLS
{
  return variable initialization expression of SDAirDropHashStoreCDB.destroyed() != 0;
}

- (BOOL)dockHasDownloadsFolder
{
  return 0;
}

- (BOOL)eduModeEnabled
{
  return 0;
}

- (BOOL)enableAirDropAdvertising
{
  else {
    return -[SDStatusMonitor isAirDropAvailable](self, "isAirDropAvailable");
  }
}

- (BOOL)enableAirDropReceiving
{
  int v3 = SFIsDeviceAudioAccessory(self);
  int v4 = sub_10008E24C(@"EnableAirDropReceiving", v3 ^ 1u);
  if (v4) {
    LOBYTE(v4) = -[SDStatusMonitor isAirDropAvailable](self, "isAirDropAvailable");
  }
  return v4;
}

- (BOOL)enableAllRecents
{
  return sub_10008E24C(@"EnableAllRecents", 0LL) != 0;
}

- (BOOL)enableBugs
{
  return sub_10008E24C(@"EnableBugs", 0LL) != 0;
}

- (BOOL)enableContinuity
{
  else {
    return -[SDStatusMonitor deviceSupportsContinuity](self, "deviceSupportsContinuity");
  }
}

- (BOOL)enableDebugMode
{
  return sub_10008E24C(@"EnableDebugMode", 0LL) != 0;
}

- (BOOL)enableDemoMode
{
  return sub_10008E23C() != 0;
}

- (BOOL)enableDVZip
{
  return sub_10008E24C(@"EnableDVZip", 1LL) != 0;
}

- (BOOL)enableHotspotFallback
{
  return sub_10008E24C(@"EnableHotspotFallback", 0LL) != 0;
}

+ (BOOL)enableOOBPCredentialLogging
{
  int v2 = IsAppleInternalBuild(a1, a2);
  if (v2) {
    LOBYTE(v2) = sub_10008E24C(@"EnableOOBPCredentialLogging", 0LL) != 0;
  }
  return v2;
}

- (BOOL)enablePKZip
{
  return sub_10008E24C(@"EnablePKZip", 0LL) != 0;
}

- (BOOL)enablePKZipCompression
{
  return sub_10008E24C(@"EnablePKZipCompression", 0LL) != 0;
}

- (BOOL)enableStrangers
{
  return sub_10008E24C(@"pdStrangers", 0LL) != 0;
}

- (BOOL)enableStreamDebugging
{
  return sub_10008E24C(@"EnableStreamDebugging", 0LL) != 0;
}

+ (BOOL)enableShareSheetVectorSlots
{
  return sub_10008E24C(@"kEnableShareSheetVectorSlots", 0LL) != 0;
}

+ (BOOL)enableAirDropHUDScene
{
  return sub_10008E24C(@"kEnableAirDropHUDScene", 0LL) != 0;
}

- (BOOL)enableWebloc
{
  return sub_10008E24C(@"EnableWebloc", 0LL) != 0;
}

- (BOOL)enableXML
{
  return sub_10008E24C(@"EnableXML", 0LL) != 0;
}

- (BOOL)finderAirDropEnabled
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor finderServer](self, "finderServer"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)forceAWDL
{
  return sub_10008E24C(@"ForceAWDL", 0LL) != 0;
}

- (BOOL)forceP2P
{
  return sub_10008E24C(@"ForceP2P", 0LL) != 0;
}

- (BOOL)handoffVisible
{
  return 1;
}

- (BOOL)ignoreIconDiskCache
{
  return sub_10008E24C(@"IgnoreIconDiskCache", 0LL) != 0;
}

- (BOOL)lostModeEnabled
{
  if ((SFLostMode(self, a2) & 1) != 0) {
    return 1;
  }
  else {
    return SFManagedLostMode();
  }
}

- (BOOL)internetSharingEnabled
{
  return 0;
}

- (BOOL)myAppleIDIsManaged
{
  int v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = sub_100114D1C(v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = objc_msgSend(v4, "aa_isManagedAppleID");

  return v5;
}

- (BOOL)registerAllInterfaces
{
  return sub_10008E24C(@"RegisterAllInterfaces", 0LL) != 0;
}

- (BOOL)runningAsSetupUser
{
  return 0;
}

- (BOOL)screenOn
{
  screenOn = self->_screenOn;
  if (!screenOn)
  {
    uint64_t state64 = 0LL;
    notify_get_state(self->_screenBlankedToken, &state64);
    if (state64) {
      int v4 = &__kCFBooleanFalse;
    }
    else {
      int v4 = &__kCFBooleanTrue;
    }
    objc_storeStrong((id *)&self->_screenOn, v4);
    screenOn = self->_screenOn;
  }

  unsigned __int8 v5 = -[NSNumber BOOLValue](screenOn, "BOOLValue");
  pthread_mutex_unlock(&stru_100643A38);
  return v5;
}

- (BOOL)showMeInWormhole
{
  return sub_10008E24C(@"ShowMeInWormhole", 0LL) != 0;
}

- (BOOL)showThisComputer
{
  return sub_10008E24C(@"ShowThisComputer", 0LL) != 0;
}

- (BOOL)signedIntoPrimaryiCloudAccount
{
  int v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = sub_100114D1C(v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (BOOL)sleepModeOn
{
  return self->_sleepModeOn;
}

- (BOOL)smartCoverIsClosed
{
  return -[SDSmartCoverMonitor smartCoverIsClosed](self->_smartCoverMonitor, "smartCoverIsClosed");
}

- (BOOL)supportsFitnessPlusPairing
{
  int DeviceClass = GestaltGetDeviceClass(self, a2);
  return DeviceClass == 6 || DeviceClass == 1;
}

- (BOOL)supportsXcodePairing
{
  unsigned int DeviceClass = GestaltGetDeviceClass(self, a2);
  return (DeviceClass < 7) & (0x5Au >> DeviceClass);
}

- (BOOL)testDiskFull
{
  return sub_10008E24C(@"TestDiskFull", 0LL) != 0;
}

- (BOOL)wifiUserPowerPreference
{
  return 0;
}

- (BOOL)wirelessCarPlay
{
  return 0;
}

- (BOOL)asynchronousProxyLoadingEnabled
{
  return sub_10008E24C(@"EnableAsynchronousProxyLoading", 0LL) != 0;
}

- (void)logAirDropTransactionForClientServer:(BOOL)a3 beginEnd:(BOOL)a4 count:(int)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v8 = airdrop_log(self);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = @"server";
    if (v7) {
      int64_t v10 = @"client";
    }
    int v12 = 138412802;
    id v13 = v10;
    if (v6) {
      BOOL v11 = @"begin";
    }
    else {
      BOOL v11 = @"end";
    }
    __int16 v14 = 2112;
    __int128 v15 = v11;
    __int16 v16 = 1024;
    int v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "AirDrop %@ transaction %@ (%d)",  (uint8_t *)&v12,  0x1Cu);
  }
}

- (void)installAirPlayPreferencesMonitor
{
  if (self->_airPlayPrefsToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10013DF80;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    notify_register_dispatch("com.apple.airplay.prefsChanged", &self->_airPlayPrefsToken, &_dispatch_main_q, handler);
  }

- (void)updateMediaAccessControlSetting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  unsigned int v5 = -[NSUserDefaults BOOLForKey:](v8, "BOOLForKey:", @"accessControlLevel");
  unsigned int v6 = -[NSUserDefaults BOOLForKey:](v8, "BOOLForKey:", @"p2pAllow");
  int64_t v7 = 3LL;
  if (!v5) {
    int64_t v7 = 1LL;
  }
  if (!v6) {
    int64_t v7 = 2LL;
  }
  if (self->_mediaAccessControlSetting != v7)
  {
    self->_mediaAccessControlSetting = v7;
    if (v3) {
      -[SDStatusMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.MediaAccessControlSettingChanged");
    }
  }
}

- (int64_t)mediaAccessControlSetting
{
  return self->_mediaAccessControlSetting;
}

- (void)installAppleIDUsernameMonitor
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10013E080,  AKAppleIDEmailsDidChangeNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)appleIDAccountInfoChanged:(id)a3
{
  uint64_t v4 = daemon_log(self);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Apple ID account info changed.", v6, 2u);
  }

  -[SDStatusMonitor clearMyAppleIDInfo](self, "clearMyAppleIDInfo");
  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
  -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.AppleIDAccountInfoChanged");
}

- (void)installAppleIDAccountInfoMonitor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"appleIDAccountInfoChanged:" name:SFAppleIDIdentityDidChangeNotification object:0];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"appleIDAccountInfoChanged:" name:SFAppleIDValidationRecordDidChangeNotification object:0];
}

- (void)forceAWDLDeviceRefresh:(__WiFiDeviceClient *)a3
{
  uint64_t v4 = daemon_log(self);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting awdlDevice to nil", v6, 2u);
  }

  self->_awdlDevice = 0LL;
}

- (void)updateWirelessCritical:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = daemon_log(self);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = @"NO";
    if (v3) {
      int64_t v7 = @"YES";
    }
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "updateWirelessCritical inCriticalState=%@",  (uint8_t *)&v8,  0xCu);
  }

  self->_wirelessCritical = v3;
  -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.WirelessCriticalChanged");
}

- (void)handleAWDLState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor awdlState](self, "awdlState"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AWDL_INFO"]);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AWDL_INFO"]);
  if (v6
    && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8),
        (isKindOfClass & 1) == 0)
    || v7
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v10),
        (isKindOfClass & 1) == 0))
  {
    uint64_t v16 = auto_unlock_log(isKindOfClass);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class(v6);
      __int16 v20 = 2112;
      uint64_t v21 = objc_opt_class(v7);
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "AWDL Info isn't a dictionary (stored info class %@, new info class %@)",  (uint8_t *)&v18,  0x16u);
    }
  }

  else
  {
    id v11 = [v6 isEqualToDictionary:v7];
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = auto_unlock_log(v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        uint64_t v19 = (uint64_t)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "AWDL Info updated %@",  (uint8_t *)&v18,  0xCu);
      }
    }

    pthread_mutex_lock(&stru_100643A38);
    __int16 v14 = (NSDictionary *)[v4 copy];
    awdlState = self->_awdlState;
    self->_awdlState = v14;

    pthread_mutex_unlock(&stru_100643A38);
  }
}

- (void)updateAWDLStateInfo
{
  if (!-[SDStatusMonitor wirelessEnabled](self, "wirelessEnabled")) {
    -[SDStatusMonitor handleAWDLState:](self, "handleAWDLState:", 0LL);
  }
}

- (void)installWirelessMonitor
{
  if (!self->_wifiDevice)
  {
    if (self->_wifiManager
      || (BOOL v3 = (__WiFiManagerClient *)WiFiManagerClientCreate(0LL, 0LL), (self->_wifiManager = v3) != 0LL))
    {
      -[SDStatusMonitor updateWirelessDevice](self, "updateWirelessDevice");
    }

    else
    {
      uint64_t v4 = daemon_log(0LL);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100142C08();
      }
    }
  }

- (void)updateWirelessDevice
{
  if (self->_wifiDevice)
  {
    awdlDevice = self->_awdlDevice;
    pthread_mutex_unlock(&stru_100643A38);
    if (awdlDevice) {
      goto LABEL_37;
    }
  }

  else
  {
    pthread_mutex_unlock(&stru_100643A38);
  }

  pthread_mutex_lock(&stru_100643A38);
  BOOL wifiDeviceAttachmentRegistered = self->_wifiDeviceAttachmentRegistered;
  wifiManager = self->_wifiManager;
  self->_BOOL wifiDeviceAttachmentRegistered = 1;
  pthread_mutex_unlock(&stru_100643A38);
  if (!wifiDeviceAttachmentRegistered)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback(wifiManager, sub_10013EAD4, self);
    WiFiManagerClientRegisterVirtInterfaceChangeCallback(wifiManager, sub_10013EBB4, self);
  }

  unsigned int v6 = (const __CFArray *)WiFiManagerClientCopyDevices(wifiManager);
  if (v6)
  {
    int64_t v7 = v6;
    if (CFArrayGetCount(v6))
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v8 = (id)WiFiManagerClientCopyInterfaces(wifiManager);
      id v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v40;
        do
        {
          for (CFIndex i = 0LL; i != v10; CFIndex i = (char *)i + 1)
          {
            if (*(void *)v40 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
            pthread_mutex_lock(&stru_100643A38);
            wifiDevice = self->_wifiDevice;
            pthread_mutex_unlock(&stru_100643A38);
            if (!wifiDevice)
            {
              uint64_t InterfaceRoleIndex = WiFiDeviceClientGetInterfaceRoleIndex(v13);
              if (InterfaceRoleIndex)
              {
                uint64_t v16 = 0LL;
              }

              else
              {
                pthread_mutex_lock(&stru_100643A38);
                uint64_t v16 = v13;
                self->_wifiDevice = v16;
                pthread_mutex_unlock(&stru_100643A38);
                uint64_t InterfaceRoleIndex = WiFiDeviceClientRegisterPowerCallback(v16, sub_10013EC7C, self);
              }

              uint64_t v17 = daemon_log(InterfaceRoleIndex);
              int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v44 = v16;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Wi-Fi device %@", buf, 0xCu);
              }
            }

            pthread_mutex_lock(&stru_100643A38);
            uint64_t v19 = self->_awdlDevice;
            pthread_mutex_unlock(&stru_100643A38);
            if (!v19 && WiFiDeviceClientIsInterfaceAWDL(v13))
            {
              pthread_mutex_lock(&stru_100643A38);
              __int16 v20 = v13;
              self->_awdlDevice = v20;
              pthread_mutex_unlock(&stru_100643A38);
              WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback(v20, sub_10013ECC4, self);
              CFTypeRef cf = 0LL;
              WiFiDeviceClientCopyInterfaceStateInfo(v20, &cf);
              -[SDStatusMonitor handleAWDLState:](self, "handleAWDLState:", cf);
              CFTypeRef v21 = cf;
              if (cf) {
                CFRelease(cf);
              }
              uint64_t v22 = daemon_log(v21);
              unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v44 = v20;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AWDL device %@", buf, 0xCu);
              }
            }
          }

          id v10 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }

        while (v10);
      }
    }

    else
    {
      uint64_t v26 = daemon_log(0LL);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_100142C8C();
      }
    }

    CFRelease(v7);
  }

  else
  {
    uint64_t v24 = daemon_log(0LL);
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100142C60();
    }
  }

- (void)installWifiInterfaceMonitor
{
  if (!self->_wifiInterfaceMonitor)
  {
    BOOL v3 = dispatch_queue_create("com.apple.sharing.cwfinterface.queue", 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013EF4C;
    block[3] = &unk_1005CB2F8;
    void block[4] = self;
    dispatch_async(v3, block);
  }

- (void)updateWifiState:(int64_t)a3
{
  if (self->_wifiInterfaceMonitor)
  {
    pthread_mutex_lock(&stru_100643A38);
    uint64_t v5 = self->_wifiInterfaceMonitor;
    pthread_mutex_unlock(&stru_100643A38);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
    if (v6)
    {
      int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
      unsigned int v8 = [v7 is2GHz];
    }

    else
    {
      unsigned int v8 = 0;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](v5, "currentKnownNetworkProfile"));
    unsigned int v10 = [v9 isPersonalHotspot];

    unsigned int v11 = -[CWFInterface powerOn](v5, "powerOn");
    pthread_mutex_lock(&stru_100643A38);
    self->_isUsing2GHzWifCFIndex i = v8;
    self->_isWifiPersonalHotspot = v10;
    uint64_t v12 = pthread_mutex_unlock(&stru_100643A38);
    uint64_t v13 = daemon_log(v12);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v15 = @"NO";
      if (v11) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      if (v8) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      int v26 = 138412802;
      *(void *)id v27 = v16;
      *(_WORD *)&v27[8] = 2112;
      BOOL v28 = v17;
      if (v10) {
        __int128 v15 = @"YES";
      }
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WifiState: wirelessEnabled: %@ - isUsing2GHz: %@ - isWifiPersonalHotspot: %@\n",  (uint8_t *)&v26,  0x20u);
    }

    if (a3 == 8)
    {
      unsigned int v18 = (-[CWFInterface opMode](v5, "opMode") >> 3) & 1;
      unsigned int v19 = (-[CWFInterface opMode](v5, "opMode") >> 1) & 1;
      pthread_mutex_lock(&stru_100643A38);
      self->_wirelessAccessPoint = v18;
      self->_computerToComputer = v19;
      uint64_t v20 = pthread_mutex_unlock(&stru_100643A38);
      uint64_t v21 = daemon_log(v20);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 67109376;
        *(_DWORD *)id v27 = v18;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "WifiModeChange: wirelessAccessPoint: %d computerToComputer: %d",  (uint8_t *)&v26,  0xEu);
      }
    }

    uint64_t v23 = pthread_mutex_lock(&stru_100643A38);
    if (self->_wirelessEnabled == v11)
    {
      pthread_mutex_unlock(&stru_100643A38);
    }

    else
    {
      self->_wirelessEnabled = v11;
      uint64_t v24 = daemon_log(v23);
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 67109120;
        *(_DWORD *)id v27 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "WifiPowerChange: wirelessEnabled: %d",  (uint8_t *)&v26,  8u);
      }

      pthread_mutex_unlock(&stru_100643A38);
      -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
      -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.WirelessPowerChanged");
    }
  }

- (void)airplaneModeChanged
{
}

- (void)d2dEncryptionAvailableWithCompletionHandler:(id)a3
{
}

- (void)d2dEncryptionChanged
{
  uint64_t v2 = daemon_log(self);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device to device encryption status changed",  v4,  2u);
  }
}

- (void)installD2DEncryptionMonitor
{
  id location = 0LL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[SDStatusMonitor systemMonitor]( self,  "systemMonitor",  _NSConcreteStackBlock,  3221225472LL,  sub_10013F6A4,  &unk_1005CB220));
  [v3 setManateeChangedHandler:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)bluetoothAddressChanged
{
  uint64_t v2 = daemon_log(self);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth address changed", v4, 2u);
  }
}

- (void)installBluetoothMonitor
{
  if (!self->_bluetoothController)
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___CBController);
    bluetoothController = self->_bluetoothController;
    self->_bluetoothController = v3;

    id location = 0LL;
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10013F938;
    v13[3] = &unk_1005CB220;
    objc_copyWeak(&v14, &location);
    -[CBController setBluetoothStateChangedHandler:]( self->_bluetoothController,  "setBluetoothStateChangedHandler:",  v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10013F964;
    v11[3] = &unk_1005CB220;
    objc_copyWeak(&v12, &location);
    -[CBController setInvalidationHandler:](self->_bluetoothController, "setInvalidationHandler:", v11);
    id v5 = self->_bluetoothController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10013F990;
    v9[3] = &unk_1005CF660;
    objc_copyWeak(&v10, &location);
    -[CBController activateWithCompletion:](v5, "activateWithCompletion:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  id location = 0LL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  int v7[2] = sub_10013F9D8;
  v7[3] = &unk_1005CB220;
  objc_copyWeak(&v8, &location);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor systemMonitor](self, "systemMonitor"));
  [v6 setBluetoothAddressChangedHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)bluetoothStateChanged
{
  uint64_t v3 = daemon_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = (unint64_t)-[CBController bluetoothState](self->_bluetoothController, "bluetoothState");
    if (v5 > 0xA) {
      unsigned int v6 = "?";
    }
    else {
      unsigned int v6 = off_1005CF798[v5];
    }
    int v7 = 136315138;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Bluetooth state changed %s",  (uint8_t *)&v7,  0xCu);
  }

  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
  -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.BluetoothPowerChanged");
}

- (void)bluetoothActivatedWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = daemon_log(v4);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Bluetooth controller failed to activate - error: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Bluetooth controller activated",  (uint8_t *)&v8,  2u);
    }

    -[SDStatusMonitor bluetoothStateChanged](self, "bluetoothStateChanged");
  }
}

- (void)bluetoothDidSetPowerStateWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = daemon_log(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v3;
      BOOL v7 = "Bluetooth controller failed to set power state - error: %@";
      int v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }

  else if (v6)
  {
    LOWORD(v10) = 0;
    BOOL v7 = "Bluetooth controller set power state";
    int v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

- (void)bluetoothMonitorInvalidated
{
  uint64_t v3 = daemon_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Bluetooth controller invalidated, retry in 5 seconds",  v6,  2u);
  }

  bluetoothController = self->_bluetoothController;
  self->_bluetoothController = 0LL;

  -[SDStatusMonitor retryInstallBluetoothMonitor](self, "retryInstallBluetoothMonitor");
}

- (void)retryInstallBluetoothMonitor
{
  id location = 0LL;
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0LL, 5000000000LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10013FDD8;
  v3[3] = &unk_1005CB220;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, &_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)installBonjourNameMonitor
{
  if (!self->_nameMonitor)
  {
    p_nameMonitor = &self->_nameMonitor;
    uint64_t v3 = DNSServiceRegister( &self->_nameMonitor,  0,  0xFFFFFFFF,  0LL,  "_whats-my-name._tcp.",  "local.",  0LL,  0,  0,  0LL,  (DNSServiceRegisterReply)sub_10013FEE4,  self);
    if ((_DWORD)v3)
    {
      uint64_t v4 = daemon_log(v3);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100142D7C();
      }
    }

    else
    {
      uint64_t v6 = DNSServiceSetDispatchQueue(*p_nameMonitor, &_dispatch_main_q);
      if (!(_DWORD)v6) {
        return;
      }
      uint64_t v7 = daemon_log(v6);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100142D1C();
      }
    }
  }

- (void)uninstallBonjourNameMonitor
{
  nameMonitor = self->_nameMonitor;
  if (nameMonitor)
  {
    DNSServiceRefDeallocate(nameMonitor);
    self->_nameMonitor = 0LL;
  }

- (void)restartBonjourNameMonitor
{
}

- (void)installSmartCoverStatusMonitor
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SDSmartCoverMonitor);
  smartCoverMonitor = self->_smartCoverMonitor;
  self->_smartCoverMonitor = v3;
}

- (void)contactStoreDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013FFFC;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)meCardChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001400D8;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)installContactsMonitor
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  contactStore = self->_contactStore;
  self->_contactStore = v3;

  uint64_t v5 = (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager shared]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "shared"));
  contactHashManager = self->_contactHashManager;
  self->_contactHashManager = v5;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDStatusMonitor installContactsMonitor]"));
  -[SDStatusMonitor resetMeCardWithReason:](self, "resetMeCardWithReason:", v7);

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager kStatusContactsHashesChanged]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "kStatusContactsHashesChanged"));
  [v8 addObserver:self selector:"contactStoreDidChange:" name:v9 object:0];

  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropContactHashManager kStatusMeCardChanged]( &OBJC_CLASS____TtC16DaemoniOSLibrary27SDAirDropContactHashManager,  "kStatusMeCardChanged"));
  [v11 addObserver:self selector:"meCardChanged:" name:v10 object:0];
}

- (void)installDisplaySleepMonitor
{
  if (GestaltGetDeviceClass(self, a2) == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100140318;
    v3[3] = &unk_1005CB2F8;
    void v3[4] = self;
    -[objc_class addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( off_100643A78(),  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemAttentionState",  1LL,  1LL,  v3);
  }

- (void)handleDynamicStoreCallback:(__SCDynamicStore *)a3 changedKeys:(__CFArray *)a4
{
  CFStringRef cf2 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0LL, kSCDynamicStoreDomainState, @"awdl0", kSCEntNetLink);
  CFStringRef v6 = SCDynamicStoreKeyCreate( 0LL,  @"%@/%@/%@",  kSCDynamicStoreDomainState,  kSCCompNetwork,  @"MulticastDNS");
  CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(0LL);
  CFStringRef HostNames = SCDynamicStoreKeyCreateHostNames(0LL);
  CFIndex Count = CFArrayGetCount(a4);
  if (Count < 1) {
    goto LABEL_21;
  }
  CFIndex v10 = Count;
  uint64_t v18 = 0LL;
  char v11 = 0;
  char v12 = 0;
  for (CFIndex i = 0LL; i != v10; ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
    if (CFEqual(ValueAtIndex, ComputerName))
    {
      -[SDStatusMonitor clearComputerName](self, "clearComputerName");
      char v11 = 1;
    }

    else if (CFEqual(ValueAtIndex, HostNames))
    {
      -[SDStatusMonitor clearLocalHostName](self, "clearLocalHostName");
      char v12 = 1;
    }

    else if (CFEqual(ValueAtIndex, v6))
    {
      BYTE4(v18) = 1;
    }

    else
    {
      uint64_t v15 = CFEqual(ValueAtIndex, cf2);
      if ((_DWORD)v15)
      {
        LOBYTE(v18) = 1;
      }

      else
      {
        uint64_t v16 = daemon_log(v15);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = a4;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "SDStatusMonitor: Unknown keys changed (%@)",  buf,  0xCu);
        }
      }
    }
  }

  if ((v18 & 0x100000000LL) != 0)
  {
    -[SDStatusMonitor restartBonjourNameMonitor](self, "restartBonjourNameMonitor");
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.MulticastDNSChanged");
  }

  if ((v18 & 1) == 0)
  {
    if ((v12 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_23:
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.LocalHostNameChanged");
    if ((v11 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.AirDropLinkStateChanged");
  if ((v12 & 1) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  if ((v11 & 1) != 0) {
LABEL_20:
  }
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.ComputerNameChanged");
LABEL_21:
  CFRelease(ComputerName);
  CFRelease(HostNames);
  CFRelease(v6);
  CFRelease(cf2);
}

- (void)installDynamicStoreCallBack
{
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.info = self;
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(0LL, @"com.apple.sharingd", (SCDynamicStoreCallBack)sub_1001408C0, &context);
  if (v3)
  {
    uint64_t v4 = v3;
    CFStringRef HostNames = SCDynamicStoreKeyCreateHostNames(0LL);
    CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(0LL);
    CFStringRef v7 = SCDynamicStoreKeyCreate( 0LL,  @"%@/%@/%@",  kSCDynamicStoreDomainState,  kSCCompNetwork,  @"MulticastDNS");
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  @"awdl0",  kSCEntNetLink);
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, HostNames);
    CFArrayAppendValue(Mutable, ComputerName);
    CFArrayAppendValue(Mutable, v7);
    CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
    uint64_t v10 = SCDynamicStoreSetNotificationKeys(v4, Mutable, 0LL);
    if ((_DWORD)v10)
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(0LL, v4, 0LL);
      self->_dynamicStoreSource = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopRef Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_dynamicStoreSource, kCFRunLoopDefaultMode);
LABEL_13:
        CFRelease(HostNames);
        CFRelease(ComputerName);
        CFRelease(v7);
        CFRelease(NetworkInterfaceEntity);
        CFRelease(Mutable);
        CFRelease(v4);
        return;
      }

      uint64_t v17 = daemon_log(0LL);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100142EC4(v16);
      }
    }

    else
    {
      uint64_t v15 = daemon_log(v10);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100142E50(v16);
      }
    }

    goto LABEL_13;
  }

  uint64_t v13 = daemon_log(0LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100142DDC(v14);
  }
}

- (void)installKeyBagUnlockMonitor
{
  if (!self->_keyBagUnlockToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10014094C;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &self->_keyBagUnlockToken, &_dispatch_main_q, handler);
  }

- (void)installLocaleChangeMonitor
{
  SCDynamicStoreRef v3 = -[SDDeferrableOperation initWithIdentifier:queue:operation:]( objc_alloc(&OBJC_CLASS___SDDeferrableOperation),  "initWithIdentifier:queue:operation:",  @"preventExitForLocaleChange",  &_dispatch_main_q,  &stru_1005CF6C8);
  preventLocaleRestart = self->_preventLocaleRestart;
  self->_preventLocaleRestart = v3;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver( LocalCenter,  self,  (CFNotificationCallback)sub_100140ADC,  kCFLocaleCurrentLocaleDidChangeNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)installManagedConfigurationMonitor
{
  SCDynamicStoreRef v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 addObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"managedConfigurationSettingsChanged:" name:MCEffectiveSettingsChangedNotification object:0];

  -[SDStatusMonitor managedConfigurationSettingsChanged:](self, "managedConfigurationSettingsChanged:", 0LL);
}

- (void)managedConfigurationSettingsChanged:(id)a3
{
}

- (void)updateBlacklistedAppBundleIDs
{
  SCDynamicStoreRef v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 effectiveBlockedAppBundleIDs]);

  effectiveBlockedAppBundleIDs = self->_effectiveBlockedAppBundleIDs;
  int v8 = v4;
  CFStringRef v6 = effectiveBlockedAppBundleIDs;
  if (v8 == v6)
  {
  }

  else
  {
    if ((v8 == 0LL) != (v6 != 0LL))
    {
      unsigned __int8 v7 = -[NSSet isEqual:](v8, "isEqual:", v6);

      if ((v7 & 1) != 0) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_effectiveBlockedAppBundleIDs, v4);
    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.BlacklistedAppsChanged");
  }

- (void)handleNameMonitorCallBack:(const char *)a3 flags:(unsigned int)a4 error:(int)a5
{
  char v6 = a4;
  uint64_t v9 = pthread_mutex_lock(&stru_100643A38);
  if (a5)
  {
    uint64_t v10 = daemon_log(v9);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100142F38();
    }

    DNSServiceRefDeallocate(self->_nameMonitor);
    self->_nameMonitor = 0LL;
  }

  else if ((v6 & 2) != 0)
  {
    char v12 = (__CFString *)CFStringCreateWithCString(0LL, a3, 0x8000100u);
    if (sub_10008E314(self->_bonjourName, v12))
    {
      uint64_t v13 = (NSString *)-[__CFString copy](v12, "copy");
      bonjourName = self->_bonjourName;
      self->_bonjourName = v13;
    }

    else
    {
      CFRelease(v12);
    }
  }

  pthread_mutex_unlock(&stru_100643A38);
}

- (int64_t)pairedWatchWristState
{
  return self->_pairedWatchWristState;
}

- (void)updatePairedWatchWristState:(int64_t)a3
{
  uint64_t v5 = daemon_log(self);
  char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor stringForWatchWristState:](self, "stringForWatchWristState:", a3));
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Paired watch wrist state changed: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[SDStatusMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.PairedWatchWristStateChanged");
}

- (int)pairedWatchLockState
{
  return -1;
}

- (void)updatePairedWatchLockState:(int)a3
{
  uint64_t v5 = daemon_log(self);
  char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Paired watch wrist lock changed: %d",  (uint8_t *)v7,  8u);
  }

  -[SDStatusMonitor postNotification:]( self,  "postNotification:",  @"com.apple.sharingd.PairedWatchLockStateChanged");
}

- (void)installMISMonitor
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleMISStateChanged:" name:@"com.apple.sharingd.HotspotMISStateChanged" object:0];
}

- (void)handleMISStateChanged:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updating discoverable mode for personal hotspot change",  v6,  2u);
  }

  -[SDStatusMonitor updateDiscoverableMode](self, "updateDiscoverableMode");
}

- (void)updateLocalPowerSource:(id)a3
{
  uint64_t v4 = CUMainQueue(self, a2, a3);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141108;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (SFPowerSource)localPowerSource
{
  return 0LL;
}

- (void)handleSleepWakeCallBack:(unsigned int)a3 messageArguement:(void *)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      uint64_t v7 = daemon_log(self);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device can sleep", buf, 2u);
      }

      goto LABEL_8;
    case 1u:
      uint64_t v9 = daemon_log(self);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device will sleep", v18, 2u);
      }

      -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.SystemWillSleep");
LABEL_8:
      IOAllowPowerChange(self->_rootPort, (intptr_t)a4);
      return;
    case 2u:
      uint64_t v11 = daemon_log(self);
      char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device will not sleep", v16, 2u);
      }

      uint64_t v13 = @"com.apple.sharingd.SystemWillNotSleep";
      goto LABEL_15;
    case 9u:
      uint64_t v14 = daemon_log(self);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device has powered on", v17, 2u);
      }

      uint64_t v13 = @"com.apple.sharingd.SystemHasPoweredOn";
LABEL_15:
      -[SDStatusMonitor postNotification:](self, "postNotification:", v13);
      break;
    default:
      return;
  }

- (void)installSleepWakeCallBack
{
  int DeviceClass = GestaltGetDeviceClass(self, a2);
  if (self->_notifyPortRef) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = DeviceClass == 4;
  }
  if (!v4)
  {
    p_notifyPortRef = &self->_notifyPortRef;
    uint64_t v6 = IORegisterForSystemPower( self,  &self->_notifyPortRef,  (IOServiceInterestCallback)j__objc_msgSend_handleSleepWakeCallBack_messageArguement_,  &self->_notifierObject);
    self->_rootPort = v6;
    if ((_DWORD)v6)
    {
      CFRunLoopRef Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPortRef);
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    }

    else
    {
      uint64_t v9 = daemon_log(v6);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100142F98();
      }
    }
  }

- (void)reloadSMBConfInfo
{
  smbPreferences = self->_smbPreferences;
  id v11 = 0LL;
  id v12 = 0LL;
  unsigned __int8 v4 = -[SDStatusMonitor smbConfiguration:netBiosName:workgroup:]( self,  "smbConfiguration:netBiosName:workgroup:",  smbPreferences,  &v12,  &v11);
  id v5 = v12;
  id v6 = v12;
  id v7 = v11;
  id v8 = v11;
  if ((v4 & 1) != 0)
  {
    BOOL v9 = sub_10008E314(self->_netbiosName, v6);
    if (v9) {
      objc_storeStrong((id *)&self->_netbiosName, v5);
    }
    if (sub_10008E314(self->_workgroup, v8))
    {
      objc_storeStrong((id *)&self->_workgroup, v7);
      pthread_mutex_unlock(&stru_100643A38);
      if (v9) {
        -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.NetbiosNameChanged");
      }
      uint64_t v10 = @"com.apple.sharingd.WorkgroupChanged";
      goto LABEL_11;
    }

    pthread_mutex_unlock(&stru_100643A38);
    if (v9)
    {
      uint64_t v10 = @"com.apple.sharingd.NetbiosNameChanged";
LABEL_11:
      -[SDStatusMonitor postNotification:](self, "postNotification:", v10);
    }
  }

  else
  {
    pthread_mutex_unlock(&stru_100643A38);
  }
}

- (BOOL)smbConfiguration:(__SCPreferences *)a3 netBiosName:(id *)a4 workgroup:(id *)a5
{
  return 0;
}

- (void)updateWatchWristState:(int64_t)a3
{
  int64_t watchWristState = self->_watchWristState;
  self->_int64_t watchWristState = a3;
  if (watchWristState != a3)
  {
    uint64_t v6 = daemon_log(self);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor stringForWatchWristState:](self, "stringForWatchWristState:", a3));
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Watch wrist state changed: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[SDStatusMonitor postNotification:](self, "postNotification:", @"com.apple.sharingd.WristStateChanged");
  }

- (int64_t)watchWristState
{
  return self->_watchWristState;
}

- (id)stringForWatchWristState:(int64_t)a3
{
  else {
    return *(&off_1005CF7F0 + a3);
  }
}

- (void)handleWiFiPasswordSharingChanged
{
}

- (void)installWiFiPasswordSharingMonitor
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.AppleIDChanged" object:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];
}

- (void)installSSIDCacheMonitor
{
  id v3 = SCPreferencesCreateWithAuthorization(0LL, @"com.apple.sharingd", @"com.apple.wifi.plist", 0LL);
  if (v3)
  {
    unsigned __int8 v4 = v3;
    v12.version = 0LL;
    memset(&v12.retain, 0, 24);
    v12.info = self;
    int v5 = SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100141838, &v12);
    uint64_t v6 = SCPreferencesSetDispatchQueue(v4, &_dispatch_main_q);
    uint64_t v7 = daemon_log(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = "yes";
      if (!v5) {
        int v9 = "no";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SSID cache monitor successfully installed: %s",  buf,  0xCu);
    }

    CFRelease(v4);
  }

  else
  {
    uint64_t v10 = daemon_log(0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100142FC4();
    }
  }

- (void)clearWirelessState
{
  deviceSupportsWAPI = self->_deviceSupportsWAPI;
  self->_deviceSupportsWAPI = 0LL;

  pthread_mutex_unlock(&stru_100643A38);
}

- (void)logWiFiPowerState
{
  uint64_t v3 = daemon_log(self);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = -[SDStatusMonitor wirelessEnabled](self, "wirelessEnabled");
    uint64_t v6 = "off";
    if (v5) {
      uint64_t v6 = "on";
    }
    int v7 = 136315138;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi power is now %s", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_isEveryoneModeExpired
{
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _everyoneModeExpiryDate](self, "_everyoneModeExpiryDate"));
  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 laterDate:v2]);
    unsigned __int8 v5 = [v4 isEqualToDate:v3];
  }

  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)_everyoneModeExpiryDate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"EveryoneModeUpdateTime"]);

  if (v4)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1209600.0));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 laterDate:v6]);
    unsigned int v8 = [v7 isEqualToDate:v4];

    if (!v8)
    {
      -[SDStatusMonitor _everyoneModeExpiryInterval](self, "_everyoneModeExpiryInterval");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));
      goto LABEL_10;
    }

    uint64_t v10 = daemon_log(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Everyone mode updated date too far in future",  v15,  2u);
    }
  }

  else
  {
    uint64_t v12 = daemon_log(v5);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Everyone mode updated date not present",  buf,  2u);
    }
  }

  uint64_t v13 = 0LL;
LABEL_10:

  return v13;
}

- (void)_checkEveryoneModeExpiry
{
  uint64_t v3 = SFDeviceTimeLimitEveryoneMode(self, a2);
  if ((_DWORD)v3 && !self->_currentDiscoverableMode)
  {
    uint64_t v4 = daemon_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking initial everyone mode expiry",  v6,  2u);
    }

    if (-[SDStatusMonitor _isEveryoneModeExpired](self, "_isEveryoneModeExpired")) {
      -[SDStatusMonitor _expireEveryoneModeAndOnlySetDefault:](self, "_expireEveryoneModeAndOnlySetDefault:", 1LL);
    }
    else {
      -[SDStatusMonitor _scheduleCheckForEveryoneModeExpiry](self, "_scheduleCheckForEveryoneModeExpiry");
    }
  }

- (void)_expireEveryoneModeAndOnlySetDefault:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v6 = kSFOperationDiscoverableModeKey;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kSFOperationDiscoverableModeKey]);

  unsigned int v8 = [v7 isEqual:kSFOperationDiscoverableModeEveryone];
  uint64_t v9 = (void *)kSFOperationDiscoverableModeContactsOnly;
  if (!v8) {
    uint64_t v9 = v7;
  }
  id v10 = v9;
  uint64_t v11 = daemon_log(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Everyone mode expired - setting to %@",  (uint8_t *)&v14,  0xCu);
  }

  if (v3)
  {
    pthread_mutex_lock(&stru_100643A38);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v13 setObject:v10 forKey:v6];
    [v13 synchronize];
    pthread_mutex_unlock(&stru_100643A38);
  }

  else
  {
    -[SDStatusMonitor setDiscoverableMode:](self, "setDiscoverableMode:", v10);
  }

  -[SDStatusMonitor _cancelCheckForEveryoneModeExpiry](self, "_cancelCheckForEveryoneModeExpiry");
}

- (void)_updateEveryoneModeExpiryDateOnChange:(id)a3
{
  id v4 = a3;
  if (SFDeviceTimeLimitEveryoneMode(v4, v5))
  {
    if ([v4 isEqual:kSFOperationDiscoverableModeEveryone])
    {
      pthread_mutex_lock(&stru_100643A38);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v7 setObject:v6 forKey:@"EveryoneModeUpdateTime"];
      [v7 synchronize];
      uint64_t v8 = pthread_mutex_unlock(&stru_100643A38);
      uint64_t v9 = daemon_log(v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        uint64_t v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updating everyone mode updated date %@",  (uint8_t *)&v11,  0xCu);
      }

      -[SDStatusMonitor _scheduleCheckForEveryoneModeExpiry](self, "_scheduleCheckForEveryoneModeExpiry");
    }

    else
    {
      -[SDStatusMonitor _cancelCheckForEveryoneModeExpiry](self, "_cancelCheckForEveryoneModeExpiry");
    }
  }
}

- (void)_scheduleCheckForEveryoneModeExpiry
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSFOperationDiscoverableModeKey]);

  if (!self->_airDropEveryoneModeExpiryTimer
    && [v4 isEqual:kSFOperationDiscoverableModeEveryone])
  {
    pthread_mutex_lock(&stru_100643A38);
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    airDropEveryoneModeExpiryTimer = self->_airDropEveryoneModeExpiryTimer;
    self->_airDropEveryoneModeExpiryTimer = v5;

    int v7 = self->_airDropEveryoneModeExpiryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001420EC;
    handler[3] = &unk_1005CB2F8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    id v8 = -[SDStatusMonitor _currentEveryoneModeExpiryInterval](self, "_currentEveryoneModeExpiryInterval");
    double v10 = v9;
    uint64_t v11 = daemon_log(v8);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Scheduling everyone mode expiry handler for interval %@",  buf,  0xCu);
    }

    SFDispatchTimerSet(self->_airDropEveryoneModeExpiryTimer, v10, -1.0, 0.0);
    dispatch_resume((dispatch_object_t)self->_airDropEveryoneModeExpiryTimer);
    pthread_mutex_unlock(&stru_100643A38);
  }
}

- (void)_cancelCheckForEveryoneModeExpiry
{
  if (self->_airDropEveryoneModeExpiryTimer)
  {
    uint64_t v3 = pthread_mutex_lock(&stru_100643A38);
    uint64_t v4 = daemon_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Cancelling scheduled everyone mode expiry handler",  buf,  2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_airDropEveryoneModeExpiryTimer);
    airDropEveryoneModeExpiryTimer = self->_airDropEveryoneModeExpiryTimer;
    self->_airDropEveryoneModeExpiryTimer = 0LL;

    pthread_mutex_unlock(&stru_100643A38);
  }

  else
  {
    uint64_t v7 = daemon_log(self);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Everyone mode expiry handler already cancelled",  v9,  2u);
    }
  }

- (double)_everyoneModeExpiryInterval
{
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"EveryoneModeExpiryTimeInterval"]);

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }

  else
  {
    double v5 = 600.0;
  }

  return v5;
}

- (double)_currentEveryoneModeExpiryInterval
{
  dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor _everyoneModeExpiryDate](self, "_everyoneModeExpiryDate"));
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    double v5 = fmax(v4, 0.0);
  }

  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (NSDate)lastDeviceUnlockDate
{
  return (NSDate *)objc_getProperty(self, a2, 632LL, 1);
}

- (NSDate)lastDarkWakeDate
{
  return (NSDate *)objc_getProperty(self, a2, 640LL, 1);
}

- (NSSet)effectiveBlockedAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 648LL, 1);
}

- (BOOL)computerToComputer
{
  return self->_computerToComputer;
}

- (BOOL)controlCenterVisible
{
  return self->_controlCenterVisible;
}

- (BOOL)multipleUsersLoggedIn
{
  return self->_multipleUsersLoggedIn;
}

- (BOOL)wirelessAccessPoint
{
  return self->_wirelessAccessPoint;
}

- (BOOL)wirelessCritical
{
  return self->_wirelessCritical;
}

- (BOOL)isWifiPersonalHotspot
{
  return self->_isWifiPersonalHotspot;
}

- (BOOL)isUsing2GHzWifi
{
  return self->_isUsing2GHzWifi;
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (void).cxx_destruct
{
}

- (BOOL)screenStateSupportsAirDrop
{
  dispatch_time_t v2 = self;
  if (-[SDStatusMonitor screenOn](v2, "screenOn")) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = -[SDStatusMonitor isMirroringActive](v2, "isMirroringActive");
  }

  return v3;
}

@end