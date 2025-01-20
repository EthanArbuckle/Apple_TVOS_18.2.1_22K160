@interface CKCBCorecryptoECPoint
+ (unint64_t)compressedx962PointByteCountForCurveParameters:(ccec_cp *)a3;
+ (unint64_t)groupOrderByteCountForCP:(ccec_cp *)a3;
- (BOOL)isEqual:(id)a3;
- (CKCBCorecryptoECPoint)initWithGeneratorForCP:(ccec_cp *)a3;
- (CKCBCorecryptoECPoint)initWithPublicKey:(ccec_pub_ctx *)a3;
- (ccec_affine_point)point;
- (ccec_cp)group;
- (id)add:(id)a3 corecryptoError:(int *)a4;
- (id)initFromPublicKeyBytes:(id)a3 inGroup:(ccec_cp *)a4 compressed:(BOOL)a5 corecryptoError:(int *)a6;
- (id)initPoint:(ccec_affine_point *)a3 onGroup:(ccec_cp *)a4;
- (id)multiply:(id)a3 corecryptoError:(int *)a4;
- (id)serializedPublicKey:(BOOL)a3;
- (id)sub:(id)a3 corecryptoError:(int *)a4;
- (unint64_t)pointAllocationSizeForGroup:(ccec_cp *)a3;
- (void)dealloc;
@end

@implementation CKCBCorecryptoECPoint

- (unint64_t)pointAllocationSizeForGroup:(ccec_cp *)a3
{
  return 3 * ((unint64_t)(cczp_bitlen() + 7) >> 3);
}

- (id)initPoint:(ccec_affine_point *)a3 onGroup:(ccec_cp *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CKCBCorecryptoECPoint;
  id result = -[CKCBCorecryptoECPoint init](&v7, sel_init);
  if (result)
  {
    *((void *)result + 1) = a4;
    *((void *)result + 2) = a3;
  }

  return result;
}

