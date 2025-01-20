@interface AMDDODMLModelMetadata
- (NSArray)inputNames;
- (NSArray)learningRateSchedule;
- (NSArray)metricsNames;
- (NSArray)outputNames;
- (NSArray)weightNames;
- (NSDictionary)shortenedEmbeddingMappingKeys;
- (NSDictionary)shortenedEmbeddingNames;
- (NSDictionary)shortenedEmbeddingNumberVectorsAfter;
- (NSDictionary)shortenedEmbeddingNumberVectorsBefore;
- (NSDictionary)shortenedEmbeddingSize;
- (NSNumber)initializeManually;
- (NSNumber)learningRate;
- (NSNumber)useCoreMLTrainer;
- (NSString)initializationFunctionName;
- (NSString)learningRateBufferName;
- (NSString)lossName;
- (NSString)modelPath;
- (NSString)trainingModeBufferName;
- (id)initModelMetadata:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (int64_t)batchSize;
- (int64_t)numEpochs;
- (int64_t)numLocalIterations;
- (void)setBatchSize:(int64_t)a3;
- (void)setInitializationFunctionName:(id)a3;
- (void)setInitializeManually:(id)a3;
- (void)setInputNames:(id)a3;
- (void)setLearningRate:(id)a3;
- (void)setLearningRateBufferName:(id)a3;
- (void)setLearningRateSchedule:(id)a3;
- (void)setLossName:(id)a3;
- (void)setMetricsNames:(id)a3;
- (void)setModelPath:(id)a3;
- (void)setNumEpochs:(int64_t)a3;
- (void)setNumLocalIterations:(int64_t)a3;
- (void)setOutputNames:(id)a3;
- (void)setShortenedEmbeddingMappingKeys:(id)a3;
- (void)setShortenedEmbeddingNames:(id)a3;
- (void)setShortenedEmbeddingNumberVectorsAfter:(id)a3;
- (void)setShortenedEmbeddingNumberVectorsBefore:(id)a3;
- (void)setShortenedEmbeddingSize:(id)a3;
- (void)setTrainingModeBufferName:(id)a3;
- (void)setUseCoreMLTrainer:(id)a3;
- (void)setWeightNames:(id)a3;
@end

@implementation AMDDODMLModelMetadata

- (id)initModelMetadata:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v123 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v121 = a4;
  id v120 = 0LL;
  objc_storeStrong(&v120, a5);
  id v5 = v123;
  id v123 = 0LL;
  v119.receiver = v5;
  v119.super_class = (Class)&OBJC_CLASS___AMDDODMLModelMetadata;
  v94 = -[AMDDODMLModelMetadata init](&v119, "init");
  id v123 = v94;
  objc_storeStrong(&v123, v94);
  if (!v94) {
    goto LABEL_82;
  }
  id v91 = [location[0] parameters];
  id v118 = [v91 stringValueForKey:ModelFileNameKey defaultValue:0];

  if (!v118)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSError);
    v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v120, 1LL, 0LL);
    id *v121 = v7;
    id v124 = 0LL;
    int v117 = 1;
    goto LABEL_81;
  }

  id v90 = [location[0] attachments];
  id v116 = [v90 attachmentURLsForBasename:v118];

  if ([v116 count])
  {
    if ((unint64_t)[v116 count] > 1)
    {
      v10 = objc_alloc(&OBJC_CLASS___NSError);
      v11 = -[NSError initWithDomain:code:userInfo:](v10, "initWithDomain:code:userInfo:", v120, 3LL, 0LL);
      id *v121 = v11;
      id v124 = 0LL;
      int v117 = 1;
      goto LABEL_80;
    }

    id v88 = [v116 objectAtIndexedSubscript:0];
    id v87 = [v88 path];
    objc_msgSend(v123, "setModelPath:");

    id v89 = [location[0] parameters];
    id v115 = [v89 objectForKeyedSubscript:InputNamesKey];

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v115, v12) & 1) == 0 || ![v115 count])
    {
      v13 = objc_alloc(&OBJC_CLASS___NSError);
      v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v120, 4LL, 0LL);
      id *v121 = v14;
      id v124 = 0LL;
      int v117 = 1;
