void sub_186EB14CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_186EB1660(_Unwind_Exception *a1)
{
}

void sub_186EB17E0(_Unwind_Exception *a1)
{
}

void sub_186EB1960(_Unwind_Exception *a1)
{
}

void sub_186EB1AFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_186EB1C24(_Unwind_Exception *a1)
{
}

void sub_186EB1D8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_186EB2040( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_186EB21EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_186EB23B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_186EB2FA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_186EB31F4(_Unwind_Exception *a1)
{
}
}

void sub_186EB3454( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_186EB35B4(_Unwind_Exception *a1)
{
}

void sub_186EB3AAC(_Unwind_Exception *a1)
{
}

void sub_186EB3B18(_Unwind_Exception *a1)
{
}

void sub_186EB3D20(_Unwind_Exception *a1)
{
}

void sub_186EB4C38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_186EB5934(_Unwind_Exception *a1)
{
}

void sub_186EB5EEC(_Unwind_Exception *a1)
{
}

void sub_186EB60D8(_Unwind_Exception *a1)
{
}

void sub_186EB644C(_Unwind_Exception *a1)
{
}

void sub_186EB7BA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_186EB7D58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EB7F4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void OUTLINED_FUNCTION_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_12:
  return v5;
}

id LA_LOG_laabio()
{
  if (LA_LOG_laabio_once != -1) {
    dispatch_once(&LA_LOG_laabio_once, &__block_literal_global_2);
  }
  return (id)LA_LOG_laabio_log;
}

LABEL_40:
LABEL_41:
  v18 = -[LAAuthenticationBiometricMethod currentState](self, "currentState");
  v19 = [v18 isUserPresent];

  if ((_DWORD)v10 != v19)
  {
    v20 = -[LAAuthenticationBiometricMethod currentState](self, "currentState");
    [v20 setIsUserPresent:v10];

    -[LAAuthenticationBiometricMethod distributeStateChange](self, "distributeStateChange");
  }
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

id LA_LOG()
{
  if (LA_LOG_once != -1) {
    dispatch_once(&LA_LOG_once, &__block_literal_global_3);
  }
  return (id)LA_LOG_log;
}

LABEL_11:
}

void sub_186EBB5F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

void sub_186EBB96C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_186EBBE88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EBBF9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EBC0AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EBC1E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EBC3D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EBC57C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186EBC930(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_2_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_14:
  return v12;
}

  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v14 = __OFADD__(v13, 1LL);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void sub_186EBD858( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_186EBEEB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_186EC0E84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186EC1070( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186EC14BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_186EC1D5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186EC1FE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_186EC2E90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LACopyExternalizedContext(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x18959CB5C]();
  uint64_t v3 = [a1 externalizedContext];
  objc_autoreleasePoolPop(v2);
  return v3;
}

  ;
}

uint64_t _LAMKBLockDevice(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v7 = 0LL;
  *(void *)&v7[8] = v7;
  *(void *)&v7[16] = 0x2020000000LL;
  uint64_t v2 = getMKBLockDeviceSymbolLoc_ptr;
  uint64_t v8 = getMKBLockDeviceSymbolLoc_ptr;
  if (!getMKBLockDeviceSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v3, "MKBLockDevice");
    *(void *)(*(void *)&v7[8] + 24LL) = v2;
    getMKBLockDeviceSymbolLoc_ptr = v2;
  }

  _Block_object_dispose(v7, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v4 = ((uint64_t (*)(uint64_t))v2)(a1);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v7);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)&v7[4] = "_LAMKBLockDevice";
    *(_WORD *)&v7[12] = 2112;
    *(void *)&v7[14] = a1;
    *(_WORD *)&v7[22] = 1024;
    LODWORD(v_Block_object_dispose(va, 8) = v4;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", v7, 0x1Cu);
  }

  return v4;
}

void sub_186EC3CF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBUnlockDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v9 = 0LL;
  *(void *)&v9[8] = v9;
  *(void *)&v9[16] = 0x2020000000LL;
  uint64_t v4 = getMKBUnlockDeviceSymbolLoc_ptr;
  uint64_t v10 = getMKBUnlockDeviceSymbolLoc_ptr;
  if (!getMKBUnlockDeviceSymbolLoc_ptr)
  {
    v5 = (void *)MobileKeyBagLibrary();
    uint64_t v4 = dlsym(v5, "MKBUnlockDevice");
    *(void *)(*(void *)&v9[8] + 24LL) = v4;
    getMKBUnlockDeviceSymbolLoc_ptr = v4;
  }

  _Block_object_dispose(v9, 8);
  if (!v4)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v6 = ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v9);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v9 = 136315650;
    *(void *)&v9[4] = "_LAMKBUnlockDevice";
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = a2;
    *(_WORD *)&v9[22] = 1024;
    LODWORD(v10) = v6;
    _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", v9, 0x1Cu);
  }

  return v6;
}

