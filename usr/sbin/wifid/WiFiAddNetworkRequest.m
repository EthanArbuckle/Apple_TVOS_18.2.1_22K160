@interface WiFiAddNetworkRequest
- (BOOL)bypassPrompt;
- (BOOL)poweredOff;
- (BOOL)sessionBased;
- (BOOL)usingPrefix;
- (BOOL)wapi;
- (NSDictionary)alertDictionary;
- (NSString)bundleId;
- (NSString)localizedApplicationName;
- (WiFiAddNetworkRequest)init;
- (WiFiAddNetworkRequest)initWithClient:(__WiFiClient *)a3 network:(__WiFiNetwork *)a4 bundleId:(id)a5 localizedAppName:(id)a6 originator:(int)a7 poweredOff:(BOOL)a8 wapi:(BOOL)a9 sessionBased:(BOOL)a10 useSSIDPrefix:(BOOL)a11 callback:(void *)a12 context:(void *)a13 bypassPrompt:(BOOL)a14;
- (__CFDictionary)_createAlertDictionary;
- (__WiFiClient)client;
- (__WiFiNetwork)network;
- (int)originator;
- (void)callback;
- (void)context;
- (void)dealloc;
- (void)setAlertDictionary:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setBypassPrompt:(BOOL)a3;
- (void)setCallback:(void *)a3;
- (void)setClient:(__WiFiClient *)a3;
- (void)setContext:(void *)a3;
- (void)setLocalizedApplicationName:(id)a3;
- (void)setNetwork:(__WiFiNetwork *)a3;
- (void)setNetworkMatchingPrefix:(__WiFiNetwork *)a3;
- (void)setOriginator:(int)a3;
- (void)setPoweredOff:(BOOL)a3;
- (void)setSessionBased:(BOOL)a3;
- (void)setUsingPrefix:(BOOL)a3;
- (void)setWapi:(BOOL)a3;
@end

@implementation WiFiAddNetworkRequest

- (WiFiAddNetworkRequest)init
{
  return -[WiFiAddNetworkRequest initWithClient:network:bundleId:localizedAppName:originator:poweredOff:wapi:sessionBased:useSSIDPrefix:callback:context:bypassPrompt:]( v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v11,  v12,  v13,  v14,  v15,  v16);
}

- (WiFiAddNetworkRequest)initWithClient:(__WiFiClient *)a3 network:(__WiFiNetwork *)a4 bundleId:(id)a5 localizedAppName:(id)a6 originator:(int)a7 poweredOff:(BOOL)a8 wapi:(BOOL)a9 sessionBased:(BOOL)a10 useSSIDPrefix:(BOOL)a11 callback:(void *)a12 context:(void *)a13 bypassPrompt:(BOOL)a14
{
  v21 = objc_autoreleasePoolPush();
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___WiFiAddNetworkRequest;
  v22 = -[WiFiAddNetworkRequest init](&v28, "init");
  if (!v22 || (v23 = v22, v22->_client = a3, !a4) || (v22->_network = a4, !a5))
  {
LABEL_13:
    v23 = 0LL;
    goto LABEL_9;
  }

  if (a7) {
    v22->_localizedApplicationName = (NSString *)[a6 copy];
  }
  v23->_originator = a7;
  v23->_bundleId = (NSString *)[a5 copy];
  v23->_poweredOff = a8;
  v23->_wapi = a9;
  v23->_sessionBased = a10;
  v23->_callback = a12;
  v23->_context = a13;
  v23->_usingPrefix = a11;
  v23->_bypassPrompt = a14;
  v24 = -[WiFiAddNetworkRequest _createAlertDictionary](v23, "_createAlertDictionary");
  if (!v24)
  {
    v27 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "Failed to create alert dictionary for %@ identifier", a5 message];
    }
    objc_autoreleasePoolPop(v27);
    goto LABEL_13;
  }

  v23->_alertDictionary = (NSDictionary *)v24;
  CFRetain(v23->_network);
  client = v23->_client;
  if (client) {
    CFRetain(client);
  }
LABEL_9:
  objc_autoreleasePoolPop(v21);
  return v23;
}

