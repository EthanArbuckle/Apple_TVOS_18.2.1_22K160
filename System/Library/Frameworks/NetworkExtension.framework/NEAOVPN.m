@interface NEAOVPN
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isAllowAllCaptiveNetworkPlugins;
- (BOOL)isAllowCaptiveWebSheet;
- (BOOL)isEnabled;
- (BOOL)isToggleEnabled;
- (NEAOVPN)initWithCoder:(id)a3;
- (NSDictionary)allowedCaptiveNetworkPlugins;
- (NSDictionary)applicationExceptions;
- (NSDictionary)interfaceProtocolMapping;
- (NSDictionary)serviceExceptions;
- (NSString)activeInterfaceProtocolKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveInterfaceProtocolKey:(id)a3;
- (void)setAllowAllCaptiveNetworkPlugins:(BOOL)a3;
- (void)setAllowCaptiveWebSheet:(BOOL)a3;
- (void)setAllowedCaptiveNetworkPlugins:(id)a3;
- (void)setApplicationExceptions:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInterfaceProtocolMapping:(id)a3;
- (void)setServiceExceptions:(id)a3;
- (void)setToggleEnabled:(BOOL)a3;
@end

@implementation NEAOVPN

- (NEAOVPN)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NEAOVPN;
  v5 = -[NEAOVPN init](&v33, sel_init);
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    v5->_toggleEnabled = [v4 decodeBoolForKey:@"ToggleEnabled"];
    v5->_allowCaptiveWebSheet = [v4 decodeBoolForKey:@"AllowCaptiveWebSheet"];
    v5->_allowAllCaptiveNetworkPlugins = [v4 decodeBoolForKey:@"AllowAllCaptiveNetworkPlugins"];
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"InterfaceProtocolMapping"];
    interfaceProtocolMapping = v5->_interfaceProtocolMapping;
    v5->_interfaceProtocolMapping = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ActiveInterfaceProtocolKey"];
    activeInterfaceProtocolKey = v5->_activeInterfaceProtocolKey;
    v5->_activeInterfaceProtocolKey = (NSString *)v12;

    v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"ServiceExceptions"];
    serviceExceptions = v5->_serviceExceptions;
    v5->_serviceExceptions = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x189604010];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"ApplicationExceptions"];
    applicationExceptions = v5->_applicationExceptions;
    v5->_applicationExceptions = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x189604010];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"AllowedCaptiveNetworkPlugins"];
    allowedCaptiveNetworkPlugins = v5->_allowedCaptiveNetworkPlugins;
    v5->_allowedCaptiveNetworkPlugins = (NSDictionary *)v30;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isEnabled](self, "isEnabled"), @"Enabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"), @"ToggleEnabled");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"),  @"AllowCaptiveWebSheet");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"),  @"AllowAllCaptiveNetworkPlugins");
  v5 = -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  [v4 encodeObject:v5 forKey:@"InterfaceProtocolMapping"];
  v6 = -[NEAOVPN activeInterfaceProtocolKey](self, "activeInterfaceProtocolKey");
  [v4 encodeObject:v6 forKey:@"ActiveInterfaceProtocolKey"];

  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"ServiceExceptions"];

  -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"ApplicationExceptions"];

  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"AllowedCaptiveNetworkPlugins"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEAOVPN init](+[NEAOVPN allocWithZone:](&OBJC_CLASS___NEAOVPN, "allocWithZone:", a3), "init");
  -[NEAOVPN setEnabled:](v4, "setEnabled:", -[NEAOVPN isEnabled](self, "isEnabled"));
  -[NEAOVPN setToggleEnabled:](v4, "setToggleEnabled:", -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"));
  -[NEAOVPN setAllowCaptiveWebSheet:]( v4,  "setAllowCaptiveWebSheet:",  -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"));
  -[NEAOVPN setAllowAllCaptiveNetworkPlugins:]( v4,  "setAllowAllCaptiveNetworkPlugins:",  -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"));
  v5 = -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  -[NEAOVPN setInterfaceProtocolMapping:](v4, "setInterfaceProtocolMapping:", v5);
  v6 = -[NEAOVPN activeInterfaceProtocolKey](self, "activeInterfaceProtocolKey");
  -[NEAOVPN setActiveInterfaceProtocolKey:](v4, "setActiveInterfaceProtocolKey:", v6);

  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setServiceExceptions:](v4, "setServiceExceptions:", v7);

  -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setApplicationExceptions:](v4, "setApplicationExceptions:", v8);

  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPN setAllowedCaptiveNetworkPlugins:](v4, "setAllowedCaptiveNetworkPlugins:", v9);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");

  if (!v5)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing interface to protocol mapping",  v4);
    goto LABEL_25;
  }

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (!v6)
  {
    LODWORD(v5) = 1;
    goto LABEL_24;
  }

  uint64_t v7 = v6;
  LODWORD(v5) = 1;
  uint64_t v8 = &off_18A087000;
  v55 = v4;
  id v56 = *(id *)v73;
  do
  {
    uint64_t v9 = 0LL;
    uint64_t v53 = v7;
    do
    {
      if (*(id *)v73 != v56) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v72 + 1) + 8 * v9);
      if ((isa_nsstring(v10) & 1) == 0)
      {
        +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid interface name in interface to protocol mapping",  v4);
        LODWORD(v5) = 0;
      }
      v11 = -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
      [v11 objectForKeyedSubscript:v10];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LODWORD(v5) = [v12 checkValidityAndCollectErrors:v4] & v5;
      }

      else
      {
        +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid protocol", v4);
        LODWORD(v5) = 0;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v13 = v12;
        [v13 IKESecurityAssociationParameters];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v14 diffieHellmanGroup] <= 13)
        {
        }

        else
        {
          [v13 childSecurityAssociationParameters];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v15 diffieHellmanGroup];

          if (v16 > 13) {
            goto LABEL_18;
          }
        }

        v17 = (void *)NSString;
        [v13 IKESecurityAssociationParameters];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v18 diffieHellmanGroup];
        [v13 childSecurityAssociationParameters];
        v20 = self;
        uint64_t v21 = v8;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v17,  "stringWithFormat:",  @"Invalid DH group (parent %ld child %ld), minimum allowed is %ld",  v19,  objc_msgSend(v22, "diffieHellmanGroup"),  14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v23, v55);

        uint64_t v8 = v21;
        self = v20;

        LODWORD(v5) = 0;
