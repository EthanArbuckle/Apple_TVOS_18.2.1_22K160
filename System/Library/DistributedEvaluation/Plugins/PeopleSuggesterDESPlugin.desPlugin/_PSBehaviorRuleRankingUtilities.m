@interface _PSBehaviorRuleRankingUtilities
+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4;
+ (BOOL)copyZippedAdaptableModel:(id)a3;
+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3;
+ (BOOL)removeFolderAtPath:(id)a3;
+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5;
+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5;
+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4;
+ (id)compileMLModelAtPath:(id)a3;
+ (id)getAdaptedCompiledMLModelPath;
+ (id)getAdaptedModelRecipeVersionFilePath;
+ (id)getArchivedDefaultAdaptableModelPath;
+ (id)getDeployedAdaptableCompiledMLModelPath;
+ (id)getDeployedCompiledMLModelPath;
+ (id)getDeployedCompiledMLModelPathForContactRanker;
+ (id)getIntermediateAdaptableCompiledMLModel;
+ (id)getTrialCompiledAdaptableMLModelPath;
+ (id)getTrialCompiledMLModelPath;
+ (id)getTrialCompiledMLModelPathForContactRanker;
+ (id)getZippedDefaultAdaptableModelPath;
+ (id)loadAdaptableModelConfig:(id)a3;
+ (id)loadMLModel:(id)a3 modelConfig:(id)a4;
+ (id)loadMLModelConfigurationWithConfigDict:(id)a3;
+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4;
+ (id)reformatFeaturesInFeatureDictArray:(id)a3;
+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3;
+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5;
@end

@implementation _PSBehaviorRuleRankingUtilities

+ (id)getTrialCompiledMLModelPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPaths peopleDirectory](&OBJC_CLASS____CDPaths, "peopleDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"TrialRuleImportancePredictor.mlmodelc"]);

  return v3;
}

+ (id)getTrialCompiledMLModelPathForContactRanker
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPaths peopleDirectory](&OBJC_CLASS____CDPaths, "peopleDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"TrialContactRankerModel.mlmodelc"]);

  return v3;
}

+ (id)getTrialCompiledAdaptableMLModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"TrialAdaptableRuleImportancePredictor.mlmodelc"];
}

+ (id)getAdaptedCompiledMLModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptedRuleImportancePredictor.mlmodelc"];
}

+ (id)getDeployedCompiledMLModelPath
{
  return [@"/System/Library/PrivateFrameworks/PeopleSuggester.framework/" stringByAppendingString:@"RuleImportancePredictor.mlmodelc"];
}

+ (id)getDeployedCompiledMLModelPathForContactRanker
{
  return [@"/System/Library/PrivateFrameworks/PeopleSuggester.framework/" stringByAppendingString:@"ContactRankerModel.mlmodelc"];
}

+ (id)getDeployedAdaptableCompiledMLModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc"];
}

+ (id)getIntermediateAdaptableCompiledMLModel
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"IntermediateAdaptableModel.mlmodelc"];
}

+ (id)getAdaptedModelRecipeVersionFilePath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"adaptedModelRecipeVersion.txt"];
}

+ (id)getArchivedDefaultAdaptableModelPath
{
  return [@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"];
}

+ (id)getZippedDefaultAdaptableModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.zip"];
}

+ (id)loadAdaptableModelConfig:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "loadAdaptableModelConfig is invoked with config file path: %@",  buf,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  id v12 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v5,  &v12));
  id v7 = v12;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Loaded adaptable model config from:%@", buf, 0xCu);
    }

    id v10 = v6;
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_D168();
    }
  }

  return v6;
}

