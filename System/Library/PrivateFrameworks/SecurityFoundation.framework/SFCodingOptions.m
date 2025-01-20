@interface SFCodingOptions
- (NSString)encryptionPassphrase;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)encoding;
- (void)setEncoding:(int64_t)a3;
- (void)setEncryptionPassphrase:(id)a3;
@end

@implementation SFCodingOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setEncoding:*((void *)self->_codingOptionsInternal + 1)];
  [v4 setEncryptionPassphrase:*((void *)self->_codingOptionsInternal + 2)];
  return v4;
}

- (int64_t)encoding
{
  return *((void *)self->_codingOptionsInternal + 1);
}

- (void)setEncoding:(int64_t)a3
{
  *((void *)self->_codingOptionsInternal + 1) = a3;
}

- (NSString)encryptionPassphrase
{
  return (NSString *)(id)[*((id *)self->_codingOptionsInternal + 2) copy];
}

- (void)setEncryptionPassphrase:(id)a3
{
  uint64_t v4 = [a3 copy];
  codingOptionsInternal = self->_codingOptionsInternal;
  v6 = (void *)codingOptionsInternal[2];
  codingOptionsInternal[2] = v4;
}

- (void).cxx_destruct
{
}

@end