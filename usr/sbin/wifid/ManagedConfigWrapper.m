@interface ManagedConfigWrapper
+ (id)sharedInstance;
- (BOOL)isEAPShareBlockedByManagedDefault;
- (BOOL)isMegaWiFiProfileInstalled;
- (BOOL)isSupervisedDevice;
- (BOOL)isWiFiNetworkMDMNetwork:(__WiFiNetwork *)a3;
- (BOOL)isWiFiNetworkSubjectToMDM:(__WiFiNetwork *)a3;
- (BOOL)isWiFiPowerModificationDisabled;
- (BOOL)mcInitialized;
- (BOOL)monitoring;
- (MCProfileConnection)mcConnection;
- (NSString)profileIdentifier;
- (OS_dispatch_queue)queue;
- (__WiFiManager)manager;
- (void)MCInitialize;
- (void)MCSettingsDidChange:(id)a3;
- (void)dealloc;
- (void)initializeWithHandler:(__WiFiManager *)a3;
- (void)installMegaWiFiProfile;
- (void)scheduleWithQueue:(id)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setMcConnection:(id)a3;
- (void)setMcInitialized:(BOOL)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)uninstallMegaWiFiProfile;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation ManagedConfigWrapper

+ (id)sharedInstance
{
  if (qword_100219808 != -1) {
    dispatch_once(&qword_100219808, &stru_1001E2A78);
  }
  return (id)qword_100219800;
}

- (void)initializeWithHandler:(__WiFiManager *)a3
{
  v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: starting" message:3];
  }
  objc_autoreleasePoolPop(v5);
  -[ManagedConfigWrapper setManager:](self, "setManager:", a3);
  -[ManagedConfigWrapper setMcInitialized:](self, "setMcInitialized:", 0LL);
  -[ManagedConfigWrapper setMonitoring:](self, "setMonitoring:", 0LL);
  -[ManagedConfigWrapper setMcConnection:]( self,  "setMcConnection:",  +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  -[ManagedConfigWrapper setProfileIdentifier:](self, "setProfileIdentifier:", 0LL);
}

- (void)dealloc
{
  if (-[ManagedConfigWrapper monitoring](self, "monitoring")) {
    -[ManagedConfigWrapper stopMonitoring](self, "stopMonitoring");
  }

  self->_profileIdentifier = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ManagedConfigWrapper;
  -[ManagedConfigWrapper dealloc](&v3, "dealloc");
}

- (void)MCSettingsDidChange:(id)a3
{
  v4 = objc_autoreleasePoolPush();
  unsigned int v5 = -[MCProfileConnection isWiFiWithAllowedNetworksOnlyEnforced]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "isWiFiWithAllowedNetworksOnlyEnforced");
  unsigned int v6 = -[MCProfileConnection isWiFiPowerModificationAllowed]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "isWiFiPowerModificationAllowed");
  unsigned int v7 = -[MCProfileConnection isPersonalHotspotModificationAllowed]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "isPersonalHotspotModificationAllowed");
  v8 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    v9 = "FALSE";
    if (v5) {
      v9 = "TRUE";
    }
    v10 = "Disabled";
    if (v6) {
      v11 = "Enabled";
    }
    else {
      v11 = "Disabled";
    }
    if (v7) {
      v10 = "Enabled";
    }
    [qword_100219F60 WFLog:@"MCNotification received. isWiFiWithAllowedNetworksOnlyEnforced (%s) WiFiPowerModification (%s) PersonalHotspot Modification (%s)",  "-[ManagedConfigWrapper MCSettingsDidChange:]",  v9,  v11,  v10];
  }

  objc_autoreleasePoolPop(v8);
  if (-[ManagedConfigWrapper queue](self, "queue"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012050;
    block[3] = &unk_1001E2AA0;
    block[4] = self;
    char v14 = v6 ^ 1;
    char v15 = v7 ^ 1;
    char v16 = v5;
    dispatch_async((dispatch_queue_t)-[ManagedConfigWrapper queue](self, "queue"), block);
  }

  else
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: probably WiFiManager is in middle of closing." message:4 "-[ManagedConfigWrapper MCSettingsDidChange:]"];
    }
    objc_autoreleasePoolPop(v12);
  }

  objc_autoreleasePoolPop(v4);
}

- (BOOL)isWiFiPowerModificationDisabled
{
  objc_super v3 = objc_autoreleasePoolPush();
  LOBYTE(self) = -[MCProfileConnection isWiFiPowerModificationAllowed]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "isWiFiPowerModificationAllowed") ^ 1;
  objc_autoreleasePoolPop(v3);
  return (char)self;
}

