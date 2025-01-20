@interface OTSOSMissingAdapter
- (BOOL)essential;
- (BOOL)joinAfterRestore:(id *)a3;
- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4;
- (BOOL)resetToOffering:(id *)a3;
- (BOOL)safariViewSyncingEnabled:(id *)a3;
- (BOOL)sosEnabled;
- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4;
- (NSString)providerID;
- (OTSOSMissingAdapter)init;
- (id)currentSOSSelf:(id *)a3;
- (id)currentState;
- (id)fetchSelfPeers:(id *)a3;
- (id)fetchTrustedPeers:(id *)a3;
- (int)circleStatus:(id *)a3;
- (void)setEssential:(BOOL)a3;
@end

@implementation OTSOSMissingAdapter

- (OTSOSMissingAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OTSOSMissingAdapter;
  v2 = -[OTSOSMissingAdapter init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    providerID = v2->_providerID;
    v2->_providerID = (NSString *)@"[OTSOSMissingAdapter]";

    v3->_essential = 0;
  }

  return v3;
}

- (BOOL)sosEnabled
{
  return 0;
}

- (int)circleStatus:(id *)a3
{
  return 1;
}

- (id)currentSOSSelf:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0LL;
}

- (id)fetchTrustedPeers:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0LL;
}

- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0;
}

- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4
{
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0;
}

- (id)fetchSelfPeers:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0LL;
}

- (id)currentState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  v4 = objc_alloc(&OBJC_CLASS___CKKSPeerProviderState);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSMissingAdapter providerID](self, "providerID"));
  objc_super v6 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:]( v4,  "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:",  v5,  -[OTSOSMissingAdapter essential](self, "essential"),  0LL,  v3,  0LL,  v3);

  return v6;
}

- (BOOL)safariViewSyncingEnabled:(id *)a3
{
  return 0;
}

- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0;
}

- (BOOL)resetToOffering:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
  }
  return 0;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (void).cxx_destruct
{
}

@end