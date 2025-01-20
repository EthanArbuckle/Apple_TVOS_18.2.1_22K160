@interface SRDiscoveredDevice
- (BOOL)inUseBannerShown;
- (BOOL)isNearby;
- (BOOL)mutedSpeakerForRemotePhoneCall;
- (BOOL)nearbyPaired;
- (BOOL)nearbyiCloudSignIn;
- (BOOL)routeToWxAfterUnhide;
- (BOOL)userConnectedState;
- (NSData)nearbyLastRouteHost;
- (NSString)btAddress;
- (NSString)inUseBannerBackoffReason;
- (NSString)nearbyName;
- (SFDevice)nearbyWxDevice;
- (int)nearbyInEar;
- (int)nearbyPrevInEar;
- (int64_t)nearbyStreamState;
- (unint64_t)inUseBannerBackoffTick;
- (unsigned)connectionState;
- (unsigned)nearbyConnectedSourceCount;
- (unsigned)nearbyOutOfCaseTime;
- (unsigned)nearbyProductID;
- (void)_setBtAddress:(id)a3;
- (void)_setConnectionState:(unsigned __int8)a3;
- (void)_setInUseBannerBackoffReason:(id)a3;
- (void)_setInUseBannerBackoffTick:(unint64_t)a3;
- (void)_setInUseBannerShown:(BOOL)a3;
- (void)_setIsNearby:(BOOL)a3;
- (void)_setMutedSpeakerForRemotePhoneCall:(BOOL)a3;
- (void)_setNearbyConnectedSourceCount:(unsigned __int8)a3;
- (void)_setNearbyInEar:(int)a3;
- (void)_setNearbyLastRouteHost:(id)a3;
- (void)_setNearbyName:(id)a3;
- (void)_setNearbyOutOfCaseTime:(unsigned __int8)a3;
- (void)_setNearbyPaired:(BOOL)a3;
- (void)_setNearbyPrevInEar:(int)a3;
- (void)_setNearbyProductID:(unsigned int)a3;
- (void)_setNearbyStreamState:(int64_t)a3;
- (void)_setNearbyWxDevice:(id)a3;
- (void)_setNearbyiCloudSignIn:(BOOL)a3;
- (void)_setRouteToWxAfterUnhide:(BOOL)a3;
- (void)_setUserConnectedState:(BOOL)a3;
@end

@implementation SRDiscoveredDevice

- (void)_setBtAddress:(id)a3
{
  id v9 = a3;
  btAddress = self->_btAddress;
  p_btAddress = &self->_btAddress;
  unsigned __int8 v7 = -[NSString isEqualToString:](btAddress, "isEqualToString:", v9);
  v8 = v9;
  if ((v7 & 1) == 0)
  {
    if (dword_1002348A8 <= 30
      && (dword_1002348A8 != -1 || _LogCategory_Initialize(&dword_1002348A8, 30LL)))
    {
      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setBtAddress:]",  30LL,  "Setting btaddress %@ -> %@",  *p_btAddress,  v9);
    }

    objc_storeStrong((id *)p_btAddress, a3);
    v8 = v9;
  }
}

- (void)_setConnectionState:(unsigned __int8)a3
{
  unsigned int connectionState = self->_connectionState;
  if (connectionState != a3)
  {
    unsigned int v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        if (connectionState > 3) {
          v6 = "?";
        }
        else {
          v6 = (&off_100209028)[(char)connectionState];
        }
        if (v4 > 3) {
          unsigned __int8 v7 = "?";
        }
        else {
          unsigned __int8 v7 = (&off_100209028)[(char)v4];
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setConnectionState:]",  30LL,  "Setting connectionState %s -> %s",  v6,  v7);
        goto LABEL_13;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        unsigned int connectionState = self->_connectionState;
        goto LABEL_4;
      }
    }