- (void)MCInitialize
{
  objc_super v3 = objc_autoreleasePoolPush();
  if (!-[ManagedConfigWrapper mcInitialized](self, "mcInitialized"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100012158;
    v4[3] = &unk_1001E2AC8;
    v4[4] = self;
    -[MCProfileConnection checkInWithCompletion:]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "checkInWithCompletion:",  v4);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)scheduleWithQueue:(id)a3
{
  unsigned int v5 = objc_autoreleasePoolPush();
  -[ManagedConfigWrapper setQueue:](self, "setQueue:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012284;
  block[3] = &unk_1001E2AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_100219F80, block);
  objc_autoreleasePoolPop(v5);
}

- (void)unscheduleFromQueue:(id)a3
{
  v4 = objc_autoreleasePoolPush();
  -[ManagedConfigWrapper stopMonitoring](self, "stopMonitoring");
  -[ManagedConfigWrapper setQueue:](self, "setQueue:", 0LL);
  objc_autoreleasePoolPop(v4);
}

- (void)startMonitoring
{
  objc_super v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[ManagedConfigWrapper startMonitoring] adding observer"];
  }
  objc_autoreleasePoolPop(v4);
  unsigned int v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  self,  "MCSettingsDidChange:",  MCEffectiveSettingsChangedNotification,  0LL);
  -[ManagedConfigWrapper setMonitoring:](self, "setMonitoring:", 1LL);
  objc_autoreleasePoolPop(v3);
}

- (void)stopMonitoring
{
  objc_super v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: removing observer" message:3];
  }
  objc_autoreleasePoolPop(v4);
  unsigned int v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v5,  "removeObserver:name:object:",  self,  MCEffectiveSettingsChangedNotification,  0LL);
  -[ManagedConfigWrapper setMonitoring:](self, "setMonitoring:", 0LL);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isWiFiNetworkSubjectToMDM:(__WiFiNetwork *)a3
{
  unsigned int v5 = objc_autoreleasePoolPush();
  unsigned int v6 = sub_1000951FC((uint64_t)a3, @"PayloadUUID");
  if (v6)
  {
    id v7 = -[MCProfileConnection installedProfilesWithFilterFlags:]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "installedProfilesWithFilterFlags:",  69LL);
    if (v7) {
      LOBYTE(v6) = [objc_msgSend( v7 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:]( NSPredicate, "predicateWithFormat:", @"ANY SELF.payloads.UUID MATCHES %@", v6)), "count"] == 0;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }

  objc_autoreleasePoolPop(v5);
  return (char)v6;
}

- (BOOL)isEAPShareBlockedByManagedDefault
{
  v2 = objc_autoreleasePoolPush();
  objc_super v3 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/Library/Managed Preferences/mobile/.GlobalPreferences.plist");
  BOOL v4 = v3
    && [v3 objectForKeyedSubscript:@"EAPCredentialShareDisable"] intValue];
  objc_autoreleasePoolPop(v2);
  return v4;
}

- (BOOL)isSupervisedDevice
{
  v2 = objc_autoreleasePoolPush();
  unsigned __int8 v3 = [MCProfileConnection sharedConnection].isSupervised;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)isWiFiNetworkMDMNetwork:(__WiFiNetwork *)a3
{
  unsigned int v5 = objc_autoreleasePoolPush();
  unsigned int v6 = sub_1000951FC((uint64_t)a3, @"PayloadUUID");
  if (v6)
  {
    id v7 = -[MCProfileConnection installedProfilesWithFilterFlags:]( -[ManagedConfigWrapper mcConnection](self, "mcConnection"),  "installedProfilesWithFilterFlags:",  32LL);
    if (v7) {
      LOBYTE(v6) = [objc_msgSend( v7 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:]( NSPredicate, "predicateWithFormat:", @"ANY SELF.payloads.UUID MATCHES %@", v6)), "count"] != 0;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }

  objc_autoreleasePoolPop(v5);
  return (char)v6;
}

- (void)installMegaWiFiProfile
{
  unsigned __int8 v3 = objc_autoreleasePoolPush();
  uint64_t v5 = 0LL;
  -[ManagedConfigWrapper setProfileIdentifier:]( self,  "setProfileIdentifier:",  -[MCProfileConnection installProfileData:outError:]( self->_mcConnection,  "installProfileData:outError:",  +[NSData dataWithContentsOfURL:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:",  +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/AppleInternal/Library/WiFi/Profiles/MegaWifi Profile.mobileconfig")),  &v5));
  if (v5)
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: %@", "-[ManagedConfigWrapper installMegaWiFiProfile]", v5 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)uninstallMegaWiFiProfile
{
  unsigned __int8 v3 = objc_autoreleasePoolPush();
  if (-[ManagedConfigWrapper profileIdentifier](self, "profileIdentifier"))
  {
    -[MCProfileConnection removeProfileWithIdentifier:]( self->_mcConnection,  "removeProfileWithIdentifier:",  -[ManagedConfigWrapper profileIdentifier](self, "profileIdentifier"));
    -[ManagedConfigWrapper setProfileIdentifier:](self, "setProfileIdentifier:", 0LL);
  }

  objc_autoreleasePoolPop(v3);
}

- (BOOL)isMegaWiFiProfileInstalled
{
  unsigned __int8 v3 = objc_autoreleasePoolPush();
  id v4 = -[MCProfileConnection installedProfilesWithFilterFlags:]( self->_mcConnection,  "installedProfilesWithFilterFlags:",  1LL);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "identifier"),  "isEqualToString:",  @"com.apple.defaults.managed.corecapture.wifi.megawifi"))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:
  objc_autoreleasePoolPop(v3);
  return v9;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (BOOL)mcInitialized
{
  return self->_mcInitialized;
}

- (void)setMcInitialized:(BOOL)a3
{
  self->_mcInitialized = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (MCProfileConnection)mcConnection
{
  return self->_mcConnection;
}

- (void)setMcConnection:(id)a3
{
  self->_mcConnection = (MCProfileConnection *)a3;
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

@end