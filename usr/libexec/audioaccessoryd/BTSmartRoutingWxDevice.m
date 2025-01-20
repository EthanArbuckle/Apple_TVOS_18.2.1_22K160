@interface BTSmartRoutingWxDevice
- (BOOL)connected;
- (BOOL)firstBannerShown;
- (BOOL)hasOwnership;
- (BOOL)hfpSetupFailureNotifyRegistered;
- (BOOL)ignoreManualConnect;
- (BOOL)inEar;
- (BOOL)inEarDisabled;
- (BOOL)isRoutingActionInitialized;
- (BOOL)isTipiHealingV2Eligible;
- (BOOL)lastPlay;
- (BOOL)manualRouteChangeInProgress;
- (BOOL)manuallyRouted;
- (BOOL)otherTipiDeviceIsStreamingAudio;
- (BOOL)otherTipiDeviceIsWatch;
- (BOOL)otherTipiDeviceLastPlay;
- (BOOL)ownershipMonitorRegistered;
- (BOOL)proactiveRoutingBackoff;
- (BOOL)routed;
- (BOOL)tipiHealingBackoff;
- (BOOL)tipitableUpdated;
- (BTAudioRoutingRequest)audioRoutingRequest;
- (BTAudioSession)audioSessionInProgress;
- (NSMutableDictionary)audioSessionMap;
- (NSNumber)otherTipiDeviceVersion;
- (NSString)conduitDeviceID;
- (NSString)deviceAddress;
- (NSString)deviceName;
- (NSString)deviceVersion;
- (NSString)identifier;
- (NSString)otherTipiDeviceBTAddress;
- (NSString)otherTipiDeviceBTName;
- (NSString)otherTipiDevicePlayingApp;
- (OS_dispatch_source)conduitMessageTimer;
- (double)lowestBudBatteryInfo;
- (id)audioRoutingResponse;
- (id)audioSessionInProgressResponse;
- (int)audioRoutingScore;
- (int)otherTipiDeviceAudioScore;
- (int)routingAction;
- (int)routingUI;
- (int64_t)otherTipiDeviceMajorBuildVersion;
- (int64_t)otherTipiDeviceMinorBuildVersion;
- (unint64_t)conduitMessageTicks;
- (unint64_t)hijackBackoffTicks;
- (unint64_t)otherTipiDeviceIdleTick;
- (unint64_t)otherTipiManuallyRouteTicks;
- (unsigned)audioRoutingClientID;
- (unsigned)otherTipiAudioCategory;
- (unsigned)productID;
- (unsigned)tipiAndRoutedState;
- (void)_setFirstBannerShown:(BOOL)a3;
- (void)_setHijackBackoffTick:(unint64_t)a3;
- (void)_setManualRoute:(BOOL)a3;
- (void)_setManualRouteChangeInProgress:(BOOL)a3;
- (void)_setOtherTipiAudioCategory:(unsigned int)a3;
- (void)_setOtherTipiDeviceBuildVersion:(int64_t)a3 andMinorBuildVersion:(int64_t)a4;
- (void)_setOtherTipiDeviceInfo:(id)a3 andName:(id)a4 andVersion:(id)a5;
- (void)_setOtherTipiDeviceIsStreamingAudio:(BOOL)a3;
- (void)_setOtherTipiDeviceIsWatch:(BOOL)a3;
- (void)_setOtherTipiManuallyRouteTick:(unint64_t)a3;
- (void)_setOtherTipiPlayingApp:(id)a3;
- (void)_setOwnership:(BOOL)a3;
- (void)_setRoutedState:(BOOL)a3;
- (void)_setRoutingAction:(int)a3;
- (void)_setRoutingInitialized:(BOOL)a3;
- (void)_setRoutingUI:(int)a3;
- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3;
- (void)setAudioRoutingClientID:(unsigned int)a3;
- (void)setAudioRoutingRequest:(id)a3;
- (void)setAudioRoutingResponse:(id)a3;
- (void)setAudioRoutingScore:(int)a3;
- (void)setAudioSessionInProgress:(id)a3;
- (void)setAudioSessionInProgressResponse:(id)a3;
- (void)setAudioSessionMap:(id)a3;
- (void)setConduitDeviceID:(id)a3;
- (void)setConduitMessageTicks:(unint64_t)a3;
- (void)setConduitMessageTimer:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceVersion:(id)a3;
- (void)setHfpSetupFailureNotifyRegistered:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreManualConnect:(BOOL)a3;
- (void)setInEar:(BOOL)a3;
- (void)setInEarDisabled:(BOOL)a3;
- (void)setIsTipiHealingV2Eligible:(BOOL)a3;
- (void)setLastPlay:(BOOL)a3;
- (void)setLowestBudBatteryInfo:(double)a3;
- (void)setOtherTipiDeviceAudioScore:(int)a3;
- (void)setOtherTipiDeviceIdleTick:(unint64_t)a3;
- (void)setOtherTipiDeviceIsWatch:(BOOL)a3;
- (void)setOtherTipiDeviceLastPlay:(BOOL)a3;
- (void)setOtherTipiDevicePlayingApp:(id)a3;
- (void)setOwnershipMonitorRegistered:(BOOL)a3;
- (void)setProactiveRoutingBackoff:(BOOL)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setTipiHealingBackoff:(BOOL)a3;
- (void)setTipitableUpdated:(BOOL)a3;
@end

