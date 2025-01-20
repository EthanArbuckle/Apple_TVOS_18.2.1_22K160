@interface CPLPrequeliteRemappedRecord
- (id)description;
@end

@implementation CPLPrequeliteRemappedRecord

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  scopedIdentifier = self->_scopedIdentifier;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopedIdentifier identifier](self->_realScopedIdentifier, "identifier"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[%@ -> %@]", scopedIdentifier, v5);

  return v6;
}

- (void).cxx_destruct
{
}

@end