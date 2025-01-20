@interface SecureBackupLog
+ (BOOL)supportsSecureCoding;
- (BOOL)allActivitiesComplete;
- (BOOL)isEqual:(id)a3;
- (NSArray)activities;
- (SecureBackupLog)initWithActivities:(id)a3 allComplete:(BOOL)a4 totalOperations:(unint64_t)a5;
- (SecureBackupLog)initWithCoder:(id)a3;
- (unint64_t)totalOperations;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllOperationsWithBlock:(id)a3;
@end

@implementation SecureBackupLog

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackupLog)initWithActivities:(id)a3 allComplete:(BOOL)a4 totalOperations:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SecureBackupLog;
  v10 = -[SecureBackupLog init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activities, a3);
    v11->_allActivitiesComplete = a4;
    v11->_totalOperations = a5;
    v12 = v11;
  }

  return v11;
}

- (SecureBackupLog)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SecureBackupLog;
  v6 = -[SecureBackupLog init](&v22, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v5),  @"allActivitiesComplete");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned __int8 v9 = [v8 BOOLValue];

    v6->_allActivitiesComplete = v9;
    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v10),  @"totalOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [v12 unsignedIntegerValue];

    v6->_totalOperations = (unint64_t)v13;
    id v15 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(SecureBackupEscrowActivity, v14),  @"activities");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (SecureBackupLog *)v16;
    if (v16)
    {
      uint64_t v18 = objc_opt_self(v16);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

      activities = v6->_activities;
      v6->_activities = (NSArray *)v19;

      v17 = v6;
    }
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL allActivitiesComplete = self->_allActivitiesComplete;
  id v7 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", allActivitiesComplete));
  [v7 encodeObject:v5 forKey:@"allActivitiesComplete"];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_totalOperations));
  [v7 encodeObject:v6 forKey:@"totalOperations"];

  [v7 encodeObject:self->_activities forKey:@"activities"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SecureBackupLog allActivitiesComplete](self, "allActivitiesComplete");
  if (v5 == [v4 allActivitiesComplete]
    && (id v6 = -[SecureBackupLog totalOperations](self, "totalOperations"), v6 == [v4 totalOperations]))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupLog activities](self, "activities"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 activities]);
    if ([v7 isEqual:v8])
    {

      char v9 = 1;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupLog activities](self, "activities"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 activities]);
      BOOL v13 = v11 != v12;

      char v9 = !v13;
    }
  }

  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)enumerateAllOperationsWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupLog activities](self, "activities"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030954;
  v7[3] = &unk_100069A70;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (BOOL)allActivitiesComplete
{
  return self->_allActivitiesComplete;
}

- (unint64_t)totalOperations
{
  return self->_totalOperations;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void).cxx_destruct
{
}

@end