@implementation BTSmartRoutingWxDevice

- (void)_setFirstBannerShown:(BOOL)a3
{
  BOOL firstBannerShown = self->firstBannerShown;
  if (firstBannerShown != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (firstBannerShown) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setFirstBannerShown:]",  30LL,  "Setting firstBanner for Wx %@ %s -> %s",  self->deviceAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL firstBannerShown = self->firstBannerShown;
        goto LABEL_4;
      }
    }

- (void)_setHijackBackoffTick:(unint64_t)a3
{
  unint64_t hijackBackoffTicks = self->hijackBackoffTicks;
  if (hijackBackoffTicks != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        unint64_t hijackBackoffTicks = self->hijackBackoffTicks;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setHijackBackoffTick:]",  30LL,  "Setting hijackBackoffTicks for Wx %@ %u -> %u",  self->deviceAddress,  hijackBackoffTicks,  a3);
    }

- (void)_setManualRoute:(BOOL)a3
{
  BOOL manuallyRouted = self->manuallyRouted;
  if (manuallyRouted != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (manuallyRouted) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setManualRoute:]",  30LL,  "Setting manuallyRouted %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL manuallyRouted = self->manuallyRouted;
        goto LABEL_4;
      }
    }

- (void)_setManualRouteChangeInProgress:(BOOL)a3
{
  BOOL manualRouteChangeInProgress = self->manualRouteChangeInProgress;
  if (manualRouteChangeInProgress != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (manualRouteChangeInProgress) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setManualRouteChangeInProgress:]",  30LL,  "Setting manualRouteChangeInProgress %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL manualRouteChangeInProgress = self->manualRouteChangeInProgress;
        goto LABEL_4;
      }
    }

- (void)_setOtherTipiAudioCategory:(unsigned int)a3
{
  uint64_t otherTipiAudioCategory = self->otherTipiAudioCategory;
  if ((_DWORD)otherTipiAudioCategory != a3)
  {
    uint64_t v4 = *(void *)&a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        uint64_t otherTipiAudioCategory = self->otherTipiAudioCategory;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiAudioCategory:]",  30LL,  "Setting OtherTipiAudioCategory for Wx %@ %d -> %d",  self->deviceAddress,  otherTipiAudioCategory,  v4);
    }

- (void)_setOtherTipiPlayingApp:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = -[NSString isEqualToString:](self->otherTipiDevicePlayingApp, "isEqualToString:", v7);
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiPlayingApp:]",  30LL,  "Setting OtherTipiDevicePlayingApp for Wx %@ %@ -> %@",  self->deviceAddress,  self->otherTipiDevicePlayingApp,  v7);
    }

    objc_storeStrong((id *)&self->otherTipiDevicePlayingApp, a3);
    v6 = v7;
  }
}

- (void)_setOtherTipiDeviceInfo:(id)a3 andName:(id)a4 andVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = (unint64_t)v9;
  otherTipiDeviceBTAddress = self->otherTipiDeviceBTAddress;
  id v16 = (id)v12;
  unsigned __int8 v14 = -[NSString isEqualToString:](otherTipiDeviceBTAddress, "isEqualToString:", v12);
  id v15 = v16;
  if ((v14 & 1) == 0)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiDeviceInfo:andName:andVersion:]",  30LL,  "Setting otherTipi for Wx %@ %@ -> %@ name %@ version %@",  self->deviceAddress,  self->otherTipiDeviceBTAddress,  v16,  v10,  v11);
    }

    objc_storeStrong((id *)&self->otherTipiDeviceBTAddress, a3);
    objc_storeStrong((id *)&self->otherTipiDeviceBTName, a4);
    objc_storeStrong((id *)&self->otherTipiDeviceVersion, a5);
    id v15 = v16;
  }

  if (!v15) {
LABEL_9:
  }
    self->uint64_t otherTipiAudioCategory = 0;
}