+ (id)loadMLModelConfigurationWithConfigDict:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v38 = 0LL;
    v39 = &v38;
    uint64_t v40 = 0x2050000000LL;
    v4 = (void *)qword_19C40;
    uint64_t v41 = qword_19C40;
    if (!qword_19C40)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_7128;
      v37[3] = &unk_14520;
      v37[4] = &v38;
      sub_7128((uint64_t)v37);
      v4 = (void *)v39[3];
    }

    v5 = v4;
    _Block_object_dispose(&v38, 8);
    id v36 = objc_alloc_init(v5);
    [v36 setComputeUnits:0];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numClasses"]);
    id v7 = [v6 integerValue];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"numTrees"]);
    id v9 = [v8 integerValue];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"maxDepth"]);
    id v11 = [v10 integerValue];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"learningRate"]);
    [v12 doubleValue];
    double v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"minChildWeight"]);
    id v16 = [v15 integerValue];

    id v17 = [sub_4FD0() numClasses];
    v35 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v42[0] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
    v43[0] = v34;
    id v18 = [sub_4FD0() numTrees];
    v33 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v42[1] = v33;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
    v43[1] = v19;
    id v20 = [sub_4FD0() maxDepth];
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v42[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
    v43[2] = v22;
    id v23 = [sub_4FD0() learningRate];
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v42[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
    v43[3] = v25;
    id v26 = [sub_4FD0() minChildWeight];
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v42[4] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
    v43[4] = v28;
    id v29 = [sub_4FD0() objective];
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v42[5] = v30;
    v43[5] = @"binary:logistic";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  6LL));
    [v36 setParameters:v31];
  }

  else
  {
    id v36 = 0LL;
  }

  return v36;
}

+ (id)loadMLModel:(id)a3 modelConfig:(id)a4
{
  v5 = (NSURL *)a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "loadMLModel is invoked with model path: %@", buf, 0xCu);
  }

  v8 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  if (-[NSFileManager fileExistsAtPath:](v8, "fileExistsAtPath:", v5))
  {
    id v9 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v5);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Trying to load model with compiled model path: %@", buf, 0xCu);
    }

    id v11 = sub_5288();
    if (v6)
    {
      uint64_t v20 = 0LL;
      id v12 = (id *)&v20;
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 modelWithContentsOfURL:v9 configuration:v6 error:&v20]);
    }

    else
    {
      uint64_t v19 = 0LL;
      id v12 = (id *)&v19;
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 modelWithContentsOfURL:v9 error:&v19]);
    }

    double v14 = (void *)v13;
    id v15 = *v12;
    id v16 = v15;
    if (!v14 || v15)
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_D1C8();
      }
    }
  }

  else
  {
    double v14 = 0LL;
  }

  return v14;
}

+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3
{
  id v3 = a3;
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ((unint64_t)[v3 count] >= 2)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 features]);

    id v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v38;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableArray addObject:](v4, "addObject:", *(void *)(*((void *)&v37 + 1) + 8LL * (void)v10));
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }

      while (v8);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    obj = v4;
    id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v42,  16LL);
    if (v28)
    {
      uint64_t v26 = *(void *)v34;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v11);
          uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          id v14 = v3;
          id v15 = v3;
          id v16 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              uint64_t v19 = 0LL;
              do
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v12]);
                -[NSMutableArray addObject:](v13, "addObject:", v21);

                uint64_t v19 = (char *)v19 + 1;
              }

              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }

            while (v17);
          }

          id v22 = -[NSMutableArray copy](v13, "copy");
          -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v22, v12);

          id v11 = (char *)v11 + 1;
          id v3 = v14;
        }

        while (v11 != v28);
        id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v42,  16LL);
      }

      while (v28);
    }
  }

  id v23 = -[NSMutableDictionary copy](v27, "copy");

  return v23;
}

+ (id)reformatFeaturesInFeatureDictArray:(id)a3
{
  id v3 = a3;
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ((unint64_t)[v3 count] >= 2)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
    id v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v37;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          -[NSMutableArray addObject:](v4, "addObject:", *(void *)(*((void *)&v36 + 1) + 8LL * (void)v9));
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }

      while (v7);
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    obj = v4;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v26 = *(void *)v33;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v12);
          id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          id v15 = v3;
          id v16 = v3;
          id v17 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v29;
            do
            {
              uint64_t v20 = 0LL;
              do
              {
                if (*(void *)v29 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v28 + 1) + 8 * (void)v20) objectForKeyedSubscript:v13]);
                -[NSMutableArray addObject:](v14, "addObject:", v21);

                uint64_t v20 = (char *)v20 + 1;
              }

              while (v18 != v20);
              id v18 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
            }

            while (v18);
          }

          id v22 = -[NSMutableArray copy](v14, "copy");
          -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v22, v13);

          uint64_t v12 = (char *)v12 + 1;
          id v3 = v15;
        }

        while (v12 != v11);
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
      }

      while (v11);
    }
  }

  id v23 = -[NSMutableDictionary copy](v27, "copy");

  return v23;
}

