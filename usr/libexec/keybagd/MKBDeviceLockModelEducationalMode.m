@interface MKBDeviceLockModelEducationalMode
+ (id)sharedLockModelWithUID:(unsigned int)a3;
- (BOOL)isPermanentlyBlocked;
- (BOOL)isTemporarilyBlocked;
- (BOOL)isWipePending;
- (MKBDeviceLockModelEducationalMode)initWithJournalPath:(id)a3 uid:(unsigned int)a4;
- (MKBDeviceLockModelEducationalMode)initWithUID:(unsigned int)a3;
- (double)timeUntilUnblockedSinceReferenceDate;
- (id)_lockStateValueForKey:(id)a3 ofType:(Class)a4;
- (unint64_t)failedPasscodeAttempts;
- (void)_loadLockState;
- (void)_persistentStateQueue_beginSpeculativeFailureCharge;
- (void)_persistentStateQueue_cancelSpeculativeFailureCharge;
- (void)_persistentStateQueue_loadLockState;
- (void)_persistentStateQueue_rollbackSpeculativeFailureCharge;
- (void)_persistentStateQueue_unlockFailed;
- (void)_persistentStateQueue_unlockSucceeded;
- (void)_setLockStateValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)notePasscodeEntryBegan;
- (void)notePasscodeEntryCancelled;
- (void)notePasscodeUnlockFailed;
- (void)notePasscodeUnlockSucceeded;
@end

@implementation MKBDeviceLockModelEducationalMode

+ (id)sharedLockModelWithUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1000292C8 != -1) {
    dispatch_once(&qword_1000292C8, &stru_100020B70);
  }
  v4 = (void *)qword_1000292C0;
  objc_sync_enter((id)qword_1000292C0);
  if (!objc_msgSend( (id)qword_1000292C0,  "objectForKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3)))
  {
    v5 = -[MKBDeviceLockModelEducationalMode initWithUID:]( objc_alloc(&OBJC_CLASS___MKBDeviceLockModelEducationalMode),  "initWithUID:",  v3);
    objc_msgSend( (id)qword_1000292C0,  "setObject:forKeyedSubscript:",  v5,  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  }

  id v6 = objc_msgSend( (id)qword_1000292C0,  "objectForKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_sync_exit(v4);
  return v6;
}

- (MKBDeviceLockModelEducationalMode)initWithUID:(unsigned int)a3
{
  return -[MKBDeviceLockModelEducationalMode initWithJournalPath:uid:]( self,  "initWithJournalPath:uid:",  @"/private/var/keybags/LockoutState.plist",  *(void *)&a3);
}

- (MKBDeviceLockModelEducationalMode)initWithJournalPath:(id)a3 uid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MKBDeviceLockModelEducationalMode;
  id v6 = -[MKBDeviceLockModelEducationalMode init](&v8, "init");
  if (v6)
  {
    v6->_lockStatePath = (NSString *)[a3 copy];
    v6->_uid = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%d", v4);
    v6->_persistentStateQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.mobilekeybag.devicelockmodel",  0LL);
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState](v6, "_persistentStateQueue_loadLockState");
  }

  return v6;
}

- (void)dealloc
{
  persistentStateQueue = self->_persistentStateQueue;
  if (persistentStateQueue) {
    dispatch_release((dispatch_object_t)persistentStateQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MKBDeviceLockModelEducationalMode;
  -[MKBDeviceLockModelEducationalMode dealloc](&v4, "dealloc");
}

- (void)notePasscodeEntryBegan
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BECC;
  block[3] = &unk_100020B98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, block);
}

- (void)notePasscodeEntryCancelled
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BF2C;
  block[3] = &unk_100020B98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, block);
}

- (void)notePasscodeUnlockSucceeded
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BF8C;
  block[3] = &unk_100020B98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, block);
}

- (void)notePasscodeUnlockFailed
{
  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BFEC;
  block[3] = &unk_100020B98;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, block);
}

- (BOOL)isPermanentlyBlocked
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C088;
  v5[3] = &unk_100020BC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTemporarilyBlocked
{
  double v4 = v3;
  -[MKBDeviceLockModelEducationalMode timeUntilUnblockedSinceReferenceDate]( self,  "timeUntilUnblockedSinceReferenceDate");
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  uint64_t v6 = 0LL;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C16C;
  v5[3] = &unk_100020BC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWipePending
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C210;
  v5[3] = &unk_100020BC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)failedPasscodeAttempts
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C2B0;
  v5[3] = &unk_100020BC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)persistentStateQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_persistentStateQueue_beginSpeculativeFailureCharge
{
  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    self->_speculativePasscodeFailureChargeOutstanding = 1;
    unint64_t failedPasscodeAttempts = self->_failedPasscodeAttempts;
    unint64_t v4 = failedPasscodeAttempts + 1;
    self->_unint64_t failedPasscodeAttempts = failedPasscodeAttempts + 1;
    unint64_t v5 = failedPasscodeAttempts - 9;
    if (failedPasscodeAttempts - 9 >= 0xFFFFFFFFFFFFFFFCLL)
    {
      int v6 = 0;
      double v7 = 60.0;
      switch(failedPasscodeAttempts)
      {
        case 5uLL:
          break;
        case 6uLL:
          int v6 = 0;
          double v7 = 300.0;
          break;
        case 7uLL:
          int v6 = 0;
          double v7 = 900.0;
          break;
        case 8uLL:
          int v6 = 0;
          double v7 = 3600.0;
          break;
        default:
          double v7 = -1.0;
          int v6 = 1;
          break;
      }
    }

    else
    {
      int v6 = 0;
      double v7 = 0.0;
    }

    if (self->_originalDefaultsForRollback) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"MKBDeviceLockModelEducationalMode.m",  188LL,  @"We should not have rollback values when beginning a speculative failure charge, but we had %@",  self->_originalDefaultsForRollback);
    }
    v13[0] = @"MKBDeviceLockPendingWipe";
    v14[0] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_pendingWipe);
    v13[1] = @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate";
    v14[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_unblockTime);
    v13[2] = @"MKBDeviceLockBlocked";
    v14[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_permanentlyBlocked);
    v13[3] = @"MKBDeviceLockFailedAttempts";
    v14[3] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_failedPasscodeAttempts);
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL);
    self->_originalDefaultsForRollback = v8;
    char v9 = v8;
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_failedPasscodeAttempts),  @"MKBDeviceLockFailedAttempts");
    if (v5 >= 0xFFFFFFFFFFFFFFFCLL)
    {
      if (v6)
      {
        -[NSDate timeIntervalSinceReferenceDate]( +[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"),  "timeIntervalSinceReferenceDate");
        -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate");
        v10 = (NSNumber *)&__kCFBooleanTrue;
        v11 = @"MKBDeviceLockBlocked";
      }

      else
      {
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7 + v12);
        v11 = @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate";
      }

      -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", v10, v11);
    }

    if (v4 >= 0xA) {
      -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  &__kCFBooleanTrue,  @"MKBDeviceLockPendingWipe");
    }
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState]( self,  "_persistentStateQueue_loadLockState");
  }

