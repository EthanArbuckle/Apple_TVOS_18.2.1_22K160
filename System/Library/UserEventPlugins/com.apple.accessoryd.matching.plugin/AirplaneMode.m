@interface AirplaneMode
- (AirplaneMode)init;
- (BOOL)airplaneMode;
- (BOOL)initComplete;
- (RadiosPreferences)radiosPreferences;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)init;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setInitComplete:(BOOL)a3;
- (void)setRadiosPreferences:(id)a3;
@end

@implementation AirplaneMode

- (AirplaneMode)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AirplaneMode;
  v2 = -[AirplaneMode init](&v16, "init");
  if (v2)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 3;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init].cold.2();
      }
      v5 = (os_log_s *)&_os_log_default;
      id v4 = &_os_log_default;
    }

    else
    {
      v5 = (os_log_s *)*(id *)(gLogObjects + 16);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AirplaneMode init].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    v2->_initComplete = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __20__AirplaneMode_init__block_invoke;
    block[3] = &unk_14CB0;
    v15 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v2;
}

id __20__AirplaneMode_init__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___RadiosPreferences);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
  *(_BYTE *)(*(void *)(a1 + 32) + 8) = [*(id *)(*(void *)(a1 + 32) + 16) airplaneMode];
  if (gLogObjects && gNumLogObjects >= 3)
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8LL);
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Init RadiosPreferences: airplaneMode = %d", (uint8_t *)v9, 8u);
  }

  return [*(id *)(a1 + 32) airplaneModeChanged];
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL airplaneMode = self->_airplaneMode;
    *(_DWORD *)buf = 67109120;
    BOOL v10 = airplaneMode;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Dealloc RadiosPreferences: BOOL airplaneMode = %d", buf, 8u);
  }

  -[RadiosPreferences setDelegate:](self->_radiosPreferences, "setDelegate:", 0LL);
  radiosPreferences = self->_radiosPreferences;
  self->_radiosPreferences = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AirplaneMode;
  -[AirplaneMode dealloc](&v8, "dealloc");
}

- (void)airplaneModeChanged
{
  unsigned int v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL airplaneMode = self->_airplaneMode;
    v9[0] = 67109376;
    v9[1] = airplaneMode;
    __int16 v10 = 1024;
    unsigned int v11 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "BOOL airplaneMode = %d -> %d", (uint8_t *)v9, 0xEu);
  }

  self->_BOOL airplaneMode = v3;
  self->_initComplete = 1;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:ueaPluginSystemSettingsAirplaneModeChanged object:0];
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_BOOL airplaneMode = a3;
}

- (BOOL)initComplete
{
  return self->_initComplete;
}

- (void)setInitComplete:(BOOL)a3
{
  self->_initComplete = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

@end