@interface ADDeviceRouterResult
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceRouterResult)init;
- (ADDeviceRouterResult)initWithBuilder:(id)a3;
- (ADDeviceRouterResult)initWithCoder:(id)a3;
- (ADDeviceRouterResult)initWithPeerInfo:(id)a3 contextIdentifier:(id)a4 proximity:(int64_t)a5 commandRelayProxyIdentifier:(id)a6 error:(id)a7;
- (ADPeerInfo)peerInfo;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSString)commandRelayProxyIdentifier;
- (NSUUID)contextIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceRouterResult

- (ADDeviceRouterResult)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceRouterResultMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADDeviceRouterResult;
  v5 = -[ADDeviceRouterResult init](&v21, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceRouterResultMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceRouterResultMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceRouterResultMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceRouterResultMutation getPeerInfo](v7, "getPeerInfo"));
      v9 = (ADPeerInfo *)[v8 copy];
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceRouterResultMutation getContextIdentifier](v7, "getContextIdentifier"));
      v12 = (NSUUID *)[v11 copy];
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = v12;

      v6->_proximity = -[_ADDeviceRouterResultMutation getProximity](v7, "getProximity");
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceRouterResultMutation getCommandRelayProxyIdentifier]( v7,  "getCommandRelayProxyIdentifier"));
      v15 = (NSString *)[v14 copy];
      commandRelayProxyIdentifier = v6->_commandRelayProxyIdentifier;
      v6->_commandRelayProxyIdentifier = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceRouterResultMutation getError](v7, "getError"));
      v18 = (NSError *)[v17 copy];
      error = v6->_error;
      v6->_error = v18;
    }
  }

  return v6;
}

- (ADDeviceRouterResult)init
{
  return -[ADDeviceRouterResult initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceRouterResult)initWithPeerInfo:(id)a3 contextIdentifier:(id)a4 proximity:(int64_t)a5 commandRelayProxyIdentifier:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002037F8;
  v21[3] = &unk_1004F65C0;
  id v22 = v12;
  id v23 = v13;
  id v25 = a7;
  int64_t v26 = a5;
  id v24 = v14;
  id v15 = v25;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  v19 = -[ADDeviceRouterResult initWithBuilder:](self, "initWithBuilder:", v21);

  return v19;
}

- (id)description
{
  return -[ADDeviceRouterResult _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceRouterResult;
  id v5 = -[ADDeviceRouterResult description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {peerInfo = %@, contextIdentifier = %@, proximity = %lld, commandRelayProxyIdentifier = %@, error = %@}",  v6,  self->_peerInfo,  self->_contextIdentifier,  self->_proximity,  self->_commandRelayProxyIdentifier,  self->_error);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = -[ADPeerInfo hash](self->_peerInfo, "hash");
  unint64_t v4 = (unint64_t)-[NSUUID hash](self->_contextIdentifier, "hash") ^ v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_proximity));
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v4 ^ -[NSString hash](self->_commandRelayProxyIdentifier, "hash") ^ v6;
  unint64_t v8 = v7 ^ (unint64_t)-[NSError hash](self->_error, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADDeviceRouterResult *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceRouterResult);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id proximity = (id)self->_proximity;
      if (proximity == (id)-[ADDeviceRouterResult proximity](v6, "proximity"))
      {
        unint64_t v8 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult peerInfo](v6, "peerInfo"));
        peerInfo = self->_peerInfo;
        if (peerInfo == v8 || -[ADPeerInfo isEqual:](peerInfo, "isEqual:", v8))
        {
          v10 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult contextIdentifier](v6, "contextIdentifier"));
          contextIdentifier = self->_contextIdentifier;
          if (contextIdentifier == v10 || -[NSUUID isEqual:](contextIdentifier, "isEqual:", v10))
          {
            id v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult commandRelayProxyIdentifier](v6, "commandRelayProxyIdentifier"));
            commandRelayProxyIdentifier = self->_commandRelayProxyIdentifier;
            if (commandRelayProxyIdentifier == v12
              || -[NSString isEqual:](commandRelayProxyIdentifier, "isEqual:", v12))
            {
              id v14 = (NSError *)objc_claimAutoreleasedReturnValue(-[ADDeviceRouterResult error](v6, "error"));
              error = self->_error;
              BOOL v16 = error == v14 || -[NSError isEqual:](error, "isEqual:", v14);
            }

            else
            {
              BOOL v16 = 0;
            }
          }

          else
          {
            BOOL v16 = 0;
          }
        }

        else
        {
          BOOL v16 = 0;
        }
      }

      else
      {
        BOOL v16 = 0;
      }
    }

    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (ADDeviceRouterResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ADPeerInfo) forKey:@"ADDeviceRouterResult::peerInfo"];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"ADDeviceRouterResult::contextIdentifier"];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceRouterResult::proximity"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 integerValue];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceRouterResult::commandRelayProxyIdentifier"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"ADDeviceRouterResult::error"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  BOOL v16 = -[ADDeviceRouterResult initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:]( self,  "initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:",  v6,  v8,  v11,  v13,  v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  peerInfo = self->_peerInfo;
  id v6 = a3;
  [v6 encodeObject:peerInfo forKey:@"ADDeviceRouterResult::peerInfo"];
  [v6 encodeObject:self->_contextIdentifier forKey:@"ADDeviceRouterResult::contextIdentifier"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_proximity));
  [v6 encodeObject:v5 forKey:@"ADDeviceRouterResult::proximity"];

  [v6 encodeObject:self->_commandRelayProxyIdentifier forKey:@"ADDeviceRouterResult::commandRelayProxyIdentifier"];
  [v6 encodeObject:self->_error forKey:@"ADDeviceRouterResult::error"];
}

- (ADPeerInfo)peerInfo
{
  return self->_peerInfo;
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (NSString)commandRelayProxyIdentifier
{
  return self->_commandRelayProxyIdentifier;
}

- (NSError)error
{
  return self->_error;
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
  id v4 = (void (**)(id, _ADDeviceRouterResultMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceRouterResultMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceRouterResultMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceRouterResultMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceRouterResult);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceRouterResultMutation getPeerInfo](v5, "getPeerInfo"));
      unint64_t v8 = (ADPeerInfo *)[v7 copy];
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceRouterResultMutation getContextIdentifier](v5, "getContextIdentifier"));
      id v11 = (NSUUID *)[v10 copy];
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = v11;

      v6->_id proximity = -[_ADDeviceRouterResultMutation getProximity](v5, "getProximity");
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceRouterResultMutation getCommandRelayProxyIdentifier]( v5,  "getCommandRelayProxyIdentifier"));
      id v14 = (NSString *)[v13 copy];
      commandRelayProxyIdentifier = v6->_commandRelayProxyIdentifier;
      v6->_commandRelayProxyIdentifier = v14;

      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceRouterResultMutation getError](v5, "getError"));
      id v17 = (NSError *)[v16 copy];
      error = v6->_error;
      v6->_error = v17;
    }

    else
    {
      id v6 = (ADDeviceRouterResult *)-[ADDeviceRouterResult copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADDeviceRouterResult *)-[ADDeviceRouterResult copy](self, "copy");
  }

  return v6;
}

@end