LABEL_79:
      objc_storeStrong(&v115, 0LL);
      goto LABEL_80;
    }

    [v123 setInputNames:v115];
    id v86 = [location[0] parameters];
    id v114 = [v86 objectForKeyedSubscript:OutputNamesKey];

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v114, v15) & 1) == 0 || ![v114 count])
    {
      v16 = objc_alloc(&OBJC_CLASS___NSError);
      v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", v120, 5LL, 0LL);
      id *v121 = v17;
      id v124 = 0LL;
      int v117 = 1;
LABEL_78:
      objc_storeStrong(&v114, 0LL);
      goto LABEL_79;
    }

    [v123 setOutputNames:v114];
    id v85 = [location[0] parameters];
    id v113 = [v85 objectForKeyedSubscript:WeightNamesKey];

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v113, v18) & 1) == 0 || ![v113 count])
    {
      v19 = objc_alloc(&OBJC_CLASS___NSError);
      v20 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", v120, 6LL, 0LL);
      id *v121 = v20;
      id v124 = 0LL;
      int v117 = 1;
LABEL_77:
      objc_storeStrong(&v113, 0LL);
      goto LABEL_78;
    }

    [v123 setWeightNames:v113];
    id v83 = [location[0] parameters];
    uint64_t v84 = (uint64_t)[v83 unsignedIntegerValueForKey:BatchSizeKey defaultValue:1];

    uint64_t v112 = v84;
    if (v84 < 1)
    {
      v21 = objc_alloc(&OBJC_CLASS___NSError);
      v22 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", v120, 7LL, 0LL);
      id *v121 = v22;
      id v124 = 0LL;
      int v117 = 1;
      goto LABEL_77;
    }

    [v123 setBatchSize:v112];
    id v81 = [location[0] parameters];
    uint64_t v82 = (uint64_t)[v81 unsignedIntegerValueForKey:NumLocalIterationsKey defaultValue:1];

    uint64_t v111 = v82;
    if (v82 < 1)
    {
      v23 = objc_alloc(&OBJC_CLASS___NSError);
      v24 = -[NSError initWithDomain:code:userInfo:](v23, "initWithDomain:code:userInfo:", v120, 8LL, 0LL);
      id *v121 = v24;
      id v124 = 0LL;
      int v117 = 1;
      goto LABEL_77;
    }

    [v123 setNumLocalIterations:v111];
    id v78 = [location[0] parameters];
    id v79 = [v78 unsignedIntegerValueForKey:NumEpochsKey defaultValue:0];

    v110[1] = v79;
    [v123 setNumEpochs:v79];
    id v80 = [location[0] parameters];
    LODWORD(v25) = 0;
    [v80 floatValueForKey:LearningRateKey defaultValue:v25];
    v110[0] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");

    [v110[0] floatValue];
    if (v26 < 0.0)
    {
      v27 = objc_alloc(&OBJC_CLASS___NSError);
      v28 = -[NSError initWithDomain:code:userInfo:](v27, "initWithDomain:code:userInfo:", v120, 9LL, 0LL);
      id *v121 = v28;
      id v124 = 0LL;
      int v117 = 1;
LABEL_76:
      objc_storeStrong(v110, 0LL);
      goto LABEL_77;
    }

    [v123 setLearningRate:v110[0]];
    id v77 = [location[0] parameters];
    id v109 = [v77 stringValueForKey:InitFunctionNameKey defaultValue:InitFunctionDefaultName];

    if (![v109 length])
    {
      v29 = objc_alloc(&OBJC_CLASS___NSError);
      v30 = -[NSError initWithDomain:code:userInfo:](v29, "initWithDomain:code:userInfo:", v120, 10LL, 0LL);
      id *v121 = v30;
      id v124 = 0LL;
      int v117 = 1;
LABEL_75:
      objc_storeStrong(&v109, 0LL);
      goto LABEL_76;
    }

    [v123 setInitializationFunctionName:v109];
    id v76 = [location[0] parameters];
    id v108 =  [v76 stringValueForKey:TrainingModeBufferNameKey defaultValue:TrainingModeBufferDefaultName];

    if (![v108 length])
    {
      v31 = objc_alloc(&OBJC_CLASS___NSError);
      v32 = -[NSError initWithDomain:code:userInfo:](v31, "initWithDomain:code:userInfo:", v120, 11LL, 0LL);
      id *v121 = v32;
      id v124 = 0LL;
      int v117 = 1;
LABEL_74:
      objc_storeStrong(&v108, 0LL);
      goto LABEL_75;
    }

    [v123 setTrainingModeBufferName:v108];
    id v75 = [location[0] parameters];
    id v107 =  [v75 stringValueForKey:LearningRateBufferNameKey defaultValue:LearningRateBufferDefaultName];

    if (![v107 length])
    {
      v33 = objc_alloc(&OBJC_CLASS___NSError);
      v34 = -[NSError initWithDomain:code:userInfo:](v33, "initWithDomain:code:userInfo:", v120, 12LL, 0LL);
      id *v121 = v34;
      id v124 = 0LL;
      int v117 = 1;
LABEL_73:
      objc_storeStrong(&v107, 0LL);
      goto LABEL_74;
    }

    [v123 setLearningRateBufferName:v107];
    id v74 = [location[0] parameters];
    id v106 = [v74 stringValueForKey:LossNameKey defaultValue:0];

    if (!v106)
    {
      v35 = objc_alloc(&OBJC_CLASS___NSError);
      v36 = -[NSError initWithDomain:code:userInfo:](v35, "initWithDomain:code:userInfo:", v120, 18LL, 0LL);
      id *v121 = v36;
      id v124 = 0LL;
      int v117 = 1;
LABEL_72:
      objc_storeStrong(&v106, 0LL);
      goto LABEL_73;
    }

    id v72 = [v123 outputNames];
    unsigned __int8 v73 = [v72 containsObject:v106];

    if ((v73 & 1) == 0)
    {
      v37 = objc_alloc(&OBJC_CLASS___NSError);
      v38 = -[NSError initWithDomain:code:userInfo:](v37, "initWithDomain:code:userInfo:", v120, 19LL, 0LL);
      id *v121 = v38;
      id v124 = 0LL;
      int v117 = 1;
      goto LABEL_72;
    }

    [v123 setLossName:v106];
    id v71 = [location[0] parameters];
    id v105 = [v71 objectForKeyedSubscript:InitializeManually];

    if (!v105)
    {
      id v105 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 0LL);
    }

    [v123 setInitializeManually:v105];
    id v70 = [location[0] parameters];
    id v104 = [v70 objectForKeyedSubscript:UseCoreMLTrainer];

    if (!v104)
    {
      id v104 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 0LL);
    }

    [v123 setUseCoreMLTrainer:v104];
    id v69 = [location[0] parameters];
    id v103 = [v69 objectForKeyedSubscript:LearningRateScheduleKey];

    if (v103)
    {
      uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v103, v39) & 1) == 0)
      {
        v40 = objc_alloc(&OBJC_CLASS___NSError);
        v41 = -[NSError initWithDomain:code:userInfo:](v40, "initWithDomain:code:userInfo:", v120, 131LL, 0LL);
        id *v121 = v41;
        id v124 = 0LL;
        int v117 = 1;
LABEL_71:
        objc_storeStrong(&v103, 0LL);
        objc_storeStrong(&v104, 0LL);
        objc_storeStrong(&v105, 0LL);
        goto LABEL_72;
      }
    }

    if (v103)
    {
      id v68 = [v103 count];
      if (v68 != [v123 numLocalIterations])
      {
        v42 = objc_alloc(&OBJC_CLASS___NSError);
        v43 = -[NSError initWithDomain:code:userInfo:](v42, "initWithDomain:code:userInfo:", v120, 132LL, 0LL);
        id *v121 = v43;
        id v124 = 0LL;
        int v117 = 1;
        goto LABEL_71;
      }
    }

    [v123 setLearningRateSchedule:v103];
    id v63 = [location[0] parameters];
    id v102 = [v63 objectForKeyedSubscript:ShortenedEmbeddingNames];

    id v64 = [location[0] parameters];
    id v101 = [v64 objectForKeyedSubscript:ShortenedEmbeddingMappingKeys];

    id v65 = [location[0] parameters];
    id v100 = [v65 objectForKeyedSubscript:ShortenedEmbeddingSize];

    id v66 = [location[0] parameters];
    id v99 = [v66 objectForKeyedSubscript:ShortenedEmbeddingNumberVectorsBefore];

    id v67 = [location[0] parameters];
    id v98 = [v67 objectForKeyedSubscript:ShortenedEmbeddingNumberVectorsAfter];

    if (v102 || v101 || v100 || v99 || v98)
    {
      if (!v102
        || !v101
        || !v100
        || !v99
        || !v98
        || (uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v102, v46) & 1) == 0)
        || (uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v101, v47) & 1) == 0)
        || (uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v100, v48) & 1) == 0)
        || (uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v99, v49) & 1) == 0)
        || (uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v98, v50) & 1) == 0))
      {
        v44 = objc_alloc(&OBJC_CLASS___NSError);
        v45 = -[NSError initWithDomain:code:userInfo:](v44, "initWithDomain:code:userInfo:", v120, 109LL, 0LL);
        id *v121 = v45;
        id v124 = 0LL;
        int v117 = 1;
LABEL_70:
        objc_storeStrong(&v98, 0LL);
        objc_storeStrong(&v99, 0LL);
        objc_storeStrong(&v100, 0LL);
        objc_storeStrong(&v101, 0LL);
        objc_storeStrong(&v102, 0LL);
        goto LABEL_71;
      }

      [v123 setShortenedEmbeddingNames:v102];
      [v123 setShortenedEmbeddingMappingKeys:v101];
      [v123 setShortenedEmbeddingSize:v100];
      [v123 setShortenedEmbeddingNumberVectorsBefore:v99];
      [v123 setShortenedEmbeddingNumberVectorsAfter:v98];
    }

    else
    {
      v58 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      objc_msgSend(v123, "setShortenedEmbeddingNames:");

      v59 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      objc_msgSend(v123, "setShortenedEmbeddingMappingKeys:");

      v60 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      objc_msgSend(v123, "setShortenedEmbeddingSize:");

      v61 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      objc_msgSend(v123, "setShortenedEmbeddingNumberVectorsBefore:");

      v62 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
      objc_msgSend(v123, "setShortenedEmbeddingNumberVectorsAfter:");
    }

    id v57 = [location[0] parameters];
    id v97 = [v57 objectForKeyedSubscript:MetricsNamesKey];

    if (!v97 || (uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v97, v51) & 1) != 0))
    {
      id v96 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v97);
      id v95 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v114);
      if ([v96 isSubsetOfSet:v95])
      {
        [v123 setMetricsNames:v97];
        int v117 = 0;
      }

      else
      {
        v54 = objc_alloc(&OBJC_CLASS___NSError);
        v55 = -[NSError initWithDomain:code:userInfo:](v54, "initWithDomain:code:userInfo:", v120, 61LL, 0LL);
        id *v121 = v55;
        id v124 = 0LL;
        int v117 = 1;
      }

      objc_storeStrong(&v95, 0LL);
      objc_storeStrong(&v96, 0LL);
    }

    else
    {
      v52 = objc_alloc(&OBJC_CLASS___NSError);
      v53 = -[NSError initWithDomain:code:userInfo:](v52, "initWithDomain:code:userInfo:", v120, 60LL, 0LL);
      id *v121 = v53;
      id v124 = 0LL;
      int v117 = 1;
    }

    objc_storeStrong(&v97, 0LL);
    goto LABEL_70;
  }

  v8 = objc_alloc(&OBJC_CLASS___NSError);
  v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v120, 2LL, 0LL);
  id *v121 = v9;
  id v124 = 0LL;
  int v117 = 1;
