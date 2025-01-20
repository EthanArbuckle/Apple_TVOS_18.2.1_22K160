@interface CSUserIdentityClassifier
+ (id)pickTopScoringProfileIdFromScores:(id)a3;
+ (id)stringFromClassificationCategory:(unint64_t)a3;
+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 lowScoreThreshold:(int64_t)a5 highScoreThreshold:(int64_t)a6 confidentThreshold:(int64_t)a7 scoreDiffThreshold:(int64_t)a8;
+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 withAsset:(id)a5 withPhId:(unint64_t)a6;
@end

@implementation CSUserIdentityClassifier

+ (id)pickTopScoringProfileIdFromScores:(id)a3
{
  id v3 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = v4;
  v6 = 0LL;
  uint64_t v7 = *(void *)v17;
  uint64_t v8 = -1000LL;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v10]);
      id v12 = [v11 integerValue];

      if ((uint64_t)v12 > v8)
      {
        id v13 = v10;

        uint64_t v8 = (uint64_t)v12;
        v6 = v13;
      }
    }

    id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  }

  while (v5);
  if (!v6)
  {
LABEL_11:
    v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:]";
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s ERR: topScoringUser is nil from %{public}@",  buf,  0x16u);
    }

    v6 = 0LL;
  }

  return v6;
}

+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 lowScoreThreshold:(int64_t)a5 highScoreThreshold:(int64_t)a6 confidentThreshold:(int64_t)a7 scoreDiffThreshold:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  v15 = v14;
  if (v13
    && v14
    && (__int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]),
        v16,
        v16))
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
    __int128 v18 = [v17 integerValue];

    if ([v15 count] == (id)1)
    {
      uint64_t v19 = 4LL;
      uint64_t v20 = 3LL;
      else {
        unint64_t v21 = 0LL;
      }
    }

    else
    {
      id v24 = [v15 mutableCopy];
      [v24 removeObjectForKey:v13];
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:]( &OBJC_CLASS___CSUserIdentityClassifier,  "pickTopScoringProfileIdFromScores:",  v24));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:"));
      v26 = [v25 integerValue];

      if ((uint64_t)v18 <= a5)
      {
        unint64_t v21 = 0LL;
      }

      else if (v18 - v26 <= a8)
      {
        unint64_t v21 = 2LL;
      }

      else if ((uint64_t)v18 >= a7)
      {
        unint64_t v21 = 4LL;
      }

      else if ((uint64_t)v18 <= a6)
      {
        unint64_t v21 = 1LL;
      }

      else
      {
        unint64_t v21 = 3LL;
      }
    }
  }

  else
  {
    __int16 v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "+[CSUserIdentityClassifier classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confident"
            "Threshold:scoreDiffThreshold:]";
      __int16 v30 = 2114;
      id v31 = v13;
      __int16 v32 = 2114;
      v33 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s ERR: invalid arguments passed %{public}@ %{public}@",  buf,  0x20u);
    }

    unint64_t v21 = 0LL;
  }

  return v21;
}

+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 withAsset:(id)a5 withPhId:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 multiUserLowScoreThresholdForPhId:a6];
  id v13 = [v9 multiUserHighScoreThresholdForPhId:a6];
  id v14 = [v9 multiUserConfidentScoreThresholdForPhId:a6];
  id v15 = [v9 multiUserDeltaScoreThresholdForPhId:a6];

  unint64_t v16 = +[CSUserIdentityClassifier classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confidentThreshold:scoreDiffThreshold:]( &OBJC_CLASS___CSUserIdentityClassifier,  "classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confidentThreshold:scoreDiffThreshold:",  v11,  v10,  v12,  v13,  v14,  v15);
  return v16;
}

+ (id)stringFromClassificationCategory:(unint64_t)a3
{
  int v3 = a3;
  if (a3 < 5) {
    return *(&off_100229F90 + a3);
  }
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[CSUserIdentityClassifier stringFromClassificationCategory:]";
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s ERR: Incorrect category %{public}d passed",  (uint8_t *)&v6,  0x12u);
  }

  return @"Unknown";
}

@end