@interface _DASPredictor
+ (id)predictorWithKnowledgeStore:(id)a3 withQueue:(id)a4;
- (OS_dispatch_queue)queue;
- (void)deviceActivityLikelihood:(id)a3;
- (void)launchLikelihoodPredictionForApp:(id)a3 withHandler:(id)a4;
- (void)pluginLikelihoodWithHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASPredictor

+ (id)predictorWithKnowledgeStore:(id)a3 withQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class(a1) predictorWithKnowledgeStore:v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (dispatch_queue_s *)v6;
  dispatch_queue_t v11 = v10;
  if (!v10)
  {
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.daspredictor", v13);
  }

  [v9 setQueue:v11];

  return v9;
}

- (void)launchLikelihoodPredictionForApp:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E08C;
  block[3] = &unk_100115448;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)pluginLikelihoodWithHandler:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E15C;
  v7[3] = &unk_100115470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deviceActivityLikelihood:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E224;
  v7[3] = &unk_100115470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end