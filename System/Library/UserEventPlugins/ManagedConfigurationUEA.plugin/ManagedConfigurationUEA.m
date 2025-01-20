}

void sub_2208()
{
  v0 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_DEFAULT, "Lock status changed.", buf, 2u);
  }

  int v1 = MKBGetDeviceLockState(0LL);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  unsigned int v3 = [v2 effectiveRestrictedBoolForSetting:MCFeaturePasscodeRequired];

  if (v1 == 3 || !v1)
  {
    dispatch_time_t v4 = dispatch_time(0LL, 800000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_2794;
    block[3] = &unk_41B0;
    BOOL v6 = v3 == 1;
    dispatch_after(v4, &_dispatch_main_q, block);
  }

LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection",  *(void *)v15));
    [v14 checkCarrierProfile];

    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)_MCLogObjects[3], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v15 = 138543362;
    *(void *)&v15[4] = v7;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "MCUEA-CT: Ignoring SIM notification with status: %{public}@",  v15,  0xCu);
  }

LABEL_11:
}

void *UserEventAgentFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFCu,  0x86u,  0x41u,  0x6Du,  0x61u,  0x64u,  0x20u,  0x70u,  0x72u,  0x6Fu,  0x70u,  0x73u,  0x5Cu,  0x21u,  0x6Eu,  0xC0u);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFBu,  0x86u,  0x41u,  0x6Du,  0x61u,  0x64u,  0x20u,  0x70u,  0x72u,  0x6Fu,  0x70u,  0x73u,  0x5Cu,  0x21u,  0x6Eu,  0xC0u);
  v5 = malloc(0x20uLL);
  void *v5 = &unk_4F18;
  v5[3] = objc_alloc_init(&OBJC_CLASS___MCUEAPlugin);
  if (v4)
  {
    v5[1] = CFRetain(v4);
    CFPlugInAddInstanceForFactory(v4);
  }

  *((_DWORD *)v5 + 4) = 1;
  return v5;
}

void sub_2794(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
  {
    int v1 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v1 notifyDeviceUnlockedAndPasscodeRequired];
  }

  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 notifyDeviceUnlocked];
}

uint64_t sub_27F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v8 = (os_log_s *)_MCLogObjects[3];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Querying interface", buf, 2u);
  }

  *(void *)&v15.byte0 = a2;
  *(void *)&v15.byte8 = a3;
  CFUUIDRef v9 = CFUUIDCreateFromUUIDBytes(0LL, v15);
  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFDu,  0x86u,  0x41u,  0x6Du,  0x61u,  0x64u,  0x20u,  0x70u,  0x72u,  0x6Fu,  0x70u,  0x73u,  0x5Cu,  0x21u,  0x6Eu,  0xC0u);
  if (CFEqual(v9, v10)
    || (CFUUIDRef v11 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u),  CFEqual(v9, v11)))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
    uint64_t v12 = 0LL;
  }

  else
  {
    a1 = 0LL;
    uint64_t v12 = 2147483652LL;
  }

  *a4 = a1;
  CFRelease(v9);
  return v12;
}

uint64_t sub_2958(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_296C(_DWORD *a1)
{
  int v1 = a1[4];
  uint64_t v2 = (v1 - 1);
  a1[4] = v2;
  if (v1 == 1)
  {
    CFUUIDRef v4 = (const void *)*((void *)a1 + 3);
    if (v4) {
      CFRelease(v4);
    }
    v5 = (const __CFUUID *)*((void *)a1 + 1);
    free(a1);
    if (v5)
    {
      CFPlugInRemoveInstanceForFactory(v5);
      CFRelease(v5);
    }
  }

  return v2;
}

void sub_29D0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 24) install];
  objc_autoreleasePoolPop(v2);
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}