- (void)_setOtherTipiDeviceIsStreamingAudio:(BOOL)a3
{
  BOOL otherTipiDeviceIsStreamingAudio = self->otherTipiDeviceIsStreamingAudio;
  if (otherTipiDeviceIsStreamingAudio != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (otherTipiDeviceIsStreamingAudio) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiDeviceIsStreamingAudio:]",  30LL,  "Setting otherTipiDeviceIsStreamingAudio %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL otherTipiDeviceIsStreamingAudio = self->otherTipiDeviceIsStreamingAudio;
        goto LABEL_4;
      }
    }

- (void)_setOtherTipiDeviceIsWatch:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL otherTipiDeviceIsWatch = self->otherTipiDeviceIsWatch;
  if (otherTipiDeviceIsWatch == a3) {
    goto LABEL_12;
  }
  if (dword_100234408 <= 30)
  {
    if (dword_100234408 != -1)
    {
LABEL_4:
      v6 = "yes";
      if (otherTipiDeviceIsWatch) {
        id v7 = "yes";
      }
      else {
        id v7 = "no";
      }
      if (!v3) {
        v6 = "no";
      }
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiDeviceIsWatch:]",  30LL,  "Setting otherTipiDeviceIsWatch %s -> %s",  v7,  v6);
      goto LABEL_11;
    }

    if (_LogCategory_Initialize(&dword_100234408, 30LL))
    {
      BOOL otherTipiDeviceIsWatch = self->otherTipiDeviceIsWatch;
      goto LABEL_4;
    }
  }

- (void)_setOtherTipiDeviceBuildVersion:(int64_t)a3 andMinorBuildVersion:(int64_t)a4
{
  int64_t otherTipiDeviceMajorBuildVersion = self->otherTipiDeviceMajorBuildVersion;
  if (*(_OWORD *)&self->otherTipiDeviceMajorBuildVersion != __PAIR128__(a4, a3))
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        int64_t otherTipiDeviceMajorBuildVersion = self->otherTipiDeviceMajorBuildVersion;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiDeviceBuildVersion:andMinorBuildVersion:]",  30LL,  "Setting otherTipi build version for Wx %@ %d.%d -> %d.%d",  self->deviceAddress,  otherTipiDeviceMajorBuildVersion,  self->otherTipiDeviceMinorBuildVersion,  a3,  a4);
    }

- (void)_setOtherTipiManuallyRouteTick:(unint64_t)a3
{
  unint64_t otherTipiManuallyRouteTicks = self->otherTipiManuallyRouteTicks;
  if (otherTipiManuallyRouteTicks != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (otherTipiManuallyRouteTicks) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!a3) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOtherTipiManuallyRouteTick:]",  30LL,  "Setting otherTipiManuallyRouteTick for Wx %@ %u -> %u",  self->deviceAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        unint64_t otherTipiManuallyRouteTicks = self->otherTipiManuallyRouteTicks;
        goto LABEL_4;
      }
    }

- (void)_setOwnership:(BOOL)a3
{
  BOOL hasOwnership = self->hasOwnership;
  if (hasOwnership != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (hasOwnership) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setOwnership:]",  30LL,  "Updating Wx ownership %@ %s -> %s",  self->deviceAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL hasOwnership = self->hasOwnership;
        goto LABEL_4;
      }
    }

- (void)_setRoutedState:(BOOL)a3
{
  BOOL routed = self->routed;
  if (routed != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (routed) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setRoutedState:]",  30LL,  "Setting routedState for Wx %@ %s -> %s",  self->deviceAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL routed = self->routed;
        goto LABEL_4;
      }
    }

- (void)_setRoutingInitialized:(BOOL)a3
{
  BOOL isRoutingActionInitialized = self->isRoutingActionInitialized;
  if (isRoutingActionInitialized != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (isRoutingActionInitialized) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setRoutingInitialized:]",  30LL,  "Setting routingInit for Wx %@ %s -> %s",  self->deviceAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL isRoutingActionInitialized = self->isRoutingActionInitialized;
        goto LABEL_4;
      }
    }