+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
      id v14 = objc_alloc((Class)sub_5B64());
      id v27 = 0LL;
      id v15 = [v14 initWithDictionary:v13 error:&v27];
      id v16 = v27;
      if (v16) {
        break;
      }
      id v26 = 0LL;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 predictionFromFeatures:v15 error:&v26]);
      id v18 = v26;
      if (v18)
      {
        id v23 = v18;
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_D228();
        }

LABEL_18:
        id v22 = 0LL;
        goto LABEL_19;
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 featureValueForName:@"classProbability"]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dictionaryValue]);

      if ([v20 count] == (char *)&dword_0 + 2)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:&off_14DA0]);
        -[NSMutableArray addObject:](v7, "addObject:", v21);
      }

      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    id v23 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_D254();
    }
    goto LABEL_18;
  }

+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v22 = 0LL;
  id v8 = [objc_alloc((Class)sub_5E0C()) initWithDictionary:v6 error:&v22];
  id v9 = v22;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_D2AC();
    }
LABEL_8:
    id v13 = 0LL;
    goto LABEL_9;
  }

  id v21 = 0LL;
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 predictionsFromBatch:v8 error:&v21]);
  id v10 = v21;
  if (v10)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_D280();
    }

    goto LABEL_8;
  }

  id v20 = v5;
  if ((uint64_t)-[os_log_s count](v11, "count") >= 1)
  {
    uint64_t v15 = 0LL;
    do
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s featuresAtIndex:](v11, "featuresAtIndex:", v15));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 featureValueForName:@"classProbability"]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dictionaryValue]);

      if ([v18 count] == (char *)&dword_0 + 2)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:&off_14DA0]);
        -[NSMutableArray addObject:](v7, "addObject:", v19);
      }

      ++v15;
    }

    while (v15 < (uint64_t)-[os_log_s count](v11, "count"));
  }

  id v13 = -[NSMutableArray copy](v7, "copy");
  id v5 = v20;
LABEL_9:

  return v13;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5
{
  id v38 = a3;
  id v7 = a4;
  id v8 = a5;
  __int128 v39 = v7;
  __int128 v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v10 = v8;
  id v44 = [v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v44)
  {
    id obj = v10;
    uint64_t v43 = *(void *)v52;
    while (2)
    {
      for (i = 0LL; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        id v13 = [&__NSDictionary0__struct mutableCopy];
        id v14 = objc_alloc((Class)sub_6394());
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 count]));
        v55 = v15;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
        id v50 = 0LL;
        id v17 = [v14 initWithShape:v16 dataType:65568 error:&v50];
        id v18 = v50;

        if (v18)
        {
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_D338();
          }
          goto LABEL_22;
        }

        if ([v9 count])
        {
          unint64_t v19 = 0LL;
          do
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 features]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v19]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

            [v22 floatValue];
            id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
            [v17 setObject:v23 atIndexedSubscript:v19];

            ++v19;
          }

          while (v19 < (unint64_t)[v9 count]);
        }

        [v13 setObject:v17 forKeyedSubscript:@"input"];
        id v24 = objc_alloc((Class)sub_5B64());
        id v49 = 0LL;
        v25 = (os_log_s *)[v24 initWithDictionary:v13 error:&v49];
        id v26 = v49;
        if (v26)
        {
          id v18 = v26;
          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_D304(&v47, v48, v31);
          }

