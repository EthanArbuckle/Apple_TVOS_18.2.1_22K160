@interface CFBundleGetBundleVersionForURL
@end

@implementation CFBundleGetBundleVersionForURL

uint64_t ___CFBundleGetBundleVersionForURL_block_invoke( void *a1,  CFStringRef theString,  uint64_t a3,  int a4)
{
  if (!a4)
  {
    uint64_t v8 = a1[9];
    goto LABEL_21;
  }

  if (a4 == 10 || a4 == 4)
  {
    CFIndex Length = CFStringGetLength(theString);
    if (Length == a1[10])
    {
      v10.location = 0LL;
      v10.length = Length;
      if (CFStringCompareWithOptions(theString, @"Resources", v10, 1uLL) == kCFCompareEqualTo)
      {
        uint64_t v8 = a1[4];
        goto LABEL_21;
      }
    }

    if (Length == a1[11])
    {
      v11.location = 0LL;
      v11.length = Length;
      if (CFStringCompareWithOptions(theString, @"Contents", v11, 1uLL) == kCFCompareEqualTo)
      {
        uint64_t v8 = a1[5];
        goto LABEL_21;
      }
    }

    if (Length == a1[12])
    {
      v12.location = 0LL;
      v12.length = Length;
      if (CFStringCompareWithOptions(theString, @"Support Files", v12, 1uLL) == kCFCompareEqualTo)
      {
        uint64_t v8 = a1[6];
        goto LABEL_21;
      }
    }

    if (Length == a1[13])
    {
      v13.location = 0LL;
      v13.length = Length;
      if (CFStringCompareWithOptions(theString, @"Wrapper", v13, 0LL) == kCFCompareEqualTo)
      {
        uint64_t v8 = a1[7];
        goto LABEL_21;
      }
    }

    if (a4 == 10 && Length == a1[14])
    {
      v14.location = 0LL;
      v14.length = Length;
      if (CFStringCompareWithOptions(theString, @"WrappedBundle", v14, 0LL) == kCFCompareEqualTo)
      {
        uint64_t v8 = a1[8];
LABEL_21:
        *(_BYTE *)(*(void *)(v8 + 8) + 24LL) = 1;
      }
    }
  }

  return 1LL;
}

uint64_t ___CFBundleGetBundleVersionForURL_block_invoke_2( uint64_t a1,  CFStringRef theString,  uint64_t a3,  int a4)
{
  if (a4 == 10 || a4 == 4)
  {
    CFIndex Length = CFStringGetLength(theString);
    if (Length == *(void *)(a1 + 40))
    {
      v8.length = Length;
      v8.location = 0LL;
      if (CFStringCompareWithOptions(theString, @"Contents", v8, 1uLL) == kCFCompareEqualTo) {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      }
    }
  }

  return 1LL;
}

@end