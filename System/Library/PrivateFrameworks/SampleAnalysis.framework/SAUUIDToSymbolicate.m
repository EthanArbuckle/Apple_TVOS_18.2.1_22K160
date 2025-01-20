@interface SAUUIDToSymbolicate
- (id)debugDescription;
@end

@implementation SAUUIDToSymbolicate

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  v4 = -[NSMutableArray firstObject](self->_binaries, "firstObject");
  [v4 uuid];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray firstObject](self->_binaries, "firstObject");
  [v6 name];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)[v3 initWithFormat:@"%@ %@ (%lu)", v5, v7, -[NSMutableArray count](self->_binaries, "count")];

  return v8;
}

- (void).cxx_destruct
{
}

@end