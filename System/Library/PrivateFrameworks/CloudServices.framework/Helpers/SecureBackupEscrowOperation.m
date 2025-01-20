@interface SecureBackupEscrowOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)didFail;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStaleWithcontext:(id)a3;
- (NSDate)endTimestamp;
- (NSDate)finalCheckTimestamp;
- (NSDate)startTimestamp;
- (NSError)error;
- (NSString)activityLabel;
- (NSString)recordId;
- (NSUUID)id;
- (SecureBackupEscrowOperation)initWithCoder:(id)a3;
- (SecureBackupEscrowOperation)initWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updatedOperationWithAdditionalEvent:(id)a3 parentActivity:(id)a4 context:(id)a5;
- (id)updatedOperationWithParentActivity:(id)a3 context:(id)a4;
- (unint64_t)newStateWithContext:(id)a3 parentActivity:(id)a4;
- (unint64_t)state;
- (unint64_t)type;
- (void)_updateWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityLabel:(id)a3;
- (void)setEndTimestamp:(id)a3;
- (void)setError:(id)a3;
- (void)setFinalCheckTimestamp:(id)a3;
- (void)setId:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setStartTimestamp:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SecureBackupEscrowOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackupEscrowOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___SecureBackupEscrowOperation;
  v6 = -[SecureBackupEscrowOperation init](&v58, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), @"id");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (SecureBackupEscrowOperation *)v8;
    if (v8)
    {
      uint64_t v10 = objc_opt_self(v8);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

      id = v6->_id;
      v6->_id = (NSUUID *)v11;

      id v14 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v13),  @"activityLabel");
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      v9 = (SecureBackupEscrowOperation *)v15;
      if (v15)
      {
        uint64_t v16 = objc_opt_self(v15);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

        activityLabel = v6->_activityLabel;
        v6->_activityLabel = (NSString *)v17;

        id v20 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v19),  @"type");
        v21 = (SecureBackupEscrowOperation *)objc_claimAutoreleasedReturnValue(v20);
        v9 = v21;
        if (v21)
        {
          unint64_t v22 = (int)-[SecureBackupEscrowOperation intValue](v21, "intValue");

          v6->_type = v22;
          id v24 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v23),  @"state");
          v25 = (SecureBackupEscrowOperation *)objc_claimAutoreleasedReturnValue(v24);
          v9 = v25;
          if (v25)
          {
            unint64_t v26 = (int)-[SecureBackupEscrowOperation intValue](v25, "intValue");

            v6->_state = v26;
            id v28 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSError, v27),  @"error");
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            uint64_t v30 = objc_opt_self(v29);
            uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);

            error = v6->_error;
            v6->_error = (NSError *)v31;

            id v34 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v33),  @"startTimestamp");
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            uint64_t v36 = objc_opt_self(v35);
            uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);

            startTimestamp = v6->_startTimestamp;
            v6->_startTimestamp = (NSDate *)v37;

            id v40 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v39),  @"endTimestamp");
            v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            uint64_t v42 = objc_opt_self(v41);
            uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);

            endTimestamp = v6->_endTimestamp;
            v6->_endTimestamp = (NSDate *)v43;

            id v46 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v45),  @"finalCheckTimestamp");
            v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            uint64_t v48 = objc_opt_self(v47);
            uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);

            finalCheckTimestamp = v6->_finalCheckTimestamp;
            v6->_finalCheckTimestamp = (NSDate *)v49;

            id v52 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v51),  @"recordId");
            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
            uint64_t v54 = objc_opt_self(v53);
            uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);

            recordId = v6->_recordId;
            v6->_recordId = (NSString *)v55;

            v9 = v6;
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
  id = self->_id;
  id v7 = a3;
  [v7 encodeObject:id forKey:@"id"];
  [v7 encodeObject:self->_activityLabel forKey:@"activityLabel"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_type));
  [v7 encodeObject:v5 forKey:@"type"];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_state));
  [v7 encodeObject:v6 forKey:@"state"];

  [v7 encodeObject:self->_error forKey:@"error"];
  [v7 encodeObject:self->_startTimestamp forKey:@"startTimestamp"];
  [v7 encodeObject:self->_endTimestamp forKey:@"endTimestamp"];
  [v7 encodeObject:self->_finalCheckTimestamp forKey:@"finalCheckTimestamp"];
  [v7 encodeObject:self->_recordId forKey:@"recordId"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation id](self, "id"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setId:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation activityLabel](self, "activityLabel"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setActivityLabel:v9];

  objc_msgSend(v5, "setType:", -[SecureBackupEscrowOperation type](self, "type"));
  objc_msgSend(v5, "setState:", -[SecureBackupEscrowOperation state](self, "state"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation error](self, "error"));
  id v11 = [v10 copyWithZone:a3];
  [v5 setError:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation startTimestamp](self, "startTimestamp"));
  id v13 = [v12 copyWithZone:a3];
  [v5 setStartTimestamp:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation endTimestamp](self, "endTimestamp"));
  id v15 = [v14 copyWithZone:a3];
  [v5 setEndTimestamp:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation finalCheckTimestamp](self, "finalCheckTimestamp"));
  id v17 = [v16 copyWithZone:a3];
  [v5 setFinalCheckTimestamp:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation recordId](self, "recordId"));
  [v5 setRecordId:v18];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation id](self, "id"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 id]);
    if ([v8 isEqual:v9])
    {
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation id](self, "id"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 id]);

      if (v11 != v12) {
        goto LABEL_23;
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation activityLabel](self, "activityLabel"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 activityLabel]);
    if ([v13 isEqual:v14])
    {
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation activityLabel](self, "activityLabel"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 activityLabel]);

      if (v15 != v16) {
        goto LABEL_23;
      }
    }

    id v17 = -[SecureBackupEscrowOperation type](self, "type");
    if (v17 != [v7 type]) {
      goto LABEL_23;
    }
    id v18 = -[SecureBackupEscrowOperation state](self, "state");
    if (v18 != [v7 state]) {
      goto LABEL_23;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation error](self, "error"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    if ([v19 isEqual:v20])
    {
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation error](self, "error"));
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);

      if (v21 != v22) {
        goto LABEL_23;
      }
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation startTimestamp](self, "startTimestamp"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 startTimestamp]);
    if ([v23 isEqual:v24])
    {
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation startTimestamp](self, "startTimestamp"));
      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 startTimestamp]);

      if (v25 != v26) {
        goto LABEL_23;
      }
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation endTimestamp](self, "endTimestamp"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 endTimestamp]);
    if ([v27 isEqual:v28])
    {
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation endTimestamp](self, "endTimestamp"));
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 endTimestamp]);

      if (v29 != v30) {
        goto LABEL_23;
      }
    }

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation finalCheckTimestamp](self, "finalCheckTimestamp"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v7 finalCheckTimestamp]);
    if ([v31 isEqual:v32])
    {

      goto LABEL_26;
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation finalCheckTimestamp](self, "finalCheckTimestamp"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v7 finalCheckTimestamp]);

    if (v33 == v34)
    {
LABEL_26:
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation recordId](self, "recordId"));
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v7 recordId]);
      if ([v36 isEqual:v37])
      {

        char v10 = 1;
      }

      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation recordId](self, "recordId"));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 recordId]);
        BOOL v40 = v38 != v39;

        char v10 = !v40;
      }

      goto LABEL_24;
    }

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation id](self, "id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
}

