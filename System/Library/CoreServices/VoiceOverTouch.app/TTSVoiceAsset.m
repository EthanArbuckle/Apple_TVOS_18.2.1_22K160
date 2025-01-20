@interface TTSVoiceAsset
- (BOOL)isEligibleForVOTWithVoiceInfo:(id)a3 language:(id)a4;
@end

@implementation TTSVoiceAsset

- (BOOL)isEligibleForVOTWithVoiceInfo:(id)a3 language:(id)a4
{
  id v6 = a3;
  uint64_t v7 = AXLanguageCanonicalFormToGeneralLanguage(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TTSVoiceAsset languages](self, "languages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  uint64_t v11 = AXLanguageCanonicalFormToGeneralLanguage(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  uint64_t v13 = AXCRemapLanguageCodeToFallbackIfNeccessary(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (-[TTSVoiceAsset isInstalled](self, "isInstalled"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TTSVoiceAsset name](self, "name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    else {
      unsigned __int8 v17 = 0;
    }
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

@end