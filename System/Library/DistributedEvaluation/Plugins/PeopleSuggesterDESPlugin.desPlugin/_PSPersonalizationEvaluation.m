@interface _PSPersonalizationEvaluation
- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6;
- (BOOL)evaluateIsInvokedOnce;
- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3;
- (MLModelConfiguration)adaptableModelConfiguration;
- (NSDictionary)recipe;
- (NSDictionary)selectedFeaturesConfig;
- (NSMutableArray)results;
- (NSMutableDictionary)featureNameDict;
- (NSNumber)accuracyGainThresholdForSwap;
- (NSNumber)batchSize;
- (NSNumber)engagementRateGainThresholdForSwap;
- (NSNumber)epoc;
- (NSNumber)evaluationIterationCount;
- (NSNumber)learningRate;
- (NSNumber)maxDepth;
- (NSNumber)minChildWeight;
- (NSNumber)minSampleCountForAdaptation;
- (NSNumber)minimumTestDataSizeForSwap;
- (NSNumber)numClasses;
- (NSNumber)numTrees;
- (NSNumber)recipeID;
- (NSNumber)swapOK;
- (NSNumber)testSplitPercent;
- (NSNumber)topN;
- (NSString)adaptableModelDeployPath;
- (NSURL)intermediateCompiledModelURL;
- (NSUserDefaults)psAdaptationDefaults;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5;
- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4;
- (id)loadAdaptableModelUnderDirectory:(id)a3;
- (id)loadDefaultModel;
- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4;
- (id)shouldContinue;
- (int64_t)adaptationStrategy;
- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5;
- (void)setAccuracyGainThresholdForSwap:(id)a3;
- (void)setAdaptableModelConfiguration:(id)a3;
- (void)setAdaptableModelDeployPath:(id)a3;
- (void)setAdaptationStrategy:(int64_t)a3;
- (void)setBatchSize:(id)a3;
- (void)setEngagementRateGainThresholdForSwap:(id)a3;
- (void)setEpoc:(id)a3;
- (void)setEvaluateIsInvokedOnce:(BOOL)a3;
- (void)setEvaluationIterationCount:(id)a3;
- (void)setFeatureNameDict:(id)a3;
- (void)setIntermediateCompiledModelURL:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLastDayOfAdaptation:(id)a3;
- (void)setLearningRate:(id)a3;
- (void)setMaxDepth:(id)a3;
- (void)setMinChildWeight:(id)a3;
- (void)setMinSampleCountForAdaptation:(id)a3;
- (void)setMinimumTestDataSizeForSwap:(id)a3;
- (void)setNumClasses:(id)a3;
- (void)setNumTrees:(id)a3;
- (void)setParametersFromRecipe;
- (void)setPsAdaptationDefaults:(id)a3;
- (void)setRecipeID:(id)a3;
- (void)setResults:(id)a3;
- (void)setSelectedFeaturesConfig:(id)a3;
- (void)setShouldContinue:(id)a3;
- (void)setSwapOK:(id)a3;
- (void)setTestSplitPercent:(id)a3;
- (void)setTopN:(id)a3;
- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4;
@end

@implementation _PSPersonalizationEvaluation

- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____PSPersonalizationEvaluation;
  v12 = -[_PSPersonalizationEvaluation init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recipe, a3);
    objc_storeStrong((id *)&v13->_knowledgeStore, a4);
    os_log_t v14 = os_log_create("com.apple.PeopleSuggester.personalization", "general");
    v15 = (void *)qword_19C78;
    qword_19C78 = (uint64_t)v14;

    v16 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.PeopleSuggester.personalization");
    psAdaptationDefaults = v13->_psAdaptationDefaults;
    v13->_psAdaptationDefaults = v16;

    id v18 = objc_retainBlock(v11);
    id shouldContinue = v13->_shouldContinue;
    v13->_id shouldContinue = v18;

    v13->_evaluateIsInvokedOnce = 0;
    v20 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Init successfully", v22, 2u);
    }
  }

  return v13;
}

- (void)setLastDayOfAdaptation:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation psAdaptationDefaults](self, "psAdaptationDefaults"));
  [v5 setObject:v4 forKey:@"LastAdaptationDate"];
}

