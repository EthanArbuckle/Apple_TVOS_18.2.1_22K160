@interface CFDateFormatterCreateSkeletonFromTemplate
@end

@implementation CFDateFormatterCreateSkeletonFromTemplate

void ___CFDateFormatterCreateSkeletonFromTemplate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = 2 * v4;
  if ((unint64_t)(2 * v4) < 0x301)
  {
    if (v4 < 1)
    {
      v6 = 0LL;
    }

    else
    {
      MEMORY[0x1895F8858](a1, a2);
      v6 = (UniChar *)((char *)&v14[-4] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    v6 = (UniChar *)malloc(2 * v4);
  }

  CharactersPtr = (UChar *)CFStringGetCharactersPtr(*(CFStringRef *)(a1 + 48));
  if (!CharactersPtr)
  {
    v16.length = *(void *)(a1 + 40);
    v16.location = 0LL;
    CFStringGetCharacters(*(CFStringRef *)(a1 + 48), v16, v6);
    CharactersPtr = v6;
  }

  bzero(v14, 0x600uLL);
  uint64_t v8 = *(unsigned int *)(a1 + 40);
  HIDWORD(v13) = 0;
  int Skeleton = __cficu_udatpg_getSkeleton(a2, CharactersPtr, v8, v14, 768LL, (int *)&v13 + 1);
  if (SHIDWORD(v13) <= 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFStringCreateWithCharacters( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v14,  Skeleton);
  }

  else if (HIDWORD(v13) == 15)
  {
    v10 = (UniChar *)calloc(Skeleton + 1, 2uLL);
    int v11 = __cficu_udatpg_getSkeleton(a2, CharactersPtr, v8, v14, 768LL, (int *)&v13 + 1);
    if (SHIDWORD(v13) <= 0)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFStringCreateWithCharacters( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v10,  v11);
    }

    else
    {
      v12 = *(_DWORD **)(a1 + 56);
      if (v12) {
        _DWORD *v12 = HIDWORD(v13);
      }
    }

    free(v10);
  }

  else
  {
    **(_DWORD **)(a1 + 56) = HIDWORD(v13);
  }

  if (v5 >= 0x301) {
    free(v6);
  }
}

@end