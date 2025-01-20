@interface ADDeviceSyncMessage
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)commandPullDeltaRequest;
- (ADDeviceSyncCommandPullDeltaResponse)commandPullDeltaResponse;
- (ADDeviceSyncCommandPullGenerationsRequest)commandPullGenerationsRequest;
- (ADDeviceSyncCommandPullGenerationsResponse)commandPullGenerationsResponse;
- (ADDeviceSyncCommandPullSnapshotRequest)commandPullSnapshotRequest;
- (ADDeviceSyncCommandPullSnapshotResponse)commandPullSnapshotResponse;
- (ADDeviceSyncCommandPushGenerationsRequest)commandPushGenerationsRequest;
- (ADDeviceSyncCommandPushGenerationsResponse)commandPushGenerationsResponse;
- (ADDeviceSyncMessage)init;
- (ADDeviceSyncMessage)initWithBuilder:(id)a3;
- (ADDeviceSyncMessage)initWithCoder:(id)a3;
- (ADDeviceSyncMessage)initWithSequence:(unint64_t)a3 type:(int64_t)a4 commandPushGenerationsRequest:(id)a5 commandPushGenerationsResponse:(id)a6 commandPullGenerationsRequest:(id)a7 commandPullGenerationsResponse:(id)a8 commandPullDeltaRequest:(id)a9 commandPullDeltaResponse:(id)a10 commandPullSnapshotRequest:(id)a11 commandPullSnapshotResponse:(id)a12;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)sequence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncMessage

- (ADDeviceSyncMessage)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncMessageMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessage;
  v5 = -[ADDeviceSyncMessage init](&v33, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncMessageMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncMessageMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncMessageMutation isDirty](v7, "isDirty"))
    {
      v6->_sequence = -[_ADDeviceSyncMessageMutation getSequence](v7, "getSequence");
      v6->_type = -[_ADDeviceSyncMessageMutation getType](v7, "getType");
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPushGenerationsRequest]( v7,  "getCommandPushGenerationsRequest"));
      v9 = (ADDeviceSyncCommandPushGenerationsRequest *)[v8 copy];
      commandPushGenerationsRequest = v6->_commandPushGenerationsRequest;
      v6->_commandPushGenerationsRequest = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPushGenerationsResponse]( v7,  "getCommandPushGenerationsResponse"));
      v12 = (ADDeviceSyncCommandPushGenerationsResponse *)[v11 copy];
      commandPushGenerationsResponse = v6->_commandPushGenerationsResponse;
      v6->_commandPushGenerationsResponse = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPullGenerationsRequest]( v7,  "getCommandPullGenerationsRequest"));
      v15 = (ADDeviceSyncCommandPullGenerationsRequest *)[v14 copy];
      commandPullGenerationsRequest = v6->_commandPullGenerationsRequest;
      v6->_commandPullGenerationsRequest = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPullGenerationsResponse]( v7,  "getCommandPullGenerationsResponse"));
      v18 = (ADDeviceSyncCommandPullGenerationsResponse *)[v17 copy];
      commandPullGenerationsResponse = v6->_commandPullGenerationsResponse;
      v6->_commandPullGenerationsResponse = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncMessageMutation getCommandPullDeltaRequest](v7, "getCommandPullDeltaRequest"));
      v21 = (ADDeviceSyncCommandPullDeltaRequest *)[v20 copy];
      commandPullDeltaRequest = v6->_commandPullDeltaRequest;
      v6->_commandPullDeltaRequest = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncMessageMutation getCommandPullDeltaResponse](v7, "getCommandPullDeltaResponse"));
      v24 = (ADDeviceSyncCommandPullDeltaResponse *)[v23 copy];
      commandPullDeltaResponse = v6->_commandPullDeltaResponse;
      v6->_commandPullDeltaResponse = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncMessageMutation getCommandPullSnapshotRequest](v7, "getCommandPullSnapshotRequest"));
      v27 = (ADDeviceSyncCommandPullSnapshotRequest *)[v26 copy];
      commandPullSnapshotRequest = v6->_commandPullSnapshotRequest;
      v6->_commandPullSnapshotRequest = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPullSnapshotResponse]( v7,  "getCommandPullSnapshotResponse"));
      v30 = (ADDeviceSyncCommandPullSnapshotResponse *)[v29 copy];
      commandPullSnapshotResponse = v6->_commandPullSnapshotResponse;
      v6->_commandPullSnapshotResponse = v30;
    }
  }

  return v6;
}

