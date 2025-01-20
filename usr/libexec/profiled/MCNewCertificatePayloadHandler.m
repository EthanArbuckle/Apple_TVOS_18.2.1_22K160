@interface MCNewCertificatePayloadHandler
- (BOOL)isSetAside;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (void)accessibility;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewCertificatePayloadHandler

- (void)setAside
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 certificatePersistentID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v3,  v4);

  self->_isSetAside = 1;
}

- (void)unsetAside
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 certificatePersistentID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v3,  v4);

  self->_isSetAside = 0;
}

- (void)remove
{
  if (!self->_isSetAside)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v5 certificatePersistentID]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v3,  v4);
  }

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  return 0LL;
}

- (void)accessibility
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  else {
    v3 = (const CFStringRef *)&kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  }
  CFStringRef v4 = *v3;

  return (void *)v4;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

@end