@interface NSInflect
@end

@implementation NSInflect

_NSLexiconMorphunDictionary *___NSInflect_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (_NSLexiconMorphunDictionary *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:a2];
  if (!v4)
  {
    v4 =  -[_NSLexiconMorphunDictionary initWithLanguage:]( objc_alloc(&OBJC_CLASS____NSLexiconMorphunDictionary),  "initWithLanguage:",  a2);
    if (v4)
    {
      v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      if (!v5)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = objc_alloc_init(MEMORY[0x189603FC8]);
        v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      }

      [v5 setObject:v4 forKeyedSubscript:a2];
    }
  }

  return v4;
}

void ___NSInflect_block_invoke_2(uint64_t a1, NSInflectionRule *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v248 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return;
  }
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v244 = 0u;
  __int128 v245 = 0u;
  __int128 v246 = 0u;
  __int128 v247 = 0u;
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v244 objects:v243 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v245;
    unint64_t v11 = a3 + a4;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v245 != v10) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v244 + 1) + 8 * i);
        unint64_t v14 = [v13 replacementRangeInResult];
        if (v14 + v15 >= v11) {
          NSUInteger v16 = a3 + a4;
        }
        else {
          NSUInteger v16 = v14 + v15;
        }
        if (a3 > v14 || v14 >= v11)
        {
          BOOL v18 = v14 > a3 || a3 >= v14 + v15;
          unint64_t v14 = a3;
          if (v18) {
            continue;
          }
        }

        if (v16 != v14) {
          [v7 addObject:v13];
        }
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v244 objects:v243 count:16];
    }

    while (v9);
  }

  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  v19 = (os_log_s *)_NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v47 = [*(id *)(a1 + 32) count];
    uint64_t v48 = [v7 count];
    v249.location = a3;
    v249.length = a4;
    *(_DWORD *)buf = 134349570;
    *(void *)&buf[4] = v47;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2114;
    v236 = NSStringFromRange(v249);
    _os_log_debug_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}lld format specifiers are relevant (out of %{public}lld) in range %{public}@",  buf,  0x20u);
  }

  if (!*(_BYTE *)(a1 + 136))
  {
LABEL_45:
    uint64_t v215 = 0LL;
    v216 = &v215;
    uint64_t v217 = 0x2020000000LL;
    uint64_t v218 = 0LL;
    v164 = objc_alloc_init(&OBJC_CLASS___NSMorphology);
    uint64_t v214 = 0LL;
    v24 = &off_18C5D6000;
    if (-[NSInflectionRule isEqual:](a2, "isEqual:", MEMORY[0x189604A80]))
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      v25 = (os_log_s *)_NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v250.location = a3;
        v250.length = a4;
        v49 = NSStringFromRange(v250);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v49;
        _os_log_debug_impl( &dword_182EB1000,  v25,  OS_LOG_TYPE_DEBUG,  "NSInflect attribute is NO, not inflecting in range %{public}@",  buf,  0xCu);
      }

LABEL_285:
      _Block_object_dispose(&v215, 8);
      return;
    }

    NSUInteger v163 = a4;
    if ((-[NSInflectionRule isEqual:](a2, "isEqual:", MEMORY[0x189604A88]) & 1) == 0
      && +[NSInflectionRule automaticRule](&OBJC_CLASS___NSInflectionRule, "automaticRule") != a2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSMorphology mergeMorphology:override:]( (uint64_t)v164,  -[NSMorphology initWithInflection:](objc_alloc(&OBJC_CLASS___NSMorphology), "initWithInflection:", a2),  1);
          v216[3] |= 2uLL;
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v46 = (os_log_s *)_NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v255.location = a3;
            v255.length = a4;
            v70 = NSStringFromRange(v255);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v164;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v70;
            _os_log_debug_impl( &dword_182EB1000,  v46,  OS_LOG_TYPE_DEBUG,  "NSInflect attribute is an internal inflection object (%@), using it in range %{public}@",  buf,  0x16u);
          }
        }

        v29 = 0LL;
        v160 = 0LL;
        id obja = 0LL;
        int v156 = 0;
        int v28 = 1;
        goto LABEL_139;
      }

      -[NSMorphology mergeMorphology:override:]( (uint64_t)v164,  (void *)-[NSInflectionRule morphology](a2, "morphology"),  1);
      v216[3] |= 2uLL;
      if (-[NSInflectionRule referentConcept](a2, "referentConcept"))
      {
        if (-[NSInflectionRule referentConcept](a2, "referentConcept") < 1
          || (unint64_t v26 = -[NSInflectionRule referentConcept](a2, "referentConcept"),
              v26 > [*(id *)(a1 + 64) count]))
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          uint64_t v27 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_60;
          }
          v269.location = a3;
          v269.length = a4;
          v150 = NSStringFromRange(v269);
          uint64_t v151 = -[NSInflectionRule referentConcept](a2, "referentConcept");
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v150;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = v151;
          v67 = "NSInflectionReferentConcept attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
          v68 = (os_log_s *)v27;
          uint32_t v69 = 22;
