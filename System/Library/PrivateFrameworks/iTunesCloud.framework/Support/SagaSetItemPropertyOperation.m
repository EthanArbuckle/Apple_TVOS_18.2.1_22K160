@interface SagaSetItemPropertyOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaSetItemPropertyOperation)initWithCoder:(id)a3;
- (SagaSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unsigned int)a5 properties:(id)a6;
- (SagaSetItemPropertyOperation)initWithSagaID:(unsigned int)a3 properties:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSetItemPropertyOperation

- (SagaSetItemPropertyOperation)initWithSagaID:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v8 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v7);
  uint64_t v9 = MSVTCCIdentityForCurrentProcess();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[SagaSetItemPropertyOperation initWithConfiguration:clientIdentity:sagaID:properties:]( self,  "initWithConfiguration:clientIdentity:sagaID:properties:",  v8,  v10,  v4,  v6);

  return v11;
}

- (SagaSetItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unsigned int)a5 properties:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SagaSetItemPropertyOperation;
  v11 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v16,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  v12 = v11;
  if (v11)
  {
    LODWORD(v11->super._status) = a5;
    v13 = (NSError *)[v10 copy];
    error = v12->super._error;
    v12->super._error = v13;
  }

  return v12;
}

- (SagaSetItemPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SagaSetItemPropertyOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v18, "initWithCoder:", v4);
  if (v5)
  {
    LODWORD(v5->super._status) = [v4 decodeInt32ForKey:@"SagaSetItemPropertyOperationSagaIDKey"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSString, v12),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"SagaSetItemPropertyOperationPropertiesKey"]);
    error = v5->super._error;
    v5->super._error = (NSError *)v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaSetItemPropertyOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  LODWORD(self->super._status),  @"SagaSetItemPropertyOperationSagaIDKey",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->super._error forKey:@"SagaSetItemPropertyOperationPropertiesKey"];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaSetItemPropertyOperation - (saga_id = %u)",  LODWORD(self->super._status)));
  id v5 = [[MSVXPCTransaction alloc] initWithName:v4];
  [v5 beginTransaction];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v6 setClientIdentity:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  id v9 = [v8 databaseID];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  LODWORD(self->super._status)));
  v21 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  error = self->super._error;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &error, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:]( &OBJC_CLASS___ICBulkSetItemPropertyRequest,  "requestWithDatabaseID:itemIDs:properties:useLongIDs:",  v9,  v11,  v12,  0LL));

  [v13 setVerificationInteractionLevel:2];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100072038;
  v18[3] = &unk_1001A6E30;
  v18[4] = self;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
  v14 = v19;
  [v8 sendRequest:v13 withResponseHandler:v18];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v16 = MSVTCCIdentityForCurrentProcess();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v15 setClientIdentity:v17];

  [v5 endTransaction];
  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end