@interface _NSLexiconMorphunDictionary
- (NSString)languageCode;
- (_NSLexiconMorphunDictionary)initWithLanguage:(id)a3;
- (id)allPossibleWordAttributesForWord:(id)a3;
- (id)preferredPronoun:(id)a3 forTermOfAddress:(id)a4 morphology:(id)a5 dependency:(id)a6;
- (void)_iterateFormsOfWord:(id)a3 usingBlock:(id)a4;
- (void)dealloc;
@end

@implementation _NSLexiconMorphunDictionary

- (_NSLexiconMorphunDictionary)initWithLanguage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____NSLexiconMorphunDictionary;
  v4 = -[_NSLexiconMorphunDictionary init](&v18, sel_init);
  if (v4)
  {
    if (qword_18C496938 != -1) {
      dispatch_once(&qword_18C496938, &__block_literal_global_30);
    }
    if (!off_18C496808 || !_NSRequiresMorphunInflectionForLanguageIdentifier(a3)) {
      goto LABEL_49;
    }
    if (qword_18C496938 != -1) {
      dispatch_once(&qword_18C496938, &__block_literal_global_30);
    }
    if (!off_18C496808) {
      __assert_rtn("_NSLexiconGetMorphunAnalyzerFactory", "NSLexiconMorphun.m", 564, "_NSLexiconLoadMorphunIfNeeded()");
    }
    if (qword_18C496980 != -1) {
      dispatch_once(&qword_18C496980, &__block_literal_global_273_0);
    }
    uint64_t v5 = qword_18C496978;
    if (!qword_18C496978) {
      goto LABEL_49;
    }
    v6 = (void *)[MEMORY[0x189603F90] localeWithLocaleIdentifier:a3];
    if (v6)
    {
      CFTypeRef cf = 0LL;
      uint64_t v7 = off_18C496860(v5, v6, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v8 = (os_log_s *)_NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v20 = a3;
          __int16 v21 = 2114;
          CFTypeRef v22 = cf;
          _os_log_error_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine for language %{public}@ (Getting analyzer from factory): %{public}@",  buf,  0x16u);
        }

        CFRelease(cf);
      }

      if (v7)
      {
        CFTypeRef cf = 0LL;
        uint64_t v9 = off_18C496868(v6, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v10 = (os_log_s *)_NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v20 = a3;
            __int16 v21 = 2114;
            CFTypeRef v22 = cf;
            _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine for language %{public}@ (Creating a tokenizer): %{public}@",  buf,  0x16u);
          }

          CFRelease(cf);
        }

        CFTypeRef cf = 0LL;
        off_18C496870(v9, 2LL, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v11 = (os_log_s *)_NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v20 = a3;
            __int16 v21 = 2114;
            CFTypeRef v22 = cf;
            _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine for language %{public}@ (Setting the tokenizer to use the unmodified style): %{public}@",  buf,  0x16u);
          }

          CFRelease(cf);
          off_18C496878(v9);
          int v12 = 0;
          uint64_t v9 = 0LL;
        }

        else
        {
          if (v9)
          {
            CFTypeRef cf = 0LL;
            uint64_t v13 = off_18C496880(v6, &cf);
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v15 = (os_log_s *)_NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v20 = a3;
                __int16 v21 = 2114;
                CFTypeRef v22 = cf;
                _os_log_error_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_ERROR,  "Cannot use inflection engine for language %{public}@ (Getting the dictionary for this locale): %{public}@",  buf,  0x16u);
              }

              CFRelease(cf);
            }

            int v12 = 1;
            goto LABEL_44;
          }

          int v12 = 0;
        }

        uint64_t v13 = 0LL;
LABEL_44:
        int v14 = 1;
        goto LABEL_45;
      }

      int v12 = 0;
      uint64_t v9 = 0LL;
    }

    else
    {
      int v12 = 0;
      uint64_t v9 = 0LL;
      uint64_t v7 = 0LL;
    }

    int v14 = 0;
    uint64_t v13 = 0LL;
LABEL_45:
    v4->_languageCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "copy");
    if (v12 && v14 && v13)
    {
      v4->_analyzer = (MANAConfigurableAnalyzer *)v7;
      v4->_tokenizer = (MTokenizer *)v9;
      v4->_dictionary = (const MDDictionaryMetaData *)v13;
      v4->_appropriateLocale = (NSLocale *)[v6 copy];
      return v4;
    }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    off_18C496878(tokenizer);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSLexiconMorphunDictionary;
  -[_NSLexiconMorphunDictionary dealloc](&v4, sel_dealloc);
}