- (void)setParametersFromRecipe
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"evaluationIterationCount"]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"evaluationIterationCount"]);
    -[_PSPersonalizationEvaluation setEvaluationIterationCount:](self, "setEvaluationIterationCount:", v6);
  }

  -[_PSPersonalizationEvaluation setTestSplitPercent:](self, "setTestSplitPercent:", &off_14DD0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"testSplitPercent"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"testSplitPercent"]);
    -[_PSPersonalizationEvaluation setTestSplitPercent:](self, "setTestSplitPercent:", v10);
  }

  -[_PSPersonalizationEvaluation setTopN:](self, "setTopN:", &off_14DB8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"topN"]);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"topN"]);
    -[_PSPersonalizationEvaluation setTopN:](self, "setTopN:", v14);
  }

  -[_PSPersonalizationEvaluation setBatchSize:](self, "setBatchSize:", &off_14DE8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:@"batchSize"]);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"batchSize"]);
    -[_PSPersonalizationEvaluation setBatchSize:](self, "setBatchSize:", v18);
  }

  -[_PSPersonalizationEvaluation setEpoc:](self, "setEpoc:", &off_14E00);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 valueForKey:@"epoc"]);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"epoc"]);
    -[_PSPersonalizationEvaluation setEpoc:](self, "setEpoc:", v22);
  }

  -[_PSPersonalizationEvaluation setSwapOK:](self, "setSwapOK:", &off_14E18);
  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 valueForKey:@"swapOK"]);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"swapOK"]);
    -[_PSPersonalizationEvaluation setSwapOK:](self, "setSwapOK:", v26);
  }

  -[_PSPersonalizationEvaluation setAccuracyGainThresholdForSwap:](self, "setAccuracyGainThresholdForSwap:", &off_14DB8);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 valueForKey:@"accuracyGainThresholdForSwap"]);

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"accuracyGainThresholdForSwap"]);
    -[_PSPersonalizationEvaluation setAccuracyGainThresholdForSwap:](self, "setAccuracyGainThresholdForSwap:", v30);
  }

  -[_PSPersonalizationEvaluation setEngagementRateGainThresholdForSwap:]( self,  "setEngagementRateGainThresholdForSwap:",  &off_14DB8);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:@"engagementRateGainThresholdForSwap"]);

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"engagementRateGainThresholdForSwap"]);
    -[_PSPersonalizationEvaluation setEngagementRateGainThresholdForSwap:]( self,  "setEngagementRateGainThresholdForSwap:",  v34);
  }

  -[_PSPersonalizationEvaluation setMinimumTestDataSizeForSwap:](self, "setMinimumTestDataSizeForSwap:", &off_14E30);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 valueForKey:@"minimumTestDataSizeForSwap"]);

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"minimumTestDataSizeForSwap"]);
    -[_PSPersonalizationEvaluation setMinimumTestDataSizeForSwap:](self, "setMinimumTestDataSizeForSwap:", v38);
  }

  -[_PSPersonalizationEvaluation setRecipeID:](self, "setRecipeID:", &off_14E18);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 valueForKey:@"recipeID"]);

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:@"recipeID"]);
    -[_PSPersonalizationEvaluation setRecipeID:](self, "setRecipeID:", v42);
  }

  -[_PSPersonalizationEvaluation setMinSampleCountForAdaptation:](self, "setMinSampleCountForAdaptation:", &off_14E48);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 valueForKey:@"minSampleCountForAdaptation"]);

  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"minSampleCountForAdaptation"]);
    -[_PSPersonalizationEvaluation setMinSampleCountForAdaptation:](self, "setMinSampleCountForAdaptation:", v46);
  }

  -[_PSPersonalizationEvaluation setAdaptationStrategy:](self, "setAdaptationStrategy:", 0LL);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 valueForKey:@"adaptationStrategy"]);
  if (v48)
  {
    v49 = (void *)v48;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"adaptationStrategy"]);
    uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSNumber, v52);
    char isKindOfClass = objc_opt_isKindOfClass(v51, v53);

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_27;
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"adaptationStrategy"]);
    -[_PSPersonalizationEvaluation setAdaptationStrategy:]( self,  "setAdaptationStrategy:",  (int)[v55 intValue]);
  }

LABEL_27:
  -[_PSPersonalizationEvaluation setNumClasses:](self, "setNumClasses:", &off_14E00);
  -[_PSPersonalizationEvaluation setNumTrees:](self, "setNumTrees:", &off_14E30);
  -[_PSPersonalizationEvaluation setMaxDepth:](self, "setMaxDepth:", &off_14E60);
  -[_PSPersonalizationEvaluation setLearningRate:](self, "setLearningRate:", &off_14E90);
  -[_PSPersonalizationEvaluation setMinChildWeight:](self, "setMinChildWeight:", &off_14E00);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 valueForKey:@"adaptationParameters"]);

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"adaptationParameters"]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 valueForKey:@"numClasses"]);

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:@"adaptationParameters"]);
      v63 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:@"numClasses"]);
      -[_PSPersonalizationEvaluation setNumClasses:](self, "setNumClasses:", v63);
    }

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"adaptationParameters"]);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 valueForKey:@"numTrees"]);

    if (v66)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
      v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"adaptationParameters"]);
      v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:@"numTrees"]);
      -[_PSPersonalizationEvaluation setNumTrees:](self, "setNumTrees:", v69);
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:@"adaptationParameters"]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 valueForKey:@"maxDepth"]);

    if (v72)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
      v74 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKeyedSubscript:@"adaptationParameters"]);
      v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKeyedSubscript:@"maxDepth"]);
      -[_PSPersonalizationEvaluation setMaxDepth:](self, "setMaxDepth:", v75);
    }

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"adaptationParameters"]);
    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 valueForKey:@"learningRate"]);

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
      v80 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:@"adaptationParameters"]);
      v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"learningRate"]);
      -[_PSPersonalizationEvaluation setLearningRate:](self, "setLearningRate:", v81);
    }

    v82 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
    v83 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"adaptationParameters"]);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v83 valueForKey:@"minChildWeight"]);

    if (v84)
    {
      id v87 = (id)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation recipe](self, "recipe"));
      v85 = (void *)objc_claimAutoreleasedReturnValue([v87 objectForKeyedSubscript:@"adaptationParameters"]);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:@"minChildWeight"]);
      -[_PSPersonalizationEvaluation setMinChildWeight:](self, "setMinChildWeight:", v86);
    }
  }

- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3
{
  id v4 = a3;
  -[_PSPersonalizationEvaluation setParametersFromRecipe](self, "setParametersFromRecipe");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[_PSPersonalizationEvaluation setResults:](self, "setResults:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation loadDefaultModel](self, "loadDefaultModel"));
  if (v6)
  {
    v7 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Default ML Model loaded successfully", (uint8_t *)&v12, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingString:@"com.apple.PeopleSuggester.Config.SelectedFeatures.plist"]);
    id v9 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "dodML is loading defaultSelectedFeaturesConfigPath from path: %@",  (uint8_t *)&v12,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v8));
    -[_PSPersonalizationEvaluation setSelectedFeaturesConfig:](self, "setSelectedFeaturesConfig:", v10);
  }

  return v6 != 0LL;
}

- (id)loadDefaultModel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getTrialCompiledMLModelPath"));
  v3 = (os_log_s *)qword_19C78;
  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    os_log_t v14 = v2;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_INFO,  "dodML is trying to load trialCompiledMLModel from path: %@",  (uint8_t *)&v13,  0xCu);
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "loadMLModel:modelConfig:",  v2,  0LL));
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      os_log_t v14 = v2;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "Trial model is loaded for adaptation from path: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v7 = v5;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getDeployedCompiledMLModelPath"));
    id v9 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      os_log_t v14 = v8;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "dodML is trying to load deployedCompiledMLModel from path: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "loadMLModel:modelConfig:",  v8,  0LL));
    id v10 = (os_log_s *)qword_19C78;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        os_log_t v14 = v8;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "Deployed default model is loaded for adaptation from path: %@",  (uint8_t *)&v13,  0xCu);
      }

      id v11 = v7;
    }

    else if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR))
    {
      sub_D610();
    }
  }

  return v7;
}

- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "removeFolderAtPath:",  v10))
  {
    int v13 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    id v25 = 0LL;
    unsigned __int8 v14 = -[NSFileManager copyItemAtPath:toPath:error:](v13, "copyItemAtPath:toPath:error:", v9, v10, &v25);
    id v15 = v25;
    if (v15 || (v14 & 1) == 0)
    {
      v22 = (os_log_s *)qword_19C78;
      if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl( &dword_0,  v22,  OS_LOG_TYPE_ERROR,  "While cloning adaptable model, copying folder from path:%@ to path:%@ failed with error：%@",  buf,  0x20u);
      }

      unsigned __int8 v20 = 0;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@"/"]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v11]);

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@"/"]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:v12]);

      id v24 = 0LL;
      unsigned __int8 v20 = -[NSFileManager moveItemAtPath:toPath:error:](v13, "moveItemAtPath:toPath:error:", v17, v19, &v24);
      id v15 = v24;
      if (v15) {
        unsigned __int8 v20 = 0;
      }
      if ((v20 & 1) == 0)
      {
        v21 = (os_log_s *)qword_19C78;
        if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v27 = v17;
          __int16 v28 = 2112;
          id v29 = v19;
          __int16 v30 = 2112;
          id v31 = v15;
          _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "While cloning adaptable model, renaming file with path:%@ to path:%@ failed with error：%@",  buf,  0x20u);
        }
      }
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
      sub_D63C();
    }
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4
{
  id v40 = a4;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2050000000LL;
  v6 = (void *)qword_19C80;
  uint64_t v45 = qword_19C80;
  if (!qword_19C80)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_C048;
    v41[3] = &unk_14520;
    v41[4] = &v42;
    sub_C048((uint64_t)v41);
    v6 = (void *)v43[3];
  }

  id v7 = v6;
  _Block_object_dispose(&v42, 8);
  id v8 = objc_alloc_init(v7);
  -[_PSPersonalizationEvaluation setAdaptableModelConfiguration:](self, "setAdaptableModelConfiguration:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration"));
  [v9 setComputeUnits:0];

  id v10 = [sub_9844() numClasses];
  v39 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (a3 == 2)
  {
    v48[0] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation numClasses](self, "numClasses"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v38 intValue]));
    v49[0] = v37;
    id v11 = [sub_9844() numTrees];
    v36 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v48[1] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v40 intValue]));
    v49[1] = v35;
    id v12 = [sub_9844() maxDepth];
    v34 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v48[2] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation maxDepth](self, "maxDepth"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v33 intValue]));
    v49[2] = v32;
    id v13 = [sub_9844() learningRate];
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v48[3] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation learningRate](self, "learningRate"));
    [v15 floatValue];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    v49[3] = v16;
    id v17 = [sub_9844() minChildWeight];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v48[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation minChildWeight](self, "minChildWeight"));
    [v19 floatValue];
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    v49[4] = v20;
    id v21 = [sub_9844() objective];
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v48[5] = v22;
    v49[5] = @"binary:logistic";
    id v23 = [sub_9844() updateType];
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v48[6] = v24;
    v49[6] = @"treeRefresh";
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  7LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration"));
    [v26 setParameters:v25];
  }

  else
  {
    v46[0] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation numClasses](self, "numClasses"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v38 intValue]));
    v47[0] = v37;
    id v27 = [sub_9844() numTrees];
    v36 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v46[1] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v40 intValue]));
    v47[1] = v35;
    id v28 = [sub_9844() maxDepth];
    v34 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v46[2] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation maxDepth](self, "maxDepth"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v33 intValue]));
    v47[2] = v32;
    id v29 = [sub_9844() learningRate];
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v46[3] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation learningRate](self, "learningRate"));
    [v15 floatValue];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    v47[3] = v16;
    id v30 = [sub_9844() minChildWeight];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v46[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation minChildWeight](self, "minChildWeight"));
    [v19 floatValue];
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    v47[4] = v20;
    id v31 = [sub_9844() objective];
    v22 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v46[5] = v22;
    v47[5] = @"binary:logistic";
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  6LL));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration"));
    [v25 setParameters:v24];
  }
}

