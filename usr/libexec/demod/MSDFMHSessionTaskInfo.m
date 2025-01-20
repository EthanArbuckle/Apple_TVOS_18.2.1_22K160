@interface MSDFMHSessionTaskInfo
- (BOOL)addAuthHeader;
- (BOOL)useBAAAuthentication;
- (NSURL)fmhURLOverride;
- (void)setFmhURLOverride:(id)a3;
- (void)setUseBAAAuthentication:(BOOL)a3;
@end

@implementation MSDFMHSessionTaskInfo

- (BOOL)addAuthHeader
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSDFMHSessionTaskInfo;
  return -[MSDHubSessionTaskInfo addAuthHeader](&v3, "addAuthHeader");
}

- (NSURL)fmhURLOverride
{
  return (NSURL *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setFmhURLOverride:(id)a3
{
}

- (BOOL)useBAAAuthentication
{
  return self->_useBAAAuthentication;
}

- (void)setUseBAAAuthentication:(BOOL)a3
{
  self->_useBAAAuthentication = a3;
}

- (void).cxx_destruct
{
}

@end