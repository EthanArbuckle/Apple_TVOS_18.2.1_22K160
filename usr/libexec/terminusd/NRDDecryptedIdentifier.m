@interface NRDDecryptedIdentifier
- (id)description;
@end

@implementation NRDDecryptedIdentifier

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self)
  {
    uint64_t version = self->_version;
    v5 = self->_identity;
    nrUUID = self->_nrUUID;
  }

  else
  {
    v5 = 0LL;
    uint64_t version = 0LL;
    nrUUID = 0LL;
  }

  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%u/%@/%@", version, v5, nrUUID);

  return v7;
}

- (void).cxx_destruct
{
}

@end