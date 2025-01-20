void RPUserEventPluginInit()
{
  xpc_event_module_get_queue();
}

void sub_3A8C(id a1, int a2)
{
  if (dword_4170 <= 30 && (dword_4170 != -1 || _LogCategory_Initialize(&dword_4170, 30LL))) {
    LogPrintF( &dword_4170,  "void RPUserEventPluginInit(xpc_event_module_t _Nonnull)_block_invoke",  30LL,  "Prefs changed\n");
  }
  sub_3AEC();
}

void sub_3AEC()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue( @"clServerEnabled",  @"com.apple.rapport",  @"mobile",  kCFPreferencesCurrentHost);
  uint64_t v1 = CFGetInt64(v0, &v9);
  if (v0) {
    CFRelease(v0);
  }
  if (v9)
  {
    int DeviceClass = GestaltGetDeviceClass();
    if (DeviceClass == 4 || DeviceClass == 7 || DeviceClass == 100) {
      goto LABEL_15;
    }
  }

  if (v1) {
    goto LABEL_15;
  }
  CFPropertyListRef v3 = CFPreferencesCopyValue( @"clClientEnabled",  @"com.apple.rapport",  @"mobile",  kCFPreferencesCurrentHost);
  uint64_t v4 = CFGetInt64(v3, &v9);
  if (v3) {
    CFRelease(v3);
  }
  if (v9 && ((unsigned int v5 = GestaltGetDeviceClass(), v5 <= 0xB) && ((1 << v5) & 0x89E) != 0 || v5 == 100) || v4)
  {
LABEL_15:
    if (!qword_41F0)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___RPClient);
      v7 = (void *)qword_41F0;
      qword_41F0 = (uint64_t)v6;

      [(id)qword_41F0 setDispatchQueue:qword_41E8];
      [(id)qword_41F0 activateAssertionWithIdentifier:@"com.apple.rapport.KeepAlive"];
    }
  }

  else if (qword_41F0)
  {
    [(id)qword_41F0 invalidate];
    v8 = (void *)qword_41F0;
    qword_41F0 = 0LL;
  }
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}