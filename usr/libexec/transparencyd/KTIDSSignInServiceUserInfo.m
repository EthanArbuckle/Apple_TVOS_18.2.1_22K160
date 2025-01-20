@interface KTIDSSignInServiceUserInfo
- (KTIDSSignInServiceUserInfo)initWithType:(unint64_t)a3 status:(unint64_t)a4;
- (KTIDSSignInServiceUserInfo)initWithUserInfo:(id)a3;
- (id)description;
- (unint64_t)status;
- (unint64_t)type;
- (void)setStatus:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation KTIDSSignInServiceUserInfo

- (KTIDSSignInServiceUserInfo)initWithType:(unint64_t)a3 status:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KTIDSSignInServiceUserInfo;
  v6 = -[KTIDSSignInServiceUserInfo init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    -[KTIDSSignInServiceUserInfo setType:](v6, "setType:", a3);
    -[KTIDSSignInServiceUserInfo setStatus:](v7, "setStatus:", a4);
    v8 = v7;
  }

  return v7;
}

- (KTIDSSignInServiceUserInfo)initWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  id v6 = [v4 status];

  return -[KTIDSSignInServiceUserInfo initWithType:status:](self, "initWithType:status:", v5, v6);
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTIDSSignInServiceUserInfo: type %d status: %d",  -[KTIDSSignInServiceUserInfo type](self, "type"),  -[KTIDSSignInServiceUserInfo status](self, "status"));
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

@end