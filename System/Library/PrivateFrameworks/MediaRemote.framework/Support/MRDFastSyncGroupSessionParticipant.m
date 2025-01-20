@interface MRDFastSyncGroupSessionParticipant
- (BOOL)connected;
- (BOOL)guest;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6;
- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7;
- (MRUserIdentity)identity;
- (NSString)description;
- (NSString)identifier;
- (unint64_t)hash;
@end

@implementation MRDFastSyncGroupSessionParticipant

- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MRDFastSyncGroupSessionParticipant;
  v15 = -[MRDFastSyncGroupSessionParticipant init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_identity, a4);
    v16->_connected = a5;
    v16->_guest = a6;
    v16->_hidden = a7;
  }

  return v16;
}

- (MRDFastSyncGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6
{
  return -[MRDFastSyncGroupSessionParticipant initWithIdentifier:identity:connected:guest:hidden:]( self,  "initWithIdentifier:identity:connected:guest:hidden:",  a3,  a4,  a5,  a6,  0LL);
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDFastSyncGroupSessionParticipant identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDFastSyncGroupSessionParticipant identity](self, "identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDFastSyncGroupSessionParticipant connected](self, "connected")));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDFastSyncGroupSessionParticipant guest](self, "guest")));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDFastSyncGroupSessionParticipant hidden](self, "hidden")));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
  id v13 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@: identifier=%@, identity=%@, connected=%@, guest=%@, hidden=%@>",  v4,  v5,  v6,  v8,  v10,  v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRDFastSyncGroupSessionParticipant *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      identifier = self->_identifier;
      v7 = v4->_identifier;
      v8 = identifier;
      v9 = v8;
      if (v8 == v7) {
        unsigned __int8 v10 = 1;
      }
      else {
        unsigned __int8 v10 = -[NSString isEqual:](v8, "isEqual:", v7);
      }
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)guest
{
  return self->_guest;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
}

@end