- (void)_setRoutingAction:(int)a3
{
  unsigned int routingAction = self->routingAction;
  if (routingAction != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        if (routingAction > 5) {
          v6 = "?";
        }
        else {
          v6 = off_100207BA8[routingAction];
        }
        else {
          id v7 = off_100207BA8[a3];
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setRoutingAction:]",  30LL,  "Setting RoutingAction for Wx %@ %s -> %s",  self->deviceAddress,  v6,  v7);
        goto LABEL_13;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        unsigned int routingAction = self->routingAction;
        goto LABEL_4;
      }
    }

- (void)_setRoutingUI:(int)a3
{
  unsigned int routingUI = self->routingUI;
  if (routingUI != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        if (routingUI > 5) {
          v6 = "?";
        }
        else {
          v6 = off_100207BA8[routingUI];
        }
        else {
          id v7 = off_100207BA8[a3];
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setRoutingUI:]",  30LL,  "Setting RoutingUI for Wx %@ %s -> %s",  self->deviceAddress,  v6,  v7);
        goto LABEL_13;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        unsigned int routingUI = self->routingUI;
        goto LABEL_4;
      }
    }

- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3
{
  if (self->tipiAndRoutedState != a3)
  {
    uint64_t v4 = *(void *)&a3;
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      deviceAddress = self->deviceAddress;
      uint64_t v6 = ((uint64_t (*)(void))CUPrintFlags32)();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = CUPrintFlags32(v4, &unk_1001A5D36);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingWxDevice _setTipiAndRoutedStateFlags:]",  30LL,  "Setting tipiAndRoutedState for Wx %@ %@ -> %@",  deviceAddress,  v7,  v9);
    }

    self->tipiAndRoutedState = v4;
  }

