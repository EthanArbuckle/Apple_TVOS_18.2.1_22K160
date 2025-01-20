@interface BTSmartRoutingSourceDevice
- (BOOL)TUIncomingCallAnswered;
- (BOOL)audioRouteDeviceRegistered;
- (BOOL)builtInMicRegistered;
- (BOOL)builtInSpeakerRegistered;
- (BOOL)hijackedByPhoneCall;
- (BOOL)incomingCallRingtone;
- (BOOL)magnetConnected;
- (BOOL)routeChangeToSpeakerInProgress;
- (BOOL)shouldStayOnVirtual;
- (NSMutableDictionary)TUCallMap;
- (NSMutableDictionary)audioSessionkMap;
- (NSMutableDictionary)evalWxMap;
- (NSMutableDictionary)isFirstConnectionAfterSREnable;
- (NSMutableSet)hijackBlockingClientSet;
- (NSSet)conferencingCallSets;
- (NSString)activePlayingApp;
- (NSString)audioDestination;
- (NSString)evalPreemptiveBannerResult;
- (NSString)evalResult;
- (NSString)routeToSpeakerReason;
- (NSString)routingRequestWx;
- (int)audioRoute;
- (int)callIncomingConnected;
- (int)callIncomingUnconnected;
- (int64_t)bluetoothState;
- (unint64_t)callStartTicks;
- (unint64_t)evalTicks;
- (unint64_t)hfpSetupFailTicks;
- (unint64_t)manualRouteSpeakerTicks;
- (unint64_t)predictiveRouteTicks;
- (unsigned)audioRouteDevice;
- (unsigned)builtInMicAudioDeviceID;
- (unsigned)builtInSpeakerAudioDeviceID;
- (void)_setBuiltInMicAudioDeviceID:(unsigned int)a3;
- (void)_setBuiltInSpeakerAudioDeviceID:(unsigned int)a3;
- (void)_setHijackedByPhoneCall:(BOOL)a3;
- (void)_setIncomingCallRingtoneState:(BOOL)a3;
- (void)_setShouldStayOnVirtual:(BOOL)a3;
- (void)_setSpeakerRouteChangeInProgress:(BOOL)a3;
- (void)_setTUIncomingCallState:(BOOL)a3;
- (void)_updateHijackBlockingClientWithBundleID:(id)a3 mode:(BOOL)a4;
- (void)setActivePlayingApp:(id)a3;
- (void)setAudioDestination:(id)a3;
- (void)setAudioRoute:(int)a3;
- (void)setAudioRouteDevice:(unsigned int)a3;
- (void)setAudioRouteDeviceRegistered:(BOOL)a3;
- (void)setAudioSessionkMap:(id)a3;
- (void)setBluetoothState:(int64_t)a3;
- (void)setBuiltInMicAudioDeviceID:(unsigned int)a3;
- (void)setBuiltInMicRegistered:(BOOL)a3;
- (void)setBuiltInSpeakerAudioDeviceID:(unsigned int)a3;
- (void)setBuiltInSpeakerRegistered:(BOOL)a3;
- (void)setCallIncomingConnected:(int)a3;
- (void)setCallIncomingUnconnected:(int)a3;
- (void)setCallStartTicks:(unint64_t)a3;
- (void)setConferencingCallSets:(id)a3;
- (void)setEvalPreemptiveBannerResult:(id)a3;
- (void)setEvalResult:(id)a3;
- (void)setEvalTicks:(unint64_t)a3;
- (void)setEvalWxMap:(id)a3;
- (void)setHfpSetupFailTicks:(unint64_t)a3;
- (void)setHijackBlockingClientSet:(id)a3;
- (void)setIsFirstConnectionAfterSREnable:(id)a3;
- (void)setMagnetConnected:(BOOL)a3;
- (void)setManualRouteSpeakerTicks:(unint64_t)a3;
- (void)setPredictiveRouteTicks:(unint64_t)a3;
- (void)setRouteChangeToSpeakerInProgress:(BOOL)a3;
- (void)setRouteToSpeakerReason:(id)a3;
- (void)setRoutingRequestWx:(id)a3;
- (void)setTUCallMap:(id)a3;
@end

@implementation BTSmartRoutingSourceDevice

- (void)_setBuiltInMicAudioDeviceID:(unsigned int)a3
{
  unsigned int builtInMicAudioDeviceID = self->builtInMicAudioDeviceID;
  if (builtInMicAudioDeviceID != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        unsigned int builtInMicAudioDeviceID = self->builtInMicAudioDeviceID;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setBuiltInMicAudioDeviceID:]",  30LL,  "Setting builtInMic audio device ID %u -> %u",  builtInMicAudioDeviceID,  a3);
    }

