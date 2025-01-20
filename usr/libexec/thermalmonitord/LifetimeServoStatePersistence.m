@interface LifetimeServoStatePersistence
+ (BOOL)writePersistedStateNvram:(const void *)a3 dataSize:(unint64_t)a4 path:(__CFString *)a5;
+ (BOOL)writeV3PersistedStateNvram:(ltsStateV3 *)a3 path:(__CFString *)a4;
+ (__CFData)copyPersistedStateNvram:(__CFString *)a3;
+ (__CFString)copyPersistenceNvramPath;
+ (id)copyFiler;
+ (unsigned)getPMPSvc;
- (BOOL)UpdateLTSStateCommonFromPMP:(ltsStateCommon *)a3;
- (BOOL)initializeLTSPersistence;
- (BOOL)isNandDataValid;
- (BOOL)isNvramDataValid;
- (BOOL)nvramUpgradeStateV2toV3;
- (BOOL)readInteger:(unsigned int *)a3 forKey:(__CFString *)a4;
- (BOOL)saveLTSStateToNand:(ltsStateV3 *)a3;
- (BOOL)sendDataToPMP:(__CFData *)a3 forKey:(__CFString *)a4;
- (BOOL)sendLTSStateToPMP;
- (BOOL)updateLTSStateISFromPMP:(ltsStateV3 *)a3;
- (BOOL)updateLTSStateISRev:(ltsStateV3 *)a3;
- (BOOL)updatePersistenceLTSState:(BOOL)a3;
- (BOOL)writeInteger:(unsigned int)a3 withKey:(__CFString *)a4;
- (LifetimeServoStatePersistence)initWithParams:(id)a3;
- (__CFData)copyKeyFromPMP:(__CFString *)a3 is_64:(BOOL)a4;
- (ltsStateV3)copyUpdatedLTSState;
- (unsigned)getNANDCounter;
- (unsigned)getNANDVer;
- (unsigned)getNVRAMCounter;
- (unsigned)getNVRAMVer;
- (void)dealloc;
- (void)overrideParam:(id)a3 value:(int)a4;
- (void)readNVRAM;
- (void)resolvePersistentLTSState;
- (void)safeFreeUpdatedLTSState:(ltsStateV3 *)a3;
@end

@implementation LifetimeServoStatePersistence

- (LifetimeServoStatePersistence)initWithParams:(id)a3
{
  v5 = objc_autoreleasePoolPush();
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LifetimeServoStatePersistence;
  v6 = -[LifetimeServoStatePersistence init](&v16, "init");
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D79C();
    }
    goto LABEL_9;
  }

  v7 = v6;
  v8 = +[LifetimeServoStatePersistence copyFiler](&OBJC_CLASS___LifetimeServoStatePersistence, "copyFiler");
  v7->_filer = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D7C8();
    }
LABEL_9:
    v7 = 0LL;
    goto LABEL_10;
  }

  v7->_pmpLTSStateversion = 3;
  v7->_ltsStateSaveInterval = 1800000000000LL;
  v7->_isRevDict = (NSDictionary *)a3;
  *(_WORD *)&v7->_hasNvram = 0;
  v7->_currNvramLTSStateV3.integratorStatePtr = 0LL;
  v7->_currNvramLTSStateV3.integratorStateRevPtr = 0LL;
  v7->_currNvramLTSStateV3.ltsStateCommonPtr = 0LL;
  -[LifetimeServoStatePersistence initializeLTSPersistence](v7, "initializeLTSPersistence");
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = dispatch_queue_create("com.apple.thermalmonitor.lts-ctrl-state", v9);
  if (v10)
  {
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v10);
    v7->_statePersistenceTimer = (OS_dispatch_source *)v11;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100029AE8;
    handler[3] = &unk_1000614D0;
    handler[4] = v7;
    dispatch_source_set_event_handler(v11, handler);
    statePersistenceTimer = (dispatch_source_s *)v7->_statePersistenceTimer;
    dispatch_time_t v13 = dispatch_time(0x8000000000000000LL, v7->_ltsStateSaveInterval);
    dispatch_source_set_timer(statePersistenceTimer, v13, v7->_ltsStateSaveInterval, 0x2540BE400uLL);
    dispatch_resume((dispatch_object_t)v7->_statePersistenceTimer);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003D7F4();
  }

