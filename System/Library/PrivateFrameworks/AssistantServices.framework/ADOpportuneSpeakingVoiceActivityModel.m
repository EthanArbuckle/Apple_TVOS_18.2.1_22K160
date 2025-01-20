@interface ADOpportuneSpeakingVoiceActivityModel
- (ADOpportuneSpeakingVoiceActivityModel)initWithQueue:(id)a3 stateManager:(id)a4;
- (id)_detector;
- (id)modelIdentifier;
- (void)setSpeakable:(id)a3;
- (void)startWithDelegate:(id)a3;
- (void)stop;
@end

@implementation ADOpportuneSpeakingVoiceActivityModel

- (ADOpportuneSpeakingVoiceActivityModel)initWithQueue:(id)a3 stateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADOpportuneSpeakingVoiceActivityModel;
  v9 = -[ADOpportuneSpeakingVoiceActivityModel init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_stateManager, a4);
    modelIdentifier = v10->_modelIdentifier;
    v10->_modelIdentifier = (NSString *)@"Voice Activity";

    v12 = v10;
  }

  return v10;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (id)_detector
{
  detector = self->_detector;
  if (!detector)
  {
    v4 = -[ADOpportuneSpeakingModuleEdgeDetector initWithQueue:stateManager:]( objc_alloc(&OBJC_CLASS___ADOpportuneSpeakingModuleEdgeDetector),  "initWithQueue:stateManager:",  self->_queue,  self->_stateManager);
    v5 = self->_detector;
    self->_detector = v4;

    detector = self->_detector;
  }

  return detector;
}

- (void)startWithDelegate:(id)a3
{
}

- (void)setSpeakable:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  [v5 opportuneSpeakingPauseInterval];
  v15[3] = v6;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  [v5 opportuneSpeakingTimeoutInterval];
  v14[3] = v7;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100134020;
  v10[3] = &unk_1004F2AB0;
  v10[4] = self;
  id v11 = v4;
  v12 = v15;
  v13 = v14;
  id v9 = v4;
  dispatch_async(queue, v10);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
}

- (void)stop
{
  delegate = self->_delegate;
  self->_delegate = 0LL;

  detector = self->_detector;
  self->_detector = 0LL;
}

- (void).cxx_destruct
{
}

@end