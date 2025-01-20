@interface MRAPRecordingEndpoint
+ (id)sharedEndpoint;
- (MRAPRecordingEndpoint)init;
- (NSArray)delegates;
- (void)_inputDeviceConnectedWithDeviceID:(unsigned int)a3;
- (void)_inputDeviceDisconnectedWithDeviceID:(unsigned int)a3;
- (void)_setupVoiceRecordingEndpoint;
- (void)_tearDownVoiceRecordingEndpoint;
- (void)_voiceDataReceivedForDeviceWithID:(unsigned int)a3 withBuffer:(void *)a4 time:(id)a5 gain:(float)a6;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeAllDelegates;
- (void)removeDelegate:(id)a3;
@end

@implementation MRAPRecordingEndpoint

+ (id)sharedEndpoint
{
  if (qword_D290 != -1) {
    dispatch_once(&qword_D290, &stru_8258);
  }
  return (id)qword_D298;
}

- (MRAPRecordingEndpoint)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRAPRecordingEndpoint;
  v2 = -[MRAPRecordingEndpoint init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_t v6 = dispatch_queue_create(Name, 0LL);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = -[NSPointerArray initWithOptions:](objc_alloc(&OBJC_CLASS___NSPointerArray), "initWithOptions:", 5LL);
    delegates = v3->_delegates;
    v3->_delegates = v8;

    -[MRAPRecordingEndpoint _setupVoiceRecordingEndpoint](v3, "_setupVoiceRecordingEndpoint");
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRAPRecordingEndpoint;
  -[MRAPRecordingEndpoint dealloc](&v3, "dealloc");
}

- (NSArray)delegates
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_4404;
  v10 = sub_4414;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_441C;
  v5[3] = &unk_8280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_45BC;
  block[3] = &unk_82A8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4644;
  block[3] = &unk_82A8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)removeAllDelegates
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_47DC;
  block[3] = &unk_82D0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)_setupVoiceRecordingEndpoint
{
  qword_D0F0 = (uint64_t)self;
  MRVirtualVoiceInputSetRecordingEndpoint(&qword_D0F0, a2);
}

- (void)_tearDownVoiceRecordingEndpoint
{
}

- (void)_inputDeviceConnectedWithDeviceID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = _MRLogForCategory(5LL, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_6160(v3, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRAPRecordingEndpoint delegates](self, "delegates"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) recordingEndpoint:self inputDeviceConnectedWithID:v3];
        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v15);
  }
}

- (void)_inputDeviceDisconnectedWithDeviceID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = _MRLogForCategory(5LL, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_61C8(v3, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRAPRecordingEndpoint delegates](self, "delegates"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) recordingEndpoint:self inputDeviceDisconnectedWithID:v3];
        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v15);
  }
}

- (void)_voiceDataReceivedForDeviceWithID:(unsigned int)a3 withBuffer:(void *)a4 time:(id)a5 gain:(float)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  uint64_t v10 = *(void *)&a3;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRAPRecordingEndpoint delegates](self, "delegates"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v12);
        }
        *(float *)&double v14 = a6;
        objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v17),  "recordingEndpoint:inputDeviceWithID:receivedAudioBuffer:withTime:gain:",  self,  v10,  a4,  var0,  var1,  v14);
        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v15);
  }
}

- (void).cxx_destruct
{
}

@end