LABEL_22:
          __int128 v28 = v38;
          id v10 = obj;

          id v30 = 0LL;
          id v27 = obj;
          goto LABEL_23;
        }

        [v45 addObject:v25];
      }

      id v10 = obj;
      id v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v44) {
        continue;
      }
      break;
    }
  }

  id v27 = [objc_alloc((Class)sub_5E0C()) initWithFeatureProviderArray:v45];
  id v46 = 0LL;
  __int128 v28 = v38;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v38 predictionsFromBatch:v27 error:&v46]);
  id v18 = v46;
  if (v18)
  {
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_D2D8();
    }

    id v30 = 0LL;
  }

  else
  {
    id obja = v10;
    if ((uint64_t)[v13 count] >= 1)
    {
      uint64_t v33 = 0LL;
      do
      {
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v13 featuresAtIndex:v33]);
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 featureValueForName:@"classProbability"]);
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 dictionaryValue]);

        if ([v36 count] == (char *)&dword_0 + 2)
        {
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:&off_14DA0]);
          -[NSMutableArray addObject:](v40, "addObject:", v37);
        }

        ++v33;
      }

      while (v33 < (uint64_t)[v13 count]);
    }

    id v30 = -[NSMutableArray copy](v40, "copy");
    id v10 = obja;
  }

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5
{
  id v42 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v41 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"]);
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v45 = *(void *)v53;
    __int128 v40 = v49;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        id v14 = objc_msgSend(&__NSDictionary0__struct, "mutableCopy", v40);
        id v15 = objc_alloc((Class)sub_6394());
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 count]));
        v56 = v16;
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
        id v51 = 0LL;
        id v18 = [v15 initWithShape:v17 dataType:65568 error:&v51];
        id v19 = v51;

        if (v19)
        {
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_D338();
          }
          goto LABEL_22;
        }

        if ([v9 count])
        {
          unint64_t v20 = 0LL;
          do
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v20]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v21]);

            [v22 floatValue];
            id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
            [v18 setObject:v23 atIndexedSubscript:v20];

            ++v20;
          }

          while (v20 < (unint64_t)[v9 count]);
        }

        [v14 setObject:v18 forKeyedSubscript:@"input"];
        id v24 = objc_alloc((Class)sub_5B64());
        id v50 = 0LL;
        v25 = (os_log_s *)[v24 initWithDictionary:v14 error:&v50];
        id v26 = v50;
        if (v26)
        {
          id v19 = v26;
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_D304(&v48, v40, v33);
          }

LABEL_22:
          __int128 v32 = v41;
          __int128 v29 = v42;
          id v27 = obj;

          id v31 = 0LL;
          id v28 = obj;
          goto LABEL_23;
        }

        [v46 addObject:v25];
      }

      id v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v27 = obj;

  id v28 = [objc_alloc((Class)sub_5E0C()) initWithFeatureProviderArray:v46];
  id v47 = 0LL;
  __int128 v29 = v42;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v42 predictionsFromBatch:v28 error:&v47]);
  id v19 = v47;
  if (v19)
  {
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_D2D8();
    }

    id v31 = 0LL;
    __int128 v32 = v41;
  }

  else
  {
    if ((uint64_t)[v14 count] >= 1)
    {
      uint64_t v35 = 0LL;
      do
      {
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v14 featuresAtIndex:v35]);
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 featureValueForName:@"classProbability"]);
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 dictionaryValue]);

        if ([v38 count] == (char *)&dword_0 + 2)
        {
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:&off_14DA0]);
          -[NSMutableArray addObject:](v43, "addObject:", v39);
        }

        ++v35;
      }

      while (v35 < (uint64_t)[v14 count]);
    }

    id v31 = -[NSMutableArray copy](v43, "copy");
    __int128 v32 = v41;
    id v27 = obj;
  }