LABEL_80:
  objc_storeStrong(&v116, 0LL);
LABEL_81:
  objc_storeStrong(&v118, 0LL);
  if (!v117)
  {
LABEL_82:
    id v124 = v123;
    int v117 = 1;
  }

  objc_storeStrong(&v120, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v123, 0LL);
  return v124;
}

- (NSString)modelPath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setModelPath:(id)a3
{
}

- (NSArray)inputNames
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInputNames:(id)a3
{
}

- (NSArray)outputNames
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOutputNames:(id)a3
{
}

- (NSArray)weightNames
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setWeightNames:(id)a3
{
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (NSNumber)learningRate
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLearningRate:(id)a3
{
}

- (int64_t)numLocalIterations
{
  return self->_numLocalIterations;
}

- (void)setNumLocalIterations:(int64_t)a3
{
  self->_numLocalIterations = a3;
}

- (int64_t)numEpochs
{
  return self->_numEpochs;
}

- (void)setNumEpochs:(int64_t)a3
{
  self->_numEpochs = a3;
}

- (NSString)initializationFunctionName
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setInitializationFunctionName:(id)a3
{
}

- (NSString)trainingModeBufferName
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setTrainingModeBufferName:(id)a3
{
}

- (NSString)learningRateBufferName
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setLearningRateBufferName:(id)a3
{
}

- (NSString)lossName
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLossName:(id)a3
{
}

- (NSArray)metricsNames
{
  return (NSArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setMetricsNames:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setShortenedEmbeddingNames:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingMappingKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setShortenedEmbeddingMappingKeys:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingNumberVectorsBefore
{
  return (NSDictionary *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setShortenedEmbeddingNumberVectorsBefore:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingNumberVectorsAfter
{
  return (NSDictionary *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setShortenedEmbeddingNumberVectorsAfter:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingSize
{
  return (NSDictionary *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setShortenedEmbeddingSize:(id)a3
{
}

- (NSNumber)initializeManually
{
  return (NSNumber *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setInitializeManually:(id)a3
{
}

- (NSNumber)useCoreMLTrainer
{
  return (NSNumber *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setUseCoreMLTrainer:(id)a3
{
}

- (NSArray)learningRateSchedule
{
  return (NSArray *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setLearningRateSchedule:(id)a3
{
}

- (void).cxx_destruct
{
}

@end