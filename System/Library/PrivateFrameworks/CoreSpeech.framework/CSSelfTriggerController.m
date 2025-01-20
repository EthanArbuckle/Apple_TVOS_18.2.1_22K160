@interface CSSelfTriggerController
- (CSPolicy)enabledPolicyWithAVVCAudioSource;
- (CSPolicy)enabledPolicyWithTapAudioSource;
- (CSSelfTriggerController)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 avvcRefChannelAvailable:(BOOL)a5;
- (CSSelfTriggerDetector)selfTriggerWithAVVCAudioSource;
- (CSSelfTriggerDetector)selfTriggerWithTapAudioSource;
- (NSMutableArray)enabledStates;
- (OS_dispatch_queue)queue;
- (void)_handleEnabledPolicyEventForAudioSourceType:(unint64_t)a3 enabled:(BOOL)a4;
- (void)_handleEnabledStatesUpdate:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setAsset:(id)a3;
- (void)setEnabledPolicyWithAVVCAudioSource:(id)a3;
- (void)setEnabledPolicyWithTapAudioSource:(id)a3;
- (void)setEnabledStates:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSelfTriggerWithAVVCAudioSource:(id)a3;
- (void)setSelfTriggerWithTapAudioSource:(id)a3;
- (void)start;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSSelfTriggerController

- (CSSelfTriggerController)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 avvcRefChannelAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CSSelfTriggerController;
  v10 = -[CSSelfTriggerController init](&v20, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSSelfTriggerController Queue",  33LL));
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    enabledStates = v10->_enabledStates;
    v10->_enabledStates = (NSMutableArray *)v13;

    -[NSMutableArray addObject:](v10->_enabledStates, "addObject:", &__kCFBooleanFalse);
    -[NSMutableArray addObject:](v10->_enabledStates, "addObject:", &__kCFBooleanFalse);
    if (v5)
    {
      v15 = -[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]( objc_alloc(&OBJC_CLASS___CSSelfTriggerDetector),  "initWithTargetQueue:audioTapProvider:audioSourceType:",  v8,  0LL,  0LL);
      selfTriggerWithAVVCAudioSource = v10->_selfTriggerWithAVVCAudioSource;
      v10->_selfTriggerWithAVVCAudioSource = v15;
    }

    if (v9)
    {
      v17 = -[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]( objc_alloc(&OBJC_CLASS___CSSelfTriggerDetector),  "initWithTargetQueue:audioTapProvider:audioSourceType:",  v8,  v9,  1LL);
      selfTriggerWithTapAudioSource = v10->_selfTriggerWithTapAudioSource;
      v10->_selfTriggerWithTapAudioSource = v17;
    }
  }

  return v10;
}

- (void)start
{
  if (self->_selfTriggerWithAVVCAudioSource)
  {
    v3 = (CSPolicy *)objc_claimAutoreleasedReturnValue( +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicyWithAudioSourceType:]( &OBJC_CLASS___CSSelfTriggerDetectorEnabledPolicyFactory,  "selfTriggerDetectorEnabledPolicyWithAudioSourceType:",  0LL));
    enabledPolicyWithAVVCAudioSource = self->_enabledPolicyWithAVVCAudioSource;
    self->_enabledPolicyWithAVVCAudioSource = v3;

    BOOL v5 = self->_enabledPolicyWithAVVCAudioSource;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004F4E8;
    v13[3] = &unk_10022E430;
    objc_copyWeak(&v14, &location);
    -[CSPolicy setCallback:](v5, "setCallback:", v13);
    objc_destroyWeak(&v14);
  }

  if (self->_selfTriggerWithTapAudioSource)
  {
    v6 = (CSPolicy *)objc_claimAutoreleasedReturnValue( +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicyWithAudioSourceType:]( &OBJC_CLASS___CSSelfTriggerDetectorEnabledPolicyFactory,  "selfTriggerDetectorEnabledPolicyWithAudioSourceType:",  1LL));
    enabledPolicyWithTapAudioSource = self->_enabledPolicyWithTapAudioSource;
    self->_enabledPolicyWithTapAudioSource = v6;

    id v8 = self->_enabledPolicyWithTapAudioSource;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004F528;
    v11[3] = &unk_10022E430;
    objc_copyWeak(&v12, &location);
    -[CSPolicy setCallback:](v8, "setCallback:", v11);
    objc_destroyWeak(&v12);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004F568;
  v10[3] = &unk_10022F100;
  v10[4] = self;
  dispatch_async(queue, v10);
  objc_destroyWeak(&location);
}