LABEL_288:
          _os_log_error_impl(&dword_182EB1000, v68, OS_LOG_TYPE_ERROR, v67, buf, v69);
LABEL_60:
          int v28 = 0;
          v29 = 0LL;
          goto LABEL_97;
        }

        v29 = (NSString *)objc_msgSend( *(id *)(a1 + 64),  "objectAtIndexedSubscript:",  -[NSInflectionRule referentConcept](a2, "referentConcept") - 1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          uint64_t v64 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_60;
          }
          v254.location = a3;
          v254.length = a4;
          v65 = NSStringFromRange(v254);
          uint64_t v66 = -[NSInflectionRule referentConcept](a2, "referentConcept");
          *(_DWORD *)buf = 138543875;
          *(void *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = v66;
          *(_WORD *)&buf[22] = 2113;
          v236 = v29;
          v67 = "NSInflectionReferentConcept attribute in range %{public}@ is set to %{public}ld. Expected a 'TermOfAddre"
                "ss' concept, but found %{private}@ instead.";
          v68 = (os_log_s *)v64;
          uint32_t v69 = 32;
          goto LABEL_288;
        }
      }

      else
      {
        v29 = 0LL;
      }

      int v28 = 1;
LABEL_97:
      if (-[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument"))
      {
        if (-[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument") >= 1)
        {
          __int128 v242 = 0u;
          __int128 v241 = 0u;
          __int128 v240 = 0u;
          __int128 v239 = 0u;
          v53 = *(void **)(a1 + 32);
          uint64_t v54 = [v53 countByEnumeratingWithState:&v239 objects:v238 count:16];
          if (v54)
          {
            uint64_t v55 = *(void *)v240;
LABEL_101:
            uint64_t v56 = 0LL;
            while (1)
            {
              if (*(void *)v240 != v55) {
                objc_enumerationMutation(v53);
              }
              v160 = *(void **)(*((void *)&v239 + 1) + 8 * v56);
              uint64_t v57 = [v160 index];
              if (v57 == -[NSInflectionRule agreeWithArgument](a2, "agreeWithArgument")) {
                break;
              }
              if (v54 == ++v56)
              {
                uint64_t v54 = [v53 countByEnumeratingWithState:&v239 objects:v238 count:16];
                a4 = v163;
                if (v54) {
                  goto LABEL_101;
                }
                goto LABEL_121;
              }
            }

            a4 = v163;
            if (!v160) {
              goto LABEL_121;
            }
            v24 = &off_18C5D6000;
            if (-[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept"))
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v63 = (os_log_s *)_NSInflectionLog_log;
              if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                id obja = 0LL;
                goto LABEL_136;
              }

              v270.location = a3;
              v270.length = v163;
              v152 = NSStringFromRange(v270);
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v152;
              _os_log_error_impl( &dword_182EB1000,  v63,  OS_LOG_TYPE_ERROR,  "Both NSInflectionAgreementArgument and NSInflectionAgreementConcept attributes specified in range %{publ ic}@. The latter will be discarded.",  buf,  0xCu);
            }

            id obja = 0LL;
            goto LABEL_134;
          }
        }

uint64_t ___NSInflect_block_invoke_19(void *a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (![a2 count]) {
    return 5LL;
  }
  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    v6 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "Adding attributes of a single word";
      __int16 v25 = 2114;
      unint64_t v26 = a2;
      _os_log_debug_impl(&dword_182EB1000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: %{public}@", buf, 0x16u);
    }
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (!v7) {
    return 4LL;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  uint64_t v12 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(a2);
      }
      unint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v15 = [v14 partOfSpeech];
      if (!a3 || v15 != a3)
      {
        if (v11 || v15 != 9)
        {
          if (v9 || v15 != 6)
          {
            if (!v10) {
              uint64_t v10 = v14;
            }
          }

          else
          {
            uint64_t v9 = v14;
          }
        }

        else
        {
          unint64_t v11 = v14;
        }

        if (v11 && v9 != 0LL)
        {
          -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[4] + 8LL) + 40LL), v11, 1);
LABEL_33:
          -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[4] + 8LL) + 40LL), v11, 0);
          return 2LL;
        }
      }
    }

    uint64_t v8 = [a2 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v8) {
      continue;
    }
    break;
  }

  if (v11 && !v9)
  {
    -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[5] + 8LL) + 40LL), v11, 0);
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) |= 1uLL;
    return 1LL;
  }

  if (v11) {
    goto LABEL_33;
  }
  if (v9)
  {
    -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[7] + 8LL) + 40LL), v9, 0);
    return 3LL;
  }

  if (v10) {
    -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[8] + 8LL) + 40LL), v10, 0);
  }
  return 4LL;
}