- (id)initFromPublicKeyBytes:(id)a3 inGroup:(ccec_cp *)a4 compressed:(BOOL)a5 corecryptoError:(int *)a6
{
  BOOL v7 = a5;
  v20[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v12 = (void *)MEMORY[0x1895F8858](v9, v10, v11);
  v14 = (char *)v20 - v13;
  [v12 length];
  id v15 = v9;
  [v15 bytes];
  if (v7) {
    int v16 = ccec_compressed_x962_import_pub();
  }
  else {
    int v16 = ccec_raw_import_pub();
  }
  *a6 = v16;
  if (v16)
  {
    cc_clear();
    v17 = 0LL;
  }

  else
  {
    v18 = -[CKCBCorecryptoECPoint initWithPublicKey:](self, "initWithPublicKey:", v14);
    cc_clear();
    self = v18;
    v17 = self;
  }

  return v17;
}

- (CKCBCorecryptoECPoint)initWithGeneratorForCP:(ccec_cp *)a3
{
  size_t v5 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:");
  v6 = malloc(v5);
  unint64_t var0 = a3->var0;
  v8 = (char *)&a3[1] + 16 * a3->var0 + 8 * a3->var0;
  bzero(v6, v5);
  memcpy(v6, v8, 16 * var0);
  return (CKCBCorecryptoECPoint *)-[CKCBCorecryptoECPoint initPoint:onGroup:](self, "initPoint:onGroup:", v6, a3);
}

- (CKCBCorecryptoECPoint)initWithPublicKey:(ccec_pub_ctx *)a3
{
  v4 = &a3->var1[1];
  unint64_t var0 = a3->var0;
  size_t v6 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", a3->var0);
  BOOL v7 = malloc(v6);
  memcpy(v7, v4, v6);
  cc_clear();
  return (CKCBCorecryptoECPoint *)-[CKCBCorecryptoECPoint initPoint:onGroup:](self, "initPoint:onGroup:", v7, var0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  size_t v5 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v5 == (ccec_cp *)[v4 group])
  {
    -[CKCBCorecryptoECPoint group](self, "group");
    -[CKCBCorecryptoECPoint point](self, "point");
    [v4 point];
    BOOL v6 = ccn_cmp() == 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)serializedPublicKey:(BOOL)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  group = self->_group;
  uint64_t v6 = cczp_bitlen();
  unint64_t v9 = (unint64_t)(v6 + 7) >> 3;
  if (a3)
  {
    MEMORY[0x1895F8858](v6, v7, v8);
    *(void *)((char *)v17 - v10) = group;
    memcpy((char *)&v17[2] - v10, self->_point, 2 * v9);
    id v11 = [objc_alloc(MEMORY[0x189603FB8]) initWithLength:ccec_compressed_x962_export_pub_size()];
    [v11 mutableBytes];
    int v12 = ccec_compressed_x962_export_pub();
    cc_clear();
    if (v12) {
      id v13 = 0LL;
    }
    else {
      id v13 = v11;
    }

    return v13;
  }

  else
  {
    id v14 = [objc_alloc(MEMORY[0x189603FB8]) initWithLength:2 * v9];
    [v14 mutableBytes];
    ccn_write_uint_padded_ct();
    id v15 = v14;
    [v15 mutableBytes];
    ccn_write_uint_padded_ct();
    return v15;
  }

+ (unint64_t)groupOrderByteCountForCP:(ccec_cp *)a3
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

+ (unint64_t)compressedx962PointByteCountForCurveParameters:(ccec_cp *)a3
{
  return ccec_compressed_x962_export_pub_size();
}

- (id)add:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v7 == (ccec_cp *)[v6 group])
  {
    uint64_t v8 = ccrng();
    if (!*a4)
    {
      group = self->_group;
      uint64_t v14 = MEMORY[0x1895F8858](v8, v9, v10);
      MEMORY[0x1895F8858](v14, v15, v16);
      -[CKCBCorecryptoECPoint point](self, "point");
      int v17 = ccec_projectify();
      *a4 = v17;
      if (v17 || ([v6 point], int v18 = ccec_projectify(), (*a4 = v18) != 0))
      {
        cc_clear();
      }

      else
      {
        *a4 = ccec_full_add();
        cc_clear();
        if (!*a4)
        {
          v19 = malloc(-[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", group));
          *a4 = ccec_affinify();
          cc_clear();
          if (!*a4)
          {
            id v11 = -[CKCBCorecryptoECPoint initPoint:onGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECPoint),  "initPoint:onGroup:",  v19,  group);
            goto LABEL_4;
          }

          free(v19);
          goto LABEL_9;
        }
      }

      cc_clear();
LABEL_9:
      id v11 = 0LL;
      goto LABEL_4;
    }
  }

  id v11 = 0LL;
LABEL_4:

  return v11;
}

- (id)sub:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v7 == (ccec_cp *)[v6 group])
  {
    uint64_t v8 = ccrng();
    if (!*a4)
    {
      group = self->_group;
      uint64_t v14 = MEMORY[0x1895F8858](v8, v9, v10);
      MEMORY[0x1895F8858](v14, v15, v16);
      -[CKCBCorecryptoECPoint point](self, "point");
      int v17 = ccec_projectify();
      *a4 = v17;
      if (v17 || ([v6 point], int v18 = ccec_projectify(), (*a4 = v18) != 0))
      {
        cc_clear();
      }

      else
      {
        *a4 = ccec_full_sub();
        cc_clear();
        if (!*a4)
        {
          v19 = malloc(-[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", group));
          *a4 = ccec_affinify();
          cc_clear();
          if (!*a4)
          {
            id v11 = -[CKCBCorecryptoECPoint initPoint:onGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECPoint),  "initPoint:onGroup:",  v19,  group);
            goto LABEL_4;
          }

          free(v19);
          goto LABEL_9;
        }
      }

      cc_clear();
LABEL_9:
      id v11 = 0LL;
      goto LABEL_4;
    }
  }

  id v11 = 0LL;
LABEL_4:

  return v11;
}

- (id)multiply:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v7 == (ccec_cp *)[v6 group])
  {
    uint64_t v8 = ccrng();
    if (!*a4)
    {
      group = self->_group;
      uint64_t v14 = MEMORY[0x1895F8858](v8, v9, v10);
      MEMORY[0x1895F8858](v14, v15, v16);
      -[CKCBCorecryptoECPoint point](self, "point");
      int v17 = ccec_projectify();
      *a4 = v17;
      if (v17)
      {
        cc_clear();
      }

      else
      {
        [v6 corecryptoScalar];
        *a4 = ccec_mult_blinded();
        cc_clear();
        if (!*a4)
        {
          int v18 = malloc(-[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", group));
          *a4 = ccec_affinify();
          cc_clear();
          if (!*a4)
          {
            id v11 = -[CKCBCorecryptoECPoint initPoint:onGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECPoint),  "initPoint:onGroup:",  v18,  group);
            goto LABEL_4;
          }

          free(v18);
          goto LABEL_9;
        }
      }

      cc_clear();
LABEL_9:
      id v11 = 0LL;
      goto LABEL_4;
    }
  }

  id v11 = 0LL;
LABEL_4:

  return v11;
}

- (void)dealloc
{
  if (self->_point)
  {
    rsize_t v3 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:]( self,  "pointAllocationSizeForGroup:",  -[CKCBCorecryptoECPoint group](self, "group"));
    memset_s(self->_point, v3, 0, v3);
    free(self->_point);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CKCBCorecryptoECPoint;
  -[CKCBCorecryptoECPoint dealloc](&v4, sel_dealloc);
}

- (ccec_cp)group
{
  return self->_group;
}

- (ccec_affine_point)point
{
  return self->_point;
}

@end