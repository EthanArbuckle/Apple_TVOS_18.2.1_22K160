@interface NEProxySettings
+ (BOOL)supportsSecureCoding;
- (BOOL)FTPEnabled;
- (BOOL)HTTPEnabled;
- (BOOL)HTTPSEnabled;
- (BOOL)RTSPEnabled;
- (BOOL)SOCKSEnabled;
- (BOOL)autoProxyConfigurationEnabled;
- (BOOL)autoProxyDiscovery;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)enabled;
- (BOOL)excludeSimpleHostnames;
- (BOOL)gopherEnabled;
- (BOOL)useForAllDomains;
- (BOOL)usePassiveFTP;
- (NEProxyServer)FTPServer;
- (NEProxyServer)HTTPSServer;
- (NEProxyServer)HTTPServer;
- (NEProxyServer)RTSPServer;
- (NEProxyServer)SOCKSServer;
- (NEProxyServer)gopherServer;
- (NEProxySettings)init;
- (NEProxySettings)initWithCoder:(id)a3;
- (NSArray)exceptionList;
- (NSArray)supplementalMatchDomains;
- (NSArray)supplementalMatchOrders;
- (NSString)proxyAutoConfigJavaScript;
- (NSURL)proxyAutoConfigURL;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)copyPasswordsFromKeychain;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoProxyConfigurationEnabled:(BOOL)autoProxyConfigurationEnabled;
- (void)setAutoProxyDiscovery:(BOOL)a3;
- (void)setExceptionList:(NSArray *)exceptionList;
- (void)setExcludeSimpleHostnames:(BOOL)excludeSimpleHostnames;
- (void)setFTPEnabled:(BOOL)a3;
- (void)setFTPServer:(id)a3;
- (void)setGopherEnabled:(BOOL)a3;
- (void)setGopherServer:(id)a3;
- (void)setHTTPEnabled:(BOOL)HTTPEnabled;
- (void)setHTTPSEnabled:(BOOL)HTTPSEnabled;
- (void)setHTTPSServer:(NEProxyServer *)HTTPSServer;
- (void)setHTTPServer:(NEProxyServer *)HTTPServer;
- (void)setProxyAutoConfigJavaScript:(id)a3;
- (void)setProxyAutoConfigURL:(id)a3;
- (void)setRTSPEnabled:(BOOL)a3;
- (void)setRTSPServer:(id)a3;
- (void)setSOCKSEnabled:(BOOL)a3;
- (void)setSOCKSServer:(id)a3;
- (void)setSupplementalMatchDomains:(id)a3;
- (void)setSupplementalMatchOrders:(id)a3;
- (void)setUsePassiveFTP:(BOOL)a3;
@end

@implementation NEProxySettings

- (NEProxySettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEProxySettings;
  result = -[NEProxySettings init](&v3, sel_init);
  if (result) {
    result->_usePassiveFTP = 1;
  }
  return result;
}