- (id)allPossibleWordAttributesForWord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  v11 = __Block_byref_object_copy__10;
  int v12 = __Block_byref_object_dispose__10;
  uint64_t v13 = 0LL;
  appropriateLocale = self->_appropriateLocale;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64___NSLexiconMorphunDictionary_allPossibleWordAttributesForWord___block_invoke;
  v7[3] = &unk_189C9F358;
  v7[4] = self;
  v7[5] = &v8;
  _NSLexiconIterateFormsOfWord(a3, (uint64_t)appropriateLocale, (uint64_t)v7);
  objc_super v4 = (void *)v9[5];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)MEMORY[0x189604A58];
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)preferredPronoun:(id)a3 forTermOfAddress:(id)a4 morphology:(id)a5 dependency:(id)a6
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  if (qword_18C496938 != -1) {
    dispatch_once(&qword_18C496938, &__block_literal_global_30);
  }
  if (!off_18C496808) {
    return 0LL;
  }
  id result = (id)objc_msgSend( MEMORY[0x189603F90],  "localeWithLocaleIdentifier:",  -[_NSLexiconMorphunDictionary languageCode](self, "languageCode"));
  if (result)
  {
    id v12 = result;
    CFTypeRef cf = 0LL;
    uint64_t v13 = off_18C496808(&cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = (os_log_s *)_NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mlccfp_getDefaultCommonConceptFactoryProvider(&error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
LABEL_27:
      _os_log_error_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_ERROR,  "Inflection engine reported an error for '%s' while attempting to inflect: %@",  buf,  0x16u);
LABEL_9:
      CFRelease(cf);
LABEL_10:
      v15 = 0LL;
      return v15;
    }

    if (!v13) {
      goto LABEL_10;
    }
    CFTypeRef cf = 0LL;
    uint64_t v16 = off_18C496810(v13, v12, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = (os_log_s *)_NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mlccfp_getCommonConceptFactory(provider, (CFLocaleRef)locale, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
      goto LABEL_27;
    }

    if (!v16) {
      goto LABEL_10;
    }
    CFTypeRef cf = 0LL;
    uint64_t v17 = off_18C496818(v16, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = (os_log_s *)_NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mccf_getSemanticFeatureModel(factory, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
      goto LABEL_27;
    }

    uint64_t v18 = v17;
    if (!v17) {
      goto LABEL_10;
    }
    CFTypeRef cf = 0LL;
    uint64_t v19 = off_18C4968D8(v17, a3, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = (os_log_s *)_NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mpron_createFromInitialPronoun(model, (CFStringRef)original, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
      goto LABEL_27;
    }

    uint64_t v20 = v19;
    if (!v19) {
      goto LABEL_10;
    }
    uint64_t v86 = v18;
    CFTypeRef cf = 0LL;
    uint64_t v21 = off_18C4968E0(v19, &cf);
    CFTypeRef v22 = (void (**)(void))&metadata instantiation cache for protocol conformance descriptor for _TimeZoneICU;
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v23 = (os_log_s *)_NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mpron_toSemanticFeatureConcept(pronoun, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
LABEL_65:
      _os_log_error_impl( &dword_182EB1000,  v23,  OS_LOG_TYPE_ERROR,  "Inflection engine reported an error for '%s' while attempting to inflect: %@",  buf,  0x16u);
LABEL_39:
      CFRelease(cf);
LABEL_40:
      v15 = 0LL;
      v24 = 0LL;
      uint64_t v25 = v20;
      goto LABEL_41;
    }

    uint64_t v26 = v21;
    if (!v21) {
      goto LABEL_40;
    }
    id v79 = a3;
    id v80 = v12;
    if (objc_msgSend( a4,  "isEqual:",  +[NSTermOfAddress feminine](NSTermOfAddress, "feminine")))
    {
      CFTypeRef cf = 0LL;
      off_18C4968E8(v26, @"gender", @"feminine", &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        uint64_t v23 = (os_log_s *)_NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, @gender, @feminine, &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
        goto LABEL_65;
      }

      uint64_t v87 = v26;
      uint64_t v82 = v20;
LABEL_89:
      id v78 = 0LL;
      theArray = 0LL;
      uint64_t v81 = 0LL;
      if (!a5) {
        goto LABEL_103;
      }
LABEL_90:
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      v38 = (void *)objc_msgSend(a5, "_morphunConstraints", v76);
      uint64_t v39 = [v38 countByEnumeratingWithState:&v90 objects:v89 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v91;
        do
        {
          uint64_t v42 = 0LL;
          do
          {
            if (*(void *)v91 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v90 + 1) + 8 * v42);
            uint64_t v44 = objc_msgSend((id)objc_msgSend(a5, "_morphunConstraints"), "objectForKeyedSubscript:", v43);
            CFTypeRef cf = 0LL;
            off_18C4968E8(v87, v43, v44, &cf);
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v45 = (os_log_s *)_NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, (__bridge CFStringRef)grammeme, (__bridge"
                       " CFStringRef)value, &error)";
                __int16 v106 = 2112;
                CFTypeRef v107 = cf;
                _os_log_error_impl( &dword_182EB1000,  v45,  OS_LOG_TYPE_ERROR,  "Inflection engine reported an error for '%s' while attempting to inflect: %@",  buf,  0x16u);
              }

              CFRelease(cf);
            }

            ++v42;
          }

          while (v40 != v42);
          uint64_t v40 = [v38 countByEnumeratingWithState:&v90 objects:v89 count:16];
        }

        while (v40);
      }

- (void)_iterateFormsOfWord:(id)a3 usingBlock:(id)a4
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

@end