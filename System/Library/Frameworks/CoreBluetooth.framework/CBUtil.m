@interface CBUtil
+ (BOOL)isAppleVID:(unsigned __int16)a3 forVIDSrc:(unsigned __int8)a4;
+ (BOOL)isDeviceSupported:(id)a3;
+ (BOOL)isDeviceSupportedOnWatchOS:(id)a3;
+ (BOOL)isDeviceSupportedOnXROS:(id)a3;
+ (BOOL)isDeviceSupportedWithType:(unsigned __int8)a3 VIDsrc:(unsigned __int8)a4 VID:(unsigned __int16)a5 PID:(unsigned __int16)a6;
+ (BOOL)isInternalBuild;
+ (BOOL)isWatchOS;
+ (BOOL)isXROS;
+ (id)decodeApplePayloadByteStream:(id)a3;
+ (id)encodeApplePayloadByteStream:(id)a3;
+ (id)getBluetoothDebugSettingString:(__CFString *)a3 InKey:(__CFString *)a4;
+ (id)preSSPPairingCodeToString:(int64_t)a3;
+ (int64_t)preSSPStringToPairingCode:(id)a3;
+ (void)setBluetoothDebugSetting:(__CFString *)a3 InKey:(__CFString *)a4 InValue:(void *)a5;
@end

@implementation CBUtil

+ (BOOL)isAppleVID:(unsigned __int16)a3 forVIDSrc:(unsigned __int8)a4
{
  if (a4 == 2) {
    int v4 = 1452;
  }
  else {
    int v4 = 76;
  }
  return v4 == a3;
}

+ (BOOL)isWatchOS
{
  return 0;
}

+ (BOOL)isXROS
{
  return 0;
}

+ (BOOL)isDeviceSupportedOnXROS:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  int v4 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
    __int16 v27 = 2112;
    *(void *)v28 = v3;
    _os_log_impl(&dword_186F9B000, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v25, 0x16u);
  }

  [v3 valueForKey:@"DeviceType"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = [v5 unsignedCharValue];

  [v3 valueForKey:@"VendorIDSrc"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedCharValue];

  [v3 valueForKey:@"VendorID"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 unsignedShortValue];

  [v3 valueForKey:@"ProductID"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 unsignedShortValue];

  if (v8 >= 3)
  {
    if (CBLogInitOnce == -1)
    {
      v13 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
LABEL_22:
      +[CBUtil isDeviceSupportedOnXROS:].cold.1(v8, v13);
      if (+[CBUtil isAppleVID:forVIDSrc:](&OBJC_CLASS___CBUtil, "isAppleVID:forVIDSrc:", v10, v8)) {
        goto LABEL_9;
      }
LABEL_23:
      if (v6 - 16 < 5 && ((0x1Bu >> (v6 - 16)) & 1) != 0) {
        goto LABEL_29;
      }
      if (CBLogInitOnce == -1)
      {
        uint64_t v23 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
      }

      else
      {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        uint64_t v23 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
      }

      int v25 = 136446210;
      v26 = "+[CBUtil isDeviceSupportedOnXROS:]";
      v20 = "%{public}s - Third party non-audio device - APPROVED";
      v21 = (os_log_s *)v23;
      uint32_t v22 = 12;
      goto LABEL_28;
    }

    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    v13 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
  }

+ (BOOL)isDeviceSupportedOnWatchOS:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  int v4 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    __int16 v23 = 2112;
    *(void *)v24 = v3;
    _os_log_impl(&dword_186F9B000, v4, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v21, 0x16u);
  }

  [v3 valueForKey:@"DeviceType"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 unsignedCharValue];

  [v3 valueForKey:@"VendorIDSrc"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedCharValue];

  [v3 valueForKey:@"VendorID"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 unsignedShortValue];

  [v3 valueForKey:@"ProductID"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 unsignedShortValue];

  if (v6 == 24)
  {
    if (+[CBUtil isAppleVID:forVIDSrc:](&OBJC_CLASS___CBUtil, "isAppleVID:forVIDSrc:", v10, v8))
    {
      [MEMORY[0x189607968] numberWithUnsignedShort:v12];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [&unk_189FD6518 containsObject:v15];

      if (CBLogInitOnce == -1)
      {
        v16 = (os_log_s *)CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
      }

      else
      {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        v16 = (os_log_s *)CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
      }

      v17 = "REJECTED";
      uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
      __int16 v23 = 1024;
      int v21 = 136446978;
      *(_DWORD *)v24 = v12;
      if (v14) {
        v17 = "APPROVED";
      }
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = &unk_189FD6518;
      __int16 v25 = 2082;
      v26 = v17;
      _os_log_impl( &dword_186F9B000,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s - Apple keyboard - checking PID 0x%04X against approved list %@ ->%{public}s",  (uint8_t *)&v21,  0x26u);
      goto LABEL_24;
    }

    if (CBLogInitOnce == -1)
    {
      char v18 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      char v18 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
    }

    int v21 = 136446210;
    uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
    uint64_t v19 = "%{public}s - Third party keyboard - APPROVED";
    goto LABEL_22;
  }

  if (v6 != 25)
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      char v18 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }

    char v18 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      int v21 = 136446210;
      uint32_t v22 = "+[CBUtil isDeviceSupportedOnWatchOS:]";
      uint64_t v19 = "%{public}s - Not a mouse or a keyboard - APPROVED";
