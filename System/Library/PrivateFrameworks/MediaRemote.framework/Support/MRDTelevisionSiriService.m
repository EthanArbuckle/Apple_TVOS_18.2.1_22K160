@interface MRDTelevisionSiriService
- (MRDTelevisionSiriService)init;
- (id)_pineboardInterface;
- (void)_activateSiriWithContext:(id)a3 andBeginRecording:(BOOL)a4;
- (void)_endSiriRecordingWithContext:(id)a3;
- (void)handleClientDisconnect:(id)a3;
- (void)handleMicrophoneButtonDownFromClient:(id)a3;
- (void)handleMicrophoneButtonUpFromClient:(id)a3;
@end

@implementation MRDTelevisionSiriService

- (MRDTelevisionSiriService)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRDTelevisionSiriService;
  v2 = -[MRDTelevisionSiriService init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clientIDsToContexts = v3->_clientIDsToContexts;
    v3->_clientIDsToContexts = v10;
  }

  return v3;
}

- (void)handleMicrophoneButtonDownFromClient:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066D7C;
  block[3] = &unk_100398E60;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)handleMicrophoneButtonUpFromClient:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067108;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)handleClientDisconnect:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067384;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (id)_pineboardInterface
{
  id v2 = objc_msgSend( (id)MSVWeakLinkClass(@"PBSSystemServiceConnection", @"PineBoardServices"),  "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaRemoteServiceProxy]);

  return v4;
}

- (void)_activateSiriWithContext:(id)a3 andBeginRecording:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 pineboardContext]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTelevisionSiriService _pineboardInterface](self, "_pineboardInterface"));
  v7 = v6;
  if (v4) {
    [v6 startSiriWithContext:v8];
  }
  else {
    [v6 activateSiriWithContext:v8];
  }
}

- (void)_endSiriRecordingWithContext:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDTelevisionSiriService _pineboardInterface](self, "_pineboardInterface"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pineboardContext]);

  [v6 stopSiriWithContext:v5];
}

- (void).cxx_destruct
{
}

@end