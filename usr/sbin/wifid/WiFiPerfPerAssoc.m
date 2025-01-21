@interface WiFiPerfPerAssoc
+ (id)sharedInstance;
- (BOOL)_networkSuitableForCollection:(__WiFiNetwork *)a3;
- (BOOL)activeUseBeingTracked;
- (BOOL)deviceIsAssociated;
- (BOOL)deviceUnderActiveUse;
- (BOOL)initialized;
- (NSMutableArray)sessionsWaitingForFinalization;
- (OS_dispatch_queue)symptomsReplyQueue;
- (OS_dispatch_queue)utilityConcurrent;
- (OS_dispatch_queue)wifiPPASerialQ;
- (WiFiPerfPerAssoc)init;
- (WiFiPerfPerAssocSession)currentSession;
- (id)getBSSIDForCurrentSession;
- (int)displayStateToken;
- (void)_beginPollingForInstantaenousScorecards;
- (void)_stopPollingForInstantaneousScorecards;
- (void)dealloc;
- (void)finalizeFirstSessionThatRequiresItWhenAppropriate;
- (void)finalizeSession:(id)a3;
- (void)setActiveUseBeingTracked:(BOOL)a3;
- (void)setCurrentSession:(id)a3;
- (void)setDeviceIsAssociated:(BOOL)a3;
- (void)setDeviceUnderActiveUse:(BOOL)a3;
- (void)setDisplayStateToken:(int)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setSessionsWaitingForFinalization:(id)a3;
- (void)setSymptomsReplyQueue:(id)a3;
- (void)setUtilityConcurrent:(id)a3;
- (void)setWifiPPASerialQ:(id)a3;
@end

@implementation WiFiPerfPerAssoc

+ (id)sharedInstance
{
  return 0LL;
}

- (WiFiPerfPerAssoc)init
{
}

- (id)getBSSIDForCurrentSession
{
  if (-[WiFiPerfPerAssoc currentSession](self, "currentSession")
    && -[WiFiPerfPerAssocSession connectedBSSID]( -[WiFiPerfPerAssoc currentSession](self, "currentSession"),  "connectedBSSID"))
  {
    return -[WiFiPerfPerAssocSession connectedBSSID]( -[WiFiPerfPerAssoc currentSession](self, "currentSession"),  "connectedBSSID");
  }

  else
  {
    return 0LL;
  }

- (void)finalizeFirstSessionThatRequiresItWhenAppropriate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013E2D8;
  block[3] = &unk_1001E2AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ"), block);
}

- (void)finalizeSession:(id)a3
{
  if ([a3 hasBeenFinalized])
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s Told to finalize a session that's already finalized: %@", "-[WiFiPerfPerAssoc finalizeSession:]", objc_msgSend(a3, "connectedBSSID") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    uint64_t v7 = 0LL;
    v8 = &v7;
    uint64_t v9 = 0x3052000000LL;
    v10 = sub_10013E554;
    v11 = sub_10013E564;
    id v12 = (id)0xAAAAAAAAAAAAAAAALL;
    id v12 = a3;
    [(id)v8[5] setHasBeenFinalized:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10013E570;
    v6[3] = &unk_1001E6900;
    v6[4] = a3;
    v6[5] = &v7;
    -[WiFiPerfPerAssoc _getHistoricalScorecardSession:andReply:]( self,  "_getHistoricalScorecardSession:andReply:",  a3,  v6);
    _Block_object_dispose(&v7, 8);
  }

- (void)_beginPollingForInstantaenousScorecards
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013E6E0;
  block[3] = &unk_1001E2AF0;
  block[4] = self;
  qword_100219FA8 = (uint64_t)dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_time_t v3 = dispatch_time(0LL, 300000000000LL);
  v4 = -[WiFiPerfPerAssoc wifiPPASerialQ](self, "wifiPPASerialQ");
  dispatch_after(v3, (dispatch_queue_t)v4, (dispatch_block_t)qword_100219FA8);
}