- (void)dealloc
{
  self->_filer = 0LL;
  nvramPersistence = self->_nvramPersistence;
  if (nvramPersistence) {
    CFRelease(nvramPersistence);
  }
  self->_nvramPersistence = 0LL;
  ltsStateCommonPtr = self->_currNvramLTSStateV3.ltsStateCommonPtr;
  if (ltsStateCommonPtr)
  {
    free(ltsStateCommonPtr);
    self->_currNvramLTSStateV3.ltsStateCommonPtr = 0LL;
  }

  integratorStatePtr = self->_currNvramLTSStateV3.integratorStatePtr;
  if (integratorStatePtr)
  {
    free(integratorStatePtr);
    self->_currNvramLTSStateV3.integratorStatePtr = 0LL;
  }

  integratorStateRevPtr = self->_currNvramLTSStateV3.integratorStateRevPtr;
  if (integratorStateRevPtr)
  {
    free(integratorStateRevPtr);
    self->_currNvramLTSStateV3.integratorStateRevPtr = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LifetimeServoStatePersistence;
  -[LifetimeServoStatePersistence dealloc](&v7, "dealloc");
}

- (void)overrideParam:(id)a3 value:(int)a4
{
  if (a4 != -1)
  {
    if (byte_10007CB30)
    {
      objc_super v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        id v12 = a3;
        __int16 v13 = 1024;
        int v14 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController: setting %@ to %d",  (uint8_t *)&v11,  0x12u);
      }
    }

    if ([a3 isEqualToString:@"LifetimeServoStateSaveIntervalMinutes"])
    {
      uint64_t v8 = 60000000000LL * a4;
      self->_ltsStateSaveInterval = v8;
      statePersistenceTimer = self->_statePersistenceTimer;
      dispatch_time_t v10 = dispatch_time(0x8000000000000000LL, v8);
      dispatch_source_set_timer( (dispatch_source_t)statePersistenceTimer,  v10,  self->_ltsStateSaveInterval,  0x2540BE400uLL);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003D84C();
    }
  }

- (BOOL)saveLTSStateToNand:(ltsStateV3 *)a3
{
  if (!-[LifetimeServoStatePersistence writeInteger:withKey:]( self,  "writeInteger:withKey:",  a3->ltsStateCommonPtr->var0,  @"version"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D9BC();
    }
    return 0;
  }

  unsigned int var2 = a3->ltsStateCommonPtr->var2;
  if (!-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D990();
    }
    return 0;
  }

  uint64_t var3 = a3->ltsStateCommonPtr->var3;
  if (!-[LifetimeServoStatePersistence writeInteger:withKey:]( self,  "writeInteger:withKey:",  var3,  @"lts-ctrl-loop-count"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D964();
    }
    return 0;
  }

  if (!var2)
  {
LABEL_23:
    if (-[LifetimeServoStatePersistence writeInteger:withKey:]( self,  "writeInteger:withKey:",  a3->ltsStateCommonPtr->var1,  @"counter"))
    {
      if (-[Filer synchronizeToFile](self->_filer, "synchronizeToFile"))
      {
        if (byte_10007CB30)
        {
          v21 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "<Notice> Saved updated LTS stats data to Nand",  buf,  2u);
          }
        }

        return 1;
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003D8AC();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003D8D8();
    }

    return 0;
  }

  int v6 = 0;
  uint64_t v7 = 0LL;
  BOOL v8 = 1;
  while (!(_DWORD)var3)
  {
LABEL_22:
    uint64_t v7 = (v7 + 1);
    v6 += var3;
    if ((_DWORD)v7 == var2) {
      goto LABEL_23;
    }
  }

  uint64_t v9 = 0LL;
  while (1)
  {
    CFStringRef v10 = CFStringCreateWithFormat(0LL, 0LL, @"lts-ctrl-%u-%u-is", v7, v9);
    if (!v10) {
      break;
    }
    CFStringRef v11 = v10;
    uint64_t v12 = (v6 + v9);
    CFDataRef v13 = CFDataCreate(0LL, (const UInt8 *)&a3->integratorStatePtr[v12], 8LL);
    if (v13)
    {
      CFDataRef v14 = v13;
      -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", v13, v11);
      CFRelease(v14);
    }

    else
    {
      v15 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25[0] = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "<Error> Failed to create CFData for key %@",  buf,  0xCu);
      }
    }

    CFRelease(v11);
    CFStringRef v16 = CFStringCreateWithFormat(0LL, 0LL, @"lts-ctrl-%u-%u-is-rev", v7, v9);
    if (v16)
    {
      CFStringRef v17 = v16;
      unsigned __int8 v18 = -[LifetimeServoStatePersistence writeInteger:withKey:]( self,  "writeInteger:withKey:",  a3->integratorStateRevPtr[v12],  v16);
      CFRelease(v17);
      if ((v18 & 1) != 0)
      {
        BOOL v8 = 1;
      }

      else
      {
        v20 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v25[0]) = v7;
          WORD2(v25[0]) = 1024;
          *(_DWORD *)((char *)v25 + 6) = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "<Error> Failed to save IS revision for lts-ctrl-%u-%u-is-rev\n",  buf,  0xEu);
        }

        BOOL v8 = 0;
      }
    }

    else
    {
      v19 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v25[0]) = v7;
        WORD2(v25[0]) = 1024;
        *(_DWORD *)((char *)v25 + 6) = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "<Error> Failed to create revision key for die %u loop %u\n",  buf,  0xEu);
      }
    }

    if (var3 == ++v9) {
      goto LABEL_22;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D904();
  }
  return v8;
}

