@interface NWTLSParameters
- (NSData)TLSSessionID;
- (NSSet)SSLCipherSuites;
- (NSUInteger)maximumSSLProtocolVersion;
- (NSUInteger)minimumSSLProtocolVersion;
- (void)setMaximumSSLProtocolVersion:(NSUInteger)maximumSSLProtocolVersion;
- (void)setMinimumSSLProtocolVersion:(NSUInteger)minimumSSLProtocolVersion;
- (void)setSSLCipherSuites:(NSSet *)SSLCipherSuites;
- (void)setTLSSessionID:(NSData *)TLSSessionID;
@end

@implementation NWTLSParameters

- (NSData)TLSSessionID
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTLSSessionID:(NSData *)TLSSessionID
{
}

- (NSSet)SSLCipherSuites
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSSLCipherSuites:(NSSet *)SSLCipherSuites
{
}

- (NSUInteger)minimumSSLProtocolVersion
{
  return self->_minimumSSLProtocolVersion;
}

- (void)setMinimumSSLProtocolVersion:(NSUInteger)minimumSSLProtocolVersion
{
  self->_minimumSSLProtocolVersion = minimumSSLProtocolVersion;
}

- (NSUInteger)maximumSSLProtocolVersion
{
  return self->_maximumSSLProtocolVersion;
}

- (void)setMaximumSSLProtocolVersion:(NSUInteger)maximumSSLProtocolVersion
{
  self->_maximumSSLProtocolVersion = maximumSSLProtocolVersion;
}

- (void).cxx_destruct
{
}

@end