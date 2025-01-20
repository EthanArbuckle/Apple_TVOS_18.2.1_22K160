@interface ASCEmptyOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCEmptyOfferMetadata)init;
- (ASCEmptyOfferMetadata)initWithCoder:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation ASCEmptyOfferMetadata

- (ASCEmptyOfferMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASCEmptyOfferMetadata;
  return (ASCEmptyOfferMetadata *)-[ASCOfferMetadata _init](&v3, "_init");
}

- (ASCEmptyOfferMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ASCEmptyOfferMetadata;
  return -[ASCOfferMetadata initWithCoder:](&v4, "initWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 0LL;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___ASCEmptyOfferMetadata);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isEmpty
{
  return 1;
}

@end