- (NSString)deviceAddress
{
  return self->deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (BOOL)firstBannerShown
{
  return self->firstBannerShown;
}

- (unint64_t)hijackBackoffTicks
{
  return self->hijackBackoffTicks;
}

- (BOOL)hasOwnership
{
  return self->hasOwnership;
}

- (BOOL)isRoutingActionInitialized
{
  return self->isRoutingActionInitialized;
}

- (BOOL)manuallyRouted
{
  return self->manuallyRouted;
}

- (BOOL)manualRouteChangeInProgress
{
  return self->manualRouteChangeInProgress;
}

- (unsigned)otherTipiAudioCategory
{
  return self->otherTipiAudioCategory;
}

- (NSString)otherTipiDeviceBTAddress
{
  return self->otherTipiDeviceBTAddress;
}

- (NSString)otherTipiDeviceBTName
{
  return self->otherTipiDeviceBTName;
}

- (BOOL)otherTipiDeviceIsWatch
{
  return self->otherTipiDeviceIsWatch;
}

- (void)setOtherTipiDeviceIsWatch:(BOOL)a3
{
  self->BOOL otherTipiDeviceIsWatch = a3;
}

- (BOOL)otherTipiDeviceIsStreamingAudio
{
  return self->otherTipiDeviceIsStreamingAudio;
}

- (int64_t)otherTipiDeviceMajorBuildVersion
{
  return self->otherTipiDeviceMajorBuildVersion;
}

- (int64_t)otherTipiDeviceMinorBuildVersion
{
  return self->otherTipiDeviceMinorBuildVersion;
}

- (NSString)otherTipiDevicePlayingApp
{
  return self->otherTipiDevicePlayingApp;
}

- (void)setOtherTipiDevicePlayingApp:(id)a3
{
}

- (NSNumber)otherTipiDeviceVersion
{
  return self->otherTipiDeviceVersion;
}

- (unint64_t)otherTipiManuallyRouteTicks
{
  return self->otherTipiManuallyRouteTicks;
}

- (BOOL)routed
{
  return self->routed;
}

- (int)routingAction
{
  return self->routingAction;
}

- (int)routingUI
{
  return self->routingUI;
}

- (unsigned)tipiAndRoutedState
{
  return self->tipiAndRoutedState;
}

- (id)audioRoutingResponse
{
  return self->_audioRoutingResponse;
}

- (void)setAudioRoutingResponse:(id)a3
{
}

- (BTAudioRoutingRequest)audioRoutingRequest
{
  return self->_audioRoutingRequest;
}

- (void)setAudioRoutingRequest:(id)a3
{
}

- (unsigned)audioRoutingClientID
{
  return self->_audioRoutingClientID;
}

- (void)setAudioRoutingClientID:(unsigned int)a3
{
  self->_audioRoutingClientID = a3;
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (void)setAudioRoutingScore:(int)a3
{
  self->_audioRoutingScore = a3;
}

- (BTAudioSession)audioSessionInProgress
{
  return self->_audioSessionInProgress;
}

- (void)setAudioSessionInProgress:(id)a3
{
}

- (id)audioSessionInProgressResponse
{
  return self->_audioSessionInProgressResponse;
}

- (void)setAudioSessionInProgressResponse:(id)a3
{
}

- (NSMutableDictionary)audioSessionMap
{
  return self->_audioSessionMap;
}

- (void)setAudioSessionMap:(id)a3
{
}

- (NSString)conduitDeviceID
{
  return self->_conduitDeviceID;
}

- (void)setConduitDeviceID:(id)a3
{
}

- (unint64_t)conduitMessageTicks
{
  return self->_conduitMessageTicks;
}

- (void)setConduitMessageTicks:(unint64_t)a3
{
  self->_conduitMessageTicks = a3;
}

- (OS_dispatch_source)conduitMessageTimer
{
  return self->_conduitMessageTimer;
}

- (void)setConduitMessageTimer:(id)a3
{
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
}

- (BOOL)hfpSetupFailureNotifyRegistered
{
  return self->_hfpSetupFailureNotifyRegistered;
}

- (void)setHfpSetupFailureNotifyRegistered:(BOOL)a3
{
  self->_hfpSetupFailureNotifyRegistered = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)ignoreManualConnect
{
  return self->_ignoreManualConnect;
}

- (void)setIgnoreManualConnect:(BOOL)a3
{
  self->_ignoreManualConnect = a3;
}

- (BOOL)inEar
{
  return self->_inEar;
}

- (void)setInEar:(BOOL)a3
{
  self->_inEar = a3;
}

- (BOOL)inEarDisabled
{
  return self->_inEarDisabled;
}

- (void)setInEarDisabled:(BOOL)a3
{
  self->_inEarDisabled = a3;
}

- (BOOL)isTipiHealingV2Eligible
{
  return self->_isTipiHealingV2Eligible;
}

- (void)setIsTipiHealingV2Eligible:(BOOL)a3
{
  self->_isTipiHealingV2Eligible = a3;
}

- (BOOL)lastPlay
{
  return self->_lastPlay;
}

- (void)setLastPlay:(BOOL)a3
{
  self->_lastPlay = a3;
}

- (double)lowestBudBatteryInfo
{
  return self->_lowestBudBatteryInfo;
}

- (void)setLowestBudBatteryInfo:(double)a3
{
  self->_lowestBudBatteryInfo = a3;
}

- (int)otherTipiDeviceAudioScore
{
  return self->_otherTipiDeviceAudioScore;
}

- (void)setOtherTipiDeviceAudioScore:(int)a3
{
  self->_otherTipiDeviceAudioScore = a3;
}

- (unint64_t)otherTipiDeviceIdleTick
{
  return self->_otherTipiDeviceIdleTick;
}

- (void)setOtherTipiDeviceIdleTick:(unint64_t)a3
{
  self->_otherTipiDeviceIdleTick = a3;
}

- (BOOL)otherTipiDeviceLastPlay
{
  return self->_otherTipiDeviceLastPlay;
}

- (void)setOtherTipiDeviceLastPlay:(BOOL)a3
{
  self->_otherTipiDeviceLastPlay = a3;
}

- (BOOL)ownershipMonitorRegistered
{
  return self->_ownershipMonitorRegistered;
}

- (void)setOwnershipMonitorRegistered:(BOOL)a3
{
  self->_ownershipMonitorRegistered = a3;
}

- (BOOL)proactiveRoutingBackoff
{
  return self->_proactiveRoutingBackoff;
}

- (void)setProactiveRoutingBackoff:(BOOL)a3
{
  self->_proactiveRoutingBackoff = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (BOOL)tipiHealingBackoff
{
  return self->_tipiHealingBackoff;
}

- (void)setTipiHealingBackoff:(BOOL)a3
{
  self->_tipiHealingBackoff = a3;
}

- (BOOL)tipitableUpdated
{
  return self->_tipitableUpdated;
}

- (void)setTipitableUpdated:(BOOL)a3
{
  self->_tipitableUpdated = a3;
}

- (void).cxx_destruct
{
}

@end