- (ADDeviceSyncMessage)init
{
  return -[ADDeviceSyncMessage initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncMessage)initWithSequence:(unint64_t)a3 type:(int64_t)a4 commandPushGenerationsRequest:(id)a5 commandPushGenerationsResponse:(id)a6 commandPullGenerationsRequest:(id)a7 commandPullGenerationsResponse:(id)a8 commandPullDeltaRequest:(id)a9 commandPullDeltaResponse:(id)a10 commandPullSnapshotRequest:(id)a11 commandPullSnapshotResponse:(id)a12
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000619FC;
  v26[3] = &unk_1004EEB08;
  unint64_t v35 = a3;
  int64_t v36 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a9;
  id v32 = a10;
  id v33 = a11;
  id v34 = a12;
  id v15 = v34;
  id v16 = v33;
  id v17 = v32;
  id v18 = v31;
  id v19 = v30;
  id v20 = v29;
  id v21 = v28;
  id v22 = v27;
  v23 = -[ADDeviceSyncMessage initWithBuilder:](self, "initWithBuilder:", v26);

  return v23;
}

- (id)description
{
  return -[ADDeviceSyncMessage _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessage;
  id v5 = -[ADDeviceSyncMessage description](&v13, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t sequence = self->_sequence;
  unint64_t type = self->_type;
  if (type > 0xA) {
    v9 = @"(unknown)";
  }
  else {
    v9 = off_1004FA788[type];
  }
  v10 = v9;
  v11 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {sequence = %llu, unint64_t type = %@, commandPushGenerationsRequest = %@, commandPushGenerationsResponse = %@, commandPullGenerationsRequest = %@, commandPullGenerationsResponse = %@, commandPullDeltaRequest = %@, commandPullDeltaResponse = %@, commandPullSnapshotRequest = %@, commandPullSnapshotResponse = %@}",  v6,  sequence,  v10,  self->_commandPushGenerationsRequest,  self->_commandPushGenerationsResponse,  self->_commandPullGenerationsRequest,  self->_commandPullGenerationsResponse,  self->_commandPullDeltaRequest,  self->_commandPullDeltaResponse,  self->_commandPullSnapshotRequest,  self->_commandPullSnapshotResponse);

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_sequence));
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_type));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = -[ADDeviceSyncCommandPushGenerationsRequest hash](self->_commandPushGenerationsRequest, "hash");
  unint64_t v8 = v7 ^ -[ADDeviceSyncCommandPushGenerationsResponse hash](self->_commandPushGenerationsResponse, "hash");
  unint64_t v9 = v8 ^ -[ADDeviceSyncCommandPullGenerationsRequest hash](self->_commandPullGenerationsRequest, "hash");
  unint64_t v10 = v6 ^ v9 ^ -[ADDeviceSyncCommandPullGenerationsResponse hash](self->_commandPullGenerationsResponse, "hash");
  unint64_t v11 = -[ADDeviceSyncCommandPullDeltaRequest hash](self->_commandPullDeltaRequest, "hash");
  unint64_t v12 = v11 ^ -[ADDeviceSyncCommandPullDeltaResponse hash](self->_commandPullDeltaResponse, "hash");
  unint64_t v13 = v12 ^ -[ADDeviceSyncCommandPullSnapshotRequest hash](self->_commandPullSnapshotRequest, "hash");
  unint64_t v14 = v10 ^ v13 ^ -[ADDeviceSyncCommandPullSnapshotResponse hash](self->_commandPullSnapshotResponse, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADDeviceSyncMessage *)a3;
  if (self == v4)
  {
    BOOL v25 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncMessage);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id sequence = (id)self->_sequence;
      if (sequence == (id)-[ADDeviceSyncMessage sequence](v6, "sequence")
        && (id type = (id)self->_type, type == (id)-[ADDeviceSyncMessage type](v6, "type")))
      {
        unint64_t v9 = (ADDeviceSyncCommandPushGenerationsRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPushGenerationsRequest]( v6,  "commandPushGenerationsRequest"));
        commandPushGenerationsRequest = self->_commandPushGenerationsRequest;
        if (commandPushGenerationsRequest == v9
          || -[ADDeviceSyncCommandPushGenerationsRequest isEqual:](commandPushGenerationsRequest, "isEqual:", v9))
        {
          unint64_t v11 = (ADDeviceSyncCommandPushGenerationsResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPushGenerationsResponse]( v6,  "commandPushGenerationsResponse"));
          commandPushGenerationsResponse = self->_commandPushGenerationsResponse;
          if (commandPushGenerationsResponse == v11
            || -[ADDeviceSyncCommandPushGenerationsResponse isEqual:](commandPushGenerationsResponse, "isEqual:", v11))
          {
            unint64_t v13 = (ADDeviceSyncCommandPullGenerationsRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullGenerationsRequest]( v6,  "commandPullGenerationsRequest"));
            commandPullGenerationsRequest = self->_commandPullGenerationsRequest;
            if (commandPullGenerationsRequest == v13
              || -[ADDeviceSyncCommandPullGenerationsRequest isEqual:](commandPullGenerationsRequest, "isEqual:", v13))
            {
              id v15 = (ADDeviceSyncCommandPullGenerationsResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullGenerationsResponse]( v6,  "commandPullGenerationsResponse"));
              commandPullGenerationsResponse = self->_commandPullGenerationsResponse;
              if (commandPullGenerationsResponse == v15
                || -[ADDeviceSyncCommandPullGenerationsResponse isEqual:]( commandPullGenerationsResponse,  "isEqual:",  v15))
              {
                id v17 = (ADDeviceSyncCommandPullDeltaRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullDeltaRequest]( v6,  "commandPullDeltaRequest"));
                commandPullDeltaRequest = self->_commandPullDeltaRequest;
                if (commandPullDeltaRequest == v17
                  || -[ADDeviceSyncCommandPullDeltaRequest isEqual:](commandPullDeltaRequest, "isEqual:", v17))
                {
                  id v19 = (ADDeviceSyncCommandPullDeltaResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullDeltaResponse]( v6,  "commandPullDeltaResponse"));
                  commandPullDeltaResponse = self->_commandPullDeltaResponse;
                  if (commandPullDeltaResponse == v19
                    || -[ADDeviceSyncCommandPullDeltaResponse isEqual:](commandPullDeltaResponse, "isEqual:", v19))
                  {
                    id v21 = (ADDeviceSyncCommandPullSnapshotRequest *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullSnapshotRequest]( v6,  "commandPullSnapshotRequest"));
                    commandPullSnapshotRequest = self->_commandPullSnapshotRequest;
                    if (commandPullSnapshotRequest == v21
                      || -[ADDeviceSyncCommandPullSnapshotRequest isEqual:](commandPullSnapshotRequest, "isEqual:", v21))
                    {
                      id v27 = v21;
                      v23 = (ADDeviceSyncCommandPullSnapshotResponse *)objc_claimAutoreleasedReturnValue( -[ADDeviceSyncMessage commandPullSnapshotResponse]( v6,  "commandPullSnapshotResponse"));
                      commandPullSnapshotResponse = self->_commandPullSnapshotResponse;
                      BOOL v25 = commandPullSnapshotResponse == v23
                         || -[ADDeviceSyncCommandPullSnapshotResponse isEqual:]( commandPullSnapshotResponse,  "isEqual:",  v23);

                      id v21 = v27;
                    }

                    else
                    {
                      BOOL v25 = 0;
                    }
                  }

                  else
                  {
                    BOOL v25 = 0;
                  }
                }

                else
                {
                  BOOL v25 = 0;
                }
              }

              else
              {
                BOOL v25 = 0;
              }
            }

            else
            {
              BOOL v25 = 0;
            }
          }

          else
          {
            BOOL v25 = 0;
          }
        }

        else
        {
          BOOL v25 = 0;
        }
      }

      else
      {
        BOOL v25 = 0;
      }
    }

    else
    {
      BOOL v25 = 0;
    }
  }

  return v25;
}

