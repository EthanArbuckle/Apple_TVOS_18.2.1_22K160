@interface APSEnvironment
+ (id)environmentForName:(id)a3;
+ (void)_loadCachedProperties;
+ (void)_saveCachedProperties;
+ (void)initialize;
- (BOOL)debugHostname;
- (BOOL)isCertificateValidated;
- (BOOL)isLoadBalanced;
- (NSString)domain;
- (NSString)hostname;
- (NSString)name;
- (NSURL)configurationURL;
- (id)description;
- (unint64_t)alternatePort;
- (unint64_t)environmentType;
- (unint64_t)hash;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (unint64_t)port;
- (unint64_t)priority;
- (void)setAlternatePort:(unint64_t)a3;
- (void)setCertificateValidated:(BOOL)a3;
- (void)setConfigurationURL:(id)a3;
- (void)setDebugHostname:(BOOL)a3;
- (void)setDomain:(id)a3;
- (void)setEnvironmentType:(unint64_t)a3;
- (void)setHostname:(id)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setLoadBalanced:(BOOL)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPort:(unint64_t)a3;
@end

@implementation APSEnvironment

+ (void)initialize
{
  p_vtable = &OBJC_CLASS___APSConnectionServer.vtable;
  v26 = objc_alloc_init(&OBJC_CLASS___APSEnvironment);
  uint64_t v3 = APSEnvironmentProduction;
  -[APSEnvironment setName:](v26, "setName:", APSEnvironmentProduction);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://init.push.apple.com/bag"));
  -[APSEnvironment setConfigurationURL:](v26, "setConfigurationURL:", v4);

  -[APSEnvironment setDomain:](v26, "setDomain:", @"push.apple.com");
  -[APSEnvironment setHostname:](v26, "setHostname:", @"courier");
  -[APSEnvironment setPort:](v26, "setPort:", 5223LL);
  -[APSEnvironment setAlternatePort:](v26, "setAlternatePort:", 443LL);
  -[APSEnvironment setCertificateValidated:](v26, "setCertificateValidated:", 1LL);
  -[APSEnvironment setLoadBalanced:](v26, "setLoadBalanced:", 1LL);
  -[APSEnvironment setEnvironmentType:](v26, "setEnvironmentType:", 0LL);
  v5 = (void *)sub_10007783C(@"APSDebugProductionHost", 1);
  if (v5)
  {
    -[APSEnvironment setDebugHostname:](v26, "setDebugHostname:", 1LL);
    -[APSEnvironment setHostname:](v26, "setHostname:", v5);
    -[APSEnvironment setLoadBalanced:](v26, "setLoadBalanced:", 0LL);
    -[APSEnvironment setCertificateValidated:](v26, "setCertificateValidated:", 0LL);
  }

  v6 = objc_alloc_init(&OBJC_CLASS___APSEnvironment);
  uint64_t v7 = APSEnvironmentDevelopment;
  -[APSEnvironment setName:](v6, "setName:", APSEnvironmentDevelopment);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://init.sandbox.push.apple.com/bag"));
  -[APSEnvironment setConfigurationURL:](v6, "setConfigurationURL:", v8);

  -[APSEnvironment setDomain:](v6, "setDomain:", @"sandbox.push.apple.com");
  -[APSEnvironment setHostname:](v6, "setHostname:", @"courier");
  -[APSEnvironment setPort:](v6, "setPort:", 5223LL);
  -[APSEnvironment setAlternatePort:](v6, "setAlternatePort:", 443LL);
  -[APSEnvironment setCertificateValidated:](v6, "setCertificateValidated:", 1LL);
  -[APSEnvironment setLoadBalanced:](v6, "setLoadBalanced:", 1LL);
  -[APSEnvironment setEnvironmentType:](v6, "setEnvironmentType:", 1LL);
  v9 = (void *)sub_10007783C(@"APSDebugSandboxHost", 1);

  if (v9)
  {
    -[APSEnvironment setDebugHostname:](v6, "setDebugHostname:", 1LL);
    -[APSEnvironment setHostname:](v6, "setHostname:", v9);
    -[APSEnvironment setLoadBalanced:](v6, "setLoadBalanced:", 0LL);
    -[APSEnvironment setCertificateValidated:](v6, "setCertificateValidated:", 0LL);
  }

  v10 = objc_alloc_init(&OBJC_CLASS___APSEnvironment);
  uint64_t v11 = APSEnvironmentQA2;
  -[APSEnvironment setName:](v10, "setName:", APSEnvironmentQA2);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://init.qa2.push.apple.com:80/bag"));
  -[APSEnvironment setConfigurationURL:](v10, "setConfigurationURL:", v12);

  -[APSEnvironment setDomain:](v10, "setDomain:", @"qa2.push.apple.com");
  -[APSEnvironment setHostname:](v10, "setHostname:", @"courier");
  -[APSEnvironment setPort:](v10, "setPort:", 5223LL);
  -[APSEnvironment setAlternatePort:](v10, "setAlternatePort:", 443LL);
  -[APSEnvironment setCertificateValidated:](v10, "setCertificateValidated:", 1LL);
  -[APSEnvironment setLoadBalanced:](v10, "setLoadBalanced:", 1LL);
  -[APSEnvironment setEnvironmentType:](v10, "setEnvironmentType:", -1LL);
  v13 = (void *)sub_10007783C(@"APSQA2Environment", 1);

  if (v13)
  {
    -[APSEnvironment setDebugHostname:](v10, "setDebugHostname:", 1LL);
    -[APSEnvironment setHostname:](v10, "setHostname:", v13);
    -[APSEnvironment setLoadBalanced:](v10, "setLoadBalanced:", 0LL);
    -[APSEnvironment setCertificateValidated:](v10, "setCertificateValidated:", 0LL);
  }

  v14 = (void *)sub_10007783C(@"APSDemoEnvironment", 1);
  v15 = v14;
  if (v14)
  {
    uint64_t v25 = v7;
    uint64_t v16 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@"."]);
    if ((unint64_t)[v15 length] < 3)
    {
      v21 = 0LL;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 1, (char *)objc_msgSend(v17, "count") - 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 componentsJoinedByString:@"."]);

      v21 = objc_alloc_init(&OBJC_CLASS___APSEnvironment);
      -[APSEnvironment setName:](v21, "setName:", APSEnvironmentDemo);
      -[APSEnvironment setDomain:](v21, "setDomain:", v20);
      -[APSEnvironment setHostname:](v21, "setHostname:", v18);
      -[APSEnvironment setPort:](v21, "setPort:", 5223LL);
      -[APSEnvironment setCertificateValidated:](v21, "setCertificateValidated:", 0LL);
      -[APSEnvironment setLoadBalanced:](v21, "setLoadBalanced:", 0LL);
      -[APSEnvironment setEnvironmentType:](v21, "setEnvironmentType:", -1LL);

      p_vtable = (void **)(&OBJC_CLASS___APSConnectionServer + 24);
    }

    uint64_t v3 = v16;
    uint64_t v7 = v25;
  }

  else
  {
    v21 = 0LL;
  }

  v22 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v23 = -[NSDictionary initWithObjectsAndKeys:]( v22,  "initWithObjectsAndKeys:",  v26,  v3,  v6,  v7,  v10,  v11,  v21,  APSEnvironmentDemo,  0LL);
  v24 = (void *)qword_10014E868;
  qword_10014E868 = (uint64_t)v23;

  [p_vtable + 157 _loadCachedProperties];
}

