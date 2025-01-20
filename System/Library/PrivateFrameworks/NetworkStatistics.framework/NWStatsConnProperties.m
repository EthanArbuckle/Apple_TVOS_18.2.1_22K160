@interface NWStatsConnProperties
- (BOOL)hasNetAccess;
- (BOOL)isNonAppInitiated;
- (BOOL)isSilent;
- (BOOL)isTracker;
- (NSData)remoteAddress;
- (NSString)domainAttributedBundleId;
- (NSString)domainName;
- (NSString)domainOwner;
- (NSString)domainTrackerContext;
- (id)description;
- (unsigned)remotePort;
- (void)setDomainAttributedBundleId:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setDomainOwner:(id)a3;
- (void)setDomainTrackerContext:(id)a3;
- (void)setHasNetAccess:(BOOL)a3;
- (void)setIsNonAppInitiated:(BOOL)a3;
- (void)setIsSilent:(BOOL)a3;
- (void)setIsTracker:(BOOL)a3;
- (void)setRemoteAddress:(id)a3;
@end

@implementation NWStatsConnProperties

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"NWStatsConnProperties at %p, isTracker %d, nonAppInit %d silent %d domain %@ owner %@ tracker-context %@ attributed %@ addr %@", self, self->_isTracker, self->_isNonAppInitiated, self->_isSilent, self->_domainName, self->_domainOwner, self->_domainTrackerContext, self->_domainAttributedBundleId, self->_remoteAddress];
}

- (unsigned)remotePort
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && ((id v4 = v2, v5 = [v4 bytes], *(_BYTE *)(v5 + 1) == 2)
     || (uint64_t v5 = [v4 bytes], *(_BYTE *)(v5 + 1) == 30)))
  {
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v5 + 2)) >> 16;
  }

  else
  {
    LOWORD(v6) = 0;
  }

  return v6;
}

- (BOOL)isTracker
{
  return self->_isTracker;
}

- (void)setIsTracker:(BOOL)a3
{
  self->_isTracker = a3;
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (BOOL)isSilent
{
  return self->_isSilent;
}

- (void)setIsSilent:(BOOL)a3
{
  self->_isSilent = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)domainOwner
{
  return self->_domainOwner;
}

- (void)setDomainOwner:(id)a3
{
}

- (NSString)domainTrackerContext
{
  return self->_domainTrackerContext;
}

- (void)setDomainTrackerContext:(id)a3
{
}

- (NSString)domainAttributedBundleId
{
  return self->_domainAttributedBundleId;
}

- (void)setDomainAttributedBundleId:(id)a3
{
}

- (NSData)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
}

- (BOOL)hasNetAccess
{
  return self->_hasNetAccess;
}

- (void)setHasNetAccess:(BOOL)a3
{
  self->_hasNetAccess = a3;
}

- (void).cxx_destruct
{
}

@end