- (void)_stopPollingForInstantaneousScorecards
{
  v2 = (void *)qword_100219FA8;
  if (qword_100219FA8)
  {
    if (!dispatch_block_testcancel((dispatch_block_t)qword_100219FA8))
    {
      dispatch_block_cancel(v2);

      qword_100219FA8 = 0LL;
    }
  }

- (BOOL)_networkSuitableForCollection:(__WiFiNetwork *)a3
{
  if (sub_1000971F8(a3))
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: ignoring hidden network",  "-[WiFiPerfPerAssoc _networkSuitableForCollection:]");
    }
  }

  else if (sub_100096670((uint64_t)a3) == 1)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: ignoring home network",  "-[WiFiPerfPerAssoc _networkSuitableForCollection:]");
    }
  }

  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: ignoring work network",  "-[WiFiPerfPerAssoc _networkSuitableForCollection:]");
    }
  }

  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)dealloc
{
  displayStateToken = (dispatch_object_s *)self->_displayStateToken;
  if ((_DWORD)displayStateToken) {
    dispatch_release(displayStateToken);
  }
  currentSession = self->_currentSession;
  if (currentSession)
  {

    self->_currentSession = 0LL;
  }

  sessionsWaitingForFinalization = self->_sessionsWaitingForFinalization;
  if (sessionsWaitingForFinalization)
  {
    -[NSMutableArray removeAllObjects](sessionsWaitingForFinalization, "removeAllObjects");

    self->_sessionsWaitingForFinalization = 0LL;
  }

  wifiPPASerialQ = (dispatch_object_s *)self->_wifiPPASerialQ;
  if (wifiPPASerialQ)
  {
    dispatch_release(wifiPPASerialQ);
    self->_wifiPPASerialQ = 0LL;
  }

  symptomsReplyQueue = (dispatch_object_s *)self->_symptomsReplyQueue;
  if (symptomsReplyQueue)
  {
    dispatch_release(symptomsReplyQueue);
    self->_symptomsReplyQueue = 0LL;
  }

  utilityConcurrent = (dispatch_object_s *)self->_utilityConcurrent;
  if (utilityConcurrent)
  {
    dispatch_release(utilityConcurrent);
    self->_utilityConcurrent = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiPerfPerAssoc;
  -[WiFiPerfPerAssoc dealloc](&v9, "dealloc");
}

- (WiFiPerfPerAssocSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (NSMutableArray)sessionsWaitingForFinalization
{
  return self->_sessionsWaitingForFinalization;
}

- (void)setSessionsWaitingForFinalization:(id)a3
{
}

- (OS_dispatch_queue)wifiPPASerialQ
{
  return self->_wifiPPASerialQ;
}

- (void)setWifiPPASerialQ:(id)a3
{
}

- (OS_dispatch_queue)symptomsReplyQueue
{
  return self->_symptomsReplyQueue;
}

- (void)setSymptomsReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)utilityConcurrent
{
  return self->_utilityConcurrent;
}

- (void)setUtilityConcurrent:(id)a3
{
}

- (BOOL)deviceUnderActiveUse
{
  return self->_deviceUnderActiveUse;
}

- (void)setDeviceUnderActiveUse:(BOOL)a3
{
  self->_deviceUnderActiveUse = a3;
}

- (BOOL)activeUseBeingTracked
{
  return self->_activeUseBeingTracked;
}

- (void)setActiveUseBeingTracked:(BOOL)a3
{
  self->_activeUseBeingTracked = a3;
}

- (BOOL)deviceIsAssociated
{
  return self->_deviceIsAssociated;
}

- (void)setDeviceIsAssociated:(BOOL)a3
{
  self->_deviceIsAssociated = a3;
}

- (int)displayStateToken
{
  return self->_displayStateToken;
}

- (void)setDisplayStateToken:(int)a3
{
  self->_displayStateToken = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

@end