+ (id)environmentForName:(id)a3
{
  return [(id)qword_10014E868 objectForKey:a3];
}

+ (void)_loadCachedProperties
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)sub_10007783C(@"APSEnvironments", 1);
  id v20 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    *(void *)&__int128 v2 = 138412290LL;
    __int128 v18 = v2;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10014E868, "objectForKey:", v4, v18));
        if (v5)
        {
          v22 = i;
          uint64_t v23 = (uint64_t)v4;
          v6 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v4]);
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v7 = [v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (!v7) {
            goto LABEL_27;
          }
          id v8 = v7;
          uint64_t v9 = *(void *)v25;
          while (1)
          {
            for (j = 0LL; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v25 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
              if ([v11 isEqualToString:@"APSMessageSize"])
              {
                uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
                if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
                {
                  v5[8] = [v12 unsignedIntegerValue];
                  goto LABEL_25;
                }

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_23;
                }
              }

              else
              {
                if (![v11 isEqualToString:@"APSLargeMessageSize"])
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_25;
                  }
                  *(_DWORD *)buf = 138412546;
                  v33 = v11;
                  __int16 v34 = 2112;
                  uint64_t v35 = v23;
                  v17 = "Unknown key '%@' in environment '%@' preferences";
                  goto LABEL_24;
                }

                uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
                if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
                {
                  v5[9] = [v12 unsignedIntegerValue];
                  goto LABEL_25;
                }

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
LABEL_23:
                  *(_DWORD *)buf = 138412546;
                  v33 = v12;
                  __int16 v34 = 2112;
                  uint64_t v35 = v23;
                  v17 = "Invalid value '%@' in environment '%@' preferences";
LABEL_24:
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  v17,  buf,  0x16u);
                }
              }

