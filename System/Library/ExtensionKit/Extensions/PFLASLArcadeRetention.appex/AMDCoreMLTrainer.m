@interface AMDCoreMLTrainer
- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9;
- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6;
- (id)taskResultFromDict:(id)a3;
@end

@implementation AMDCoreMLTrainer

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6
{
  v44 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v42 = a4;
  id v41 = 0LL;
  objc_storeStrong(&v41, a5);
  id v40 = 0LL;
  objc_storeStrong(&v40, a6);
  v6 = objc_alloc(&OBJC_CLASS___AMDDODMLModelMetadata);
  id v39 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:]( v6,  "initModelMetadata:error:errorDomain:",  location[0],  v42,  v41);
  if (v39)
  {
    id v18 = [v39 modelPath];
    v17 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:");
    id v37 = -[NSURL URLByDeletingLastPathComponent](v17, "URLByDeletingLastPathComponent");

    id v36 = objc_alloc_init(&OBJC_CLASS___MLModelConfiguration);
    [v36 setComputeUnits:0];
    id v35 =  +[MLModel modelWithContentsOfURL:configuration:error:]( &OBJC_CLASS___MLModel,  "modelWithContentsOfURL:configuration:error:",  v37,  v36,  v42);
    if (v35)
    {
      id v14 = objc_alloc(&OBJC_CLASS___MLProgramTrainer);
      id v16 = [v35 program];
      id v15 = [v39 learningRate];
      [v15 doubleValue];
      id v34 = objc_msgSend(v14, "initWithProgram:learningRate:error:", v16, v42);

      if (v34)
      {
        id v33 = objc_msgSend(v40, "numberOfIterationsPerEpoch:", objc_msgSend(v39, "batchSize"));
        if (v33)
        {
          id v32 = [v39 numLocalIterations];
          id v12 = [v39 learningRateSchedule];
          BOOL v13 = 0;
          if (!v12) {
            BOOL v13 = (uint64_t)[v39 numEpochs] > 0;
          }

          if (v13) {
            id v32 = (id)((void)[v39 numEpochs] * (void)v33);
          }
          id v31 =  -[AMDCoreMLTrainer computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:]( v44,  "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:",  v39,  v34,  v32,  v42,  v41,  v40,  0LL);
          if (v31)
          {
            id v30 =  -[AMDCoreMLTrainer computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:]( v44,  "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:",  v39,  v34,  v32,  v42,  v41,  v40,  1LL);
            if (v30)
            {
              id v29 = [v34 copyCurrentTrainingDelta];
              id v28 = [v29 flattenedModelUpdate];
              id v27 =  -[AMDCoreMLTrainer computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:]( v44,  "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:",  v39,  v34,  v32,  v42,  v41,  v40,  2LL);
              if (v27)
              {
                id v26 = [v31 objectForKey:LossBeforeEachLocalIteration];
                id v25 = [v27 objectForKey:LossAfterEachLocalIteration];
                id v24 = [v30 objectForKey:LossDuringEachLocalIteration];
                id v23 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
                [v23 addEntriesFromDictionary:v31];
                [v23 addEntriesFromDictionary:v30];
                [v23 addEntriesFromDictionary:v27];
                [v23 removeObjectForKey:LossBeforeEachLocalIteration];
                [v23 removeObjectForKey:LossDuringEachLocalIteration];
                [v23 removeObjectForKey:LossAfterEachLocalIteration];
                id v22 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
                [v22 setObject:v28 forKey:ModelDeltas];
                id v10 = v22;
                id v11 = [v39 weightNames];
                objc_msgSend(v10, "setObject:forKey:");

                [v22 setObject:v26 forKey:LossBeforeEachLocalIteration];
                [v22 setObject:v24 forKey:LossDuringEachLocalIteration];
                [v22 setObject:v25 forKey:LossAfterEachLocalIteration];
                [v22 setObject:v23 forKey:ModelMetrics];
                id v45 = -[AMDCoreMLTrainer taskResultFromDict:](v44, "taskResultFromDict:", v22);
                int v38 = 1;
                objc_storeStrong(&v22, 0LL);
                objc_storeStrong(&v23, 0LL);
                objc_storeStrong(&v24, 0LL);
                objc_storeStrong(&v25, 0LL);
                objc_storeStrong(&v26, 0LL);
              }

              else
              {
                id v45 = 0LL;
                int v38 = 1;
              }

              objc_storeStrong(&v27, 0LL);
              objc_storeStrong(&v28, 0LL);
              objc_storeStrong(&v29, 0LL);
            }

            else
            {
              id v45 = 0LL;
              int v38 = 1;
            }

            objc_storeStrong(&v30, 0LL);
          }

          else
          {
            id v45 = 0LL;
            int v38 = 1;
          }

          objc_storeStrong(&v31, 0LL);
        }

        else
        {
          v7 = objc_alloc(&OBJC_CLASS___NSError);
          v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v41, 127LL, 0LL);
          id *v42 = v8;
          id v45 = 0LL;
          int v38 = 1;
        }
      }

      else
      {
        id v45 = 0LL;
        int v38 = 1;
      }

      objc_storeStrong(&v34, 0LL);
    }

    else
    {
      id v45 = 0LL;
      int v38 = 1;
    }

    objc_storeStrong(&v35, 0LL);
    objc_storeStrong(&v36, 0LL);
    objc_storeStrong(&v37, 0LL);
  }

  else
  {
    id v45 = 0LL;
    int v38 = 1;
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(location, 0LL);
  return v45;
}