- (void)readNVRAM
{
  if (self->_hasNvram)
  {
    if (self->_nvramPersistence)
    {
      v3 = +[LifetimeServoStatePersistence copyPersistedStateNvram:]( &OBJC_CLASS___LifetimeServoStatePersistence,  "copyPersistedStateNvram:");
      if (v3)
      {
        v4 = v3;
        BytePtr = CFDataGetBytePtr(v3);
        self->_unint64_t nvramLength = CFDataGetLength(v4);
        int v6 = (ltsStateCommon *)calloc(1uLL, 0x10uLL);
        self->_currNvramLTSStateV3.ltsStateCommonPtr = v6;
        if (v6)
        {
          ltsStateCommon *v6 = *(ltsStateCommon *)BytePtr;
          ltsStateCommonPtr = self->_currNvramLTSStateV3.ltsStateCommonPtr;
          unsigned int var2 = ltsStateCommonPtr->var2;
          unsigned int var3 = ltsStateCommonPtr->var3;
          size_t v10 = var3 * var2;
          size_t v11 = 8 * v10;
          unint64_t v12 = 8 * v10 + 16;
          unint64_t nvramLength = self->_nvramLength;
          if (nvramLength < v12)
          {
            v20 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              int v21 = 134218240;
              *(void *)v22 = nvramLength;
              *(_WORD *)&v22[8] = 2048;
              *(void *)&v22[10] = v11 + 16;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "<Notice> NVRAM Length %ld less than required %ld, cannot acquire IS data",  (uint8_t *)&v21,  0x16u);
            }
          }

          else
          {
            CFDataRef v14 = (unint64_t *)calloc(var3 * var2, 8uLL);
            self->_currNvramLTSStateV3.integratorStatePtr = v14;
            if (v14)
            {
              memcpy(v14, BytePtr + 16, v11);
              unint64_t v15 = self->_nvramLength;
              if (v15 >= v12 + 4 * v10)
              {
                v19 = (unsigned int *)calloc(v10, 4uLL);
                self->_currNvramLTSStateV3.integratorStateRevPtr = v19;
                if (v19)
                {
                  memcpy(v19, &BytePtr[v12], 4 * v10);
                }

                else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
                {
                  sub_10003DAC4();
                }
              }

              else
              {
                CFStringRef v16 = self->_currNvramLTSStateV3.ltsStateCommonPtr;
                unsigned int var0 = v16->var0;
                if (v16->var0 >= self->_pmpLTSStateversion)
                {
                  unsigned __int8 v18 = (os_log_s *)qword_10007CF50;
                  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
                  {
                    int v21 = 67109376;
                    *(_DWORD *)v22 = var0;
                    *(_WORD *)&v22[4] = 2048;
                    *(void *)&v22[6] = v15;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "<Error> NVRAM version %u, but NVRAM length of %ld is mismatched - version will be invalidated",  (uint8_t *)&v21,  0x12u);
                    CFStringRef v16 = self->_currNvramLTSStateV3.ltsStateCommonPtr;
                  }

                  v16->unsigned int var0 = 0;
                }
              }
            }

            else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              sub_10003DA98();
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003DA6C();
        }

        CFRelease(v4);
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003DA40();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003DA14();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003D9E8();
  }

- (BOOL)nvramUpgradeStateV2toV3
{
  if (self->_hasNvram)
  {
    ltsStateCommonPtr = self->_currNvramLTSStateV3.ltsStateCommonPtr;
    if (ltsStateCommonPtr)
    {
      size_t v4 = ltsStateCommonPtr->var3 * ltsStateCommonPtr->var2;
      v5 = (unsigned int *)calloc(v4, 4uLL);
      self->_currNvramLTSStateV3.integratorStateRevPtr = v5;
      if (v5)
      {
        bzero(v5, v4);
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003DB1C();
      }
    }

    else if (byte_10007CB30)
    {
      uint64_t v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS nvramUpgradeStateV3: NVRAM DATA does not exist",  v8,  2u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003DAF0();
  }

  return 0;
}

- (unsigned)getNVRAMVer
{
  if (!self->_hasNvram)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DB48();
    }
LABEL_14:
    unsigned int var0 = 0;
    goto LABEL_4;
  }

  ltsStateCommonPtr = self->_currNvramLTSStateV3.ltsStateCommonPtr;
  if (!ltsStateCommonPtr)
  {
    if (!byte_10007CB30) {
      return 0;
    }
    size_t v4 = (os_log_s *)qword_10007CF50;
    if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int var0 = 0;
      goto LABEL_6;
    }

    LOWORD(v6[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS getNVRAMVer: NVRAM version does not exist",  (uint8_t *)v6,  2u);
    goto LABEL_14;
  }

  unsigned int var0 = ltsStateCommonPtr->var0;
LABEL_4:
  if (!byte_10007CB30) {
    return var0;
  }
  size_t v4 = (os_log_s *)qword_10007CF50;
LABEL_6:
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = var0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS getNVRAMVer: NVRAM version %d",  (uint8_t *)v6,  8u);
  }

  return var0;
}

- (unsigned)getNVRAMCounter
{
  if (!self->_hasNvram)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DB74();
    }
LABEL_14:
    unsigned int var1 = 0;
    goto LABEL_4;
  }

  ltsStateCommonPtr = self->_currNvramLTSStateV3.ltsStateCommonPtr;
  if (!ltsStateCommonPtr)
  {
    if (!byte_10007CB30) {
      return 0;
    }
    size_t v4 = (os_log_s *)qword_10007CF50;
    if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int var1 = 0;
      goto LABEL_6;
    }

    LOWORD(v6[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS getNVRAMCounter: NVRAM counter does not exist",  (uint8_t *)v6,  2u);
    goto LABEL_14;
  }

  unsigned int var1 = ltsStateCommonPtr->var1;
LABEL_4:
  if (!byte_10007CB30) {
    return var1;
  }
  size_t v4 = (os_log_s *)qword_10007CF50;
LABEL_6:
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = var1;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS getNVRAMCounter: NVRAM counter %d",  (uint8_t *)v6,  8u);
  }

  return var1;
}

