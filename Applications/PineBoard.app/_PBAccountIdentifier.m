@interface _PBAccountIdentifier
+ (id)anyAccountIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)accountType;
- (NSString)altDSID;
- (_PBAccountIdentifier)initWithAccountType:(id)a3 altDSID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _PBAccountIdentifier

- (_PBAccountIdentifier)initWithAccountType:(id)a3 altDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBAccountIdentifier;
  v8 = -[_PBAccountIdentifier init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    accountType = v8->_accountType;
    v8->_accountType = v9;

    v11 = (NSString *)[v7 copy];
    altDSID = v8->_altDSID;
    v8->_altDSID = v11;
  }

  return v8;
}

+ (id)anyAccountIdentifier
{
  if (qword_100470270 != -1) {
    dispatch_once(&qword_100470270, &stru_1003D2D60);
  }
  return (id)qword_100470268;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v4 = [v3 appendString:self->_accountType];
  id v5 = [v3 appendString:self->_altDSID];
  id v6 = [v3 hash];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS____PBAccountIdentifier, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  v7));

  accountType = self->_accountType;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007179C;
  v21[3] = &unk_1003D2130;
  id v10 = v4;
  id v22 = v10;
  id v11 = [v8 appendObject:accountType counterpart:v21];
  altDSID = self->_altDSID;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1000717BC;
  v19 = &unk_1003D2130;
  id v20 = v10;
  id v13 = v10;
  id v14 = [v8 appendObject:altDSID counterpart:&v16];
  LOBYTE(altDSID) = objc_msgSend(v8, "isEqual", v16, v17, v18, v19);

  return (char)altDSID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
}

@end