void sub_186EC3E54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBGetDeviceConfigurations(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v7 = 0LL;
  *(void *)&v7[8] = v7;
  *(void *)&v7[16] = 0x2020000000LL;
  uint64_t v2 = getMKBGetDeviceConfigurationsSymbolLoc_ptr;
  uint64_t v8 = getMKBGetDeviceConfigurationsSymbolLoc_ptr;
  if (!getMKBGetDeviceConfigurationsSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v3, "MKBGetDeviceConfigurations");
    *(void *)(*(void *)&v7[8] + 24LL) = v2;
    getMKBGetDeviceConfigurationsSymbolLoc_ptr = v2;
  }

  _Block_object_dispose(v7, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v4 = ((uint64_t (*)(uint64_t))v2)(a1);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v7);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)&v7[4] = "_LAMKBGetDeviceConfigurations";
    *(_WORD *)&v7[12] = 2112;
    *(void *)&v7[14] = a1;
    *(_WORD *)&v7[22] = 2112;
    uint64_t v8 = (void *)v4;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "%s:options:%@ -> %@", v7, 0x20u);
  }

  return v4;
}

void sub_186EC3FAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBGetDeviceLockState(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v7 = 0LL;
  *(void *)&v7[8] = v7;
  *(void *)&v7[16] = 0x2020000000LL;
  uint64_t v2 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  uint64_t v8 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v3, "MKBGetDeviceLockState");
    *(void *)(*(void *)&v7[8] + 24LL) = v2;
    getMKBGetDeviceLockStateSymbolLoc_ptr = v2;
  }

  _Block_object_dispose(v7, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v4 = ((uint64_t (*)(uint64_t))v2)(a1);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v7);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)&v7[4] = "_LAMKBGetDeviceLockState";
    *(_WORD *)&v7[12] = 2112;
    *(void *)&v7[14] = a1;
    *(_WORD *)&v7[22] = 1024;
    LODWORD(v_Block_object_dispose(&a9, 8) = v4;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", v7, 0x1Cu);
  }

  return v4;
}

void sub_186EC4108( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBGetDeviceLockStateInfo(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v7 = 0LL;
  *(void *)&v7[8] = v7;
  *(void *)&v7[16] = 0x2020000000LL;
  uint64_t v2 = getMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  uint64_t v8 = getMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateInfoSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v3, "MKBGetDeviceLockStateInfo");
    *(void *)(*(void *)&v7[8] + 24LL) = v2;
    getMKBGetDeviceLockStateInfoSymbolLoc_ptr = v2;
  }

  _Block_object_dispose(v7, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v4 = ((uint64_t (*)(uint64_t))v2)(a1);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v7);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)&v7[4] = "_LAMKBGetDeviceLockStateInfo";
    *(_WORD *)&v7[12] = 2112;
    *(void *)&v7[14] = a1;
    *(_WORD *)&v7[22] = 2112;
    uint64_t v8 = (void *)v4;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "%s:options:%@ -> %@", v7, 0x20u);
  }

  return v4;
}

void sub_186EC4260( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBDeviceUnlockedSinceBoot()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v6 = 0LL;
  *(void *)&v6[8] = v6;
  *(void *)&v6[16] = 0x2020000000LL;
  v0 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v7 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    *(void *)(*(void *)&v6[8] + 24LL) = v0;
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = v0;
  }

  _Block_object_dispose(v6, 8);
  if (!v0)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v3 = ((uint64_t (*)(uint64_t))v0)(v2);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v6);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)&v6[4] = "_LAMKBDeviceUnlockedSinceBoot";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = v3;
    _os_log_impl(&dword_186EAF000, v4, OS_LOG_TYPE_INFO, "%s:: -> %d", v6, 0x12u);
  }

  return v3;
}

void sub_186EC43A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBDeviceLockAssertion(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v10 = 0LL;
  *(void *)&v10[8] = v10;
  *(void *)&v10[16] = 0x2020000000LL;
  uint64_t v4 = getMKBDeviceLockAssertionSymbolLoc_ptr;
  uint64_t v11 = getMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!getMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    v5 = (void *)MobileKeyBagLibrary();
    uint64_t v4 = dlsym(v5, "MKBDeviceLockAssertion");
    *(void *)(*(void *)&v10[8] + 24LL) = v4;
    getMKBDeviceLockAssertionSymbolLoc_ptr = v4;
  }

  _Block_object_dispose(v10, 8);
  if (!v4)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v6 = ((uint64_t (*)(uint64_t, uint64_t *))v4)(a1, a2);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v10);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      uint64_t v8 = *a2;
    }
    else {
      uint64_t v8 = 0LL;
    }
    *(_DWORD *)uint64_t v10 = 136315906;
    *(void *)&v10[4] = "_LAMKBDeviceLockAssertion";
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = a1;
    *(_WORD *)&v10[22] = 2112;
    uint64_t v11 = (void *)v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_INFO, "%s:options:%@ -> %@ (%@)", v10, 0x2Au);
  }

  return v6;
}

