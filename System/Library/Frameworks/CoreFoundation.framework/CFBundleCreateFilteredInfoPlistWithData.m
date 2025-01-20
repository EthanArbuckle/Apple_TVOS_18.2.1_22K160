@interface CFBundleCreateFilteredInfoPlistWithData
@end

@implementation CFBundleCreateFilteredInfoPlistWithData

CFTypeID ___CFBundleCreateFilteredInfoPlistWithData_block_invoke(int a1, CFTypeRef cf)
{
  CFTypeID result = CFGetTypeID(cf);
  if (result != 7) {
    ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_cold_1();
  }
  return result;
}

void ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_2(uint64_t a1, CFStringRef theString)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v18.length = CFStringGetLength(theString);
  v18.location = 0LL;
  if (CFStringFindWithOptions(theString, @":", v18, 0LL, &result))
  {
    v19.length = result.location;
    v19.location = 0LL;
    v4 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v19);
    CFIndex v5 = result.location + 1;
    CFIndex Length = CFStringGetLength(theString);
    v20.length = Length + ~result.location;
    v20.location = v5;
    CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v20);
  }

  else
  {
    v4 = CFRetain(theString);
    CFStringRef v7 = 0LL;
  }

  if (_CFGetProductName_onceToken != -1) {
    dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
  }
  uint64_t v8 = _CFGetProductName__cfBundlePlatform;
  if (v7) {
    v9 = @":";
  }
  else {
    v9 = &stru_1899EF170;
  }
  if (v7) {
    v10 = v7;
  }
  else {
    v10 = &stru_1899EF170;
  }
  CFStringRef v11 = CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@-%@%@%@",  v4,  @"tvos",  v9,  v10);
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@~%@%@%@", v4, v8, v9, v10);
  CFStringRef v13 = CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@-%@~%@%@%@",  v4,  @"tvos",  v8,  v9,  v10);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), theString);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v11);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v12);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v13);
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(v13);
  CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@#CH%@%@", v4, v9, v10);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v14);
  CFRelease(v14);
  CFStringRef v15 = CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@#override%@%@",  v4,  v9,  v10);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v15);
  CFRelease(v15);
  if (v4) {
    CFRelease(v4);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@:%@",  *(void *)(a1 + 32),  a2);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), v3);
  CFRelease(v3);
}

void ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_cold_1()
{
  qword_18C539A70 = (uint64_t)"Property lists must have string keys!";
  __break(1u);
}

@end