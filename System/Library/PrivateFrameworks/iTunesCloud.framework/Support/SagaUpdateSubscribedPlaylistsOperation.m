@interface SagaUpdateSubscribedPlaylistsOperation
- (SagaUpdateSubscribedPlaylistsOperation)initWithClientIdentity:(id)a3 SubscribedPlaylistSagaIDs:(id)a4 ignoreMinRefreshInterval:(BOOL)a5 requestReason:(int64_t)a6;
- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7;
- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7 pinnedOnly:(BOOL)a8;
- (void)main;
@end

@implementation SagaUpdateSubscribedPlaylistsOperation

- (SagaUpdateSubscribedPlaylistsOperation)initWithClientIdentity:(id)a3 SubscribedPlaylistSagaIDs:(id)a4 ignoreMinRefreshInterval:(BOOL)a5 requestReason:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v13 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v12);
  v14 = -[SagaUpdateSubscribedPlaylistsOperation initWithConfiguration:clientIdentity:subscribedPlaylistSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:]( self,  "initWithConfiguration:clientIdentity:subscribedPlaylistSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:",  v13,  v11,  v10,  v7,  a6,  0LL);

  return v14;
}

- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7
{
  return -[SagaUpdateSubscribedPlaylistsOperation initWithConfiguration:clientIdentity:subscribedPlaylistSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:]( self,  "initWithConfiguration:clientIdentity:subscribedPlaylistSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:",  a3,  a4,  a5,  a6,  a7,  0LL);
}

- (SagaUpdateSubscribedPlaylistsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 subscribedPlaylistSagaIDs:(id)a5 ignoreMinRefreshInterval:(BOOL)a6 requestReason:(int64_t)a7 pinnedOnly:(BOOL)a8
{
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SagaUpdateSubscribedPlaylistsOperation;
  v15 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v19,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (v15)
  {
    id v16 = [v14 copy];
    status = (void *)v15->super._status;
    v15->super._status = (int64_t)v16;

    LOBYTE(v15->super._error) = a6;
    v15->_playlistSagaIDs = (NSArray *)a7;
    v15->_ignoreMinRefreshInterval = a8;
  }

  return v15;
}

- (void)main
{
  status = (void *)self->super._status;
  if (!status) {
    goto LABEL_4;
  }
  if ([status count])
  {
    status = (void *)self->super._status;
LABEL_4:
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"SagaUpdateSubscribedPlaylistsOperation - (saga_id count = %llu)",  [status count]));
    id v5 = [[MSVXPCTransaction alloc] initWithName:v4];
    [v5 beginTransaction];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v6 setClientIdentity:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    v9 = -[SagaSubscribedPlaylistUpdater initWithSubscribedPlaylistCloudIDs:cloudLibraryConnection:]( objc_alloc(&OBJC_CLASS___SagaSubscribedPlaylistUpdater),  "initWithSubscribedPlaylistCloudIDs:cloudLibraryConnection:",  self->super._status,  v8);
    -[SagaSubscribedPlaylistUpdater setIgnoreMinRefreshInterval:]( v9,  "setIgnoreMinRefreshInterval:",  LOBYTE(self->super._error));
    -[SagaSubscribedPlaylistUpdater setRequestReason:](v9, "setRequestReason:", self->_playlistSagaIDs);
    -[SagaSubscribedPlaylistUpdater setPinnedOnly:](v9, "setPinnedOnly:", self->_ignoreMinRefreshInterval);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    id v18 = 0LL;
    -[SagaSubscribedPlaylistUpdater performUpdateWithClientIdentity:error:]( v9,  "performUpdateWithClientIdentity:error:",  v10,  &v18);
    id v11 = v18;

    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error updating global playlists: %{public}@",  buf,  0xCu);
      }

      uint64_t v13 = 3LL;
    }

    else
    {
      uint64_t v13 = 1LL;
    }

    -[CloudLibraryOperation setStatus:](self, "setStatus:", v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v15 = MSVTCCIdentityForCurrentProcess();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v14 setClientIdentity:v16];

    [v5 endTransaction];
    return;
  }

  v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "No subscribed playlist saga ids to update.",  buf,  2u);
  }

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
}

- (void).cxx_destruct
{
}

@end