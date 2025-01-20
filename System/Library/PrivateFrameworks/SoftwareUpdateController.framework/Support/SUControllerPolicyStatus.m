@interface SUControllerPolicyStatus
+ (BOOL)supportsSecureCoding;
+ (id)policyStateName:(int64_t)a3;
- (BOOL)fallenBackToSecondary;
- (NSError)currentError;
- (NSString)updateUUID;
- (SUControllerPolicyStatus)init;
- (SUControllerPolicyStatus)initWithCoder:(id)a3;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreDescriptor)secondaryDescriptor;
- (SUCorePolicy)scanPolicy;
- (SUCoreProgress)currentProgress;
- (id)copy;
- (id)description;
- (id)policyStateName;
- (int64_t)policyState;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentError:(id)a3;
- (void)setCurrentProgress:(id)a3;
- (void)setFallenBackToSecondary:(BOOL)a3;
- (void)setPolicyState:(int64_t)a3;
- (void)setPrimaryDescriptor:(id)a3;
- (void)setScanPolicy:(id)a3;
- (void)setSecondaryDescriptor:(id)a3;
- (void)setUpdateUUID:(id)a3;
@end

@implementation SUControllerPolicyStatus

- (SUControllerPolicyStatus)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SUControllerPolicyStatus;
  v2 = -[SUControllerPolicyStatus init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    scanPolicy = v2->_scanPolicy;
    v2->_policyState = 0LL;
    v2->_scanPolicy = 0LL;

    updateUUID = v3->_updateUUID;
    v3->_updateUUID = 0LL;

    primaryDescriptor = v3->_primaryDescriptor;
    v3->_primaryDescriptor = 0LL;

    secondaryDescriptor = v3->_secondaryDescriptor;
    v3->_secondaryDescriptor = 0LL;

    v3->_fallenBackToSecondary = 0;
    currentProgress = v3->_currentProgress;
    v3->_currentProgress = 0LL;

    currentError = v3->_currentError;
    v3->_currentError = 0LL;
  }

  return v3;
}

