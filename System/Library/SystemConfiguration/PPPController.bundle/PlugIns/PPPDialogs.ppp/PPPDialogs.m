void sub_2D50()
{
  untimeout();
}

uint64_t start(__CFBundle *a1)
{
  qword_8250 = (uint64_t)a1;
  qword_8258 = (uint64_t)CFBundleCopyBundleURL(a1);
  if (qword_8258)
  {
    CFRetain((CFTypeRef)qword_8250);
    add_options();
  }

  return 1LL;
}

void sub_2E60(uint64_t a1, uint64_t a2)
{
  if (a2 != 8 || !dword_8244) {
    untimeout();
  }
  timeout((int)sub_3258);
}

uint64_t sub_2E98()
{
  return 1LL;
}

uint64_t sub_2ED0(const char *a1)
{
  if (byte_8240) {
    return 1LL;
  }
  else {
    return dialog_password((char *)&username_ptr, 256, (char *)&new_passwd_ptr, 256, 2, a1);
  }
}

uint64_t sub_2F08(const char *a1)
{
  if (!byte_8240)
  {
    uint64_t result = dialog_password((char *)&username_ptr, 256, (char *)&passwd_ptr, 256, 1, a1);
    if (!(_DWORD)result) {
      return result;
    }
    strncpy((char *)&user_ptr, (const char *)&username_ptr, 0x100uLL);
  }

  return 1LL;
}

uint64_t sub_2F68()
{
  return 1LL;
}

uint64_t dialog_reminder_thread()
{
  v0 = pthread_self();
  if (pthread_detach(v0)) {
    return 0LL;
  }
  double v1 = 30.0;
  if (dword_8244 >= 300)
  {
    if (dword_8244 >= 0x258)
    {
      if (dword_8244 >= 0x4B0)
      {
        else {
          int v3 = 180;
        }
        double v1 = (double)v3;
        goto LABEL_12;
      }

      uint64_t v2 = 0x405E000000000000LL;
    }

    else
    {
      uint64_t v2 = 0x404E000000000000LL;
    }

    double v1 = *(double *)&v2;
  }

LABEL_12:
  int v4 = 3;
  CFOptionFlags responseFlags = 3LL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v6 = Mutable;
    CFURLRef v7 = CFBundleCopyResourceURL((CFBundleRef)qword_8250, @"NetworkConnect.icns", 0LL, 0LL);
    if (v7)
    {
      CFURLRef v8 = v7;
      CFDictionaryAddValue(v6, kCFUserNotificationIconURLKey, v7);
      CFRelease(v8);
    }

    CFDictionaryAddValue(v6, kCFUserNotificationLocalizationURLKey, (const void *)qword_8258);
    if (dword_8248) {
      v9 = @"VPN Connection";
    }
    else {
      v9 = @"Network Connection";
    }
    CFDictionaryAddValue(v6, kCFUserNotificationAlertHeaderKey, v9);
    CFDictionaryAddValue(v6, kCFUserNotificationAlertMessageKey, @"Reminder timeout");
    CFDictionaryAddValue(v6, kCFUserNotificationDefaultButtonTitleKey, @"Stay connected");
    CFDictionaryAddValue(v6, kCFUserNotificationAlternateButtonTitleKey, @"Disconnect");
    v10 = CFUserNotificationCreate(0LL, v1, 2uLL, &error, v6);
    if (v10)
    {
      v11 = v10;
      CFUserNotificationReceiveResponse(v10, v1, &responseFlags);
      CFRelease(v11);
    }

    CFRelease(v6);
    int v4 = responseFlags & 3;
  }

  dword_8260 = v4;
  return 0LL;
}

void dialog_reminder_watch()
{
  if (!dword_8260)
  {
    timeout((int)sub_3258);
    untimeout();
  }

  if (dword_8260 != -1) {
    lcp_close();
  }
  timeout((int)dialog_reminder_watch);
}

void sub_3258()
{
  dword_8260 = -1;
}

