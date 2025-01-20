@interface MRDMusicHandoffSession
- (MRDMusicHandoffSession)initWithSource:(id)a3 destination:(id)a4;
- (MRPlayerPath)destinationPlayerPath;
- (MRPlayerPath)sourcePlayerPath;
- (NSString)identifier;
- (OS_dispatch_queue)notificationQueue;
- (id)description;
- (int64_t)state;
- (os_unfair_lock_s)lock;
- (void)handleEvent:(id)a3;
- (void)invalidate;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation MRDMusicHandoffSession

- (MRDMusicHandoffSession)initWithSource:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MRDMusicHandoffSession;
  v9 = -[MRDMusicHandoffSession init](&v22, "init");
  if (v9)
  {
    uint64_t v10 = MSVNanoIDCreateTaggedPointer();
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v9->_sourcePlayerPath, a3);
    objc_storeStrong((id *)&v9->_destinationPlayerPath, a4);
    v9->_state = 0LL;
    v9->_lock._os_unfair_lock_opaque = 0;
    id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.MediaRemote.MRDMusicHandoffSession-%@", v9->_identifier));
    v14 = (const char *)[v13 UTF8String];
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t Queue = MRMusicHandoffSessionGetQueue();
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(Queue);
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2(v14, v16, v18);
    notificationuint64_t Queue = v9->_notificationQueue;
    v9->_notificationuint64_t Queue = (OS_dispatch_queue *)v19;
  }

  return v9;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMusicHandoffSession identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MRDMusicHandoffSession - identifier: %@>",  v2));

  return v3;
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_state = 1LL;
  os_unfair_lock_unlock(p_lock);
  notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039400;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  self->_int64_t state = 2LL;
  os_unfair_lock_unlock(p_lock);
  if (state != 2)
  {
    notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000394E0;
    block[3] = &unk_100399250;
    block[4] = self;
    dispatch_async(notificationQueue, block);
  }

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  if (v5 == (id)1)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_int64_t state = 2LL;
    os_unfair_lock_unlock(&self->_lock);
    notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000397E8;
    v11[3] = &unk_100398E60;
    v11[4] = self;
    id v7 = &v12;
    id v12 = v4;
    id v8 = v11;
  }

  else if (v5 == (id)2)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_int64_t state = 2LL;
    os_unfair_lock_unlock(&self->_lock);
    notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10003972C;
    v13[3] = &unk_100398E60;
    v13[4] = self;
    id v7 = &v14;
    id v14 = v4;
    id v8 = v13;
  }

  else
  {
    notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000398A4;
    v9[3] = &unk_100398E60;
    v9[4] = self;
    id v7 = &v10;
    id v10 = v4;
    id v8 = v9;
  }

  dispatch_async(notificationQueue, v8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRPlayerPath)sourcePlayerPath
{
  return self->_sourcePlayerPath;
}

- (MRPlayerPath)destinationPlayerPath
{
  return self->_destinationPlayerPath;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end