- (NEProxySettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___NEProxySettings;
  v5 = -[NEProxySettings init](&v38, sel_init);
  if (v5)
  {
    v5->_autoProxyDiscovery = [v4 decodeBoolForKey:@"AutoProxyDiscovery"];
    v5->_autoProxyConfigurationEnabled = [v4 decodeBoolForKey:@"AutoProxyConfigurationEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoConfigURL"];
    proxyAutoConfigURL = v5->_proxyAutoConfigURL;
    v5->_proxyAutoConfigURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoConfigJavaScript"];
    proxyAutoConfigJavaScript = v5->_proxyAutoConfigJavaScript;
    v5->_proxyAutoConfigJavaScript = (NSString *)v8;

    v5->_HTTPEnabled = [v4 decodeBoolForKey:@"HTTPEnabled"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTPServer"];
    HTTPServer = v5->_HTTPServer;
    v5->_HTTPServer = (NEProxyServer *)v10;

    v5->_HTTPSEnabled = [v4 decodeBoolForKey:@"HTTPSEnabled"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTPSServer"];
    HTTPSServer = v5->_HTTPSServer;
    v5->_HTTPSServer = (NEProxyServer *)v12;

    v5->_FTPEnabled = [v4 decodeBoolForKey:@"FTPEnabled"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FTPServer"];
    FTPServer = v5->_FTPServer;
    v5->_FTPServer = (NEProxyServer *)v14;

    v5->_SOCKSEnabled = [v4 decodeBoolForKey:@"SOCKSEnabled"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SOCKSServer"];
    SOCKSServer = v5->_SOCKSServer;
    v5->_SOCKSServer = (NEProxyServer *)v16;

    v5->_RTSPEnabled = [v4 decodeBoolForKey:@"RTSPEnabled"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTSPServer"];
    RTSPServer = v5->_RTSPServer;
    v5->_RTSPServer = (NEProxyServer *)v18;

    v5->_gopherEnabled = [v4 decodeBoolForKey:@"GopherEnabled"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GopherServer"];
    gopherServer = v5->_gopherServer;
    v5->_gopherServer = (NEProxyServer *)v20;

    v5->_excludeSimpleHostnames = [v4 decodeBoolForKey:@"ExcludeSimpleHostnames"];
    v22 = (void *)MEMORY[0x189604010];
    uint64_t v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"ExceptionList"];
    exceptionList = v5->_exceptionList;
    v5->_exceptionList = (NSArray *)v25;

    v5->_usePassiveFTP = [v4 decodeBoolForKey:@"UsePassiveFTP"];
    v27 = (void *)MEMORY[0x189604010];
    uint64_t v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"SupplementalMatchDomains"];
    supplementalMatchDomains = v5->_supplementalMatchDomains;
    v5->_supplementalMatchDomains = (NSArray *)v30;

    v32 = (void *)MEMORY[0x189604010];
    uint64_t v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"SupplementalMatchOrders"];
    supplementalMatchOrders = v5->_supplementalMatchOrders;
    v5->_supplementalMatchOrders = (NSArray *)v35;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"),  @"AutoProxyDiscovery");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"),  @"AutoProxyConfigurationEnabled");
  v5 = -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  [v4 encodeObject:v5 forKey:@"AutoConfigURL"];

  -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"AutoConfigJavaScript"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"), @"HTTPEnabled");
  v7 = -[NEProxySettings HTTPServer](self, "HTTPServer");
  [v4 encodeObject:v7 forKey:@"HTTPServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"), @"HTTPSEnabled");
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"HTTPSServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"), @"FTPEnabled");
  v9 = -[NEProxySettings FTPServer](self, "FTPServer");
  [v4 encodeObject:v9 forKey:@"FTPServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"), @"SOCKSEnabled");
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"SOCKSServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"), @"RTSPEnabled");
  v11 = -[NEProxySettings RTSPServer](self, "RTSPServer");
  [v4 encodeObject:v11 forKey:@"RTSPServer"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEProxySettings gopherEnabled](self, "gopherEnabled"),  @"GopherEnabled");
  -[NEProxySettings gopherServer](self, "gopherServer");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"GopherServer"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"),  @"ExcludeSimpleHostnames");
  v13 = -[NEProxySettings exceptionList](self, "exceptionList");
  [v4 encodeObject:v13 forKey:@"ExceptionList"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"),  @"UsePassiveFTP");
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"SupplementalMatchDomains"];

  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v15 forKey:@"SupplementalMatchOrders"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEProxySettings init]( +[NEProxySettings allocWithZone:](&OBJC_CLASS___NEProxySettings, "allocWithZone:", a3),  "init");
  -[NEProxySettings setAutoProxyDiscovery:]( v4,  "setAutoProxyDiscovery:",  -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"));
  -[NEProxySettings setAutoProxyConfigurationEnabled:]( v4,  "setAutoProxyConfigurationEnabled:",  -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"));
  v5 = -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  -[NEProxySettings setProxyAutoConfigURL:](v4, "setProxyAutoConfigURL:", v5);

  -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setProxyAutoConfigJavaScript:](v4, "setProxyAutoConfigJavaScript:", v6);

  -[NEProxySettings setHTTPEnabled:](v4, "setHTTPEnabled:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"));
  v7 = -[NEProxySettings HTTPServer](self, "HTTPServer");
  -[NEProxySettings setHTTPServer:](v4, "setHTTPServer:", v7);

  -[NEProxySettings setHTTPSEnabled:](v4, "setHTTPSEnabled:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"));
  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setHTTPSServer:](v4, "setHTTPSServer:", v8);

  -[NEProxySettings setFTPEnabled:](v4, "setFTPEnabled:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"));
  v9 = -[NEProxySettings FTPServer](self, "FTPServer");
  -[NEProxySettings setFTPServer:](v4, "setFTPServer:", v9);

  -[NEProxySettings setSOCKSEnabled:](v4, "setSOCKSEnabled:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"));
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setSOCKSServer:](v4, "setSOCKSServer:", v10);

  -[NEProxySettings setRTSPEnabled:](v4, "setRTSPEnabled:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"));
  v11 = -[NEProxySettings RTSPServer](self, "RTSPServer");
  -[NEProxySettings setRTSPServer:](v4, "setRTSPServer:", v11);

  -[NEProxySettings setGopherEnabled:](v4, "setGopherEnabled:", -[NEProxySettings gopherEnabled](self, "gopherEnabled"));
  -[NEProxySettings gopherServer](self, "gopherServer");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setGopherServer:](v4, "setGopherServer:", v12);

  -[NEProxySettings setExcludeSimpleHostnames:]( v4,  "setExcludeSimpleHostnames:",  -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"));
  v13 = -[NEProxySettings exceptionList](self, "exceptionList");
  -[NEProxySettings setExceptionList:](v4, "setExceptionList:", v13);

  -[NEProxySettings setUsePassiveFTP:](v4, "setUsePassiveFTP:", -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"));
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setSupplementalMatchDomains:](v4, "setSupplementalMatchDomains:", v14);

  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxySettings setSupplementalMatchOrders:](v4, "setSupplementalMatchOrders:", v15);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NEProxySettings HTTPServer](self, "HTTPServer");
  if (v5)
  {
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v6 checkValidityAndCollectErrors:v4];
  }

  else
  {
    char v7 = 1;
  }

  uint64_t v8 = -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  if (v8)
  {
    v9 = (void *)v8;
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v10 checkValidityAndCollectErrors:v4];

    v7 &= v11;
  }

  uint64_t v12 = -[NEProxySettings FTPServer](self, "FTPServer");
  if (v12)
  {
    v13 = (void *)v12;
    -[NEProxySettings FTPServer](self, "FTPServer");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = [v14 checkValidityAndCollectErrors:v4];

    v7 &= v15;
  }

  uint64_t v16 = -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  if (v16)
  {
    v17 = (void *)v16;
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v18 checkValidityAndCollectErrors:v4];

    v7 &= v19;
  }

  uint64_t v20 = -[NEProxySettings RTSPServer](self, "RTSPServer");
  if (v20)
  {
    v21 = (void *)v20;
    v22 = -[NEProxySettings RTSPServer](self, "RTSPServer");
    char v23 = [v22 checkValidityAndCollectErrors:v4];

    v7 &= v23;
  }

  uint64_t v24 = -[NEProxySettings gopherServer](self, "gopherServer");
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    v26 = -[NEProxySettings gopherServer](self, "gopherServer");
    char v27 = [v26 checkValidityAndCollectErrors:v4];

    v7 &= v27;
  }

  -[NEProxySettings exceptionList](self, "exceptionList");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v29 = -[NEProxySettings exceptionList](self, "exceptionList");
    uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v56;
      do
      {
        for (uint64_t i = 0LL; i != v31; ++i)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(v29);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v55 + 1) + 8 * i)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Non-string for proxy exception",  v4);
            char v7 = 0;
          }
        }

        uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }

      while (v31);
    }
  }
  v34 = -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  if (v34)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v52;
      do
      {
        for (uint64_t j = 0LL; j != v37; ++j)
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(v35);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v51 + 1) + 8 * j)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Non-string for proxy supplemental match domain",  v4);
            char v7 = 0;
          }
        }

        uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }

      while (v37);
    }
  }
  v40 = -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  if (v40)
  {
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    v41 = -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders", 0LL);
    uint64_t v42 = [v41 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v48;
      do
      {
        for (uint64_t k = 0LL; k != v43; ++k)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(v41);
          }
          if ((isa_nsnumber(*(void **)(*((void *)&v47 + 1) + 8 * k)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Non-number for proxy supplemental match order",  v4);
            char v7 = 0;
          }
        }

        uint64_t v43 = [v41 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }

      while (v43);
    }
  }

  return v7 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  char v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"),  @"autoProxyDiscovery",  v5,  a4 & 0xFFFFFFFFFFFFFFF7);
  a4 |= 8uLL;
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"),  @"autoProxyConfigurationEnabled",  v5,  a4);
  v9 = -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  [v9 absoluteString];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"proxyAutoConfigurationURL" andIndent:v5 options:a4];

  -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"proxyAutoConfigurationJavaScript" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"),  @"HTTPEnabled",  v5,  a4);
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"HTTPServer" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"),  @"HTTPSEnabled",  v5,  a4);
  v13 = -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  [v7 appendPrettyObject:v13 withName:@"HTTPSServer" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings FTPEnabled](self, "FTPEnabled"),  @"FTPEnabled",  v5,  v8);
  -[NEProxySettings FTPServer](self, "FTPServer");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"FTPServer" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"),  @"SOCKSEnabled",  v5,  v8);
  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v15 withName:@"SOCKSServer" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"),  @"RTSPEnabled",  v5,  v8);
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v16 withName:@"RTSPServer" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings gopherEnabled](self, "gopherEnabled"),  @"gopherEnabled",  v5,  v8);
  v17 = -[NEProxySettings gopherServer](self, "gopherServer");
  [v7 appendPrettyObject:v17 withName:@"gopherServer" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"),  @"excludeSimpleHostnames",  v5,  v8);
  -[NEProxySettings exceptionList](self, "exceptionList");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v18 withName:@"exceptionList" andIndent:v5 options:v8];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"),  @"usePassiveFTP",  v5,  v8);
  -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v19 withName:@"supplementalMatchDomains" andIndent:v5 options:a4];

  -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v20 withName:@"supplementalMatchOrders" andIndent:v5 options:a4];

  return v7;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (-[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery")) {
    id v4 = &unk_18A0CFAB0;
  }
  else {
    id v4 = &unk_18A0CFAC8;
  }
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x18960C918]];
  if (-[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled")) {
    uint64_t v5 = &unk_18A0CFAB0;
  }
  else {
    uint64_t v5 = &unk_18A0CFAC8;
  }
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960C900]];
  -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEProxySettings proxyAutoConfigURL](self, "proxyAutoConfigURL");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 absoluteString];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x18960C910]];
  }

  else
  {
    v9 = -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
    if (!v9) {
      goto LABEL_12;
    }
    -[NEProxySettings proxyAutoConfigJavaScript](self, "proxyAutoConfigJavaScript");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C908]];
  }

