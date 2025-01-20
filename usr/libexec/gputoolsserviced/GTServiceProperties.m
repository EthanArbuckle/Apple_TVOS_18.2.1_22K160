@interface GTServiceProperties
+ (BOOL)supportsSecureCoding;
+ (id)protocolMethods:(id)a3;
- (GTServiceProperties)initWithCoder:(id)a3;
- (GTServiceProperties)initWithProtocol:(id)a3;
- (NSArray)protocolMethods;
- (NSString)deviceUDID;
- (NSString)protocolName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)platform;
- (unint64_t)servicePort;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setPlatform:(int)a3;
- (void)setProtocolMethods:(id)a3;
- (void)setProtocolName:(id)a3;
- (void)setServicePort:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation GTServiceProperties

+ (id)protocolMethods:(id)a3
{
  v3 = protocol_copyMethodDescriptionList((Protocol *)a3, 1, 1, &outCount);
  v4 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v5 = -[NSMutableArray initWithCapacity:](v4, "initWithCapacity:", outCount);
  if (outCount)
  {
    unint64_t v6 = 0LL;
    p_name = &v3->name;
    do
    {
      v8 = *p_name;
      p_name += 2;
      v9 = NSStringFromSelector(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[NSMutableArray addObject:](v5, "addObject:", v10);

      ++v6;
    }

    while (v6 < outCount);
  }

  free(v3);
  id v11 = -[NSMutableArray copy](v5, "copy");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTServiceProperties)initWithProtocol:(id)a3
{
  v4 = (Protocol *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTServiceProperties;
  v5 = -[GTServiceProperties init](&v13, "init");
  if (v5)
  {
    unint64_t v6 = NSStringFromProtocol(v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](&OBJC_CLASS___GTServiceProperties, "protocolMethods:", v4));
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v9;

    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = 0LL;

    v5->_platform = GTCorePlatformGet();
    v5->_version = 0LL;
  }

  return v5;
}

- (GTServiceProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___GTServiceProperties;
  v5 = -[GTServiceProperties init](&v36, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"protocolName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v7;

    uint64_t v9 = v5->_protocolName;
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        id v11 = v5->_protocolName;
        v5->_protocolName = 0LL;
      }
    }

    id v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSString) forKey:@"protocolMethods"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v13;

    v15 = v5->_protocolMethods;
    if (v15)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        v17 = v5->_protocolMethods;
        id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v33;
          while (2)
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v33 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
              uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
              {
                v24 = v5->_protocolMethods;
                v5->_protocolMethods = 0LL;

                goto LABEL_18;
              }
            }

            id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
            if (v19) {
              continue;
            }
            break;
          }
        }
      }

      else
      {
        v17 = v5->_protocolMethods;
        v5->_protocolMethods = 0LL;
      }

- (void)encodeWithCoder:(id)a3
{
  protocolName = self->_protocolName;
  id v5 = a3;
  [v5 encodeObject:protocolName forKey:@"protocolName"];
  [v5 encodeObject:self->_protocolMethods forKey:@"protocolMethods"];
  [v5 encodeInt64:self->_servicePort forKey:@"servicePort"];
  [v5 encodeInt64:self->_platform forKey:@"platform"];
  [v5 encodeObject:self->_deviceUDID forKey:@"deviceUDID"];
  [v5 encodeInt64:self->_version forKey:@"version"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___GTServiceProperties);
  -[GTServiceProperties setProtocolName:](v4, "setProtocolName:", self->_protocolName);
  id v5 = -[NSArray initWithArray:copyItems:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithArray:copyItems:",  self->_protocolMethods,  1LL);
  -[GTServiceProperties setProtocolMethods:](v4, "setProtocolMethods:", v5);

  -[GTServiceProperties setServicePort:](v4, "setServicePort:", self->_servicePort);
  -[GTServiceProperties setPlatform:](v4, "setPlatform:", self->_platform);
  -[GTServiceProperties setDeviceUDID:](v4, "setDeviceUDID:", self->_deviceUDID);
  -[GTServiceProperties setVersion:](v4, "setVersion:", self->_version);
  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: protocolName=%@ protocolMethods=%@ servicePort=%llu platform=%u deviceUDID=%@ version=%llu>",  v5,  self->_protocolName,  self->_protocolMethods,  self->_servicePort,  self->_platform,  self->_deviceUDID,  self->_version));

  return v6;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
}

- (NSArray)protocolMethods
{
  return self->_protocolMethods;
}

- (void)setProtocolMethods:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (unint64_t)servicePort
{
  return self->_servicePort;
}

- (void)setServicePort:(unint64_t)a3
{
  self->_servicePort = a3;
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_platform = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
}

@end