@interface RefreshRateCC
- (RefreshRateCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)initRefreshRateTable:(__CFArray *)a3;
@end

@implementation RefreshRateCC

- (RefreshRateCC)initWithParams:(__CFDictionary *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
  v4 = -[ComponentControl initWithCC::](&v7, "initWithCC::", 7LL, 0LL);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super.currentPower + 4) = 0;
    *((_BYTE *)&v4->super.currentPower + 5) = 0;
    v4->refreshRateLevelDown[1] = 100;
    v4->refreshRateLevelDown[0] = 100;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d RefreshRate ", 7LL);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    v5->super.releaseMaxLI = 2;
    sub_100020FE0(a3, @"MaxReleaseRate", kCFNumberIntType, &v5->super.releaseMaxLI);
  }

  return v5;
}

- (void)defaultAction
{
  unsigned int previousValue = self->super.previousValue;
  uint64_t v3 = *((unsigned __int8 *)&self->super.currentPower + 5);
  if (previousValue <= *((unsigned __int8 *)&self->super.currentPower + v3 + 6))
  {
    if (previousValue < self->refreshRateLevels[v3]
      && *((unsigned __int8 *)&self->super.currentPower + 4) - 1 > (int)v3)
    {
      char v4 = 1;
      goto LABEL_7;
    }
  }

  else if (*((_BYTE *)&self->super.currentPower + 5))
  {
    char v4 = -1;
LABEL_7:
    *((_BYTE *)&self->super.currentPower + 5) = v3 + v4;
  }

  self->refreshRateLevelDown[1] = self->refreshRateLevelDown[0];
  self->refreshRateLevelDown[0] = self->refreshRateLevelUp[*((unsigned __int8 *)&self->super.currentPower + 5)];
}

- (void)initRefreshRateTable:(__CFArray *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    uint64_t v17 = 0LL;
    int valuePtr = 0;
    char Count = CFArrayGetCount(a3);
    *((_BYTE *)&self->super.currentPower + 4) = Count;
    if (Count)
    {
      unint64_t v7 = 0LL;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (v9 = ValueAtIndex, CFTypeID v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"up");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *((_BYTE *)&self->super.currentPower + v7 + 6) = valuePtr;
          }

          v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"down");
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->refreshRateLevels[v7] = v17;
          }

          v13 = (const __CFNumber *)CFDictionaryGetValue(v9, @"level");
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->refreshRateLevelUp[v7] = BYTE4(v17);
          }
        }

        else
        {
          v14 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v19 = v7;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "<Error> Missing Refresh Rate Dictionary %d",  buf,  8u);
          }
        }

        ++v7;
      }

      while (v7 < *((unsigned __int8 *)&self->super.currentPower + 4));
    }
  }

  else
  {
    for (uint64_t i = 0LL; i != 4; ++i)
    {
      self->refreshRateLevelUp[i] = 100;
      self->refreshRateLevels[i] = 100;
      *((_BYTE *)&self->super.currentPower + i + 6) = 100;
    }

    *((_BYTE *)&self->super.currentPower + 4) = 4;
  }

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields");
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3) {
      return @"RefreshRate - fps";
    }
    else {
      return 0LL;
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
    return -[ComponentControl copyHeaderForIndex:](&v7, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3) {
      return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  self->refreshRateLevelDown[2]);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___RefreshRateCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }

@end