- (void)_setIsNearby:(BOOL)a3
{
  BOOL isNearby = self->_isNearby;
  if (isNearby != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (isNearby) {
          unsigned __int8 v7 = "yes";
        }
        else {
          unsigned __int8 v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setIsNearby:]",  30LL,  "Setting isNearby %@ %s -> %s",  self->_btAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL isNearby = self->_isNearby;
        goto LABEL_4;
      }
    }

- (void)_setInUseBannerBackoffTick:(unint64_t)a3
{
  unint64_t inUseBannerBackoffTick = self->_inUseBannerBackoffTick;
  if (inUseBannerBackoffTick != a3)
  {
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 == -1)
      {
        unint64_t inUseBannerBackoffTick = self->_inUseBannerBackoffTick;
      }

      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setInUseBannerBackoffTick:]",  30LL,  "Setting inUseBannerBackoffTick %@ %u -> %u",  self->_btAddress,  inUseBannerBackoffTick,  a3);
    }

- (void)_setInUseBannerBackoffReason:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = -[NSString isEqualToString:](self->_inUseBannerBackoffReason, "isEqualToString:", v7);
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (dword_1002348A8 <= 30
      && (dword_1002348A8 != -1 || _LogCategory_Initialize(&dword_1002348A8, 30LL)))
    {
      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setInUseBannerBackoffReason:]",  30LL,  "Setting inUseBannerBackoff %@ %@ -> %@",  self->_btAddress,  self->_inUseBannerBackoffReason,  v7);
    }

    objc_storeStrong((id *)&self->_inUseBannerBackoffReason, a3);
    v6 = v7;
  }
}

- (void)_setInUseBannerShown:(BOOL)a3
{
  BOOL inUseBannerShown = self->_inUseBannerShown;
  if (inUseBannerShown != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (inUseBannerShown) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setInUseBannerShown:]",  30LL,  "Setting inUseBannerShown %@ %s -> %s",  self->_btAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL inUseBannerShown = self->_inUseBannerShown;
        goto LABEL_4;
      }
    }

- (void)_setMutedSpeakerForRemotePhoneCall:(BOOL)a3
{
  BOOL mutedSpeakerForRemotePhoneCall = self->_mutedSpeakerForRemotePhoneCall;
  if (mutedSpeakerForRemotePhoneCall != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (mutedSpeakerForRemotePhoneCall) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setMutedSpeakerForRemotePhoneCall:]",  30LL,  "Setting muted speaker for remote phone call %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL mutedSpeakerForRemotePhoneCall = self->_mutedSpeakerForRemotePhoneCall;
        goto LABEL_4;
      }
    }

- (void)_setNearbyiCloudSignIn:(BOOL)a3
{
  BOOL nearbyiCloudSignIn = self->_nearbyiCloudSignIn;
  if (nearbyiCloudSignIn != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (nearbyiCloudSignIn) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyiCloudSignIn:]",  30LL,  "Setting nearbyiCloudSignIn %@ %s -> %s",  self->_btAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL nearbyiCloudSignIn = self->_nearbyiCloudSignIn;
        goto LABEL_4;
      }
    }

- (void)_setNearbyInEar:(int)a3
{
  if (dword_1002348A8 <= 30 && (dword_1002348A8 != -1 || _LogCategory_Initialize(&dword_1002348A8, 30LL)))
  {
    uint64_t nearbyInEar = self->_nearbyInEar;
    else {
      v6 = (&off_100209048)[nearbyInEar];
    }
    else {
      id v7 = (&off_100209048)[a3];
    }
    LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyInEar:]",  30LL,  "Setting nearbyInEar %@ %s -> %s",  self->_btAddress,  v6,  v7);
  }

  self->_uint64_t nearbyInEar = a3;
}

