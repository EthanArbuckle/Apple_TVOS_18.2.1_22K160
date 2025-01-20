@interface IXPromisedTransferToPathSeed
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldCopy;
- (BOOL)tryDeltaCopy;
- (IXPromisedTransferToPathSeed)initWithCoder:(id)a3;
- (NSURL)transferPath;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldCopy:(BOOL)a3;
- (void)setTransferPath:(id)a3;
- (void)setTryDeltaCopy:(BOOL)a3;
@end

@implementation IXPromisedTransferToPathSeed

- (IXPromisedTransferToPathSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IXPromisedTransferToPathSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"transferPath"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    transferPath = v5->_transferPath;
    v5->_transferPath = (NSURL *)v7;

    v5->_shouldCopy = [v4 decodeBoolForKey:@"shouldCopy"];
    v5->_tryDeltaCopy = [v4 decodeBoolForKey:@"tryDeltaCopy"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IXPromisedTransferToPathSeed;
  id v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedTransferToPathSeed transferPath](self, "transferPath", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"transferPath"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXPromisedTransferToPathSeed shouldCopy](self, "shouldCopy"),  @"shouldCopy");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXPromisedTransferToPathSeed tryDeltaCopy](self, "tryDeltaCopy"),  @"tryDeltaCopy");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXPromisedTransferToPathSeed;
  id v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedTransferToPathSeed transferPath](self, "transferPath"));
  [v4 setTransferPath:v5];

  objc_msgSend(v4, "setShouldCopy:", -[IXPromisedTransferToPathSeed shouldCopy](self, "shouldCopy"));
  objc_msgSend(v4, "setTryDeltaCopy:", -[IXPromisedTransferToPathSeed tryDeltaCopy](self, "tryDeltaCopy"));
  return v4;
}

- (NSURL)transferPath
{
  return self->_transferPath;
}

- (void)setTransferPath:(id)a3
{
}

- (BOOL)shouldCopy
{
  return self->_shouldCopy;
}

- (void)setShouldCopy:(BOOL)a3
{
  self->_shouldCopy = a3;
}

- (BOOL)tryDeltaCopy
{
  return self->_tryDeltaCopy;
}

- (void)setTryDeltaCopy:(BOOL)a3
{
  self->_tryDeltaCopy = a3;
}

- (void).cxx_destruct
{
}

@end