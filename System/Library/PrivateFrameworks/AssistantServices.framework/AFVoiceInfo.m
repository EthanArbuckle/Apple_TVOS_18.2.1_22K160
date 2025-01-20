@interface AFVoiceInfo
+ (int64_t)genderForVSSpeechGender:(int64_t)a3;
- (BOOL)isMatchForSiriVoice:(id)a3;
- (BOOL)isMatchForVoiceAsset:(id)a3;
- (id)VSVoiceAsset;
- (int64_t)VSSpeechFootprint;
- (int64_t)VSSpeechGender;
- (int64_t)VSSpeechType;
@end

@implementation AFVoiceInfo

- (BOOL)isMatchForSiriVoice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  unsigned int v6 = -[AFVoiceInfo isCustom](self, "isCustom");
  id v7 = -[AFVoiceInfo footprint](self, "footprint");
  id v8 = [v4 AFVoiceFootprint];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self, "languageCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 language]);
  if ([v9 isEqualToString:v10])
  {
    if (v6) {
      uint64_t v11 = -3LL;
    }
    else {
      uint64_t v11 = -1LL;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self, "name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v19 = v12;
    unsigned int v14 = [v12 isEqualToString:v13];
    unsigned __int8 v15 = 0;
    if (v14 && (unint64_t)v5 + v11 <= 1 && v7 == v8)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo contentVersion](self, "contentVersion"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 version]));
      unsigned __int8 v15 = [v16 isEqualToNumber:v17];
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (int64_t)VSSpeechGender
{
  int64_t result = (int64_t)-[AFVoiceInfo gender](self, "gender");
  return result;
}

- (int64_t)VSSpeechFootprint
{
  int64_t result = (int64_t)-[AFVoiceInfo footprint](self, "footprint");
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (int64_t)VSSpeechType
{
  else {
    return 1LL;
  }
}

- (id)VSVoiceAsset
{
  id v3 = objc_alloc_init(&OBJC_CLASS___VSVoiceAsset);
  objc_msgSend(v3, "setGender:", -[AFVoiceInfo VSSpeechGender](self, "VSSpeechGender"));
  objc_msgSend(v3, "setFootprint:", -[AFVoiceInfo VSSpeechFootprint](self, "VSSpeechFootprint"));
  objc_msgSend(v3, "setIsBuiltInVoice:", -[AFVoiceInfo isCustom](self, "isCustom") ^ 1);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self, "languageCode"));
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v11 = v4;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v3 setLanguages:v6];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo contentVersion](self, "contentVersion"));
  [v3 setContentVersion:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo masteredVersion](self, "masteredVersion"));
  [v3 setMasteredVersion:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self, "name"));
  [v3 setName:v9];

  return v3;
}

- (BOOL)isMatchForVoiceAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 name]);
  if (v5
    && (unsigned int v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self, "name")),
        v7,
        v6,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    unsigned int v10 = [v8 isEqualToString:v9];

    int v11 = v10 ^ 1;
  }

  else
  {
    int v11 = 0;
  }

  id v12 = -[AFVoiceInfo VSSpeechGender](self, "VSSpeechGender");
  if (v12 == [v4 gender]
    && (id v13 = -[AFVoiceInfo VSSpeechFootprint](self, "VSSpeechFootprint"), v13 == [v4 footprint])
    && (unsigned int v14 = -[AFVoiceInfo isCustom](self, "isCustom"),
        v14 != [v4 isBuiltInVoice]))
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 languages]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self, "languageCode"));
    if (([v15 containsObject:v16] ^ 1 | v11))
    {
      unsigned __int8 v17 = 0;
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo contentVersion](self, "contentVersion"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 contentVersion]);
      if ([v19 isEqualToNumber:v20])
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo masteredVersion](self, "masteredVersion"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v4 masteredVersion]);
        unsigned __int8 v17 = [v21 isEqualToString:v22];
      }

      else
      {
        unsigned __int8 v17 = 0;
      }
    }
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

+ (int64_t)genderForVSSpeechGender:(int64_t)a3
{
  else {
    return a3;
  }
}

@end