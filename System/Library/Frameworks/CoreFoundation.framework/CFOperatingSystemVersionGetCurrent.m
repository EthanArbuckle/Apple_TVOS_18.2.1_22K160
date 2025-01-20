@interface CFOperatingSystemVersionGetCurrent
@end

@implementation CFOperatingSystemVersionGetCurrent

void ___CFOperatingSystemVersionGetCurrent_block_invoke()
{
  v0 = (const __CFString *)_CFCopySystemVersionDictionaryValue(@"ProductVersion");
  if (v0)
  {
    v1 = v0;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v0, @".");
    if (ArrayBySeparatingStrings)
    {
      v3 = ArrayBySeparatingStrings;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count < 1)
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = 0LL;
        uint64_t IntValue = -1LL;
      }

      else
      {
        unint64_t v5 = Count;
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, 0LL);
        uint64_t IntValue = CFStringGetIntValue(ValueAtIndex);
        if (v5 == 1)
        {
          uint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
        }

        else
        {
          v10 = (const __CFString *)CFArrayGetValueAtIndex(v3, 1LL);
          uint64_t v9 = CFStringGetIntValue(v10);
          if (v5 < 3)
          {
            uint64_t v8 = 0LL;
          }

          else
          {
            v11 = (const __CFString *)CFArrayGetValueAtIndex(v3, 2LL);
            uint64_t v8 = CFStringGetIntValue(v11);
          }
        }
      }

      CFRelease(v3);
    }

    else
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t IntValue = -1LL;
    }

    CFRelease(v1);
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t IntValue = -1LL;
  }

  *(void *)&_CFOperatingSystemVersionGetCurrent_version = IntValue;
  *((void *)&_CFOperatingSystemVersionGetCurrent_version + 1) = v9;
  qword_18C45C918 = v8;
}

@end