uint64_t dialog_password(char *a1, int a2, char *a3, int a4, int a5, const char *a6)
{
  CFIndex Count = 0LL;
  int v8 = 0;
  uint64_t v9 = 0x20000LL;
  if (a5 == 2) {
    uint64_t v9 = 196608LL;
  }
  CFOptionFlags v54 = v9;
  CFIndex v52 = a2;
  CFIndex v50 = a4;
  while (1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!Mutable) {
      return 0LL;
    }
    v11 = Mutable;
    CFURLRef v12 = CFBundleCopyResourceURL((CFBundleRef)qword_8250, @"NetworkConnect.icns", 0LL, 0LL);
    if (v12)
    {
      CFURLRef v13 = v12;
      CFDictionaryAddValue(v11, kCFUserNotificationIconURLKey, v12);
      CFRelease(v13);
    }

    if (a6)
    {
      CFStringRef v14 = CFStringCreateWithCString(0LL, a6, 0x8000100u);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v11, kCFUserNotificationAlertMessageKey, v14);
        CFRelease(v15);
      }
    }

    if (a5 == 1)
    {
      BOOL v16 = &tokencard_ptr == 1;
      v17 = @"Incorrect password";
      v18 = @"Incorrect token";
    }

    else
    {
      if (a5 != 2) {
        goto LABEL_18;
      }
      BOOL v16 = &tokencard_ptr == 1;
      v17 = @"Expired password";
      v18 = @"Expired token";
    }

    if (v16) {
      v19 = v18;
    }
    else {
      v19 = v17;
    }
    CFDictionaryAddValue(v11, kCFUserNotificationAlertMessageKey, v19);
LABEL_18:
    v20 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    if (v20)
    {
      v21 = v20;
      if (a5 == 1)
      {
        CFArrayAppendValue(v20, @"Retry name:");
        BOOL v23 = &tokencard_ptr == 1;
        v24 = @"Retry password:";
        v25 = @"Retry token:";
      }

      else if (a5 == 2)
      {
        else {
          v22 = @"New password:";
        }
        CFArrayAppendValue(v20, v22);
        BOOL v23 = &tokencard_ptr == 1;
        v24 = @"Confirm new password:";
        v25 = @"Confirm new token:";
      }

      else
      {
        CFArrayAppendValue(v20, @"Account Name:");
        BOOL v23 = &tokencard_ptr == 1;
        v24 = @"Password:";
        v25 = @"Token:";
      }

      if (v23) {
        v26 = v25;
      }
      else {
        v26 = v24;
      }
      CFArrayAppendValue(v21, v26);
      CFIndex Count = CFArrayGetCount(v21);
      CFDictionaryAddValue(v11, kCFUserNotificationTextFieldTitlesKey, v21);
      CFRelease(v21);
    }

    CFMutableArrayRef v27 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    if (v27)
    {
      v28 = v27;
      if (a5 != 2)
      {
        CFStringRef v29 = CFStringCreateWithCString(0LL, a1, 0x8000100u);
        if (v29)
        {
          CFStringRef v30 = v29;
          CFArrayAppendValue(v28, v29);
          CFRelease(v30);
        }
      }

      CFDictionaryAddValue(v11, kCFUserNotificationTextFieldValuesKey, v28);
      CFRelease(v28);
    }

    CFDictionaryAddValue(v11, kCFUserNotificationLocalizationURLKey, (const void *)qword_8258);
    if (dword_8248) {
      v31 = @"VPN Connection";
    }
    else {
      v31 = @"Network Connection";
    }
    CFDictionaryAddValue(v11, kCFUserNotificationAlertHeaderKey, v31);
    if (v8)
    {
      else {
        v32 = @"Incorrectly entered password";
      }
      CFDictionaryAddValue(v11, kCFUserNotificationAlertMessageKey, v32);
    }

    CFDictionaryAddValue(v11, kCFUserNotificationAlternateButtonTitleKey, @"Cancel");
    CFOptionFlags v33 = v54;
    CFOptionFlags responseFlags = v54;
    if (Count >= 1)
    {
      v34 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      v35 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      uint64_t v56 = 1LL;
      CFNumberRef v36 = CFNumberCreate(0LL, kCFNumberIntType, (char *)&v56 + 4);
      CFNumberRef v37 = CFNumberCreate(0LL, kCFNumberIntType, &v56);
      CFNumberRef v38 = v37;
      if (v34 && v35 && v36 && v37)
      {
        v39 = a6;
        CFIndex v40 = Count;
        do
        {
          CFArrayAppendValue(v34, v36);
          CFArrayAppendValue(v35, v38);
          --v40;
        }

        while (v40);
        CFDictionarySetValue(v11, @"SBUserNotificationTextAutocapitalizationType", v34);
        CFDictionarySetValue(v11, @"SBUserNotificationTextAutocorrectionType", v35);
        a6 = v39;
      }

      if (v34) {
        CFRelease(v34);
      }
      if (v35) {
        CFRelease(v35);
      }
      if (v36) {
        CFRelease(v36);
      }
      if (v38) {
        CFRelease(v38);
      }
      CFOptionFlags v33 = responseFlags;
    }

    v41 = CFUserNotificationCreate(0LL, 0.0, v33, &error, v11);
    qword_8268 = (uint64_t)v41;
    if (!v41)
    {
      CFRelease(v11);
      return 0LL;
    }

    CFUserNotificationReceiveResponse(v41, 0.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      char v42 = 0;
      uint64_t v43 = 0LL;
    }

    else
    {
      ResponseValue = CFUserNotificationGetResponseValue( (CFUserNotificationRef)qword_8268,  kCFUserNotificationTextFieldValuesKey,  0LL);
      v45 = CFUserNotificationGetResponseValue( (CFUserNotificationRef)qword_8268,  kCFUserNotificationTextFieldValuesKey,  1LL);
      v46 = v45;
      if (ResponseValue) {
        BOOL v47 = v45 == 0LL;
      }
      else {
        BOOL v47 = 1;
      }
      int v48 = !v47;
      if (a5 == 2)
      {
        if (!v48 || CFStringCompare(ResponseValue, v45, 0LL)) {
          goto LABEL_78;
        }
      }

      else if (!v48 || !CFStringGetCString(ResponseValue, a1, v52, 0x8000100u))
      {
LABEL_78:
        uint64_t v43 = 0xFFFFFFFFLL;
        char v42 = 1;
        goto LABEL_79;
      }

      if (!CFStringGetCString(v46, a3, v50, 0x8000100u)) {
        goto LABEL_78;
      }
      char v42 = 0;
      uint64_t v43 = 1LL;
    }