- (id)loadAdaptableModelUnderDirectory:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[_PSPersonalizationEvaluation adaptationStrategy](self, "adaptationStrategy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation numTrees](self, "numTrees"));
  -[_PSPersonalizationEvaluation updateAdaptableModelConfigWithUpdateType:numTrees:]( self,  "updateAdaptableModelConfigWithUpdateType:numTrees:",  v5,  v6);

  +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "loadDeployedAdaptableModelUnderDirectory:",  v4);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getIntermediateAdaptableCompiledMLModel]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getIntermediateAdaptableCompiledMLModel"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getTrialCompiledAdaptableMLModelPath"));
  if (-[NSFileManager fileExistsAtPath:](v7, "fileExistsAtPath:", v9))
  {
    if (-[_PSPersonalizationEvaluation cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:]( self,  "cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:",  v9,  v8,  @"TrialAdaptableRuleImportancePredictor.xgboost",  @"IntermediateAdaptableModel.xgboost"))
    {
      goto LABEL_3;
    }

- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4
{
  BOOL v134 = a4;
  id v130 = a3;
  id v4 = &NSCocoaErrorDomain_ptr;
  v136 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v135 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int64_t v5 = (os_log_s *)qword_19C78;
  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "In processDataWithQuery", buf, 2u);
  }

  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 10LL;
  while (1)
  {
    unint64_t v131 = v8;
    context = objc_autoreleasePoolPush();
    [v130 setLimit:10];
    uint64_t v132 = v6;
    [v130 setOffset:v6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation knowledgeStore](self, "knowledgeStore"));
    id v182 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeQuery:v130 error:&v182]);
    id v11 = v182;

    id v12 = (void *)qword_19C78;
    if (v11) {
      break;
    }
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      id v13 = v12;
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 count]));
      *(_DWORD *)buf = 138412290;
      v192 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "knowledgeEvents parsing, number of events: %@", buf, 0xCu);
    }

    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    id obj = v10;
    id v15 = [obj countByEnumeratingWithState:&v178 objects:v190 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v179;
      uint64_t v137 = *(void *)v179;
      do
      {
        id v18 = 0LL;
        id v138 = v16;
        do
        {
          if (*(void *)v179 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v178 + 1) + 8LL * (void)v18);
          if (v19)
          {
            v141 = *(void **)(*((void *)&v178 + 1) + 8LL * (void)v18);
            v142 = v18;
            unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 metadata]);
            unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[_DKBehavioralRuleFeaturesMetadataKey featureDict]( &OBJC_CLASS____DKBehavioralRuleFeaturesMetadataKey,  "featureDict"));
            v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

            v148 = v22;
            if (v22)
            {
              id v23 = (void *)qword_19C78;
              if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
              {
                id v24 = v23;
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v22 count]));
                *(_DWORD *)buf = 138412290;
                v192 = v25;
                _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "number of data points: %@", buf, 0xCu);
              }

              if ([v22 count])
              {
                uint64_t v7 = (v7 + 1);
                v26 = (void *)qword_19C78;
                if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
                {
                  id v27 = v26;
                  id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v28 count]));
                  *(_DWORD *)buf = 138412290;
                  v192 = v29;
                  _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "data point dimension: %@", buf, 0xCu);
                }
              }

              id v30 = (void *)qword_19C78;
              if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
              {
                uint64_t v31 = v30;
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
                *(_DWORD *)buf = 138412290;
                v192 = v32;
                _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "countEvents: %@", buf, 0xCu);
              }

              unsigned int v140 = v7;
              if ((_DWORD)v7 == 1 && [v148 count])
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation selectedFeaturesConfig](self, "selectedFeaturesConfig"));
                v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"]);

                v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                -[_PSPersonalizationEvaluation setFeatureNameDict:](self, "setFeatureNameDict:", v35);

                __int128 v176 = 0u;
                __int128 v177 = 0u;
                __int128 v174 = 0u;
                __int128 v175 = 0u;
                id v36 = v34;
                unint64_t v37 = (unint64_t)[v36 countByEnumeratingWithState:&v174 objects:v189 count:16];
                if (v37)
                {
                  uint64_t v38 = 0LL;
                  uint64_t v39 = *(void *)v175;
                  do
                  {
                    id v40 = 0LL;
                    uint64_t v41 = v38;
                    do
                    {
                      if (*(void *)v175 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      uint64_t v42 = *(void *)(*((void *)&v174 + 1) + 8LL * (void)v40);
                      v43 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (char *)v40 + v41));
                      [v43 setValue:v44 forKey:v42];

                      id v40 = (char *)v40 + 1;
                    }

                    while ((void *)v37 != v40);
                    unint64_t v37 = (unint64_t)[v36 countByEnumeratingWithState:&v174 objects:v189 count:16];
                    uint64_t v38 = (v41 + (_DWORD)v40);
                  }

                  while (v37);
                  unint64_t v37 = (v41 + (_DWORD)v40);
                }

                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v37));
                [v45 setValue:v46 forKey:@"personAndAppMatched"];

                v47 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (v37 + 1)));
                [v47 setValue:v48 forKey:@"recipientAndBundleIDAsInteger"];

                v49 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (v37 + 2)));
                [v49 setValue:v50 forKey:@"predictedClass"];

                v51 = (void *)qword_19C78;
                if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
                {
                  uint64_t v52 = v51;
                  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                  *(_DWORD *)buf = 138412290;
                  v192 = v53;
                  _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "featureNameDict: %@", buf, 0xCu);
                }
              }

              id v144 = objc_alloc_init((Class)v4[6]);
              if (v134)
              {
                id v143 = objc_alloc_init((Class)v4[6]);
                if ([v148 count])
                {
                  uint64_t v146 = 0LL;
                  while (1)
                  {
                    id v54 = objc_alloc_init((Class)v4[6]);
                    __int128 v170 = 0u;
                    __int128 v171 = 0u;
                    __int128 v172 = 0u;
                    __int128 v173 = 0u;
                    v55 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                    id v56 = [v55 countByEnumeratingWithState:&v170 objects:v188 count:16];
                    if (v56)
                    {
                      id v57 = v56;
                      uint64_t v58 = *(void *)v171;
                      do
                      {
                        for (i = 0LL; i != v57; i = (char *)i + 1)
                        {
                          if (*(void *)v171 != v58) {
                            objc_enumerationMutation(v55);
                          }
                          if (([*(id *)(*((void *)&v170 + 1) + 8 * (void)i) isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            v60 = objc_opt_new(&OBJC_CLASS___NSObject);
                            [v54 addObject:v60];
                          }
                        }

                        id v57 = [v55 countByEnumeratingWithState:&v170 objects:v188 count:16];
                      }

                      while (v57);
                    }

                    __int128 v168 = 0u;
                    __int128 v169 = 0u;
                    __int128 v166 = 0u;
                    __int128 v167 = 0u;
                    v61 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                    id v62 = [v61 countByEnumeratingWithState:&v166 objects:v187 count:16];
                    if (!v62) {
                      break;
                    }
                    id v63 = v62;
                    char v64 = 0;
                    uint64_t v65 = *(void *)v167;
                    id v145 = v61;
                    do
                    {
                      for (j = 0LL; j != v63; j = (char *)j + 1)
                      {
                        if (*(void *)v167 != v65) {
                          objc_enumerationMutation(v145);
                        }
                        v67 = *(void **)(*((void *)&v166 + 1) + 8LL * (void)j);
                        if (([v67 isEqualToString:@"predictedClass"] & 1) == 0)
                        {
                          v68 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                          v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v67]);
                          signed int v70 = [v69 intValue];
                          id v71 = [v54 count];

                          if ((unint64_t)v71 > v70)
                          {
                            v72 = (void *)objc_claimAutoreleasedReturnValue([v148 objectAtIndexedSubscript:v146]);
                            v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v67]);
                            v74 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                            v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKeyedSubscript:v67]);
                            objc_msgSend(v54, "setObject:atIndexedSubscript:", v73, (int)objc_msgSend(v75, "intValue"));
                          }
                        }

                        if ([v67 isEqualToString:@"personAndAppMatched"])
                        {
                          v76 = (void *)objc_claimAutoreleasedReturnValue([v148 objectAtIndexedSubscript:v146]);
                          v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:v67]);

                          v64 |= [v77 intValue] == 1;
                        }
                      }

                      id v63 = [v145 countByEnumeratingWithState:&v166 objects:v187 count:16];
                    }

                    while (v63);

                    id v4 = &NSCocoaErrorDomain_ptr;
                    if ((v64 & 1) == 0) {
                      goto LABEL_61;
                    }
                    id v78 = [v54 copy];
                    v79 = v144;
