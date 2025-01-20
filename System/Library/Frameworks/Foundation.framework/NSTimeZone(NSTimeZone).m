@interface NSTimeZone(NSTimeZone)
+ (uint64_t)supportsSecureCoding;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSTimeZone;
- (uint64_t)initWithCoder:()NSTimeZone;
@end

@implementation NSTimeZone(NSTimeZone)

+ (uint64_t)supportsSecureCoding
{
  return 1LL;
}

- (uint64_t)encodeWithCoder:()NSTimeZone
{
  v6[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "name"), @"NS.name");
    return objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "data"), @"NS.data");
  }

  else
  {
    v6[0] = [a1 name];
    return [a3 encodeValueOfObjCType:"@" at:v6];
  }

- (uint64_t)initWithCoder:()NSTimeZone
{
  v13[1] = *(id *)MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.name"];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.data"];
    goto LABEL_14;
  }

  if ([a3 versionForClassName:@"NSTimeZone"])
  {
    [a3 decodeValueOfObjCType:"@" at:v13 size:8];
    [a3 decodeValueOfObjCType:"@" at:&v12 size:8];
    if (_NSIsNSString())
    {
      if (!v12)
      {
        v8 = 0LL;
        goto LABEL_16;
      }

      if (_NSIsNSData())
      {
        v8 = v12;
LABEL_16:
        uint64_t v10 = [a1 initWithName:v13[0] data:v8];

        id v11 = v12;
LABEL_19:

        return v10;
      }
    }
  }

  else
  {
    [a3 decodeValueOfObjCType:"@" at:v13 size:8];
    if (_NSIsNSString())
    {
      id v9 = (id)[(id)objc_opt_class() timeZoneWithAbbreviation:v13[0]];
      if (v9)
      {
        uint64_t v10 = (uint64_t)v9;
      }

      else
      {
        uint64_t v10 = [a1 initWithName:v13[0]];
      }

      id v11 = v13[0];
      goto LABEL_19;
    }
  }

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

@end