LABEL_18:

        id v4 = v55;
        uint64_t v7 = v53;
      }

      ++v9;
    }

    while (v7 != v9);
    uint64_t v7 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
  }

  while (v7);
LABEL_24:

LABEL_25:
  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    -[NEAOVPN serviceExceptions](self, "serviceExceptions");
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v57 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v69;
      do
      {
        for (uint64_t i = 0LL; i != v26; ++i)
        {
          if (*(void *)v69 != v27) {
            objc_enumerationMutation(v57);
          }
          v29 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if ((isa_nsstring(v29) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid service name for service exceptions",  v4);
            LODWORD(v5) = 0;
          }

          -[NEAOVPN serviceExceptions](self, "serviceExceptions");
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 objectForKeyedSubscript:v29];
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = [v31 checkValidityAndCollectErrors:v4] & v5;
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid service exception",  v4);
            LODWORD(v5) = 0;
          }
        }

        uint64_t v26 = [v57 countByEnumeratingWithState:&v68 objects:v78 count:16];
      }

      while (v26);
    }
  }
  v32 = -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  if (v32)
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    -[NEAOVPN applicationExceptions](self, "applicationExceptions");
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v58 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v65;
      do
      {
        for (uint64_t j = 0LL; j != v34; ++j)
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v58);
          }
          v37 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if ((isa_nsstring(v37) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid bundle identifier for application exception",  v4);
            LODWORD(v5) = 0;
          }
          v38 = -[NEAOVPN applicationExceptions](self, "applicationExceptions");
          [v38 objectForKeyedSubscript:v37];
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = [v39 checkValidityAndCollectErrors:v4] & v5;
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid application exception",  v4);
            LODWORD(v5) = 0;
          }

          uint64_t v40 = [v39 limitToProtocols];
          if (v40)
          {
            v41 = (void *)v40;
            [v39 limitToProtocols];
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v42 count])
            {
              char v43 = [v39 isLimitedToUDP];

              if ((v43 & 1) == 0)
              {
                +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid application exception LimitToProtocol specified",  v4);
                LODWORD(v5) = 0;
              }
            }

            else
            {
            }
          }
        }

        uint64_t v34 = [v58 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }

      while (v34);
    }
  }
  v44 = -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  if (v44)
  {
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
    id v59 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = [v59 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v61;
      do
      {
        for (uint64_t k = 0LL; k != v46; ++k)
        {
          if (*(void *)v61 != v47) {
            objc_enumerationMutation(v59);
          }
          v49 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          if ((isa_nsstring(v49) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid bundle identifier for allowed Captive network plugin",  v4);
            LODWORD(v5) = 0;
          }
          v50 = -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
          [v50 objectForKeyedSubscript:v49];
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v5) = [v51 checkValidityAndCollectErrors:v4] & v5;
          }

          else
          {
            +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid Captive network plugin exception",  v4);
            LODWORD(v5) = 0;
          }
        }

        uint64_t v46 = [v59 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }

      while (v46);
    }
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAOVPN isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAOVPN isToggleEnabled](self, "isToggleEnabled"),  @"toggle-enabled",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAOVPN isAllowCaptiveWebSheet](self, "isAllowCaptiveWebSheet"),  @"allow-captive-websheet",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEAOVPN isAllowAllCaptiveNetworkPlugins](self, "isAllowAllCaptiveNetworkPlugins"),  @"allow-all-captive-network-plugins",  v5,  a4);
  -[NEAOVPN interfaceProtocolMapping](self, "interfaceProtocolMapping");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"interface-to-protocol-mapping" andIndent:v5 options:a4];

  -[NEAOVPN activeInterfaceProtocolKey](self, "activeInterfaceProtocolKey");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"active-interface-protocol-key" andIndent:v5 options:a4];

  -[NEAOVPN serviceExceptions](self, "serviceExceptions");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"service-exceptions" andIndent:v5 options:a4];
  v11 = -[NEAOVPN applicationExceptions](self, "applicationExceptions");
  [v7 appendPrettyObject:v11 withName:@"application-exceptions" andIndent:v5 options:a4];

  -[NEAOVPN allowedCaptiveNetworkPlugins](self, "allowedCaptiveNetworkPlugins");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"allowed-captive-network-plugins" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isToggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)isAllowCaptiveWebSheet
{
  return self->_allowCaptiveWebSheet;
}

- (void)setAllowCaptiveWebSheet:(BOOL)a3
{
  self->_allowCaptiveWebSheet = a3;
}

- (BOOL)isAllowAllCaptiveNetworkPlugins
{
  return self->_allowAllCaptiveNetworkPlugins;
}

- (void)setAllowAllCaptiveNetworkPlugins:(BOOL)a3
{
  self->_allowAllCaptiveNetworkPlugins = a3;
}

- (NSDictionary)interfaceProtocolMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInterfaceProtocolMapping:(id)a3
{
}

- (NSString)activeInterfaceProtocolKey
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActiveInterfaceProtocolKey:(id)a3
{
}

- (NSDictionary)serviceExceptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setServiceExceptions:(id)a3
{
}

- (NSDictionary)applicationExceptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setApplicationExceptions:(id)a3
{
}

- (NSDictionary)allowedCaptiveNetworkPlugins
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAllowedCaptiveNetworkPlugins:(id)a3
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