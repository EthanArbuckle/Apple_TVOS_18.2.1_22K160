@interface NSPEventsPredictorTrainingBatchProvider
- (NSArray)inputShape;
- (NSArray)targetShape;
- (NSArray)trainingData;
- (id)featuresAtIndex:(int64_t)a3;
- (id)init:(id)a3 inputShape:(id)a4 targetShape:(id)a5;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setInputShape:(id)a3;
- (void)setTargetShape:(id)a3;
- (void)setTrainingData:(id)a3;
@end

@implementation NSPEventsPredictorTrainingBatchProvider

- (id)featuresAtIndex:(int64_t)a3
{
  uint64_t v5 = nplog_obj(self, a2, a3);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 134217984;
    v31 = (const char *)a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "featureAtIndex: %ld Begin",  (uint8_t *)&v30,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_inputShape, "objectAtIndexedSubscript:", 1LL));
  unsigned int v8 = [v7 unsignedIntValue];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData prepareMLData:startAt:dataShape:]( &OBJC_CLASS___NSPCoreData,  "prepareMLData:startAt:dataShape:",  self->_trainingData,  a3,  self->_inputShape));
  if (v11)
  {
    +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v11);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSPCoreData normalizeData:](&OBJC_CLASS___NSPCoreData, "normalizeData:", v11));
    if (v14)
    {
      +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v14);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPCoreData prepareMLData:startAt:dataShape:]( &OBJC_CLASS___NSPCoreData,  "prepareMLData:startAt:dataShape:",  self->_trainingData,  v8 + a3,  self->_targetShape));
      +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData normalizeData:](&OBJC_CLASS___NSPCoreData, "normalizeData:", v15));
      if (v18)
      {
        id v19 = +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v18);
        uint64_t v22 = nplog_obj(v19, v20, v21);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          int v30 = 134217984;
          v31 = (const char *)a3;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "featureAtIndex: %ld End ",  (uint8_t *)&v30,  0xCu);
        }

        v24 = -[NSPEventsPredictorTrainingInput initWithLstm_input:sequential_TimeDistributedDense_dense_BiasAdd_true:]( objc_alloc(&OBJC_CLASS___NSPEventsPredictorTrainingInput),  "initWithLstm_input:sequential_TimeDistributedDense_dense_BiasAdd_true:",  v14,  v18);
      }

      else
      {
        uint64_t v28 = nplog_obj(0LL, v16, v17);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          int v30 = 136315138;
          v31 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "%s called with null normalizedNextEvent",  (uint8_t *)&v30,  0xCu);
        }

        v24 = 0LL;
      }
    }

    else
    {
      uint64_t v27 = nplog_obj(0LL, v12, v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v30 = 136315138;
        v31 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "%s called with null normalizedPrevEvents",  (uint8_t *)&v30,  0xCu);
      }

      v24 = 0LL;
    }
  }

  else
  {
    uint64_t v26 = nplog_obj(0LL, v9, v10);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v30 = 136315138;
      v31 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "%s called with null prevEvents",  (uint8_t *)&v30,  0xCu);
    }

    v24 = 0LL;
  }

  return v24;
}

- (id)init:(id)a3 inputShape:(id)a4 targetShape:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 count];
  id v12 = [v10 count];
  if (v11 == v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);

    if (v15 != v16)
    {
      uint64_t v20 = nplog_obj(v17, v18, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
        *(_DWORD *)buf = 138412546;
        id v42 = v22;
        __int16 v43 = 2112;
        id v44 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "The targetShape and inputShape not compatible (%@ vs %@)",  buf,  0x16u);
      }

      goto LABEL_6;
    }

    id v27 = [v8 count];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:1]);
    uint64_t v29 = [v28 unsignedIntValue] + 1;

    if (v27 != (id)v29)
    {
      v40.receiver = self;
      v40.super_class = (Class)&OBJC_CLASS___NSPEventsPredictorTrainingBatchProvider;
      v37 = -[NSPEventsPredictorTrainingBatchProvider init](&v40, "init");
      -[NSPEventsPredictorTrainingBatchProvider setTrainingData:](v37, "setTrainingData:", v8);
      -[NSPEventsPredictorTrainingBatchProvider setInputShape:](v37, "setInputShape:", v9);
      -[NSPEventsPredictorTrainingBatchProvider setTargetShape:](v37, "setTargetShape:", v10);
      v38 = (char *)[v8 count];
      v39 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:1]);
      -[NSPEventsPredictorTrainingBatchProvider setCount:]( v37,  "setCount:",  &v38[~(unint64_t)[v39 unsignedIntValue]]);

      self = v37;
      v25 = self;
      goto LABEL_7;
    }

    uint64_t v33 = nplog_obj(v30, v31, v32);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v42 = [v8 count];
      v34 = "Insufficient number of NSP events for training %lu";
      v35 = v21;
      uint32_t v36 = 12;
LABEL_13:
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
    }
  }

  else
  {
    uint64_t v24 = nplog_obj(v12, v13, v14);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      id v42 = [v9 count];
      __int16 v43 = 2048;
      id v44 = [v10 count];
      v34 = "The targetShape dimensions not same as inputShape dimensions. (%lu vs %lu)";
      v35 = v21;
      uint32_t v36 = 22;
      goto LABEL_13;
    }
  }

- (NSArray)trainingData
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTrainingData:(id)a3
{
}

- (NSArray)inputShape
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInputShape:(id)a3
{
}

- (NSArray)targetShape
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTargetShape:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end