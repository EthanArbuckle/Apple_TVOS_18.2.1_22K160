@interface MRDGroupSessionJoinRequest
- (MRDGroupSessionJoinRequest)initWithIdentifier:(id)a3 identity:(id)a4 oobKeys:(id)a5;
- (MRDGroupSessionJoinRequest)initWithProtobuf:(id)a3;
- (MRUserIdentity)identity;
- (NSArray)oobKeys;
- (NSString)identifier;
- (_MRGroupSessionJoinRequestProtobuf)protobuf;
- (id)description;
- (id)redactedDescription;
@end

@implementation MRDGroupSessionJoinRequest

- (MRDGroupSessionJoinRequest)initWithIdentifier:(id)a3 identity:(id)a4 oobKeys:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MRDGroupSessionJoinRequest;
  v12 = -[MRDGroupSessionJoinRequest init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_identity, a4);
    objc_storeStrong((id *)&v13->_oobKeys, a5);
  }

  return v13;
}

- (MRDGroupSessionJoinRequest)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDGroupSessionJoinRequest;
  v5 = -[MRDGroupSessionJoinRequest init](&v17, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    id v9 = objc_alloc(&OBJC_CLASS___MRUserIdentity);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    id v11 = -[MRUserIdentity initWithProtobuf:](v9, "initWithProtobuf:", v10);
    identity = v5->_identity;
    v5->_identity = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 oobKeys]);
    v14 = (NSArray *)[v13 copy];
    oobKeys = v5->_oobKeys;
    v5->_oobKeys = v14;
  }

  return v5;
}

- (_MRGroupSessionJoinRequestProtobuf)protobuf
{
  v3 = objc_alloc_init(&OBJC_CLASS____MRGroupSessionJoinRequestProtobuf);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionJoinRequest identifier](self, "identifier"));
  id v5 = [v4 copy];
  -[_MRGroupSessionJoinRequestProtobuf setIdentifier:](v3, "setIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionJoinRequest identity](self, "identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 protobuf]);
  -[_MRGroupSessionJoinRequestProtobuf setIdentity:](v3, "setIdentity:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionJoinRequest oobKeys](self, "oobKeys"));
  id v9 = [v8 mutableCopy];
  -[_MRGroupSessionJoinRequestProtobuf setOobKeys:](v3, "setOobKeys:", v9);

  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p identifier=%@ identity=%@ oobKeys=%@>",  objc_opt_class(self),  self,  self->_identifier,  self->_identity,  self->_oobKeys);
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class(self);
  identifier = self->_identifier;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSArray count](self->_oobKeys, "count")));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p identifier=%@ identity=[redacted] oobKeysCount=%@>",  v3,  self,  identifier,  v5));

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (NSArray)oobKeys
{
  return self->_oobKeys;
}

- (void).cxx_destruct
{
}

@end