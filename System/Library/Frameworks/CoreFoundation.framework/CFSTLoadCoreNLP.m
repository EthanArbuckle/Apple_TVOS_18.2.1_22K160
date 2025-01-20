@interface CFSTLoadCoreNLP
@end

@implementation CFSTLoadCoreNLP

void ____CFSTLoadCoreNLP_block_invoke()
{
  CFStringRef v0 = CFStringCreateWithCString(0LL, "", 0x8000100u);
  if (!v0) {
    return;
  }
  CFStringRef v1 = v0;
  v2 = CFStringCreateWithFormat( 0LL,  0LL,  @"%@/%s",  v0,  "System/Library/PrivateFrameworks/CoreNLP.framework/CoreNLP");
  CFRelease(v1);
  if (!v2) {
    return;
  }
  CFIndex Length = CFStringGetLength(v2);
  CFIndex v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v5 = (char *)malloc(v4);
  if (!v5)
  {
LABEL_79:
    CFRelease(v2);
    return;
  }

  v6 = v5;
  if (!CFStringGetCString(v2, v5, v4, 0x8000100u))
  {
    free(v6);
    goto LABEL_79;
  }

  CFRelease(v2);
  v7 = dlopen(v6, 5);
  if (v7)
  {
    v8 = v7;
    __NLStringTokenizerCopyBestStringLanguage = (uint64_t (*)(void, void, void))dlsym( v7,  "NLStringTokenizerCopyB estStringLanguage");
    __NLStringTokenizerCreate = (uint64_t (*)(void, void, void, void, void, void))dlsym(v8, "NLStringTokenizerCreate");
    __NLStringTokenizerSetString = (uint64_t (*)(void, void, void, void))dlsym( v8,  "NLStringTokenizerSetString");
    __NLStringTokenizerGoToTokenAtIndex = (uint64_t (*)(void, void))dlsym( v8,  "NLStringTokenizerGoToTokenAtIndex");
    __NLStringTokenizerAdvanceToNextToken = (uint64_t (*)(void))dlsym( v8,  "NLStringTokenizerAdvanceToNextToken");
    __NLStringTokenizerGetCurrentTokenRange = (uint64_t (*)(void))dlsym( v8,  "NLStringTokenizerGetCurrentTokenRange");
    __NLStringTokenizerCopyCurrentTokenAttribute = (uint64_t (*)(void, void))dlsym( v8,  "NLStringTokenizerCopyCurrentTokenAttribute");
    __NLStringTokenizerGetCurrentSubTokens = (uint64_t (*)(void, void, void, void))dlsym(v8, "NLStringTokenizerGetCurrentSubTokens");
    __NLStringTokenizerCopyBestStringLanguageWithHints = (uint64_t (*)(void, void, void, void))dlsym(v8, "NLStringTokenizerCopyBestStringLanguageWithHints");
    ___NLStringTokenizerCopyPossibleStringLanguages = (uint64_t (*)(void, void, void))dlsym(v8, "_NLStringTokenizerCopyPossibleStringLanguages");
    ___NLStringTokenizerTokenize = (uint64_t (*)(void))dlsym(v8, "_NLStringTokenizerTokenize");
    ___NLStringTokenizerTokenizeWithTranscriptions = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerTokenizeWithTranscriptions");
    ___NLStringTokenizerTokenizeCompoundWord = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerTokenizeCompoundWord");
    ___NLStringTokenizerGetDerivedTokens = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerGetDerivedTokens");
    ___NLStringTokenizerGetNextBestTokens = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerGetNextBestTokens");
    ___NLStringTokenizerCreateNamePartsArrayWithString = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerCreateNameP artsArrayWithString");
    ___NLStringTokenizerCreateNamePartsArrayWithStringAsCompositeName = (uint64_t (*)(void))dlsym(v8, "_NLStringTokenizerCreateNamePartsArrayWithStringAsCompositeName");
    ___NLStringTokenizerCreatePossibleNamePartsArrayWithStringAsCompositeName = (uint64_t (*)(void))dlsym(v8, "_NLStringTokenizerCreatePossibleNamePartsArrayWithStringAsCompositeName");
    ___NLStringTokenizerGetCurrentTokenPartOfSpeech = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerGetCurrentTokenPartOfSpeech");
    ___NLStringTokenizerSetLocale = (uint64_t (*)(void))dlsym(v8, "_NLStringTokenizerSetLocale");
    ___NLStringTokenizerSetTokenizerAttribute = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerSetTokenizerAttribute");
    ___NLStringTokenizerGetTokenizerAttribute = (uint64_t (*)(void))dlsym( v8,  "_NLStringTokenizerGetTokenizerAttribute");
    v9 = (uint64_t (*)(void))dlsym(v8, "NLStringTokenizerSetStringWithOptions");
    __NLStringTokenizerSetStringWithOptions = v9;
    if (__NLStringTokenizerCopyBestStringLanguage) {
      BOOL v10 = __NLStringTokenizerCreate == 0LL;
    }
    else {
      BOOL v10 = 1;
    }
    char v32 = !v10
       && __NLStringTokenizerSetString != 0LL
       && __NLStringTokenizerGoToTokenAtIndex != 0LL
       && __NLStringTokenizerAdvanceToNextToken != 0LL
       && __NLStringTokenizerGetCurrentTokenRange != 0LL
       && __NLStringTokenizerCopyCurrentTokenAttribute != 0LL
       && __NLStringTokenizerGetCurrentSubTokens != 0LL
       && __NLStringTokenizerCopyBestStringLanguageWithHints != 0LL
       && ___NLStringTokenizerCopyPossibleStringLanguages != 0LL
       && ___NLStringTokenizerTokenize != 0LL
       && ___NLStringTokenizerTokenizeWithTranscriptions != 0LL
       && ___NLStringTokenizerTokenizeCompoundWord != 0LL
       && ___NLStringTokenizerGetDerivedTokens != 0LL
       && ___NLStringTokenizerGetNextBestTokens != 0LL
       && ___NLStringTokenizerCreateNamePartsArrayWithString != 0LL
       && ___NLStringTokenizerCreateNamePartsArrayWithStringAsCompositeName != 0LL
       && ___NLStringTokenizerCreatePossibleNamePartsArrayWithStringAsCompositeName != 0LL
       && ___NLStringTokenizerGetCurrentTokenPartOfSpeech != 0LL
       && ___NLStringTokenizerSetLocale != 0LL
       && ___NLStringTokenizerSetTokenizerAttribute != 0LL
       && ___NLStringTokenizerGetTokenizerAttribute != 0LL
       && v9 != 0LL;
    __CFSTLoadCoreNLP_isCoreNLPAvailable = v32;
  }

  free(v6);
}

@end