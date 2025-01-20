@interface VCPSystemMonitor
- (VCPSystemMonitor)init;
- (id)checkFullyCharged;
- (int)disable;
- (int)enable;
- (int64_t)checkPluggedIn;
- (int64_t)checkScreenLocked;
- (int64_t)recommendedState;
- (unint64_t)checkThermalPressure;
- (void)checkFreeSpace;
- (void)dealloc;
- (void)reset;
@end

@implementation VCPSystemMonitor

- (VCPSystemMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VCPSystemMonitor;
  v2 = -[VCPSystemMonitor init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_powerToken = -1LL;
    *(void *)&v2->_chargedToken = -1LL;
    freeSpaceTimer = v2->_freeSpaceTimer;
    v2->_freeSpaceTimer = 0LL;
    v2->_recommendedState = 2LL;
  }

  return v3;
}

- (void)reset
{
  p_int powerToken = &self->_powerToken;
  int powerToken = self->_powerToken;
  if (powerToken != -1) {
    notify_cancel(powerToken);
  }
  int screenToken = self->_screenToken;
  if (screenToken != -1) {
    notify_cancel(screenToken);
  }
  int chargedToken = self->_chargedToken;
  int thermalToken = self->_thermalToken;
  if (thermalToken != -1) {
    notify_cancel(thermalToken);
  }
  freeSpaceTimer = self->_freeSpaceTimer;
  if (freeSpaceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)freeSpaceTimer);
    freeSpaceTimer = self->_freeSpaceTimer;
  }

  *(void *)p_int powerToken = -1LL;
  *((void *)p_powerToken + 1) = -1LL;
  self->_freeSpaceTimer = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPSystemMonitor;
  -[VCPSystemMonitor dealloc](&v3, "dealloc");
}

- (int64_t)checkPluggedIn
{
  double v5 = IOPSGetTimeRemainingEstimate();
  if (self->_powerToken == -1 || v5 == -1.0)
  {
    if ((int)MediaAnalysisLogLevel(v3, v4) >= 3)
    {
      uint64_t v7 = VCPLogInstance();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v8, v9))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Failed to query whether device is plugged-in",  (uint8_t *)&v20,  2u);
      }
    }

    self->_recommendedState = 5LL;
    return -1LL;
  }

  else
  {
    uint64_t v11 = MediaAnalysisLogLevel(v3, v4);
    if ((int)v11 >= 7)
    {
      uint64_t v13 = VCPLogInstance();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v14, v15))
      {
        v16 = "unplugged";
        if (v5 == -2.0) {
          v16 = "plugged-in";
        }
        int v20 = 136315138;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Device is %s", (uint8_t *)&v20, 0xCu);
      }
    }

    if (v5 != -2.0 && self->_recommendedState == 2)
    {
      if ((int)MediaAnalysisLogLevel(v11, v12) >= 5)
      {
        uint64_t v17 = VCPLogInstance();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        os_log_type_t v19 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v18, v19))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Device is unplugged", (uint8_t *)&v20, 2u);
        }
      }

      self->_recommendedState = 3LL;
    }

    return v5 == -2.0;
  }

- (int64_t)checkScreenLocked
{
  uint64_t state64 = 0LL;
  uint64_t screenToken = self->_screenToken;
  if ((_DWORD)screenToken == -1 || (uint64_t screenToken = notify_get_state(screenToken, &state64), (_DWORD)screenToken))
  {
    if ((int)MediaAnalysisLogLevel(screenToken, a2) >= 3)
    {
      uint64_t v4 = VCPLogInstance();
      double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      os_log_type_t v6 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to query whether screen is locked", buf, 2u);
      }
    }

    self->_recommendedState = 5LL;
    return -1LL;
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(screenToken, a2);
    if ((int)v8 >= 7)
    {
      uint64_t v10 = VCPLogInstance();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v11, v12))
      {
        if (state64) {
          uint64_t v13 = "locked";
        }
        else {
          uint64_t v13 = "unlocked";
        }
        *(_DWORD *)buf = 136315138;
        int v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Screen is %s", buf, 0xCu);
      }
    }

    uint64_t v14 = state64;
    if (!state64)
    {
      if (self->_recommendedState == 2)
      {
        if ((int)MediaAnalysisLogLevel(v8, v9) >= 5)
        {
          uint64_t v15 = VCPLogInstance();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v16, v17))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "Screen is unlocked", buf, 2u);
          }
        }

        self->_recommendedState = 3LL;
        uint64_t v14 = state64;
      }

      else
      {
        uint64_t v14 = 0LL;
      }
    }

    return v14 != 0;
  }

- (id)checkFullyCharged
{
  v2 = self;
  if (qword_1001E6748 != -1) {
    dispatch_once(&qword_1001E6748, &stru_1001BE0A8);
  }
  __int16 v22 = 0;
  if (!byte_1001E6740) {
    goto LABEL_10;
  }
  self = (VCPSystemMonitor *)IOPSGetPercentRemaining(&v23, &v22, (char *)&v22 + 1);
  if ((_DWORD)self)
  {
    if (byte_1001E6740)
    {
LABEL_7:
      uint64_t v3 = MediaAnalysisLogLevel(self, a2);
      if ((int)v3 >= 3)
      {
        uint64_t v5 = VCPLogInstance(v3, v4);
        os_log_type_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        os_log_type_t v7 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v6, v7))
        {
          *(_WORD *)buf = 0;
          uint64_t v8 = "Failed to query whether device is fully charged";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v6, v7, v8, buf, 2u);
          goto LABEL_14;
        }

        goto LABEL_14;
      }

      goto LABEL_15;
    }