LABEL_22:
      _os_log_impl(&dword_186F9B000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v21, 0xCu);
    }

+ (BOOL)isDeviceSupportedWithType:(unsigned __int8)a3 VIDsrc:(unsigned __int8)a4 VID:(unsigned __int16)a5 PID:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  v16[4] = *MEMORY[0x1895F89C0];
  v15[0] = @"DeviceType";
  [MEMORY[0x189607968] numberWithUnsignedChar:a3];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = @"VendorIDSrc";
  [MEMORY[0x189607968] numberWithUnsignedChar:v8];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = @"VendorID";
  [MEMORY[0x189607968] numberWithUnsignedShort:v7];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v15[3] = @"ProductID";
  [MEMORY[0x189607968] numberWithUnsignedShort:v6];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = +[CBUtil isDeviceSupported:](&OBJC_CLASS___CBUtil, "isDeviceSupported:", v13);

  return v6;
}

+ (BOOL)isDeviceSupported:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  int v4 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "+[CBUtil isDeviceSupported:]";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_186F9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (+[CBUtil isWatchOS](&OBJC_CLASS___CBUtil, "isWatchOS"))
  {
    BOOL v5 = +[CBUtil isDeviceSupportedOnWatchOS:](&OBJC_CLASS___CBUtil, "isDeviceSupportedOnWatchOS:", v3);
  }

  else
  {
    if (!+[CBUtil isXROS](&OBJC_CLASS___CBUtil, "isXROS"))
    {
      BOOL v6 = 1;
      goto LABEL_11;
    }

    BOOL v5 = +[CBUtil isDeviceSupportedOnXROS:](&OBJC_CLASS___CBUtil, "isDeviceSupportedOnXROS:", v3);
  }

  BOOL v6 = v5;
LABEL_11:

  return v6;
}

+ (int64_t)preSSPStringToPairingCode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = [v3 dataUsingEncoding:4];
  [v4 bytes];
  [v4 length];
  __memcpy_chk();
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  BOOL v5 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v8 = "+[CBUtil preSSPStringToPairingCode:]";
    __int16 v9 = 2114;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = 0LL;
    _os_log_impl( &dword_186F9B000,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s - str:%{public}@ -> pairingcode:0x%016llX",  buf,  0x20u);
  }

  return 0LL;
}

+ (id)preSSPPairingCodeToString:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int64_t v6 = a3;
  [NSString stringWithUTF8String:&v6];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v4 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v8 = "+[CBUtil preSSPPairingCodeToString:]";
    __int16 v9 = 2048;
    int64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v3;
    _os_log_impl( &dword_186F9B000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s - pairingcode:0x%016llX -> str:%{public}@",  buf,  0x20u);
  }

  return v3;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_diagnostics();
}