void sub_186EC4518( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagKeyStashCreateWithOpts(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v14 = 0LL;
  *(void *)&v14[8] = v14;
  *(void *)&v14[16] = 0x2020000000LL;
  uint64_t v8 = getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  *(void *)uint64_t v15 = getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  if (!getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)MobileKeyBagLibrary();
    uint64_t v8 = dlsym(v9, "MKBKeyBagKeyStashCreateWithOpts");
    *(void *)(*(void *)&v14[8] + 24LL) = v8;
    getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr = v8;
  }

  _Block_object_dispose(v14, 8);
  if (!v8)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v14);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = "<...>";
    *(_DWORD *)uint64_t v14 = 136316418;
    *(void *)&v14[4] = "_LAMKBKeyBagKeyStashCreateWithOpts";
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = a1;
    if (!a4) {
      __int16 v12 = "NULL";
    }
    *(_WORD *)&v14[22] = 1024;
    *(_DWORD *)uint64_t v15 = a2;
    *(_WORD *)&v15[4] = 2112;
    *(void *)&v15[6] = a3;
    __int16 v16 = 2080;
    uint64_t v17 = v12;
    __int16 v18 = 1024;
    int v19 = v10;
    _os_log_impl( &dword_186EAF000,  v11,  OS_LOG_TYPE_INFO,  "%s:options:%@ stash_mode:%d ACMRef:%@ passcode:%s -> %d",  v14,  0x36u);
  }

  return v10;
}

void sub_186EC46C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagKeyStashCommit()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v6 = 0LL;
  *(void *)&v6[8] = v6;
  *(void *)&v6[16] = 0x2020000000LL;
  v0 = getMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  uint64_t v7 = getMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  if (!getMKBKeyBagKeyStashCommitSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBKeyBagKeyStashCommit");
    *(void *)(*(void *)&v6[8] + 24LL) = v0;
    getMKBKeyBagKeyStashCommitSymbolLoc_ptr = v0;
  }

  _Block_object_dispose(v6, 8);
  if (!v0)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v3 = ((uint64_t (*)(uint64_t))v0)(v2);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v6);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)&v6[4] = "_LAMKBKeyBagKeyStashCommit";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = v3;
    _os_log_impl(&dword_186EAF000, v4, OS_LOG_TYPE_INFO, "%s:: -> %d", v6, 0x12u);
  }

  return v3;
}

void sub_186EC4808( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagKeyStashVerify()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v6 = 0LL;
  *(void *)&v6[8] = v6;
  *(void *)&v6[16] = 0x2020000000LL;
  v0 = getMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  uint64_t v7 = getMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  if (!getMKBKeyBagKeyStashVerifySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBKeyBagKeyStashVerify");
    *(void *)(*(void *)&v6[8] + 24LL) = v0;
    getMKBKeyBagKeyStashVerifySymbolLoc_ptr = v0;
  }

  _Block_object_dispose(v6, 8);
  if (!v0)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v3 = ((uint64_t (*)(uint64_t))v0)(v2);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v6);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)&v6[4] = "_LAMKBKeyBagKeyStashVerify";
    *(_WORD *)&v6[12] = 2112;
    *(void *)&v6[14] = v3;
    _os_log_impl(&dword_186EAF000, v4, OS_LOG_TYPE_INFO, "%s:: -> %@", v6, 0x16u);
  }

  return v3;
}

void sub_186EC4948( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBEventsRegister(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = ___LAMKBEventsRegister_block_invoke;
  v13[3] = &unk_189F99DE8;
  id v5 = v4;
  id v14 = v5;
  id v6 = v3;
  uint64_t v7 = v13;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  uint64_t v8 = getMKBEventsRegisterSymbolLoc_ptr;
  __int16 v16 = getMKBEventsRegisterSymbolLoc_ptr;
  if (!getMKBEventsRegisterSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)MobileKeyBagLibrary();
    uint64_t v8 = dlsym(v9, "MKBEventsRegister");
    *(void *)(*(void *)&buf[8] + 24LL) = v8;
    getMKBEventsRegisterSymbolLoc_ptr = v8;
  }

  _Block_object_dispose(buf, 8);
  if (!v8)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v10 = ((uint64_t (*)(id, void *))v8)(v6, v7);

  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBEventsRegister";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2048;
    __int16 v16 = (void *)v10;
    _os_log_impl(&dword_186EAF000, v11, OS_LOG_TYPE_INFO, "%s:queue:%@ -> %p", buf, 0x20u);
  }

  return v10;
}