- (void)_persistentStateQueue_cancelSpeculativeFailureCharge
{
  self->_speculativePasscodeFailureChargeOutstanding = 0;

  self->_originalDefaultsForRollback = 0LL;
}

- (void)_persistentStateQueue_rollbackSpeculativeFailureCharge
{
  if (self->_speculativePasscodeFailureChargeOutstanding)
  {
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  -[NSDictionary objectForKeyedSubscript:]( self->_originalDefaultsForRollback,  "objectForKeyedSubscript:",  @"MKBDeviceLockPendingWipe"),  @"MKBDeviceLockPendingWipe");
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  -[NSDictionary objectForKeyedSubscript:]( self->_originalDefaultsForRollback,  "objectForKeyedSubscript:",  @"MKBDeviceLockBlocked"),  @"MKBDeviceLockBlocked");
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  -[NSDictionary objectForKeyedSubscript:]( self->_originalDefaultsForRollback,  "objectForKeyedSubscript:",  @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate"),  @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate");
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:]( self,  "_setLockStateValue:forKey:",  -[NSDictionary objectForKeyedSubscript:]( self->_originalDefaultsForRollback,  "objectForKeyedSubscript:",  @"MKBDeviceLockFailedAttempts"),  @"MKBDeviceLockFailedAttempts");
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState]( self,  "_persistentStateQueue_loadLockState");
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_cancelSpeculativeFailureCharge]( self,  "_persistentStateQueue_cancelSpeculativeFailureCharge");
  }

- (void)_persistentStateQueue_unlockSucceeded
{
}

- (void)_persistentStateQueue_unlockFailed
{
}

- (void)_persistentStateQueue_loadLockState
{
  id v3 = -[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:]( self,  "_lockStateValueForKey:ofType:",  @"MKBDeviceLockBlockTimeIntervalSinceReferenceDate",  objc_opt_class(&OBJC_CLASS___NSNumber));
  if (v3) {
    [v3 doubleValue];
  }
  else {
    -[NSDate timeIntervalSinceReferenceDate]( +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"),  "timeIntervalSinceReferenceDate");
  }
  self->_unblockTime = v4;
  self->_pendingWipe = objc_msgSend( -[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:]( self,  "_lockStateValueForKey:ofType:",  @"MKBDeviceLockPendingWipe",  objc_opt_class(NSNumber)),  "BOOLValue");
  self->_permanentlyBlocked = objc_msgSend( -[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:]( self,  "_lockStateValueForKey:ofType:",  @"MKBDeviceLockBlocked",  objc_opt_class(NSNumber)),  "BOOLValue");
  self->_unint64_t failedPasscodeAttempts = (unint64_t)objc_msgSend( -[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:]( self,  "_lockStateValueForKey:ofType:",  @"MKBDeviceLockFailedAttempts",  objc_opt_class(NSNumber)),  "unsignedIntegerValue");
}

- (void)_loadLockState
{
  id v3 =  +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  self->_lockStatePath);
  self->_lockStateCache = v3;
  if (!v3) {
    self->_lockStateCache = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
}

- (id)_lockStateValueForKey:(id)a3 ofType:(Class)a4
{
  lockStateCache = self->_lockStateCache;
  if (!lockStateCache)
  {
    -[MKBDeviceLockModelEducationalMode _loadLockState](self, "_loadLockState");
    lockStateCache = self->_lockStateCache;
  }

  id v8 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](lockStateCache, "objectForKeyedSubscript:", self->_uid),  "objectForKeyedSubscript:",  a3);
  if ((objc_opt_isKindOfClass(v8, a4) & 1) != 0) {
    return v8;
  }
  else {
    return 0LL;
  }
}

- (void)_setLockStateValue:(id)a3 forKey:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lockStateCache, "objectForKeyedSubscript:", self->_uid);
  if (a3)
  {
    if (!v7) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lockStateCache,  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"),  self->_uid);
    }
    objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_lockStateCache, "objectForKeyedSubscript:", self->_uid),  "setObject:forKeyedSubscript:",  a3,  a4);
  }

  else
  {
    [v7 removeObjectForKey:a4];
  }

  -[NSMutableDictionary writeToFile:atomically:]( self->_lockStateCache,  "writeToFile:atomically:",  self->_lockStatePath,  1LL);
  sync();
}

@end