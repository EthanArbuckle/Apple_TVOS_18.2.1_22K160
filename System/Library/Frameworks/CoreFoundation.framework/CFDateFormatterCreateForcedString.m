@interface CFDateFormatterCreateForcedString
@end

@implementation CFDateFormatterCreateForcedString

CFCharacterSetRef ____CFDateFormatterCreateForcedString_block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInString((CFAllocatorRef)&__kCFAllocatorSystemDefault, @"hHkK");
  __CFDateFormatterCreateForcedString_hourCharacters = (uint64_t)result;
  return result;
}

void ____CFDateFormatterCreateForcedString_block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 48));
  CFIndex v4 = Length;
  unint64_t v5 = 2 * Length;
  if ((unint64_t)(2 * Length) < 0x101)
  {
    if (Length < 1)
    {
      v6 = 0LL;
    }

    else
    {
      MEMORY[0x1895F8858](Length, v3);
      v6 = (UniChar *)((char *)&v9[-4] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    v6 = (UniChar *)malloc(2 * Length);
  }

  if (!CFStringGetCharactersPtr(*(CFStringRef *)(a1 + 48)))
  {
    v11.location = 0LL;
    v11.length = v4;
    CFStringGetCharacters(*(CFStringRef *)(a1 + 48), v11, v6);
  }

  HIDWORD(v8) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = uadatpg_remapPatternWithOptions();
  if (SHIDWORD(v8) <= 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFStringCreateWithCharacters( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v9,  *(int *)(*(void *)(*(void *)(a1 + 32) + 8LL)
                                                                           + 24LL));
  }

  else if (HIDWORD(v8) == 15)
  {
    HIDWORD(v8) = 0;
    v7 = (UniChar *)calloc(*(int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 1LL, 2uLL);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = uadatpg_remapPatternWithOptions();
    if (SHIDWORD(v8) <= 0) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFStringCreateWithCharacters( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v7,  *(int *)(*(void *)(*(void *)(a1 + 32) + 8LL)
    }
                                                                             + 24LL));
    free(v7);
  }

  if (v5 >= 0x101) {
    free(v6);
  }
}

@end