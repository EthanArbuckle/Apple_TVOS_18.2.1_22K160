@interface RBBundleProperties
- (BOOL)continuousBackgroundMode;
- (BOOL)hasPreferredJetsamBand;
- (BOOL)isExtension;
- (BOOL)supportsBackgroundAudio;
- (BOOL)supportsBackgroundContentFetching;
- (BOOL)supportsBackgroundNetworkAuthentication;
- (BOOL)supportsUnboundedTaskCompletion;
- (BOOL)usesSocketMonitoring;
- (NSDictionary)environmentVariables;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)containerOverrideIdentifier;
- (NSString)debugDescription;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSURL)dataContainerURL;
- (RBBundleProperties)initWithLSProvider:(id)a3 xpcProvider:(id)a4 processIdentity:(id)a5 processIdentifier:(id)a6;
- (id)_bundleProperties;
- (id)_lsBundleProperties;
- (id)_xpcBundleProperties;
- (id)bundleInfoValuesForKeys:(id)a3;
- (int)platform;
- (int)preferredJetsamBand;
@end

@implementation RBBundleProperties

- (RBBundleProperties)initWithLSProvider:(id)a3 xpcProvider:(id)a4 processIdentity:(id)a5 processIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 && ([v13 isAnonymous] & 1) != 0)
  {
    v15 = 0LL;
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___RBBundleProperties;
    v16 = -[RBBundleProperties init](&v19, sel_init);
    p_isa = (id *)&v16->super.isa;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_lsProvider, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 3, a6);
    }

    self = p_isa;
    v15 = self;
  }

  return v15;
}

- (id)_bundleProperties
{
  if (a1)
  {
    if (*(void *)(a1 + 24)) {
      -[RBBundleProperties _xpcBundleProperties]((id *)a1);
    }
    else {
    a1 = -[RBBundleProperties _lsBundleProperties]((id *)a1);
    }
  }

  return (id)a1;
}

- (id)_xpcBundleProperties
{
  if (a1)
  {
    v1 = a1;
    id v2 = a1[6];
    if (!v2)
    {
      if (a1[3])
      {
        uint64_t v3 = objc_msgSend(a1[2], "propertiesForIdentifier:");
        id v4 = v1[6];
        v1[6] = (id)v3;

        id v2 = v1[6];
      }

      else
      {
        id v2 = 0LL;
      }
    }

    a1 = (id *)v2;
  }

  return a1;
}

- (id)_lsBundleProperties
{
  if (a1)
  {
    v1 = a1;
    id v2 = a1[5];
    if (!v2)
    {
      if (a1[4])
      {
        uint64_t v3 = objc_msgSend(a1[1], "propertiesForIdentity:");
        id v4 = v1[5];
        v1[5] = (id)v3;

        id v2 = v1[5];
      }

      else
      {
        id v2 = 0LL;
      }
    }

    a1 = (id *)v2;
  }

  return a1;
}

- (NSString)bundleIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 bundleIdentifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundlePath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 bundlePath];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)executablePath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 executablePath];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)extensionPointIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 extensionPointIdentifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsBackgroundContentFetching
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 supportsBackgroundContentFetching];

  return v3;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 supportsBackgroundNetworkAuthentication];

  return v3;
}

- (BOOL)supportsBackgroundAudio
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 supportsBackgroundAudio];

  return v3;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 supportsUnboundedTaskCompletion];

  return v3;
}

- (BOOL)usesSocketMonitoring
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 usesSocketMonitoring];

  return v3;
}

- (BOOL)continuousBackgroundMode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 continuousBackgroundMode];

  return v3;
}

- (BOOL)hasPreferredJetsamBand
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 hasPreferredJetsamBand];

  return v3;
}

- (BOOL)isExtension
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (int)platform
{
  return -[RBSProcessIdentity platform](self->_processIdentity, "platform");
}

- (int)preferredJetsamBand
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 preferredJetsamBand];

  return v3;
}

- (NSURL)dataContainerURL
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 dataContainerURL];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)containerOverrideIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 containerOverrideIdentifier];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)environmentVariables
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 environmentVariables];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id v4 = a3;
  v5 = -[RBBundleProperties _bundleProperties]((uint64_t)self);
  [v5 bundleInfoValuesForKeys:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v3 initWithFormat:@"<%@| lsBundleProperties:%@ xpcBundleProperties:%@ processIdentity:%@ processIdentifier:%@>", v4, self->_lsBundleProperties, self->_xpcBundleProperties, self->_processIdentity, self->_processIdentifier];

  return (NSString *)v5;
}

- (void).cxx_destruct
{
}

@end