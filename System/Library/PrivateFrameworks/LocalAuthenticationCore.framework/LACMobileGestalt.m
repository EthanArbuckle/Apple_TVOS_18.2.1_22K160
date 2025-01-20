@interface LACMobileGestalt
+ (BOOL)deviceHasFaceID;
+ (BOOL)deviceHasOpticID;
+ (BOOL)deviceHasTouchID;
+ (BOOL)hasBridge;
+ (BOOL)isAppleSilicon;
+ (BOOL)isDaytona;
+ (BOOL)isGibraltar;
+ (BOOL)isIdiomPad;
+ (BOOL)isIdiomPhone;
+ (BOOL)isSharedIPad;
+ (BOOL)isVirtualMachine;
+ (id)marketingDeviceFamilyName;
+ (id)marketingDeviceName;
+ (id)serialNumber;
+ (int)_deviceClass;
+ (unint64_t)currentDeviceScreenSize;
+ (unint64_t)faceIDCameraOrientation;
+ (void)faceIDCameraOrientation;
@end

@implementation LACMobileGestalt

+ (unint64_t)currentDeviceScreenSize
{
  unsigned int v2 = MGGetSInt32Answer() - 3;
  if (v2 > 0x16) {
    return 14LL;
  }
  else {
    return qword_1892B3E80[v2];
  }
}

+ (BOOL)isIdiomPad
{
  return 0;
}

+ (BOOL)isIdiomPhone
{
  return 0;
}

+ (int)_deviceClass
{
  if (_deviceClass_onceToken != -1) {
    dispatch_once(&_deviceClass_onceToken, &__block_literal_global_9);
  }
  return _deviceClass_deviceClass;
}

uint64_t __32__LACMobileGestalt__deviceClass__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _deviceClass_deviceClass = result;
  return result;
}

+ (BOOL)deviceHasFaceID
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (deviceHasFaceID_onceToken != -1) {
    dispatch_once(&deviceHasFaceID_onceToken, &__block_literal_global_4_0);
  }
  LACLogGestalt();
  unsigned int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceHasFaceID_hasPearl;
    _os_log_impl(&dword_189219000, v2, OS_LOG_TYPE_INFO, "deviceHasPearl returned %d", (uint8_t *)v4, 8u);
  }

  return deviceHasFaceID_hasPearl;
}

void __35__LACMobileGestalt_deviceHasFaceID__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceHasFaceID_hasPearl = MGGetBoolAnswer();
  }

  else
  {
    LACLogGestalt();
    v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __35__LACMobileGestalt_deviceHasFaceID__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

+ (BOOL)deviceHasOpticID
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (deviceHasOpticID_onceToken != -1) {
    dispatch_once(&deviceHasOpticID_onceToken, &__block_literal_global_7_0);
  }
  LACLogGestalt();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "+[LACMobileGestalt deviceHasOpticID]";
    __int16 v6 = 1024;
    int v7 = deviceHasOpticID_hasOyster;
    _os_log_impl(&dword_189219000, v2, OS_LOG_TYPE_INFO, "%s returned %d", (uint8_t *)&v4, 0x12u);
  }

  return deviceHasOpticID_hasOyster;
}

void __36__LACMobileGestalt_deviceHasOpticID__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceHasOpticID_hasOyster = MGGetBoolAnswer();
  }

  else
  {
    LACLogGestalt();
    v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __36__LACMobileGestalt_deviceHasOpticID__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

+ (BOOL)deviceHasTouchID
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (deviceHasTouchID_onceToken != -1) {
    dispatch_once(&deviceHasTouchID_onceToken, &__block_literal_global_10_0);
  }
  LACLogGestalt();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceHasTouchID_hasTouchID;
    _os_log_impl(&dword_189219000, v2, OS_LOG_TYPE_INFO, "deviceHasTouchID returned %d", (uint8_t *)v4, 8u);
  }

  return deviceHasTouchID_hasTouchID;
}

void __36__LACMobileGestalt_deviceHasTouchID__block_invoke()
{
  if (MGIsQuestionValid())
  {
    deviceHasTouchID_hasTouchID = MGGetBoolAnswer();
  }

  else
  {
    LACLogGestalt();
    v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __36__LACMobileGestalt_deviceHasTouchID__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

+ (BOOL)isAppleSilicon
{
  return 0;
}

+ (BOOL)isDaytona
{
  return 0;
}

+ (BOOL)isGibraltar
{
  return 0;
}

+ (BOOL)isSharedIPad
{
  return 0;
}

+ (BOOL)isVirtualMachine
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasBridge
{
  return 0;
}

+ (id)marketingDeviceName
{
  return (id)MGCopyAnswer();
}

+ (id)marketingDeviceFamilyName
{
  return (id)MGCopyAnswer();
}

+ (id)serialNumber
{
  return (id)MGCopyAnswer();
}

+ (unint64_t)faceIDCameraOrientation
{
  int v2 = MGGetSInt32Answer();
  LACLogGestalt();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[LACMobileGestalt faceIDCameraOrientation].cold.1(v2, v3);
  }

  if (v2) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

void __35__LACMobileGestalt_deviceHasFaceID__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __36__LACMobileGestalt_deviceHasOpticID__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __36__LACMobileGestalt_deviceHasTouchID__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)faceIDCameraOrientation
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_189219000, a2, OS_LOG_TYPE_DEBUG, "camera rotation: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_1();
}

@end