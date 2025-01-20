@interface CKCBCorecryptoECScalar
- (BOOL)isEqual:(id)a3;
- (CKCBCorecryptoECScalar)initWithData:(id)a3 inGroup:(ccec_cp *)a4 reduction:(BOOL)a5 corecryptoError:(int *)a6;
- (CKCBCorecryptoECScalar)initWithRandomScalarInGroup:(ccec_cp *)a3;
- (CKCBCorecryptoECScalar)initWithScalarPointer:(unint64_t *)a3 forGroup:(ccec_cp *)a4;
- (CKCBCorecryptoECScalar)initWithx963Representation:(id)a3 group:(ccec_cp *)a4;
- (ccec_cp)group;
- (const)corecryptoScalar;
- (id)add:(id)a3 corecryptoError:(int *)a4;
- (id)inverseModOrder;
- (id)mapToCurve_SSWU_RandomOracle;
- (id)multiply:(id)a3 corecryptoError:(int *)a4;
- (id)serializedBigEndianScalar;
- (id)sub:(id)a3 corecryptoError:(int *)a4;
- (id)x963Representation;
- (unint64_t)scalarAllocationSizeForGroup:(ccec_cp *)a3;
- (void)dealloc;
@end

@implementation CKCBCorecryptoECScalar

- (unint64_t)scalarAllocationSizeForGroup:(ccec_cp *)a3
{
  return 8 * a3->var0;
}

- (CKCBCorecryptoECScalar)initWithx963Representation:(id)a3 group:(ccec_cp *)a4
{
  v5 = self;
  v14[1] = *MEMORY[0x1895F89C0];
  MEMORY[0x1895F8858](self, a2, a3);
  v7 = (void **)((char *)v14 - v6);
  id v9 = v8;
  [v9 length];
  id v10 = v9;
  [v10 bytes];

  if (ccec_x963_import_priv())
  {
    v11 = 0LL;
  }

  else
  {
    v12 = malloc(-[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](v5, "scalarAllocationSizeForGroup:", a4));
    memcpy( v12,  &v7[3 * **v7 + 2],  -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](v5, "scalarAllocationSizeForGroup:", a4));
    v5 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:](v5, "initWithScalarPointer:forGroup:", v12, a4);
    v11 = v5;
  }

  return v11;
}

- (CKCBCorecryptoECScalar)initWithScalarPointer:(unint64_t *)a3 forGroup:(ccec_cp *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CKCBCorecryptoECScalar;
  result = -[CKCBCorecryptoECScalar init](&v7, sel_init);
  if (result)
  {
    result->_group = a4;
    result->_corecryptoScalar = a3;
  }

  return result;
}

- (id)x963Representation
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_msgSend( (id)((uint64_t (*)(CKCBCorecryptoECScalar *, SEL))MEMORY[0x1895F8858])(self, a2),  "serializedBigEndianScalar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCBCorecryptoECScalar group](self, "group");
  [v3 length];
  id v4 = v3;
  [v4 bytes];
  int v16 = ccec_raw_import_priv_only();
  if (v16)
  {
    v5 = 0LL;
  }

  else
  {
    uint64_t v6 = -[CKCBCorecryptoECPoint initWithGeneratorForCP:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECPoint),  "initWithGeneratorForCP:",  self->_group);
    -[CKCBCorecryptoECPoint multiply:corecryptoError:](v6, "multiply:corecryptoError:", self, &v16);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (v16)
    {
      v5 = 0LL;
    }

    else
    {
      [v7 serializedPublicKey:0];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 length];
      id v10 = v9;
      [v10 bytes];
      int v16 = ccec_raw_import_pub();
      if (v16)
      {
        v5 = 0LL;
      }

      else
      {
        id v11 = [MEMORY[0x189603FB8] dataWithLength:3 * ((unint64_t)(cczp_bitlen() + 7) >> 3) + 1];
        [v11 mutableBytes];
        int v16 = ccec_x963_export();
        if (v16)
        {
          v5 = 0LL;
        }

        else
        {
          v12 = (void *)MEMORY[0x189603F48];
          id v13 = v11;
          v5 = (void *)objc_msgSend( v12,  "_newZeroingDataWithBytes:length:",  objc_msgSend(v13, "bytes"),  objc_msgSend(v13, "length"));
          id v14 = v13;
          memset_s( (void *)[v14 mutableBytes],  objc_msgSend(v14, "length"),  0,  objc_msgSend(v14, "length"));
        }
      }
    }
  }

  return v5;
}

- (CKCBCorecryptoECScalar)initWithRandomScalarInGroup:(ccec_cp *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKCBCorecryptoECScalar;
  id v4 = -[CKCBCorecryptoECScalar init](&v9, sel_init);
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  v4->_group = a3;
  ccrng();
  uint64_t v6 = (unint64_t *)malloc( -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:]( v5,  "scalarAllocationSizeForGroup:",  a3));
  if (!ccec_generate_scalar_fips_retry())
  {
    v5->_corecryptoScalar = v6;
LABEL_7:
    objc_super v7 = v5;
    goto LABEL_8;
  }

  free(v6);
  objc_super v7 = 0LL;
LABEL_8:

  return v7;
}

