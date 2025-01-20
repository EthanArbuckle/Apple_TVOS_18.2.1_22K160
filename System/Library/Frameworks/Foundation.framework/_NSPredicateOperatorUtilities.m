@interface _NSPredicateOperatorUtilities
+ (BOOL)doRegexForString:(id)a3 pattern:(id)a4 likeProtect:(BOOL)a5 flags:(unint64_t)a6 context:(id *)a7;
+ (__CFLocale)retainedLocale;
+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4;
+ (int64_t)copyRegexFindSafePattern:(id)a3 toBuffer:(unsigned __int16 *)a4;
@end

@implementation _NSPredicateOperatorUtilities

+ (__CFLocale)retainedLocale
{
  CFLocaleRef v2 = (CFLocaleRef)qword_18C496CF8;
  if (!qword_18C496CF8)
  {
    objc_sync_enter(a1);
    if ((_MergedGlobals_131 & 1) == 0)
    {
      _MergedGlobals_131 = 1;
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver( LocalCenter,  0LL,  (CFNotificationCallback)_localeDidChange,  (CFStringRef)*MEMORY[0x189604FE8],  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    }

    v5 = (const __CFString *)*MEMORY[0x189605188];
    ValueAtIndex = (const __CFString *)CFPreferencesCopyAppValue( @"AppleCollationOrder",  (CFStringRef)*MEMORY[0x189605188]);
    if (ValueAtIndex
      || (v10 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", v5), (v11 = v10) != 0LL)
      && (ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v10, 0LL),
          CFRetain(ValueAtIndex),
          CFRelease(v11),
          ValueAtIndex))
    {
      v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString( (CFAllocatorRef)*MEMORY[0x189604DB0],  ValueAtIndex);
      if (!CanonicalLanguageIdentifierFromString)
      {
        CanonicalLanguageIdentifierFromString = &stru_189CA6A28;
        CFRetain(&stru_189CA6A28);
      }

      char v9 = 0;
    }

    else
    {
      CFRetain(&stru_189CA6A28);
      ValueAtIndex = 0LL;
      v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CanonicalLanguageIdentifierFromString = &stru_189CA6A28;
      char v9 = 1;
    }

    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier( v7,  CanonicalLanguageIdentifierFromString);
    v13 = (const void *)*MEMORY[0x189604FF0];
    else {
      Value = &stru_189CA6A28;
    }
    if (Value) {
      v15 = Value;
    }
    else {
      v15 = &stru_189CA6A28;
    }
    CFLocaleRef v16 = CFLocaleCreate(0LL, v15);
    CFLocaleRef v2 = v16;
    while (!__ldaxr((unint64_t *)&qword_18C496CF8))
    {
      if (!__stlxr((unint64_t)v16, (unint64_t *)&qword_18C496CF8))
      {
        if ((v9 & 1) != 0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }

    __clrex();
    CFRelease(v16);
    CFLocaleRef v2 = (CFLocaleRef)qword_18C496CF8;
    if ((v9 & 1) != 0) {
      goto LABEL_24;
    }
LABEL_23:
    CFRelease(ValueAtIndex);
LABEL_24:
    CFRelease(CanonicalLanguageIdentifierFromString);
    CFRelease(ComponentsFromLocaleIdentifier);
    objc_sync_exit(a1);
  }

  CFRetain(v2);
  return v2;
}

+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  if ((unint64_t)[a3 length] >> 30) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Invalid string length (too long)" userInfo:0]);
  }
  if ((a4 & 2) != 0) {
    CFStringCompareFlags v6 = ((uint64_t)(a4 << 63) >> 63) & 1 | 0x180;
  }
  else {
    CFStringCompareFlags v6 = ((uint64_t)(a4 << 63) >> 63) & 0x101;
  }
  uint64_t Length = CFStringGetLength((CFStringRef)a3);
  BOOL v8 = Length > 899;
  MEMORY[0x1895F8858](Length);
  v10 = (UniChar *)((char *)v16 - v9);
  if (v11 < 900)
  {
    CFIndex v12 = 1024LL;
  }

  else
  {
    CFIndex v12 = Length + 200;
    v10 = (UniChar *)malloc(2 * (Length + 200));
  }

  v17.location = 0LL;
  v17.length = Length;
  CFStringGetCharacters((CFStringRef)a3, v17, v10);
  v10[Length] = 0;
  if ((a4 & 4) != 0)
  {
    if (Length < 900) {
      return (id)CFStringCreateWithCharacters(0LL, v10, Length);
    }
  }

  else
  {
    MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v10,  Length,  v12,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
    v14 = MutableWithExternalCharactersNoCopy;
    if ((a4 & 3) != 0) {
      CFStringFold(MutableWithExternalCharactersNoCopy, v6, 0LL);
    }
    CFStringNormalize(v14, kCFStringNormalizationFormKC);
    if (CFStringGetCharactersPtr(v14) != v10)
    {
      if (Length >= 900) {
        free(v10);
      }
      uint64_t Length = CFStringGetLength(v14);
      v10 = (UniChar *)malloc(2 * Length + 2);
      BOOL v8 = 1;
      v18.location = 0LL;
      v18.length = Length;
      CFStringGetCharacters(v14, v18, v10);
    }

    CFRelease(v14);
    v10[Length] = 0;
    if (!v8) {
      return (id)CFStringCreateWithCharacters(0LL, v10, Length);
    }
  }

  return (id)CFStringCreateWithCharactersNoCopy(0LL, v10, Length, (CFAllocatorRef)*MEMORY[0x189604DB8]);
}

+ (BOOL)doRegexForString:(id)a3 pattern:(id)a4 likeProtect:(BOOL)a5 flags:(unint64_t)a6 context:(id *)a7
{
  uint64_t v9 = (UniChar *)a5;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  v43 = (const __CFString *)a4;
  unint64_t v12 = [a4 length];
  if (v12 >> 30 || (unint64_t v13 = v12, v14 = [a3 length], v14 >> 30))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Invalid string or pattern length (too long)" userInfo:0]);
LABEL_44:
    v32 = @"Can't setText %s (string %@, pattern %@, case %ld, canon %ld)";
LABEL_46:
    v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v32,  u_errorName(v29),  a3,  v43,  v42,  v41);
    if ((_DWORD)a1) {
      free(v9);
    }
    v34 = (void *)MEMORY[0x189603F70];
    v35 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't do regex matching, reason: %@",  v33);
    objc_exception_throw((id)[v34 exceptionWithName:*MEMORY[0x189603A58] reason:v35 userInfo:0]);
LABEL_55:
    __break(1u);
    return result;
  }

  unint64_t v41 = a6 & 2;
  unint64_t v42 = a6 & 1;
  if ((a6 & 2) != 0) {
    CFStringCompareFlags v15 = ((uint64_t)(a6 << 63) >> 63) & 1 | 0x180;
  }
  else {
    CFStringCompareFlags v15 = ((uint64_t)(a6 << 63) >> 63) & 0x101;
  }
  UErrorCode status = U_ZERO_ERROR;
  a7->var2 = 3LL;
  if (!a7->var1)
  {
    v40[1] = v40;
    CFIndex v46 = v13;
    MEMORY[0x1895F8858](v14);
    CFRange v17 = (UChar *)((char *)v40 - v16);
    unsigned __int8 v45 = 0;
    if (v13 >= 0x1C2)
    {
      size_t v18 = v13 + 200;
      CFRange v17 = (UChar *)malloc(2 * (v13 + 200));
      unsigned __int8 v45 = 1;
    }

    else
    {
      size_t v18 = 1024LL;
    }

    v44 = v17;
    if ((a6 & 4) != 0)
    {
      v49.location = 0LL;
      v49.length = v13;
      CFStringGetCharacters(v43, v49, v17);
      v17[v13] = 0;
      a7->var0 = (id)CFStringCreateWithCharacters(0LL, v17, v13);
      if ((_DWORD)v9)
      {
        [a1 copyRegexFindSafePattern:v43 toBuffer:v17];
        LODWORD(v13) = u_strlen(v17);
        CFIndex v46 = (int)v13;
      }
    }

    else
    {
      _doPatternNormalization( v43,  (void **)&v44,  &v45,  (int)v9,  (CFStringRef *)a7,  v15,  &v46,  v18,  kCFStringNormalizationFormKC);
      CFRange v17 = v44;
      LODWORD(v13) = v46;
    }

    v19 = uregex_open(v17, v13, 0x28u, 0LL, &status);
    UErrorCode v20 = status;
    if (status < U_ILLEGAL_ARGUMENT_ERROR || (a6 & 4) != 0)
    {
      if (status < U_ILLEGAL_ARGUMENT_ERROR)
      {
        int64_t v22 = 3LL;
        goto LABEL_24;
      }
    }

    else
    {

      a7->var0 = 0LL;
      _doPatternNormalization( v43,  (void **)&v44,  &v45,  (int)v9,  (CFStringRef *)a7,  v15,  &v46,  v18,  kCFStringNormalizationFormC);
      if (v19) {
        uregex_close(v19);
      }
      UErrorCode status = U_ZERO_ERROR;
      v19 = uregex_open(v44, v46, 0x28u, 0LL, &status);
      if (status < U_ILLEGAL_ARGUMENT_ERROR)
      {
        int64_t v22 = 2LL;
LABEL_24:
        a7->var1 = v19;
        a7->var2 = v22;
        if (v45) {
          free(v44);
        }
        goto LABEL_26;
      }

      UErrorCode status = v20;
    }

    v36 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't open pattern %s (string %@, pattern %@, case %ld, canon %ld)",  u_errorName(v20),  a3,  v43,  v42,  v41);
    uregex_close(v19);
    if (v45) {
      free(v44);
    }
    v37 = (void *)MEMORY[0x189603F70];
    if (status == U_REGEX_RULE_SYNTAX)
    {
      v38 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't do regex matching, reason: (%@)",  v36);
      objc_exception_throw((id)[v37 exceptionWithName:*MEMORY[0x189603A60] reason:v38 userInfo:0]);
    }

    else
    {
      v39 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't do regex matching, reason: %@",  v36);
      objc_exception_throw((id)[v37 exceptionWithName:*MEMORY[0x189603A58] reason:v39 userInfo:0]);
    }

    goto LABEL_55;
  }