- (unint64_t)checkThermalPressure
{
  uint64_t state64 = 0LL;
  uint64_t thermalToken = self->_thermalToken;
  if ((_DWORD)thermalToken == -1 || (uint64_t thermalToken = notify_get_state(thermalToken, &state64), (_DWORD)thermalToken))
  {
    if ((int)MediaAnalysisLogLevel(thermalToken, a2) >= 3)
    {
      uint64_t v4 = VCPLogInstance();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      os_log_type_t v6 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to query thermal pressure level", buf, 2u);
      }
    }

    self->_recommendedState = 5LL;
    return -1LL;
  }

  else if (state64)
  {
    if ((int)MediaAnalysisLogLevel(thermalToken, a2) >= 5)
    {
      uint64_t v8 = VCPLogInstance();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Device is under thermal pressure", v11, 2u);
      }
    }

    self->_recommendedState = 5LL;
    return state64;
  }

  else
  {
    return 0LL;
  }

- (void)checkFreeSpace
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vcp_mediaAnalysisDirectory"));
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);

  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfFileSystemForPath:v6 error:0]);
  uint64_t v9 = v7;
  if (!v7
    || (os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSFileSystemFreeSize])) == 0)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v24 < 3)
    {
      os_log_type_t v10 = 0LL;
      goto LABEL_17;
    }

    uint64_t v26 = VCPLogInstance(v24, v25);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    os_log_type_t v27 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v21, v27))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v27, "Failed to query free space", (uint8_t *)&v28, 2u);
    }

    os_log_type_t v10 = 0LL;
    goto LABEL_15;
  }

  os_log_type_t v10 = v7;
  uint64_t v11 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v11 >= 7)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v14, v15))
    {
      int v28 = 134217984;
      double v29 = (double)(unint64_t)[v10 unsignedLongLongValue] * 0.0009765625 * 0.0009765625;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Free space: %0.1f MB", (uint8_t *)&v28, 0xCu);
    }
  }

  unint64_t v16 = (unint64_t)[v10 unsignedLongLongValue];
  if (v16 >> 21 <= 4)
  {
    uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v18 < 5)
    {
LABEL_17:
      self->_recommendedState = 5LL;
      goto LABEL_18;
    }

    uint64_t v20 = VCPLogInstance(v18, v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v22 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = [v10 unsignedLongLongValue];
      int v28 = 134217984;
      double v29 = *(double *)&v23;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Insufficient free space (%llu bytes)", (uint8_t *)&v28, 0xCu);
    }

- (int)enable
{
  p_uint64_t thermalToken = &self->_thermalToken;
  if (self->_thermalToken == -1)
  {
    self->_recommendedState = 2LL;
    p_int powerToken = &self->_powerToken;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001254D8;
    handler[3] = &unk_1001BD300;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", &self->_powerToken, &_dispatch_main_q, handler);
    -[VCPSystemMonitor checkPluggedIn](self, "checkPluggedIn");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001254E0;
    v21[3] = &unk_1001BD300;
    v21[4] = self;
    notify_register_dispatch("com.apple.springboard.lockstate", &self->_screenToken, &_dispatch_main_q, v21);
    -[VCPSystemMonitor checkScreenLocked](self, "checkScreenLocked");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001254E8;
    v20[3] = &unk_1001BD300;
    v20[4] = self;
    notify_register_dispatch( "com.apple.system.powersources.timeremaining",  &self->_chargedToken,  &_dispatch_main_q,  v20);
    id v5 = -[VCPSystemMonitor checkFullyCharged](self, "checkFullyCharged");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100125508;
    v19[3] = &unk_1001BD300;
    v19[4] = self;
    notify_register_dispatch(kOSThermalNotificationPressureLevelName, p_thermalToken, &_dispatch_main_q, v19);
    -[VCPSystemMonitor checkThermalPressure](self, "checkThermalPressure");
    os_log_type_t v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    freeSpaceTimer = self->_freeSpaceTimer;
    self->_freeSpaceTimer = v6;

    uint64_t v9 = self->_freeSpaceTimer;
    if (v9)
    {
      dispatch_source_set_timer((dispatch_source_t)v9, 0LL, 0x45D964B800uLL, 0x6FC23AC00uLL);
      os_log_type_t v10 = self->_freeSpaceTimer;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100125510;
      v18[3] = &unk_1001BA0C8;
      v18[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v10, v18);
      dispatch_resume((dispatch_object_t)self->_freeSpaceTimer);
    }

    else
    {
      uint64_t v11 = MediaAnalysisLogLevel(0LL, v8);
      if ((int)v11 >= 3)
      {
        uint64_t v13 = VCPLogInstance(v11, v12);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        os_log_type_t v15 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v14, v15))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to query free space", v17, 2u);
        }
      }
    }

    if (*p_thermalToken != -1
      && *p_powerToken != -1
      && self->_screenToken != -1
      && self->_chargedToken != -1
      && self->_freeSpaceTimer)
    {
      return 0;
    }

    -[VCPSystemMonitor reset](self, "reset");
    self->_recommendedState = 5LL;
  }

  return -18;
}

- (int)disable
{
  if (self->_thermalToken == -1) {
    return -18;
  }
  -[VCPSystemMonitor reset](self, "reset");
  return 0;
}

- (int64_t)recommendedState
{
  return self->_recommendedState;
}

- (void).cxx_destruct
{
}

@end