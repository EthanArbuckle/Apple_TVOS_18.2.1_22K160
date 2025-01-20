@interface ASCPlaceholderOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCPlaceholderOfferMetadata)init;
- (ASCPlaceholderOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (unint64_t)hash;
@end

@implementation ASCPlaceholderOfferMetadata

- (ASCPlaceholderOfferMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASCPlaceholderOfferMetadata;
  return (ASCPlaceholderOfferMetadata *)-[ASCOfferMetadata _init](&v3, "_init");
}

- (ASCPlaceholderOfferMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ASCPlaceholderOfferMetadata;
  return -[ASCOfferMetadata initWithCoder:](&v4, "initWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 1361LL;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___ASCPlaceholderOfferMetadata);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isPlaceholder
{
  return 1;
}

@end