+ (int64_t)copyRegexFindSafePattern:(id)a3 toBuffer:(unsigned __int16 *)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength((CFStringRef)a3);
  CFStringRef theString = (CFStringRef)a3;
  uint64_t v46 = 0LL;
  CFIndex v47 = Length;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  v44 = (UniChar *)CharactersPtr;
  if (CharactersPtr)
  {
    CFIndex location = 0LL;
    CFIndex v49 = 0LL;
    unsigned __int8 v45 = 0LL;
    if (Length >= 1)
    {
      CFIndex v8 = 0LL;
      UniChar v9 = CharactersPtr[Length - 1];
      goto LABEL_15;
    }
  }

  else
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
    CFIndex location = 0LL;
    CFIndex v49 = 0LL;
    unsigned __int8 v45 = CStringPtr;
    if (Length > 0)
    {
      CFIndex v11 = Length - 1;
      if (CStringPtr)
      {
        CFIndex v8 = 0LL;
        UniChar v9 = CStringPtr[v11];
      }

      else
      {
        else {
          v14.CFIndex location = 0LL;
        }
        CFIndex v15 = v14.location + 64;
        if (v14.location + 64 >= Length) {
          CFIndex v15 = Length;
        }
        CFIndex location = v14.location;
        CFIndex v49 = v15;
        v14.length = v15 - v14.location;
        CFStringGetCharacters((CFStringRef)a3, v14, buffer);
        CFIndex v8 = location;
        UniChar v9 = buffer[v11 - location];
      }

@end