- (void)_handleEnabledPolicyEventForAudioSourceType:(unint64_t)a3 enabled:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F398;
  block[3] = &unk_10022E458;
  BOOL v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)_handleEnabledStatesUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    enabledStates = self->_enabledStates;
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSSelfTriggerController _handleEnabledStatesUpdate:]";
    __int16 v27 = 2114;
    v28 = enabledStates;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s enabledStates : %{public}@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
  unsigned int v8 = [v7 BOOLValue];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
  unsigned int v10 = [v9 BOOLValue];

  if (!v8)
  {
    selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
    if (!v10)
    {
      -[CSSelfTriggerDetector stopAnalyzeWithCompletion:]( selfTriggerWithAVVCAudioSource,  "stopAnalyzeWithCompletion:",  0LL);
      selfTriggerWithTapAudioSource = self->_selfTriggerWithTapAudioSource;
      id v12 = 0LL;
      goto LABEL_12;
    }

    if ((id)-[CSSelfTriggerDetector currentState](selfTriggerWithAVVCAudioSource, "currentState") == (id)1
      || (id)-[CSSelfTriggerDetector currentState](self->_selfTriggerWithAVVCAudioSource, "currentState") == (id)2)
    {
      selfTriggerWithTapAudioSource = self->_selfTriggerWithAVVCAudioSource;
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      v17 = sub_10004F38C;
      v18 = &unk_10022E730;
      v19 = self;
      id v12 = &v15;
      goto LABEL_12;
    }

    id v14 = self->_selfTriggerWithTapAudioSource;
LABEL_16:
    -[CSSelfTriggerDetector startAnalyze](v14, "startAnalyze");
    goto LABEL_13;
  }

  if ((id)-[CSSelfTriggerDetector currentState](self->_selfTriggerWithTapAudioSource, "currentState") != (id)1
    && (id)-[CSSelfTriggerDetector currentState](self->_selfTriggerWithTapAudioSource, "currentState") != (id)2)
  {
    id v14 = self->_selfTriggerWithAVVCAudioSource;
    goto LABEL_16;
  }

  selfTriggerWithTapAudioSource = self->_selfTriggerWithTapAudioSource;
  objc_super v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_10004F380;
  v23 = &unk_10022E730;
  v24 = self;
  id v12 = &v20;
LABEL_12:
  -[CSSelfTriggerDetector stopAnalyzeWithCompletion:]( selfTriggerWithTapAudioSource,  "stopAnalyzeWithCompletion:",  v12,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24);
LABEL_13:
}

- (void)setAsset:(id)a3
{
  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  id v5 = a3;
  -[CSSelfTriggerDetector setAsset:](selfTriggerWithAVVCAudioSource, "setAsset:", v5);
  -[CSSelfTriggerDetector setAsset:](self->_selfTriggerWithTapAudioSource, "setAsset:", v5);
}

- (void)registerObserver:(id)a3
{
  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  id v5 = a3;
  -[CSSelfTriggerDetector registerObserver:](selfTriggerWithAVVCAudioSource, "registerObserver:", v5);
  -[CSSelfTriggerDetector registerObserver:](self->_selfTriggerWithTapAudioSource, "registerObserver:", v5);
}

- (void)unregisterObserver:(id)a3
{
  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  id v5 = a3;
  -[CSSelfTriggerDetector unregisterObserver:](selfTriggerWithAVVCAudioSource, "unregisterObserver:", v5);
  -[CSSelfTriggerDetector unregisterObserver:](self->_selfTriggerWithTapAudioSource, "unregisterObserver:", v5);
}

- (CSPolicy)enabledPolicyWithAVVCAudioSource
{
  return self->_enabledPolicyWithAVVCAudioSource;
}

- (void)setEnabledPolicyWithAVVCAudioSource:(id)a3
{
}

- (CSPolicy)enabledPolicyWithTapAudioSource
{
  return self->_enabledPolicyWithTapAudioSource;
}

- (void)setEnabledPolicyWithTapAudioSource:(id)a3
{
}

- (CSSelfTriggerDetector)selfTriggerWithAVVCAudioSource
{
  return self->_selfTriggerWithAVVCAudioSource;
}

- (void)setSelfTriggerWithAVVCAudioSource:(id)a3
{
}

- (CSSelfTriggerDetector)selfTriggerWithTapAudioSource
{
  return self->_selfTriggerWithTapAudioSource;
}

- (void)setSelfTriggerWithTapAudioSource:(id)a3
{
}

- (NSMutableArray)enabledStates
{
  return self->_enabledStates;
}

- (void)setEnabledStates:(id)a3
{
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