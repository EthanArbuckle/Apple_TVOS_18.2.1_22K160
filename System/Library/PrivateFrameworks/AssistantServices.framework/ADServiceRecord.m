@interface ADServiceRecord
- (ADServiceRecord)initWithService:(id)a3 precedence:(int64_t)a4;
- (BOOL)hasEqualOrHigherPrecedenceThanServiceRecord:(id)a3;
- (id)description;
- (id)service;
- (int64_t)precedence;
@end

@implementation ADServiceRecord

- (ADServiceRecord)initWithService:(id)a3 precedence:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADServiceRecord;
  v8 = -[ADServiceRecord init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_service, a3);
    v9->_precedence = a4;
  }

  return v9;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADService identifier](self->_service, "identifier"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@: Identifier: %@>", v4, v5);

  return v6;
}

- (id)service
{
  return self->_service;
}

- (int64_t)precedence
{
  return self->_precedence;
}

- (BOOL)hasEqualOrHigherPrecedenceThanServiceRecord:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  int64_t v5 = -[ADServiceRecord precedence](self, "precedence");
  id v6 = [v4 precedence];

  return v5 != 1 || v6 != 0LL;
}

- (void).cxx_destruct
{
}

@end