+ (BOOL)removeFolderAtPath:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v4, "fileExistsAtPath:isDirectory:", v3, &v12)) {
    BOOL v5 = v12 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5
    || (id v11 = 0LL,
        -[NSFileManager removeItemAtPath:error:](v4, "removeItemAtPath:error:", v3, &v11),
        (id v6 = v11) == 0LL))
  {
    BOOL v9 = 1;
  }

  else
  {
    id v7 = v6;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_D364();
    }

    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v12 = 0LL;
  unsigned __int8 v8 = -[NSFileManager copyItemAtURL:toURL:error:](v7, "copyItemAtURL:toURL:error:", v5, v6, &v12);
  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "Failed to copy file with path:%@ to path:%@, with error：%@",  buf,  0x20u);
    }
  }

  return v8;
}

+ (id)compileMLModelAtPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  id v12 = 0LL;
  id v5 = [sub_5288() compileModelAtURL:v4 error:&v12];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v12;
  unsigned __int8 v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_D3C4();
    }
  }

  return v6;
}

+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v9);

  id v11 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v8);
  id v12 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:]( &OBJC_CLASS___NSData, "dataWithContentsOfURL:", v10));
  uint64_t v13 = _PSUnarchiverZip([v12 bytes], (uint64_t)objc_msgSend(v12, "length"), v11);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
    int v27 = 138412290;
    id v28 = v15;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "_PSUnarchiverZip returned %@", (uint8_t *)&v27, 0xCu);
  }

  if ((v13 & 1) != 0)
  {
    id v16 = objc_alloc(&OBJC_CLASS___NSURL);
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:v7]);
    id v18 = -[NSURL initFileURLWithPath:](v16, "initFileURLWithPath:", v17);
  }

  else
  {
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_D424(v17, v19, v20, v21, v22, v23, v24, v25);
    }
    id v18 = 0LL;
  }

  return v18;
}

+ (BOOL)copyZippedAdaptableModel:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_D48C();
    }
    goto LABEL_10;
  }

  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getTrialCompiledAdaptableMLModelPath"));
  if (!+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "removeFolderAtPath:",  v4))
  {
LABEL_10:
    BOOL v6 = 0;
    goto LABEL_11;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:toFileName:toFolderPath:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "unzipFileWithPath:toFileName:toFolderPath:",  v3,  @"TrialAdaptableRuleImportancePredictor.mlmodelc",  @"/var/tmp/com.apple.siri-distributed-evaluation/"));
  BOOL v6 = v5 != 0LL;
  if (!v5)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_D4B8();
    }
  }

LABEL_11:
  return v6;
}

+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getDeployedAdaptableCompiledMLModelPath"));
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v4, "fileExistsAtPath:isDirectory:", v5, &v36)) {
    BOOL v6 = v36 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"]);
    if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v7))
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_D5AC((uint64_t)v7, v8, v12, v13, v14, v15, v16, v17);
      }
      id v9 = 0LL;
      char v10 = 0;
      goto LABEL_23;
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getZippedDefaultAdaptableModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getZippedDefaultAdaptableModelPath"));
    if (-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v8))
    {
      id v9 = 0LL;
    }

    else
    {
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v4,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/tmp/com.apple.siri-distributed-evaluation/",  1LL,  0LL,  0LL);
      id v34 = 0LL;
      unsigned __int8 v18 = -[NSFileManager copyItemAtPath:toPath:error:](v4, "copyItemAtPath:toPath:error:", v7, v8, &v34);
      id v9 = (os_log_s *)v34;
      if ((v18 & 1) == 0)
      {
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_D548((uint64_t)v9, v19, v27, v28, v29, v30, v31, v32);
        }
        goto LABEL_21;
      }
    }

    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:toFileName:toFolderPath:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "unzipFileWithPath:toFileName:toFolderPath:",  v8,  @"AdaptableRuleImportancePredictor.mlmodelc",  @"/var/tmp/com.apple.siri-distributed-evaluation/"));
    char v10 = v19 != 0LL;
    if (v19)
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }

    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_D4E4((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);
    }

LABEL_21:
    char v10 = 0;
    goto LABEL_22;
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_PSLogging generalChannel](&OBJC_CLASS____PSLogging, "generalChannel"));
  char v10 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Deployed adaptable ML model already exist, no need to unzip", buf, 2u);
  }

@end