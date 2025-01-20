@interface ADCommandExecutionContext
- (ADCommandExecutionContext)initWithInfo:(id)a3;
- (ADPeerInfo)originPeerInfo;
- (AFCommandExecutionInfo)info;
- (BOOL)isFromRemote;
- (BOOL)presentedUIResponse;
- (NSDate)creationDate;
- (NSString)personaId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)performBlock:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setPresentedUIResponse:(BOOL)a3;
- (void)updateInfoUsingBlock:(id)a3;
@end

@implementation ADCommandExecutionContext

- (ADCommandExecutionContext)initWithInfo:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADCommandExecutionContext;
  v5 = -[ADCommandExecutionContext init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (AFCommandExecutionInfo *)[v4 copy];
    info = v6->_info;
    v6->_info = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v9;

    uint64_t v11 = voucher_copy();
    voucher = v6->_voucher;
    v6->_voucher = (OS_voucher *)v11;
  }

  return v6;
}

- (void)updateInfoUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandExecutionContext info](self, "info"));
    if (v5)
    {
      v6 = v5;
      id v7 = (id)objc_claimAutoreleasedReturnValue([v5 mutatedCopyWithMutator:v10]);
    }

    else
    {
      id v7 = +[AFCommandExecutionInfo newWithBuilder:](&OBJC_CLASS___AFCommandExecutionInfo, "newWithBuilder:", v10);
    }

    os_unfair_lock_lock(&self->_lock);
    v8 = (AFCommandExecutionInfo *)[v7 copy];
    info = self->_info;
    self->_info = v8;

    os_unfair_lock_unlock(&self->_lock);
    id v4 = v10;
  }
}

- (BOOL)isFromRemote
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandExecutionContext info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 originPeerInfo]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (ADPeerInfo)originPeerInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandExecutionContext info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 originPeerInfo]);

  if (v3) {
    BOOL v4 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v3);
  }
  else {
    BOOL v4 = 0LL;
  }

  return v4;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandExecutionContext info](self, "info"));
  BOOL v4 = objc_alloc(&OBJC_CLASS___NSString);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADCommandExecutionContext;
  id v5 = -[ADCommandExecutionContext description](&v16, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 executionID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 requestID]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 turnId]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 originPeerInfo]);
  uint64_t CompactDescription = AFPeerInfoGetCompactDescription(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(CompactDescription);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 instanceInfo]);
  objc_super v14 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ (id = %@, requestID = %@, turnID = %@, originPeer = %@, instance = %@)",  v6,  v7,  v8,  v9,  v12,  v13);

  return v14;
}

- (AFCommandExecutionInfo)info
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_info;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)performBlock:(id)a3
{
  BOOL v4 = self->_voucher;
  id v5 = (void (**)(void))a3;
  uint64_t v6 = voucher_adopt(v4);
  v5[2](v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc(&OBJC_CLASS___ADCommandExecutionContext);
  id v5 = -[AFCommandExecutionInfo copy](self->_info, "copy");
  uint64_t v6 = -[ADCommandExecutionContext initWithInfo:](v4, "initWithInfo:", v5);

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)presentedUIResponse
{
  return self->_presentedUIResponse;
}

- (void)setPresentedUIResponse:(BOOL)a3
{
  self->_presentedUIResponse = a3;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end