LABEL_12:
  if (-[NEProxySettings HTTPEnabled](self, "HTTPEnabled")) {
    uint64_t v10 = &unk_18A0CFAB0;
  }
  else {
    uint64_t v10 = &unk_18A0CFAC8;
  }
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x18960C8C0]];
  -[NEProxySettings HTTPServer](self, "HTTPServer");
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 address];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x18960C8D0]];

    uint64_t v14 = (void *)MEMORY[0x189607968];
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "port"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x18960C8C8]];
    v17 = -[NEProxySettings HTTPServer](self, "HTTPServer");
    [v17 username];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[NEProxySettings HTTPServer](self, "HTTPServer");
      char v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 username];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x18960C8F8]];
    }
  }

  if (-[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled")) {
    v21 = &unk_18A0CFAB0;
  }
  else {
    v21 = &unk_18A0CFAC8;
  }
  [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x18960C8D8]];
  v22 = -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  if (v22)
  {
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    char v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 address];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v24 forKeyedSubscript:*MEMORY[0x18960C8E8]];

    uint64_t v25 = (void *)MEMORY[0x189607968];
    v26 = -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "port"));
    char v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x18960C8E0]];

    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 username];
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[NEProxySettings HTTPSServer](self, "HTTPSServer");
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 username];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v31 forKeyedSubscript:*MEMORY[0x18960C8F0]];
    }
  }

  if (-[NEProxySettings FTPEnabled](self, "FTPEnabled")) {
    uint64_t v32 = &unk_18A0CFAB0;
  }
  else {
    uint64_t v32 = &unk_18A0CFAC8;
  }
  [v3 setObject:v32 forKeyedSubscript:*MEMORY[0x18960C870]];
  if (-[NEProxySettings usePassiveFTP](self, "usePassiveFTP")) {
    uint64_t v33 = &unk_18A0CFAB0;
  }
  else {
    uint64_t v33 = &unk_18A0CFAC8;
  }
  [v3 setObject:v33 forKeyedSubscript:*MEMORY[0x18960C878]];
  v34 = -[NEProxySettings FTPServer](self, "FTPServer");
  if (v34)
  {
    -[NEProxySettings FTPServer](self, "FTPServer");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 address];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v36 forKeyedSubscript:*MEMORY[0x18960C888]];

    uint64_t v37 = (void *)MEMORY[0x189607968];
    -[NEProxySettings FTPServer](self, "FTPServer");
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "port"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v39 forKeyedSubscript:*MEMORY[0x18960C880]];
    v40 = -[NEProxySettings FTPServer](self, "FTPServer");
    [v40 username];
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[NEProxySettings FTPServer](self, "FTPServer");
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 username];
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v43 forKeyedSubscript:*MEMORY[0x18960C890]];
    }
  }

  if (-[NEProxySettings gopherEnabled](self, "gopherEnabled")) {
    uint64_t v44 = &unk_18A0CFAB0;
  }
  else {
    uint64_t v44 = &unk_18A0CFAC8;
  }
  [v3 setObject:v44 forKeyedSubscript:*MEMORY[0x18960C8A0]];
  v45 = -[NEProxySettings gopherServer](self, "gopherServer");
  if (v45)
  {
    v46 = -[NEProxySettings gopherServer](self, "gopherServer");
    [v46 address];
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v47 forKeyedSubscript:*MEMORY[0x18960C8B0]];

    __int128 v48 = (void *)MEMORY[0x189607968];
    -[NEProxySettings gopherServer](self, "gopherServer");
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "numberWithInteger:", objc_msgSend(v49, "port"));
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v50 forKeyedSubscript:*MEMORY[0x18960C8A8]];

    -[NEProxySettings gopherServer](self, "gopherServer");
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 username];
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[NEProxySettings gopherServer](self, "gopherServer");
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue();
      [v53 username];
      __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v54 forKeyedSubscript:*MEMORY[0x18960C8B8]];
    }
  }

  if (-[NEProxySettings RTSPEnabled](self, "RTSPEnabled")) {
    __int128 v55 = &unk_18A0CFAB0;
  }
  else {
    __int128 v55 = &unk_18A0CFAC8;
  }
  [v3 setObject:v55 forKeyedSubscript:*MEMORY[0x18960C920]];
  -[NEProxySettings RTSPServer](self, "RTSPServer");
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 address];
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v58 forKeyedSubscript:*MEMORY[0x18960C930]];

    v59 = (void *)MEMORY[0x189607968];
    v60 = -[NEProxySettings RTSPServer](self, "RTSPServer");
    objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "port"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v61 forKeyedSubscript:*MEMORY[0x18960C928]];

    -[NEProxySettings RTSPServer](self, "RTSPServer");
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v62 username];
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      v64 = -[NEProxySettings RTSPServer](self, "RTSPServer");
      [v64 username];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v65 forKeyedSubscript:*MEMORY[0x18960C938]];
    }
  }

  if (-[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled")) {
    v66 = &unk_18A0CFAB0;
  }
  else {
    v66 = &unk_18A0CFAC8;
  }
  [v3 setObject:v66 forKeyedSubscript:*MEMORY[0x18960C940]];
  v67 = -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  if (v67)
  {
    v68 = -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    [v68 address];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v69 forKeyedSubscript:*MEMORY[0x18960C950]];

    v70 = (void *)MEMORY[0x189607968];
    v71 = -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    objc_msgSend(v70, "numberWithInteger:", objc_msgSend(v71, "port"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v72 forKeyedSubscript:*MEMORY[0x18960C948]];
    v73 = -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    [v73 username];
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      v75 = -[NEProxySettings SOCKSServer](self, "SOCKSServer");
      [v75 username];
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v76 forKeyedSubscript:*MEMORY[0x18960C958]];
    }
  }

  if (-[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames")) {
    v77 = &unk_18A0CFAB0;
  }
  else {
    v77 = &unk_18A0CFAC8;
  }
  [v3 setObject:v77 forKeyedSubscript:*MEMORY[0x18960C868]];
  v78 = -[NEProxySettings exceptionList](self, "exceptionList");
  if (v78)
  {
    v79 = -[NEProxySettings exceptionList](self, "exceptionList");
    [v3 setObject:v79 forKeyedSubscript:*MEMORY[0x18960C860]];
  }
  v80 = -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
  if (v80)
  {
    v81 = -[NEProxySettings supplementalMatchDomains](self, "supplementalMatchDomains");
    [v3 setObject:v81 forKeyedSubscript:*MEMORY[0x18960C960]];
  }
  v82 = -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
  if (v82)
  {
    v83 = -[NEProxySettings supplementalMatchOrders](self, "supplementalMatchOrders");
    [v3 setObject:v83 forKeyedSubscript:*MEMORY[0x18960C968]];
  }

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NEProxySettings init](self, "init");
  if (!v5) {
    goto LABEL_63;
  }
  uint64_t v6 = *MEMORY[0x18960C918];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C918]];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = isa_nsnumber(v7);

  if (v8)
  {
    [v4 objectForKeyedSubscript:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoProxyDiscovery = [v9 BOOLValue];
  }

  uint64_t v10 = *MEMORY[0x18960C900];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C900]];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = isa_nsnumber(v11);

  if (v12)
  {
    [v4 objectForKeyedSubscript:v10];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoProxyConfigurationEnabled = [v13 BOOLValue];
  }

  uint64_t v14 = *MEMORY[0x18960C910];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C910]];
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = isa_nsstring(v15);

  if (v16)
  {
    v17 = (void *)MEMORY[0x189604030];
    [v4 objectForKeyedSubscript:v14];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v17 URLWithString:v18];
    proxyAutoConfigURL = v5->_proxyAutoConfigURL;
    v5->_proxyAutoConfigURL = (NSURL *)v19;
  }

  else
  {
    uint64_t v21 = *MEMORY[0x18960C908];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C908]];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = isa_nsstring(v22);

    if (!v23) {
      goto LABEL_11;
    }
    [v4 objectForKeyedSubscript:v21];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v18 copy];
    proxyAutoConfigURL = (NSURL *)v5->_proxyAutoConfigJavaScript;
    v5->_proxyAutoConfigJavaScript = (NSString *)v24;
  }