- (void)_setNearbyLastRouteHost:(id)a3
{
  if (!a3 && !-[NSData isEqualToData:](self->_nearbyLastRouteHost, "isEqualToData:"))
  {
    if (dword_1002348A8 <= 30
      && (dword_1002348A8 != -1 || _LogCategory_Initialize(&dword_1002348A8, 30LL)))
    {
      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyLastRouteHost:]",  30LL,  "Setting nearbyLastRouteHost %@ %@ -> %@",  self->_btAddress,  self->_nearbyLastRouteHost,  0LL);
    }

    nearbyLastRouteHost = self->_nearbyLastRouteHost;
    self->_nearbyLastRouteHost = 0LL;
  }

- (void)_setNearbyName:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = -[NSString isEqualToString:](self->_nearbyName, "isEqualToString:", v7);
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (dword_1002348A8 <= 30
      && (dword_1002348A8 != -1 || _LogCategory_Initialize(&dword_1002348A8, 30LL)))
    {
      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyName:]",  30LL,  "Setting nearbyName %@ %@ -> %@",  self->_btAddress,  self->_nearbyName,  v7);
    }

    objc_storeStrong((id *)&self->_nearbyName, a3);
    v6 = v7;
  }
}

- (void)_setNearbyOutOfCaseTime:(unsigned __int8)a3
{
  unsigned int nearbyOutOfCaseTime = self->_nearbyOutOfCaseTime;
  if (nearbyOutOfCaseTime != a3)
  {
    uint64_t v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 == -1)
      {
        unsigned int nearbyOutOfCaseTime = self->_nearbyOutOfCaseTime;
      }

      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyOutOfCaseTime:]",  30LL,  "Setting outOfCaseTime %@ %d -> %d",  self->_btAddress,  nearbyOutOfCaseTime,  v4);
    }

- (void)_setNearbyPaired:(BOOL)a3
{
  BOOL nearbyPaired = self->_nearbyPaired;
  if (nearbyPaired != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (nearbyPaired) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyPaired:]",  30LL,  "Setting nearbyPaired %@ %s -> %s",  self->_btAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL nearbyPaired = self->_nearbyPaired;
        goto LABEL_4;
      }
    }

- (void)_setNearbyProductID:(unsigned int)a3
{
  uint64_t nearbyProductID = self->_nearbyProductID;
  if ((_DWORD)nearbyProductID != a3)
  {
    uint64_t v4 = *(void *)&a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 == -1)
      {
        uint64_t nearbyProductID = self->_nearbyProductID;
      }

      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyProductID:]",  30LL,  "Setting nearbyProductID %@ %u -> %u",  self->_btAddress,  nearbyProductID,  v4);
    }

- (void)_setNearbyPrevInEar:(int)a3
{
  if (dword_1002348A8 <= 30 && (dword_1002348A8 != -1 || _LogCategory_Initialize(&dword_1002348A8, 30LL)))
  {
    uint64_t nearbyPrevInEar = self->_nearbyPrevInEar;
    else {
      v6 = (&off_100209048)[nearbyPrevInEar];
    }
    else {
      id v7 = (&off_100209048)[a3];
    }
    LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyPrevInEar:]",  30LL,  "Setting nearbyPrevInEar %@ %s -> %s",  self->_btAddress,  v6,  v7);
  }

  self->_uint64_t nearbyPrevInEar = a3;
}

- (void)_setNearbyConnectedSourceCount:(unsigned __int8)a3
{
  unsigned int nearbyConnectedSourceCount = self->_nearbyConnectedSourceCount;
  if (nearbyConnectedSourceCount != a3)
  {
    uint64_t v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 == -1)
      {
        unsigned int nearbyConnectedSourceCount = self->_nearbyConnectedSourceCount;
      }

      LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyConnectedSourceCount:]",  30LL,  "Setting nearbyConnectedSourceCount %@ %d -> %d",  self->_btAddress,  nearbyConnectedSourceCount,  v4);
    }

