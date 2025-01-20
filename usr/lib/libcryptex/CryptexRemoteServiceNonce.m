@interface CryptexRemoteServiceNonce
- (CryptexRemoteServiceNonce)initWithNonce:(const _img4_nonce *)a3;
- (_img4_nonce)nonce;
- (void)dealloc;
@end

@implementation CryptexRemoteServiceNonce

- (CryptexRemoteServiceNonce)initWithNonce:(const _img4_nonce *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CryptexRemoteServiceNonce;
  v4 = -[CryptexRemoteServiceNonce init](&v10, sel_init);
  v5 = (_img4_nonce *)calloc(1uLL, 0x38uLL);
  if (!v5) {
    -[CryptexRemoteServiceNonce initWithNonce:].cold.1(&v11, v12);
  }
  v4->_nonce = v5;
  __int128 v6 = *(_OWORD *)&a3->var0;
  __int128 v7 = *(_OWORD *)&a3->var1[14];
  __int128 v8 = *(_OWORD *)&a3->var1[30];
  *(void *)&v5->var1[46] = *(void *)&a3->var1[46];
  *(_OWORD *)&v5->var1[14] = v7;
  *(_OWORD *)&v5->var1[30] = v8;
  *(_OWORD *)&v5->var0 = v6;
  return v4;
}

- (void)dealloc
{
  if (-[CryptexRemoteServiceNonce nonce](self, "nonce"))
  {
    free(self->_nonce);
    self->_nonce = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CryptexRemoteServiceNonce;
  -[CryptexRemoteServiceNonce dealloc](&v3, sel_dealloc);
}

- (_img4_nonce)nonce
{
  return self->_nonce;
}

- (void)initWithNonce:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end