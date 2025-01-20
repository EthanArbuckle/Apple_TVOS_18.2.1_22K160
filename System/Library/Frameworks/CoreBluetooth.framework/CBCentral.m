@interface CBCentral
- (NSUInteger)maximumUpdateValueLength;
- (id)description;
@end

@implementation CBCentral

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = -[CBPeer identifier](self, "identifier");
  [v5 UUIDString];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %p identifier = %@, MTU = %lu>", v4, self, v6, -[CBCentral maximumUpdateValueLength](self, "maximumUpdateValueLength")];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUInteger)maximumUpdateValueLength
{
  unint64_t v2 = -[CBPeer mtuLength](self, "mtuLength");
  if (v2 - 3 >= 0x200) {
    return 512LL;
  }
  else {
    return v2 - 3;
  }
}

@end