@interface NSPEventsPredictor
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (NSPEventsPredictor)init;
- (NSPEventsPredictor)initWithConfiguration:(id)a3 error:(id *)a4;
- (NSPEventsPredictor)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NSPEventsPredictor)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (NSPEventsPredictor)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromLstm_input:(id)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation NSPEventsPredictor

+ (id)URLOfModelInThisBundle
{
  v2 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathForResource:@"NSPEventsPredictor" ofType:@"mlmodelc"]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not load NSPEventsPredictor.mlmodelc in the bundle resource",  v7,  2u);
    }

    v5 = 0LL;
  }

  return v5;
}

- (NSPEventsPredictor)initWithMLModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSPEventsPredictor;
  v6 = -[NSPEventsPredictor init](&v10, "init");
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model)) {
    v8 = v7;
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (NSPEventsPredictor)init
{
  id v3 = [(id)objc_opt_class(self) URLOfModelInThisBundle];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[NSPEventsPredictor initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0LL);

  return v5;
}

- (NSPEventsPredictor)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class(self) URLOfModelInThisBundle];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]( self,  "initWithContentsOfURL:configuration:error:",  v8,  v6,  a4);

  return v9;
}

- (NSPEventsPredictor)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLModel modelWithContentsOfURL:error:]( &OBJC_CLASS___MLModel,  "modelWithContentsOfURL:error:",  a3,  a4));
  if (v5)
  {
    self = -[NSPEventsPredictor initWithMLModel:](self, "initWithMLModel:", v5);
    id v6 = self;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (NSPEventsPredictor)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MLModel modelWithContentsOfURL:configuration:error:]( &OBJC_CLASS___MLModel,  "modelWithContentsOfURL:configuration:error:",  a3,  a4,  a5));
  if (v6)
  {
    self = -[NSPEventsPredictor initWithMLModel:](self, "initWithMLModel:", v6);
    id v7 = self;
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 URLOfModelInThisBundle]);
  [a1 loadContentsOfURL:v8 configuration:v7 completionHandler:v6];
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003E570;
  v8[3] = &unk_1000F9D18;
  id v9 = a5;
  id v7 = v9;
  +[MLModel loadContentsOfURL:configuration:completionHandler:]( &OBJC_CLASS___MLModel,  "loadContentsOfURL:configuration:completionHandler:",  a3,  a4,  v8);
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___MLPredictionOptions);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSPEventsPredictor predictionFromFeatures:options:error:]( self,  "predictionFromFeatures:options:error:",  v6,  v7,  a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 predictionFromFeatures:v9 options:v8 error:a5]);

  if (v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___NSPEventsPredictorOutput);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 featureValueForName:@"Identity"]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 multiArrayValue]);
    v15 = -[NSPEventsPredictorOutput initWithIdentity:](v12, "initWithIdentity:", v14);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (id)predictionFromLstm_input:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[NSPEventsPredictorInput initWithLstm_input:]( objc_alloc(&OBJC_CLASS___NSPEventsPredictorInput),  "initWithLstm_input:",  v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v7, a4));
  return v8;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = -[MLArrayBatchProvider initWithFeatureProviderArray:]( objc_alloc(&OBJC_CLASS___MLArrayBatchProvider),  "initWithFeatureProviderArray:",  v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 predictionsFromBatch:v10 options:v9 error:a5]);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
    if ((uint64_t)[v12 count] >= 1)
    {
      id v21 = v9;
      id v22 = v8;
      uint64_t v14 = 0LL;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featuresAtIndex:", v14, v21, v22));
        v16 = objc_alloc(&OBJC_CLASS___NSPEventsPredictorOutput);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 featureValueForName:@"Identity"]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 multiArrayValue]);
        v19 = -[NSPEventsPredictorOutput initWithIdentity:](v16, "initWithIdentity:", v18);

        [v13 addObject:v19];
        ++v14;
      }

      while (v14 < (uint64_t)[v12 count]);
      id v9 = v21;
      id v8 = v22;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end