LABEL_11:
  uint64_t v25 = *MEMORY[0x18960C8C0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8C0]];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  int v27 = isa_nsnumber(v26);

  if (v27)
  {
    [v4 objectForKeyedSubscript:v25];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_HTTPEnabled = [v28 BOOLValue];
  }

  uint64_t v29 = *MEMORY[0x18960C8D0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8D0]];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = *MEMORY[0x18960C8C8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8C8]];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  int v33 = isa_nsnumber(v32);

  if (v33)
  {
    v34 = objc_alloc(&OBJC_CLASS___NEProxyServer);
    [v4 objectForKeyedSubscript:v29];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v31];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = -[NEProxyServer initWithType:address:port:]( v34,  "initWithType:address:port:",  1,  v35,  (int)[v36 intValue]);
    HTTPServer = v5->_HTTPServer;
    v5->_HTTPServer = (NEProxyServer *)v37;

    uint64_t v39 = *MEMORY[0x18960C8F8];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C8F8]];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = isa_nsstring(v40);

    if ((_DWORD)v36)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_HTTPServer, "setAuthenticationRequired:", 1LL);
      [v4 objectForKeyedSubscript:v39];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_HTTPServer, "setUsername:", v30);
LABEL_17:
    }
  }

  uint64_t v41 = *MEMORY[0x18960C8D8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8D8]];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  int v43 = isa_nsnumber(v42);

  if (v43)
  {
    [v4 objectForKeyedSubscript:v41];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_HTTPSEnabled = [v44 BOOLValue];
  }

  uint64_t v45 = *MEMORY[0x18960C8E8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8E8]];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = *MEMORY[0x18960C8E0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8E0]];
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue();
  int v49 = isa_nsnumber(v48);

  if (v49)
  {
    __int128 v50 = objc_alloc(&OBJC_CLASS___NEProxyServer);
    [v4 objectForKeyedSubscript:v45];
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v47];
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v53 = -[NEProxyServer initWithType:address:port:]( v50,  "initWithType:address:port:",  2,  v51,  (int)[v52 intValue]);
    HTTPSServer = v5->_HTTPSServer;
    v5->_HTTPSServer = (NEProxyServer *)v53;

    uint64_t v55 = *MEMORY[0x18960C8F0];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C8F0]];
    __int128 v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = isa_nsstring(v56);

    if ((_DWORD)v52)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_HTTPSServer, "setAuthenticationRequired:", 1LL);
      [v4 objectForKeyedSubscript:v55];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_HTTPSServer, "setUsername:", v46);