void sub_186EC4B20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void _LAMKBEventsUnregister(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)id v5 = 0LL;
  *(void *)&v5[8] = v5;
  *(void *)&v5[16] = 0x2020000000LL;
  uint64_t v2 = getMKBEventsUnregisterSymbolLoc_ptr;
  id v6 = getMKBEventsUnregisterSymbolLoc_ptr;
  if (!getMKBEventsUnregisterSymbolLoc_ptr)
  {
    id v3 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v3, "MKBEventsUnregister");
    *(void *)(*(void *)&v5[8] + 24LL) = v2;
    getMKBEventsUnregisterSymbolLoc_ptr = v2;
  }

  _Block_object_dispose(v5, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  ((void (*)(uint64_t))v2)(a1);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v5);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v5 = 136315394;
    *(void *)&v5[4] = "_LAMKBEventsUnregister";
    *(_WORD *)&v5[12] = 2048;
    *(void *)&v5[14] = a1;
    _os_log_impl(&dword_186EAF000, v4, OS_LOG_TYPE_INFO, "%s:ref:%p", v5, 0x16u);
  }
}

void sub_186EC4D54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagPerformRecovery(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v10 = 0LL;
  *(void *)&v10[8] = v10;
  *(void *)&v10[16] = 0x2020000000LL;
  id v4 = getMKBKeyBagPerformRecoverySymbolLoc_ptr;
  uint64_t v11 = getMKBKeyBagPerformRecoverySymbolLoc_ptr;
  if (!getMKBKeyBagPerformRecoverySymbolLoc_ptr)
  {
    id v5 = (void *)MobileKeyBagLibrary();
    id v4 = dlsym(v5, "MKBKeyBagPerformRecovery");
    *(void *)(*(void *)&v10[8] + 24LL) = v4;
    getMKBKeyBagPerformRecoverySymbolLoc_ptr = v4;
  }

  _Block_object_dispose(v10, 8);
  if (!v4)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v6 = ((uint64_t (*)(uint64_t, void *))v4)(a1, a2);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v10);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = "<...>";
    *(void *)&v10[4] = "_LAMKBKeyBagPerformRecovery";
    *(_WORD *)&v10[12] = 2080;
    *(_DWORD *)uint64_t v10 = 136315906;
    if (!a1) {
      uint64_t v8 = "NULL";
    }
    *(void *)&v10[14] = v8;
    *(_WORD *)&v10[22] = 2112;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_INFO, "%s:secret:%s option:%@ -> %d", v10, 0x26u);
  }

  return v6;
}

void sub_186EC4EDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBPrewarmSPS(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v7 = 0LL;
  *(void *)&v7[8] = v7;
  *(void *)&v7[16] = 0x2020000000LL;
  uint64_t v2 = getMKBPrewarmSPSSymbolLoc_ptr;
  uint64_t v8 = getMKBPrewarmSPSSymbolLoc_ptr;
  if (!getMKBPrewarmSPSSymbolLoc_ptr)
  {
    id v3 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v3, "MKBPrewarmSPS");
    *(void *)(*(void *)&v7[8] + 24LL) = v2;
    getMKBPrewarmSPSSymbolLoc_ptr = v2;
  }

  _Block_object_dispose(v7, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }

  uint64_t v4 = ((uint64_t (*)(uint64_t))v2)(a1);
  +[_LAMKBLog log](&OBJC_CLASS____LAMKBLog, "log", *(void *)v7);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)&v7[4] = "_LAMKBPrewarmSPS";
    *(_WORD *)&v7[12] = 2112;
    *(void *)&v7[14] = a1;
    *(_WORD *)&v7[22] = 1024;
    LODWORD(v_Block_object_dispose(&a9, 8) = v4;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", v7, 0x1Cu);
  }

  return v4;
}

