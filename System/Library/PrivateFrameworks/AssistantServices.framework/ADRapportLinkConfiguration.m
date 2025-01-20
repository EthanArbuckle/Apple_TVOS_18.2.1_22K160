@interface ADRapportLinkConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkConfiguration)init;
- (ADRapportLinkConfiguration)initWithBuilder:(id)a3;
- (ADRapportLinkConfiguration)initWithCoder:(id)a3;
- (ADRapportLinkConfiguration)initWithDiscoveryOptions:(id)a3 transportOptions:(id)a4 connectionOptions:(id)a5 enablesProximityTracking:(int64_t)a6;
- (ADRapportLinkConnectionOptions)connectionOptions;
- (ADRapportLinkDiscoveryOptions)discoveryOptions;
- (ADRapportLinkTransportOptions)transportOptions;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)enablesProximityTracking;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkConfiguration

- (ADRapportLinkConfiguration)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADRapportLinkConfigurationMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADRapportLinkConfiguration;
  v5 = -[ADRapportLinkConfiguration init](&v18, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADRapportLinkConfigurationMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkConfigurationMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADRapportLinkConfigurationMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportLinkConfigurationMutation getDiscoveryOptions](v7, "getDiscoveryOptions"));
      v9 = (ADRapportLinkDiscoveryOptions *)[v8 copy];
      discoveryOptions = v6->_discoveryOptions;
      v6->_discoveryOptions = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportLinkConfigurationMutation getTransportOptions](v7, "getTransportOptions"));
      v12 = (ADRapportLinkTransportOptions *)[v11 copy];
      transportOptions = v6->_transportOptions;
      v6->_transportOptions = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportLinkConfigurationMutation getConnectionOptions](v7, "getConnectionOptions"));
      v15 = (ADRapportLinkConnectionOptions *)[v14 copy];
      connectionOptions = v6->_connectionOptions;
      v6->_connectionOptions = v15;

      v6->_enablesProximityTracking = -[_ADRapportLinkConfigurationMutation getEnablesProximityTracking]( v7,  "getEnablesProximityTracking");
    }
  }

  return v6;
}

- (ADRapportLinkConfiguration)init
{
  return -[ADRapportLinkConfiguration initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADRapportLinkConfiguration)initWithDiscoveryOptions:(id)a3 transportOptions:(id)a4 connectionOptions:(id)a5 enablesProximityTracking:(int64_t)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001A0CEC;
  v15[3] = &unk_1004F4B68;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  int64_t v19 = a6;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  v13 = -[ADRapportLinkConfiguration initWithBuilder:](self, "initWithBuilder:", v15);

  return v13;
}