- (id)computeAndGetMetrics:(id)a3 programTrainer:(id)a4 numIterationsToTrain:(int64_t)a5 error:(id *)a6 errorDomain:(id)a7 dataProvider:(id)a8 localTrainingStage:(unint64_t)a9
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v76 = 0LL;
  objc_storeStrong(&v76, a4);
  int64_t v75 = a5;
  v74 = a6;
  id v73 = 0LL;
  objc_storeStrong(&v73, a7);
  id v72 = 0LL;
  objc_storeStrong(&v72, a8);
  unint64_t v71 = a9;
  id v70 = 0LL;
  id v69 = 0LL;
  if (a9 == 1)
  {
    objc_storeStrong(&v70, LossDuringEachLocalIteration);
    objc_storeStrong(&v69, DuringIterationMetricsSuffix);
  }

  else if (v71)
  {
    if (v71 == 2)
    {
      objc_storeStrong(&v70, LossAfterEachLocalIteration);
      objc_storeStrong(&v69, AfterIterationMetricsSuffix);
    }
  }

  else
  {
    objc_storeStrong(&v70, LossBeforeEachLocalIteration);
    objc_storeStrong(&v69, BeforeIterationMetricsSuffix);
  }

  id v68 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
  for (int i = 0; i < v75; ++i)
  {
    id v50 = v72;
    id v9 = [location[0] batchSize];
    id v66 = [v50 fetchData:v9 error:v74 errorDomain:v73];
    if (v66)
    {
      id v10 = [location[0] learningRateSchedule];
      BOOL v49 = v10 == 0LL;

      if (!v49)
      {
        id v48 = [location[0] learningRateSchedule];
        id v47 = [v48 objectAtIndexedSubscript:i];
        [v47 doubleValue];
        objc_msgSend(v76, "setLearningRate:");
      }

      id v64 = 0LL;
      if (v71 == 1)
      {
        id v44 = v76;
        id v43 = v66;
        id v46 = [location[0] metricsNames];
        id v45 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:");
        id v11 = objc_msgSend(v44, "trainUsingTrainingData:evaluationMetricNames:error:", v43);
        id v12 = v64;
        id v64 = v11;
      }

      else
      {
        id v40 = v76;
        id v39 = v66;
        id v42 = [location[0] metricsNames];
        id v41 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:");
        id v13 = objc_msgSend(v40, "evaluateUsingTestData:evaluationMetricNames:error:", v39);
        id v14 = v64;
        id v64 = v13;
      }

      if (v64)
      {
        [v64 loss];
        NSLog(@"Loss: %f", v15);
        id v63 = [v68 valueForKey:v70];
        if (!v63)
        {
          id v16 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
          id v17 = v63;
          id v63 = v16;

          [v68 setValue:v63 forKey:v70];
        }

        id v34 = v63;
        [v64 loss];
        id v35 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
        objc_msgSend(v34, "addObject:");

        id v36 = [v64 evaluationMetrics];
        id v62 = [v36 featuresAtIndex:0];

        memset(__b, 0, sizeof(__b));
        id v37 = [location[0] metricsNames];
        id v38 = [v37 countByEnumeratingWithState:__b objects:v79 count:16];
        if (v38)
        {
          uint64_t v31 = *(void *)__b[2];
          uint64_t v32 = 0LL;
          id v33 = v38;
          while (1)
          {
            uint64_t v30 = v32;
            if (*(void *)__b[2] != v31) {
              objc_enumerationMutation(v37);
            }
            id v61 = *(id *)(__b[1] + 8 * v32);
            id v59 = [v62 featureValueForName:v61];
            if (v59)
            {
              id v28 = [v59 multiArrayValue];
              id v27 = [v28 objectAtIndexedSubscript:0];
              [v27 floatValue];
              int v29 = v20;

              int v58 = v29;
              id v57 = [v61 stringByAppendingString:v69];
              id v56 = [v68 valueForKey:v57];
              if (!v56)
              {
                id v22 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
                id v23 = v56;
                id v56 = v22;

                [v68 setValue:v56 forKey:v57];
              }

              id v25 = v56;
              LODWORD(v21) = v58;
              id v26 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v21);
              objc_msgSend(v25, "addObject:");

              objc_storeStrong(&v56, 0LL);
              objc_storeStrong(&v57, 0LL);
              int v65 = 0;
            }

            else
            {
              id v18 = objc_alloc(&OBJC_CLASS___NSError);
              v19 = -[NSError initWithDomain:code:userInfo:](v18, "initWithDomain:code:userInfo:", v73, 61LL, 0LL);
              id *v74 = v19;
              id v78 = 0LL;
              int v65 = 1;
            }

            objc_storeStrong(&v59, 0LL);
            if (v65) {
              break;
            }
            ++v32;
            if (v30 + 1 >= (unint64_t)v33)
            {
              uint64_t v32 = 0LL;
              id v33 = [v37 countByEnumeratingWithState:__b objects:v79 count:16];
              if (!v33) {
                goto LABEL_32;
              }
            }
          }
        }

        else
        {
LABEL_32:
          int v65 = 0;
        }

        if (!v65) {
          int v65 = 0;
        }
        objc_storeStrong(&v62, 0LL);
        objc_storeStrong(&v63, 0LL);
      }

      else
      {
        id v78 = 0LL;
        int v65 = 1;
      }

      objc_storeStrong(&v64, 0LL);
    }

    else
    {
      id v78 = 0LL;
      int v65 = 1;
    }

    objc_storeStrong(&v66, 0LL);
    if (v65) {
      goto LABEL_40;
    }
  }

  id v78 = v68;
  int v65 = 1;
LABEL_40:
  objc_storeStrong(&v68, 0LL);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(&v76, 0LL);
  objc_storeStrong(location, 0LL);
  return v78;
}

- (id)taskResultFromDict:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] mutableCopy];
  id v6 = [v7 objectForKeyedSubscript:ModelDeltas];
  [v7 removeObjectForKey:ModelDeltas];
  id v3 = objc_alloc(&OBJC_CLASS___MLRTaskResult);
  id v5 = [v3 initWithJSONResult:v7 unprivatizedVector:v6];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

@end