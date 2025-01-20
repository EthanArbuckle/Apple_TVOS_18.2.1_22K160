@interface ADAudioSessionCoordinationMessage
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessage)init;
- (ADAudioSessionCoordinationMessage)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessage)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessage)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessage)initWithHostTime:(unint64_t)a3 type:(int64_t)a4 payloadBeginAudioSessionRequest:(id)a5 payloadBeginAudioSessionResponse:(id)a6 payloadKeepAudioSessionAliveRequest:(id)a7 payloadKeepAudioSessionAliveResponse:(id)a8 payloadEndAudioSessionRequest:(id)a9 payloadEndAudioSessionResponse:(id)a10;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)payloadBeginAudioSessionRequest;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)payloadBeginAudioSessionResponse;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)payloadEndAudioSessionRequest;
- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)payloadEndAudioSessionResponse;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)payloadKeepAudioSessionAliveRequest;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)payloadKeepAudioSessionAliveResponse;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)hostTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessage

- (ADAudioSessionCoordinationMessage)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADAudioSessionCoordinationMessageMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessage;
  v5 = -[ADAudioSessionCoordinationMessage init](&v27, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADAudioSessionCoordinationMessageMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADAudioSessionCoordinationMessageMutation isDirty](v7, "isDirty"))
    {
      v6->_hostTime = -[_ADAudioSessionCoordinationMessageMutation getHostTime](v7, "getHostTime");
      v6->_type = -[_ADAudioSessionCoordinationMessageMutation getType](v7, "getType");
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadBeginAudioSessionRequest]( v7,  "getPayloadBeginAudioSessionRequest"));
      v9 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)[v8 copy];
      payloadBeginAudioSessionRequest = v6->_payloadBeginAudioSessionRequest;
      v6->_payloadBeginAudioSessionRequest = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadBeginAudioSessionResponse]( v7,  "getPayloadBeginAudioSessionResponse"));
      v12 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)[v11 copy];
      payloadBeginAudioSessionResponse = v6->_payloadBeginAudioSessionResponse;
      v6->_payloadBeginAudioSessionResponse = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadKeepAudioSessionAliveRequest]( v7,  "getPayloadKeepAudioSessionAliveRequest"));
      v15 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)[v14 copy];
      payloadKeepAudioSessionAliveRequest = v6->_payloadKeepAudioSessionAliveRequest;
      v6->_payloadKeepAudioSessionAliveRequest = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadKeepAudioSessionAliveResponse]( v7,  "getPayloadKeepAudioSessionAliveResponse"));
      v18 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)[v17 copy];
      payloadKeepAudioSessionAliveResponse = v6->_payloadKeepAudioSessionAliveResponse;
      v6->_payloadKeepAudioSessionAliveResponse = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadEndAudioSessionRequest]( v7,  "getPayloadEndAudioSessionRequest"));
      v21 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)[v20 copy];
      payloadEndAudioSessionRequest = v6->_payloadEndAudioSessionRequest;
      v6->_payloadEndAudioSessionRequest = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadEndAudioSessionResponse]( v7,  "getPayloadEndAudioSessionResponse"));
      v24 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)[v23 copy];
      payloadEndAudioSessionResponse = v6->_payloadEndAudioSessionResponse;
      v6->_payloadEndAudioSessionResponse = v24;
    }
  }

  return v6;
}

- (ADAudioSessionCoordinationMessage)init
{
  return -[ADAudioSessionCoordinationMessage initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADAudioSessionCoordinationMessage)initWithHostTime:(unint64_t)a3 type:(int64_t)a4 payloadBeginAudioSessionRequest:(id)a5 payloadBeginAudioSessionResponse:(id)a6 payloadKeepAudioSessionAliveRequest:(id)a7 payloadKeepAudioSessionAliveResponse:(id)a8 payloadEndAudioSessionRequest:(id)a9 payloadEndAudioSessionResponse:(id)a10
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100346FCC;
  v22[3] = &unk_1004FD310;
  unint64_t v29 = a3;
  int64_t v30 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v27 = a9;
  id v28 = a10;
  id v13 = v28;
  id v14 = v27;
  id v15 = v26;
  id v16 = v25;
  id v17 = v24;
  id v18 = v23;
  v19 = -[ADAudioSessionCoordinationMessage initWithBuilder:](self, "initWithBuilder:", v22);

  return v19;
}