- (id)description
{
  return -[ADRapportLinkConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkConfiguration;
  id v5 = -[ADRapportLinkConfiguration description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {discoveryOptions = %@, transportOptions = %@, connectionOptions = %@, enablesProximityTracking = %lld}",  v6,  self->_discoveryOptions,  self->_transportOptions,  self->_connectionOptions,  self->_enablesProximityTracking);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = -[ADRapportLinkDiscoveryOptions hash](self->_discoveryOptions, "hash");
  unint64_t v4 = -[ADRapportLinkTransportOptions hash](self->_transportOptions, "hash") ^ v3;
  unint64_t v5 = v4 ^ -[ADRapportLinkConnectionOptions hash](self->_connectionOptions, "hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_enablesProximityTracking));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADRapportLinkConfiguration *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADRapportLinkConfiguration);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      id enablesProximityTracking = (id)self->_enablesProximityTracking;
      if (enablesProximityTracking == (id)-[ADRapportLinkConfiguration enablesProximityTracking]( v6,  "enablesProximityTracking"))
      {
        v8 = (ADRapportLinkDiscoveryOptions *)objc_claimAutoreleasedReturnValue(-[ADRapportLinkConfiguration discoveryOptions](v6, "discoveryOptions"));
        discoveryOptions = self->_discoveryOptions;
        if (discoveryOptions == v8 || -[ADRapportLinkDiscoveryOptions isEqual:](discoveryOptions, "isEqual:", v8))
        {
          id v10 = (ADRapportLinkTransportOptions *)objc_claimAutoreleasedReturnValue( -[ADRapportLinkConfiguration transportOptions]( v6,  "transportOptions"));
          transportOptions = self->_transportOptions;
          if (transportOptions == v10 || -[ADRapportLinkTransportOptions isEqual:](transportOptions, "isEqual:", v10))
          {
            id v12 = (ADRapportLinkConnectionOptions *)objc_claimAutoreleasedReturnValue( -[ADRapportLinkConfiguration connectionOptions]( v6,  "connectionOptions"));
            connectionOptions = self->_connectionOptions;
            BOOL v14 = connectionOptions == v12
               || -[ADRapportLinkConnectionOptions isEqual:](connectionOptions, "isEqual:", v12);
          }

          else
          {
            BOOL v14 = 0;
          }
        }

        else
        {
          BOOL v14 = 0;
        }
      }

      else
      {
        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (ADRapportLinkConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ADRapportLinkDiscoveryOptions) forKey:@"ADRapportLinkConfiguration::discoveryOptions"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(ADRapportLinkTransportOptions) forKey:@"ADRapportLinkConfiguration::transportOptions"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v4 decodeObjectOfClass:objc_opt_class(ADRapportLinkConnectionOptions) forKey:@"ADRapportLinkConfiguration::connectionOptions"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkConfiguration::enablesProximityTracking"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 integerValue];
  BOOL v14 = -[ADRapportLinkConfiguration initWithDiscoveryOptions:transportOptions:connectionOptions:enablesProximityTracking:]( self,  "initWithDiscoveryOptions:transportOptions:connectionOptions:enablesProximityTracking:",  v6,  v8,  v10,  v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  discoveryOptions = self->_discoveryOptions;
  id v5 = a3;
  [v5 encodeObject:discoveryOptions forKey:@"ADRapportLinkConfiguration::discoveryOptions"];
  [v5 encodeObject:self->_transportOptions forKey:@"ADRapportLinkConfiguration::transportOptions"];
  [v5 encodeObject:self->_connectionOptions forKey:@"ADRapportLinkConfiguration::connectionOptions"];
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_enablesProximityTracking));
  [v5 encodeObject:v6 forKey:@"ADRapportLinkConfiguration::enablesProximityTracking"];
}

- (ADRapportLinkDiscoveryOptions)discoveryOptions
{
  return self->_discoveryOptions;
}

- (ADRapportLinkTransportOptions)transportOptions
{
  return self->_transportOptions;
}

- (ADRapportLinkConnectionOptions)connectionOptions
{
  return self->_connectionOptions;
}

- (int64_t)enablesProximityTracking
{
  return self->_enablesProximityTracking;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADRapportLinkConfigurationMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADRapportLinkConfigurationMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkConfigurationMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADRapportLinkConfigurationMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADRapportLinkConfiguration);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportLinkConfigurationMutation getDiscoveryOptions](v5, "getDiscoveryOptions"));
      v8 = (ADRapportLinkDiscoveryOptions *)[v7 copy];
      discoveryOptions = v6->_discoveryOptions;
      v6->_discoveryOptions = v8;

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportLinkConfigurationMutation getTransportOptions](v5, "getTransportOptions"));
      id v11 = (ADRapportLinkTransportOptions *)[v10 copy];
      transportOptions = v6->_transportOptions;
      v6->_transportOptions = v11;

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportLinkConfigurationMutation getConnectionOptions](v5, "getConnectionOptions"));
      BOOL v14 = (ADRapportLinkConnectionOptions *)[v13 copy];
      connectionOptions = v6->_connectionOptions;
      v6->_connectionOptions = v14;

      v6->_id enablesProximityTracking = -[_ADRapportLinkConfigurationMutation getEnablesProximityTracking]( v5,  "getEnablesProximityTracking");
    }

    else
    {
      id v6 = (ADRapportLinkConfiguration *)-[ADRapportLinkConfiguration copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADRapportLinkConfiguration *)-[ADRapportLinkConfiguration copy](self, "copy");
  }

  return v6;
}

@end