LABEL_62:
                    [v79 addObject:v78];
                  }

LABEL_61:
                  id v78 = [v54 copy];
                  v79 = v143;
                  goto LABEL_62;
                }

- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4
{
  id v6 = a3;
  id v56 = a4;
  id v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id obj = v6;
  id v55 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v55)
  {
    v59 = 0LL;
    uint64_t v54 = *(void *)v77;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v51 = v7;
    while (1)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v77 != v54)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }

        uint64_t v57 = v8;
        id v10 = *(void **)(*((void *)&v76 + 1) + 8 * v8);
        context = objc_autoreleasePoolPush();
        id v11 = [v10 mutableCopy];
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
        id v62 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"personAndAppMatched"]);

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v62, "intValue")));
        uint64_t v80 = 0LL;
        id v81 = &v80;
        uint64_t v82 = 0x2050000000LL;
        id v13 = (void *)qword_19CA0;
        uint64_t v83 = qword_19CA0;
        if (!qword_19CA0)
        {
          *(void *)&__int128 buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472LL;
          v89 = sub_C264;
          v90 = &unk_14520;
          id v91 = &v80;
          sub_C264((uint64_t)&buf);
          id v13 = (void *)v81[3];
        }

        id v14 = v13;
        _Block_object_dispose(&v80, 8);
        [v61 floatValue];
        v60 = (void *)objc_claimAutoreleasedReturnValue([v14 featureValueWithInt64:(int)v15]);
        if ([v56 isEqualToString:@"classicMLModel"])
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
          id v63 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"predictedClass"]);

          objc_msgSend(v11, "setObject:atIndexedSubscript:", v60, (int)objc_msgSend(v63, "intValue"));
          uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v75 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v72 = 0u;
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
          id v19 = [v18 countByEnumeratingWithState:&v72 objects:v86 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v73;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v73 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v22 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)i);
                id v23 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict", v51));
                id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v22]);

                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v24, "intValue")));
                -[NSMutableDictionary setValue:forKey:](v17, "setValue:forKey:", v25, v22);
              }

              id v19 = [v18 countByEnumeratingWithState:&v72 objects:v86 count:16];
            }

            while (v19);
          }

          id v26 = objc_alloc((Class)sub_B3F8());
          id v27 = -[NSMutableDictionary copy](v17, "copy");
          id v71 = v59;
          id v64 = [v26 initWithDictionary:v27 error:&v71];
          id v28 = v71;

          if (!v28)
          {
            [v52 addObject:v64];
            goto LABEL_34;
          }

          uint64_t v29 = (os_log_s *)qword_19C78;
          if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR))
          {
LABEL_24:
            LODWORD(buf) = v51;
            *(void *)((char *)&buf + 4) = v28;
            _os_log_error_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "Error getting sample point into MLDictionaryFeatureProvider format with error:%@",  (uint8_t *)&buf,  0xCu);
          }
        }

        else
        {
          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation selectedFeaturesConfig](self, "selectedFeaturesConfig"));
          id v63 = (id)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"]);

          uint64_t v17 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
          uint64_t v80 = 0LL;
          id v81 = &v80;
          uint64_t v82 = 0x2050000000LL;
          uint64_t v31 = (void *)qword_19CB0;
          uint64_t v83 = qword_19CB0;
          if (!qword_19CB0)
          {
            *(void *)&__int128 buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472LL;
            v89 = sub_C3CC;
            v90 = &unk_14520;
            id v91 = &v80;
            sub_C3CC((uint64_t)&buf);
            uint64_t v31 = (void *)v81[3];
          }

          uint64_t v32 = v31;
          _Block_object_dispose(&v80, 8);
          id v33 = objc_alloc(v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v63 count]));
          v85 = v34;
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v85,  1LL));
          id v70 = v59;
          id v64 = [v33 initWithShape:v35 dataType:65568 error:&v70];
          id v28 = v70;

          if (!v28)
          {
            __int128 v68 = 0u;
            __int128 v69 = 0u;
            __int128 v66 = 0u;
            __int128 v67 = 0u;
            id v63 = v63;
            id v36 = [v63 countByEnumeratingWithState:&v66 objects:v84 count:16];
            if (v36)
            {
              uint64_t v37 = 0LL;
              uint64_t v38 = *(void *)v67;
              do
              {
                for (j = 0LL; j != v36; j = (char *)j + 1)
                {
                  if (*(void *)v67 != v38) {
                    objc_enumerationMutation(v63);
                  }
                  uint64_t v40 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)j);
                  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict", v51));
                  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v40]);

                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v42, "intValue")));
                  [v43 floatValue];
                  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
                  [v64 setObject:v44 atIndexedSubscript:(char *)j + v37];
                }

                id v36 = [v63 countByEnumeratingWithState:&v66 objects:v84 count:16];
                v37 += (uint64_t)j;
              }

              while (v36);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v64,  @"input");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v60,  @"predictedClass");
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
            v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"recipientAndBundleIDAsInteger"]);

            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v46, "intValue")));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v47,  @"recipientAndBundleIDAsInteger");

            id v48 = objc_alloc((Class)sub_B3F8());
            id v65 = 0LL;
            id v49 = [v48 initWithDictionary:v17 error:&v65];
            id v28 = v65;
            [v52 addObject:v49];

            goto LABEL_34;
          }

          uint64_t v29 = (os_log_s *)qword_19C78;
          if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
        }

- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_19C78;
  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 parameters]);
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v9 count];
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "AdaptMLModel config: %@, amount of data: %ld", buf, 0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v55 = sub_BAC0;
  id v56 = sub_BAD0;
  id v57 = 0LL;
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = sub_BAC0;
  id v48 = sub_BAD0;
  dispatch_semaphore_t v49 = dispatch_semaphore_create(0LL);
  id v14 = v9;
  float v15 = (os_log_s *)qword_19C78;
  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
  {
    LOWORD(v58) = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Training data prepped for model adaptation", (uint8_t *)&v58, 2u);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_BAD8;
  v43[3] = &unk_14588;
  v43[4] = self;
  v43[5] = &v44;
  id v16 = objc_retainBlock(v43);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_BB90;
  v39[3] = &unk_145B0;
  id v17 = v8;
  id v40 = v17;
  uint64_t v41 = buf;
  uint64_t v42 = &v44;
  id v18 = objc_retainBlock(v39);
  uint64_t v50 = 0LL;
  __int128 v51 = &v50;
  uint64_t v52 = 0x2050000000LL;
  id v19 = (void *)qword_19CB8;
  uint64_t v53 = qword_19CB8;
  if (!qword_19CB8)
  {
    *(void *)&__int128 v58 = _NSConcreteStackBlock;
    *((void *)&v58 + 1) = 3221225472LL;
    v59 = sub_C480;
    v60 = &unk_14520;
    v61 = &v50;
    sub_C480((uint64_t)&v58);
    id v19 = (void *)v51[3];
  }

  uint64_t v20 = v19;
  _Block_object_dispose(&v50, 8);
  id v21 = [[v20 alloc] initForEvents:3 progressHandler:v16 completionHandler:v18];
  if (!v14
    || (uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 array]),
        BOOL v23 = [v22 count] == 0,
        v22,
        v23))
  {
    id v36 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      LOWORD(v58) = 0;
      _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "updateTaskForModelAtURL is not initiated due to lack of training data",  (uint8_t *)&v58,  2u);
    }

    goto LABEL_24;
  }

  id v24 = (os_log_s *)(id)qword_19C78;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = v10;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 array]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v26 count]));
    LODWORD(v58) = 138412290;
    *(void *)((char *)&v58 + 4) = v27;
    _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_INFO,  "Update task will be initiated with %@ number of samples",  (uint8_t *)&v58,  0xCu);

    id v10 = v25;
  }

  id v28 = (os_log_s *)(id)qword_19C78;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 parameters]);
    LODWORD(v58) = 138412290;
    *(void *)((char *)&v58 + 4) = v29;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Config: %@", (uint8_t *)&v58, 0xCu);
  }

  uint64_t v50 = 0LL;
  __int128 v51 = &v50;
  uint64_t v52 = 0x2050000000LL;
  id v30 = (void *)qword_19CC0;
  uint64_t v53 = qword_19CC0;
  if (!qword_19CC0)
  {
    *(void *)&__int128 v58 = _NSConcreteStackBlock;
    *((void *)&v58 + 1) = 3221225472LL;
    v59 = sub_C534;
    v60 = &unk_14520;
    v61 = &v50;
    sub_C534((uint64_t)&v58);
    id v30 = (void *)v51[3];
  }

  id v31 = v30;
  _Block_object_dispose(&v50, 8);
  uint64_t v32 = (id *)(*(void *)&buf[8] + 40LL);
  id obj = *(id *)(*(void *)&buf[8] + 40LL);
  id v33 = (void *)objc_claimAutoreleasedReturnValue( [v31 updateTaskForModelAtURL:v17 trainingData:v14 configuration:v10 progressHandlers:v21 error:&obj]);
  objc_storeStrong(v32, obj);
  if (!*(void *)(*(void *)&buf[8] + 40LL))
  {
    [v33 resume];
    uint64_t v37 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      LOWORD(v58) = 0;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL initiated", (uint8_t *)&v58, 2u);
    }