void sub_186EC5038( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t MobileKeyBagLibrary()
{
  if (!MobileKeyBagLibraryCore_frameworkLibrary) {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileKeyBagLibraryCore_frameworkLibrary;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

CFStringRef NSStringFromLARatchetStateRawValue(unint64_t a1)
{
  if (a1 > 4) {
    return &stru_189F9A2A8;
  }
  else {
    return off_189F99E28[a1];
  }
}

__CFString *NSStringFromLARatchetStateDuration(double a1)
{
  if (*MEMORY[0x189610640] == a1)
  {
    uint64_t v1 = @"INF";
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ds", (int)a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

LABEL_5:
    int v13 = 0;
LABEL_12:

    goto LABEL_13;
  }

  int v13 = 0;
LABEL_13:

  return v13;
}

void sub_186EC6C8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id LA_LOG_0()
{
  if (LA_LOG_once_0 != -1) {
    dispatch_once(&LA_LOG_once_0, &__block_literal_global_171);
  }
  return (id)LA_LOG_log_0;
}

void sub_186EC6EC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_186EC71D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

uint64_t LADomainStateCompanion.availableCompanionTypes.getter()
{
  id v1 = objc_msgSend(v0, sel_availableCompanionTypes);
  sub_186EC7D48();
  sub_186EC8D0C(&qword_18C6ADCA8, (uint64_t (*)(uint64_t))sub_186EC7D48, MEMORY[0x18961BB08]);
  uint64_t v2 = sub_186ECABEC();

  uint64_t v3 = sub_186EC7D84(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_186EC8BB0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_186EC7D48()
{
  unint64_t result = qword_18C6ADCA0;
  if (!qword_18C6ADCA0)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C6ADCA0);
  }

  return result;
}

uint64_t sub_186EC7D84(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    swift_bridgeObjectRetain();
    sub_186ECAC10();
    sub_186EC7D48();
    sub_186EC8D0C(&qword_18C6ADCA8, (uint64_t (*)(uint64_t))sub_186EC7D48, MEMORY[0x18961BB08]);
    uint64_t result = sub_186ECAC04();
    uint64_t v1 = v22;
    uint64_t v21 = v23;
    uint64_t v3 = v24;
    uint64_t v4 = v25;
    unint64_t v5 = v26;
  }

  else
  {
    uint64_t v6 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v21 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0LL;
  }

  int64_t v20 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v9 = MEMORY[0x18961AFE8];
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_29;
    }

    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      break;
    }
    if (v14 >= v20) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v21 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v20) {
        goto LABEL_36;
      }
      unint64_t v15 = *(void *)(v21 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v20) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v21 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v20) {
            goto LABEL_36;
          }
          unint64_t v15 = *(void *)(v21 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v20) {
              goto LABEL_36;
            }
            unint64_t v15 = *(void *)(v21 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v4 + 6;
              while (v20 != v16)
              {
                unint64_t v15 = *(void *)(v21 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }

LABEL_36:
              sub_186EC8CD4();
              return v9;
            }
          }
        }
      }
    }

LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v1 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_36;
    }
    while (1)
    {
      id v17 = objc_msgSend(v13, sel_integerValue);

      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_186EC8AB8(0LL, *(void *)(v9 + 16) + 1LL, 1, (char *)v9);
        uint64_t v9 = result;
      }

      unint64_t v19 = *(void *)(v9 + 16);
      unint64_t v18 = *(void *)(v9 + 24);
      if (v19 >= v18 >> 1)
      {
        uint64_t result = (uint64_t)sub_186EC8AB8((char *)(v18 > 1), v19 + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }

      *(void *)(v9 + 16) = v19 + 1;
      *(void *)(v9 + 8 * v19 + 32) = v17;
      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v1 & 0x8000000000000000LL) == 0) {
        break;
      }
LABEL_10:
      if (sub_186ECAC1C())
      {
        sub_186EC7D48();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v27;
        swift_unknownObjectRelease();
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v27) {
          continue;
        }
      }

      goto LABEL_36;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_186EC80C0()
{
  return sub_186ECAC64();
}

uint64_t sub_186EC8104()
{
  return sub_186ECAC58();
}

uint64_t sub_186EC812C()
{
  return sub_186ECAC64();
}

BOOL sub_186EC816C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_186EC8180@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

void sub_186EC8190(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_186EC819C(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_186ECAC4C();
  sub_186ECAC58();
  uint64_t v6 = sub_186ECAC64();
  uint64_t v7 = -1LL << *(_BYTE *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000LL;
    sub_186EC8560(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1LL;
    goto LABEL_8;
  }

  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }

    while (*(void *)(v9 + 8 * v8) != a2);
  }

  uint64_t result = 0LL;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_186EC82B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C6ADCB8);
  uint64_t result = sub_186ECAC34();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0LL;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1LL << *(_BYTE *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }

      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1LL))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }

        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1LL << *(_BYTE *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v6 = -1LL << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0LL;
                break;
              }

              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1LL)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }

              int64_t v5 = v17;
            }
          }
        }

LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }

      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_186ECAC4C();
      sub_186ECAC58();
      uint64_t result = sub_186ECAC64();
      uint64_t v19 = -1LL << *(_BYTE *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1LL << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1LL << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }

          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0LL;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }

        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }

      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }

  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_186ECAC4C();
    sub_186ECAC58();
    uint64_t result = sub_186ECAC64();
    uint64_t v19 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1LL << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }

        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0LL;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }

      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }

    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }

  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }

  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }

uint64_t sub_186EC8560(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if ((a3 & 1) != 0)
  {
    sub_186EC82B8();
  }

  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_186EC86AC();
      goto LABEL_14;
    }

    sub_186EC8840();
  }

  uint64_t v8 = *v3;
  sub_186ECAC4C();
  sub_186ECAC58();
  uint64_t result = sub_186ECAC64();
  uint64_t v9 = -1LL << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for LACompanionType();
      uint64_t result = sub_186ECAC40();
      __break(1u);
    }

    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }

void *sub_186EC86AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C6ADCB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_186ECAC28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_186EC8840()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C6ADCB8);
  uint64_t result = sub_186ECAC34();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }

  int64_t v5 = 0LL;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1LL << *(_BYTE *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }

    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }

    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }

LABEL_37:
  __break(1u);
  return result;
}

char *sub_186EC8AB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C6ADCC0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }

  else
  {
    int64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 8 * v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_186EC8BB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for LACompanionType();
  sub_186EC8D0C( &qword_18C6ADCB0,  (uint64_t (*)(uint64_t))type metadata accessor for LACompanionType,  (uint64_t)&unk_186ECCCDC);
  uint64_t result = sub_186ECABF8();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_186EC819C(&v6, v5);
      --v2;
    }

    while (v2);
    return v7;
  }

  return result;
}

void type metadata accessor for LACompanionType()
{
  if (!qword_18C6ADCC8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C6ADCC8);
    }
  }

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x18959CEA4]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_186EC8CD4()
{
  return swift_release();
}

uint64_t sub_186EC8CE0()
{
  return sub_186EC8D0C( &qword_18C6ADCD0,  (uint64_t (*)(uint64_t))type metadata accessor for LACompanionType,  (uint64_t)&unk_186ECCC74);
}

uint64_t sub_186EC8D0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x18959CEB0](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_186EC8D4C()
{
  return MEMORY[0x189602300];
}

uint64_t sub_186EC8D58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_186ECABE0();
  *a1 = result;
  return result;
}

unint64_t sub_186EC8D94()
{
  unint64_t result = qword_18C6ADCD8;
  if (!qword_18C6ADCD8)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C6ADCD8);
  }

  return result;
}

BOOL LAUpdateAccessControl(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x18959CB5C]();
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  if (v4)
  {
    [v4 objectForKeyedSubscript:&unk_189FA1058];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v6;
    if (v6 && [v6 count])
    {
      SecAccessControlGetConstraints();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        [MEMORY[0x189603FC8] dictionaryWithDictionary:v8];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __LAUpdateAccessControl_block_invoke;
        v13[3] = &unk_189F9A020;
        id v14 = v8;
        unint64_t v16 = &v17;
        id v10 = v9;
        id v15 = v10;
        [v7 enumerateKeysAndObjectsUsingBlock:v13];
        if (!v18[3]) {
          SecAccessControlSetConstraints();
        }
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v11 = v18[3];
  if (a3)
  {
    *a3 = v11;
  }

  else if (v11)
  {
    CFRelease((CFTypeRef)v18[3]);
  }

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v5);

  return v11 == 0;
}

void sub_186EC8F64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __LAUpdateAccessControl_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v14 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(void *)(a1 + 32))
  {
    uint64_t v11 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v12 = @"Invalid update request.";
LABEL_9:
    makeCFError(v12, -1000LL, v11);
    *a4 = 1;
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = objc_opt_class();
    if (v13 == objc_opt_class())
    {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v14];
      goto LABEL_10;
    }

    uint64_t v11 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v12 = @"Invalid update value type.";
    goto LABEL_9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v12 = @"Invalid update value type, expecting dictionary.";
    goto LABEL_9;
  }

  [MEMORY[0x189603FC8] dictionaryWithDictionary:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __LAUpdateAccessControl_block_invoke_2;
  v15[3] = &unk_189F99FF8;
  id v16 = v9;
  id v10 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v15];
  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v14];

LABEL_10:
}

void makeCFError(void *a1, uint64_t a2, uint64_t *a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x189607490];
    v11[0] = a1;
    uint64_t v6 = (void *)MEMORY[0x189603F68];
    id v7 = a1;
    [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v5 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:a2 userInfo:v8];

    *a3 = v9;
  }

uint64_t __LAUpdateAccessControl_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

BOOL LAEvaluateAndUpdateACL(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (void *)MEMORY[0x18959CB5C]();
  LA_LOG_coreauthd_client();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v25 = 138412802;
    *(void *)&v25[4] = a1;
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = a3;
    __int16 v26 = 2112;
    uint64_t v27 = a4;
    _os_log_impl(&dword_186EAF000, v13, OS_LOG_TYPE_DEFAULT, "LAEvaluateAndUpdateACL(%@, %@, %@)", v25, 0x20u);
  }

  LAContextFromCFType(a1, a6);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a1) {
    goto LABEL_13;
  }
  CFTypeID v15 = CFGetTypeID(a3);
  if (v15 != CFStringGetTypeID())
  {
    unint64_t v21 = @"Invalid operation type.";
LABEL_12:
    makeCFError(v21, -1006LL, a6);
LABEL_13:
    BOOL v20 = 0LL;
    goto LABEL_14;
  }

  if (!a2)
  {
    unint64_t v21 = @"Invalid 'ACL' argument.";
    goto LABEL_12;
  }

  id v16 = (void *)SecAccessControlCreateFromData();
  if (v16)
  {
    *(void *)uint64_t v25 = 0LL;
    [v14 evaluateAccessControl:v16 aksOperation:a3 options:a4 error:v25];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = *(id *)v25;
    uint64_t v19 = v18;
    BOOL v20 = v17 != 0LL;
    if (v17)
    {
      if (a5) {
        *a5 = SecAccessControlCopyData();
      }
    }

    else if (a6)
    {
      *a6 = (uint64_t)v18;
    }
  }

  else
  {
    makeCFError(@"Invalid 'ACL' argument.", -1006LL, a6);
    BOOL v20 = 0LL;
  }