- (void)_setBuiltInSpeakerAudioDeviceID:(unsigned int)a3
{
  unsigned int builtInSpeakerAudioDeviceID = self->builtInSpeakerAudioDeviceID;
  if (builtInSpeakerAudioDeviceID != a3)
  {
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 == -1)
      {
        unsigned int builtInSpeakerAudioDeviceID = self->builtInSpeakerAudioDeviceID;
      }

      LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setBuiltInSpeakerAudioDeviceID:]",  30LL,  "Setting builtInSpeaker audio device ID %u -> %u",  builtInSpeakerAudioDeviceID,  a3);
    }

- (void)_updateHijackBlockingClientWithBundleID:(id)a3 mode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  hijackBlockingClientSet = self->hijackBlockingClientSet;
  id v12 = v6;
  if (v4)
  {
    if (!hijackBlockingClientSet)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v9 = self->hijackBlockingClientSet;
      self->hijackBlockingClientSet = v8;

      id v6 = v12;
      hijackBlockingClientSet = self->hijackBlockingClientSet;
    }

    -[NSMutableSet addObject:](hijackBlockingClientSet, "addObject:", v6);
  }

  else
  {
    -[NSMutableSet removeObject:](hijackBlockingClientSet, "removeObject:", v6);
    if (!-[NSMutableSet count](self->hijackBlockingClientSet, "count"))
    {
      v10 = self->hijackBlockingClientSet;
      self->hijackBlockingClientSet = 0LL;
    }
  }

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    v11 = @"Removed";
    if (v4) {
      v11 = @"Added";
    }
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _updateHijackBlockingClientWithBundleID:mode:]",  30LL,  "%@ Hijackblocking client %@ clients %@",  v11,  v12,  self->hijackBlockingClientSet);
  }
}

- (void)_setHijackedByPhoneCall:(BOOL)a3
{
  BOOL hijackedByPhoneCall = self->hijackedByPhoneCall;
  if (hijackedByPhoneCall != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        id v6 = "yes";
        if (hijackedByPhoneCall) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          id v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setHijackedByPhoneCall:]",  30LL,  "Setting hijacked by phone %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL hijackedByPhoneCall = self->hijackedByPhoneCall;
        goto LABEL_4;
      }
    }

- (void)_setIncomingCallRingtoneState:(BOOL)a3
{
  BOOL incomingCallRingtone = self->incomingCallRingtone;
  if (incomingCallRingtone != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        id v6 = "yes";
        if (incomingCallRingtone) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          id v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setIncomingCallRingtoneState:]",  30LL,  "Setting incoming call ringtone state %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL incomingCallRingtone = self->incomingCallRingtone;
        goto LABEL_4;
      }
    }

- (void)_setSpeakerRouteChangeInProgress:(BOOL)a3
{
  BOOL routeChangeToSpeakerInProgress = self->routeChangeToSpeakerInProgress;
  if (routeChangeToSpeakerInProgress != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        id v6 = "yes";
        if (routeChangeToSpeakerInProgress) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          id v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setSpeakerRouteChangeInProgress:]",  30LL,  "Setting speaker route change %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL routeChangeToSpeakerInProgress = self->routeChangeToSpeakerInProgress;
        goto LABEL_4;
      }
    }

- (void)_setTUIncomingCallState:(BOOL)a3
{
  BOOL TUIncomingCallAnswered = self->TUIncomingCallAnswered;
  if (TUIncomingCallAnswered != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        id v6 = "yes";
        if (TUIncomingCallAnswered) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          id v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setTUIncomingCallState:]",  30LL,  "Setting TUIncomingCallAnswered %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL TUIncomingCallAnswered = self->TUIncomingCallAnswered;
        goto LABEL_4;
      }
    }

