@interface SFCoder
- (SFCoder)initWithOptions:(id)a3;
- (SFCodingOptions)options;
- (id)encodeTopLevelValue:(id)a3 error:(id *)a4;
- (void)setOptions:(id)a3;
@end

@implementation SFCoder

- (SFCoder)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SFCoder;
  v6 = -[SFCoder init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_coderInternal + 1, a3);
  }

  return v7;
}

- (id)encodeTopLevelValue:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (SFCodingOptions)options
{
  return (SFCodingOptions *)(id)[*((id *)self->_coderInternal + 1) copy];
}

- (void)setOptions:(id)a3
{
  uint64_t v4 = [a3 copy];
  coderInternal = self->_coderInternal;
  v6 = (void *)coderInternal[1];
  coderInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end