- (BOOL)isNvramDataValid
{
  if (self->_hasNvram)
  {
    integratorStatePtr = self->_currNvramLTSStateV3.integratorStatePtr;
    if (integratorStatePtr)
    {
      double v3 = *(double *)integratorStatePtr;
      if (byte_10007CB30)
      {
        size_t v4 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = (uint64_t)(v3 / 31536000.0);
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS data from NVRAM contains %llu years of accumulated IS",  (uint8_t *)&v9,  0xCu);
        }
      }

      BOOL v5 = v3 < 3.1536e10;
      goto LABEL_7;
    }

    if (!byte_10007CB30)
    {
      LOBYTE(v5) = 0;
      return v5;
    }

    int v6 = (os_log_s *)qword_10007CF50;
    if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = 0;
      goto LABEL_9;
    }

    LOWORD(v9) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS nvramDataValid: NVRAM DATA does not exist",  (uint8_t *)&v9,  2u);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003DBA0();
  }

  BOOL v5 = 0;
LABEL_7:
  if (!byte_10007CB30) {
    return v5;
  }
  int v6 = (os_log_s *)qword_10007CF50;
LABEL_9:
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "INVALID";
    if (v5) {
      uint64_t v7 = "VALID";
    }
    int v9 = 136315138;
    uint64_t v10 = (uint64_t)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS nvramDataValid: NVRAM data is %s",  (uint8_t *)&v9,  0xCu);
  }

  return v5;
}

- (unsigned)getNANDVer
{
  unsigned int v5 = 0;
  if (!-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v5, @"version"))
  {
    if (byte_10007CB30)
    {
      v2 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)size_t v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS getNANDVer: NAND version does not exist",  v4,  2u);
      }
    }
  }

  return v5;
}

- (unsigned)getNANDCounter
{
  unsigned int v5 = 0;
  if (!-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v5, @"counter"))
  {
    if (byte_10007CB30)
    {
      v2 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)size_t v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS getNANDCounter: NAND counter does not exist",  v4,  2u);
      }
    }
  }

  return v5;
}

- (BOOL)isNandDataValid
{
  id v2 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", @"lts-ctrl-0-0-is");
  if (v2)
  {
    [v2 getBytes:&v9 length:8];
    double v3 = v9;
    if (byte_10007CB30)
    {
      size_t v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = (uint64_t)(v3 / 31536000.0);
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS data from NAND contains %llu years of accumulated IS",  buf,  0xCu);
      }
    }

    BOOL v5 = v3 < 3.1536e10;
  }

  else
  {
    BOOL v5 = 0;
  }

  if (byte_10007CB30)
  {
    int v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = "INVALID";
      if (v5) {
        uint64_t v7 = "VALID";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = (uint64_t)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> LTS nandDataValid: NAND data is %s",  buf,  0xCu);
    }
  }

  return v5;
}

- (void)resolvePersistentLTSState
{
  if (self->_hasNvram)
  {
    -[LifetimeServoStatePersistence readNVRAM](self, "readNVRAM");
    unsigned int v3 = -[LifetimeServoStatePersistence getNVRAMVer](self, "getNVRAMVer");
    unsigned int v4 = -[LifetimeServoStatePersistence getNVRAMCounter](self, "getNVRAMCounter");
    unsigned int pmpLTSStateversion = self->_pmpLTSStateversion;
    if (v3 != pmpLTSStateversion)
    {
      if (byte_10007CB30)
      {
        int v6 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 67109376;
          unsigned int v20 = v3;
          __int16 v21 = 1024;
          unsigned int v22 = pmpLTSStateversion;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> NVRAM version %d mismatch - will be updated to version %d",  (uint8_t *)&v19,  0xEu);
        }
      }

      self->_initializeNvram = 1;
    }

    if (-[LifetimeServoStatePersistence isNvramDataValid](self, "isNvramDataValid"))
    {
      int v7 = 1;
    }

    else
    {
      if (byte_10007CB30)
      {
        BOOL v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> NVRAM data is INVALID and will be reset",  (uint8_t *)&v19,  2u);
        }
      }

      int v7 = 0;
      self->_initializeNvram = 1;
    }
  }

  else
  {
    int v7 = 0;
    unsigned int v4 = 0;
    unsigned int v3 = 0;
  }

  unsigned int v9 = -[LifetimeServoStatePersistence getNANDVer](self, "getNANDVer");
  unsigned int v10 = -[LifetimeServoStatePersistence getNANDCounter](self, "getNANDCounter");
  unsigned int v11 = self->_pmpLTSStateversion;
  if (v9 != v11 && byte_10007CB30 != 0)
  {
    CFDataRef v13 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109376;
      unsigned int v20 = v9;
      __int16 v21 = 1024;
      unsigned int v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "<Notice> NAND version %d mismatch - will be updated to version %d",  (uint8_t *)&v19,  0xEu);
    }
  }

  unsigned int v14 = -[LifetimeServoStatePersistence isNandDataValid](self, "isNandDataValid");
  self->_resolvedLTSPersistence.current_count = 0;
  self->_resolvedLTSPersistence.pmp_data_source = 0;
  if (v9 <= v3) {
    unsigned int v15 = v3;
  }
  else {
    unsigned int v15 = v9;
  }
  if (v15 >= 2 && ((v7 | v14) & 1) != 0)
  {
    self->_resolvedLTSPersistence.current_version = v9;
    self->_resolvedLTSPersistence.current_count = v10;
    self->_resolvedLTSPersistence.pmp_data_source = 1;
    if ((v14 & 1) == 0) {
      goto LABEL_30;
    }
    if (!v7)
    {
      int v16 = 1;
      goto LABEL_32;
    }

    if (v9 < v3 || (int v16 = 1, v9 == v3) && v4 > v10)
    {
LABEL_30:
      self->_resolvedLTSPersistence.current_version = v3;
      self->_resolvedLTSPersistence.current_count = v4;
      int v16 = 2;
      self->_resolvedLTSPersistence.pmp_data_source = 2;
      unsigned int v10 = v4;
      unsigned int v9 = v3;
    }
  }

  else
  {
    int v16 = 0;
    unsigned int v10 = 0;
    self->_resolvedLTSPersistence.current_version = v15;
    unsigned int v9 = v15;
  }

