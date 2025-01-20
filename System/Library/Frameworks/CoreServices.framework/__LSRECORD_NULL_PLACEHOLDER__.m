@interface __LSRECORD_NULL_PLACEHOLDER__
+ (BOOL)supportsSecureCoding;
- (__LSRECORD_NULL_PLACEHOLDER__)initWithCoder:(id)a3;
- (id)debugDescription;
- (id)description;
@end

@implementation __LSRECORD_NULL_PLACEHOLDER__

- (id)description
{
  return @"(null)";
}

- (id)debugDescription
{
  return @"(LSRecord.null)";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__LSRECORD_NULL_PLACEHOLDER__)initWithCoder:(id)a3
{
  v4 = (__LSRECORD_NULL_PLACEHOLDER__ *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end