+ (void)setBluetoothDebugSetting:(__CFString *)a3 InKey:(__CFString *)a4 InValue:(void *)a5
{
  int v8 = (const __CFDictionary *)CFPreferencesCopyAppValue(a3, @"com.apple.MobileBluetooth.debug");
  if (v8)
  {
    __int16 v9 = v8;
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v8);
    CFRelease(v9);
    Mutable = MutableCopy;
    uint64_t v12 = a4;
    if (a5)
    {
LABEL_3:
      CFDictionarySetValue(Mutable, v12, a5);
      goto LABEL_6;
    }
  }

  else
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFMutableDictionaryRef MutableCopy = Mutable;
    uint64_t v12 = a4;
    if (a5) {
      goto LABEL_3;
    }
  }

  CFDictionaryRemoveValue(Mutable, v12);
  if (!CFDictionaryGetCount(MutableCopy))
  {
    CFRelease(MutableCopy);
    CFPreferencesSetAppValue(a3, 0LL, @"com.apple.MobileBluetooth.debug");
    return;
  }

+ (id)getBluetoothDebugSettingString:(__CFString *)a3 InKey:(__CFString *)a4
{
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (const __CFDictionary *)CFPreferencesCopyAppValue(a3, @"com.apple.MobileBluetooth.debug");
  if (v7)
  {
    int v8 = v7;
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v7);
    if (a4)
    {
      Value = (void *)CFDictionaryGetValue(MutableCopy, a4);
      if (Value)
      {
        id v11 = Value;

        CFRelease(v11);
        int64_t v6 = v11;
      }
    }

    CFRelease(v8);
  }

  return v6;
}

+ (id)decodeApplePayloadByteStream:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  if ((unint64_t)[v5 length] < 3)
  {
LABEL_8:
    id v12 = v4;
    goto LABEL_19;
  }

  unint64_t v7 = 2LL;
  int v8 = 2;
  while (1)
  {
    if (*(_BYTE *)(v6 + v7) != 100) {
      goto LABEL_3;
    }
    if ([v5 length] - 1 <= v7) {
      break;
    }
    uint64_t v9 = v8 + v6;
    int v10 = *(unsigned __int8 *)(v9 + 1);
    if (!*(_BYTE *)(v9 + 1))
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      uint64_t v13 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v14 = buf;
        goto LABEL_17;
      }

      goto LABEL_18;
    }

    [MEMORY[0x189603F48] dataWithBytes:v9 + 2 length:*(unsigned __int8 *)(v9 + 1)];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKeyedSubscript:&unk_189FD5CF8];

    v8 += v10;
LABEL_3:
    unint64_t v7 = ++v8;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  uint64_t v13 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = 0;
    int v14 = (uint8_t *)&v16;
LABEL_17:
    _os_log_impl( &dword_186F9B000,  v13,  OS_LOG_TYPE_DEFAULT,  "decodeApplePayloadByteStream failed to decode payload",  v14,  2u);
  }

+ (id)encodeApplePayloadByteStream:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int16 v20 = 76;
  [MEMORY[0x189603FB8] dataWithBytes:&v20 length:2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 == v8)
        {
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        }

        else
        {
          objc_enumerationMutation(v5);
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        }

        [v5 objectForKeyedSubscript:v10];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        id v12 = v11;
        if (v11 && [v11 length])
        {
          char v15 = 100;
          char v14 = 0;
          char v14 = [v12 length];
          [v4 appendBytes:&v15 length:1];
          [v4 appendBytes:&v14 length:1];
          [v4 appendData:v12];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (void)isDeviceSupportedOnXROS:(int)a1 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_186F9B000,  a2,  OS_LOG_TYPE_ERROR,  "API MISUSE: CBUtil isDeviceSupported - invalid value provided for vendorIdSrc:%d (assuming CBVendorIDSourceBluetooth)",  (uint8_t *)v2,  8u);
}

@end