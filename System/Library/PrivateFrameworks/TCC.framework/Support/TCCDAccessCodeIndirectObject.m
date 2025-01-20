@interface TCCDAccessCodeIndirectObject
- (TCCDAccessCodeIndirectObject)initWithCodeIdentity:(id)a3;
- (TCCDCodeIdentity)codeIdentity;
- (id)description;
- (void)setCodeIdentity:(id)a3;
@end

@implementation TCCDAccessCodeIndirectObject

- (TCCDAccessCodeIndirectObject)initWithCodeIdentity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TCCDAccessCodeIndirectObject;
  v5 = -[TCCDAccessIndirectObject initWithType:](&v8, "initWithType:", 1LL);
  v6 = v5;
  if (v5) {
    -[TCCDAccessCodeIndirectObject setCodeIdentity:](v5, "setCodeIdentity:", v4);
  }

  return v6;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessCodeIndirectObject codeIdentity](self, "codeIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (TCCDCodeIdentity)codeIdentity
{
  return (TCCDCodeIdentity *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCodeIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end