uint64_t ___NSInflect_block_invoke_22(uint64_t *a1, void *a2)
{
  uint64_t v4 = [a2 replacementRangeInResult];
  uint64_t v6 = v5;
  if ([a2 replacementKind] == 1 || (objc_msgSend(a2, "argument"), _NSIsNSNumber()))
  {
    if ([a2 replacementKind] == 1)
    {
      [a2 argument];
      if ((_NSIsNSNumber() & 1) == 0) {
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void _NSInflect(NSLocale * _Nullable, NSArray<_NSAttributedStringReplacement *> * _Nonnull, NSArray<NSObject *> * _Nullable, NSTermOfAddress * _Nullable, NSUInteger (^ _Nonnull)(void), BOOL, void (^ _Nonnull)(NSAttri butedStringKey, NSRange, __attribute__(noescape) void (^)(id _Nullable, NSRange, BOOL * _Nonnull)), void(^ _Nonnull)(NSRange, __attribute__(noescape) void (^)(id _Nullable, NSRange, BOOL * _Nonnull)), void (^ _N onnull)(NSRange, __attribute__(noescape) void (^)(NSLocalizedNumberFormatRule *, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSAttributedStringKey, NSRange), BOOL (^ _Nonnull)(NSRange), id  _Nullable (^ _Nonnull) (NSAttributedStringKey, NSRange), NSString *(^ _Nonnull)(NSRange), void (^ _Nonnull)(NSRange, __attribute__( (noescape)) void (^)(NSString * _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, id), void (^ _Nonnull)(NSRange, NSAttributedStringKey, id), id  _Nullable (^ _Nonnull)(id))_block_invoke"),  @"NSAttributedString_Inflection.m",  513LL,  @"Attribute string replacement argument should be a NSNumber when the formatting specifier is numeric");
      }
    }

    uint64_t v7 = *(void **)(*(void *)(a1[8] + 8) + 40LL);
    if (!v7)
    {
      *(void *)(*(void *)(a1[8] + 8) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v7 = *(void **)(*(void *)(a1[8] + 8) + 40LL);
    }

    objc_msgSend(v7, "addObject:", objc_msgSend(a2, "argument"));
    uint64_t v8 = *(void **)(*(void *)(a1[9] + 8) + 40LL);
    if (!v8)
    {
      *(void *)(*(void *)(a1[9] + 8) + 40LL) = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v8 = *(void **)(*(void *)(a1[9] + 8) + 40LL);
    }

    return objc_msgSend(v8, "addObject:", _NSInflectionLanguageWithLensAndRange(a1[5], v4, v6));
  }

  uint64_t v10 = (void *)[a2 argument];
  uint64_t v11 = a1[5];
  uint64_t v12 = [a2 replacementRangeInResult];
  unint64_t v14 = (void *)_NSInflectionGrammarWithLensAndRange(v11, v12, v13);
  uint64_t result = _NSIsNSString();
  if ((result & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t result = _NSIsNSAttributedString();
  if ((_DWORD)result)
  {
    uint64_t result = [v10 string];
    uint64_t v10 = (void *)result;
LABEL_14:
    if (v10)
    {
      if (v14) {
        uint64_t v15 = [v14 partOfSpeech];
      }
      else {
        uint64_t v15 = 0LL;
      }
      _NSInflectionLanguageWithLensAndRange(a1[5], v4, v6);
      NSUInteger v16 = (void *)(*(uint64_t (**)(void))(a1[6] + 16))();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1[7] + 16))( a1[7],  [v16 allPossibleWordAttributesForWord:v10],  v15);
    }
  }

  if (v14) {
    return -[NSMorphology mergeMorphology:override:](a1[4], v14, 0);
  }
  return result;
}

void *___NSInflect_block_invoke_30(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  _NSInflectionLanguageWithLensAndRange(a1[4], a3, a4);
  uint64_t result = (void *)(*(uint64_t (**)(void))(a1[5] + 16))();
  if (result)
  {
    uint64_t v9 = (void *)[result allPossibleWordAttributesForWord:a2];
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t result = (void *)[v9 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (result)
    {
      uint64_t v10 = result;
      uint64_t v11 = *(void *)v15;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t result = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v12) partOfSpeech];
        if (v10 == (void *)++v12)
        {
          uint64_t result = (void *)[v9 countByEnumeratingWithState:&v14 objects:v13 count:16];
          uint64_t v10 = result;
          if (result) {
            goto LABEL_4;
          }
          *(void *)(*(void *)(a1[6] + 8) + 24LL) |= 1uLL;
          *a5 = 1;
          return result;
        }
      }
    }
  }

  return result;
}

void *___NSInflect_block_invoke_35( void *result,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  _BYTE *a7)
{
  if (a2)
  {
    uint64_t v10 = result;
    uint64_t result = (id)[a2 capitalizedStringWithLocale:result[4]];
    *(void *)(*(void *)(v10[5] + 8LL) + 40LL) = result;
    uint64_t v11 = *(void *)(v10[6] + 8LL);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 40) = a4;
  }

  *a7 = 1;
  return result;
}