+ (void)_saveCachedProperties
{
  __int128 v2 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 0LL);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = (id)qword_10014E868;
  id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10014E868 objectForKey:v7]);
        uint64_t v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
        v10 = -[NSNumber initWithUnsignedInteger:]( [NSNumber alloc],  "initWithUnsignedInteger:",  [v8 messageSize]);
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"APSMessageSize");
        uint64_t v11 = -[NSNumber initWithUnsignedInteger:]( [NSNumber alloc],  "initWithUnsignedInteger:",  [v8 largeMessageSize]);
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, @"APSLargeMessageSize");
        -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v9, v7);
      }

      id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v4);
  }

  sub_10007792C(@"APSEnvironments", v2, 1);
  sub_100077A2C(1);
}

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_messageSize != a3)
  {
    self->_messageSize = a3;
    +[APSEnvironment _saveCachedProperties](&OBJC_CLASS___APSEnvironment, "_saveCachedProperties");
  }

- (void)setLargeMessageSize:(unint64_t)a3
{
  if (self->_largeMessageSize != a3)
  {
    self->_largeMessageSize = a3;
    +[APSEnvironment _saveCachedProperties](&OBJC_CLASS___APSEnvironment, "_saveCachedProperties");
  }

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (unint64_t)priority
{
  name = self->_name;
  if (name == (NSString *)APSEnvironmentProduction) {
    return 0LL;
  }
  if (name == (NSString *)APSEnvironmentDevelopment) {
    return 1LL;
  }
  if (name == (NSString *)APSEnvironmentDemo) {
    return 2LL;
  }
  return 3LL;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p: %@>",  objc_opt_class(self, a2),  self,  self->_name);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (unint64_t)alternatePort
{
  return self->_alternatePort;
}

- (void)setAlternatePort:(unint64_t)a3
{
  self->_alternatePort = a3;
}

- (BOOL)isCertificateValidated
{
  return self->_certificateValidated;
}

- (void)setCertificateValidated:(BOOL)a3
{
  self->_certificateValidated = a3;
}

- (BOOL)isLoadBalanced
{
  return self->_loadBalanced;
}

- (void)setLoadBalanced:(BOOL)a3
{
  self->_loadBalanced = a3;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)largeMessageSize
{
  return self->_largeMessageSize;
}

- (BOOL)debugHostname
{
  return self->_debugHostname;
}

- (void)setDebugHostname:(BOOL)a3
{
  self->_debugHostname = a3;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(id)a3
{
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(unint64_t)a3
{
  self->_environmentType = a3;
}

- (void).cxx_destruct
{
}

@end