- (BOOL)initializeLTSPersistence
{
  unsigned int current_version = self->_resolvedLTSPersistence.current_version;
  if (current_version >= 2 && current_version != 3)
  {
    if (current_version == 2)
    {
      if (self->_hasNvram && self->_resolvedLTSPersistence.pmp_data_source == 2) {
        -[LifetimeServoStatePersistence nvramUpgradeStateV2toV3](self, "nvramUpgradeStateV2toV3");
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003DC24();
    }
  }

  int pmp_data_source = self->_resolvedLTSPersistence.pmp_data_source;
  if (pmp_data_source == 2)
  {
    -[LifetimeServoStatePersistence saveLTSStateToNand:](self, "saveLTSStateToNand:", &self->_currNvramLTSStateV3);
    int pmp_data_source = self->_resolvedLTSPersistence.pmp_data_source;
  }

  if (pmp_data_source)
  {
    -[LifetimeServoStatePersistence sendLTSStateToPMP](self, "sendLTSStateToPMP");
  }

  else
  {
    int v6 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> No valid NVRam and NAND data. Nothing to send to PMP",  buf,  2u);
      int v6 = (os_log_s *)qword_10007CF50;
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "<Notice> Retrieving initial data from PMP and storing in NAND & NVRAM",  v11,  2u);
    }

    if (!-[LifetimeServoStatePersistence writeInteger:withKey:](self, "writeInteger:withKey:", 0LL, @"counter")
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003DBF8();
    }
  }

  sleep(1u);
  BOOL v7 = -[LifetimeServoStatePersistence updatePersistenceLTSState:]( self,  "updatePersistenceLTSState:",  self->_initializeNvram);
  if (v7)
  {
    if (byte_10007CB30)
    {
      BOOL v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> PMP update with LTS State complete",  v10,  2u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003DBCC();
  }

  return v7;
}

- (BOOL)sendLTSStateToPMP
{
  uint64_t v25 = 0LL;
  if (!-[LifetimeServoStatePersistence readInteger:forKey:]( self,  "readInteger:forKey:",  (char *)&v25 + 4,  @"lts-ctrl-die-count"))
  {
    BOOL v21 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v21) {
      return v21;
    }
    sub_10003DCB0();
    goto LABEL_39;
  }

  if (!-[LifetimeServoStatePersistence readInteger:forKey:]( self,  "readInteger:forKey:",  &v25,  @"lts-ctrl-loop-count"))
  {
    BOOL v21 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v21) {
      return v21;
    }
    sub_10003DC84();
LABEL_39:
    LOBYTE(v21) = 0;
    return v21;
  }

  if (byte_10007CB30)
  {
    unsigned int v3 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v27 = HIDWORD(v25);
      __int16 v28 = 1024;
      int v29 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "<Notice> sendLTSStateToPMP: dieCount:%u loopCount:%u",  buf,  0xEu);
    }
  }

  unsigned int v4 = HIDWORD(v25);
  if (!HIDWORD(v25)) {
    goto LABEL_30;
  }
  uint64_t v5 = 0LL;
  int v6 = v25;
  do
  {
    if (!v6) {
      goto LABEL_29;
    }
    uint64_t v7 = 0LL;
    do
    {
      CFStringRef v8 = CFStringCreateWithFormat(0LL, 0LL, @"lts-ctrl-%u-%u-is-rev", v5, v7);
      if (!v8)
      {
        uint64_t v15 = qword_10007CF50;
        if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 67109376;
        int v27 = v5;
        __int16 v28 = 1024;
        int v29 = v7;
        int v16 = (os_log_s *)v15;
        CFStringRef v17 = "<Error> Failed to create is rev key for die %u loop %u\n";
        goto LABEL_23;
      }

      unsigned int v9 = (__CFString *)v8;
      int v24 = 0;
      -[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v24, v8);
      if ((sub_100020FE0((CFDictionaryRef)self->_isRevDict, v9, kCFNumberIntType, &v23) & 1) == 0) {
        int v23 = 0;
      }
      CFRelease(v9);
      if (v24 == v23)
      {
        CFStringRef v10 = CFStringCreateWithFormat(0LL, 0LL, @"lts-ctrl-%u-%u-is", v5, v7);
        if (v10)
        {
          CFStringRef v11 = v10;
          id v12 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", v10);
          if (v12)
          {
            id v13 = v12;
            -[LifetimeServoStatePersistence sendDataToPMP:forKey:](self, "sendDataToPMP:forKey:", v12, v11);
            if (byte_10007CB30)
            {
              unsigned int v14 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109634;
                int v27 = v5;
                __int16 v28 = 1024;
                int v29 = v7;
                __int16 v30 = 2112;
                id v31 = v13;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "<Notice> Sending data to PMP: die %u loop %u is: %@",  buf,  0x18u);
              }
            }
          }

          else
          {
            int v19 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              int v27 = v5;
              __int16 v28 = 1024;
              int v29 = v7;
              _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "<Error> Failed to send data to PMP: die %u loop %u",  buf,  0xEu);
            }
          }

          CFRelease(v11);
          goto LABEL_27;
        }

        uint64_t v18 = qword_10007CF50;
        if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 67109376;
        int v27 = v5;
        __int16 v28 = 1024;
        int v29 = v7;
        int v16 = (os_log_s *)v18;
        CFStringRef v17 = "<Error> Failed to create key for die %u loop %u\n";