LABEL_24:
    dispatch_semaphore_wait((dispatch_semaphore_t)v45[5], 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_25;
  }

  v34 = (os_log_s *)qword_19C78;
  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = *(void *)(*(void *)&buf[8] + 40LL);
    LODWORD(v58) = 138412290;
    *(void *)((char *)&v58 + 4) = v35;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL caused error: %@", (uint8_t *)&v58, 0xCu);
  }

LABEL_25:
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(buf, 8);
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (NSString)adaptableModelDeployPath
{
  return self->_adaptableModelDeployPath;
}

- (void)setAdaptableModelDeployPath:(id)a3
{
}

- (int64_t)adaptationStrategy
{
  return self->_adaptationStrategy;
}

- (void)setAdaptationStrategy:(int64_t)a3
{
  self->_adaptationStrategy = a3;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureNameDict:(id)a3
{
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (MLModelConfiguration)adaptableModelConfiguration
{
  return self->_adaptableModelConfiguration;
}

- (void)setAdaptableModelConfiguration:(id)a3
{
}

- (NSURL)intermediateCompiledModelURL
{
  return self->_intermediateCompiledModelURL;
}

- (void)setIntermediateCompiledModelURL:(id)a3
{
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
}

- (NSNumber)topN
{
  return self->_topN;
}

- (void)setTopN:(id)a3
{
}

- (NSNumber)epoc
{
  return self->_epoc;
}

- (void)setEpoc:(id)a3
{
}

- (NSNumber)evaluationIterationCount
{
  return self->_evaluationIterationCount;
}

- (void)setEvaluationIterationCount:(id)a3
{
}

- (NSNumber)testSplitPercent
{
  return self->_testSplitPercent;
}

- (void)setTestSplitPercent:(id)a3
{
}

- (NSNumber)swapOK
{
  return self->_swapOK;
}

- (void)setSwapOK:(id)a3
{
}

- (NSNumber)accuracyGainThresholdForSwap
{
  return self->_accuracyGainThresholdForSwap;
}

- (void)setAccuracyGainThresholdForSwap:(id)a3
{
}

- (NSNumber)engagementRateGainThresholdForSwap
{
  return self->_engagementRateGainThresholdForSwap;
}

- (void)setEngagementRateGainThresholdForSwap:(id)a3
{
}

- (NSNumber)minimumTestDataSizeForSwap
{
  return self->_minimumTestDataSizeForSwap;
}

- (void)setMinimumTestDataSizeForSwap:(id)a3
{
}

- (NSNumber)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(id)a3
{
}

- (NSNumber)numTrees
{
  return self->_numTrees;
}

- (void)setNumTrees:(id)a3
{
}

- (NSNumber)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(id)a3
{
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
}

- (NSNumber)minChildWeight
{
  return self->_minChildWeight;
}

- (void)setMinChildWeight:(id)a3
{
}

- (NSNumber)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
}

- (NSNumber)minSampleCountForAdaptation
{
  return self->_minSampleCountForAdaptation;
}

- (void)setMinSampleCountForAdaptation:(id)a3
{
}

- (NSUserDefaults)psAdaptationDefaults
{
  return self->_psAdaptationDefaults;
}

- (void)setPsAdaptationDefaults:(id)a3
{
}

- (BOOL)evaluateIsInvokedOnce
{
  return self->_evaluateIsInvokedOnce;
}

- (void)setEvaluateIsInvokedOnce:(BOOL)a3
{
  self->_evaluateIsInvokedOnce = a3;
}

- (id)shouldContinue
{
  return self->_shouldContinue;
}

- (void)setShouldContinue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end