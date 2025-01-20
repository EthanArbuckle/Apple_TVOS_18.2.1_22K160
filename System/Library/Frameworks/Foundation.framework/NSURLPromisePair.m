@interface NSURLPromisePair
+ (BOOL)supportsSecureCoding;
+ (id)pairWithLogicalURL:(id)a3 physicalURL:(id)a4;
+ (id)pairWithURL:(id)a3;
- (NSURL)URL;
- (NSURL)logicalURL;
- (NSURL)physicalURL;
- (NSURLPromisePair)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLPromisePair

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pairWithURL:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    v5 = (const void *)_CFURLPromiseCopyPhysicalURL();
    id v3 = (id)[a1 pairWithLogicalURL:v3 physicalURL:v5];
    if (v5) {
      CFRelease(v5);
    }
  }

  return v3;
}

+ (id)pairWithLogicalURL:(id)a3 physicalURL:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  v6 = objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[1] = [a3 copy];
    v6[2] = [a4 copy];
  }

  return v6;
}

- (NSURLPromisePair)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_logicalURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSLogicalURL"];
    self->_physicalURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPhysicalURL"];
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"_NSURLPromisePair should only ever be decoded by XPC" userInfo:0]);
    -[NSURLPromisePair encodeWithCoder:](v6, v7, v8);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeObject:self->_logicalURL forKey:@"NSLogicalURL"];
    [a3 encodeObject:self->_physicalURL forKey:@"NSPhysicalURL"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
    -[NSURLPromisePair dealloc](v5, v6);
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLPromisePair;
  -[NSURLPromisePair dealloc](&v3, sel_dealloc);
}

- (NSURL)URL
{
  v2 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604030]),  "initWithString:",  -[NSURL absoluteString](self->_logicalURL, "absoluteString"));
  if (v2) {
    _CFURLPromiseSetPhysicalURL();
  }
  return (NSURL *)v2;
}

- (NSURL)logicalURL
{
  return self->_logicalURL;
}

- (NSURL)physicalURL
{
  return self->_physicalURL;
}

@end