LABEL_24:
    }
  }

  uint64_t v57 = *MEMORY[0x18960C870];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C870]];
  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
  int v59 = isa_nsnumber(v58);

  if (v59)
  {
    [v4 objectForKeyedSubscript:v57];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_FTPEnabled = [v60 BOOLValue];
  }

  uint64_t v61 = *MEMORY[0x18960C888];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C888]];
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v63 = *MEMORY[0x18960C880];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C880]];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  int v65 = isa_nsnumber(v64);

  if (v65)
  {
    v66 = objc_alloc(&OBJC_CLASS___NEProxyServer);
    [v4 objectForKeyedSubscript:v61];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v63];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v69 = -[NEProxyServer initWithType:address:port:]( v66,  "initWithType:address:port:",  3,  v67,  (int)[v68 intValue]);
    FTPServer = v5->_FTPServer;
    v5->_FTPServer = (NEProxyServer *)v69;

    uint64_t v71 = *MEMORY[0x18960C890];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C890]];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v68) = isa_nsstring(v72);

    if ((_DWORD)v68)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_FTPServer, "setAuthenticationRequired:", 1LL);
      [v4 objectForKeyedSubscript:v71];
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_FTPServer, "setUsername:", v62);
LABEL_31:
    }
  }

  uint64_t v73 = *MEMORY[0x18960C878];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C878]];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  int v75 = isa_nsnumber(v74);

  if (v75)
  {
    [v4 objectForKeyedSubscript:v73];
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usePassiveFTP = [v76 BOOLValue];
  }

  uint64_t v77 = *MEMORY[0x18960C8A0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8A0]];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  int v79 = isa_nsnumber(v78);

  if (v79)
  {
    [v4 objectForKeyedSubscript:v77];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_gopherEnabled = [v80 BOOLValue];
  }

  uint64_t v81 = *MEMORY[0x18960C8B0];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8B0]];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v83 = *MEMORY[0x18960C8A8];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C8A8]];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  int v85 = isa_nsnumber(v84);

  if (v85)
  {
    v86 = objc_alloc(&OBJC_CLASS___NEProxyServer);
    [v4 objectForKeyedSubscript:v81];
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v83];
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v89 = -[NEProxyServer initWithType:address:port:]( v86,  "initWithType:address:port:",  6,  v87,  (int)[v88 intValue]);
    gopherServer = v5->_gopherServer;
    v5->_gopherServer = (NEProxyServer *)v89;

    uint64_t v91 = *MEMORY[0x18960C8B8];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C8B8]];
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = isa_nsstring(v92);

    if ((_DWORD)v88)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_gopherServer, "setAuthenticationRequired:", 1LL);
      [v4 objectForKeyedSubscript:v91];
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_gopherServer, "setUsername:", v82);
LABEL_40:
    }
  }

  uint64_t v93 = *MEMORY[0x18960C920];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C920]];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  int v95 = isa_nsnumber(v94);

  if (v95)
  {
    [v4 objectForKeyedSubscript:v93];
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_RTSPEnabled = [v96 BOOLValue];
  }

  uint64_t v97 = *MEMORY[0x18960C930];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C930]];
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v99 = *MEMORY[0x18960C928];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C928]];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  int v101 = isa_nsnumber(v100);

  if (v101)
  {
    v102 = objc_alloc(&OBJC_CLASS___NEProxyServer);
    [v4 objectForKeyedSubscript:v97];
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v99];
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v105 = -[NEProxyServer initWithType:address:port:]( v102,  "initWithType:address:port:",  4,  v103,  (int)[v104 intValue]);
    RTSPServer = v5->_RTSPServer;
    v5->_RTSPServer = (NEProxyServer *)v105;

    uint64_t v107 = *MEMORY[0x18960C938];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C938]];
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v104) = isa_nsstring(v108);

    if ((_DWORD)v104)
    {
      -[NEProxyServer setAuthenticationRequired:](v5->_RTSPServer, "setAuthenticationRequired:", 1LL);
      [v4 objectForKeyedSubscript:v107];
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer setUsername:](v5->_RTSPServer, "setUsername:", v98);
LABEL_47:
    }
  }

  uint64_t v109 = *MEMORY[0x18960C940];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C940]];
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  int v111 = isa_nsnumber(v110);

  if (v111)
  {
    [v4 objectForKeyedSubscript:v109];
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_SOCKSEnabled = [v112 BOOLValue];
  }

  uint64_t v113 = *MEMORY[0x18960C950];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C950]];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v114))
  {
    uint64_t v115 = *MEMORY[0x18960C948];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C948]];
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    int v117 = isa_nsnumber(v116);

    if (!v117) {
      goto LABEL_55;
    }
    v118 = objc_alloc(&OBJC_CLASS___NEProxyServer);
    [v4 objectForKeyedSubscript:v113];
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v115];
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v121 = -[NEProxyServer initWithType:address:port:]( v118,  "initWithType:address:port:",  5,  v119,  (int)[v120 intValue]);
    SOCKSServer = v5->_SOCKSServer;
    v5->_SOCKSServer = (NEProxyServer *)v121;

    uint64_t v123 = *MEMORY[0x18960C958];
    [v4 objectForKeyedSubscript:*MEMORY[0x18960C958]];
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v120) = isa_nsstring(v124);

    if (!(_DWORD)v120) {
      goto LABEL_55;
    }
    -[NEProxyServer setAuthenticationRequired:](v5->_SOCKSServer, "setAuthenticationRequired:", 1LL);
    [v4 objectForKeyedSubscript:v123];
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxyServer setUsername:](v5->_SOCKSServer, "setUsername:", v114);
  }

