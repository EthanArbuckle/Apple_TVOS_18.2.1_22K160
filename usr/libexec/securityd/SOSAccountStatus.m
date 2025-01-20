@interface SOSAccountStatus
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (id)description;
- (id)init:(int)a3 error:(id)a4;
- (int)status;
- (void)setError:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation SOSAccountStatus

- (id)init:(int)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SOSAccountStatus;
  v8 = -[SOSAccountStatus init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SOSAccountStatus, v6);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  unsigned __int8 v9 = 0;
  if (v5 && (isKindOfClass & 1) != 0)
  {
    id v10 = v5;
    unsigned int v11 = -[SOSAccountStatus status](self, "status");
    if (v11 != [v10 status])
    {
      unsigned __int8 v9 = 0;
LABEL_12:

      goto LABEL_13;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountStatus error](self, "error"));
    if (v12 || (v3 = (void *)objc_claimAutoreleasedReturnValue([v10 error])) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountStatus error](self, "error"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
      unsigned __int8 v9 = [v13 isEqual:v14];

      if (v12)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      unsigned __int8 v9 = 1;
    }

    goto LABEL_11;
  }

- (id)description
{
  uint64_t v3 = SOSCCGetStatusDescription(-[SOSAccountStatus status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountStatus error](self, "error"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SOSStatus: %@ (%@)>",  v3,  v4));

  return v5;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end