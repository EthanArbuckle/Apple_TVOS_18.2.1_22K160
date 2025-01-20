void sub_100004170(int a1, int a2)
{
  char *v4;
  CFStringRef v5;
  CFNumberRef v6;
  CFTypeID v7;
  CFTypeID v8;
  CFRange v9;
  CFTypeID v10;
  CFIndex Length;
  UInt8 buffer[8];
  uint64_t v13;
  if (os_variant_has_internal_content(""))
  {
    dword_100028BE0 = a1;
    if (a1) {
      goto LABEL_16;
    }
    if (a2) {
      v4 = "safe-oblit-sim-fail";
    }
    else {
      v4 = "oblit-sim-fail";
    }
    v5 = sub_100010A24(v4, 1);
    if (v5)
    {
      v6 = (const __CFNumber *)v5;
      v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberIntType, &dword_100028BE0);
      }

      else
      {
        v8 = CFGetTypeID(v6);
        if (v8 == CFDataGetTypeID())
        {
          *(void *)buffer = 0LL;
          v13 = 0LL;
          else {
            v9.length = CFDataGetLength(v6);
          }
          v9.location = 0LL;
          CFDataGetBytes(v6, v9, buffer);
          dword_100028BE0 = strtoul((const char *)buffer, 0LL, 0);
        }
      }

      v10 = CFGetTypeID(v6);
      Length = CFDataGetLength(v6);
      sub_10000444C( 1,  "%s: Found %s set in NVRAM (type: %lu, size: %ld)\n",  "obliteration_sim_failure_setup",  "oblit-sim-fail",  v10,  Length);
      CFRelease(v6);
    }

    a1 = dword_100028BE0;
    if (dword_100028BE0) {
LABEL_16:
    }
      sub_10000444C(1, "%s: Set simulated failure location to 0x%x", "obliteration_sim_failure_setup", a1);
  }
}

uint64_t sub_100004300(int a1, const char *a2)
{
  unsigned int has_internal_content = os_variant_has_internal_content("");
  if (dword_100028BE0 == a1) {
    uint64_t v5 = has_internal_content;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if ((_DWORD)v5 == 1) {
    sub_10000444C(1, "%s: Simulating failure at location 0x%x (%s)\n", "obliteration_sim_failure_should_fail", a1, a2);
  }
  return v5;
}

const char *sub_100004378(int a1)
{
  result = aPrivateVarHard;
  switch(a1)
  {
    case 0:
      int v4 = byte_100028D00;
      uint64_t v5 = "/private/var";
      v6 = "/private/var/tmp/alt_root/private/var";
      goto LABEL_7;
    case 1:
      int v4 = byte_100028D00;
      uint64_t v5 = "/private/var/mobile";
      v6 = "/private/var/tmp/alt_root/private/var/mobile";
      goto LABEL_7;
    case 2:
      return result;
    case 3:
      return "/private/var/tmp";
    case 4:
      int v4 = byte_100028D00;
      uint64_t v5 = "/";
      v6 = "/private/var/tmp/alt_root";
LABEL_7:
      if (v4) {
        result = v6;
      }
      else {
        result = v5;
      }
      break;
    default:
      sub_10000444C(1, "%s: ☠️ =====>>> Error: Invalid path request (%d) <<<===== ☠️", "getCurrentPath", a1);
      result = "/private/var";
      break;
  }

  return result;
}

void sub_10000444C(int a1, char *__format, ...)
{
  if (!__format) {
    return;
  }
  if (byte_100028D18 != 1)
  {
    v6 = CFStringCreateWithCString(kCFAllocatorDefault, __format, 0x8000100u);
    if (!v6) {
      return;
    }
    v7 = v6;
    uint64_t v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v6, va);
    CFRelease(v7);
    if (!v5) {
      return;
    }
LABEL_10:
    sub_10000637C(v5, 1u, a1);
    CFRelease(v5);
    return;
  }

  int v3 = vsnprintf((char *)__str, 0x400uLL, __format, va);
  if (v3)
  {
    CFIndex v4 = v3;
    if (v3 <= 0x3FF)
    {
      __str[v3] = 10;
      CFIndex v4 = v3 + 1LL;
    }

    uint64_t v5 = CFStringCreateWithBytes(kCFAllocatorDefault, __str, v4, 0x8000100u, 0);
    if (v5) {
      goto LABEL_10;
    }
  }

uint64_t sub_100004590(int a1, char *__s1, const char *a3)
{
  if (__s1)
  {
    size_t v6 = strnlen(__s1, 0x100uLL) + 1;
    if (a3)
    {
LABEL_3:
      size_t v7 = strnlen(a3, 0x100uLL);
      goto LABEL_6;
    }
  }

  else
  {
    size_t v6 = 1LL;
    if (a3) {
      goto LABEL_3;
    }
  }

  size_t v7 = 0LL;
LABEL_6:
  v8 = sub_100004378(a1);
  size_t v9 = strlen(v8);
  if (v6 + v7 + v9 >= 0x101) {
    sub_10000444C( 1,  "%s: ☠️ =====>>> Error: path too long (%zu > %d) and WILL BE TRUNCATED <<<===== ☠️",  "setGlobalPath",  v6 + v7 + v9,  256);
  }
  v10 = "";
  if (__s1) {
    v11 = __s1;
  }
  else {
    v11 = "";
  }
  if (a3) {
    v10 = a3;
  }
  return snprintf(byte_100028BF8, 0x100uLL, "%s%s%s", v8, v11, v10);
}

uint64_t start(int a1, uint64_t a2)
{
  byte_100028BE9 = sub_1000117AC();
  int v4 = sub_1000116AC();
  dword_1000286C0 = open("/dev/console", 9);
  byte_100028D01 = sub_100010310();
  if (a1 == 2 && !strcmp(*(const char **)(a2 + 8), "--init"))
  {
    fwrite("Obliterator: In INIT check\n", 0x1BuLL, 1uLL, __stderrp);
    int v9 = sub_100004A7C(0, 0LL);
    if ((v9 & 1) != 0)
    {
      if (!v4)
      {
        fwrite( "Obliterator: Obliteration terminated improperly, continuing obliteration...\n",  0x4CuLL,  1uLL,  __stderrp);
        int v9 = 0;
        goto LABEL_18;
      }
    }

    else
    {
      if (!v4)
      {
        fwrite("Obliterator: No obliteration needed, continue booting, returning 0\n", 0x43uLL, 1uLL, __stderrp);
        goto LABEL_35;
      }

      sub_100004BA0();
    }

    fwrite("Obliterator: Running in ephemeral data mode, initiating obliteration...\n", 0x48uLL, 1uLL, __stderrp);
LABEL_18:
    close(0);
    if (open("/dev/null", 2) == -1)
    {
      v10 = "failed to open stdin devnull\n";
      size_t v11 = 29LL;
    }

    else
    {
      v10 = "*** STDIN set with devnull ***\n";
      size_t v11 = 31LL;
    }

    fwrite(v10, v11, 1uLL, __stderrp);
    sub_100004170(0, 1);
    uint64_t v12 = sub_100004D8C();
    uint64_t v13 = v12;
    if ((_DWORD)v12 != 89 && (_DWORD)v12)
    {
      CFStringRef v23 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Safe Obliteration failed with [gF: 0x%016llX] Attempt: %ld",  qword_100028BF0,  qword_100028D08 + 1);
      if (v23)
      {
        CFStringRef v24 = v23;
        sub_100011138("oblit-failure", v23);
        CFRelease(v24);
      }

      sub_10000444C(0, "%s: Safe Obliteration failed, returning %d", "main", v13);
    }

    else
    {
      size_t v14 = sub_100006284("oblit-begins", __big, 0x100u);
      if (v14)
      {
        size_t v16 = v14;
        v17 = strnstr(__big, "Caller: ", v14);
        unint64_t v18 = v16 - 8;
        if (!v17) {
          unint64_t v18 = v16;
        }
        v15 = &__big[8 * (v17 != 0LL)];
        if (v18 >= 0xC1)
        {
          uint64_t v19 = 199LL;
          if (!v17) {
            uint64_t v19 = 191LL;
          }
          __big[v19] = 0;
        }
      }

      else
      {
        v15 = 0LL;
      }

      time_t v20 = time(0LL);
      v21 = "<unknown>";
      if (v15) {
        v21 = v15;
      }
      v22 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"SafeOblit done @%ld, Err:%d, By:%s",  v20,  v13,  v21);
      sub_10000637C(v22, 0, 1);
      sub_1000115C0(@"oblit-begins");
      sub_1000115C0(@"oblit-failure");
      if (((v9 | v4 ^ 1) & 1) == 0) {
LABEL_35:
      }
        exit(0);
    }

    if (sub_1000103B0())
    {
      sub_100004590(0, 0LL, "/log/obliteration.log");
      sub_1000107A4((uint64_t)byte_100028BF8, (uint64_t)sub_100010414);
      sub_1000105BC();
    }

    exit(v13);
  }

  sub_10000444C(1, "%s: mobile_obliterator - XPC version started", "main");
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobile.obliterator", 0LL);
  if (v5)
  {
    size_t v6 = v5;
    uint64_t v7 = qword_100028D10;
    if (qword_100028D10 || (uint64_t v7 = MOXPCTransportOpen("com.apple.mobile.obliteration", 1LL), (qword_100028D10 = v7) != 0))
    {
      MOXPCTransportSetMessageHandler(v7, v6, &stru_100024B70);
      dispatch_release(v6);
      MOXPCTransportResume(qword_100028D10);
      dispatch_main();
    }

    sub_10000444C(1, "%s: Unable to start server");
  }

  else
  {
    sub_10000444C(1, "%s: Can't create dispatch resources.");
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100004A7C(int a1, uint64_t *a2)
{
  uint32_t size = 255;
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v4)
  {
    sub_10000444C(0, "%s: IORegistryEntryFromPath failed");
    return 0LL;
  }

  memset(_20, 0, 255);
  if (IORegistryEntryGetProperty(v4, "oblit-inprogress", _20, &size))
  {
    sub_10000444C(0, "%s: IORegistryEntryGetProperty failed, may be does not exist");
    return 0LL;
  }

  uint64_t result = 1LL;
  if (a2)
  {
    if (a1)
    {
      *a2 = strtol(_20, &__endptr, 10);
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_100004BA0()
{
  kern_return_t v6;
  mach_port_t mainPort;
  char __str[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  sub_10000444C(1, "%s: Marking NVRAM Obliteration in Progress", "setOblitNVRAMkey");
  if (!sub_100004A7C(0, 0LL))
  {
    size_t v11 = 0u;
    uint64_t v12 = 0u;
    *(_OWORD *)__str = 0u;
    v10 = 0u;
    snprintf(__str, 0x40uLL, "%d", 0);
    v1 = CFStringCreateWithCString(0LL, "oblit-inprogress", 0x8000100u);
    if (IOMainPort(bootstrap_port, &mainPort))
    {
      sub_10000444C(1, "%s: Could not get main port\n");
    }

    else
    {
      io_registry_entry_t v2 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
      if (v2)
      {
        io_registry_entry_t v3 = v2;
        CFStringRef v4 = CFStringCreateWithCString(0LL, __str, 0x8000100u);
        if (v4)
        {
          CFStringRef v5 = v4;
          size_t v6 = IORegistryEntrySetCFProperty(v3, v1, v4);
          if (v6)
          {
            sub_10000444C(1, "%s: Could not save value:%08x\n", "setOblitNVRAMkey", v6);
            uint64_t v0 = 0xFFFFFFFFLL;
          }

          else
          {
            sub_100010E04(v3, "0");
            uint64_t v0 = 0LL;
          }

          sub_10000444C(1, "%s: NVRamSyncNow", "setOblitNVRAMkey");
          CFRelease(v5);
        }

        else
        {
          sub_10000444C(1, "%s: Could not create string for value\n", "setOblitNVRAMkey");
          uint64_t v0 = 0xFFFFFFFFLL;
        }

        IOObjectRelease(v3);
        goto LABEL_15;
      }

      sub_10000444C(1, "%s: Could not get options entry from the device tree\n");
    }

    uint64_t v0 = 0xFFFFFFFFLL;
LABEL_15:
    CFRelease(v1);
    return v0;
  }

  sub_10000444C(1, "%s: Already marked the start of progress, returning", "setOblitNVRAMkey");
  return 0LL;
}

uint64_t sub_100004D8C()
{
  __int128 v84 = 0u;
  __int128 v83 = 0u;
  __int128 v82 = 0u;
  *(_OWORD *)__s = 0u;
  memset(v80, 0, sizeof(v80));
  char v78 = 0;
  int v0 = sub_1000116AC();
  char v77 = 0;
  sub_10000444C(1, "%s: safeObliterate: Starting", "safeObliterate");
  if ((v0 & 1) != 0) {
    goto LABEL_32;
  }
  size_t v1 = sub_100006284("oblit-failure", (char *)&xmmword_100028DE0, 0x180u);
  if (v1)
  {
    size_t v2 = v1;
    io_registry_entry_t v3 = strnstr((const char *)&xmmword_100028DE0, "[gF: 0x", v1);
    if (v3)
    {
      unint64_t v4 = strtoull(v3 + 7, 0LL, 16);
      sub_10000444C(1, "%s: Safe Obliteration previous gFailure is 0x%016llX", "safeOblitCheckLoop", v4);
    }

    else
    {
      unint64_t v4 = 0LL;
    }

    size_t v6 = strnstr((const char *)&xmmword_100028DE0, "Attempt: ", v2);
    if (v6)
    {
      uint64_t v7 = strtol(v6 + 9, 0LL, 10);
      uint64_t v8 = v7;
      if (v7)
      {
        sub_10000444C(1, "%s: Safe Obliteration previous finish count in nvram is %ld", "safeOblitCheckLoop", v7);
        if (v8 >= 1) {
          qword_100028D08 = v8;
        }
      }

      uint64_t v5 = v8 & ~(v8 >> 63);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    unint64_t v4 = 0LL;
  }

  uint64_t v9 = sub_100006284("oblit-begins", (char *)&xmmword_100028DE0, 0x160u);
  if (v9)
  {
    v10 = strnstr((const char *)&xmmword_100028DE0, "Attempt: ", v9);
    if (v10)
    {
      size_t v11 = v10 + 9;
      uint64_t v12 = strtol(v10 + 9, 0LL, 10);
      if (v12)
      {
        uint64_t v13 = v12;
        sub_10000444C(1, "%s: Safe Obliteration previous start count in nvram is %ld", "safeOblitCheckLoop", v12);
        if (v13 > 0)
        {
          if ((unint64_t)v13 > 0xA)
          {
            size_t v14 = "no";
            if ((v4 & 0x8650100000165600LL) == 0) {
              size_t v14 = "yes";
            }
            sub_10000444C(1, "%s: Too many failures (try boot: %s)", "safeObliterate", v14);
            if ((v4 & 0x8650100000165600LL) == 0)
            {
              sub_10000444C( 0,  "%s: Skipping safe attempt, returning 0 to try normal boot (also clearing NVRAM Key indicating obliteration should run)",  "safeObliterate");
              sub_10000444C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
              sub_1000115C0(@"oblit-inprogress");
              return 0LL;
            }

            goto LABEL_30;
          }

          goto LABEL_28;
        }
      }
    }
  }

  if ((unint64_t)(v5 - 1) > 3)
  {
    uint64_t v5 = 1LL;
    sub_10000444C(1, "%s: Overriding all safe obliteration previous count values to 1", "safeOblitCheckLoop");
    qword_100028D08 = 1LL;
    if (v9) {
      goto LABEL_24;
    }
LABEL_26:
    strcpy((char *)&xmmword_100028DE0, "No info for unknown MO type, Attempt: ");
    uint64_t v9 = &stru_100000020.cmdsize + 2;
    goto LABEL_27;
  }

  sub_10000444C(1, "%s: Overriding safe obliteration previous start count to %ld", "safeOblitCheckLoop", v5);
  if (!v9) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v9 = v9 - 1 + snprintf((char *)&xmmword_100028DE0 + v9 - 1, 353 - v9, ", Attempt: ");
LABEL_27:
  size_t v11 = (char *)&xmmword_100028DE0 + v9;
  uint64_t v13 = v5;
LABEL_28:
  if (v13 - v5 >= 5)
  {
    sub_10000444C(1, "%s: Too many failures (try boot: %s)", "safeObliterate", "no");
LABEL_30:
    sub_100010C78("auto-boot", "false");
    sub_10000444C(0, "%s: Skipping safe attempt, returning EACCES to go into recovery (set 'auto-boot' to false)");
    return 13LL;
  }

  snprintf(v11, 384 - v9, "%lu", v13 + 1);
  sub_100010C78("oblit-begins", (const char *)&xmmword_100028DE0);
  sub_10000444C(1, "%s: safeOblitCheckLoop() passed, attempting safe-obliterate", "safeObliterate");
LABEL_32:
  if (sub_100004300(16, "safeObliterate"))
  {
    sub_10000444C(1, "%s: Simulating safeObliterate failure at start");
    return 13LL;
  }

  BOOL v16 = sub_10000AD94();
  if (v16) {
    sub_10000444C(1, "%s: safeObliterate: Device is in multiuser mode", "safeObliterate");
  }
  if (byte_100028D00) {
    v17 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    v17 = "/private/var";
  }
  v76 = (char *)v17;
  unint64_t v18 = getfsfile(v17);
  if (v18 && (uint64_t v19 = v18, (sub_100004300(17, "safeObliterate") & 1) == 0))
  {
    __strlcpy_chk(__s, v19->fs_spec, 64LL, 64LL);
  }

  else
  {
    sub_10000444C(1, "%s: safeObliterate: Failed getfsfile, manually creating data volume device", "safeObliterate");
    *__error() = 0;
    if (statfs("/", &v79) || sub_100004300(17, "safeObliterate"))
    {
      time_t v20 = __error();
      sub_10000444C(1, "%s: safeObliterate: Failed statfs of /, error: %d", "safeObliterate", *v20);
    }

    else
    {
      f_mntfromname = v79.f_mntfromname;
      do
      {
        v22 = f_mntfromname;
        CFStringRef v23 = strchr(f_mntfromname, 64);
        f_mntfromname = v23 + 1;
      }

      while (v23);
      __strlcpy_chk(__s, v22, 64LL, 64LL);
      __s[strlen(__s) - 1] = 50;
      sub_10000444C(1, "%s: safeObliterate: Using data volume device: %s", "safeObliterate", __s);
    }
  }

  sub_10000444C(1, "%s: safeObliterate(): XXXXXXXXXXXXX SKIPPING RAMROD SETUP XXXXXXXXXXXXX ", "safeObliterate");
  sub_10000444C(1, "%s: safeObliterate: Checking if Data volume exists", "safeObliterate");
  CFStringRef v24 = sub_10000E338();
  v25 = &DiskSupport__metaData;
  if (!v24)
  {
    sub_10000444C(1, "%s: Unable to find any APFS Volume in IORegistry, bailing", "data_volume_exists");
LABEL_59:
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x10000);
    sub_10000444C( 1,  "%s: safeObliterate: Could not find Data volume, will skip deletion but drop keys before creating new volume",  "safeObliterate");
    int v31 = 0;
    goto LABEL_60;
  }

  v26 = v24;
  int Count = CFArrayGetCount(v24);
  if (!Count)
  {
    sub_10000444C(1, "%s: APFS Volume list is empty, bailing");
    goto LABEL_58;
  }

  sub_10000444C(1, "%s: Obtained List of APFS volumes", "data_volume_exists");
  CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, __s, 0x8000100u);
  if (!v28)
  {
    sub_10000444C(1, "%s: Could not create String from f_mntfromname, bailing");
    goto LABEL_58;
  }

  if (Count <= 0)
  {
LABEL_58:
    CFRelease(v26);
    goto LABEL_59;
  }

  v29 = v28;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v26, 0LL);
  if (CFStringFind(v29, ValueAtIndex, 0x40uLL).location == -1)
  {
    CFIndex v75 = Count;
    uint64_t v66 = Count;
    CFIndex v67 = 1LL;
    while (v66 != v67)
    {
      v68 = (const __CFString *)CFArrayGetValueAtIndex(v26, v67++);
      if (CFStringFind(v29, v68, 0x40uLL).location != -1)
      {
        int v31 = 1;
        sub_10000444C(1, "%s: Found existing Data volume", "data_volume_exists");
        CFRelease(v26);
        v25 = &DiskSupport__metaData;
        if (v67 - 1 >= v75) {
          goto LABEL_59;
        }
        goto LABEL_60;
      }
    }

    CFRelease(v26);
    v25 = &DiskSupport__metaData;
    if (v67 >= v75) {
      goto LABEL_59;
    }
    int v31 = 1;
  }

  else
  {
    int v31 = 1;
    sub_10000444C(1, "%s: Found existing Data volume", "data_volume_exists");
    CFRelease(v26);
  }

LABEL_60:
  if ((v0 & 1) == 0)
  {
    if (byte_100028BE9)
    {
      sub_10000444C(1, "%s: safeObliterate: Skipping the Disable of the watchdog timer", "safeObliterate");
    }

    else
    {
      sub_10000444C(1, "%s: safeObliterate: Disabling the watchdog timer", "safeObliterate");
      sub_10000DDA0();
    }
  }

  sub_10000AEBC(__s, v85);
  sub_10000444C(1, "%s: safeObliterate: Using container device name: %s", "safeObliterate", v85);
  sub_10000444C(1, "%s: safeObliterate: Obliterating the Data volume", "safeObliterate");
  if (sub_10000AFD0(v85, __s, v31, v16, &v78))
  {
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x20000);
    sub_10000444C(1, "%s: safeObliterate: Could not obliterate the Data volume", "safeObliterate");
    if (!v78)
    {
      sub_10000444C(1, "%s: safeObliterate: failed to wipe volume keys, failing safe obliteration");
      return 13LL;
    }
  }

  sub_10000444C(1, "%s: safeObliterate: Reformatting the Data volume in container %s", "safeObliterate", v85);
  if (v16)
  {
    sub_10000444C(1, "%s: safeObliterate: Reformatting the User volume in container %s", "safeObliterate", v85);
  }

  if (!__s[0])
  {
    v32 = getfsfile(v76);
    if (v32)
    {
      __strlcpy_chk(__s, v32->fs_spec, 64LL, 64LL);
      sub_10000444C(1, "%s: safeObliterate: Using data volume device: %s", "safeObliterate", __s);
    }

    else
    {
      sub_10000444C(1, "%s: safeObliterate: Failed second getfsfile, this is really bad", "safeObliterate");
      v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x2000000000000LL);
    }
  }

  sub_10000444C(1, "%s: safeObliterate: Setting up Data volume content", "safeObliterate");
  v33 = sub_10000BA70(0LL, 0);
  v34 = v33;
  if (v33)
  {
    sub_10000F23C((uint64_t)v33);
  }

  else
  {
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x80000);
    sub_10000444C(1, "%s: safeObliterate: Failed to set up detault content on the new Data volume", "safeObliterate");
  }

  byte_100028D00 = 1;
  sub_10000BBEC("/private/var/tmp");
  if (byte_100028D00) {
    v35 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    v35 = "/private/var";
  }
  int v36 = mkpath_np(v35, 0x1EDu);
  if (v36)
  {
    int v37 = v36;
    if (v36 != 17)
    {
      v38 = strerror(v36);
      sub_10000444C( 1,  "%s: safeObliterate: Could not create the Data volume path %s, error %d (%s)",  "safeObliterate",  v35,  v37,  v38);
    }
  }

  sub_10000444C(1, "%s: safeObliterate: Remounting the Data volume %s at %s", "safeObliterate", __s, v35);
  if (sub_10000BCE4(__s, v35))
  {
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x100000);
    sub_10000444C(1, "%s: safeObliterate: Could not remount the Data volume", "safeObliterate");
  }

  if (v16)
  {
    sub_10000444C(1, "%s: safeObliterate: Setting up UM/AKS for the new Data volume", "safeObliterate");
    if (sub_10000BDA0(__s, v35, v80, 0))
    {
      v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x100000000000000LL);
      sub_10000444C( 1,  "%s: safeObliterate: Failed to set up the data and user volumes in multiuser mode",  "safeObliterate");
    }
  }

  sub_10000444C(1, "%s: safeObliterate: Re-creating overprovisioning file", "safeObliterate");
  if (sub_10000C5D8(v39))
  {
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x200000);
    sub_10000444C(1, "%s: safeObliterate: Could not re-create overprovisioning file", "safeObliterate");
  }

  sub_10000444C(1, "%s: safeObliterate: Creating mobile path", "safeObliterate");
  sub_10000FBC8();
  if (byte_100028D00) {
    v40 = "/private/var/tmp/alt_root/private/var/mobile";
  }
  else {
    v40 = "/private/var/mobile";
  }
  if (v16)
  {
    sub_10000444C(1, "%s: safeObliterate: Remounting the User volume %s at %s", "safeObliterate", v80, v40);
    if (sub_10000BCE4(v80, v40))
    {
      v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x400000000000000LL);
      sub_10000444C(1, "%s: safeObliterate: Could not remount the User volume", "safeObliterate");
    }

    sub_10000444C(1, "%s: safeObliterate: Rebuilding the Data volume", "safeObliterate");
    sub_10000ECF8((uint64_t)v34);
    sub_10000444C(1, "%s: safeObliterate: Populating USER volume with mastered content", "safeObliterate");
    if (sub_10000CD78((uint64_t)v40))
    {
      v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x800000000000000LL);
      sub_10000444C( 0,  "%s: safeObliterate: Failed to create and set up a user volume for multiuser mode",  "safeObliterate");
    }
  }

  else
  {
    sub_10000444C(1, "%s: safeObliterate: Rebuilding the Data volume", "safeObliterate");
    sub_10000ECF8((uint64_t)v34);
  }

  v41 = &DiskSupport__metaData;
  if (!v0)
  {
    memset(&v79, 0, 144);
    sub_100004590(2, "/.obliteration_preserved", "/");
    sub_10000444C(1, "%s: Examining '%s' for files to recover", "copy_preserved_files_from_storage", byte_100028BF8);
    if (stat(byte_100028BF8, (stat *)&v79) || (v79.f_iosize & 0xF000) != 0x4000)
    {
      sub_10000444C(1, "%s: No files to recover");
    }

    else
    {
      if (byte_100028D00) {
        v50 = "/private/var/tmp/alt_root/private/var";
      }
      else {
        v50 = "/private/var";
      }
      if (copyfile(byte_100028BF8, v50, 0LL, 0x800Fu))
      {
        v51 = __error();
        strerror(*v51);
        sub_10000444C(1, "%s: Could not copy files from temporary location '%s', error: %s");
      }

      else
      {
        sub_10000444C(1, "%s: Successfully copied files from the temporary location '%s'");
      }
    }

    sub_10000D160();
    goto LABEL_126;
  }

  if (!byte_100028D01 || (sub_10000EF88("epdm_skip_preboot_cleanup=1") & 1) == 0)
  {
    sub_10000444C(1, "%s: safeObliterate: Cleaning Preboot volume", "safeObliterate");
    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v42)
    {
      v43 = v42;
      sub_10000E818();
      int v44 = open("/private/preboot/active", 0);
      if (v44 == -1)
      {
        v52 = __error();
        v53 = strerror(*v52);
        sub_10000444C(1, "%s: Failed to open /private/preboot/active: %s", "epdm_fixup_preboot", v53);
        __error();
      }

      else
      {
        int v45 = v44;
        off_t v46 = lseek(v44, 0LL, 2);
        if (v46 != -1
          && (size_t v47 = v46, (v48 = (char *)malloc(v46 + 1)) != 0LL)
          && (v49 = v48, v47 == pread(v45, v48, v47, 0LL)))
        {
          v49[v47] = 0;
          sub_10000444C(1, "%s: Found '/private/preboot/active' to point to '%s'", "epdm_fixup_preboot", v49);
          -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", @"remove", off_1000286C8);
          -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", @"keep", @"DarwinInitCache");
          -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", @"keep", @"active");
          -[NSMutableDictionary setObject:forKey:]( v43,  "setObject:forKey:",  @"removeExcept /apticket.der/ /com.apple.factorydata/",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/System/Library/Caches",  v49));
          -[NSMutableDictionary setObject:forKey:]( v43,  "setObject:forKey:",  @"removeExcept /kernelcache/",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/System/Library/Caches/com.apple.kernelcaches",  v49));
          -[NSMutableDictionary setObject:forKey:]( v43,  "setObject:forKey:",  @"removeExcept /devicetree.img4/ /root_hash.img4/ /sep-firmware.img4/",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/usr/standalone/firmware",  v49));
          -[NSMutableDictionary setObject:forKey:]( v43,  "setObject:forKey:",  @"removeExcept /(ANE|GFX|PMP|SIO|StaticTrustCache|iBootData|Ap,(ANE1|RestoreTMU|SecurePageTableMonitor|TrustedExecutionMonitor))\\.img4/",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/usr/standalone/firmware/FUD",  v49));
          -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  @"/private/preboot",  v43);

          free(v49);
        }

        else
        {
          sub_10000444C(1, "%s: Failed to read /private/preboot/active");
        }
      }
    }

    else
    {
      sub_10000444C(1, "%s: Could not create exceptions dictionary");
    }
  }

  if ((sub_10000CFB0(320, &v77) & 1) != 0)
  {
    if (!byte_100028D01 || (sub_10000EF88("epdm_skip_hwvolume_cleanup=1") & 1) == 0)
    {
      sub_10000444C(1, "%s: safeObliterate: Cleaning Hardware volume in ephemeral mode", "safeObliterate");
      uint64_t v54 = MGCopyAnswer(@"UniqueDeviceID", 0LL);
      uint64_t v55 = MGCopyAnswer(@"r5pA2qLgR86BQKwgMjPWzg", 0LL);
      v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (v56)
      {
        v57 = v56;
        -[NSMutableDictionary setObject:forKey:](v56, "setObject:forKey:", @"remove", off_1000286C8);
        -[NSMutableDictionary setObject:forKey:]( v57,  "setObject:forKey:",  @"removeExcept /dcrt/ /sdcrt/",  @"MobileActivation");
        -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", @"keep", @"dcrt");
        -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", @"keep", @"sdcrt");
        -[NSMutableDictionary setObject:forKey:]( v57,  "setObject:forKey:",  @"removeExcept /apticket.der/",  @"FactoryData/System/Library/Caches");
        v58 = &stru_100025DE8;
        if (v54) {
          v58 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/(appv|(|mansta-)fCfg|pcrt|scrt|seal)-%@/ ",  &stru_100025DE8,  v54);
        }
        if (v55)
        {
          id v59 = [-[NSArray objectAtIndex:]( -[NSString componentsSeparatedByString:]( +[NSString stringWithFormat:](NSString stringWithFormat:@"%@", v55), "componentsSeparatedByString:", @"0x"), "objectAtIndex:", 1), "uppercaseString"];
          v58 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/(|mansta-)lcrt-%@/ ",  v58,  objc_msgSend(v59, "substringToIndex:", (char *)objc_msgSend(v59, "length") - 1));
        }

        sub_100004590(2, "/FactoryData/System/Library/Caches/com.apple.factorydata/", "trustobject-current");
        int v60 = open(byte_100028BF8, 0);
        if (v60 == -1)
        {
          v69 = __error();
          v70 = strerror(*v69);
          sub_10000444C(1, "%s: Failed to open '%s': %s", "epdm_fixup_hardware_volume", byte_100028BF8, v70);
        }

        else
        {
          int v61 = v60;
          v62 = sub_10000F078(v60);
          close(v61);
          if (v62)
          {
            snprintf((char *)&v79, 0x4DuLL, "trustobject-%s", v62);
            sub_100004590(2, "/FactoryData/System/Library/Caches/com.apple.factorydata/", (const char *)&v79);
            int v63 = open(byte_100028BF8, 0);
            if (v63 == -1)
            {
              v71 = __error();
              v72 = strerror(*v71);
              sub_10000444C(1, "%s: Failed to open '%s': %s", "epdm_fixup_hardware_volume", byte_100028BF8, v72);
            }

            else
            {
              int v64 = v63;
              v65 = sub_10000F078(v63);
              close(v64);
              if (v65)
              {
                v41 = &DiskSupport__metaData;
                if (!strncmp(v62, v65, 0x40uLL))
                {
                  sub_10000444C( 1,  "%s: Verified 'trustobject-current' and '%s' have the same content SHA-256 which also matches the name",  "epdm_fixup_hardware_volume",  (const char *)&v79);
                  v41 = &DiskSupport__metaData;
                  v58 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/trustobject-current/ /%s/",  v58,  &v79);
                }

                free(v65);
              }

              else
              {
                v41 = &DiskSupport__metaData;
              }
            }

            free(v62);
          }
        }

        if (v58) {
          -[NSMutableDictionary setObject:forKey:]( v57,  "setObject:forKey:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"removeExcept %@", v58),  @"FactoryData/System/Library/Caches/com.apple.factorydata");
        }
        -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", aPrivateVarHard),  v57);
      }

      else
      {
        sub_10000444C(1, "%s: Could not create exceptions dictionary", "epdm_fixup_hardware_volume");
      }

LABEL_155:
      if (v77) {
        sub_10000DB3C(320);
      }
      if (!v0) {
        goto LABEL_165;
      }
      goto LABEL_158;
    }

LABEL_126:
    sub_10000444C(1, "%s: safeObliterate: Cleaning Hardware volume", "safeObliterate");
    sub_10000D260();
    goto LABEL_155;
  }

          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          v119 = [a4 countByEnumeratingWithState:&v171 objects:v204 count:16];
          if (v119)
          {
            v120 = v119;
            v121 = *(void *)v172;
            do
            {
              for (n = 0LL; n != v120; n = (char *)n + 1)
              {
                if (*(void *)v172 != v121) {
                  objc_enumerationMutation(a4);
                }
                v123 = *(void **)(*((void *)&v171 + 1) + 8LL * (void)n);
                if (![v123 rangeOfString:objc_msgSend(v7[144], "stringWithFormat:", @"%@/", v16)])
                {
                  v125 = v124;
                  v126 = (char *)[v123 length] - v124;
                  v127 = [a4 objectForKeyedSubscript:v123];
                  v128 = v126;
                  uint64_t v7 = &AKSIdentityCreateFirst_ptr;
                  -[NSMutableDictionary setObject:forKey:]( v62,  "setObject:forKey:",  v127,  objc_msgSend(v123, "substringWithRange:", v125, v128));
                }
              }

              v120 = [a4 countByEnumeratingWithState:&v171 objects:v204 count:16];
            }

            while (v120);
          }

          goto LABEL_135;
        }

        if (!-[__CFString hasPrefix:](v17, "hasPrefix:", @"keepExcept "))
        {
          v143 = [v7[144] stringWithFormat:@"Exception '%@' for '%@' is ill-formatted!", v17, v16];
          v154 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v143);
          if (v154)
          {
            v145 = v154;
            v155 = CFStringGetCStringPtr(v154, 0x8000100u);
            v147 = "<error getting string>";
            if (v155) {
              v147 = v155;
            }
            goto LABEL_152;
          }

LABEL_158:
  if (!BYTE1(v41[46].ivar_lyt) || (sub_10000EF88("epdm_skip_update_cleanup=1") & 1) == 0)
  {
    sub_10000444C(1, "%s: safeObliterate: Cleaning Update volume", "safeObliterate");
    v73 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (!v73)
    {
      sub_10000444C(1, "%s: Could not create exceptions dictionary", "epdm_fixup_update_volume");
      if (!v16) {
        goto LABEL_168;
      }
      goto LABEL_166;
    }

    v74 = v73;
    -[NSMutableDictionary setObject:forKey:](v73, "setObject:forKey:", @"remove", off_1000286C8);
    -[NSMutableDictionary setObject:forKey:](v74, "setObject:forKey:", @"keep", @"last_update_result.plist");
    -[NSMutableDictionary setObject:forKey:]( v74,  "setObject:forKey:",  @"removeExcept /ota_tolerated_failures.plist/",  @"lastOTA");
    LOBYTE(v79.f_bsize) = 0;
    if (sub_10000CFB0(192, &v79))
    {
      sub_10000444C(1, "%s: Cleaning up the Update volume", "epdm_fixup_update_volume");
      -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", aPrivateVarMobi_1),  v74);
      if (LOBYTE(v79.f_bsize)) {
        sub_10000DB3C(192);
      }
    }
  }

LABEL_165:
  if (!v16) {
    goto LABEL_168;
  }
LABEL_166:
  sub_10000444C(1, "%s: safeObliterate: Unmounting the User volume post obliteration", "safeObliterate");
  if (sub_10000AE0C(1, 1))
  {
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x200000000000000LL);
    sub_10000444C(1, "%s: safeObliterate: Failed to unmount the User volume post obliteration", "safeObliterate");
  }

LABEL_168:
  sub_10000444C(1, "%s: safeObliterate: Unmounting the Data volume post obliteration", "safeObliterate");
  if (sub_10000AE0C(0, 1))
  {
    v25[42].base_meths = (__objc2_meth_list *)((unint64_t)v25[42].base_meths | 0x40000000000000LL);
    sub_10000444C(1, "%s: safeObliterate: Failed to unmount the Data volume post obliteration", "safeObliterate");
  }

  sub_10000444C(1, "%s: safeObliterate: Unmounting the tmpfs volume post obliteration", "safeObliterate");
  sub_10000AE0C(3, 1);
  sub_10000444C(1, "%s: safeObliterate: Clearing NVRAM Key", "safeObliterate");
  sub_10000444C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
  sub_1000115C0(@"oblit-inprogress");
  if (v34) {
    sub_10000F4EC(v34);
  }
  if (!v78) {
    return 13LL;
  }
  sub_10000444C(0, "%s: safeObliterate: all done, returning ECANCELED", "safeObliterate");
  return 89LL;
}

size_t sub_100006284(char *a1, char *a2, unsigned int a3)
{
  size_t v3 = 0LL;
  if (a1 && a2)
  {
    size_t v6 = sub_100010A24(a1, 0);
    if (v6)
    {
      uint64_t v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID() && CFStringGetCString(v7, a2, a3, 0x8000100u))
      {
        size_t v3 = strnlen(a2, a3) + 1;
      }

      else
      {
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 == CFDataGetTypeID())
        {
          CFIndex Length = CFDataGetLength((CFDataRef)v7);
          else {
            size_t v3 = a3;
          }
          BytePtr = CFDataGetBytePtr((CFDataRef)v7);
          memcpy(a2, BytePtr, v3);
          a2[v3 - 1] = 0;
        }

        else
        {
          size_t v3 = 0LL;
        }
      }

      CFRelease(v7);
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

void sub_10000637C(const __CFString *a1, unsigned __int8 a2, int a3)
{
  if (CFStringGetCString(a1, (char *)buffer, 1024LL, 0x8000100u) == 1)
  {
    size_t v6 = strlen((const char *)buffer);
    if (v6 > 0x3FF) {
      goto LABEL_22;
    }
    for (size_t i = v6; i; --i)
    {
      int v8 = v23[i + 15];
      if (v8 != 13 && v8 != 10) {
        break;
      }
    }

    int v10 = snprintf((char *)&buffer[i], 1024 - i, " [gF: 0x%016llX]", qword_100028BF0);
    CFIndex v11 = i + v10 >= 0x400 ? 1024LL : i + v10;
    uint64_t v12 = CFStringCreateWithBytes(kCFAllocatorDefault, buffer, v11, 0x8000100u, 0);
    if (v12)
    {
      uint64_t v13 = v12;
      if (a3) {
        size_t v14 = @"obliteration";
      }
      else {
        size_t v14 = 0LL;
      }
      sub_100008B18(v12, v14, a2);
      CFRelease(v13);
    }

    else
    {
LABEL_22:
      if (a3) {
        BOOL v16 = @"obliteration";
      }
      else {
        BOOL v16 = 0LL;
      }
      sub_100008B18(a1, v16, a2);
    }

    if ((byte_100028D40 & 1) != 0)
    {
      *(void *)__str = 0LL;
      uint64_t v22 = 0LL;
      memset(v23, 0, 11);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      snprintf(__str, 0x1BuLL, "%fs ", Current - *(double *)&qword_100028D38);
    }

    else
    {
      time_t v20 = time(0LL);
      ctime_r(&v20, __str);
      strcpy(&v23[8], ": ");
    }

    if (dword_1000286C0 != -1)
    {
      size_t v18 = strlen(__str);
      write(dword_1000286C0, __str, v18);
      size_t v19 = strlen((const char *)buffer);
      write(dword_1000286C0, buffer, v19);
      write(dword_1000286C0, "\n", 1uLL);
    }
  }

  else
  {
    if (a3) {
      v15 = @"obliteration";
    }
    else {
      v15 = 0LL;
    }
    sub_100008B18(a1, v15, a2);
  }

void sub_1000065B4(id a1, OS_xpc_object *a2, __CFDictionary *a3)
{
  signed int valuePtr = 0;
  byte_1000286D0 = 1;
  uint64_t v5 = &DiskSupport__metaData;
  byte_100028D30 = 0;
  size_t v6 = &DiskSupport__metaData;
  byte_100028D31 = 0;
  byte_100028BE8 = 0;
  byte_100028D32 = 0;
  qword_100028D38 = 0LL;
  byte_100028D40 = 0;
  qword_100028BF0 = 0LL;
  qword_100028D08 = 0LL;
  byte_100028D01 = sub_100010310();
  byte_100028D41 = 0;
  qword_100028D48 = 0LL;
  byte_100028D18 = 0;
  byte_100028BE9 = sub_1000117AC();
  if (dword_100028CF8) {
    sub_10000444C( 1,  "%s: Error: sepService is supposed to be NULL at handle_message(), 0x%x instead",  "handle_message",  dword_100028CF8);
  }
  xpc_connection_get_audit_token(a2, v70);
  *(_OWORD *)&token.f_buint32_t size = v70[0];
  *(_OWORD *)&token.f_bfree = v70[1];
  CFErrorRef error = 0LL;
  uint64_t v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, (audit_token_t *)&token);
  if (!v7)
  {
    sub_10000444C(1, "%s: Could not create the security task from the audit token", "verify_obliteration_client");
LABEL_8:
    sub_10000444C(1, "%s: Could not verify the obliteration client");
    goto LABEL_123;
  }

  int v8 = v7;
  CFTypeRef v9 = SecTaskCopyValueForEntitlement(v7, @"allow-obliterate-device", &error);
  if (!v9)
  {
    sub_10000444C(1, "%s: Could not extract the value for the entitlement", "verify_obliteration_client");
    int v11 = -1;
    goto LABEL_17;
  }

  int v10 = v9;
  if (error)
  {
    sub_10000444C(1, "%s: There was an error retrieving the entitlement value");
LABEL_15:
    int v11 = -1;
    goto LABEL_16;
  }

  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v10))
  {
    sub_10000444C(1, "%s: The entitlement value is not a BOOLean");
    goto LABEL_15;
  }

  if (!CFEqual(v10, kCFBooleanTrue))
  {
    sub_10000444C(1, "%s: The client does not have the obliteration entitlement");
    goto LABEL_15;
  }

  int v11 = 0;
LABEL_16:
  CFRelease(v10);
LABEL_17:
  if (error) {
    CFRelease(error);
  }
  CFRelease(v8);
  if (v11) {
    goto LABEL_8;
  }
  Value = CFDictionaryGetValue(a3, @"DisplayProgressBar");
  if (Value)
  {
    byte_1000286D0 = CFEqual(Value, kCFBooleanTrue) != 0;
    sub_10000444C(1, "%s: Option: set gShowProgress to %s");
  }

  else
  {
    sub_10000444C(1, "%s: Caller did not specify preference for progress bar. Defaulting to %d.");
  }

  size_t v14 = CFDictionaryGetValue(a3, @"IgnoreMissingPath");
  if (v14)
  {
    if (CFEqual(v14, kCFBooleanTrue))
    {
      sub_10000444C(1, "%s: Option: set gPathMissOkay = true", "handle_message");
      byte_100028BE8 = 1;
    }

    else
    {
      sub_10000444C(1, "%s: Option: set gPathMissOkay = false", "handle_message");
      byte_100028BE8 = 0;
    }
  }

  else
  {
    sub_10000444C( 1,  "%s: Caller did not specify preference for missing Exclusion path. Defaulting to %d",  "handle_message",  byte_100028BE8);
  }

  v15 = CFDictionaryGetValue(a3, @"SkipDataObliteration");
  if (v15) {
    CFEqual(v15, kCFBooleanTrue);
  }
  BOOL v16 = CFDictionaryGetValue(a3, @"ObliterationManagedDeviceWipe");
  if (v16 && CFEqual(v16, kCFBooleanTrue)) {
    v17 = "%s: Managed Device Wipe Chosen";
  }
  else {
    v17 = "%s: Not a Managed Device Wipe Request";
  }
  int v18 = 1;
  sub_10000444C(1, v17, "handle_message");
  size_t v19 = CFDictionaryGetValue(a3, @"ObliterationBrickIncludesFirmware");
  if (v19 && CFEqual(v19, kCFBooleanFalse))
  {
    sub_10000444C(1, "%s: Not including firmware in brick operation", "handle_message");
    int v18 = 0;
  }

  time_t v20 = CFDictionaryGetValue(a3, @"IgnoreInternalBuildSetting");
  if (v20 && CFEqual(v20, kCFBooleanTrue))
  {
    byte_100028D01 = 0;
    sub_10000444C(1, "%s: Ignoring internal build - assuming customer build", "handle_message");
  }

  v21 = (const __CFString *)CFDictionaryGetValue(a3, @"ObliterationMessage");
  uint64_t v22 = v21;
  if (v21)
  {
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 == CFStringGetTypeID())
    {
    }
  }

  CFStringRef v24 = (const __CFArray *)CFDictionaryGetValue(a3, @"ExclusionPaths");
  if (v24)
  {
    v25 = v24;
    CFTypeID v26 = CFGetTypeID(v24);
    if (v26 != CFArrayGetTypeID())
    {
      sub_10000444C(1, "%s: Exclusions paths isn't an array", "handle_message");
      goto LABEL_64;
    }

    if (CFArrayGetCount(v25))
    {
      if (CFArrayGetCount(v25) >= 1)
      {
        for (CFIndex i = 0LL; i < CFArrayGetCount(v25); ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v25, i);
          CFTypeID v29 = CFGetTypeID(ValueAtIndex);
          if (v29 != CFStringGetTypeID())
          {
            sub_10000444C(1, "%s: Exclusions path isn't a string");
            goto LABEL_134;
          }

          uint64_t v5 = &DiskSupport__metaData;
          if (!CFStringGetCString(ValueAtIndex, (char *)&token, 1025LL, 0x8000100u))
          {
            sub_10000444C(1, "%s: Could not get string", "handle_message");
            size_t v6 = &DiskSupport__metaData;
            goto LABEL_64;
          }

          v30 = realpath_DARWIN_EXTSN((const char *)&token, 0LL);
          if (v30)
          {
            int v31 = v30;
            sub_10000444C( 1,  "%s: realpath(%s) returned %s, path checks out okay.",  "handle_message",  (const char *)&token,  v30);
            free(v31);
          }

          else
          {
            int v32 = byte_100028BE8;
            int v33 = *__error();
            if (!v32)
            {
              sub_10000444C(1, "%s: realpath(%s) returned %d, path doesn't appear to exist.");
LABEL_134:
              size_t v6 = &DiskSupport__metaData;
              uint64_t v5 = &DiskSupport__metaData;
LABEL_64:
              if (CFEqual(0LL, @"ObliterationTypeMarkStart")
                || CFEqual(0LL, @"ObliterationTypeMarkerCreate"))
              {
                LOBYTE(v5[46].base_props) = 1;
              }

              goto LABEL_123;
            }

            sub_10000444C( 1,  "%s: realpath(%s) returned %d, path doesn't appear to exist, skipping as path miss is okay.",  "handle_message",  (const char *)&token,  v33);
          }
        }
      }

      qword_100028D48 = (uint64_t)CFRetain(v25);
      size_t v6 = &DiskSupport__metaData;
      uint64_t v5 = &DiskSupport__metaData;
    }
  }

  v34 = (const __CFNumber *)CFDictionaryGetValue(a3, @"ObliterationSimulatedFailure");
  LODWORD(error) = 0;
  if (v34)
  {
    CFNumberGetValue(v34, kCFNumberIntType, &error);
    LODWORD(v34) = (_DWORD)error;
  }

  sub_100004170((int)v34, 0);
  v35 = CFDictionaryGetValue(a3, @"ObliterationType");
  if (!v35)
  {
    sub_10000444C(1, "%s: No obliteration type specified in the options");
    goto LABEL_123;
  }

  int v36 = v35;
  CFTypeID v37 = CFGetTypeID(v35);
  if (v37 != CFStringGetTypeID())
  {
    sub_10000444C(1, "%s: Obliteration type is not CFString");
    goto LABEL_123;
  }

  if (byte_100028D32 == 1)
  {
    sub_10000444C(1, "%s: Obliteration is already in progress, cannot handle another one, returning", "handle_message");
    byte_100028D30 = 1;
    goto LABEL_123;
  }

  sub_10000444C(1, "%s: Obliteration started, sending ack to the caller...", "handle_message");
  sub_10000444C(1, "%s: Examining the Data volume", "handle_message");
  bzero(&token, 0x878uLL);
  if (byte_100028D00) {
    v38 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    v38 = "/private/var";
  }
  if (statfs(v38, &token) == -1)
  {
    v43 = __error();
    int v44 = strerror(*v43);
    sub_10000444C(1, "%s: Could not statfs %s: %s", "handle_message", v38, v44);
    byte_100028D30 = 1;
    goto LABEL_123;
  }

  if (CFDictionaryContainsKey(a3, @"ObliterationDelayAfterReply"))
  {
    uint64_t v39 = (const __CFNumber *)CFDictionaryGetValue(a3, @"ObliterationDelayAfterReply");
    if (v39 && (v40 = v39, v41 = CFGetTypeID(v39), v42 = v41 == CFNumberGetTypeID(), uint64_t v5 = &DiskSupport__metaData, v42))
    {
      CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0)
      {
        sub_10000444C(1, "%s: Incorrect Delay After Reply time of %d, ignoring");
      }

      else
      {
        sub_10000444C(1, "%s: SENDING REPLY BACK TO CALLER and waiting for %d secs", "handle_message", valuePtr);
        sub_100008A9C((uint64_t)a2, @"Complete");
        if (valuePtr >= 1) {
          sleep(valuePtr);
        }
      }
    }

    else
    {
      sub_10000444C(1, "%s: Invalid Delay After Reply time, ignoring..");
    }
  }

  else
  {
    sub_10000444C(1, "%s: Continuing Obliteration Without Reply");
  }

  if (byte_100028D01) {
    int v45 = (const __CFString *)CFDictionaryGetValue(a3, @"ObliterationCallingProcessName");
  }
  else {
    int v45 = 0LL;
  }
  off_t v46 = @"N/A";
  if (v45) {
    size_t v47 = v45;
  }
  else {
    size_t v47 = @"N/A";
  }
  if (v22) {
    off_t v46 = v22;
  }
  CFStringRef v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Caller: %@, Type: %@, Reason: %@", v47, v36, v46);
  if (v48)
  {
    v49 = v48;
    v50 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v48);
    if (v50)
    {
      v51 = v50;
      CStringPtr = CFStringGetCStringPtr(v50, 0x8000100u);
      v53 = "<error getting string>";
      if (CStringPtr) {
        v53 = CStringPtr;
      }
      sub_10000444C(1, "%s: Logging obliteration reason: %s", "handle_message", v53);
      CFRelease(v51);
    }

    else
    {
      sub_10000444C(1, "%s: Logging obliteration reason: %s", "handle_message", "<error getting string>");
    }

    sub_100008B18(v49, @"oblit-begins", 1u);
    uint64_t v5 = &DiskSupport__metaData;
    if (CFEqual(v36, @"ObliterateDataPartition"))
    {
      byte_100028D32 = 1;
      sub_10000444C(1, "%s: Data Obliteration is in progress...", "handle_message");
      if (!sub_100008D1C((uint64_t)&token, 1, 0, 0))
      {
        uint64_t v54 = @"EACS Done";
LABEL_101:
        sub_100009C88(v54, v45, v22);
        sub_1000115C0(@"orig-oblit");
        sub_1000115C0(@"oblit-begins");
        uint64_t v55 = @"oblit-failure";
        goto LABEL_102;
      }

      v56 = sub_100010BA8("orig-oblit", 0);
      if (!v56)
      {
        v57 = sub_100010BA8("obliteration", 0);
        if (!v57)
        {
LABEL_107:
          CFStringRef v58 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"EACS failed with [gF: 0x%016llX] Attempt: 1",  qword_100028BF0);
          if (v58)
          {
            CFStringRef v59 = v58;
            sub_100011138("oblit-failure", v58);
            CFRelease(v59);
          }

          sub_10000444C(0, "%s: Data Obliteration failed with error %d");
          goto LABEL_122;
        }

        v56 = v57;
        sub_100011138("orig-oblit", v57);
      }

      CFRelease(v56);
      goto LABEL_107;
    }

    if (!CFEqual(v36, @"ObliterationTypeWipeAndBrick"))
    {
      if (CFEqual(v36, @"ObliterationTypeBrickOnly"))
      {
        sub_10000444C(1, "%s: Bricking but preserving user data...", "handle_message");
        sub_100009D3C(v18);
        int v60 = @"BrickOnly Done";
      }

      else
      {
        if (CFEqual(v36, @"ObliterationTypeMarkStart"))
        {
          sub_10000444C(1, "%s: Marking Obliteration Begin in NVRAM...", "handle_message");
          sub_10000A71C();
          sub_100004BA0();
          byte_100028D31 = 1;
          sub_10000444C(1, "%s: Marked in NVRAM, returning ...");
          goto LABEL_122;
        }

        if (CFEqual(v36, @"ObliterationTypeSafeWipe"))
        {
          sub_100004BA0();
          byte_100028D32 = 1;
          byte_100028D41 = 1;
          sub_10000444C(1, "%s: SAFE WIPE Type Obliteration is in progress...", "handle_message");
          sub_10000444C(1, "%s: Terminating Daemons for safe wipe ...", "handle_message");
          sub_10000AC54();
          sub_10000444C(1, "%s: Terminating Daemons Complete, safe wipe started ...", "handle_message");
          sub_100004D8C();
          int v60 = @"SafeWipe Done";
        }

        else
        {
          if (!CFEqual(v36, @"ObliterationTypeMarkerCreate"))
          {
            CFIndex v67 = CFStringCreateWithFormat(0LL, 0LL, @"Unknown obliteration type '%@' specified", v36);
            v68 = v67;
            if (!v67) {
              CFIndex v67 = @"Unknown obliteration type specified";
            }
            sub_100009C88(v67, v45, v22);
            if (v68) {
              CFRelease(v68);
            }
            sub_1000115C0(@"oblit-begins");
            byte_100028D30 = 1;
            goto LABEL_122;
          }

          sub_10000444C(1, "%s: Creating Marker files ...", "handle_message");
          byte_100028D31 = 1;
          int v60 = @"MarkerCreate Done";
        }
      }

      sub_100009C88(v60, v45, v22);
      uint64_t v55 = @"oblit-begins";
LABEL_102:
      sub_1000115C0(v55);
LABEL_122:
      CFRelease(v49);
      goto LABEL_123;
    }

    byte_100028D32 = 1;
    sub_10000444C(1, "%s: Brick Obliteration is in progress...", "handle_message");
    if (!sub_100008D1C((uint64_t)&token, 0, 1, v18))
    {
      uint64_t v54 = @"WipeAndBrick Done";
      goto LABEL_101;
    }

    int v61 = sub_100010BA8("orig-oblit", 0);
    if (!v61)
    {
      v62 = sub_100010BA8("obliteration", 0);
      if (!v62)
      {
LABEL_119:
        CFStringRef v63 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"Brick failed with [gF: 0x%016llX] Attempt: 1",  qword_100028BF0);
        if (v63)
        {
          CFStringRef v64 = v63;
          sub_100011138("oblit-failure", v63);
          CFRelease(v64);
        }

        sub_10000444C(0, "%s: Brick failed with error %d");
        goto LABEL_122;
      }

      int v61 = v62;
      sub_100011138("orig-oblit", v62);
    }

    CFRelease(v61);
    goto LABEL_119;
  }

LABEL_123:
  if (sub_1000103B0())
  {
    sub_100004590(0, 0LL, "/log/obliteration.log");
    sub_1000107A4((uint64_t)byte_100028BF8, (uint64_t)sub_100010414);
    sub_1000105BC();
  }

  if (((uint64_t)v5[46].base_props & 1) != 0)
  {
    v65 = &stru_100024BD8;
    uint64_t v66 = &off_100024E10;
  }

  else
  {
    if (BYTE1(v6[46].base_props) != 1)
    {
      v65 = &stru_100024C18;
      goto LABEL_131;
    }

    v65 = &stru_100024BF8;
    uint64_t v66 = &off_100024E08;
  }

  sub_100008A9C((uint64_t)a2, *v66);
LABEL_131:
  xpc_connection_send_barrier(a2, v65);
}

const char *sub_100007410(const char *result)
{
  if (result)
  {
    size_t v1 = result;
    int v2 = getmntinfo(&v5, 2);
    if (v2)
    {
      int v3 = v2;
      for (CFIndex i = v5->f_mntfromname; strcmp(v1, i); i += 2168)
      {
        uint64_t v5 = (statfs *)(i + 1056);
        if (!--v3) {
          return 0LL;
        }
      }

      return i - 1024;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10000748C(const char *a1)
{
  if (unmount(a1, 0x80000) != -1) {
    return 0LL;
  }
  int v3 = __error();
  unint64_t v4 = strerror(*v3);
  sub_10000444C(1, "%s: Could not unmount %s: %s", "unmountVolume", a1, v4);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000756C(uint64_t a1)
{
  uint64_t v1 = objc_opt_class(*(void *)(a1 + 32));
  uint64_t result = objc_opt_new(v1);
  qword_100028D20 = result;
  return result;
}

LABEL_135:
        -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  v169,  v62);
        a3 = v167;
        size_t v14 = &AKSIdentityCreateFirst_ptr;
        goto LABEL_69;
      }

      if (-[__CFString hasPrefix:](v17, "hasPrefix:", @"removeExcept "))
      {
        v89 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", @"remove", off_1000286C8);
        v90 = -[__CFString rangeOfString:](v17, "rangeOfString:", @"/");
        v91 = -[__CFString substringFromIndex:]( v17,  "substringFromIndex:",  [@"removeExcept " length]);
        v92 = v91;
        if (v90 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v93 = [v91 componentsSeparatedByString:@"/"];
          v94 = (char *)[v93 count];
          if ((uint64_t)(v94 - 2) >= 0)
          {
            v95 = v94 - 1;
            do
            {
              v96 = objc_msgSend(v7[144], "pathWithComponents:", objc_msgSend(v93, "subarrayWithRange:", 0, v95));
              v97 = v7[144];
              v206[0] = v167;
              v206[1] = v16;
              v206[2] = v96;
              v98 = objc_msgSend( v97,  "pathWithComponents:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v206, 3));
              -[NSMutableDictionary setObject:forKey:]( v89,  "setObject:forKey:",  @"keep",  [v93 objectAtIndexedSubscript:v95]);
              -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  v98,  v89);
              -[NSMutableDictionary removeObjectForKey:]( v89,  "removeObjectForKey:",  [v93 objectAtIndexedSubscript:v95--]);
            }

            while (v95);
          }

          v92 = [v93 objectAtIndexedSubscript:0];
        }

        v99 = v89;
        v100 = @"keep";
      }

      else
      {
        if (-[__CFString hasPrefix:](v17, "hasPrefix:", @"keepExcept /"))
        {
          v62 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v101 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"/([^/]+)/ *",  0LL,  0LL);
          v102 = -[__CFString substringFromIndex:]( v17,  "substringFromIndex:",  [@"keepExcept " length]);
          -[NSMutableDictionary setObject:forKey:](v62, "setObject:forKey:", @"keep", off_1000286C8);
          v177 = 0u;
          v178 = 0u;
          v175 = 0u;
          v176 = 0u;
          v166 = v102;
          v103 = -[NSRegularExpression matchesInString:options:range:]( v101,  "matchesInString:options:range:",  v102,  0,  0,  [v102 length]);
          v104 = -[NSArray countByEnumeratingWithState:objects:count:]( v103,  "countByEnumeratingWithState:objects:count:",  &v175,  v205,  16LL);
          if (v104)
          {
            v105 = v104;
            v160 = *(id *)v176;
LABEL_111:
            v106 = 0LL;
            while (1)
            {
              if (*(id *)v176 != v160) {
                objc_enumerationMutation(v103);
              }
              v107 = *(void **)(*((void *)&v175 + 1) + 8 * v106);
              [v107 rangeAtIndex:2];
              if (v108) {
                break;
              }
              v109 = [v107 rangeAtIndex:1];
              v111 = objc_msgSend(v166, "substringWithRange:", v109, v110);
              v112 = (const __CFString *)[a4 objectForKeyedSubscript:objc_msgSend(v7[144], "stringWithFormat:", @"%@/%@", v16, v111)];
              if (v112)
              {
                v113 = v112;
                v156 = v112;
                v114 = [v7[144] stringWithFormat:@"==> keepExcept for '%@/%@' has rule '%@', using it instead of 'remove'", v16, v111];
                v115 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v114);
                if (v115)
                {
                  v116 = v115;
                  v117 = CFStringGetCStringPtr(v115, 0x8000100u);
                  if (v117) {
                    v118 = v117;
                  }
                  else {
                    v118 = "<error getting string>";
                  }
                  sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v118);
                  CFRelease(v116);
                }

                else
                {
                  sub_10000444C( 1,  "%s: %s",  "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]",  "<error getting string>");
                }

                free(v114);
                uint64_t v7 = &AKSIdentityCreateFirst_ptr;
              }

              else
              {
                v113 = @"remove";
              }

              -[NSMutableDictionary setObject:forKey:](v62, "setObject:forKey:", v113, v111);
              if (v105 == (id)++v106)
              {
                v105 = -[NSArray countByEnumeratingWithState:objects:count:]( v103,  "countByEnumeratingWithState:objects:count:",  &v175,  v205,  16LL);
                if (v105) {
                  goto LABEL_111;
                }
                goto LABEL_126;
              }
            }

            v148 = v7[144];
            v149 = [v107 rangeAtIndex:2];
            v142 = [v148 stringWithFormat:@"Exception '%@' for '%@' is ill-formatted - found extra string '%@' or missing '/'!", v166, v16, objc_msgSend(v166, "substringWithRange:", v149, v150)];
LABEL_154:
            v143 = v142;
            v151 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v142);
            if (v151)
            {
              v145 = v151;
              v152 = CFStringGetCStringPtr(v151, 0x8000100u);
              if (v152) {
                v153 = v152;
              }
              else {
                v153 = "<error getting string>";
              }
              sub_10000444C(1, "%s: %s", "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]", v153);
              goto LABEL_159;
            }

            goto LABEL_160;
          }

LABEL_160:
          sub_10000444C( 1,  "%s: %s",  "-[DiskSupport traverseFolderAndRemoveItems:exceptions:]",  "<error getting string>");
LABEL_161:
          free(v143);
          return 0;
        }

        v89 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", @"keep", off_1000286C8);
        v129 = -[__CFString rangeOfString:](v17, "rangeOfString:", @"/");
        v130 = -[__CFString substringFromIndex:]( v17,  "substringFromIndex:",  [@"keepExcept " length]);
        v92 = v130;
        if (v129 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v131 = [v130 componentsSeparatedByString:@"/"];
          v132 = (char *)[v131 count];
          if ((uint64_t)(v132 - 2) >= 0)
          {
            v133 = v132 - 1;
            do
            {
              v134 = objc_msgSend(v7[144], "pathWithComponents:", objc_msgSend(v131, "subarrayWithRange:", 0, v133));
              v135 = v7[144];
              v203[0] = v167;
              v203[1] = v16;
              v203[2] = v134;
              v136 = objc_msgSend( v135,  "pathWithComponents:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v203, 3));
              -[NSMutableDictionary setObject:forKey:]( v89,  "setObject:forKey:",  @"remove",  [v131 objectAtIndexedSubscript:v133]);
              -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  v136,  v89);
              -[NSMutableDictionary removeObjectForKey:]( v89,  "removeObjectForKey:",  [v131 objectAtIndexedSubscript:v133--]);
            }

            while (v133);
          }

          v92 = [v131 objectAtIndexedSubscript:0];
        }

        v99 = v89;
        v100 = @"remove";
      }

      -[NSMutableDictionary setObject:forKey:](v99, "setObject:forKey:", v100, v92);
      -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](&OBJC_CLASS___DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  v169,  v89);
      a3 = v167;
      size_t v14 = &AKSIdentityCreateFirst_ptr;
LABEL_69:
      v15 = v168 + 1;
    }

    while ((id)(v168 + 1) != v163);
    v137 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v199,  v212,  16LL);
    uint64_t result = 1;
    v163 = v137;
    if (v137) {
      continue;
    }
    return result;
  }

void sub_100008A9C(uint64_t a1, const void *a2)
{
  unint64_t v4 = sub_10001029C();
  CFDictionarySetValue(v4, @"IPCStatus", a2);
  if ((MOXPCTransportSendMessageOnConnection(a1, v4) & 1) == 0) {
    sub_10000444C(1, "%s: Failed to not send response to the client", "send_reply_response_cf");
  }
  CFRelease(v4);
}

void sub_100008B18(const __CFString *a1, const __CFString *a2, unsigned __int8 a3)
{
  if (!a1) {
    return;
  }
  if (byte_100028D01 && (byte_100028D18 & 1) == 0)
  {
    int v8 = CFDateFormatterCreate(kCFAllocatorDefault, 0LL, kCFDateFormatterShortStyle, kCFDateFormatterLongStyle);
    if (v8)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(kCFAllocatorDefault, v8, Current);
      CFStringRef v6 = StringWithAbsoluteTime;
      if (StringWithAbsoluteTime)
      {
        CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@: %@", StringWithAbsoluteTime, a1);
        if (!a2) {
          goto LABEL_19;
        }
        goto LABEL_9;
      }
    }

    else
    {
      CFStringRef v6 = 0LL;
    }

    CFStringRef v7 = 0LL;
    if (!a2) {
      goto LABEL_19;
    }
  }

  else
  {
    CFStringRef v6 = 0LL;
    CFStringRef v7 = 0LL;
    int v8 = 0LL;
    if (!a2) {
      goto LABEL_19;
    }
  }

LABEL_9:
  if (((v7 != 0LL) & a3) != 0) {
    CFStringRef v11 = v7;
  }
  else {
    CFStringRef v11 = a1;
  }
  if (IOMainPort(bootstrap_port, &mainPort))
  {
    uint64_t v12 = "%s: Could not get main port";
  }

  else
  {
    io_registry_entry_t v13 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v13)
    {
      io_object_t v14 = v13;
      if (IORegistryEntrySetCFProperty(v13, a2, v11)) {
        sub_10000444C(0, "%s: Could not set obliterate setting");
      }
      IOObjectRelease(v14);
      goto LABEL_19;
    }

    uint64_t v12 = "%s: Could not get options entry from the device tree";
  }

  sub_10000444C(0, v12);
LABEL_19:
  if (sub_1000103B0())
  {
    if (v7) {
      uint64_t v15 = (uint64_t)v7;
    }
    else {
      uint64_t v15 = (uint64_t)a1;
    }
    BOOL v16 = sub_1000104B8(v15, (uint64_t)&_CFRetain, (uint64_t)&_CFRelease);
    if (v16)
    {
      sub_10001069C((uint64_t)v16);
    }

    else if (dword_1000286C0 != -1)
    {
      write(dword_1000286C0, "Failed to create in memory logging data\n", 0x29uLL);
    }
  }

  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t sub_100008D1C(uint64_t a1, int a2, int a3, int a4)
{
  __int16 v48 = 0;
  memset(v56, 0, sizeof(v56));
  memset(v55, 0, sizeof(v55));
  memset(v54, 0, sizeof(v54));
  sub_100004BA0();
  sub_10000A71C();
  int v8 = (const __CFDictionary *)MKBUserTypeDeviceMode(0LL, 0LL);
  if (!v8
    || (CFTypeRef v9 = v8,
        Value = (const __CFString *)CFDictionaryGetValue(v8, kMKBDeviceModeKey),
        CFComparisonResult v11 = CFStringCompare(Value, kMKBDeviceModeSharedIPad, 0LL),
        CFRelease(v9),
        v11))
  {
    uint64_t v12 = 0xFFFFFFFFLL;
    BOOL v13 = sub_10000AD94();
    if (v13) {
      sub_10000444C(1, "%s: Device is in multiuser mode", "obliterate");
    }
    if (IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"Mobile Obliteratation", &AssertionID))
    {
      sub_10000444C(1, "%s: Cannot prevent idle sleep", "obliterate");
      if (!a3) {
        goto LABEL_143;
      }
    }

    if (dword_1000286C0 != -1) {
      ramrod_add_log_fd(dword_1000286C0);
    }
    ramrod_log_set_buffermsgs(0LL);
    ramrod_set_syslog_flush_msgs(0LL);
    ramrod_display_set_showprogress(byte_1000286D0);
    sub_10000444C(1, "%s: Posting the data eschaton notification", "obliterate");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (DarwinNotifyCenter) {
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobile.data_eschaton", 0LL, 0LL, 1u);
    }
    else {
      sub_10000444C(1, "%s: Could not get the darwin notification center", "post_notification");
    }
    sub_10000444C(1, "%s: Taking the device off the USB bus", "obliterate");
    values[0] = 0LL;
    int v16 = IOUSBDeviceControllerCreate(0LL, values);
    if (v16)
    {
      if (v16 == -536870160)
      {
        char v17 = 1;
        sub_10000444C(1, "%s: The USB device controller could not be found. It's cool.", "getoff_bus");
LABEL_21:
        if (values[0]) {
          CFRelease(values[0]);
        }
        if ((v17 & 1) == 0)
        {
          qword_100028BF0 |= 1uLL;
          sub_10000444C(0, "%s: Could not get off the USB bus", "obliterate");
          if (!a3) {
            goto LABEL_143;
          }
        }

        if (byte_100028BE9)
        {
          sub_10000444C(1, "%s: Skipping the disable of watchdog timer", "obliterate");
        }

        else
        {
          sub_10000444C(1, "%s: Disabling the watchdog timer", "obliterate");
          sub_10000DC48(@"com.apple.watchdogd");
          if (sub_10000DDA0())
          {
            qword_100028BF0 |= 2uLL;
            sub_10000444C(0, "%s: Could not disable the watchdog timer", "obliterate");
            if (!a3) {
              goto LABEL_143;
            }
          }
        }

        int v47 = a4;
        sub_10000444C(1, "%s: Grabbing framebuffer", "obliterate");
        uint64_t v18 = MGCopyAnswer(@"DeviceClass", 0LL);
        if (!v18)
        {
          sub_10000444C(1, "%s: Could not get device class.", "grab_framebuffer");
LABEL_37:
          qword_100028BF0 |= 4uLL;
          sub_10000444C(0, "%s: Could not open framebuffer", "obliterate");
          if (!a3) {
            goto LABEL_143;
          }
LABEL_53:
          sub_10000444C(1, "%s: Begin background progress bar UI thread", "obliterate");
          CFStringRef v24 = malloc(0xCuLL);
          sub_10000444C(1, "%s: Faking from %3f to %3f expecting %d sec", "begin_fakery", 0.0, 1.0, 15);
          if (v24)
          {
            *(void *)CFStringRef v24 = 0x3F80000000000000LL;
            v24[2] = 15;
            byte_100028D50 = 0;
            if (pthread_create((pthread_t *)&qword_100028D58, 0LL, (void *(__cdecl *)(void *))sub_10000DEC4, v24))
            {
              v25 = __error();
              CFTypeID v26 = strerror(*v25);
              sub_10000444C(1, "%s: could not spwawn thread: %s", "begin_fakery", v26);
            }
          }

          sub_10000444C(1, "%s: Killing some daemons", "obliterate");
          qword_100028D38 = CFAbsoluteTimeGetCurrent();
          else {
            byte_100028D40 = 1;
          }
          v27 = &DiskSupport__metaData;
          if (sub_10000AC54())
          {
            qword_100028BF0 |= 0x10uLL;
            sub_10000444C(0, "%s: Could not kill daemons", "obliterate");
            if (!a3) {
              goto LABEL_142;
            }
          }

          if (a2)
          {
            sub_10000444C(1, "%s: Capturing the Data volume state", "obliterate");
            CFStringRef v28 = sub_10000F29C();
            if (v28)
            {
              CFTypeID v29 = v28;
              if (sub_10000F564( (uint64_t)v28,  "/private/var/mobile/Library/Preferences/.GlobalPreferences.plist",  "/System/Library/Obliteration/GlobalPreferences.plist"))
              {
                qword_100028BF0 |= 0x1000000uLL;
                sub_10000444C(1, "%s: Could not add user preferences file.", "capture_data_volume");
              }

              sub_10000FF18((uint64_t)v29);
              v30 = (const __CFArray *)qword_100028D48;
              if (qword_100028D48)
              {
                CFIndex v31 = 0LL;
                while (1)
                {
                  if (v31 >= CFArrayGetCount(v30)) {
                    goto LABEL_71;
                  }
                  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100028D48, v31);
                  if (sub_10000F564((uint64_t)v29, (char *)values, 0LL))
                  {
                    sub_10000444C(1, "%s: Could not add item '%s' to scrapper");
                    goto LABEL_83;
                  }

                  ++v31;
                  v30 = (const __CFArray *)qword_100028D48;
                  if (!qword_100028D48) {
                    goto LABEL_71;
                  }
                }

                sub_10000444C(1, "%s: Could not extract C-string for path.");
LABEL_83:
                v27 = &DiskSupport__metaData;
                free(v29);
                goto LABEL_84;
              }

LABEL_71:
              sub_10000444C(1, "%s: Successfully captured Data volume info", "capture_data_volume");
              sub_10000F23C((uint64_t)v29);
              v27 = &DiskSupport__metaData;
              if (!v13) {
                goto LABEL_88;
              }
              goto LABEL_86;
            }

            sub_10000444C(1, "%s: Could not create FS scraper.", "capture_data_volume");
LABEL_84:
            qword_100028BF0 |= 0x40uLL;
            sub_10000444C(0, "%s: Could not capture the Data volume state", "obliterate");
            if (!a3) {
              goto LABEL_142;
            }
          }

          CFTypeID v29 = 0LL;
          if (!v13) {
            goto LABEL_88;
          }
LABEL_86:
          sub_10000444C(1, "%s: Unmounting the User volume", "obliterate");
          if (sub_10000AE0C(1, 1))
          {
            v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x4000000000000000LL);
            sub_10000444C(0, "%s: Could not unmount the User volume", "obliterate");
            if (!a3) {
              goto LABEL_140;
            }
          }

LABEL_88:
          sub_10000444C(1, "%s: Unmounting the Data volume", "obliterate");
          if (sub_10000AE0C(0, 1))
          {
            v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x100);
            sub_10000444C(0, "%s: Could not unmount the Data volume", "obliterate");
            if (!a3) {
              goto LABEL_140;
            }
          }

          int v33 = (const char *)(a1 + 1112);
          sub_10000AEBC(v33, v56);
          sub_10000444C(1, "%s: Using container device name: %s", "obliterate", v56);
          sub_10000444C(1, "%s: Obliterating the Data volume", "obliterate");
          if (sub_10000AFD0(v56, v33, a2, v13, (_BYTE *)&v48 + 1))
          {
            v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x200);
            sub_10000444C(0, "%s: Could not obliterate the Data volume", "obliterate");
            if ((a3 & 1) == 0) {
              goto LABEL_140;
            }
          }

          else if (!a3)
          {
            goto LABEL_95;
          }

          sub_100009D3C(v47);
LABEL_95:
          if (!a2)
          {
LABEL_136:
            if (sub_10000CFB0(320, &v48))
            {
              sub_100004590(2, "/.obliteration_preserved", 0LL);
              sub_10000D160();
              sub_10000444C(1, "%s: Cleaning Hardware volume", "obliterate");
              sub_10000D260();
              if ((_BYTE)v48) {
                sub_10000DB3C(320);
              }
            }

            sub_10000DC0C();
            uint64_t v12 = 0LL;
            goto LABEL_140;
          }

          sub_10000444C(1, "%s: Reformatting the Data volume in container %s", "obliterate", v56);
          if (!sub_10000B7C4(v56, 1, (char *)v55, 0LL)
            || (sub_10000444C(0, "%s: Could not reformat the Data volume", "obliterate"), a3))
          {
            if (!v13
              || !sub_10000B7C4(v56, 0, (char *)v54, 0LL)
              || (sub_10000444C(0, "%s: Could not reformat the User volume", "obliterate"), a3))
            {
              CFTypeID v29 = sub_10000BA70(v29, 1);
              if (!v29)
              {
                v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x800);
                sub_10000444C(0, "%s: Could not setup the content for Data volume", "obliterate");
                if (!a3)
                {
LABEL_142:
                  dispatch_semaphore_t v41 = dispatch_semaphore_create(0LL);
                  BOOL v42 = dispatch_queue_create("com.apple.obliterator.threadJoin", 0LL);
                  values[0] = _NSConcreteStackBlock;
                  values[1] = (CFTypeRef)3221225472LL;
                  values[2] = sub_10000E7AC;
                  values[3] = &unk_100024B98;
                  values[4] = v41;
                  dispatch_async(v42, values);
                  dispatch_time_t v43 = dispatch_time(0LL, 5000000000LL);
                  dispatch_semaphore_wait(v41, v43);
                  usleep(0x3D090u);
LABEL_143:
                  sub_10000444C(0, "%s:  ******** Obliteration done ******** ", "obliterate");
                  return v12;
                }
              }

              byte_100028D00 = 1;
              if (!sub_10000BBEC("/private/var/tmp") || a3)
              {
                v34 = byte_100028D00 ? "/private/var/tmp/alt_root/private/var" : "/private/var";
                int v35 = mkpath_np(v34, 0x1EDu);
                if (!v35
                  || (int v36 = v35, v35 == 17)
                  || (v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x1000),
                      CFTypeID v37 = strerror(v35),
                      sub_10000444C( 1,  "%s: Could not create the Data volume path %s, error %d (%s)",  "obliterate",  v34,  v36,  v37),  a3))
                {
                  sub_10000444C(1, "%s: Remounting the Data volume %s at %s", "obliterate", (const char *)v55, v34);
                  if (!sub_10000BCE4((char *)v55, v34)
                    || (v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x1000),
                        sub_10000444C(0, "%s: Could not remount the Data volume", "obliterate"),
                        a3))
                  {
                    if (!v13
                      || (sub_10000444C(1, "%s: Setting up UM/AKS for the new Data volume", "obliterate"),
                          !sub_10000BDA0((const char *)v55, v34, (const char *)v54, 1))
                      || (v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x20000000000000LL),
                          sub_10000444C(0, "%s: Failed to set up the data volume in multiuser mode", "obliterate"),
                          a3))
                    {
                      sub_10000444C(1, "%s: Re-creating overprovisioning file", "obliterate");
                      if (sub_10000C5D8(v38))
                      {
                        v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x2000);
                        sub_10000444C(0, "%s: Could not re-create overprovisioning file", "obliterate");
                      }

                      sub_10000444C(1, "%s: Creating mobile path", "obliterate");
                      sub_10000FBC8();
                      if (byte_100028D00) {
                        uint64_t v39 = "/private/var/tmp/alt_root/private/var/mobile";
                      }
                      else {
                        uint64_t v39 = "/private/var/mobile";
                      }
                      if (v13)
                      {
                        sub_10000444C( 1,  "%s: Remounting the User volume %s at %s",  "obliterate",  (const char *)v54,  v39);
                        if (sub_10000BCE4((char *)v54, v39))
                        {
                          v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x10000000000000LL);
                          sub_10000444C(0, "%s: Could not remount the User volume", "obliterate");
                          if (!a3) {
                            goto LABEL_140;
                          }
                        }

                        v40 = "Shared ";
                      }

                      else
                      {
                        v40 = "";
                      }

                      sub_10000444C(1, "%s: Rebuilding the %sData volume", "obliterate", v40);
                      if (!sub_10000CA68((uint64_t)v29)
                        || (v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x4000),
                            sub_10000444C(0, "%s: Could not rebuild the Data volume", "obliterate"),
                            a3))
                      {
                        if (!v13)
                        {
LABEL_133:
                          sub_10000444C(1, "%s: Unmounting the Data volume post obliteration", "obliterate");
                          if (sub_10000AE0C(0, 0))
                          {
                            v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x40000000000000LL);
                            sub_10000444C(1, "%s: Failed to unmount the Data volume post obliteration", "obliterate");
                          }

                          sub_10000444C(1, "%s: Unmounting the tmpfs volume post obliteration", "obliterate");
                          sub_10000AE0C(3, 0);
                          goto LABEL_136;
                        }

                        sub_10000444C(1, "%s: Populating USER volume with mastered content", "obliterate");
                        if (!sub_10000CD78((uint64_t)v39)
                          || (v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x80000000000000LL),
                              sub_10000444C( 0,  "%s: Failed to create and set up a user volume for multiuser mode",  "obliterate"),  a3))
                        {
                          sub_10000444C(1, "%s: Unmounting the User volume post obliteration", "obliterate");
                          if (sub_10000AE0C(1, 0))
                          {
                            v27[42].base_meths = (__objc2_meth_list *)((unint64_t)v27[42].base_meths | 0x200000000000000LL);
                            sub_10000444C(1, "%s: Failed to unmount the User volume post obliteration", "obliterate");
                          }

                          goto LABEL_133;
                        }
                      }
                    }
                  }
                }
              }
            }
          }

LABEL_140:
          if (v29) {
            sub_10000F4EC(v29);
          }
          goto LABEL_142;
        }

        size_t v19 = (const void *)v18;
        sub_10000444C(1, "%s: Unloading Springboard", "grab_framebuffer");
        sub_10000DC48(@"com.apple.SpringBoard");
        sub_10000444C(1, "%s: Unloaded Springboard", "grab_framebuffer");
        sub_10000444C(1, "%s: Unloading backbaordd", "grab_framebuffer");
        sub_10000DC48(@"com.apple.backboardd");
        sub_10000444C(1, "%s: Unloaded backboardd", "grab_framebuffer");
        if (CFEqual(v19, @"RealityDevice") == 1)
        {
          sub_10000444C(1, "%s: Unloading wakeboardd", "grab_framebuffer");
          sub_10000DC48(@"com.apple.wakeboardd");
          sub_10000444C(1, "%s: Unloaded wakeboardd", "grab_framebuffer");
        }

        if (sub_10000F214(0.0))
        {
          sub_10000444C(1, "%s: Could not initialize progress bar to zero.");
LABEL_32:
          CFRelease(v19);
          goto LABEL_37;
        }

        if (CFEqual(v19, @"AppleTV") || CFEqual(v19, @"RealityDevice") | byte_100028BE9)
        {
          sub_10000444C(1, "%s: Will not attempt to disable backlight for this platform", "grab_framebuffer");
          goto LABEL_52;
        }

        sub_10000444C(1, "%s: Turning off backlight", "grab_framebuffer");
        keys = @"backlight-control";
        CFTypeRef v53 = 0LL;
        values[0] = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (!values[0]) {
          goto LABEL_74;
        }
        keys = @"IOPropertyMatch";
        time_t v20 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (!v20) {
          goto LABEL_74;
        }
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v20);
        if (!MatchingService) {
          goto LABEL_74;
        }
        io_registry_entry_t entry = MatchingService;
        int valuePtr = 0x8000;
        CFTypeRef v53 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
        if (!v53)
        {
          int v23 = -1;
          goto LABEL_77;
        }

        v50 = @"brightness";
        CFDictionaryRef v22 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&v50,  &v53,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (v22)
        {
          CFDictionaryRef cf = v22;
          if (IORegistryEntrySetCFProperties(entry, v22)) {
            int v23 = -1;
          }
          else {
            int v23 = 0;
          }
          CFRelease(cf);
        }

        else
        {
LABEL_74:
          int v23 = -1;
        }

        if (v53) {
          CFRelease(v53);
        }
LABEL_77:
        if (values[0]) {
          CFRelease(values[0]);
        }
        if (v23)
        {
          sub_10000444C(1, "%s: Could not turn on backlight.");
          goto LABEL_32;
        }

LABEL_52:
        CFRelease(v19);
        goto LABEL_53;
      }

      sub_10000444C(1, "%s: Could not create controller %08x");
    }

    else
    {
      char v17 = 1;
      sub_10000444C(1, "%s: Could not force controller off USB %08x");
    }

    char v17 = 0;
    goto LABEL_21;
  }

  sub_10000444C(1, "%s: Shared Mode device, reverting to Safeboot wipe.", "obliterate");
  *__error() = 0;
  reboot(0);
  uint64_t v15 = __error();
  sub_10000444C(1, "%s: Ooops... shouldn't be here - reboot() must have failed - errno %d!", "obliterate", *v15);
  byte_100028D30 = 1;
  if (*__error()) {
    return *__error();
  }
  else {
    return 35LL;
  }
}

void sub_100009C88(const __CFString *a1, const __CFString *a2, const __CFString *a3)
{
  time_t v6 = time(0LL);
  CFStringRef v7 = @"N/A";
  if (a2) {
    int v8 = a2;
  }
  else {
    int v8 = @"N/A";
  }
  if (a3) {
    CFStringRef v7 = a3;
  }
  CFTypeRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@ @%ld, Caller: %@, Reason: %@", a1, v6, v8, v7);
  if (v9)
  {
    int v10 = v9;
    sub_10000637C(v9, 0, 1);
    CFRelease(v10);
  }

  else
  {
    sub_10000637C(a1, 0, 1);
  }

uint64_t sub_100009D3C(int a1)
{
  v56.gl_pathc = 0LL;
  int v2 = (__CFString *)sub_100010A24("boot-path", 0);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    if (v2)
    {
      unint64_t v4 = (const char *)-[__CFString UTF8String](v2, "UTF8String");
      goto LABEL_6;
    }
  }

  else
  {
    sub_10000444C(1, "%s: boot-path was not a string!?", "kernelcachePathFromVars");
    int v2 = 0LL;
  }

  unint64_t v4 = "/System/Library/Caches/com.apple.kernelcaches/kernelcache";
LABEL_6:
  int v5 = open("/private/preboot/active", 0);
  if (v5 != -1)
  {
    int v6 = v5;
    off_t v7 = lseek(v5, 0LL, 2);
    if (v7 == -1)
    {
      CFTypeRef v9 = 0LL;
    }

    else
    {
      size_t v8 = v7;
      CFTypeRef v9 = (char *)malloc(v7 + 1);
      if (v9 && v8 == pread(v6, v9, v8, 0LL))
      {
        v9[v8] = 0;
        if (asprintf((char **)&v56, "/private/preboot/%s%s", v9, v4) < 0)
        {
          sub_10000444C(1, "%s: asprintf failed", "kernelcachePathFromVars");
          v56.gl_pathc = 0LL;
        }

        goto LABEL_17;
      }
    }

    sub_10000444C(1, "%s: Failed to read /private/preboot/active", "kernelcachePathFromVars");
LABEL_17:
    close(v6);
    goto LABEL_18;
  }

  if (*__error() != 2)
  {
    int v10 = __error();
    CFComparisonResult v11 = strerror(*v10);
    sub_10000444C(1, "%s: Failed to open /private/preboot/active: %s", "kernelcachePathFromVars", v11);
  }

  CFTypeRef v9 = 0LL;
LABEL_18:

  free(v9);
  gl_pathc = (char *)v56.gl_pathc;
  if (v56.gl_pathc) {
    char v13 = sub_10000E898((const char *)v56.gl_pathc) == 0;
  }
  else {
    char v13 = 0;
  }
  int v14 = glob_b( "/private/preboot/*/System/Library/Caches/com.apple.kernelcaches/kernelcache*",  32,  &stru_100024C68,  &v56);
  if (v14 != -3 && v14)
  {
    qword_100028BF0 |= 0x40000000uLL;
    uint64_t v18 = __error();
    strerror(*v18);
    sub_10000444C(1, "%s: glob_b failed: ret:%d err:%s");
  }

  else
  {
    size_t v15 = v56.gl_pathc;
    if (v56.gl_pathc)
    {
      uint64_t v16 = 0LL;
      do
      {
        char v17 = v56.gl_pathv[v16];
        if (!gl_pathc || strcmp(gl_pathc, v56.gl_pathv[v16])) {
          v13 |= sub_10000E898(v17) == 0;
        }
        ++v16;
      }

      while (v15 != v16);
      globfree(&v56);
      if ((v13 & 1) == 0)
      {
        qword_100028BF0 |= 0x80000000uLL;
        sub_10000444C(1, "%s: Failed to delete any kernelcaches...");
      }
    }

    else
    {
      globfree(&v56);
    }
  }

  free(gl_pathc);
  if (!a1)
  {
    sub_10000444C(1, "%s: Setting auto-boot to false", "brick");
    return sub_100010C78("auto-boot", "false");
  }

  sub_10000444C(1, "%s: Deleting firmware", "brick");
  size_t v19 = IOServiceMatching("AppleImage3NORAccess");
  if (v19)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v19);
    if (MatchingService)
    {
      io_service_t v21 = MatchingService;
      sub_10000444C(1, "%s: Found device with AppleImage3NORAccess; Erasing Firmware", "deleteFirmware");
      LODWORD(v56.gl_pathc) = 0;
      if (IOServiceOpen(v21, mach_task_self_, 0, (io_connect_t *)&v56))
      {
        qword_100028BF0 |= 0x20000000000uLL;
        sub_10000444C(1, "%s: Could not open the service");
      }

      else
      {
        sub_10000444C(1, "%s: Erasing all Image3 firmware images", "delete_Image3_Firmware");
        if (IOConnectCallStructMethod(v56.gl_pathc, 2u, 0LL, 0LL, 0LL, 0LL))
        {
          qword_100028BF0 |= 0x40000000000uLL;
          sub_10000444C(1, "%s: IOConnectCallStructMethod(%d) failed: 0x%x\n");
        }
      }

      if (LODWORD(v56.gl_pathc)) {
        IOServiceClose(v56.gl_pathc);
      }
      IOObjectRelease(v21);
      goto LABEL_51;
    }

    sub_10000444C(1, "%s: Could not get the AppleImage3NORAccess service; Trying ASPStorage", "deleteFirmware");
    v25 = IOServiceMatching("ASPStorage");
    if (v25)
    {
      io_service_t v26 = IOServiceGetMatchingService(kIOMainPortDefault, v25);
      if (v26)
      {
        IOObjectRelease(v26);
        sub_10000444C(1, "%s: Found device with ASPStorage; Erasing Firmware", "deleteFirmware");
        uint64_t v55 = 1LL;
        if (sub_10000E990((char *)&v56))
        {
          qword_100028BF0 |= 0x4000000000000uLL;
LABEL_45:
          sub_10000444C(1, "%s: Failed to find firmware partition, err=%d");
LABEL_51:
          int v23 = "%s: Firmware is gone?!";
          int v24 = 0;
          goto LABEL_52;
        }

        int v28 = open((const char *)&v56, 1);
        if (v28 == -1)
        {
          qword_100028BF0 |= 0x800000000uLL;
          int v44 = __error();
          strerror(*v44);
          goto LABEL_72;
        }

        int v29 = v28;
        sub_10000444C(1, "%s: Opened Device '%s': ", "delete_ASP_Firmware", (const char *)&v56);
        uint64_t v54 = &v52;
        uint64_t v52 = 0LL;
        uint64_t v53 = sub_10000EBF4(v29, (const char *)&v56);
        int v30 = ioctl(v29, 0x8010641FuLL, &v54);
        if (v30)
        {
          int v31 = v30;
          qword_100028BF0 |= 0x1000000000uLL;
          int v32 = __error();
          int v33 = strerror(*v32);
          sub_10000444C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_ASP_Firmware", v31, v33);
        }

        sub_10000444C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_ASP_Firmware", (const char *)&v56);
        close(v29);
        memset(&v56, 0, 64);
        v34 = IOServiceNameMatching("Apple LLB Media");
        io_service_t v35 = IOServiceGetMatchingService(kIOMainPortDefault, v34);
        if (v35)
        {
          io_registry_entry_t v36 = v35;
          if (IOObjectConformsTo(v35, "IOMedia"))
          {
            CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( v36,  @"BSD Name",  kCFAllocatorDefault,  0);
            IOObjectRelease(v36);
            if (CFProperty)
            {
              __strlcpy_chk(&v56, "/dev/", 64LL, 64LL);
              if (!CFStringGetCString(CFProperty, (char *)&v56.gl_pathc + 5, 59LL, 0x8000100u))
              {
                CFRelease(CFProperty);
                sub_10000444C(1, "%s: Failed to get LLB device name");
                goto LABEL_51;
              }

              sub_10000444C(1, "%s: Found LLB device: %s", "delete_ASP_Firmware", (const char *)&v56);
              CFRelease(CFProperty);
              int v38 = open((const char *)&v56, 1);
              if (v38 != -1)
              {
                int v39 = v38;
                sub_10000444C(1, "%s: Opened Device '%s': ", "delete_ASP_Firmware", (const char *)&v56);
                uint64_t v54 = &v52;
                LODWORD(v55) = 1;
                uint64_t v52 = 0LL;
                uint64_t v53 = sub_10000EBF4(v39, (const char *)&v56);
                int v40 = ioctl(v39, 0x8010641FuLL, &v54);
                if (v40)
                {
                  int v41 = v40;
                  qword_100028BF0 |= 0x4000000000uLL;
                  BOOL v42 = __error();
                  dispatch_time_t v43 = strerror(*v42);
                  sub_10000444C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_ASP_Firmware", v41, v43);
                }

                sub_10000444C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_ASP_Firmware", (const char *)&v56);
LABEL_77:
                close(v39);
                goto LABEL_51;
              }

              qword_100028BF0 |= 0x2000000000uLL;
              v51 = __error();
              strerror(*v51);
              goto LABEL_72;
            }
          }

          else
          {
            IOObjectRelease(v36);
          }
        }

        else
        {
          sub_10000444C(1, "%s: Failed to find llb object %s", "delete_ASP_Firmware", "Apple LLB Media");
        }

        sub_10000444C(1, "%s: Failed to find LLB device");
        goto LABEL_51;
      }

      sub_10000444C(1, "%s: Could not get the ASPStorage service; Trying NVMe", "deleteFirmware");
      v27 = IOServiceMatching("AppleEmbeddedNVMeController");
      if (v27)
      {
        if (IOServiceGetMatchingService(kIOMainPortDefault, v27))
        {
          uint64_t v55 = 1LL;
          if (sub_10000E990((char *)&v56))
          {
            qword_100028BF0 |= (unint64_t)&_mh_execute_header;
            goto LABEL_45;
          }

          int v45 = open((const char *)&v56, 1);
          if (v45 != -1)
          {
            int v39 = v45;
            sub_10000444C(1, "%s: Opened Device '%s': ", "delete_NVMe_Firmware", (const char *)&v56);
            uint64_t v54 = &v52;
            uint64_t v52 = 0LL;
            uint64_t v53 = sub_10000EBF4(v39, (const char *)&v56);
            int v46 = ioctl(v39, 0x8010641FuLL, &v54);
            if (v46)
            {
              int v47 = v46;
              qword_100028BF0 |= 0x10000000000uLL;
              __int16 v48 = __error();
              v49 = strerror(*v48);
              sub_10000444C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_NVMe_Firmware", v47, v49);
            }

            sub_10000444C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_NVMe_Firmware", (const char *)&v56);
            goto LABEL_77;
          }

          qword_100028BF0 |= 0x8000000000uLL;
          v50 = __error();
          strerror(*v50);
LABEL_72:
          sub_10000444C(1, "%s: Unable to open '%s': err='%s': ");
          goto LABEL_51;
        }

        qword_100028BF0 |= 0x200000000uLL;
        int v23 = "%s: Could not get the NVMe service as well; giving up...";
      }

      else
      {
        int v23 = "%s: Could not create NVMe matching dictionary";
      }
    }

    else
    {
      int v23 = "%s: Could not create ASP Storage MATCHING Dictionary";
    }
  }

  else
  {
    qword_100028BF0 |= 0x400000000uLL;
    int v23 = "%s: Could not create AppleImage3NORAccess MATCHING Dictionary";
  }

  int v24 = 1;
LABEL_52:
  sub_10000444C(v24, v23, "deleteFirmware");
  sub_10000444C(1, "%s: Delete Any existing EAN", "brick");
  v56.gl_pathc = (size_t)"aptk";
  return sub_10000E000((uint64_t)&v56, 1u);
}

void sub_10000A71C()
{
  if (byte_100028D00) {
    int v0 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    int v0 = "/private/var";
  }
  if (byte_100028D00) {
    size_t v1 = 37LL;
  }
  else {
    size_t v1 = 12LL;
  }
  sub_100004590(2, "/.obliteration_preserved", 0LL);
  uint64_t v2 = __strlcpy_chk(path, byte_100028BF8, 1024LL, 1025LL);
  int v3 = mkpath_np(path, 0x1EDu);
  if (v3 && v3 != 17)
  {
    strerror(v3);
    sub_10000444C(1, "%s: Could not create folder '%s' for temporary storage, error: %s");
    return;
  }

  unint64_t v4 = (const __CFArray *)qword_100028D48;
  if (!qword_100028D48) {
    return;
  }
  CFIndex v5 = 0LL;
  uint64_t v6 = 0LL;
  off_t v7 = &path[v2];
  size_t v8 = 1025 - (int)v2;
  while (v5 < CFArrayGetCount(v4))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100028D48, v5);
    if (CFStringGetCString(ValueAtIndex, v7, v8, 0x8000100u))
    {
      int v10 = realpath_DARWIN_EXTSN(v7, 0LL);
      if (v10)
      {
        CFComparisonResult v11 = v10;
        if (!strncmp(v10, v0, v1))
        {
          strlcpy(v7, &v11[v1], v8);
          uint64_t v12 = strrchr(path, 47);
          if (!v12 || v12 == path)
          {
            sub_10000444C(1, "%s: Could not find path of '%s', skipping");
          }

          else
          {
            char v13 = v12;
            *uint64_t v12 = 0;
            int v14 = mkpath_np(path, 0x1EDu);
            if (v14 && v14 != 17)
            {
              strerror(v14);
              sub_10000444C(1, "%s: Could not create folder '%s' in temporary location, error: %s");
            }

            else
            {
              *char v13 = 47;
              size_t v15 = strdup(v11);
              if (v15)
              {
                uint64_t v16 = v15;
                char v17 = strdup(path);
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v27 = v6;
                  int v28 = &v16[v1];
                  while (1)
                  {
                    size_t v19 = strrchr(v16, 47);
                    time_t v20 = v19;
                    if (!v19 || v19 == v28) {
                      goto LABEL_42;
                    }
                    *size_t v19 = 0;
                    io_service_t v21 = strrchr(v18, 47);
                    if (!v21)
                    {
                      sub_10000444C( 1,  "%s: Failed to find next '/' in destination path %s, might be malformed",  "copy_preserved_files_to_storage",  v18);
                      goto LABEL_43;
                    }

                    time_t v20 = v21;
                    char *v21 = 0;
                    if (stat(v16, &v29))
                    {
                      int v23 = __error();
                      strerror(*v23);
                      __error();
                      sub_10000444C(1, "%s: Failed to stat '%s' with error %s (%d)");
                      goto LABEL_42;
                    }

                    if (chown(v18, v29.st_uid, v29.st_gid)) {
                      break;
                    }
                    if (chmod(v18, v29.st_mode))
                    {
                      CFDictionaryRef v22 = __error();
                      strerror(*v22);
                      __error();
                      sub_10000444C(1, "%s: Failed to change mode of '%s' with error %s (%d)");
                      goto LABEL_42;
                    }
                  }

                  int v24 = __error();
                  strerror(*v24);
                  __error();
                  sub_10000444C(1, "%s: Failed to change ownership of '%s' with error %s (%d)");
LABEL_42:
                  if (v20 != v28)
                  {
LABEL_43:
                    sub_10000444C(1, "%s: Failed to set permissions on %s", "copy_preserved_files_to_storage", v11);
                    uint64_t v6 = v27;
                    goto LABEL_47;
                  }

                  uint64_t v6 = v27;
                  if (copyfile(v11, path, 0LL, 0xFu))
                  {
                    v25 = __error();
                    io_service_t v26 = strerror(*v25);
                    sub_10000444C( 1,  "%s: Could not copy file '%s' to temporary location '%s', error: %s",  "copy_preserved_files_to_storage",  v11,  path,  v26);
                  }

                  else
                  {
                    sub_10000444C( 1,  "%s: Successfully copied file '%s' to temporary location '%s'",  "copy_preserved_files_to_storage",  v11,  path);
                    uint64_t v6 = (v27 + 1);
                  }

LABEL_47:
                  free(v11);
                  free(v16);
                  free(v18);
                }

                else
                {
                  sub_10000444C(1, "%s: Failed to copy destination path %s", "copy_preserved_files_to_storage", path);
                  free(v11);
                  free(v16);
                }

                goto LABEL_36;
              }

              sub_10000444C(1, "%s: Failed to copy source path %s");
            }
          }
        }

        else
        {
          sub_10000444C( 1,  "%s: File '%s' is not under the Data (or User) volume '%s', skipping",  "copy_preserved_files_to_storage",  v11,  v0);
        }

        free(v11);
      }

      else
      {
        sub_10000444C(1, "%s: Could not find the real path of '%s', skipping");
      }
    }

    else
    {
      sub_10000444C(1, "%s: Could not extract C-string for path... skipping");
    }

LABEL_36:
    ++v5;
    unint64_t v4 = (const __CFArray *)qword_100028D48;
    if (!qword_100028D48) {
      break;
    }
  }

uint64_t sub_10000AC54()
{
  time_t v6 = time(0LL);
  int v0 = ctime(&v6);
  sub_10000444C(1, "%s: Starting termination of Daemons:%s", "terminate_daemons", v0);
  uint64_t v1 = reboot3(0x4000000000000000LL);
  if ((_DWORD)v1) {
    int v2 = *__error();
  }
  else {
    int v2 = 0;
  }
  if (dword_1000286C0 != -1)
  {
    close(dword_1000286C0);
    dword_1000286C0 = open("/dev/console", 9);
  }

  if ((_DWORD)v1)
  {
    int v3 = strerror(v2);
    sub_10000444C(1, "%s: Reboot3: obliterate shutdown failed with error %s", "terminate_daemons", v3);
    uint64_t v1 = 0xFFFFFFFFLL;
  }

  else
  {
    sub_10000444C(1, "%s: Reboot3: obliterate shutdown Completed", "terminate_daemons");
  }

  time_t v6 = time(0LL);
  unint64_t v4 = ctime(&v6);
  sub_10000444C(0, "%s: Termination of daemons completed at %s", "terminate_daemons", v4);
  return v1;
}

void sub_10000AD5C(id a1)
{
}

void sub_10000AD68(id a1)
{
}

void sub_10000AD74(id a1)
{
}

BOOL sub_10000AD94()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/filesystems");
  if (!v0) {
    return 0LL;
  }
  io_object_t v1 = v0;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", kCFAllocatorDefault, 0);
  BOOL v3 = CFProperty != 0LL;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  IOObjectRelease(v1);
  return v3;
}

uint64_t sub_10000AE0C(int a1, int a2)
{
  unint64_t v4 = sub_100004378(a1);
  CFIndex v5 = v4;
  if (a2) {
    int v6 = 0x80000;
  }
  else {
    int v6 = 0;
  }
  if (unmount(v4, v6) == -1)
  {
    if (a2) {
      size_t v8 = "force-";
    }
    else {
      size_t v8 = "";
    }
    CFTypeRef v9 = __error();
    int v10 = strerror(*v9);
    sub_10000444C(1, "%s: Could not %sunmount %s: %s", "unmount_volume", v8, v5, v10);
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    if (!a1) {
      byte_100028D18 = 1;
    }
  }

  return result;
}

void sub_10000AEBC(const char *a1, char *a2)
{
  uint64_t v4 = 0LL;
  if (sscanf(a1, "disk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "disk%d");
  }

  else if (sscanf(a1, "/dev/disk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "/dev/disk%d");
  }

  else if (sscanf(a1, "/dev/rdisk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "/dev/rdisk%d");
  }

  else
  {
    sub_10000444C( 1,  "%s: Data volume path looks odd: %s, defaulting to %s\n",  "get_container_from_volume",  a1,  "/dev/rdisk0s1");
    strcpy(a2, "/dev/rdisk0s1");
  }

uint64_t sub_10000AFD0(const char *a1, const char *a2, int a3, int a4, _BYTE *a5)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if ((sub_100004300(1, "obliterate_data_volume") & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    if (byte_100028D41 == 1)
    {
      if (a4 && sub_10000AE0C(1, 1))
      {
        CFComparisonResult v11 = __error();
        sub_10000444C( 1,  "%s: SafeWipe: Could not unmount the User volume %s (error: %d)",  "obliterate_data_volume",  a2,  *v11);
      }

      if (sub_10000AE0C(0, 1))
      {
        uint64_t v12 = __error();
        sub_10000444C( 1,  "%s: SafeWipe: Could not unmount the Data volume %s (error: %d)",  "obliterate_data_volume",  a2,  *v12);
      }
    }

    sub_10000444C(1, "%s: Calling APFSVolumeDelete", "obliterate_data_volume");
    if (APFSVolumeDelete(a2))
    {
      qword_100028BF0 |= 0x2000000uLL;
      sub_10000444C(1, "%s: Could not delete the Data volume %s (error: %d)");
    }
  }

  else
  {
    sub_10000444C(1, "%s: NoDelete requested, skipping deletion, just create+format");
  }

  if ((sub_100004300(2, "obliterate_data_volume") & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  sub_10000444C(1, "%s: Delete other non fstab APFS volumes if present", "obliterate_data_volume");
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v14 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  size_t v15 = v14;
  if (Mutable) {
    BOOL v16 = v14 == 0LL;
  }
  else {
    BOOL v16 = 1;
  }
  char v17 = "removeOtherAPFSVolumes";
  if (v16)
  {
    sub_10000444C(1, "%s: Unable to create Mutable Arrays, bail");
LABEL_59:
    io_service_t v26 = 0LL;
LABEL_62:
    int v39 = 0;
    goto LABEL_63;
  }

  sub_10000444C(1, "%s: Creating a list of fssepc nodes from fstab", "removeOtherAPFSVolumes");
  if (setfsent())
  {
    uint64_t v18 = a5;
    size_t v19 = getfsent();
    if (v19)
    {
      time_t v20 = v19;
      do
      {
        *(_WORD *)buffer = 0;
        CFStringRef v21 = CFStringCreateWithCString(kCFAllocatorDefault, v20->fs_spec, 0x8000100u);
        fs_spec = v20->fs_spec;
        if (v21)
        {
          CFStringRef v23 = v21;
          sub_10000444C(1, "%s: Adding fspec to the spec node array:%s", "removeOtherAPFSVolumes", fs_spec);
          CFArrayAppendValue(Mutable, v23);
          CFRelease(v23);
        }

        else
        {
          sub_10000444C(1, "%s: Failed to create CFStr for spec file:%s", "removeOtherAPFSVolumes", fs_spec);
        }

        if (APFSVolumeRole(v20->fs_spec, buffer, 0LL))
        {
          sub_10000444C(1, "%s: APFSVolumeRole for %s failed with %d");
        }

        else if (*(unsigned __int16 *)buffer == 192)
        {
          __strlcpy_chk(&byte_100028DA0, v20->fs_spec, 64LL, 64LL);
          __strlcpy_chk(aPrivateVarMobi_1, v20->fs_file, 1024LL, 1024LL);
          sub_10000444C(1, "%s: Found Update volume device %s, default mount point '%s'");
        }

        else if (*(unsigned __int16 *)buffer == 320)
        {
          __strlcpy_chk(&byte_100028D60, v20->fs_spec, 64LL, 64LL);
          __strlcpy_chk(aPrivateVarHard, v20->fs_file, 1024LL, 1024LL);
          sub_10000444C(1, "%s: Found Hardware volume device %s, default mount point '%s'");
        }

        time_t v20 = getfsent();
      }

      while (v20);
    }

    endfsent();
    a5 = v18;
  }

  int Count = CFArrayGetCount(Mutable);
  if (!Count)
  {
    sub_10000444C(1, "%s: Unable to find any FSSpec nodes in fstab, bailing");
    goto LABEL_59;
  }

  sub_10000444C(1, "%s: Creating List of APFS volume Spec Nodes", "removeOtherAPFSVolumes");
  v25 = sub_10000E338();
  io_service_t v26 = v25;
  if (!v25)
  {
    sub_10000444C(1, "%s: Unable to find any APFS Volume FSSpec nodes from IORegistry, bailing");
    goto LABEL_62;
  }

  int v27 = CFArrayGetCount(v25);
  if (!v27)
  {
    sub_10000444C(1, "%s: APFS Volume FSSpec nodes list empty , bailing");
    goto LABEL_62;
  }

  int v47 = a1;
  __int16 v48 = a5;
  if (v27 >= 1)
  {
    CFIndex v28 = 0LL;
    uint64_t v49 = v27;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v26, v28);
      if (Count < 1) {
        goto LABEL_43;
      }
      int v30 = v26;
      int v31 = v17;
      int v32 = v15;
      CFIndex v33 = 0LL;
      char v34 = 0;
      do
      {
        io_service_t v35 = (const __CFString *)CFArrayGetValueAtIndex(Mutable, v33);
        v34 |= CFStringFind(v35, ValueAtIndex, 0x40uLL).location != -1;
        ++v33;
      }

      while (Count != v33);
      size_t v15 = v32;
      char v17 = v31;
      io_service_t v26 = v30;
      if ((v34 & 1) == 0) {
LABEL_43:
      }
        CFArrayAppendValue(v15, ValueAtIndex);
      ++v28;
    }

    while (v28 != v49);
  }

  int v36 = CFArrayGetCount(v15);
  if (v36)
  {
    if (v36 >= 1)
    {
      CFIndex v37 = 0LL;
      uint64_t v38 = v36;
      int v39 = 1;
      while (1)
      {
        int v40 = (const __CFString *)CFArrayGetValueAtIndex(v15, v37);
        *(_OWORD *)buffer = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        CFStringGetCString(v40, buffer, 256LL, 0x8000100u);
        __int16 v50 = 0;
        uint64_t v41 = APFSVolumeRole(buffer, &v50, 0LL);
        if (v50 == 4)
        {
          dispatch_time_t v43 = "%s: Skipping deletion of non fstab volume with role Recovery: %s";
        }

        else if (v50 != 704 {
               || (int v42 = APFSOverProvModel(v41),
        }
                   dispatch_time_t v43 = "%s: Skipping deletion of non fstab volume with role Overprovision: %s",
                   v42 != 2))
        {
          sub_10000444C(1, "%s: Trying to delete APFS volume: %s", v17, buffer);
          else {
            sub_10000444C(1, "%s: Successfully deleted volume: %s");
          }
          goto LABEL_56;
        }

        sub_10000444C(1, v43, v17, buffer);
LABEL_56:
        if (v38 == ++v37) {
          goto LABEL_89;
        }
      }
    }

    int v39 = 1;
LABEL_89:
    a1 = v47;
    a5 = v48;
  }

  else
  {
    int v39 = 1;
    sub_10000444C(1, "%s: Found no extraneous APFS volumes to delete", v17);
    a1 = v47;
    a5 = v48;
  }

LABEL_63:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v39)
  {
    sub_10000444C(1, "%s: Completed deletion of non fstab APFS volumes if present", "obliterate_data_volume");
  }

  else
  {
    sub_10000444C(1, "%s: Could not delete existing non fstab APFS volumes", "obliterate_data_volume");
    qword_100028BF0 |= 0x4000000uLL;
  }

  *a5 = 0;
  sub_10000444C(1, "%s: Calling APFSContainerWipeVolumeKeys for container %s", "obliterate_data_volume", a1);
  if (APFSContainerWipeVolumeKeys(a1))
  {
    qword_100028BF0 |= 0x8000000uLL;
    sub_10000444C(1, "%s: APFSContainerWipeVolumeKeys failed for container %s (error: %d)");
    return 0xFFFFFFFFLL;
  }

  if ((sub_100004300(3, "obliterate_data_volume") & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (byte_100028BE9)
  {
    sub_10000444C(1, "%s: Wiping xART on VM", "obliterate_data_volume");
    *(_OWORD *)buffer = *(_OWORD *)&off_100024C38;
    sub_10000E000((uint64_t)buffer, 2u);
LABEL_79:
    sub_10000444C(1, "%s: Revoking D Key", "obliterate_data_volume");
    if (MKBDeviceObliterateClassDKey())
    {
      qword_100028BF0 |= 0x20000000uLL;
      uint64_t v44 = 0xFFFFFFFFLL;
      sub_10000444C(1, "%s: Unable to obliterate class-d key: %d", "obliterate_data_volume", -1);
      return v44;
    }

    if ((sub_100004300(5, "obliterate_data_volume") & 1) == 0)
    {
      *a5 = 1;
      CFAbsoluteTime v46 = CFAbsoluteTimeGetCurrent();
      sub_10000444C( 1,  "%s: obliterate_data_volume() took %f seconds to complete with result %d",  "obliterate_data_volume",  v46 - Current,  0);
      return 0LL;
    }

    return 0xFFFFFFFFLL;
  }

  sub_10000444C(1, "%s: Telling SEP to obliterate gigalockers.", "obliterate_data_volume");
  if (!sub_100011308())
  {
    qword_100028BF0 |= 0x10000000uLL;
    sub_10000444C(1, "%s: Failed to obliterate gigalockers.");
    return 0xFFFFFFFFLL;
  }

  if ((sub_100004300(4, "obliterate_data_volume") & 1) == 0) {
    goto LABEL_79;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000B7C4(char *a1, int a2, char *a3, const char *a4)
{
  __argv[0] = "/sbin/newfs_apfs";
  __argv[1] = "-A";
  if (a4) {
    off_t v7 = a4;
  }
  else {
    off_t v7 = "reformat_volume";
  }
  __argv[2] = "-P";
  __argv[3] = "-v";
  if (a2) {
    size_t v8 = "Data";
  }
  else {
    size_t v8 = "User";
  }
  __argv[4] = v8;
  __argv[5] = "-R";
  CFTypeRef v9 = "u";
  if (a2) {
    CFTypeRef v9 = "d";
  }
  __argv[6] = v9;
  __argv[7] = "-D";
  __argv[8] = a1;
  __argv[9] = 0LL;
  sub_10000444C(1, "%s: %s: Calling newfs_apfs for the %s volume on container %s", "reformat_volume", v7, v8, a1);
  if (sub_1000109BC((const char **)__argv, 0LL))
  {
    uint64_t v10 = 0x40000LL;
    if (a2) {
      uint64_t v10 = 1024LL;
    }
    qword_100028BF0 |= v10;
    sub_10000444C(1, "%s: %s: Could not newfs the Data volume: %d");
    return 0xFFFFFFFFLL;
  }

  sub_10000444C( 1,  "%s: %s: newfs_apfs for the %s volume completed OK, looking up new volume dev node",  "reformat_volume",  v7,  v8);
  if (a2) {
    uint64_t v11 = 64LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  if (APFSVolumeRoleFind(a1, v11, &theArray) || CFArrayGetCount(theArray) != 1)
  {
    if (theArray)
    {
      CFMutableArrayRef v14 = CFStringCreateWithFormat(0LL, 0LL, @"%@", theArray);
      if (v14)
      {
        size_t v15 = v14;
        CStringPtr = CFStringGetCStringPtr(v14, 0x8000100u);
        char v17 = "<error getting string>";
        if (CStringPtr) {
          char v17 = CStringPtr;
        }
        sub_10000444C(1, "%s: %s: APFSVolumeRoleFind returned %s", "reformat_volume", v7, v17);
        CFRelease(v15);
      }

      else
      {
        sub_10000444C(1, "%s: %s: APFSVolumeRoleFind returned %s", "reformat_volume", v7, "<error getting string>");
      }

      CFRelease(theArray);
    }

    qword_100028BF0 |= 0x100000000000uLL;
    sub_10000444C(1, "%s: %s: Error: expected exactly one volume with '%s' role");
    return 0xFFFFFFFFLL;
  }

  if (a3)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0LL);
    CFStringGetCString(ValueAtIndex, a3, 64LL, 0x8000100u);
    sub_10000444C(1, "%s: %s: newfs_apfs new volume dev node is %s", "reformat_volume", v7, a3);
  }

  CFRelease(theArray);
  return 0LL;
}

void *sub_10000BA70(void *a1, int a2)
{
  BOOL v3 = a1;
  if (a1 || (BOOL v3 = sub_10000F29C()) != 0LL)
  {
    sub_10000FD64((uint64_t)v3, 0LL, a2);
    if (setfsent())
    {
      uint64_t v4 = getfsent();
      if (v4)
      {
        CFIndex v5 = v4;
        do
        {
          sub_100004590(0, "/", 0LL);
          fs_file = v5->fs_file;
          size_t v7 = strlen(fs_file);
          size_t v8 = strlen(byte_100028BF8);
          if (v7 > v8 && !strncmp(fs_file, byte_100028BF8, v8))
          {
            sub_10000444C(1, "%s: Adding FSENT path %s", "setup_default_content_for_data_volume", fs_file);
            sub_10000F564((uint64_t)v3, v5->fs_file, 0LL);
          }

          CFIndex v5 = getfsent();
        }

        while (v5);
      }

      endfsent();
    }

    if (sub_10000F9B8((uint64_t)v3))
    {
      sub_10000444C(1, "%s: Could not finalize FS capture.", "setup_default_content_for_data_volume");
      if (v3)
      {
        free(v3);
        return 0LL;
      }
    }

    else
    {
      sub_10000444C(1, "%s: Successfully setup default Data volume content", "setup_default_content_for_data_volume");
      sub_10000F23C((uint64_t)v3);
    }
  }

  else
  {
    sub_10000444C(1, "%s: Could not create FS scraper.", "setup_default_content_for_data_volume");
  }

  return v3;
}

uint64_t sub_10000BBEC(char *a1)
{
  __argv[0] = "/sbin/mount_tmpfs";
  __argv[1] = a1;
  __argv[2] = 0LL;
  int v1 = mkpath_np(a1, 0x1EDu);
  if (v1 && v1 != 17)
  {
    qword_100028BF0 |= 0x1000000000000000uLL;
    strerror(v1);
    sub_10000444C(1, "%s: Could not create tmpfs folder at %s, error: %d (%s)");
  }

  else
  {
    uint64_t result = sub_1000109BC((const char **)__argv, 0LL);
    if (!(_DWORD)result) {
      return result;
    }
    qword_100028BF0 |= 0x2000000000000000uLL;
    strerror(result);
    sub_10000444C(1, "%s: Could not create tmpfs at %s, error: %d (%s)");
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000BCE4(char *a1, char *a2)
{
  __argv[0] = "/sbin/mount_apfs";
  __argv[1] = a1;
  __argv[2] = a2;
  __argv[3] = 0LL;
  uint64_t result = sub_1000109BC((const char **)__argv, 0LL);
  if ((_DWORD)result)
  {
    int v5 = result;
    qword_100028BF0 |= 0x200000000000uLL;
    int v6 = strerror(result);
    sub_10000444C(1, "%s: Could not mount volume: %s at %s, error: %d (%s)", "mount_volume", a1, a2, v5, v6);
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_10000BDA0(const char *a1, const char *a2, const char *a3, char a4)
{
  id v58 = 0LL;
  UInt8 bytes = 0;
  sub_10000444C( 1,  "%s: Setting up user on %s (device: %s, user device: %s)",  "multiuser_mode_setup_user_and_data_volumes",  a2,  a1,  a3);
  size_t v8 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 1LL);
  if (!v8)
  {
    sub_10000444C(1, "%s: Failed to convert data mount point string %s to NSString");
LABEL_14:
    id v11 = 0LL;
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_114;
  }

  CFTypeRef v9 = v8;
  id v10 = +[UMLManager sharedManager](&OBJC_CLASS___UMLManager, "sharedManager");
  if (!v10)
  {
    sub_10000444C(1, "%s: Failed to obtain shared UserManagement instance");
    goto LABEL_14;
  }

  id v11 = [v10 createPrimaryUserOnSharedDataVolumePath:v9 withError:&v58];
  if (v11) {
    BOOL v12 = v58 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v17 = 0LL;
    goto LABEL_23;
  }

  if (v58)
  {
    char v13 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v58);
    if (v13)
    {
      CFMutableArrayRef v14 = v13;
      CStringPtr = CFStringGetCStringPtr(v13, 0x8000100u);
      BOOL v16 = "<error getting string>";
      if (CStringPtr) {
        BOOL v16 = CStringPtr;
      }
      sub_10000444C( 1,  "%s: Failed to create primary user with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  v16);
      CFRelease(v14);
    }

    else
    {
      sub_10000444C( 1,  "%s: Failed to create primary user with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
    }

    uint64_t v17 = (uint64_t)[v58 code];
  }

  else
  {
    uint64_t v17 = 0xFFFFFFFFLL;
  }

  if (v11 && (a4 & 1) == 0)
  {
    if (v58)
    {

      id v58 = 0LL;
    }

LABEL_23:
    id v18 = [v11 uid];
    size_t v19 = CFStringCreateWithFormat(0, 0, @"%@", [v11 userUUID]);
    id v56 = v18;
    if (v19)
    {
      time_t v20 = v19;
      CFStringRef v21 = CFStringGetCStringPtr(v19, 0x8000100u);
      if (v21) {
        CFDictionaryRef v22 = v21;
      }
      else {
        CFDictionaryRef v22 = "<error getting string>";
      }
      sub_10000444C( 1,  "%s: Primary user create with uuid: %s and session uid:%d",  "multiuser_mode_setup_user_and_data_volumes",  v22,  (_DWORD)v18);
      CFRelease(v20);
    }

    else
    {
      sub_10000444C( 1,  "%s: Primary user create with uuid: %s and session uid:%d",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>",  (_DWORD)v18);
    }

    CFUUIDRef v23 = CFUUIDCreateFromString(kCFAllocatorDefault, (CFStringRef)[v11 userUUID]);
    int v24 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v23);
    if (v24)
    {
      v25 = v24;
      io_service_t v26 = CFStringGetCStringPtr(v24, 0x8000100u);
      if (v26) {
        int v27 = v26;
      }
      else {
        int v27 = "<error getting string>";
      }
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst attempt with UUID %s",  "multiuser_mode_setup_user_and_data_volumes",  v27);
      CFRelease(v25);
    }

    else
    {
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst attempt with UUID %s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
    }

    CFDataRef v28 = CFDataCreate(kCFAllocatorDefault, &bytes, 1LL);
    stat v29 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v28);
    if (v29)
    {
      int v30 = v29;
      int v31 = CFStringGetCStringPtr(v29, 0x8000100u);
      if (v31) {
        int v32 = v31;
      }
      else {
        int v32 = "<error getting string>";
      }
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst attempt with emptyPass %s",  "multiuser_mode_setup_user_and_data_volumes",  v32);
      CFRelease(v30);
      if (!v23) {
        goto LABEL_45;
      }
    }

    else
    {
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst attempt with emptyPass %s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
      if (!v23) {
        goto LABEL_45;
      }
    }

    if (v28 && (AKSIdentityCreateFirst(v23, v28, &v58) & 1) != 0)
    {
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst success, loading the identity",  "multiuser_mode_setup_user_and_data_volumes");
LABEL_55:
      if (v58)
      {

        id v58 = 0LL;
      }

      if ((AKSIdentityLoad(v23, v56, &v58) & 1) != 0)
      {
        sub_10000444C( 1,  "%s: AKSIdentityLoad Succeeded, calling SetPrimary",  "multiuser_mode_setup_user_and_data_volumes");
      }

      else
      {
        CFIndex v37 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v58);
        if (v37)
        {
          uint64_t v38 = v37;
          int v39 = CFStringGetCStringPtr(v37, 0x8000100u);
          if (v39) {
            int v40 = v39;
          }
          else {
            int v40 = "<error getting string>";
          }
          sub_10000444C( 1,  "%s: AKSIdentityLoad failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  v40);
          CFRelease(v38);
        }

        else
        {
          sub_10000444C( 1,  "%s: AKSIdentityLoad failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
        }

        if (v58) {
          uint64_t v17 = (uint64_t)[v58 code];
        }
        else {
          uint64_t v17 = 0xFFFFFFFFLL;
        }
        if ((a4 & 1) != 0) {
          goto LABEL_110;
        }
      }

      if (v58)
      {

        id v58 = 0LL;
      }

      if ((AKSIdentitySetPrimary(v56, v28, &v58) & 1) != 0)
      {
        sub_10000444C( 1,  "%s: AKSIdentitySetPrimary succeded, binding Shared data volume",  "multiuser_mode_setup_user_and_data_volumes");
        goto LABEL_83;
      }

      uint64_t v41 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v58);
      if (v41)
      {
        int v42 = v41;
        dispatch_time_t v43 = CFStringGetCStringPtr(v41, 0x8000100u);
        if (v43) {
          uint64_t v44 = v43;
        }
        else {
          uint64_t v44 = "<error getting string>";
        }
        sub_10000444C( 1,  "%s: AKSIdentitySetPrimary failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  v44);
        CFRelease(v42);
      }

      else
      {
        sub_10000444C( 1,  "%s: AKSIdentitySetPrimary failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
      }

      if (v58) {
        uint64_t v17 = (uint64_t)[v58 code];
      }
      else {
        uint64_t v17 = 0xFFFFFFFFLL;
      }
      if ((a4 & 1) == 0)
      {
LABEL_83:
        sub_10000444C(1, "%s: Binding shared data volume to primary identity", "multiuser_mode_APFS_bind_data_volume");
        if (CFStringGetCString((CFStringRef)[v11 userUUID], buffer, 256, 0x8000100u))
        {
          if (uuid_parse(buffer, uu))
          {
            sub_10000444C(1, "%s: Failed to parse unique string to uuid_t");
          }

          else
          {
            sub_10000444C( 1,  "%s: Calling APFSVolumeEnableUserProtectionWithOptions with device_node:%s userUUID:%s",  "multiuser_mode_APFS_bind_data_volume",  a1,  buffer);
            int v45 = APFSVolumeEnableUserProtectionWithOptions(a1, uu, v28, 8LL);
            if (!v45)
            {
              sub_10000444C( 1,  "%s: Shared data volume bound to AKS with primary identity",  "multiuser_mode_APFS_bind_data_volume");
              sub_10000444C( 1,  "%s: Shared data volume bound to AKS with primary",  "multiuser_mode_setup_user_and_data_volumes");
              goto LABEL_90;
            }

            strerror(v45);
            sub_10000444C(1, "%s: APFSVolumeEnableUserProtectionWithOptions failed with error:%s");
          }
        }

        else
        {
          sub_10000444C(1, "%s: Failed to retrieve CString from user UUID-string");
        }

        sub_10000444C(1, "%s: Failed to bind Shared data volume", "multiuser_mode_setup_user_and_data_volumes");
        uint64_t v17 = 0xFFFFFFFFLL;
        if ((a4 & 1) != 0) {
          goto LABEL_110;
        }
LABEL_90:
        if (v58)
        {

          id v58 = 0LL;
        }

        CFAbsoluteTime v46 = -[NSString lastPathComponent]( +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a3, 1LL),  "lastPathComponent");
        int v47 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v46);
        if (v47)
        {
          __int16 v48 = v47;
          uint64_t v49 = CFStringGetCStringPtr(v47, 0x8000100u);
          if (v49) {
            __int16 v50 = v49;
          }
          else {
            __int16 v50 = "<error getting string>";
          }
          sub_10000444C( 1,  "%s: User Data Volume, calling volume map on %s",  "multiuser_mode_setup_user_and_data_volumes",  v50);
          CFRelease(v48);
          if (!v46)
          {
LABEL_101:
            v51 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v58);
            if (v51)
            {
              __int128 v52 = v51;
              __int128 v53 = CFStringGetCStringPtr(v51, 0x8000100u);
              if (v53) {
                __int128 v54 = v53;
              }
              else {
                __int128 v54 = "<error getting string>";
              }
              sub_10000444C( 1,  "%s: AKSVolumeMap not called (userDisk unavailable) or failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  v54);
              CFRelease(v52);
            }

            else
            {
              sub_10000444C( 1,  "%s: AKSVolumeMap not called (userDisk unavailable) or failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
            }

            if (v58) {
              uint64_t v17 = (uint64_t)[v58 code];
            }
            else {
              uint64_t v17 = 0xFFFFFFFFLL;
            }
            goto LABEL_110;
          }
        }

        else
        {
          sub_10000444C( 1,  "%s: User Data Volume, calling volume map on %s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
          if (!v46) {
            goto LABEL_101;
          }
        }

        if ((AKSVolumeMap(v46, v56, 0LL, &v58) & 1) != 0)
        {
          sub_10000444C(1, "%s: AKS VolumeMapPath Success", "multiuser_mode_setup_user_and_data_volumes");
          goto LABEL_110;
        }

        goto LABEL_101;
      }

    id v18 = 0LL;
LABEL_24:
    munmap(v36, st_size);
    goto LABEL_25;
  }

  size_t v19 = __error();
  strerror(*v19);
  ramrod_log_msg("unable to open image '%s': %s\n", v20, v21, v22, v23, v24, v25, v26, v7);
  return 0LL;
}

LABEL_110:
      if (v23) {
        CFRelease(v23);
      }
      if (v28) {
        CFRelease(v28);
      }
      goto LABEL_114;
    }

LABEL_45:
    CFIndex v33 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v58);
    if (v33)
    {
      char v34 = v33;
      io_service_t v35 = CFStringGetCStringPtr(v33, 0x8000100u);
      if (v35) {
        int v36 = v35;
      }
      else {
        int v36 = "<error getting string>";
      }
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst not called (cfuuid or emptyPassRef unavailable) or failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  v36);
      CFRelease(v34);
    }

    else
    {
      sub_10000444C( 1,  "%s: AKSIdentityCreateFirst not called (cfuuid or emptyPassRef unavailable) or failed with error:%s",  "multiuser_mode_setup_user_and_data_volumes",  "<error getting string>");
    }

    if (v58) {
      uint64_t v17 = (uint64_t)[v58 code];
    }
    else {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    if ((a4 & 1) != 0) {
      goto LABEL_110;
    }
    goto LABEL_55;
  }

LABEL_114:
  return v17;
}

uint64_t sub_10000C5D8(uint64_t a1)
{
  int v27 = 0;
  uint64_t v26 = 0LL;
  memset(v29, 0, sizeof(v29));
  int v1 = APFSOverProvModel(a1);
  if (!v1)
  {
    size_t v8 = "None";
LABEL_13:
    sub_10000444C(1, "%s: System OVP model is %s", "create_overprovisioning_file", v8);
    return 0LL;
  }

  if (v1 != 1)
  {
    size_t v8 = "unknown";
    if (v1 == 2) {
      size_t v8 = "Volume based";
    }
    goto LABEL_13;
  }

  sub_10000444C( 1,  "%s: System OVP model is %s",  "create_overprovisioning_file",  "File based - going to create the OVP file now");
  v25[3] = 0LL;
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  statfs("/", &v28);
  int v2 = strstr(v28.f_mntfromname, "disk");
  if (v2)
  {
    if (v2[4] < 48)
    {
      LODWORD(v3) = 0;
    }

    else
    {
      unint64_t v3 = 0LL;
      unsigned int v4 = v2[4];
      int v5 = v2 + 5;
      while (v4 <= 0x39 && v3 <= 1)
      {
        v22[v3] = v4;
        int v6 = v3 + 1;
        int v7 = v5[v3];
        unsigned int v4 = v5[v3++];
        if (v7 <= 47)
        {
          LODWORD(v3) = v6;
          break;
        }
      }
    }

    v22[v3] = 0;
  }

  __sprintf_chk((char *)v29, 0, 0x40uLL, "/dev/rdisk%s", v22);
  int v10 = open((const char *)v29, 0);
  if (v10 != -1)
  {
    int v11 = v10;
    if (ioctl(v10, 0x40046418uLL, &v27) == -1)
    {
      uint64_t v9 = *__error();
      __error();
      sub_10000444C(1, "%s: unable to get DKIOCGETBLOCKSIZE: %d\n");
    }

    else if (ioctl(v11, 0x40086419uLL, &v26) == -1)
    {
      uint64_t v9 = *__error();
      __error();
      sub_10000444C(1, "%s: unable to get DKIOCGETBLOCKCOUNT: %d\n");
    }

    else
    {
      uint64_t v12 = v26 * v27;
      uint64_t v13 = v12 + 0x3FFFFFFF;
      if (v12 >= 0) {
        uint64_t v13 = v26 * v27;
      }
      sub_10000444C(1, "%s: device_uint32_t size = %llu (%lld GB)\n", "create_overprovisioning_file", v26 * v27, v13 >> 30);
      else {
        unint64_t v14 = v12 / 100;
      }
      sub_10000444C(1, "%s: file_uint32_t size = %llu (%lld GB)\n", "create_overprovisioning_file", v14, v14 >> 30);
      sub_100004590(0, 0LL, "/.overprovisioning_file");
      int v15 = open_dprotected_np(byte_100028BF8, 2562, 6, 0, 384LL);
      if (v15 != -1)
      {
        int v16 = v15;
        v25[0] = 0x300000002LL;
        v25[1] = 0LL;
        v25[2] = v14;
        if (fcntl(v15, 42, v25) == -1 && *__error() == 28 && (LODWORD(v25[0]) = 0, fcntl(v16, 42, v25) == -1))
        {
          uint64_t v9 = *__error();
          __error();
          sub_10000444C(1, "%s: preallocation of %llu bytes failed: %d \n");
        }

        else
        {
          uint64_t v17 = ftruncate(v16, v14);
          if ((_DWORD)v17)
          {
            uint64_t v9 = v17;
            __error();
            sub_10000444C(1, "%s: failed to write to %s file to establish the size (%d).\n");
          }

          else
          {
            uint64_t v20 = fcntl(v16, 51, 0LL);
            if ((_DWORD)v20)
            {
              uint64_t v9 = v20;
              __error();
              sub_10000444C(1, "%s: failed to fullsync %s file with %d.\n");
            }

            else
            {
              uint64_t v23 = 0LL;
              unint64_t v24 = v14;
              if (fcntl(v16, 100, &v23) == -1)
              {
                uint64_t v9 = *__error();
                __error();
                sub_10000444C(1, "%s: F_TRIM_ACTIVE_FILE failed with: %d \n");
              }

              else
              {
                uint64_t v9 = 0LL;
              }
            }
          }
        }

        close(v11);
        int v19 = v16;
        goto LABEL_42;
      }

      uint64_t v9 = *__error();
      __error();
      sub_10000444C(1, "%s: Could not open %s with error %d\n");
    }

    int v19 = v11;
LABEL_42:
    close(v19);
    return v9;
  }

  uint64_t v9 = *__error();
  id v18 = __error();
  sub_10000444C(1, "%s: unable to open device: %d\n", "create_overprovisioning_file", *v18);
  return v9;
}

uint64_t sub_10000CA68(uint64_t a1)
{
  int v2 = umask(0);
  sub_10000444C(1, "%s: Old mask has value %o; New mask has value %o.", "rebuild_data_volume", v2, 0);
  uid_t v3 = geteuid();
  uid_t v4 = getuid();
  pid_t v5 = getpid();
  pid_t v6 = getppid();
  sub_10000444C(1, "%s: EUID = %d; UID = %d; PID = %d; PPID = %d.", "rebuild_data_volume", v3, v4, v5, v6);
  sub_10000444C(1, "%s: Creating whitelist directories", "rebuild_data_volume");
  if (byte_100028D00) {
    int v7 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    int v7 = "/private/var";
  }
  int v8 = aks_bootstrap_fs(v7, 2LL);
  if (v8)
  {
    qword_100028BF0 |= 0x400000000000uLL;
    sub_10000444C(1, "%s: aksutils_bootstrap_fs failed: %d", "rebuild_data_volume", v8);
  }

  sub_10001013C();
  sub_10000444C(1, "%s: Creating system keybag", "rebuild_data_volume");
  if (byte_100028D00) {
    uint64_t v9 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    uint64_t v9 = "/private/var";
  }
  int System = MKBKeyBagCreateSystem(0LL, v9);
  if (System)
  {
    qword_100028BF0 |= 0x1000000000000uLL;
    sub_10000444C(1, "%s: Unable to create keybag: %d", "rebuild_data_volume", System);
    uint64_t v11 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  sub_10000444C(1, "%s: Restoring Data volume content", "rebuild_data_volume");
  if (byte_100028D00) {
    uint64_t v12 = "/private/var/tmp/alt_root";
  }
  else {
    uint64_t v12 = "/";
  }
  if (sub_10000FA1C(a1, (uint64_t)v12))
  {
    qword_100028BF0 |= 0x800000000000uLL;
    uint64_t v11 = 0xFFFFFFFFLL;
    sub_10000444C(1, "%s: Unable to restore filesystem stuff.");
  }

  else
  {
    sub_10000444C(1, "%s: Restoring Data volume content Completed");
  }

  sub_100004590(4, "/private", "/var/db/timezone/localtime");
  if (symlink("/var/db/timezone/zoneinfo/US/Pacific", byte_100028BF8) == -1)
  {
    if (*__error() == 17)
    {
      sub_10000444C(1, "%s: Timezone symlink already exists.");
    }

    else
    {
      qword_100028BF0 |= 8uLL;
      unint64_t v14 = __error();
      int v15 = strerror(*v14);
      sub_10000444C(1, "%s: Could not symlink the timezone file '%s': %s", "rebuild_data_volume", byte_100028BF8, v15);
      uint64_t v11 = 0xFFFFFFFFLL;
    }
  }

  else
  {
    sub_10000444C(1, "%s: Symlink of TZDEFAULT(%s) to US/Pacific Completed OK", "rebuild_data_volume", byte_100028BF8);
    if (lchmod(byte_100028BF8, 0x1EDu) == -1)
    {
      uint64_t v13 = __error();
      strerror(*v13);
      sub_10000444C(1, "%s: Could not set 0755 permission on symlink: %s");
    }
  }

  sub_10000FFB8();
  sub_100004590(0, "/root", "/.obliterated");
  int v16 = open(byte_100028BF8, 513, 420LL);
  if (v16 == -1)
  {
    qword_100028BF0 |= 0x8000uLL;
    uint64_t v17 = __error();
    id v18 = strerror(*v17);
    sub_10000444C(1, "%s: Could not create the '.obliterated' marker file: %s", "rebuild_data_volume", v18);
  }

  else
  {
    close(v16);
  }

  return v11;
}

id sub_10000CD78(uint64_t a1)
{
  id v19 = 0LL;
  int v1 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a1, 1LL);
  int v2 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", "/", 1LL);
  uid_t v3 = v2;
  if (v1) {
    BOOL v4 = v2 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4
    || (objc_msgSend( +[UMLManager sharedManager](UMLManager, "sharedManager"),  "createPrimaryUserLayoutWithOnUserVolumePath:fromSystemVolumePath:withError:",  v1,  v2,  &v19) & 1) == 0)
  {
    pid_t v6 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v1);
    if (v6)
    {
      int v7 = v6;
      CStringPtr = CFStringGetCStringPtr(v6, 0x8000100u);
      if (CStringPtr) {
        uint64_t v9 = CStringPtr;
      }
      else {
        uint64_t v9 = "<error getting string>";
      }
      sub_10000444C(1, "%s: createPrimaryUserLayout for user mount point %s", "multiuser_mode_rebuild_user_volume", v9);
      CFRelease(v7);
    }

    else
    {
      sub_10000444C( 1,  "%s: createPrimaryUserLayout for user mount point %s",  "multiuser_mode_rebuild_user_volume",  "<error getting string>");
    }

    int v10 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v3);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = CFStringGetCStringPtr(v10, 0x8000100u);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = "<error getting string>";
      }
      sub_10000444C( 1,  "%s: createPrimaryUserLayout for system mount point %s",  "multiuser_mode_rebuild_user_volume",  v13);
      CFRelease(v11);
    }

    else
    {
      sub_10000444C( 1,  "%s: createPrimaryUserLayout for system mount point %s",  "multiuser_mode_rebuild_user_volume",  "<error getting string>");
    }

    unint64_t v14 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v19);
    if (v14)
    {
      int v15 = v14;
      int v16 = CFStringGetCStringPtr(v14, 0x8000100u);
      if (v16) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = "<error getting string>";
      }
      sub_10000444C( 1,  "%s: createPrimaryUserLayoutWithOnUserVolumePath failed with error:%s",  "multiuser_mode_rebuild_user_volume",  v17);
      CFRelease(v15);
    }

    else
    {
      sub_10000444C( 1,  "%s: createPrimaryUserLayoutWithOnUserVolumePath failed with error:%s",  "multiuser_mode_rebuild_user_volume",  "<error getting string>");
    }

    id v5 = [v19 code];
  }

  else
  {
    sub_10000444C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath Success", "multiuser_mode_rebuild_user_volume");
    id v5 = 0LL;
  }

  return v5;
}

uint64_t sub_10000CFB0(int a1, _BYTE *a2)
{
  if (a1 == 192)
  {
    uid_t v3 = aPrivateVarMobi_1;
    BOOL v4 = &byte_100028DA0;
    id v5 = "Update";
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (a1 != 320)
  {
    sub_10000444C(1, "%s: Unknown or unsupported volume role 0x%x");
    return 0LL;
  }

  uid_t v3 = aPrivateVarHard;
  BOOL v4 = &byte_100028D60;
  id v5 = "Hardware";
  if (a2) {
LABEL_6:
  }
    *a2 = 0;
LABEL_7:
  if (!*v4)
  {
    sub_10000444C(1, "%s: Warning: %s volume device-node/default-mount unknown!");
    return 0LL;
  }

  if (*v3)
  {
    if (!statfs(v3, &v13))
    {
      size_t v6 = strlen(v3);
      if (!strncmp(v13.f_mntonname, v3, v6))
      {
        uint64_t v11 = v4;
        uint64_t v12 = v3;
        int v10 = v5;
        uint64_t v9 = "%s: %s volume %s is already mounted at '%s'";
LABEL_21:
        uint64_t v7 = 1LL;
        sub_10000444C(1, v9, "try_mount_volume_by_role", v10, v11, v12);
        return v7;
      }
    }
  }

  if (!sub_10000BCE4(v4, v3))
  {
    if (a2) {
      *a2 = 1;
    }
    int v10 = v5;
    uint64_t v9 = "%s: Successfully mounted %s volume";
    goto LABEL_21;
  }

  sub_10000444C(1, "%s: Failed to mount %s volume (%s) with error %d");
  return 0LL;
}

uint64_t sub_10000D160()
{
  io_registry_entry_t v0 = removefile_state_alloc();
  int value = 0;
  if (removefile_state_set(v0, 3u, sub_10000E64C))
  {
    int v1 = __error();
    int v2 = strerror(*v1);
    sub_10000444C(1, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", "RemoveFileLayout", v2);
  }

  if (removefile_state_set(v0, 4u, &value))
  {
    uid_t v3 = __error();
    BOOL v4 = strerror(*v3);
    sub_10000444C(1, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", "RemoveFileLayout", v4);
  }

  if (removefile(byte_100028BF8, v0, 1u) && (int v5 = *__error(), v5 != 2) || (int v5 = value, (value & 0xFFFFFFFD) != 0))
  {
    size_t v6 = strerror(v5);
    sub_10000444C(1, "%s: removefile for %s failed with error:%s", "RemoveFileLayout", byte_100028BF8, v6);
  }

  return removefile_state_free(v0);
}

void sub_10000D260()
{
  id v0 = objc_msgSend( +[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"),  "copyPersistentDataPathsWithError:",  &v66);
  int v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v1)
  {
    int v2 = v1;
    -[NSMutableDictionary setObject:forKey:](v1, "setObject:forKey:", @"remove", off_1000286C8);
    uid_t v3 = &AKSIdentityCreateFirst_ptr;
    if (v0 && [v0 count])
    {
      id v4 = objc_msgSend( +[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"),  "copyMountPointForVolumeType:error:",  1,  0);
      if (!v4 || (id v5 = v4, ![v4 length]))
      {
        sub_10000444C(1, "%s: Warning: Failed to determine HW volume for MSU DA", "fixup_hardware_volume");
        goto LABEL_57;
      }

      __int128 v61 = (char *)[v5 length];
      if ([v5 characterAtIndex:v61 - 1] != 47)
      {
        id v5 = [v5 stringByAppendingString:@"/"];
        __int128 v61 = (char *)[v5 length];
      }

      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v6 = [v0 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v6)
      {
        id v7 = v6;
        int v8 = @"Path not part of HW volume: '%@'";
        uint64_t v9 = *(void *)v63;
        id v60 = v5;
        do
        {
          for (CFIndex i = 0LL; i != v7; CFIndex i = (char *)i + 1)
          {
            if (*(void *)v63 != v9) {
              objc_enumerationMutation(v0);
            }
            uint64_t v11 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            if (v11 && [*(id *)(*((void *)&v62 + 1) + 8 * (void)i) hasPrefix:v5])
            {
              id v12 = v0;
              statfs v13 = v8;
              id v14 = [v11 substringFromIndex:v61];
              if ([v14 containsString:@"/"])
              {
                id v15 = [v14 pathComponents];
                if ((unint64_t)[v15 count] < 2)
                {
                  id v31 = [v3[144] stringWithFormat:@"Failed to parse path '%@'", v11];
                  int v32 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v31);
                  if (v32)
                  {
                    CFIndex v33 = v32;
                    CStringPtr = CFStringGetCStringPtr(v32, 0x8000100u);
                    if (CStringPtr) {
                      io_service_t v35 = CStringPtr;
                    }
                    else {
                      io_service_t v35 = "<error getting string>";
                    }
                    sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v35);
                    CFRelease(v33);
                  }

                  else
                  {
                    sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
                  }

                  goto LABEL_44;
                }

                id v16 = objc_msgSend( v3[144],  "pathWithComponents:",  objc_msgSend(v15, "subarrayWithRange:", 0, (char *)objc_msgSend(v15, "count") - 1));
                id v17 = objc_msgSend(v15, "objectAtIndexedSubscript:", (char *)objc_msgSend(v15, "count") - 1);
                if (-[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v16))
                {
                  unsigned int v18 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v2,  "objectForKeyedSubscript:",  v16),  "hasPrefix:",  @"removeExcept /");
                  id v19 = v3;
                  unsigned int v20 = v18;
                  CFStringRef v21 = v19[144];
                  id v22 = -[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v16);
                  if (v20)
                  {
                    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  [v21 stringWithFormat:@"%@ /%@/", v22, v17],  v16);
                    uid_t v3 = &AKSIdentityCreateFirst_ptr;
                    goto LABEL_29;
                  }

                  id v31 = [v21 stringWithFormat:@"Mismatched rules from MSU DA: new: '%@' (going to be ignored), current exceptions list for path: '%@'", v16, v22];
                  int v36 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v31);
                  if (v36)
                  {
                    CFIndex v37 = v36;
                    uint64_t v38 = CFStringGetCStringPtr(v36, 0x8000100u);
                    if (v38) {
                      int v39 = v38;
                    }
                    else {
                      int v39 = "<error getting string>";
                    }
                    sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v39);
                    CFRelease(v37);
                  }

                  else
                  {
                    sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
                  }

                  uid_t v3 = &AKSIdentityCreateFirst_ptr;
LABEL_44:
                  int v8 = v13;
                  free(v31);
LABEL_45:
                  id v0 = v12;
                  id v5 = v60;
                  continue;
                }

                stat v29 = (const __CFString *)[v3[144] stringWithFormat:@"removeExcept /%@/", v17];
                statfs v28 = v2;
                id v30 = v16;
              }

              else
              {
                statfs v28 = v2;
                stat v29 = @"keep";
                id v30 = v14;
              }

              -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v29, v30);
LABEL_29:
              int v8 = v13;
              goto LABEL_45;
            }

            id v23 = objc_msgSend(v3[144], "stringWithFormat:", v8, v11);
            unint64_t v24 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v23);
            if (v24)
            {
              v25 = v24;
              uint64_t v26 = CFStringGetCStringPtr(v24, 0x8000100u);
              if (v26) {
                int v27 = v26;
              }
              else {
                int v27 = "<error getting string>";
              }
              sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v27);
              CFRelease(v25);
            }

            else
            {
              sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
            }

            free(v23);
          }

          id v7 = [v0 countByEnumeratingWithState:&v62 objects:v67 count:16];
        }

        while (v7);
      }
    }

    else
    {
      int v40 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Warning: Failed to get default persistent data paths: error %@",  v66);
      uint64_t v41 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v40);
      if (v41)
      {
        int v42 = v41;
        dispatch_time_t v43 = CFStringGetCStringPtr(v41, 0x8000100u);
        uint64_t v44 = "<error getting string>";
        if (v43) {
          uint64_t v44 = v43;
        }
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v44);
        CFRelease(v42);
      }

      else
      {
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }

      free(v40);
    }

LABEL_57:
    if (-[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"MobileActivation"))
    {
      id v45 = [v3[144] stringWithFormat:@"Warning: A rule for 'MobileActivation' based on 'copyPersistentDataPaths' already exists: '%@'", -[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"MobileActivation")];
      CFAbsoluteTime v46 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v45);
      if (v46)
      {
        int v47 = v46;
        __int16 v48 = CFStringGetCStringPtr(v46, 0x8000100u);
        uint64_t v49 = "<error getting string>";
        if (v48) {
          uint64_t v49 = v48;
        }
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v49);
        CFRelease(v47);
      }

      else
      {
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }

      free(v45);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  @"removeExcept /dcrt/ /sdcrt/",  @"MobileActivation");
    }

    if (-[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"dcrt"))
    {
      id v50 = [v3[144] stringWithFormat:@"Warning: A rule for 'dcrt' based on 'copyPersistentDataPaths' already exists: '%@'", -[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"dcrt")];
      v51 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v50);
      if (v51)
      {
        __int128 v52 = v51;
        __int128 v53 = CFStringGetCStringPtr(v51, 0x8000100u);
        __int128 v54 = "<error getting string>";
        if (v53) {
          __int128 v54 = v53;
        }
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v54);
        CFRelease(v52);
      }

      else
      {
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }

      free(v50);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", @"keep", @"dcrt");
    }

    if (-[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"sdcrt"))
    {
      id v55 = [v3[144] stringWithFormat:@"Warning: A rule for 'sdcrt' based on 'copyPersistentDataPaths' already exists: '%@'", -[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"sdcrt")];
      id v56 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v55);
      if (v56)
      {
        __int128 v57 = v56;
        id v58 = CFStringGetCStringPtr(v56, 0x8000100u);
        __int128 v59 = "<error getting string>";
        if (v58) {
          __int128 v59 = v58;
        }
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", v59);
        CFRelease(v57);
      }

      else
      {
        sub_10000444C(1, "%s: %s", "fixup_hardware_volume", "<error getting string>");
      }

      free(v55);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", @"keep", @"sdcrt");
    }

    -[DiskSupport traverseFolderAndRemoveItems:exceptions:]( +[DiskSupport sharedInstance](DiskSupport, "sharedInstance"),  "traverseFolderAndRemoveItems:exceptions:",  [v3[144] stringWithUTF8String:aPrivateVarHard],  v2);
  }

  else
  {
    sub_10000444C(1, "%s: Could not create exceptions dictionary", "fixup_hardware_volume");
  }

void sub_10000DB3C(int a1)
{
  if (a1 == 192)
  {
    int v1 = aPrivateVarMobi_1;
  }

  else
  {
    if (a1 != 320)
    {
      sub_10000444C(1, "%s: Unknown or unsupported volume role 0x%x");
      return;
    }

    int v1 = aPrivateVarHard;
  }

  if (unmount(v1, 0x80000))
  {
    qword_100028BF0 |= 0x8000000000000000LL;
    int v2 = __error();
    strerror(*v2);
    sub_10000444C(1, "%s: Failed to unmount the %s volume: %s");
  }

  else
  {
    sub_10000444C(1, "%s: Successfully unmounted the %s volume");
  }

void sub_10000DC0C()
{
}

void sub_10000DC48(CFStringRef jobLabel)
{
  if (SMJobRemove(kSMDomainSystemLaunchd, jobLabel, 0LL, 1u, &outError))
  {
    int v2 = CFStringCreateWithFormat(0LL, 0LL, @"%@", jobLabel);
    if (v2)
    {
      uid_t v3 = v2;
      CFStringGetCStringPtr(v2, 0x8000100u);
      sub_10000444C(1, "%s: SMJobRemove:%s Success");
LABEL_6:
      CFRelease(v3);
      return;
    }

    sub_10000444C(1, "%s: SMJobRemove:%s Success");
  }

  else
  {
    CFErrorGetCode(outError);
    id v4 = CFStringCreateWithFormat(0LL, 0LL, @"%@", jobLabel);
    if (v4)
    {
      uid_t v3 = v4;
      CFStringGetCStringPtr(v4, 0x8000100u);
      sub_10000444C(1, "%s: SMJobRemove:%s Failed, returned error:%d");
      goto LABEL_6;
    }

    sub_10000444C(1, "%s: SMJobRemove:%s Failed, returned error:%d");
  }

uint64_t sub_10000DDA0()
{
  kern_return_t v3;
  BOOL v4;
  uint64_t v5;
  kern_return_t v6;
  io_connect_t connect;
  connect = 0;
  id v0 = IOServiceMatching("IOWatchdog");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    sub_10000444C(1, "%s: Failed to discover watchdog service");
    return 0xFFFFFFFFLL;
  }

  io_object_t v2 = MatchingService;
  uid_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
  IOObjectRelease(v2);
  if (v3) {
    id v4 = 1;
  }
  else {
    id v4 = connect == 0;
  }
  if (v4)
  {
    sub_10000444C(1, "%s: IOServiceOpen kIOWatchdogUserClientOpen failed with error: %d");
    return 0xFFFFFFFFLL;
  }

  id v6 = IOConnectCallScalarMethod(connect, 3u, 0LL, 0, 0LL, 0LL);
  if (v6)
  {
    sub_10000444C( 1,  "%s: Failed to call kIOWatchdogDaemonDisableUserspaceMonitoring method, returned : %d",  "disable_watchdog_only",  v6);
    id v5 = 0xFFFFFFFFLL;
  }

  else
  {
    sub_10000444C(1, "%s: Disabled watchdog timer", "disable_watchdog_only");
    id v5 = 0LL;
  }

  IOServiceClose(connect);
  return v5;
}

uint64_t sub_10000DEC4(void *a1)
{
  float v3 = *(float *)a1;
  float v2 = *((float *)a1 + 1);
  int v4 = *((_DWORD *)a1 + 2);
  sub_10000444C(1, "%s: \tspawned drawing thread.", "drawing_routine");
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current <= 0.0)
  {
    sub_10000444C(1, "%s: could not get start time");
  }

  else
  {
    double v6 = Current;
    double v7 = CFAbsoluteTimeGetCurrent();
    if (v7 <= 0.0)
    {
LABEL_6:
      sub_10000444C(1, "%s: could not get time");
    }

    else
    {
      double v8 = (float)(v2 - v3);
      double v9 = v3;
      float v10 = 1.2 / (float)v4;
      while (1)
      {
        float v11 = v7 - v6;
        if (byte_100028D50 == 1) {
          break;
        }
        float v12 = v9 + v8 * tanh((float)(v10 * v11));
        sub_10000F214(v12);
        usleep(0x411Au);
        double v7 = CFAbsoluteTimeGetCurrent();
        if (v7 <= 0.0) {
          goto LABEL_6;
        }
      }

      sub_10000444C( 0,  "%s: time to die. setting to %f. %f total seconds elapsed",  "drawing_routine",  *((float *)a1 + 1),  v11);
      sub_10000F214(*((float *)a1 + 1));
    }
  }

  free(a1);
  return 0LL;
}

uint64_t sub_10000E000(uint64_t result, unsigned int a2)
{
  kern_return_t v13;
  CFDictionaryRef v14;
  io_service_t v15;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t input;
  connect = 0;
  input = 0LL;
  output = 0LL;
  outputCnt = 1;
  if (!result) {
    return result;
  }
  float v2 = (const char **)result;
  if (!*(void *)result) {
    return result;
  }
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  if (!v4)
  {
    sub_10000444C(1, "%s: unable to find /defaults node\n", "deviceHasEANStorage");
    goto LABEL_9;
  }

  io_object_t v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"ean-storage-present", kCFAllocatorDefault, 0);
  IOObjectRelease(v5);
  if (!CFProperty)
  {
LABEL_9:
    sub_10000444C(1, "%s: Device Does not Support EAN Storage, skipping...", "eraseEANStorage");
    io_object_t v10 = 0;
    io_object_t v9 = 0;
    goto LABEL_12;
  }

  CFRelease(CFProperty);
  sub_10000444C(1, "%s: Supports EAN Storage, erasing...", "eraseEANStorage");
  double v7 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  io_object_t v9 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      sub_10000444C(1, "%s: Failed to open IOService with error:0x%x");
    }

    else if (connect)
    {
      if (a2)
      {
        uint64_t v11 = a2;
        float v12 = (unsigned int **)v2;
        do
        {
          input = bswap32(**v12);
          sub_10000444C( 1,  "%s: Erasing EAN key %c%c%c%c.\n",  "eraseEANStorage",  BYTE3(input),  WORD1(input),  input >> 8,  input);
          statfs v13 = IOConnectCallMethod(connect, 5u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
          if (v13)
          {
            qword_100028BF0 |= 0x80000000000uLL;
            sub_10000444C(1, "%s: Erasing EAN key failed with error %d\n", "eraseEANStorage", v13);
          }

          ++v12;
          --v11;
        }

        while (v11);
      }

      if (!strcmp(*v2, "xrtC") && !strcmp(v2[1], "xrtP"))
      {
        id v14 = IOServiceMatching("AppleVirtualPlatformXART");
        id v15 = IOServiceGetMatchingService(kIOMainPortDefault, v14);
        io_object_t v10 = v15;
        if (v15)
        {
          if (IORegistryEntrySetCFProperty(v15, @"FORCE-RELOAD", kCFBooleanTrue))
          {
            qword_100028BF0 |= 0x80000000000uLL;
            sub_10000444C(1, "%s: Failed to set FORCE_RELOAD on AppleVirtualPlatformXART with error: %d\n");
          }
        }

        else
        {
          sub_10000444C(1, "%s: Failed to find AppleVirtualPlatformXART\n");
        }

        goto LABEL_12;
      }
    }

    else
    {
      sub_10000444C(1, "%s: IOServiceOpen returned IO_OBJECT_NULL, bailing...");
    }
  }

  else
  {
    sub_10000444C(1, "%s: Unable to find kNVMeEANServiceMatchName, bailing...");
  }

  io_object_t v10 = 0;
LABEL_12:
  uint64_t result = connect;
  if (connect) {
    uint64_t result = IOServiceClose(connect);
  }
  if (v9) {
    uint64_t result = IOObjectRelease(v9);
  }
  if (v10) {
    return IOObjectRelease(v10);
  }
  return result;
}

__CFArray *sub_10000E338()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    int v1 = Mutable;
    sub_10000444C(1, "%s: Creating List of APFS volume Spec Nodes", "findAll_APFSVolumes_OnDevice");
    float v2 = IOServiceMatching("AppleAPFSContainer");
    if (!IOServiceGetMatchingServices(kIOMainPortDefault, v2, &existing))
    {
      io_object_t v3 = IOIteratorNext(existing);
      if (!v3)
      {
        IOObjectRelease(existing);
        sub_10000444C(1, "%s: no APFS containers found");
        goto LABEL_24;
      }

      io_object_t v4 = v3;
      while (!IORegistryEntryGetParentEntry(v4, "IOService", &parent)
           && !IORegistryEntryGetChildIterator(v4, "IOService", &iterator))
      {
        if (IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0)
          || IORegistryEntryCreateCFProperties(v4, &v12, kCFAllocatorDefault, 0))
        {
LABEL_21:
          sub_10000444C(1, "%s: unable to fetch IORegistry properties");
          goto LABEL_24;
        }

        CFRelease(v12);
        CFRelease(properties);
        IOObjectRelease(parent);
        io_object_t v5 = IOIteratorNext(iterator);
        if (v5)
        {
          io_object_t v6 = v5;
          do
          {
            if (IOObjectConformsTo(v6, "AppleAPFSVolume"))
            {
              if (IORegistryEntryCreateCFProperties(v6, &theDict, kCFAllocatorDefault, 0)) {
                goto LABEL_21;
              }
              Value = (const __CFString *)CFDictionaryGetValue(theDict, @"BSD Name");
              CFArrayAppendValue(v1, Value);
              CFStringGetCString(Value, buffer, 256LL, 0x8000100u);
              sub_10000444C( 1,  "%s: Found Volume IOBSD name:%s, added to the list",  "findAll_APFSVolumes_OnDevice",  buffer);
              CFRelease(theDict);
            }

            IOObjectRelease(v6);
            io_object_t v6 = IOIteratorNext(iterator);
          }

          while (v6);
        }

        IOObjectRelease(iterator);
        IOObjectRelease(v4);
        io_object_t v4 = IOIteratorNext(existing);
        if (!v4)
        {
          IOObjectRelease(existing);
          int Count = CFArrayGetCount(v1);
          if (Count)
          {
            sub_10000444C(1, "%s: Found %d Volumes, returning the list", "findAll_APFSVolumes_OnDevice", Count);
            return v1;
          }

          sub_10000444C(1, "%s: Unable to find any APFS Volume FSSpec nodes from IORegistry, bailing");
          goto LABEL_24;
        }
      }
    }

    sub_10000444C(1, "%s: unable to scan IORegistry");
LABEL_24:
    sub_10000444C(1, "%s: Encountered error while finding volumes, NULL returned", "findAll_APFSVolumes_OnDevice");
    CFRelease(v1);
    return 0LL;
  }

  sub_10000444C(1, "%s: could not create temp Array", "findAll_APFSVolumes_OnDevice");
  sub_10000444C(1, "%s: Encountered error while finding volumes, NULL returned", "findAll_APFSVolumes_OnDevice");
  return 0LL;
}

uint64_t sub_10000E64C(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    sub_10000444C( 1,  "%s: removefile hit error for %s but we failed to get the error number",  "_removefile_error_callback",  a2);
    int dst = 2;
  }

  else if (dst != 2)
  {
    io_object_t v5 = strerror(dst);
    sub_10000444C(1, "%s: removefile hit error for %s : %s", "_removefile_error_callback", a2, v5);
    if (dst == 1)
    {
      memset(&v10, 0, sizeof(v10));
      if (lstat(a2, &v10))
      {
        io_object_t v6 = "%s: Failed to stat %s before unsetting UF_IMMUTABLE: %s";
      }

      else
      {
        if ((v10.st_flags & 2) == 0) {
          goto LABEL_8;
        }
        if (lchflags(a2, v10.st_flags & 0xFFFFFFFD))
        {
          io_object_t v6 = "%s: Failed to lchflags %s: %s";
        }

        else
        {
          sub_10000444C(1, "%s: Unset UF_IMMUTABLE on %s", "_removefile_error_callback", a2);
          if (!unlink(a2)) {
            return 0LL;
          }
          io_object_t v6 = "%s: unlink of %s failed: %s";
        }
      }

      double v7 = __error();
      double v8 = strerror(*v7);
      sub_10000444C(1, v6, "_removefile_error_callback", a2, v8);
    }
  }

LABEL_8:
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0LL;
}

uint64_t sub_10000E7AC(uint64_t a1)
{
  byte_100028D50 = 1;
  int v2 = pthread_join((pthread_t)qword_100028D58, 0LL);
  if (v2) {
    BOOL v3 = v2 == 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    sub_10000444C(0, "%s: Couldn't wait for thread: %d", "end_fakery_block_invoke", v2);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000E818()
{
  *(_OWORD *)__argv = *(_OWORD *)off_100024C88;
  __int128 v2 = *(_OWORD *)&off_100024C98;
  int v0 = sub_1000109BC((const char **)__argv, 0LL);
  if (v0) {
    sub_10000444C(1, "%s: Failed to remount preboot as read-write: %d", "remountPreboot", v0);
  }
}

uint64_t sub_10000E898(const char *a1)
{
  uint64_t v2 = unlink(a1);
  if ((_DWORD)v2)
  {
    if (*__error() != 2)
    {
      BOOL v3 = __error();
      strerror(*v3);
      sub_10000444C(1, "%s: Failed to delete kernelcache at %s: %s");
    }
  }

  else
  {
    sub_10000444C(0, "%s: Deleted kernelcache at %s", "deleteKernelcacheAtPath", a1);
    sub_10000444C(1, "%s: Deleted kernelcache");
  }

  return v2;
}

int sub_10000E938(id a1, const char *a2, int a3)
{
  if (a3 != 20)
  {
    io_object_t v4 = strerror(a3);
    sub_10000444C(1, "%s: glob_b: %s: %s", "deleteKernelcaches_block_invoke", a2, v4);
  }

  return 0;
}

uint64_t sub_10000E990(char *a1)
{
  io_iterator_t existing = 0;
  uint64_t v2 = IOServiceMatching("IOMedia");
  if (!v2)
  {
    uint64_t v5 = 12LL;
    strerror(12);
    sub_10000444C(1, "%s: Failed to create match dictionary: %s");
    return v5;
  }

  BOOL v3 = v2;
  CFDictionaryAddValue(v2, @"Leaf", kCFBooleanTrue);
  CFDictionaryAddValue(v3, @"Whole", kCFBooleanTrue);
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    uint64_t v5 = MatchingServices;
    mach_error_string(MatchingServices);
    sub_10000444C(1, "%s: Cannot find entries matching %s: %s");
    return v5;
  }

  io_object_t v6 = IOIteratorNext(existing);
  if (!v6)
  {
LABEL_13:
    uint64_t v5 = 0LL;
    goto LABEL_14;
  }

  io_object_t v7 = v6;
  while (1)
  {
    CFTypeRef v8 = IORegistryEntrySearchCFProperty(v7, "IOService", @"EmbeddedDeviceTypeFirmware", kCFAllocatorDefault, 3u);
    if (v8) {
      break;
    }
LABEL_12:
    IOObjectRelease(v7);
    io_object_t v7 = IOIteratorNext(existing);
    if (!v7) {
      goto LABEL_13;
    }
  }

  io_object_t v9 = v8;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v9) || CFBooleanGetValue((CFBooleanRef)v9) != 1)
  {
    CFRelease(v9);
    goto LABEL_12;
  }

  CFRelease(v9);
  CFMutableDictionaryRef properties = 0LL;
  uint64_t v12 = IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0);
  if ((_DWORD)v12)
  {
    uint64_t v5 = v12;
    statfs v13 = mach_error_string(v12);
    sub_10000444C(1, "%s: Failed to create CF properties for firmware partition: %s", "findFirmwarePartition", v13);
  }

  else
  {
    Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
    if (Value)
    {
      strcpy(a1, "/dev/");
      if (CFStringGetCString(Value, a1 + 5, 59LL, 0x8000100u)) {
        uint64_t v5 = 0LL;
      }
      else {
        uint64_t v5 = 22LL;
      }
    }

    else
    {
      sub_10000444C(1, "%s: Failed to get bsd name for firmware partition", "findFirmwarePartition");
      uint64_t v5 = 0LL;
    }

    CFRelease(properties);
  }

  IOObjectRelease(v7);
LABEL_14:
  IOObjectRelease(existing);
  return v5;
}

uint64_t sub_10000EBF4(int a1, const char *a2)
{
  if (ioctl(a1, 0x40046418uLL, &v10) < 0)
  {
    uint64_t v5 = __error();
    io_object_t v6 = strerror(*v5);
    sub_10000444C(1, "%s: FS_partsize: IOCTL DKIOCGETBLOCKSIZE for device %s failed: %s\n", "FS_partsize", a2, v6);
    if (*__error() == 25) {
      sub_10000444C(1, "%s: FS_partsize: The specified device may be a file and not a valid block device. \n");
    }
    goto LABEL_7;
  }

  if (ioctl(a1, 0x40086419uLL, &v9) < 0)
  {
    io_object_t v7 = __error();
    strerror(*v7);
    sub_10000444C(1, "%s: FS_partsize: IOCTL DKIOCGETBLOCKCOUNT for device %s failed: %s\n");
LABEL_7:
    uint64_t v4 = 0x800000LL;
    goto LABEL_8;
  }

  uint64_t v4 = v9 * v10;
LABEL_8:
  sub_10000444C(1, "%s: FS_partsize: for device %s returned %llu\n", "FS_partsize", a2, v4);
  return v4;
}

void sub_10000ECF8(uint64_t a1)
{
  uint64_t v12 = 0LL;
  sub_10000444C(1, "%s: Creating whitelist directories", "safe_setup_volume");
  if (byte_100028D00) {
    uint64_t v2 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    uint64_t v2 = "/private/var";
  }
  int v3 = aks_bootstrap_fs(v2, 2LL);
  if (v3) {
    sub_10000444C(1, "%s: aksutils_bootstrap_fs failed: %d", "safe_setup_volume", v3);
  }
  sub_10000444C(1, "%s: Restoring Data volume content", "safe_setup_volume");
  if (byte_100028D00) {
    uint64_t v4 = "/private/var/tmp/alt_root";
  }
  else {
    uint64_t v4 = "/";
  }
  else {
    sub_10000444C(1, "%s: Restoring Data volume content Completed");
  }
  sub_10000444C(1, "%s: Creating system keybag", "safe_setup_volume");
  if (byte_100028D00) {
    uint64_t v5 = "/private/var/tmp/alt_root/private/var";
  }
  else {
    uint64_t v5 = "/private/var";
  }
  int System = MKBKeyBagCreateSystem(0LL, v5);
  if (System) {
    sub_10000444C(1, "%s: Unable to create keybag: %d", "safe_setup_volume", System);
  }
  sub_10000444C(1, "%s: Creating system keybag - done", "safe_setup_volume");
  sub_100004590(4, "/private", "/var/db/timezone/localtime");
  if (symlink("/var/db/timezone/zoneinfo/US/Pacific", byte_100028BF8) == -1)
  {
    if (*__error() == 17)
    {
      sub_10000444C(1, "%s: Timezone symlink already exists.");
    }

    else
    {
      CFTypeRef v8 = __error();
      strerror(*v8);
      sub_10000444C(1, "%s: Could not symlink the timezone file '%s': %s");
    }
  }

  else if (lchmod(byte_100028BF8, 0x1EDu) == -1)
  {
    io_object_t v7 = __error();
    strerror(*v7);
    sub_10000444C(1, "%s: Could not set 0755 permission on symlink: %s");
  }

  sub_10000444C(1, "%s: done symlink of TZDIR", "safe_setup_volume");
  sub_100004590(0, "/root", "/.obliterated");
  int v9 = open(byte_100028BF8, 513, 420LL);
  if (v9 == -1)
  {
    unsigned int v10 = __error();
    uint64_t v11 = strerror(*v10);
    sub_10000444C(1, "%s: Could not create the '.obliterated' marker file: %s", "safe_setup_volume", v11);
  }

  else
  {
    close(v9);
  }

uint64_t sub_10000EF88(const char *a1)
{
  __uint32_t size = 0LL;
  if (sysctlbyname("kern.bootargs", 0LL, &__size, 0LL, 0LL)) {
    return 0LL;
  }
  int v3 = (char *)malloc(__size);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  if (sysctlbyname("kern.bootargs", v3, &__size, 0LL, 0LL)
    || !-[NSString containsString:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4),  "containsString:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1)))
  {
    uint64_t v2 = 0LL;
  }

  else
  {
    io_object_t v6 = a1;
    uint64_t v2 = 1LL;
    sub_10000444C(1, "%s: found %s in bootargs(%s)", "bootArgsContains", v6, v4);
  }

  free(v4);
  return v2;
}

char *sub_10000F078(int a1)
{
  uint64_t v2 = malloc(0x10000uLL);
  *(_OWORD *)md = 0u;
  __int128 v13 = 0u;
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = (char *)malloc(0x41uLL);
    if (v4)
    {
      CC_SHA256_Init(&c);
      ssize_t v5 = pread(a1, v3, 0x10000uLL, 0LL);
      if (v5 >= 1)
      {
        CC_SHA256_Update(&c, v3, v5);
        goto LABEL_8;
      }

      if ((v5 & 0x8000000000000000LL) == 0)
      {
LABEL_8:
        CC_SHA256_Final(md, &c);
        uint64_t v6 = 0LL;
        io_object_t v7 = v4;
        do
          v7 += snprintf(v7, 3uLL, "%02X", md[v6++]);
        while (v6 != 32);
        goto LABEL_10;
      }

      int v9 = __error();
      unsigned int v10 = strerror(*v9);
      sub_10000444C(1, "%s: Failed to read from input file: %s", "calculate_SHA256_str", v10);
      free(v4);
      uint64_t v4 = 0LL;
    }

    else
    {
      sub_10000444C(1, "%s: Failed to allocate %d bytes for SHA result string", "calculate_SHA256_str", 65);
    }

LABEL_10:
    free(v3);
    return v4;
  }

  sub_10000444C(1, "%s: Failed to allocate %d bytes for SHA calculation", "calculate_SHA256_str", 0x10000);
  return 0LL;
}

uint64_t sub_10000F214(float a1)
{
  return 0LL;
}

void sub_10000F23C(uint64_t a1)
{
  if (a1) {
    sub_10000444C(1, "%s: Scraper stats: files: %zu, dirs: %zu, symlinks: %zu");
  }
  else {
    sub_10000444C(1, "%s: Invalid FS scraper.");
  }
}

void *sub_10000F29C()
{
  int v0 = calloc(1uLL, 0x40uLL);
  if (v0)
  {
    CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
    v0[1] = Mutable;
    if (Mutable)
    {
      *(_DWORD *)int v0 = 1935897200;
      *((_OWORD *)v0 + 2) = 0u;
      *((_OWORD *)v0 + 3) = 0u;
      uint64_t v2 = archive_write_new();
      v0[2] = v2;
      if (v2)
      {
        if (archive_write_set_format_cpio())
        {
          sub_10000444C(1, "%s: Could not set archive type CPIO: %d.");
        }

        else if (archive_write_set_compression_bzip2(v0[2]))
        {
          sub_10000444C(1, "%s: Could not set archive compression to bzip2: %d.");
        }

        else if (archive_write_open(v0[2], v0, sub_10000F418, sub_10000F458, sub_10000F4AC))
        {
          sub_10000444C(1, "%s: Could not set backing memory buffer.");
        }

        else
        {
          uint64_t disk_new = archive_read_disk_new();
          v0[3] = disk_new;
          if (disk_new)
          {
            sub_10000444C(1, "%s: Could not set no-follow symlink mode.");
          }

          else
          {
            sub_10000444C(1, "%s: Could not create archive structure.");
          }
        }
      }

      else
      {
        sub_10000444C(1, "%s: Could not write_mem archive.");
      }
    }

    else
    {
      sub_10000444C(1, "%s: Could not create CFData.");
    }

    sub_10000F4EC(v0);
    return 0LL;
  }

  return v0;
}

uint64_t sub_10000F418()
{
  return 0LL;
}

CFIndex sub_10000F458(int a1, uint64_t a2, UInt8 *bytes, CFIndex length)
{
  if (!a2) {
    return -1LL;
  }
  if (*(_DWORD *)a2 != 1935897200) {
    return -1LL;
  }
  uint64_t v4 = *(__CFData **)(a2 + 8);
  if (!v4) {
    return -1LL;
  }
  CFIndex v5 = length;
  CFDataAppendBytes(v4, bytes, length);
  return v5;
}

uint64_t sub_10000F4AC()
{
  return 0LL;
}

uint64_t sub_10000F4EC(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1935897200) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (const void *)a1[1];
  if (v2)
  {
    CFRelease(v2);
    a1[1] = 0LL;
  }

  if (a1[2]) {
    archive_write_finish();
  }
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  free(a1);
  return 0LL;
}

uint64_t sub_10000F564(uint64_t a1, char *a2, const char *a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a2 && *(_DWORD *)a1 == 1935897200 && *a2 == 47)
  {
    io_object_t v7 = realpath_DARWIN_EXTSN(a2, 0LL);
    if (v7)
    {
      CFTypeRef v8 = v7;
      uint64_t v9 = archive_entry_new();
      if (!v9)
      {
        sub_10000444C(1, "%s: Couldn't create archive entry.", "FSScraperAddPath");
        goto LABEL_13;
      }

      uint64_t v10 = v9;
      archive_entry_set_pathname(v9, v8);
      if (archive_read_disk_entry_from_file(*(void *)(a1 + 24), v10, 0xFFFFFFFFLL, 0LL))
      {
        sub_10000444C(1, "%s: Couldn't read archive entry %s from disk: %d.");
LABEL_9:
        archive_entry_free(v10);
LABEL_13:
        free(v8);
        return v4;
      }

      if (a3)
      {
        if (lstat(a3, &v21) == -1)
        {
          __error();
          sub_10000444C(1, "%s: lstat(2) on '%s' failed: %d");
          goto LABEL_9;
        }

        if ((v21.st_mode & 0xF000) != 0x8000) {
          goto LABEL_33;
        }
        sub_10000444C(1, "%s: Processing reg file at %s", "FSScraperAddPath", a3);
        if (stat(a2, &v20) == -1)
        {
          __error();
          sub_10000444C(1, "%s: stat(2) on '%s' failed: %d");
          goto LABEL_9;
        }

        if ((v20.st_mode & 0xF000) != 0x8000)
        {
LABEL_33:
          sub_10000444C(1, "%s: '%s' isn't a regular file");
          goto LABEL_9;
        }

        archive_entry_set_size(v10, v21.st_size);
      }

      if (archive_write_header(*(void *)(a1 + 16), v10))
      {
        sub_10000444C(1, "%s: Couldn't write archive entry for path %s: %d.");
        goto LABEL_9;
      }

      if (archive_entry_filetype(v10) == 0x8000)
      {
        if (a3)
        {
          int v14 = open(a3, 0);
          if (v14 == -1) {
            goto LABEL_46;
          }
        }

        else
        {
          int v14 = open(a2, 0);
          if (v14 == -1)
          {
LABEL_46:
            __error();
            sub_10000444C(1, "%s: Couldn't open(2) path %s for reading: %d.");
            goto LABEL_9;
          }
        }

        size_t v16 = archive_entry_size(v10);
        id v17 = malloc(v16);
        if (!v17)
        {
          sub_10000444C(1, "%s: Couldn't allocate buffer of  %ld bytes for file %s.", "FSScraperAddPath", v16, a2);
          uint64_t v4 = 0xFFFFFFFFLL;
LABEL_50:
          close(v14);
          goto LABEL_9;
        }

        unsigned int v18 = v17;
        if (v16 == read(v14, v17, v16))
        {
          if (archive_write_data(*(void *)(a1 + 16), v18, v16) == v16)
          {
            uint64_t v19 = *(void *)(a1 + 40) + 1LL;
            *(void *)(a1 + 32) += v16;
            *(void *)(a1 + 40) = v19;
            sub_10000444C( 1,  "%s: Added regular file with size:%zu and total file count:%zu",  "FSScraperAddPath",  v16,  v19);
            sub_10000444C(1, "%s: Added path %s", "FSScraperAddPath", v8);
            uint64_t v4 = 0LL;
LABEL_49:
            free(v18);
            goto LABEL_50;
          }

          sub_10000444C(1, "%s: Couldn't write archive data for path %s: %ld:");
        }

        else
        {
          sub_10000444C(1, "%s: Couldn't read  %ld bytes for file %s, got %ld .");
        }

        uint64_t v4 = 0xFFFFFFFFLL;
        goto LABEL_49;
      }

      if (archive_entry_filetype(v10) == 0x4000)
      {
        id v15 = (void *)(a1 + 48);
      }

      else
      {
        if (archive_entry_filetype(v10) != 40960)
        {
LABEL_37:
          sub_10000444C(1, "%s: Added path %s", "FSScraperAddPath", v8);
          uint64_t v4 = 0LL;
          goto LABEL_9;
        }

        id v15 = (void *)(a1 + 56);
      }

      ++*v15;
      goto LABEL_37;
    }

    int v11 = byte_100028BE8;
    int v12 = *__error();
    if (v11)
    {
      sub_10000444C(1, "%s: Path %s doesn't exist, skipping as path miss is okay: %d.", "FSScraperAddPath", a2, v12);
      return 0LL;
    }

    else
    {
      sub_10000444C(1, "%s: Path %s doesn't exist: %d.", "FSScraperAddPath", a2, v12);
    }
  }

  return v4;
}

uint64_t sub_10000F9B8(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 == 1935897200)
  {
    uint64_t result = archive_write_close(*(void *)(a1 + 16));
    if (!(_DWORD)result) {
      return result;
    }
    sub_10000444C(1, "%s: Failed closing archive: %d.", "FSScraperFinalizeCapture", result);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000FA1C(uint64_t a1, uint64_t a2)
{
  if (!a1 || *(_DWORD *)a1 != 1935897200) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (*(void *)(a1 + 8))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        uint64_t v6 = Mutable;
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 8));
        CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 8));
        uint64_t v9 = CFReadStreamCreateWithBytesNoCopy(0LL, BytePtr, Length, kCFAllocatorNull);
        if (!v9)
        {
          uint64_t v4 = 0xFFFFFFFFLL;
          goto LABEL_16;
        }

        uint64_t v10 = v9;
        if (CFReadStreamOpen(v9))
        {
          CFDictionarySetValue(v6, @"inputStream", v10);
          CFDictionarySetValue(v6, @"compressCPIO", kCFBooleanTrue);
          CFDictionarySetValue(v6, @"extractCPIO", kCFBooleanTrue);
          uint64_t v11 = BOMCopierNew();
          if (v11)
          {
            uint64_t v12 = v11;
            int v13 = BOMCopierCopyWithOptions(v11, 0LL, a2, v6);
            if (v13)
            {
              sub_10000444C(1, "%s: Could not copy with options: %d.\n", "FSScraperRestore", v13);
              uint64_t v4 = 0xFFFFFFFFLL;
            }

            else
            {
              uint64_t v4 = 0LL;
            }

            BOMCopierFree(v12);
            goto LABEL_15;
          }
        }

        else
        {
          sub_10000444C(1, "%s: Could not open read stream.", "FSScraperRestore");
        }

        uint64_t v4 = 0xFFFFFFFFLL;
LABEL_15:
        CFRelease(v10);
LABEL_16:
        CFRelease(v6);
      }
    }
  }

  return v4;
}

uint64_t sub_10000FBC8()
{
  int v0 = sub_100004378(1);
  return sub_10000FBEC(v0, 457, 0x1F5u, 0x1F5u);
}

uint64_t sub_10000FBEC(const char *a1, int a2, uid_t a3, gid_t a4)
{
  if (stat(a1, &v16))
  {
    uint64_t v8 = mkpath_np(a1, a2);
    if ((_DWORD)v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = strerror(v8);
      sub_10000444C(1, "%s: Failed mkpath for path '%s' - %s", "FSScraperCreatePath", a1, v10);
      return v9;
    }

    goto LABEL_6;
  }

  sub_10000444C(1, "%s: Path '%s' already exits", "FSScraperCreatePath", a1);
  if (!chmod(a1, a2)
    || (uint64_t v11 = __error(),
        uint64_t v12 = strerror(*v11),
        sub_10000444C(1, "%s: Failed to change permissions on path '%s' - %s", "FSScraperCreatePath", a1, v12),
        uint64_t v9 = *__error(),
        !(_DWORD)v9))
  {
LABEL_6:
    if (chown(a1, a3, a4))
    {
      int v13 = __error();
      int v14 = strerror(*v13);
      sub_10000444C(1, "%s: Failed to change ownership on path '%s' - %s", "FSScraperCreatePath", a1, v14);
      return *__error();
    }

    else
    {
      sub_10000444C( 1,  "%s: Successfully set up path('%s', mode %03o, uid %d, gid %d)",  "FSScraperCreatePath",  a1,  a2,  a3,  a4);
      return 0LL;
    }
  }

  return v9;
}

uint64_t sub_10000FD64(uint64_t a1, char *a2, int a3)
{
  v16[0] = a2;
  v16[1] = 0LL;
  if (!a2)
  {
    a2 = (char *)sub_100004378(0);
    v16[0] = a2;
  }

  sub_10000444C(1, "%s: FSScraperSetDefaultPaths: examining '%s'", "FSScraperSetDefaultPaths", a2);
  CFIndex v5 = fts_open(v16, 2124, 0LL);
  if (!v5)
  {
    uint64_t v11 = v16[0];
    uint64_t v12 = __error();
    int v13 = strerror(*v12);
    int v14 = __error();
    sub_10000444C(1, "%s: failed to open path %s: %s (%d)\n", "FSScraperSetDefaultPaths", v11, v13, *v14);
    return 0xFFFFFFFFLL;
  }

  uint64_t v6 = v5;
  io_object_t v7 = fts_read(v5);
  if (!v7)
  {
LABEL_15:
    fts_close(v6);
    sub_10000444C(1, "%s: Done with FSScraperSetDefaultPaths()", "FSScraperSetDefaultPaths");
    return 0LL;
  }

  uint64_t v8 = v7;
  while (1)
  {
    unsigned int fts_info = v8->fts_info;
    if (fts_info <= 0xA)
    {
      if (((1 << fts_info) & 0x490) != 0) {
        goto LABEL_8;
      }
      if (((1 << fts_info) & 0x60) != 0) {
        goto LABEL_11;
      }
    }

    if (!v8->fts_errno) {
      goto LABEL_9;
    }
LABEL_8:
    sub_10000444C( 1,  "%s: FSScraperSetDefaultPaths: error in fts_read(), returned info %d, errno %d",  "FSScraperSetDefaultPaths",  v8->fts_info,  v8->fts_errno);
    if (a3) {
      break;
    }
LABEL_9:
    sub_10000F564(a1, v8->fts_path, 0LL);
LABEL_11:
    uint64_t v8 = fts_read(v6);
    if (!v8) {
      goto LABEL_15;
    }
  }

  unsigned int fts_errno = v8->fts_errno;
  if (fts_errno) {
    return fts_errno;
  }
  else {
    return 22LL;
  }
}

uint64_t sub_10000FF18(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 15; i += 5LL)
  {
    sub_100004590(0, "/iomfb_bics_daemon", (&off_100024CB0)[i]);
    if (i * 8) {
      int v3 = byte_100028BF8;
    }
    else {
      int v3 = 0LL;
    }
    sub_10000F564(a1, byte_100028BF8, v3);
  }

  return 0LL;
}

uint64_t sub_10000FFB8()
{
  for (uint64_t i = 0LL; i != 15; i += 5LL)
  {
    sub_100004590(0, "/iomfb_bics_daemon", (&off_100024CB0)[i]);
    sub_100010034();
  }

  return 0LL;
}

uint64_t sub_100010034()
{
  int v0 = open_dprotected_np(byte_100028BF8, 0, 0, 1);
  if (v0 == -1)
  {
    CFIndex v5 = __error();
    uint64_t v3 = *v5;
    uint64_t v6 = strerror(*v5);
    sub_10000444C(1, "%s: failed (%s) to open path %s\n", "_set_path_class", v6, byte_100028BF8);
  }

  else
  {
    int v1 = v0;
    if (fcntl(v0, 64, 4LL))
    {
      uint64_t v2 = __error();
      uint64_t v3 = *v2;
      uint64_t v4 = strerror(*v2);
      sub_10000444C(1, "%s: failed (%s) to update class for %s\n", "_set_path_class", v4, byte_100028BF8);
      if (v1 < 0) {
        return v3;
      }
      goto LABEL_7;
    }

    sub_10000444C(1, "%s: Set %s to protection class:%d\n", "_set_path_class", byte_100028BF8, 4);
    uint64_t v3 = 0LL;
    if ((v1 & 0x80000000) == 0) {
LABEL_7:
    }
      close(v1);
  }

  return v3;
}

uint64_t sub_10001013C()
{
  io_object_t v7 = 0LL;
  CFIndex v5 = 0LL;
  if (getpwnam_r("root", &v8, v9, 0x1000uLL, &v7)
    || (uid_t pw_uid = v7->pw_uid, getgrnam_r("wheel", &v6, v9, 0x1000uLL, &v5)))
  {
    uint64_t v3 = __error();
    uint64_t v1 = *v3;
    uint64_t v4 = strerror(*v3);
    sub_10000444C( 1,  "%s: Failed to get uid or gid for user '%s' or group '%s' - %s\n",  "FSScraperCreateHiloDirPath",  "root",  "wheel",  v4);
  }

  else
  {
    uint64_t v1 = sub_10000FBEC(byte_100028BF8, 488, pw_uid, v5->gr_gid);
    if (!(_DWORD)v1) {
      return sub_100010034();
    }
  }

  return v1;
}

CFMutableDictionaryRef sub_10001029C()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!result) {
    exit(-1);
  }
  return result;
}

const void *sub_1000102DC(const void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFDictionaryGetTypeID()) {
      return v1;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100010310()
{
  if (qword_100028F60 != -1) {
    dispatch_once(&qword_100028F60, &stru_100024E38);
  }
  return byte_100028F68;
}

void sub_100010350(id a1)
{
  int has_internal_content = os_variant_has_internal_content("");
  byte_100028F68 = has_internal_content;
  CFTypeID v2 = "Customer";
  sub_10000444C(0, "%s: Running on an %s build according to OS variant", "runningInternalBuild_block_invoke", v2);
}

uint64_t sub_1000103B0()
{
  if (qword_100028F70 != -1) {
    dispatch_once(&qword_100028F70, &stru_100024E78);
  }
  return byte_100028F78;
}

void sub_1000103F0(id a1)
{
  byte_100028F78 = os_variant_has_internal_diagnostics("com.apple.MobileObliteration");
}

void *sub_100010414(const __CFString *a1, CFIndex *a2)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  CFTypeID TypeID = CFStringGetTypeID();
  group v6 = 0LL;
  if (a2)
  {
    if (v4 == TypeID)
    {
      CFIndex Length = CFStringGetLength(a1);
      CFIndex v8 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      *a2 = v8;
      group v6 = calloc(v8, 1uLL);
      if (v6)
      {
        if (!CFStringGetCString(a1, (char *)v6, v8, 0x8000100u))
        {
          free(v6);
          return 0LL;
        }
      }
    }
  }

  return v6;
}

void *sub_1000104B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFMutableDictionaryRef result = 0LL;
  if (a1 && a2)
  {
    if (a3)
    {
      CFMutableDictionaryRef result = calloc(1uLL, 0x28uLL);
      void *result = a1;
      result[1] = a2;
      result[2] = a3;
    }
  }

  return result;
}

void sub_100010508()
{
  if (qword_100028FA0 != -1) {
    dispatch_once(&qword_100028FA0, &stru_100024FF8);
  }
  qword_100028F88 = qword_100028FA8;
  if (qword_100028FA8)
  {
    if (qword_100028F80 != -1) {
      dispatch_once(&qword_100028F80, &stru_100024EB8);
    }
  }

void sub_10001057C(id a1)
{
}

void sub_100010590(id a1)
{
  uint64_t v1 = calloc(1uLL, 0x10uLL);
  if (v1)
  {
    void *v1 = 0LL;
    v1[1] = v1;
    qword_100028F90 = (uint64_t)v1;
  }

void sub_1000105BC()
{
  if (qword_100028F90)
  {
    if (qword_100028F98 != -1) {
      dispatch_once(&qword_100028F98, &stru_100024F38);
    }
  }

void sub_1000105F0(id a1)
{
  if (qword_100028FA0 != -1) {
    dispatch_once(&qword_100028FA0, &stru_100024FF8);
  }
  dispatch_sync((dispatch_queue_t)qword_100028FA8, &stru_100024F78);
}

void sub_100010638(id a1)
{
  while (1)
  {
    uint64_t v1 = *(void **)qword_100028F90;
    if (!*(void *)qword_100028F90) {
      break;
    }
    uint64_t v2 = v1[3];
    uint64_t v3 = (void *)v1[4];
    if (v2)
    {
      *(void *)(v2 + 32) = v3;
      uint64_t v3 = (void *)v1[4];
    }

    else
    {
      *(void *)(qword_100028F90 + 8) = v3;
    }

    *uint64_t v3 = v2;
    ((void (*)(void))v1[2])(*v1);
    free(v1);
  }

  free((void *)qword_100028F90);
  qword_100028F90 = 0LL;
}

void sub_10001069C(uint64_t a1)
{
  if (a1 && qword_100028F90 && *(void *)(a1 + 8) && *(void *)(a1 + 16))
  {
    if (qword_100028FA0 != -1)
    {
      uint64_t v1 = a1;
      dispatch_once(&qword_100028FA0, &stru_100024FF8);
      a1 = v1;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10001074C;
    block[3] = &unk_100024F98;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_100028FA8, block);
  }

uint64_t sub_10001074C(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 8LL))(**(void **)(a1 + 32));
  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
  uint64_t v3 = qword_100028F90;
  CFTypeID v4 = *(void **)(qword_100028F90 + 8);
  *(void *)(*(void *)(a1 + 32) + 32LL) = v4;
  *CFTypeID v4 = *(void *)(a1 + 32);
  *(void *)(v3 + 8) = *(void *)(a1 + 32) + 24LL;
  return result;
}

void sub_1000107A4(uint64_t a1, uint64_t a2)
{
  if (a2 && a1 && qword_100028F90)
  {
    if (qword_100028FA0 != -1) {
      dispatch_once(&qword_100028FA0, &stru_100024FF8);
    }
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000LL;
    v4[2] = sub_100010848;
    v4[3] = &unk_100024FB8;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_sync((dispatch_queue_t)qword_100028FA8, v4);
  }

void sub_100010848(uint64_t a1)
{
  int v2 = open(*(const char **)(a1 + 32), 522, 384LL, 0LL);
  if (v2 != -1)
  {
    int v3 = v2;
    CFTypeID v4 = *(void **)qword_100028F90;
    if (*(void *)qword_100028F90)
    {
      do
      {
        CFIndex v5 = (const char *)(*(uint64_t (**)(void, uint64_t *))(a1 + 40))(*v4, &v8);
        if (v5)
        {
          group v6 = (char *)v5;
          size_t v7 = strlen(v5);
          write(v3, v6, v7);
          write(v3, "\n", 1uLL);
          free(v6);
        }

        CFTypeID v4 = (void *)v4[3];
      }

      while (v4);
    }

    if (v3 >= 1) {
      close(v3);
    }
  }

BOOL sub_100010910(unsigned int a1, void *a2)
{
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.obliteration.timeout_block", 0LL);
  if (!v4) {
    return 0LL;
  }
  CFIndex v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a2);
  if (v6)
  {
    size_t v7 = v6;
    dispatch_async(v5, v6);
    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL * a1);
    BOOL v9 = dispatch_block_wait(v7, v8) == 0;
    _Block_release(v7);
  }

  else
  {
    BOOL v9 = 0LL;
  }

  dispatch_release(v5);
  return v9;
}

uint64_t sub_1000109BC(const char **__argv, char **__envp)
{
  uint64_t result = waitpid(v4, &v3, 0);
  if ((_DWORD)result != -1)
  {
    if ((v3 & 0x7F) != 0) {
      return 0xFFFFFFFFLL;
    }
    else {
      return BYTE1(v3);
    }
  }

  return result;
}

CFStringRef sub_100010A24(char *cStr, int a2)
{
  if (!cStr)
  {
    sub_10000444C(1, "%s: Invalid argument(s).");
    return 0LL;
  }

  CFStringRef v4 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v4)
  {
    sub_10000444C(1, "%s: Failed to create CFString from C-string for %s");
    return 0LL;
  }

  CFIndex v5 = v4;
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6)
  {
    sub_10000444C(1, "%s: Failed to get the IO registry entry.", "checkNVRAMProperty");
    CFRelease(v5);
    return 0LL;
  }

  io_registry_entry_t v7 = v6;
  CFTypeRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0LL, 0);
  if (CFProperty)
  {
    if (a2)
    {
      mach_error_t v9 = IORegistryEntrySetCFProperty(v7, @"IONVRAM-DELETE-PROPERTY", v5);
      if (v9)
      {
        mach_error_t v10 = v9;
        uint64_t v11 = mach_error_string(v9);
        sub_10000444C( 1,  "%s: Failed to set io registry property for key %s: %s (0x%08x).",  "checkNVRAMProperty",  "IONVRAM-DELETE-PROPERTY",  v11,  v10);
        CFRelease(v5);
        CFIndex v5 = CFProperty;
        CFTypeRef CFProperty = 0LL;
      }
    }
  }

  else
  {
    sub_10000444C(1, "%s: Failed to find property with the key %s", "checkNVRAMProperty", cStr);
  }

  CFRelease(v5);
  IOObjectRelease(v7);
  return CFProperty;
}

CFStringRef sub_100010BA8(char *cStr, int a2)
{
  if (!cStr) {
    return 0LL;
  }
  CFStringRef v3 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v3) {
    return 0LL;
  }
  CFStringRef v4 = v3;
  io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v5)
  {
    CFRelease(v4);
    return 0LL;
  }

  io_registry_entry_t v6 = v5;
  CFTypeRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v5, v4, 0LL, 0);
  if (CFProperty) {
    BOOL v8 = a2 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && IORegistryEntrySetCFProperty(v6, @"IONVRAM-DELETE-PROPERTY", v4))
  {
    CFRelease(v4);
    CFStringRef v4 = CFProperty;
    CFTypeRef CFProperty = 0LL;
  }

  CFRelease(v4);
  IOObjectRelease(v6);
  return CFProperty;
}

uint64_t sub_100010C78(char *cStr, const char *a2)
{
  if (!cStr || !a2)
  {
    sub_10000444C(1, "%s: Invalid argument(s).");
    return 0LL;
  }

  CFStringRef v4 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v4)
  {
    sub_10000444C(1, "%s: Failed to create C string from CFString for '%s'");
    return 0LL;
  }

  io_registry_entry_t v5 = v4;
  CFStringRef v6 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
  if (!v6)
  {
    sub_10000444C(1, "%s: Failed to create C string from CFString for '%s'", "setNVRAMProperty", a2);
    CFRelease(v5);
    return 0LL;
  }

  CFStringRef v7 = v6;
  io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  io_registry_entry_t v9 = v8;
  if (!v8)
  {
    sub_10000444C(1, "%s: Failed to get the IO registry entry.");
    goto LABEL_14;
  }

  mach_error_t v10 = IORegistryEntrySetCFProperty(v8, v5, v7);
  if (v10)
  {
    mach_error_string(v10);
    sub_10000444C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).");
LABEL_14:
    uint64_t v11 = 0LL;
    goto LABEL_16;
  }

  sub_100010E04(v9, cStr);
  uint64_t v11 = 1LL;
LABEL_16:
  CFRelease(v5);
  CFRelease(v7);
  if (v9) {
    IOObjectRelease(v9);
  }
  return v11;
}

void sub_100010E04(io_registry_entry_t a1, const char *a2)
{
  kern_return_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CFIndex v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  __darwin_ct_rune_t v22;
  __darwin_ct_rune_t v23;
  unsigned int v24;
  __darwin_ct_rune_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;
  uint64_t valuePtr;
  CFTypeID TypeID = CFStringGetTypeID();
  io_registry_entry_t v5 = CFStringCreateWithCString(kCFAllocatorDefault, "IONVRAM-FORCESYNCNOW-PROPERTY", 0x8000100u);
  if (!v5)
  {
    sub_10000444C(0, "%s: Error creating CFString for key %s", "SetOFVariable", "IONVRAM-FORCESYNCNOW-PROPERTY");
    return;
  }

  CFStringRef v6 = v5;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, v5, 0LL, 0);
  if (CFProperty)
  {
    io_registry_entry_t v8 = CFProperty;
    CFTypeID TypeID = CFGetTypeID(CFProperty);
    CFRelease(v8);
  }

  if (CFBooleanGetTypeID() == TypeID)
  {
    if (!strcmp("true", a2))
    {
      io_registry_entry_t v9 = &kCFBooleanTrue;
    }

    else
    {
      if (strcmp("false", a2)) {
        goto LABEL_46;
      }
      io_registry_entry_t v9 = &kCFBooleanFalse;
    }

    CFDataRef v11 = *v9;
    if (*v9) {
      goto LABEL_17;
    }
  }

  else
  {
    if (CFNumberGetTypeID() == TypeID)
    {
      int valuePtr = strtol(a2, 0LL, 0);
      mach_error_t v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    }

    else
    {
      if (CFStringGetTypeID() != TypeID)
      {
        if (CFDataGetTypeID() == TypeID)
        {
          int v14 = strlen(a2);
          id v15 = malloc(v14);
          if (v15)
          {
            stat v16 = v15;
            if (v14 >= 1)
            {
              id v17 = 0LL;
              unsigned int v18 = 0LL;
              statfs v28 = v14;
              while (1)
              {
                uint64_t v19 = a2[v18];
                if (v19 == 37)
                {
                  stat v20 = v18 + 2;
                  if (v18 + 2 >= v14) {
                    goto LABEL_45;
                  }
                  stat v21 = v18 + 1;
                  id v22 = a2[v18 + 1];
                  if (v22 < 0)
                  {
                    if (!__maskrune(v22, 0x10000uLL)) {
                      goto LABEL_45;
                    }
                  }

                  else if ((_DefaultRuneLocale.__runetype[v22] & 0x10000) == 0)
                  {
                    goto LABEL_45;
                  }

                  id v23 = a2[v20];
                  if (v23 < 0)
                  {
                    if (!__maskrune(v23, 0x10000uLL))
                    {
LABEL_45:
                      free(v16);
                      goto LABEL_46;
                    }
                  }

                  else if ((_DefaultRuneLocale.__runetype[v23] & 0x10000) == 0)
                  {
                    goto LABEL_45;
                  }

                  unint64_t v24 = __toupper(a2[v21]) - 48;
                  v25 = __toupper(a2[v20]);
                  uint64_t v26 = v25 - 48;
                  int v27 = 16 * v24;
                  if (v24 > 9) {
                    int v27 = 16 * v24 - 112;
                  }
                  if (v26 > 9) {
                    LOBYTE(v26) = v25 - 55;
                  }
                  LOBYTE(v19) = v26 + v27;
                  int v14 = v28;
                }

                else
                {
                  stat v20 = v18;
                }

                *((_BYTE *)v16 + v17) = v19;
                unsigned int v18 = v20 + 1;
                ++v17;
                if (v20 + 1 >= v14) {
                  goto LABEL_43;
                }
              }
            }

            id v17 = 0LL;
LABEL_43:
            CFDataRef v11 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v16, v17);
            free(v16);
            if (v11) {
              goto LABEL_17;
            }
          }
        }

        goto LABEL_46;
      }

      mach_error_t v10 = (const __CFData *)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
    }

    CFDataRef v11 = v10;
    if (v10)
    {
LABEL_17:
      uint64_t v12 = IORegistryEntrySetCFProperty(a1, v6, v11);
      int v13 = "Failed";
      if (!v12) {
        int v13 = "Succeeded";
      }
      sub_10000444C( 0,  "%s: %s setting the property %s to value %s",  "SetOFVariable",  v13,  "IONVRAM-FORCESYNCNOW-PROPERTY",  a2);
      CFRelease(v11);
      goto LABEL_47;
    }
  }

LABEL_46:
  sub_10000444C(0, "%s: Error creating CFTypeRef(%lu) for value %s", "SetOFVariable", TypeID, a2);
LABEL_47:
  CFRelease(v6);
}

BOOL sub_100011138(char *cStr, const void *a2)
{
  kern_return_t v8;
  BOOL v9;
  mach_error_t v10;
  CFStringRef v11;
  CFStringRef v12;
  const char *CStringPtr;
  const char *v14;
  char *v15;
  char *v17;
  if (!cStr || !a2)
  {
    sub_10000444C(1, "%s: Invalid argument(s).");
    return 0LL;
  }

  CFStringRef v4 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v4)
  {
    sub_10000444C(1, "%s: Failed to create C string from CFString for '%s'");
    return 0LL;
  }

  io_registry_entry_t v5 = v4;
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6)
  {
    sub_10000444C(1, "%s: Failed to get the IO registry entry.", "setNVRAMPropertyWithValueRef");
    CFRelease(v5);
    return 0LL;
  }

  io_registry_entry_t v7 = v6;
  io_registry_entry_t v8 = IORegistryEntrySetCFProperty(v6, v5, a2);
  io_registry_entry_t v9 = v8 == 0;
  if (v8)
  {
    mach_error_t v10 = v8;
    CFDataRef v11 = CFStringCreateWithFormat(0LL, 0LL, @"%@", a2);
    if (v11)
    {
      uint64_t v12 = v11;
      CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
      if (CStringPtr) {
        int v14 = CStringPtr;
      }
      else {
        int v14 = "<error getting string>";
      }
      id v15 = mach_error_string(v10);
      sub_10000444C( 1,  "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).",  "setNVRAMPropertyWithValueRef",  cStr,  v14,  v15,  v10);
      CFRelease(v12);
    }

    else
    {
      id v17 = mach_error_string(v10);
      sub_10000444C( 1,  "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).",  "setNVRAMPropertyWithValueRef",  cStr,  "<error getting string>",  v17,  v10);
    }
  }

  else
  {
    sub_100010E04(v7, cStr);
  }

  CFRelease(v5);
  IOObjectRelease(v7);
  return v9;
}

uint64_t sub_100011308()
{
  *(void *)notification = 0LL;
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0LL);
  uint64_t v1 = v0;
  if (!v0)
  {
    sub_10000444C(1, "%s: Failed to create a semaphore.");
LABEL_8:
    uint64_t v6 = 0LL;
    goto LABEL_9;
  }

  dispatch_retain(v0);
  CFMutableDictionaryRef v2 = IOServiceMatching("AppleSEPManager");
  if (!v2)
  {
    sub_10000444C(1, "%s: Failed to create matching dictionary for : '%s'");
    goto LABEL_8;
  }

  CFMutableDictionaryRef v3 = v2;
  CFStringRef v4 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v4)
  {
    sub_10000444C(1, "%s: Failed to create the io notification port.", "obliterate_gigalockers_oneshot");
    CFRelease(v3);
    goto LABEL_8;
  }

  io_registry_entry_t v5 = v4;
  if (IOServiceAddMatchingNotification( v4,  "IOServiceFirstMatch",  v3,  (IOServiceMatchingCallback)sub_100011568,  v1,  notification))
  {
    sub_10000444C(1, "%s: Failed to register notification for io service: '%s' : %d");
LABEL_23:
    uint64_t v6 = 0LL;
    goto LABEL_24;
  }

  sub_100011568(v1, notification[0]);
  dispatch_time_t v8 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_semaphore_wait(v1, v8))
  {
    sub_10000444C(1, "%s: Timed out waiting for %s to match.");
    goto LABEL_23;
  }

  if (IOServiceOpen(dword_100028CF8, mach_task_self_, 0, &notification[1]))
  {
    sub_10000444C(1, "%s: Failed to connect to IO service: '%s' : %d");
    goto LABEL_23;
  }

  sub_10000444C(1, "%s: IOService to sepService successful", "obliterate_gigalockers_oneshot");
  if (IOConnectCallScalarMethod(notification[1], 0x2Fu, 0LL, 0, 0LL, 0LL))
  {
    sub_10000444C(1, "%s: Failed to call method: %d via IO service: '%s' : %d");
    goto LABEL_23;
  }

  uint64_t v6 = 1LL;
  sub_10000444C(1, "%s:  Completed  obliterate_gigalockers", "obliterate_gigalockers_oneshot");
LABEL_24:
  IONotificationPortDestroy(v5);
  if (notification[0]) {
    IOObjectRelease(notification[0]);
  }
LABEL_9:
  if (notification[1]) {
    IOServiceClose(notification[1]);
  }
  if (dword_100028CF8)
  {
    IOObjectRelease(dword_100028CF8);
    dword_100028CF8 = 0;
  }

  if (v1) {
    dispatch_release(v1);
  }
  return v6;
}

void sub_100011568(dispatch_semaphore_s *a1, io_iterator_t iterator)
{
  if (iterator)
  {
    io_object_t v3 = IOIteratorNext(iterator);
    if (v3)
    {
      if (!dword_100028CF8)
      {
        dword_100028CF8 = v3;
        if (a1)
        {
          dispatch_semaphore_signal(a1);
          dispatch_release(a1);
        }
      }
    }
  }

void sub_1000115C0(const void *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v2)
  {
    io_object_t v3 = v2;
    mach_error_t v4 = IORegistryEntrySetCFProperty(v2, @"IONVRAM-DELETE-PROPERTY", a1);
    if (v4)
    {
      io_registry_entry_t v5 = mach_error_string(v4);
      sub_10000444C(0, "%s: Error clearing nvram key: %s", "clearNVRAMkey", v5);
    }

    IOObjectRelease(v3);
  }

  else
  {
    sub_10000444C(0, "%s: nvram is not supported on this system", "clearNVRAMkey");
  }

void sub_100011664(int a1)
{
  if (a1) {
    sub_10000444C(1, "%s: EpDM obliteration enabled %s");
  }
  else {
    sub_10000444C(0, "%s: EpDM obliteration disabled %s");
  }
}

uint64_t sub_1000116AC()
{
  uint64_t result = os_variant_is_darwinos("com.apple.mobile.obliterator");
  if ((_DWORD)result)
  {
    uint64_t v8 = 0LL;
    if (os_parse_boot_arg_int("ephemeral_data_mode", &v8))
    {
      uint64_t v1 = v8;
      sub_100011664(v8 == 1);
      if (v1 == 1) {
        return 1LL;
      }
    }

    else
    {
      int valuePtr = -1;
      io_registry_entry_t v2 = (const __CFNumber *)MGCopyAnswer(@"EphemeralDataModeOverride", 0LL);
      if (!v2
        || (v3 = v2, CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr), CFRelease(v3), int v4 = valuePtr, valuePtr == -1))
      {
        int v5 = MGGetBoolAnswer(@"EphemeralDataModeEnabled");
        char v6 = v5;
        sub_100011664(v5);
        if ((v6 & 1) != 0) {
          return 1LL;
        }
      }

      else
      {
        sub_100011664(valuePtr == 1);
        if (v4 == 1) {
          return 1LL;
        }
      }
    }

    sub_1000115C0(@"obliteration");
    return 0LL;
  }

  return result;
}

BOOL sub_1000117AC()
{
  int v2 = 0;
  size_t v1 = 4LL;
  if (sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0LL, 0LL)) {
    sub_10000444C(1, "%s: Failed to determine virtual machine status", "machine_is_virtual");
  }
  return v2 != 0;
}

void sub_100011818(id a1)
{
  qword_100028FA8 = (uint64_t)dispatch_queue_create("com.apple.obliterator.logger", 0LL);
}

uint64_t ramrod_display_set_minimum_progress_blink(double a1)
{
  qword_100028AE8 = *(void *)&a1;
  if (*(double *)&qword_100028AF0 >= a1 && (byte_1000290B8 & 1) == 0)
  {
    byte_1000290B8 = 1;
    sub_10001349C();
  }

  return pthread_mutex_unlock(&stru_100028FB0);
}

uint64_t sub_1000118B4()
{
  if (pthread_mutex_init(&stru_100028FB0, 0LL)) {
    ramrod_log_msg("unable to initialize display lock\n", v0, v1, v2, v3, v4, v5, v6, v8);
  }
  pthread_mutex_lock(&stru_100028FB0);
  *(void *)&dword_100029044 = 0xFF4D4D4DFFFFFFFFLL;
  byte_100029040 = 0;
  byte_100029074 = 1;
  off_100029090 = (uint64_t (*)(void, void))sub_100012CF4;
  off_100029098 = sub_100012E84;
  dword_10002903C = 257;
  off_1000290A0 = (uint64_t (*)(void))sub_100012C68;
  off_1000290A8 = (uint64_t (*)(double))sub_100012ED0;
  off_1000290B0 = (uint64_t (*)(void))sub_100013138;
  sub_100012864();
  return pthread_mutex_unlock(&stru_100028FB0);
}

void ramrod_set_progress_UI(int a1, double a2)
{
  double v2 = 100.0;
  if (a2 <= 100.0) {
    double v2 = a2;
  }
  if (a2 >= 0.0) {
    double v3 = v2;
  }
  else {
    double v3 = 0.0;
  }
  if (v3 != *(double *)&qword_100028AF0 || a1 != 0)
  {
    qword_100028AF0 = *(void *)&v3;
    if (dword_100028AF8 != -1)
    {
      off_1000290A8(v3);
      double v3 = *(double *)&qword_100028AF0;
    }

    if (v3 >= *(double *)&qword_100028AE8 && (byte_1000290B8 & 1) == 0)
    {
      byte_1000290B8 = 1;
      sub_10001349C();
    }
  }

uint64_t ramrod_display_set_granular_progress_forced(int a1, double a2)
{
  return pthread_mutex_unlock(&stru_100028FB0);
}

double ramrod_display_get_progress()
{
  return *(double *)&qword_100028AF0;
}

uint64_t ramrod_display_get_num_progress_segments()
{
  return 240LL;
}

void ramrod_display_set_showui(char a1)
{
  LOBYTE(dword_10002903C) = a1;
  sub_100011AC0();
}

void sub_100011AC0()
{
  if (dword_100028AF8 != -1)
  {
    else {
      sub_1000122B0();
    }
  }

void ramrod_display_set_showprogress(int a1)
{
  uint64_t v9 = "Disabling";
  if (a1) {
    uint64_t v9 = "Enabling";
  }
  ramrod_log_msg("%s progress UI", v2, v3, v4, v5, v6, v7, v8, (char)v9);
  BYTE1(dword_10002903C) = a1;
  sub_100011AC0();
}

uint64_t ramrod_display_show_image(const __CFString *a1)
{
  return ramrod_display_show_image_with_alpha(a1, 0);
}

uint64_t ramrod_display_show_image_with_alpha(const __CFString *a1, int a2)
{
  if (dword_100028AF8 == -1) {
    return pthread_mutex_unlock(&stru_100028FB0);
  }
  bzero(__str, 0x400uLL);
  uint64_t v4 = buffer;
  bzero(buffer, 0x400uLL);
  unint64_t v46 = 0LL;
  unint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  CFStringGetFileSystemRepresentation(a1, buffer, 1024LL);
  if (access(buffer, 0))
  {
    uint64_t v12 = strrchr(buffer, 47);
    if (!v12)
    {
      ramrod_log_msg("'%s' is not an absolute path\n", v13, v14, v15, v16, v17, v18, v19, (char)buffer);
      return pthread_mutex_unlock(&stru_100028FB0);
    }

    *uint64_t v12 = 0;
    stat v20 = v12 + 1;
    stat v21 = strchr(v12 + 1, 46);
    if (!v21)
    {
      ramrod_log_msg("'%s' does not have an extension\n", v22, v23, v24, v25, v26, v27, v28, (char)v20);
      return pthread_mutex_unlock(&stru_100028FB0);
    }

    char *v21 = 0;
    int v29 = dword_100029004;
    memset(v51, 0, 32);
    unsigned int v30 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) - 1;
    if (v30 >= 9 || ((0x12Fu >> v30) & 1) == 0)
    {
      v51[0] = 0;
      byte_10002900C = 0;
      goto LABEL_8;
    }

    __strlcpy_chk(v51, off_100025148[v30], 32LL, 32LL);
    byte_10002900C = 0;
    if (!v51[0]) {
      goto LABEL_8;
    }
    ramrod_log_msg("Using product_suffix of %s\n", v31, v32, v33, v34, v35, v36, v37, (char)v51);
    if (MGGetFloat32Answer(@"DeviceCornerRadius", 0.0) <= 0.0
      || (snprintf(__str, 0x400uLL, "%s/%s@%zu~%s-USBc.tga", buffer, v20, *((size_t *)&xmmword_100028FF0 + 1), v51),
          access(__str, 0)))
    {
      snprintf(__str, 0x400uLL, "%s/%s@%zu~%s.tga", buffer, v20, *((size_t *)&xmmword_100028FF0 + 1), v51);
      if (access(__str, 0))
      {
        snprintf(__str, 0x400uLL, "%s/%s@%dx~%s.tga", buffer, v20, v29, v51);
        if (access(__str, 0))
        {
LABEL_8:
          snprintf(__str, 0x400uLL, "%s/%s@%zu.tga", buffer, v20, *((size_t *)&xmmword_100028FF0 + 1));
          if (access(__str, 0))
          {
            snprintf(__str, 0x400uLL, "%s/%s@%dx.tga", buffer, v20, v29);
            if (access(__str, 0))
            {
              if (!v51[0] || (snprintf(__str, 0x400uLL, "%s/%s~%s.tga", buffer, v20, v51), access(__str, 0)))
              {
                uint64_t v4 = __str;
                snprintf(__str, 0x400uLL, "%s/%s.tga", buffer, v20);
                if (access(__str, 0))
                {
                  ramrod_log_msg( "could not find suitable image for %s/%s\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)buffer);
                  return pthread_mutex_unlock(&stru_100028FB0);
                }

                goto LABEL_24;
              }
            }
          }
        }
      }
    }

    else
    {
      byte_10002900C = 1;
    }

    uint64_t v4 = __str;
  }

LABEL_24:
  ramrod_log_msg("loading image: %s\n", v5, v6, v7, v8, v9, v10, v11, (char)v4);
  if (sub_100011FA0(v4, &v46, dword_100029000))
  {
    if (v46 > (unint64_t)xmmword_100028FF0 || v47 > *((void *)&xmmword_100028FF0 + 1))
    {
      ramrod_log_msg("image dimensions (%zu, %zu) too big\n", v38, v39, v40, v41, v42, v43, v44, v46);
    }

    else
    {
      if (a2) {
        sub_10001217C(&v46, 1);
      }
      sub_10001224C(*((__IOSurface **)&unk_100029050 + dword_100028AF8), &v46);
      sub_1000122B0();
      sub_10001224C(*((__IOSurface **)&unk_100029050 + dword_100028AF8), &v46);
    }
  }

  else
  {
    ramrod_log_msg("unable to load image '%s'\n", v38, v39, v40, v41, v42, v43, v44, (char)buffer);
  }

  return pthread_mutex_unlock(&stru_100028FB0);
}

uint64_t sub_100011FA0(const char *a1, void *a2, int a3)
{
  size_t v6 = strlen(a1);
  if (v6 < 4 || strcasecmp(&a1[v6 - 4], ".png"))
  {
    if ((ramrod_load_tga(a1, a2, a2 + 1, a2 + 2) & 1) == 0) {
      return 0LL;
    }
LABEL_4:
    if (a3 > 179)
    {
      if (a3 != 270 && a3 != 180) {
        goto LABEL_20;
      }
    }

    else
    {
      if (!a3) {
        return 1LL;
      }
      if (a3 != 90)
      {
LABEL_20:
        ramrod_log_msg("unexpected rotation value %d\n", v7, v8, v9, v10, v11, v12, v13, a3);
        return 0LL;
      }
    }

    uint64_t v15 = a2[1];
    uint64_t v14 = (int *)a2[2];
    uint64_t v16 = *a2;
    uint64_t v17 = (char *)malloc(4 * *a2 * v15);
    if (a3 == 90)
    {
      if (v15)
      {
        uint64_t v24 = 0LL;
        uint64_t v25 = (uint64_t)&v17[4 * v15 - 4];
        do
        {
          uint64_t v26 = (_DWORD *)v25;
          for (uint64_t i = v16; i; --i)
          {
            int v28 = *v14++;
            _DWORD *v26 = v28;
            v26 += v15;
          }

          ++v24;
          v25 -= 4LL;
        }

        while (v24 != v15);
      }
    }

    else
    {
      if (a3 == 180)
      {
        if (v15)
        {
          for (uint64_t j = 0LL; j != v15; ++j)
          {
            if (v16)
            {
              unsigned int v30 = &v17[4 * (v15 - j) * v16 - 4];
              uint64_t v31 = v16;
              do
              {
                int v32 = *v14++;
                *(_DWORD *)unsigned int v30 = v32;
                v30 -= 4;
                --v31;
              }

              while (v31);
            }
          }
        }

        goto LABEL_34;
      }

      if (v15)
      {
        uint64_t v18 = 0LL;
        uint64_t v19 = &v17[4 * (v16 - 1) * v15];
        do
        {
          stat v20 = v19;
          for (uint64_t k = v16; k; --k)
          {
            int v22 = *v14++;
            *(_DWORD *)stat v20 = v22;
            v20 -= 4 * v15;
          }

          ++v18;
          v19 += 4;
        }

        while (v18 != v15);
      }
    }

    *a2 = v15;
    a2[1] = v16;
LABEL_34:
    a2[2] = v17;
    return 1LL;
  }

  uint64_t result = ramrod_load_png(a1, a2, a2 + 1, a2 + 2);
  if ((_DWORD)result) {
    goto LABEL_4;
  }
  return result;
}

void *sub_10001217C(void *result, int a2)
{
  uint64_t v2 = result[1] * *result;
  if (v2)
  {
    uint64_t v3 = (int *)result[2];
    int v4 = BYTE2(dword_10002903C);
    int v5 = HIBYTE(dword_10002903C);
    int v6 = byte_100029040;
    while (1)
    {
      int v7 = *v3;
      unsigned int v8 = HIBYTE(*v3);
      if (v8 != 255) {
        break;
      }
      if (a2)
      {
        unsigned int v9 = dword_100029044;
LABEL_9:
        *uint64_t v3 = v9;
      }

      ++v3;
      if (!--v2) {
        return result;
      }
    }

    if (a2) {
      int v7 = dword_100029044;
    }
    uint64_t result = (void *)(((32897 * BYTE2(v7) * v8) >> 23) + ((32897 * (v8 ^ 0xFF) * v4) >> 23));
    unsigned int v9 = ((((32897 * (v8 ^ 0xFF) * v5) >> 23) + ((32897 * BYTE1(v7) * v8) >> 23)) << 8) | ((_DWORD)result << 16) | (((32897 * (v8 ^ 0xFF) * v6) >> 23) + ((32897 * v7 * v8) >> 23)) | 0xFF000000;
    goto LABEL_9;
  }

  return result;
}

void sub_10001224C(__IOSurface *a1, unint64_t *a2)
{
  unint64_t v4 = ((unint64_t)xmmword_100028FF0 - *a2) >> 1;
  unint64_t v5 = (*((void *)&xmmword_100028FF0 + 1) - a2[1]) >> 1;
  sub_10001357C(a1);
  sub_10001320C(a1, a2, v4, v5, 0, 0);
}

uint64_t sub_1000122B0()
{
  uint64_t v0 = qword_100029080;
  int v1 = dword_100028AF8;
  if (qword_100029080) {
    BOOL v2 = dword_100028AF8 == -1;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    uint64_t v3 = (__IOSurface *)*((void *)&unk_100028FB0 + dword_100028AF8 + 20);
    if (!(_BYTE)dword_10002903C)
    {
      sub_10001357C(v3);
      uint64_t v0 = qword_100029080;
      int v1 = dword_100028AF8;
    }

    IOMobileFramebufferSwapBegin(*(void *)(v0 + 72), (char *)&unk_100028FB0 + 4 * v1 + 184);
    if (byte_100029074) {
      IOMobileFramebufferSwapSetLayer( *(void *)(qword_100029080 + 72),  0LL,  qword_100029060,  0LL,  0.0,  0.0,  (double)(unint64_t)xmmword_100028FF0,  (double)*((unint64_t *)&xmmword_100028FF0 + 1),  0.0,  0.0,  (double)(unint64_t)xmmword_100028FF0,  (double)*((unint64_t *)&xmmword_100028FF0 + 1));
    }
    __n128 v4 = IOMobileFramebufferSwapSetLayer( *(void *)(qword_100029080 + 72),  1LL,  v3,  0LL,  0.0,  0.0,  (double)(unint64_t)xmmword_100028FF0,  (double)*((unint64_t *)&xmmword_100028FF0 + 1),  0.0,  0.0,  (double)(unint64_t)xmmword_100028FF0,  (double)*((unint64_t *)&xmmword_100028FF0 + 1));
    if (byte_100029074)
    {
      __n128 v4 = IOMobileFramebufferSwapSetLayer( *(void *)(qword_100029080 + 72),  2LL,  0LL,  0LL,  0.0,  0.0,  (double)(unint64_t)xmmword_100028FF0,  (double)*((unint64_t *)&xmmword_100028FF0 + 1),  0.0,  0.0,  (double)(unint64_t)xmmword_100028FF0,  (double)*((unint64_t *)&xmmword_100028FF0 + 1));
      byte_100029074 = 0;
    }

    uint64_t result = IOMobileFramebufferSwapEnd(*(void *)(qword_100029080 + 72), v4);
    dword_100028AF8 = 1 - dword_100028AF8;
  }

  return result;
}

uint64_t ramrod_display_set_background_color(char a1, char a2, char a3)
{
  BYTE2(dword_10002903C) = a1;
  HIBYTE(dword_10002903C) = a2;
  byte_100029040 = a3;
  sub_100011AC0();
  return pthread_mutex_unlock(&stru_100028FB0);
}

uint64_t ramrod_clear_ui()
{
  if (qword_1000290D0)
  {
    qword_1000290C0 = 0LL;
    *(void *)&dword_1000290C8 = 0LL;
    free((void *)qword_1000290D0);
    qword_1000290D0 = 0LL;
  }

  off_100029098();
  sub_10001357C((__IOSurface *)qword_100029060);
  sub_1000124F0();
  return pthread_mutex_unlock(&stru_100028FB0);
}

void sub_1000124F0()
{
  if (qword_1000290D0)
  {
    int v0 = ((int)xmmword_100028FF0 - (int)qword_1000290C0) / 2;
    int v1 = (dword_1000290E0 + dword_10002901C + DWORD2(xmmword_100028FF0) - dword_1000290C8) / 2;
  }

  else
  {
    int v0 = 0;
    int v1 = 0;
  }

  for (uint64_t i = 0LL; i != 16; i += 8LL)
  {
    uint64_t v3 = *(__IOSurface **)((char *)&unk_100028FB0 + i + 160);
    if (v3)
    {
      sub_10001357C(v3);
      if (qword_100029100) {
        sub_10001320C( *(__IOSurface **)((char *)&unk_100028FB0 + i + 160),  (unint64_t *)&qword_1000290F0,  dword_100029010,  unk_100029014,  0,  0);
      }
      if (qword_1000290D0) {
        sub_10001320C( *(__IOSurface **)((char *)&unk_100028FB0 + i + 160),  (unint64_t *)&qword_1000290C0,  v0,  v1,  0,  0);
      }
    }
  }

BOOL ramrod_display_set_aux_image_path(const __CFString *a1, CFErrorRef *a2)
{
  if (qword_1000290D0)
  {
    qword_1000290C0 = 0LL;
    *(void *)&dword_1000290C8 = 0LL;
    free((void *)qword_1000290D0);
    qword_1000290D0 = 0LL;
  }

  if (a1)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetFileSystemRepresentation(a1, buffer, 1024LL);
    int v4 = sub_100011FA0(buffer, &qword_1000290C0, dword_100029000);
    BOOL v12 = v4 != 0;
    if (v4)
    {
      sub_10001217C(&qword_1000290C0, 0);
      uint64_t v13 = *(void *)&dword_1000290C8 * qword_1000290C0;
      if (*(void *)&dword_1000290C8 * qword_1000290C0)
      {
        uint64_t v14 = (unsigned int *)qword_1000290D0;
        unsigned int v15 = (HIBYTE(dword_10002903C) << 8) | (BYTE2(dword_10002903C) << 16) | byte_100029040 | 0xFF000000;
        do
        {
          if (*v14 == -16777216) {
            *uint64_t v14 = v15;
          }
          ++v14;
          --v13;
        }

        while (v13);
      }
    }

    else
    {
      ramrod_log_msg("failed to load image %s\n", v5, v6, v7, v8, v9, v10, v11, (char)buffer);
      ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  3LL,  0LL,  @"%s: unable to load image file %@",  v16,  v17,  v18,  (char)"ramrod_display_set_aux_image_path");
    }
  }

  else
  {
    BOOL v12 = 1LL;
  }

  sub_1000124F0();
  ramrod_set_progress_UI(1, *(double *)&qword_100028AF0);
  pthread_mutex_unlock(&stru_100028FB0);
  return v12;
}

BOOL ramrod_display_has_framebuffer()
{
  return dword_100029078 > 0;
}

BOOL ramrod_display_retry_framebuffer_create()
{
  return dword_100029078 > 0;
}

void sub_100012864()
{
  if (dword_100029078 > 0) {
    return;
  }
  DisplayList = (const __CFArray *)IOMobileFramebufferCreateDisplayList(kCFAllocatorDefault);
  if (DisplayList) {
    goto LABEL_3;
  }
  int v32 = dword_100028B10;
  if (dword_100028B10 >= 1)
  {
    int v33 = dword_100028B10 + 1;
    do
    {
      dword_100028B10 = v32 - 1;
      int v34 = 100000 * (v33 - v32);
      if (v34 >= 1000000) {
        useconds_t v35 = 1000000;
      }
      else {
        useconds_t v35 = v34;
      }
      usleep(v35);
      uint64_t v36 = IOMobileFramebufferCreateDisplayList(kCFAllocatorDefault);
      int v32 = dword_100028B10;
    }

    while (dword_100028B10 >= 1 && v36 == 0);
    DisplayList = (const __CFArray *)v36;
    if (v36)
    {
LABEL_3:
      uint64_t v8 = (char *)qword_100029088;
      if (qword_100029088)
      {
        if (dword_100029078 >= 1)
        {
          uint64_t v9 = 0LL;
          uint64_t v10 = 72LL;
          do
          {
            CFRelease(*(CFTypeRef *)&v8[v10]);
            uint64_t v8 = (char *)qword_100029088;
            *(void *)(qword_100029088 + v10) = 0LL;
            ++v9;
            v10 += 80LL;
          }

          while (v9 < dword_100029078);
        }

        free(v8);
        qword_100029088 = 0LL;
      }

      dword_100029078 = 0;
      size_t Count = CFArrayGetCount(DisplayList);
      qword_100029088 = (uint64_t)calloc(Count, 0x50uLL);
      if (!qword_100029088)
      {
        uint64_t v38 = "unable to allocate framebuffer display\n";
        goto LABEL_29;
      }

      CFIndex v19 = sub_100013F10(DisplayList, 0);
      if (qword_100029080) {
        goto LABEL_35;
      }
      CFIndex v19 = sub_100013F10(DisplayList, 1);
      if (dword_100029078 >= 1 && !*(_BYTE *)(qword_100029088 + 80LL * (dword_100029078 - 1)))
      {
        ramrod_log_msg("attempting to power on display port\n", v12, v13, v14, v15, v16, v17, v18, v60);
        stat v20 = (const void *)__IOAVClassMatching("IOAVController", 0LL, 0LL, 0LL);
        if (v20)
        {
          uint64_t v28 = wait_for_io_service_matching_dict(v20, 0xAu);
          if ((_DWORD)v28)
          {
            io_object_t v29 = v28;
            unsigned int v30 = (const void *)IOAVControllerCreateWithService(kCFAllocatorDefault, v28);
            IOObjectRelease(v29);
            if (v30)
            {
              int v31 = IOAVControllerSetPower(v30, 1LL);
              CFRelease(v30);
              if (v31) {
                ramrod_log_msg("unable to power on DisplayPort: 0x%x\n", v12, v13, v14, v15, v16, v17, v18, v31);
              }
              goto LABEL_34;
            }

            uint64_t v39 = "Unable to create IOAVController from service";
          }

          else
          {
            uint64_t v39 = "timed out waiting for IOAVController service\n";
          }
        }

        else
        {
          uint64_t v39 = "IOAVClassMatching returned no matching class for IOAVController\n";
        }

        ramrod_log_msg(v39, v21, v22, v23, v24, v25, v26, v27, v60);
      }

LABEL_34:
      if (qword_100029080)
      {
LABEL_35:
        if (DisplayList) {
          CFRelease(DisplayList);
        }
        goto LABEL_37;
      }

      uint64_t v38 = "unable to find a usable display\n";
LABEL_29:
      ramrod_log_msg(v38, v12, v13, v14, v15, v16, v17, v18, v60);
      goto LABEL_35;
    }
  }

  ramrod_log_msg("unable to get display list\n", v0, v1, v2, v3, v4, v5, v6, v60);
LABEL_37:
  if (!dword_100029078)
  {
    id v56 = "unable to get framebuffer\n";
LABEL_52:
    ramrod_log_msg(v56, v12, v13, v14, v15, v16, v17, v18, v60);
LABEL_53:
    sub_100013E9C();
    return;
  }

  off_1000290B0(v19);
  uint64_t v47 = qword_100029080;
  if (!qword_100029080)
  {
    if (!*(_BYTE *)qword_100029088) {
      goto LABEL_50;
    }
    qword_100029080 = qword_100029088;
    ramrod_log_msg("%s: Will use %s\n", v40, v41, v42, v43, v44, v45, v46, (char)"create_framebuffer");
    uint64_t v47 = qword_100029080;
    if (!qword_100029080) {
      goto LABEL_50;
    }
  }

  v61[0] = 0LL;
  v61[1] = 0LL;
  int DisplaySize = IOMobileFramebufferGetDisplaySize(*(void *)(v47 + 72), v61);
  if (DisplaySize) {
    ramrod_log_msg("unable to get display size: 0x%x\n", v49, v50, v51, v52, v53, v54, v55, DisplaySize);
  }
  else {
    xmmword_100028FF0 = (__int128)vcvtq_u64_f64(*(float64x2_t *)v61);
  }
  off_100029090(dword_100029004, dword_100029000);
  __int128 v57 = (unsigned __int8 *)qword_100029080;
  if (!qword_100029080
    || !*(_BYTE *)qword_100029080
    || !*(_BYTE *)(qword_100029080 + 1) && !*(_BYTE *)(qword_100029088 + 80LL * dword_100029078 - 80))
  {
LABEL_50:
    v61[0] = 0LL;
    if (pthread_create(v61, 0LL, (void *(__cdecl *)(void *))sub_1000135EC, 0LL))
    {
      id v56 = "unable to create hot plug thread\n";
      goto LABEL_52;
    }

    pthread_detach(v61[0]);
    __int128 v57 = (unsigned __int8 *)qword_100029080;
    if (!qword_100029080) {
      goto LABEL_53;
    }
  }

  int v58 = sub_100013754(*((void *)v57 + 9), *v57);
  if (!*(_BYTE *)qword_100029080)
  {
    uint64_t v59 = off_100029090(dword_100029004, dword_100029000);
    off_1000290A0(v59);
    sub_1000124F0();
  }

  if (*(_BYTE *)(qword_100029088 + 80LL * dword_100029078 - 80) && v58) {
    goto LABEL_53;
  }
}

uint64_t ramrod_display_set_granular_progress(double a1)
{
  return ramrod_display_set_granular_progress_forced(0, a1);
}

uint64_t ramrod_display_set_progress(int a1)
{
  return ramrod_display_set_granular_progress_forced(0, (double)a1);
}

void sub_100012C68()
{
  int v0 = (int)((double)(unint64_t)xmmword_100028FF0 * 0.2);
  dword_100029010 = ((int)xmmword_100028FF0 - (int)qword_1000290F0) / 2;
  unk_100029014 = (DWORD2(xmmword_100028FF0) - dword_1000290F8) / 2;
  dword_100029018 = ((int)xmmword_100028FF0 - v0) / 2;
  dword_10002901C = dword_1000290F8 + (DWORD2(xmmword_100028FF0) - dword_1000290F8) / 2;
  dword_100029020 = qword_1000290D8;
  unk_100029024 = 0;
  dword_100029030 = v0 / (unint64_t)qword_1000290D8;
}

void sub_100012CF4(char a1, int a2)
{
  uint64_t v4 = "%s/images-AppleTV";
  if (*((void *)&xmmword_100028FF0 + 1) > 0x437uLL) {
    uint64_t v4 = "%s/images-AppleTV-1080";
  }
  if (*((void *)&xmmword_100028FF0 + 1) <= 0x86FuLL) {
    snprintf(__str, 0x400uLL, v4, "/usr/share/progressui");
  }
  else {
    snprintf(__str, 0x400uLL, "%s/images-AppleTV-2160");
  }
  if (access(__str, 0))
  {
    uint64_t v5 = __error();
    strerror(*v5);
    ramrod_log_msg("unable to find image directory for scale %d: %s\n", v6, v7, v8, v9, v10, v11, v12, a1);
  }

  else
  {
    for (uint64_t i = 0LL; i != 30; i += 2LL)
    {
      uint64_t v15 = (&off_100025018)[i];
      uint64_t v14 = (&off_100025018)[i + 1];
      bzero(v25, 0x400uLL);
      snprintf(v25, 0x400uLL, "%s/%s", __str, v15);
      uint64_t v16 = (void *)*((void *)v14 + 2);
      if (v16)
      {
        free(v16);
        *(void *)uint64_t v14 = 0LL;
        *((void *)v14 + 1) = 0LL;
        *((void *)v14 + 2) = 0LL;
      }

      sub_10001217C(v14, 0);
    }
  }

void sub_100012E84()
{
  if (qword_100029100)
  {
    qword_1000290F0 = 0LL;
    *(void *)&dword_1000290F8 = 0LL;
    free((void *)qword_100029100);
    qword_100029100 = 0LL;
  }

void sub_100012ED0( double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (dword_100028AF8 < 0)
  {
    ramrod_log_msg( "%s called with a invalid buffer\n",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  (char)"display_set_progress_appletv");
    return;
  }

  uint64_t v10 = (__IOSurface *)*((void *)&unk_100028FB0 + dword_100028AF8 + 20);
  uint64_t v11 = *((unsigned int *)&unk_100028FB0 + dword_100028AF8 + 46);
  if ((_DWORD)v11) {
    IOMobileFramebufferSwapWaitWithTimeout(*(void *)(qword_100029080 + 72), v11, 0LL, 1.0);
  }
  if (!BYTE1(dword_10002903C))
  {
    ramrod_log_msg( "Not updating screen progress since showprogress is set to false\n",  v11,  a4,  a5,  a6,  a7,  a8,  a9,  v24);
LABEL_32:
    sub_1000122B0();
    return;
  }

  double v12 = (double)dword_100029030;
  signed int v13 = vcvtmd_s64_f64(v12);
  double v14 = v12 - (double)v13;
  if (v14 <= 0.0) {
    signed int v15 = 0;
  }
  else {
    signed int v15 = (int)(v14 * (double)(unint64_t)*sub_1000131A4(v13));
  }
  if (dword_100029034 != v13 || unk_100029038 != v15)
  {
    if (v13 < 1)
    {
      signed int v19 = 0;
    }

    else
    {
      for (unsigned int i = 0; i != v13; ++i)
      {
        uint64_t v18 = (unint64_t *)sub_1000131A4(i);
        if (v18[2]) {
          sub_10001320C(v10, v18, dword_100029018 + dword_100029020 * i, dword_10002901C + unk_100029024 * i, 0, 0);
        }
      }

      signed int v19 = v13;
    }

    if (v15 >= 1)
    {
      uint64_t v20 = sub_1000131A4(v19);
      sub_10001320C( v10,  (unint64_t *)v20,  dword_100029018 + dword_100029020 * v19,  dword_10002901C + unk_100029024 * v19,  0,  v15);
      uint64_t v21 = (unint64_t *)sub_1000133AC(v19);
      sub_10001320C( v10,  v21,  dword_100029018 + v15 + dword_100029020 * v19,  dword_10002901C + unk_100029024 * v19,  v15,  *(_DWORD *)v21 - v15);
      ++v19;
    }

    int v22 = dword_100029030;
    while (v19 < v22)
    {
      uint64_t v23 = (unint64_t *)sub_1000133AC(v19);
      if (v23[2])
      {
        sub_10001320C(v10, v23, dword_100029018 + dword_100029020 * v19, dword_10002901C + unk_100029024 * v19, 0, 0);
        int v22 = dword_100029030;
      }

      ++v19;
    }

    dword_100029034 = v13;
    unk_100029038 = v15;
    goto LABEL_32;
  }

void sub_100013138()
{
  if (qword_100029080)
  {
    v9[0] = 0.0;
    v9[1] = 0.0;
    int DisplaySize = IOMobileFramebufferGetDisplaySize(*(void *)(qword_100029080 + 72), v9);
    if (DisplaySize) {
      ramrod_log_msg("unable to get display size: 0x%x\n", v1, v2, v3, v4, v5, v6, v7, DisplaySize);
    }
    if (v9[0] < 3840.0) {
      int v8 = 1;
    }
    else {
      int v8 = 2;
    }
    dword_100029000 = 0;
    dword_100029004 = v8;
  }

uint64_t *sub_1000131A4(unsigned int a1)
{
  if (a1 < 3) {
    return (uint64_t *)*(&off_100025190 + (int)a1);
  }
  if (dword_100029030 - 3 == a1) {
    uint64_t v2 = (uint64_t *)&unk_100029210;
  }
  else {
    uint64_t v2 = &qword_1000290D8;
  }
  if (dword_100029030 - 2 == a1) {
    uint64_t v2 = (uint64_t *)&unk_1000291F8;
  }
  if (dword_100029030 - 1 == a1) {
    return (uint64_t *)&unk_1000291E0;
  }
  else {
    return v2;
  }
}

void sub_10001320C(__IOSurface *a1, unint64_t *a2, int a3, int a4, unsigned int a5, unsigned int a6)
{
  int BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
  unint64_t v21 = *a2;
  if (*a2 <= a5)
  {
    ramrod_log_msg( "%s: can't blit - image x offset greater that width [%d > %zu]\n",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (char)"display_blit_raw_image_limit");
  }

  else
  {
    int v22 = BaseAddress;
    uint64_t v23 = (int *)a2[2];
    if (v21 < (int)(a6 + a5))
    {
      ramrod_log_msg( "%s: limiting blit: image_width_limit extends past end of image [image_xoff=%d, image_width_limit=%d, image width:%zu\n",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (char)"display_blit_raw_image_limit");
      unint64_t v21 = *a2;
      a6 = *a2 - a5;
    }

    BOOL v24 = v21 < a6 || (int)a6 < 1;
    uint64_t v25 = a6;
    if (v24) {
      uint64_t v25 = v21;
    }
    uint64_t v26 = a2[1];
    if ((unint64_t)(v26 + a4) <= *((void *)&xmmword_100028FF0 + 1)
      && v25 + a3 <= (unint64_t)xmmword_100028FF0)
    {
      if (v26)
      {
        uint64_t v27 = 0LL;
        unint64_t v28 = v21 - a5 - v25;
        do
        {
          io_object_t v29 = &v23[a5];
          if (v25)
          {
            unsigned int v30 = &v22[4 * a3 + ((v27 + a4) * BytesPerRow)];
            uint64_t v31 = v25;
            do
            {
              int v32 = *v29++;
              *(_DWORD *)unsigned int v30 = v32;
              v30 += 4;
              --v31;
            }

            while (v31);
          }

          uint64_t v23 = &v29[v28];
          ++v27;
        }

        while (v27 != v26);
      }
    }

    else
    {
      dword_100029240 = a3;
      dword_100029248 = a4;
      qword_100029258 = v25;
      qword_100029250 = v26;
      pthread_once(&stru_100028B00, (void (*)(void))sub_100013414);
    }
  }

void *sub_1000133AC(unsigned int a1)
{
  if (a1 < 3) {
    return *(&off_1000251A8 + (int)a1);
  }
  if (dword_100029030 - 3 == a1) {
    uint64_t v2 = &unk_100029180;
  }
  else {
    uint64_t v2 = &unk_100029228;
  }
  if (dword_100029030 - 2 == a1) {
    uint64_t v2 = &unk_100029168;
  }
  if (dword_100029030 - 1 == a1) {
    return &unk_100029150;
  }
  else {
    return v2;
  }
}

void sub_100013414( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  ramrod_log_msg("Display Info: width=%zu height=%zu\n", v16, v17, v18, v19, v20, v21, v22, xmmword_100028FF0);
  ramrod_log_msg( "Image Info: xoff=%d yoff=%d height=%zu width=%zu\n",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  dword_100029240);
  ramrod_log_msg("This message will only be logged once for all failed blits!\n", v30, v31, v32, v33, v34, v35, v36, a9);
}

void sub_10001349C()
{
  if (byte_1000290B8 == 1)
  {
    dispatch_time_t v0 = dispatch_time(0LL, 1000000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    dispatch_after(v0, global_queue, &stru_100025128);
  }

void sub_100013500(id a1)
{
  float v1 = *(double *)&qword_100028AF0;
  off_1000290A8(v1);
  double v2 = 1.0;
  if (*(double *)&qword_100029260 == 0.0
    || (double v3 = *(double *)&qword_100029260 + -1.0, v2 = 0.0, *(double *)&qword_100029260 + -1.0 < 0.0))
  {
    double v3 = v2;
  }

  qword_100029260 = *(void *)&v3;
  pthread_mutex_unlock(&stru_100028FB0);
}

void sub_10001357C(__IOSurface *a1)
{
  if (a1)
  {
    unsigned int v2 = BYTE2(dword_10002903C);
    unsigned int v3 = *(unsigned __int16 *)((char *)&dword_10002903C + 3);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    size_t AllocSize = IOSurfaceGetAllocSize(a1);
    int __pattern4 = (__PAIR64__(v2, bswap32(v3)) >> 16) | 0xFF000000;
    memset_pattern4(BaseAddress, &__pattern4, AllocSize);
  }

uint64_t sub_1000135EC()
{
  double Current = CFRunLoopGetCurrent();
  ramrod_log_msg("starting display hot plug thread\n", v1, v2, v3, v4, v5, v6, v7, v27);
  if (dword_100029078 < 1) {
    goto LABEL_12;
  }
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  int v17 = 0;
  do
  {
    if (!*(_BYTE *)(qword_100029088 + v15))
    {
      RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource( *(void *)(qword_100029088 + v15 + 72),  0LL);
      if (RunLoopSource)
      {
        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
        if (IOMobileFramebufferEnableHotPlugDetectNotifications( *(void *)(qword_100029088 + v15 + 72),  sub_1000140E4)) {
          ramrod_log_msg( "unable to register for hot plug notifications on %s: 0x%x\n",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  qword_100029088 + v15 + 2);
        }
        else {
          ++v17;
        }
      }
    }

    ++v16;
    v15 += 80LL;
  }

  while (v16 < dword_100029078);
  if (v17 <= 0)
  {
LABEL_12:
    ramrod_log_msg("no external displays registered for hot plug notifications\n", v8, v9, v10, v11, v12, v13, v14, v28);
  }

  else
  {
    ramrod_log_msg("listening for hot plug notifications from %d display%s\n", v8, v9, v10, v11, v12, v13, v14, v17);
    CFRunLoopRun();
  }

  ramrod_log_msg("display hot plug thread exiting\n", v19, v20, v21, v22, v23, v24, v25, v29);
  return 0LL;
}

uint64_t sub_100013754(uint64_t a1, int a2)
{
  double v172 = 0.0;
  double v173 = 0.0;
  if (!a2)
  {
    int v181 = 0;
    int v11 = IOMobileFramebufferSetDisplayDevice(*(void *)(qword_100029080 + 72), 2LL);
    if (v11)
    {
      ramrod_log_msg("unable to set display device: 0x%x\n", v12, v13, v14, v15, v16, v17, v18, v11);
      return 0xFFFFFFFFLL;
    }

    CFArrayRef v184 = 0LL;
    CFArrayRef v185 = 0LL;
    uint64_t v183 = 0LL;
    int SupportedDigitalOutModes = IOMobileFramebufferGetSupportedDigitalOutModes( *(void *)(qword_100029080 + 72),  &v185,  &v184);
    if (SupportedDigitalOutModes)
    {
      ramrod_log_msg( "unable to get color and timing modes: 0x%x\n",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  SupportedDigitalOutModes);
      return 0xFFFFFFFFLL;
    }

    if (!v184)
    {
      ramrod_log_msg("NULL timing (%p) modes\n", v63, v64, v65, v66, v67, v68, v69, 0);
      return 0xFFFFFFFFLL;
    }

    LODWORD(v176[0]) = 0;
    *(void *)int valuePtr = 0LL;
    uint64_t v171 = a1;
    if (sub_100014480( (uint64_t)@"ramrod-display-width",  (SInt32 *)v176,  v64,  v65,  v66,  v67,  v68,  v69)
      || sub_100014480( (uint64_t)@"ramrod-display-height",  &valuePtr[1],  v70,  v71,  v72,  v73,  v74,  v75)
      || sub_100014480((uint64_t)@"ramrod-display-rate", valuePtr, v76, v77, v78, v79, v80, v81))
    {
      int v89 = 0;
      SInt32 v90 = 0;
      SInt32 v91 = 0;
      int v92 = 0;
    }

    else
    {
      int v92 = v176[0];
      SInt32 v90 = valuePtr[0];
      SInt32 v91 = valuePtr[1];
      ramrod_log_msg( "NVRAM specified preferred display settings %d x %d @ %d\n",  v82,  v83,  v84,  v85,  v86,  v87,  v88,  v176[0]);
      int v89 = 1;
    }

    if (CFArrayGetCount(v184) < 1) {
      goto LABEL_51;
    }
    CFIndex v93 = 0LL;
    int v94 = 0;
    v95 = 0LL;
    int v182 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v184, v93);
      sub_1000142DC(ValueAtIndex, (_DWORD *)&v183 + 1, &v183, &v182, &v181);
      int v97 = v182;
      ramrod_log_msg("%ld: %d x %d @ %d (score = %d)\n", v98, v99, v100, v101, v102, v103, v104, v93);
      int v112 = HIDWORD(v183) == v92 ? v89 : 0;
      if (v97 == v90 && v112 && (_DWORD)v183 == v91) {
        break;
      }
      if (v181 > v94)
      {
        v95 = ValueAtIndex;
        int v94 = v181;
      }

      if (++v93 >= CFArrayGetCount(v184)) {
        goto LABEL_47;
      }
    }

    ramrod_log_msg("Found display matching NVRAM preferred settings\n", v105, v106, v107, v108, v109, v110, v111, v169);
    v95 = ValueAtIndex;
LABEL_47:
    if (!v95)
    {
LABEL_51:
      v124 = "unable to find usable timing mode\n";
      goto LABEL_64;
    }

    *(void *)int valuePtr = 0LL;
    *(_OWORD *)v176 = 0u;
    __int128 v177 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    __int128 v180 = 0u;
    sub_1000142DC(v95, (_DWORD *)&v183 + 1, &v183, &v182, &v181);
    ramrod_log_msg("using %d x %d @ %d (score = %d)\n", v126, v127, v128, v129, v130, v131, v132, SBYTE4(v183));
    Value = (const __CFData *)CFDictionaryGetValue(v95, @"ElementData");
    if (Value && (v134 = Value, CFTypeID v135 = CFGetTypeID(Value), v135 == CFDataGetTypeID()))
    {
      v187.location = 0LL;
      v187.length = 80LL;
      CFDataGetBytes(v134, v187, (UInt8 *)v176);
      HIDWORD(v180) = 0;
      ramrod_log_msg( "timing_data_struct\n activeVerticalAxis: %d\n activeHorizontalAxis: %d\n interlaced: %d\n pixelClock: %d\n ratioType: %d\n scanInformation: %d\n",  v136,  v137,  v138,  v139,  v140,  v141,  v142,  SBYTE8(v178));
      unsigned int v143 = IOAVGetCEAVideoShortIDWithData(v176);
      ramrod_log_msg("cea_id = %d\n", v144, v145, v146, v147, v148, v149, v150, v143);
    }

    else
    {
      unsigned int v143 = 0;
    }

    v151 = (const __CFNumber *)CFDictionaryGetValue(v95, @"ID");
    CFNumberGetValue(v151, kCFNumberSInt32Type, valuePtr);
    v152 = (const __CFArray *)CFDictionaryGetValue(v95, @"ColorModes");
    CFArrayRef v185 = v152;
    if (v152 && CFArrayGetCount(v152) >= 1)
    {
      CFIndex v160 = 0LL;
      while (1)
      {
        uint64_t v174 = 0LL;
        uint64_t v175 = 0LL;
        v161 = (const __CFDictionary *)CFArrayGetValueAtIndex(v185, v160);
        v162 = (const __CFNumber *)CFDictionaryGetValue(v161, @"PixelEncoding");
        CFNumberGetValue(v162, kCFNumberIntType, (char *)&v175 + 4);
        if (!HIDWORD(v175))
        {
          v163 = (const __CFNumber *)CFDictionaryGetValue(v161, @"Depth");
          CFNumberGetValue(v163, kCFNumberIntType, &v175);
          if ((_DWORD)v175 == 8)
          {
            v164 = (const __CFNumber *)CFDictionaryGetValue(v161, @"EOTF");
            CFNumberGetValue(v164, kCFNumberIntType, (char *)&v174 + 4);
            if (!HIDWORD(v174))
            {
              v165 = (const __CFNumber *)CFDictionaryGetValue(v161, @"DynamicRange");
              CFNumberGetValue(v165, kCFNumberIntType, &v174);
              if ((_DWORD)v174 == v143 > 1) {
                break;
              }
            }
          }
        }

        if (++v160 >= CFArrayGetCount(v185)) {
          goto LABEL_61;
        }
      }

      v168 = (const __CFNumber *)CFDictionaryGetValue(v161, @"ID");
      CFNumberGetValue(v168, kCFNumberSInt32Type, &valuePtr[1]);
      char v166 = valuePtr[1];
    }

    else
    {
LABEL_61:
      char v166 = 0;
    }

    ramrod_log_msg( "Setting Digital out mode - ColorID: %d timingID: %d",  v153,  v154,  v155,  v156,  v157,  v158,  v159,  v166);
    int v167 = IOMobileFramebufferSetDigitalOutMode( *(void *)(qword_100029080 + 72),  valuePtr[1],  valuePtr[0]);
    a1 = v171;
    if (v167)
    {
      char v169 = v167;
      v124 = "unable to set color and timing modes: 0x%x\n";
      goto LABEL_64;
    }
  }

  int DisplaySize = IOMobileFramebufferGetDisplaySize(a1, &v172);
  if (DisplaySize)
  {
    ramrod_log_msg("unable to get display size: 0x%x\n", v4, v5, v6, v7, v8, v9, v10, DisplaySize);
    return 0xFFFFFFFFLL;
  }

  uint64_t v170 = a1;
  *(void *)&xmmword_100028FF0 = (unint64_t)v172;
  *((void *)&xmmword_100028FF0 + 1) = (unint64_t)v173;
  byte_100029074 = 1;
  ramrod_log_msg("display: %zu x %zu\n", v4, v5, v6, v7, v8, v9, v10, (unint64_t)v172);
  off_1000290A0();
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    __int128 v20 = xmmword_100028FF0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      *((void *)&unk_100028FB0 + i + 20) = 0LL;
LABEL_20:
      ramrod_log_msg("unable to create display buffer %i\n", v22, v23, v24, v25, v26, v27, v28, i);
      return 0xFFFFFFFFLL;
    }

    char v29 = Mutable;
    sub_1000145C8(Mutable, kIOSurfaceBytesPerRow, (4 * v20 + 63) & 0xFFFFFFC0);
    sub_1000145C8(v29, kIOSurfaceWidth, v20);
    sub_1000145C8(v29, kIOSurfaceHeight, SDWORD2(v20));
    sub_1000145C8(v29, kIOSurfacePixelFormat, 1111970369);
    sub_1000145C8(v29, kIOSurfaceBytesPerElement, 4);
    if ((_get_cpu_capabilities() & 0x800) != 0) {
      int v30 = 1792;
    }
    else {
      int v30 = 1024;
    }
    sub_1000145C8(v29, kIOSurfaceCacheMode, v30);
    uint64_t v31 = IOSurfaceCreate(v29);
    CFRelease(v29);
    *((void *)&unk_100028FB0 + i + 20) = v31;
    if (!v31) {
      goto LABEL_20;
    }
    if (IOSurfaceLock(v31, 0, 0LL))
    {
      ramrod_log_msg("unable to lock display buffer %i: 0x%x\n", v32, v33, v34, v35, v36, v37, v38, i);
      return 0xFFFFFFFFLL;
    }
  }

  sub_10001357C((__IOSurface *)qword_100029060);
  sub_1000124F0();
  v176[0] = 128LL;
  int v39 = sysctlbyname("hw.target", &unk_100029268, v176, 0LL, 0LL);
  ramrod_log_msg( "%s: HW.target returned: %s\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"skip_display_poweron_for_device");
  if (!v39)
  {
    v114 = (const __CFString *)MGCopyAnswer(@"DeviceName", 0LL);
    if (v114)
    {
      v115 = v114;
      CFStringGetCStringPtr(v114, 0x8000100u);
      ramrod_log_msg( "%s: DeviceName is: %s\n",  v116,  v117,  v118,  v119,  v120,  v121,  v122,  (char)"skip_display_poweron_for_device");
      CFComparisonResult v123 = CFStringCompare(@"Apple Display", v115, 1uLL);
      CFRelease(v115);
      if (v123 == kCFCompareEqualTo)
      {
        v124 = "Display-less device detected. Skipping poweron entirely\n";
LABEL_64:
        ramrod_log_msg(v124, v47, v48, v49, v50, v51, v52, v53, v169);
        return 0xFFFFFFFFLL;
      }
    }
  }

  ramrod_log_msg("powering on display\n", v47, v48, v49, v50, v51, v52, v53, v169);
  int v54 = IOMobileFramebufferRequestPowerChange(v170, 1LL);
  if (v54)
  {
    ramrod_log_msg("IOMobileFramebufferRequestPowerChange failed: %x\n", v55, v56, v57, v58, v59, v60, v61, v54);
    return 0xFFFFFFFFLL;
  }

  IOMobileFramebufferSwapWait(v170, 0LL, 3LL);
  uint64_t result = 0LL;
  dword_100028AF8 = 0;
  return result;
}

void sub_100013E9C()
{
  uint64_t v0 = 0LL;
  xmmword_100028FF0 = 0uLL;
  do
  {
    uint64_t v1 = (CFTypeRef *)((char *)&unk_100028FB0 + v0);
    uint64_t v2 = *(__IOSurface **)((char *)&unk_100028FB0 + v0 + 160);
    if (v2)
    {
      IOSurfaceUnlock(v2, 0, 0LL);
      CFRelease(v1[20]);
      v1[20] = 0LL;
    }

    v0 += 8LL;
  }

  while (v0 != 24);
  dword_100028AF8 = -1;
}

CFIndex sub_100013F10(const __CFArray *a1, int a2)
{
  CFIndex result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    for (CFIndex i = 0LL; i < result; ++i)
    {
      ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(a1, i);
      if (*((_DWORD *)ValueAtIndex + 2) == a2)
      {
        uint64_t v7 = ValueAtIndex;
        uint64_t v8 = qword_100029088;
        int v9 = dword_100029078;
        uint64_t v10 = (BOOL *)(qword_100029088 + 80LL * dword_100029078);
        ramrod_log_msg("found display: %s\n", v11, v12, v13, v14, v15, v16, v17, (_BYTE)v10 + 2);
        uint64_t v18 = *v7;
        uint64_t v19 = (uint64_t *)(v8 + 80LL * v9 + 72);
        int v20 = IOMobileFramebufferOpenByName(v18, v19);
        if (v20)
        {
          ramrod_log_msg("unable to open framebuffer: 0x%x\n", v21, v22, v23, v24, v25, v26, v27, v20);
        }

        else
        {
          ++dword_100029078;
          uint64_t v28 = v8 + 80LL * v9;
          *(_BYTE *)(v28 + 1) = 0;
          char v29 = (BOOL *)(v28 + 1);
          BOOL *v10 = a2 == 0;
          uint64_t v30 = *v19;
          int v39 = 0;
          if (!a2)
          {
            int v38 = 1;
            int v39 = 1;
LABEL_13:
            BOOL *v29 = v38 == 1;
            if (v38 == 1 && !qword_100029080)
            {
              qword_100029080 = (uint64_t)v10;
              ramrod_log_msg("Will use display %s\n", v21, v22, v23, v24, v25, v26, v27, (_BYTE)v10 + 2);
              LOBYTE(ramrod_log_msg( "Here is some image and display information to debug your overflow issue:\n",  v9,  v10,  v11,  v12,  v13,  v14,  v15, v38) = v39;
            }

            ramrod_log_msg("Display state is %d\n", v21, v22, v23, v24, v25, v26, v27, v38);
            goto LABEL_17;
          }

          if (!IOMobileFramebufferGetDigitalOutState(v30, &v39))
          {
            int v38 = v39;
            goto LABEL_13;
          }

          ramrod_log_msg( "%s: Failed to query digital out state %08x\n",  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (char)"get_display_state");
          ramrod_log_msg("Unable to get state of %s\n", v31, v32, v33, v34, v35, v36, v37, (_BYTE)v10 + 2);
        }
      }

LABEL_17:
      CFIndex result = CFArrayGetCount(a1);
    }
  }

  return result;
}

  if ((_BYTE *)qword_100029080 != v19)
  {
    if (qword_100029080)
    {
      if (*(_BYTE *)qword_100029080) {
        uint64_t v22 = dword_100028AF8 == -1;
      }
      else {
        uint64_t v22 = 1;
      }
      if (!v22)
      {
        uint64_t v23 = (__IOSurface *)*((void *)&unk_100028FB0 + dword_100028AF8 + 20);
        if (v23)
        {
          sub_10001357C(v23);
          sub_1000122B0();
        }
      }

      sub_100013E9C();
    }

    qword_100029080 = (uint64_t)v19;
    if (v19)
    {
      if (*v19)
      {
        off_1000290B0(v11);
        uint64_t v24 = *(unsigned __int8 *)qword_100029080;
      }

      else
      {
        uint64_t v24 = 0;
      }

      if (!sub_100013754(a1, v24))
      {
        uint64_t v25 = off_100029090(dword_100029004, dword_100029000);
        off_1000290A0(v25);
        sub_1000124F0();
      }
    }
  }

  return pthread_mutex_unlock((pthread_mutex_t *)&unk_100028FB0);
}

uint64_t sub_1000140E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a3;
  ramrod_log_msg("%s: display %s %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"display_hot_plug");
  uint64_t v11 = pthread_mutex_lock((pthread_mutex_t *)&unk_100028FB0);
  uint64_t v19 = (_BYTE *)qword_100029080;
  if (a2)
  {
    *(_BYTE *)(v8 + 1) = 1;
    if (!v19 || !v19[1]) {
      goto LABEL_16;
    }
  }

  else
  {
    *(_BYTE *)(v8 + 1) = 0;
    if (v19 == (_BYTE *)v8)
    {
      ramrod_log_msg("%s: %s was active", v12, v13, v14, v15, v16, v17, v18, (char)"display_hot_plug");
    }

    else if (v19)
    {
      goto LABEL_17;
    }

    uint64_t v20 = dword_100029078;
    uint64_t v8 = qword_100029088;
    if (dword_100029078 >= 1)
    {
      uint64_t v21 = qword_100029088 + 2;
      while (!*(_BYTE *)(v21 - 1))
      {
        v21 += 80LL;
        if (!--v20) {
          goto LABEL_13;
        }
      }

      uint64_t v8 = v21 - 2;
      goto LABEL_16;
    }

LABEL_13:
    if (*(_BYTE *)qword_100029088)
    {
LABEL_16:
      ramrod_log_msg("%s: Will use %s\n", v12, v13, v14, v15, v16, v17, v18, (char)"display_hot_plug");
      uint64_t v19 = (_BYTE *)v8;
      goto LABEL_17;
    }

    uint64_t v19 = 0LL;
  }

CFNumberRef sub_1000142DC(const __CFDictionary *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"HorizontalAttributes");
  uint64_t v11 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"VerticalAttributes");
  if (Value)
  {
    uint64_t v12 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Active");
    if (v12)
    {
      uint64_t v13 = v12;
      CFTypeID v14 = CFGetTypeID(v12);
      if (v14 == CFNumberGetTypeID()) {
        CFNumberGetValue(v13, kCFNumberIntType, a2);
      }
    }
  }

  if (v11)
  {
    int valuePtr = 0;
    uint64_t v15 = (const __CFNumber *)CFDictionaryGetValue(v11, @"Active");
    if (v15)
    {
      uint64_t v16 = v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == CFNumberGetTypeID()) {
        CFNumberGetValue(v16, kCFNumberIntType, a3);
      }
    }

    uint64_t v18 = (const __CFNumber *)CFDictionaryGetValue(v11, @"SyncRate");
    if (v18)
    {
      uint64_t v19 = v18;
      CFTypeID v20 = CFGetTypeID(v18);
      if (v20 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
        *a4 = (int)((float)((float)valuePtr * 0.000015259) + 0.5);
      }
    }
  }

  CFIndex result = (const __CFNumber *)CFDictionaryGetValue(a1, @"Score");
  if (result)
  {
    BOOL v22 = result;
    CFTypeID v23 = CFGetTypeID(result);
    CFIndex result = (const __CFNumber *)CFNumberGetTypeID();
    if ((const __CFNumber *)v23 == result) {
      return (const __CFNumber *)CFNumberGetValue(v22, kCFNumberIntType, a5);
    }
  }

  return result;
}

uint64_t sub_100014480( uint64_t a1, SInt32 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    uint64_t v13 = "can't fetch NVRAM value with NULL key\n";
LABEL_8:
    ramrod_log_msg(v13, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v28);
    return 2LL;
  }

  if (!a2)
  {
    uint64_t v13 = "can't load nil pointer with NVRAM value\n";
    goto LABEL_8;
  }

  int v9 = (const __CFString *)ramrod_copy_NVRAM_variable();
  if (v9)
  {
    uint64_t v10 = v9;
    int valuePtr = -1;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFStringGetTypeID())
    {
      SInt32 IntValue = CFStringGetIntValue(v10);
    }

    else if (v11 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v10, kCFNumberIntType, &valuePtr);
      SInt32 IntValue = valuePtr;
    }

    else
    {
      if (v11 != CFDataGetTypeID())
      {
        ramrod_log_msg("can't convert unsupported CFType to int\n", v15, v16, v17, v18, v19, v20, v21, v28);
        goto LABEL_19;
      }

      BytePtr = CFDataGetBytePtr((CFDataRef)v10);
      if (!BytePtr) {
        goto LABEL_19;
      }
      CFTypeID v23 = BytePtr;
      CFIndex Length = CFDataGetLength((CFDataRef)v10);
      uint64_t v25 = CFStringCreateWithBytes(kCFAllocatorDefault, v23, Length, 0x8000100u, 0);
      if (!v25) {
        goto LABEL_19;
      }
      uint64_t v26 = v25;
      SInt32 IntValue = CFStringGetIntValue(v25);
      CFRelease(v26);
    }

    if (IntValue != -1)
    {
      uint64_t v14 = 0LL;
      *a2 = IntValue;
LABEL_20:
      CFRelease(v10);
      return v14;
    }

LABEL_19:
    uint64_t v14 = 3LL;
    goto LABEL_20;
  }

  return 2LL;
}

void sub_1000145C8(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  io_object_t v1 = v0;
  if (v0) {
    IOObjectRelease(v0);
  }
  return v1 != 0;
}

CFTypeRef ramrod_copy_NVRAM_variable_from_devicetree(CFStringRef theString)
{
  Copy = CFStringCreateCopy(0LL, theString);
  io_registry_entry_t v2 = atomic_load((unsigned int *)&unk_1000292E8);
  if (!v2)
  {
    io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (v5)
    {
      while (1)
      {
        io_registry_entry_t v2 = __ldaxr((unsigned int *)&unk_1000292E8);
        if (v2) {
          break;
        }
        if (!__stlxr(v5, (unsigned int *)&unk_1000292E8))
        {
          io_registry_entry_t v2 = v5;
          goto LABEL_2;
        }
      }

      __clrex();
      IOObjectRelease(v5);
    }

    else
    {
      io_registry_entry_t v2 = 0;
    }
  }

LABEL_2:
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, Copy, 0LL, 0);
  CFRelease(Copy);
  return CFProperty;
}

uint64_t ramrod_load_tga(const char *a1, void *a2, unint64_t *a3, void *a4)
{
  char v7 = (char)a1;
  memset(&v81, 0, sizeof(v81));
  int v8 = open(a1, 0, 0LL);
  if ((v8 & 0x80000000) == 0)
  {
    int v9 = v8;
    if (fstat(v8, &v81))
    {
      uint64_t v10 = __error();
      strerror(*v10);
      ramrod_log_msg("unable to stat image '%s': %s\n", v11, v12, v13, v14, v15, v16, v17, v7);
LABEL_4:
      uint64_t v18 = 0LL;
LABEL_25:
      close(v9);
      return v18;
    }

    st_uint32_t size = v81.st_size;
    char v28 = (unsigned __int8 *)mmap(0LL, v81.st_size, 1, 2, v9, 0LL);
    if (v28 == (unsigned __int8 *)-1LL)
    {
      uint64_t v42 = __error();
      strerror(*v42);
      ramrod_log_msg("unable to mmap image '%s': %s\n", v43, v44, v45, v46, v47, v48, v49, v7);
      goto LABEL_4;
    }

    uint64_t v36 = v28;
    if (st_size >= 0x13
      && v28[1] <= 1u
      && ((unsigned int v37 = v28[2], v37 <= 0xB) ? (v38 = ((1 << v37) & 0xE0E) == 0) : (v38 = 1),
          !v38
       && v28[7] <= 0x20u
       && (v28[12] || v28[13])
       && (v28[14] || v28[15])
       && (int v39 = v28[16], HIDWORD(v40) = v39, LODWORD(v40) = (v39 << 24) - 0x8000000, (v40 >> 27) <= 3u)
       && v28[17] < 0x40u))
    {
      if (!v28[1] && v37 >= 0xA)
      {
        uint64_t v50 = *((unsigned __int16 *)v28 + 6);
        if (*((_WORD *)v28 + 6))
        {
          if (*((_WORD *)v28 + 7))
          {
            uint64_t v51 = *v28;
            if (v39 == 24 || v39 == 32)
            {
              uint64_t v52 = 4 * v50;
              unint64_t v53 = *((unsigned __int16 *)v28 + 7);
              uint64_t v79 = *((unsigned __int16 *)v28 + 6);
              unsigned __int8 v80 = v28[17];
              int v54 = (char *)malloc((4 * v50) * v53);
              uint64_t v55 = 0LL;
              char v56 = 0;
              char v57 = 0;
              char v58 = 0;
              char v59 = 0;
              unint64_t v60 = 0LL;
              uint64_t v61 = 0LL;
              unsigned int v62 = v53 - 1;
              if ((v80 & 0x20) != 0) {
                unsigned int v62 = 0;
              }
              uint64_t v63 = &v54[v62 * (unint64_t)v52];
              unint64_t v64 = st_size - v51 - 18;
              uint64_t v65 = (char *)&v36[v51 + 18];
              uint64_t v66 = 1 - v79;
              while (1)
              {
                if (!v64)
                {
LABEL_69:
                  if (v54) {
                    free(v54);
                  }
                  goto LABEL_23;
                }

                char v68 = *v65++;
                char v67 = v68;
                int v69 = v68;
                --v64;
                if (v68 >= 0) {
                  char v70 = 1;
                }
                else {
                  char v70 = -127;
                }
                char v71 = v70 + v67;
                if (v39 == 24)
                {
                  if (v71)
                  {
                    uint64_t v76 = 0LL;
                    uint64_t v77 = &v63[4 * v61 + 1];
                    while (1)
                    {
                      if ((v69 & 0x80000000) == 0 || !(_DWORD)v76)
                      {
                        BOOL v75 = v64 >= 3;
                        v64 -= 3LL;
                        if (!v75) {
                          goto LABEL_69;
                        }
                        char v57 = *v65;
                        char v58 = v65[1];
                        char v59 = v65[2];
                        v65 += 3;
                      }

                      *(v77 - 1) = v57;
                      *uint64_t v77 = v58;
                      v77[1] = v59;
                      v77[2] = -1;
                      if (!(v66 + v61 + v76)) {
                        goto LABEL_64;
                      }
                      ++v76;
                      v77 += 4;
                      if ((v69 + v70) == (_DWORD)v76)
                      {
                        v61 += v76;
                        break;
                      }
                    }
                  }
                }

                else if (v71)
                {
                  uint64_t v72 = 0LL;
                  int v73 = (v69 + v70);
                  uint64_t v74 = &v63[4 * v61 + 1];
                  while (1)
                  {
                    if ((v69 & 0x80000000) == 0 || !(_DWORD)v72)
                    {
                      BOOL v75 = v64 >= 4;
                      v64 -= 4LL;
                      if (!v75) {
                        goto LABEL_69;
                      }
                      char v56 = v65[3];
                      if (v56)
                      {
                        char v57 = *v65;
                        char v58 = v65[1];
                        char v59 = v65[2];
                      }

                      else
                      {
                        char v59 = 0;
                        char v58 = 0;
                        char v57 = 0;
                      }

                      v65 += 4;
                    }

                    *(v74 - 1) = v59;
                    char *v74 = v58;
                    v74[1] = v57;
                    v74[2] = v56;
                    if (!(v66 + v61 + v72)) {
                      break;
                    }
                    ++v72;
                    v74 += 4;
                    if (v73 == (_DWORD)v72)
                    {
                      v61 += v72;
                      goto LABEL_67;
                    }
                  }

LABEL_64:
                  uint64_t v61 = 0LL;
                  unint64_t v78 = v53 - 2 + v55;
                  if ((v80 & 0x20) != 0) {
                    unint64_t v78 = v60 + 1;
                  }
                  ++v60;
                  uint64_t v63 = &v54[v78 * v52];
                }

LABEL_67:
                uint64_t v55 = -(uint64_t)v60;
                if (v60 >= v53)
                {
                  *a2 = v79;
                  *a3 = v53;
                  uint64_t v18 = 1LL;
                  *a4 = v54;
                  goto LABEL_24;
                }
              }
            }
          }
        }
      }

      ramrod_log_msg("image '%s' is an unsupported TGA\n", v29, v30, v31, v32, v33, v34, v35, v7);
    }

    else
    {
      ramrod_log_msg("image '%s' is not a TGA\n", v29, v30, v31, v32, v33, v34, v35, v7);
    }

    uint64_t v17 = v28 + 4;
    uint64_t v18 = v28 + 12;
    if (v28 + 12 >= a5) {
      goto LABEL_73;
    }
  }

  if (v21 == 80)
  {
    if (a4[v17 + 5] != 76 || a4[v17 + 6] != 84 || a4[v17 + 7] != 69) {
      goto LABEL_80;
    }
    uint64_t v23 = ((2863311531u * (unint64_t)v19) >> 31) & 0x1FFFFFFFCLL;
    uint64_t v25 = v110[0];
    uint64_t v24 = (char *)v110[1];
    if (v23 <= (char *)v110[1] - (char *)v110[0])
    {
      if (v23 < (char *)v110[1] - (char *)v110[0])
      {
        uint64_t v24 = (char *)v110[0] + v23;
        v110[1] = (char *)v110[0] + v23;
      }
    }

    else
    {
      sub_100017E80((unint64_t *)v110, v23 - ((char *)v110[1] - (char *)v110[0]));
      uint64_t v25 = v110[0];
      uint64_t v24 = (char *)v110[1];
    }

    if ((unint64_t)(v24 - v25) > 0x400)
    {
      uint64_t v33 = 38;
      goto LABEL_130;
    }

    if (v24 != v25)
    {
      uint64_t v29 = 0LL;
      do
      {
        for (CFIndex i = 0LL; i != 3; ++i)
          *((_BYTE *)v110[0] + v29 + i) = a4[v18 + i];
        *((_BYTE *)v110[0] + (v29 | 3)) = -1;
        v29 += 4LL;
        v18 += 3LL;
      }

      while (v29 < (char *)v110[1] - (char *)v110[0]);
    }

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      ssize_t v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1) {
        break;
      }
      v7 += v8;
      if (v7 == a2) {
        return 0LL;
      }
    }

    return *__error();
  }

  return result;
}

uint64_t ramrod_write_full_log_buffer_to_fd(int __fd)
{
  uint64_t v1 = qword_1000292F8;
  if (qword_1000292F0) {
    BOOL v2 = qword_1000292F8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2
    && ((v4 = qword_100029300, (size_t v5 = ((int)qword_100029300 - (int)qword_1000292F0) & 0xFFFFFLL) != 0)
     && write(__fd, (const void *)qword_1000292F0, v5) == -1
     || v1 != v4 && write(__fd, (const void *)qword_100029300, v1 - v4) == -1))
  {
    return *__error();
  }

  else
  {
    return 0LL;
  }

uint64_t ramrod_add_log_fd(int a1)
{
  int valuePtr = a1;
  memset(&v9, 0, sizeof(v9));
  pthread_mutex_lock(&stru_100028B18);
  pthread_mutex_lock(&stru_100028B58);
  if (fstat(a1, &v9) || ((__int16)v9.st_mode & 0x80000000) == 0)
  {
    CFMutableDictionaryRef Mutable = (__CFSet *)*((void *)&xmmword_100029308 + 1);
    if (!*((void *)&xmmword_100029308 + 1))
    {
      CFMutableDictionaryRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeSetCallBacks);
      *((void *)&xmmword_100029308 + 1) = Mutable;
      if (!Mutable)
      {
        uint64_t v3 = __stderrp;
        uint64_t v4 = "failed to allocate logging file descriptors";
        size_t v5 = 43LL;
        goto LABEL_12;
      }
    }
  }

  else
  {
    CFMutableDictionaryRef Mutable = (__CFSet *)xmmword_100029308;
    if (!(void)xmmword_100029308)
    {
      CFMutableDictionaryRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeSetCallBacks);
      *(void *)&xmmword_100029308 = Mutable;
      if (!Mutable)
      {
        uint64_t v3 = __stderrp;
        uint64_t v4 = "failed to allocate logging file descriptors for regular files";
        size_t v5 = 61LL;
LABEL_12:
        fwrite(v4, v5, 1uLL, v3);
        CFNumberRef v6 = 0LL;
        goto LABEL_13;
      }
    }
  }

  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    ramrod_write_full_log_buffer_to_fd(valuePtr);
    CFSetAddValue(Mutable, v6);
    uint64_t v7 = 0LL;
    goto LABEL_14;
  }

  fwrite("failed to allocate file descriptor number", 0x29uLL, 1uLL, __stderrp);
LABEL_13:
  uint64_t v7 = 0xFFFFFFFFLL;
LABEL_14:
  pthread_mutex_unlock(&stru_100028B58);
  pthread_mutex_unlock(&stru_100028B18);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

uint64_t ramrod_remove_log_fd(int a1)
{
  uint64_t v2 = sub_100014E10(a1);
  pthread_mutex_unlock(&stru_100028B58);
  return v2;
}

uint64_t sub_100014E10(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  uint64_t v3 = &qword_100029310;
  if (v2) {
    uint64_t v3 = &qword_100029308;
  }
  uint64_t v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "can't remove logging fd since none were added";
    size_t v14 = 45LL;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "failed to convert fd to number";
    size_t v14 = 30LL;
    goto LABEL_13;
  }

  CFNumberRef v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    uint64_t v7 = __error();
    uint64_t v8 = *v7;
    stat v9 = __stderrp;
    int v10 = valuePtr;
    uint64_t v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  __int128 context = 0u;
  *(_OWORD *)CFArrayRef theArray = 0u;
  int valuePtr = -1;
  pthread_mutex_lock(&stru_100028B58);
  if (a1 && xmmword_100029308 != 0)
  {
    *(void *)&__int128 context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0LL;
    LOBYTE(theArray[1]) = 0;
    if (*((void *)&xmmword_100029308 + 1)) {
      CFSetApplyFunction(*((CFSetRef *)&xmmword_100029308 + 1), (CFSetApplierFunction)sub_100015094, &context);
    }
    qword_100029318 += a2;
    if (qword_100029318)
    {
      LOBYTE(theArray[1]) = 1;
      qword_100029318 = 0LL;
    }

    if ((void)xmmword_100029308) {
      CFSetApplyFunction((CFSetRef)xmmword_100029308, (CFSetApplierFunction)sub_100015094, &context);
    }
    if (theArray[0])
    {
      CFIndex Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0LL; i != v5; ++i)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr)) {
            sub_100014E10(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }

      CFRelease(theArray[0]);
    }
  }

  pthread_mutex_unlock(&stru_100028B58);
  return 0LL;
}

void sub_100015094(const void *a1, uint64_t a2)
{
  int valuePtr = -1;
  if (!a1)
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "NULL fd num in fd set, weird.\n";
    size_t v7 = 30LL;
LABEL_11:
    fwrite(v6, v7, 1uLL, v5);
    return;
  }

  if (!a2)
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "Missing logging context.\n";
    size_t v7 = 25LL;
    goto LABEL_11;
  }

  if (*(void *)a2)
  {
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
    {
      if (ramrod_log_msg_to_fd(*(void *)a2, *(void *)(a2 + 8), valuePtr))
      {
        fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
        CFMutableDictionaryRef Mutable = *(__CFArray **)(a2 + 16);
        if (!Mutable)
        {
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeArrayCallBacks);
          *(void *)(a2 + 16) = Mutable;
        }

        CFArrayAppendValue(Mutable, a1);
      }

      else if (*(_BYTE *)(a2 + 24))
      {
        fsync(valuePtr);
      }
    }

    else
    {
      fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
    }
  }

void *ramrod_log_set_handler(void *result)
{
  off_100029320 = result;
  return result;
}

uint64_t ramrod_set_syslog_flush_msgs(uint64_t result)
{
  byte_100028B98 = result;
  return result;
}

_BYTE *ramrod_copy_log_buffer()
{
  io_object_t v0 = (const void *)qword_100029300;
  if (qword_100029300)
  {
    int v1 = malloc(0x100000uLL);
    BOOL v2 = v1;
    if (v1)
    {
      uint64_t v3 = qword_1000292F8;
      uint64_t v4 = ((int)v0 - (int)qword_1000292F0) & 0xFFFFFLL;
      if (v4) {
        __memcpy_chk(v1);
      }
      v2[v4 + v3 - (void)v0] = 0;
    }
  }

  else
  {
    BOOL v2 = 0LL;
  }

  pthread_mutex_unlock(&stru_100028B18);
  return v2;
}

void ramrod_log_msg_noecho( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_1000152C4(int a1, const char *a2, va_list a3)
{
  if (byte_100028B98)
  {
    if (qword_100029330 != -1) {
      dispatch_once(&qword_100029330, &stru_1000251E0);
    }
    if (qword_100029328)
    {
      pthread_mutex_lock(&stru_100028BA0);
      size_t last = 0LL;
      asl_object_t v6 = asl_match((asl_object_t)qword_100029328, 0LL, &last, qword_100029338, 0x100uLL, 0, 1);
      if (v6)
      {
        size_t v7 = v6;
        do
        {
          qword_100029338 = last + 1;
          while (1)
          {
            uint64_t v8 = asl_next(v7);
            if (!v8) {
              break;
            }
            stat v9 = asl_format(v8, "std", "lcl", 1u);
            if (v9)
            {
              stat v16 = v9;
              sub_1000157A4(a1, "SYSLOG: %s", v10, v11, v12, v13, v14, v15, (char)v9);
              free(v16);
            }
          }

          asl_close(v7);
          size_t v7 = asl_match((asl_object_t)qword_100029328, 0LL, &last, qword_100029338, 0x100uLL, 0, 1);
        }

        while (v7);
      }

      pthread_mutex_unlock(&stru_100028BA0);
    }
  }

  sub_1000155D0(a1, a2, a3);
}

uint64_t ramrod_log_set_buffermsgs(uint64_t result)
{
  byte_100028B99 = result;
  return result;
}

void ramrod_log_msg( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_log_msgv(const char *a1, va_list a2)
{
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  int v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }

  stat v9 = v1;
  CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    char v30 = (char)CStringPtr;
    uint64_t v18 = "%s";
  }

  else
  {
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v21 = (char *)malloc(v20);
    if (v21)
    {
      uint64_t v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u)) {
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      }
      else {
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      }
      free(v22);
      goto LABEL_12;
    }

    uint64_t v18 = "(Failed to alloc and convert log message)\n";
  }

  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void ramrod_message_error( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_1000155D0(int a1, const char *a2, va_list a3)
{
  __s = 0LL;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&stru_100028B18);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (off_100029320) {
        off_100029320(__s);
      }
    }

    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!byte_100028B99) {
      goto LABEL_23;
    }
    uint64_t v5 = (char *)qword_100029300;
    if (!qword_100029300)
    {
      uint64_t v5 = (char *)malloc(0x100000uLL);
      qword_100029300 = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000LL);
LABEL_23:
        pthread_mutex_unlock(&stru_100028B18);
        goto LABEL_24;
      }

      qword_1000292F0 = (uint64_t)v5;
      qword_1000292F8 = (uint64_t)v5;
    }

    char v6 = *__s;
    if (*__s)
    {
      uint64_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)qword_1000292F8;
      uint64_t v9 = qword_1000292F0;
      uint64_t v10 = __s + 1;
      do
      {
        char *v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        qword_1000292F8 = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          qword_1000292F0 = v9;
        }

        int v11 = *v10++;
        char v6 = v11;
      }

      while (v11);
    }

    goto LABEL_23;
  }

  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

void sub_100015748(id a1)
{
  int v1 = asl_open_path(0LL, 0);
  if (v1)
  {
    asl_close(v1);
    uint64_t v8 = "asl_open_path() succeeded - syslogd polling not needed";
LABEL_3:
    sub_1000157A4(1, v8, v2, v3, v4, v5, v6, v7, v10);
    return;
  }

  asl_object_t v9 = asl_open(0LL, 0LL, 4u);
  if (!v9)
  {
    uint64_t v8 = "asl_open() returned NULL - disabling syslogd polling";
    goto LABEL_3;
  }

  qword_100029328 = (uint64_t)v9;
}

void sub_1000157A4( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t ramrod_load_png(const char *a1, void *a2, void *a3, void *a4)
{
  char v7 = (char)a1;
  memset(&v55, 0, sizeof(v55));
  unint64_t v53 = 0LL;
  unint64_t v54 = 0LL;
  __p = 0LL;
  uint64_t v51 = 0LL;
  uint64_t v52 = 0LL;
  int v8 = open(a1, 0);
  int v9 = v8;
  if (v8 < 0)
  {
    CFIndex v20 = __error();
    strerror(*v20);
    ramrod_log_msg("unable to open image '%s': %s\n", v21, v22, v23, v24, v25, v26, v27, v7);
    return 0LL;
  }

  if (fstat(v8, &v55))
  {
    char v10 = __error();
    strerror(*v10);
    uint64_t v18 = "unable to stat image '%s': %s\n";
LABEL_4:
    ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v7);
    uint64_t v19 = 0LL;
    goto LABEL_14;
  }

  st_uint32_t size = v55.st_size;
  uint64_t v29 = (unsigned __int8 *)mmap(0LL, v55.st_size, 1, 2, v9, 0LL);
  if (v29 == (unsigned __int8 *)-1LL)
  {
    unsigned int v37 = __error();
    strerror(*v37);
    uint64_t v18 = "unable to mmap image '%s': %s\n";
    goto LABEL_4;
  }

  if (picoPNG::decodePNG((uint64_t)&__p, &v54, &v53, v29, st_size, 1))
  {
    ramrod_log_msg("unable to decode image '%s'\n", v30, v31, v32, v33, v34, v35, v36, v7);
  }

  else
  {
    BOOL v38 = __p;
    size_t v39 = v51 - (_BYTE *)__p;
    unint64_t v40 = malloc(v51 - (_BYTE *)__p);
    if (v40)
    {
      uint64_t v48 = v40;
      memcpy(v40, v38, v39);
      *a2 = v54;
      *a3 = v53;
      *a4 = v48;
      uint64_t v19 = 1LL;
      goto LABEL_13;
    }

    ramrod_log_msg("unable to malloc destination image buffer\n", v41, v42, v43, v44, v45, v46, v47, 0);
  }

  uint64_t v19 = 0LL;
LABEL_13:
  munmap(v29, st_size);
LABEL_14:
  close(v9);
  if (__p)
  {
    uint64_t v51 = __p;
    operator delete(__p);
  }

  return v19;
}

void sub_1000159A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ramrod_create_error_cf( CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_1000159E8( CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a5, a6);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }

      if (a4) {
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      }
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }

void ramrod_create_error_internal(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, char *cStr, ...)
{
  int v9 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  sub_1000159E8(a1, a2, a3, a4, v9, va);
  CFRelease(v9);
}

uint64_t picoPNG::decodePNG( uint64_t a1, unint64_t *a2, unint64_t *a3, unsigned __int8 *a4, unint64_t a5, char a6)
{
  unint64_t v6 = 0LL;
  __int128 v111 = 0u;
  __int128 v109 = 0u;
  *(_OWORD *)uint64_t v110 = 0u;
  __int128 v108 = 0u;
  uint64_t v7 = 48LL;
  unint64_t v8 = 0LL;
  if (!a4 || !a5) {
    goto LABEL_20;
  }
  if (a5 < 0x1D)
  {
    unint64_t v6 = 0LL;
    unint64_t v8 = 0LL;
    uint64_t v7 = 27LL;
LABEL_20:
    *a2 = v8;
    *a3 = v6;
    return v7;
  }

  if (*a4 != 137
    || a4[1] != 80
    || a4[2] != 78
    || a4[3] != 71
    || a4[4] != 13
    || a4[5] != 10
    || a4[6] != 26
    || a4[7] != 10)
  {
    unint64_t v6 = 0LL;
    unint64_t v8 = 0LL;
    uint64_t v7 = 28LL;
    goto LABEL_20;
  }

  if (a4[12] != 73 || a4[13] != 72 || a4[14] != 68 || a4[15] != 82)
  {
    unint64_t v6 = 0LL;
    unint64_t v8 = 0LL;
    uint64_t v7 = 29LL;
    goto LABEL_20;
  }

  char v10 = a2;
  uint64_t v11 = a3;
  unint64_t v8 = bswap32(*((_DWORD *)a4 + 4));
  unint64_t v6 = bswap32(*((_DWORD *)a4 + 5));
  unint64_t v101 = v8;
  unint64_t v102 = v6;
  unint64_t v12 = a4[24];
  uint64_t v13 = a4[25];
  unint64_t v103 = v13;
  unint64_t v104 = v12;
  if ((unint64_t)a4[26])
  {
    uint64_t v7 = 32LL;
LABEL_27:
    a2 = v10;
    goto LABEL_20;
  }

  if ((unint64_t)a4[27])
  {
    uint64_t v7 = 33LL;
    goto LABEL_27;
  }

  unint64_t v107 = a4[28];
  if (v107 > 1)
  {
    uint64_t v7 = 34LL;
    goto LABEL_27;
  }

  uint64_t v7 = sub_100017B60(v13, v12);
  DWORD2(v111) = v7;
  a3 = v11;
  a2 = v10;
  if ((_DWORD)v7) {
    goto LABEL_20;
  }
  uint64_t v121 = 0LL;
  __int dst = 0LL;
  uint64_t v123 = 0LL;
  BYTE8(v109) = 0;
  if (a5 < 0x2A)
  {
LABEL_73:
    int v33 = 30;
LABEL_130:
    DWORD2(v111) = v33;
    goto LABEL_131;
  }

  uint64_t v17 = 33LL;
  uint64_t v18 = 41LL;
  while (1)
  {
    int64_t v19 = bswap32(*(_DWORD *)&a4[v17]);
    if ((v19 & 0x80000000) != 0) {
      goto LABEL_129;
    }
    unint64_t v20 = v17 + 4 + v19;
    if (v20 >= a5)
    {
      int v33 = 35;
      goto LABEL_130;
    }

    int v21 = a4[v17 + 4];
    if (v21 != 116) {
      break;
    }
    if (a4[v17 + 5] != 82 || a4[v17 + 6] != 78 || a4[v17 + 7] != 83) {
      goto LABEL_57;
    }
    if (v103)
    {
      if (v103 != 2)
      {
        if (v103 != 3)
        {
          int v33 = 42;
          goto LABEL_130;
        }

        uint64_t v26 = 4 * v19;
        if ((void *)(4 * v19) > (void *)((char *)v110[1] - (char *)v110[0]))
        {
          int v33 = 39;
          goto LABEL_130;
        }

        if ((_DWORD)v19)
        {
          uint64_t v27 = 0LL;
          do
          {
            uint64_t v28 = v18 + 1;
            *((_BYTE *)v110[0] + v27 + 3) = a4[v18];
            v27 += 4LL;
            ++v18;
          }

          while (v26 != v27);
          goto LABEL_67;
        }

        goto LABEL_66;
      }

      if ((_DWORD)v19 != 6)
      {
        int v33 = 41;
        goto LABEL_130;
      }

      uint64_t v31 = a4[v18];
      BYTE8(v109) = 1;
      uint64_t v32 = __rev16(*(unsigned __int16 *)&a4[v17 + 10]);
      *(void *)&__int128 v108 = a4[v17 + 9] | (unint64_t)(v31 << 8);
      *((void *)&v108 + 1) = v32;
      *(void *)&__int128 v109 = __rev16(*(unsigned __int16 *)&a4[v17 + 12]);
      uint64_t v28 = v17 + 14;
    }

    else
    {
      if ((_DWORD)v19 != 2)
      {
        int v33 = 40;
        goto LABEL_130;
      }

      BYTE8(v109) = 1;
      *((void *)&v108 + 1) = a4[v17 + 9] | ((unint64_t)a4[v18] << 8);
      *(void *)&__int128 v109 = *((void *)&v108 + 1);
      *(void *)&__int128 v108 = *((void *)&v108 + 1);
      uint64_t v28 = v17 + 10;
    }

LABEL_66:
    uint64_t v28 = v18;
    goto LABEL_67;
  }

  if (v21 != 73)
  {
    if ((v21 & 0x20) == 0) {
      goto LABEL_80;
    }
LABEL_57:
    uint64_t v28 = v20 + 4;
    goto LABEL_67;
  }

  int v22 = a4[v17 + 5];
  if (v22 == 68)
  {
    if (a4[v17 + 6] != 65 || a4[v17 + 7] != 84) {
      goto LABEL_80;
    }
    sub_100017BE8((uint64_t)&v121, (char *)__dst, (char *)&a4[v18], (char *)&a4[v18 + v19], v19);
    goto LABEL_57;
  }

  if (v22 != 69 || (uint64_t v34 = &a4[v17], v34[6] != 78) || v34[7] != 68)
  {
LABEL_80:
    int v33 = 69;
    goto LABEL_130;
  }

  if (v103 == 2)
  {
    unint64_t v35 = 3 * v104;
  }

  else if (v103 < 4)
  {
    unint64_t v35 = v104;
  }

  else
  {
    unint64_t v35 = v104 * (v103 - 2);
  }

  if (v35 < 8) {
    uint64_t v36 = 1LL;
  }
  else {
    uint64_t v36 = v35 >> 3;
  }
  if (!v102 || !v101 || (v101 | v102) >= 0x10000)
  {
LABEL_129:
    int v33 = 63;
    goto LABEL_130;
  }

  uint64_t v118 = 0LL;
  uint64_t v119 = 0LL;
  uint64_t v120 = 0LL;
  sub_100017FA8(&v118, (v36 + v36 * v102) * v101);
  unsigned int v37 = v118;
  if (v102 + 1 == (v119 - (_BYTE *)v118) / (v101 * v36))
  {
    DWORD2(v111) = sub_1000167FC((unint64_t *)&v118, (unsigned __int8 **)&v121);
    if (!DWORD2(v111))
    {
      unint64_t v96 = (v101 * v35 + 7) >> 3;
      sub_1000167D4((unint64_t *)a1, v96 * v102);
      if (v102 == (*(void *)(a1 + 8) - *(void *)a1) / v96)
      {
        unint64_t v99 = (v35 + 7) >> 3;
        if (v96 * v102) {
          unint64_t v38 = *(void *)a1;
        }
        else {
          unint64_t v38 = 0LL;
        }
        if (v107)
        {
          uint64_t v39 = 0LL;
          uint64_t v40 = 0LL;
          unint64_t v41 = v101;
          uint64x2_t v131 = vshlq_u64((uint64x2_t)vdupq_n_s64(v101 + 3), (uint64x2_t)xmmword_1000230E0);
          uint64x2_t v132 = vshlq_u64((uint64x2_t)vdupq_n_s64(v101 + 1), (uint64x2_t)xmmword_1000230F0);
          unint64_t v133 = v101 >> 1;
          unint64_t v134 = v101;
          v126[0] = (v102 + 7) >> 3;
          v126[1] = v126[0];
          uint64x2_t v127 = vshlq_u64((uint64x2_t)vdupq_n_s64(v102 + 3), (uint64x2_t)xmmword_1000230E0);
          uint64x2_t v128 = vshlq_u64((uint64x2_t)vdupq_n_s64(v102 + 1), (uint64x2_t)xmmword_1000230F0);
          unint64_t v129 = v102 >> 1;
          uint64_t v130 = (unsigned __int8 *)((v101 + 7) >> 3);
          uint64_t v125 = 0LL;
          memset(v124, 0, sizeof(v124));
          do
          {
            uint64_t v42 = (&v130)[v39];
            BOOL v43 = v42 == 0LL;
            unint64_t v44 = ((unint64_t)v42 * v35 + 7) >> 3;
            if (!v43) {
              ++v44;
            }
            v40 += v44 * v126[v39];
            v124[++v39] = v40;
          }

          while (v39 != 6);
          v115 = 0LL;
          uint64_t v116 = 0LL;
          uint64_t v117 = 0LL;
          sub_100017FA8(&v115, (v41 * v35 + 7) >> 3);
          __p = 0LL;
          v113 = 0LL;
          uint64_t v114 = 0LL;
          sub_100017FA8(&__p, (v101 * v35 + 7) >> 3);
          uint64_t v87 = 0LL;
          if (v99 <= 1) {
            unint64_t v45 = 1LL;
          }
          else {
            unint64_t v45 = (v35 + 7) >> 3;
          }
          do
          {
            uint64_t v46 = (&v130)[v87];
            if (v46)
            {
              uint64_t v91 = v126[v87];
              if (v91)
              {
                uint64_t v47 = (char *)__p;
                CFIndex v93 = (unsigned __int8 *)v115;
                uint64_t v94 = 0LL;
                SInt32 v90 = (char *)v118 + v124[v87];
                uint64_t v48 = (uint64_t *)((char *)&unk_100023578 + 8 * v87);
                uint64_t v84 = v101 * v35;
                uint64_t v85 = v48[21];
                unint64_t v89 = (v101 * v35 + 7) >> 3;
                uint64_t v95 = v48[14];
                uint64_t v97 = *v48;
                uint64_t v86 = v48[7];
                unint64_t v92 = v38 + v99 * (*v48 + v86 * v101);
                uint64_t v88 = v99 * v85 * v101;
                do
                {
                  uint64_t v49 = v47;
                  uint64_t v50 = &v90[v94 * ((((unint64_t)v46 * v35 + 7) >> 3) + 1)];
                  unsigned int v53 = *v50;
                  uint64_t v51 = v50 + 1;
                  uint64_t v52 = v53;
                  if (v94) {
                    unint64_t v54 = v93;
                  }
                  else {
                    unint64_t v54 = 0LL;
                  }
                  sub_10001730C((uint64_t)&v101, v47, v51, v54, v99, v52, v89);
                  if (DWORD2(v111)) {
                    break;
                  }
                  if (v35 <= 7)
                  {
                    for (uint64_t j = 0LL; j != v46; ++j)
                    {
                      if (v35)
                      {
                        unint64_t v63 = (void)j * v35;
                        unint64_t v64 = (v86 + v94 * v85) * v84 + (v97 + (void)j * v95) * v35;
                        unint64_t v65 = v35;
                        do
                        {
                          int v66 = (v49[v63 >> 3] >> (~(_BYTE)v63 & 7)) & 1;
                          ++v63;
                          *(_BYTE *)(v38 + (v64 >> 3)) |= (_BYTE)v66 << (~(_BYTE)v64 & 7);
                          ++v64;
                          --v65;
                        }

                        while (v65);
                      }
                    }
                  }

                  else
                  {
                    stat v55 = 0LL;
                    char v56 = v49;
                    char v57 = (_BYTE *)v92;
                    do
                    {
                      char v58 = v56;
                      char v59 = v57;
                      unint64_t v60 = v45;
                      if (v35 + 7 >= 8)
                      {
                        do
                        {
                          char v61 = *v58++;
                          *v59++ = v61;
                          --v60;
                        }

                        while (v60);
                      }

                      ++v55;
                      v57 += v99 * v95;
                      v56 += v99;
                    }

                    while (v55 != v46);
                  }

                  v92 += v88;
                  uint64_t v47 = (char *)v93;
                  CFIndex v93 = (unsigned __int8 *)v49;
                  ++v94;
                }

                while (v94 != v91);
              }
            }

            ++v87;
          }

          while (v87 != 7);
          if (__p)
          {
            v113 = __p;
            operator delete(__p);
          }

          if (v115)
          {
            uint64_t v116 = v115;
            operator delete(v115);
          }

          goto LABEL_166;
        }

        size_t v98 = (v101 * v35 + 7) >> 3;
        if (v35 < 8)
        {
          uint64_t v130 = 0LL;
          uint64x2_t v131 = 0uLL;
          sub_100017FA8(&v130, v98);
          uint64_t v74 = 0LL;
          uint64_t v75 = 0LL;
          uint64_t v76 = 0LL;
          while (1)
          {
            uint64_t v77 = v74 ? (unsigned __int8 *)(v38 + (v74 - 1) * v96) : 0LL;
            sub_10001730C((uint64_t)&v101, v130, (char *)v118 + v75 + 1, v77, v99, *((unsigned __int8 *)v118 + v75), v98);
            BOOL v78 = DWORD2(v111) != 0;
            if (DWORD2(v111)) {
              break;
            }
            if (v101 * v35)
            {
              unint64_t v79 = 0LL;
              do
              {
                unint64_t v80 = v76 + v79;
                char v81 = ~(v76 + v79);
                int v82 = (v130[v79 >> 3] >> (~(_BYTE)v79 & 7)) & 1;
                ++v79;
                *(_BYTE *)(v38 + (v80 >> 3)) |= (_BYTE)v82 << (v81 & 7);
              }

              while (v79 < v101 * v35);
              v76 += v79;
            }

            v75 += v98 + 1;
            if (++v74 >= v102)
            {
              int v83 = 0;
              goto LABEL_161;
            }
          }

          int v83 = 1;
LABEL_161:
          if (v130)
          {
            v131.i64[0] = (uint64_t)v130;
            operator delete(v130);
          }

          if (!v78) {
LABEL_164:
          }
            int v83 = 0;
          if (!v83)
          {
LABEL_166:
            if ((a6 & 1) != 0 && (v103 != 6 || v104 != 8))
            {
              uint64_t v130 = 0LL;
              uint64x2_t v131 = 0uLL;
              sub_10001867C(&v130, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
              DWORD2(v111) = sub_100017590((unint64_t *)a1, v130, (uint64_t)&v101, v101, v102);
              if (v130)
              {
                v131.i64[0] = (uint64_t)v130;
                operator delete(v130);
              }
            }
          }
        }

        else
        {
          uint64_t v69 = 0LL;
          unint64_t v70 = 0LL;
          uint64_t v71 = -(uint64_t)v99;
          uint64_t v72 = (_BYTE *)v38;
          while (1)
          {
            int v73 = v70 ? (unsigned __int8 *)(v38 + v71 * v101) : 0LL;
            sub_10001730C((uint64_t)&v101, v72, (char *)v118 + v69 + 1, v73, v99, *((unsigned __int8 *)v118 + v69), v98);
            if (DWORD2(v111)) {
              break;
            }
            ++v70;
            v72 += v98;
            v71 += v99;
            v69 += v98 + 1;
            if (v70 >= v102) {
              goto LABEL_164;
            }
          }
        }
      }

      else
      {
        DWORD2(v111) = 63;
      }
    }

    unsigned int v37 = v118;
  }

  else
  {
    DWORD2(v111) = 63;
  }

  if (v37)
  {
    uint64_t v119 = v37;
    operator delete(v37);
  }

LABEL_131:
  if (v121)
  {
    __int dst = v121;
    operator delete(v121);
  }

  unint64_t v67 = v102;
  uint64_t v7 = DWORD2(v111);
  char v68 = v110[0];
  unint64_t *v10 = v101;
  unint64_t *v11 = v67;
  if (v68)
  {
    v110[1] = v68;
    operator delete(v68);
  }

  return v7;
}

void sub_10001674C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, void *a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, void *__p, uint64_t a50,uint64_t a51,void *a52,uint64_t a53)
{
  if (__p) {
    operator delete(__p);
  }
  if (a52) {
    operator delete(a52);
  }
  if (a39) {
    operator delete(a39);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000167D4(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a1[1] - *a1;
  BOOL v3 = a2 >= v2;
  size_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_100017E80(a1, v4);
  }

  else if (!v3)
  {
    a1[1] = *a1 + a2;
  }

uint64_t sub_1000167FC(unint64_t *a1, unsigned __int8 **a2)
{
  *(_OWORD *)unint64_t v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  *(_OWORD *)unint64_t v102 = 0u;
  *(_OWORD *)uint64_t v100 = 0u;
  unint64_t v2 = *a2;
  if ((unint64_t)(a2[1] - *a2) < 2)
  {
    uint64_t v3 = 53LL;
    goto LABEL_176;
  }

  int v4 = *v2;
  __int16 v5 = v2[1];
  if ((unsigned __int16)(31711 * (v5 | ((_WORD)v4 << 8))) > 0x842u)
  {
    uint64_t v3 = 24LL;
    goto LABEL_176;
  }

  if ((v4 & 0xFFFFFF8F) != 8)
  {
    uint64_t v3 = 25LL;
    goto LABEL_176;
  }

  if ((v5 & 0x20) != 0)
  {
    uint64_t v3 = 26LL;
    goto LABEL_176;
  }

  unint64_t v7 = 0LL;
  unint64_t v105 = 0LL;
  LODWORD(v100[0]) = 0;
  unint64_t v99 = a2;
  do
  {
    uint64_t v3 = LODWORD(v100[0]);
    if (LODWORD(v100[0])) {
      goto LABEL_174;
    }
    unint64_t v8 = v105;
    int v9 = *a2;
    unint64_t v10 = a2[1] - *a2;
    if (v105 >> 3 >= v10)
    {
      uint64_t v3 = 52LL;
LABEL_173:
      LODWORD(v100[0]) = v3;
      goto LABEL_174;
    }

    uint64_t v11 = (uint64_t)(v9 + 2);
    unsigned int v12 = v9[(v105 >> 3) + 2];
    int v13 = (v9[((v105 + 1) >> 3) + 2] >> ((v105 + 1) & 7)) & 1;
    int v14 = v9[((v105 + 2) >> 3) + 2] >> ((v105 + 2) & 7);
    unint64_t v15 = v105 + 3;
    v105 += 3LL;
    uint64_t v16 = v13 & 0xFFFFFFFD | (2 * (v14 & 1));
    if ((_DWORD)v16 == 3)
    {
      uint64_t v3 = 20LL;
      goto LABEL_173;
    }

    if ((_DWORD)v16 == 2)
    {
      unsigned int v98 = v12;
      int v112 = 0LL;
      v113 = 0LL;
      uint64_t v114 = 0LL;
      uint64_t v109 = 0LL;
      sub_1000183D4(&v112, 0x120uLL, &v109);
      uint64_t v109 = 0LL;
      uint64_t v110 = 0LL;
      uint64_t v111 = 0LL;
      __p = 0LL;
      sub_1000183D4(&v109, 0x20uLL, &__p);
      if (v10 - 2 <= v15 >> 3)
      {
        LODWORD(v100[0]) = 49;
        goto LABEL_118;
      }

      uint64_t v25 = 0LL;
      for (uint64_t i = 3LL; i != 8; ++i)
      {
        uint64_t v27 = v25;
        unint64_t v28 = (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 3);
        v25 += v28;
      }

      uint64_t v29 = 0LL;
      do
      {
        v29 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 8);
        ++i;
      }

      while (i != 13);
      uint64_t v30 = 0LL;
      do
      {
        v30 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 13);
        ++i;
      }

      while (i != 17);
      __p = 0LL;
      unint64_t v107 = 0LL;
      uint64_t v108 = 0LL;
      sub_1000184F8(&__p, 0x13uLL);
      unint64_t v31 = 0LL;
      unint64_t v97 = v25 + 257;
      unint64_t v32 = v30 + 4;
      unint64_t v33 = v8 + 17;
      uint64_t v34 = __p;
      unsigned int v12 = v98;
      do
      {
        if (v31 >= v32)
        {
          uint64_t v36 = 0LL;
        }

        else
        {
          uint64_t v35 = 0LL;
          uint64_t v36 = 0LL;
          do
          {
            v36 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v33 + v35) >> 3)) >> ((v33 + v35) & 7)) & 1) << v35;
            ++v35;
          }

          while (v35 != 3);
          v33 += 3LL;
        }

        v34[qword_1000234E0[v31++]] = v36;
      }

      while (v31 != 19);
      unint64_t v105 = v33;
      LODWORD(v100[0]) = sub_100018134(&v103[1], (uint64_t **)&__p, 7LL);
      if (!LODWORD(v100[0]))
      {
        uint64_t v95 = v112;
        unint64_t v96 = v25 + v29 + 258;
        if (v25 + v29 != -258)
        {
          unint64_t v37 = 0LL;
          uint64_t v38 = v27 + v28;
          uint64_t v39 = v109;
          uint64_t v40 = -8 * v38;
          do
          {
            unint64_t v41 = sub_1000180A8((int *)v100, v11, &v105, (uint64_t *)&v103[1], v10);
            if (LODWORD(v100[0])) {
              goto LABEL_116;
            }
            if (v41 > 0xF)
            {
              switch(v41)
              {
                case 0x12uLL:
                  if (v10 <= v105 >> 3) {
                    goto LABEL_112;
                  }
                  uint64_t v55 = 0LL;
                  uint64_t v56 = 0LL;
                  do
                  {
                    v56 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v55) >> 3)) >> ((v105 + v55) & 7)) & 1) << v55;
                    ++v55;
                  }

                  while (v55 != 7);
                  v105 += 7LL;
                  uint64_t v57 = v56 + 11;
                  if (v56 != -11)
                  {
                    unint64_t v58 = v96 - v37;
                    if (v96 < v37) {
                      unint64_t v58 = 0LL;
                    }
                    char v59 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    unint64_t v60 = &v112[v37];
                    while (v58)
                    {
                      if (v37 >= v97) {
                        char v61 = v59;
                      }
                      else {
                        char v61 = v60;
                      }
                      *char v61 = 0LL;
                      ++v37;
                      --v58;
                      ++v59;
                      ++v60;
                      if (!--v57) {
                        goto LABEL_48;
                      }
                    }

                    int v70 = 15;
                    goto LABEL_115;
                  }

                  break;
                case 0x11uLL:
                  if (v10 <= v105 >> 3)
                  {
LABEL_112:
                    int v70 = 50;
                    goto LABEL_115;
                  }

                  uint64_t v62 = 0LL;
                  uint64_t v63 = 0LL;
                  do
                  {
                    v63 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v62) >> 3)) >> ((v105 + v62) & 7)) & 1) << v62;
                    ++v62;
                  }

                  while (v62 != 3);
                  v105 += 3LL;
                  uint64_t v64 = v63 + 3;
                  if (v63 != -3)
                  {
                    unint64_t v65 = v96 - v37;
                    if (v96 < v37) {
                      unint64_t v65 = 0LL;
                    }
                    int v66 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    unint64_t v67 = &v112[v37];
                    while (v65)
                    {
                      if (v37 >= v97) {
                        char v68 = v66;
                      }
                      else {
                        char v68 = v67;
                      }
                      uint64_t *v68 = 0LL;
                      ++v37;
                      --v65;
                      ++v66;
                      ++v67;
                      if (!--v64) {
                        goto LABEL_48;
                      }
                    }

                    int v70 = 14;
                    goto LABEL_115;
                  }

                  break;
                case 0x10uLL:
                  if (v10 <= v105 >> 3) {
                    goto LABEL_112;
                  }
                  if (!v37)
                  {
                    int v70 = 54;
                    goto LABEL_115;
                  }

                  uint64_t v46 = 0LL;
                  uint64_t v47 = 0LL;
                  do
                  {
                    v47 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v46) >> 3)) >> ((v105 + v46) & 7)) & 1) << v46;
                    ++v46;
                  }

                  while (v46 != 2);
                  v105 += 2LL;
                  if (v37 - 1 >= v97) {
                    uint64_t v48 = (uint64_t *)(v109 + 8 * (v37 - v25) - 2064);
                  }
                  else {
                    uint64_t v48 = &v112[v37 - 1];
                  }
                  uint64_t v49 = v47 + 3;
                  if (v49)
                  {
                    uint64_t v50 = *v48;
                    unint64_t v51 = v96 - v37;
                    if (v96 < v37) {
                      unint64_t v51 = 0LL;
                    }
                    uint64_t v52 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    unsigned int v53 = &v112[v37];
                    while (v51)
                    {
                      if (v37 >= v97) {
                        unint64_t v54 = v52;
                      }
                      else {
                        unint64_t v54 = v53;
                      }
                      *unint64_t v54 = v50;
                      ++v37;
                      --v51;
                      ++v52;
                      ++v53;
                      if (!--v49) {
                        goto LABEL_48;
                      }
                    }

                    int v70 = 13;
                    goto LABEL_115;
                  }

                  break;
                default:
                  int v70 = 16;
                  goto LABEL_115;
              }
            }

            else
            {
              BOOL v42 = v37 >= v97;
              unint64_t v43 = v37 - v97;
              unint64_t v44 = &v95[v37++];
              unint64_t v45 = (unint64_t *)(v39 + 8 * v43);
              if (!v42) {
                unint64_t v45 = (unint64_t *)v44;
              }
              *unint64_t v45 = v41;
            }

LABEL_48:
            ;
          }

          while (v37 < v96);
        }

        if (v95[256])
        {
          LODWORD(v100[0]) = sub_100018134(&v100[1], &v112, 15LL);
          if (LODWORD(v100[0])) {
            goto LABEL_116;
          }
          int v70 = sub_100018134(v102, (uint64_t **)&v109, 15LL);
        }

        else
        {
          int v70 = 64;
        }

LABEL_115:
        LODWORD(v100[0]) = v70;
      }

LABEL_116:
      if (__p)
      {
        unint64_t v107 = __p;
        operator delete(__p);
      }

LABEL_118:
      if (v109)
      {
        uint64_t v110 = v109;
        operator delete((void *)v109);
      }

      if (v112)
      {
        v113 = v112;
        operator delete(v112);
      }

      if (!LODWORD(v100[0]))
      {
        while (1)
        {
          do
          {
            while (1)
            {
LABEL_123:
              unint64_t v71 = sub_1000180A8((int *)v100, v11, &v105, (uint64_t *)&v100[1], v10);
              if (LODWORD(v100[0])) {
                goto LABEL_165;
              }
              char v72 = v71;
              if (v71 == 256) {
                goto LABEL_165;
              }
              if (v71 > 0xFF) {
                break;
              }
              unint64_t v73 = *a1;
              unint64_t v74 = a1[1] - *a1;
              if (v7 >= v74)
              {
                unint64_t v75 = 2 * v7 + 2;
                if (v75 <= v74)
                {
                  if (v75 < v74) {
                    a1[1] = v73 + v75;
                  }
                }

                else
                {
                  sub_100017E80(a1, v75 - v74);
                  unint64_t v73 = *a1;
                }
              }

              *(_BYTE *)(v73 + v7++) = v72;
            }
          }

          while (v71 > 0x11D);
          if (v10 <= v105 >> 3) {
            goto LABEL_161;
          }
          uint64_t v76 = 8 * v71 - 2056;
          if (v71 - 285 >= 0xFFFFFFFFFFFFFFECLL)
          {
            uint64_t v78 = 0LL;
            uint64_t v77 = 0LL;
            uint64_t v79 = *(void *)((char *)&unk_100023218 + v76);
            do
            {
              v77 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v78) >> 3)) >> ((v105 + v78) & 7)) & 1) << v78;
              ++v78;
            }

            while (v79 != v78);
            v105 += v79;
          }

          else
          {
            uint64_t v77 = 0LL;
          }

          uint64_t v80 = *(void *)((char *)&unk_100023130 + v76);
          unint64_t v81 = sub_1000180A8((int *)v100, v11, &v105, (uint64_t *)v102, v10);
          if (LODWORD(v100[0])) {
            goto LABEL_165;
          }
          if (v81 > 0x1D) {
            break;
          }
          if (v10 <= v105 >> 3)
          {
LABEL_161:
            int v92 = 51;
LABEL_164:
            LODWORD(v100[0]) = v92;
            goto LABEL_165;
          }

          if (v81 >= 4)
          {
            uint64_t v83 = 0LL;
            uint64_t v82 = 0LL;
            uint64_t v84 = qword_1000233F0[v81];
            do
            {
              v82 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v83) >> 3)) >> ((v105 + v83) & 7)) & 1) << v83;
              ++v83;
            }

            while (v84 != v83);
            v105 += v84;
          }

          else
          {
            uint64_t v82 = 0LL;
          }

          unint64_t v85 = v82 + qword_100023300[v81];
          uint64_t v86 = v7 - v85;
          if (v7 < v85)
          {
            int v92 = 52;
            goto LABEL_164;
          }

          uint64_t v87 = v77 + v80;
          unint64_t v88 = a1[1] - *a1;
          if (v87 + v7 >= v88)
          {
            unint64_t v89 = 2 * (v87 + v7);
            if (v89 <= v88)
            {
              if (v89 < v88) {
                a1[1] = *a1 + v89;
              }
            }

            else
            {
              sub_100017E80(a1, v89 - v88);
            }
          }

          if (v87)
          {
            uint64_t v90 = 0LL;
            uint64_t v91 = v86;
            do
            {
              *(_BYTE *)(*a1 + v7 + v90) = *(_BYTE *)(*a1 + v91);
              if (v91 + 1 < v7) {
                ++v91;
              }
              else {
                uint64_t v91 = v86;
              }
              ++v90;
            }

            while (v87 != v90);
            v7 += v90;
          }
        }

        int v92 = 18;
        goto LABEL_164;
      }

      goto LABEL_165;
    }

    if (v16 == 1)
    {
      unsigned int v23 = v12;
      int v112 = 0LL;
      v113 = 0LL;
      uint64_t v114 = 0LL;
      uint64_t v109 = 8LL;
      sub_1000183D4(&v112, 0x120uLL, &v109);
      uint64_t v109 = 0LL;
      uint64_t v110 = 0LL;
      uint64_t v111 = 0LL;
      __p = (void *)5;
      sub_1000183D4(&v109, 0x20uLL, &__p);
      uint64_t v24 = v112;
      memset_pattern16(v112 + 144, &unk_100023100, 0x380uLL);
      memset_pattern16(v24 + 256, &unk_100023110, 0xC0uLL);
      sub_100018134(&v100[1], &v112, 15LL);
      sub_100018134(v102, (uint64_t **)&v109, 15LL);
      unsigned int v12 = v23;
      if (v109)
      {
        uint64_t v110 = v109;
        operator delete((void *)v109);
      }

      if (v112)
      {
        v113 = v112;
        operator delete(v112);
      }

      goto LABEL_123;
    }

    if (v16) {
      goto LABEL_123;
    }
    unsigned int v17 = v12;
    if ((v15 & 7) != 0)
    {
      unint64_t v15 = (v15 | 7) + 1;
      unint64_t v105 = v15;
    }

    unint64_t v18 = v15 >> 3;
    if (v15 >> 3 >= v10 - 4)
    {
      int v22 = 52;
      goto LABEL_99;
    }

    uint64_t v19 = *(unsigned __int16 *)(v11 + v18);
    if (*(unsigned __int16 *)(v11 + v18 + 2) + v19 != 0xFFFF)
    {
      int v22 = 21;
      goto LABEL_99;
    }

    unint64_t v20 = a1[1] - *a1;
    if (v19 + v7 > v20) {
      sub_100017E80(a1, v19 + v7 - v20);
    }
    unint64_t v21 = v18 + 4;
    if (v19 + v18 + 4 > v10)
    {
      int v22 = 23;
LABEL_99:
      LODWORD(v100[0]) = v22;
      unsigned int v12 = v17;
      goto LABEL_165;
    }

    if (v19)
    {
      unint64_t v69 = v18 + 6;
      do
      {
        *(_BYTE *)(*a1 + v7++) = v9[v69++];
        --v19;
      }

      while (v19);
      unint64_t v21 = v69 - 2;
    }

    unsigned int v12 = v17;
    unint64_t v105 = 8 * v21;
LABEL_165:
    a2 = v99;
  }

  while (((v12 >> (v8 & 7)) & 1) == 0);
  uint64_t v3 = LODWORD(v100[0]);
  if (!LODWORD(v100[0]))
  {
    unint64_t v93 = a1[1] - *a1;
    if (v7 <= v93)
    {
      uint64_t v3 = 0LL;
      if (v7 < v93) {
        a1[1] = *a1 + v7;
      }
    }

    else
    {
      sub_100017E80(a1, v7 - v93);
      uint64_t v3 = LODWORD(v100[0]);
    }
  }

LABEL_174:
  if (v103[1])
  {
    *(void **)&__int128 v104 = v103[1];
    operator delete(v103[1]);
  }

LABEL_176:
  if (v102[0])
  {
    v102[1] = v102[0];
    operator delete(v102[0]);
  }

  if (v100[1])
  {
    *(void **)&__int128 v101 = v100[1];
    operator delete(v100[1]);
  }

  return v3;
}

void sub_10001729C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30)
{
}

uint64_t sub_10001730C( uint64_t result, _BYTE *a2, char *a3, unsigned __int8 *a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  switch(a6)
  {
    case 0LL:
      for (; a7; --a7)
      {
        char v7 = *a3++;
        *a2++ = v7;
      }

      break;
    case 1LL:
      if (a5)
      {
        unint64_t v8 = a3;
        int v9 = a2;
        unint64_t v10 = a5;
        do
        {
          char v11 = *v8++;
          *v9++ = v11;
          --v10;
        }

        while (v10);
      }

      if (a5 < a7)
      {
        do
        {
          a2[a5] = *a2 + a3[a5];
          --a7;
          ++a2;
          ++a3;
        }

        while (a5 != a7);
      }

      break;
    case 2LL:
      if (a4)
      {
        for (; a7; --a7)
        {
          char v13 = *a3++;
          char v12 = v13;
          char v14 = *a4++;
          *a2++ = v14 + v12;
        }
      }

      else
      {
        for (; a7; --a7)
        {
          char v41 = *a3++;
          *a2++ = v41;
        }
      }

      break;
    case 3LL:
      if (a4)
      {
        if (a5)
        {
          unint64_t v15 = a3;
          uint64_t v16 = a4;
          unsigned int v17 = a2;
          unint64_t v18 = a5;
          do
          {
            char v20 = *v15++;
            char v19 = v20;
            unsigned int v21 = *v16++;
            *v17++ = v19 + (v21 >> 1);
            --v18;
          }

          while (v18);
        }

        if (a5 < a7)
        {
          do
          {
            a2[a5] = a3[a5] + ((a4[a5] + *a2) >> 1);
            --a7;
            ++a2;
            ++a4;
            ++a3;
          }

          while (a5 != a7);
        }
      }

      else
      {
        if (a5)
        {
          BOOL v42 = a3;
          unint64_t v43 = a2;
          unint64_t v44 = a5;
          do
          {
            char v45 = *v42++;
            *v43++ = v45;
            --v44;
          }

          while (v44);
        }

        if (a5 < a7)
        {
          do
          {
            a2[a5] = a3[a5] + (*a2 >> 1);
            --a7;
            ++a2;
            ++a3;
          }

          while (a5 != a7);
        }
      }

      break;
    case 4LL:
      if (a4)
      {
        if (a5)
        {
          int v22 = a3;
          unsigned int v23 = (char *)a4;
          uint64_t v24 = a2;
          unint64_t v25 = a5;
          do
          {
            char v27 = *v22++;
            char v26 = v27;
            char v28 = *v23++;
            *v24++ = v28 + v26;
            --v25;
          }

          while (v25);
        }

        if (a5 < a7)
        {
          do
          {
            int v29 = *a2;
            int v30 = a4[a5];
            int v32 = *a4++;
            int v31 = v32;
            int v33 = v30 + v29 - v32;
            int v34 = v32 - v30;
            int v35 = v30 - v32;
            if (v33 >= v29 && v30 != v32) {
              int v34 = v35;
            }
            int v36 = v30 - v33;
            if (v33 > v30) {
              int v36 = v33 - v30;
            }
            int v37 = v31 - v33;
            BOOL v38 = __OFSUB__(v33, v31);
            int v39 = v33 - v31;
            if ((v39 < 0) ^ v38 | (v39 == 0)) {
              int v39 = v37;
            }
            if (v36 > v39) {
              LOBYTE(v30) = v31;
            }
            if (v34 > v39 || v34 > v36) {
              LOBYTE(v29) = v30;
            }
            a2[a5] = v29 + a3[a5];
            --a7;
            ++a2;
            ++a3;
          }

          while (a5 != a7);
        }
      }

      else
      {
        if (a5)
        {
          uint64_t v46 = a3;
          uint64_t v47 = a2;
          unint64_t v48 = a5;
          do
          {
            char v49 = *v46++;
            *v47++ = v49;
            --v48;
          }

          while (v48);
        }

        if (a5 < a7)
        {
          do
          {
            a2[a5] = *a2 + a3[a5];
            --a7;
            ++a2;
            ++a3;
          }

          while (a5 != a7);
        }
      }

      break;
    default:
      *(_DWORD *)(result + 112) = 36;
      break;
  }

  return result;
}

uint64_t sub_100017590(unint64_t *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a5 * a4;
  unint64_t v9 = 4 * a5 * a4;
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  unint64_t v12 = v11 - *a1;
  if (v9 <= v12)
  {
    if (v9 < v12)
    {
      unint64_t v11 = v10 + v9;
      a1[1] = v10 + v9;
    }
  }

  else
  {
    sub_100017E80(a1, v9 - v12);
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
  }

  if (v10 == v11) {
    unint64_t v10 = 0LL;
  }
  uint64_t v13 = *(void *)(a3 + 16);
  unint64_t v14 = *(void *)(a3 + 24);
  if (v14 == 8 && v13 == 0)
  {
    if (v8)
    {
      int v22 = (_BYTE *)(v10 + 3);
      do
      {
        unsigned __int8 v23 = *a2;
        *(v22 - 1) = *a2;
        *(v22 - 2) = v23;
        *(v22 - 3) = v23;
        char v24 = *(_BYTE *)(a3 + 80);
        if (v24) {
          char v24 = *(void *)(a3 + 56) == *a2;
        }
        _BYTE *v22 = v24 - 1;
        v22 += 4;
        ++a2;
        --v8;
      }

      while (v8);
    }

    return 0LL;
  }

  if (v14 == 8 && v13 == 2)
  {
    if (v8)
    {
      uint64_t v16 = 0LL;
      unsigned int v17 = a2;
      unint64_t v18 = v10;
      do
      {
        for (uint64_t i = 0LL; i != 3; ++i)
          *(_BYTE *)(v18 + i) = v17[i];
        BOOL v21 = *(_BYTE *)(a3 + 80)
           && *(void *)(a3 + 56) == a2[3 * v16]
           && (char v20 = &a2[3 * v16], *(void *)(a3 + 64) == v20[1])
           && *(void *)(a3 + 72) == v20[2];
        *(_BYTE *)(v10 + ((4 * v16++) | 3)) = v21 - 1;
        v18 += 4LL;
        v17 += 3;
      }

      while (v16 != v8);
    }

    return 0LL;
  }

  if (v14 == 8 && v13 == 3)
  {
    if (v8)
    {
      uint64_t v26 = 0LL;
      while (*(void *)(a3 + 96) - *(void *)(a3 + 88) > 4 * (unint64_t)a2[v26])
      {
        for (uint64_t j = 0LL; j != 4; ++j)
          *(_BYTE *)(v10 + j) = *(_BYTE *)(*(void *)(a3 + 88) + 4LL * a2[v26] + j);
        ++v26;
        v10 += 4LL;
        if (v26 == v8) {
          return 0LL;
        }
      }

      return 46LL;
    }

    return 0LL;
  }

  if (v14 == 8 && v13 == 4)
  {
    if (v8)
    {
      char v28 = (char *)(a2 + 1);
      int v29 = (_BYTE *)(v10 + 3);
      do
      {
        char v30 = *(v28 - 1);
        *(v29 - 1) = v30;
        *(v29 - 2) = v30;
        *(v29 - 3) = v30;
        char v31 = *v28;
        v28 += 2;
        _BYTE *v29 = v31;
        v29 += 4;
        --v8;
      }

      while (v8);
    }

    return 0LL;
  }

  if (v14 == 8 && v13 == 6)
  {
    if (v8)
    {
      for (uint64_t k = 0LL; k != v8; ++k)
      {
        for (uint64_t m = 0LL; m != 4; ++m)
          *(_BYTE *)(v10 + m) = a2[m];
        uint64_t result = 0LL;
        v10 += 4LL;
        a2 += 4;
      }

      return result;
    }

    return 0LL;
  }

  if (v14 == 16 && !v13)
  {
    if (v8)
    {
      uint64_t v34 = 0LL;
      do
      {
        unsigned __int8 v35 = a2[2 * v34];
        int v36 = (unsigned __int8 *)(v10 + 4 * v34);
        v36[2] = v35;
        v36[1] = v35;
        *int v36 = v35;
        if (*(_BYTE *)(a3 + 80))
        {
          uint64_t v37 = v34 + 1;
          BOOL v38 = __rev16(*(unsigned __int16 *)&a2[v34]) == *(void *)(a3 + 56);
        }

        else
        {
          BOOL v38 = 0;
          uint64_t v37 = v34 + 1;
        }

        uint64_t result = 0LL;
        *(_BYTE *)(v10 + ((4 * v34) | 3)) = v38 - 1;
        uint64_t v34 = v37;
      }

      while (v37 != v8);
      return result;
    }

    return 0LL;
  }

  if (v14 == 16 && v13 == 2)
  {
    if (v8)
    {
      uint64_t v39 = 0LL;
      unint64_t v40 = v10;
      char v41 = (char *)a2;
      do
      {
        uint64_t v42 = 0LL;
        unint64_t v43 = v41;
        do
        {
          char v44 = *v43;
          v43 += 2;
          *(_BYTE *)(v40 + v42++) = v44;
        }

        while (v42 != 3);
        BOOL v46 = *(_BYTE *)(a3 + 80)
           && (a2[(6 * v39) | 1] | ((unint64_t)a2[6 * v39] << 8)) == *(void *)(a3 + 56)
        uint64_t result = 0LL;
        *(_BYTE *)(v10 + ((4 * v39++) | 3)) = v46 - 1;
        v41 += 6;
        v40 += 4LL;
      }

      while (v39 != v8);
      return result;
    }

    return 0LL;
  }

  if (v14 == 16 && v13 == 4)
  {
    if (v8)
    {
      uint64_t v47 = (_BYTE *)(v10 + 3);
      unint64_t v48 = (char *)(a2 + 2);
      uint64_t result = 0LL;
      do
      {
        char v49 = *(v48 - 2);
        *(v47 - 1) = v49;
        *(v47 - 2) = v49;
        *(v47 - 3) = v49;
        char v50 = *v48;
        v48 += 4;
        *uint64_t v47 = v50;
        v47 += 4;
        --v8;
      }

      while (v8);
      return result;
    }

    return 0LL;
  }

  if (v14 == 16 && v13 == 6)
  {
    if (v8)
    {
      for (uint64_t n = 0LL; n != v8; ++n)
      {
        uint64_t v52 = 0LL;
        unsigned int v53 = (char *)a2;
        do
        {
          char v54 = *v53;
          v53 += 2;
          *(_BYTE *)(v10 + v52++) = v54;
        }

        while (v52 != 4);
        uint64_t result = 0LL;
        a2 += 8;
        v10 += 4LL;
      }

      return result;
    }

    return 0LL;
  }

  if (v14 <= 7 && !v13)
  {
    if (v8)
    {
      uint64_t v55 = 0LL;
      unint64_t v56 = 0LL;
      do
      {
        unint64_t v57 = *(void *)(a3 + 24);
        if (v57)
        {
          uint64_t v58 = 0LL;
          unint64_t v59 = v57 - 1;
          do
          {
            uint64_t v60 = (a2[v56 >> 3] >> (~(_BYTE)v56 & 7)) & 1;
            ++v56;
            v58 += v60 << v59--;
          }

          while (v59 < v57);
        }

        else
        {
          uint64_t v58 = 0LL;
        }

        BOOL v61 = 0;
        unint64_t v62 = 255 * v58;
        unint64_t v63 = ~(-1 << v57);
        uint64_t v64 = (_BYTE *)(v10 + 4 * v55);
        v64[2] = v62 / v63;
        v64[1] = v62 / v63;
        *uint64_t v64 = v62 / v63;
        if (*(_BYTE *)(a3 + 80) && v62 >= v63)
        {
          uint64_t v65 = *(unsigned int *)(a3 + 24);
          BOOL v61 = *(void *)(a3 + 56) == ~(-1 << v65) && v65 != 0;
        }

        uint64_t result = 0LL;
        *(_BYTE *)(v10 + ((4 * v55++) | 3)) = v61 - 1;
      }

      while (v55 != v8);
      return result;
    }

    return 0LL;
  }

  uint64_t result = 0LL;
  if (v14 <= 7 && v13 == 3 && v8)
  {
    uint64_t v67 = 0LL;
    unint64_t v68 = 0LL;
    while (1)
    {
      unint64_t v69 = *(void *)(a3 + 24);
      if (v69)
      {
        uint64_t v70 = 0LL;
        unint64_t v71 = v69 - 1;
        do
        {
          uint64_t v72 = (a2[v68 >> 3] >> (~(_BYTE)v68 & 7)) & 1;
          ++v68;
          v70 += v72 << v71--;
        }

        while (v71 < v69);
      }

      else
      {
        uint64_t v70 = 0LL;
      }

      unint64_t v73 = 4 * v70;
      if (v73 >= *(void *)(a3 + 96) - *(void *)(a3 + 88)) {
        break;
      }
      for (iuint64_t i = 0LL; ii != 4; ++ii)
        *(_BYTE *)(v10 + ii) = *(_BYTE *)(*(void *)(a3 + 88) + v73 + ii);
      uint64_t result = 0LL;
      ++v67;
      v10 += 4LL;
      if (v67 == v8) {
        return result;
      }
    }

    return 47LL;
  }

  return result;
}

uint64_t sub_100017B60(uint64_t a1, unint64_t a2)
{
  uint64_t result = 31LL;
  switch(a1)
  {
    case 0LL:
      if (((1LL << a2) & 0x10116) != 0) {
        unsigned int v4 = 0;
      }
      else {
        unsigned int v4 = 37;
      }
      if (a2 <= 0x10) {
        uint64_t result = v4;
      }
      else {
        uint64_t result = 37LL;
      }
      break;
    case 2LL:
    case 4LL:
    case 6LL:
      if (((a2 - 8) & 0xFFFFFFFFFFFFFFF7LL) != 0) {
        uint64_t result = 37LL;
      }
      else {
        uint64_t result = 0LL;
      }
      break;
    case 3LL:
      if (a2 - 1 > 7) {
        uint64_t result = 37LL;
      }
      else {
        uint64_t result = dword_100023658[a2 - 1];
      }
      break;
    default:
      return result;
  }

  return result;
}

char *sub_100017BE8(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  __int16 v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  unint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_100017DD0();
    }
    uint64_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      unsigned int v17 = (char *)operator new(v15);
    }

    else
    {
      size_t v16 = 0LL;
      unsigned int v17 = 0LL;
    }

    char v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    char v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }

      while (v13);
      unint64_t v10 = *(char **)(a1 + 8);
      char v28 = v17;
    }

    char v30 = &v27[a5];
    char v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    int v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }

  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    char v19 = &__src[a5];
    BOOL v21 = *(char **)(a1 + 8);
LABEL_17:
    int v22 = &v5[a5];
    unsigned __int8 v23 = &v21[-a5];
    char v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      char v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }

      while (v25);
    }

    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }

  char v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  BOOL v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_100017DD0()
{
}

void sub_100017DE4(const char *a1)
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100017E34(exception, a1);
}

void sub_100017E20(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100017E34(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100017E58()
{
  exceptiouint64_t n = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100017E80(unint64_t *a1, size_t a2)
{
  __int16 v5 = (char *)a1[1];
  unsigned int v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }

    a1[1] = (unint64_t)v5;
  }

  else
  {
    unint64_t v6 = *a1;
    char v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0LL;
    }
    uint64_t v12 = &v7[v11];
    uint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }

    else
    {
      unint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }

      while (v5 != (char *)v6);
      __int16 v5 = (char *)*a1;
    }

    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5) {
      operator delete(v5);
    }
  }

void *sub_100017FA8(void *a1, size_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100018018(a1, a2);
    unsigned int v4 = (char *)a1[1];
    __int16 v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }

  return a1;
}

void sub_100017FFC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100018018(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000LL) != 0) {
    sub_100017DD0();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *sub_100018058(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }

  unsigned int v4 = (void *)a1[1];
  if (v4)
  {
    a1[2] = v4;
    operator delete(v4);
  }

  return a1;
}

unint64_t sub_1000180A8(int *a1, uint64_t a2, unint64_t *a3, uint64_t *a4, unint64_t a5)
{
  unint64_t v5 = 0LL;
  unint64_t v6 = *a3;
  uint64_t v7 = *a4;
  unint64_t v8 = (unint64_t)((a4[1] - *a4) >> 3) >> 1;
  while (1)
  {
    unint64_t v9 = v6 >> 3;
    if ((v6 & 7) == 0 && v9 >= a5)
    {
      int v12 = 10;
      goto LABEL_9;
    }

    unsigned int v10 = *(unsigned __int8 *)(a2 + v9);
    *a3 = v6 + 1;
    if (v5 >= v8) {
      break;
    }
    unint64_t v11 = *(void *)(v7 + ((8LL * ((v10 >> (v6 & 7)) & 1)) | (16 * v5)));
    *a1 = 0;
    ++v6;
    unint64_t v5 = v11 - v8;
    if (v11 < v8) {
      return v11;
    }
  }

  int v12 = 11;
LABEL_9:
  unint64_t v11 = 0LL;
  *a1 = v12;
  return v11;
}

uint64_t sub_100018134(void *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v7 = *a2;
  unint64_t v6 = a2[1];
  uint64_t v8 = (char *)v6 - (char *)*a2;
  unint64_t v9 = v8 >> 3;
  char v45 = 0LL;
  BOOL v46 = 0LL;
  uint64_t v47 = 0LL;
  sub_1000184F8(&v45, v8 >> 3);
  uint64_t v42 = 0LL;
  unint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  __p = 0LL;
  sub_1000183D4(&v42, a3 + 1, &__p);
  __p = 0LL;
  unint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v38 = 0LL;
  sub_1000183D4(&__p, a3 + 1, &v38);
  if (v6 != v7)
  {
    unsigned int v10 = *a2;
    unint64_t v11 = v42;
    if (v9 <= 1) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = v8 >> 3;
    }
    do
    {
      uint64_t v13 = *v10++;
      ++v11[v13];
      --v12;
    }

    while (v12);
  }

  if (a3)
  {
    unint64_t v14 = (uint64_t *)v42;
    char v15 = (uint64_t *)((char *)__p + 8);
    uint64_t v16 = *(void *)__p;
    do
    {
      uint64_t v17 = *v14++;
      uint64_t v16 = 2 * (v17 + v16);
      *v15++ = v16;
      --a3;
    }

    while (a3);
  }

  if (v6 != v7)
  {
    uint64_t v18 = *a2;
    char v19 = __p;
    int64_t v20 = v45;
    if (v9 <= 1) {
      uint64_t v21 = 1LL;
    }
    else {
      uint64_t v21 = v8 >> 3;
    }
    do
    {
      uint64_t v23 = *v18++;
      uint64_t v22 = v23;
      if (v23)
      {
        uint64_t v24 = v19[v22];
        v19[v22] = v24 + 1;
        *int64_t v20 = v24;
      }

      ++v20;
      --v21;
    }

    while (v21);
  }

  a1[1] = *a1;
  uint64_t v38 = 0x7FFFLL;
  sub_1000184C8((uint64_t)a1, v8 >> 2, &v38);
  if (v6 == v7)
  {
LABEL_31:
    BOOL v30 = 0;
  }

  else
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    unint64_t v27 = 0LL;
    char v28 = *a2;
    if (v9 <= 1) {
      uint64_t v29 = 1LL;
    }
    else {
      uint64_t v29 = v8 >> 3;
    }
    BOOL v30 = 1;
    while (1)
    {
      unint64_t v31 = v28[v25];
      if (v31) {
        break;
      }
LABEL_30:
      BOOL v30 = ++v25 < v9;
      if (v25 == v29) {
        goto LABEL_31;
      }
    }

    unint64_t v32 = 0LL;
    int v33 = v45;
    while (v27 <= v9 - 2)
    {
      uint64_t v34 = (v33[v25] >> (v31 + ~(_BYTE)v32)) & 1LL | (2 * v27);
      uint64_t v35 = *a1;
      uint64_t v36 = *(void *)(*a1 + 8 * v34);
      if (v36 == 0x7FFF)
      {
        if (++v32 == v31)
        {
          unint64_t v27 = 0LL;
          *(void *)(v35 + 8 * v34) = v25;
        }

        else
        {
          unint64_t v27 = v26 + 1;
          *(void *)(v35 + 8 * v34) = ++v26 + v9;
        }
      }

      else
      {
        unint64_t v27 = v36 - v9;
        ++v32;
      }

      unint64_t v31 = v28[v25];
      if (v32 >= v31) {
        goto LABEL_30;
      }
    }
  }

  if (__p)
  {
    unint64_t v40 = __p;
    operator delete(__p);
  }

  if (v42)
  {
    unint64_t v43 = v42;
    operator delete(v42);
  }

  if (v45)
  {
    BOOL v46 = v45;
    operator delete(v45);
  }

  if (v30) {
    return 55LL;
  }
  else {
    return 0LL;
  }
}

void sub_100018388( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000183D4(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100018454(a1, a2);
    unint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_100018438(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100018454(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100017DD0();
  }
  uint64_t result = (char *)sub_100018494((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_100018494(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100017E58();
  }
  return operator new(8 * a2);
}

void sub_1000184C8(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    sub_10001856C((void **)a1, a2 - v3, a3);
  }

void *sub_1000184F8(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100018454(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }

  return a1;
}

void sub_100018550(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_10001856C(void **a1, unint64_t a2, void *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8LL;
      }

      while (v16);
      unint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      sub_100017DD0();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      char v15 = (char *)sub_100018494(v6, v14);
    }
    else {
      char v15 = 0LL;
    }
    uint64_t v18 = &v15[8 * v12];
    char v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    uint64_t v21 = v18;
    do
    {
      *(void *)uint64_t v21 = *a3;
      v21 += 8;
      v20 -= 8LL;
    }

    while (v20);
    uint64_t v22 = &v15[8 * v14];
    uint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void *sub_10001867C(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100018018(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_1000186D8(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4 = 0;
  do
  {
    CFRetain(cf);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if ((_DWORD)MatchingService) {
      break;
    }
    unsigned int v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    uint64_t v7 = CFCopyDescription(cf);
    char CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }

  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

CFArrayRef wait_for_io_service_matching_any_dict(const __CFArray *result, unsigned int a2)
{
  if (result)
  {
    unint64_t v3 = result;
    CFIndex Count = CFArrayGetCount(result);
    unsigned int v5 = 0;
    while (1)
    {
      unsigned int v6 = a2 - v5 >= 3 ? 3 : a2 - v5;
      if (Count >= 1) {
        break;
      }
LABEL_10:
      uint64_t v9 = CFCopyDescription(v3);
      int v23 = 0;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      *(_OWORD *)buffer = 0u;
      __int128 v18 = 0u;
      if (CFStringGetCString(v9, buffer, 100LL, 0x8000100u)) {
        ramrod_log_msg("waiting for matching IOKit service: %s\n", v10, v11, v12, v13, v14, v15, v16, (char)buffer);
      }
      CFRelease(v9);
      sleep(v6);
      v5 += v6;
      if (v5 >= a2) {
        return 0LL;
      }
    }

    CFIndex v7 = 0LL;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v7);
      CFRetain(ValueAtIndex);
      uint64_t result = (const __CFArray *)IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)ValueAtIndex);
      if ((_DWORD)result) {
        break;
      }
      if (Count == ++v7) {
        goto LABEL_10;
      }
    }
  }

  return result;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOResources");
  if (v4)
  {
    uint64_t v12 = v4;
    CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v13)
    {
      CFStringRef v21 = v13;
      CFDictionarySetValue(v12, @"IOResourceMatch", v13);
      CFRelease(v21);
      return wait_for_io_service_matching_dict(v12, a2);
    }

    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
  }

  else
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
  }

  return 0LL;
}

uint64_t wait_for_io_service_matching_class_with_timeout(const char *a1, unsigned int a2)
{
  char v3 = (char)a1;
  CFMutableDictionaryRef v4 = IOServiceMatching(a1);
  if (v4) {
    return wait_for_io_service_matching_dict(v4, a2);
  }
  ramrod_log_msg("unable to create matching dictionary for class '%s'\n", v5, v6, v7, v8, v9, v10, v11, v3);
  return 0LL;
}

uint64_t wait_for_io_service_matching_class(const char *a1)
{
  return wait_for_io_service_matching_class_with_timeout(a1, 0xFFFFFFFF);
}

CFArrayRef wait_for_io_service_matching_any_class_with_timeout(const __CFArray *a1, unsigned int a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t Count = CFArrayGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 0LL;
  }
  uint64_t v6 = Mutable;
  if (Count < 1)
  {
LABEL_12:
    uint64_t v17 = wait_for_io_service_matching_any_dict(v6, a2);
  }

  else
  {
    CFIndex v7 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v7);
      if (!ValueAtIndex) {
        break;
      }
      uint64_t v9 = ValueAtIndex;
      CFTypeID v10 = CFGetTypeID(ValueAtIndex);
      if (v10 != CFStringGetTypeID()) {
        break;
      }
      CFIndex Length = CFStringGetLength(v9);
      int64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      if (MaximumSizeForEncoding < 1) {
        break;
      }
      CFIndex v13 = MaximumSizeForEncoding;
      uint64_t v14 = (char *)malloc(MaximumSizeForEncoding);
      if (!v14) {
        break;
      }
      uint64_t v15 = v14;
      if (!CFStringGetCString(v9, v14, v13, 0x8000100u)) {
        break;
      }
      CFMutableDictionaryRef v16 = IOServiceMatching(v15);
      free(v15);
      if (!v16) {
        break;
      }
      CFArrayAppendValue(v6, v16);
      CFRelease(v16);
      if (Count == ++v7) {
        goto LABEL_12;
      }
    }

    uint64_t v17 = 0LL;
  }

  CFRelease(v6);
  return v17;
}

CFArrayRef wait_for_io_service_matching_any_class(const __CFArray *a1)
{
  return wait_for_io_service_matching_any_class_with_timeout(a1, 0xFFFFFFFF);
}

uint64_t wait_for_io_service_matching_name(const char *a1)
{
  char v1 = (char)a1;
  CFMutableDictionaryRef v2 = IOServiceNameMatching(a1);
  if (v2) {
    return wait_for_io_service_matching_dict(v2, 0xFFFFFFFF);
  }
  ramrod_log_msg("unable to create matching dictionary for service '%s'\n", v3, v4, v5, v6, v7, v8, v9, v1);
  return 0LL;
}

__CFDictionary *create_embedded_storage_service_query_dict(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v1) {
    return 0LL;
  }
  CFStringRef v2 = v1;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    uint64_t v4 = Mutable;
    CFDictionaryAddValue(Mutable, v2, kCFBooleanTrue);
    uint64_t v5 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v6 = v5;
    if (v5) {
      CFDictionaryAddValue(v5, @"IOPropertyMatch", v4);
    }
    CFRelease(v2);
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v4 = (__CFDictionary *)v2;
  }

  CFRelease(v4);
  return v6;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_createPrimaryUserLayoutWithOnUserVolumePath_fromSystemVolumePath_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPrimaryUserLayoutWithOnUserVolumePath:fromSystemVolumePath:withError:");
}

id objc_msgSend_userUUID(void *a1, const char *a2, ...)
{
  return [a1 userUUID];
}