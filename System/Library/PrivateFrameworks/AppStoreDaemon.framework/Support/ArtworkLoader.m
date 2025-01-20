@interface ArtworkLoader
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
@end

@implementation ArtworkLoader

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (-[NSURLSession isEqual:](v7->_enforcedSession, "isEqual:", v10))
  {
    enforcedSession = v7->_enforcedSession;
    v7->_enforcedSession = 0LL;
  }

  if (-[NSURLSession isEqual:](v7->_unenforcedSession, "isEqual:", v10))
  {
    unenforcedSession = v7->_unenforcedSession;
    v7->_unenforcedSession = 0LL;
  }

  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
}

@end