@interface MRDLockScreenContentController
- (BOOL)isQuerying;
- (BOOL)lockScreenPlatterHasContent;
- (BOOL)shouldConsiderSuggestions;
- (MRDLockScreenContentControllerDelegate)delegate;
- (OS_dispatch_queue)queryQueue;
- (int64_t)suggestionCount;
- (os_unfair_lock_s)lock;
- (void)setDelegate:(id)a3;
- (void)setIsQuerying:(BOOL)a3;
- (void)setShouldConsiderSuggestions:(BOOL)a3;
- (void)setSuggestionCount:(int64_t)a3;
@end

@implementation MRDLockScreenContentController

- (BOOL)lockScreenPlatterHasContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 nowPlayingServer]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localActivePlayerClient]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playbackQueue]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentItemWithOffset:0]);
  BOOL v7 = v6 != 0LL;

  return v7;
}

- (MRDLockScreenContentControllerDelegate)delegate
{
  return (MRDLockScreenContentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)shouldConsiderSuggestions
{
  return self->_shouldConsiderSuggestions;
}

- (void)setShouldConsiderSuggestions:(BOOL)a3
{
  self->_shouldConsiderSuggestions = a3;
}

- (BOOL)isQuerying
{
  return self->_isQuerying;
}

- (void)setIsQuerying:(BOOL)a3
{
  self->_isQuerying = a3;
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (int64_t)suggestionCount
{
  return self->_suggestionCount;
}

- (void)setSuggestionCount:(int64_t)a3
{
  self->_suggestionCount = a3;
}

- (void).cxx_destruct
{
}

@end