LABEL_55:
  uint64_t v125 = *MEMORY[0x18960C868];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C868]];
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  int v127 = isa_nsnumber(v126);

  if (v127)
  {
    [v4 objectForKeyedSubscript:v125];
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_excludeSimpleHostnames = [v128 BOOLValue];
  }

  uint64_t v129 = *MEMORY[0x18960C860];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C860]];
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  int v131 = isa_nsarray(v130);

  if (v131)
  {
    [v4 objectForKeyedSubscript:v129];
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v133 = [v132 copy];
    exceptionList = v5->_exceptionList;
    v5->_exceptionList = (NSArray *)v133;
  }

  uint64_t v135 = *MEMORY[0x18960C960];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C960]];
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  int v137 = isa_nsarray(v136);

  if (v137)
  {
    [v4 objectForKeyedSubscript:v135];
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v139 = [v138 copy];
    supplementalMatchDomains = v5->_supplementalMatchDomains;
    v5->_supplementalMatchDomains = (NSArray *)v139;
  }

  uint64_t v141 = *MEMORY[0x18960C968];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C968]];
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  int v143 = isa_nsarray(v142);

  if (v143)
  {
    [v4 objectForKeyedSubscript:v141];
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v145 = [v144 copy];
    supplementalMatchOrders = v5->_supplementalMatchOrders;
    v5->_supplementalMatchOrders = (NSArray *)v145;
  }