- (NSString)description
{
  return (NSString *)-[ADAudioSessionCoordinationMessage _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessage;
  v5 = -[ADAudioSessionCoordinationMessage description](&v13, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t hostTime = self->_hostTime;
  unint64_t type = self->_type;
  if (type > 6) {
    v9 = @"(unknown)";
  }
  else {
    v9 = *(&off_1004F2090 + type);
  }
  v10 = v9;
  v11 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {hostTime = %llu, unint64_t type = %@, payloadBeginAudioSessionRequest = %@, payloadBeginAudioSessionResponse = %@, payloadKeepAudioSessionAliveRequest = %@, payloadKeepAudioSessionAliveResponse = %@, payloadEndAudioSessionRequest = %@, payloadEndAudioSessionResponse = %@}",  v6,  hostTime,  v10,  self->_payloadBeginAudioSessionRequest,  self->_payloadBeginAudioSessionResponse,  self->_payloadKeepAudioSessionAliveRequest,  self->_payloadKeepAudioSessionAliveResponse,  self->_payloadEndAudioSessionRequest,  self->_payloadEndAudioSessionResponse);

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_hostTime));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_type));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest hash](self->_payloadBeginAudioSessionRequest, "hash");
  unint64_t v8 = v7 ^ -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse hash]( self->_payloadBeginAudioSessionResponse,  "hash");
  unint64_t v9 = v8 ^ -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest hash]( self->_payloadKeepAudioSessionAliveRequest,  "hash");
  unint64_t v10 = v6 ^ v9 ^ -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse hash]( self->_payloadKeepAudioSessionAliveResponse,  "hash");
  unint64_t v11 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest hash](self->_payloadEndAudioSessionRequest, "hash");
  unint64_t v12 = v10 ^ v11 ^ -[ADAudioSessionCoordinationMessageEndAudioSessionResponse hash]( self->_payloadEndAudioSessionResponse,  "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADAudioSessionCoordinationMessage *)a3;
  if (self == v4)
  {
    BOOL v21 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessage);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id hostTime = (id)self->_hostTime;
      if (hostTime == (id)-[ADAudioSessionCoordinationMessage hostTime](v6, "hostTime")
        && (id type = (id)self->_type, type == (id)-[ADAudioSessionCoordinationMessage type](v6, "type")))
      {
        unint64_t v9 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadBeginAudioSessionRequest]( v6,  "payloadBeginAudioSessionRequest"));
        payloadBeginAudioSessionRequest = self->_payloadBeginAudioSessionRequest;
        if (payloadBeginAudioSessionRequest == v9
          || -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest isEqual:]( payloadBeginAudioSessionRequest,  "isEqual:",  v9))
        {
          unint64_t v11 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadBeginAudioSessionResponse]( v6,  "payloadBeginAudioSessionResponse"));
          payloadBeginAudioSessionResponse = self->_payloadBeginAudioSessionResponse;
          if (payloadBeginAudioSessionResponse == v11
            || -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse isEqual:]( payloadBeginAudioSessionResponse,  "isEqual:",  v11))
          {
            objc_super v13 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadKeepAudioSessionAliveRequest]( v6,  "payloadKeepAudioSessionAliveRequest"));
            payloadKeepAudioSessionAliveRequest = self->_payloadKeepAudioSessionAliveRequest;
            if (payloadKeepAudioSessionAliveRequest == v13
              || -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest isEqual:]( payloadKeepAudioSessionAliveRequest,  "isEqual:",  v13))
            {
              id v15 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadKeepAudioSessionAliveResponse]( v6,  "payloadKeepAudioSessionAliveResponse"));
              payloadKeepAudioSessionAliveResponse = self->_payloadKeepAudioSessionAliveResponse;
              if (payloadKeepAudioSessionAliveResponse == v15
                || -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse isEqual:]( payloadKeepAudioSessionAliveResponse,  "isEqual:",  v15))
              {
                id v17 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadEndAudioSessionRequest]( v6,  "payloadEndAudioSessionRequest"));
                payloadEndAudioSessionRequest = self->_payloadEndAudioSessionRequest;
                if (payloadEndAudioSessionRequest == v17
                  || -[ADAudioSessionCoordinationMessageEndAudioSessionRequest isEqual:]( payloadEndAudioSessionRequest,  "isEqual:",  v17))
                {
                  v19 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadEndAudioSessionResponse]( v6,  "payloadEndAudioSessionResponse"));
                  payloadEndAudioSessionResponse = self->_payloadEndAudioSessionResponse;
                  BOOL v21 = payloadEndAudioSessionResponse == v19
                     || -[ADAudioSessionCoordinationMessageEndAudioSessionResponse isEqual:]( payloadEndAudioSessionResponse,  "isEqual:",  v19);
                }

                else
                {
                  BOOL v21 = 0;
                }
              }

              else
              {
                BOOL v21 = 0;
              }
            }

            else
            {
              BOOL v21 = 0;
            }
          }

          else
          {
            BOOL v21 = 0;
          }
        }

        else
        {
          BOOL v21 = 0;
        }
      }

      else
      {
        BOOL v21 = 0;
      }
    }

    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (ADAudioSessionCoordinationMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADAudioSessionCoordinationMessage::hostTime"];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 unsignedLongLongValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADAudioSessionCoordinationMessage::type"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 integerValue];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class(ADAudioSessionCoordinationMessageBeginAudioSessionRequest) forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionRequest"];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v4 decodeObjectOfClass:objc_opt_class(ADAudioSessionCoordinationMessageBeginAudioSessionResponse) forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionResponse"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v4 decodeObjectOfClass:objc_opt_class(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest) forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveRequest"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v4 decodeObjectOfClass:objc_opt_class(ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse) forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveResponse"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v4 decodeObjectOfClass:objc_opt_class(ADAudioSessionCoordinationMessageEndAudioSessionRequest) forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionRequest"];
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = [v4 decodeObjectOfClass:objc_opt_class(ADAudioSessionCoordinationMessageEndAudioSessionResponse) forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionResponse"];
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  id v23 = -[ADAudioSessionCoordinationMessage initWithHostTime:type:payloadBeginAudioSessionRequest:payloadBeginAudioSessionResponse:payloadKeepAudioSessionAliveRequest:payloadKeepAudioSessionAliveResponse:payloadEndAudioSessionRequest:payloadEndAudioSessionResponse:]( self,  "initWithHostTime:type:payloadBeginAudioSessionRequest:payloadBeginAudioSessionResponse:payloadKeepAudioSession AliveRequest:payloadKeepAudioSessionAliveResponse:payloadEndAudioSessionRequest:payloadEndAudioSessionResponse:",  v7,  v10,  v12,  v14,  v16,  v18,  v20,  v22);
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t hostTime = self->_hostTime;
  id v7 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  hostTime));
  [v7 encodeObject:v5 forKey:@"ADAudioSessionCoordinationMessage::hostTime"];

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_type));
  [v7 encodeObject:v6 forKey:@"ADAudioSessionCoordinationMessage::type"];

  [v7 encodeObject:self->_payloadBeginAudioSessionRequest forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionRequest"];
  [v7 encodeObject:self->_payloadBeginAudioSessionResponse forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionResponse"];
  [v7 encodeObject:self->_payloadKeepAudioSessionAliveRequest forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveRequest"];
  [v7 encodeObject:self->_payloadKeepAudioSessionAliveResponse forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveResponse"];
  [v7 encodeObject:self->_payloadEndAudioSessionRequest forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionRequest"];
  [v7 encodeObject:self->_payloadEndAudioSessionResponse forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionResponse"];
}

- (ADAudioSessionCoordinationMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"hostTime"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      id v8 = v6;
    }
    else {
      id v8 = 0LL;
    }

    id v10 = [v8 unsignedLongLongValue];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"type"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    id v35 = v10;
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      id v13 = v11;
      if ([v13 length])
      {
        if (qword_100577E70 != -1) {
          dispatch_once(&qword_100577E70, &stru_1004F2070);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100577E78 objectForKey:v13]);
        id v15 = [v14 integerValue];
      }

      else
      {
        id v15 = 0LL;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"payloadBeginAudioSessionRequest"]);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
      id v18 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest),  "initWithDictionaryRepresentation:",  v16);
    }
    else {
      id v18 = 0LL;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"payloadBeginAudioSessionResponse"]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
      id v21 = -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse),  "initWithDictionaryRepresentation:",  v19);
    }
    else {
      id v21 = 0LL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"payloadKeepAudioSessionAliveRequest"]);
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0) {
      id v24 = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest),  "initWithDictionaryRepresentation:",  v22);
    }
    else {
      id v24 = 0LL;
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"payloadKeepAudioSessionAliveResponse"]);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
      id v27 = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse),  "initWithDictionaryRepresentation:",  v25);
    }
    else {
      id v27 = 0LL;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"payloadEndAudioSessionRequest"]);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0) {
      int64_t v30 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest),  "initWithDictionaryRepresentation:",  v28);
    }
    else {
      int64_t v30 = 0LL;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"payloadEndAudioSessionResponse"]);
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0) {
      v33 = -[ADAudioSessionCoordinationMessageEndAudioSessionResponse initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionResponse),  "initWithDictionaryRepresentation:",  v31);
    }
    else {
      v33 = 0LL;
    }

    self =  -[ADAudioSessionCoordinationMessage initWithHostTime:type:payloadBeginAudioSessionRequest:payloadBeginAudioSessionResponse:payloadKeepAudioSessionAliveRequest:payloadKeepAudioSessionAliveResponse:payloadEndAudioSessionRequest:payloadEndAudioSessionResponse:]( self,  "initWithHostTime:type:payloadBeginAudioSessionRequest:payloadBeginAudioSessionResponse:payloadKeepAudioSe ssionAliveRequest:payloadKeepAudioSessionAliveResponse:payloadEndAudioSessionRequest:payloadEndAudioSessionResponse:",  v35,  v15,  v18,  v21,  v24,  v27,  v30,  v33);
    unint64_t v9 = self;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (id)buildDictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_hostTime));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"hostTime");

  unint64_t type = self->_type;
  if (type > 6) {
    unint64_t v6 = @"(unknown)";
  }
  else {
    unint64_t v6 = *(&off_1004F2090 + type);
  }
  uint64_t v7 = v6;
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"type");

  payloadBeginAudioSessionRequest = self->_payloadBeginAudioSessionRequest;
  if (payloadBeginAudioSessionRequest)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest buildDictionaryRepresentation]( payloadBeginAudioSessionRequest,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"payloadBeginAudioSessionRequest");
  }

  payloadBeginAudioSessionResponse = self->_payloadBeginAudioSessionResponse;
  if (payloadBeginAudioSessionResponse)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse buildDictionaryRepresentation]( payloadBeginAudioSessionResponse,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"payloadBeginAudioSessionResponse");
  }

  payloadKeepAudioSessionAliveRequest = self->_payloadKeepAudioSessionAliveRequest;
  if (payloadKeepAudioSessionAliveRequest)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest buildDictionaryRepresentation]( payloadKeepAudioSessionAliveRequest,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v13, @"payloadKeepAudioSessionAliveRequest");
  }

  payloadKeepAudioSessionAliveResponse = self->_payloadKeepAudioSessionAliveResponse;
  if (payloadKeepAudioSessionAliveResponse)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse buildDictionaryRepresentation]( payloadKeepAudioSessionAliveResponse,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v15,  @"payloadKeepAudioSessionAliveResponse");
  }

  payloadEndAudioSessionRequest = self->_payloadEndAudioSessionRequest;
  if (payloadEndAudioSessionRequest)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageEndAudioSessionRequest buildDictionaryRepresentation]( payloadEndAudioSessionRequest,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v17, @"payloadEndAudioSessionRequest");
  }

  payloadEndAudioSessionResponse = self->_payloadEndAudioSessionResponse;
  if (payloadEndAudioSessionResponse)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageEndAudioSessionResponse buildDictionaryRepresentation]( payloadEndAudioSessionResponse,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v19, @"payloadEndAudioSessionResponse");
  }

  id v20 = -[NSMutableDictionary copy](v3, "copy");

  return v20;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (int64_t)type
{
  return self->_type;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)payloadBeginAudioSessionRequest
{
  return self->_payloadBeginAudioSessionRequest;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)payloadBeginAudioSessionResponse
{
  return self->_payloadBeginAudioSessionResponse;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)payloadKeepAudioSessionAliveRequest
{
  return self->_payloadKeepAudioSessionAliveRequest;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)payloadKeepAudioSessionAliveResponse
{
  return self->_payloadKeepAudioSessionAliveResponse;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)payloadEndAudioSessionRequest
{
  return self->_payloadEndAudioSessionRequest;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)payloadEndAudioSessionResponse
{
  return self->_payloadEndAudioSessionResponse;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADAudioSessionCoordinationMessageMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADAudioSessionCoordinationMessageMutation isDirty](v5, "isDirty"))
    {
      unint64_t v6 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessage);
      v6->_unint64_t hostTime = -[_ADAudioSessionCoordinationMessageMutation getHostTime](v5, "getHostTime");
      v6->_unint64_t type = -[_ADAudioSessionCoordinationMessageMutation getType](v5, "getType");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadBeginAudioSessionRequest]( v5,  "getPayloadBeginAudioSessionRequest"));
      id v8 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)[v7 copy];
      payloadBeginAudioSessionRequest = v6->_payloadBeginAudioSessionRequest;
      v6->_payloadBeginAudioSessionRequest = v8;

      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadBeginAudioSessionResponse]( v5,  "getPayloadBeginAudioSessionResponse"));
      id v11 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)[v10 copy];
      payloadBeginAudioSessionResponse = v6->_payloadBeginAudioSessionResponse;
      v6->_payloadBeginAudioSessionResponse = v11;

      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadKeepAudioSessionAliveRequest]( v5,  "getPayloadKeepAudioSessionAliveRequest"));
      id v14 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)[v13 copy];
      payloadKeepAudioSessionAliveRequest = v6->_payloadKeepAudioSessionAliveRequest;
      v6->_payloadKeepAudioSessionAliveRequest = v14;

      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadKeepAudioSessionAliveResponse]( v5,  "getPayloadKeepAudioSessionAliveResponse"));
      uint64_t v17 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)[v16 copy];
      payloadKeepAudioSessionAliveResponse = v6->_payloadKeepAudioSessionAliveResponse;
      v6->_payloadKeepAudioSessionAliveResponse = v17;

      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadEndAudioSessionRequest]( v5,  "getPayloadEndAudioSessionRequest"));
      id v20 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)[v19 copy];
      payloadEndAudioSessionRequest = v6->_payloadEndAudioSessionRequest;
      v6->_payloadEndAudioSessionRequest = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageMutation getPayloadEndAudioSessionResponse]( v5,  "getPayloadEndAudioSessionResponse"));
      uint64_t v23 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)[v22 copy];
      payloadEndAudioSessionResponse = v6->_payloadEndAudioSessionResponse;
      v6->_payloadEndAudioSessionResponse = v23;
    }

    else
    {
      unint64_t v6 = (ADAudioSessionCoordinationMessage *)-[ADAudioSessionCoordinationMessage copy](self, "copy");
    }
  }

  else
  {
    unint64_t v6 = (ADAudioSessionCoordinationMessage *)-[ADAudioSessionCoordinationMessage copy](self, "copy");
  }

  return v6;
}

@end