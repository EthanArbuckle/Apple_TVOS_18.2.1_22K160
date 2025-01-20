@interface TIStaticLanguageLikelihoodModel
- (TIInputMode)primaryInputMode;
- (TIInputMode)secondaryInputMode;
- (TIStaticLanguageLikelihoodModel)initWithPrimaryInputMode:(id)a3 secondaryInputMode:(id)a4 secondaryLanguageWeight:(float)a5;
- (double)lastOfflineAdaptationTimeForApp:(id)a3;
- (float)_priorProbabilityForLanguage:(id)a3 recipient:(id)a4;
- (float)primaryLanguageWeight;
- (float)secondaryLanguageWeight;
- (id)rankedLanguagesForRecipient:(id)a3;
- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4;
- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5;
@end

@implementation TIStaticLanguageLikelihoodModel

- (TIStaticLanguageLikelihoodModel)initWithPrimaryInputMode:(id)a3 secondaryInputMode:(id)a4 secondaryLanguageWeight:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TIStaticLanguageLikelihoodModel;
  v11 = -[TIStaticLanguageLikelihoodModel init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryInputMode, a3);
    objc_storeStrong((id *)&v12->_secondaryInputMode, a4);
    v12->_secondaryLanguageWeight = a5;
  }

  return v12;
}

- (id)rankedLanguagesForRecipient:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIStaticLanguageLikelihoodModel primaryInputMode](self, "primaryInputMode"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 normalizedIdentifier]);
    uint64_t Language = TIInputModeGetLanguage();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(Language);

    [v4 addObject:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIStaticLanguageLikelihoodModel secondaryInputMode](self, "secondaryInputMode"));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 normalizedIdentifier]);
      uint64_t v13 = TIInputModeGetLanguage();
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      [v4 addObject:v14];
    }
  }

  return v4;
}

- (float)_priorProbabilityForLanguage:(id)a3 recipient:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIStaticLanguageLikelihoodModel primaryInputMode](self, "primaryInputMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 normalizedIdentifier]);
  uint64_t Language = TIInputModeGetLanguage();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(Language);

  if ([v9 isEqualToString:v5])
  {
    -[TIStaticLanguageLikelihoodModel primaryLanguageWeight](self, "primaryLanguageWeight");
    float v11 = v10;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIStaticLanguageLikelihoodModel secondaryInputMode](self, "secondaryInputMode"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 normalizedIdentifier]);
    uint64_t v14 = TIInputModeGetLanguage();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    float v11 = 0.0;
    if ([v15 isEqualToString:v5])
    {
      -[TIStaticLanguageLikelihoodModel secondaryLanguageWeight](self, "secondaryLanguageWeight");
      float v11 = v16;
    }
  }

  return v11;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  float v10 = (void (**)(id, uint64_t, char *))a5;
  char v20 = 0;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
      -[TIStaticLanguageLikelihoodModel _priorProbabilityForLanguage:recipient:]( self,  "_priorProbabilityForLanguage:recipient:",  v15,  v9,  (void)v16);
      v10[2](v10, v15, &v20);
      if (v20) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  return 0.0;
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  return 0LL;
}

- (float)primaryLanguageWeight
{
  return 1.0 - v2;
}

- (TIInputMode)primaryInputMode
{
  return self->_primaryInputMode;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (float)secondaryLanguageWeight
{
  return self->_secondaryLanguageWeight;
}

- (void).cxx_destruct
{
}

@end