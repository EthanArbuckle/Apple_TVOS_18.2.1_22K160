@interface SBEscrowOperationEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSString)activityLabel;
- (NSString)recordId;
- (NSUUID)activityId;
- (NSUUID)operationId;
- (SBEscrowOperationEvent)initWithCoder:(id)a3;
- (SBEscrowOperationEvent)initWithOperationId:(id)a3 activityId:(id)a4 activityLabel:(id)a5 recordId:(id)a6 type:(unint64_t)a7 context:(id)a8;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBEscrowOperationEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBEscrowOperationEvent)initWithOperationId:(id)a3 activityId:(id)a4 activityLabel:(id)a5 recordId:(id)a6 type:(unint64_t)a7 context:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SBEscrowOperationEvent;
  v18 = -[SBEscrowOperationEvent init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    v18->_type = a7;
    uint64_t v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentTime", v23, v24));
    timestamp = v19->_timestamp;
    v19->_timestamp = (NSDate *)v20;

    objc_storeStrong((id *)&v19->_operationId, a3);
    objc_storeStrong((id *)&v19->_activityId, a4);
    objc_storeStrong((id *)&v19->_activityLabel, a5);
    objc_storeStrong((id *)&v19->_recordId, a6);
  }

  return v19;
}

- (SBEscrowOperationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___SBEscrowOperationEvent;
  v6 = -[SBEscrowOperationEvent init](&v42, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v5), @"timestamp");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (SBEscrowOperationEvent *)v8;
    if (v8)
    {
      uint64_t v10 = objc_opt_self(v8);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

      timestamp = v6->_timestamp;
      v6->_timestamp = (NSDate *)v11;

      id v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v13), @"type");
      id v15 = (SBEscrowOperationEvent *)objc_claimAutoreleasedReturnValue(v14);
      v9 = v15;
      if (v15)
      {
        unint64_t v16 = (int)-[SBEscrowOperationEvent intValue](v15, "intValue");

        v6->_type = v16;
        id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v17),  @"operationId");
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
        v9 = (SBEscrowOperationEvent *)v19;
        if (v19)
        {
          uint64_t v20 = objc_opt_self(v19);
          uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

          operationId = v6->_operationId;
          v6->_operationId = (NSUUID *)v21;

          id v24 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v23),  @"activityLabel");
          uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
          v9 = (SBEscrowOperationEvent *)v25;
          if (v25)
          {
            uint64_t v26 = objc_opt_self(v25);
            uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

            activityLabel = v6->_activityLabel;
            v6->_activityLabel = (NSString *)v27;

            id v30 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v29),  @"activityId");
            uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
            v9 = (SBEscrowOperationEvent *)v31;
            if (v31)
            {
              uint64_t v32 = objc_opt_self(v31);
              uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);

              activityId = v6->_activityId;
              v6->_activityId = (NSUUID *)v33;

              id v36 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v35),  @"recordId");
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              uint64_t v38 = objc_opt_self(v37);
              uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);

              recordId = v6->_recordId;
              v6->_recordId = (NSString *)v39;

              v9 = v6;
            }
          }
        }
      }
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v6 = a3;
  [v6 encodeObject:timestamp forKey:@"timestamp"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_type));
  [v6 encodeObject:v5 forKey:@"type"];

  [v6 encodeObject:self->_operationId forKey:@"operationId"];
  [v6 encodeObject:self->_activityLabel forKey:@"activityLabel"];
  [v6 encodeObject:self->_activityId forKey:@"activityId"];
  [v6 encodeObject:self->_recordId forKey:@"recordId"];
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)operationId
{
  return self->_operationId;
}

- (NSUUID)activityId
{
  return self->_activityId;
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void).cxx_destruct
{
}

@end