- (void)_setNearbyStreamState:(int64_t)a3
{
  unint64_t nearbyStreamState = self->_nearbyStreamState;
  if (nearbyStreamState != a3)
  {
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        if (nearbyStreamState > 3) {
          v6 = "?";
        }
        else {
          v6 = (&off_100209088)[nearbyStreamState];
        }
        else {
          id v7 = (&off_100209088)[a3];
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setNearbyStreamState:]",  30LL,  "Setting nearbyStreamState %@ %s -> %s",  self->_btAddress,  v6,  v7);
        goto LABEL_13;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        unint64_t nearbyStreamState = self->_nearbyStreamState;
        goto LABEL_4;
      }
    }

- (void)_setNearbyWxDevice:(id)a3
{
  unsigned __int8 v5 = (SFDevice *)a3;
  nearbyWxDevice = self->_nearbyWxDevice;
  p_nearbyWxDevice = &self->_nearbyWxDevice;
  if (nearbyWxDevice != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_nearbyWxDevice, a3);
    unsigned __int8 v5 = v8;
  }
}

- (void)_setRouteToWxAfterUnhide:(BOOL)a3
{
  BOOL routeToWxAfterUnhide = self->_routeToWxAfterUnhide;
  if (routeToWxAfterUnhide != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (routeToWxAfterUnhide) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setRouteToWxAfterUnhide:]",  30LL,  "Setting routeToWxAfterUnhide %@ %s -> %s",  self->_btAddress,  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL routeToWxAfterUnhide = self->_routeToWxAfterUnhide;
        goto LABEL_4;
      }
    }

- (void)_setUserConnectedState:(BOOL)a3
{
  BOOL userConnectedState = self->_userConnectedState;
  if (userConnectedState != a3)
  {
    BOOL v4 = a3;
    if (dword_1002348A8 <= 30)
    {
      if (dword_1002348A8 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (userConnectedState) {
          id v7 = "yes";
        }
        else {
          id v7 = "no";
        }
        if (!v4) {
          v6 = "no";
        }
        LogPrintF( &dword_1002348A8,  "-[SRDiscoveredDevice _setUserConnectedState:]",  30LL,  "Setting userConnectedState %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1002348A8, 30LL))
      {
        BOOL userConnectedState = self->_userConnectedState;
        goto LABEL_4;
      }
    }

- (NSString)btAddress
{
  return self->_btAddress;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (unint64_t)inUseBannerBackoffTick
{
  return self->_inUseBannerBackoffTick;
}

- (NSString)inUseBannerBackoffReason
{
  return self->_inUseBannerBackoffReason;
}

- (BOOL)inUseBannerShown
{
  return self->_inUseBannerShown;
}

- (BOOL)mutedSpeakerForRemotePhoneCall
{
  return self->_mutedSpeakerForRemotePhoneCall;
}

- (BOOL)nearbyiCloudSignIn
{
  return self->_nearbyiCloudSignIn;
}

- (int)nearbyInEar
{
  return self->_nearbyInEar;
}

- (NSData)nearbyLastRouteHost
{
  return self->_nearbyLastRouteHost;
}

- (NSString)nearbyName
{
  return self->_nearbyName;
}

- (unsigned)nearbyOutOfCaseTime
{
  return self->_nearbyOutOfCaseTime;
}

- (int)nearbyPrevInEar
{
  return self->_nearbyPrevInEar;
}

- (BOOL)nearbyPaired
{
  return self->_nearbyPaired;
}

- (unsigned)nearbyProductID
{
  return self->_nearbyProductID;
}

- (unsigned)nearbyConnectedSourceCount
{
  return self->_nearbyConnectedSourceCount;
}

- (int64_t)nearbyStreamState
{
  return self->_nearbyStreamState;
}

- (SFDevice)nearbyWxDevice
{
  return self->_nearbyWxDevice;
}

- (BOOL)routeToWxAfterUnhide
{
  return self->_routeToWxAfterUnhide;
}

- (BOOL)userConnectedState
{
  return self->_userConnectedState;
}

- (void).cxx_destruct
{
}

@end