- (NSDate)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
}

- (NSDate)finalCheckTimestamp
{
  return self->_finalCheckTimestamp;
}

- (void)setFinalCheckTimestamp:(id)a3
{
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)isComplete
{
  return (char *)-[SecureBackupEscrowOperation state](self, "state") - 2 < (char *)6;
}

- (BOOL)didFail
{
  return (char *)-[SecureBackupEscrowOperation state](self, "state") - 3 < (char *)5;
}

- (SecureBackupEscrowOperation)initWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SecureBackupEscrowOperation;
  id v11 = -[SecureBackupEscrowOperation init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[SecureBackupEscrowOperation _updateWithEvent:parentActivity:context:]( v11,  "_updateWithEvent:parentActivity:context:",  v8,  v9,  v10);
    id v13 = v12;
  }

  return v12;
}

- (void)_updateWithEvent:(id)a3 parentActivity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation id](self, "id"));
    if (v12)
    {
      id v13 = (void *)v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation id](self, "id"));
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 operationId]);
      unsigned __int8 v16 = [v14 isEqual:v15];

      if ((v16 & 1) == 0)
      {
        uint64_t v23 = CloudServicesLog(v17);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100047498(self, v8, v24);
        }
LABEL_25:

        goto LABEL_27;
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 operationId]);
    -[SecureBackupEscrowOperation setId:](self, "setId:", v18);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 activityLabel]);
    -[SecureBackupEscrowOperation setActivityLabel:](self, "setActivityLabel:", v19);

    -[SecureBackupEscrowOperation setType:](self, "setType:", [v8 type]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation recordId](self, "recordId"));
    if (v20)
    {
      -[SecureBackupEscrowOperation setRecordId:](self, "setRecordId:", v20);
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 recordId]);
      -[SecureBackupEscrowOperation setRecordId:](self, "setRecordId:", v25);
    }

    uint64_t v27 = objc_opt_class(&OBJC_CLASS___SBEscrowOperationStartEvent, v26);
    if ((objc_opt_isKindOfClass(v8, v27) & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v8 timestamp]);
      -[SecureBackupEscrowOperation setStartTimestamp:](self, "setStartTimestamp:", v29);
    }

    else
    {
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___SBEscrowOperationEndEvent, v28);
      if ((objc_opt_isKindOfClass(v8, v30) & 1) == 0)
      {
LABEL_20:
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation endTimestamp](self, "endTimestamp"));

        if (!v34)
        {
          -[SecureBackupEscrowOperation setState:](self, "setState:", 1LL);
          goto LABEL_27;
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation error](self, "error"));

        if (v35) {
          uint64_t v36 = 3LL;
        }
        else {
          uint64_t v36 = 2LL;
        }
        -[SecureBackupEscrowOperation setState:](self, "setState:", v36);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 currentTime]);
        -[SecureBackupEscrowOperation setFinalCheckTimestamp:](self, "setFinalCheckTimestamp:", v24);
        goto LABEL_25;
      }

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation startTimestamp](self, "startTimestamp"));
      if (v31)
      {
        -[SecureBackupEscrowOperation setStartTimestamp:](self, "setStartTimestamp:", v31);
      }

      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v8 timestamp]);
        -[SecureBackupEscrowOperation setStartTimestamp:](self, "setStartTimestamp:", v32);
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v8 timestamp]);
      -[SecureBackupEscrowOperation setEndTimestamp:](self, "setEndTimestamp:", v33);

      v29 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
      -[SecureBackupEscrowOperation setError:](self, "setError:", v29);
    }

    goto LABEL_20;
  }

  uint64_t v21 = CloudServicesLog(v10);
  unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100047458(v22);
  }