LABEL_23:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xEu);
      }

+ (id)copyFiler
{
  if (!&_lookupPathForPersistentData)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DCDC();
    }
    return 0LL;
  }

  if (lookupPathForPersistentData(104LL, v6, 1024LL))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DD08();
    }
    return 0LL;
  }

  if (byte_10007CB30)
  {
    id v2 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      uint64_t v5 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "<Notice> Persitence filepath:%s",  (uint8_t *)&v4,  0xCu);
    }
  }

  return -[Filer initWithFileName:inDirectory:]( objc_alloc(&OBJC_CLASS___Filer),  "initWithFileName:inDirectory:",  "com.apple.cltm",  v6);
}

+ (__CFString)copyPersistenceNvramPath
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0x40u,  0xA0u,  0xDDu,  0xD2u,  0x77u,  0xF8u,  0x43u,  0x92u,  0xB4u,  0xA3u,  0x1Eu,  0x73u,  4u,  0x20u,  0x65u,  0x16u);
  unsigned int v3 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%@:%s", v2, "lts-persistance");
  if (v3)
  {
    if (byte_10007CB30)
    {
      int v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v7 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> NVRam path: %@", buf, 0xCu);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003DD68();
  }

  return v3;
}

- (BOOL)readInteger:(unsigned int *)a3 forKey:(__CFString *)a4
{
  id v6 = -[Filer getValueForKey:](self->_filer, "getValueForKey:", a4);
  id v7 = v6;
  if (v6)
  {
    *a3 = [v6 unsignedIntegerValue];
  }

  else if (byte_10007CB30)
  {
    unsigned int v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      CFStringRef v11 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> Failed to read value for key %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  return v7 != 0LL;
}

- (BOOL)writeInteger:(unsigned int)a3 withKey:(__CFString *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_autoreleasePoolPush();
  CFStringRef v8 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5);
  if (v8)
  {
    -[Filer setValue:forKey:](self->_filer, "setValue:forKey:", v8, a4);
  }

  else if (byte_10007CB30)
  {
    int v10 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> Failed to create CFNumber for integer %d\n",  (uint8_t *)v11,  8u);
    }
  }

  objc_autoreleasePoolPop(v7);
  return v8 != 0LL;
}

+ (__CFData)copyPersistedStateNvram:(__CFString *)a3
{
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DD94();
    }
    return 0LL;
  }

  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v4)
  {
    unsigned int v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DDC0(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0LL;
  }

  io_object_t v5 = v4;
  CFProperty = (__CFData *)IORegistryEntryCreateCFProperty(v4, a3, kCFAllocatorDefault, 0);
  id v7 = CFProperty;
  if (CFProperty)
  {
    CFTypeID v8 = CFGetTypeID(CFProperty);
    if (v8 != CFDataGetTypeID() && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DE5C();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003DE30();
  }

  IOObjectRelease(v5);
  return v7;
}

+ (BOOL)writePersistedStateNvram:(const void *)a3 dataSize:(unint64_t)a4 path:(__CFString *)a5
{
  kern_return_t v11;
  BOOL v12;
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DD94();
    }
    return 0;
  }

  io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v8) {
    return 0;
  }
  io_registry_entry_t v9 = v8;
  uint64_t v10 = objc_autoreleasePoolPush();
  uint64_t v11 = IORegistryEntrySetCFProperty( v9,  a5,  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, a4));
  uint64_t v12 = v11 == 0;
  if (v11 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003DE88();
  }
  objc_autoreleasePoolPop(v10);
  IOObjectRelease(v9);
  return v12;
}

+ (BOOL)writeV3PersistedStateNvram:(ltsStateV3 *)a3 path:(__CFString *)a4
{
  kern_return_t v14;
  BOOL v15;
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DD94();
    }
    return 0;
  }

  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6) {
    return 0;
  }
  io_registry_entry_t v7 = v6;
  io_registry_entry_t v8 = objc_autoreleasePoolPush();
  unsigned int v9 = a3->ltsStateCommonPtr->var3 * a3->ltsStateCommonPtr->var2;
  uint64_t v10 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:");
  uint64_t v11 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3->integratorStatePtr, 8LL * v9);
  uint64_t v12 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  a3->integratorStateRevPtr,  4LL * v9);
  id v13 = -[NSData mutableCopy](v10, "mutableCopy");
  [v13 appendData:v11];
  [v13 appendData:v12];
  uint64_t v14 = IORegistryEntrySetCFProperty(v7, a4, v13);
  uint64_t v15 = v14 == 0;
  if (v14 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003DE88();
  }
  objc_autoreleasePoolPop(v8);
  IOObjectRelease(v7);
  return v15;
}

