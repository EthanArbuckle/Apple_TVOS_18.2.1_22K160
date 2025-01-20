@interface _PBUserProfileManagerConnectedClientInfo
- (NSString)bundleIdentifier;
- (id)didUpdateGroupSessionHandler;
- (id)didUpdateHandler;
- (int)pid;
- (void)setBundleIdentifier:(id)a3;
- (void)setDidUpdateGroupSessionHandler:(id)a3;
- (void)setDidUpdateHandler:(id)a3;
- (void)setPid:(int)a3;
- (void)userProfileManager:(id)a3 didUpdateGroupRecommendationsSession:(id)a4;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation _PBUserProfileManagerConnectedClientInfo

- (void)userProfileManagerDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_PBUserProfileManagerConnectedClientInfo didUpdateHandler](self, "didUpdateHandler"));
  v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
}

- (void)userProfileManager:(id)a3 didUpdateGroupRecommendationsSession:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[_PBUserProfileManagerConnectedClientInfo didUpdateGroupSessionHandler](self, "didUpdateGroupSessionHandler"));
  v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (id)didUpdateHandler
{
  return self->_didUpdateHandler;
}

- (void)setDidUpdateHandler:(id)a3
{
}

- (id)didUpdateGroupSessionHandler
{
  return self->_didUpdateGroupSessionHandler;
}

- (void)setDidUpdateGroupSessionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end