LABEL_79:
    CFRelease((CFTypeRef)qword_8268);
    qword_8268 = 0LL;
    CFRelease(v11);
    ++v8;
    if ((v42 & 1) == 0) {
      return v43;
    }
  }
}

uint64_t dialog_invoke_ui_thread()
{
  if (pipe(&dword_8270) < 0) {
    error();
  }
  int v0 = dword_8270;
  int v1 = 1;
  uint64_t v2 = &v5;
  do
  {
    ssize_t v3 = read(v0, v2, v1);
    if (v3 < 0)
    {
      if (&kill_link_ptr || *__error() != 4)
      {
        close(dword_8270);
        dword_8270 = -1;
        close(dword_8274);
        dword_8274 = -1;
        goto LABEL_17;
      }

      ssize_t v3 = 0LL;
    }

    else if (!v3)
    {
      break;
    }

    v1 -= v3;
    v2 += v3;
  }

  while (v1 > 0);
  close(dword_8270);
  dword_8270 = -1;
  close(dword_8274);
  dword_8274 = -1;
  if (v1 <= 0)
  {
    uint64_t result = v5;
    if ((_DWORD)result == 1)
    {
      strncpy((char *)&user_ptr, (const char *)&username_ptr, 0x100uLL);
      return 1LL;
    }

    return result;
  }

LABEL_17:
  uint64_t result = qword_8268;
  if (qword_8268)
  {
    CFUserNotificationCancel((CFUserNotificationRef)qword_8268);
    return 0LL;
  }

  return result;
}

uint64_t sub_3A1C()
{
  BOOL __buf = 0;
  int v0 = pthread_self();
  if (!pthread_detach(v0)) {
    BOOL __buf = dialog_password((char *)&username_ptr, 256, (char *)&passwd_ptr, 256, 0, 0LL) != 0;
  }
  if (dword_8274 != -1) {
    write(dword_8274, &__buf, 1uLL);
  }
  return 0LL;
}

void add_notifier()
{
  while (1)
    ;
}

void add_options()
{
  while (1)
    ;
}

void error()
{
  while (1)
    ;
}

void lcp_close()
{
  while (1)
    ;
}

void timeout(int a1)
{
  while (1)
    ;
}

void untimeout()
{
  while (1)
    ;
}