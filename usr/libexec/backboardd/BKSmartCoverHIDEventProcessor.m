@interface BKSmartCoverHIDEventProcessor
+ (BOOL)isSmartCoverSupported;
- (BKIOHIDServiceMatcher)magicKeyboardExtendedMatcher;
- (BKSmartCoverHIDEventProcessor)initWithContext:(id)a3;
- (BKSmartCoverHIDEventProcessor)initWithSupportedHES:(unint64_t)a3 disengagedHES:(unint64_t)a4 attached:(BOOL)a5 unknownState:(BOOL)a6;
- (BOOL)attachedCoverRequiresWorkaroundForOpenState;
- (BOOL)isAttached;
- (BOOL)isSmartCoverClosed;
- (BOOL)isUnknownState;
- (NSMutableSet)magicKeyboardExtendedServices;
- (OS_dispatch_queue)matcherQueue;
- (id)addSmartCoverObserver:(id)a3;
- (int)_smartCoverSensorsDidDisengage:(unint64_t)a3;
- (int)_smartCoverSensorsDidEngage:(unint64_t)a3;
- (int)_wakeAnimationStyle;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)state;
- (unint64_t)_currentMaskForUsage:(unsigned int)a3 HIDSystem:(id)a4 mask:(unint64_t *)a5 maskIfEngaged:(unint64_t *)a6;
- (unint64_t)disengagedSensors;
- (unint64_t)sensorsRequiredForAmbiguousState;
- (unint64_t)sensorsRequiredForOpenState;
- (unint64_t)supportedSensors;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setAttached:(BOOL)a3;
- (void)setAttachedCoverRequiresWorkaroundForOpenState:(BOOL)a3;
- (void)setDisengagedSensors:(unint64_t)a3;
- (void)setMagicKeyboardExtendedMatcher:(id)a3;
- (void)setMagicKeyboardExtendedServices:(id)a3;
- (void)setMatcherQueue:(id)a3;
- (void)setSensorsRequiredForAmbiguousState:(unint64_t)a3;
- (void)setSensorsRequiredForOpenState:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportedSensors:(unint64_t)a3;
- (void)setUnknownState:(BOOL)a3;
@end

@implementation BKSmartCoverHIDEventProcessor