- (CKCBCorecryptoECScalar)initWithData:(id)a3 inGroup:(ccec_cp *)a4 reduction:(BOOL)a5 corecryptoError:(int *)a6
{
  id v9 = a3;
  cczp_n();
  size_t v10 = -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", a4);
  id v11 = malloc(2 * v10);
  v12 = malloc(v10);
  [v9 length];
  id v13 = v9;
  [v13 bytes];

  int uint = ccn_read_uint();
  *a6 = uint;
  if (uint)
  {
    free(v11);
  }

  else
  {
    int v15 = cczp_mod();
    *a6 = v15;
    free(v11);
    if (!v15)
    {
      self =  -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]( self,  "initWithScalarPointer:forGroup:",  v12,  a4);
      int v16 = self;
      goto LABEL_5;
    }
  }

  free(v12);
  int v16 = 0LL;
LABEL_5:

  return v16;
}

- (id)serializedBigEndianScalar
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 length];
  id v3 = v2;
  [v3 mutableBytes];
  if ((ccn_write_uint_padded_ct() & 0x80000000) != 0)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    id v4 = (void *)MEMORY[0x189603F48];
    id v5 = v3;
    uint64_t v6 = (void *)objc_msgSend( v4,  "_newZeroingDataWithBytes:length:",  objc_msgSend(v5, "bytes"),  objc_msgSend(v5, "length"));
  }

  id v7 = v3;
  memset_s((void *)[v7 mutableBytes], objc_msgSend(v7, "length"), 0, objc_msgSend(v7, "length"));

  return v6;
}

- (id)mapToCurve_SSWU_RandomOracle
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = ((uint64_t (*)(CKCBCorecryptoECScalar *, SEL))MEMORY[0x1895F8858])(self, a2);
  id v5 = (char *)v8 - v4;
  uint64_t v6 = *(void *)(v3 + 8);
  if ((v6 == MEMORY[0x18959DE48]() || v6 == MEMORY[0x18959DE54]() || v6 == ccec_cp_521())
    && (-[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar"), !map_to_curve_sswu()))
  {
    return  -[CKCBCorecryptoECPoint initWithPublicKey:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECPoint),  "initWithPublicKey:",  v5);
  }

  else
  {
    return 0LL;
  }

- (id)add:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  id v7 = malloc( -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:]( self,  "scalarAllocationSizeForGroup:",  -[CKCBCorecryptoECScalar group](self, "group")));
  -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
  [v6 corecryptoScalar];

  int v8 = cczp_add();
  *a4 = v8;
  if (v8)
  {
    free(v7);
    id v9 = 0LL;
  }

  else
  {
    id v9 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECScalar),  "initWithScalarPointer:forGroup:",  v7,  self->_group);
  }

  return v9;
}

- (id)sub:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  id v7 = -[CKCBCorecryptoECScalar group](self, "group");
  if (v7 == (ccec_cp *)[v6 group])
  {
    int v8 = malloc( -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:]( self,  "scalarAllocationSizeForGroup:",  -[CKCBCorecryptoECScalar group](self, "group")));
    -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
    [v6 corecryptoScalar];
    int v9 = cczp_sub();
    *a4 = v9;
    if (!v9)
    {
      size_t v10 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECScalar),  "initWithScalarPointer:forGroup:",  v8,  self->_group);
      goto LABEL_5;
    }

    free(v8);
  }

  size_t v10 = 0LL;
LABEL_5:

  return v10;
}

- (id)multiply:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  id v7 = -[CKCBCorecryptoECScalar group](self, "group");
  if (v7 == (ccec_cp *)[v6 group])
  {
    uint64_t v8 = cczp_n();
    int v9 = malloc(8 * v8);
    -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
    [v6 corecryptoScalar];
    int v10 = cczp_mul();
    *a4 = v10;
    if (!v10)
    {
      id v11 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECScalar),  "initWithScalarPointer:forGroup:",  v9,  self->_group);
      goto LABEL_5;
    }

    free(v9);
  }

  id v11 = 0LL;
LABEL_5:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = -[CKCBCorecryptoECScalar group](self, "group");
  if (v5 == (ccec_cp *)[v4 group])
  {
    [v4 corecryptoScalar];
    BOOL v6 = ccn_cmp() == 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)inverseModOrder
{
  uint64_t v3 = malloc( -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:]( self,  "scalarAllocationSizeForGroup:",  -[CKCBCorecryptoECScalar group](self, "group")));
  -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
  if (cczp_inv())
  {
    free(v3);
    id v4 = 0LL;
  }

  else
  {
    id v4 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]( objc_alloc(&OBJC_CLASS___CKCBCorecryptoECScalar),  "initWithScalarPointer:forGroup:",  v3,  self->_group);
  }

  return v4;
}

- (void)dealloc
{
  if (self->_corecryptoScalar)
  {
    rsize_t v3 = -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:]( self,  "scalarAllocationSizeForGroup:",  -[CKCBCorecryptoECScalar group](self, "group"));
    memset_s((void *)self->_corecryptoScalar, v3, 0, v3);
    free((void *)self->_corecryptoScalar);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CKCBCorecryptoECScalar;
  -[CKCBCorecryptoECScalar dealloc](&v4, sel_dealloc);
}

- (ccec_cp)group
{
  return self->_group;
}

- (const)corecryptoScalar
{
  return self->_corecryptoScalar;
}

@end