+ (unsigned)getPMPSvc
{
  unsigned int result = dword_10007CAB8;
  if (!dword_10007CAB8)
  {
    unsigned int v3 = IOServiceNameMatching("ApplePMPv2");
    unsigned int result = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    dword_10007CAB8 = result;
  }

  return result;
}

- (__CFData)copyKeyFromPMP:(__CFString *)a3 is_64:(BOOL)a4
{
  BOOL v4 = a4;
  io_registry_entry_t v6 = +[LifetimeServoStatePersistence getPMPSvc](&OBJC_CLASS___LifetimeServoStatePersistence, "getPMPSvc");
  if (!v6)
  {
    uint64_t v14 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DEB4(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    return 0LL;
  }

  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v6, a3, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003DF24();
    }
    return 0LL;
  }

  io_registry_entry_t v8 = CFProperty;
  CFTypeID v9 = CFGetTypeID(CFProperty);
  if (v9 == CFDataGetTypeID())
  {
    CFIndex Length = CFDataGetLength(v8);
    uint64_t v11 = 4LL;
    if (v4) {
      uint64_t v11 = 8LL;
    }
    if (Length != v11)
    {
      uint64_t v12 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003DF84(v8, (uint64_t)a3, v12);
      }
      CFRelease(v8);
      return 0LL;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003E018();
  }

  return v8;
}

- (BOOL)sendDataToPMP:(__CFData *)a3 forKey:(__CFString *)a4
{
  io_registry_entry_t v6 = +[LifetimeServoStatePersistence getPMPSvc](&OBJC_CLASS___LifetimeServoStatePersistence, "getPMPSvc");
  if (v6)
  {
    if (!IORegistryEntrySetCFProperty(v6, a4, a3))
    {
      LOBYTE(v7) = 1;
      return v7;
    }

    BOOL v7 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_10003E078();
  }

  else
  {
    io_registry_entry_t v8 = (os_log_s *)qword_10007CF50;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_10003DEB4(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)updateLTSStateISFromPMP:(ltsStateV3 *)a3
{
  unsigned int var2 = a3->ltsStateCommonPtr->var2;
  uint64_t var3 = a3->ltsStateCommonPtr->var3;
  BOOL v7 = (unint64_t *)calloc(var3 * var2, 8uLL);
  a3->integratorStatePtr = v7;
  if (!v7)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v17) {
      return v17;
    }
    sub_10003E0D8();
    goto LABEL_25;
  }

  if (var2)
  {
    int v8 = 0;
    uint64_t v9 = 0LL;
    unsigned int v21 = var2;
    while (!(_DWORD)var3)
    {
LABEL_12:
      uint64_t v9 = (v9 + 1);
      v8 += var3;
      if ((_DWORD)v9 == v21) {
        goto LABEL_13;
      }
    }

    uint64_t v10 = 0LL;
    while (1)
    {
      CFStringRef v11 = CFStringCreateWithFormat(0LL, 0LL, @"lts-ctrl-%u-%u-is-inuse", v9, v10);
      if (!v11) {
        break;
      }
      CFStringRef v12 = v11;
      uint64_t v13 = -[LifetimeServoStatePersistence copyKeyFromPMP:is_64:](self, "copyKeyFromPMP:is_64:", v11, 1LL);
      if (!v13)
      {
        if (byte_10007CB30)
        {
          uint64_t v18 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)int v23 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "<Notice> Failed to read integrator state for key %@",  buf,  0xCu);
          }
        }

        uint64_t v19 = (const __CFData *)v12;
        goto LABEL_24;
      }

      uint64_t v14 = v13;
      CFRelease(v12);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)int v23 = v9;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v10;
        __int16 v24 = 2114;
        uint64_t v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "die %u loop %u is: %{public}@",  buf,  0x18u);
      }

      BytePtr = CFDataGetBytePtr(v14);
      if (!BytePtr)
      {
        uint64_t v19 = v14;
LABEL_24:
        CFRelease(v19);
        goto LABEL_25;
      }

      a3->integratorStatePtr[(v8 + v10)] = *(void *)BytePtr;
      CFRelease(v14);
      if (var3 == ++v10) {
        goto LABEL_12;
      }
    }

    BOOL v17 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v17) {
      return v17;
    }
    sub_10003D904();
LABEL_25:
    LOBYTE(v17) = 0;
    return v17;
  }

- (BOOL)updateLTSStateISRev:(ltsStateV3 *)a3
{
  unsigned int var2 = a3->ltsStateCommonPtr->var2;
  uint64_t var3 = a3->ltsStateCommonPtr->var3;
  BOOL v7 = (unsigned int *)calloc(var3 * var2, 4uLL);
  a3->integratorStateRevPtr = v7;
  if (v7)
  {
    if (var2)
    {
      int v8 = 0;
      BOOL v9 = 0;
      uint64_t v10 = 0LL;
      while (!(_DWORD)var3)
      {
LABEL_10:
        uint64_t v10 = (v10 + 1);
        v8 += var3;
        BOOL v9 = v10 >= var2;
        if ((_DWORD)v10 == var2) {
          return 1;
        }
      }

      uint64_t v11 = 0LL;
      while (1)
      {
        CFStringRef v12 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"lts-ctrl-%u-%u-is-rev", v10, v11);
        if (!v12) {
          break;
        }
        uint64_t v13 = v12;
        if ((sub_100020FE0((CFDictionaryRef)self->_isRevDict, v12, kCFNumberIntType, &v15) & 1) == 0) {
          unsigned int v15 = 0;
        }
        CFRelease(v13);
        a3->integratorStateRevPtr[(v8 + v11++)] = v15;
        if (var3 == v11) {
          goto LABEL_10;
        }
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003E130();
      }
    }

    else
    {
      return 1;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003E104();
    }
    return 0;
  }

  return v9;
}

