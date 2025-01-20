@interface _AFAssertionContextMutation
- (BOOL)isDirty;
- (_AFAssertionContextMutation)initWithBase:(id)a3;
- (double)getExpirationDuration;
- (id)getEffectiveDate;
- (id)getReason;
- (id)getUserInfo;
- (unint64_t)getTimestamp;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDuration:(double)a3;
- (void)setReason:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _AFAssertionContextMutation

- (_AFAssertionContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____AFAssertionContextMutation;
  v6 = -[_AFAssertionContextMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getTimestamp
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    return self->_timestamp;
  }
  else {
    return -[AFAssertionContext timestamp](self->_base, "timestamp");
  }
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getReason
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    v2 = self->_reason;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[AFAssertionContext reason](self->_base, "reason"));
  }
  return v2;
}

- (void)setReason:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getEffectiveDate
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_effectiveDate;
  }
  else {
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue(-[AFAssertionContext effectiveDate](self->_base, "effectiveDate"));
  }
  return v2;
}

- (void)setEffectiveDate:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (double)getExpirationDuration
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0) {
    return self->_expirationDuration;
  }
  -[AFAssertionContext expirationDuration](self->_base, "expirationDuration");
  return result;
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getUserInfo
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0) {
    v2 = self->_userInfo;
  }
  else {
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[AFAssertionContext userInfo](self->_base, "userInfo"));
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
}

@end