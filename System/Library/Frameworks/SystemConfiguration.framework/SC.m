@interface SC
@end

@implementation SC

char *___SC_isInstallEnvironment_block_invoke()
{
  result = getenv("__OSINSTALL_ENVIRONMENT");
  _SC_isInstallEnvironment_is_install = result != 0LL;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal = result;
  return result;
}

unint64_t ___SC_dlopen_block_invoke()
{
  unint64_t result = dyld_process_is_restricted();
  if ((result & 1) == 0)
  {
    unint64_t result = (unint64_t)getenv("DYLD_IMAGE_SUFFIX");
    _SC_dlopen_suffix = result;
    if (result)
    {
      v1 = (_BYTE *)result;
      unint64_t result = strlen((const char *)result);
      if (result < 2 || *v1 != 95) {
        _SC_dlopen_suffix = 0LL;
      }
    }
  }

  return result;
}

void ___SC_hw_model_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  *(void *)v11 = 0x200000006LL;
  size_t v10 = 64LL;
  *(_OWORD *)cStr = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  if (sysctl(v11, 2u, cStr, &v10, 0LL, 0LL))
  {
    v0 = _SC_LOG_DEFAULT();
    uint64_t v1 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v0, (os_log_type_t)v1))
    {
      v2 = (char *)&v11[-2] - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __error();
      uint64_t v3 = _os_log_pack_fill();
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)uint64_t v3 = 136315138;
      *(void *)(v3 + 4) = v5;
      __SC_log_send(5, (uint64_t)v0, v1, v2);
    }
  }

  else
  {
    HIBYTE(v15) = 0;
    _SC_hw_model_model = (uint64_t)CFStringCreateWithCString(0LL, cStr, 0x600u);
    v6 = index(cStr, 44);
    if (v6) {
      char *v6 = 0;
    }
    size_t v7 = strlen(cStr);
    size_t v9 = v7 - 1;
    for (BOOL i = v7 == 1; ; BOOL i = v9 == 0)
    {
      size_t v10 = v9;
      cStr[v9--] = 0;
    }

    _SC_hw_model_model_trimmed = (uint64_t)CFStringCreateWithCString(0LL, cStr, 0x600u);
  }

__CFBundle *___SC_getApplicationBundleID_block_invoke()
{
  unint64_t result = CFBundleGetMainBundle();
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v1 = result;
  CFStringRef Identifier = CFBundleGetIdentifier(result);
  _SC_getApplicationBundleID_bundleID = (uint64_t)Identifier;
  if (Identifier)
  {
    CFRetain(Identifier);
  }

  else
  {
    uint64_t v3 = CFBundleCopyExecutableURL(v1);
    if (v3)
    {
      v4 = v3;
      _SC_getApplicationBundleID_bundleID = (uint64_t)CFURLCopyPath(v3);
      CFRelease(v4);
    }
  }

  if (!_SC_getApplicationBundleID_bundleID) {
    goto LABEL_10;
  }
  unint64_t result = (__CFBundle *)CFEqual((CFTypeRef)_SC_getApplicationBundleID_bundleID, @"/");
  if (!(_DWORD)result)
  {
LABEL_9:
    if (_SC_getApplicationBundleID_bundleID) {
      return result;
    }
    goto LABEL_10;
  }

  CFRelease((CFTypeRef)_SC_getApplicationBundleID_bundleID);
  _SC_getApplicationBundleID_bundleID = 0LL;
LABEL_10:
  uint64_t v5 = getpid();
  unint64_t result = (__CFBundle *)CFStringCreateWithFormat(0LL, 0LL, @"Unknown(%d)", v5);
  _SC_getApplicationBundleID_bundleID = (uint64_t)result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_0()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_0 = result;
  return result;
}

void ___SC_crash_once_block_invoke(uint64_t a1)
{
}

void ___SC_crash_once_block_invoke_0(uint64_t a1)
{
}

uint64_t ___SC_isAppleInternal_block_invoke_1()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_1 = result;
  return result;
}

void ___SC_crash_once_block_invoke_1(uint64_t a1)
{
}

uint64_t ___SC_isAppleInternal_block_invoke_2()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_2 = result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_3()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_3 = result;
  return result;
}

void ___SC_crash_once_block_invoke_2(uint64_t a1)
{
}

void ___SC_crash_once_block_invoke_3(uint64_t a1)
{
}

void ___SC_crash_once_block_invoke_4(uint64_t a1)
{
}

uint64_t ___SC_isAppleInternal_block_invoke_4()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_4 = result;
  return result;
}

@end