LABEL_14:
  LA_LOG_coreauthd_client();
  char v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (a6) {
      uint64_t v23 = *a6;
    }
    else {
      uint64_t v23 = 0LL;
    }
    *(_DWORD *)uint64_t v25 = 67109378;
    *(_DWORD *)&v25[4] = v20;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v23;
    _os_log_impl(&dword_186EAF000, v22, OS_LOG_TYPE_DEFAULT, "LAEvaluateAndUpdateACL -> %d, %@", v25, 0x12u);
  }

  objc_autoreleasePoolPop(v12);
  return v20;
}

id LA_LOG_coreauthd_client()
{
  if (LA_LOG_coreauthd_client_once != -1) {
    dispatch_once(&LA_LOG_coreauthd_client_once, &__block_literal_global_7);
  }
  return (id)LA_LOG_coreauthd_client_log;
}

uint64_t LAEvaluatePolicy(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x18959CB5C]();
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __LAEvaluatePolicy_block_invoke;
  block[3] = &unk_189F9A048;
  int v12 = a2;
  block[6] = a3;
  block[7] = a4;
  block[4] = &v13;
  block[5] = a1;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  uint64_t v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v8);
  return v9;
}

void __LAEvaluatePolicy_block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)LACopyResultOfPolicyEvaluation( *(void **)(a1 + 40),  *(_DWORD *)(a1 + 64),  *(void *)(a1 + 48),  *(uint64_t **)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v2 != 0LL;
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t LACopyResultOfPolicyEvaluation(void *a1, int a2, uint64_t a3, uint64_t *a4)
{
  *(void *)&v20[13] = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)MEMORY[0x18959CB5C]();
  LA_LOG_coreauthd_client();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v18 = 138412802;
    *(void *)&v18[4] = a1;
    __int16 v19 = 1024;
    *(_DWORD *)BOOL v20 = a2;
    v20[2] = 2112;
    *(void *)&v20[3] = a3;
    _os_log_impl(&dword_186EAF000, v9, OS_LOG_TYPE_DEFAULT, "LACopyResultOfPolicyEvaluation(%@, %d, %@)", v18, 0x1Cu);
  }

  LAContextFromCFType(a1, a4);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (v10)
  {
    *(void *)id v18 = 0LL;
    uint64_t v12 = [v10 evaluatePolicy:a2 options:a3 error:v18];
    id v13 = *(id *)v18;
    id v14 = v13;
    if (a4 && !v12) {
      *a4 = (uint64_t)v13;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  LA_LOG_coreauthd_client();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      uint64_t v16 = *a4;
    }
    else {
      uint64_t v16 = 0LL;
    }
    *(_DWORD *)id v18 = 138412546;
    *(void *)&v18[4] = v12;
    __int16 v19 = 2112;
    *(void *)BOOL v20 = v16;
    _os_log_impl(&dword_186EAF000, v15, OS_LOG_TYPE_DEFAULT, "LACopyResultOfPolicyEvaluation -> %@, %@", v18, 0x16u);
  }

  objc_autoreleasePoolPop(v8);
  return v12;
}

uint64_t LASetCredential(void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v8 = (void *)MEMORY[0x18959CB5C]();
  LAContextFromCFType(a1, a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 setCredential:a2 type:a3];

  objc_autoreleasePoolPop(v8);
  return v10;
}

id LAContextFromCFType(void *a1, uint64_t *a2)
{
  id v3 = a1;
  if (v3 && (getLAContextClass(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
  }

  else
  {
    makeCFError(@"Invalid 'context' argument.", -1006LL, a2);
    id v4 = 0LL;
  }

  return v4;
}

uint64_t LAIsCredentialSet(void *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = (void *)MEMORY[0x18959CB5C]();
  LAContextFromCFType(a1, a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 isCredentialSet:a2];

  objc_autoreleasePoolPop(v6);
  return v8;
}

uint64_t LACreateNewContextWithACMContext(void *a1, uint64_t *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x18959CB5C]();
  id v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LA_LOG_coreauthd_client();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      LACreateNewContextWithACMContext_cold_1(v10);
    }

    makeCFError(@"Invalid acmContext.", -1006LL, a2);
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v6 = [objc_alloc((Class)getLAContextClass()) initWithExternalizedContext:v5];
    uint64_t v7 = v6;
    if (a2 && !v6)
    {
      uint64_t v8 = (void *)MEMORY[0x189607870];
      uint64_t v12 = *MEMORY[0x189607490];
      v13[0] = @"Failed to create LAContext";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      *a2 = [v8 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:-1000 userInfo:v9];
    }
  }

  objc_autoreleasePoolPop(v4);
  return v7;
}

