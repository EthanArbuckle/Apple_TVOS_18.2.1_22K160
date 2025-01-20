id BuiltinAudioFactory(uint64_t a1, const void *a2)
{
  void *v3;
  os_log_s *v4;
  CFUUIDRef v5;
  void *v6;
  id v7;
  uint8_t buf[16];
  v3 = BuiltinLogType();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BuiltinAudioFactory factory for AudioServerPlugin", buf, 2u);
  }

  v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
  if (!CFEqual(a2, v5)) {
    return 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BuiltinAudioPlugin sharedPlugin](&OBJC_CLASS___BuiltinAudioPlugin, "sharedPlugin"));
  v7 = [v6 driverRef];

  return v7;
}

void *BuiltinLogType()
{
  if (qword_8150 != -1) {
    dispatch_once(&qword_8150, &stru_4170);
  }
  return off_8148;
}

void sub_3524(id a1)
{
  os_log_t v1 = os_log_create("com.apple.audio.ASDT", "Builtin");
  if (v1) {
    off_8148 = v1;
  }
}

void sub_35C8(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_8158;
  qword_8158 = (uint64_t)v1;
}

void sub_378C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_37C0()
{
  context = objc_autoreleasePoolPush();
  uint64_t v0 = kASDTConfigKeySubclass;
  uint64_t v1 = kASDTConfigKeyDeviceUID;
  uint64_t v12 = kASDTConfigKeySubclass;
  uint64_t v13 = kASDTConfigKeyDeviceUID;
  v20 = @"ASDTIOA2Device";
  v21 = @"HPMic";
  uint64_t v2 = kASDTConfigKeyDeviceCanBeDefaultInput;
  uint64_t v3 = kASDTConfigKeyDeviceCanBeDefaultSystem;
  uint64_t v14 = kASDTConfigKeyDeviceCanBeDefaultInput;
  uint64_t v15 = kASDTConfigKeyDeviceCanBeDefaultSystem;
  v22 = &__kCFBooleanTrue;
  v23 = &__kCFBooleanTrue;
  uint64_t v4 = kASDTIOA2ConfigKeyExclavesInputBufferName;
  uint64_t v5 = kASDTIOA2ConfigKeyExclavesInjectionBufferName;
  uint64_t v16 = kASDTIOA2ConfigKeyExclavesInputBufferName;
  uint64_t v17 = kASDTIOA2ConfigKeyExclavesInjectionBufferName;
  v24 = @"com.apple.audio.mic";
  v25 = @"com.apple.inbound_buffer.hpmic_injection";
  v26 = &off_42E0;
  uint64_t v6 = kASDTIOA2ConfigKeyIsolatedInputUseCaseID;
  uint64_t v18 = kASDTIOA2ConfigKeyIsolatedInputUseCaseID;
  uint64_t v19 = kASDTConfigKeyDeviceCustomProperties;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ASDTExclavesSensorAutomaticProperty config]( &OBJC_CLASS___ASDTExclavesSensorAutomaticProperty,  "config"));
  v11[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ASDTExclavesStatusProperty configForMic](&OBJC_CLASS___ASDTExclavesStatusProperty, "configForMic"));
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v27 = v9;
  qword_8168 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v12,  8LL));

  uint64_t v12 = v0;
  uint64_t v13 = v1;
  v20 = @"ASDTIOA2Device";
  v21 = @"HP16Mic";
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  v22 = &__kCFBooleanFalse;
  v23 = &__kCFBooleanFalse;
  uint64_t v16 = v4;
  uint64_t v17 = v5;
  v24 = @"com.apple.audio.lpmic";
  v25 = @"com.apple.inbound_buffer.hpmic16_injection";
  uint64_t v18 = v6;
  v26 = &off_42F8;
  qword_8170 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v12,  7LL));
  objc_autoreleasePoolPop(context);
}

void sub_39E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id objc_msgSend_sharedPlugin(void *a1, const char *a2, ...)
{
  return [a1 sharedPlugin];
}