- (__CFDictionary)_createAlertDictionary
{
  SEL v3 = objc_autoreleasePoolPush();
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable && sub_10012FD80())
  {
    if (sub_100095318((BOOL)self->_network))
    {
      CFMutableStringRef v5 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
      if (v5)
      {
        id v6 = v5;
        if (self->_wapi) {
          id v7 = @"WIFI_CONFIGURE_NETWORK_TITLE_CH";
        }
        else {
          id v7 = @"WIFI_CONFIGURE_NETWORK_TITLE";
        }
        int v8 = (const __CFString *)sub_10012FD94((uint64_t)v7);
        CFStringAppendFormat(v6, 0LL, v8, self->_localizedApplicationName, 0LL);
        CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v6);
        BOOL v9 = 0LL;
        v10 = @"WIFI_JOIN_NETWORK_ALLOW";
        goto LABEL_27;
      }
    }

    else
    {
      BOOL v11 = sub_100095BC8(self->_network);
      CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%c%@%c", 8LL, v11, 127LL);
      if (v12)
      {
        BOOL v9 = (__CFString *)v12;
        CFMutableStringRef v13 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
        if (!v13)
        {
          id v6 = v9;
LABEL_31:
          CFRelease(v6);
          goto LABEL_32;
        }

        id v6 = v13;
        int originator = self->_originator;
        if (originator == 6 || originator == 1)
        {
          if (self->_wapi) {
            v15 = @"WIFI_JOIN_NETWORK_TITLE_CH";
          }
          else {
            v15 = @"WIFI_JOIN_NETWORK_TITLE";
          }
          BOOL v16 = (const __CFString *)sub_10012FD94((uint64_t)v15);
          CFStringAppendFormat(v6, 0LL, v16, self->_localizedApplicationName, v9);
        }

        else
        {
          if (self->_wapi) {
            v17 = @"WIFI_USER_JOIN_NETWORK_TITLE_CH";
          }
          else {
            v17 = @"WIFI_USER_JOIN_NETWORK_TITLE";
          }
          v18 = (const __CFString *)sub_10012FD94((uint64_t)v17);
          CFStringAppendFormat(v6, 0LL, v18, v9, v24);
        }

        CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v6);
        if (self->_poweredOff)
        {
          if (self->_wapi) {
            v19 = @"WIFI_JOIN_NETWORK_MSG_POWER_OFF_CH";
          }
          else {
            v19 = @"WIFI_JOIN_NETWORK_MSG_POWER_OFF";
          }
          id v20 = sub_10012FD94((uint64_t)v19);
          CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v20);
        }

        v10 = @"WIFI_JOIN_NETWORK_JOIN";
LABEL_27:
        id v21 = sub_10012FD94((uint64_t)v10);
        CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v21);
        if (SBUserNotificationDismissOnLock)
        {
          CFDictionarySetValue(Mutable, SBUserNotificationDismissOnLock, kCFBooleanTrue);
          CFDictionarySetValue(Mutable, SBUserNotificationAlertMessageDelimiterKey, &stru_1001EB6E0);
          CFDictionarySetValue(Mutable, SBUserNotificationForcesModalAlertAppearance, kCFBooleanTrue);
          CFDictionarySetValue(Mutable, SBUserNotificationDisplayActionButtonOnLockScreen, kCFBooleanTrue);
        }

        CFDictionarySetValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
        id v22 = sub_10012FD94((uint64_t)@"WIFI_JOIN_NETWORK_CANCEL");
        CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v22);
        if (v9) {
          CFRelease(v9);
        }
        goto LABEL_31;
      }
    }
  }

- (void)dealloc
{
  network = self->_network;
  if (network)
  {
    CFRelease(network);
    self->_network = 0LL;
  }

  client = self->_client;
  if (client)
  {
    CFRelease(client);
    self->_client = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiAddNetworkRequest;
  -[WiFiAddNetworkRequest dealloc](&v5, "dealloc");
}

- (void)setNetworkMatchingPrefix:(__WiFiNetwork *)a3
{
  if (self->_usingPrefix)
  {
    network = self->_network;
    id v6 = sub_100095BC8(a3);
    sub_10009582C((uint64_t)network, @"SSID_STR", v6);
    id v7 = self->_network;
    int v8 = sub_100096804(a3);
    sub_10009582C((uint64_t)v7, @"SSID", v8);

    self->_alertDictionary = (NSDictionary *)-[WiFiAddNetworkRequest _createAlertDictionary]( self,  "_createAlertDictionary");
    self->_usingPrefix = 0;
  }

- (int)originator
{
  return self->_originator;
}

- (void)setOriginator:(int)a3
{
  self->_int originator = a3;
}

- (NSString)localizedApplicationName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLocalizedApplicationName:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBundleId:(id)a3
{
}

- (__WiFiClient)client
{
  return self->_client;
}

- (void)setClient:(__WiFiClient *)a3
{
  self->_client = a3;
}

- (__WiFiNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(__WiFiNetwork *)a3
{
  self->_network = a3;
}

- (NSDictionary)alertDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAlertDictionary:(id)a3
{
}

- (BOOL)sessionBased
{
  return self->_sessionBased;
}

- (void)setSessionBased:(BOOL)a3
{
  self->_sessionBased = a3;
}

- (BOOL)usingPrefix
{
  return self->_usingPrefix;
}

- (void)setUsingPrefix:(BOOL)a3
{
  self->_usingPrefix = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (BOOL)bypassPrompt
{
  return self->_bypassPrompt;
}

- (void)setBypassPrompt:(BOOL)a3
{
  self->_bypassPrompt = a3;
}

- (BOOL)poweredOff
{
  return self->_poweredOff;
}

- (void)setPoweredOff:(BOOL)a3
{
  self->_poweredOff = a3;
}

- (BOOL)wapi
{
  return self->_wapi;
}

- (void)setWapi:(BOOL)a3
{
  self->_wapi = a3;
}

@end