id getLAContextClass()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)getLAContextClass_softClass;
  uint64_t v7 = getLAContextClass_softClass;
  if (!getLAContextClass_softClass)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getLAContextClass_block_invoke;
    v3[3] = &unk_189F9A090;
    v3[4] = &v4;
    __getLAContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_186EC9ACC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t LACopyACMContext(void *a1, uint64_t *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)MEMORY[0x18959CB5C]();
  LAContextFromCFType(a1, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v7 = [v5 externalizedContext];
  uint64_t v8 = v7;
  if (a2 && !v7)
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x189607490];
    v13[0] = @"Failed to get externalized context from LAContext";
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    *a2 = [v9 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:-1000 userInfo:v10];

LABEL_5:
    uint64_t v8 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

BOOL LAEvaluateACL(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = (void *)MEMORY[0x18959CB5C]();
  BOOL updated = LAEvaluateAndUpdateACL(a1, a2, a3, a4, 0LL, a5);
  objc_autoreleasePoolPop(v10);
  return updated;
}

uint64_t LACreateNewContextWithACMContextInSession(int a1, uint64_t a2, uint64_t *a3)
{
  v13[1] = *MEMORY[0x1895F89C0];
  int v11 = a1;
  id v5 = (void *)MEMORY[0x18959CB5C]();
  uint64_t v6 = [objc_alloc((Class)getLAContextClass()) initWithExternalizedContext:a2 userSession:&v11];
  uint64_t v7 = v6;
  if (a3 && !v6)
  {
    uint64_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x189607490];
    v13[0] = @"Failed to create LAContext";
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = [v8 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:-1000 userInfo:v9];
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }

  while (1)
  {
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_6:
    __getLAContextClass_block_invoke_cold_1();
    free(v3);
  }

  getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void LACreateNewContextWithACMContext_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_186EAF000, log, OS_LOG_TYPE_ERROR, "Invalid acmContext", v1, 2u);
}

void __getLAContextClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  -[LAEnvironment _registerDarwinNotification].cold.1(v0, v1);
}

uint64_t _LAMKBLockDevice_cold_1()
{
  int v0 = abort_report_np();
  return -[LANotification _appActivityChanged:].cold.1(v0, v1, v2);
}

uint64_t sub_186ECABE0()
{
  return MEMORY[0x1896022D0]();
}

uint64_t sub_186ECABEC()
{
  return MEMORY[0x189607248]();
}

uint64_t sub_186ECABF8()
{
  return MEMORY[0x189618668]();
}

uint64_t sub_186ECAC04()
{
  return MEMORY[0x1896186A8]();
}

uint64_t sub_186ECAC10()
{
  return MEMORY[0x189619058]();
}

uint64_t sub_186ECAC1C()
{
  return MEMORY[0x189619098]();
}

uint64_t sub_186ECAC28()
{
  return MEMORY[0x189619188]();
}

uint64_t sub_186ECAC34()
{
  return MEMORY[0x189619190]();
}

uint64_t sub_186ECAC40()
{
  return MEMORY[0x18961A398]();
}

uint64_t sub_186ECAC4C()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_186ECAC58()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_186ECAC64()
{
  return MEMORY[0x18961A6C0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

void CFNotificationCenterPostNotification( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t LACLogEnvironment()
{
  return MEMORY[0x1896106A8]();
}

uint64_t LALogCategoryForOptions()
{
  return MEMORY[0x189608768]();
}

uint64_t LALogCategoryForPolicy()
{
  return MEMORY[0x189608770]();
}

uint64_t LALogForCategory()
{
  return MEMORY[0x189608778]();
}

uint64_t LALogForPolicy()
{
  return MEMORY[0x189608780]();
}

uint64_t LALogSetProcessCategory()
{
  return MEMORY[0x189608788]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x18960B1B0]();
}

uint64_t SecAccessControlCreateFromData()
{
  return MEMORY[0x18960B1C0]();
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x18960B1D8]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x18960B208]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler_);
}

uint64_t objc_msgSend_connectToContextWithUUID_callback_clientId_token_senderAuditTokenData_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_connectToContextWithUUID_callback_clientId_token_senderAuditTokenData_reply_);
}