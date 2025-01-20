@interface CryptexRemoteServiceNonceAttr
- (CryptexRemoteServiceNonceAttr)init;
- (unint64_t)getNonceDomainIndex;
- (unint64_t)image_type;
- (unint64_t)persistence;
- (unsigned)ndom_handle;
- (void)getNonceDomainIndex;
- (void)setImage_type:(unint64_t)a3;
- (void)setNdom_handle:(unsigned int)a3;
- (void)setPersistence:(unint64_t)a3;
@end

@implementation CryptexRemoteServiceNonceAttr

- (CryptexRemoteServiceNonceAttr)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CryptexRemoteServiceNonceAttr;
  result = -[CryptexRemoteServiceNonceAttr init](&v3, sel_init);
  *(_OWORD *)&result->_image_type = xmmword_188226460;
  result->_ndom_handle = -1;
  return result;
}

- (unint64_t)getNonceDomainIndex
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[CryptexRemoteServiceNonceAttr image_type](self, "image_type");
  if (!v3) {
    return 3LL;
  }
  if (v3 != 1) {
    -[CryptexRemoteServiceNonceAttr getNonceDomainIndex].cold.1(&v5, v6, self);
  }
  if (-[CryptexRemoteServiceNonceAttr persistence](self, "persistence")) {
    return 4LL;
  }
  else {
    return 2LL;
  }
}

- (unsigned)ndom_handle
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (-[CryptexRemoteServiceNonceAttr image_type](self, "image_type") != 2) {
    -[CryptexRemoteServiceNonceAttr getNonceDomainIndex].cold.1(&v4, v5, self);
  }
  return self->_ndom_handle;
}

- (unint64_t)image_type
{
  return self->_image_type;
}

- (void)setImage_type:(unint64_t)a3
{
  self->_image_type = a3;
}

- (unint64_t)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(unint64_t)a3
{
  self->_persistence = a3;
}

- (void)setNdom_handle:(unsigned int)a3
{
  self->_ndom_handle = a3;
}

- (void)getNonceDomainIndex
{
}

@end