@interface CKSSShare
- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 share:(ccss_shamir_share *)a4;
- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 x:(unsigned int)a4 y:(id)a5;
- (ccss_shamir_share)share;
- (id)y;
- (unsigned)x;
- (void)dealloc;
@end

@implementation CKSSShare

- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 x:(unsigned int)a4 y:(id)a5
{
  id v6 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CKSSShare;
  v7 = -[CKSSShare init](&v12, sel_init);
  if (v7
    && (size_t v8 = ccss_sizeof_share(),
        v7->_share_size = v8,
        v7->_share = (ccss_shamir_share *)malloc(v8),
        ccss_shamir_share_init(),
        id v9 = v6,
        [v9 bytes],
        [v9 length],
        ccss_shamir_share_import()))
  {
    free(v7->_share);
    printf("Failed on import with share import");
    v10 = 0LL;
  }

  else
  {
    v10 = v7;
  }

  return v10;
}

- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 share:(ccss_shamir_share *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKSSShare;
  v5 = -[CKSSShare init](&v9, sel_init);
  if (v5)
  {
    size_t v6 = ccss_sizeof_share();
    v5->_share_size = v6;
    v7 = (ccss_shamir_share *)malloc(v6);
    v5->_share = v7;
    memcpy(v7, a4, v6);
  }

  return v5;
}

- (unsigned)x
{
  id v2 = [objc_alloc(MEMORY[0x189603FB8]) initWithLength:ccss_shamir_share_sizeof_y()];
  [v2 mutableBytes];
  [v2 length];
  ccss_shamir_share_export();

  return 0;
}

- (id)y
{
  id v2 = [objc_alloc(MEMORY[0x189603FB8]) initWithLength:ccss_shamir_share_sizeof_y()];
  [v2 mutableBytes];
  [v2 length];
  else {
    id v3 = v2;
  }

  return v3;
}

- (ccss_shamir_share)share
{
  return self->_share;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKSSShare;
  -[CKSSShare dealloc](&v3, sel_dealloc);
}

@end