- (BKSmartCoverHIDEventProcessor)initWithSupportedHES:(unint64_t)a3 disengagedHES:(unint64_t)a4 attached:(BOOL)a5 unknownState:(BOOL)a6
{
  v35.receiver = self;
  v35.super_class = [BKSmartCoverHIDEventProcessor class];
  BKSmartCoverHIDEventProcessor *v10 = [[BKSmartCoverHIDEventProcessor alloc] init];
  v11 = v10;
  if (v10)
  {
    v10->_unint64_t supportedSensors = a3;
    v10->_disengagedSensors = a4;
    v10->_attached = a5;
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.i32[0] == 1)
    {
      __int128 v13 = a3;
    }

    else
    {
      if (!(_DWORD)a3)
      {
        if (a6)
        {
          uint64_t v28 = 3LL;
LABEL_21:
          v10->_int64_t state = v28;
          goto LABEL_22;
        }

- (unint64_t)_currentMaskForUsage:(unsigned int)a3 HIDSystem:(id)a4 mask:(unint64_t *)a5 maskIfEngaged:(unint64_t *)a6
{
  uint64_t v8 = (uint64_t)a3;
  id v9 = a4;
  uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent(0LL, 0LL, 65289LL, v8, 0LL, 0LL);
  if (KeyboardEvent)
  {
    v11 = (const void *)KeyboardEvent;
    id v12 = [v9 systemEventOfType:3 matchingEvent:KeyboardEvent options:0];
    if (!v12)
    {
      unint64_t v14 = 0LL;
LABEL_23:
      CFRelease(v11);
      goto LABEL_24;
    }

    __int128 v13 = v12;
    switch((int)v8)
    {
      case 1:
        unint64_t v14 = 1LL;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 2:
        unint64_t v14 = 4LL;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 3:
        unint64_t v14 = 8LL;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 4:
        unint64_t v14 = 16LL;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      default:
        if ((_DWORD)v8 == 32)
        {
          unint64_t v14 = 32LL;
          if (!a5)
          {
LABEL_19:
            if (a6 && IOHIDEventGetIntegerValue(v12, 196610LL)) {
              *a6 |= v14;
            }
            CFRelease(v13);
            goto LABEL_23;
          }
        }

        else
        {
          unint64_t v14 = 0LL;
          if (!a5) {
            goto LABEL_19;
          }
        }

- (BKSmartCoverHIDEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 systemInterface];
  if (+[BKSmartCoverHIDEventProcessor isSmartCoverSupported]( &OBJC_CLASS___BKSmartCoverHIDEventProcessor,  "isSmartCoverSupported"))
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    [self _currentMaskForUsage:1LL HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    [self _currentMaskForUsage:2LL HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    [self _currentMaskForUsage:3 HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    [self _currentMaskForUsage:4 HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    uint64_t v16 = 0LL;
    [self _currentMaskForUsage:16LL HIDSystem:v5 mask:&v16 maskIfEngaged:0LL];
    BOOL v6 = v16 != 0;
    uint64_t v15 = 0LL;
    v15 = [self _currentMaskForUsage:32LL HIDSystem:v5 mask:0LL maskIfEngaged:&v15];
    BOOL v7 = v15 != 0;
    uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("BKHIDEventSmartCoverMatcherQueue", 0LL);
    matcherQueue = self->_matcherQueue;
    self->_matcherQueue = v8;

    v10 = [v4 serviceMatcherDataProvider];
    BKIOHIDServiceMatcher *v11 = [[BKIOHIDServiceMatcher alloc] initWithUsagePage:65280LL usage:11LL builtIn:0LL dataProvider:v10];
    magicKeyboardExtendedMatcher = self->_magicKeyboardExtendedMatcher;
    self->_magicKeyboardExtendedMatcher = v11;

    [self->_magicKeyboardExtendedMatcher startObserving:self queue:self->_matcherQueue];
    self =  [BKSmartCoverHIDEventProcessor initWithSupportedHES:v18 disengagedHES:v18 & ~v17 attached:v6 unknownState:v7];

    __int128 v13 = self;
  }

  else
  {
    __int128 v13 = 0LL;
  }

  return v13;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (!self->_magicKeyboardExtendedServices)
  {
    NSMutableSet *v7 = [[NSMutableSet alloc] init];
    magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
    self->_magicKeyboardExtendedServices = v7;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)[v14 propertyForKey:@"MKWakeAnimation"];
        NSString *v17 = [NSString class];
        id v18 = v15;
        v19 = v18;
        if (v17)
        {
          if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0) {
            v20 = v19;
          }
          else {
            v20 = 0LL;
          }
        }

        else
        {
          v20 = 0LL;
        }

        id v21 = v20;

        if (v21
          && [v21 isEqualToString:@"extended"]
          && (-[NSMutableSet containsObject:]( self->_magicKeyboardExtendedServices,  "containsObject:",  v14) & 1) == 0)
        {
          [v14 addDisappearanceObserver:self queue:self->_matcherQueue];
          [self->_magicKeyboardExtendedServices addObject:v14];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:v23 objects:v27 count:16];
    }

    while (v11);
  }
}

- (void)serviceDidDisappear:(id)a3
{
  magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
  if (magicKeyboardExtendedServices) {
    [magicKeyboardExtendedServices removeObject:a3];
  }
}

- (int)_wakeAnimationStyle
{
  magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
  if (magicKeyboardExtendedServices) {
    LODWORD(magicKeyboardExtendedServices) = [magicKeyboardExtendedServices count] != 0LL;
  }
  return (int)magicKeyboardExtendedServices;
}

- (void)setAttachedCoverRequiresWorkaroundForOpenState:(BOOL)a3
{
  if (self->_attachedCoverRequiresWorkaroundForOpenState != a3)
  {
    self->_attachedCoverRequiresWorkaroundForOpenState = a3;
    if (LODWORD(self->_supportedSensors))
    {
      unint64_t v4 = 4LL;
      if (a3) {
        unint64_t v5 = 1LL;
      }
      else {
        unint64_t v5 = 4LL;
      }
      if (!a3) {
        unint64_t v4 = 1LL;
      }
      self->_unint64_t sensorsRequiredForOpenState = v5;
      self->_sensorsRequiredForAmbiguousState = v4;
      id v6 = sub_10003F124();
      BOOL v7 = [v6 autorelease];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t sensorsRequiredForOpenState = self->_sensorsRequiredForOpenState;
        v9[0] = 67109120;
        v9[1] = sensorsRequiredForOpenState;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "HES required for open state is now:%x",  (uint8_t *)v9,  8u);
      }
    }
  }

- (int)_smartCoverSensorsDidEngage:(unint64_t)a3
{
  unint64_t supportedSensors = self->_supportedSensors;
  unint64_t disengagedSensors = self->_disengagedSensors;
  unint64_t v5 = disengagedSensors & ~a3;
  self->_unint64_t disengagedSensors = v5;
  if ((supportedSensors & v5) != 0) {
    return 0;
  }
  if (v5 == disengagedSensors && self->_state != 3) {
    return 0;
  }
  self->_int64_t state = 2LL;
  return 3;
}

- (int)_smartCoverSensorsDidDisengage:(unint64_t)a3
{
  int64_t state = self->_state;
  unint64_t disengagedSensors = self->_disengagedSensors;
  unint64_t sensorsRequiredForOpenState = self->_sensorsRequiredForOpenState;
  unint64_t v6 = disengagedSensors | a3;
  self->_unint64_t disengagedSensors = disengagedSensors | a3;
  if ((sensorsRequiredForOpenState & ~(disengagedSensors | a3)) != 0)
  {
    unint64_t sensorsRequiredForAmbiguousState = self->_sensorsRequiredForAmbiguousState;
    if (v6 != disengagedSensors
      && sensorsRequiredForAmbiguousState != 0
      && (sensorsRequiredForAmbiguousState & v6) == sensorsRequiredForAmbiguousState)
    {
      int v10 = 2;
      int64_t v9 = 3LL;
LABEL_20:
      self->_int64_t state = v9;
      return v10;
    }
  }

  else
  {
    BOOL v8 = v6 == disengagedSensors || state != 2;
    int64_t v9 = 1LL;
    int v10 = 1;
    if (state == 3 || !v8) {
      goto LABEL_20;
    }
  }

  return 0;
}

- (BOOL)isSmartCoverClosed
{
  return self->_supportedSensors && self->_state == 2;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = *a3;
  if (IOHIDEventGetIntegerValue(v10, 196608LL) == 65289)
  {
    if (-[BKSmartCoverHIDEventProcessor sensorsRequiredForOpenState](self, "sensorsRequiredForOpenState"))
    {
      int IntegerValue = IOHIDEventGetIntegerValue(v10, 196609LL);
      uint64_t v12 = IOHIDEventGetIntegerValue(v10, 196610LL);
      unsigned int v13 = IntegerValue | 0xFF090000;
      if ((IntegerValue | 0xFF090000) + 16187391 < 4)
      {
        switch(IntegerValue)
        {
          case 1:
            uint64_t v14 = 1LL;
            break;
          case 2:
            uint64_t v14 = 4LL;
            break;
          case 3:
            uint64_t v14 = 8LL;
            break;
          case 4:
            uint64_t v14 = 16LL;
            break;
          default:
            if (IntegerValue == 32) {
              uint64_t v14 = 32LL;
            }
            else {
              uint64_t v14 = 0LL;
            }
            break;
        }

        if ((-[BKSmartCoverHIDEventProcessor supportedSensors](self, "supportedSensors") & v14) != 0)
        {
          if (v12) {
            [self _smartCoverSensorsDidEngage:v14];
          }
          else {
            uint64_t v32 = [self _smartCoverSensorsDidDisengage:v14];
          }
          uint64_t v25 = v32;
          if ((_DWORD)v32)
          {
            [v10 setSmartCoverInfo:v32 wakeAnimationStyle:[BKSmartCoverHIDEventProcessor _wakeAnimationStyle]];
            char v33 = 0;
            goto LABEL_37;
          }
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        char v33 = 1;
LABEL_37:
        id v34 = sub_10003F124();
        os_log_s *v35 = v34;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v50 = v12 != 0;
          v36 = sub_100055DA0(self->_disengagedSensors);
          v51 = v36;
          __int16 v37 = sub_100055DA0(self->_supportedSensors);
          v53 = v37;
          v38 = sub_100055DA0(self->_sensorsRequiredForOpenState);
          v52 = v38;
          __int16 v39 = sub_100055DA0(self->_sensorsRequiredForAmbiguousState);
          id v40 = [v39 autorelease];
          if ((v33 & 1) != 0)
          {
            __int16 v41 = @"<none>";
          }

          else
          {
            uint64_t v42 = NSStringFromBKSHIDEventSmartCoverState(v25);
            __int16 v41 = (__CFString *)[v42 autorelease];
          }

          *(_DWORD *)id buf = 67110658;
          BOOL v60 = IntegerValue;
          __int16 v61 = 1024;
          BOOL v62 = v50;
          __int16 v63 = 2114;
          v64 = v51;
          __int16 v65 = 2114;
          v66 = v53;
          __int16 v67 = 2114;
          v68 = v52;
          __int16 v69 = 2114;
          id v70 = v40;
          __int16 v71 = 2114;
          v72 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "SmartCover event usage:%X engage:%{BOOL}u -> disengaged:%{public}@ all:%{public}@ trig:%{public}@ maybe:%{pu blic}@ -> change:%{public}@",  buf,  0x40u);
          if ((v33 & 1) == 0) {
        }
          }

        if (v10)
        {
LABEL_45:
          uint64_t TimeStamp = IOHIDEventGetTimeStamp(v10);
          uint64_t v28 = IOHIDEventGetIntegerValue(v10, 196608LL);
          uint64_t v26 = IOHIDEventGetIntegerValue(v10, 196609LL);
          uint64_t v29 = IOHIDEventGetIntegerValue(v10, 196610LL);
          goto LABEL_46;
        }

- (id)addSmartCoverObserver:(id)a3
{
  id v5 = a3;
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    BOOL v7 = [BSCompoundAssertion assertionWithIdentifier:@"backboardd.smart-cover-observer"];
    id v8 = self->_observerAssertion;
    self->_observerAssertion = v7;

    observerAssertion = self->_observerAssertion;
  }

  id v9 = [v5 description];
  int v10 = [v9];
  BSCompoundAssertion *v11 = [BSCompoundAssertion acquireForReason:v10 withContext:v5];

  return v11;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100055C3C;
  v12[3] = &unk_1000B7E88;
  v12[4] = self;
  id v4 = a3;
  [v4 appendCustomFormatWithName:@"disengagedSensors" block:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100055C50;
  v11[3] = &unk_1000B7E88;
  v11[4] = self;
  [v4 appendCustomFormatWithName:@"supportedSensors" block:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100055C64;
  v10[3] = &unk_1000B7E88;
  v10[4] = self;
  [v4 appendCustomFormatWithName:@"sensorsRequiredForOpenState" block:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_100055C78;
  v9[3] = &unk_1000B7E88;
  v9[4] = self;
  [v4 appendCustomFormatWithName:@"sensorsRequiredForAmbiguousState" block:v9];
  id v5 = [v4 appendBool:self->_attached withName:@"a"];
  id v6 = [v4 appendBool:self->_unknownState withName:@"u"];
  unint64_t state = self->_state;
  if (state >= 4) {
    id v8 = [NSString stringWithFormat:@"<invalid:%d>"];
  }
  else {
    id v8 = off_1000B76F8[state];
  }
  [v4 appendString:v8 withName:@"state"];
}

- (BOOL)attachedCoverRequiresWorkaroundForOpenState
{
  return self->_attachedCoverRequiresWorkaroundForOpenState;
}

- (BKIOHIDServiceMatcher)magicKeyboardExtendedMatcher
{
  return self->_magicKeyboardExtendedMatcher;
}

- (void)setMagicKeyboardExtendedMatcher:(id)a3
{
}

- (NSMutableSet)magicKeyboardExtendedServices
{
  return self->_magicKeyboardExtendedServices;
}

- (void)setMagicKeyboardExtendedServices:(id)a3
{
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMatcherQueue:(id)a3
{
}

- (unint64_t)supportedSensors
{
  return self->_supportedSensors;
}

- (void)setSupportedSensors:(unint64_t)a3
{
  self->_unint64_t supportedSensors = a3;
}

- (unint64_t)disengagedSensors
{
  return self->_disengagedSensors;
}

- (void)setDisengagedSensors:(unint64_t)a3
{
  self->_unint64_t disengagedSensors = a3;
}

- (unint64_t)sensorsRequiredForOpenState
{
  return self->_sensorsRequiredForOpenState;
}

- (void)setSensorsRequiredForOpenState:(unint64_t)a3
{
  self->_unint64_t sensorsRequiredForOpenState = a3;
}

- (unint64_t)sensorsRequiredForAmbiguousState
{
  return self->_sensorsRequiredForAmbiguousState;
}

- (void)setSensorsRequiredForAmbiguousState:(unint64_t)a3
{
  self->_unint64_t sensorsRequiredForAmbiguousState = a3;
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)isUnknownState
{
  return self->_unknownState;
}

- (void)setUnknownState:(BOOL)a3
{
  self->_unknownState = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)isSmartCoverSupported
{
  if (qword_1000DC1F0 != -1) {
    dispatch_once(&qword_1000DC1F0, &stru_1000B76B0);
  }
  return byte_1000DC1E8;
}

@end