- (SUControllerPolicyStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SUControllerPolicyStatus;
  v5 = -[SUControllerPolicyStatus init](&v25, "init");
  if (v5)
  {
    v5->_policyState = (int64_t)[v4 decodeInt64ForKey:@"policyState"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(SUCorePolicy) forKey:@"scanPolicy"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    scanPolicy = v5->_scanPolicy;
    v5->_scanPolicy = (SUCorePolicy *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"updateUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    updateUUID = v5->_updateUUID;
    v5->_updateUUID = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"primaryDescriptor"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    primaryDescriptor = v5->_primaryDescriptor;
    v5->_primaryDescriptor = (SUCoreDescriptor *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"primaryDescriptor"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    secondaryDescriptor = v5->_secondaryDescriptor;
    v5->_secondaryDescriptor = (SUCoreDescriptor *)v16;

    v5->_fallenBackToSecondary = [v4 decodeBoolForKey:@"fallenBackToSecondary"];
    id v18 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreProgress) forKey:@"currentProgress"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    currentProgress = v5->_currentProgress;
    v5->_currentProgress = (SUCoreProgress *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"currentError"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    currentError = v5->_currentError;
    v5->_currentError = (NSError *)v22;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUControllerPolicyStatus policyState](self, "policyState"),  @"policyState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus scanPolicy](self, "scanPolicy"));
  [v4 encodeObject:v5 forKey:@"scanPolicy"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus updateUUID](self, "updateUUID"));
  [v4 encodeObject:v6 forKey:@"updateUUID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus primaryDescriptor](self, "primaryDescriptor"));
  [v4 encodeObject:v7 forKey:@"primaryDescriptor"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus secondaryDescriptor](self, "secondaryDescriptor"));
  [v4 encodeObject:v8 forKey:@"secondaryDescriptor"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUControllerPolicyStatus fallenBackToSecondary](self, "fallenBackToSecondary"),  @"fallenBackToSecondary");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentProgress](self, "currentProgress"));
  [v4 encodeObject:v9 forKey:@"currentProgress"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentError](self, "currentError"));
  [v4 encodeObject:v10 forKey:@"currentError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___SUControllerPolicyStatus);
  -[SUControllerPolicyStatus setPolicyState:]( v3,  "setPolicyState:",  -[SUControllerPolicyStatus policyState](self, "policyState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus scanPolicy](self, "scanPolicy"));
  -[SUControllerPolicyStatus setScanPolicy:](v3, "setScanPolicy:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus updateUUID](self, "updateUUID"));
  -[SUControllerPolicyStatus setUpdateUUID:](v3, "setUpdateUUID:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus primaryDescriptor](self, "primaryDescriptor"));
  -[SUControllerPolicyStatus setPrimaryDescriptor:](v3, "setPrimaryDescriptor:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus secondaryDescriptor](self, "secondaryDescriptor"));
  -[SUControllerPolicyStatus setSecondaryDescriptor:](v3, "setSecondaryDescriptor:", v7);

  -[SUControllerPolicyStatus setFallenBackToSecondary:]( v3,  "setFallenBackToSecondary:",  -[SUControllerPolicyStatus fallenBackToSecondary](self, "fallenBackToSecondary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentProgress](self, "currentProgress"));
  -[SUControllerPolicyStatus setCurrentProgress:](v3, "setCurrentProgress:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentError](self, "currentError"));
  -[SUControllerPolicyStatus setCurrentError:](v3, "setCurrentError:", v9);

  return v3;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus policyStateName](self, "policyStateName"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus scanPolicy](self, "scanPolicy"));
  if (v16) {
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus scanPolicy](self, "scanPolicy"));
  }
  else {
    uint64_t v19 = @"none";
  }
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus updateUUID](self, "updateUUID"));
  if (v4) {
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus updateUUID](self, "updateUUID"));
  }
  else {
    id v18 = @"none";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus primaryDescriptor](self, "primaryDescriptor"));
  if (v5) {
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus primaryDescriptor](self, "primaryDescriptor"));
  }
  else {
    v17 = @"none";
  }
  id v15 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus secondaryDescriptor](self, "secondaryDescriptor"));
  if (v6) {
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus secondaryDescriptor](self, "secondaryDescriptor"));
  }
  else {
    uint64_t v7 = @"none";
  }
  if (-[SUControllerPolicyStatus fallenBackToSecondary](self, "fallenBackToSecondary")) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentProgress](self, "currentProgress"));
  if (v9) {
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentProgress](self, "currentProgress"));
  }
  else {
    id v10 = @"none";
  }
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentError](self, "currentError"));
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyStatus currentError](self, "currentError"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n              policyState: %@\n               scanPolicy: %@\n               updateUUID: %@\n        primaryDescriptor: %@\n      secondaryDescriptor: %@\n    fallenBackToSecondary: %@\n          currentProgress: %@\n             currentError: %@\n<<<]",  v3,  v19,  v18,  v17,  v7,  v8,  v10,  v12));
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n              policyState: %@\n               scanPolicy: %@\n               updateUUID: %@\n        primaryDescriptor: %@\n      secondaryDescriptor: %@\n    fallenBackToSecondary: %@\n          currentProgress: %@\n             currentError: %@\n<<<]",  v3,  v19,  v18,  v17,  v7,  v8,  v10,  @"none"));
  }

  if (v9) {
  if (v6)
  }

  if (v5) {
  if (v15)
  }

  if (v16) {
  return v13;
  }
}

- (id)policyStateName
{
  return +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyStatus policyState](self, "policyState"));
}

+ (id)policyStateName:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"OutOfRange(%ld)",  a3));
  }
  else {
    return off_100064A88[a3];
  }
}

- (int64_t)policyState
{
  return self->_policyState;
}

- (void)setPolicyState:(int64_t)a3
{
  self->_policyState = a3;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (void)setPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)secondaryDescriptor
{
  return self->_secondaryDescriptor;
}

- (void)setSecondaryDescriptor:(id)a3
{
}

- (BOOL)fallenBackToSecondary
{
  return self->_fallenBackToSecondary;
}

- (void)setFallenBackToSecondary:(BOOL)a3
{
  self->_fallenBackToSecondary = a3;
}

- (SUCoreProgress)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(id)a3
{
}

- (NSError)currentError
{
  return self->_currentError;
}

- (void)setCurrentError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end