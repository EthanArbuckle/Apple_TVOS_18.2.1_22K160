@interface MRDRemoteControlContext
- (MRDRemoteControlContext)initWithContextID:(id)a3 originatingAppDisplayID:(id)a4;
- (NSArray)routedCommands;
- (NSString)contextID;
- (NSString)originatingAppDisplayID;
- (void)addRoutedCommand:(id)a3;
- (void)clearRoutedCommands;
@end

@implementation MRDRemoteControlContext

- (MRDRemoteControlContext)initWithContextID:(id)a3 originatingAppDisplayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRDRemoteControlContext;
  v8 = -[MRDRemoteControlContext init](&v20, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    contextID = v8->_contextID;
    v8->_contextID = v9;

    v11 = (NSString *)[v7 copy];
    originatingAppDisplayID = v8->_originatingAppDisplayID;
    v8->_originatingAppDisplayID = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    routedCommands = v8->_routedCommands;
    v8->_routedCommands = v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaremote.remotecontrol.routedcommands", v16);
    commandQueue = v8->_commandQueue;
    v8->_commandQueue = (OS_dispatch_queue *)v17;
  }

  return v8;
}

- (NSArray)routedCommands
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000216F0;
  v10 = sub_100021700;
  id v11 = 0LL;
  commandQueue = (dispatch_queue_s *)self->_commandQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100021708;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(commandQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addRoutedCommand:(id)a3
{
  id v4 = a3;
  commandQueue = (dispatch_queue_s *)self->_commandQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000217BC;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(commandQueue, block);
}

- (void)clearRoutedCommands
{
  commandQueue = (dispatch_queue_s *)self->_commandQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021970;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_sync(commandQueue, block);
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSString)originatingAppDisplayID
{
  return self->_originatingAppDisplayID;
}

- (void).cxx_destruct
{
}

@end