- (void)copyPasswordsFromKeychain
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 authenticationRequired];

  if (v4)
  {
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)[v5 copyPassword];
    -[NEProxySettings HTTPServer](self, "HTTPServer");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setPassword:v6];
  }

  -[NEProxySettings HTTPSServer](self, "HTTPSServer");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 authenticationRequired];

  if (v9)
  {
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = (void *)[v10 copyPassword];
    -[NEProxySettings HTTPSServer](self, "HTTPSServer");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setPassword:v11];
  }
  v13 = -[NEProxySettings FTPServer](self, "FTPServer");
  int v14 = [v13 authenticationRequired];

  if (v14)
  {
    -[NEProxySettings FTPServer](self, "FTPServer");
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = (void *)[v15 copyPassword];
    v17 = -[NEProxySettings FTPServer](self, "FTPServer");
    [v17 setPassword:v16];
  }

  -[NEProxySettings RTSPServer](self, "RTSPServer");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v18 authenticationRequired];

  if (v19)
  {
    -[NEProxySettings RTSPServer](self, "RTSPServer");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = (void *)[v20 copyPassword];
    v22 = -[NEProxySettings RTSPServer](self, "RTSPServer");
    [v22 setPassword:v21];
  }

  -[NEProxySettings gopherServer](self, "gopherServer");
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = [v23 authenticationRequired];

  if (v24)
  {
    -[NEProxySettings gopherServer](self, "gopherServer");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)[v25 copyPassword];
    -[NEProxySettings gopherServer](self, "gopherServer");
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 setPassword:v26];
  }

  -[NEProxySettings SOCKSServer](self, "SOCKSServer");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  int v29 = [v28 authenticationRequired];

  if (v29)
  {
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = (void *)[v32 copyPassword];
    -[NEProxySettings SOCKSServer](self, "SOCKSServer");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setPassword:v30];
  }

