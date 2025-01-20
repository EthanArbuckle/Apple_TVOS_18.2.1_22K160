@interface SecureBackupEscrowActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)allOperationsComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)someOperationsReaped;
- (NSArray)operations;
- (NSString)activityLabel;
- (NSUUID)bootId;
- (NSUUID)id;
- (SecureBackupEscrowActivity)initWithCoder:(id)a3;
- (SecureBackupEscrowActivity)initWithInitialEvent:(id)a3 context:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (void)encodeWithCoder:(id)a3;
- (void)setAllOperationsComplete:(BOOL)a3;
- (void)setBootId:(id)a3;
- (void)setId:(id)a3;
- (void)setOperations:(id)a3;
- (void)setPid:(int)a3;
- (void)setSomeOperationsReaped:(BOOL)a3;
@end

@implementation SecureBackupEscrowActivity

- (SecureBackupEscrowActivity)initWithInitialEvent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SecureBackupEscrowActivity;
  v8 = -[SecureBackupEscrowActivity init](&v15, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 activityId]);
    -[SecureBackupEscrowActivity setId:](v8, "setId:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 currentBootId]);
    -[SecureBackupEscrowActivity setBootId:](v8, "setBootId:", v10);

    -[SecureBackupEscrowActivity setPid:](v8, "setPid:", [v7 currentPID]);
    v11 = -[SecureBackupEscrowOperation initWithEvent:parentActivity:context:]( objc_alloc(&OBJC_CLASS___SecureBackupEscrowOperation),  "initWithEvent:parentActivity:context:",  v6,  v8,  v7);
    v16 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    -[SecureBackupEscrowActivity setOperations:](v8, "setOperations:", v12);

    -[SecureBackupEscrowActivity setAllOperationsComplete:]( v8,  "setAllOperationsComplete:",  -[SecureBackupEscrowOperation isComplete](v11, "isComplete"));
    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackupEscrowActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SecureBackupEscrowActivity;
  id v6 = -[SecureBackupEscrowActivity init](&v38, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), @"id");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (SecureBackupEscrowActivity *)v8;
    if (v8)
    {
      uint64_t v10 = objc_opt_self(v8);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

      id = v6->_id;
      v6->_id = (NSUUID *)v11;

      id v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v13), @"bootId");
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      v9 = (SecureBackupEscrowActivity *)v15;
      if (v15)
      {
        uint64_t v16 = objc_opt_self(v15);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

        bootId = v6->_bootId;
        v6->_bootId = (NSUUID *)v17;

        id v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v19), @"pid");
        v21 = (SecureBackupEscrowActivity *)objc_claimAutoreleasedReturnValue(v20);
        v9 = v21;
        if (v21)
        {
          unsigned int v22 = -[SecureBackupEscrowActivity intValue](v21, "intValue");

          v6->_pid = v22;
          id v24 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v23),  @"allOperationsComplete");
          v25 = (SecureBackupEscrowActivity *)objc_claimAutoreleasedReturnValue(v24);
          v9 = v25;
          if (v25)
          {
            unsigned __int8 v26 = -[SecureBackupEscrowActivity BOOLValue](v25, "BOOLValue");

            v6->_allOperationsComplete = v26;
            id v28 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v27),  @"someOperationsReaped");
            v29 = (SecureBackupEscrowActivity *)objc_claimAutoreleasedReturnValue(v28);
            v9 = v29;
            if (v29)
            {
              unsigned __int8 v30 = -[SecureBackupEscrowActivity BOOLValue](v29, "BOOLValue");

              v6->_someOperationsReaped = v30;
              id v32 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(SecureBackupEscrowOperation, v31),  @"operations");
              uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
              v9 = (SecureBackupEscrowActivity *)v33;
              if (v33)
              {
                uint64_t v34 = objc_opt_self(v33);
                uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);

                operations = v6->_operations;
                v6->_operations = (NSArray *)v35;

                v9 = v6;
              }
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
  id = self->_id;
  id v8 = a3;
  [v8 encodeObject:id forKey:@"id"];
  [v8 encodeObject:self->_bootId forKey:@"bootId"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_pid));
  [v8 encodeObject:v5 forKey:@"pid"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_allOperationsComplete));
  [v8 encodeObject:v6 forKey:@"allOperationsComplete"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_someOperationsReaped));
  [v8 encodeObject:v7 forKey:@"someOperationsReaped"];

  [v8 encodeObject:self->_operations forKey:@"operations"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity id](self, "id"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setId:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity bootId](self, "bootId"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setBootId:v9];

  objc_msgSend(v5, "setPid:", -[SecureBackupEscrowActivity pid](self, "pid"));
  objc_msgSend( v5,  "setAllOperationsComplete:",  -[SecureBackupEscrowActivity allOperationsComplete](self, "allOperationsComplete"));
  objc_msgSend( v5,  "setSomeOperationsReaped:",  -[SecureBackupEscrowActivity someOperationsReaped](self, "someOperationsReaped"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity operations](self, "operations"));
  id v11 = [v10 copyWithZone:a3];
  [v5 setOperations:v11];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity id](self, "id"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 id]);
    if ([v8 isEqual:v9])
    {
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity id](self, "id"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 id]);

      if (v11 != v12) {
        goto LABEL_12;
      }
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity bootId](self, "bootId"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bootId]);
    if ([v13 isEqual:v14])
    {
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity bootId](self, "bootId"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 bootId]);

      if (v15 != v16) {
        goto LABEL_12;
      }
    }

    unsigned int v17 = -[SecureBackupEscrowActivity pid](self, "pid");
    if (v17 == [v7 pid])
    {
      unsigned int v18 = -[SecureBackupEscrowActivity allOperationsComplete](self, "allOperationsComplete");
      if (v18 == [v7 allOperationsComplete])
      {
        unsigned int v19 = -[SecureBackupEscrowActivity someOperationsReaped](self, "someOperationsReaped");
        if (v19 == [v7 someOperationsReaped])
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity operations](self, "operations"));
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v7 operations]);
          if ([v21 isEqual:v22])
          {

            char v10 = 1;
          }

          else
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowActivity operations](self, "operations"));
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 operations]);
            BOOL v25 = v23 != v24;

            char v10 = !v25;
          }

          goto LABEL_13;
        }
      }
    }

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSUUID)bootId
{
  return self->_bootId;
}

- (void)setBootId:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)allOperationsComplete
{
  return self->_allOperationsComplete;
}

- (void)setAllOperationsComplete:(BOOL)a3
{
  self->_allOperationsComplete = a3;
}

- (BOOL)someOperationsReaped
{
  return self->_someOperationsReaped;
}

- (void)setSomeOperationsReaped:(BOOL)a3
{
  self->_someOperationsReaped = a3;
}

- (NSArray)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (void).cxx_destruct
{
}

@end