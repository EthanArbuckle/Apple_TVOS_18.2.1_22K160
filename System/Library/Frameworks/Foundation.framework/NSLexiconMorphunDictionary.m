@interface NSLexiconMorphunDictionary
@end

@implementation NSLexiconMorphunDictionary

void __64___NSLexiconMorphunDictionary_allPossibleWordAttributesForWord___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  uint64_t v6 = off_18C496888(*(void *)(*(void *)(a1 + 32) + 24LL), a2, &cf);
  v7 = &off_18C5D6000;
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v8 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Obtaining the token chain from a word): %{public}@",  buf,  0xCu);
    }

    CFRelease(cf);
  }

  if (!v6)
  {
    v16 = 0LL;
    uint64_t v9 = 0LL;
LABEL_34:
    id v18 = 0LL;
    char v19 = 1;
    char v17 = 1;
    goto LABEL_35;
  }

  CFTypeRef cf = 0LL;
  uint64_t v9 = off_18C496890(*(void *)(*(void *)(a1 + 32) + 16LL), v6, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v10 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Annotating the token chain): %{public}@",  buf,  0xCu);
    }

    CFRelease(cf);
  }

  if (!v9)
  {
    v16 = 0LL;
    goto LABEL_34;
  }

  CFTypeRef cf = 0LL;
  uint64_t v11 = off_18C496898(v9, 0LL, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v12 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Obtaining the first token): %{public}@",  buf,  0xCu);
    }

    CFRelease(cf);
  }

  CFTypeRef cf = 0LL;
  unsigned __int8 v13 = off_18C4968A0(v11, 6LL, &cf);
  if ((v13 & (cf == 0LL)) != 0) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0LL;
  }
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v15 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Checking that the token is the correct type): %{public}@",  buf,  0xCu);
    }

    CFRelease(cf);
    goto LABEL_30;
  }

  if (!v14)
  {
LABEL_30:
    v16 = 0LL;
LABEL_31:
    char v17 = 0;
    id v18 = 0LL;
    char v19 = 1;
    goto LABEL_35;
  }

  CFTypeRef cf = 0LL;
  v16 = (const __CFArray *)off_18C4968A8(v14, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v20 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Casting a token to obtain a morphological word token): %{public}@",  buf,  0xCu);
    }

    CFRelease(cf);
  }

  if (!v16) {
    goto LABEL_31;
  }
  CFTypeRef cf = 0LL;
  v16 = (const __CFArray *)off_18C4968B0(v16, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v21 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl( &dword_182EB1000,  v21,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Obtaining the lemma mappings for a morphological word token): %{public}@",  buf,  0xCu);
    }

    CFRelease(cf);
  }

  if (!v16) {
    goto LABEL_31;
  }
  id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
  CFIndex Count = CFArrayGetCount(v16);
  if (Count < 1)
  {
    char v19 = 0;
    char v17 = 0;
  }

  else
  {
    CFIndex v23 = Count;
    v31 = a4;
    for (CFIndex i = 0LL; i != v23; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v16, i);
      CFTypeRef cf = 0LL;
      uint64_t v26 = off_18C4968B8(ValueAtIndex, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v27 = (os_log_s *)v7[136];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          CFTypeRef v34 = cf;
          _os_log_error_impl( &dword_182EB1000,  v27,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Obtaining surface form grammemes): %{public}@",  buf,  0xCu);
        }

        CFRelease(cf);
      }

      else
      {
        v28 = (void *)off_18C4968C0(*(void *)(*(void *)(a1 + 32) + 32LL), v26, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v29 = (os_log_s *)v7[136];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            CFTypeRef v34 = cf;
            _os_log_error_impl( &dword_182EB1000,  v29,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine (Obtaining dictionary names for grammemes): %{public}@",  buf,  0xCu);
          }

          CFRelease(cf);
        }

        else
        {
          v30 = -[NSMorphology initWithMorphunAttributeValues:]( objc_alloc(&OBJC_CLASS___NSMorphology),  "initWithMorphunAttributeValues:",  v28);
          if (-[NSMorphology partOfSpeech](v30, "partOfSpeech") != (NSGrammaticalPartOfSpeechAbbreviation|NSGrammaticalPartOfSpeechDeterminer)) {
            [v18 addObject:v30];
          }
        }

        v7 = &off_18C5D6000;
      }
    }

    char v19 = 0;
    char v17 = 0;
    a4 = v31;
  }

@end