- (ADDeviceSyncMessage)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceSyncMessage::sequence"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v27 = [v5 unsignedLongLongValue];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceSyncMessage::type"];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 integerValue];

  id v9 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPushGenerationsRequest) forKey:@"ADDeviceSyncMessage::commandPushGenerationsRequest"];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPushGenerationsResponse) forKey:@"ADDeviceSyncMessage::commandPushGenerationsResponse"];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPullGenerationsRequest) forKey:@"ADDeviceSyncMessage::commandPullGenerationsRequest"];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPullGenerationsResponse) forKey:@"ADDeviceSyncMessage::commandPullGenerationsResponse"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPullDeltaRequest) forKey:@"ADDeviceSyncMessage::commandPullDeltaRequest"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPullDeltaResponse) forKey:@"ADDeviceSyncMessage::commandPullDeltaResponse"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPullSnapshotRequest) forKey:@"ADDeviceSyncMessage::commandPullSnapshotRequest"];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = [v3 decodeObjectOfClass:objc_opt_class(ADDeviceSyncCommandPullSnapshotResponse) forKey:@"ADDeviceSyncMessage::commandPullSnapshotResponse"];
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  BOOL v25 = -[ADDeviceSyncMessage initWithSequence:type:commandPushGenerationsRequest:commandPushGenerationsResponse:commandPullGenerationsRequest:commandPullGenerationsResponse:commandPullDeltaRequest:commandPullDeltaResponse:commandPullSnapshotRequest:commandPullSnapshotResponse:]( self,  "initWithSequence:type:commandPushGenerationsRequest:commandPushGenerationsResponse:commandPullGenerationsReque st:commandPullGenerationsResponse:commandPullDeltaRequest:commandPullDeltaResponse:commandPullSnapshotRequest: commandPullSnapshotResponse:",  v27,  v8,  v10,  v12,  v14,  v16,  v18,  v20,  v22,  v24);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sequence = self->_sequence;
  id v7 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sequence));
  [v7 encodeObject:v5 forKey:@"ADDeviceSyncMessage::sequence"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_type));
  [v7 encodeObject:v6 forKey:@"ADDeviceSyncMessage::type"];

  [v7 encodeObject:self->_commandPushGenerationsRequest forKey:@"ADDeviceSyncMessage::commandPushGenerationsRequest"];
  [v7 encodeObject:self->_commandPushGenerationsResponse forKey:@"ADDeviceSyncMessage::commandPushGenerationsResponse"];
  [v7 encodeObject:self->_commandPullGenerationsRequest forKey:@"ADDeviceSyncMessage::commandPullGenerationsRequest"];
  [v7 encodeObject:self->_commandPullGenerationsResponse forKey:@"ADDeviceSyncMessage::commandPullGenerationsResponse"];
  [v7 encodeObject:self->_commandPullDeltaRequest forKey:@"ADDeviceSyncMessage::commandPullDeltaRequest"];
  [v7 encodeObject:self->_commandPullDeltaResponse forKey:@"ADDeviceSyncMessage::commandPullDeltaResponse"];
  [v7 encodeObject:self->_commandPullSnapshotRequest forKey:@"ADDeviceSyncMessage::commandPullSnapshotRequest"];
  [v7 encodeObject:self->_commandPullSnapshotResponse forKey:@"ADDeviceSyncMessage::commandPullSnapshotResponse"];
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (int64_t)type
{
  return self->_type;
}