- (NEProxyServer)HTTPServer
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_HTTPServer;
  objc_sync_exit(v2);

  return v3;
}

- (void)setHTTPServer:(NEProxyServer *)HTTPServer
{
  char v7 = HTTPServer;
  int v4 = self;
  objc_sync_enter(v4);
  -[NEProxyServer setType:](v7, "setType:", 1LL);
  uint64_t v5 = -[NEProxyServer copy](v7, "copy");
  uint64_t v6 = v4->_HTTPServer;
  v4->_HTTPServer = (NEProxyServer *)v5;

  objc_sync_exit(v4);
}

- (NEProxyServer)HTTPSServer
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_HTTPSServer;
  objc_sync_exit(v2);

  return v3;
}

- (void)setHTTPSServer:(NEProxyServer *)HTTPSServer
{
  char v7 = HTTPSServer;
  int v4 = self;
  objc_sync_enter(v4);
  -[NEProxyServer setType:](v7, "setType:", 2LL);
  uint64_t v5 = -[NEProxyServer copy](v7, "copy");
  uint64_t v6 = v4->_HTTPSServer;
  v4->_HTTPSServer = (NEProxyServer *)v5;

  objc_sync_exit(v4);
}

- (BOOL)enabled
{
  return -[NEProxySettings HTTPEnabled](self, "HTTPEnabled")
      || -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled")
      || -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled");
}

- (BOOL)useForAllDomains
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEProxySettings matchDomains](self, "matchDomains");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 count])
    {
      -[NEProxySettings matchDomains](self, "matchDomains");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v5 count] == 1)
      {
        -[NEProxySettings matchDomains](self, "matchDomains");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectAtIndexedSubscript:0];
        char v7 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = [v7 length] == 0;
      }

      else
      {
        BOOL v8 = 0;
      }
    }

    else
    {
      BOOL v8 = 1;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)autoProxyConfigurationEnabled
{
  return self->_autoProxyConfigurationEnabled;
}

- (void)setAutoProxyConfigurationEnabled:(BOOL)autoProxyConfigurationEnabled
{
  self->_autoProxyConfigurationEnabled = autoProxyConfigurationEnabled;
}

- (BOOL)HTTPEnabled
{
  return self->_HTTPEnabled;
}

- (void)setHTTPEnabled:(BOOL)HTTPEnabled
{
  self->_HTTPEnabled = HTTPEnabled;
}

- (BOOL)HTTPSEnabled
{
  return self->_HTTPSEnabled;
}

- (void)setHTTPSEnabled:(BOOL)HTTPSEnabled
{
  self->_HTTPSEnabled = HTTPSEnabled;
}

- (BOOL)excludeSimpleHostnames
{
  return self->_excludeSimpleHostnames;
}

- (void)setExcludeSimpleHostnames:(BOOL)excludeSimpleHostnames
{
  self->_excludeSimpleHostnames = excludeSimpleHostnames;
}

- (NSArray)exceptionList
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setExceptionList:(NSArray *)exceptionList
{
}

- (BOOL)autoProxyDiscovery
{
  return self->_autoProxyDiscovery;
}

- (void)setAutoProxyDiscovery:(BOOL)a3
{
  self->_autoProxyDiscovery = a3;
}

- (NSURL)proxyAutoConfigURL
{
  return (NSURL *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProxyAutoConfigURL:(id)a3
{
}

- (NSString)proxyAutoConfigJavaScript
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setProxyAutoConfigJavaScript:(id)a3
{
}

- (BOOL)FTPEnabled
{
  return self->_FTPEnabled;
}

- (void)setFTPEnabled:(BOOL)a3
{
  self->_FTPEnabled = a3;
}

- (NEProxyServer)FTPServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFTPServer:(id)a3
{
}

- (BOOL)SOCKSEnabled
{
  return self->_SOCKSEnabled;
}

- (void)setSOCKSEnabled:(BOOL)a3
{
  self->_SOCKSEnabled = a3;
}

- (NEProxyServer)SOCKSServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSOCKSServer:(id)a3
{
}

- (BOOL)RTSPEnabled
{
  return self->_RTSPEnabled;
}

- (void)setRTSPEnabled:(BOOL)a3
{
  self->_RTSPEnabled = a3;
}

- (NEProxyServer)RTSPServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setRTSPServer:(id)a3
{
}

- (BOOL)gopherEnabled
{
  return self->_gopherEnabled;
}

- (void)setGopherEnabled:(BOOL)a3
{
  self->_gopherEnabled = a3;
}

- (NEProxyServer)gopherServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setGopherServer:(id)a3
{
}

- (BOOL)usePassiveFTP
{
  return self->_usePassiveFTP;
}

- (void)setUsePassiveFTP:(BOOL)a3
{
  self->_usePassiveFTP = a3;
}

- (NSArray)supplementalMatchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setSupplementalMatchDomains:(id)a3
{
}

- (NSArray)supplementalMatchOrders
{
  return (NSArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSupplementalMatchOrders:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end