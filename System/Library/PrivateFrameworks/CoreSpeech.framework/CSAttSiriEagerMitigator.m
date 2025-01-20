@interface CSAttSiriEagerMitigator
- (CSAsset)prefetchedAsset;
- (CSAttSiriEagerMitigator)init;
- (NSString)currentRequestId;
- (OS_dispatch_queue)queue;
- (float)triggerDurationThreshold;
- (void)_attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6;
- (void)attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6;
- (void)requestEndedForId:(id)a3;
- (void)requestStartedWithId:(id)a3 forRecordContext:(id)a4;
- (void)setCurrentRequestId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTriggerDurationThreshold:(float)a3;
@end

@implementation CSAttSiriEagerMitigator

- (CSAttSiriEagerMitigator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttSiriEagerMitigator;
  v2 = -[CSAttSiriEagerMitigator init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttSiriEagerMitigator queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008A40;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestStartedWithId:(id)a3 forRecordContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000088B8;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)requestEndedForId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008874;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6
{
  id v9 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100008724;
  v12[3] = &unk_100229FE0;
  v12[4] = self;
  id v13 = v9;
  double v14 = a6;
  float v15 = a5;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (float)triggerDurationThreshold
{
  return self->_triggerDurationThreshold;
}

- (void)setTriggerDurationThreshold:(float)a3
{
  self->_triggerDurationThreshold = a3;
}

- (NSString)currentRequestId
{
  return self->_currentRequestId;
}

- (void)setCurrentRequestId:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void).cxx_destruct
{
}

- (void)_attSiriUresNode:(id)a3 tcuGeneratedForRequestId:(id)a4 withNldaScore:(float)a5 withProcessedAudioDuration:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008BC8;
  block[3] = &unk_10022A008;
  block[4] = self;
  id v16 = v11;
  id v17 = v10;
  float v19 = a5;
  double v18 = a6;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, block);
}

@end