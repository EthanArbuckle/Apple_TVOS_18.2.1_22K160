@interface OSLaunchdJobInstanceProperties
- (NSDictionary)environmentVariables;
- (NSString)sandboxProfile;
- (void)setEnvironmentVariables:(id)a3;
- (void)setSandboxProfile:(id)a3;
@end

@implementation OSLaunchdJobInstanceProperties

- (NSString)sandboxProfile
{
  return self->_sandboxProfile;
}

- (void)setSandboxProfile:(id)a3
{
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
}

- (void).cxx_destruct
{
}

@end