- (void)_setShouldStayOnVirtual:(BOOL)a3
{
  BOOL shouldStayOnVirtual = self->shouldStayOnVirtual;
  if (shouldStayOnVirtual != a3)
  {
    BOOL v4 = a3;
    if (dword_100234408 <= 30)
    {
      if (dword_100234408 != -1)
      {
LABEL_4:
        id v6 = "yes";
        if (shouldStayOnVirtual) {
          v7 = "yes";
        }
        else {
          v7 = "no";
        }
        if (!v4) {
          id v6 = "no";
        }
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingSourceDevice _setShouldStayOnVirtual:]",  30LL,  "Setting shouldStayOnVirtual %s -> %s",  v7,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_100234408, 30LL))
      {
        BOOL shouldStayOnVirtual = self->shouldStayOnVirtual;
        goto LABEL_4;
      }
    }

- (unsigned)builtInMicAudioDeviceID
{
  return self->builtInMicAudioDeviceID;
}

- (void)setBuiltInMicAudioDeviceID:(unsigned int)a3
{
  self->unsigned int builtInMicAudioDeviceID = a3;
}

- (unsigned)builtInSpeakerAudioDeviceID
{
  return self->builtInSpeakerAudioDeviceID;
}

- (void)setBuiltInSpeakerAudioDeviceID:(unsigned int)a3
{
  self->unsigned int builtInSpeakerAudioDeviceID = a3;
}

- (NSMutableSet)hijackBlockingClientSet
{
  return self->hijackBlockingClientSet;
}

- (void)setHijackBlockingClientSet:(id)a3
{
}

- (BOOL)hijackedByPhoneCall
{
  return self->hijackedByPhoneCall;
}

- (BOOL)incomingCallRingtone
{
  return self->incomingCallRingtone;
}

- (BOOL)routeChangeToSpeakerInProgress
{
  return self->routeChangeToSpeakerInProgress;
}

- (void)setRouteChangeToSpeakerInProgress:(BOOL)a3
{
  self->BOOL routeChangeToSpeakerInProgress = a3;
}

- (BOOL)TUIncomingCallAnswered
{
  return self->TUIncomingCallAnswered;
}

- (BOOL)shouldStayOnVirtual
{
  return self->shouldStayOnVirtual;
}

- (NSString)activePlayingApp
{
  return self->_activePlayingApp;
}

- (void)setActivePlayingApp:(id)a3
{
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (void)setAudioDestination:(id)a3
{
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (void)setAudioRoute:(int)a3
{
  self->_audioRoute = a3;
}

- (unsigned)audioRouteDevice
{
  return self->_audioRouteDevice;
}

- (void)setAudioRouteDevice:(unsigned int)a3
{
  self->_audioRouteDevice = a3;
}

- (BOOL)audioRouteDeviceRegistered
{
  return self->_audioRouteDeviceRegistered;
}

- (void)setAudioRouteDeviceRegistered:(BOOL)a3
{
  self->_audioRouteDeviceRegistered = a3;
}

- (NSMutableDictionary)audioSessionkMap
{
  return self->_audioSessionkMap;
}

- (void)setAudioSessionkMap:(id)a3
{
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (BOOL)builtInMicRegistered
{
  return self->_builtInMicRegistered;
}

- (void)setBuiltInMicRegistered:(BOOL)a3
{
  self->_builtInMicRegistered = a3;
}

- (BOOL)builtInSpeakerRegistered
{
  return self->_builtInSpeakerRegistered;
}

- (void)setBuiltInSpeakerRegistered:(BOOL)a3
{
  self->_builtInSpeakerRegistered = a3;
}

- (int)callIncomingConnected
{
  return self->_callIncomingConnected;
}

- (void)setCallIncomingConnected:(int)a3
{
  self->_callIncomingConnected = a3;
}

- (int)callIncomingUnconnected
{
  return self->_callIncomingUnconnected;
}

- (void)setCallIncomingUnconnected:(int)a3
{
  self->_callIncomingUnconnected = a3;
}

- (unint64_t)callStartTicks
{
  return self->_callStartTicks;
}

- (void)setCallStartTicks:(unint64_t)a3
{
  self->_callStartTicks = a3;
}

- (NSSet)conferencingCallSets
{
  return self->_conferencingCallSets;
}

- (void)setConferencingCallSets:(id)a3
{
}

- (NSString)evalPreemptiveBannerResult
{
  return self->_evalPreemptiveBannerResult;
}

- (void)setEvalPreemptiveBannerResult:(id)a3
{
}

- (NSMutableDictionary)evalWxMap
{
  return self->_evalWxMap;
}

- (void)setEvalWxMap:(id)a3
{
}

- (NSString)evalResult
{
  return self->_evalResult;
}

- (void)setEvalResult:(id)a3
{
}

- (unint64_t)evalTicks
{
  return self->_evalTicks;
}

- (void)setEvalTicks:(unint64_t)a3
{
  self->_evalTicks = a3;
}

- (unint64_t)hfpSetupFailTicks
{
  return self->_hfpSetupFailTicks;
}

- (void)setHfpSetupFailTicks:(unint64_t)a3
{
  self->_hfpSetupFailTicks = a3;
}

- (BOOL)magnetConnected
{
  return self->_magnetConnected;
}

- (void)setMagnetConnected:(BOOL)a3
{
  self->_magnetConnected = a3;
}

- (unint64_t)manualRouteSpeakerTicks
{
  return self->_manualRouteSpeakerTicks;
}

- (void)setManualRouteSpeakerTicks:(unint64_t)a3
{
  self->_manualRouteSpeakerTicks = a3;
}

- (NSMutableDictionary)isFirstConnectionAfterSREnable
{
  return self->_isFirstConnectionAfterSREnable;
}

- (void)setIsFirstConnectionAfterSREnable:(id)a3
{
}

- (unint64_t)predictiveRouteTicks
{
  return self->_predictiveRouteTicks;
}

- (void)setPredictiveRouteTicks:(unint64_t)a3
{
  self->_predictiveRouteTicks = a3;
}

- (NSString)routeToSpeakerReason
{
  return self->_routeToSpeakerReason;
}

- (void)setRouteToSpeakerReason:(id)a3
{
}

- (NSString)routingRequestWx
{
  return self->_routingRequestWx;
}

- (void)setRoutingRequestWx:(id)a3
{
}

- (NSMutableDictionary)TUCallMap
{
  return self->_TUCallMap;
}

- (void)setTUCallMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end