- (BOOL)UpdateLTSStateCommonFromPMP:(ltsStateCommon *)a3
{
  uint64_t v14 = 0LL;
  io_object_t v5 = -[LifetimeServoStatePersistence copyKeyFromPMP:is_64:]( self,  "copyKeyFromPMP:is_64:",  @"lts-ctrl-die-count",  0LL);
  if (!v5)
  {
    BOOL v12 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v12) {
      return v12;
    }
    sub_10003E190();
    goto LABEL_12;
  }

  io_registry_entry_t v6 = v5;
  -[__CFData getBytes:length:](v5, "getBytes:length:", (char *)&v14 + 4, 4LL);
  CFRelease(v6);
  BOOL v7 = -[LifetimeServoStatePersistence copyKeyFromPMP:is_64:]( self,  "copyKeyFromPMP:is_64:",  @"lts-ctrl-loop-count",  0LL);
  if (!v7)
  {
    BOOL v12 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR);
    if (!v12) {
      return v12;
    }
    sub_10003E1BC();
LABEL_12:
    LOBYTE(v12) = 0;
    return v12;
  }

  int v8 = v7;
  -[__CFData getBytes:length:](v7, "getBytes:length:", &v14, 4LL);
  CFRelease(v8);
  unsigned int v9 = HIDWORD(v14);
  unsigned int v10 = v14 / HIDWORD(v14);
  LODWORD(v14) = v14 / HIDWORD(v14);
  if (byte_10007CB30)
  {
    uint64_t v11 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v16 = v9;
      __int16 v17 = 1024;
      unsigned int v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> dieCount:%u loopCount:%u",  buf,  0xEu);
      unsigned int v10 = v14;
      unsigned int v9 = HIDWORD(v14);
    }
  }

  a3->unsigned int var2 = v9;
  a3->uint64_t var3 = v10;
  LOBYTE(v12) = 1;
  return v12;
}

- (ltsStateV3)copyUpdatedLTSState
{
  int v7 = 0;
  unsigned int v3 = (ltsStateV3 *)malloc(0x18uLL);
  BOOL v4 = v3;
  if (v3)
  {
    v3->integratorStatePtr = 0LL;
    v3->integratorStateRevPtr = 0LL;
    io_object_t v5 = (ltsStateCommon *)calloc(1uLL, 0x10uLL);
    v4->ltsStateCommonPtr = v5;
    if (v5)
    {
      if (-[LifetimeServoStatePersistence UpdateLTSStateCommonFromPMP:](self, "UpdateLTSStateCommonFromPMP:", v5))
      {
        v4->ltsStateCommonPtr->unsigned int var0 = self->_pmpLTSStateversion;
        if (!-[LifetimeServoStatePersistence readInteger:forKey:](self, "readInteger:forKey:", &v7, @"counter"))
        {
          int v7 = 0;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003E2C4();
          }
        }

        v4->ltsStateCommonPtr->unsigned int var1 = ++v7;
        if (-[LifetimeServoStatePersistence updateLTSStateISFromPMP:](self, "updateLTSStateISFromPMP:", v4))
        {
          if (-[LifetimeServoStatePersistence updateLTSStateISRev:](self, "updateLTSStateISRev:", v4)) {
            return v4;
          }
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003E26C();
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003E298();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003E2F0();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003E240();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003E214();
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003E1E8();
  }
  -[LifetimeServoStatePersistence safeFreeUpdatedLTSState:](self, "safeFreeUpdatedLTSState:", v4);
  return 0LL;
}

- (void)safeFreeUpdatedLTSState:(ltsStateV3 *)a3
{
  if (a3)
  {
    if (a3->ltsStateCommonPtr)
    {
      free(a3->ltsStateCommonPtr);
      a3->ltsStateCommonPtr = 0LL;
    }

    integratorStatePtr = a3->integratorStatePtr;
    if (integratorStatePtr)
    {
      free(integratorStatePtr);
      a3->integratorStatePtr = 0LL;
    }

    integratorStateRevPtr = a3->integratorStateRevPtr;
    free(a3);
  }

- (BOOL)updatePersistenceLTSState:(BOOL)a3
{
  BOOL v3 = a3;
  io_object_t v5 = -[LifetimeServoStatePersistence copyUpdatedLTSState](self, "copyUpdatedLTSState");
  if (v5)
  {
    -[LifetimeServoStatePersistence saveLTSStateToNand:](self, "saveLTSStateToNand:", v5);
    if (self->_hasNvram && v3)
    {
      if (+[LifetimeServoStatePersistence writeV3PersistedStateNvram:path:]( &OBJC_CLASS___LifetimeServoStatePersistence,  "writeV3PersistedStateNvram:path:",  v5,  self->_nvramPersistence))
      {
        if (byte_10007CB30)
        {
          int v7 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)unsigned int v9 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> Saved LTS state to NVRam",  v9,  2u);
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003E31C();
      }
    }

    -[LifetimeServoStatePersistence safeFreeUpdatedLTSState:](self, "safeFreeUpdatedLTSState:", v5);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003E348();
  }

  return v5 != 0LL;
}

@end