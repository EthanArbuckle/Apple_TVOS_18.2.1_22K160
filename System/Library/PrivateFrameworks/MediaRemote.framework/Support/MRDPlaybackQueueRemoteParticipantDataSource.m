@interface MRDPlaybackQueueRemoteParticipantDataSource
- (MRDPlaybackQueueRemoteParticipantDataSource)initWithDelegate:(id)a3;
- (MRDPlaybackQueueRemoteParticipantDataSourceDelegate)delegate;
- (NSArray)participants;
- (OS_dispatch_queue)delegateQueue;
- (os_unfair_lock_s)lock;
- (void)setParticipants:(id)a3;
- (void)updateParticipants:(id)a3;
@end

@implementation MRDPlaybackQueueRemoteParticipantDataSource

- (MRDPlaybackQueueRemoteParticipantDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v6 = [v5 supportGroupSessionAttribution];

  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___MRDPlaybackQueueRemoteParticipantDataSource;
    v7 = -[MRDPlaybackQueueRemoteParticipantDataSource init](&v18, "init");
    v8 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeWeak((id *)&v7->_delegate, v4);
      dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
      id v11 = sub_1000F1FC8();
      v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
      dispatch_queue_t v13 = dispatch_queue_create_with_target_V2( "com.apple.amp.MediaRemote.MRDPlaybackQueueRemoteParticipantDataSource.delegateQueue",  v10,  v12);
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = (OS_dispatch_queue *)v13;

      participants = v8->_participants;
      v8->_participants = (NSArray *)&__NSArray0__struct;
    }

    self = v8;
    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (NSArray)participants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_participants;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateParticipants:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_participants, a3);
  uint64_t v7 = _MRLogForCategory(12LL, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueRemoteParticipantDataSource] Updated participants: %@",  buf,  0xCu);
  }

  os_unfair_lock_unlock(&self->_lock);
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueRemoteParticipantDataSource delegate](self, "delegate"));
  if (v9)
  {
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueRemoteParticipantDataSource delegateQueue](self, "delegateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F2300;
    block[3] = &unk_100398F40;
    id v12 = v9;
    dispatch_queue_t v13 = self;
    id v14 = v5;
    dispatch_async(v10, block);
  }
}

- (void)setParticipants:(id)a3
{
}

- (MRDPlaybackQueueRemoteParticipantDataSourceDelegate)delegate
{
  return (MRDPlaybackQueueRemoteParticipantDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
}

@end