- (ADDeviceSyncCommandPushGenerationsRequest)commandPushGenerationsRequest
{
  return self->_commandPushGenerationsRequest;
}

- (ADDeviceSyncCommandPushGenerationsResponse)commandPushGenerationsResponse
{
  return self->_commandPushGenerationsResponse;
}

- (ADDeviceSyncCommandPullGenerationsRequest)commandPullGenerationsRequest
{
  return self->_commandPullGenerationsRequest;
}

- (ADDeviceSyncCommandPullGenerationsResponse)commandPullGenerationsResponse
{
  return self->_commandPullGenerationsResponse;
}

- (ADDeviceSyncCommandPullDeltaRequest)commandPullDeltaRequest
{
  return self->_commandPullDeltaRequest;
}

- (ADDeviceSyncCommandPullDeltaResponse)commandPullDeltaResponse
{
  return self->_commandPullDeltaResponse;
}

- (ADDeviceSyncCommandPullSnapshotRequest)commandPullSnapshotRequest
{
  return self->_commandPullSnapshotRequest;
}

- (ADDeviceSyncCommandPullSnapshotResponse)commandPullSnapshotResponse
{
  return self->_commandPullSnapshotResponse;
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
  id v4 = (void (**)(id, _ADDeviceSyncMessageMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncMessageMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncMessageMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncMessageMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncMessage);
      v6->_unint64_t sequence = -[_ADDeviceSyncMessageMutation getSequence](v5, "getSequence");
      v6->_id type = -[_ADDeviceSyncMessageMutation getType](v5, "getType");
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPushGenerationsRequest]( v5,  "getCommandPushGenerationsRequest"));
      id v8 = (ADDeviceSyncCommandPushGenerationsRequest *)[v7 copy];
      commandPushGenerationsRequest = v6->_commandPushGenerationsRequest;
      v6->_commandPushGenerationsRequest = v8;

      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPushGenerationsResponse]( v5,  "getCommandPushGenerationsResponse"));
      id v11 = (ADDeviceSyncCommandPushGenerationsResponse *)[v10 copy];
      commandPushGenerationsResponse = v6->_commandPushGenerationsResponse;
      v6->_commandPushGenerationsResponse = v11;

      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPullGenerationsRequest]( v5,  "getCommandPullGenerationsRequest"));
      unint64_t v14 = (ADDeviceSyncCommandPullGenerationsRequest *)[v13 copy];
      commandPullGenerationsRequest = v6->_commandPullGenerationsRequest;
      v6->_commandPullGenerationsRequest = v14;

      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPullGenerationsResponse]( v5,  "getCommandPullGenerationsResponse"));
      id v17 = (ADDeviceSyncCommandPullGenerationsResponse *)[v16 copy];
      commandPullGenerationsResponse = v6->_commandPullGenerationsResponse;
      v6->_commandPullGenerationsResponse = v17;

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncMessageMutation getCommandPullDeltaRequest](v5, "getCommandPullDeltaRequest"));
      id v20 = (ADDeviceSyncCommandPullDeltaRequest *)[v19 copy];
      commandPullDeltaRequest = v6->_commandPullDeltaRequest;
      v6->_commandPullDeltaRequest = v20;

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncMessageMutation getCommandPullDeltaResponse](v5, "getCommandPullDeltaResponse"));
      id v23 = (ADDeviceSyncCommandPullDeltaResponse *)[v22 copy];
      commandPullDeltaResponse = v6->_commandPullDeltaResponse;
      v6->_commandPullDeltaResponse = v23;

      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncMessageMutation getCommandPullSnapshotRequest](v5, "getCommandPullSnapshotRequest"));
      v26 = (ADDeviceSyncCommandPullSnapshotRequest *)[v25 copy];
      commandPullSnapshotRequest = v6->_commandPullSnapshotRequest;
      v6->_commandPullSnapshotRequest = v26;

      id v28 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncMessageMutation getCommandPullSnapshotResponse]( v5,  "getCommandPullSnapshotResponse"));
      id v29 = (ADDeviceSyncCommandPullSnapshotResponse *)[v28 copy];
      commandPullSnapshotResponse = v6->_commandPullSnapshotResponse;
      v6->_commandPullSnapshotResponse = v29;
    }

    else
    {
      id v6 = (ADDeviceSyncMessage *)-[ADDeviceSyncMessage copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADDeviceSyncMessage *)-[ADDeviceSyncMessage copy](self, "copy");
  }

  return v6;
}

@end