LABEL_27:
}

- (id)updatedOperationWithAdditionalEvent:(id)a3 parentActivity:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[SecureBackupEscrowOperation copy](self, "copy");
  [v11 _updateWithEvent:v10 parentActivity:v9 context:v8];

  return v11;
}

- (id)updatedOperationWithParentActivity:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[SecureBackupEscrowOperation isComplete](self, "isComplete");
  id v9 = -[SecureBackupEscrowOperation copy](self, "copy");
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = -[SecureBackupEscrowOperation newStateWithContext:parentActivity:]( self,  "newStateWithContext:parentActivity:",  v7,  v6);
    if (sub_100005C0C(v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 currentTime]);
      -[SecureBackupEscrowOperation setFinalCheckTimestamp:](self, "setFinalCheckTimestamp:", v11);
    }

    [v9 setState:v10];
  }

  return v9;
}

- (BOOL)isStaleWithcontext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation finalCheckTimestamp](self, "finalCheckTimestamp"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentTime]);
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    [v4 activityRecordRetentionInterval];
    BOOL v10 = v8 > v9;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)newStateWithContext:(id)a3 parentActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[SecureBackupEscrowOperation isComplete](self, "isComplete");
  unint64_t v9 = -[SecureBackupEscrowOperation state](self, "state");
  unint64_t v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 currentBootId]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bootId]);
      unsigned int v13 = [v11 isEqual:v12];

      if (v13)
      {
        unsigned int v14 = [v6 currentPID];
        if (v14 == [v7 pid])
        {
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 currentTime]);
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowOperation startTimestamp](self, "startTimestamp"));
          if (v16)
          {
            [v15 timeIntervalSinceDate:v16];
            double v18 = v17;
          }

          else
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 currentTime]);
            [v15 timeIntervalSinceDate:v19];
            double v18 = v20;
          }

          [v6 operationTimeoutInterval];
          if (v18 <= v21) {
            unint64_t v10 = -[SecureBackupEscrowOperation state](self, "state");
          }
          else {
            unint64_t v10 = 6LL;
          }
        }

        else
        {
          unint64_t v10 = 4LL;
        }
      }

      else
      {
        unint64_t v10 = 5LL;
      }
    }

    else
    {
      unint64_t v10 = 7LL;
    }
  }

  return v10;
}

@end