uint64_t ___NSInflect_block_invoke_37(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v6 = result;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v7 = *(void **)(result + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      unint64_t v11 = a3 + a4;
      while (2)
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) rangeValue];
          if (v11 >= v13 + v14) {
            uint64_t v15 = v13 + v14;
          }
          else {
            uint64_t v15 = a3 + a4;
          }
          BOOL v16 = v13 > a3 || a3 >= v13 + v14;
          unint64_t v17 = a3;
          if (v16)
          {
            BOOL v18 = a3 > v13 || v13 >= v11;
            unint64_t v17 = v13;
            if (v18) {
              continue;
            }
          }

          if (v15 != v17)
          {
            __int128 v20 = *(uint64_t (**)(void))(*(void *)(v6 + 48) + 16LL);
            return v20();
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if ([*(id *)(v6 + 40) count]
      && (uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(v6 + 56) + 16LL))()) != 0
      && v19 != [MEMORY[0x189603FE8] null])
    {
      __int128 v20 = *(uint64_t (**)(void))(*(void *)(v6 + 64) + 16LL);
    }

    else
    {
      __int128 v20 = *(uint64_t (**)(void))(*(void *)(v6 + 64) + 16LL);
    }

    return v20();
  }

  return result;
}

void ___NSInflect_block_invoke_2_39(void *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1[4])
  {
    uint64_t v9 = (*(uint64_t (**)(void))(a1[5] + 16LL))();
    if (!v9 || (uint64_t v10 = v9, (_NSIsNSString() & 1) == 0)) {
      uint64_t v10 = (*(uint64_t (**)(void))(a1[6] + 16LL))();
    }
    unint64_t v11 = (void *)objc_msgSend( a2,  "_formattedString:withStringLocale:andDisplayLocale:",  v10,  objc_msgSend( MEMORY[0x189603F90],  "localeWithLocaleIdentifier:",  _NSInflectionLanguageWithLensAndRange(a1[5], a3, a4)),  a1[4]);
    if (v11)
    {
      uint64_t v12 = v11;
      if (([v11 isEqualToString:v10] & 1) == 0)
      {
        (*(void (**)(void))(a1[7] + 16LL))();
        (*(void (**)(void, uint64_t, uint64_t, void *))(a1[8] + 16LL))(a1[8], a3, a4, v12);
      }
    }
  }

  else
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v14 = (os_log_s *)_NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
    }

    *a5 = 1;
  }

@end