LABEL_47:
    BN_CTX_end(ctx);
    return 0;
  }

  v12 = 105;
  v13 = 217;
LABEL_8:
  ERR_put_error(3, 0, v12, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/div.c", v13);
  return 0;
}

int BN_nnmod(BIGNUM *r, const BIGNUM *m, const BIGNUM *d, BN_CTX *ctx)
{
  int result = BN_div(0LL, r, m, d, ctx);
  if (result)
  {
    if (r->neg)
    {
      if (d->neg) {
        v7 = BN_sub;
      }
      else {
        v7 = BN_add;
      }
      return ((uint64_t (*)(BIGNUM *, BIGNUM *, const BIGNUM *))v7)(r, r, d);
    }

    else
    {
      return 1;
    }
  }

  return result;
}

uint64_t bn_reduce_once( unint64_t *a1, unint64_t *a2, uint64_t a3, unint64_t *bp, uint64_t num)
{
  if (a1 == a2) {
    bn_reduce_once_cold_1();
  }
  uint64_t v8 = a3 - bn_sub_words(a1, a2, bp, num);
  bn_select_words((uint64_t *)a1, v8, (uint64_t *)a2, (uint64_t *)a1, num);
  return v8;
}

uint64_t bn_reduce_once_in_place( unint64_t *ap, uint64_t a2, const unint64_t *a3, unint64_t *rp, uint64_t num)
{
  uint64_t v8 = a2 - bn_sub_words(rp, ap, a3, num);
  bn_select_words((uint64_t *)ap, v8, (uint64_t *)ap, (uint64_t *)rp, num);
  return v8;
}

uint64_t *bn_mod_sub_words( unint64_t *a1, const unint64_t *a2, const unint64_t *a3, const unint64_t *a4, unint64_t *a5, uint64_t num)
{
  unint64_t v10 = bn_sub_words(a1, a2, a3, num);
  bn_add_words(a5, a1, a4, num);
  return bn_select_words((uint64_t *)a1, -(uint64_t)v10, (uint64_t *)a5, (uint64_t *)a1, num);
}

uint64_t bn_mod_add_words( unint64_t *a1, const unint64_t *a2, const unint64_t *a3, const unint64_t *a4, unint64_t *a5, uint64_t num)
{
  unint64_t v10 = bn_add_words(a1, a2, a3, num);
  return bn_reduce_once_in_place(a1, v10, a4, a5, num);
}

uint64_t bn_mod_add_consttime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BN_CTX *ctx)
{
  unint64_t v10 = bn_resized_from_ctx(a2, *(int *)(a4 + 8), ctx);
  v11 = bn_resized_from_ctx(a3, *(int *)(a4 + 8), ctx);
  v12 = bn_scratch_space_from_ctx(*(int *)(a4 + 8), ctx);
  if (v10) {
    BOOL v13 = v11 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13 || v12 == 0LL;
  if (v14 || (p_d = &v12->d, !bn_wexpand((void **)a1, *(int *)(a4 + 8))))
  {
    uint64_t v23 = 0LL;
  }

  else
  {
    v16 = *(unint64_t **)a1;
    d = v10->d;
    v18 = v11->d;
    v19 = *(const unint64_t **)a4;
    v20 = *p_d;
    uint64_t v21 = *(int *)(a4 + 8);
    unint64_t v22 = bn_add_words(*(unint64_t **)a1, d, v18, *(_DWORD *)(a4 + 8));
    bn_reduce_once_in_place(v16, v22, v19, v20, v21);
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a4 + 8);
    *(_DWORD *)(a1 + 16) = 0;
    uint64_t v23 = 1LL;
  }

  BN_CTX_end(ctx);
  return v23;
}

const BIGNUM *bn_resized_from_ctx(uint64_t a1, unint64_t a2, BN_CTX *ctx)
{
  v4 = (const BIGNUM *)a1;
  if (*(int *)(a1 + 8) >= a2)
  {
    if (!bn_fits_in_words(a1, a2)) {
      bn_resized_from_ctx_cold_1();
    }
  }

  else
  {
    v5 = bn_scratch_space_from_ctx(a2, ctx);
    if (v5 && (uint64_t v6 = (uint64_t)v5, BN_copy(v5, v4)))
    {
      else {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

BIGNUM *bn_scratch_space_from_ctx(unint64_t a1, BN_CTX *ctx)
{
  v3 = BN_CTX_get(ctx);
  v4 = v3;
  if (v3)
  {
    if (bn_wexpand(&v3->d, a1))
    {
      v4->neg = 0;
      v4->top = a1;
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

uint64_t bn_mod_sub_consttime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BN_CTX *ctx)
{
  unint64_t v10 = bn_resized_from_ctx(a2, *(int *)(a4 + 8), ctx);
  v11 = bn_resized_from_ctx(a3, *(int *)(a4 + 8), ctx);
  v12 = bn_scratch_space_from_ctx(*(int *)(a4 + 8), ctx);
  if (v10) {
    BOOL v13 = v11 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13 || v12 == 0LL;
  if (v14 || (p_d = &v12->d, !bn_wexpand((void **)a1, *(int *)(a4 + 8))))
  {
    uint64_t v16 = 0LL;
  }

  else
  {
    bn_mod_sub_words(*(unint64_t **)a1, v10->d, v11->d, *(const unint64_t **)a4, *p_d, *(int *)(a4 + 8));
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a4 + 8);
    *(_DWORD *)(a1 + 16) = 0;
    uint64_t v16 = 1LL;
  }

  BN_CTX_end(ctx);
  return v16;
}

int BN_mod_mul(BIGNUM *r, const BIGNUM *a, const BIGNUM *b, const BIGNUM *m, BN_CTX *ctx)
{
  unint64_t v10 = BN_CTX_get(ctx);
  if (!v10) {
    goto LABEL_6;
  }
  v11 = v10;
  if (a == b)
  {
    if (BN_sqr(v10, a, ctx)) {
      goto LABEL_4;
    }
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }

  if (!BN_mul(v10, a, b, ctx)) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v12 = BN_nnmod(r, v11, m, ctx) != 0;
LABEL_7:
  BN_CTX_end(ctx);
  return v12;
}

int BN_mod_sqr(BIGNUM *r, const BIGNUM *a, const BIGNUM *m, BN_CTX *ctx)
{
  int result = BN_sqr(r, a, ctx);
  if (result) {
    return BN_div(0LL, r, r, m, ctx);
  }
  return result;
}

BOOL bn_mod_lshift_consttime(BIGNUM *a1, const BIGNUM *a2, int a3, uint64_t a4, BN_CTX *a5)
{
  v9 = bn_scratch_space_from_ctx(*(int *)(a4 + 8), a5);
  BOOL v10 = v9 != 0LL;
  if (v9)
  {
    if (a3 >= 1)
    {
      p_d = &v9->d;
      do
      {
        d = a1->d;
        BOOL v13 = *(const unint64_t **)a4;
        BOOL v14 = *p_d;
        uint64_t v15 = *(int *)(a4 + 8);
        unint64_t v16 = bn_add_words(a1->d, a1->d, a1->d, *(_DWORD *)(a4 + 8));
        bn_reduce_once_in_place(d, v16, v13, v14, v15);
        --a3;
      }

      while (a3);
    }

    a1->neg = 0;
  }

  BN_CTX_end(a5);
  return v10;
}

uint64_t bn_mod_lshift1_consttime(uint64_t a1, uint64_t a2, uint64_t a3, BN_CTX *ctx)
{
  return bn_mod_add_consttime(a1, a2, a2, a3, ctx);
}

uint64_t EVP_PKEY_is_opaque(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  else {
    return 0LL;
  }
}

int EVP_PKEY_cmp(const EVP_PKEY *a, const EVP_PKEY *b)
{
  if (a->save_type != b->save_type) {
    return -1;
  }
  ptr = a->pkey.ptr;
  if (!ptr) {
    return -2;
  }
  v5 = (uint64_t (*)(const EVP_PKEY *, const EVP_PKEY *))*((void *)ptr + 19);
  if (v5)
  {
    int result = v5(a, b);
    if (result < 1) {
      return result;
    }
    ptr = a->pkey.ptr;
  }

  v7 = (uint64_t (*)(const EVP_PKEY *, const EVP_PKEY *))*((void *)ptr + 5);
  if (v7) {
    return v7(a, b);
  }
  else {
    return -2;
  }
}

uint64_t evp_pkey_set_method(uint64_t result, _DWORD *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    v5 = *(uint64_t (**)(uint64_t))(v4 + 160);
    if (v5)
    {
      int result = v5(result);
      *(void *)(v3 + 8) = 0LL;
    }
  }

  *(void *)(v3 + 16) = a2;
  *(_DWORD *)(v3 + 4) = *a2;
  return result;
}

int EVP_PKEY_size(EVP_PKEY *pkey)
{
  else {
    return 0;
  }
}

uint64_t *ec_GFp_nistp_recode_scalar_bits(uint64_t *result, void *a2, unint64_t a3)
{
  unint64_t v3 = ((a3 >> 5) - 1) & a3 | (63 - a3) & -(uint64_t)(a3 >> 5);
  *int result = -(uint64_t)(a3 >> 5) & 1;
  *a2 = (v3 & 1) + (v3 >> 1);
  return result;
}

uint64_t pkey_x25519_copy()
{
  return 1LL;
}

uint64_t pkey_x25519_keygen(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = OPENSSL_malloc(0x41uLL);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  evp_pkey_set_method(a2, &x25519_asn1_meth);
  X25519_keypair(v4, v4 + 32);
  uint64_t v5 = 1LL;
  v4[64] = 1;
  OPENSSL_free(*(void **)(a2 + 8));
  *(void *)(a2 + 8) = v4;
  return v5;
}

uint64_t pkey_x25519_derive(uint64_t a1, char *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3 || (uint64_t v4 = *(void *)(a1 + 24)) == 0)
  {
    int v9 = 117;
    int v10 = 46;
    goto LABEL_10;
  }

  uint64_t v6 = *(void *)(v3 + 8);
  v7 = *(int64x2_t **)(v4 + 8);
  if (v6) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int v9 = 117;
    int v10 = 53;
LABEL_10:
    ERR_put_error(6, 0, v9, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519.c", v10);
    return 0LL;
  }

  if (!*(_BYTE *)(v6 + 64))
  {
    int v9 = 130;
    int v10 = 58;
    goto LABEL_10;
  }

  if (a2)
  {
    if (*a3 <= 0x1FuLL)
    {
      int v9 = 100;
      int v10 = 64;
      goto LABEL_10;
    }

    if (!X25519(a2, (__int128 *)(v6 + 32), v7))
    {
      int v9 = 134;
      int v10 = 68;
      goto LABEL_10;
    }
  }

  *a3 = 32LL;
  return 1LL;
}

uint64_t pkey_x25519_ctrl(uint64_t a1, int a2)
{
  if (a2 == 3) {
    return 1LL;
  }
  ERR_put_error(6, 0, 101, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519.c", 85);
  return 0LL;
}

double ec_GFp_mont_mul()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  __b[864] = *MEMORY[0x1895F89C0];
  memset(__b, 170, 0x1B00uLL);
  ec_GFp_simple_point_set_to_infinity(v7, (uint64_t)__b);
  ec_GFp_simple_point_copy((uint64_t)&__b[27], v4);
  BOOL v8 = &__b[54];
  for (unint64_t i = 2LL; i != 32; ++i)
  {
    if ((i & 1) != 0) {
      ec_GFp_mont_add(v7, (uint64_t)v8, (uint64_t)&__b[27], (uint64_t)(v8 - 27));
    }
    else {
      ec_GFp_mont_dbl(v7, v8, &__b[27 * (i >> 1)]);
    }
    v8 += 27;
  }

  unsigned int v10 = EC_GROUP_order_bits(v7);
  if (!v10) {
    return ec_GFp_simple_point_set_to_infinity(v7, (uint64_t)v6);
  }
  unsigned int v12 = v10;
  unsigned int v13 = v10 - 1;
  int v14 = 1;
  unsigned int v15 = v10;
  do
  {
    unsigned int v16 = v13;
    if (!v14) {
      ec_GFp_mont_dbl(v7, v6, v6);
    }
    if (-858993459 * v16 <= 0x33333333)
    {
      unint64_t v17 = *(int *)(v7 + 264);
      char is_bit_set_words = bn_is_bit_set_words(v2, v17, v15 + 3);
      char v19 = (8 * bn_is_bit_set_words(v2, v17, v15 + 2)) | (16 * is_bit_set_words);
      char v20 = v19 | (4 * bn_is_bit_set_words(v2, v17, v15 + 1));
      char v21 = v20 | (2 * bn_is_bit_set_words(v2, v17, v15));
      char v22 = bn_is_bit_set_words(v2, v17, v16);
      uint64_t v23 = 0LL;
      uint64_t v27 = 0LL;
      uint64_t v24 = (v21 | v22);
      v25 = __b;
      memset(v26, 0, sizeof(v26));
      do
      {
        ec_point_select(v7, (uint64_t *)v26, ((v23++ ^ v24) - 1) >> 63, v25, (uint64_t *)v26);
        v25 += 27;
      }

      while (v23 != 32);
      if (v14) {
        *(void *)&double result = ec_GFp_simple_point_copy((uint64_t)v6, (uint64_t)v26).n128_u64[0];
      }
      else {
        ec_GFp_mont_add(v7, (uint64_t)v6, (uint64_t)v6, (uint64_t)v26);
      }
      int v14 = 0;
    }

    unsigned int v13 = v16 - 1;
    unsigned int v15 = v16;
  }

  while (v16 - 1 < v12);
  if (v14) {
    return ec_GFp_simple_point_set_to_infinity(v7, (uint64_t)v6);
  }
  return result;
}

double ec_GFp_mont_mul_base()
{
  return ec_GFp_mont_mul();
}

double ec_GFp_mont_mul_batch()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v19 = v2;
  uint64_t v20 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned int v12 = v11;
  uint64_t v13 = v0;
  __b[1377] = *MEMORY[0x1895F89C0];
  memset(__b, 170, 0x2B08uLL);
  ec_GFp_mont_batch_precomp(v13, (uint64_t)__b, v10);
  ec_GFp_mont_batch_precomp(v13, (uint64_t)&__b[459], v6);
  if (v4) {
    ec_GFp_mont_batch_precomp(v13, (uint64_t)&__b[918], v4);
  }
  unsigned int v14 = EC_GROUP_order_bits(v13);
  char v16 = 0;
  unsigned int v17 = v14;
  do
  {
    while (1)
    {
      if ((v16 & 1) != 0) {
        ec_GFp_mont_dbl(v13, v12, v12);
      }
      if (5 * (v17 / 5) != v17) {
        break;
      }
      unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21[11] = v18;
      v21[12] = v18;
      v21[9] = v18;
      v21[10] = v18;
      v21[7] = v18;
      v21[8] = v18;
      v21[5] = v18;
      v21[6] = v18;
      v21[3] = v18;
      v21[4] = v18;
      v21[1] = v18;
      v21[2] = v18;
      v21[0] = v18;
      ec_GFp_mont_batch_get_window(v13, (uint64_t)v21, __b, v8, v17);
      if ((v16 & 1) != 0) {
        ec_GFp_mont_add(v13, (uint64_t)v12, (uint64_t)v12, (uint64_t)v21);
      }
      else {
        ec_GFp_simple_point_copy((uint64_t)v12, (uint64_t)v21);
      }
      ec_GFp_mont_batch_get_window(v13, (uint64_t)v21, &__b[459], v20, v17);
      ec_GFp_mont_add(v13, (uint64_t)v12, (uint64_t)v12, (uint64_t)v21);
      if (v4)
      {
        ec_GFp_mont_batch_get_window(v13, (uint64_t)v21, &__b[918], v19, v17);
        ec_GFp_mont_add(v13, (uint64_t)v12, (uint64_t)v12, (uint64_t)v21);
      }

      --v17;
      char v16 = 1;
      if (v17 > v14) {
        return result;
      }
    }

    --v17;
  }

  while (v17 <= v14);
  if ((v16 & 1) == 0) {
    return ec_GFp_simple_point_set_to_infinity(v13, (uint64_t)v12);
  }
  return result;
}

uint64_t *ec_GFp_mont_batch_precomp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (unint64_t *)(a2 + 432);
  for (unint64_t i = 2LL; i != 17; ++i)
  {
    if ((i & 1) != 0) {
      double result = ec_GFp_mont_add(a1, (uint64_t)v6, a2 + 216, (uint64_t)(v6 - 27));
    }
    else {
      double result = ec_GFp_mont_dbl(a1, v6, (unint64_t *)(a2 + 216 * (i >> 1)));
    }
    v6 += 27;
  }

  return result;
}

uint64_t *ec_GFp_mont_batch_get_window(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, unsigned int a5)
{
  unint64_t v10 = *(int *)(a1 + 264);
  int is_bit_set_words = bn_is_bit_set_words(a4, v10, a5 + 4);
  int v12 = (16 * bn_is_bit_set_words(a4, v10, a5 + 3)) | (32 * is_bit_set_words);
  int v13 = v12 | (8 * bn_is_bit_set_words(a4, v10, a5 + 2));
  LOBYTE(v13) = v13 | (4 * bn_is_bit_set_words(a4, v10, a5 + 1));
  unsigned __int8 v14 = v13 & 0xFC | (2 * bn_is_bit_set_words(a4, v10, a5));
  if (a5) {
    unsigned __int8 v14 = bn_is_bit_set_words(a4, v10, a5 - 1) | v14 & 0xFE;
  }
  uint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  ec_GFp_nistp_recode_scalar_bits(&v22, &v21, v14);
  uint64_t v15 = 0LL;
  *(void *)(a2 + 208) = 0LL;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  do
  {
    ec_point_select(a1, (uint64_t *)a2, (uint64_t)(((v21 ^ v15++) - 1) & ~v21) >> 63, a3, (uint64_t *)a2);
    a3 += 27;
  }

  while (v15 != 17);
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[2] = v16;
  v19[3] = v16;
  v19[0] = v16;
  v19[1] = v16;
  unsigned int v17 = (unint64_t *)(a2 + 72);
  ec_felem_neg(a1, (unint64_t *)v19, v17);
  return ec_felem_select(a1, (uint64_t *)v17, -v22, (uint64_t *)v19, (uint64_t *)v17);
}

uint64_t ec_GFp_mont_init_precomp()
{
  uint64_t v0 = (const EC_GROUP *)MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v3 = (uint64_t)v0;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  unsigned int v4 = EC_GROUP_get_degree(v0) + 4;
  memset(v23, 170, sizeof(v23));
  __int128 v5 = *(_OWORD *)(v2 + 176);
  v21[10] = *(_OWORD *)(v2 + 160);
  v21[11] = v5;
  v21[12] = *(_OWORD *)(v2 + 192);
  uint64_t v22 = *(void *)(v2 + 208);
  __int128 v6 = *(_OWORD *)(v2 + 112);
  v21[6] = *(_OWORD *)(v2 + 96);
  v21[7] = v6;
  __int128 v7 = *(_OWORD *)(v2 + 144);
  v21[8] = *(_OWORD *)(v2 + 128);
  v21[9] = v7;
  __int128 v8 = *(_OWORD *)(v2 + 48);
  v21[2] = *(_OWORD *)(v2 + 32);
  v21[3] = v8;
  __int128 v9 = *(_OWORD *)(v2 + 80);
  v21[4] = *(_OWORD *)(v2 + 64);
  v21[5] = v9;
  if (v4 / 5 <= 2) {
    unsigned int v10 = 2;
  }
  else {
    unsigned int v10 = v4 / 5;
  }
  __int128 v11 = *(_OWORD *)(v2 + 16);
  unsigned int v12 = v10 - 1;
  int v13 = 1;
  v21[0] = *(_OWORD *)v2;
  v21[1] = v11;
  do
  {
    unsigned int v14 = 1 << v13;
    ec_GFp_mont_dbl( v3,  (unint64_t *)&v21[-13] + 27 * v14 - 1,  (unint64_t *)&v21[-13] + 27 * (v14 >> 1) - 1);
    unsigned int v15 = v12;
    if (v4 >= 0xA)
    {
      do
      {
        ec_GFp_mont_dbl(v3, (unint64_t *)&v21[-13] + 27 * v14 - 1, (unint64_t *)&v21[-13] + 27 * v14 - 1);
        --v15;
      }

      while (v15);
    }

    uint64_t v16 = 0LL;
    if (v14 <= 2) {
      unsigned int v17 = 2;
    }
    else {
      unsigned int v17 = 1 << v13;
    }
    __int128 v18 = (char *)v21 + 216 * v14;
    uint64_t v19 = 216LL * v17 - 216;
    do
    {
      ec_GFp_mont_add(v3, (uint64_t)&v18[v16], (uint64_t)v21 + 216 * ((1 << v13) - 1), (uint64_t)v21 + v16);
      v16 += 216LL;
    }

    while (v19 != v16);
    ++v13;
  }

  while (v13 != 5);
  return ec_jacobian_to_affine_batch(v3);
}

void ec_GFp_mont_mul_precomp( const EC_GROUP *a1, unint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  unsigned int v16 = EC_GROUP_get_degree(a1) + 4;
  if (v16 >= 5)
  {
    char v17 = 0;
    unsigned int v18 = v16 / 5;
    unsigned int v19 = v16 / 5 - 1;
    while ((v17 & 1) == 0)
    {
      unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v21 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v33 = v21;
      __int128 v34 = v21;
      __int128 v31 = v21;
      __int128 v32 = v21;
      __int128 v29 = v21;
      __int128 v30 = v21;
      __int128 v27 = v21;
      __int128 v28 = v21;
      __int128 v25 = v21;
      __int128 v26 = v21;
      __int128 v23 = v21;
      __int128 v24 = v21;
      __int128 v22 = v21;
      ec_GFp_mont_get_comb_window((uint64_t)a1, (uint64_t)&v22, a3, a4, v19);
      ec_GFp_simple_point_copy((uint64_t)a2, (uint64_t)&v22);
      if (a5) {
        goto LABEL_8;
      }
LABEL_9:
      if (a7)
      {
        ec_GFp_mont_get_comb_window((uint64_t)a1, (uint64_t)&v22, a7, a8, v19);
        ec_GFp_mont_add((uint64_t)a1, (uint64_t)a2, (uint64_t)a2, (uint64_t)&v22);
      }

      --v19;
      char v17 = 1;
      if (v19 >= v18) {
        return;
      }
    }

    ec_GFp_mont_dbl((uint64_t)a1, a2, a2);
    unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v33 = v20;
    __int128 v34 = v20;
    __int128 v31 = v20;
    __int128 v32 = v20;
    __int128 v29 = v20;
    __int128 v30 = v20;
    __int128 v27 = v20;
    __int128 v28 = v20;
    __int128 v25 = v20;
    __int128 v26 = v20;
    __int128 v23 = v20;
    __int128 v24 = v20;
    __int128 v22 = v20;
    ec_GFp_mont_get_comb_window((uint64_t)a1, (uint64_t)&v22, a3, a4, v19);
    ec_GFp_mont_add((uint64_t)a1, (uint64_t)a2, (uint64_t)a2, (uint64_t)&v22);
    if (!a5) {
      goto LABEL_9;
    }
LABEL_8:
    ec_GFp_mont_get_comb_window((uint64_t)a1, (uint64_t)&v22, a5, a6, v19);
    ec_GFp_mont_add((uint64_t)a1, (uint64_t)a2, (uint64_t)a2, (uint64_t)&v22);
    goto LABEL_9;
  }

  ec_GFp_simple_point_set_to_infinity((uint64_t)a1, (uint64_t)a2);
}

uint64_t *ec_GFp_mont_get_comb_window(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, int a5)
{
  LODWORD(v13) = a5;
  unint64_t v9 = *(int *)(a1 + 264);
  uint64_t v10 = 0LL;
  LODWORD(v11) = 0;
  unint64_t v12 = (EC_GROUP_get_degree((const EC_GROUP *)a1) + 4) / 5uLL;
  unint64_t v13 = v13;
  do
  {
    uint64_t v11 = (bn_is_bit_set_words(a4, v9, v13) << v10++) | v11;
    v13 += v12;
  }

  while (v10 != 5);
  *(void *)(a2 + 208) = 0LL;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  uint64_t v14 = -31LL;
  *(_OWORD *)a2 = 0u;
  do
  {
    ec_felem_select(a1, (uint64_t *)a2, ((v11 ^ ((_DWORD)v14 + 32)) - 1LL) >> 63, a3, (uint64_t *)a2);
    ec_felem_select( a1,  (uint64_t *)(a2 + 72),  ((v11 ^ ((_DWORD)v14 + 32)) - 1LL) >> 63,  a3 + 9,  (uint64_t *)(a2 + 72));
    a3 += 18;
  }

  while (!__CFADD__(v14++, 1LL));
  unsigned int v16 = (uint64_t *)ec_felem_one(a1);
  return ec_felem_select(a1, (uint64_t *)(a2 + 144), (v11 - 1) >> 63, (uint64_t *)(a2 + 144), v16);
}

CFArrayRef boringssl_identity_create_from_identity_array(const __CFArray *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(&OBJC_CLASS___boringssl_concrete_boringssl_identity);
    if (v2 && (uint64_t v3 = boringssl_helper_copy_leaf_private_key_from_identity_array(v1), (v2->private_key = v3) != 0LL))
    {
      unsigned int v4 = boringssl_helper_copy_identity_certificate_chain_from_identity_array(v1);
      if (v4)
      {
        __int128 v5 = v4;
        certificate_sec_array_from_CFArray = (OS_sec_array *)boringssl_helper_create_certificate_sec_array_from_CFArray(v4);
        certificates = v2->certificates;
        v2->certificates = certificate_sec_array_from_CFArray;

        CFRelease(v5);
      }

      if (v2->certificates)
      {
        uint64_t v1 = v2;
      }

      else
      {
        private_key = v2->private_key;
        if (private_key) {
          CFRelease(private_key);
        }
        uint64_t v1 = 0LL;
        v2->private_key = 0LL;
      }
    }

    else
    {
      uint64_t v1 = 0LL;
    }
  }

  return v1;
}

CFArrayRef boringssl_identity_create_from_identity(void *a1)
{
  uint64_t v2 = a1;
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___boringssl_concrete_boringssl_identity);
    if (v3)
    {
      unsigned int v4 = sec_identity_copy_ref(v2);
      SecCertificateRef certificateRef = 0LL;
      SecIdentityCopyCertificate(v4, &certificateRef);
      __int128 v5 = sec_identity_copy_certificates_ref(v2);
      objc_storeStrong((id *)&v3->identity, a1);
      uint64_t v6 = sec_array_create();
      certificates = v3->certificates;
      v3->certificates = (OS_sec_array *)v6;

      sec_certificate_t v8 = sec_certificate_create(certificateRef);
      sec_array_append();
      if (v5 && CFArrayGetCount(v5) >= 1)
      {
        CFIndex v9 = 0LL;
        do
        {
          ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v5, v9);
          sec_certificate_t v11 = sec_certificate_create(ValueAtIndex);
          sec_array_append();

          ++v9;
        }

        while (v9 < CFArrayGetCount(v5));
      }

      SecKeyRef v14 = 0LL;
      if (SecIdentityCopyPrivateKey(v4, &v14))
      {
        if (certificateRef) {
          CFRelease(certificateRef);
        }
        SecCertificateRef certificateRef = 0LL;
        if (v4) {
          CFRelease(v4);
        }
        if (v5)
        {
          CFRelease(v5);
          __int128 v5 = 0LL;
        }
      }

      else
      {
        SecCertificateRef v12 = certificateRef;
        v3->private_key = v14;
        if (v12) {
          CFRelease(v12);
        }
        SecCertificateRef certificateRef = 0LL;
        if (v4) {
          CFRelease(v4);
        }
        if (v5) {
          CFRelease(v5);
        }
        __int128 v5 = v3;
      }
    }

    else
    {
      __int128 v5 = 0LL;
    }
  }

  else
  {
    __int128 v5 = 0LL;
  }

  return v5;
}

SecIdentityRef boringssl_identity_create_from_identity_without_certificates(void *a1)
{
  uint64_t v2 = a1;
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___boringssl_concrete_boringssl_identity);
    unsigned int v4 = v3;
    if (v3)
    {
      objc_storeStrong((id *)&v3->identity, a1);
      SecIdentityRef v5 = sec_identity_copy_ref(v2);
      SecKeyRef privateKeyRef = 0LL;
      if (!SecIdentityCopyPrivateKey(v5, &privateKeyRef))
      {
        v4->private_key = privateKeyRef;
        if (v5) {
          CFRelease(v5);
        }
        SecIdentityRef v5 = v4;
        goto LABEL_11;
      }

      if (!v5)
      {
LABEL_11:

        goto LABEL_12;
      }

      CFRelease(v5);
    }

    SecIdentityRef v5 = 0LL;
    goto LABEL_11;
  }

  SecIdentityRef v5 = 0LL;
LABEL_12:

  return v5;
}

boringssl_concrete_boringssl_identity *boringssl_identity_create_from_external_identity( void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  SecCertificateRef v12 = v11;
  unint64_t v13 = 0LL;
  if (v8 && v9 && v10 && v11)
  {
    SecKeyRef v14 = objc_alloc_init(&OBJC_CLASS___boringssl_concrete_boringssl_identity);
    unint64_t v13 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->certificates, a1);
      uint64_t v15 = MEMORY[0x1895A97C0](v9);
      id sign_block = v13->sign_block;
      v13->id sign_block = (id)v15;

      uint64_t v17 = MEMORY[0x1895A97C0](v10);
      id decrypt_block = v13->decrypt_block;
      v13->id decrypt_block = (id)v17;

      objc_storeStrong((id *)&v13->queue, a4);
      unsigned int v19 = v13;
    }
  }

  return v13;
}

id *boringssl_identity_copy_sec_identity(id *result)
{
  if (result) {
    return (id *)result[3];
  }
  return result;
}

id *boringssl_identity_copy_certificate_chain(id *result)
{
  if (result) {
    return (id *)result[2];
  }
  return result;
}

uint64_t boringssl_identity_private_key_sign( void *a1, uint64_t a2, unint64_t *a3, unint64_t a4, int a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (*((void *)v15 + 4) && *((void *)v15 + 6))
  {
    unsigned int v19 = (void *)MEMORY[0x1895A97C0]();
    __int128 v20 = (dispatch_queue_s *)*((void *)v15 + 6);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __boringssl_identity_private_key_sign_block_invoke;
    v27[3] = &unk_18A071C88;
    __int16 v32 = a5;
    id v30 = v19;
    v27[4] = v16;
    id v28 = v17;
    id v29 = v15;
    id v31 = v18;
    id v21 = v19;
    boringssl_context_async((uint64_t)v28, v20, v27);

    uint64_t v22 = 2LL;
  }

  else
  {
    __int128 v23 = (dispatch_data_s *)boringssl_private_key_sign(*((__SecKey **)v15 + 1), a5, v16);
    __int128 v24 = v23;
    if (v23)
    {
      size_t size = dispatch_data_get_size(v23);
      if (size < a4) {
        a4 = size;
      }
      boringssl_helper_dispatch_data_copyout(v24, a2, a4);
      uint64_t v22 = 0LL;
      *a3 = a4;
    }

    else
    {
      uint64_t v22 = 1LL;
    }
  }

  return v22;
}

void __boringssl_identity_private_key_sign_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 72);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __boringssl_identity_private_key_sign_block_invoke_2;
  v5[3] = &unk_18A071C60;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v5);
}

void __boringssl_identity_private_key_sign_block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[5];
  id v7 = a1[6];
  id v6 = a1[4];
  id v4 = v3;
  nw_queue_context_async();
}

uint64_t __boringssl_identity_private_key_sign_block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 56LL) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

uint64_t boringssl_identity_private_key_decrypt( void *a1, void *a2, size_t *a3, size_t a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  SecKeyRef v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (*((void *)v13 + 5) && *((void *)v13 + 6))
  {
    id v17 = (void *)MEMORY[0x1895A97C0]();
    id v18 = (dispatch_queue_s *)*((void *)v13 + 6);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __boringssl_identity_private_key_decrypt_block_invoke;
    block[3] = &unk_18A071CB0;
    id v29 = v17;
    block[4] = v14;
    id v27 = v15;
    id v28 = v13;
    id v30 = v16;
    id v19 = v17;
    boringssl_context_async((uint64_t)v27, v18, block);

    uint64_t v20 = 2LL;
  }

  else
  {
    id v21 = boringssl_private_key_decrypt(*((__SecKey **)v13 + 1), v14);
    uint64_t v22 = v21;
    if (v21)
    {
      size_t size = dispatch_data_get_size(v21);
      size_t v24 = dispatch_data_get_size(v14) - size;
      bzero(a2, a4);
      boringssl_helper_dispatch_data_copyout(v22, (uint64_t)a2 + v24, size);
      uint64_t v20 = 0LL;
      *a3 = a4;
    }

    else
    {
      uint64_t v20 = 1LL;
    }
  }

  return v20;
}

void __boringssl_identity_private_key_decrypt_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __boringssl_identity_private_key_decrypt_block_invoke_2;
  v4[3] = &unk_18A071C60;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);
}

void __boringssl_identity_private_key_decrypt_block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[5];
  id v7 = a1[6];
  id v6 = a1[4];
  id v4 = v3;
  nw_queue_context_async();
}

uint64_t __boringssl_identity_private_key_decrypt_block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 56LL) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

uint64_t boringssl_identity_private_key_complete(void *a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = v7;
  if (*((void *)v7 + 6))
  {
    id v9 = (void *)*((void *)v7 + 8);
    if (v9 || (id v9 = (void *)*((void *)v7 + 9)) != 0LL)
    {
      id v10 = v9;
      boringssl_helper_dispatch_data_copyout(v10, a2, a4);
      *a3 = dispatch_data_get_size(v10);

      uint64_t v11 = 0LL;
    }

    else if (*((_BYTE *)v7 + 56))
    {
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v11 = 2LL;
    }
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  return v11;
}

int BN_ucmp(const BIGNUM *a, const BIGNUM *b)
{
  return bn_cmp_words_consttime((uint64_t *)a->d, a->top, (uint64_t *)b->d, b->top);
}

uint64_t bn_cmp_words_consttime(uint64_t *a1, unint64_t a2, uint64_t *a3, unint64_t a4)
{
  if (a2 >= a4) {
    unint64_t v5 = a4;
  }
  else {
    unint64_t v5 = a2;
  }
  if (v5)
  {
    LODWORD(result) = 0;
    id v7 = a1;
    id v8 = a3;
    do
    {
      uint64_t v10 = *v7++;
      uint64_t v9 = v10;
      uint64_t v11 = *v8++;
      uint64_t v12 = (((v11 ^ v9) - 1) & ~(v11 ^ v9)) >> 63;
      uint64_t result = result & v12 | (((((v9 - v11) ^ v9 | v11 ^ v9) ^ v9) >> 63) | 1) & ~v12;
      --v5;
    }

    while (v5);
  }

  else
  {
    uint64_t result = 0LL;
  }

  unint64_t v13 = a2 - a4;
  if (a2 >= a4)
  {
    if (a4 < a2)
    {
      uint64_t v18 = 0LL;
      id v19 = &a1[a4];
      do
      {
        uint64_t v20 = *v19++;
        v18 |= v20;
        --v13;
      }

      while (v13);
      return (((((v18 - 1) & ~v18) >> 63) & 1) == 0) | (((v18 - 1) & ~v18) >> 63) & result;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = a4 - a2;
    id v16 = &a3[a2];
    do
    {
      uint64_t v17 = *v16++;
      v14 |= v17;
      --v15;
    }

    while (v15);
    return result | ~(((v14 - 1) & ~v14) >> 63);
  }

  return result;
}

int BN_cmp(const BIGNUM *a, const BIGNUM *b)
{
  if (a && b)
  {
    int neg = a->neg;
    if (neg == b->neg)
    {
      int result = bn_cmp_words_consttime((uint64_t *)a->d, a->top, (uint64_t *)b->d, b->top);
      if (neg) {
        return -result;
      }
    }

    else if (neg)
    {
      return -1;
    }

    else
    {
      return 1;
    }
  }

  else if (a)
  {
    return -1;
  }

  else
  {
    return b != 0LL;
  }

  return result;
}

uint64_t bn_less_than_words(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  return bn_cmp_words_consttime(a1, a3, a2, a3) >> 31;
}

BOOL BN_abs_is_word(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = a1[2];
  if ((_DWORD)v2)
  {
    a2 ^= **(void **)a1;
    if ((int)v2 >= 2)
    {
      id v3 = (uint64_t *)(*(void *)a1 + 8LL);
      uint64_t v4 = v2 - 1;
      do
      {
        uint64_t v5 = *v3++;
        a2 |= v5;
        --v4;
      }

      while (v4);
    }
  }

  return a2 == 0;
}

BOOL BN_is_zero(uint64_t a1)
{
  return bn_fits_in_words(a1, 0LL);
}

BOOL BN_is_one(unsigned int *a1)
{
  if (a1[4]) {
    return 0LL;
  }
  uint64_t v2 = a1[2];
  if ((_DWORD)v2)
  {
    uint64_t v3 = **(void **)a1 ^ 1LL;
    if ((int)v2 >= 2)
    {
      uint64_t v4 = v2 - 1;
      uint64_t v5 = (uint64_t *)(*(void *)a1 + 8LL);
      do
      {
        uint64_t v6 = *v5++;
        v3 |= v6;
        --v4;
      }

      while (v4);
    }
  }

  else
  {
    uint64_t v3 = 1LL;
  }

  return v3 == 0;
}

BOOL BN_is_word(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2;
  if ((_DWORD)v2)
  {
    uint64_t v3 = **(void **)a1 ^ a2;
    if ((int)v2 >= 2)
    {
      uint64_t v4 = v2 - 1;
      uint64_t v5 = (uint64_t *)(*(void *)a1 + 8LL);
      do
      {
        uint64_t v6 = *v5++;
        v3 |= v6;
        --v4;
      }

      while (v4);
    }
  }

  if (v3) {
    return 0LL;
  }
  if (a2) {
    return a1[4] == 0;
  }
  return 1LL;
}

uint64_t BN_is_odd(uint64_t a1)
{
  else {
    return **(_DWORD **)a1 & 1;
  }
}

BOOL BN_equal_consttime(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(int *)(a1 + 8);
  uint64_t v3 = *(int *)(a2 + 8);
  if ((int)v2 >= (int)v3)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (uint64_t *)(*(void *)a2 + 8 * v2);
    uint64_t v6 = v3 - v2;
    do
    {
      uint64_t v7 = *v5++;
      v4 |= v7;
      --v6;
    }

    while (v6);
  }

  if ((int)v3 < (int)v2)
  {
    id v8 = (uint64_t *)(*(void *)a1 + 8 * v3);
    uint64_t v9 = v2 - v3;
    do
    {
      uint64_t v10 = *v8++;
      v4 |= v10;
      --v9;
    }

    while (v9);
  }

  else {
    uint64_t v2 = v2;
  }
  if ((int)v2 >= 1)
  {
    uint64_t v11 = *(uint64_t **)a1;
    uint64_t v12 = *(uint64_t **)a2;
    do
    {
      uint64_t v14 = *v11++;
      uint64_t v13 = v14;
      uint64_t v15 = *v12++;
      v4 |= v15 ^ v13;
      --v2;
    }

    while (v2);
  }

  return (v4 | *(_DWORD *)(a2 + 16) ^ *(_DWORD *)(a1 + 16)) == 0;
}

int ECDH_compute_key( void *out, size_t outlen, const EC_POINT *pub_key, EC_KEY *ecdh, void *(__cdecl *KDF)(const void *, size_t, void *, size_t *))
{
  size_t v8 = outlen;
  size_t v29 = outlen;
  if (!ccrng())
  {
LABEL_17:
    LODWORD(v8) = -1;
    return v8;
  }

  uint64_t v10 = (const BIGNUM *)*((void *)ecdh + 2);
  unsigned int v11 = BN_num_bytes(v10);
  uint64_t v12 = (unsigned __int8 *)malloc(v11);
  if (!v12)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDH_compute_key_cold_1();
    }
    goto LABEL_17;
  }

  uint64_t v13 = v12;
  BN_bn2bin(v10, v12);
  size_t v14 = EC_POINT_point2oct( *(const EC_GROUP **)ecdh,  pub_key,  (point_conversion_form_t)*((_DWORD *)ecdh + 7),  0LL,  0LL,  0LL);
  if (!v14)
  {
    uint64_t v17 = (os_log_s *)g_boringssl_log;
    if (!g_boringssl_log) {
      goto LABEL_29;
    }
    if (!os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
    {
LABEL_26:
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        ECDH_compute_key_cold_2();
      }
      uint64_t v17 = 0LL;
      goto LABEL_29;
    }

    ECDH_compute_key_cold_3();
LABEL_25:
    uint64_t v17 = (os_log_s *)g_boringssl_log;
    if (!g_boringssl_log) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }

  size_t v15 = v14;
  id v16 = (unsigned __int8 *)malloc(v14);
  if (!v16) {
    goto LABEL_25;
  }
  uint64_t v17 = (os_log_s *)v16;
  if ((int)EC_POINT_point2oct( *(const EC_GROUP **)ecdh,  pub_key,  (point_conversion_form_t)*((_DWORD *)ecdh + 7),  v16,  v15,  0LL) <= 0)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDH_compute_key_cold_4();
    }
    free(v17);
    goto LABEL_25;
  }

  ccec_x963_import_pub_size();
  if (!ccec_keysize_is_supported())
  {
    __int128 v25 = (os_log_s *)g_boringssl_log;
    if (!g_boringssl_log) {
      goto LABEL_29;
    }
    if (!os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    ECDH_compute_key_cold_6();
    goto LABEL_41;
  }

  cp = (void *)ccec_get_cp();
  if (!cp)
  {
LABEL_41:
    __int128 v25 = (os_log_s *)g_boringssl_log;
    if (g_boringssl_log)
    {
LABEL_42:
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        ECDH_compute_key_cold_5();
      }
    }

LABEL_54:
      LODWORD(v8) = -1;
      goto LABEL_55;
    }

    __int128 v23 = 0LL;
    goto LABEL_54;
  }

  __int128 v23 = 0LL;
LABEL_30:
  LODWORD(v8) = -1;
LABEL_31:
  cc_clear();
  free(v13);
  if (v17)
  {
    cc_clear();
    free(v17);
  }

  if (v23)
  {
    cc_clear();
    free(v23);
  }

  if (v21) {
    free(v21);
  }
  return v8;
}

int BN_rand(BIGNUM *rnd, int bits, int top, int bottom)
{
  if (rnd)
  {
    if ((top - 2) <= 0xFFFFFFFC)
    {
      int v5 = 66;
      int v6 = 131;
LABEL_9:
      ERR_put_error(3, 0, v5, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/random.c", v6);
      LODWORD(rnd) = 0;
      return (int)rnd;
    }

    if (bottom >= 2)
    {
      int v5 = 66;
      int v6 = 136;
      goto LABEL_9;
    }

    uint64_t v9 = rnd;
    if (!bits)
    {
      BN_zero((uint64_t)rnd);
LABEL_33:
      LODWORD(rnd) = 1;
      return (int)rnd;
    }

    if (bits >= 2147483585)
    {
      int v5 = 102;
      int v6 = 146;
      goto LABEL_9;
    }

    int v10 = bits >= -63 ? bits + 63 : bits + 126;
    int v11 = 1 - bits >= 0 ? -((1 - bits) & 0x3F) : (bits - 1) & 0x3F;
    unint64_t v12 = (uint64_t)v10 >> 6;
    LODWORD(rnd) = bn_wexpand(&rnd->d, v12);
    if ((_DWORD)rnd)
    {
      int v13 = v10 >> 6;
      if (v11 < 63) {
        uint64_t v14 = ~(-1LL << (v11 + 1));
      }
      else {
        uint64_t v14 = -1LL;
      }
      RAND_bytes((unsigned __int8 *)v9->d, 8 * v12);
      d = (unsigned __int8 *)v9->d;
      uint64_t v16 = v13 - 1LL;
      unint64_t v17 = v9->d[v16] & v14;
      v9->d[v16] = v17;
      if (top != -1)
      {
        if (bits >= 2 && top == 1)
        {
          if (!v11)
          {
            *(void *)&d[8 * v16] = v17 | 1;
            *(void *)&d[8 * v13 - 16] |= 0x8000000000000000LL;
            goto LABEL_30;
          }

          uint64_t v18 = 3LL << (v11 - 1);
        }

        else
        {
          uint64_t v18 = 1LL << v11;
        }

        *(void *)&d[8 * v16] = v17 | v18;
      }

uint64_t bn_in_range_words(uint64_t *a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  if (a2)
  {
    if (a4)
    {
      uint64_t v4 = 0LL;
      unint64_t v5 = a4 - 1;
      if (a4 != 1)
      {
        int v6 = a1 + 1;
        do
        {
          uint64_t v7 = *v6++;
          v4 |= v7;
          --v5;
        }

        while (v5);
      }

      unsigned int v8 = ~(((v4 - 1) & ~v4 & (((*a1 - a2) ^ *a1 | *a1 ^ a2) ^ *a1)) >> 63);
    }

    else
    {
      unsigned int v8 = 0;
    }
  }

  else
  {
    unsigned int v8 = -1;
  }

  return bn_less_than_words(a1, a3, a4) & v8;
}

uint64_t bn_rand_range_words(uint64_t *a1, unint64_t a2, unint64_t *a3, uint64_t a4, uint64_t a5)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = bn_range_to_mask(&v17, &v16, a2, a3, a4);
  if ((_DWORD)result)
  {
    unint64_t v11 = v17;
    size_t v12 = 8 * (a4 - v17);
    if (v12) {
      bzero(&a1[v17], v12);
    }
    unint64_t v13 = v16;
    int v14 = -100;
    while (!__CFADD__(v14++, 1))
    {
      RAND_bytes_with_additional_data(a1, 8 * v11, a5);
      a1[v11 - 1] &= v13;
    }

    ERR_put_error(3, 0, 115, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/random.c", 271);
    return 0LL;
  }

  return result;
}

uint64_t bn_range_to_mask( void *a1, unint64_t *a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  while (a5)
  {
    uint64_t v5 = a5 - 1;
    unint64_t v6 = a4[--a5];
    if (v6)
    {
      if (v5 || *a4 > a3)
      {
        unint64_t v7 = v6 | (v6 >> 1) | ((v6 | (v6 >> 1)) >> 2);
        unint64_t v8 = v7 | (v7 >> 4) | ((v7 | (v7 >> 4)) >> 8);
        *a1 = v5 + 1;
        *a2 = v8 | (v8 >> 16) | ((v8 | (v8 >> 16)) >> 32);
        return 1LL;
      }

      break;
    }
  }

  ERR_put_error(3, 0, 108, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/random.c", 230);
  return 0LL;
}

uint64_t BN_rand_range_ex(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = bn_wexpand((void **)a1, *(int *)(a3 + 8));
  if ((_DWORD)result)
  {
    uint64_t result = bn_rand_range_words( *(uint64_t **)a1,  a2,  *(unint64_t **)a3,  *(int *)(a3 + 8),  (uint64_t)&BN_rand_range_ex_kDefaultAdditionalData);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a1 + 16) = 0;
      *(_DWORD *)(a1 + 8) = *(_DWORD *)(a3 + 8);
      return 1LL;
    }
  }

  return result;
}

uint64_t bn_rand_secret_range(uint64_t a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = bn_range_to_mask(&v19, &v18, a3, *(unint64_t **)a4, *(int *)(a4 + 8));
  if ((_DWORD)result)
  {
    unint64_t v9 = v19;
    uint64_t result = bn_wexpand((void **)a1, v19);
    if ((_DWORD)result)
    {
      if (!v9) {
        bn_rand_secret_range_cold_1();
      }
      unint64_t v10 = v18;
      if (!v18) {
        bn_rand_secret_range_cold_2();
      }
      unint64_t v11 = v18 >> 1;
      if (v9 == 1 && v11 < a3)
      {
        ERR_put_error(3, 0, 108, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/random.c", 323);
        return 0LL;
      }

      else
      {
        RAND_bytes(*(unsigned __int8 **)a1, 8 * v9);
        size_t v12 = *(uint64_t **)a1;
        uint64_t v13 = 8 * v9 - 8;
        *(uint64_t *)((char *)v12 + v13) = *(void *)(*(void *)a1 + v13) & v10;
        int v14 = bn_in_range_words(v12, a3, *(uint64_t **)a4, v9);
        *a2 = v14;
        uint64_t v15 = -(uint64_t)v14;
        uint64_t v16 = a3 & (v14 - 1LL);
        unint64_t v17 = *(uint64_t **)a1;
        *unint64_t v17 = **(void **)a1 | v16;
        *(uint64_t *)((char *)v17 + v13) &= v15 | v11;
        *(_DWORD *)(a1 + 16) = 0;
        *(_DWORD *)(a1 + 8) = v9;
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t ec_compute_wNAF(uint64_t result, _BYTE *a2, _DWORD *a3, unint64_t a4, unsigned int a5)
{
  if (a5 - 8 <= 0xFFFFFFF8) {
    ec_compute_wNAF_cold_1();
  }
  if (!a4) {
    ec_compute_wNAF_cold_2();
  }
  char v6 = a5;
  int v8 = 2 << a5;
  unsigned int v9 = (2 << a5) - 1;
  int v10 = v9 & *a3;
  if (a4 != -1LL)
  {
    uint64_t v12 = result;
    int v13 = 1 << a5;
    int v17 = -(1 << a5);
    unsigned int v18 = v9 >> 1;
    unint64_t v14 = a4 + 1;
    unint64_t v15 = a5 + 1LL;
    do
    {
      if (v10 < 0 || v10 > v8) {
        ec_compute_wNAF_cold_4();
      }
      if ((v10 & 1) != 0)
      {
        int v16 = v10 - v8;
        if (v10 >= v8) {
          ec_compute_wNAF_cold_9();
        }
        if (v15 >= a4) {
          int v16 = v10 & v18;
        }
        if ((v10 & v13) == 0) {
          int v16 = v10;
        }
        v10 -= v16;
        if (v10 && v10 != v8 && v10 != v13) {
          ec_compute_wNAF_cold_8();
        }
        if (v16 <= v17 || v16 >= v13) {
          ec_compute_wNAF_cold_6();
        }
        if ((v16 & 1) == 0) {
          ec_compute_wNAF_cold_7();
        }
      }

      else
      {
        LOBYTE(v16) = 0;
      }

      *a2 = v16;
      uint64_t result = bn_is_bit_set_words((uint64_t)a3, *(int *)(v12 + 264), v15);
      int v10 = ((_DWORD)result << v6) + (v10 >> 1);
      if (v10 > v8) {
        ec_compute_wNAF_cold_5();
      }
      ++a2;
      ++v15;
      --v14;
    }

    while (v14);
  }

  if (v10) {
    ec_compute_wNAF_cold_3();
  }
  return result;
}

uint64_t ec_GFp_mont_mul_public_batch()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  char v6 = v5;
  int v8 = v7;
  int v10 = v9;
  uint64_t v11 = v0;
  uint64_t v38 = *MEMORY[0x1895F89C0];
  LODWORD(v12) = EC_GROUP_order_bits(v0);
  id v31 = v37;
  memset(v37, 170, sizeof(v37));
  id v30 = __b;
  memset(__b, 170, 0x1440uLL);
  if (v2 >= 4)
  {
    int v13 = OPENSSL_calloc(v2, 0x211uLL);
    unint64_t v15 = OPENSSL_calloc(v2, 0x6C0uLL);
    unint64_t v14 = v15;
    uint64_t v16 = 0LL;
    if (!v13) {
      goto LABEL_31;
    }
    id v30 = v15;
    id v31 = v13;
    if (!v15) {
      goto LABEL_31;
    }
  }

  else
  {
    int v13 = 0LL;
    unint64_t v14 = 0LL;
  }

  unint64_t v12 = (int)v12;
  memset(v35, 170, sizeof(v35));
  memset(v34, 170, 0x6C0uLL);
  unint64_t v29 = (int)v12 + 1LL;
  if (v29 >= 0x212) {
    ec_GFp_mont_mul_public_batch_cold_1();
  }
  id v27 = v14;
  size_t v28 = v13;
  if (v8)
  {
    ec_compute_wNAF(v11, v35, v8, (int)v12, 4u);
    compute_precomp(v11, (uint64_t)v34, (unint64_t *)(v11 + 16));
  }

  int v17 = v8;
  if (v2)
  {
    uint64_t v18 = (uint64_t)v30;
    unint64_t v19 = v31;
    unint64_t v20 = v2;
    do
    {
      ec_compute_wNAF(v11, v19, v4, (int)v12, 4u);
      compute_precomp(v11, v18, v6);
      v6 += 27;
      v18 += 1728LL;
      v4 += 18;
      v19 += 529;
      --v20;
    }

    while (v20);
  }

  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[11] = v21;
  v32[12] = v21;
  v32[9] = v21;
  v32[10] = v21;
  v32[7] = v21;
  v32[8] = v21;
  v32[5] = v21;
  v32[6] = v21;
  v32[3] = v21;
  v32[4] = v21;
  v32[1] = v21;
  v32[2] = v21;
  v32[0] = v21;
  if ((_DWORD)v12 == -1)
  {
LABEL_29:
    ec_GFp_simple_point_set_to_infinity(v11, (uint64_t)v10);
    goto LABEL_30;
  }

  int v22 = 1;
  do
  {
    if (v22)
    {
      if (!v17) {
        goto LABEL_21;
      }
    }

    else
    {
      ec_GFp_mont_dbl(v11, v10, v10);
      if (!v17) {
        goto LABEL_21;
      }
    }

    if (v35[v12])
    {
      lookup_precomp(v11, (uint64_t)v32, (uint64_t)v34, (char)v35[v12]);
      if (v22)
      {
        ec_GFp_simple_point_copy((uint64_t)v10, (uint64_t)v32);
        int v22 = 0;
      }

      else
      {
        ec_GFp_mont_add(v11, (uint64_t)v10, (uint64_t)v10, (uint64_t)v32);
      }
    }

uint64_t *compute_precomp(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[11] = v6;
  v9[12] = v6;
  v9[9] = v6;
  v9[10] = v6;
  v9[7] = v6;
  v9[8] = v6;
  v9[5] = v6;
  v9[6] = v6;
  v9[3] = v6;
  v9[4] = v6;
  v9[1] = v6;
  v9[2] = v6;
  v9[0] = v6;
  ec_GFp_mont_dbl(a1, (unint64_t *)v9, a3);
  for (uint64_t i = 0LL; i != 1512; i += 216LL)
    uint64_t result = ec_GFp_mont_add(a1, a2 + i + 216, a2 + i, (uint64_t)v9);
  return result;
}

void lookup_precomp(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if ((a4 & 0x80000000) != 0)
  {
    ec_GFp_simple_point_copy(a2, a3 + 216LL * (-a4 >> 1));
    ec_GFp_simple_invert(a1, a2);
  }

  else
  {
    ec_GFp_simple_point_copy(a2, a3 + 216LL * (a4 >> 1));
  }

_DWORD *BORINGSSL_keccak(char *a1, size_t a2, uint64_t *a3, unint64_t a4, signed int a5)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[12] = v9;
  v12[13] = v9;
  v12[10] = v9;
  v12[11] = v9;
  v12[8] = v9;
  v12[9] = v9;
  v12[6] = v9;
  v12[7] = v9;
  v12[4] = v9;
  v12[5] = v9;
  v12[2] = v9;
  v12[3] = v9;
  v12[0] = v9;
  v12[1] = v9;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  keccak_init((uint64_t)v12, &v11, a5);
  if (v11 && v11 != a2) {
    abort();
  }
  BORINGSSL_keccak_absorb((uint64_t)v12, a3, a4);
  return BORINGSSL_keccak_squeeze(v12, a1, a2);
}

double keccak_init(uint64_t a1, void *a2, signed int a3)
{
  uint64_t v3 = qword_18760A570[a3];
  *a2 = qword_18760A550[a3];
  double result = 0.0;
  *(void *)(a1 + 224) = 0LL;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = 0;
  *(void *)(a1 + 208) = v3;
  return result;
}

uint64_t BORINGSSL_keccak_absorb(uint64_t result, uint64_t *a2, unint64_t a3)
{
  if (*(_DWORD *)(result + 4) == 1) {
    abort();
  }
  unint64_t v3 = a3;
  uint64_t v4 = a2;
  uint64_t v5 = result;
  uint64_t v6 = result + 8;
  unint64_t v8 = *(void *)(result + 208);
  unint64_t v7 = *(void *)(result + 216);
  if (v7)
  {
    unint64_t v9 = v8 - v7;
    if (v8 <= v7) {
      BORINGSSL_keccak_absorb_cold_1();
    }
    if (v9 >= a3) {
      unint64_t v10 = a3;
    }
    else {
      unint64_t v10 = v8 - v7;
    }
    if (v10)
    {
      unint64_t v11 = (char *)a2;
      uint64_t v12 = result + 8;
      do
      {
        char v13 = *v11++;
        *(_BYTE *)(v12 + *(void *)(result + 216)) ^= v13;
        ++v12;
        --v10;
      }

      while (v10);
    }

    if (a3 < v9)
    {
      unint64_t v3 = *(void *)(result + 216) + a3;
      goto LABEL_24;
    }

    double result = keccak_f(result + 8);
    uint64_t v4 = (uint64_t *)((char *)v4 + v9);
    unint64_t v14 = *(void *)(v5 + 208);
    v3 -= v9;
  }

  else
  {
    unint64_t v14 = *(void *)(result + 208);
  }

  if (v3 >= v14)
  {
    if (v8 >> 3 <= 1) {
      uint64_t v15 = 1LL;
    }
    else {
      uint64_t v15 = v8 >> 3;
    }
    do
    {
      uint64_t v16 = (void *)v6;
      int v17 = v4;
      uint64_t v18 = v15;
      if (v8 >= 8)
      {
        do
        {
          uint64_t v19 = *v17++;
          *v16++ ^= v19;
          --v18;
        }

        while (v18);
      }

      double result = keccak_f(v6);
      unint64_t v20 = *(void *)(v5 + 208);
      uint64_t v4 = (uint64_t *)((char *)v4 + v20);
      v3 -= v20;
    }

    while (v3 >= v20);
  }

  if (v3)
  {
    for (uint64_t i = 0LL; i != v3; ++i)
      *(_BYTE *)(v6 + i) ^= *((_BYTE *)v4 + i);
  }

_DWORD *BORINGSSL_keccak_squeeze(_DWORD *result, char *__dst, size_t a3)
{
  uint64_t v5 = result;
  if (!result[1])
  {
    int v6 = *result;
    if (*result >= 4u) {
      abort();
    }
    uint64_t v7 = (uint64_t)(result + 2);
    *(_BYTE *)(v7 + *((void *)v5 + 27)) = *((_BYTE *)v5 + *((void *)v5 + 27) + 8) ^ (0x1F1F0606u >> (8 * v6));
    *((_BYTE *)v5 + *((void *)v5 + 26) + 7) ^= 0x80u;
    double result = (_DWORD *)keccak_f(v7);
    v5[1] = 1;
  }

  if (a3)
  {
    uint64_t v8 = *((void *)v5 + 28);
    do
    {
      uint64_t v9 = *((void *)v5 + 26);
      if (v8 == v9)
      {
        double result = (_DWORD *)keccak_f((uint64_t)(v5 + 2));
        uint64_t v8 = 0LL;
        *((void *)v5 + 28) = 0LL;
        uint64_t v9 = *((void *)v5 + 26);
      }

      size_t v10 = v9 - v8;
      if (a3 >= v10) {
        size_t v11 = v10;
      }
      else {
        size_t v11 = a3;
      }
      if (v11)
      {
        double result = memcpy(__dst, (char *)v5 + v8 + 8, v11);
        uint64_t v8 = *((void *)v5 + 28);
      }

      __dst += v11;
      v8 += v11;
      *((void *)v5 + 28) = v8;
      a3 -= v11;
    }

    while (a3);
  }

  return result;
}

double BORINGSSL_keccak_init(uint64_t a1, signed int a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAAALL;
  double result = keccak_init(a1, &v3, a2);
  if (v3) {
    abort();
  }
  return result;
}

uint64_t keccak_f(uint64_t result)
{
  uint64_t v1 = 0LL;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  do
  {
    uint64_t v3 = 0LL;
    unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
    v37[0] = v2;
    v37[1] = v2;
    do
    {
      *(void *)((char *)v37 + v3) = *(void *)(result + v3 + 40) ^ *(void *)(result + v3) ^ *(void *)(result + v3 + 80) ^ *(void *)(result + v3 + 120) ^ *(void *)(result + v3 + 160);
      v3 += 8LL;
    }

    while (v3 != 40);
    uint64_t v4 = 0LL;
    uint64_t v5 = result;
    do
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = (v4 - 1);
      if (!v4) {
        uint64_t v7 = 4LL;
      }
      uint64_t v8 = *((void *)v37 + v7);
      uint64_t v9 = ++v4;
      if (v4 == 5) {
        uint64_t v9 = 0LL;
      }
      uint64_t v10 = v8 ^ __ROR8__(*((void *)v37 + v9), 63);
      do
      {
        *(void *)(v5 + v6) ^= v10;
        v6 += 40LL;
      }

      while (v6 != 200);
      v5 += 8LL;
    }

    while (v4 != 5);
    uint64_t v11 = *(void *)(result + 96);
    uint64_t v12 = *(void *)(result + 144);
    uint64_t v13 = __ROR8__(*(void *)(result + 136), 49);
    *(void *)(result + 136) = __ROR8__(*(void *)(result + 88), 54);
    *(void *)(result + 144) = v13;
    uint64_t v14 = __ROR8__(v12, 43);
    uint64x2_t v15 = *(uint64x2_t *)(result + 32);
    uint64_t v16 = __ROR8__(*(void *)(result + 24), 36);
    uint64_t v17 = *(void *)(result + 176);
    uint64_t v18 = __ROR8__(*(void *)(result + 168), 62);
    uint64_t v19 = *(void *)(result + 184);
    *(void *)(result + 32) = __ROR8__(*(void *)(result + 192), 50);
    *(void *)(result + 40) = v16;
    uint64_t v20 = *(void *)(result + 120);
    uint64_t v21 = *(void *)(result + 128);
    *(void *)(result + 24) = v14;
    *(void *)(result + 184) = __ROR8__(v20, 23);
    *(void *)(result + 192) = v18;
    uint64_t v22 = *(void *)(result + 112);
    *(void *)(result + 96) = __ROR8__(*(void *)(result + 104), 39);
    uint64_t v23 = __ROR8__(*(void *)(result + 8), 63);
    uint64_t v24 = __ROR8__(*(void *)(result + 16), 2);
    uint64x2_t v25 = *(uint64x2_t *)(result + 152);
    *(void *)(result + 152) = __ROR8__(v19, 8);
    *(void *)(result + 160) = v24;
    *(void *)(result + 168) = __ROR8__(*(void *)(result + 64), 9);
    *(void *)(result + 176) = __ROR8__(v22, 25);
    uint64_t v26 = *(void *)(result + 48);
    uint64_t v27 = __ROR8__(*(void *)(result + 56), 58);
    *(int8x16_t *)(result + 120) = vorrq_s8( (int8x16_t)vshlq_u64(v15, (uint64x2_t)xmmword_18760A440),  (int8x16_t)vshlq_u64(v15, (uint64x2_t)xmmword_18760A430));
    int8x16_t v28 = vorrq_s8( (int8x16_t)vshlq_u64(v25, (uint64x2_t)xmmword_18760A460),  (int8x16_t)vshlq_u64(v25, (uint64x2_t)xmmword_18760A450));
    uint64x2_t v29 = *(uint64x2_t *)(result + 72);
    *(void *)(result + 80) = v23;
    *(void *)(result + 88) = v27;
    *(int8x16_t *)(result + 104) = v28;
    *(void *)(result + 64) = __ROR8__(v21, 19);
    *(void *)(result + 72) = __ROR8__(v17, 3);
    *(int8x16_t *)(result + 48) = vorrq_s8( (int8x16_t)vshlq_u64(v29, (uint64x2_t)xmmword_18760A480),  (int8x16_t)vshlq_u64(v29, (uint64x2_t)xmmword_18760A470));
    uint64_t v30 = 32LL;
    *(void *)(result + 8) = __ROR8__(v26, 20);
    *(void *)(result + 16) = __ROR8__(v11, 21);
    do
    {
      id v31 = (uint64_t *)(result + v30);
      uint64_t v32 = *(void *)(result + v30 - 32);
      uint64_t v33 = *(void *)(result + v30 - 24);
      uint64_t v35 = *(void *)(result + v30 - 16);
      uint64_t v34 = *(void *)(result + v30 - 8);
      *(v31 - 4) = v35 & ~v33 ^ v32;
      *(v31 - 3) = v34 & ~v35 ^ v33;
      uint64_t v36 = *(void *)(result + v30);
      *(v31 - 2) = v36 & ~v34 ^ v35;
      *(v31 - 1) = v32 & ~v36 ^ v34;
      *id v31 = v36 ^ v33 & ~v32;
      v30 += 40LL;
    }

    while (v30 != 232);
    *(void *)result ^= keccak_f_kRoundConstants[v1++];
  }

  while (v1 != 24);
  return result;
}

uint64_t EVP_tls_cbc_remove_padding( uint64_t *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6 + 1 > a4) {
    return 0LL;
  }
  unint64_t v7 = *(unsigned __int8 *)(a3 + a4 - 1);
  uint64_t v8 = (uint64_t)(((a4 - (a6 + 1 + v7)) ^ a4 | (a6 + 1 + v7) ^ a4) ^ ~a4) >> 63;
  uint64_t v9 = 256LL;
  if (a4 < 0x100) {
    uint64_t v9 = a4;
  }
  if (v9)
  {
    unint64_t v10 = 0LL;
    uint64_t v11 = (char *)(a3 + a4 - 1);
    do
    {
      char v12 = *v11--;
      char v13 = v12 ^ ~(_BYTE)v7;
      if (v10 > v7) {
        char v13 = -1;
      }
      LOBYTE(v8) = v13 & v8;
      ++v10;
    }

    while (v9 != v10);
  }

  if ((_BYTE)v8 == 0xFF) {
    uint64_t v14 = -1LL;
  }
  else {
    uint64_t v14 = 0LL;
  }
  *a2 = a4 - ((v7 + 1) & v14);
  *a1 = v14;
  return 1LL;
}

void *EVP_tls_cbc_copy_mac(void *a1, size_t a2, uint64_t a3, size_t a4, unint64_t a5)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  unint64_t v5 = a5 - a4;
  if (a5 < a4) {
    EVP_tls_cbc_copy_mac_cold_1();
  }
  if (a4 < a2) {
    EVP_tls_cbc_copy_mac_cold_2();
  }
  if (a2 >= 0x41) {
    EVP_tls_cbc_copy_mac_cold_3();
  }
  if (!a2) {
    EVP_tls_cbc_copy_mac_cold_4();
  }
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src[2] = v11;
  __src[3] = v11;
  __src[0] = v11;
  __src[1] = v11;
  unint64_t v12 = a2 + 256;
  if (a5 >= a2 + 256) {
    unint64_t v13 = a5 - (a2 + 256);
  }
  else {
    unint64_t v13 = 0LL;
  }
  __memset_chk();
  unint64_t v14 = 0LL;
  if (v13 < a5)
  {
    size_t v15 = 0LL;
    LOBYTE(v16) = 0;
    unint64_t v14 = 0LL;
    if (a5 >= v12) {
      unint64_t v17 = a2 + 256;
    }
    else {
      unint64_t v17 = a5;
    }
    uint64_t v18 = -(uint64_t)v17;
    do
    {
      unint64_t v19 = a5 + v18;
      if (v15 >= a2) {
        size_t v20 = a2;
      }
      else {
        size_t v20 = 0LL;
      }
      size_t v21 = v15 - v20;
      uint64_t v22 = ((v19 ^ (a4 - a2)) - 1) & ~(v19 ^ (a4 - a2));
      unint64_t v16 = v16 | (unint64_t)(v22 >> 63);
      *((_BYTE *)__src + v21) |= ((uint64_t)(((v5 + v18) ^ v19 | v19 ^ a4) ^ v19) >> 63) & *(_BYTE *)(a3 + a5 + v18) & v16;
      v14 |= v21 & (v22 >> 63);
      size_t v15 = v21 + 1;
    }

    while (!__CFADD__(v18++, 1LL));
  }

  *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35[2] = v24;
  v35[3] = v24;
  v35[0] = v24;
  v35[1] = v24;
  if (a2 < 2)
  {
    uint64_t v33 = __src;
  }

  else
  {
    uint64x2_t v25 = v35;
    uint64_t v26 = __src;
    unint64_t v27 = 1LL;
    do
    {
      uint64_t v28 = 0LL;
      uint64x2_t v29 = v26;
      size_t v30 = v27;
      do
      {
        if (v30 >= a2) {
          size_t v31 = a2;
        }
        else {
          size_t v31 = 0LL;
        }
        size_t v32 = v30 - v31;
        *((_BYTE *)v25 + v28) = ((v14 & 1) - 1) & *((_BYTE *)v26 + v28) | ~((v14 & 1) - 1) & *((_BYTE *)v26 + v32);
        ++v28;
        size_t v30 = v32 + 1;
      }

      while (a2 != v28);
      v27 *= 2LL;
      v14 >>= 1;
      uint64_t v33 = v25;
      uint64_t v26 = v25;
      uint64x2_t v25 = v29;
    }

    while (v27 < a2);
  }

  return memcpy(a1, v33, a2);
}

BOOL EVP_tls_cbc_record_digest_supported(const EVP_MD *a1)
{
  int v1 = EVP_MD_type(a1);
  return (v1 - 672) < 2 || v1 == 64;
}

uint64_t EVP_tls_cbc_digest_record( const EVP_MD *a1, unsigned __int8 *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  if (a7 >= 0x100000) {
    EVP_tls_cbc_digest_record_cold_1();
  }
  *(void *)&c.num = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.u.p[96] = v14;
  *(_OWORD *)&c.u.p[112] = v14;
  *(_OWORD *)&c.u.p[64] = v14;
  *(_OWORD *)&c.u.p[80] = v14;
  *(_OWORD *)&c.u.p[32] = v14;
  *(_OWORD *)&c.u.p[48] = v14;
  *(_OWORD *)c.u.d = v14;
  *(_OWORD *)&c.u.p[16] = v14;
  *(_OWORD *)&c.h[6] = v14;
  *(_OWORD *)&c.Nl = v14;
  *(_OWORD *)&c.h[2] = v14;
  *(_OWORD *)&c.h[4] = v14;
  *(_OWORD *)c.h = v14;
  int v15 = EVP_MD_type(a1);
  switch(v15)
  {
    case 673:
      SHA384_Init(&c);
      v76 = (void (*)(uint64_t, _BYTE *))tls1_sha512_final_raw;
      unsigned int v16 = 48;
      int v17 = 16;
      char v18 = 7;
      unsigned int v19 = 128;
      size_t v20 = (void (__cdecl *)(SHA_CTX *, const unsigned __int8 *))tls1_sha512_transform;
      break;
    case 672:
      SHA256_Init((SHA256_CTX *)&c);
      v76 = (void (*)(uint64_t, _BYTE *))tls1_sha256_final_raw;
      unsigned int v16 = 32;
      int v17 = 8;
      char v18 = 6;
      unsigned int v19 = 64;
      size_t v20 = (void (__cdecl *)(SHA_CTX *, const unsigned __int8 *))tls1_sha256_transform;
      break;
    case 64:
      SHA1_Init((SHA_CTX *)&c);
      v76 = (void (*)(uint64_t, _BYTE *))tls1_sha1_final_raw;
      unsigned int v16 = 20;
      int v17 = 8;
      char v18 = 6;
      unsigned int v19 = 64;
      size_t v20 = tls1_sha1_transform;
      break;
    default:
      EVP_tls_cbc_digest_record_cold_2();
  }

  if (v19 != 1 << v18) {
    EVP_tls_cbc_digest_record_cold_4();
  }
  char v72 = v18;
  uint64_t v74 = a6;
  v67 = a3;
  type = (EVP_MD *)a1;
  unint64_t v21 = a7 + 13;
  size_t v22 = v19;
  uint64_t v23 = v19 - 1;
  unint64_t v79 = v21;
  unint64_t v24 = ((_DWORD)v23 + (_DWORD)v21 + v17 - v16) / v19;
  unint64_t v70 = ((v16 | v19) + 255) / v19 + 1;
  BOOL v25 = v24 >= v70;
  unint64_t v26 = v24 - v70;
  *(void *)&__int128 v27 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  d[6] = v27;
  d[7] = v27;
  d[4] = v27;
  d[5] = v27;
  d[2] = v27;
  d[3] = v27;
  unsigned int v28 = v19;
  uint64_t v29 = v26 * v19;
  if (v25) {
    unint64_t v30 = v26;
  }
  else {
    unint64_t v30 = 0LL;
  }
  unsigned int v31 = v17;
  if (v26 != 0 && v25) {
    unint64_t v32 = v29;
  }
  else {
    unint64_t v32 = 0LL;
  }
  d[0] = v27;
  d[1] = v27;
  __memset_chk();
  if (a9 >= 0x81) {
    EVP_tls_cbc_digest_record_cold_3();
  }
  v78 = v20;
  md = a2;
  size_t v33 = v16;
  unint64_t v34 = v74 - v16 + 13;
  unsigned int v69 = v31;
  unint64_t v35 = v34 + v31;
  if (a9) {
    __memcpy_chk();
  }
  unint64_t v36 = 0LL;
  unint64_t v37 = v34 & v23;
  unint64_t v38 = v34 >> v72;
  unint64_t v73 = v35 >> v72;
  unint64_t v75 = v38;
  v39.i64[0] = 0x3636363636363636LL;
  v39.i64[1] = 0x3636363636363636LL;
  int v40 = 8 * v28 + 8 * v34;
  do
  {
    d[v36 / 0x10] = veorq_s8((int8x16_t)d[v36 / 0x10], v39);
    v36 += 16LL;
  }

  while (v22 != v36);
  v78((SHA_CTX *)&c, (const unsigned __int8 *)d);
  v85[0] = 0xAAAAAAAAAAAAAAAALL;
  v85[1] = 0xAAAAAAAAAAAAAAAALL;
  __memset_chk();
  *((_BYTE *)v85 + v69 - 4) = HIBYTE(v40);
  *((_BYTE *)v85 + v69 - 3) = BYTE2(v40);
  *((_BYTE *)v85 + v69 - 2) = BYTE1(v40);
  *((_BYTE *)v85 + v69 - 1) = 8 * v34;
  if (v32)
  {
    *(_DWORD *)&ctx[124] = -1431655766;
    *(void *)&__int128 v41 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx[109] = v41;
    *(_OWORD *)&ctx[93] = v41;
    *(_OWORD *)&ctx[77] = v41;
    *(_OWORD *)&ctx[61] = v41;
    *(_OWORD *)&ctx[45] = v41;
    *(_OWORD *)&ctx[29] = v41;
    *(void *)ctx = *a4;
    *(void *)&ctx[5] = *(void *)((char *)a4 + 5);
    *(_OWORD *)&ctx[13] = v41;
    __memcpy_chk();
    v78((SHA_CTX *)&c, ctx);
    if (v32 / v22 >= 2)
    {
      uint64_t v42 = v32 / v22 - 1;
      v43 = (const unsigned __int8 *)(v22 + a5 - 13);
      do
      {
        v78((SHA_CTX *)&c, v43);
        v43 += v22;
        --v42;
      }

      while (v42);
    }
  }

  memset(v83, 0, sizeof(v83));
  unint64_t v71 = v30 + v70;
  unint64_t v44 = v28 - v69;
  unint64_t v45 = v79;
  uint64_t v46 = a5;
  do
  {
    unint64_t v47 = 0LL;
    *(void *)&__int128 v48 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx[96] = v48;
    *(_OWORD *)&ctx[112] = v48;
    *(_OWORD *)&ctx[64] = v48;
    *(_OWORD *)&ctx[80] = v48;
    *(_OWORD *)&ctx[32] = v48;
    *(_OWORD *)&ctx[48] = v48;
    uint64_t v49 = (uint64_t)(((v30 ^ v75) - 1) & ~(v30 ^ v75)) >> 63;
    unint64_t v81 = v30;
    uint64_t v50 = (uint64_t)(((v30 ^ v73) - 1) & ~(v30 ^ v73)) >> 63;
    char v51 = v49;
    char v52 = ~(_BYTE)v49;
    *(_OWORD *)ctx = v48;
    *(_OWORD *)&ctx[16] = v48;
    char v53 = v49 | ~(_BYTE)v50;
    unint64_t v54 = v32;
    do
    {
      if (v32 + v47 <= 0xC)
      {
        v55 = (char *)a4 + v32 + v47;
LABEL_30:
        char v56 = *v55;
        goto LABEL_32;
      }

      if (v32 + v47 < v45)
      {
        v55 = (char *)(v54 + v46 - 13);
        goto LABEL_30;
      }

      char v56 = 0;
LABEL_32:
      if (v47 >= v37) {
        char v57 = v51;
      }
      else {
        char v57 = 0;
      }
      char v58 = v57 & 0x80 | v56 & ~v57;
      if (v47 <= v37) {
        char v59 = -1;
      }
      else {
        char v59 = v52;
      }
      char v60 = v59 & v53 & v58;
      if (v47 >= v44) {
        char v60 = v50 & *((_BYTE *)v85 + v47 - v44) | v60 & ~(_BYTE)v50;
      }
      ctx[v47++] = v60;
      ++v54;
    }

    while (v22 != v47);
    v78((SHA_CTX *)&c, ctx);
    v76((uint64_t)&c, ctx);
    uint64_t v61 = 0LL;
    v32 += v47;
    do
    {
      *((_BYTE *)v83 + v61) |= ctx[v61] & v50;
      ++v61;
    }

    while (v33 != v61);
    uint64_t v46 = a5;
    unint64_t v30 = v81 + 1;
    unint64_t v45 = v79;
  }

  while (v81 + 1 <= v71);
  *(void *)&__int128 v62 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)ctx = v62;
  *(_OWORD *)&ctx[16] = v62;
  EVP_MD_CTX_init((EVP_MD_CTX *)ctx);
  if (EVP_DigestInit_ex((EVP_MD_CTX *)ctx, type, 0LL))
  {
    unint64_t v63 = 0LL;
    v64.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
    v64.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
    do
    {
      d[v63 / 0x10] = veorq_s8((int8x16_t)d[v63 / 0x10], v64);
      v63 += 16LL;
    }

    while (v22 != v63);
    EVP_DigestUpdate((EVP_MD_CTX *)ctx, d, v22);
    EVP_DigestUpdate((EVP_MD_CTX *)ctx, v83, v33);
    unsigned int s = -1431655766;
    EVP_DigestFinal((EVP_MD_CTX *)ctx, md, &s);
    void *v67 = s;
    EVP_MD_CTX_cleanup((EVP_MD_CTX *)ctx);
    return 1LL;
  }

  else
  {
    EVP_MD_CTX_cleanup((EVP_MD_CTX *)ctx);
    return 0LL;
  }

uint64_t tls1_sha1_final_raw(uint64_t result, _BYTE *a2)
{
  *a2 = *(_BYTE *)(result + 3);
  a2[1] = *(_WORD *)(result + 2);
  a2[2] = BYTE1(*(_DWORD *)result);
  a2[3] = *(_DWORD *)result;
  a2[4] = *(_BYTE *)(result + 7);
  a2[5] = *(_WORD *)(result + 6);
  a2[6] = BYTE1(*(_DWORD *)(result + 4));
  a2[7] = *(_DWORD *)(result + 4);
  a2[8] = *(_BYTE *)(result + 11);
  a2[9] = *(_WORD *)(result + 10);
  a2[10] = BYTE1(*(_DWORD *)(result + 8));
  a2[11] = *(_DWORD *)(result + 8);
  a2[12] = *(_BYTE *)(result + 15);
  a2[13] = *(_WORD *)(result + 14);
  a2[14] = BYTE1(*(_DWORD *)(result + 12));
  a2[15] = *(_DWORD *)(result + 12);
  a2[16] = *(_BYTE *)(result + 19);
  a2[17] = *(_WORD *)(result + 18);
  a2[18] = BYTE1(*(_DWORD *)(result + 16));
  a2[19] = *(_DWORD *)(result + 16);
  return result;
}

uint64_t tls1_sha256_final_raw(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0LL; i != 32; i += 4LL)
  {
    uint64_t v3 = (_BYTE *)(a2 + i);
    _BYTE *v3 = *(_BYTE *)(result + i + 3);
    v3[1] = *(_WORD *)(result + i + 2);
    v3[2] = BYTE1(*(_DWORD *)(result + i));
    v3[3] = *(_DWORD *)(result + i);
  }

  return result;
}

uint64_t tls1_sha512_final_raw(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0LL; i != 64; i += 8LL)
  {
    uint64_t v3 = (_BYTE *)(a2 + i);
    _BYTE *v3 = *(_BYTE *)(result + i + 7);
    v3[1] = *(_WORD *)(result + i + 6);
    v3[2] = (unsigned __int16)WORD2(*(void *)(result + i)) >> 8;
    v3[3] = *(_DWORD *)(result + i + 4);
    v3[4] = BYTE3(*(void *)(result + i));
    v3[5] = BYTE2(*(void *)(result + i));
    v3[6] = BYTE1(*(void *)(result + i));
    v3[7] = *(void *)(result + i);
  }

  return result;
}

int *bssl::ssl_reset_error_state(bssl *this, ssl_st *a2)
{
  *(_DWORD *)(*((void *)this + 6) + 196LL) = 0;
  ERR_clear_error();
  return ERR_clear_system_error();
}

void bssl::ssl_set_read_error(bssl *this, ssl_st *a2)
{
  uint64_t v2 = *((void *)this + 6);
  *(_DWORD *)(v2 + 172) = 2;
  uint64_t v3 = (uint64_t *)(v2 + 184);
  uint64_t v4 = ERR_save_state();
  std::unique_ptr<err_save_state_st,bssl::internal::Deleter>::reset[abi:ne180100](v3, (uint64_t)v4);
}

uint64_t bssl::ssl_open_change_cipher_spec(void *a1, void *a2, _BYTE *a3)
{
  *a2 = 0LL;
  uint64_t v4 = a1[6];
  if (*(_DWORD *)(v4 + 172) == 2)
  {
    ERR_restore_state(*(void **)(v4 + 184));
    *a3 = 0;
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(void *))(*a1 + 56LL))(a1);
    if ((_DWORD)result != 4) {
      return result;
    }
    uint64_t v7 = a1[6];
    *(_DWORD *)(v7 + 172) = 2;
    uint64_t v8 = (uint64_t *)(v7 + 184);
    uint64_t v9 = ERR_save_state();
    std::unique_ptr<err_save_state_st,bssl::internal::Deleter>::reset[abi:ne180100](v8, (uint64_t)v9);
  }

  return 4LL;
}

BOOL bssl::cbb_add_hex_consttime(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  int v5 = CBB_add_space(a1, &v12, 2 * a3);
  if (v5 && v3)
  {
    do
    {
      unsigned int v6 = *a2++;
      char v7 = bssl::hex_char_consttime((bssl *)(v6 >> 4));
      uint64_t v8 = (_BYTE *)v12++;
      *uint64_t v8 = v7;
      char v9 = bssl::hex_char_consttime((bssl *)(v6 & 0xF));
      unint64_t v10 = (_BYTE *)v12++;
      *unint64_t v10 = v9;
      --v3;
    }

    while (v3);
  }

  return v5 != 0;
}

uint64_t ssl_session_hash(const ssl_session_st *a1)
{
  return bssl::ssl_hash_session_id((int *)&a1->master_key[40], a1->master_key[39]);
}

uint64_t ssl_session_cmp(const ssl_session_st *a1, const ssl_session_st *a2)
{
  size_t v2 = a1->master_key[39];
  if ((_DWORD)v2 != a2->master_key[39]) {
    return 1LL;
  }
  if (a1->master_key[39]) {
    return memcmp(&a1->master_key[40], &a2->master_key[40], v2);
  }
  return 0LL;
}

uint64_t SSL_CTX_set_strict_cipher_list(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 832);
  if ((v4 & 0x800) != 0) {
    int v5 = (v4 >> 12) & 1;
  }
  else {
    int v5 = ssl_credential_st::UsesPrivateKey((ssl_credential_st *)a1) != 0;
  }
  return bssl::ssl_create_cipher_list((bssl::SSLCipherPreferenceList **)(a1 + 240), v5, a2, 1);
}

uint64_t SSL_CTX_up_ref(unsigned int *a1)
{
  return 1LL;
}

void bssl::RefCounted<ssl_ctx_st>::DecRefInternal(ssl_ctx_st *a1)
{
  if (CRYPTO_refcount_dec_and_test_zero((unsigned int *)a1))
  {
    ssl_ctx_st::~ssl_ctx_st(a1);
    OPENSSL_free(v2);
  }

void std::unique_ptr<bssl::SSL_CONFIG,bssl::internal::Deleter>::reset[abi:ne180100]( BUF_MEM ***a1, BUF_MEM **a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    bssl::SSL_CONFIG::~SSL_CONFIG(v3);
    OPENSSL_free(v4);
  }

void SSL_set_accept_state(SSL *s)
{
  BYTE4(s->param) |= 1u;
  *(void *)&s->rwstate = bssl::ssl_server_handshake;
}

uint64_t SSL_quic_max_handshake_flight_len(uint64_t a1, int a2)
{
  unsigned int v2 = 0x4000;
  switch(a2)
  {
    case 0:
    case 3:
      return v2;
    case 2:
      if ((*(_BYTE *)(a1 + 180) & 1) != 0)
      {
        if ((*(_BYTE *)(*(void *)(a1 + 8) + 300LL) & 1) == 0) {
          return 0x4000;
        }
        unsigned int v2 = *(_DWORD *)(a1 + 152);
      }

      else
      {
        unsigned int v2 = 2 * *(_DWORD *)(a1 + 152);
      }

      if (v2 > 0x4000) {
        return v2;
      }
      return 0x4000;
    default:
      return 0;
  }

uint64_t SSL_quic_read_level(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 48) + 200LL);
}

uint64_t SSL_quic_write_level(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 48) + 204LL);
}

void *SSL_provide_quic_data(uint64_t a1, int a2, const void *a3, size_t a4)
{
  if (!*(void *)(a1 + 168))
  {
    int v9 = 66;
    int v10 = 864;
    goto LABEL_10;
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (*(_DWORD *)(v5 + 200) != a2)
  {
    int v9 = 299;
    int v10 = 869;
    goto LABEL_10;
  }

  uint64_t v8 = *(void **)(v5 + 224);
  if (v8) {
    uint64_t v8 = (void *)*v8;
  }
  if (__CFADD__(v8, a4) || (unint64_t)v8 + a4 > SSL_quic_max_handshake_flight_len(a1, a2))
  {
    int v9 = 150;
    int v10 = 876;
LABEL_10:
    ERR_put_error(16, 0, v9, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", v10);
    return 0LL;
  }

  return bssl::tls_append_handshake_data(a1, a3, a4);
}

uint64_t SSL_generate_authenticator(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned __int8 **a5)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(void *)(v5 + 280) || !*(void *)(v5 + 288)) {
    return 0LL;
  }
  session = (bssl *)SSL_get_session((const SSL *)a1);
  digest = bssl::ssl_session_get_digest(session, v12);
  size_t v14 = EVP_MD_size(digest);
  memset(d, 0, sizeof(d));
  int v15 = (*(_BYTE *)(a1 + 180) & 1) != 0
      ? "EXPORTER-server authenticator handshake context"
      : "EXPORTER-client authenticator handshake context";
  size_t v16 = EVP_MD_size(digest);
  memset(key, 0, sizeof(key));
  int v17 = (*(_BYTE *)(a1 + 180) & 1) != 0
      ? "EXPORTER-server authenticator finished key"
      : "EXPORTER-client authenticator finished key";
  unint64_t v37 = 0LL;
  unint64_t v38 = 0LL;
  uint64_t v19 = *(void *)(a1 + 48);
  *(void *)(*(void *)(v19 + 288) + 8LL) = *(void *)(a1 + 8);
  if (!bssl::tls13_add_certificate_in_buffer(*(bssl **)(v19 + 288), (bssl::SSL_HANDSHAKE *)1, &v38, &v37, v18))
  {
    OPENSSL_free(v38);
    return 0LL;
  }

  *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v49 = v20;
  __int128 v50 = v20;
  *(_OWORD *)md = v20;
  __int128 v48 = v20;
  unsigned int s = -1431655766;
  *(_OWORD *)&ctx.digest = v20;
  *(_OWORD *)&ctx.flagunsigned int s = v20;
  EVP_MD_CTX_init(&ctx);
  EVP_DigestInit_ex(&ctx, digest, 0LL);
  EVP_DigestUpdate(&ctx, d, v14);
  EVP_DigestUpdate(&ctx, v38, (size_t)v37);
  EVP_DigestFinal_ex(&ctx, md, &s);
  EVP_MD_CTX_cleanup(&ctx);
  *(void *)&n[1] = 0LL;
  unint64_t v34 = 0LL;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 288LL) + 1584LL) &= ~0x1000000u;
  if (bssl::tls13_add_certificate_verify_in_buffer( *(bssl **)(*(void *)(a1 + 48) + 288LL),  (bssl::SSL_HANDSHAKE *)1,  &v34,  (unsigned __int8 **)&n[1],  (unint64_t *)md,  (const unsigned __int8 *)s))
  {
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    return 0LL;
  }

  *(void *)&__int128 v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v45 = v21;
  __int128 v46 = v21;
  *(_OWORD *)v43 = v21;
  __int128 v44 = v21;
  n[0] = -1431655766;
  *(_OWORD *)&v32.digest = v21;
  *(_OWORD *)&v32.flagunsigned int s = v21;
  EVP_MD_CTX_init(&v32);
  EVP_DigestInit_ex(&v32, digest, 0LL);
  EVP_DigestUpdate(&v32, d, v14);
  EVP_DigestUpdate(&v32, v38, (size_t)v37);
  EVP_DigestUpdate(&v32, v34, *(size_t *)&n[1]);
  EVP_DigestFinal_ex(&v32, v43, n);
  EVP_MD_CTX_cleanup(&v32);
  unsigned int md_len = -1431655766;
  *(void *)&__int128 v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v41 = v22;
  __int128 v42 = v22;
  *(_OWORD *)int8x16_t v39 = v22;
  __int128 v40 = v22;
  if (!HMAC(digest, key, v16, v43, n[0], v39, &md_len))
  {
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    return 0LL;
  }

  size_t v29 = 0LL;
  unint64_t v30 = 0LL;
  *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[1] = v23;
  v28[2] = v23;
  v28[0] = v23;
  CBB_zero(v28);
  *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[1] = v24;
  v27[2] = v24;
  v27[0] = v24;
  if ((*(unsigned int (**)(uint64_t, _OWORD *, _OWORD *, uint64_t))(*(void *)a1 + 88LL))(a1, v28, v27, 20LL)
    && CBB_add_bytes((uint64_t)v27, v39, md_len)
    && CBB_finish((uint64_t)v28, &v30, &v29))
  {
    BOOL v25 = &v37[*(void *)&n[1] + v29];
    *a5 = v25;
    unint64_t v26 = OPENSSL_malloc((unint64_t)v25);
    *a4 = v26;
    memcpy(v26, v38, (size_t)v37);
    memcpy(&v37[*a4], v34, *(size_t *)&n[1]);
    memcpy(&v37[*a4 + *(void *)&n[1]], v30, v29);
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    OPENSSL_free(v30);
    uint64_t v6 = 1LL;
  }

  else
  {
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    OPENSSL_free(v30);
    uint64_t v6 = 0LL;
  }

  CBB_cleanup((uint64_t)v28);
  return v6;
}

void sub_1875CA06C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SSL_validate_authenticator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 48);
  if (*(void *)(v3 + 280) || !*(void *)(v3 + 288)) {
    return 0LL;
  }
  sessiounsigned int n = (bssl *)SSL_get_session((const SSL *)a1);
  digest = bssl::ssl_session_get_digest(session, v9);
  size_t v11 = EVP_MD_size(digest);
  memset(d, 0, 64);
  if ((*(_BYTE *)(a1 + 180) & 1) != 0) {
    unint64_t v12 = "EXPORTER-client authenticator handshake context";
  }
  else {
    unint64_t v12 = "EXPORTER-server authenticator handshake context";
  }
  uint64_t result = SSL_export_keying_material((bssl *)a1, (ssl_st *)d, v11, v12, 0x2FuLL, 0LL, 0LL, 0);
  if ((_DWORD)result)
  {
    size_t v13 = EVP_MD_size(digest);
    memset(key, 0, sizeof(key));
    size_t v14 = (*(_BYTE *)(a1 + 180) & 1) != 0
        ? "EXPORTER-client authenticator finished key"
        : "EXPORTER-server authenticator finished key";
    uint64_t result = SSL_export_keying_material((bssl *)a1, (ssl_st *)key, v13, v14, 0x2AuLL, 0LL, 0LL, 0);
    if ((_DWORD)result)
    {
      v39[0] = a2;
      v39[1] = a3;
      size_t v38 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v36 = v15;
      __int128 v37 = v15;
      uint64_t result = parse_handshake_message(v39, (uint64_t)&v36);
      if ((_DWORD)result)
      {
        if (BYTE1(v36) == 25 || BYTE1(v36) == 11)
        {
          size_t v35 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v33 = v16;
          __int128 v34 = v16;
          int v17 = parse_handshake_message(v39, (uint64_t)&v33);
          uint64_t result = 0LL;
          if (v17)
          {
            if (BYTE1(v33) == 15)
            {
              unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v31[0] = v18;
              v31[1] = v18;
              int v19 = parse_handshake_message(v39, (uint64_t)v31);
              uint64_t result = 0LL;
              if (v19)
              {
                if (BYTE1(v31[0]) == 20)
                {
                  bssl::SSL_SESSION_dup(*(bssl **)(*(void *)(a1 + 48) + 472LL), (ssl_session_st *)2, md);
                  __int128 v20 = (SSL_SESSION **)(*(void *)(*(void *)(a1 + 48) + 288LL) + 1520LL);
                  __int128 v21 = *(SSL_SESSION **)&md[0];
                  *(void *)&md[0] = 0LL;
                  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](v20, v21);
                  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)md, 0LL);
                  int v22 = bssl::tls13_process_certificate(*(EVP_PKEY ***)(*(void *)(a1 + 48) + 288LL), (uint64_t)&v36, 0);
                  uint64_t result = 0LL;
                  if (v22)
                  {
                    *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    md[2] = v23;
                    md[3] = v23;
                    md[0] = v23;
                    md[1] = v23;
                    unsigned int s = -1431655766;
                    *(_OWORD *)&n_4.digest = v23;
                    *(_OWORD *)&n_4.flagunsigned int s = v23;
                    EVP_MD_CTX_init(&n_4);
                    EVP_DigestInit_ex(&n_4, digest, 0LL);
                    EVP_DigestUpdate(&n_4, d, v11);
                    EVP_DigestUpdate(&n_4, *((const void **)&v37 + 1), v38);
                    EVP_DigestFinal_ex(&n_4, (unsigned __int8 *)md, &s);
                    EVP_MD_CTX_cleanup(&n_4);
                    uint64_t result = bssl::tls13_process_certificate_verify_with_transcript( *(void *)(*(void *)(a1 + 48) + 288LL),  (uint64_t)&v33,  1,  md,  s);
                    if ((_DWORD)result)
                    {
                      *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v41[2] = v24;
                      v41[3] = v24;
                      v41[0] = v24;
                      v41[1] = v24;
                      unsigned int n = -1431655766;
                      *(_OWORD *)&v27.digest = v24;
                      *(_OWORD *)&v27.flagunsigned int s = v24;
                      EVP_MD_CTX_init(&v27);
                      EVP_DigestInit_ex(&v27, digest, 0LL);
                      EVP_DigestUpdate(&v27, d, v11);
                      EVP_DigestUpdate(&v27, *((const void **)&v37 + 1), v38);
                      EVP_DigestUpdate(&v27, *((const void **)&v34 + 1), v35);
                      EVP_DigestFinal_ex(&v27, (unsigned __int8 *)v41, &n);
                      EVP_MD_CTX_cleanup(&v27);
                      unsigned int md_len = -1431655766;
                      *(void *)&__int128 v25 = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v40[2] = v25;
                      v40[3] = v25;
                      v40[0] = v25;
                      v40[1] = v25;
                      uint64_t result = (uint64_t)HMAC( digest,  key,  v13,  (const unsigned __int8 *)v41,  n,  (unsigned __int8 *)v40,  &md_len);
                      if (result) {
                        return CBS_mem_equal((uint64_t)v31 + 8, (char *)v40, md_len);
                      }
                    }
                  }
                }
              }
            }
          }

          return result;
        }

        return 0LL;
      }
    }
  }

  return result;
}

uint64_t parse_handshake_message(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t result = CBS_get_u8(a1, (_BYTE *)(a2 + 1));
  if ((_DWORD)result)
  {
    unsigned int v7 = -1431655766;
    uint64_t result = CBS_get_u24(a1, (int *)&v7);
    if ((_DWORD)result)
    {
      uint64_t result = CBS_get_bytes(a1, (void *)(a2 + 8), v7);
      if ((_DWORD)result)
      {
        uint64_t v6 = v7 + 4;
        *(void *)(a2 + 24) = v4;
        *(void *)(a2 + 32) = v6;
        return 1LL;
      }
    }
  }

  return result;
}

int SSL_accept(SSL *ssl)
{
  if (!*(void *)&ssl->rwstate)
  {
    BYTE4(ssl->param) |= 1u;
    *(void *)&ssl->rwstate = bssl::ssl_server_handshake;
  }

  return SSL_do_handshake(ssl);
}

uint64_t SSL_process_quic_post_handshake(void *a1)
{
  *(_DWORD *)(a1[6] + 196LL) = 0;
  ERR_clear_error();
  ERR_clear_system_error();
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(v2 + 280);
  if (!v3 || (*(_BYTE *)(v3 + 1584) & 8) != 0)
  {
    if (*(_DWORD *)(v2 + 172) == 2)
    {
      ERR_restore_state(*(void **)(v2 + 184));
    }

    else
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v9[0] = v4;
      v9[1] = v4;
      while (ssl_do_post_handshake((uint64_t)a1, (uint64_t)v9))
      {
        (*(void (**)(void *))(*a1 + 32LL))(a1);
      }

      uint64_t v6 = a1[6];
      *(_DWORD *)(v6 + 172) = 2;
      unsigned int v7 = (uint64_t *)(v6 + 184);
      uint64_t v8 = ERR_save_state();
      std::unique_ptr<err_save_state_st,bssl::internal::Deleter>::reset[abi:ne180100](v7, (uint64_t)v8);
    }
  }

  else
  {
    ERR_put_error(16, 0, 66, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 1203);
  }

  return 0LL;
}

uint64_t SSL_set_quic_transport_params(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 0LL;
  }
  uint64_t v6 = (void **)(v3 + 224);
  uint64_t v7 = bssl::Array<unsigned char>::Init(v3 + 224, a3);
  uint64_t v8 = v7;
  if (a3 && (_DWORD)v7) {
    memmove(*v6, a2, a3);
  }
  return v8;
}

uint64_t SSL_set_quic_early_data_context(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 0LL;
  }
  uint64_t v6 = (void **)(v3 + 240);
  uint64_t v7 = bssl::Array<unsigned char>::Init(v3 + 240, a3);
  uint64_t v8 = v7;
  if (a3 && (_DWORD)v7) {
    memmove(*v6, a2, a3);
  }
  return v8;
}

uint64_t SSL_get_quic_early_data_context(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  uint64_t result = *(void *)(v2 + 240);
  *a2 = *(void *)(v2 + 248);
  return result;
}

uint64_t SSL_CTX_set_early_data_enabled(uint64_t result, int a2)
{
  *(_WORD *)(result + 832) = *(_WORD *)(result + 832) & 0xFBFF | ((a2 != 0) << 10);
  return result;
}

void SSL_reset_early_data_reject(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 280LL);
  if (!v1 || *(_DWORD *)(v1 + 16) != 13) {
    abort();
  }
  *(_DWORD *)(v1 + 16) = 1;
  *(_DWORD *)(v1 + 1584) &= ~0x400u;
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)(v1 + 1528), 0LL);
  uint64_t v3 = *(void *)(a1 + 48);
  *(void *)(v3 + 152) = 0LL;
  *(void *)(v3 + 160) = 0LL;
}

uint64_t SSL_CTX_set_options(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(_DWORD *)(a1 + 416) | a2;
  *(_DWORD *)(a1 + 416) = v2;
  return v2;
}

uint64_t SSL_CTX_clear_options(uint64_t a1, int a2)
{
  uint64_t v2 = *(_DWORD *)(a1 + 416) & ~a2;
  *(_DWORD *)(a1 + 416) = v2;
  return v2;
}

uint64_t SSL_clear_options(uint64_t a1, int a2)
{
  uint64_t v2 = *(_DWORD *)(a1 + 144) & ~a2;
  *(_DWORD *)(a1 + 144) = v2;
  return v2;
}

uint64_t SSL_CTX_set_mode(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(_DWORD *)(a1 + 420) | a2;
  *(_DWORD *)(a1 + 420) = v2;
  return v2;
}

uint64_t SSL_CTX_clear_mode(uint64_t a1, int a2)
{
  uint64_t v2 = *(_DWORD *)(a1 + 420) & ~a2;
  *(_DWORD *)(a1 + 420) = v2;
  return v2;
}

uint64_t SSL_CTX_get_mode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 420);
}

uint64_t SSL_set_mode(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(_DWORD *)(a1 + 148) | a2;
  *(_DWORD *)(a1 + 148) = v2;
  return v2;
}

uint64_t SSL_get_mode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 148);
}

int SSL_renegotiate(SSL *s)
{
  if ((*((_WORD *)s->handshake_func + 110) & 0x1000) == 0)
  {
    int v2 = 66;
    int v3 = 2050;
LABEL_11:
    ERR_put_error(16, 0, v2, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", v3);
    return 0;
  }

  if (!bssl::ssl_can_renegotiate((bssl *)s, v1))
  {
    int v2 = 182;
    int v3 = 2055;
    goto LABEL_11;
  }

  BOOL can_renegotiate = bssl::ssl_can_renegotiate((bssl *)s, v5);
  handshake_funSHA512_CTX c = s->handshake_func;
  if (!can_renegotiate)
  {
    uint64_t v8 = *((void *)handshake_func + 35);
    if (!v8 || (*(_BYTE *)(v8 + 1587) & 1) != 0) {
      SSL_renegotiate_cold_1();
    }
  }

  if (*((_WORD *)handshake_func + 58) || *((_DWORD *)handshake_func + 44))
  {
    int v2 = 182;
    int v3 = 2068;
    goto LABEL_11;
  }

  if (*((void *)handshake_func + 35))
  {
    int v2 = 68;
    int v3 = 2074;
    goto LABEL_11;
  }

  bssl::ssl_handshake_new(s, &v13);
  unint64_t v10 = (bssl::SSL_HANDSHAKE **)((char *)s->handshake_func + 280);
  size_t v11 = v13;
  size_t v13 = 0LL;
  std::unique_ptr<bssl::SSL_HANDSHAKE,bssl::internal::Deleter>::reset[abi:ne180100](v10, v11);
  std::unique_ptr<bssl::SSL_HANDSHAKE,bssl::internal::Deleter>::reset[abi:ne180100](&v13, 0LL);
  unint64_t v12 = s->handshake_func;
  if (*((void *)v12 + 35))
  {
    *((_WORD *)v12 + 110) &= ~0x1000u;
    ++*((_DWORD *)s->handshake_func + 48);
    return 1;
  }

  return 0;
}

BOOL bssl::ssl_can_renegotiate(bssl *this, const ssl_st *a2)
{
  if ((*((_BYTE *)this + 180) & 1) != 0
    || **(_BYTE **)this
    || (*(_WORD *)(*((void *)this + 6) + 220LL) & 2) != 0
    && bssl::ssl_protocol_version(this, a2) > 0x303
    || !*((void *)this + 1))
  {
    return 0LL;
  }

  BOOL result = 0LL;
  switch(*((_DWORD *)this + 44))
  {
    case 0:
    case 3:
      return result;
    case 1:
      BOOL result = *(_DWORD *)(*((void *)this + 6) + 192LL) == 0;
      break;
    case 2:
    case 4:
      BOOL result = 1LL;
      break;
    default:
      bssl::ssl_can_renegotiate();
  }

  return result;
}

uint64_t SSL_set_mtu(bssl *a1, unsigned int a2)
{
  *(_DWORD *)(*((void *)a1 + 7) + 304LL) = a2;
  return 1LL;
}

uint64_t SSL_CTX_sess_get_cache_size(uint64_t a1)
{
  return *(void *)(a1 + 272);
}

uint64_t SSL_CTX_set_tlsext_ticket_keys(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  if (!a2) {
    return 48LL;
  }
  if (a3 == 48)
  {
    uint64_t result = (uint64_t)OPENSSL_malloc(0x38uLL);
    if (result)
    {
      *(void *)(result + 48) = 0LL;
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)uint64_t result = *a2;
      *(_OWORD *)(result + 16) = a2[1];
      *(_OWORD *)(result + 32) = a2[2];
      *(void *)(result + 48) = 0LL;
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]( (void **)(a1 + 520),  (void *)result);
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((void **)(a1 + 528), 0LL);
      return 1LL;
    }
  }

  else
  {
    ERR_put_error(16, 0, 161, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 2211);
    return 0LL;
  }

  return result;
}

void std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100](void **a1, void *a2)
{
  int v3 = *a1;
  *a1 = a2;
  if (v3) {
    OPENSSL_free(v3);
  }
}

uint64_t ssl_str_to_group_ids(uint64_t a1, char *__s)
{
  int v2 = __s;
  uint64_t v4 = 0LL;
  uint64_t v5 = __s;
  do
  {
    uint64_t v6 = strchr(v5, 58);
    ++v4;
    uint64_t v5 = v6 + 1;
  }

  while (v6);
  size_t v14 = 0LL;
  uint64_t v15 = 0LL;
  if (bssl::Array<unsigned short>::Init((uint64_t)&v14, v4))
  {
    uint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = strchr(v2, 58);
      int v9 = v8;
      if (v8) {
        unint64_t v10 = (const char *)(v8 - v2);
      }
      else {
        unint64_t v10 = (const char *)strlen(v2);
      }
      if ((bssl::ssl_name_to_group_id((bssl *)((char *)v14 + v7), v2, v10) & 1) == 0)
      {
        ERR_put_error(16, 0, 239, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 2319);
        uint64_t v12 = 0LL;
        goto LABEL_14;
      }

      int v2 = v9 + 1;
      --v4;
      v7 += 2LL;
    }

    while (v9);
    if (v4) {
      __assert_rtn("ssl_str_to_group_ids", "ssl_lib.cc", 2327, "i == count");
    }
    OPENSSL_free(*(void **)a1);
    uint64_t v11 = v15;
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v11;
    size_t v14 = 0LL;
    uint64_t v15 = 0LL;
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

void sub_1875CAC00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t SSL_CTX_get_ciphers(uint64_t a1)
{
  return **(void **)(a1 + 240);
}

int SSL_CTX_set_cipher_list(SSL_CTX *a1, const char *str)
{
  unsigned int msg_callback_arg_low = LOWORD(a1[1].msg_callback_arg);
  if ((msg_callback_arg_low & 0x800) != 0) {
    int v5 = (msg_callback_arg_low >> 12) & 1;
  }
  else {
    int v5 = ssl_credential_st::UsesPrivateKey((ssl_credential_st *)a1) != 0;
  }
  return bssl::ssl_create_cipher_list((bssl::SSLCipherPreferenceList **)&a1->sha1, v5, (uint64_t)str, 0);
}

int SSL_set_cipher_list(SSL *s, const char *str)
{
  method = s->method;
  if (!method) {
    return 0;
  }
  unsigned int v4 = *(unsigned __int16 *)((char *)&method[1].ssl_write + 5);
  if ((v4 & 0x800) != 0)
  {
    int v6 = (v4 >> 12) & 1;
  }

  else
  {
    int v6 = ssl_credential_st::UsesPrivateKey((ssl_credential_st *)s) != 0;
    method = s->method;
  }

  return bssl::ssl_create_cipher_list((bssl::SSLCipherPreferenceList **)&method->ssl_free, v6, (uint64_t)str, 0);
}

const char *__cdecl SSL_get_servername(const SSL *s, const int type)
{
  if (type) {
    return 0LL;
  }
  uint64_t result = (const char *)s->msg_callback_arg;
  if (!result) {
    return (const char *)*((void *)s->handshake_func + 64);
  }
  return result;
}

uint64_t SSL_CTX_enable_signed_cert_timestamps(uint64_t result)
{
  *(_WORD *)(result + 832) |= 8u;
  return result;
}

uint64_t SSL_CTX_enable_ocsp_stapling(uint64_t result)
{
  *(_WORD *)(result + 832) |= 4u;
  return result;
}

uint64_t SSL_CTX_set_next_protos_advertised_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 576) = a2;
  *(void *)(result + 584) = a3;
  return result;
}

uint64_t SSL_CTX_set_next_proto_select_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 592) = a2;
  *(void *)(result + 600) = a3;
  return result;
}

uint64_t SSL_CTX_set_alpn_protos(uint64_t a1, void *a2, size_t a3)
{
  if (!a3) {
    return bssl::Array<unsigned char>::Init(a1 + 624, 0LL) ^ 1;
  }
  if ((bssl::ssl_is_valid_alpn_list((unsigned __int8 *)a2, a3) & 1) != 0)
  {
    int v6 = (void **)(a1 + 624);
    if (bssl::Array<unsigned char>::Init((uint64_t)v6, a3))
    {
      memmove(*v6, a2, a3);
      return 0LL;
    }
  }

  else
  {
    ERR_put_error(16, 0, 315, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 2643);
  }

  return 1LL;
}

uint64_t SSL_CTX_set_alpn_select_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 608) = a2;
  *(void *)(result + 616) = a3;
  return result;
}

uint64_t SSL_set_alpn_select_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

uint64_t SSL_get0_certificate_types(uint64_t a1, void *a2)
{
  if ((*(_BYTE *)(a1 + 180) & 1) != 0 || (uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 280LL)) == 0)
  {
    uint64_t result = 0LL;
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v3 = *(void *)(v2 + 1488);
    uint64_t result = *(void *)(v2 + 1496);
  }

  *a2 = v3;
  return result;
}

void SSL_set_shutdown(SSL *ssl, int mode)
{
  handshake_funSHA512_CTX c = ssl->handshake_func;
  int v4 = *((_DWORD *)handshake_func + 43);
  int v3 = *((_DWORD *)handshake_func + 44);
  if ((((v3 == 1) | (2 * (v4 != 0))) & ~mode) != 0) {
    SSL_set_shutdown_cold_1();
  }
  if ((mode & 2) != 0 && !v4) {
    *((_DWORD *)handshake_func + 43) = 1;
  }
  if ((mode & 1) != 0 && !v3) {
    *((_DWORD *)handshake_func + 44) = 1;
  }
}

uint64_t SSL_set_quic_method(uint64_t a1, uint64_t a2)
{
  if (**(_BYTE **)a1) {
    return 0LL;
  }
  *(void *)(a1 + 168) = a2;
  return 1LL;
}

uint64_t SSL_CTX_use_psk_identity_hint(uint64_t a1, char *a2)
{
  return use_psk_identity_hint((void **)(a1 + 544), a2);
}

uint64_t use_psk_identity_hint(void **a1, char *__s)
{
  if (!__s)
  {
    std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100](a1, 0LL);
    return 1LL;
  }

  if (strlen(__s) < 0x81)
  {
    std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100](a1, 0LL);
    if (*__s)
    {
      int v4 = (char *)OPENSSL_strdup(__s);
      std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100](a1, v4);
      if (!*a1) {
        return 0LL;
      }
    }

    return 1LL;
  }

  ERR_put_error(16, 0, 136, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 3041);
  return 0LL;
}

uint64_t SSL_use_psk_identity_hint(uint64_t a1, char *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    return use_psk_identity_hint((void **)(v2 + 56), a2);
  }
  else {
    return 0LL;
  }
}

uint64_t SSL_get_psk_identity_hint(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 8);
    if (!v1) {
      SSL_get_psk_identity_hint_cold_1();
    }
    return *(void *)(v1 + 56);
  }

  return result;
}

const SSL *SSL_get_psk_identity(const SSL *result)
{
  if (result)
  {
    uint64_t result = (const SSL *)SSL_get_session(result);
    if (result) {
      return (const SSL *)result->s3;
    }
  }

  return result;
}

uint64_t SSL_set_psk_client_callback(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2) {
    *(void *)(v2 + 64) = a2;
  }
  return result;
}

uint64_t SSL_CTX_set_psk_client_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 552) = a2;
  return result;
}

uint64_t SSL_set_psk_server_callback(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2) {
    *(void *)(v2 + 72) = a2;
  }
  return result;
}

uint64_t SSL_CTX_set_psk_server_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 560) = a2;
  return result;
}

uint64_t SSL_set_psk_client13_ext_callback(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2) {
    *(void *)(v2 + 80) = a2;
  }
  return result;
}

uint64_t SSL_CTX_set_psk_client13_ext_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 568) = a2;
  return result;
}

void SSL_CTX_set_msg_callback( SSL_CTX *ctx, void (__cdecl *cb)(int, int, int, const void *, size_t, SSL *, void *))
{
  *(void *)&ctx->tlsext_tick_key_name[8] = cb;
}

uint64_t SSL_CTX_set_keylog_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 760) = a2;
  return result;
}

size_t SSL_get_client_random(uint64_t a1, void *__dst, unint64_t a3)
{
  if (!a3) {
    return 32LL;
  }
  if (a3 >= 0x20) {
    size_t v3 = 32LL;
  }
  else {
    size_t v3 = a3;
  }
  memcpy(__dst, (const void *)(*(void *)(a1 + 48) + 48LL), v3);
  return v3;
}

size_t SSL_get_server_random(uint64_t a1, void *__dst, unint64_t a3)
{
  if (!a3) {
    return 32LL;
  }
  if (a3 >= 0x20) {
    size_t v3 = 32LL;
  }
  else {
    size_t v3 = a3;
  }
  memcpy(__dst, (const void *)(*(void *)(a1 + 48) + 16LL), v3);
  return v3;
}

uint64_t SSL_get_pending_cipher(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 280LL);
  if (v1) {
    return *(void *)(v1 + 1552);
  }
  else {
    return 0LL;
  }
}

uint64_t SSL_set_quic_use_legacy_codepoint(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2) {
    *(_WORD *)(v2 + 301) = *(_WORD *)(v2 + 301) & 0xFDFF | ((a2 != 0) << 9);
  }
  return result;
}

uint64_t SSL_CTX_use_server_raw_public_key_certificate(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result = (uint64_t)ssl_new_raw_public_key_credential_from_certificate(a2, a3);
  if (result)
  {
    std::unique_ptr<ssl_credential_st,bssl::internal::Deleter>::reset[abi:ne180100]( (ssl_credential_st **)(a1 + 656),  (ssl_credential_st *)result);
    int v5 = (_BYTE **)(a1 + 640);
    uint64_t result = bssl::Array<unsigned char>::Init((uint64_t)v5, 1uLL);
    if ((_DWORD)result)
    {
      *const char *v5 = 2;
      return 1LL;
    }
  }

  return result;
}

ssl_credential_st *ssl_new_raw_public_key_credential_from_certificate(const unsigned __int8 *a1, uint64_t a2)
{
  int v4 = (ssl_credential_st *)SSL_CREDENTIAL_new_raw_public_key();
  if (v4)
  {
    *(void *)&__int128 v9 = a1;
    *((void *)&v9 + 1) = a2;
    int v5 = EVP_parse_public_key(&v9);
    if (v5)
    {
      uint64_t v7 = v5;
      SSL_CREDENTIAL_set1_raw_public_key((uint64_t)v4, v5, v6);
      EVP_PKEY_free(v7);
    }

    else
    {
      SSL_CREDENTIAL_free(v4);
      return 0LL;
    }
  }

  return v4;
}

uint64_t SSL_CTX_use_client_raw_public_key_certificate(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result = (uint64_t)ssl_new_raw_public_key_credential_from_certificate(a2, a3);
  if (result)
  {
    std::unique_ptr<ssl_credential_st,bssl::internal::Deleter>::reset[abi:ne180100]( (ssl_credential_st **)(a1 + 680),  (ssl_credential_st *)result);
    int v5 = (_BYTE **)(a1 + 664);
    uint64_t result = bssl::Array<unsigned char>::Init((uint64_t)v5, 1uLL);
    if ((_DWORD)result)
    {
      *EVP_PKEY *v5 = 2;
      return 1LL;
    }
  }

  return result;
}

uint64_t SSL_use_server_raw_public_key_certificate(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  if (!*(void *)(a1 + 8)) {
    return 0LL;
  }
  uint64_t result = (uint64_t)ssl_new_raw_public_key_credential_from_certificate(a2, a3);
  if (result)
  {
    std::unique_ptr<ssl_credential_st,bssl::internal::Deleter>::reset[abi:ne180100]( (ssl_credential_st **)(*(void *)(a1 + 8) + 184LL),  (ssl_credential_st *)result);
    uint64_t result = bssl::Array<unsigned char>::Init(*(void *)(a1 + 8) + 168LL, 1uLL);
    if ((_DWORD)result)
    {
      **(_BYTE **)(*(void *)(a1 + 8) + 168LL) = 2;
      return 1LL;
    }
  }

  return result;
}

uint64_t SSL_use_client_raw_public_key_certificate(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  if (!*(void *)(a1 + 8)) {
    return 0LL;
  }
  uint64_t result = (uint64_t)ssl_new_raw_public_key_credential_from_certificate(a2, a3);
  if (result)
  {
    std::unique_ptr<ssl_credential_st,bssl::internal::Deleter>::reset[abi:ne180100]( (ssl_credential_st **)(*(void *)(a1 + 8) + 208LL),  (ssl_credential_st *)result);
    uint64_t result = bssl::Array<unsigned char>::Init(*(void *)(a1 + 8) + 192LL, 1uLL);
    if ((_DWORD)result)
    {
      **(_BYTE **)(*(void *)(a1 + 8) + 192LL) = 2;
      return 1LL;
    }
  }

  return result;
}

BOOL SSL_has_server_raw_public_key_certificate(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  return v1 && *(void *)(v1 + 184) != 0LL;
}

uint64_t SSL_CTX_use_ticket_request(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(a1 + 688) = a2;
  *(_BYTE *)(a1 + 689) = a3;
  return 1LL;
}

uint64_t SSL_set1_curves_list(uint64_t a1, char *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    return ssl_str_to_group_ids(v2 + 104, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t bssl::hex_char_consttime(bssl *this)
{
  char v1 = -1;
  return (((_BYTE)this + 48) & v1 | ((_BYTE)this + 87) & ~v1);
}

void std::unique_ptr<ssl_ctx_st,bssl::internal::Deleter>::reset[abi:ne180100]( ssl_ctx_st **a1, ssl_ctx_st *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    bssl::RefCounted<ssl_ctx_st>::DecRefInternal(v3);
  }
}

void std::unique_ptr<ssl_ech_keys_st,bssl::internal::Deleter>::reset[abi:ne180100]( unsigned int **a1, unsigned int *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    SSL_ECH_KEYS_free(v3);
  }
}

void std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter>::reset[abi:ne180100]( bssl::SSLCipherPreferenceList **a1, bssl::SSLCipherPreferenceList *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    bssl::SSLCipherPreferenceList::~SSLCipherPreferenceList(v3);
    OPENSSL_free(v4);
  }

void std::unique_ptr<stack_st_SRTP_PROTECTION_PROFILE,bssl::internal::Deleter>::reset[abi:ne180100]( BUF_MEM **a1, BUF_MEM *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    BUF_MEM_free(v3);
  }
}

void std::unique_ptr<ssl_st,bssl::internal::Deleter>::reset[abi:ne180100](ssl_st **a1, ssl_st *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    ssl_st::~ssl_st(v3);
    OPENSSL_free(v4);
  }

uint64_t boringssl_ecdsa_get_cc_curve_parameters(int a1)
{
  if (a1 > 714)
  {
    if (a1 == 715) {
      JUMPOUT(0x1895A8E6CLL);
    }
    if (a1 == 716) {
      return ccec_cp_521();
    }
  }

  else
  {
    if (a1 == 415) {
      JUMPOUT(0x1895A8E60LL);
    }
    if (a1 == 713) {
      JUMPOUT(0x1895A8E54LL);
    }
  }

  if (g_boringssl_log)
  {
    if (os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      boringssl_ecdsa_get_cc_curve_parameters_cold_1();
    }
  }

  return 0LL;
}

ECDSA_SIG *ECDSA_SIG_new(void)
{
  uint64_t result = (ECDSA_SIG *)malloc(0x10uLL);
  if (result)
  {
    result->r = 0LL;
    result->unsigned int s = 0LL;
  }

  return result;
}

void ECDSA_SIG_free(ECDSA_SIG *a)
{
  if (a)
  {
    r = a->r;
    if (r) {
      BN_free(r);
    }
    unsigned int s = a->s;
    if (s) {
      BN_free(s);
    }
    free(a);
  }

int ECDSA_sign( int type, const unsigned __int8 *dgst, int dgstlen, unsigned __int8 *sig, unsigned int *siglen, EC_KEY *eckey)
{
  if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
    ECDSA_sign_cold_1();
  }
  return 0;
}

ECDSA_SIG *__cdecl ECDSA_do_sign(const unsigned __int8 *dgst, int dgst_len, EC_KEY *eckey)
{
  if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
    ECDSA_do_sign_cold_1();
  }
  return 0LL;
}

int ECDSA_verify( int type, const unsigned __int8 *dgst, int dgstlen, const unsigned __int8 *sig, int siglen, EC_KEY *eckey)
{
  out = 0LL;
  int v7 = i2o_ECPublicKey(eckey, &out);
  if (!out)
  {
    if (g_boringssl_log)
    {
      int result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      ECDSA_verify_cold_1();
    }

    return 0;
  }

  uint64_t v8 = v7;
  __int128 v9 = EC_KEY_get0_group(eckey);
  int curve_name = EC_GROUP_get_curve_name(v9);
  cc_curve_parameterunsigned int s = (void *)boringssl_ecdsa_get_cc_curve_parameters(curve_name);
  if (!cc_curve_parameters) {
    goto LABEL_17;
  }
  uint64_t v12 = cc_curve_parameters;
  size_t v13 = malloc(24LL * *cc_curve_parameters + 16);
  if (!v13)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDSA_verify_cold_2();
    }
LABEL_17:
    if (out)
    {
      cc_clear();
      OPENSSL_free(out);
    }

    return 0;
  }

  size_t v14 = v13;
  if (MEMORY[0x1895A8E90](v12, v8, out, v13))
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDSA_verify_cold_4();
    }
    if (out)
    {
      cc_clear();
      OPENSSL_free(out);
    }

    free(v14);
    return 0;
  }

  else {
    BOOL v16 = 1;
  }
  if (!v16 && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
    ECDSA_verify_cold_3();
  }
  if (out)
  {
    cc_clear();
    OPENSSL_free(out);
  }

  free(v14);
  return 0;
}

int ECDSA_size(const EC_KEY *eckey)
{
  char v1 = EC_KEY_get0_group(eckey);
  int curve_name = EC_GROUP_get_curve_name(v1);
  if (boringssl_ecdsa_get_cc_curve_parameters(curve_name))
  {
    return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
  }

  else
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDSA_size_cold_1();
    }
    LODWORD(v3) = 0;
  }

  return v3;
}

int ECDSA_do_verify(const unsigned __int8 *dgst, int dgst_len, const ECDSA_SIG *sig, EC_KEY *eckey)
{
  int v6 = EC_KEY_get0_group(eckey);
  int curve_name = EC_GROUP_get_curve_name(v6);
  cc_curve_parameterunsigned int s = (void *)boringssl_ecdsa_get_cc_curve_parameters(curve_name);
  if (!cc_curve_parameters)
  {
    if (g_boringssl_log)
    {
      int result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      ECDSA_do_verify_cold_1();
    }

    return 0;
  }

  __int128 v9 = cc_curve_parameters;
  unint64_t v10 = (char *)malloc(24LL * *cc_curve_parameters + 16);
  if (!v10)
  {
    if (g_boringssl_log)
    {
      int result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      ECDSA_do_verify_cold_2();
    }

    return 0;
  }

  uint64_t v11 = v10;
  *(void *)unint64_t v10 = v9;
  out = 0LL;
  int v12 = i2o_ECPublicKey(eckey, &out);
  if (!out)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDSA_do_verify_cold_3();
    }
    goto LABEL_18;
  }

  if (MEMORY[0x1895A8E90](v9, v12, out, v11))
  {
    if (g_boringssl_log)
    {
      if (os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
        ECDSA_do_verify_cold_7();
      }
    }

    OPENSSL_free(out);
LABEL_18:
    size_t v14 = v11;
LABEL_19:
    free(v14);
    return 0;
  }

  size_t v15 = ccec_signature_r_s_size();
  BOOL v16 = malloc(v15);
  int v17 = (char *)malloc(v15);
  __int128 v18 = v17;
  if (v16) {
    BOOL v19 = v17 == 0LL;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDSA_do_verify_cold_4();
    }
    OPENSSL_free(out);
    free(v11);
    if (v16) {
      free(v16);
    }
    if (!v18) {
      return 0;
    }
    goto LABEL_45;
  }

  int v20 = BN_bn2bin_padded((char *)v16, v15, (uint64_t)sig->r);
  if (!v20 || !BN_bn2bin_padded(v18, v15, (uint64_t)sig->s))
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      ECDSA_do_verify_cold_5();
    }
    OPENSSL_free(out);
    free(v11);
    free(v16);
LABEL_45:
    size_t v14 = v18;
    goto LABEL_19;
  }

  if (ccec_verify_composite()
    && g_boringssl_log
    && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
  {
    ECDSA_do_verify_cold_6();
  }

  OPENSSL_free(out);
  free(v11);
  free(v16);
  free(v18);
  return 0;
}

  ;
}

void bssl::DTLS1_STATE::~DTLS1_STATE(bssl::SSLAEADContext **this)
{
  for (uint64_t i = 34LL; i != 13; i -= 3LL)
    bssl::Array<unsigned short>::~Array((uint64_t)&this[i]);
  for (uint64_t j = 15LL; j != 8; --j)
    std::unique_ptr<bssl::hm_fragment,bssl::internal::Deleter>::reset[abi:ne180100](&this[j], 0LL);
  std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100](this + 8, 0LL);
}

BOOL bssl::dtls1_new(unsigned __int8 **this, ssl_st *a2)
{
  uint64_t v3 = (bssl::SSLAEADContext **)bssl::New<bssl::DTLS1_STATE>();
  int v7 = v3;
  BOOL v5 = v3 != 0LL;
  if (v3)
  {
    int v7 = 0LL;
    this[7] = (unsigned __int8 *)v3;
    *((_WORD *)this + 8) = -259;
  }

  else
  {
    bssl::tls_free((bssl *)this, v4);
  }

  std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100](&v7, 0LL);
  return v5;
}

void sub_1875CBC28(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void bssl::dtls1_free(bssl::SSLAEADContext ***this, ssl_st *a2)
{
  if (this)
  {
    uint64_t v3 = this[7];
    if (v3)
    {
      bssl::DTLS1_STATE::~DTLS1_STATE(v3);
      OPENSSL_free(v4);
    }

    this[7] = 0LL;
  }

uint64_t bssl::dtls1_start_timer(bssl *this, ssl_st *a2)
{
  uint64_t v3 = *((void *)this + 7);
  if (!*(void *)(v3 + 312) && !*(_DWORD *)(v3 + 320)) {
    *(_DWORD *)(v3 + 328) = *((_DWORD *)this + 24);
  }
  uint64_t result = bssl::ssl_get_current_time((uint64_t)this, v3 + 312);
  uint64_t v5 = *((void *)this + 7);
  unsigned int v6 = *(_DWORD *)(v5 + 328);
  unint64_t v7 = *(void *)(v5 + 312) + v6 / 0x3E8uLL;
  *(void *)(v5 + 312) = v7;
  unsigned int v8 = *(_DWORD *)(v5 + 320) + 1000 * (v6 % 0x3E8);
  *(_DWORD *)(v5 + 320) = v8;
  if (v8 >= 0xF4240)
  {
    *(void *)(v5 + 312) = v7 + 1;
    *(_DWORD *)(v5 + 320) = v8 - 1000000;
  }

  return result;
}

uint64_t bssl::dtls1_is_timer_expired(bssl *this, ssl_st *a2)
{
  uint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DTLSv1_get_timeout((uint64_t)this, (unint64_t *)&v4);
  if ((_DWORD)result) {
    return v4 < 1 && (int)v5 < 1;
  }
  return result;
}

uint64_t DTLSv1_get_timeout(uint64_t a1, unint64_t *a2)
{
  uint64_t result = SSL_is_dtls((unsigned __int8 **)a1);
  if ((_DWORD)result)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (!*(void *)(v5 + 312) && !*(_DWORD *)(v5 + 320)) {
      return 0LL;
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
    bssl::ssl_get_current_time(a1, (uint64_t)&v14);
    uint64_t v6 = *(void *)(a1 + 56);
    unint64_t v7 = *(void *)(v6 + 312);
    BOOL v8 = v7 >= v14;
    unint64_t v9 = v7 - v14;
    if (!v8) {
      goto LABEL_5;
    }
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 320);
    }

    else
    {
      unsigned int v10 = *(_DWORD *)(v6 + 320);
      if (v10 <= v15)
      {
LABEL_5:
        *a2 = 0LL;
        a2[1] = 0LL;
        return 1LL;
      }
    }

    BOOL v11 = v10 < v15;
    unsigned int v12 = v10 - v15;
    unint64_t v13 = v9 - v11;
    if (v13 || v12 >> 3 >= 0x753)
    {
      if (v13 >> 31) {
        DTLSv1_get_timeout_cold_1();
      }
    }

    else
    {
      unsigned int v12 = 0;
    }

    *a2 = v13;
    *((_DWORD *)a2 + 2) = v12;
    return 1LL;
  }

  return result;
}

uint64_t bssl::dtls1_stop_timer(uint64_t this, ssl_st *a2)
{
  uint64_t v2 = *(void *)(this + 56);
  *(_DWORD *)(v2 + 324) = 0;
  *(void *)(v2 + 316) = 0LL;
  *(void *)(v2 + 308) = 0LL;
  *(_DWORD *)(*(void *)(this + 56) + 328LL) = *(_DWORD *)(this + 96);
  return this;
}

BOOL bssl::dtls1_check_timeout_num(bssl *this, ssl_st *a2)
{
  uint64_t v3 = *((void *)this + 7);
  unsigned int v4 = *(_DWORD *)(v3 + 308) + 1;
  *(_DWORD *)(v3 + 308) = v4;
  if (v4 >= 3 && (SSL_get_options((uint64_t)this) & 0x1000) == 0)
  {
    uint64_t v5 = (bssl *)BIO_ctrl(*((BIO **)this + 4), 47, 0LL, 0LL);
    if ((unint64_t)v5 <= 0x40000000)
    {
      int v6 = (int)v5;
    }
  }

  unsigned int v7 = *(_DWORD *)(*((void *)this + 7) + 308LL);
  if (v7 >= 0xD) {
    ERR_put_error(16, 0, 198, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/d1_lib.cc", 183);
  }
  return v7 < 0xD;
}

uint64_t DTLSv1_handle_timeout(bssl *a1, ssl_st *a2)
{
  if (!SSL_is_dtls((unsigned __int8 **)a1))
  {
    ERR_put_error(16, 0, 66, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/d1_lib.cc", 252);
    return 0xFFFFFFFFLL;
  }

  uint64_t result = bssl::dtls1_is_timer_expired(a1, v3);
  if (!(_DWORD)result) {
    return result;
  }
  if (!bssl::dtls1_check_timeout_num(a1, v5)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *((void *)a1 + 7);
  unsigned int v8 = 2 * *(_DWORD *)(v7 + 328);
  if (v8 >= 0xEA60) {
    unsigned int v8 = 60000;
  }
  *(_DWORD *)(v7 + 328) = v8;
  bssl::dtls1_start_timer(a1, v6);
  return bssl::dtls1_retransmit_outgoing_messages(a1, v9);
}

void *bssl::New<bssl::DTLS1_STATE>()
{
  uint64_t result = OPENSSL_malloc(0x150uLL);
  if (result)
  {
    uint64_t v1 = 0LL;
    *(_BYTE *)result &= 0xF8u;
    *(_DWORD *)((char *)result + 2) = 0;
    *(_OWORD *)(result + 1) = 0u;
    *(_OWORD *)(result + 3) = 0u;
    *(_OWORD *)((char *)result + 36) = 0u;
    *(_OWORD *)(result + 7) = 0u;
    *(_OWORD *)(result + 9) = 0u;
    *(_OWORD *)(result + 11) = 0u;
    *(_OWORD *)(result + 13) = 0u;
    result[15] = 0LL;
    do
    {
      uint64_t v2 = &result[v1 + 16];
      *uint64_t v2 = 0LL;
      v2[1] = 0LL;
      *(_DWORD *)((char *)v2 + 15) = 0;
      v1 += 3LL;
    }

    while (v1 != 21);
    *((_WORD *)result + 148) = 0;
    *((_DWORD *)result + 82) = 0;
    *(void *)((char *)result + 308) = 0LL;
    *(void *)((char *)result + 316) = 0LL;
    *(void *)((char *)result + 300) = 0LL;
  }

  return result;
}

void std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100]( bssl::SSLAEADContext ***a1, bssl::SSLAEADContext **a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    bssl::DTLS1_STATE::~DTLS1_STATE(v3);
    OPENSSL_free(v4);
  }

uint64_t bssl::ssl_decode_client_hello_inner( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v46 = v10;
  __int128 v47 = v10;
  __int128 v44 = v10;
  __int128 v45 = v10;
  __int128 v42 = v10;
  __int128 v43 = v10;
  __int128 v41 = v10;
  v40[0] = a4;
  v40[1] = a5;
  if ((bssl::ssl_parse_client_hello_with_trailing_data(a1, (uint64_t)v40, (uint64_t)&v41) & 1) != 0)
  {
    char v39 = -86;
    while (CBS_get_u8(v40, &v39))
    {
      if (v39)
      {
        ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 140);
        uint64_t v11 = 0LL;
        *a2 = 47;
        return v11;
      }
    }

    if (*((void *)&v47 + 1)) {
      BOOL v13 = *((void *)&v44 + 1) == 0LL;
    }
    else {
      BOOL v13 = 0;
    }
    if (!v13)
    {
      int v12 = 150;
      goto LABEL_12;
    }

    uint64_t v15 = a6[7];
    *(void *)&__int128 v44 = a6[6];
    *((void *)&v44 + 1) = v15;
    *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38[1] = v16;
    v38[2] = v16;
    v38[0] = v16;
    CBB_zero(v38);
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    _OWORD v37[2] = v17;
    v37[0] = v17;
    v37[1] = v17;
    v36[1] = v17;
    v36[2] = v17;
    v36[0] = v17;
    if (!(*(unsigned int (**)(uint64_t, _OWORD *, _OWORD *, uint64_t))(*(void *)a1 + 88LL))( a1,  v38,  v37,  1LL)
      || !CBB_add_u16((uint64_t)v37, WORD4(v42))
      || !CBB_add_bytes((uint64_t)v37, (const void *)v43, *((size_t *)&v43 + 1))
      || (*(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL,
          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL,
          v48[1] = v18,
          v48[2] = v18,
          v48[0] = v18,
          !CBB_add_u8_length_prefixed((uint64_t *)v37, (uint64_t)v48))
      || !CBB_add_bytes((uint64_t)v48, (const void *)v44, *((size_t *)&v44 + 1))
      || !CBB_add_u16_length_prefixed((uint64_t *)v37, (uint64_t)v48)
      || !CBB_add_bytes((uint64_t)v48, (const void *)v45, *((size_t *)&v45 + 1))
      || !CBB_add_u8_length_prefixed((uint64_t *)v37, (uint64_t)v48)
      || !CBB_add_bytes((uint64_t)v48, (const void *)v46, *((size_t *)&v46 + 1))
      || !CBB_flush((uint64_t *)v37)
      || !CBB_add_u16_length_prefixed((uint64_t *)v37, (uint64_t)v36))
    {
      ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 162);
      uint64_t v11 = 0LL;
LABEL_49:
      CBB_cleanup((uint64_t)v38);
      return v11;
    }

    __int128 v19 = v47;
    *(void *)&v48[0] = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v48[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
    if ((bssl::ssl_client_hello_get_extension((uint64_t)&v41, v48, 64768) & 1) != 0)
    {
      unint64_t v20 = *(void *)&v48[0] - v19 + *((void *)&v48[0] + 1);
      if (*((void *)&v19 + 1) < v20) {
        abort();
      }
      else {
        size_t v21 = *((void *)&v19 + 1);
      }
      if (!CBB_add_bytes((uint64_t)v36, (const void *)v19, v21))
      {
        ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 185);
        uint64_t v11 = 0LL;
        goto LABEL_49;
      }

      __int128 v34 = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
      if (!CBS_get_u8_length_prefixed((unsigned __int8 **)v48, (unint64_t *)&v34)
        || !v35
        || *((void *)&v48[0] + 1))
      {
        ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 193);
        goto LABEL_65;
      }

      uint64_t v22 = a6[13];
      unint64_t v32 = (unsigned __int8 *)a6[12];
      uint64_t v33 = v22;
      while (2)
      {
        __int16 v31 = -21846;
        if (CBS_get_u16(&v34, &v31))
        {
          if (v31 != -499)
          {
            unsigned __int16 v30 = -21846;
            unsigned int v28 = (const void *)0xAAAAAAAAAAAAAAAALL;
            size_t v29 = 0xAAAAAAAAAAAAAAAALL;
            do
            {
              if (!v33)
              {
                *a2 = 47;
                int v26 = 219;
                int v27 = 320;
                goto LABEL_64;
              }

              if (!CBS_get_u16((unsigned __int16 **)&v32, &v30)
                || !CBS_get_u16_length_prefixed(&v32, (unint64_t *)&v28))
              {
                int v26 = 224;
LABEL_60:
                int v27 = 137;
                goto LABEL_64;
              }
            }

            while (v30 != (unsigned __int16)v31);
            if (!CBB_add_u16((uint64_t)v36, v30)
              || !CBB_add_u16((uint64_t)v36, (unsigned __int16)v29)
              || !CBB_add_bytes((uint64_t)v36, v28, v29))
            {
              int v26 = 233;
              goto LABEL_60;
            }

            if (v35) {
              continue;
            }
            if (!CBB_add_bytes((uint64_t)v36, (const void *)v19, *((void *)&v19 + 1) - v20))
            {
              ERR_put_error( 16,  0,  68,  "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc",  240);
              goto LABEL_65;
            }

LABEL_64:
      ERR_put_error(16, 0, v27, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v26);
      goto LABEL_65;
    }

    if (!CBB_add_bytes((uint64_t)v36, (const void *)v19, *((size_t *)&v19 + 1)))
    {
      int v25 = 174;
      goto LABEL_62;
    }

    goto LABEL_51;
  }

  int v12 = 133;
LABEL_12:
  ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v12);
  return 0LL;
}

void sub_1875CC550( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t bssl::is_valid_client_hello_inner(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[5] = v5;
  v15[6] = v5;
  v15[3] = v5;
  v15[4] = v5;
  v15[1] = v5;
  v15[2] = v5;
  v15[0] = v5;
  *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (bssl::ssl_client_hello_init(a1, (uint64_t)v15, a3, a4)
    && bssl::ssl_client_hello_get_extension((uint64_t)v15, &v14, 65037)
    && *((void *)&v14 + 1) == 1LL
    && *(_BYTE *)v14 == 1
    && (bssl::ssl_client_hello_get_extension((uint64_t)v15, &v14, 43) & 1) != 0)
  {
    int v12 = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    if (CBS_get_u8_length_prefixed((unsigned __int8 **)&v14, (unint64_t *)&v12)
      && !*((void *)&v14 + 1)
      && v13)
    {
      while (1)
      {
        unsigned __int16 v11 = -21846;
        if (v11 - 768 < 4 || v11 == 65279 || v11 == 65277)
        {
          *a2 = 47;
          int v9 = 314;
          int v10 = 118;
          goto LABEL_20;
        }

        if (!v13) {
          return 1LL;
        }
      }

      *a2 = 50;
      int v9 = 137;
      int v10 = 111;
    }

    else
    {
      *a2 = 50;
      int v9 = 137;
      int v10 = 104;
    }
  }

  else
  {
    *a2 = 47;
    int v9 = 314;
    int v10 = 94;
  }

uint64_t bssl::ssl_client_hello_decrypt( uint64_t *a1, _BYTE *a2, _BYTE *a3, uint64_t *a4, void *a5, char *a6, unint64_t a7)
{
  *a3 = 0;
  __dst = 0LL;
  unint64_t v29 = 0LL;
  __int128 v14 = (const void *)a5[1];
  unint64_t v15 = a5[2];
  char v16 = bssl::Array<unsigned char>::Init((uint64_t)&__dst, v15);
  char v17 = v16 ^ 1;
  if (!v15) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    memmove(__dst, v14, v15);
  }
  if ((v16 & 1) == 0)
  {
    uint64_t v21 = 0LL;
    *a2 = 80;
    goto LABEL_24;
  }

  unint64_t v18 = a5[12];
  if (v18 > (unint64_t)a6)
  {
    __int128 v23 = "reinterpret_cast<uintptr_t>(client_hello_outer->extensions) <= reinterpret_cast<uintptr_t>(payload.data())";
    int v24 = 280;
    goto LABEL_27;
  }

  if (v18 + a5[13] < (unint64_t)&a6[a7])
  {
    __int128 v23 = "reinterpret_cast<uintptr_t>(client_hello_outer->extensions + client_hello_outer->extensions_len) >= reinterpre"
          "t_cast<uintptr_t>(payload.data() + payload.size())";
    int v24 = 283;
LABEL_27:
    __assert_rtn("ssl_client_hello_decrypt", "encrypted_client_hello.cc", v24, v23);
  }

  __int128 v19 = &a6[-a5[1]];
  else {
    size_t v20 = v29 - (void)v19;
  }
  if (v20) {
    bzero(&v19[(void)__dst], v20);
  }
  int v26 = 0LL;
  size_t v27 = 0LL;
  if ((bssl::Array<unsigned char>::Init((uint64_t)&v26, a7) & 1) != 0)
  {
    size_t v25 = 0xAAAAAAAAAAAAAAAALL;
    if (EVP_HPKE_CTX_open((uint64_t)(a1 + 92), (char *)v26, &v25, v27, a6, a7))
    {
      if (v27 < v25) {
        abort();
      }
      size_t v27 = v25;
      if (bssl::ssl_decode_client_hello_inner(*a1, a2, (uint64_t)a4, (uint64_t)v26, v25, a5))
      {
        bssl::ssl_do_msg_callback(*a1, 0LL, 257LL, *a4, a4[1]);
        uint64_t v21 = 1LL;
      }

      else
      {
        uint64_t v21 = 0LL;
      }
    }

    else
    {
      *a2 = 51;
      *a3 = 1;
      ERR_put_error(16, 0, 138, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 316);
      uint64_t v21 = 0LL;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
    *a2 = 80;
  }

  OPENSSL_free(v26);
LABEL_24:
  OPENSSL_free(__dst);
  return v21;
}

void sub_1875CC950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  bssl::Array<unsigned short>::~Array((uint64_t)va);
  bssl::Array<unsigned short>::~Array((uint64_t)va1);
  _Unwind_Resume(a1);
}

BOOL bssl::ssl_is_valid_ech_public_name(unsigned __int8 *a1, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    unint64_t v4 = 0LL;
    __int128 v5 = 0LL;
    while (2)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = a1;
      unint64_t v8 = v2;
      int v9 = &a1[v2];
      while (a1[v6] != 46)
      {
        if (v2 == ++v6) {
          goto LABEL_8;
        }
      }

      int v9 = &a1[v6];
LABEL_8:
      unint64_t v10 = v9 - a1;
      if (v10 == v2)
      {
        a1 = 0LL;
        unint64_t v2 = 0LL;
        __int128 v5 = v7;
        unint64_t v4 = v8;
      }

      else
      {
        unint64_t v11 = v10 + 1;
        if (v2 < v10 + 1) {
          abort();
        }
        if (v2 < v10) {
          unint64_t v10 = v2;
        }
        v2 -= v11;
        if (v8 == v11) {
          return 0LL;
        }
        a1 += v11;
        unint64_t v8 = v10;
      }

      if (v8 - 64 >= 0xFFFFFFFFFFFFFFC1LL && *v7 != 45 && v7[v8 - 1] != 45)
      {
        do
        {
          int v12 = *v7;
          BOOL v13 = OPENSSL_isalnum(v12);
          if (v12 != 45 && !v13) {
            return 0LL;
          }
          ++v7;
          --v8;
        }

        while (v8);
        if (v2) {
          continue;
        }
        if (v4 >= 2)
        {
          if (*v5 != 48 || (v5[1] | 0x20) != 0x78)
          {
LABEL_31:
            unint64_t v17 = v4 - 1;
            do
            {
              int v18 = *v5++;
              BOOL result = (v18 - 58) < 0xFFFFFFF6;
            }

            while ((v18 - 58) >= 0xFFFFFFF6 && v17-- != 0);
            return result;
          }

          unint64_t v16 = v4 - 2;
          if (v4 == 2) {
            return 0LL;
          }
          for (uint64_t i = v5 + 2; OPENSSL_isxdigit(*i); ++i)
          {
            BOOL result = 0LL;
            if (!--v16) {
              return result;
            }
          }
        }

        if (!v4) {
          return 1LL;
        }
        goto LABEL_31;
      }

      break;
    }
  }

  return 0LL;
}

uint64_t bssl::parse_ech_config(uint64_t a1, uint64_t a2, _BYTE *a3, char a4)
{
  __int16 v29 = -21846;
  unint64_t v8 = *(unsigned __int16 **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  size_t v27 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  if (CBS_get_u16((unsigned __int16 **)a1, &v29)
    && CBS_get_u16_length_prefixed((unsigned __int8 **)a1, (unint64_t *)&v27))
  {
    if (v29 != -499) {
      goto LABEL_36;
    }
    uint64_t v10 = *(void *)(a1 + 8);
    int v11 = bssl::Array<unsigned char>::Init(a2, v9 - v10);
    int v12 = v11;
    if (v9 != v10 && v11) {
      memmove(*(void **)a2, v8, v9 - v10);
    }
    if (!v12) {
      return 0LL;
    }
    BOOL v13 = *(unsigned __int8 **)(a2 + 8);
    v26[0] = *(unsigned __int8 **)a2;
    v26[1] = v13;
    memset(v25, 170, sizeof(v25));
    memset(v24, 170, sizeof(v24));
    if (CBS_skip(v26, 2uLL)
      && CBS_get_u16_length_prefixed(v26, (unint64_t *)&v27)
      && CBS_get_u8(&v27, (_BYTE *)(a2 + 67))
      && CBS_get_u16((unsigned __int16 **)&v27, (_WORD *)(a2 + 64))
      && CBS_get_u16_length_prefixed(&v27, v25)
      && v25[1]
      && CBS_get_u16_length_prefixed(&v27, (unint64_t *)&v24[2])
      && v24[3]
      && ((uint64_t)v24[3] & 3) == 0
      && CBS_get_u8(&v27, (_BYTE *)(a2 + 66))
      && CBS_get_u8_length_prefixed(&v27, &v25[2])
      && v25[3]
      && CBS_get_u16_length_prefixed(&v27, (unint64_t *)v24)
      && !v28)
    {
      if (bssl::ssl_is_valid_ech_public_name((unsigned __int8 *)v25[2], v25[3]))
      {
        unint64_t v14 = v25[1];
        *(void *)(a2 + 16) = v25[0];
        *(void *)(a2 + 24) = v14;
        unint64_t v15 = v25[3];
        *(void *)(a2 + 32) = v25[2];
        *(void *)(a2 + 40) = v15;
        unint64_t v16 = v24[3];
        *(unsigned __int16 **)(a2 + 48) = v24[2];
        *(void *)(a2 + 56) = v16;
        if (v24[1])
        {
          char v17 = 0;
          while (1)
          {
            __int16 v23 = -21846;
            v22[0] = 0xAAAAAAAAAAAAAAAALL;
            v22[1] = 0xAAAAAAAAAAAAAAAALL;
            if (!CBS_get_u16(v24, &v23)
              || !CBS_get_u16_length_prefixed((unsigned __int8 **)v24, v22))
            {
              break;
            }

            if (v23 < 0) {
              char v18 = 1;
            }
            else {
              char v18 = a4;
            }
            v17 |= v18;
            if (!v24[1])
            {
              char v19 = v17 ^ 1;
              goto LABEL_41;
            }
          }

          int v20 = 468;
          goto LABEL_33;
        }

        char v19 = 1;
LABEL_41:
        *a3 = v19 & 1;
        return 1LL;
      }

LABEL_33:
  ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v20);
  return 0LL;
}

BOOL bssl::ECHServerConfig::SetupContext(uint64_t a1, void *a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 56);
  __int16 v29 = *(unsigned __int16 **)(a1 + 48);
  uint64_t v30 = v6;
  if (v6)
  {
    while (1)
    {
      LOWORD(v27[0]) = -21846;
      unsigned __int16 v28 = -21846;
      if (LOWORD(v27[0]) == a3 && v28 == a4) {
        break;
      }
      if (!v30) {
        return 0LL;
      }
    }

    *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27[1] = v16;
    v27[2] = v16;
    v27[0] = v16;
    CBB_zero(v27);
    if (CBB_init((uint64_t)v27, *(void *)(a1 + 8) + 8LL)
      && CBB_add_bytes((uint64_t)v27, "tls ech", 8uLL)
      && CBB_add_bytes((uint64_t)v27, *(const void **)a1, *(void *)(a1 + 8)))
    {
      if (a3 == 1)
      {
        uint64_t v17 = 0LL;
        char v18 = "get_ech_aead(aead_id) != NULL";
        while (1)
        {
          char v19 = (unsigned __int16 *)bssl::kSupportedAEADs[v17]();
          if (++v17 == 3) {
            goto LABEL_18;
          }
        }

        if (v19)
        {
          uint64_t v21 = EVP_hpke_hkdf_sha256();
          uint64_t v22 = 0LL;
          __int16 v23 = (uint64_t *)(a1 + 72);
          while (1)
          {
            int v24 = (unsigned __int16 *)bssl::kSupportedAEADs[v22]();
            if (++v22 == 3)
            {
              int v24 = 0LL;
              break;
            }
          }

          size_t v25 = CBB_data((uint64_t)v27);
          size_t v26 = CBB_len((uint64_t)v27);
          BOOL v14 = EVP_HPKE_CTX_setup_recipient(a2, v23, (uint64_t)v21, (uint64_t)v24, a5, a6, v25, v26) != 0;
          goto LABEL_26;
        }

        char v18 = "get_ech_aead(aead_id) != NULL";
LABEL_18:
        int v20 = 578;
      }

      else
      {
        char v18 = "kdf_id == EVP_HPKE_HKDF_SHA256";
        int v20 = 577;
      }

      __assert_rtn("SetupContext", "encrypted_client_hello.cc", v20, v18);
    }

    BOOL v14 = 0LL;
LABEL_26:
    CBB_cleanup((uint64_t)v27);
    return v14;
  }

  return 0LL;
}

void sub_1875CCFA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t bssl::ssl_is_valid_ech_config_list(unsigned __int8 *a1, uint64_t a2)
{
  BOOL v14 = a1;
  uint64_t v15 = a2;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  if (!v13 || v15 != 0) {
    return 0LL;
  }
  do
  {
    *(_OWORD *)uint64_t v7 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    unint64_t v11 = 0xAAAAAAAA00000000LL;
    uint64_t v3 = bssl::parse_ech_config((uint64_t)&v12, (uint64_t)v7, &v6, 0);
    OPENSSL_free((void *)v7[0]);
    if (v13) {
      char v4 = v3;
    }
    else {
      char v4 = 0;
    }
  }

  while ((v4 & 1) != 0);
  return v3;
}

void sub_1875CD068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t SSL_set1_ech_config_list(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  if (!*(void *)(a1 + 8)) {
    return 0LL;
  }
  if ((bssl::ssl_is_valid_ech_config_list(a2, a3) & 1) == 0)
  {
    ERR_put_error(16, 0, 318, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 916);
    return 0LL;
  }

  char v6 = (void **)(*(void *)(a1 + 8) + 280LL);
  uint64_t v7 = bssl::Array<unsigned char>::Init((uint64_t)v6, a3);
  uint64_t v8 = v7;
  if (a3 && (_DWORD)v7) {
    memmove(*v6, a2, a3);
  }
  return v8;
}

void SSL_ECH_KEYS_free(unsigned int *a1)
{
  if (a1) {
    bssl::RefCounted<ssl_ech_keys_st>::DecRefInternal(a1);
  }
}

void bssl::RefCounted<ssl_ech_keys_st>::DecRefInternal(unsigned int *a1)
{
  if (CRYPTO_refcount_dec_and_test_zero(a1))
  {
    bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::~Array((uint64_t)(a1 + 4));
    OPENSSL_free(a1);
  }

BOOL SSL_ech_accepted(uint64_t a1)
{
  else {
    return *(void *)(*(void *)(*(void *)(a1 + 48) + 280LL) + 1544LL) != 0LL;
  }
}

void *bssl::New<bssl::ECHConfig,bssl::ECHConfig>(uint64_t a1)
{
  unint64_t v2 = OPENSSL_malloc(0x48uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    *unint64_t v2 = 0LL;
    v2[1] = 0LL;
    OPENSSL_free(0LL);
    void *v3 = 0LL;
    v3[1] = 0LL;
    uint64_t v4 = *(void *)(a1 + 8);
    void *v3 = *(void *)a1;
    v3[1] = v4;
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    __int128 v5 = *(_OWORD *)(a1 + 16);
    __int128 v6 = *(_OWORD *)(a1 + 32);
    __int128 v7 = *(_OWORD *)(a1 + 48);
    *((_DWORD *)v3 + 16) = *(_DWORD *)(a1 + 64);
    *((_OWORD *)v3 + 2) = v6;
    *((_OWORD *)v3 + 3) = v7;
    *((_OWORD *)v3 + 1) = v5;
  }

  return v3;
}

void std::unique_ptr<bssl::ECHConfig,bssl::internal::Deleter>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)bssl::Array<unsigned short>::~Array(v3);
    OPENSSL_free(v4);
  }

uint64_t bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::~Array(uint64_t a1)
{
  return a1;
}

void bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::Reset( uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 8))
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    do
    {
      std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>::reset[abi:ne180100]( (uint64_t *)(*(void *)a1 + v6),  0LL);
      ++v7;
      v6 += 8LL;
    }

    while (v7 < *(void *)(a1 + 8));
  }

  OPENSSL_free(*(void **)a1);
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
}

void std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>::reset[abi:ne180100]( uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    bssl::Delete<bssl::ECHServerConfig>(v3);
  }
}

void bssl::Delete<bssl::ECHServerConfig>(uint64_t a1)
{
  if (a1)
  {
    EVP_HPKE_KEY_cleanup(a1 + 72);
    unint64_t v2 = (void *)bssl::Array<unsigned short>::~Array(a1);
    OPENSSL_free(v2);
  }

pthread_rwlock_t **bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_write),&(CRYPTO_MUTEX_unlock_write)>::MutexLockBase( pthread_rwlock_t **a1, pthread_rwlock_t *a2)
{
  *a1 = a2;
  if (!a2) {
    bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_read),&(CRYPTO_MUTEX_unlock_read)>::MutexLockBase();
  }
  CRYPTO_MUTEX_lock_write(a2);
  return a1;
}

DSA *DSA_new(void)
{
  uint64_t v0 = OPENSSL_zalloc(0x110uLL);
  uint64_t v1 = (DSA *)v0;
  if (v0)
  {
    *((_DWORD *)v0 + 64) = 1;
    CRYPTO_MUTEX_init((pthread_rwlock_t *)(v0 + 5));
    CRYPTO_new_ex_data((_DWORD)v1 + 264, v2, v3);
  }

  return v1;
}

void DSA_free(DSA *r)
{
  if (r)
  {
    if (CRYPTO_refcount_dec_and_test_zero((unsigned int *)&r[1].meth))
    {
      CRYPTO_free_ex_data((int)&g_ex_data_class_1, r, (CRYPTO_EX_DATA *)&r[1].engine);
      BN_clear_free(*(BIGNUM **)&r->pad);
      BN_clear_free((BIGNUM *)r->version);
      BN_clear_free(*(BIGNUM **)&r->write_params);
      BN_clear_free(r->p);
      BN_clear_free(r->q);
      BN_MONT_CTX_free((BN_MONT_CTX *)r[1].ex_data.sk);
      BN_MONT_CTX_free(*(BN_MONT_CTX **)&r[1].ex_data.dummy);
      CRYPTO_MUTEX_cleanup((pthread_rwlock_t *)&r->g);
      OPENSSL_free(r);
    }
  }

uint64_t DSA_get0_pub_key(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

int DSA_size(const DSA *a1)
{
  versiounsigned int n = (const BIGNUM *)a1->version;
  if (version)
  {
    unsigned int v2 = BN_num_bytes(version);
    unint64_t v3 = v2;
    if (v2 >= 0x7F)
    {
      unint64_t v5 = v2 + 1LL;
      uint64_t v4 = 1LL;
      do
      {
        ++v4;
        BOOL v6 = v5 >= 0xFF;
        BOOL v7 = v5 == 255;
        v5 >>= 8;
      }

      while (!v7 && v6);
    }

    else
    {
      uint64_t v4 = 1LL;
    }

    LODWORD(version) = 0;
    unint64_t v8 = v3 + v4 + 2;
    if (v8 >= v3 && (v8 & 0x8000000000000000LL) == 0)
    {
      unint64_t v9 = 2 * v8;
      if (v8 >= 0x40)
      {
        uint64_t v10 = 1LL;
        unint64_t v11 = v9;
        do
        {
          ++v10;
          BOOL v6 = v11 >= 0xFF;
          BOOL v7 = v11 == 255;
          v11 >>= 8;
        }

        while (!v7 && v6);
      }

      else
      {
        uint64_t v10 = 1LL;
      }

      unint64_t v12 = (v9 | 1) + v10;
      if (v12 >= v9) {
        LODWORD(version) = v12;
      }
      else {
        LODWORD(version) = 0;
      }
    }
  }

  return (int)version;
}

void *DTLS_with_buffers_method()
{
  return &DTLS_with_buffers_method::kMethod;
}

void dtls1_on_handshake_complete(ssl_st *a1, ssl_st *a2)
{
  if ((**(_BYTE **)&a1->server & 4) != 0) {
    bssl::dtls_clear_outgoing_messages((bssl *)a1, v3);
  }
}

BOOL dtls1_set_read_state(bssl *a1, const ssl_st *a2, bssl::SSLAEADContext **a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    dtls1_set_read_state();
  }
  int v6 = (int)a2;
  BOOL has_unprocessed_handshake_data = bssl::dtls_has_unprocessed_handshake_data(a1, a2);
  if (has_unprocessed_handshake_data)
  {
    ERR_put_error(16, 0, 255, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/dtls_method.cc", 86);
    bssl::ssl_send_alert(a1, (ssl_st *)2, 10);
  }

  else
  {
    uint64_t v9 = *((void *)a1 + 7);
    ++*(_WORD *)(v9 + 2);
    *(_OWORD *)(v9 + 8) = 0u;
    *(_OWORD *)(v9 + 24) = 0u;
    *(void *)(v9 + 40) = 0LL;
    uint64_t v10 = *((void *)a1 + 6);
    *(void *)uint64_t v10 = 0LL;
    unint64_t v11 = *a3;
    *a3 = 0LL;
    std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100]( (bssl::SSLAEADContext **)(v10 + 264),  v11);
    unint64_t v12 = (_BYTE *)*((void *)a1 + 7);
    *(_DWORD *)(*((void *)a1 + 6) + 20std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100]((bssl::SSLAEADContext ***)va, 0LL) = v6;
    *v12 &= ~1u;
  }

  return !has_unprocessed_handshake_data;
}

uint64_t dtls1_set_write_state(uint64_t a1, int a2, bssl::SSLAEADContext **a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    dtls1_set_write_state();
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  ++*(_WORD *)(v8 + 4);
  *(void *)(v8 + 56) = *(void *)(v9 + 8);
  *(void *)(v9 + 8) = 0LL;
  uint64_t v10 = *(bssl::SSLAEADContext **)(v9 + 272);
  *(void *)(v9 + 272) = 0LL;
  std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100]( (bssl::SSLAEADContext **)(v8 + 64),  v10);
  unint64_t v11 = (bssl::SSLAEADContext **)(*(void *)(a1 + 48) + 272LL);
  unint64_t v12 = *a3;
  *a3 = 0LL;
  std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100](v11, v12);
  *(_DWORD *)(*(void *)(a1 + 48) + 204LL) = a2;
  return 1LL;
}

uint64_t dsa_check_key(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (!v2 || !a1[1] || !a1[2])
  {
    int v3 = 101;
    int v4 = 75;
    goto LABEL_10;
  }

  if (BN_is_negative(v2)
    || BN_is_negative(a1[1])
    || BN_is_zero(*a1)
    || BN_is_zero(a1[1])
    || !BN_is_odd(*a1)
    || !BN_is_odd(a1[1])
    || (BN_cmp((const BIGNUM *)a1[1], (const BIGNUM *)*a1) & 0x80000000) == 0
    || BN_is_negative(a1[2])
    || BN_is_zero(a1[2])
    || (BN_cmp((const BIGNUM *)a1[2], (const BIGNUM *)*a1) & 0x80000000) == 0)
  {
    int v3 = 107;
    int v4 = 92;
LABEL_10:
    ERR_put_error(10, 0, v3, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", v4);
    return 0LL;
  }

  int v6 = BN_num_bits((const BIGNUM *)a1[1]);
  if (v6 != 160 && v6 != 224 && v6 != 256)
  {
    int v3 = 100;
    int v4 = 99;
    goto LABEL_10;
  }

  if (BN_num_bits((const BIGNUM *)*a1) >= 0x2711)
  {
    int v3 = 102;
    int v4 = 106;
    goto LABEL_10;
  }

  uint64_t v7 = a1[3];
  if (v7
    && (BN_is_negative(v7) || BN_is_zero(a1[3])
                           || (BN_cmp((const BIGNUM *)a1[3], (const BIGNUM *)*a1) & 0x80000000) == 0))
  {
    int v3 = 107;
    int v4 = 114;
    goto LABEL_10;
  }

  uint64_t v8 = a1[4];
  if (v8 && (BN_is_negative(v8) || BN_is_zero(a1[4]) || BN_cmp((const BIGNUM *)a1[4], (const BIGNUM *)a1[1]) >= 0))
  {
    int v3 = 107;
    int v4 = 125;
    goto LABEL_10;
  }

  return 1LL;
}

BIGNUM *parse_integer_0(__int128 *a1, BIGNUM **a2)
{
  if (*a2) {
    parse_integer_cold_1_0();
  }
  BOOL result = BN_new();
  *a2 = result;
  if (result) {
    return (BIGNUM *)BN_parse_asn1_unsigned(a1, result);
  }
  return result;
}

uint64_t marshal_integer_0(uint64_t *a1, const BIGNUM *a2)
{
  if (a2) {
    return BN_marshal_asn1(a1, a2);
  }
  ERR_put_error(10, 0, 67, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", 145);
  return 0LL;
}

DSA *DSA_parse_parameters(__int128 *a1)
{
  uint64_t v2 = DSA_new();
  if (v2)
  {
    *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    if (!CBS_get_asn1(a1, &v4, 536870928)
      || !parse_integer_0(&v4, (BIGNUM **)v2)
      || !parse_integer_0(&v4, (BIGNUM **)&v2->version)
      || !parse_integer_0(&v4, (BIGNUM **)&v2->write_params)
      || *((void *)&v4 + 1))
    {
      ERR_put_error(10, 0, 105, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", 230);
LABEL_10:
      DSA_free(v2);
      return 0LL;
    }
  }

  return v2;
}

uint64_t DSA_marshal_parameters(uint64_t *a1, const BIGNUM **a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = v4;
  v6[2] = v4;
  v6[0] = v4;
  if (CBB_add_asn1(a1, (uint64_t)v6, 0x20000010u)
    && marshal_integer_0((uint64_t *)v6, *a2)
    && marshal_integer_0((uint64_t *)v6, a2[1])
    && marshal_integer_0((uint64_t *)v6, a2[2])
    && CBB_flush(a1))
  {
    return 1LL;
  }

  ERR_put_error(10, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", 250);
  return 0LL;
}

DSA *DSA_parse_private_key(__int128 *a1)
{
  uint64_t v2 = DSA_new();
  if (v2)
  {
    memset(v6, 170, sizeof(v6));
    if (CBS_get_asn1(a1, &v6[1], 536870928) && CBS_get_asn1_uint64((__int128 *)&v6[1], v6))
    {
      if (v6[0])
      {
        int v3 = 104;
        int v4 = 271;
      }

      else
      {
        if (parse_integer_0((__int128 *)&v6[1], (BIGNUM **)v2)
          && parse_integer_0((__int128 *)&v6[1], (BIGNUM **)&v2->version)
          && parse_integer_0((__int128 *)&v6[1], (BIGNUM **)&v2->write_params)
          && parse_integer_0((__int128 *)&v6[1], &v2->p)
          && parse_integer_0((__int128 *)&v6[1], &v2->q)
          && !v6[2])
        {
          goto LABEL_8;
        }

        int v3 = 105;
        int v4 = 281;
      }
    }

    else
    {
      int v3 = 105;
      int v4 = 266;
    }

    ERR_put_error(10, 0, v3, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", v4);
LABEL_8:
    DSA_free(v2);
    return 0LL;
  }

  return v2;
}

xpc_object_t boringssl_metrics_create_connection_failure_event(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v3)
  {
    boringssl_metrics_log_configuration_data(a1, v3);
    boringssl_metrics_log_connection_data(a1, v3);
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_ALERT_TYPE, *(int *)(v2 + 312));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_ALERT_LEVEL, *(unsigned __int8 *)(v2 + 316));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_ALERT_CODE, *(unsigned __int8 *)(v2 + 317));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_HANDSHAKE_STATE, *(int *)(v2 + 304));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_HANDSHAKE_TYPE, *(unsigned __int8 *)(v2 + 308));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_INTERNAL_ERROR, *(int *)(v2 + 296));
    int v4 = (const char *)TLS_METRIC_FAILURE_STACK_ERROR;
    int stack_error = boringssl_session_get_stack_error(a1);
    xpc_dictionary_set_uint64(v3, v4, stack_error);
    id v6 = v3;
  }

  else if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
  {
    boringssl_metrics_create_connection_failure_event_cold_1();
  }

  return v3;
}

void __boringssl_metrics_log_connection_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.network.boringssl.metrics_queue", 0LL);
  uint64_t v1 = (void *)boringssl_context_metrics_queue;
  boringssl_context_metrics_queue = (uint64_t)v0;
}

BOOL boringssl_metrics_log_connection_failure(uint64_t a1)
{
  if (!a1 || *(_DWORD *)a1 != -1252936367 || !*(void *)(a1 + 8)) {
    return 0LL;
  }
  if (metricsQueueToken != -1)
  {
    uint64_t v5 = a1;
    dispatch_once(&metricsQueueToken, &__block_literal_global_77);
    a1 = v5;
  }

  if (!boringssl_context_metrics_queue) {
    return 0LL;
  }
  xpc_object_t connection_failure_event = boringssl_metrics_create_connection_failure_event(a1);
  if (!connection_failure_event) {
    return 0LL;
  }
  uint64_t v2 = connection_failure_event;
  BOOL v3 = boringssl_metrics_log_event( (uint64_t)"TLSFailureEvent",  connection_failure_event,  (void *)boringssl_context_metrics_queue);

  return v3;
}

void __boringssl_metrics_log_connection_failure_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.network.boringssl.metrics_queue", 0LL);
  uint64_t v1 = (void *)boringssl_context_metrics_queue;
  boringssl_context_metrics_queue = (uint64_t)v0;
}

void __boringssl_metrics_log_ech_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.network.boringssl.metrics_queue", 0LL);
  uint64_t v1 = (void *)boringssl_context_metrics_queue;
  boringssl_context_metrics_queue = (uint64_t)v0;
}

uint64_t ec_bignum_to_scalar(uint64_t a1, void *__dst, uint64_t a3)
{
  if (bn_copy_words(__dst, *(int *)(a1 + 264), a3)
    && bn_less_than_words((uint64_t *)__dst, *(uint64_t **)(a1 + 256), *(int *)(a1 + 264)))
  {
    return 1LL;
  }

  ERR_put_error(15, 0, 133, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/scalar.c", 32);
  return 0LL;
}

BOOL ec_scalar_equal_vartime(uint64_t a1, void *__s1, void *__s2)
{
  uint64_t v3 = *(int *)(a1 + 264);
  return !(_DWORD)v3 || memcmp(__s1, __s2, 8 * v3) == 0;
}

BOOL ec_scalar_is_zero(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 264);
  uint64_t v3 = 0LL;
  do
  {
    uint64_t v4 = *a2++;
    v3 |= v4;
    --v2;
  }

  while (v2);
  return v3 == 0;
}

uint64_t ec_random_nonzero_scalar(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return bn_rand_range_words(a2, 1uLL, *(unint64_t **)(a1 + 256), *(int *)(a1 + 264), a3);
}

void ec_simple_scalar_inv0_montgomery(uint64_t a1, unint64_t *a2, uint64_t a3)
{
}

uint64_t ec_simple_scalar_to_montgomery_inv_vartime(unsigned int *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1[66];
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 8 * v3;
  do
  {
    v7 |= *(void *)(a3 + v6);
    v6 += 8LL;
  }

  while (v8 != v6);
  if (!v7) {
    return 0LL;
  }
  (*(void (**)(unsigned int *, unint64_t *))(*(void *)a1 + 136LL))(a1, a2);
  bn_from_montgomery_small(a2, (int)a1[66], (uint64_t)a2, (int)a1[66], (uint64_t)(a1 + 58));
  return 1LL;
}

uint64_t ec_felem_one(uint64_t a1)
{
  return a1 + 160;
}

uint64_t ec_bignum_to_felem(uint64_t a1, uint64_t a2, const BIGNUM *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (const BIGNUM *)(a1 + 320);
  unsigned int v7 = BN_num_bytes((const BIGNUM *)(a1 + 320));
  if (v7 >= 0x43) {
    ec_bignum_to_felem_cold_1();
  }
  unsigned int v8 = v7;
  __int16 v12 = -21846;
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[2] = v9;
  v11[3] = v9;
  v11[0] = v9;
  v11[1] = v9;
  if (!BN_is_negative((uint64_t)a3)
    && BN_cmp(a3, v6) < 0
    && BN_bn2bin_padded((char *)v11, v8, (uint64_t)a3))
  {
    return (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, void))(*(void *)a1 + 112LL))(a1, a2, v11, v8);
  }

  ERR_put_error(15, 0, 101, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/felem.c", 37);
  return 0LL;
}

uint64_t ec_felem_from_bytes(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112LL))(a1);
}

BOOL ec_felem_to_bignum(uint64_t a1, BIGNUM *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int16 v11 = -21846;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v9 = v4;
  __int128 v10 = v4;
  *(_OWORD *)unsigned int s = v4;
  __int128 v8 = v4;
  *(void *)leunsigned int n = 0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(uint64_t, unsigned __int8 *, int *, uint64_t))(*(void *)a1 + 104LL))(a1, s, len, a3);
  return BN_bin2bn(s, len[0], a2) != 0LL;
}

uint64_t ec_felem_to_bytes(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
}

unint64_t ec_felem_neg(uint64_t a1, unint64_t *rp, const unint64_t *a3)
{
  uint64_t v3 = rp;
  int v5 = *(_DWORD *)(a1 + 328);
  if (v5 < 1)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    unsigned int v7 = a3;
    uint64_t v8 = *(unsigned int *)(a1 + 328);
    do
    {
      uint64_t v9 = *v7++;
      v6 |= v9;
      --v8;
    }

    while (v8);
    if (v6) {
      uint64_t v10 = -1LL;
    }
    else {
      uint64_t v10 = 0LL;
    }
  }

  unint64_t result = bn_sub_words(rp, *(const unint64_t **)(a1 + 320), a3, v5);
  if (result) {
    ec_felem_neg_cold_1();
  }
  uint64_t v12 = *(unsigned int *)(a1 + 328);
  if ((int)v12 >= 1)
  {
    do
    {
      *v3++ &= v10;
      --v12;
    }

    while (v12);
  }

  return result;
}

uint64_t ec_felem_non_zero_mask(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 328);
  uint64_t v3 = 0LL;
  do
  {
    uint64_t v4 = *a2++;
    v3 |= v4;
    --v2;
  }

  while (v2);
  if (v3) {
    return -1LL;
  }
  else {
    return 0LL;
  }
}

uint64_t ec_felem_add( uint64_t a1, unint64_t *a2, const unint64_t *a3, const unint64_t *a4)
{
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[2] = v4;
  unint64_t v6[3] = v4;
  v6[0] = v4;
  v6[1] = v4;
  return bn_mod_add_words( a2,  a3,  a4,  *(const unint64_t **)(a1 + 320),  (unint64_t *)v6,  *(int *)(a1 + 328));
}

uint64_t *ec_felem_sub( uint64_t a1, unint64_t *a2, const unint64_t *a3, const unint64_t *a4)
{
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[2] = v4;
  unint64_t v6[3] = v4;
  v6[0] = v4;
  v6[1] = v4;
  return bn_mod_sub_words( a2,  a3,  a4,  *(const unint64_t **)(a1 + 320),  (unint64_t *)v6,  *(int *)(a1 + 328));
}

uint64_t *ec_felem_select(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  return bn_select_words(a2, a3, a4, a5, *(int *)(a1 + 328));
}

BOOL ec_felem_equal(uint64_t a1, char *a2, char *a3)
{
  return CRYPTO_memcmp(a2, a3, 8LL * *(int *)(a1 + 328)) == 0;
}

uint64_t x25519_pub_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a2 + 8)) {
    return x25519_set_pub_raw(a1, *(_OWORD **)a3, *(void *)(a3 + 8));
  }
  ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 133);
  return 0LL;
}

uint64_t x25519_pub_encode(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(const void **)(a2 + 8);
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = v4;
  _OWORD v9[2] = v4;
  v9[0] = v4;
  v8[1] = v4;
  v8[2] = v4;
  v7[2] = v4;
  v8[0] = v4;
  v7[0] = v4;
  v7[1] = v4;
  v6[1] = v4;
  v6[2] = v4;
  v6[0] = v4;
  if (CBB_add_asn1(a1, (uint64_t)v9, 0x20000010u)
    && CBB_add_asn1((uint64_t *)v9, (uint64_t)v8, 0x20000010u)
    && CBB_add_asn1((uint64_t *)v8, (uint64_t)v7, 6u)
    && CBB_add_bytes((uint64_t)v7, &unk_18A071E14, 3uLL)
    && CBB_add_asn1((uint64_t *)v9, (uint64_t)v6, 3u)
    && CBB_add_u8((uint64_t)v6, 0)
    && CBB_add_bytes((uint64_t)v6, v3, 0x20uLL)
    && CBB_flush(a1))
  {
    return 1LL;
  }

  ERR_put_error(6, 0, 105, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 153);
  return 0LL;
}

BOOL x25519_pub_cmp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a2 + 8);
  uint64_t v4 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  uint64_t v9 = v2[2];
  uint64_t v8 = v2[3];
  uint64_t v11 = v3[2];
  uint64_t v10 = v3[3];
  return v4 == v6 && v5 == v7 && v9 == v11 && v8 == v10;
}

uint64_t x25519_priv_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (_OWORD *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 175);
  return 0LL;
}

uint64_t x25519_priv_encode(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (*(_BYTE *)(v2 + 64))
  {
    *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v12[1] = v4;
    v12[2] = v4;
    v11[2] = v4;
    v12[0] = v4;
    v11[0] = v4;
    v11[1] = v4;
    v10[1] = v4;
    v10[2] = v4;
    _OWORD v9[2] = v4;
    v10[0] = v4;
    v9[0] = v4;
    v9[1] = v4;
    v8[1] = v4;
    v8[2] = v4;
    v8[0] = v4;
    if (CBB_add_asn1(a1, (uint64_t)v12, 0x20000010u)
      && CBB_add_asn1_uint64((uint64_t)v12, 0LL)
      && CBB_add_asn1((uint64_t *)v12, (uint64_t)v11, 0x20000010u)
      && CBB_add_asn1((uint64_t *)v11, (uint64_t)v10, 6u)
      && CBB_add_bytes((uint64_t)v10, &unk_18A071E14, 3uLL)
      && CBB_add_asn1((uint64_t *)v12, (uint64_t)v9, 4u)
      && CBB_add_asn1((uint64_t *)v9, (uint64_t)v8, 4u)
      && CBB_add_bytes((uint64_t)v8, (const void *)(v2 + 32), 0x20uLL)
      && CBB_flush(a1))
    {
      return 1LL;
    }

    int v6 = 105;
    int v7 = 202;
  }

  else
  {
    int v6 = 130;
    int v7 = 185;
  }

  ERR_put_error(6, 0, v6, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", v7);
  return 0LL;
}

uint64_t x25519_set_priv_raw(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  if (a3 != 32)
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 33);
    return 0LL;
  }

  uint64_t v5 = OPENSSL_malloc(0x41uLL);
  if (!v5) {
    return 0LL;
  }
  int v6 = v5;
  __int128 v7 = a2[1];
  *((_OWORD *)v5 + 2) = *a2;
  *((_OWORD *)v5 + 3) = v7;
  X25519_public_from_private(v5, (uint64_t)(v5 + 4));
  uint64_t v8 = 1LL;
  *((_BYTE *)v6 + 64) = 1;
  OPENSSL_free(*(void **)(a1 + 8));
  *(void *)(a1 + 8) = v6;
  return v8;
}

uint64_t x25519_set_pub_raw(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  if (a3 == 32)
  {
    uint64_t result = (uint64_t)OPENSSL_malloc(0x41uLL);
    if (result)
    {
      uint64_t v6 = result;
      __int128 v7 = a2[1];
      *(_OWORD *)uint64_t result = *a2;
      *(_OWORD *)(result + 16) = v7;
      *(_BYTE *)(result + 64) = 0;
      OPENSSL_free(*(void **)(a1 + 8));
      *(void *)(a1 + 8) = v6;
      return 1LL;
    }
  }

  else
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 53);
    return 0LL;
  }

  return result;
}

uint64_t x25519_get_priv_raw(uint64_t a1, _OWORD *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (!*(_BYTE *)(v3 + 64))
  {
    int v4 = 130;
    int v5 = 74;
    goto LABEL_6;
  }

  if (a2)
  {
    if (*a3 <= 0x1FuLL)
    {
      int v4 = 100;
      int v5 = 84;
LABEL_6:
      ERR_put_error(6, 0, v4, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", v5);
      return 0LL;
    }

    __int128 v7 = *(_OWORD *)(v3 + 48);
    *a2 = *(_OWORD *)(v3 + 32);
    a2[1] = v7;
  }

  *a3 = 32LL;
  return 1LL;
}

uint64_t x25519_get_pub_raw(uint64_t a1, _OWORD *a2, void *a3)
{
  if (a2)
  {
    if (*a3 <= 0x1FuLL)
    {
      ERR_put_error(6, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 102);
      return 0LL;
    }

    int v4 = *(_OWORD **)(a1 + 8);
    __int128 v5 = v4[1];
    *a2 = *v4;
    a2[1] = v5;
  }

  *a3 = 32LL;
  return 1LL;
}

uint64_t x25519_get1_tls_encodedpoint(uint64_t a1, void *a2)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2)
  {
    int v4 = OPENSSL_memdup(v2, 0x20uLL);
    *a2 = v4;
    return 32LL * (v4 != 0LL);
  }

  else
  {
    ERR_put_error(6, 0, 120, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 120);
    return 0LL;
  }

uint64_t x25519_size()
{
  return 32LL;
}

uint64_t x25519_bits()
{
  return 253LL;
}

void x25519_free(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
}

void *OPENSSL_sk_new(uint64_t a1)
{
  uint64_t v2 = OPENSSL_zalloc(0x28uLL);
  if (v2)
  {
    uint64_t v3 = OPENSSL_calloc(4uLL, 8uLL);
    v2[1] = v3;
    if (v3)
    {
      v2[3] = 4LL;
      v2[4] = a1;
    }

    else
    {
      OPENSSL_free(v2);
      return 0LL;
    }
  }

  return v2;
}

void *OPENSSL_sk_new_null()
{
  return OPENSSL_sk_new(0LL);
}

unint64_t *OPENSSL_sk_value(unint64_t *result, unint64_t a2)
{
  if (result)
  {
    if (*result <= a2) {
      return 0LL;
    }
    else {
      return *(unint64_t **)(result[1] + 8 * a2);
    }
  }

  return result;
}

uint64_t OPENSSL_sk_set(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  if (!a1 || *a1 <= a2) {
    return 0LL;
  }
  *(void *)(a1[1] + 8 * a2) = a3;
  return a3;
}

void OPENSSL_sk_pop_free_ex(unint64_t *a1, void (*a2)(uint64_t), uint64_t a3)
{
  if (a1)
  {
    unint64_t v4 = *a1;
    if (*a1)
    {
      unint64_t v7 = 0LL;
      do
      {
        if (*(void *)(a1[1] + 8 * v7))
        {
          a2(a3);
          unint64_t v4 = *a1;
        }

        ++v7;
      }

      while (v7 < v4);
    }

    OPENSSL_free((void *)a1[1]);
    OPENSSL_free(a1);
  }

void sk_pop_free(STACK *st, void (__cdecl *func)(void *))
{
  if (st)
  {
    unint64_t v3 = *(void *)&st->num;
    if (*(void *)&st->num)
    {
      unint64_t v5 = 0LL;
      do
      {
        if (st->data[v5])
        {
          ((void (*)(void))func)();
          unint64_t v3 = *(void *)&st->num;
        }

        ++v5;
      }

      while (v5 < v3);
    }

    OPENSSL_free(st->data);
    OPENSSL_free(st);
  }

unint64_t *OPENSSL_sk_insert(unint64_t *result, uint64_t a2, unint64_t a3)
{
  if (!result) {
    return result;
  }
  unint64_t v3 = result;
  unint64_t v4 = *result;
  if (*result >= 0x7FFFFFFF)
  {
    ERR_put_error(14, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/stack/stack.c", 179);
    return 0LL;
  }

  uint64_t v7 = result[3];
  if (v7 > v4 + 1) {
    goto LABEL_19;
  }
  if (v7 < 0) {
    unint64_t v8 = v7 + 1;
  }
  else {
    unint64_t v8 = 2 * v7;
  }
  if (v7 >= 0) {
    unint64_t v9 = 16 * v7;
  }
  else {
    unint64_t v9 = 8 * (v7 + 1);
  }
  if (v8 < v7 || v9 >> 3 != v8) {
    return 0LL;
  }
  uint64_t result = OPENSSL_realloc((void *)result[1], v9);
  if (result)
  {
    v3[1] = (unint64_t)result;
    v3[3] = v8;
    unint64_t v4 = *v3;
LABEL_19:
    if (v4 <= a3)
    {
      uint64_t v13 = (void *)(v3[1] + 8 * v4);
    }

    else
    {
      size_t v11 = 8 * (v4 - a3);
      unint64_t v12 = v3[1];
      if (v11)
      {
        memmove((void *)(v12 + 8 * a3 + 8), (const void *)(v12 + 8 * a3), v11);
        unint64_t v4 = *v3;
        unint64_t v12 = v3[1];
      }

      uint64_t v13 = (void *)(v12 + 8 * a3);
    }

    *uint64_t v13 = a2;
    uint64_t result = (unint64_t *)(v4 + 1);
    unint64_t *v3 = v4 + 1;
    *((_DWORD *)v3 + 4) = 0;
  }

  return result;
}

uint64_t OPENSSL_sk_delete(uint64_t *a1, unint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = *a1;
  if (*a1 <= a2) {
    return 0LL;
  }
  unint64_t v4 = (uint64_t *)(a1[1] + 8 * a2);
  uint64_t v5 = *v4;
  uint64_t v6 = v3 - 1;
  size_t v7 = 8 * (v3 + ~a2);
  if (v3 - 1 != a2 && v7 != 0)
  {
    memmove(v4, v4 + 1, v7);
    uint64_t v6 = *a1 - 1;
  }

  *a1 = v6;
  return v5;
}

uint64_t OPENSSL_sk_find( uint64_t result, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, void))
{
  if (!result) {
    return result;
  }
  uint64_t v6 = (void *)result;
  if (!*(void *)(result + 32))
  {
    unint64_t v10 = *(void *)result;
    if (*(void *)result)
    {
      size_t v11 = *(void **)(result + 8);
      if (*v11 == a3)
      {
        unint64_t v9 = 0LL;
        goto LABEL_34;
      }

      unint64_t v9 = 0LL;
      unint64_t v12 = v11 + 1;
      while (v10 - 1 != v9)
      {
        uint64_t v13 = v12[v9++];
        if (v13 == a3)
        {
          uint64_t result = v9 < v10;
          goto LABEL_35;
        }
      }
    }

    return 0LL;
  }

  if (!a3) {
    return 0LL;
  }
  unint64_t v8 = *(void *)result;
  if (*(_DWORD *)(result + 16) || v8 < 2)
  {
    if (v8)
    {
      unint64_t v14 = 0LL;
      do
      {
        unint64_t v15 = v8 - v14 - 1;
        unint64_t v9 = v14 + (v15 >> 1);
        if (__CFADD__(v14, v15 >> 1) || v9 >= v8) {
          OPENSSL_sk_find_cold_1();
        }
        int v16 = a4(v6[4], a3, *(void *)(v6[1] + 8 * v9));
        if (v16 < 1)
        {
          if (v16 < 0)
          {
            unint64_t v8 = v9;
          }

          else
          {
            if (v8 - v14 == 1) {
              goto LABEL_34;
            }
            BOOL v17 = v9 + 1 >= v8;
            unint64_t v8 = v9 + 1;
            if (v17) {
              OPENSSL_sk_find_cold_3();
            }
          }
        }

        else
        {
          unint64_t v14 = v9 + 1;
        }
      }

      while (v14 < v8);
      if (v14 != v8) {
        OPENSSL_sk_find_cold_2();
      }
    }

    return 0LL;
  }

  unint64_t v9 = 0LL;
  while (a4(v6[4], a3, *(void *)(v6[1] + 8 * v9)))
  {
    if (++v9 >= *v6) {
      return 0LL;
    }
  }

unint64_t *OPENSSL_sk_push(unint64_t *a1, uint64_t a2)
{
  return OPENSSL_sk_insert(a1, a2, *a1);
}

uint64_t OPENSSL_sk_pop(uint64_t *a1)
{
  if (a1 && *a1) {
    return OPENSSL_sk_delete(a1, *a1 - 1);
  }
  else {
    return 0LL;
  }
}

void *OPENSSL_sk_dup(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = OPENSSL_zalloc(0x28uLL);
  if (v2)
  {
    uint64_t v3 = OPENSSL_memdup(*(const void **)(a1 + 8), 8LL * *(void *)(a1 + 24));
    v2[1] = v3;
    if (v3)
    {
      *uint64_t v2 = *(void *)a1;
      *((_DWORD *)v2 + 4) = *(_DWORD *)(a1 + 16);
      uint64_t v4 = *(void *)(a1 + 32);
      v2[3] = *(void *)(a1 + 24);
      v2[4] = v4;
      return v2;
    }

    OPENSSL_free(0LL);
    OPENSSL_free(v2);
    return 0LL;
  }

  return v2;
}

unint64_t *OPENSSL_sk_deep_copy( uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  unint64_t v9 = OPENSSL_sk_dup(a1);
  unint64_t v10 = v9;
  if (!v9) {
    return v10;
  }
  unint64_t v11 = *v9;
  if (!*v9) {
    return v10;
  }
  uint64_t v12 = 0LL;
  uint64_t v13 = (void *)v9[1];
  while (!v13[v12])
  {
LABEL_7:
    if (++v12 >= v11) {
      return v10;
    }
  }

  *(void *)(v10[1] + 8 * v12) = a2(a3);
  uint64_t v13 = (void *)v10[1];
  if (v13[v12])
  {
    unint64_t v11 = *v10;
    goto LABEL_7;
  }

  if (v12)
  {
    for (uint64_t i = 0LL; i != v12; ++i)
    {
      if (*(void *)(v10[1] + 8 * i)) {
        a4(a5);
      }
    }

    uint64_t v13 = (void *)v10[1];
  }

  OPENSSL_free(v13);
  OPENSSL_free(v10);
  return 0LL;
}

uint64_t OPENSSL_lh_retrieve( void *a1, uint64_t a2, uint64_t (*a3)(void, uint64_t), unsigned int (*a4)(void, void, uint64_t))
{
  next_ptr_and_hash = get_next_ptr_and_hash(a1, 0LL, a2, a3, a4);
  if (*next_ptr_and_hash) {
    return *(void *)*next_ptr_and_hash;
  }
  else {
    return 0LL;
  }
}

void *get_next_ptr_and_hash( void *a1, unsigned int *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t), unsigned int (*a5)(void, void, uint64_t))
{
  unsigned int v9 = a4(a1[5], a3);
  if (a2) {
    *a2 = v9;
  }
  unint64_t v10 = (void *)(a1[1] + 8 * ((unint64_t)v9 % a1[2]));
  unint64_t v11 = (void *)*v10;
  if (*v10 && a5(a1[4], *v11, a3))
  {
    do
    {
      uint64_t v12 = v11;
      unint64_t v11 = (void *)v11[1];
    }

    while (v11 && a5(a1[4], *v11, a3));
    return v12 + 1;
  }

  return v10;
}

uint64_t OPENSSL_lh_retrieve_key( uint64_t a1, uint64_t a2, unsigned int a3, unsigned int (*a4)(uint64_t, void))
{
  unint64_t v4 = *(void *)(a1 + 8) + 8 * ((unint64_t)a3 % *(void *)(a1 + 16));
  uint64_t v5 = *(void **)v4;
  if (*(void *)v4)
  {
    if (a4(a2, *v5))
    {
      while (1)
      {
        unint64_t v8 = v5;
        uint64_t v5 = (void *)v5[1];
        if (!v5) {
          break;
        }
        if (!a4(a2, *v5))
        {
          unint64_t v4 = (unint64_t)(v8 + 1);
          goto LABEL_6;
        }
      }
    }

    else
    {
LABEL_6:
      if (*(void *)v4) {
        return **(void **)v4;
      }
    }
  }

  return 0LL;
}

uint64_t OPENSSL_lh_insert( void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t), unsigned int (*a5)(void, void, uint64_t))
{
  unsigned int v11 = -1431655766;
  *a2 = 0LL;
  next_ptr_and_hash = get_next_ptr_and_hash(a1, &v11, a3, a4, a5);
  unsigned int v9 = next_ptr_and_hash;
  if (*next_ptr_and_hash)
  {
    *a2 = *(void *)*next_ptr_and_hash;
    *(void *)uint64_t *next_ptr_and_hash = a3;
  }

  else
  {
    uint64_t result = (uint64_t)OPENSSL_malloc(0x18uLL);
    if (!result) {
      return result;
    }
    *(_DWORD *)(result + 16) = v11;
    *(void *)uint64_t result = a3;
    *(void *)(result + 8) = 0LL;
    uint64_t *v9 = result;
    ++*a1;
    lh_maybe_resize((uint64_t)a1);
  }

  return 1LL;
}

uint64_t OPENSSL_lh_delete( void *a1, uint64_t a2, uint64_t (*a3)(void, uint64_t), unsigned int (*a4)(void, void, uint64_t))
{
  next_ptr_and_hash = (uint64_t **)get_next_ptr_and_hash(a1, 0LL, a2, a3, a4);
  uint64_t v6 = *next_ptr_and_hash;
  if (!*next_ptr_and_hash) {
    return 0LL;
  }
  uint64_t *next_ptr_and_hash = (uint64_t *)v6[1];
  uint64_t v7 = *v6;
  OPENSSL_free(v6);
  --*a1;
  lh_maybe_resize((uint64_t)a1);
  return v7;
}

void lh_rebucket(uint64_t a1, unint64_t a2)
{
  if (!(a2 >> 61))
  {
    unint64_t v4 = OPENSSL_zalloc(8 * a2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 8) + 8 * i);
          if (v8)
          {
            do
            {
              unint64_t v9 = *(unsigned int *)(v8 + 16) % a2;
              uint64_t v10 = *(void *)(v8 + 8);
              *(void *)(v8 + 8) = v4[v9];
              v4[v9] = v8;
              uint64_t v8 = v10;
            }

            while (v10);
          }
        }
      }

      OPENSSL_free(*(void **)(a1 + 8));
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = a2;
    }
  }

unint64_t ERR_get_error(void)
{
  return get_error_values(1, 0, 0LL, 0LL, 0LL, 0LL);
}

uint64_t get_error_values(int a1, int a2, void *a3, _DWORD *a4, void *a5, _DWORD *a6)
{
  state = err_get_state();
  if (!state) {
    return 0LL;
  }
  uint64_t v13 = state;
  int v14 = *((_DWORD *)state + 97);
  unsigned int v15 = *((_DWORD *)state + 96);
  if (v14 == v15) {
    return 0LL;
  }
  if (a2)
  {
    if (a1) {
      get_error_values_cold_2();
    }
  }

  else
  {
    unsigned int v15 = (v14 + 1) & 0xF;
  }

  unsigned int v17 = v15;
  char v18 = &state[3 * v15];
  uint64_t v16 = *((unsigned int *)v18 + 4);
  if (a3 && a4)
  {
    uint64_t v19 = *v18;
    if (*v18)
    {
      *a3 = v19;
      LODWORD(v19) = WORD2(state[3 * v15 + 2]);
    }

    else
    {
      *a3 = "NA";
    }

    *a4 = v19;
  }

  if (!a5) {
    goto LABEL_24;
  }
  int v20 = &state[3 * v15];
  uint64_t v23 = v20[1];
  uint64_t v22 = v20 + 1;
  uint64_t v21 = v23;
  if (!v23)
  {
    *a5 = &unk_1875F4C23;
    if (a6) {
      *a6 = 0;
    }
LABEL_24:
    if (!a1) {
      return v16;
    }
    goto LABEL_25;
  }

  *a5 = v21;
  if (a6) {
    *a6 = 3;
  }
  if (a1)
  {
    if (*v22)
    {
      free((void *)state[49]);
      unsigned int v17 = v15;
      v13[49] = *v22;
    }

    *uint64_t v22 = 0LL;
LABEL_25:
    if (a2) {
      get_error_values_cold_1();
    }
    free((void *)v13[3 * v17 + 1]);
    uint64_t *v18 = 0LL;
    v18[1] = 0LL;
    v18[2] = 0LL;
    *((_DWORD *)v13 + 97) = v15;
  }

  return v16;
}

unint64_t ERR_peek_last_error(void)
{
  unint64_t result = (unint64_t)err_get_state();
  if (result)
  {
    unsigned int v1 = *(_DWORD *)(result + 384);
    if (*(_DWORD *)(result + 388) == v1) {
      return 0LL;
    }
    else {
      return *(unsigned int *)(result + 24LL * v1 + 16);
    }
  }

  return result;
}

const char *__cdecl ERR_reason_error_string(unint64_t e)
{
  unint64_t result = err_reason_error_string(e, 0);
  if (!result) {
    return "unknown error";
  }
  return result;
}

char *err_reason_error_string(unsigned int a1, int a2)
{
  unsigned int v2 = HIBYTE(a1);
  unsigned int v3 = a1 & 0xFFF;
  if (HIBYTE(a1) == 2)
  {
    unint64_t result = 0LL;
    if (!a2 && v3 <= 0x7E) {
      return strerror(v3);
    }
  }

  else if (v3 > 0x21)
  {
    if (v3 > 0x63)
    {
      unint64_t result = 0LL;
      if (!(a1 >> 30) && v3 <= 0x7FF)
      {
        int __key = (v3 << 15) | (v2 << 26);
        unint64_t result = (char *)bsearch( &__key,  &kOpenSSLReasonValues,  0x2F4uLL,  4uLL,  (int (__cdecl *)(const void *, const void *))err_string_cmp);
        if (result) {
          return &kOpenSSLReasonStringData[*(_DWORD *)result & 0x7FFF];
        }
      }
    }

    else
    {
      switch(a1 & 0xFFF)
      {
        case 'A':
          uint64_t v6 = "MALLOC_FAILURE";
          uint64_t v7 = "malloc failure";
          goto LABEL_21;
        case 'B':
          uint64_t v6 = "SHOULD_NOT_HAVE_BEEN_CALLED";
          uint64_t v7 = "function should not have been called";
          goto LABEL_21;
        case 'C':
          uint64_t v6 = "PASSED_NULL_PARAMETER";
          uint64_t v7 = "passed a null parameter";
          goto LABEL_21;
        case 'D':
          uint64_t v6 = "INTERNAL_ERROR";
          uint64_t v7 = "internal error";
          goto LABEL_21;
        case 'E':
          uint64_t v6 = "OVERFLOW";
          uint64_t v7 = "overflow";
LABEL_21:
          if (a2) {
            unint64_t result = (char *)v6;
          }
          else {
            unint64_t result = (char *)v7;
          }
          break;
        default:
          unint64_t result = 0LL;
          break;
      }
    }
  }

  else
  {
    uint64_t v5 = &(&kLibraryNames)[3 * (a1 & 0xFFF)];
    if (a2) {
      v5 += 2;
    }
    return *v5;
  }

  return result;
}

void ERR_error_string_n(unint64_t e, char *buf, size_t len)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!len) {
    return;
  }
  int v5 = e;
  unsigned int v6 = BYTE3(e);
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = err_reason_error_string(e, 0);
  unint64_t v9 = v8;
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v10;
  __int128 v20 = v10;
  *(_OWORD *)unsigned int v17 = v10;
  __int128 v18 = v10;
  if (!v7)
  {
    uint64_t v7 = __str;
    snprintf(__str, 0x20uLL, "lib(%u)", v6);
    if (v9) {
      goto LABEL_8;
    }
LABEL_17:
    unint64_t v9 = v17;
    snprintf(v17, 0x20uLL, "reason(%u)", v5 & 0xFFF);
    goto LABEL_8;
  }

  if (!v8) {
    goto LABEL_17;
  }
LABEL_8:
  unsigned int v11 = snprintf(buf, len, "error:%08x:%s:OPENSSL_internal:%s", v5, v7, v9);
  if (len >= 5 && (v11 & 0x80000000) == 0 && v11 >= len)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &buf[len - 5];
    int v14 = buf;
    while (1)
    {
      unsigned int v15 = strchr(v14, 58);
      uint64_t v16 = &v13[v12];
      if (!v15 || v15 > v16) {
        break;
      }
      int v14 = v15 + 1;
      if (++v12 == 4) {
        return;
      }
    }

    memset(v16, 58, 4 - v12);
  }

void ERR_print_errors_cb(int (__cdecl *cb)(const char *, size_t, void *), void *u)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  buf[5] = v4;
  buf[6] = v4;
  buf[3] = v4;
  buf[4] = v4;
  buf[1] = v4;
  buf[2] = v4;
  buf[0] = v4;
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, sizeof(v9));
  state = err_get_state();
  do
  {
    error_valueunsigned int s = get_error_values(1, 0, &v9[2], (_DWORD *)v9 + 1, &v9[1], v9);
    if (!(_DWORD)error_values) {
      break;
    }
    ERR_error_string_n(error_values, (char *)buf, 0x78uLL);
    uint64_t v7 = (v9[0] & 1) != 0 ? (const char *)v9[1] : (const char *)&unk_1875F4C23;
    snprintf(__b, 0x400uLL, "%lu:%s:%s:%d:%s\n", state, (const char *)buf, (const char *)v9[2], HIDWORD(v9[0]), v7);
    size_t v8 = strlen(__b);
  }

  while (((int (*)(char *, size_t, void *))cb)(__b, v8, u) > 0);
}

void ERR_print_errors_fp(FILE *fp)
{
}

BOOL print_errors_to_file(const char *a1, uint64_t a2, FILE *a3)
{
  if (a1[a2]) {
    print_errors_to_file_cold_1();
  }
  return fputs(a1, a3) >= 0;
}

void ERR_put_error(int lib, int func, int reason, const char *file, int line)
{
  __int16 v5 = line;
  state = err_get_state();
  if (state)
  {
    __int128 v10 = state;
    if (lib == 2 && !reason) {
      reasounsigned int n = *__error();
    }
    int v11 = *((_DWORD *)v10 + 96);
    int v12 = ((_BYTE)v11 + 1) & 0xF;
    *((_DWORD *)v10 + 96) = v12;
    if (v12 == *((_DWORD *)v10 + 97)) {
      *((_DWORD *)v10 + 97) = ((_BYTE)v11 + 2) & 0xF;
    }
    uint64_t v13 = (const char **)&v10[3 * ((v11 + 1) & 0xF)];
    free((void *)v13[1]);
    v13[1] = 0LL;
    v13[2] = 0LL;
    *uint64_t v13 = file;
    *((_WORD *)v13 + 10) = v5;
    *((_DWORD *)v13 + 4) = reason & 0xFFF | (lib << 24);
  }

void ERR_add_error_data(int num, ...)
{
  uint64_t v2 = num;
  size_t v3 = 0LL;
  if (!num) {
    goto LABEL_8;
  }
  uint64_t v4 = num;
  do
  {
    __int16 v5 = va_arg(v10, const char *);
    if (v5)
    {
      size_t v6 = strlen(v5);
      if (__CFADD__(v3, v6)) {
        return;
      }
      v3 += v6;
    }

    --v4;
  }

  while (v4);
  if (v3 != -1LL)
  {
LABEL_8:
    uint64_t v7 = malloc(v3 + 1);
    if (v7)
    {
      size_t v8 = v7;
      _BYTE *v7 = 0;
      if (num)
      {
        do
        {
          unint64_t v9 = (char **)v11;
          v11 += 8;
          if (*v9)
          {
            if (OPENSSL_strlcat(v8, *v9, v3 + 1) > v3) {
              ERR_add_error_data_cold_1();
            }
          }

          --v2;
        }

        while (v2);
      }

      err_set_error_data(v8);
    }
  }

void ERR_add_error_dataf( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9 = 0LL;
}

void err_set_error_data(void *a1)
{
  state = err_get_state();
  if (state && (unsigned int v3 = *((_DWORD *)state + 96), v3 != *((_DWORD *)state + 97)))
  {
    uint64_t v4 = &state[3 * v3];
    free((void *)v4[1]);
    v4[1] = a1;
  }

  else
  {
    free(a1);
  }

void *strdup_libc_malloc(const char *a1)
{
  size_t v2 = strlen(a1) + 1;
  unsigned int v3 = malloc(v2);
  uint64_t v4 = v3;
  if (v3) {
    memcpy(v3, a1, v2);
  }
  return v4;
}

void ERR_SAVE_STATE_free(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8))
    {
      uint64_t v2 = 0LL;
      unint64_t v3 = 0LL;
      do
      {
        uint64_t v4 = *(void *)a1 + v2;
        free(*(void **)(v4 + 8));
        *(void *)uint64_t v4 = 0LL;
        *(void *)(v4 + 8) = 0LL;
        *(void *)(v4 + 16) = 0LL;
        ++v3;
        v2 += 24LL;
      }

      while (v3 < *(void *)(a1 + 8));
    }

    free(*(void **)a1);
    free((void *)a1);
  }

void *ERR_save_state()
{
  state = err_get_state();
  if (!state) {
    return 0LL;
  }
  unsigned int v1 = state;
  unsigned int v2 = *((_DWORD *)state + 96);
  unsigned int v3 = *((_DWORD *)state + 97);
  if (v2 == v3) {
    return 0LL;
  }
  uint64_t v4 = malloc(0x10uLL);
  if (!v4) {
    return v4;
  }
  if (v2 >= v3) {
    unsigned int v6 = v2;
  }
  else {
    unsigned int v6 = v2 + 16;
  }
  unint64_t v7 = v6 - v3;
  size_t v8 = malloc(24 * v7);
  void *v4 = v8;
  if (!v8)
  {
    free(v4);
    return 0LL;
  }

  if (v6 == v3)
  {
    v4[1] = v7;
  }

  else
  {
    uint64_t v9 = (uint64_t)v8;
    bzero(v8, 24 * v7);
    uint64_t v10 = 0LL;
    v4[1] = v7;
    if (v7 <= 1) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v6 - v3;
    }
    do
    {
      uint64_t v12 = v10 + 1;
      err_copy(v9, (uint64_t)&v1[3 * ((v10 + *((_DWORD *)v1 + 97) + 1) & 0xF)]);
      v9 += 24LL;
      uint64_t v10 = v12;
    }

    while (v11 != v12);
  }

  return v4;
}

const char *err_copy(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  unint64_t result = *(const char **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  if (result)
  {
    unint64_t result = (const char *)strdup_libc_malloc(result);
    *(void *)(a1 + 8) = result;
  }

  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  return result;
}

void ERR_restore_state(void *a1)
{
  if (a1 && (unint64_t v2 = a1[1]) != 0)
  {
    if (v2 >= 0x10) {
      abort();
    }
    state = err_get_state();
    if (state)
    {
      uint64_t v4 = state;
      if (a1[1])
      {
        uint64_t v5 = 0LL;
        unint64_t v6 = 0LL;
        do
        {
          err_copy((uint64_t)&v4[v5], *a1 + v5 * 8);
          ++v6;
          unint64_t v7 = a1[1];
          v5 += 3LL;
        }

        while (v6 < v7);
        int v8 = v7 - 1;
      }

      else
      {
        int v8 = -1;
      }

      *((_DWORD *)v4 + 96) = v8;
      *((_DWORD *)v4 + 97) = 15;
    }
  }

  else
  {
    ERR_clear_error();
  }

uint64_t err_string_cmp(_DWORD *a1, _DWORD *a2)
{
  unsigned int v2 = *a1 >> 15;
  BOOL v3 = v2 >= *a2 >> 15;
  BOOL v4 = v2 > *a2 >> 15;
  if (v3) {
    return v4;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

boringssl_concrete_boringssl_context_state *boringssl_context_state_create(unsigned int *a1)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v2 = objc_alloc_init(&OBJC_CLASS___boringssl_concrete_boringssl_context_state);
  BOOL v3 = v2;
  if (v2)
  {
    v2->cached_content_type = 2;
    v2->ssl_EVP_MD_CTX ctx = (ssl_ctx_st *)a1;
    SSL_CTX_up_ref(a1);
    BOOL v4 = v3;
  }

  else
  {
    uint64_t v5 = (os_log_s *)g_boringssl_log;
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      boringssl_context_state_create_cold_1(v5);
    }
  }

  return v3;
}

uint64_t boringssl_context_state_get_ssl_ctx(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

BOOL boringssl_context_state_is_context_state(BOOL result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 8) == 2;
  }
  return result;
}

void BN_BLINDING_free(BN_BLINDING *b)
{
  if (b)
  {
    BN_free(*(BIGNUM **)b);
    BN_free(*((BIGNUM **)b + 1));
    OPENSSL_free(b);
  }

int BIO_printf(BIO *bio, const char *format, ...)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v25 = v4;
  __int128 v26 = v4;
  __int128 v23 = v4;
  __int128 v24 = v4;
  __int128 v21 = v4;
  __int128 v22 = v4;
  __int128 v19 = v4;
  __int128 v20 = v4;
  __int128 v17 = v4;
  __int128 v18 = v4;
  __int128 v15 = v4;
  __int128 v16 = v4;
  __int128 v13 = v4;
  __int128 v14 = v4;
  *(_OWORD *)__str = v4;
  __int128 v12 = v4;
  unsigned int v5 = vsnprintf(__str, 0x100uLL, format, va);
  if ((v5 & 0x80000000) != 0) {
    return -1;
  }
  int v6 = v5;
  if (v5 <= 0xFF) {
    return BIO_write(bio, __str, v5);
  }
  int v8 = (char *)OPENSSL_malloc(v5 + 1);
  if (!v8) {
    return -1;
  }
  uint64_t v9 = v8;
  int v7 = BIO_write(bio, v9, v6);
  OPENSSL_free(v9);
  return v7;
}

uint64_t CBS_asn1_ber_to_der(uint64_t a1, void *a2, void *a3)
{
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = v6;
  v11[2] = v6;
  v11[0] = v6;
  int v10 = -1431655766;
  uint64_t result = cbs_find_ber((__int128 *)a1, &v10, 0);
  if ((_DWORD)result)
  {
    if (v10)
    {
      unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
      if (!CBB_init((uint64_t)v11, *(void *)(a1 + 8))
        || !cbs_convert_ber((__int128 *)a1, (uint64_t *)v11, 0LL, 0, 0)
        || !CBB_finish((uint64_t)v11, a3, &v9))
      {
        CBB_cleanup((uint64_t)v11);
        return 0LL;
      }

      unint64_t v8 = v9;
      *a2 = *a3;
      a2[1] = v8;
    }

    else
    {
      uint64_t result = CBS_get_any_asn1_element((__int128 *)a1, a2, 0LL, 0LL);
      if (!(_DWORD)result) {
        return result;
      }
      *a3 = 0LL;
    }

    return 1LL;
  }

  return result;
}

uint64_t cbs_find_ber(__int128 *a1, int *a2, unsigned int a3)
{
  if (a3 <= 0x80)
  {
    __int128 v11 = *a1;
    *a2 = 0;
    uint64_t v3 = 1LL;
    if (!*((void *)&v11 + 1)) {
      return v3;
    }
    uint64_t v5 = a3 + 1;
    while (1)
    {
      memset(v10, 170, sizeof(v10));
      unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
      int v8 = -1431655766;
      if (*a2) {
        return 1LL;
      }
      if ((v10[0] & 0x20000000) != 0)
      {
        if ((v10[0] & 0xDFFFFFFF) <= 0x1E && ((1 << SLOBYTE(v10[0])) & 0x5E7C1010) != 0)
        {
          uint64_t v3 = 1LL;
          *a2 = 1;
          return v3;
        }

        if (*a2) {
          return 1LL;
        }
      }

      if (!*((void *)&v11 + 1)) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t cbs_convert_ber(__int128 *a1, uint64_t *a2, uint64_t a3, int a4, unsigned int a5)
{
  if ((a3 & 0x20000000) != 0) {
    cbs_convert_ber_cold_1();
  }
  if (a5 > 0x80) {
    return 0LL;
  }
  uint64_t v10 = a5 + 1;
  while (1)
  {
    uint64_t v11 = *((void *)a1 + 1);
    if (!v11) {
      return a4 == 0;
    }
    memset(v24, 170, sizeof(v24));
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    int v22 = -1431655766;
    *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21[1] = v12;
    v21[2] = v12;
    v21[0] = v12;
    unsigned int v13 = v24[0];
    if ((_DWORD)a3)
    {
      uint64_t v14 = a3;
      __int128 v15 = a2;
      if ((v24[0] & 0xDFFFFFFF) != (_DWORD)a3) {
        return 0LL;
      }
    }

    else
    {
      if ((v24[0] & 0x20000000) != 0
        && (signed int v16 = (v24[0] & 0xDFFFFFFF) - 4, v16 <= 0x1A)
        && ((0x5E7C101u >> (LOBYTE(v24[0]) - 4)) & 1) != 0)
      {
        uint64_t v14 = dword_18760A5D4[v16];
        unsigned int v13 = dword_18760A5D4[v16];
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      __int128 v15 = (uint64_t *)v21;
    }

    if (v22)
    {
      __int128 v17 = a1;
      __int128 v18 = v15;
      uint64_t v19 = v14;
      uint64_t v20 = 1LL;
      goto LABEL_27;
    }

    if ((v24[0] & 0x20000000) != 0)
    {
      __int128 v17 = (__int128 *)&v24[1];
      __int128 v18 = v15;
      uint64_t v19 = v14;
      uint64_t v20 = 0LL;
LABEL_27:
      goto LABEL_28;
    }

uint64_t CBS_get_asn1_implicit_string(uint64_t a1, unint64_t *a2, unint64_t *a3, int a4, int a5)
{
  if ((a4 & 0x20000000) != 0) {
    CBS_get_asn1_implicit_string_cold_3();
  }
  if ((a5 & 0x20000000) != 0) {
    CBS_get_asn1_implicit_string_cold_2();
  }
  if ((a5 & 0xDFFFFFFF) > 0x1E || ((1 << a5) & 0x5E7C1010) == 0) {
    CBS_get_asn1_implicit_string_cold_1();
  }
  if (CBS_peek_asn1_tag((__int128 *)a1, a4))
  {
    *a3 = 0LL;
    return CBS_get_asn1((__int128 *)a1, a2, a4);
  }

  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v11;
  v19[2] = v11;
  v19[0] = v11;
  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (CBB_init((uint64_t)v19, *(void *)(a1 + 8))
    && CBS_get_asn1((__int128 *)a1, &v18, a4 | 0x20000000u))
  {
    if (*((void *)&v18 + 1))
    {
      while (1)
      {
        signed int v16 = (const void *)0xAAAAAAAAAAAAAAAALL;
        size_t v17 = 0xAAAAAAAAAAAAAAAALL;
        if (!*((void *)&v18 + 1)) {
          goto LABEL_13;
        }
      }
    }

    else
    {
LABEL_13:
      unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
      if (CBB_finish((uint64_t)v19, &v15, &v14))
      {
        unint64_t v13 = v14;
        unint64_t v12 = v15;
        *a2 = v15;
        a2[1] = v13;
        *a3 = v12;
        return 1LL;
      }
    }
  }

  CBB_cleanup((uint64_t)v19);
  return 0LL;
}

uint64_t CBB_init_fixed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_BYTE *)(a1 + 8) = 0;
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) &= 0xFCu;
  return 1LL;
}

void *CBB_data(uint64_t a1)
{
  if (*(void *)a1) {
    CBB_data_cold_1();
  }
  unsigned int v1 = *(void **)(a1 + 16);
  if (*(_BYTE *)(a1 + 8)) {
    return (void *)(*v1 + *(void *)(a1 + 24) + *(unsigned __int8 *)(a1 + 32));
  }
  return v1;
}

BOOL add_base128_integer(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = 0;
  if (a2)
  {
    unint64_t v5 = a2;
    do
    {
      ++v4;
      BOOL v6 = v5 > 0x7F;
      v5 >>= 7;
    }

    while (v6);
  }

  if (v4 <= 1) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = v4;
  }
  unsigned int v8 = v7 - 1;
  int v9 = 7 * v7 - 7;
  do
  {
    unsigned int v10 = v8;
    if (v8 >= v7) {
      break;
    }
    int v11 = cbb_add_u(a1, (a2 >> v9) & 0x7F | ((unint64_t)(v8 != 0) << 7), 1uLL);
    unsigned int v8 = v10 - 1;
    v9 -= 7;
  }

  while (v11);
  return v10 >= v7;
}

uint64_t CBB_reserve(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = CBB_flush((uint64_t *)a1);
  if ((_DWORD)result)
  {
    unsigned int v7 = (void *)(a1 + 16);
    if (*(_BYTE *)(a1 + 8)) {
      unsigned int v7 = (void *)*v7;
    }
    return cbb_buffer_reserve((uint64_t)v7, a2, a3) != 0;
  }

  return result;
}

uint64_t CBB_did_write(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + 16);
  if (*(_BYTE *)(a1 + 8)) {
    uint64_t v3 = (void *)*v3;
  }
  uint64_t result = 0LL;
  uint64_t v5 = v3[1];
  BOOL v6 = __CFADD__(v5, a2);
  unint64_t v7 = v5 + a2;
  char v8 = v6;
  if (!*(void *)a1 && (v8 & 1) == 0)
  {
    if (v7 <= v3[2])
    {
      v3[1] = v7;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t CBB_add_u24(uint64_t a1, unsigned int a2)
{
  return cbb_add_u(a1, a2, 3uLL);
}

uint64_t *CBB_discard_child(uint64_t *result)
{
  uint64_t v1 = *result;
  if (*result)
  {
    unsigned int v2 = result + 2;
    if (*((_BYTE *)result + 8)) {
      unsigned int v2 = (void *)*v2;
    }
    if (!*(_BYTE *)(v1 + 8)) {
      CBB_discard_child_cold_1();
    }
    v2[1] = *(void *)(v1 + 24);
    *(void *)(v1 + 16) = 0LL;
    *uint64_t result = 0LL;
  }

  return result;
}

unsigned int *CRYPTO_refcount_inc(unsigned int *result)
{
  unsigned int v1 = atomic_load(result);
  if (v1 != -1)
  {
    do
    {
      unsigned int v2 = __ldaxr(result);
      if (v2 == v1)
      {
        if (!__stlxr(v1 + 1, result)) {
          return result;
        }
      }

      else
      {
        __clrex();
      }

      unsigned int v1 = v2;
    }

    while (v2 != -1);
  }

  return result;
}

uint64_t CBS_skip(void *a1, unint64_t a2)
{
  unint64_t v2 = a1[1];
  BOOL v3 = v2 >= a2;
  unint64_t v4 = v2 - a2;
  if (!v3) {
    return 0LL;
  }
  *a1 += a2;
  a1[1] = v4;
  return 1LL;
}

BOOL CBS_strdup(uint64_t a1, void **a2)
{
  if (*a2) {
    OPENSSL_free(*a2);
  }
  unint64_t v4 = OPENSSL_strndup(*(_BYTE **)a1, *(void *)(a1 + 8));
  *a2 = v4;
  return v4 != 0LL;
}

BOOL CBS_contains_zero_byte(uint64_t a1)
{
  size_t v1 = *(void *)(a1 + 8);
  return v1 && memchr(*(const void **)a1, 0, v1) != 0LL;
}

uint64_t CBS_copy_bytes(uint64_t a1, void *__dst, size_t a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  size_t v4 = v3 - a3;
  if (v3 < a3) {
    return 0LL;
  }
  BOOL v6 = *(const void **)a1;
  *(void *)a1 += a3;
  *(void *)(a1 + 8) = v4;
  if (a3) {
    memcpy(__dst, v6, a3);
  }
  return 1LL;
}

uint64_t CBS_get_any_asn1_element(__int128 *a1, void *a2, _DWORD *a3, unint64_t *a4)
{
  return cbs_get_any_asn1_element(a1, a2, a3, a4, 0LL, 0LL, 0);
}

uint64_t CBS_get_any_ber_asn1_element( __int128 *a1, void *a2, _DWORD *a3, unint64_t *a4, int *a5, _DWORD *a6)
{
  int v7 = -1431655766;
  if (!a5) {
    a5 = &v7;
  }
  return cbs_get_any_asn1_element(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CBS_get_asn1_uint64(__int128 *a1, unint64_t *a2)
{
  int v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = cbs_get_asn1(a1, &v11, 2, 1);
  if ((_DWORD)result)
  {
    uint64_t result = CBS_is_unsigned_asn1_integer(&v11);
    if ((_DWORD)result)
    {
      *a2 = 0LL;
      unint64_t v4 = v12;
      if (v12)
      {
        uint64_t v5 = 0LL;
        unint64_t v6 = 0LL;
        int v7 = v11;
        unint64_t v8 = v12 - 1;
        do
        {
          *a2 = v6 << 8;
          unint64_t v9 = v7[v5] | (v6 << 8);
          *a2 = v9;
          unint64_t v10 = v5 + 1;
          if (v8 == v5) {
            break;
          }
          ++v5;
          unint64_t v6 = v9;
        }

        while (!HIBYTE(v9));
        return v10 >= v4;
      }

      else
      {
        return 1LL;
      }
    }
  }

  return result;
}

BOOL CBS_is_unsigned_asn1_integer(unsigned __int8 **a1)
{
  size_t v1 = a1[1];
  if (v1)
  {
    unsigned int v2 = **a1;
    int v3 = v2 >> 7;
    if (v1 == (unsigned __int8 *)1)
    {
      BOOL v4 = 1;
    }

    else
    {
      int v5 = (char)(*a1)[1];
      BOOL v4 = (**a1 || v5 < 0) && (v2 != 255 || v5 >= 0);
    }
  }

  else
  {
    BOOL v4 = 0;
    int v3 = -1431655766;
  }

  return !v3 && v4;
}

uint64_t CBS_get_optional_asn1_octet_string(__int128 *a1, void *a2, _DWORD *a3, int a4)
{
  uint64_t result = CBS_get_optional_asn1(a1, &v8[1], v8, a4);
  if ((_DWORD)result)
  {
    if (!v8[0])
    {
      *a2 = 0LL;
      a2[1] = 0LL;
      if (!a3) {
        return 1LL;
      }
      goto LABEL_7;
    }

    if (!a2) {
      CBS_get_optional_asn1_octet_string_cold_1();
    }
    int asn1 = cbs_get_asn1((__int128 *)&v8[1], a2, 4, 1);
    uint64_t result = 0LL;
    if (asn1 && !*(void *)&v8[3])
    {
      if (!a3) {
        return 1LL;
      }
LABEL_7:
      *a3 = v8[0];
      return 1LL;
    }
  }

  return result;
}

uint64_t CBS_get_optional_asn1_uint64(__int128 *a1, unint64_t *a2, int a3, unint64_t a4)
{
  uint64_t result = CBS_get_optional_asn1(a1, &v8[1], v8, a3);
  if ((_DWORD)result)
  {
    if (v8[0])
    {
      int asn1_uint64 = CBS_get_asn1_uint64((__int128 *)&v8[1], a2);
      uint64_t result = 0LL;
    }

    else
    {
      *a2 = a4;
    }

    return 1LL;
  }

  return result;
}

uint64_t CBS_get_optional_asn1_BOOL(__int128 *a1, int *a2, int a3, int a4)
{
  int v8 = -1431655766;
  uint64_t result = CBS_get_optional_asn1(a1, &v9[1], &v8, a3);
  if ((_DWORD)result)
  {
    if (!v8)
    {
LABEL_9:
      *a2 = a4;
      return 1LL;
    }

    int asn1 = cbs_get_asn1(&v9[1], v9, 1, 1);
    uint64_t result = 0LL;
    if (asn1 && *((void *)&v9[0] + 1) == 1LL && !*((void *)&v9[1] + 1))
    {
      a4 = **(_BYTE **)&v9[0];
      if (**(_BYTE **)&v9[0])
      {
        if (a4 != 255) {
          return 0LL;
        }
        a4 = 1;
      }

      goto LABEL_9;
    }
  }

  return result;
}

uint64_t parse_base128_integer(void *a1, unint64_t *a2)
{
  unint64_t v2 = 0LL;
  for (uint64_t i = a1[1] - 1LL; i != -1; --i)
  {
    BOOL v4 = (unsigned __int8 *)(*a1)++;
    a1[1] = i;
    if (v2 >> 57) {
      break;
    }
    int v5 = *v4;
    if (!v2 && v5 == 128) {
      break;
    }
    unint64_t v6 = v5 & 0x7F | (v2 << 7);
    unint64_t v2 = v6;
    if ((v5 & 0x80) == 0)
    {
      *a2 = v6;
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t *EC_group_p224()
{
  return &EC_group_p224_storage;
}

double EC_group_p224_init()
{
  qword_18C4C4B10 = (uint64_t)"NIST P-224";
  unk_18C4C4B18 = 0x4812B000002C9LL;
  byte_18C4C4B20 = 33;
  byte_18C4C4B25 = 5;
  bn_set_static_words((uint64_t)&unk_18C4C4A58, (uint64_t)&kP224Field, 4uLL);
  bn_set_static_words((uint64_t)&unk_18C4C4A40, (uint64_t)&kP224FieldRR, 4uLL);
  qword_18C4C4A70 = -1LL;
  bn_set_static_words((uint64_t)&unk_18C4C4A18, (uint64_t)&kP224Order, 4uLL);
  bn_set_static_words((uint64_t)&unk_18C4C4A00, (uint64_t)&kP224OrderRR, 4uLL);
  qword_18C4C4A30 = 0xD6E242706A1FC2EBLL;
  dispatch_queue_t v0 = EC_GFp_nistp224_method();
  xmmword_18C4C4928 = kP224GX;
  unk_18C4C4938 = unk_18760A6D0;
  unk_18C4C4970 = kP224GY;
  unk_18C4C4980 = unk_18760A6F0;
  qword_18C4C49B8 = 1LL;
  xmmword_18C4C4AC8 = kP224B;
  unk_18C4C4AD8 = unk_18760A710;
  EC_group_p224_storage = (uint64_t)v0;
  unk_18C4C4920 = &EC_group_p224_storage;
  ec_group_set_a_minus3((uint64_t)&EC_group_p224_storage);
  *(void *)&double result = 0x100000001LL;
  qword_18C4C4B2C = 0x100000001LL;
  return result;
}

uint64_t *EC_group_p256()
{
  return &EC_group_p256_storage;
}

double EC_group_p256_init()
{
  dword_18C4C4D38 = 415;
  qword_18C4C4D30 = (uint64_t)"NIST P-256";
  qword_18C4C4D3C = 0x701033DCE48862ALL;
  byte_18C4C4D45 = 8;
  bn_set_static_words((uint64_t)&unk_18C4C4C78, (uint64_t)&kP256Field, 4uLL);
  bn_set_static_words((uint64_t)&unk_18C4C4C60, (uint64_t)&kP256FieldRR, 4uLL);
  qword_18C4C4C90 = 1LL;
  bn_set_static_words((uint64_t)&unk_18C4C4C38, (uint64_t)&kP256Order, 4uLL);
  bn_set_static_words((uint64_t)&unk_18C4C4C20, (uint64_t)&kP256OrderRR, 4uLL);
  qword_18C4C4C50 = 0xCCD1C8AAEE00BC4FLL;
  EC_group_p256_storage = (uint64_t)EC_GFp_nistp256_method();
  unk_18C4C4B40 = &EC_group_p256_storage;
  xmmword_18C4C4B48 = kP256MontGX;
  unk_18C4C4B58 = unk_18760A7B0;
  unk_18C4C4B90 = kP256MontGY;
  unk_18C4C4BA0 = unk_18760A7D0;
  xmmword_18C4C4BD8 = kP256FieldR;
  unk_18C4C4BE8 = unk_18760A7F0;
  xmmword_18C4C4CE8 = kP256MontB;
  unk_18C4C4CF8 = unk_18760A810;
  ec_group_set_a_minus3((uint64_t)&EC_group_p256_storage);
  *(void *)&double result = 0x100000001LL;
  qword_18C4C4D4C = 0x100000001LL;
  return result;
}

uint64_t *EC_group_p384()
{
  return &EC_group_p384_storage;
}

double EC_group_p384_init()
{
  qword_18C6D9378 = (uint64_t)"NIST P-384";
  unk_18C6D9380 = 0x4812B000002CBLL;
  byte_18C6D9388 = 34;
  byte_18C6D938D = 5;
  bn_set_static_words((uint64_t)&unk_18C6D92C0, (uint64_t)&kP384Field, 6uLL);
  bn_set_static_words((uint64_t)&unk_18C6D92A8, (uint64_t)&kP384FieldRR, 6uLL);
  qword_18C6D92D8 = 0x100000001LL;
  bn_set_static_words((uint64_t)&unk_18C6D9280, (uint64_t)&kP384Order, 6uLL);
  bn_set_static_words((uint64_t)&unk_18C6D9268, (uint64_t)&kP384OrderRR, 6uLL);
  qword_18C6D9298 = 0x6ED46089E88FDC45LL;
  EC_group_p384_storage = (uint64_t)EC_GFp_mont_method();
  *(void *)algn_18C6D9188 = &EC_group_p384_storage;
  xmmword_18C6D9190 = kP384MontGX;
  unk_18C6D91A0 = unk_18760A8F0;
  xmmword_18C6D91B0 = xmmword_18760A900;
  unk_18C6D91D8 = kP384MontGY;
  unk_18C6D91E8 = unk_18760A920;
  unk_18C6D91F8 = xmmword_18760A930;
  xmmword_18C6D9230 = unk_18760A950;
  unk_18C6D9240 = xmmword_18760A960;
  xmmword_18C6D9220 = kP384FieldR;
  xmmword_18C6D9330 = kP384MontB;
  unk_18C6D9340 = unk_18760A980;
  xmmword_18C6D9350 = xmmword_18760A990;
  ec_group_set_a_minus3((uint64_t)&EC_group_p384_storage);
  *(void *)&double result = 0x100000001LL;
  qword_18C6D9394 = 0x100000001LL;
  return result;
}

uint64_t *EC_group_p521()
{
  return &EC_group_p521_storage;
}

double EC_group_p521_init()
{
  qword_18C6D9598 = (uint64_t)"NIST P-521";
  unk_18C6D95A0 = 0x4812B000002CCLL;
  byte_18C6D95A8 = 35;
  byte_18C6D95AD = 5;
  bn_set_static_words((uint64_t)&unk_18C6D94E0, (uint64_t)&kP521Field, 9uLL);
  bn_set_static_words((uint64_t)&unk_18C6D94C8, (uint64_t)&kP521FieldRR, 9uLL);
  qword_18C6D94F8 = 1LL;
  bn_set_static_words((uint64_t)&unk_18C6D94A0, (uint64_t)&kP521Order, 9uLL);
  bn_set_static_words((uint64_t)&unk_18C6D9488, (uint64_t)&kP521OrderRR, 9uLL);
  qword_18C6D94B8 = 0x1D2F5CCD79A995C7LL;
  EC_group_p521_storage = (uint64_t)EC_GFp_mont_method();
  *(void *)algn_18C6D93A8 = &EC_group_p521_storage;
  qword_18C6D93F0 = 116LL;
  xmmword_18C6D93B0 = kP521MontGX;
  unk_18C6D93C0 = unk_18760AAD0;
  xmmword_18C6D93D0 = xmmword_18760AAE0;
  unk_18C6D93E0 = unk_18760AAF0;
  qword_18C6D9438 = 480LL;
  unk_18C6D93F8 = kP521MontGY;
  unk_18C6D9408 = unk_18760AB18;
  unk_18C6D9418 = xmmword_18760AB28;
  unk_18C6D9428 = unk_18760AB38;
  qword_18C6D9480 = 0LL;
  xmmword_18C6D9440 = kP521FieldR;
  unk_18C6D9450 = unk_18760ABA8;
  xmmword_18C6D9460 = xmmword_18760ABB8;
  unk_18C6D9470 = unk_18760ABC8;
  qword_18C6D9590 = 77LL;
  xmmword_18C6D9550 = kP521MontB;
  unk_18C6D9560 = unk_18760AB60;
  xmmword_18C6D9570 = xmmword_18760AB70;
  unk_18C6D9580 = unk_18760AB80;
  ec_group_set_a_minus3((uint64_t)&EC_group_p521_storage);
  *(void *)&double result = 0x100000001LL;
  qword_18C6D95B4 = 0x100000001LL;
  return result;
}

void EC_GROUP_free(EC_GROUP *a1)
{
  if (a1 && !*((_DWORD *)a1 + 128) && CRYPTO_refcount_dec_and_test_zero((unsigned int *)a1 + 135))
  {
    bn_mont_ctx_cleanup((BIGNUM *)((char *)a1 + 232));
    bn_mont_ctx_cleanup((BIGNUM *)((char *)a1 + 296));
    OPENSSL_free(a1);
  }

uint64_t ec_jacobian_to_affine( uint64_t (***a1)(void, uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return (**a1)(a1, a3, a2, a2 + 72);
}

EC_GROUP *__cdecl EC_GROUP_new_by_curve_name(int nid)
{
  if (nid > 714)
  {
    if (nid != 715)
    {
      if (nid == 716)
      {
        CRYPTO_once(&EC_group_p521_once, (void (*)(void))EC_group_p521_init);
        return (EC_GROUP *)&EC_group_p521_storage;
      }

      goto LABEL_8;
    }

    CRYPTO_once(&EC_group_p384_once, (void (*)(void))EC_group_p384_init);
    return (EC_GROUP *)&EC_group_p384_storage;
  }

  else
  {
    if (nid != 415)
    {
      if (nid == 713)
      {
        CRYPTO_once(&EC_group_p224_once, (void (*)(void))EC_group_p224_init);
        return (EC_GROUP *)&EC_group_p224_storage;
      }

EC_GROUP *__cdecl EC_GROUP_dup(const EC_GROUP *a1)
{
  if (a1 && !*((_DWORD *)a1 + 128)) {
    CRYPTO_refcount_inc((unsigned int *)a1 + 135);
  }
  return a1;
}

int EC_GROUP_cmp(const EC_GROUP *a1, const EC_GROUP *a2, BN_CTX *a3)
{
  if (a1 == a2) {
    return 0;
  }
  int v5 = *((_DWORD *)a1 + 128);
  if (v5 != *((_DWORD *)a2 + 128)) {
    return 1;
  }
  if (v5) {
    return 0;
  }
  return *(void *)a1 != *(void *)a2
      || !*((_DWORD *)a1 + 133)
      || !*((_DWORD *)a2 + 133)
      || BN_cmp((const BIGNUM *)((char *)a1 + 256), (const BIGNUM *)((char *)a2 + 256))
      || BN_cmp((const BIGNUM *)((char *)a1 + 320), (const BIGNUM *)((char *)a2 + 320))
      || !ec_felem_equal((uint64_t)a1, (char *)a1 + 360, (char *)a2 + 360)
}

const EC_POINT *__cdecl EC_GROUP_get0_generator(const EC_GROUP *a1)
{
  if (*((_DWORD *)a1 + 133)) {
    return (const EC_GROUP *)((char *)a1 + 8);
  }
  else {
    return 0LL;
  }
}

uint64_t EC_GROUP_get0_order(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_DWORD *)(a1 + 532)) {
    EC_GROUP_get0_order_cold_1(a1, a2, a3);
  }
  return a1 + 256;
}

uint64_t EC_GROUP_order_bits(uint64_t a1)
{
  return BN_num_bits((const BIGNUM *)(a1 + 256));
}

int EC_GROUP_get_curve_name(const EC_GROUP *a1)
{
  return *((_DWORD *)a1 + 128);
}

int EC_GROUP_get_degree(const EC_GROUP *a1)
{
  return BN_num_bits((const BIGNUM *)((char *)a1 + 320));
}

EC_POINT *__cdecl EC_POINT_new(const EC_GROUP *a1)
{
  if (a1)
  {
    unint64_t v2 = (EC_POINT *)OPENSSL_malloc(0xE0uLL);
    if (v2)
    {
      if (!*((_DWORD *)a1 + 128)) {
        CRYPTO_refcount_inc((unsigned int *)a1 + 135);
      }
      *(void *)unint64_t v2 = a1;
      ec_GFp_simple_point_init((uint64_t)v2 + 8);
    }
  }

  else
  {
    ERR_put_error(15, 0, 67, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 469);
    return 0LL;
  }

  return v2;
}

void EC_POINT_free(EC_POINT *a1)
{
  if (a1)
  {
    EC_GROUP_free(*(EC_GROUP **)a1);
    OPENSSL_free(a1);
  }

int EC_POINT_copy(EC_POINT *a1, const EC_POINT *a2)
{
  if (EC_GROUP_cmp(*(const EC_GROUP **)a1, *(const EC_GROUP **)a2, v2))
  {
    ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 501);
    return 0;
  }

  else
  {
    if (a1 != a2) {
      ec_GFp_simple_point_copy((uint64_t)a1 + 8, (uint64_t)a2 + 8);
    }
    return 1;
  }

EC_POINT *__cdecl EC_POINT_dup(const EC_POINT *a1, const EC_GROUP *a2)
{
  if (!a1) {
    return 0LL;
  }
  int v3 = EC_POINT_new(a2);
  BOOL v4 = v3;
  if (!v3 || !EC_POINT_copy(v3, a1))
  {
    EC_POINT_free(v4);
    return 0LL;
  }

  return v4;
}

int EC_POINT_is_at_infinity(const EC_GROUP *a1, const EC_POINT *a2)
{
  if (!EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, v2)) {
    return ec_GFp_simple_is_at_infinity((uint64_t)a1, (uint64_t)a2 + 8);
  }
  ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 537);
  return 0;
}

int EC_POINT_is_on_curve(const EC_GROUP *a1, const EC_POINT *a2, BN_CTX *a3)
{
  if (!EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, a3)) {
    return ec_GFp_simple_is_on_curve(a1, (uint64_t)a2 + 8);
  }
  ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 546);
  return 0;
}

int EC_POINT_cmp(const EC_GROUP *a1, const EC_POINT *a, const EC_POINT *b, BN_CTX *a4)
{
  if (!EC_GROUP_cmp(a1, *(const EC_GROUP **)a, b) && !EC_GROUP_cmp(a1, *(const EC_GROUP **)b, v7)) {
    return ec_GFp_simple_points_equal((uint64_t)a1, (uint64_t)a + 8, (uint64_t)b + 8) == 0;
  }
  ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 556);
  return -1;
}

int EC_POINT_get_affine_coordinates_GFp( const EC_GROUP *a1, const EC_POINT *a2, BIGNUM *x, BIGNUM *y, BN_CTX *a5)
{
  if (!**(void **)a1)
  {
    int v9 = 66;
    int v10 = 568;
    goto LABEL_5;
  }

  if (EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, (BN_CTX *)x))
  {
    int v9 = 106;
    int v10 = 572;
LABEL_5:
    ERR_put_error(15, 0, v9, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", v10);
    return 0;
  }

  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[2] = v12;
  v17[3] = v12;
  v17[0] = v12;
  v17[1] = v12;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  v15[2] = v12;
  v15[3] = v12;
  v15[0] = v12;
  v15[1] = v12;
  if (x) {
    unint64_t v13 = v17;
  }
  else {
    unint64_t v13 = 0LL;
  }
  if (y) {
    unint64_t v14 = v15;
  }
  else {
    unint64_t v14 = 0LL;
  }
  int result = (**(uint64_t (***)(const EC_GROUP *, char *, _OWORD *, _OWORD *))a1)(a1, (char *)a2 + 8, v13, v14);
  if (result)
  {
    if (!x || (int result = ec_felem_to_bignum((uint64_t)a1, x, (uint64_t)v17)) != 0)
    {
      if (!y) {
        return 1;
      }
      int result = ec_felem_to_bignum((uint64_t)a1, y, (uint64_t)v15);
      if (result) {
        return 1;
      }
    }
  }

  return result;
}

__n128 ec_affine_to_jacobian(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a2 = *(_OWORD *)a3;
  __int128 v4 = *(_OWORD *)(a3 + 16);
  __int128 v5 = *(_OWORD *)(a3 + 32);
  __int128 v6 = *(_OWORD *)(a3 + 48);
  *(void *)(a2 + 64) = *(void *)(a3 + 64);
  *(_OWORD *)(a2 + 32) = v5;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 16) = v4;
  __int128 v7 = *(_OWORD *)(a3 + 104);
  __int128 v8 = *(_OWORD *)(a3 + 120);
  uint64_t v9 = *(void *)(a3 + 136);
  *(_OWORD *)(a2 + 88) = *(_OWORD *)(a3 + 88);
  *(void *)(a2 + 136) = v9;
  *(_OWORD *)(a2 + 120) = v8;
  *(_OWORD *)(a2 + 104) = v7;
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a3 + 72);
  uint64_t v10 = ec_felem_one(a1);
  *(_OWORD *)(a2 + 144) = *(_OWORD *)v10;
  __int128 v12 = *(_OWORD *)(v10 + 32);
  __n128 result = *(__n128 *)(v10 + 48);
  __int128 v13 = *(_OWORD *)(v10 + 16);
  *(void *)(a2 + 208) = *(void *)(v10 + 64);
  *(_OWORD *)(a2 + 176) = v12;
  *(__n128 *)(a2 + 192) = result;
  *(_OWORD *)(a2 + 160) = v13;
  return result;
}

uint64_t ec_jacobian_to_affine_batch(uint64_t a1)
{
  size_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 8LL);
  if (v1) {
    return v1();
  }
  ERR_put_error(15, 0, 66, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 607);
  return 0LL;
}

uint64_t ec_point_set_affine_coordinates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v8 = *(void (**)(uint64_t, _OWORD *, _OWORD *, uint64_t))(*(void *)a1 + 88LL);
  uint64_t v9 = *(void (**)(uint64_t, _OWORD *, uint64_t))(*(void *)a1 + 96LL);
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[2] = v10;
  v26[3] = v10;
  v26[0] = v10;
  v26[1] = v10;
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  v24[2] = v10;
  v24[3] = v10;
  v24[0] = v10;
  v24[1] = v10;
  v9(a1, v26, a4);
  v9(a1, v24, a3);
  ec_felem_add(a1, (unint64_t *)v24, (const unint64_t *)v24, (const unint64_t *)(a1 + 360));
  v8(a1, v24, v24, a3);
  ec_felem_add(a1, (unint64_t *)v24, (const unint64_t *)v24, (const unint64_t *)(a1 + 432));
  if (ec_felem_equal(a1, (char *)v26, (char *)v24))
  {
    *(_OWORD *)a2 = *(_OWORD *)a3;
    __int128 v11 = *(_OWORD *)(a3 + 16);
    __int128 v12 = *(_OWORD *)(a3 + 32);
    __int128 v13 = *(_OWORD *)(a3 + 48);
    *(void *)(a2 + 64) = *(void *)(a3 + 64);
    *(_OWORD *)(a2 + 32) = v12;
    *(_OWORD *)(a2 + 48) = v13;
    *(_OWORD *)(a2 + 16) = v11;
    __int128 v15 = *(_OWORD *)(a4 + 32);
    __int128 v14 = *(_OWORD *)(a4 + 48);
    uint64_t v16 = *(void *)(a4 + 64);
    *(_OWORD *)(a2 + 88) = *(_OWORD *)(a4 + 16);
    *(void *)(a2 + 136) = v16;
    *(_OWORD *)(a2 + 120) = v14;
    *(_OWORD *)(a2 + 104) = v15;
    *(_OWORD *)(a2 + 72) = *(_OWORD *)a4;
    return 1LL;
  }

  else
  {
    ERR_put_error(15, 0, 120, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 628);
    uint64_t result = 0LL;
    if (*(_DWORD *)(a1 + 532))
    {
      *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
      __int128 v18 = *(_OWORD *)(a1 + 32);
      __int128 v19 = *(_OWORD *)(a1 + 48);
      __int128 v20 = *(_OWORD *)(a1 + 64);
      *(void *)(a2 + 64) = *(void *)(a1 + 80);
      *(_OWORD *)(a2 + 32) = v19;
      *(_OWORD *)(a2 + 48) = v20;
      *(_OWORD *)(a2 + 16) = v18;
      __int128 v21 = *(_OWORD *)(a1 + 120);
      __int128 v22 = *(_OWORD *)(a1 + 136);
      __int128 v23 = *(_OWORD *)(a1 + 104);
      *(void *)(a2 + 136) = *(void *)(a1 + 152);
      *(_OWORD *)(a2 + 88) = v23;
      *(_OWORD *)(a2 + 120) = v22;
      *(_OWORD *)(a2 + 104) = v21;
      *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 88);
    }
  }

  return result;
}

int EC_POINT_set_affine_coordinates_GFp( const EC_GROUP *a1, EC_POINT *a2, const BIGNUM *x, const BIGNUM *y, BN_CTX *a5)
{
  if (EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, (BN_CTX *)x))
  {
    int v9 = 106;
    int v10 = 649;
LABEL_10:
    ERR_put_error(15, 0, v9, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", v10);
    return 0;
  }

  if (!x || !y)
  {
    int v9 = 67;
    int v10 = 654;
    goto LABEL_10;
  }

  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[2] = v11;
  _OWORD v28[3] = v11;
  v28[0] = v11;
  v28[1] = v11;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  v26[2] = v11;
  v26[3] = v11;
  v26[0] = v11;
  v26[1] = v11;
  *(_OWORD *)&v25[48] = v11;
  *(_OWORD *)&v25[64] = v11;
  *(_OWORD *)&v25[16] = v11;
  *(_OWORD *)&v25[32] = v11;
  __int128 v24 = v11;
  *(_OWORD *)unint64_t v25 = v11;
  __int128 v22 = v11;
  __int128 v23 = v11;
  __int128 v21 = v11;
  if (ec_bignum_to_felem((uint64_t)a1, (uint64_t)v28, x)
    && ec_bignum_to_felem((uint64_t)a1, (uint64_t)v26, y)
    && ec_point_set_affine_coordinates((uint64_t)a1, (uint64_t)&v21, (uint64_t)v28, (uint64_t)v26))
  {
    __int128 v12 = v21;
    *(_OWORD *)((char *)a2 + 24) = v22;
    __int128 v13 = v24;
    *(_OWORD *)((char *)a2 + 40) = v23;
    *(_OWORD *)((char *)a2 + 56) = v13;
    *((void *)a2 + 9) = *(void *)v25;
    *(_OWORD *)((char *)a2 + 8) = v12;
    __int128 v14 = *(_OWORD *)&v25[24];
    __int128 v15 = *(_OWORD *)&v25[56];
    *((_OWORD *)a2 + 7) = *(_OWORD *)&v25[40];
    *((_OWORD *)a2 + 8) = v15;
    *((void *)a2 + 18) = *(void *)&v25[72];
    *((_OWORD *)a2 + 5) = *(_OWORD *)&v25[8];
    *((_OWORD *)a2 + 6) = v14;
    uint64_t v16 = ec_felem_one((uint64_t)a1);
    *(_OWORD *)((char *)a2 + 152) = *(_OWORD *)v16;
    __int128 v18 = *(_OWORD *)(v16 + 32);
    __int128 v17 = *(_OWORD *)(v16 + 48);
    uint64_t v19 = *(void *)(v16 + 64);
    *(_OWORD *)((char *)a2 + 168) = *(_OWORD *)(v16 + 16);
    *((void *)a2 + 27) = v19;
    *(_OWORD *)((char *)a2 + 200) = v17;
    *(_OWORD *)((char *)a2 + 184) = v18;
    return 1;
  }

  ec_set_to_safe_point((uint64_t)a1, (uint64_t)a2 + 8);
  return 0;
}

double ec_set_to_safe_point(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 532)) {
    return ec_GFp_simple_point_set_to_infinity(a1, a2);
  }
  *(void *)&double result = ec_GFp_simple_point_copy(a2, a1 + 16).n128_u64[0];
  return result;
}

uint64_t ec_point_mul_no_self_test( const EC_GROUP *a1, uint64_t a2, BN_CTX *a3, const EC_GROUP **a4, const BIGNUM *a5, BN_CTX *a6)
{
  if ((a4 != 0LL) != (a5 == 0LL) && ((unint64_t)a3 | (unint64_t)a5) != 0)
  {
    if (EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, a3) || a4 && EC_GROUP_cmp(a1, *a4, v15))
    {
      int v7 = 106;
      int v8 = 744;
      goto LABEL_8;
    }

    if (a6)
    {
      __int128 v18 = 0LL;
    }

    else
    {
      a6 = BN_CTX_new();
      __int128 v18 = a6;
      if (!a6) {
        goto LABEL_23;
      }
    }

    if (!a3
      || (*(void *)&__int128 v31 = 0xAAAAAAAAAAAAAAAALL,
          *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL,
          *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL,
          __int128 v29 = v19,
          __int128 v30 = v19,
          __int128 v27 = v19,
          __int128 v28 = v19,
          arbitrary_bignum_to_scalar((uint64_t)a1, &v27, (const BIGNUM *)a3, a6))
      && ec_point_mul_scalar_base(a1, a2 + 8, (uint64_t)&v27))
    {
      if (!a5)
      {
LABEL_25:
        uint64_t v16 = 1LL;
        goto LABEL_26;
      }

      unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v41[2] = v20;
      v41[3] = v20;
      v41[0] = v20;
      v41[1] = v20;
      unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
      __int128 v38 = v20;
      __int128 v39 = v20;
      __int128 v36 = v20;
      __int128 v37 = v20;
      __int128 v34 = v20;
      __int128 v35 = v20;
      __int128 v32 = v20;
      __int128 v33 = v20;
      __int128 v30 = v20;
      __int128 v31 = v20;
      __int128 v28 = v20;
      __int128 v29 = v20;
      __int128 v27 = v20;
      if (arbitrary_bignum_to_scalar((uint64_t)a1, v41, a5, a6)
        && ec_point_mul_scalar(a1, (uint64_t)&v27, (uint64_t)(a4 + 1), (uint64_t)v41))
      {
        if (a3)
        {
          (*(void (**)(const EC_GROUP *, uint64_t, uint64_t, __int128 *))(*(void *)a1 + 16LL))( a1,  a2 + 8,  a2 + 8,  &v27);
        }

        else
        {
          __int128 v21 = v38;
          *(_OWORD *)(a2 + 168) = v37;
          *(_OWORD *)(a2 + 184) = v21;
          *(_OWORD *)(a2 + 200) = v39;
          __int128 v22 = v34;
          *(_OWORD *)(a2 + 104) = v33;
          *(_OWORD *)(a2 + 120) = v22;
          __int128 v23 = v36;
          *(_OWORD *)(a2 + 136) = v35;
          *(_OWORD *)(a2 + 152) = v23;
          __int128 v24 = v30;
          *(_OWORD *)(a2 + 40) = v29;
          *(_OWORD *)(a2 + 56) = v24;
          __int128 v25 = v32;
          *(_OWORD *)(a2 + 72) = v31;
          *(_OWORD *)(a2 + 88) = v25;
          __int128 v26 = v28;
          *(_OWORD *)(a2 + 8) = v27;
          *(void *)(a2 + 216) = v40;
          *(_OWORD *)(a2 + 24) = v26;
        }

        goto LABEL_25;
      }
    }

uint64_t arbitrary_bignum_to_scalar(uint64_t a1, void *a2, const BIGNUM *a3, BN_CTX *a4)
{
  int v9 = BN_CTX_get(a4);
  if (!v9) {
    goto LABEL_7;
  }
  if (!*(_DWORD *)(a1 + 532)) {
    EC_GROUP_get0_order_cold_1((uint64_t)v9, v10, v11);
  }
  uint64_t v12 = (uint64_t)v9;
  if (BN_nnmod(v9, a3, (const BIGNUM *)(a1 + 256), a4)) {
    BOOL v8 = ec_bignum_to_scalar(a1, a2, v12) != 0;
  }
  else {
LABEL_7:
  }
    BOOL v8 = 0LL;
  BN_CTX_end(a4);
  return v8;
}

uint64_t ec_point_mul_scalar_base(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 40LL))(a1);
    if (ec_GFp_simple_is_on_curve(a1, a2)) {
      return 1LL;
    }
    int v6 = 68;
    int v7 = 867;
  }

  else
  {
    int v6 = 67;
    int v7 = 856;
  }

  ERR_put_error(15, 0, v6, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", v7);
  return 0LL;
}

uint64_t ec_point_mul_scalar(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 && a4)
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 32LL))(a1);
    if (ec_GFp_simple_is_on_curve(a1, a2)) {
      return 1LL;
    }
    int v7 = 68;
    int v8 = 846;
  }

  else
  {
    int v7 = 67;
    int v8 = 837;
  }

  ERR_put_error(15, 0, v7, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", v8);
  return 0LL;
}

uint64_t *ec_point_select(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  return ec_felem_select(a1, a2 + 18, a3, a4 + 18, a5 + 18);
}

uint64_t ec_get_x_coordinate_as_scalar(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int16 v12 = -21846;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[2] = v5;
  _OWORD v11[3] = v5;
  v11[0] = v5;
  v11[1] = v5;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ec_get_x_coordinate_as_bytes(a1, (uint64_t)v11, &v9, 0x42uLL, a3);
  if ((_DWORD)result)
  {
    if (!*(_DWORD *)(a1 + 532)) {
      EC_GROUP_get0_order_cold_1(result, v7, v8);
    }
    memset(v10, 0, sizeof(v10));
    bn_big_endian_to_words((unint64_t *)v10, *(int *)(a1 + 264) + 1LL, (unsigned __int8 *)v11, v9);
    bn_reduce_once( a2,  (unint64_t *)v10,  *((void *)v10 + *(int *)(a1 + 264)),  *(unint64_t **)(a1 + 256),  *(int *)(a1 + 264));
    return 1LL;
  }

  return result;
}

uint64_t ec_get_x_coordinate_as_bytes(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  unsigned int v9 = BN_num_bytes((const BIGNUM *)(a1 + 320));
  if (v9 >= 0x43) {
    ec_get_x_coordinate_as_bytes_cold_1();
  }
  uint64_t v10 = v9;
  if (v9 <= a4)
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13[2] = v12;
    v13[3] = v12;
    v13[0] = v12;
    v13[1] = v12;
    uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t, _OWORD *, void))a1)(a1, a5, v13, 0LL);
    if ((_DWORD)result)
    {
      ec_felem_to_bytes(a1);
      *a3 = v10;
      return 1LL;
    }
  }

  else
  {
    ERR_put_error(15, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 996);
    return 0LL;
  }

  return result;
}

uint64_t *ec_group_set_a_minus3(uint64_t a1)
{
  unint64_t v2 = (const unint64_t *)ec_felem_one(a1);
  *(_DWORD *)(a1 + 528) = 1;
  ec_felem_neg(a1, (unint64_t *)(a1 + 360), v2);
  ec_felem_sub(a1, (unint64_t *)(a1 + 360), (const unint64_t *)(a1 + 360), v2);
  return ec_felem_sub(a1, (unint64_t *)(a1 + 360), (const unint64_t *)(a1 + 360), v2);
}

void OUTLINED_FUNCTION_0_5(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

boringssl_concrete_boringssl_psk_cache *boringssl_psk_cache_create_with_context(void *a1)
{
  unint64_t v2 = objc_alloc_init(&OBJC_CLASS___boringssl_concrete_boringssl_psk_cache);
  int v3 = v2;
  if (v2)
  {
    list = v2->list;
    v2->list = 0LL;

    objc_storeStrong((id *)&v3->context, a1);
  }

  return v3;
}

void boringssl_psk_cache_add_psk(void *a1, void *a2)
{
  int v6 = a1;
  id v3 = a2;
  if (v6 && v3)
  {
    if (!v6[1])
    {
      uint64_t v4 = sec_array_create();
      __int128 v5 = (void *)v6[1];
      v6[1] = v4;
    }

    sec_array_append();
  }
}

id boringssl_psk_cache_lookup_psk(void *a1, void *a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  __int128 v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5) {
    goto LABEL_83;
  }
  if (sec_array_get_count())
  {
    if (v5[3] && v5[4])
    {
      if (v7)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        *(void *)&buf[24] = __Block_byref_object_copy__2;
        *(void *)&buf[32] = __Block_byref_object_dispose__2;
        id v95 = 0LL;
        uint64_t v8 = v5[2];
        if (!v8) {
          goto LABEL_33;
        }
        id WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
        if (WeakRetained)
        {
          uint64_t v10 = WeakRetained;
          uint64_t v11 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
          char v12 = v11[475];

          if ((v12 & 1) != 0) {
            goto LABEL_114;
          }
        }

        uint64_t v13 = v5[2];
        if (v13)
        {
          id v14 = objc_loadWeakRetained((id *)(v13 + 16));
          if (v14)
          {
            __int128 v15 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
            BOOL v16 = (v15[475] & 1) == 0;
          }

          else
          {
            BOOL v16 = 1LL;
          }

          if (!v16) {
            goto LABEL_114;
          }
        }

        else
        {
LABEL_33:
          BOOL v16 = 1LL;
        }

        if (!g_boringssl_log)
        {
LABEL_114:
          v77 = (dispatch_queue_s *)v5[4];
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __boringssl_psk_cache_lookup_psk_block_invoke;
          block[3] = &unk_18A072218;
          v82 = v5;
          id v83 = v7;
          id v84 = v6;
          v85 = buf;
          dispatch_sync(v77, block);
          id v43 = *(id *)(*(void *)&buf[8] + 40LL);

          _Block_object_dispose(buf, 8);
          goto LABEL_130;
        }

        char v60 = (os_log_s *)(id)g_boringssl_log;
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_INFO)) {
          goto LABEL_113;
        }
        uint64_t v61 = v5[2];
        if (v61)
        {
          __int128 v62 = (char *)objc_loadWeakRetained((id *)(v61 + 16));
          BOOL v16 = (BOOL)v62;
          uint64_t v63 = v5[2];
          if (v62)
          {
            BOOL v64 = v63 != 0;
            if (v63)
            {
              __int128 v62 = (char *)objc_loadWeakRetained((id *)(v63 + 16));
              uint64_t v63 = v5[2];
            }

            else
            {
              __int128 v62 = 0LL;
            }

            char v72 = v62 + 391;
          }

          else
          {
            BOOL v64 = 0;
            char v72 = &unk_1875F4C23;
          }

          v80 = v62;
          if (v63)
          {
            id v70 = objc_loadWeakRetained((id *)(v63 + 16));
            char v71 = 0;
          }

          else
          {
            id v70 = 0LL;
            char v71 = 1;
          }
        }

        else
        {
          BOOL v64 = 0;
          id v70 = 0LL;
          char v71 = 1;
          char v72 = &unk_1875F4C23;
        }

        *(_DWORD *)v86 = 136446978;
        v87 = "boringssl_psk_cache_lookup_psk";
        __int16 v88 = 1024;
        int v89 = 104;
        __int16 v90 = 2082;
        v91 = v72;
        __int16 v92 = 2048;
        id v93 = v70;
        _os_log_impl( &dword_187560000,  v60,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] Invoking client PSK selection callback.",  v86,  0x26u);
        if ((v71 & 1) != 0)
        {
          if (!v64) {
            goto LABEL_111;
          }
        }

        else
        {

          if (!v64)
          {
LABEL_111:
            if (v61) {
LABEL_112:
            }

LABEL_113:
            goto LABEL_114;
          }
        }

        if (!v61) {
          goto LABEL_113;
        }
        goto LABEL_112;
      }

      goto LABEL_83;
    }

    uint64_t v17 = v5[2];
    if (v6)
    {
      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)(v17 + 16));
        if (v18)
        {
          __int128 v19 = v18;
          __int128 v20 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
          char v21 = v20[475];

          if ((v21 & 1) != 0) {
            goto LABEL_99;
          }
        }

        uint64_t v22 = v5[2];
        if (v22)
        {
          id v23 = objc_loadWeakRetained((id *)(v22 + 16));
          if (v23)
          {
            __int128 v24 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
            BOOL v25 = (v24[475] & 1) == 0;
          }

          else
          {
            BOOL v25 = 1;
          }

          if (!v25) {
            goto LABEL_99;
          }
        }
      }

      if (!g_boringssl_log) {
        goto LABEL_99;
      }
      char v52 = (os_log_s *)(id)g_boringssl_log;
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_INFO)) {
        goto LABEL_98;
      }
      uint64_t v53 = v5[2];
      if (v53)
      {
        unint64_t v54 = (char *)objc_loadWeakRetained((id *)(v53 + 16));
        uint64_t v55 = v5[2];
        v80 = v54;
        if (v54)
        {
          BOOL v56 = v55 != 0;
          if (v55)
          {
            unint64_t v54 = (char *)objc_loadWeakRetained((id *)(v55 + 16));
            uint64_t v55 = v5[2];
          }

          else
          {
            unint64_t v54 = 0LL;
          }

          char v59 = v54 + 391;
        }

        else
        {
          BOOL v56 = 0;
          char v59 = &unk_1875F4C23;
        }

        unint64_t v79 = v54;
        if (v55)
        {
          id v57 = objc_loadWeakRetained((id *)(v55 + 16));
          char v58 = 0;
        }

        else
        {
          id v57 = 0LL;
          char v58 = 1;
        }
      }

      else
      {
        BOOL v56 = 0;
        id v57 = 0LL;
        char v58 = 1;
        char v59 = &unk_1875F4C23;
      }

      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "boringssl_psk_cache_lookup_psk";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 124;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v59;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v57;
      _os_log_impl( &dword_187560000,  v52,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] No PSK selection logic. Indexing cache using identity hint verbatim.",  buf,  0x26u);
      if ((v58 & 1) != 0)
      {
        if (!v56) {
          goto LABEL_96;
        }
      }

      else
      {

        if (!v56)
        {
LABEL_96:
          if (v53) {
LABEL_97:
          }

LABEL_98:
LABEL_99:
          psk = boringssl_psk_cache_lookup_psk_inner(v5, v6);
LABEL_129:
          id v43 = psk;
          goto LABEL_130;
        }
      }

      if (!v53) {
        goto LABEL_98;
      }
      goto LABEL_97;
    }

    if (v17)
    {
      id v35 = objc_loadWeakRetained((id *)(v17 + 16));
      if (v35)
      {
        __int128 v36 = v35;
        __int128 v37 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
        char v38 = v37[475];

        if ((v38 & 1) != 0) {
          goto LABEL_128;
        }
      }

      uint64_t v39 = v5[2];
      if (v39)
      {
        id v40 = objc_loadWeakRetained((id *)(v39 + 16));
        if (v40)
        {
          __int128 v41 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
          BOOL v42 = (v41[475] & 1) == 0;
        }

        else
        {
          BOOL v42 = 1;
        }

        if (!v42) {
          goto LABEL_128;
        }
      }
    }

    if (!g_boringssl_log)
    {
LABEL_128:
      psk = boringssl_psk_cache_copy_first_psk(v5);
      goto LABEL_129;
    }

    v65 = (os_log_s *)(id)g_boringssl_log;
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_INFO)) {
      goto LABEL_127;
    }
    uint64_t v66 = v5[2];
    if (v66)
    {
      v67 = (char *)objc_loadWeakRetained((id *)(v66 + 16));
      uint64_t v68 = v5[2];
      v80 = v67;
      if (v67)
      {
        BOOL v69 = v68 != 0;
        if (v68)
        {
          v67 = (char *)objc_loadWeakRetained((id *)(v68 + 16));
          uint64_t v68 = v5[2];
        }

        else
        {
          v67 = 0LL;
        }

        unint64_t v75 = v67 + 391;
      }

      else
      {
        BOOL v69 = 0;
        unint64_t v75 = &unk_1875F4C23;
      }

      unint64_t v79 = v67;
      if (v68)
      {
        id v73 = objc_loadWeakRetained((id *)(v68 + 16));
        char v74 = 0;
      }

      else
      {
        id v73 = 0LL;
        char v74 = 1;
      }
    }

    else
    {
      BOOL v69 = 0;
      id v73 = 0LL;
      char v74 = 1;
      unint64_t v75 = &unk_1875F4C23;
    }

    *(_DWORD *)buf = 136446978;
    *(void *)&buf[4] = "boringssl_psk_cache_lookup_psk";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 118;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = v75;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v73;
    _os_log_impl( &dword_187560000,  v65,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] No PSK hint or selection logic. Using first PSK in the cache.",  buf,  0x26u);
    if ((v74 & 1) != 0)
    {
      if (!v69) {
        goto LABEL_125;
      }
    }

    else
    {

      if (!v69)
      {
LABEL_125:
        if (v66) {
LABEL_126:
        }

LABEL_127:
        goto LABEL_128;
      }
    }

    if (!v66) {
      goto LABEL_127;
    }
    goto LABEL_126;
  }

  uint64_t v26 = v5[2];
  if (!v26) {
    goto LABEL_25;
  }
  id v27 = objc_loadWeakRetained((id *)(v26 + 16));
  if (v27)
  {
    __int128 v28 = v27;
    __int128 v29 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
    char v30 = v29[475];

    if ((v30 & 1) != 0) {
      goto LABEL_83;
    }
  }

  uint64_t v31 = v5[2];
  if (v31)
  {
    id v32 = objc_loadWeakRetained((id *)(v31 + 16));
    if (v32)
    {
      __int128 v33 = objc_loadWeakRetained((id *)(v5[2] + 16LL));
      BOOL v34 = (v33[475] & 1) == 0;
    }

    else
    {
      BOOL v34 = 1;
    }
  }

  else
  {
LABEL_25:
    BOOL v34 = 1;
  }

  id v43 = 0LL;
  if (v34 && g_boringssl_log)
  {
    __int128 v44 = (os_log_s *)(id)g_boringssl_log;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
      goto LABEL_82;
    }
    uint64_t v45 = v5[2];
    if (v45)
    {
      __int128 v46 = (char *)objc_loadWeakRetained((id *)(v45 + 16));
      uint64_t v47 = v5[2];
      v80 = v46;
      if (v46)
      {
        BOOL v48 = v47 != 0;
        if (v47)
        {
          __int128 v46 = (char *)objc_loadWeakRetained((id *)(v47 + 16));
          uint64_t v47 = v5[2];
        }

        else
        {
          __int128 v46 = 0LL;
        }

        char v51 = v46 + 391;
      }

      else
      {
        BOOL v48 = 0;
        char v51 = &unk_1875F4C23;
      }

      unint64_t v79 = v46;
      if (v47)
      {
        id v49 = objc_loadWeakRetained((id *)(v47 + 16));
        char v50 = 0;
      }

      else
      {
        id v49 = 0LL;
        char v50 = 1;
      }
    }

    else
    {
      BOOL v48 = 0;
      id v49 = 0LL;
      char v50 = 1;
      char v51 = &unk_1875F4C23;
    }

    *(_DWORD *)buf = 136446978;
    *(void *)&buf[4] = "boringssl_psk_cache_lookup_psk";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 96;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = v51;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v49;
    _os_log_impl( &dword_187560000,  v44,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] PSK cache is empty.",  buf,  0x26u);
    if ((v50 & 1) != 0)
    {
      if (!v48) {
        goto LABEL_80;
      }
    }

    else
    {

      if (!v48)
      {
LABEL_80:
        if (v45) {
LABEL_81:
        }

LABEL_82:
LABEL_83:
        id v43 = 0LL;
        goto LABEL_130;
      }
    }

    if (!v45) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }

LABEL_130:
  return v43;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __boringssl_psk_cache_lookup_psk_block_invoke(void *a1)
{
  unint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = v2[3];
  uint64_t v5 = a1[6];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __boringssl_psk_cache_lookup_psk_block_invoke_2;
  _OWORD v8[3] = &unk_18A0721F0;
  id v6 = v2;
  uint64_t v7 = a1[7];
  id v9 = v6;
  uint64_t v10 = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v4 + 16))(v4, v3, v5, v8);
}

void __boringssl_psk_cache_lookup_psk_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16LL);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
    if (WeakRetained)
    {
      uint64_t v7 = WeakRetained;
      uint64_t v8 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL));
      char v9 = v8[475];

      if ((v9 & 1) != 0) {
        goto LABEL_32;
      }
    }
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16LL);
  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)(v10 + 16));
    if (v11)
    {
      char v12 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL));
      uint64_t v13 = (v12[475] & 1) == 0;
    }

    else
    {
      uint64_t v13 = 1LL;
    }

    if (!(_DWORD)v13) {
      goto LABEL_32;
    }
  }

  else
  {
    uint64_t v13 = 1LL;
  }

  if (g_boringssl_log)
  {
    id v14 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(v15 + 16);
      if (v16)
      {
        uint64_t v13 = (uint64_t)objc_loadWeakRetained((id *)(v16 + 16));
        uint64_t v15 = *(void *)(a1 + 32);
        if (v13)
        {
          uint64_t v17 = *(void *)(v15 + 16);
          BOOL v18 = v17 != 0;
          if (v17)
          {
            unint64_t v2 = (char *)objc_loadWeakRetained((id *)(v17 + 16));
            uint64_t v15 = *(void *)(a1 + 32);
          }

          else
          {
            unint64_t v2 = 0LL;
          }

          __int128 v19 = v2 + 391;
        }

        else
        {
          BOOL v18 = 0;
          __int128 v19 = &unk_1875F4C23;
        }
      }

      else
      {
        BOOL v18 = 0;
        __int128 v19 = &unk_1875F4C23;
      }

      uint64_t v20 = *(void *)(v15 + 16);
      if (v20) {
        id v21 = objc_loadWeakRetained((id *)(v20 + 16));
      }
      else {
        id v21 = 0LL;
      }
      id v27 = "boringssl_psk_cache_lookup_psk_block_invoke_2";
      __int16 v28 = 1024;
      uint64_t v22 = "with";
      int v29 = 108;
      int v26 = 136447234;
      if (!v4) {
        uint64_t v22 = "without";
      }
      __int16 v30 = 2082;
      uint64_t v31 = v19;
      __int16 v32 = 2048;
      id v33 = v21;
      __int16 v34 = 2082;
      id v35 = v22;
      _os_log_impl( &dword_187560000,  v14,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] Returned from client PSK selection callback %{public}s PSK.",  (uint8_t *)&v26,  0x30u);
      if (v20) {

      }
      if (v18) {
      if (v16)
      }
    }
  }

void *boringssl_psk_cache_lookup_psk_inner(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  id v6 = 0LL;
  if (v3 && v4)
  {
    uint64_t v27 = 0LL;
    __int16 v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    __int16 v30 = __Block_byref_object_copy__2;
    uint64_t v31 = __Block_byref_object_dispose__2;
    id v32 = 0LL;
    id v26 = v4;
    sec_array_apply();
    id v6 = (void *)v28[5];
    if (v6)
    {
      id v7 = v6;
LABEL_5:

      _Block_object_dispose(&v27, 8);
      goto LABEL_6;
    }

    uint64_t v9 = v3[2];
    if (!v9) {
      goto LABEL_13;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));
    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained((id *)(v3[2] + 16LL));
      BOOL v12 = (v11[475] & 1) == 0;

      if (!v12) {
        goto LABEL_5;
      }
    }

    uint64_t v13 = v3[2];
    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)(v13 + 16));
      if (v14)
      {
        uint64_t v15 = objc_loadWeakRetained((id *)(v3[2] + 16LL));
        BOOL v16 = (v15[475] & 1) == 0;
      }

      else
      {
        BOOL v16 = 1LL;
      }
    }

    else
    {
LABEL_13:
      BOOL v16 = 1LL;
    }

    if (v16 && g_boringssl_log)
    {
      uint64_t v17 = (os_log_s *)(id)g_boringssl_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = v3[2];
        if (v18)
        {
          __int128 v19 = (char *)objc_loadWeakRetained((id *)(v18 + 16));
          BOOL v16 = (BOOL)v19;
          uint64_t v20 = v3[2];
          if (v19)
          {
            BOOL v21 = v20 != 0;
            if (v20)
            {
              __int128 v19 = (char *)objc_loadWeakRetained((id *)(v20 + 16));
              uint64_t v20 = v3[2];
            }

            else
            {
              __int128 v19 = 0LL;
            }

            uint64_t v24 = v19 + 391;
          }

          else
          {
            BOOL v21 = 0;
            uint64_t v24 = &unk_1875F4C23;
          }

          BOOL v25 = v19;
          if (v20)
          {
            id v22 = objc_loadWeakRetained((id *)(v20 + 16));
            char v23 = 0;
          }

          else
          {
            id v22 = 0LL;
            char v23 = 1;
          }
        }

        else
        {
          BOOL v21 = 0;
          id v22 = 0LL;
          char v23 = 1;
          uint64_t v24 = &unk_1875F4C23;
        }

        *(_DWORD *)buf = 136446978;
        __int16 v34 = "boringssl_psk_cache_lookup_psk_inner";
        __int16 v35 = 1024;
        int v36 = 81;
        __int16 v37 = 2082;
        char v38 = v24;
        __int16 v39 = 2048;
        id v40 = v22;
        _os_log_impl( &dword_187560000,  v17,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] PSK lookup using identity hint did not find a match.",  buf,  0x26u);
        if ((v23 & 1) == 0) {

        }
        if (v21) {
        if (v18)
        }
      }
    }

    goto LABEL_5;
  }

void sub_1875D33E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id boringssl_psk_cache_copy_first_psk(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = &v4;
    uint64_t v6 = 0x3032000000LL;
    id v7 = __Block_byref_object_copy__2;
    uint64_t v8 = __Block_byref_object_dispose__2;
    id v9 = 0LL;
    sec_array_apply();
    id v2 = (id)v5[5];
    _Block_object_dispose(&v4, 8);
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

void sub_1875D34CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __boringssl_psk_cache_copy_first_psk_block_invoke(uint64_t a1, int a2, id obj)
{
  return 0LL;
}

void boringssl_psk_cache_set_selection_block_and_queue(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a1 && a2 && v6)
  {
    id v10 = v6;
    id v7 = a1;
    uint64_t v8 = MEMORY[0x1895A97C0](a2);
    id v9 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v8;

    objc_storeStrong((id *)v7 + 4, a3);
    id v6 = v10;
  }
}

id boringssl_psk_cache_copy_psk_object_array(void *a1)
{
  id v1 = a1;
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000LL;
  id v7 = __Block_byref_object_copy__2;
  uint64_t v8 = __Block_byref_object_dispose__2;
  id v9 = (id)0xAAAAAAAAAAAAAAAALL;
  id v9 = xpc_array_create(0LL, 0LL);
  sec_array_apply();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void sub_1875D3654( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __boringssl_psk_cache_copy_psk_object_array_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v4 = boringssl_psk_copy_xpc_object(a3);
  xpc_array_set_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), 0xFFFFFFFFFFFFFFFFLL, v4);

  return 1LL;
}

void boringssl_psk_cache_clear_context(uint64_t a1)
{
  if (a1)
  {
    id v1 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;
  }

BOOL __boringssl_psk_cache_lookup_psk_inner_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  BOOL v6 = boringssl_psk_matches_identity_hint(v5, *(void **)(a1 + 32));
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }

  return !v6;
}

const EVP_CIPHER *EVP_des_ede3_cbc(void)
{
  return (const EVP_CIPHER *)&des_ede3_cbc;
}

uint64_t des_cbc_ede3_init_key(uint64_t a1, void *key, void *iv, int a4)
{
  CCCryptorRef cryptorRef = 0LL;
  CCCryptorStatus v5 = CCCryptorCreate(a4 == 0, 2u, 0, key, *(unsigned int *)(a1 + 24), iv, &cryptorRef);
  uint64_t result = 0LL;
  if (!v5)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = cryptorRef;
    return 1LL;
  }

  return result;
}

BOOL des_ede3_cbc_cipher(uint64_t a1, void *a2, const void *a3, size_t a4)
{
  xpc_object_t v4 = *(_CCCryptor **)(a1 + 8);
  if (v4
    && !CCCryptorReset(*(CCCryptorRef *)(a1 + 8), (const void *)(a1 + 52))
    && ((dataOutMoved = 0LL, !CCCryptorUpdate(v4, a3, a4, a2, a4, &dataOutMoved)) ? (BOOL v8 = dataOutMoved == a4) : (BOOL v8 = 0),
        v8))
  {
    return CCCryptorGetIV() == 0;
  }

  else
  {
    return 0LL;
  }

_CCCryptor *des_cleanup(uint64_t a1)
{
  uint64_t result = *(_CCCryptor **)(a1 + 8);
  if (result)
  {
    uint64_t result = (_CCCryptor *)CCCryptorRelease(result);
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

  return result;
}

uint64_t pkey_ed25519_copy()
{
  return 1LL;
}

uint64_t pkey_ed25519_keygen(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = OPENSSL_malloc(0x41uLL);
  if (!v3) {
    return 0LL;
  }
  xpc_object_t v4 = v3;
  evp_pkey_set_method(a2, &ed25519_asn1_meth);
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v5;
  v8[1] = v5;
  ED25519_keypair((uint64_t)v8, v4);
  uint64_t v6 = 1LL;
  *((_BYTE *)v4 + 64) = 1;
  OPENSSL_free(*(void **)(a2 + 8));
  *(void *)(a2 + _Block_object_dispose(va, 8) = v4;
  return v6;
}

uint64_t pkey_ed25519_sign_message(uint64_t a1, _BYTE *a2, void *a3, const void *a4, size_t a5)
{
  __int128 v5 = *(unsigned __int8 **)(*(void *)(a1 + 16) + 8LL);
  if (!v5[64])
  {
    int v7 = 130;
    int v8 = 49;
    goto LABEL_6;
  }

  if (!a2) {
    goto LABEL_8;
  }
  if (*a3 <= 0x3FuLL)
  {
    int v7 = 100;
    int v8 = 59;
LABEL_6:
    ERR_put_error(6, 0, v7, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_ed25519.c", v8);
    return 0LL;
  }

  uint64_t result = ED25519_sign(a2, a4, a5, v5);
  if ((_DWORD)result)
  {
LABEL_8:
    *a3 = 64LL;
    return 1LL;
  }

  return result;
}

uint64_t pkey_ed25519_verify_message(uint64_t a1, unsigned __int8 *a2, uint64_t a3, const void *a4, size_t a5)
{
  if (a3 == 64
    && ED25519_verify(a4, a5, a2, (int64x2_t *)(*(void *)(*(void *)(a1 + 16) + 8LL) + 32LL)))
  {
    return 1LL;
  }

  ERR_put_error(6, 0, 131, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_ed25519.c", 77);
  return 0LL;
}

int OBJ_cmp(const ASN1_OBJECT *a, const ASN1_OBJECT *b)
{
  size_t length = a->length;
  int v3 = b->length;
  if ((_DWORD)length) {
    return memcmp(a->data, b->data, length);
  }
  return 0;
}

int OBJ_obj2nid(const ASN1_OBJECT *o)
{
  if (o)
  {
    id v1 = o;
    LODWORD(o) = o->nid;
    if (!(_DWORD)o)
    {
      CRYPTO_MUTEX_lock_read(&global_added_lock);
      if (global_added_by_data)
      {
        uint64_t v2 = OPENSSL_lh_retrieve( (void *)global_added_by_data,  (uint64_t)v1,  (uint64_t (*)(void, uint64_t))lh_ASN1_OBJECT_call_hash_func,  (unsigned int (*)(void, void, uint64_t))lh_ASN1_OBJECT_call_cmp_func);
        if (v2)
        {
          uint64_t v3 = v2;
          CRYPTO_MUTEX_unlock_read(&global_added_lock);
          xpc_object_t v4 = (char **)(v3 + 16);
LABEL_9:
          LODWORD(o) = *(_DWORD *)v4;
          return (int)o;
        }
      }

      CRYPTO_MUTEX_unlock_read(&global_added_lock);
      o = (const ASN1_OBJECT *)bsearch( v1,  &kNIDsInOIDOrder,  0x371uLL,  2uLL,  (int (__cdecl *)(const void *, const void *))obj_cmp);
      if (o)
      {
        unsigned int v5 = LOWORD(o->sn) - 1;
        if (v5 >= 0x3C4) {
          abort();
        }
        xpc_object_t v4 = &kObjects[5 * v5 + 2];
        goto LABEL_9;
      }
    }
  }

  return (int)o;
}

uint64_t obj_cmp(const ASN1_OBJECT *a1, unsigned __int16 *a2)
{
  unsigned int v2 = *a2 - 1;
  if (v2 >= 0x3C4) {
    abort();
  }
  return OBJ_cmp(a1, (const ASN1_OBJECT *)&kObjects[5 * v2]);
}

uint64_t lh_ASN1_OBJECT_call_hash_func(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  return a1(a2);
}

uint64_t lh_ASN1_OBJECT_call_cmp_func(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a2, a3);
}

uint64_t boringssl_context_set_internal_error(uint64_t result, int a2)
{
  if (result && *(_DWORD *)result == -1252936367)
  {
    uint64_t v2 = *(void *)(result + 8);
    if (v2) {
      *(_DWORD *)(v2 + 296) = a2;
    }
  }

  return result;
}

uint64_t boringssl_context_get_peer_hostname(uint64_t a1, const char **a2, size_t *a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3)
  {
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 8);
      if (v7)
      {
        int v8 = *(const SSL **)(v7 + 400);
        if (v8)
        {
          servername = SSL_get_servername(v8, 0);
          if (servername)
          {
            id v10 = servername;
            size_t v11 = strnlen(servername, 0xFFFFuLL);
            uint64_t result = 0LL;
            *a3 = v11;
            *a2 = v10;
            return result;
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t boringssl_context_set_psk_identity_hint(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4)
    {
      if (*(void *)(a2 + 8) && *(void *)a2)
      {
        uint64_t v5 = *(void *)(v4 + 400);
        if (v5)
        {
          else {
            return 0xFFFFFFFFLL;
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t boringssl_context_set_key_exchange_groups_from_list(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!a1 || *(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3)
  {
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 8);
      if (v7)
      {
        uint64_t v8 = *(void *)(v7 + 400);
        if (v8)
        {
          bzero(v29, 0x400uLL);
          uint64_t v9 = 0LL;
          char v10 = 0;
          size_t v11 = 0LL;
          uint64_t v12 = a3 - 1;
          while (1)
          {
            while (1)
            {
              int curve_name = (const char *)SSL_get_curve_name(*(unsigned __int16 *)(a2 + 2 * v9));
              if (curve_name) {
                break;
              }
              if (a3 == ++v9)
              {
                if ((v10 & 1) != 0)
                {
                  uint64_t v18 = v29;
                  goto LABEL_25;
                }

                if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
                  boringssl_context_set_key_exchange_groups_from_list_cold_2();
                }
LABEL_24:
                uint64_t v18 = 0LL;
                goto LABEL_25;
              }
            }

            id v14 = curve_name;
            uint64_t v28 = v8;
            if ((v10 & 1) != 0)
            {
              if (v11 + 1 > 0x3FF) {
                goto LABEL_24;
              }
              uint64_t v15 = v12;
              v29[v11++] = 58;
            }

            else
            {
              uint64_t v15 = v12;
            }

            size_t v16 = strlen(curve_name);
            size_t v17 = v16 + v11;
            if (v16 + v11 >= 0x400) {
              break;
            }
            uint64_t v18 = v29;
            strncpy(&v29[v11], v14, v16);
            char v10 = 1;
            size_t v11 = v17;
            uint64_t v12 = v15;
            BOOL v19 = v15 == v9++;
            uint64_t v8 = v28;
            if (v19) {
              goto LABEL_25;
            }
          }

          uint64_t v18 = 0LL;
          uint64_t v8 = v28;
LABEL_25:
          id WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
          if (WeakRetained)
          {
            BOOL v21 = WeakRetained;
            id v22 = objc_loadWeakRetained((id *)(v7 + 16));
            char v23 = v22[475];

            if ((v23 & 1) != 0) {
              return 0xFFFFFFFFLL;
            }
          }

          id v24 = objc_loadWeakRetained((id *)(v7 + 16));
          if (v24)
          {
            BOOL v25 = objc_loadWeakRetained((id *)(v7 + 16));
            BOOL v26 = (v25[475] & 1) == 0;
          }

          else
          {
            BOOL v26 = 1;
          }

          uint64_t result = 0xFFFFFFFFLL;
          if (v26)
          {
            if (g_boringssl_log)
            {
              uint64_t v27 = (os_log_s *)(id)g_boringssl_log;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                boringssl_context_set_key_exchange_groups_from_list_cold_1(v7 + 16, v27);
              }

              return 0xFFFFFFFFLL;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t boringssl_context_set_key_exchange_groups(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || *(_DWORD *)a1 != -1252936367) {
    goto LABEL_8;
  }
  uint64_t v5 = 0xFFFFFFFFLL;
  if (!v3 || !*(void *)(a1 + 8)) {
    goto LABEL_9;
  }
  size_t count = xpc_array_get_count(v3);
  uint64_t v7 = malloc(2 * count);
  if (!v7)
  {
LABEL_8:
    uint64_t v5 = 0xFFFFFFFFLL;
    goto LABEL_9;
  }

  uint64_t v8 = v7;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __boringssl_context_set_key_exchange_groups_block_invoke;
  _OWORD v10[3] = &unk_18A07B9E0;
  id v11 = v4;
  uint64_t v12 = v8;
  xpc_array_apply(v11, v10);
  if (count) {
    uint64_t v5 = boringssl_context_set_key_exchange_groups_from_list(a1, (uint64_t)v8, count);
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  free(v8);

LABEL_9:
  return v5;
}

uint64_t __boringssl_context_set_key_exchange_groups_block_invoke(uint64_t a1, size_t a2)
{
  *(_WORD *)(*(void *)(a1 + 40) + 2 * a2) = xpc_array_get_uint64(*(xpc_object_t *)(a1 + 32), a2);
  return 1LL;
}

uint64_t boringssl_session_set_quic_early_data_context(uint64_t a1, const char *a2, unint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(void *)(v3 + 400);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  if (a2 == 0LL || a3 == 0)
  {
    a2 = "Default QUIC Early Data Context";
    a3 = 32LL;
  }

  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t boringssl_session_get_quic_early_data_context(uint64_t a1, void *a2)
{
  if (a1 && *(_DWORD *)a1 == -1252936367 && (v2 = *(void *)(a1 + 8)) != 0 && (uint64_t v3 = *(void *)(v2 + 400)) != 0) {
    return SSL_get_quic_early_data_context(v3, a2);
  }
  else {
    return 0LL;
  }
}

BOOL boringssl_context_set_quic_transport_parameters(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || *(_DWORD *)a1 != -1252936367) {
    goto LABEL_22;
  }
  BOOL v5 = 0LL;
  if (!v3) {
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6) {
    goto LABEL_23;
  }
  if (!*(void *)(v6 + 400)) {
    goto LABEL_22;
  }
  size_t size = dispatch_data_get_size(v3);
  buffer_from_dispatch_data = boringssl_helper_create_buffer_from_dispatch_data(v4);
  if (!buffer_from_dispatch_data)
  {
    BOOL v19 = (id *)(v6 + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
    if (!WeakRetained
      || (BOOL v21 = WeakRetained,
          id v22 = objc_loadWeakRetained((id *)(v6 + 16)),
          char v23 = v22[475],
          v22,
          v21,
          (v23 & 1) == 0))
    {
      id v24 = objc_loadWeakRetained(v19);
      if (v24)
      {
        BOOL v25 = objc_loadWeakRetained(v19);
        BOOL v26 = (v25[475] & 1) == 0;
      }

      else
      {
        BOOL v26 = 1;
      }

      BOOL v5 = 0LL;
      if (!v26 || !g_boringssl_log) {
        goto LABEL_23;
      }
      uint64_t v27 = (os_log_s *)(id)g_boringssl_log;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        boringssl_context_set_quic_transport_parameters_cold_1(v19, v27);
      }
    }

uint64_t boringssl_context_zlib_compress_data(const SSL *a1, uint64_t a2, uint64_t a3, uLong a4)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v7 = SSL_get_ex_data(a1, 0);
  if (!v7 || *(_DWORD *)v7 != -1252936367) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  if (a2)
  {
    uint64_t v9 = v7[1];
    if (v9)
    {
      *(_BYTE *)(v9 + 559) |= 0x40u;
      *(_WORD *)(v9 + 336) = 1;
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __boringssl_context_zlib_compress_data_block_invoke;
      _OWORD v11[3] = &__block_descriptor_48_e12_B24__0r_8Q16lu40l8;
      _OWORD v11[4] = a2;
      v11[5] = v9;
      return boringssl_helper_zlib_compress_data((void *)v9, a3, a4, v11);
    }
  }

  return v8;
}

uint64_t boringssl_context_zlib_uncompress_data(const SSL *a1, uint64_t *a2, size_t a3, char *a4, uint64_t a5)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v9 = SSL_get_ex_data(a1, 0);
  if (!v9 || *(_DWORD *)v9 != -1252936367) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  if (a3)
  {
    if (a2)
    {
      uint64_t v11 = v9[1];
      if (v11)
      {
        id v12 = malloc(a3);
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v38 = 0LL;
          __int16 v39 = &v38;
          uint64_t v40 = 0x2020000000LL;
          uint64_t v41 = 0LL;
          v37[0] = MEMORY[0x1895F87A8];
          v37[1] = 3221225472LL;
          _OWORD v37[2] = __boringssl_context_zlib_uncompress_data_block_invoke;
          _OWORD v37[3] = &unk_18A07BC78;
          v37[4] = &v38;
          v37[5] = a3;
          v37[6] = v11;
          v37[7] = v12;
          if ((boringssl_helper_zlib_decompress_data((void *)v11, (uint64_t)a4, a5, v37) & 1) != 0)
          {
            if (v39[3] == a3)
            {
              *a2 = CRYPTO_BUFFER_new(v13, a3, 0LL);
              free(v13);
              *(_BYTE *)(v11 + 559) |= 0x40u;
              uint64_t v10 = 1LL;
              *(_WORD *)(v11 + 336) = 1;
LABEL_40:
              _Block_object_dispose(&v38, 8);
              return v10;
            }

            id v22 = (id *)(v11 + 16);
            id WeakRetained = objc_loadWeakRetained((id *)(v11 + 16));
            if (!WeakRetained
              || (id v24 = objc_loadWeakRetained(v22),
                  BOOL v25 = (v24[475] & 1) == 0,
                  v24,
                  WeakRetained,
                  v25))
            {
              id v26 = objc_loadWeakRetained(v22);
              if (v26)
              {
                uint64_t v27 = objc_loadWeakRetained(v22);
                BOOL v28 = (v27[475] & 1) == 0;
              }

              else
              {
                BOOL v28 = 1;
              }

              if (g_boringssl_log && v28)
              {
                id v32 = (os_log_s *)(id)g_boringssl_log;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  id v33 = objc_loadWeakRetained(v22);
                  if (v33)
                  {
                    a4 = (char *)objc_loadWeakRetained(v22);
                    __int16 v34 = a4 + 391;
                  }

                  else
                  {
                    __int16 v34 = &unk_1875F4C23;
                  }

                  id v35 = objc_loadWeakRetained(v22);
                  uint64_t v36 = v39[3];
                  *(_DWORD *)buf = 136447490;
                  id v43 = "boringssl_context_zlib_uncompress_data";
                  __int16 v44 = 1024;
                  int v45 = 785;
                  __int16 v46 = 2082;
                  uint64_t v47 = v34;
                  __int16 v48 = 2048;
                  id v49 = v35;
                  __int16 v50 = 2048;
                  size_t v51 = a3;
                  __int16 v52 = 2048;
                  uint64_t v53 = v36;
                  _os_log_error_impl( &dword_187560000,  v32,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Incorrect uncompressed length. Expected %zu, got %zu",  buf,  0x3Au);

                  if (v33) {
                }
                  }
              }
            }
          }

          else
          {
            char v15 = (id *)(v11 + 16);
            id v16 = objc_loadWeakRetained((id *)(v11 + 16));
            if (!v16
              || (size_t v17 = objc_loadWeakRetained(v15), v18 = (v17[475] & 1) == 0, v17, v16, v18))
            {
              id v19 = objc_loadWeakRetained(v15);
              if (v19)
              {
                uint64_t v20 = objc_loadWeakRetained(v15);
                BOOL v21 = (v20[475] & 1) == 0;
              }

              else
              {
                BOOL v21 = 1;
              }

              if (g_boringssl_log && v21)
              {
                uint64_t v30 = (os_log_s *)(id)g_boringssl_log;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  boringssl_context_zlib_uncompress_data_cold_2(v15, v30);
                }
              }
            }
          }

          uint64_t v10 = 0LL;
          goto LABEL_40;
        }

        if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
          boringssl_context_zlib_uncompress_data_cold_1();
        }
        return 0LL;
      }
    }
  }

  return v10;
}

void sub_1875D4800( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t boringssl_context_enable_keylog(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)result == -1252936367)
    {
      uint64_t v1 = *(void *)(result + 8);
      if (v1)
      {
        uint64_t result = *(void *)(v1 + 408);
        if (result) {
          return SSL_CTX_set_keylog_callback(result, (uint64_t)boringssl_context_keylog_handler);
        }
      }
    }
  }

  return result;
}

#error "1875D4958: call analysis failed (funcsize=63)"
_DWORD *boringssl_context_set_raw_public_key_certificate(_DWORD *result, CFArrayRef theArray, int a3)
{
  _DWORD *v3;
  uint64_t v5;
  CFDataRef ValueAtIndex;
  unsigned int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  if (result)
  {
    uint64_t v3 = result;
    if (*result != -1252936367) {
      return 0LL;
    }
    uint64_t result = 0LL;
    if (!theArray) {
      return result;
    }
    BOOL v5 = *((void *)v3 + 1);
    if (!v5) {
      return result;
    }
    if (CFArrayGetCount(theArray) < 1) {
      return 0LL;
    }
    ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(theArray, 0LL);
    uint64_t result = (_DWORD *)CFDataGetLength(ValueAtIndex);
    if (result)
    {
      uint64_t v8 = result;
      uint64_t result = CFDataGetBytePtr(ValueAtIndex);
      if (result)
      {
        uint64_t v9 = (unsigned __int8 *)result;
        uint64_t v10 = *(void *)(v5 + 400);
        if (v10)
        {
          if (a3) {
            uint64_t v11 = SSL_use_server_raw_public_key_certificate(v10, v9, v8);
          }
          else {
            uint64_t v11 = SSL_use_client_raw_public_key_certificate(v10, v9, v8);
          }
        }

        else
        {
          id v12 = *(void *)(v5 + 408);
          if (a3) {
            uint64_t v11 = SSL_CTX_use_server_raw_public_key_certificate(v12, v9, v8);
          }
          else {
            uint64_t v11 = SSL_CTX_use_client_raw_public_key_certificate(v12, v9, v8);
          }
        }

        return (_DWORD *)(v11 == 1);
      }
    }
  }

  return result;
}

uint64_t boringssl_context_set_experiment_identifier(uint64_t result, char *__s1)
{
  if (result)
  {
    if (*(_DWORD *)result == -1252936367 && (uint64_t v2 = *(void *)(result + 8)) != 0)
    {
      uint64_t v4 = *(void **)(v2 + 96);
      if (v4)
      {
        free(v4);
        *(void *)(v2 + 96) = 0LL;
      }

      *(void *)(v2 + 96) = strdup(__s1);
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

CFArrayRef boringssl_context_copy_peer_sct_list_from_extension( void *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a1;
  uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (Mutable)
  {
    uint64_t v9 = Mutable;
    unint64_t v10 = a3 - 2;
    if (a3 == 2)
    {
LABEL_37:
      if (!CFArrayGetCount(v9)) {
        goto LABEL_72;
      }
      goto LABEL_74;
    }

    uint64_t v11 = (const UInt8 *)(a2 + 1);
    while (1)
    {
      unsigned int v13 = *(unsigned __int16 *)v11;
      id v12 = v11 + 2;
      CFIndex v14 = __rev16(v13);
      if (v10 < v14 + 2)
      {
        if (v6)
        {
          id WeakRetained = objc_loadWeakRetained(v6 + 2);
          if (WeakRetained)
          {
            __int16 v34 = WeakRetained;
            id v35 = objc_loadWeakRetained(v6 + 2);
            char v36 = v35[475];

            if ((v36 & 1) != 0) {
              goto LABEL_72;
            }
          }

          id v37 = objc_loadWeakRetained(v6 + 2);
          if (v37)
          {
            uint64_t v38 = objc_loadWeakRetained(v6 + 2);
            uint64_t v39 = (v38[475] & 1) == 0;
          }

          else
          {
            uint64_t v39 = 1LL;
          }
        }

        else
        {
          uint64_t v39 = 1LL;
        }

        if ((_DWORD)v39 && g_boringssl_log)
        {
          __int16 v48 = (os_log_s *)(id)g_boringssl_log;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            if (v6)
            {
              uint64_t v39 = (uint64_t)objc_loadWeakRetained(v6 + 2);
              BOOL v55 = v39 != 0;
              if (v39)
              {
                uint64_t v3 = (uint64_t)objc_loadWeakRetained(v6 + 2);
                id v57 = (void *)(v3 + 391);
              }

              else
              {
                id v57 = &unk_1875F4C23;
              }

              id v56 = objc_loadWeakRetained(v6 + 2);
            }

            else
            {
              BOOL v55 = 0;
              id v56 = 0LL;
              id v57 = &unk_1875F4C23;
            }

            *(_DWORD *)buf = 136446978;
            BOOL v64 = "boringssl_context_copy_peer_sct_list_from_extension";
            __int16 v65 = 1024;
            int v66 = 972;
            __int16 v67 = 2082;
            uint64_t v68 = v57;
            __int16 v69 = 2048;
            id v70 = v56;
            _os_log_error_impl( &dword_187560000,  v48,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Received incorrectly encoded SerializedSCT list",  buf,  0x26u);
            if (v6) {

            }
            if (v55) {
            if (v6)
            }
LABEL_107:
          }

uint64_t boringssl_context_select_alpn_callback( uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  *a3 = 0;
  if (a6)
  {
    if (*(_DWORD *)a6 == -1252936367)
    {
      uint64_t v6 = *(void *)(a6 + 8);
      if (v6)
      {
        boringssl_helper_create_protocol_list_from_encoded_list(a4, a5);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9) {
          boringssl_helper_find_first_overlapping_protocol(*(void **)(v6 + 64), v9, a2, a3);
        }
      }
    }
  }

  return 0LL;
}

uint64_t boringssl_context_set_alpn_data(uint64_t a1, size_t a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 == -1252936367)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    BOOL v5 = !v4 || a3 == 0;
    if (!v5 && a2 != 0)
    {
      uint64_t v7 = boringssl_helper_create_protocol_list_from_encoded_list(a3, a2);
      uint64_t v8 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = v7;

      uint64_t v9 = *(void **)(v4 + 64);
      if (v9) {
        return (boringssl_context_set_alpn_protocol_list(a1, v9, 0) - 1);
      }
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t boringssl_context_set_allow_unknown_alpn_protos(uint64_t a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2 || !*(void *)(v2 + 400)) {
    return 0xFFFFFFFFLL;
  }
  SSL_CTX_set_allow_unknown_alpn_protos(*(void *)(v2 + 408), a2);
  return 0LL;
}

uint64_t boringssl_context_set_client_auth(uint64_t a1, int a2)
{
  if (!a1 || *(_DWORD *)a1 != -1252936367 || !*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    int v2 = 3;
  }
  else {
    int v2 = 0;
  }
  return boringssl_context_set_verify_mode(a1, v2);
}

uint64_t boringssl_context_set_signed_cert_timestamp_list(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || *(_DWORD *)a1 != -1252936367) {
    goto LABEL_29;
  }
  uint64_t v5 = 0LL;
  if (!v3) {
    goto LABEL_30;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6) {
    goto LABEL_30;
  }
  size_t size = dispatch_data_get_size(v3);
  buffer_from_dispatch_data = boringssl_helper_create_buffer_from_dispatch_data(v4);
  if (buffer_from_dispatch_data)
  {
    uint64_t v9 = buffer_from_dispatch_data;
    uint64_t v10 = *(void *)(v6 + 400);
    if (v10)
    {
      if (SSL_set_signed_cert_timestamp_list(v10, v9, size))
      {
        uint64_t v5 = 1LL;
        goto LABEL_30;
      }

      id v19 = (id *)(v6 + 16);
      id WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
      if (!WeakRetained
        || (BOOL v21 = WeakRetained,
            id v22 = objc_loadWeakRetained(v19),
            char v23 = v22[475],
            v22,
            v21,
            (v23 & 1) == 0))
      {
        id v24 = objc_loadWeakRetained(v19);
        if (v24)
        {
          BOOL v25 = objc_loadWeakRetained(v19);
          BOOL v26 = (v25[475] & 1) == 0;
        }

        else
        {
          BOOL v26 = 1;
        }

        uint64_t v5 = 0LL;
        if (v26 && g_boringssl_log)
        {
          id v27 = (os_log_s *)(id)g_boringssl_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            boringssl_context_set_signed_cert_timestamp_list_cold_2(v19, v27);
          }
LABEL_28:

          goto LABEL_29;
        }

        goto LABEL_30;
      }
    }

    else
    {
      free(v9);
    }

uint64_t boringssl_context_set_ocsp_response(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(v2 + 400);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = (id *)(v2 + 16);
  id WeakRetained = objc_loadWeakRetained(v5);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    uint64_t v8 = objc_loadWeakRetained(v5);
    char v9 = v8[475];

    if ((v9 & 1) != 0) {
      return 0xFFFFFFFFLL;
    }
  }

  id v10 = objc_loadWeakRetained(v5);
  if (v10)
  {
    uint64_t v11 = objc_loadWeakRetained(v5);
    BOOL v12 = (v11[475] & 1) == 0;
  }

  else
  {
    BOOL v12 = 1;
  }

  uint64_t result = 0xFFFFFFFFLL;
  if (v12 && g_boringssl_log)
  {
    unsigned int v13 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      boringssl_context_set_ocsp_response_cold_1(v5, v13);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t boringssl_context_set_mtu(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(bssl **)(v2 + 400);
  if (!v3 || (*(_BYTE *)(v2 + 556) & 0x20) == 0) {
    return 0xFFFFFFFFLL;
  }
  return 0xFFFFFFFFLL;
}

uint64_t boringssl_context_process_trust_result(uint64_t a1, __SecTrust *a2, uint64_t a3)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (!v5) {
    return 0LL;
  }
  if ((*(_BYTE *)(v5 + 559) & 2) == 0) {
    goto LABEL_44;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
  if (!WeakRetained
    || (char v9 = WeakRetained,
        id v10 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v5 + 16)),
        CFTypeID v3 = v10[475],
        v10,
        v9,
        (v3 & 1) == 0))
  {
    id v11 = objc_loadWeakRetained((id *)(v5 + 16));
    if (v11)
    {
      BOOL v12 = objc_loadWeakRetained((id *)(v5 + 16));
      CFTypeID v3 = (v12[475] & 1) == 0;
    }

    else
    {
      CFTypeID v3 = 1LL;
    }

    if ((_DWORD)v3)
    {
      if (g_boringssl_log)
      {
        CFIndex v14 = (os_log_s *)(id)g_boringssl_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          CFTypeID v3 = (CFTypeID)objc_loadWeakRetained((id *)(v5 + 16));
          if (v3)
          {
            uint64_t v4 = (char *)objc_loadWeakRetained((id *)(v5 + 16));
            char v15 = v4 + 391;
          }

          else
          {
            char v15 = &unk_1875F4C23;
          }

          id v16 = objc_loadWeakRetained((id *)(v5 + 16));
          int v55 = 136446978;
          id v56 = "boringssl_context_process_trust_result";
          __int16 v57 = 1024;
          int v58 = 1520;
          __int16 v59 = 2082;
          BOOL v60 = v15;
          __int16 v61 = 2048;
          id v62 = v16;
          _os_log_impl( &dword_187560000,  v14,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] Applying EV constraint",  (uint8_t *)&v55,  0x26u);

          if (v3) {
        }
          }
      }
    }
  }

  CFDictionaryRef v17 = SecTrustCopyResult(a2);
  if (v17)
  {
    CFDictionaryRef v18 = v17;
    CFTypeID v19 = CFGetTypeID(v17);
    if (v19 == CFDictionaryGetTypeID()
      && (CFDataRef v20 = (const __CFBoolean *)CFDictionaryGetValue(v18, (const void *)*MEMORY[0x18960BE48])) != 0LL
      && (BOOL v21 = v20, v3 = CFGetTypeID(v20), v3 == CFBooleanGetTypeID()))
    {
      int Value = CFBooleanGetValue(v21);
      CFRelease(v18);
      if (Value)
      {
        id v23 = objc_loadWeakRetained((id *)(v5 + 16));
        if (!v23
          || (id v24 = v23,
              BOOL v25 = objc_loadWeakRetained((id *)(v5 + 16)),
              char v26 = v25[475],
              v25,
              v24,
              (v26 & 1) == 0))
        {
          id v27 = objc_loadWeakRetained((id *)(v5 + 16));
          if (v27)
          {
            BOOL v28 = objc_loadWeakRetained((id *)(v5 + 16));
            BOOL v29 = (v28[475] & 1) == 0;
          }

          else
          {
            BOOL v29 = 1;
          }

          if (v29)
          {
            if (g_boringssl_log)
            {
              id v37 = (os_log_s *)(id)g_boringssl_log;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                id v52 = objc_loadWeakRetained((id *)(v5 + 16));
                if (v52)
                {
                  CFTypeID v3 = (CFTypeID)objc_loadWeakRetained((id *)(v5 + 16));
                  id v53 = (void *)(v3 + 391);
                }

                else
                {
                  id v53 = &unk_1875F4C23;
                }

                id v54 = objc_loadWeakRetained((id *)(v5 + 16));
                int v55 = 136446978;
                id v56 = "boringssl_context_process_trust_result";
                __int16 v57 = 1024;
                int v58 = 1537;
                __int16 v59 = 2082;
                BOOL v60 = v53;
                __int16 v61 = 2048;
                id v62 = v54;
                _os_log_impl( &dword_187560000,  v37,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] EV constraint passed",  (uint8_t *)&v55,  0x26u);

                if (v52) {
              }
                }

LABEL_43:
              goto LABEL_44;
            }
          }
        }

        goto LABEL_44;
      }
    }

    else
    {
      CFRelease(v18);
    }
  }

  id v30 = objc_loadWeakRetained((id *)(v5 + 16));
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = objc_loadWeakRetained((id *)(v5 + 16));
    char v33 = v32[475];

    if ((v33 & 1) != 0)
    {
      a3 = 0LL;
      goto LABEL_44;
    }
  }

  id v34 = objc_loadWeakRetained((id *)(v5 + 16));
  if (v34)
  {
    id v35 = objc_loadWeakRetained((id *)(v5 + 16));
    BOOL v36 = (v35[475] & 1) == 0;
  }

  else
  {
    BOOL v36 = 1;
  }

  a3 = 0LL;
  if (v36 && g_boringssl_log)
  {
    id v37 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      boringssl_context_process_trust_result_cold_1(v5 + 16, v37);
    }
    a3 = 0LL;
    goto LABEL_43;
  }

id boringssl_context_copy_global_trust_queue_for_qos(void *a1)
{
  id v1 = a1;
  int scheduling_mode = nw_context_get_scheduling_mode();
  if (scheduling_mode == 1)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    __int128 v9[2] = __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_2;
    void v9[3] = &unk_18A070400;
    CFTypeID v3 = &v10;
    id v10 = v1;
    if (boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueueToken != -1) {
      dispatch_once(&boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueueToken, v9);
    }
    uint64_t v4 = &boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueue;
  }

  else if (scheduling_mode == 2)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __boringssl_context_copy_global_trust_queue_for_qos_block_invoke;
    block[3] = &unk_18A070400;
    CFTypeID v3 = &v12;
    id v12 = v1;
    if (boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueueToken != -1) {
      dispatch_once(&boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueueToken, block);
    }
    uint64_t v4 = &boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueue;
  }

  else
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_3;
    _OWORD v7[3] = &unk_18A070400;
    CFTypeID v3 = &v8;
    id v8 = v1;
    if (boringssl_context_copy_global_trust_queue_for_qos_defaultQueueToken != -1) {
      dispatch_once(&boringssl_context_copy_global_trust_queue_for_qos_defaultQueueToken, v7);
    }
    uint64_t v4 = &boringssl_context_copy_global_trust_queue_for_qos_defaultQueue;
  }

  id v5 = (id)*v4;

  return v5;
}

void __boringssl_context_copy_global_trust_queue_for_qos_block_invoke(uint64_t a1)
{
  queue_for_qounsigned int s = boringssl_context_create_queue_for_qos( *(void **)(a1 + 32),  "com.apple.network.boringssl.user_interactive_qos_trust_queue",  QOS_CLASS_USER_INTERACTIVE);
  uint64_t v2 = (void *)boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueue;
  boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueue = (uint64_t)queue_for_qos;
}

dispatch_queue_t boringssl_context_create_queue_for_qos(void *a1, const char *a2, dispatch_qos_class_t a3)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a1;
  dispatch_queue_attr_make_with_qos_class(0LL, a3, 0);
  id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v7) {
      goto LABEL_18;
    }
    id WeakRetained = objc_loadWeakRetained(v7 + 2);
    if (!WeakRetained
      || (id v12 = WeakRetained,
          unsigned int v13 = (unsigned __int8 *)objc_loadWeakRetained(v7 + 2),
          uint64_t v4 = (char *)v13[475],
          v13,
          v12,
          (v4 & 1) == 0))
    {
      id v3 = objc_loadWeakRetained(v7 + 2);
      if (v3)
      {
        CFIndex v14 = objc_loadWeakRetained(v7 + 2);
        BOOL v15 = (v14[475] & 1) == 0;
      }

      else
      {
        BOOL v15 = 1;
      }

      if (v15)
      {
LABEL_18:
        if (g_boringssl_log)
        {
          id v22 = (os_log_s *)(id)g_boringssl_log;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            if (v7)
            {
              id v3 = objc_loadWeakRetained(v7 + 2);
              BOOL v24 = v3 != 0LL;
              if (v3)
              {
                uint64_t v4 = (char *)objc_loadWeakRetained(v7 + 2);
                char v26 = v4 + 391;
              }

              else
              {
                char v26 = &unk_1875F4C23;
              }

              id v25 = objc_loadWeakRetained(v7 + 2);
            }

            else
            {
              BOOL v24 = 0;
              id v25 = 0LL;
              char v26 = &unk_1875F4C23;
            }

            *(_DWORD *)buf = 136447490;
            uint64_t v32 = "boringssl_context_create_queue_for_qos";
            __int16 v33 = 1024;
            int v34 = 1552;
            __int16 v35 = 2082;
            BOOL v36 = v26;
            __int16 v37 = 2048;
            id v38 = v25;
            __int16 v39 = 1024;
            *(_DWORD *)id v40 = a3;
            *(_WORD *)&_OWORD v40[4] = 2082;
            *(void *)&v40[6] = a2;
            _os_log_error_impl( &dword_187560000,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Failed to set the %u QoS class attribute for queue %{public}s.",  buf,  0x36u);
            if (v7) {

            }
            if (v24) {
            if (v7)
            }
          }
        }
      }
    }
  }

  dispatch_queue_t v9 = dispatch_queue_create(a2, v8);
  if (!v9)
  {
    if (!v7) {
      goto LABEL_23;
    }
    id v16 = objc_loadWeakRetained(v7 + 2);
    if (!v16
      || (CFDictionaryRef v17 = v16,
          CFDictionaryRef v18 = objc_loadWeakRetained(v7 + 2),
          char v19 = v18[475],
          v18,
          v17,
          (v19 & 1) == 0))
    {
      uint64_t v4 = (char *)objc_loadWeakRetained(v7 + 2);
      if (v4)
      {
        CFDataRef v20 = objc_loadWeakRetained(v7 + 2);
        BOOL v21 = (v20[475] & 1) == 0;
      }

      else
      {
        BOOL v21 = 1;
      }

      if (v21)
      {
LABEL_23:
        if (g_boringssl_log)
        {
          id v23 = (os_log_s *)(id)g_boringssl_log;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            if (v7)
            {
              uint64_t v4 = (char *)objc_loadWeakRetained(v7 + 2);
              BOOL v27 = v4 != 0LL;
              if (v4)
              {
                id v30 = (char *)objc_loadWeakRetained(v7 + 2);
                BOOL v29 = v30 + 391;
              }

              else
              {
                BOOL v29 = &unk_1875F4C23;
              }

              id v28 = objc_loadWeakRetained(v7 + 2);
            }

            else
            {
              BOOL v27 = 0;
              id v28 = 0LL;
              BOOL v29 = &unk_1875F4C23;
            }

            *(_DWORD *)buf = 136447490;
            uint64_t v32 = "boringssl_context_create_queue_for_qos";
            __int16 v33 = 1024;
            int v34 = 1556;
            __int16 v35 = 2082;
            BOOL v36 = v29;
            __int16 v37 = 2048;
            id v38 = v28;
            __int16 v39 = 2082;
            *(void *)id v40 = a2;
            *(_WORD *)&v40[8] = 1024;
            *(_DWORD *)&v40[10] = a3;
            _os_log_error_impl( &dword_187560000,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Failed to create queue %{public}s with QoS class %u.",  buf,  0x36u);
            if (v7) {

            }
            if (v27) {
            if (v7)
            }
          }
        }
      }
    }
  }

  return v9;
}

void __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_2(uint64_t a1)
{
  queue_for_qounsigned int s = boringssl_context_create_queue_for_qos( *(void **)(a1 + 32),  "com.apple.network.boringssl.user_initiated_qos_trust_queue",  QOS_CLASS_USER_INITIATED);
  uint64_t v2 = (void *)boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueue;
  boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueue = (uint64_t)queue_for_qos;
}

void __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_3(uint64_t a1)
{
  queue_for_qounsigned int s = boringssl_context_create_queue_for_qos( *(void **)(a1 + 32),  "com.apple.network.boringssl.unspecified_qos_trust_queue",  QOS_CLASS_UNSPECIFIED);
  uint64_t v2 = (void *)boringssl_context_copy_global_trust_queue_for_qos_defaultQueue;
  boringssl_context_copy_global_trust_queue_for_qos_defaultQueue = (uint64_t)queue_for_qos;
}

void boringssl_context_async(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (a1 && queue)
  {
    if (block)
    {
      ++*(void *)(a1 + 504);
      dispatch_async(queue, block);
    }
  }

BOOL boringssl_context_evaluate_trust_async_internal(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1 && *(_DWORD *)a1 == -1252936367)
  {
    BOOL v7 = 0LL;
    if (v5)
    {
      if (a2)
      {
        id v8 = *(id **)(a1 + 8);
        if (v8)
        {
          id v9 = boringssl_context_copy_global_trust_queue_for_qos(*(void **)(a1 + 8));
          BOOL v7 = v9 != 0LL;
          if (v9)
          {
            id v10 = v8;
            v35[0] = MEMORY[0x1895F87A8];
            v35[1] = 3221225472LL;
            v35[2] = __boringssl_context_evaluate_trust_async_internal_block_invoke;
            v35[3] = &unk_18A07BA80;
            uint64_t v39 = a1;
            id v40 = v10;
            id v11 = v10;
            BOOL v36 = v11;
            id v38 = v6;
            uint64_t v41 = a2;
            id v12 = (dispatch_queue_s *)v9;
            __int16 v37 = v12;
            unsigned int v13 = (void *)MEMORY[0x1895A97C0](v35);
            *((_BYTE *)v11 + 558) |= 8u;
            id WeakRetained = objc_loadWeakRetained(v11 + 2);
            if (!WeakRetained
              || (BOOL v15 = WeakRetained,
                  id v16 = objc_loadWeakRetained(v11 + 2),
                  char v17 = v16[475],
                  v16,
                  v15,
                  (v17 & 1) == 0))
            {
              id v18 = objc_loadWeakRetained(v11 + 2);
              if (v18)
              {
                char v19 = objc_loadWeakRetained(v11 + 2);
                BOOL v20 = (v19[475] & 1) == 0;
              }

              else
              {
                BOOL v20 = 1;
              }

              if (v20)
              {
                if (g_boringssl_log)
                {
                  id v30 = (os_log_s *)(id)g_boringssl_log;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    id v31 = objc_loadWeakRetained(v11 + 2);
                    if (v31)
                    {
                      int v34 = (char *)objc_loadWeakRetained(v11 + 2);
                      uint64_t v32 = v34 + 391;
                    }

                    else
                    {
                      uint64_t v32 = &unk_1875F4C23;
                    }

                    id v33 = objc_loadWeakRetained(v11 + 2);
                    *(_DWORD *)buf = 136446978;
                    char v43 = "boringssl_context_evaluate_trust_async_internal";
                    __int16 v44 = 1024;
                    int v45 = 1660;
                    __int16 v46 = 2082;
                    int v47 = v32;
                    __int16 v48 = 2048;
                    id v49 = v33;
                    _os_log_impl( &dword_187560000,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s(%d) %{public}s[%p] Asyncing for internal verify block",  buf,  0x26u);

                    if (v31) {
                  }
                    }
                }
              }
            }

            if (v13)
            {
              v11[63] = (char *)v11[63] + 1;
              dispatch_async(v12, v13);
            }
          }

          else
          {
            id v22 = v8 + 2;
            id v23 = objc_loadWeakRetained(v8 + 2);
            if (v23)
            {
              BOOL v24 = v23;
              id v25 = objc_loadWeakRetained(v22);
              char v26 = v25[475];

              if ((v26 & 1) != 0) {
                goto LABEL_37;
              }
            }

            id v27 = objc_loadWeakRetained(v22);
            if (v27)
            {
              id v28 = objc_loadWeakRetained(v22);
              BOOL v29 = (v28[475] & 1) == 0;
            }

            else
            {
              BOOL v29 = 1;
            }

            if (!v29 || !g_boringssl_log) {
              goto LABEL_37;
            }
            id v11 = (id *)(id)g_boringssl_log;
            if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
              boringssl_context_evaluate_trust_async_internal_cold_1(v22, v11);
            }
          }

LABEL_37:
        }
      }
    }
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

void __boringssl_context_evaluate_trust_async_internal_block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (boringssl_session_get_state(*(void *)(a1 + 56)) > 3
    || boringssl_session_is_cancelled(*(void *)(a1 + 56)))
  {
    *(_BYTE *)(*(void *)(a1 + 64) + 558LL) &= ~8u;
    return;
  }

  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = __boringssl_context_evaluate_trust_async_internal_block_invoke_2;
  v44[3] = &unk_18A07BA30;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  id v45 = v2;
  uint64_t v47 = v3;
  __int128 v41 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v41;
  __int128 v46 = v41;
  id v5 = (void *)MEMORY[0x1895A97C0](v44);
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6) {
    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
  if (!WeakRetained
    || (id v8 = WeakRetained,
        id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL)),
        char v10 = v9[475],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (!v11) {
      goto LABEL_13;
    }
    id v12 = objc_loadWeakRetained((id *)(v11 + 16));
    if (v12)
    {
      unsigned int v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
      BOOL v14 = (v13[475] & 1) == 0;
    }

    else
    {
      BOOL v14 = 1;
    }

    if (v14)
    {
LABEL_13:
      if (g_boringssl_log)
      {
        BOOL v15 = (os_log_s *)(id)g_boringssl_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          if (v26)
          {
            __int16 v35 = (char *)objc_loadWeakRetained((id *)(v26 + 16));
            uint64_t v36 = *(void *)(a1 + 32);
            id v40 = v35;
            if (v35)
            {
              LODWORD(v41) = v36 != 0;
              if (v36)
              {
                __int16 v35 = (char *)objc_loadWeakRetained((id *)(v36 + 16));
                uint64_t v36 = *(void *)(a1 + 32);
              }

              else
              {
                __int16 v35 = 0LL;
              }

              BOOL v29 = v35 + 391;
            }

            else
            {
              LODWORD(v41) = 0;
              BOOL v29 = &unk_1875F4C23;
            }

            uint64_t v39 = v35;
            if (v36)
            {
              id v27 = objc_loadWeakRetained((id *)(v36 + 16));
              char v28 = 0;
            }

            else
            {
              id v27 = 0LL;
              char v28 = 1;
            }
          }

          else
          {
            LODWORD(v41) = 0;
            id v27 = 0LL;
            char v28 = 1;
            BOOL v29 = &unk_1875F4C23;
          }

          *(_DWORD *)buf = 136446978;
          id v49 = "boringssl_context_evaluate_trust_async_internal_block_invoke_2";
          __int16 v50 = 1024;
          int v51 = 1647;
          __int16 v52 = 2082;
          id v53 = v29;
          __int16 v54 = 2048;
          id v55 = v27;
          _os_log_debug_impl( &dword_187560000,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s(%d) %{public}s[%p] Invoking SecTrustEvaluateAsyncWithError",  buf,  0x26u);
          if ((v28 & 1) == 0) {

          }
          if ((_DWORD)v41) {
          if (v26)
          }
        }
      }
    }
  }

  if (SecTrustEvaluateAsyncWithError(*(SecTrustRef *)(a1 + 72), *(dispatch_queue_t *)(a1 + 40), v5))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)(v16 + 16));
      if (v17)
      {
        id v18 = v17;
        char v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
        char v20 = v19[475];

        if ((v20 & 1) != 0) {
          goto LABEL_29;
        }
      }

      uint64_t v21 = *(void *)(a1 + 32);
      if (v21)
      {
        id v22 = objc_loadWeakRetained((id *)(v21 + 16));
        if (v22)
        {
          id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
          BOOL v24 = (v23[475] & 1) == 0;
        }

        else
        {
          BOOL v24 = 1;
        }

        if (!v24) {
          goto LABEL_29;
        }
      }
    }

    if (!g_boringssl_log) {
      goto LABEL_29;
    }
    id v25 = (id)g_boringssl_log;
    if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

LABEL_29:
      id v42 = *(id *)(a1 + 32);
      id v43 = *(id *)(a1 + 48);
      nw_queue_context_async_if_needed();

      goto LABEL_30;
    }

    uint64_t v30 = *(void *)(a1 + 32);
    if (v30)
    {
      __int16 v37 = (char *)objc_loadWeakRetained((id *)(v30 + 16));
      uint64_t v38 = *(void *)(a1 + 32);
      *(void *)&__int128 v41 = v37;
      if (v37)
      {
        BOOL v31 = v38 != 0;
        if (v38)
        {
          __int16 v37 = (char *)objc_loadWeakRetained((id *)(v38 + 16));
          uint64_t v38 = *(void *)(a1 + 32);
        }

        else
        {
          __int16 v37 = 0LL;
        }

        int v34 = v37 + 391;
      }

      else
      {
        BOOL v31 = 0;
        int v34 = &unk_1875F4C23;
      }

      id v40 = v37;
      if (v38)
      {
        id v32 = objc_loadWeakRetained((id *)(v38 + 16));
        char v33 = 0;
      }

      else
      {
        id v32 = 0LL;
        char v33 = 1;
      }
    }

    else
    {
      BOOL v31 = 0;
      id v32 = 0LL;
      char v33 = 1;
      int v34 = &unk_1875F4C23;
    }

    *(_DWORD *)buf = 136446978;
    id v49 = "boringssl_context_evaluate_trust_async_internal_block_invoke";
    __int16 v50 = 1024;
    int v51 = 1650;
    __int16 v52 = 2082;
    id v53 = v34;
    __int16 v54 = 2048;
    id v55 = v32;
    _os_log_error_impl( &dword_187560000,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] SecTrustEvaluateAsyncWithError failed",  buf,  0x26u);
    if ((v33 & 1) != 0)
    {
      if (!v31) {
        goto LABEL_61;
      }
    }

    else
    {

      if (!v31)
      {
LABEL_61:
        if (!v30) {
          goto LABEL_28;
        }
        goto LABEL_65;
      }
    }

    if (!v30) {
      goto LABEL_28;
    }
LABEL_65:

    goto LABEL_28;
  }

void __boringssl_context_evaluate_trust_async_internal_block_invoke_2( uint64_t a1, uint64_t a2, int a3, __CFError *a4)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7) {
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
  if (!WeakRetained
    || (id v9 = WeakRetained,
        char v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL)),
        char v11 = v10[475],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (!v12) {
      goto LABEL_10;
    }
    id v13 = objc_loadWeakRetained((id *)(v12 + 16));
    if (v13)
    {
      BOOL v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
      BOOL v15 = (v14[475] & 1) == 0;
    }

    else
    {
      BOOL v15 = 1;
    }

    if (v15)
    {
LABEL_10:
      if (g_boringssl_log)
      {
        uint64_t v16 = (os_log_s *)(id)g_boringssl_log;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        uint64_t v17 = *(void *)(a1 + 32);
        if (v17)
        {
          id v18 = (char *)objc_loadWeakRetained((id *)(v17 + 16));
          uint64_t v19 = *(void *)(a1 + 32);
          id v25 = v18;
          if (v18)
          {
            BOOL v20 = v19 != 0;
            if (v19)
            {
              id v18 = (char *)objc_loadWeakRetained((id *)(v19 + 16));
              uint64_t v19 = *(void *)(a1 + 32);
            }

            else
            {
              id v18 = 0LL;
            }

            id v23 = v18 + 391;
          }

          else
          {
            BOOL v20 = 0;
            id v23 = &unk_1875F4C23;
          }

          BOOL v24 = v18;
          if (v19)
          {
            id v21 = objc_loadWeakRetained((id *)(v19 + 16));
            char v22 = 0;
          }

          else
          {
            id v21 = 0LL;
            char v22 = 1;
          }
        }

        else
        {
          BOOL v20 = 0;
          id v21 = 0LL;
          char v22 = 1;
          id v23 = &unk_1875F4C23;
        }

        *(_DWORD *)buf = 136447490;
        BOOL v29 = "boringssl_context_evaluate_trust_async_internal_block_invoke_2";
        __int16 v30 = 1024;
        int v31 = 1633;
        __int16 v32 = 2082;
        char v33 = v23;
        __int16 v34 = 2048;
        id v35 = v21;
        __int16 v36 = 1024;
        int v37 = a3;
        __int16 v38 = 2114;
        uint64_t v39 = a4;
        _os_log_impl( &dword_187560000,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s(%d) %{public}s[%p] Returning from internal verify block with result: %{BOOL}d (%{public}@)",  buf,  0x36u);
        if ((v22 & 1) != 0)
        {
          if (!v20) {
            goto LABEL_25;
          }
        }

        else
        {

          if (!v20)
          {
LABEL_25:
            if (v17) {
LABEL_26:
            }

LABEL_27:
            goto LABEL_28;
          }
        }

        if (!v17) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
  }

uint64_t __boringssl_context_evaluate_trust_async_internal_block_invoke_195(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 559LL) |= 0x10u;
  *(_BYTE *)(*(void *)(a1 + 48) + 558LL) &= ~8u;
  boringssl_context_process_trust_result(*(void *)(a1 + 56), *(__SecTrust **)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __boringssl_context_evaluate_trust_async_internal_block_invoke_199(void *a1)
{
  *(_BYTE *)(a1[4] + 559LL) |= 0x10u;
  *(_BYTE *)(a1[6] + 558LL) &= ~8u;
  return (*(uint64_t (**)(void))(a1[5] + 16LL))();
}

uint64_t __boringssl_context_evaluate_trust_async_external_block_invoke_203(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 40) + 558LL) &= ~8u;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t boringssl_context_certificate_request_callback(uint64_t a1, uint64_t a2)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 0LL;
  }
  if (*(_DWORD *)a2 != -1252936367) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4) {
    return 0LL;
  }
  *(_BYTE *)(v4 + 558) |= 0x10u;
  if ((*(_BYTE *)(v4 + 557) & 4) == 0)
  {
    if (*(void *)(v4 + 104))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 16));
      if (!WeakRetained
        || (uint64_t v6 = WeakRetained,
            uint64_t v7 = objc_loadWeakRetained((id *)(v4 + 16)),
            char v8 = v7[475],
            v7,
            v6,
            (v8 & 1) == 0))
      {
        id v9 = objc_loadWeakRetained((id *)(v4 + 16));
        if (v9)
        {
          char v10 = objc_loadWeakRetained((id *)(v4 + 16));
          BOOL v11 = (v10[475] & 1) == 0;
        }

        else
        {
          BOOL v11 = 1;
        }

        if (v11)
        {
          if (g_boringssl_log)
          {
            char v33 = (os_log_s *)(id)g_boringssl_log;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              boringssl_context_certificate_request_callback_cold_1(v4 + 16, v33);
            }
          }
        }
      }

      *(_BYTE *)(v4 + 557) |= 4u;
      return 1LL;
    }

    if (*(_DWORD *)a2 == -1252936367)
    {
      uint64_t v21 = *(void *)(a2 + 8);
      if (v21)
      {
        if (*(void *)(v21 + 136) && *(void *)(v21 + 144) && (*(_BYTE *)(v21 + 559) & 4) == 0)
        {
          boringssl_session_update_metadata(a2);
          char v22 = (void *)MEMORY[0x1895A97C0](*(void *)(v4 + 136));
          id v23 = (char *)(id)v4;
          BOOL v24 = (id *)(v23 + 16);
          id v25 = objc_loadWeakRetained((id *)v23 + 2);
          if (!v25
            || (id v26 = v25,
                id v27 = objc_loadWeakRetained(v24),
                char v28 = v27[475],
                v27,
                v26,
                (v28 & 1) == 0))
          {
            id v29 = objc_loadWeakRetained(v24);
            if (v29)
            {
              __int16 v30 = objc_loadWeakRetained(v24);
              BOOL v31 = (v30[475] & 1) == 0;
            }

            else
            {
              BOOL v31 = 1;
            }

            if (v31)
            {
              if (g_boringssl_log)
              {
                __int16 v34 = (os_log_s *)(id)g_boringssl_log;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  id v35 = objc_loadWeakRetained(v24);
                  if (v35)
                  {
                    id v2 = (char *)objc_loadWeakRetained(v24);
                    __int16 v36 = v2 + 391;
                  }

                  else
                  {
                    __int16 v36 = &unk_1875F4C23;
                  }

                  id v37 = objc_loadWeakRetained(v24);
                  *(_DWORD *)buf = 136446978;
                  __int16 v48 = "boringssl_context_certificate_request_callback";
                  __int16 v49 = 1024;
                  int v50 = 1835;
                  __int16 v51 = 2082;
                  __int16 v52 = v36;
                  __int16 v53 = 2048;
                  id v54 = v37;
                  _os_log_impl( &dword_187560000,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}s(%d) %{public}s[%p] Asyncing for challenge block",  buf,  0x26u);

                  if (v35) {
                }
                  }
              }
            }
          }

          __int16 v38 = (dispatch_queue_s *)*((void *)v23 + 18);
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __boringssl_context_certificate_request_callback_block_invoke;
          block[3] = &unk_18A07BB98;
          uint64_t v46 = a2;
          id v39 = v22;
          id v45 = v39;
          uint64_t v40 = v23;
          __int128 v41 = v40;
          __int16 v44 = v40;
          id v42 = v40;
          if (v38)
          {
            ++*((void *)v40 + 63);
            dispatch_async(v38, block);
            id v42 = v44;
          }

          return 0xFFFFFFFFLL;
        }
      }
    }

    return 1LL;
  }

  id v13 = (id *)(v4 + 16);
  id v14 = objc_loadWeakRetained((id *)(v4 + 16));
  if (v14)
  {
    BOOL v15 = v14;
    uint64_t v16 = objc_loadWeakRetained((id *)(v4 + 16));
    char v17 = v16[475];

    if ((v17 & 1) != 0) {
      return 1LL;
    }
  }

  id v18 = objc_loadWeakRetained(v13);
  if (v18)
  {
    uint64_t v19 = objc_loadWeakRetained(v13);
    BOOL v20 = (v19[475] & 1) == 0;
  }

  else
  {
    BOOL v20 = 1;
  }

  uint64_t result = 1LL;
  if (v20 && g_boringssl_log)
  {
    __int16 v32 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      boringssl_context_certificate_request_callback_cold_2(v13, v32);
    }

    return 1LL;
  }

  return result;
}

void __boringssl_context_certificate_request_callback_block_invoke(void *a1)
{
  if (boringssl_session_get_state(a1[6]) <= 3 && (boringssl_session_is_cancelled(a1[6]) & 1) == 0)
  {
    id v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = v2[65];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __boringssl_context_certificate_request_callback_block_invoke_2;
    _OWORD v7[3] = &unk_18A07BB70;
    id v5 = v2;
    uint64_t v6 = a1[6];
    id v8 = v5;
    uint64_t v9 = v6;
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v7);
  }

void __boringssl_context_certificate_request_callback_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = v3;
  id v4 = v3;
  nw_queue_context_async_if_needed();
}

void __boringssl_context_certificate_request_callback_block_invoke_3(void *a1)
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  if (boringssl_session_get_state(a1[6]) <= 3 && (boringssl_session_is_cancelled(a1[6]) & 1) == 0)
  {
    uint64_t v12 = a1[4];
    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v12 + 16));
      if (WeakRetained)
      {
        id v14 = WeakRetained;
        BOOL v15 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
        char v16 = v15[475];

        if ((v16 & 1) != 0) {
          goto LABEL_58;
        }
      }

      uint64_t v17 = a1[4];
      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)(v17 + 16));
        if (v18)
        {
          uint64_t v19 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
          uint64_t v20 = (v19[475] & 1) == 0;
        }

        else
        {
          uint64_t v20 = 1LL;
        }

        if ((_DWORD)v20)
        {
LABEL_30:
          if (!g_boringssl_log) {
            goto LABEL_58;
          }
          char v28 = (os_log_s *)(id)g_boringssl_log;
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_57;
          }
          uint64_t v29 = a1[4];
          if (v29)
          {
            uint64_t v20 = (uint64_t)objc_loadWeakRetained((id *)(v29 + 16));
            uint64_t v30 = a1[4];
            if (v20)
            {
              BOOL v31 = v30 != 0;
              if (v30)
              {
                id v1 = (char *)objc_loadWeakRetained((id *)(v30 + 16));
                uint64_t v30 = a1[4];
              }

              else
              {
                id v1 = 0LL;
              }

              __int16 v34 = v1 + 391;
            }

            else
            {
              BOOL v31 = 0;
              __int16 v34 = &unk_1875F4C23;
            }

            if (v30)
            {
              id v32 = objc_loadWeakRetained((id *)(v30 + 16));
              char v33 = 0;
            }

            else
            {
              id v32 = 0LL;
              char v33 = 1;
            }
          }

          else
          {
            BOOL v31 = 0;
            id v32 = 0LL;
            char v33 = 1;
            __int16 v34 = &unk_1875F4C23;
          }

          int v55 = 136446978;
          uint64_t v56 = "boringssl_context_certificate_request_callback_block_invoke_3";
          __int16 v57 = 1024;
          int v58 = 1844;
          __int16 v59 = 2082;
          BOOL v60 = v34;
          __int16 v61 = 2048;
          id v62 = v32;
          _os_log_impl( &dword_187560000,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}s(%d) %{public}s[%p] Returning from challenge block",  (uint8_t *)&v55,  0x26u);
          if ((v33 & 1) != 0)
          {
            if (!v31) {
              goto LABEL_55;
            }
          }

          else
          {

            if (!v31)
            {
LABEL_55:
              if (!v29)
              {
LABEL_57:

                goto LABEL_58;
              }

LABEL_58:
        id v35 = (void *)a1[5];
        if (v35)
        {
          char v36 = boringssl_context_set_identity(a1[6], v35);
          uint64_t v37 = a1[4];
          if ((v36 & 1) == 0)
          {
            if (!v37) {
              goto LABEL_68;
            }
            id v38 = objc_loadWeakRetained((id *)(v37 + 16));
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
              char v41 = v40[475];

              if ((v41 & 1) != 0) {
                goto LABEL_77;
              }
            }

            uint64_t v42 = a1[4];
            if (v42)
            {
              id v43 = objc_loadWeakRetained((id *)(v42 + 16));
              if (v43)
              {
                __int16 v44 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
                uint64_t v45 = (v44[475] & 1) == 0;
              }

              else
              {
                uint64_t v45 = 1LL;
              }

              if (!(_DWORD)v45) {
                goto LABEL_77;
              }
            }

            else
            {
LABEL_68:
              uint64_t v45 = 1LL;
            }

            if (!g_boringssl_log)
            {
LABEL_77:
              uint64_t v47 = a1[4];
              uint64_t v48 = *(void *)(v47 + 280);
              id v21 = objc_loadWeakRetained((id *)(v47 + 16));
              (*(void (**)(uint64_t, id, void, uint64_t))(v48 + 16))(v48, v21, 0LL, 4294957486LL);
              goto LABEL_78;
            }

            id v46 = (id)g_boringssl_log;
            if (!os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
            {
LABEL_76:

              goto LABEL_77;
            }

            uint64_t v49 = a1[4];
            if (v49)
            {
              uint64_t v45 = (uint64_t)objc_loadWeakRetained((id *)(v49 + 16));
              uint64_t v54 = a1[4];
              if (v45)
              {
                BOOL v50 = v54 != 0;
                if (v54)
                {
                  id v1 = (char *)objc_loadWeakRetained((id *)(v54 + 16));
                  uint64_t v54 = a1[4];
                }

                else
                {
                  id v1 = 0LL;
                }

                __int16 v53 = v1 + 391;
              }

              else
              {
                BOOL v50 = 0;
                __int16 v53 = &unk_1875F4C23;
              }

              if (v54)
              {
                id v51 = objc_loadWeakRetained((id *)(v54 + 16));
                char v52 = 0;
              }

              else
              {
                id v51 = 0LL;
                char v52 = 1;
              }
            }

            else
            {
              BOOL v50 = 0;
              id v51 = 0LL;
              char v52 = 1;
              __int16 v53 = &unk_1875F4C23;
            }

            int v55 = 136446978;
            uint64_t v56 = "boringssl_context_certificate_request_callback_block_invoke";
            __int16 v57 = 1024;
            int v58 = 1847;
            __int16 v59 = 2082;
            BOOL v60 = v53;
            __int16 v61 = 2048;
            id v62 = v51;
            _os_log_error_impl( &dword_187560000,  (os_log_t)v46,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] boringssl_context_set_identity failed",  (uint8_t *)&v55,  0x26u);
            if ((v52 & 1) != 0)
            {
              if (!v50) {
                goto LABEL_93;
              }
            }

            else
            {

              if (!v50)
              {
LABEL_93:
                if (!v49) {
                  goto LABEL_76;
                }
                goto LABEL_97;
              }
            }

            if (!v49) {
              goto LABEL_76;
            }
LABEL_97:

            goto LABEL_76;
          }
        }

        else
        {
          uint64_t v37 = a1[4];
        }

        *(_BYTE *)(v37 + 557) |= 4u;
        id v21 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
        nw_protocol_boringssl_handshake_negotiate(v21);
        goto LABEL_78;
      }
    }

    uint64_t v20 = 1LL;
    goto LABEL_30;
  }

  uint64_t v3 = a1[4];
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = objc_loadWeakRetained((id *)(v3 + 16));
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
    char v7 = v6[475];

    if ((v7 & 1) != 0) {
      return;
    }
  }

  uint64_t v8 = a1[4];
  if (!v8)
  {
LABEL_9:
    uint64_t v11 = 1LL;
    goto LABEL_19;
  }

  id v9 = objc_loadWeakRetained((id *)(v8 + 16));
  if (v9)
  {
    char v10 = objc_loadWeakRetained((id *)(a1[4] + 16LL));
    uint64_t v11 = (v10[475] & 1) == 0;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  if ((_DWORD)v11)
  {
LABEL_19:
    if (!g_boringssl_log) {
      return;
    }
    id v21 = (id)g_boringssl_log;
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_78;
    }
    uint64_t v22 = a1[4];
    if (!v22)
    {
      BOOL v24 = 0;
      id v25 = 0LL;
      char v26 = 1;
      id v27 = &unk_1875F4C23;
      goto LABEL_39;
    }

    uint64_t v11 = (uint64_t)objc_loadWeakRetained((id *)(v22 + 16));
    uint64_t v23 = a1[4];
    if (v11)
    {
      BOOL v24 = v23 != 0;
      if (v23)
      {
        id v1 = (char *)objc_loadWeakRetained((id *)(v23 + 16));
        uint64_t v23 = a1[4];
      }

      else
      {
        id v1 = 0LL;
      }

      id v27 = v1 + 391;
      if (v23) {
        goto LABEL_38;
      }
    }

    else
    {
      BOOL v24 = 0;
      id v27 = &unk_1875F4C23;
      if (v23)
      {
LABEL_38:
        id v25 = objc_loadWeakRetained((id *)(v23 + 16));
        char v26 = 0;
LABEL_39:
        int v55 = 136446978;
        uint64_t v56 = "boringssl_context_certificate_request_callback_block_invoke";
        __int16 v57 = 1024;
        int v58 = 1854;
        __int16 v59 = 2082;
        BOOL v60 = v27;
        __int16 v61 = 2048;
        id v62 = v25;
        _os_log_impl( &dword_187560000,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s(%d) %{public}s[%p] Cancelled during challenge block",  (uint8_t *)&v55,  0x26u);
        if ((v26 & 1) != 0)
        {
          if (!v24) {
            goto LABEL_41;
          }
        }

        else
        {

          if (!v24)
          {
LABEL_41:
            if (!v22) {
              goto LABEL_78;
            }
            goto LABEL_45;
          }
        }

        if (!v22)
        {
LABEL_78:

          return;
        }

uint64_t boringssl_context_set_identity(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1) {
    goto LABEL_17;
  }
  if (*(_DWORD *)a1 != -1252936367 || (uint64_t v5 = *(void *)(a1 + 8)) == 0)
  {
LABEL_16:
    a1 = 0LL;
    goto LABEL_17;
  }

  if (!SSL_has_server_raw_public_key_certificate(*(void *)(v5 + 400)))
  {
    uint64_t v17 = boringssl_identity_create_from_identity(v4);
    id v18 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v17;

    uint64_t v19 = *(void **)(v5 + 104);
    if (v19)
    {
      a1 = boringssl_context_install_identity(a1, v19);
      goto LABEL_17;
    }

    goto LABEL_16;
  }

  id v6 = v4;
  char v7 = v6;
  if (*(_DWORD *)a1 == -1252936367
    && (uint64_t v8 = *(void *)(a1 + 8)) != 0
    && (SecIdentityRef v9 = boringssl_identity_create_from_identity_without_certificates(v6),
        char v10 = *(void **)(v8 + 104),
        *(void *)(v8 + 104) = v9,
        v10,
        *(void *)(v8 + 104)))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
    if (!WeakRetained
      || (uint64_t v12 = WeakRetained,
          id v13 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v8 + 16)),
          id v2 = (char *)v13[475],
          v13,
          v12,
          (v2 & 1) == 0))
    {
      id v14 = objc_loadWeakRetained((id *)(v8 + 16));
      if (v14)
      {
        BOOL v15 = objc_loadWeakRetained((id *)(v8 + 16));
        BOOL v16 = (v15[475] & 1) == 0;
      }

      else
      {
        BOOL v16 = 1;
      }

      if (v16)
      {
        if (g_boringssl_log)
        {
          id v21 = (os_log_s *)(id)g_boringssl_log;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = objc_loadWeakRetained((id *)(v8 + 16));
            if (v22)
            {
              id v2 = (char *)objc_loadWeakRetained((id *)(v8 + 16));
              uint64_t v23 = v2 + 391;
            }

            else
            {
              uint64_t v23 = &unk_1875F4C23;
            }

            id v24 = objc_loadWeakRetained((id *)(v8 + 16));
            int v25 = 136446978;
            char v26 = "boringssl_context_set_identity_without_certificates";
            __int16 v27 = 1024;
            int v28 = 2055;
            __int16 v29 = 2082;
            uint64_t v30 = v23;
            __int16 v31 = 2048;
            id v32 = v24;
            _os_log_impl( &dword_187560000,  v21,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] Calling SSL_set_private_key_method",  (uint8_t *)&v25,  0x26u);

            if (v22) {
          }
            }
        }
      }
    }

    SSL_set_private_key_method(*(void *)(v8 + 400), (uint64_t)g_boringssl_private_key_methods);
    a1 = 1LL;
  }

  else
  {
    a1 = 0LL;
  }

LABEL_17:
  return a1;
}

uint64_t boringssl_context_set_identity_from_array(uint64_t a1, const __CFArray *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4)
    {
      if (*(void *)(v4 + 400))
      {
        uint64_t v5 = boringssl_identity_create_from_identity_array(a2);
        id v6 = *(void **)(v4 + 104);
        *(void *)(v4 + 104) = v5;

        char v7 = *(void **)(v4 + 104);
        if (v7) {
          return (boringssl_context_install_identity(a1, v7) - 1);
        }
        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

BOOL boringssl_context_install_identity(uint64_t a1, void *a2)
{
  v71[2] = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (*(_DWORD *)a1 != -1252936367) {
    goto LABEL_39;
  }
  BOOL v5 = 0LL;
  if (!v3) {
    goto LABEL_40;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6) {
    goto LABEL_40;
  }
  if (!*(void *)(v6 + 400))
  {
LABEL_39:
    BOOL v5 = 0LL;
    goto LABEL_40;
  }

  char v7 = boringssl_identity_copy_certificate_chain(v3);
  certificate_buffer_chain_from_certificate_chaiunsigned int n = (EVP_MD_CTX *)boringssl_helper_create_certificate_buffer_chain_from_certificate_chain(v7);

  if (!certificate_buffer_chain_from_certificate_chain)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
    if (WeakRetained)
    {
      id v22 = WeakRetained;
      uint64_t v23 = objc_loadWeakRetained((id *)(v6 + 16));
      char v24 = v23[475];

      if ((v24 & 1) != 0) {
        goto LABEL_39;
      }
    }

    id v25 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v25)
    {
      char v26 = objc_loadWeakRetained((id *)(v6 + 16));
      BOOL v27 = (v26[475] & 1) == 0;
    }

    else
    {
      BOOL v27 = 1;
    }

    BOOL v5 = 0LL;
    if (!v27 || !g_boringssl_log) {
      goto LABEL_40;
    }
    id v38 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      boringssl_context_install_identity_cold_1(v6 + 16, v38);
    }
LABEL_38:

    goto LABEL_39;
  }

  SecIdentityRef v9 = EVP_MD_CTX_md(certificate_buffer_chain_from_certificate_chain);
  char v10 = (uint64_t *)malloc(8LL * (void)v9);
  if (!v10)
  {
    OPENSSL_sk_pop_free_ex( (unint64_t *)certificate_buffer_chain_from_certificate_chain,  (void (*)(uint64_t))sk_CRYPTO_BUFFER_call_free_func_0,  (uint64_t)CRYPTO_BUFFER_free);
    id v28 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v28)
    {
      __int16 v29 = v28;
      uint64_t v30 = objc_loadWeakRetained((id *)(v6 + 16));
      char v31 = v30[475];

      if ((v31 & 1) != 0) {
        goto LABEL_39;
      }
    }

    id v32 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v32)
    {
      uint64_t v33 = objc_loadWeakRetained((id *)(v6 + 16));
      BOOL v34 = (v33[475] & 1) == 0;
    }

    else
    {
      BOOL v34 = 1;
    }

    BOOL v5 = 0LL;
    if (!v34 || !g_boringssl_log) {
      goto LABEL_40;
    }
    id v38 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      boringssl_context_install_identity_cold_2(v6 + 16, v38);
    }
    goto LABEL_38;
  }

  uint64_t v11 = v10;
  if (EVP_MD_CTX_md(certificate_buffer_chain_from_certificate_chain))
  {
    unint64_t v12 = 0LL;
    do
    {
      v11[v12] = (uint64_t)OPENSSL_sk_value((unint64_t *)certificate_buffer_chain_from_certificate_chain, v12);
      ++v12;
    }

    while (v12 < (unint64_t)EVP_MD_CTX_md(certificate_buffer_chain_from_certificate_chain));
  }

  id v13 = (id *)(v6 + 16);
  id v14 = objc_loadWeakRetained((id *)(v6 + 16));
  if (!v14
    || (BOOL v15 = v14,
        BOOL v16 = objc_loadWeakRetained((id *)(v6 + 16)),
        char v17 = v16[475],
        v16,
        v15,
        (v17 & 1) == 0))
  {
    id v18 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v18)
    {
      uint64_t v19 = objc_loadWeakRetained((id *)(v6 + 16));
      BOOL v20 = (v19[475] & 1) == 0;
    }

    else
    {
      BOOL v20 = 1;
    }

    if (v20)
    {
      if (g_boringssl_log)
      {
        id v35 = (os_log_s *)(id)g_boringssl_log;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          id v36 = objc_loadWeakRetained((id *)(v6 + 16));
          if (v36)
          {
            BOOL v60 = (char *)objc_loadWeakRetained((id *)(v6 + 16));
            uint64_t v37 = v60 + 391;
          }

          else
          {
            uint64_t v37 = &unk_1875F4C23;
          }

          id v40 = objc_loadWeakRetained((id *)(v6 + 16));
          *(_DWORD *)buf = 136447234;
          uint64_t v63 = "boringssl_context_install_identity";
          __int16 v64 = 1024;
          int v65 = 2014;
          __int16 v66 = 2082;
          uint64_t v67 = v37;
          __int16 v68 = 2048;
          id v69 = v40;
          __int16 v70 = 2048;
          v71[0] = EVP_MD_CTX_md(certificate_buffer_chain_from_certificate_chain);
          _os_log_impl( &dword_187560000,  v35,  OS_LOG_TYPE_INFO,  "%{public}s(%d) %{public}s[%p] Calling SSL_set_chain_and_key with %zu certificates",  buf,  0x30u);

          if (v36) {
        }
          }
      }
    }
  }

  uint64_t v41 = *(void *)(v6 + 400);
  uint64_t v42 = EVP_MD_CTX_md(certificate_buffer_chain_from_certificate_chain);
  int v43 = SSL_set_chain_and_key(v41, v11, (unint64_t)v42, 0LL, (uint64_t)g_boringssl_private_key_methods);
  BOOL v5 = v43 != 0;
  if (!v43)
  {
    unint64_t error = ERR_get_error();
    int v45 = error;
    id v46 = ERR_reason_error_string(error);
    id v47 = objc_loadWeakRetained((id *)(v6 + 16));
    if (!v47
      || (uint64_t v48 = v47,
          uint64_t v49 = objc_loadWeakRetained((id *)(v6 + 16)),
          char v50 = v49[475],
          v49,
          v48,
          (v50 & 1) == 0))
    {
      id v51 = objc_loadWeakRetained(v13);
      if (v51)
      {
        char v52 = objc_loadWeakRetained(v13);
        BOOL v53 = (v52[475] & 1) == 0;
      }

      else
      {
        BOOL v53 = 1;
      }

      if (v53)
      {
        if (g_boringssl_log)
        {
          uint64_t v54 = (os_log_s *)(id)g_boringssl_log;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            id v55 = objc_loadWeakRetained(v13);
            if (v55)
            {
              __int16 v59 = (char *)objc_loadWeakRetained(v13);
              __int16 v61 = v59 + 391;
            }

            else
            {
              __int16 v61 = &unk_1875F4C23;
            }

            id v56 = objc_loadWeakRetained(v13);
            __int16 v57 = v56;
            *(_DWORD *)buf = 136447490;
            uint64_t v63 = "boringssl_context_install_identity";
            if (v46) {
              int v58 = v46;
            }
            else {
              int v58 = (const char *)&unk_1875F4C23;
            }
            __int16 v64 = 1024;
            int v65 = 2019;
            __int16 v66 = 2082;
            uint64_t v67 = v61;
            __int16 v68 = 2048;
            id v69 = v56;
            __int16 v70 = 1024;
            LODWORD(v71[0]) = v45;
            WORD2(v71[0]) = 2080;
            *(void *)((char *)v71 + 6) = v58;
            _os_log_error_impl( &dword_187560000,  v54,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] SSL_set_chain_and_key failed: %d %s",  buf,  0x36u);

            if (v55) {
          }
            }
        }
      }
    }
  }

  OPENSSL_sk_pop_free_ex( (unint64_t *)certificate_buffer_chain_from_certificate_chain,  (void (*)(uint64_t))sk_CRYPTO_BUFFER_call_free_func_0,  (uint64_t)CRYPTO_BUFFER_free);
  free(v11);
LABEL_40:

  return v5;
}

uint64_t boringssl_context_set_temporary_identity(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*(_DWORD *)a1 == -1252936367)
    {
      uint64_t v5 = *(void *)(a1 + 8);
      if (v5)
      {
        if (v3)
        {
          char v7 = *(void **)(v5 + 104);
          uint64_t v6 = (void **)(v5 + 104);
          uint64_t v8 = v6 + 1;
          objc_storeStrong(v6 + 1, v7);
          SecIdentityRef v9 = boringssl_identity_create_from_identity(v4);
          char v10 = *v6;
          *uint64_t v6 = v9;

          if (*v6 && boringssl_context_install_identity(a1, *v6))
          {
            a1 = 1LL;
            goto LABEL_12;
          }

          objc_storeStrong(v6, *v8);
          id v11 = *v8;
          *uint64_t v8 = 0LL;
        }

        else
        {
          unint64_t v12 = *(void **)(v5 + 112);
          if (v12)
          {
            objc_storeStrong((id *)(v5 + 104), v12);
            id v13 = *(void **)(v5 + 112);
            *(void *)(v5 + 112) = 0LL;

            a1 = boringssl_context_install_identity(a1, *(void **)(v5 + 104));
            goto LABEL_12;
          }
        }
      }
    }

    a1 = 0LL;
  }

BOOL boringssl_context_set_external_identity(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (!a1 || *(_DWORD *)a1 != -1252936367) {
    goto LABEL_10;
  }
  BOOL v14 = 0LL;
  if (v12)
  {
    if (v11)
    {
      if (v10)
      {
        if (v9)
        {
          uint64_t v15 = *(void *)(a1 + 8);
          if (v15)
          {
            BOOL v16 = boringssl_identity_create_from_external_identity(v9, v10, v11, v12);
            char v17 = *(void **)(v15 + 104);
            *(void *)(v15 + 104) = v16;

            id v18 = *(void **)(v15 + 104);
            if (v18)
            {
              BOOL v14 = boringssl_context_install_identity(a1, v18);
              goto LABEL_11;
            }

uint64_t __boringssl_context_message_handler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1 + 40) + 216LL) + 16LL))( *(void *)(*(void *)(a1 + 40) + 216LL),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

uint64_t __boringssl_context_update_encryption_level_block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned int *)(*(void *)(a1 + 32) + 548LL),  0LL);
}

uint64_t __boringssl_context_update_encryption_level_block_invoke_215(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned int *)(*(void *)(a1 + 32) + 552LL),  1LL);
}

void *__boringssl_context_set_enable_message_mode_block_invoke( uint64_t a1, int a2, const void *a3, size_t a4)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      goto LABEL_5;
    case 3:
      uint64_t result = SSL_provide_quic_data(*(void *)(*(void *)(a1 + 32) + 400LL), 3, a3, a4);
      if (!(_DWORD)result) {
        return result;
      }
      unsigned int v6 = SSL_process_quic_post_handshake(*(void **)(*(void *)(a1 + 32) + 400LL));
      return (void *)(v6 != 0);
    default:
      a2 = -1431655766;
LABEL_5:
      unsigned int v6 = SSL_provide_quic_data(*(void *)(*(void *)(a1 + 32) + 400LL), a2, a3, a4);
      return (void *)(v6 != 0);
  }

uint64_t boringssl_context_ssl_context_create_datagram(uint64_t a1, int a2)
{
  if (!a1) {
    return 1LL;
  }
  if (*(_DWORD *)a1 != -1252936367) {
    return 1LL;
  }
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 1LL;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));

  if (WeakRetained)
  {
    unsigned int v6 = (id *)objc_loadWeakRetained((id *)(v3 + 16));
    id v7 = v6[41];
  }

  else
  {
    id v7 = 0LL;
  }

  id v10 = (SSL_METHOD *)DTLS_with_buffers_method();
  uint64_t v11 = boringssl_context_restore_ssl_context((void *)v3, v7, v10);
  *(void *)(v3 + 40_Block_object_dispose(va, 8) = v11;
  if (a2) {
    char v12 = 48;
  }
  else {
    char v12 = 32;
  }
  *(_BYTE *)(v3 + 556) = v12 | *(_BYTE *)(v3 + 556) & 0xCF;
  if (v11) {
    uint64_t v8 = boringssl_context_configure_defaults(a1);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

BOOL __boringssl_context_zlib_compress_data_block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  int v5 = CBB_add_bytes(*(void *)(a1 + 32), a2, a3);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    if (!v6) {
      goto LABEL_14;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
    if (WeakRetained)
    {
      uint64_t v8 = WeakRetained;
      id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
      char v10 = v9[475];

      if ((v10 & 1) != 0) {
        return v5 != 0;
      }
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)(v11 + 16));
      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
        uint64_t v14 = (v13[475] & 1) == 0;
      }

      else
      {
        uint64_t v14 = 1LL;
      }

      if (!(_DWORD)v14) {
        return v5 != 0;
      }
    }

    else
    {
LABEL_14:
      uint64_t v14 = 1LL;
    }

    if (g_boringssl_log)
    {
      id v22 = (os_log_s *)(id)g_boringssl_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        if (v23)
        {
          uint64_t v14 = (uint64_t)objc_loadWeakRetained((id *)(v23 + 16));
          uint64_t v31 = *(void *)(a1 + 40);
          if (v14)
          {
            BOOL v24 = v31 != 0;
            if (v31)
            {
              uint64_t v3 = (char *)objc_loadWeakRetained((id *)(v31 + 16));
              uint64_t v31 = *(void *)(a1 + 40);
            }

            else
            {
              uint64_t v3 = 0LL;
            }

            BOOL v27 = v3 + 391;
          }

          else
          {
            BOOL v24 = 0;
            BOOL v27 = &unk_1875F4C23;
          }

          if (v31)
          {
            id v25 = objc_loadWeakRetained((id *)(v31 + 16));
            char v26 = 0;
          }

          else
          {
            id v25 = 0LL;
            char v26 = 1;
          }
        }

        else
        {
          BOOL v24 = 0;
          id v25 = 0LL;
          char v26 = 1;
          BOOL v27 = &unk_1875F4C23;
        }

        int v33 = 136446978;
        BOOL v34 = "boringssl_context_zlib_compress_data_block_invoke";
        __int16 v35 = 1024;
        int v36 = 740;
        __int16 v37 = 2082;
        id v38 = v27;
        __int16 v39 = 2048;
        id v40 = v25;
        _os_log_debug_impl( &dword_187560000,  v22,  OS_LOG_TYPE_DEBUG,  "%{public}s(%d) %{public}s[%p] Wrote compressed certificate data",  (uint8_t *)&v33,  0x26u);
        if ((v26 & 1) != 0) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }

      goto LABEL_26;
    }
  }

  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    id v15 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v15)
    {
      BOOL v16 = v15;
      char v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
      char v18 = v17[475];

      if ((v18 & 1) != 0) {
        return v5 != 0;
      }
    }

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)(v19 + 16));
      if (v20)
      {
        id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
        uint64_t v14 = (v21[475] & 1) == 0;
      }

      else
      {
        uint64_t v14 = 1LL;
      }

      if (!(_DWORD)v14) {
        return v5 != 0;
      }
    }

    else
    {
LABEL_15:
      uint64_t v14 = 1LL;
    }

    if (g_boringssl_log)
    {
      id v22 = (os_log_s *)(id)g_boringssl_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        if (v23)
        {
          uint64_t v14 = (uint64_t)objc_loadWeakRetained((id *)(v23 + 16));
          uint64_t v32 = *(void *)(a1 + 40);
          if (v14)
          {
            BOOL v24 = v32 != 0;
            if (v32)
            {
              uint64_t v3 = (char *)objc_loadWeakRetained((id *)(v32 + 16));
              uint64_t v32 = *(void *)(a1 + 40);
            }

            else
            {
              uint64_t v3 = 0LL;
            }

            uint64_t v30 = v3 + 391;
          }

          else
          {
            BOOL v24 = 0;
            uint64_t v30 = &unk_1875F4C23;
          }

          if (v32)
          {
            id v25 = objc_loadWeakRetained((id *)(v32 + 16));
            char v29 = 0;
          }

          else
          {
            id v25 = 0LL;
            char v29 = 1;
          }
        }

        else
        {
          BOOL v24 = 0;
          id v25 = 0LL;
          char v29 = 1;
          uint64_t v30 = &unk_1875F4C23;
        }

        int v33 = 136446978;
        BOOL v34 = "boringssl_context_zlib_compress_data_block_invoke";
        __int16 v35 = 1024;
        int v36 = 737;
        __int16 v37 = 2082;
        id v38 = v30;
        __int16 v39 = 2048;
        id v40 = v25;
        _os_log_error_impl( &dword_187560000,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] CBB_add_bytes failed",  (uint8_t *)&v33,  0x26u);
        if ((v29 & 1) != 0) {
          goto LABEL_45;
        }
LABEL_44:

LABEL_45:
        if (v24) {

        }
        if (v23) {
      }
        }

BOOL __boringssl_context_zlib_uncompress_data_block_invoke(void *a1, const void *a2, size_t __n)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  size_t v7 = a1[5] - v6;
  if (v7 < __n)
  {
    uint64_t v17 = a1[6];
    if (!v17) {
      goto LABEL_15;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v17 + 16));
    if (WeakRetained)
    {
      uint64_t v19 = WeakRetained;
      id v20 = objc_loadWeakRetained((id *)(a1[6] + 16LL));
      char v21 = v20[475];

      if ((v21 & 1) != 0) {
        return v7 >= __n;
      }
    }

    uint64_t v22 = a1[6];
    if (v22)
    {
      id v23 = objc_loadWeakRetained((id *)(v22 + 16));
      if (v23)
      {
        BOOL v24 = objc_loadWeakRetained((id *)(a1[6] + 16LL));
        uint64_t v16 = (v24[475] & 1) == 0;
      }

      else
      {
        uint64_t v16 = 1LL;
      }

      if (!(_DWORD)v16) {
        return v7 >= __n;
      }
    }

    else
    {
LABEL_15:
      uint64_t v16 = 1LL;
    }

    if (g_boringssl_log)
    {
      id v25 = (os_log_s *)(id)g_boringssl_log;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = a1[6];
        if (v26)
        {
          uint64_t v16 = (uint64_t)objc_loadWeakRetained((id *)(v26 + 16));
          uint64_t v35 = a1[6];
          if (v16)
          {
            BOOL v27 = v35 != 0;
            if (v35)
            {
              uint64_t v3 = (char *)objc_loadWeakRetained((id *)(v35 + 16));
              uint64_t v35 = a1[6];
            }

            else
            {
              uint64_t v3 = 0LL;
            }

            int v33 = v3 + 391;
          }

          else
          {
            BOOL v27 = 0;
            int v33 = &unk_1875F4C23;
          }

          if (v35)
          {
            id v28 = objc_loadWeakRetained((id *)(v35 + 16));
            char v32 = 0;
          }

          else
          {
            id v28 = 0LL;
            char v32 = 1;
          }
        }

        else
        {
          BOOL v27 = 0;
          id v28 = 0LL;
          char v32 = 1;
          int v33 = &unk_1875F4C23;
        }

        int v36 = 136446978;
        __int16 v37 = "boringssl_context_zlib_uncompress_data_block_invoke";
        __int16 v38 = 1024;
        int v39 = 770;
        __int16 v40 = 2082;
        uint64_t v41 = v33;
        __int16 v42 = 2048;
        id v43 = v28;
        _os_log_error_impl( &dword_187560000,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Uncompressed data length exceeded buffer bounds",  (uint8_t *)&v36,  0x26u);
        if ((v32 & 1) != 0) {
          goto LABEL_52;
        }
LABEL_51:

LABEL_52:
        if (v27) {

        }
        if (v26) {
      }
        }

uint64_t sk_CRYPTO_BUFFER_call_free_func_0(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  return a1(a2);
}

void *boringssl_context_set_read_secret(const SSL *a1)
{
  return boringssl_context_set_encryption_secrets(a1);
}

void *boringssl_context_set_write_secret(const SSL *a1)
{
  return boringssl_context_set_encryption_secrets(a1);
}

uint64_t boringssl_context_add_message(const SSL *a1, unsigned int a2, const void *a3, size_t a4)
{
  size_t v7 = SSL_get_ex_data(a1, 0);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = (uint64_t)v7;
  if (*(_DWORD *)v7 != -1252936367) {
    return 0LL;
  }
  uint64_t v9 = v7[1];
  if (!v9
    || boringssl_session_get_state((uint64_t)v7) > 3
    || (boringssl_session_is_cancelled(v8) & 1) != 0)
  {
    return 0LL;
  }

  if (a2 - 1 >= 3) {
    a2 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));
  uint64_t v12 = nw_protocol_boringssl_write_message(WeakRetained, a2, a3, a4);

  return v12;
}

uint64_t boringssl_context_flush_flight(const SSL *a1)
{
  id v1 = SSL_get_ex_data(a1, 0);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (uint64_t)v1;
  if (*(_DWORD *)v1 != -1252936367) {
    return 0LL;
  }
  uint64_t v3 = v1[1];
  if (!v3
    || boringssl_session_get_state((uint64_t)v1) > 3
    || (boringssl_session_is_cancelled(v2) & 1) != 0)
  {
    return 0LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));
  uint64_t v6 = nw_protocol_boringssl_flush_flight(WeakRetained);

  return v6;
}

uint64_t boringssl_context_send_alert(const SSL *a1, int a2, uint64_t a3)
{
  int v5 = SSL_get_ex_data(a1, 0);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = (uint64_t)v5;
  if (*(_DWORD *)v5 != -1252936367) {
    return 0LL;
  }
  uint64_t v7 = v5[1];
  if (!v7
    || boringssl_session_get_state((uint64_t)v5) > 3
    || (boringssl_session_is_cancelled(v6) & 1) != 0)
  {
    return 0LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
  uint64_t v10 = nw_protocol_boringssl_send_alert(WeakRetained, a2, a3);

  return v10;
}

void *boringssl_context_set_encryption_secrets(const SSL *a1)
{
  uint64_t result = SSL_get_ex_data(a1, 0);
  if (result)
  {
    if (*(_DWORD *)result == -1252936367 && result[1])
    {
      boringssl_session_update_metadata((uint64_t)result);
      return (void *)nw_protocol_options_access_handle();
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL __boringssl_context_set_encryption_secrets_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && *(void *)(a2 + 144) && *(void *)(a2 + 152))
  {
    uint64_t v4 = *(const void **)(a1 + 32);
    if (v4) {
      dispatch_data_t v5 = dispatch_data_create(v4, *(void *)(a1 + 40), 0LL, 0LL);
    }
    else {
      dispatch_data_t v5 = 0LL;
    }
    uint64_t v6 = *(const void **)(a1 + 48);
    if (v6) {
      dispatch_data_t v7 = dispatch_data_create(v6, *(void *)(a1 + 40), 0LL, 0LL);
    }
    else {
      dispatch_data_t v7 = 0LL;
    }
    unsigned int v8 = *(_DWORD *)(a1 + 56);
    if (v8 - 1 >= 3) {
      uint64_t v9 = 0LL;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = MEMORY[0x1895A97C0](*(void *)(a2 + 144));
    uint64_t v11 = (void (**)(void, void, void, void))v10;
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, dispatch_data_t))(v10 + 16))(v10, v9, 1LL, v5);
    }
    if (v7) {
      ((void (**)(void, uint64_t, void, dispatch_data_t))v11)[2](v11, v9, 0LL, v7);
    }
  }

  return a2 != 0;
}

uint64_t __boringssl_context_restore_ssl_context_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!boringssl_context_state_is_context_state((BOOL)v5))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_8;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
    if (WeakRetained)
    {
      uint64_t v9 = WeakRetained;
      uint64_t v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
      char v11 = v10[475];

      if ((v11 & 1) != 0) {
        goto LABEL_14;
      }
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)(v12 + 16));
      if (v13)
      {
        id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
        uint64_t v15 = (v14[475] & 1) == 0;
      }

      else
      {
        uint64_t v15 = 1LL;
      }

      if (!(_DWORD)v15) {
        goto LABEL_14;
      }
    }

    else
    {
LABEL_8:
      uint64_t v15 = 1LL;
    }

    if (!g_boringssl_log)
    {
LABEL_14:

      uint64_t v6 = 0LL;
      goto LABEL_15;
    }

    id v16 = (id)g_boringssl_log;
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      goto LABEL_14;
    }

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v15 = (uint64_t)objc_loadWeakRetained((id *)(v18 + 16));
      uint64_t v23 = *(void *)(a1 + 32);
      if (v15)
      {
        BOOL v19 = v23 != 0;
        if (v23)
        {
          uint64_t v3 = (char *)objc_loadWeakRetained((id *)(v23 + 16));
          uint64_t v23 = *(void *)(a1 + 32);
        }

        else
        {
          uint64_t v3 = 0LL;
        }

        uint64_t v22 = v3 + 391;
      }

      else
      {
        BOOL v19 = 0;
        uint64_t v22 = &unk_1875F4C23;
      }

      if (v23)
      {
        id v20 = objc_loadWeakRetained((id *)(v23 + 16));
        char v21 = 0;
      }

      else
      {
        id v20 = 0LL;
        char v21 = 1;
      }
    }

    else
    {
      BOOL v19 = 0;
      id v20 = 0LL;
      char v21 = 1;
      uint64_t v22 = &unk_1875F4C23;
    }

    int v24 = 136446978;
    id v25 = "boringssl_context_restore_ssl_context_block_invoke";
    __int16 v26 = 1024;
    int v27 = 2621;
    __int16 v28 = 2082;
    char v29 = v22;
    __int16 v30 = 2048;
    id v31 = v20;
    _os_log_error_impl( &dword_187560000,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Cached context state is invalid.",  (uint8_t *)&v24,  0x26u);
    if ((v21 & 1) != 0)
    {
      if (!v19) {
        goto LABEL_29;
      }
    }

    else
    {

      if (!v19)
      {
LABEL_29:
        if (!v18) {
          goto LABEL_13;
        }
        goto LABEL_33;
      }
    }

    if (!v18) {
      goto LABEL_13;
    }
LABEL_33:

    goto LABEL_13;
  }

uint64_t boringssl_context_error_print(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  if (*(_DWORD *)a3 != -1252936367) {
    return 0LL;
  }
  uint64_t v3 = *(void *)(a3 + 8);
  if (!v3) {
    return 0LL;
  }
  id v5 = (id *)(v3 + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    unsigned int v8 = objc_loadWeakRetained(v5);
    char v9 = v8[475];

    if ((v9 & 1) != 0) {
      return 1LL;
    }
  }

  id v10 = objc_loadWeakRetained(v5);
  if (v10)
  {
    char v11 = objc_loadWeakRetained(v5);
    BOOL v12 = (v11[475] & 1) == 0;
  }

  else
  {
    BOOL v12 = 1;
  }

  uint64_t result = 1LL;
  if (v12 && g_boringssl_log)
  {
    id v14 = (os_log_s *)(id)g_boringssl_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      boringssl_context_error_print_cold_1(v5, a1, v14);
    }

    return 1LL;
  }

  return result;
}

void __boringssl_context_new_session_handler_block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 168LL) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
    char v7 = v6[475];

    if ((v7 & 1) != 0) {
      return;
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8)
  {
LABEL_7:
    uint64_t v11 = 1LL;
    goto LABEL_10;
  }

  id v9 = objc_loadWeakRetained((id *)(v8 + 16));
  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
    uint64_t v11 = (v10[475] & 1) == 0;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  if ((_DWORD)v11)
  {
LABEL_10:
    if (!g_boringssl_log) {
      return;
    }
    BOOL v12 = (os_log_s *)(id)g_boringssl_log;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (!v13)
    {
      BOOL v15 = 0;
      id v16 = 0LL;
      char v17 = 1;
      uint64_t v18 = &unk_1875F4C23;
      goto LABEL_22;
    }

    uint64_t v11 = (uint64_t)objc_loadWeakRetained((id *)(v13 + 16));
    uint64_t v14 = *(void *)(a1 + 32);
    if (v11)
    {
      BOOL v15 = v14 != 0;
      if (v14)
      {
        id v1 = (char *)objc_loadWeakRetained((id *)(v14 + 16));
        uint64_t v14 = *(void *)(a1 + 32);
      }

      else
      {
        id v1 = 0LL;
      }

      uint64_t v18 = v1 + 391;
      if (v14) {
        goto LABEL_21;
      }
    }

    else
    {
      BOOL v15 = 0;
      uint64_t v18 = &unk_1875F4C23;
      if (v14)
      {
LABEL_21:
        id v16 = objc_loadWeakRetained((id *)(v14 + 16));
        char v17 = 0;
LABEL_22:
        int v19 = 136446978;
        id v20 = "boringssl_context_new_session_handler_block_invoke";
        __int16 v21 = 1024;
        int v22 = 1489;
        __int16 v23 = 2082;
        int v24 = v18;
        __int16 v25 = 2048;
        id v26 = v16;
        _os_log_impl( &dword_187560000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s(%d) %{public}s[%p] Returning from session update block",  (uint8_t *)&v19,  0x26u);
        if ((v17 & 1) != 0)
        {
          if (!v15) {
            goto LABEL_24;
          }
        }

        else
        {

          if (!v15)
          {
LABEL_24:
            if (!v13)
            {
LABEL_26:

              return;
            }

id OUTLINED_FUNCTION_5_3()
{
  return objc_loadWeakRetained(v0);
}

  ;
}

id OUTLINED_FUNCTION_9_1(id *location)
{
  return objc_loadWeakRetained(location);
}

id OUTLINED_FUNCTION_12_2()
{
  return objc_loadWeakRetained(v0);
}

  ;
}

id OUTLINED_FUNCTION_15_1(id *location)
{
  return objc_loadWeakRetained(location);
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_19_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_20_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

_BYTE *x25519_ge_tobytes(_BYTE *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v4;
  v12[1] = v4;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v4;
  v10[1] = v4;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v4;
  v8[1] = v4;
  __int128 v5 = *(_OWORD *)(a2 + 96);
  __int128 v14 = *(_OWORD *)(a2 + 80);
  __int128 v15 = v5;
  uint64_t v16 = *(void *)(a2 + 112);
  fe_loose_invert((uint64_t)v12, (unint64_t *)&v14);
  fe_mul_impl((uint64_t)v10, (unint64_t *)a2, (unint64_t *)v12);
  fe_mul_impl((uint64_t)v8, (unint64_t *)(a2 + 40), (unint64_t *)v12);
  fe_tobytes(a1, v8);
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v14 = v6;
  __int128 v15 = v6;
  uint64_t result = fe_tobytes(&v14, v10);
  a1[31] ^= (_BYTE)v14 << 7;
  return result;
}

uint64_t x25519_ge_frombytes_vartime(uint64_t a1, int64x2_t *a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  v4.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v4.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v26[0] = v4;
  v26[1] = v4;
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  v24[0] = v4;
  v24[1] = v4;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v4;
  v22[1] = v4;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  v20[0] = v4;
  v20[1] = v4;
  __int128 v5 = (unint64_t *)(a1 + 40);
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  v18[0] = v4;
  v18[1] = v4;
  int64x2_t v6 = a2[1];
  int64x2_t v32 = *a2;
  int64x2_t v33 = v6;
  v33.i8[15] = v6.i8[15] & 0x7F;
  fe_frombytes_strict((unint64_t *)(a1 + 40), (unsigned int *)&v32);
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 112) = 0LL;
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 80) = 1LL;
  fe_sq_tt((uint64_t)v22, v5);
  fe_mul_impl((uint64_t)v20, (unint64_t *)v22, d);
  fe_sub(v24, v22, (int64x2_t *)(a1 + 80));
  fe_carry((unint64_t *)v26, v24);
  fe_add(v24, v20, (int64x2_t *)(a1 + 80));
  fe_mul_impl((uint64_t)v22, (unint64_t *)v26, (unint64_t *)v24);
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  v7.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v7.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  int64x2_t v32 = v7;
  int64x2_t v33 = v7;
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  v30[0] = v7;
  v30[1] = v7;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  v28[0] = v7;
  v28[1] = v7;
  fe_sq_tt((uint64_t)&v32, (unint64_t *)v22);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v22, (unint64_t *)v30);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)&v32, (unint64_t *)v30);
  fe_sq_tt((uint64_t)&v32, (unint64_t *)&v32);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  int v8 = 4;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v8;
  }

  while (v8);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  int v9 = 9;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v9;
  }

  while (v9);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v28, (unint64_t *)v30);
  int v10 = 19;
  do
  {
    fe_sq_tt((uint64_t)v28, (unint64_t *)v28);
    --v10;
  }

  while (v10);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v28, (unint64_t *)v30);
  fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
  int v11 = 9;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v11;
  }

  while (v11);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  int v12 = 49;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v12;
  }

  while (v12);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v28, (unint64_t *)v30);
  int v13 = 99;
  do
  {
    fe_sq_tt((uint64_t)v28, (unint64_t *)v28);
    --v13;
  }

  while (v13);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v28, (unint64_t *)v30);
  fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
  int v14 = 49;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v14;
  }

  while (v14);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)&v32, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)&v32, (unint64_t *)&v32);
  fe_mul_impl(a1, (unint64_t *)&v32, (unint64_t *)v22);
  fe_mul_impl(a1, (unint64_t *)a1, (unint64_t *)v26);
  fe_sq_tt((uint64_t)v20, (unint64_t *)a1);
  fe_mul_impl((uint64_t)v20, (unint64_t *)v20, (unint64_t *)v24);
  fe_sub(v18, v20, v26);
  if (fe_isnonzero(v18))
  {
    fe_add(v18, v20, v26);
    if (fe_isnonzero(v18)) {
      return 0LL;
    }
    fe_mul_impl(a1, (unint64_t *)a1, sqrtm1);
  }

  v16.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v16.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  int64x2_t v32 = v16;
  int64x2_t v33 = v16;
  fe_tobytes(&v32, (void *)a1);
  if ((v32.i8[0] & 1) != a2[1].u8[15] >> 7)
  {
    unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
    v17.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v17.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    int64x2_t v32 = v17;
    int64x2_t v33 = v17;
    fe_neg(&v32, (int64x2_t *)a1);
    fe_carry((unint64_t *)a1, &v32);
  }

  fe_mul_impl(a1 + 120, (unint64_t *)a1, v5);
  return 1LL;
}

BOOL fe_isnonzero(void *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = v1;
  v4[1] = v1;
  fe_carry((unint64_t *)v4, a1);
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v2;
  v6[1] = v2;
  fe_tobytes(v6, v4);
  return CRYPTO_memcmp((char *)v6, fe_isnonzero_zero, 32LL) != 0;
}

uint64_t x25519_ge_p3_to_cached(uint64_t a1, uint64_t a2)
{
  int64x2_t v4 = (int64x2_t *)(a2 + 40);
  fe_add((int64x2_t *)a1, (int64x2_t *)(a2 + 40), (int64x2_t *)a2);
  fe_sub((int64x2_t *)(a1 + 40), v4, (int64x2_t *)a2);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  return fe_mul_impl(a1 + 120, (unint64_t *)(a2 + 120), d2);
}

int64x2_t *x25519_ge_add(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v15[0] = v6;
  v15[1] = v6;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v6;
  v13[1] = v6;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  v11[0] = v6;
  v11[1] = v6;
  uint64_t v7 = (int64x2_t *)(a2 + 40);
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = v6;
  v9[1] = v6;
  fe_add((int64x2_t *)a1, (int64x2_t *)(a2 + 40), (int64x2_t *)a2);
  fe_sub((int64x2_t *)(a1 + 40), v7, (int64x2_t *)a2);
  fe_mul_impl((uint64_t)v11, (unint64_t *)a1, a3);
  fe_mul_impl((uint64_t)v13, (unint64_t *)(a1 + 40), a3 + 5);
  fe_mul_impl((uint64_t)v9, a3 + 15, (unint64_t *)(a2 + 120));
  fe_mul_impl((uint64_t)v15, (unint64_t *)(a2 + 80), a3 + 10);
  fe_add((int64x2_t *)(a1 + 120), v15, v15);
  fe_sub((int64x2_t *)a1, v11, v13);
  fe_add((int64x2_t *)(a1 + 40), v11, v13);
  fe_carry((unint64_t *)v11, (void *)(a1 + 120));
  fe_add((int64x2_t *)(a1 + 80), v11, v9);
  return fe_sub((int64x2_t *)(a1 + 120), v11, v9);
}

int64x2_t *x25519_ge_sub(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v15[0] = v6;
  v15[1] = v6;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v6;
  v13[1] = v6;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  v11[0] = v6;
  v11[1] = v6;
  uint64_t v7 = (int64x2_t *)(a2 + 40);
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = v6;
  v9[1] = v6;
  fe_add((int64x2_t *)a1, (int64x2_t *)(a2 + 40), (int64x2_t *)a2);
  fe_sub((int64x2_t *)(a1 + 40), v7, (int64x2_t *)a2);
  fe_mul_impl((uint64_t)v11, (unint64_t *)a1, a3 + 5);
  fe_mul_impl((uint64_t)v13, (unint64_t *)(a1 + 40), a3);
  fe_mul_impl((uint64_t)v9, a3 + 15, (unint64_t *)(a2 + 120));
  fe_mul_impl((uint64_t)v15, (unint64_t *)(a2 + 80), a3 + 10);
  fe_add((int64x2_t *)(a1 + 120), v15, v15);
  fe_sub((int64x2_t *)a1, v11, v13);
  fe_add((int64x2_t *)(a1 + 40), v11, v13);
  fe_carry((unint64_t *)v11, (void *)(a1 + 120));
  fe_sub((int64x2_t *)(a1 + 80), v11, v9);
  return fe_add((int64x2_t *)(a1 + 120), v11, v9);
}

double ge_p2_0(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 1LL;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 112) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 1LL;
  return result;
}

unsigned __int16 *x25519_sc_reduce(unsigned __int16 *result)
{
  unint64_t v1 = *(unsigned int *)((char *)result + 15);
  unint64_t v2 = *((unsigned int *)result + 9);
  unint64_t v3 = (v2 >> 24) | ((unint64_t)*((unsigned __int8 *)result + 40) << 8) | ((unint64_t)*((unsigned __int8 *)result + 41) << 16);
  unint64_t v4 = ((unint64_t)(HIBYTE(*((_DWORD *)result + 11)) | (*((unsigned __int8 *)result + 48) << 8) | (*((unsigned __int8 *)result + 49) << 16)) >> 2) & 0x1FFFFF;
  unint64_t v5 = ((unint64_t)*(unsigned int *)((char *)result + 49) >> 7) & 0x1FFFFF;
  unint64_t v6 = ((unint64_t)*((unsigned int *)result + 13) >> 4) & 0x1FFFFF;
  unint64_t v7 = ((unint64_t)(HIBYTE(*((_DWORD *)result + 13)) | (*((unsigned __int8 *)result + 56) << 8) | (*((unsigned __int8 *)result + 57) << 16)) >> 1) & 0x1FFFFF;
  uint64_t v8 = ((v1 >> 6) & 0x1FFFFF) + 666643LL * v4;
  unint64_t v9 = (*(unsigned __int16 *)((char *)result + 21) | ((unint64_t)(*((_BYTE *)result + 23) & 0x1F) << 16))
     + 470296LL * v5
     + 666643LL * v6
     + 654183LL * v4;
  unint64_t v10 = (((v1 >> 24) | ((unint64_t)*((unsigned __int8 *)result + 19) << 8) | ((unint64_t)*((unsigned __int8 *)result + 20) << 16)) >> 3)
      + 666643LL * v5
      + 470296LL * v4
      + ((unint64_t)(v8 + 0x100000) >> 21);
  unint64_t v11 = (((unint64_t)*(unsigned int *)((char *)result + 23) >> 5) & 0x1FFFFF)
      + 654183LL * v5
      + 470296LL * v6
      - 997805LL * (int)v4
      + 666643LL * v7
      + ((v9 + 0x100000) >> 21);
  unint64_t v12 = (((unint64_t)(HIBYTE(*(_DWORD *)((char *)result + 23)) | (*((unsigned __int8 *)result + 27) << 8) | (*((unsigned __int8 *)result + 28) << 16)) >> 2) & 0x1FFFFF)
      - 997805LL * (int)v5
      + 654183LL * v6
      + 136657LL * v4;
  unint64_t v13 = (((unint64_t)*((unsigned int *)result + 7) >> 7) & 0x1FFFFF)
      + 136657LL * v5
      - 997805LL * (int)v6
      - 683901LL * (int)v4;
  unint64_t v14 = (((unint64_t)*(unsigned int *)((char *)result + 31) >> 4) & 0x1FFFFF)
      - 683901LL * (int)v5
      + 136657LL * v6;
  unint64_t v16 = (unint64_t)*((unsigned int *)result + 15) >> 3;
  uint64_t v17 = ((v2 >> 6) & 0x1FFFFF) - 997805LL * (int)v16;
  uint64_t v18 = (v3 >> 3) + 136657LL * v16;
  unint64_t v19 = (result[21] | ((unint64_t)(result[22] & 0x1F) << 16)) - 683901LL * (int)v16;
  unint64_t v20 = v14 + 470296LL * v16;
  unint64_t v21 = v13 + 666643LL * v16;
  unint64_t v22 = v15 + 654183LL * v16;
  unint64_t v23 = ((unint64_t)*(unsigned int *)((char *)result + 57) >> 6) & 0x1FFFFF;
  uint64_t v24 = v18 - 683901LL * (int)v23;
  uint64_t v25 = v17 + 136657LL * v23 - 683901LL * (int)v7;
  uint64_t v26 = v20 + 654183LL * v23 - 997805LL * (int)v7;
  uint64_t v27 = v12 + 666643LL * v23 + 470296LL * v7;
  unint64_t v28 = v21 + 470296LL * v23;
  unint64_t v29 = v22 - 997805LL * (int)v23;
  uint64_t v30 = v28 + 654183LL * v7 + ((v27 + 0x100000) >> 21);
  uint64_t v31 = v29 + 136657LL * v7 + ((v26 + 0x100000) >> 21);
  unint64_t v32 = v26 - ((v26 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  uint64_t v33 = v24 + ((v25 + 0x100000) >> 21);
  unint64_t v34 = (((unint64_t)*((unsigned int *)result + 11) >> 5) & 0x1FFFFF) + ((uint64_t)(v19 + 0x100000) >> 21);
  unint64_t v35 = v9 - ((v9 + 0x100000) & 0xFFFFFE00000LL) + ((v10 + 0x100000) >> 21);
  unint64_t v36 = v10 - ((v10 + 0x100000) & 0x7FFFFFFFFFE00000LL);
  unint64_t v37 = v32 + ((v30 + 0x100000) >> 21);
  unint64_t v38 = v30 - ((v30 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v39 = v25 - ((v25 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v31 + 0x100000) >> 21);
  unint64_t v40 = v31 - ((v31 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v41 = v19 - ((v19 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v33 + 0x100000) >> 21);
  unint64_t v42 = v33 - ((v33 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v43 = (((unint64_t)*(unsigned int *)((char *)result + 7) >> 7) & 0x1FFFFF) + 666643 * v42;
  unint64_t v44 = (((unint64_t)*(unsigned int *)(result + 5) >> 4) & 0x1FFFFF) + 666643 * v41 + 470296 * v42;
  unint64_t v45 = (((unint64_t)(HIBYTE(*(_DWORD *)(result + 5)) | (*((unsigned __int8 *)result + 14) << 8) | (*((unsigned __int8 *)result + 15) << 16)) >> 1) & 0x1FFFFF)
      + 666643 * v34
      + 470296 * v41
      + 654183 * v42;
  uint64_t v46 = v8 - ((v8 + 0x100000) & 0x7FFFFE00000LL) + 470296 * v34 + 654183 * v41 - 997805 * v42;
  uint64_t v47 = v36 + 654183 * v34 - 997805 * v41 + 136657 * v42;
  uint64_t v48 = v35 - 997805 * v34 + 136657 * v41 - 683901 * v42;
  unint64_t v50 = v43 + 470296 * v39;
  unint64_t v51 = v44 + 654183 * v39;
  unint64_t v52 = v45 - 997805 * v39;
  unint64_t v53 = v46 + 136657 * v39;
  unint64_t v54 = v47 - 683901 * v39;
  unint64_t v55 = (((unint64_t)*(unsigned int *)(result + 1) >> 5) & 0x1FFFFF) + 666643 * v40;
  unint64_t v56 = v49 + 470296 * v40;
  unint64_t v57 = v50 + 654183 * v40;
  unint64_t v58 = v51 - 997805 * v40;
  unint64_t v59 = v52 + 136657 * v40;
  unint64_t v60 = v53 - 683901 * v40;
  unint64_t v61 = v27 - 683901 * v34 - ((v27 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((uint64_t)(v11 + 0x100000) >> 21);
  unint64_t v62 = (*result | ((unint64_t)(result[1] & 0x1F) << 16)) + 666643 * v37;
  unint64_t v63 = v56 + 654183 * v37;
  unint64_t v64 = v58 + 136657 * v37;
  uint64_t v65 = v55 + 470296 * v37 + ((uint64_t)(v62 + 0x100000) >> 21);
  unint64_t v66 = v54 + ((uint64_t)(v60 + 0x100000) >> 21);
  unint64_t v67 = v11 + 136657 * v34 - ((v11 + 0x100000) & 0xFFFFFFFFFFE00000LL) - 683901 * v41 + ((v48 + 0x100000) >> 21);
  unint64_t v68 = v48 - ((v48 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v69 = v38 + ((uint64_t)(v61 + 0x100000) >> 21);
  unint64_t v70 = v61 - ((v61 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  uint64_t v71 = v65 + 0x100000;
  unint64_t v72 = v70 + ((uint64_t)(v67 + 0x100000) >> 21);
  unint64_t v73 = v67 - ((v67 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  uint64_t v74 = (uint64_t)(v69 + 0x100000) >> 21;
  unint64_t v75 = v65 + 470296 * v74 - ((v65 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  uint64_t v76 = v57 - 997805 * v37 + ((uint64_t)(v63 + 0x100000) >> 21);
  unint64_t v77 = v63 + 654183 * v74 - ((v63 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v71 >> 21);
  unint64_t v78 = v76 - 997805 * v74 - ((v76 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  uint64_t v79 = v59 - 683901 * v37 + ((uint64_t)(v64 + 0x100000) >> 21);
  unint64_t v80 = v64 + 136657 * v74 - ((v64 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v76 + 0x100000) >> 21);
  int64_t v81 = v62 - ((v62 + 0x100000) & 0xFFFFFFFFFFE00000LL) + 666643 * v74;
  uint64_t v82 = v79 - 683901 * v74;
  v79 += 0x100000LL;
  unint64_t v83 = v60 - ((v60 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v79 >> 21);
  uint64_t v84 = v75 + (v81 >> 21);
  uint64_t v85 = v77 + (v84 >> 21);
  uint64_t v86 = v78 + (v85 >> 21);
  uint64_t v87 = v80 + (v86 >> 21);
  int64_t v88 = v82 - (v79 & 0xFFFFFFFFFFE00000LL) + (v87 >> 21);
  uint64_t v89 = v83 + (v88 >> 21);
  int64_t v90 = v66 - ((v66 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v89 >> 21);
  uint64_t v91 = v68 + ((uint64_t)(v66 + 0x100000) >> 21) + (v90 >> 21);
  uint64_t v92 = v73 + (v91 >> 21);
  uint64_t v93 = v72 + (v92 >> 21);
  int64_t v94 = v69 - ((v69 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v93 >> 21);
  uint64_t v95 = (v81 & 0x1FFFFF) + 666643 * (v94 >> 21);
  *((_BYTE *)result + 1) = (unsigned __int16)(v81 + 11283 * (v94 >> 21)) >> 8;
  uint64_t v96 = (v84 & 0x1FFFFF) + 470296 * (v94 >> 21) + (v95 >> 21);
  *(_BYTE *)double result = v81 + 19 * (v94 >> 21);
  *((_BYTE *)result + 2) = ((unint64_t)((v81 & 0x1FFFFF) + 666643 * (v94 >> 21)) >> 16) & 0x1F | (32 * (v84 + 24 * (v94 >> 21) + (v95 >> 21)));
  *((_BYTE *)result + 3) = (unint64_t)v96 >> 3;
  *((_BYTE *)result + 4) = (unint64_t)v96 >> 11;
  uint64_t v97 = (v85 & 0x1FFFFF) + 654183 * (v94 >> 21) + (v96 >> 21);
  *((_BYTE *)result + 5) = (v96 >> 19) & 3 | (4 * (v85 + 103 * (v94 >> 21) + (v96 >> 21)));
  *((_BYTE *)result + 6) = (unint64_t)v97 >> 6;
  uint64_t v98 = (v86 & 0x1FFFFF) - 997805 * (v94 >> 21) + (v97 >> 21);
  *((_BYTE *)result + 7) = (v97 >> 14) & 0x7F | (((_BYTE)v86
  *((_BYTE *)result + _Block_object_dispose(va, 8) = (unint64_t)v98 >> 1;
  *((_BYTE *)result + 9) = (unint64_t)v98 >> 9;
  uint64_t v99 = (v87 & 0x1FFFFF) + 136657 * (v94 >> 21) + (v98 >> 21);
  *((_BYTE *)result + 10) = (v98 >> 17) & 0xF | (16 * (v87 - 47 * (v94 >> 21) + (v98 >> 21)));
  *((_BYTE *)result + 11) = (unint64_t)v99 >> 4;
  *((_BYTE *)result + 12) = (unint64_t)v99 >> 12;
  uint64_t v100 = (v88 & 0x1FFFFF) - 683901 * (v94 >> 21) + (v99 >> 21);
  *((_BYTE *)result + 13) = ((v99 & 0x100000) != 0) | (2 * (v88 - 125 * (v94 >> 21) + (v99 >> 21)));
  *((_BYTE *)result + 14) = (unint64_t)v100 >> 7;
  uint64_t v101 = (v89 & 0x1FFFFF) + (v100 >> 21);
  *((_BYTE *)result + 15) = (v100 >> 15) & 0x3F | (((_BYTE)v89 + (v100 >> 21)) << 6);
  *((_BYTE *)result + 16) = (unint64_t)v101 >> 2;
  *((_BYTE *)result + 17) = (unint64_t)v101 >> 10;
  uint64_t v102 = (v90 & 0x1FFFFF) + (v101 >> 21);
  *((_BYTE *)result + 1_Block_object_dispose(va, 8) = (v101 >> 18) & 7 | (8 * (v66 + (v89 >> 21) + (v101 >> 21)));
  *((_BYTE *)result + 19) = (unint64_t)v102 >> 5;
  *((_BYTE *)result + 20) = (unint64_t)v102 >> 13;
  *((_BYTE *)result + 22) = (unsigned __int16)(v91 + (v102 >> 21)) >> 8;
  uint64_t v103 = (v92 & 0x1FFFFF) + (((v91 & 0x1FFFFF) + (v102 >> 21)) >> 21);
  *((_BYTE *)result + 21) = v91 + (v102 >> 21);
  *((_BYTE *)result + 23) = ((unint64_t)((v91 & 0x1FFFFF) + (v102 >> 21)) >> 16) & 0x1F | (32 * v103);
  *((_BYTE *)result + 24) = (unint64_t)v103 >> 3;
  *((_BYTE *)result + 25) = (unint64_t)v103 >> 11;
  uint64_t v104 = (v93 & 0x1FFFFF) + (v103 >> 21);
  *((_BYTE *)result + 26) = (v103 >> 19) & 3 | (4 * v104);
  *((_BYTE *)result + 27) = (unint64_t)v104 >> 6;
  unint64_t v105 = (v94 & 0x1FFFFF) + (v104 >> 21);
  *((_BYTE *)result + 2_Block_object_dispose(va, 8) = (v104 >> 14) & 0x7F | ((_BYTE)v105 << 7);
  *((_BYTE *)result + 29) = v105 >> 1;
  *((_BYTE *)result + 30) = v105 >> 9;
  *((_BYTE *)result + 31) = v105 >> 17;
  return result;
}

double ED25519_keypair(uint64_t a1, _OWORD *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v4;
  v6[1] = v4;
  RAND_bytes((unsigned __int8 *)v6, 32);
  *(void *)&double result = ED25519_keypair_from_seed(a1, a2, (unsigned __int8 *)v6).n128_u64[0];
  return result;
}

__n128 ED25519_keypair_from_seed(uint64_t a1, _OWORD *a2, unsigned __int8 *d)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v14 = v6;
  __int128 v15 = v6;
  *(_OWORD *)md = v6;
  __int128 v13 = v6;
  SHA512(d, 0x20uLL, md);
  md[0] &= 0xF8u;
  HIBYTE(v13) = HIBYTE(v13) & 0x3F | 0x40;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[8] = v7;
  v11[9] = v7;
  void v11[6] = v7;
  v11[7] = v7;
  _OWORD v11[4] = v7;
  v11[5] = v7;
  int64x2_t v11[2] = v7;
  _OWORD v11[3] = v7;
  v11[0] = v7;
  v11[1] = v7;
  x25519_ge_scalarmult_base(v11, (int8x16_t *)md);
  x25519_ge_tobytes((_BYTE *)a1, (uint64_t)v11);
  __int128 v8 = *((_OWORD *)d + 1);
  *a2 = *(_OWORD *)d;
  a2[1] = v8;
  __n128 result = *(__n128 *)a1;
  __int128 v10 = *(_OWORD *)(a1 + 16);
  a2[2] = *(_OWORD *)a1;
  a2[3] = v10;
  return result;
}

uint64_t ED25519_sign(_BYTE *a1, const void *a2, size_t a3, unsigned __int8 *d)
{
  uint64_t v164 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v163[0] = v8;
  v163[1] = v8;
  *(_OWORD *)md = v8;
  *(_OWORD *)&unsigned __int8 md[16] = v8;
  SHA512(d, 0x20uLL, md);
  md[0] &= 0xF8u;
  md[31] = md[31] & 0x3F | 0x40;
  *(void *)&c.num = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.u.p[96] = v9;
  *(_OWORD *)&c.u.p[112] = v9;
  *(_OWORD *)&c.u.p[64] = v9;
  *(_OWORD *)&c.u.p[80] = v9;
  *(_OWORD *)&c.u.p[32] = v9;
  *(_OWORD *)&c.u.p[48] = v9;
  *(_OWORD *)c.u.d = v9;
  *(_OWORD *)&c.u.p[16] = v9;
  *(_OWORD *)&c.h[6] = v9;
  *(_OWORD *)&c.Nl = v9;
  *(_OWORD *)&c.h[2] = v9;
  *(_OWORD *)&c.h[4] = v9;
  *(_OWORD *)c.h = v9;
  SHA512_Init(&c);
  SHA512_Update(&c, v163, 0x20uLL);
  SHA512_Update(&c, a2, a3);
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v159 = v10;
  __int128 v160 = v10;
  *(_OWORD *)v158 = v10;
  *(_OWORD *)&v158[16] = v10;
  SHA512_Final(v158, &c);
  x25519_sc_reduce((unsigned __int16 *)v158);
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v154[8] = v11;
  v154[9] = v11;
  v154[6] = v11;
  v154[7] = v11;
  v154[4] = v11;
  v154[5] = v11;
  v154[2] = v11;
  v154[3] = v11;
  v154[0] = v11;
  v154[1] = v11;
  x25519_ge_scalarmult_base(v154, (int8x16_t *)v158);
  x25519_ge_tobytes(a1, (uint64_t)v154);
  SHA512_Init(&c);
  SHA512_Update(&c, a1, 0x20uLL);
  SHA512_Update(&c, d + 32, 0x20uLL);
  SHA512_Update(&c, a2, a3);
  *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v156 = v12;
  __int128 v157 = v12;
  *(_OWORD *)v155 = v12;
  *(_OWORD *)&v155[16] = v12;
  SHA512_Final(v155, &c);
  x25519_sc_reduce((unsigned __int16 *)v155);
  unsigned int v13 = *(unsigned __int16 *)v155 | ((v155[2] & 0x1F) << 16);
  unsigned int v14 = *(unsigned __int16 *)&v155[21] | ((v155[23] & 0x1F) << 16);
  unsigned int v15 = *(unsigned __int16 *)md | ((md[2] & 0x1F) << 16);
  unsigned int v16 = *(unsigned __int16 *)&md[21] | ((md[23] & 0x1F) << 16);
  unint64_t v17 = ((unint64_t)*(unsigned int *)&v155[2] >> 5) & 0x1FFFFF;
  unint64_t v18 = ((unint64_t)(v155[5] | (v155[6] << 8) | (v155[7] << 16)) >> 2) & 0x1FFFFF;
  unint64_t v19 = ((unint64_t)*(unsigned int *)&md[2] >> 5) & 0x1FFFFF;
  unint64_t v20 = ((unint64_t)(md[5] | (md[6] << 8) | (md[7] << 16)) >> 2) & 0x1FFFFF;
  unint64_t v153 = v19 * v17
       + v15 * (unint64_t)v18
       + v20 * v13
       + (((unint64_t)(v158[5] | (v158[6] << 8) | (v158[7] << 16)) >> 2) & 0x1FFFFF);
  unint64_t v21 = ((unint64_t)*(unsigned int *)&v155[7] >> 7) & 0x1FFFFF;
  unint64_t v22 = ((unint64_t)*(unsigned int *)&v155[10] >> 4) & 0x1FFFFF;
  unint64_t v23 = ((unint64_t)*(unsigned int *)&md[7] >> 7) & 0x1FFFFF;
  unint64_t v24 = ((unint64_t)*(unsigned int *)&md[10] >> 4) & 0x1FFFFF;
  unint64_t v25 = v19 * (unint64_t)v21
      + v15 * v22
      + v23 * (unint64_t)v17
      + v13 * (unint64_t)v24
      + v20 * (unint64_t)v18
      + (((unint64_t)*(unsigned int *)&v158[10] >> 4) & 0x1FFFFF);
  unint64_t v26 = ((unint64_t)(v155[13] | (v155[14] << 8) | (v155[15] << 16)) >> 1) & 0x1FFFFF;
  unint64_t v27 = ((unint64_t)*(unsigned int *)&v155[15] >> 6) & 0x1FFFFF;
  unint64_t v28 = ((unint64_t)*(unsigned int *)&md[15] >> 6) & 0x1FFFFF;
  unint64_t v29 = ((unint64_t)(md[13] | (md[14] << 8) | (md[15] << 16)) >> 1) & 0x1FFFFF;
  unint64_t v151 = v26 * (unint64_t)v19
       + v15 * (unint64_t)v27
       + v23 * (unint64_t)v21
       + v18 * (unint64_t)v24
       + v20 * (unint64_t)v22
       + v13 * (unint64_t)v28
       + v29 * (unint64_t)v17
       + (((unint64_t)*(unsigned int *)&v158[15] >> 6) & 0x1FFFFF);
  unint64_t v30 = (v155[18] | ((unint64_t)v155[19] << 8) | ((unint64_t)v155[20] << 16)) >> 3;
  unint64_t v31 = (md[18] | ((unint64_t)md[19] << 8) | ((unint64_t)md[20] << 16)) >> 3;
  unint64_t v150 = v30 * (unint64_t)v19
       + v15 * (unint64_t)v14
       + v26 * (unint64_t)v23
       + v24 * (unint64_t)v22
       + v20 * (unint64_t)v27
       + v18 * (unint64_t)v28
       + v29 * (unint64_t)v21
       + v31 * (unint64_t)v17
       + v16 * (unint64_t)v13
       + *(unsigned __int16 *)&v158[21]
       + ((unint64_t)(v158[23] & 0x1F) << 16);
  unint64_t v32 = ((unint64_t)*(unsigned int *)&v155[23] >> 5) & 0x1FFFFF;
  unint64_t v33 = ((unint64_t)(HIBYTE(*(_DWORD *)&v155[23]) | (v155[27] << 8) | (v155[28] << 16)) >> 2) & 0x1FFFFF;
  unint64_t v34 = ((unint64_t)*(unsigned int *)&md[23] >> 5) & 0x1FFFFF;
  unint64_t v35 = ((unint64_t)(HIBYTE(*(_DWORD *)&md[23]) | (md[27] << 8) | (md[28] << 16)) >> 2) & 0x1FFFFF;
  unint64_t v149 = v19 * v32
       + v15 * v33
       + v30 * (unint64_t)v23
       + v24 * (unint64_t)v27
       + v20 * (unint64_t)v14
       + v28 * (unint64_t)v22
       + v29 * (unint64_t)v26
       + v31 * (unint64_t)v21
       + v34 * v17
       + v16 * (unint64_t)v18
       + v35 * v13
       + (((unint64_t)(HIBYTE(*(_DWORD *)&v158[23]) | (v158[27] << 8) | (v158[28] << 16)) >> 2) & 0x1FFFFF);
  unint64_t v36 = (*(unsigned __int16 *)v158 | ((unint64_t)(v158[2] & 0x1F) << 16)) + v15 * (unint64_t)v13;
  unint64_t v37 = v13 * (unint64_t)v19
      + v15 * (unint64_t)v17
  unint64_t v152 = v36 - ((v36 + 0x100000) & 0xFFFFFE00000LL);
  unint64_t v38 = v18 * (unint64_t)v19
      + v15 * (unint64_t)v21
      + v13 * (unint64_t)v23
      + v20 * (unint64_t)v17
      + (((unint64_t)*(unsigned int *)&v158[7] >> 7) & 0x1FFFFF);
  unint64_t v147 = v19 * (unint64_t)v22
       + v15 * (unint64_t)v26
       + v18 * (unint64_t)v23
       + v24 * (unint64_t)v17
       + v20 * (unint64_t)v21
       + v29 * (unint64_t)v13
       + ((v25 + 0x100000) >> 21)
       + (((unint64_t)(v158[13] | (v158[14] << 8) | (v158[15] << 16)) >> 1) & 0x1FFFFF);
  unint64_t v39 = v25 - ((v25 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v145 = v19 * (unint64_t)v27
       + v15 * (unint64_t)v30
       + v23 * (unint64_t)v22
       + v24 * (unint64_t)v21
       + v20 * (unint64_t)v26
       + v28 * (unint64_t)v17
       + v29 * (unint64_t)v18
       + v31 * (unint64_t)v13
       + ((v158[18] | ((unint64_t)v158[19] << 8) | ((unint64_t)v158[20] << 16)) >> 3);
  unint64_t v144 = v14 * (unint64_t)v19
       + v15 * (unint64_t)v32
       + v23 * (unint64_t)v27
       + v26 * (unint64_t)v24
       + v20 * (unint64_t)v30
       + v28 * (unint64_t)v21
       + v29 * (unint64_t)v22
       + v31 * (unint64_t)v18
       + v13 * (unint64_t)v34
       + v16 * (unint64_t)v17
       + (((unint64_t)*(unsigned int *)&v158[23] >> 5) & 0x1FFFFF);
  unint64_t v40 = (unint64_t)*(unsigned int *)&v155[28] >> 7;
  unint64_t v41 = v33 * (unint64_t)v19 + v15 * (unint64_t)v40;
  unint64_t v42 = (unint64_t)*(unsigned int *)&md[28] >> 7;
  unint64_t v43 = v41
      + v14 * (unint64_t)v23
      + v30 * (unint64_t)v24
      + v20 * (unint64_t)v32
      + v26 * (unint64_t)v28
      + v29 * (unint64_t)v27
      + v31 * (unint64_t)v22
      + v18 * (unint64_t)v34
      + v16 * (unint64_t)v21
      + v13 * (unint64_t)v42;
  unint64_t v44 = v19 * (unint64_t)v40
      + v23 * (unint64_t)v32
      + v14 * (unint64_t)v24
      + v20 * (unint64_t)v33
      + v28 * (unint64_t)v27
      + v29 * (unint64_t)v30
      + v31 * (unint64_t)v26
      + v34 * (unint64_t)v21
      + v16 * (unint64_t)v22
      + v42 * (unint64_t)v17;
  unint64_t v45 = v43
      + v35 * (unint64_t)v17
      + ((unint64_t)*(unsigned int *)&v158[28] >> 7);
  unint64_t v46 = v44 + v35 * (unint64_t)v18;
  unint64_t v47 = v23 * (unint64_t)v40
      + v33 * (unint64_t)v24
      + v14 * (unint64_t)v28
      + v29 * (unint64_t)v32
      + v31 * (unint64_t)v30
      + v26 * (unint64_t)v34
      + v16 * (unint64_t)v27
      + v42 * (unint64_t)v21;
  unint64_t v48 = v33 * (unint64_t)v23
      + v24 * (unint64_t)v32
      + v20 * (unint64_t)v40
      + v30 * (unint64_t)v28
      + v29 * (unint64_t)v14
      + v31 * (unint64_t)v27
      + v34 * (unint64_t)v22
      + v16 * (unint64_t)v26
      + v18 * (unint64_t)v42
      + v35 * (unint64_t)v21;
  unint64_t v49 = v31 * (unint64_t)v40
      + v34 * (unint64_t)v32
      + v16 * (unint64_t)v33
      + v30 * (unint64_t)v42
      + v35 * (unint64_t)v14;
  unint64_t v50 = v33 * (unint64_t)v34
      + v16 * (unint64_t)v40
      + v14 * (unint64_t)v42
      + v35 * (unint64_t)v32
      + ((v49 + 0x100000) >> 21);
  unint64_t v51 = v47 + v35 * (unint64_t)v22;
  unint64_t v52 = v24 * (unint64_t)v40
      + v28 * (unint64_t)v32
      + v29 * (unint64_t)v33
      + v31 * (unint64_t)v14
      + v34 * (unint64_t)v27
      + v16 * (unint64_t)v30
      + v42 * (unint64_t)v22;
  unint64_t v53 = v33 * (unint64_t)v28
      + v29 * (unint64_t)v40
      + v31 * (unint64_t)v32
      + v30 * (unint64_t)v34
      + v16 * (unint64_t)v14
      + v26 * (unint64_t)v42;
  unint64_t v54 = v28 * (unint64_t)v40
      + v31 * (unint64_t)v33
      + v14 * (unint64_t)v34;
  unint64_t v55 = v38 + ((v153 + 0x100000) >> 21);
  unint64_t v56 = v48 + ((v46 + 0x100000) >> 21);
  unint64_t v57 = v53 + v35 * (unint64_t)v27;
  unint64_t v58 = v52 + v35 * (unint64_t)v26 + ((v51 + 0x100000) >> 21);
  unint64_t v59 = v54
      + v16 * (unint64_t)v32
      + v42 * (unint64_t)v27
      + v35 * (unint64_t)v30
      + ((v57 + 0x100000) >> 21);
  unint64_t v60 = v34 * (unint64_t)v40
      + v42 * (unint64_t)v32
      + v35 * (unint64_t)v33;
  unint64_t v61 = v33 * (unint64_t)v42
      + v35 * (unint64_t)v40
      + ((v60 + 0x100000) >> 21);
  unint64_t v62 = v42 * (unint64_t)v40;
  unint64_t v63 = (v62 + 0x100000) >> 21;
  unint64_t v64 = v37 + 0x100000;
  unint64_t v146 = v37 - ((v37 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v148 = v39 + ((v55 + 0x100000) >> 21);
  unint64_t v65 = v49 - ((v49 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v59 + 0x100000) >> 21);
  unint64_t v66 = v59 - ((v59 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v67 = v60 - ((v60 + 0x100000) & 0x1FFFFFFE00000LL) + ((v50 + 0x100000) >> 21);
  unint64_t v68 = v50 - ((v50 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v69 = v62 - ((v62 + 0x100000) & 0x7FFFFFFE00000LL) + ((v61 + 0x100000) >> 21);
  unint64_t v70 = v61 - ((v61 + 0x100000) & 0x1FFFFFFE00000LL);
  unint64_t v71 = v57 - 683901LL * (int)v63 - ((v57 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v72 = v51 - 997805LL * (int)v63 - ((v51 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v73 = v46 + 470296LL * v63 - ((v46 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v74 = v145 + ((v151 + 0x100000) >> 21);
  unint64_t v75 = v144 + ((v150 + 0x100000) >> 21);
  unint64_t v76 = 666643 * v67
      + 470296 * v68
      + 654183 * v65
      + v150
      + ((v74 + 0x100000) >> 21)
      - ((v150 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v77 = v45 + ((v149 + 0x100000) >> 21);
  unint64_t v78 = 666643 * v69
      + 470296 * v70
      + 654183 * v67
      - 997805 * v68
      + 136657 * v65
      + ((v75 + 0x100000) >> 21)
      + v149
      - ((v149 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v79 = 666643 * v68 + 470296 * v65 + v74 - ((v74 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v80 = 666643 * v70 + 470296 * v67 + 654183 * v68 - 997805 * v65 + v75 - ((v75 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v81 = v73 + 654183 * v69 - 997805 * v70 + 136657 * v67 - 683901 * v68 + ((v77 + 0x100000) >> 21);
  unint64_t v82 = 470296 * v69
      + 666643LL * v63
      + 654183 * v70
      - 997805 * v67
      + 136657 * v68
      - 683901 * v65
      + v77
      - ((v77 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v83 = v72 + ((v56 + 0x100000) >> 21);
  unint64_t v84 = v56
      + 654183LL * v63
      - ((v56 + 0x100000) & 0xFFFFFFFFFFE00000LL)
      - 997805 * v69
      + 136657 * v70
      - 683901 * v67
      + ((uint64_t)(v81 + 0x100000) >> 21);
  unint64_t v85 = v58 + 136657LL * v63;
  v58 += 0x100000LL;
  unint64_t v86 = v71 + (v58 >> 21);
  unint64_t v87 = v151 + 666643 * v65 - ((v151 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v147 + 0x100000) >> 21);
  unint64_t v88 = v80 + ((uint64_t)(v76 + 0x100000) >> 21);
  uint64_t v89 = v83 + 136657 * v69 - 683901 * v70;
  unint64_t v90 = v82 + ((uint64_t)(v78 + 0x100000) >> 21);
  unint64_t v91 = v85 - (v58 & 0xFFFFFFFFFFE00000LL) - 683901 * v69 + ((v89 + 0x100000) >> 21);
  unint64_t v92 = v66 + ((uint64_t)(v86 + 0x100000) >> 21);
  unint64_t v93 = v86 - ((v86 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v94 = v81 - ((v81 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((uint64_t)(v90 + 0x100000) >> 21);
  unint64_t v95 = v90 - ((v90 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v96 = v89 - ((v89 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((uint64_t)(v84 + 0x100000) >> 21);
  unint64_t v97 = v84 - ((v84 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v98 = v93 + ((uint64_t)(v91 + 0x100000) >> 21);
  unint64_t v99 = v91 - ((v91 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v100 = v78 - 683901 * v92 + ((uint64_t)(v88 + 0x100000) >> 21) - ((v78 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v101 = v79 + ((uint64_t)(v87 + 0x100000) >> 21);
  unint64_t v102 = -997805LL * v92
       + 136657 * v98
       - 683901 * v99
       + v76
  unint64_t v103 = v87 + 470296 * v92 - ((v87 + 0x100000) & 0xFFFFFFFFFFE00000LL);
  unint64_t v104 = v152 + 666643 * v94;
  uint64_t v105 = v146 + 470296 * v94 + 666643 * v97 + ((uint64_t)(v104 + 0x100000) >> 21);
  uint64_t v106 = v103 + 654183 * v98 - 997805 * v99 + 136657 * v96 - 683901 * v97;
  unint64_t v107 = v101
       + 654183 * v92
       - 997805 * v98
       + 136657 * v99
       - ((v101 + 0x100000) & 0xFFFFFFFFFFE00000LL)
       - 683901 * v96
       + ((v106 + 0x100000) >> 21);
  unint64_t v108 = 136657 * v92
       - 683901 * v98
       + v88
       - ((v88 + 0x100000) & 0xFFFFFFFFFFE00000LL)
       + ((uint64_t)(v102 + 0x100000) >> 21);
  unint64_t v109 = v95 + ((uint64_t)(v100 + 0x100000) >> 21);
  uint64_t v110 = (uint64_t)(v109 + 0x100000) >> 21;
  unint64_t v111 = v153 + (v64 >> 21) - ((v153 + 0x100000) & 0xFFFFFFFFFFE00000LL) + 654183 * v94 + 666643 * v96 + 470296 * v97;
  unint64_t v112 = v55
       - ((v55 + 0x100000) & 0xFFFFFFFFFFE00000LL)
       + 666643 * v99
       - 997805 * v94
       + 470296 * v96
       + 654183 * v97
       + ((uint64_t)(v111 + 0x100000) >> 21);
  unint64_t v113 = v147 + 666643 * v92 - ((v147 + 0x100000) & 0xFFFFFFFFFFE00000LL) + 470296 * v98 + 654183 * v99 - 683901 * v94;
  uint64_t v114 = v148 + 666643 * v98 + 470296 * v99 + 136657 * v94 + 654183 * v96 - 997805 * v97;
  uint64_t v115 = v113 - 997805 * v96 + 136657 * v97 + ((v114 + 0x100000) >> 21);
  unint64_t v116 = v100 + ((uint64_t)(v108 + 0x100000) >> 21);
  int64_t v117 = v104 - ((v104 + 0x100000) & 0xFFFFFFFFFFE00000LL) + 666643 * v110;
  unint64_t v118 = (v100 + 0x100000) & 0xFFFFFFFFFFE00000LL;
  int64_t v119 = v105 + 470296 * v110 - ((v105 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v117 >> 21);
  uint64_t v120 = v117 & 0x1FFFFF;
  int64_t v121 = v111 + 654183 * v110 - ((v111 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v105 + 0x100000) >> 21) + (v119 >> 21);
  int64_t v122 = v112 - 997805 * v110 - ((v112 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v121 >> 21);
  int64_t v123 = v114
       + 136657 * v110
       - ((v114 + 0x100000) & 0xFFFFFFFFFFE00000LL)
  int64_t v124 = v115 - 683901 * v110 - ((v115 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v123 >> 21);
  int64_t v125 = v106 - ((v106 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((v115 + 0x100000) >> 21) + (v124 >> 21);
  int64_t v126 = v107 - ((v107 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v125 >> 21);
  int64_t v127 = v102 - ((v102 + 0x100000) & 0xFFFFFFFFFFE00000LL) + ((uint64_t)(v107 + 0x100000) >> 21) + (v126 >> 21);
  int64_t v128 = v108 - ((v108 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v127 >> 21);
  uint64_t v129 = v116 - v118 + (v128 >> 21);
  int64_t v130 = v109 - ((v109 + 0x100000) & 0xFFFFFFFFFFE00000LL) + (v129 >> 21);
  uint64_t v131 = v120 + 666643 * (v130 >> 21);
  a1[33] = BYTE1(v131);
  uint64_t v132 = (v119 & 0x1FFFFF) + 470296 * (v130 >> 21) + (v131 >> 21);
  a1[32] = v131;
  a1[34] = ((v120 + 666643 * (v130 >> 21)) >> 16) & 0x1F | (32
                                                                                      * (v119
                                                                                       + 24 * (v130 >> 21)
                                                                                       + (v131 >> 21)));
  a1[35] = (unint64_t)v132 >> 3;
  a1[36] = (unint64_t)v132 >> 11;
  uint64_t v133 = (v121 & 0x1FFFFF) + 654183 * (v130 >> 21) + (v132 >> 21);
  a1[37] = (v132 >> 19) & 3 | (4 * (v121 + 103 * (v130 >> 21) + (v132 >> 21)));
  a1[38] = (unint64_t)v133 >> 6;
  uint64_t v134 = (v122 & 0x1FFFFF) - 997805 * (v130 >> 21) + (v133 >> 21);
  a1[39] = (v133 >> 14) & 0x7F | (((_BYTE)v112
                                               - -83 * (_BYTE)v110
                                               + (v121 >> 21)
  a1[40] = (unint64_t)v134 >> 1;
  a1[41] = (unint64_t)v134 >> 9;
  uint64_t v135 = (v123 & 0x1FFFFF) + 136657 * (v130 >> 21) + (v134 >> 21);
  a1[42] = (v134 >> 17) & 0xF | (16 * (v123 - 47 * (v130 >> 21) + (v134 >> 21)));
  a1[43] = (unint64_t)v135 >> 4;
  a1[44] = (unint64_t)v135 >> 12;
  uint64_t v136 = (v124 & 0x1FFFFF) - 683901 * (v130 >> 21) + (v135 >> 21);
  a1[45] = ((v135 & 0x100000) != 0) | (2 * (v124 - 125 * (v130 >> 21) + (v135 >> 21)));
  a1[46] = (unint64_t)v136 >> 7;
  uint64_t v137 = (v125 & 0x1FFFFF) + (v136 >> 21);
  a1[47] = (v136 >> 15) & 0x3F | (((_BYTE)v125 + (v136 >> 21)) << 6);
  a1[48] = (unint64_t)v137 >> 2;
  a1[49] = (unint64_t)v137 >> 10;
  uint64_t v138 = (v126 & 0x1FFFFF) + (v137 >> 21);
  a1[50] = (v137 >> 18) & 7 | (8 * (v126 + (v137 >> 21)));
  a1[51] = (unint64_t)v138 >> 5;
  uint64_t v139 = (v127 & 0x1FFFFF) + (v138 >> 21);
  a1[52] = (unint64_t)v138 >> 13;
  a1[54] = BYTE1(v139);
  uint64_t v140 = (v128 & 0x1FFFFF) + (v139 >> 21);
  a1[53] = v139;
  a1[55] = BYTE2(v139) & 0x1F | (32 * (v128 + (v139 >> 21)));
  a1[56] = (unint64_t)v140 >> 3;
  a1[57] = (unint64_t)v140 >> 11;
  uint64_t v141 = (v129 & 0x1FFFFF) + (v140 >> 21);
  a1[58] = (v140 >> 19) & 3 | (4 * v141);
  a1[59] = (unint64_t)v141 >> 6;
  unint64_t v142 = (v130 & 0x1FFFFF) + (v141 >> 21);
  a1[60] = (v141 >> 14) & 0x7F | ((_BYTE)v142 << 7);
  a1[61] = v142 >> 1;
  a1[62] = v142 >> 9;
  a1[63] = v142 >> 17;
  return 1LL;
}

uint64_t ED25519_verify(const void *a1, size_t a2, unsigned __int8 *a3, int64x2_t *a4)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  if (a3[63] <= 0x1Fu)
  {
    v8.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v8.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    v34[1] = v8;
    v34[2] = v8;
    v33[6] = v8;
    v34[0] = v8;
    v33[4] = v8;
    v33[5] = v8;
    v33[2] = v8;
    v33[3] = v8;
    v33[0] = v8;
    v33[1] = v8;
    uint64_t result = x25519_ge_frombytes_vartime((uint64_t)v33, a4);
    if (!(_DWORD)result) {
      return result;
    }
    unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
    v10.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v10.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    v31[0] = v10;
    v31[1] = v10;
    fe_neg(v31, v33);
    fe_carry((unint64_t *)v33, v31);
    fe_neg(v31, (int64x2_t *)((char *)v34 + 8));
    fe_carry((unint64_t *)v34 + 1, v31);
    uint64_t v11 = 0LL;
    __int128 v12 = *((_OWORD *)a3 + 1);
    v62[0] = *(_OWORD *)a3;
    v62[1] = v12;
    __int128 v13 = *((_OWORD *)a3 + 3);
    v61[0] = *((_OWORD *)a3 + 2);
    v61[1] = v13;
    do
    {
      unint64_t v14 = (*((unsigned __int8 *)&v61[1] + (int)v11 + 8) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 9) << 8) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 10) << 16) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 11) << 24) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 12) << 32) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 13) << 40))
      unint64_t v15 = *(void *)((char *)&ED25519_verify_kOrder + v11 + 24);
      v11 -= 8LL;
      if (v14 > v15) {
        break;
      }
      if (v14 < v15)
      {
        *(void *)&c.num = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&c.u.p[112] = v16;
        *(_OWORD *)&c.u.p[96] = v16;
        *(_OWORD *)&c.u.p[80] = v16;
        *(_OWORD *)&c.u.p[64] = v16;
        *(_OWORD *)&c.u.p[48] = v16;
        *(_OWORD *)&c.u.p[32] = v16;
        *(_OWORD *)&c.u.p[16] = v16;
        *(_OWORD *)c.u.d = v16;
        *(_OWORD *)&c.Nl = v16;
        *(_OWORD *)&c.h[6] = v16;
        *(_OWORD *)&c.h[4] = v16;
        *(_OWORD *)&c.h[2] = v16;
        *(_OWORD *)c.h = v16;
        SHA512_Init(&c);
        SHA512_Update(&c, a3, 0x20uLL);
        SHA512_Update(&c, a4, 0x20uLL);
        SHA512_Update(&c, a1, a2);
        *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v59 = v17;
        __int128 v58 = v17;
        __int128 v57 = v17;
        *(_OWORD *)md = v17;
        SHA512_Final(md, &c);
        x25519_sc_reduce((unsigned __int16 *)md);
        unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v29[5] = v18;
        v29[6] = v18;
        v29[3] = v18;
        v29[4] = v18;
        v29[1] = v18;
        v29[2] = v18;
        v29[0] = v18;
        v65[15] = v18;
        v65[14] = v18;
        v65[13] = v18;
        v65[12] = v18;
        v65[11] = v18;
        v65[10] = v18;
        v65[9] = v18;
        v65[8] = v18;
        v65[7] = v18;
        v65[6] = v18;
        v65[5] = v18;
        v65[4] = v18;
        v65[3] = v18;
        v65[2] = v18;
        v65[1] = v18;
        v65[0] = v18;
        v64[15] = v18;
        v64[14] = v18;
        v64[13] = v18;
        v64[12] = v18;
        v64[11] = v18;
        v64[10] = v18;
        v64[9] = v18;
        v64[8] = v18;
        v64[7] = v18;
        v64[6] = v18;
        v64[5] = v18;
        v64[4] = v18;
        v64[3] = v18;
        v64[2] = v18;
        v64[1] = v18;
        v64[0] = v18;
        memset(__b, 170, sizeof(__b));
        v19.i64[0] = 0xAAAAAAAAAAAAAAAALL;
        v19.i64[1] = 0xAAAAAAAAAAAAAAAALL;
        v43[1] = v19;
        v43[2] = v19;
        v42[1] = v19;
        v43[0] = v19;
        v41[2] = v19;
        v42[0] = v19;
        v41[0] = v19;
        v41[1] = v19;
        v40[0] = v19;
        v40[1] = v19;
        v39[1] = v19;
        uint64_t v39[2] = v19;
        v38[1] = v19;
        v39[0] = v19;
        _OWORD v37[2] = v19;
        v38[0] = v19;
        v37[0] = v19;
        v37[1] = v19;
        v36[0] = v19;
        v36[1] = v19;
        v35[8] = v19;
        v35[9] = v19;
        v35[6] = v19;
        v35[7] = v19;
        void v35[4] = v19;
        v35[5] = v19;
        v35[2] = v19;
        v35[3] = v19;
        v35[0] = v19;
        v35[1] = v19;
        slide((uint64_t)v65, (uint64_t)md);
        slide((uint64_t)v64, (uint64_t)v61);
        x25519_ge_p3_to_cached((uint64_t)__b, (uint64_t)v33);
        unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
        v20.i64[0] = 0xAAAAAAAAAAAAAAAALL;
        v20.i64[1] = 0xAAAAAAAAAAAAAAAALL;
        int64x2_t v49 = v20;
        int64x2_t v50 = v20;
        int64x2_t v47 = v20;
        int64x2_t v48 = v20;
        int64x2_t v45 = v20;
        int64x2_t v46 = v20;
        int64x2_t v44 = v20;
        ge_p3_to_p2((uint64_t)&v44, (__int128 *)v33[0].i8);
        ge_p2_dbl((uint64_t)v40, (uint64_t)&v44);
        x25519_ge_p1p1_to_p3((uint64_t)v35, (unint64_t *)v40);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)__b);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[10], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[10]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[20], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[20]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[30], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[30]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[40], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[40]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[50], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[50]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[60], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[60]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[70], (uint64_t)v36);
        ge_p2_0((uint64_t)v29);
        unsigned int v21 = 255;
        while (1)
        {
          uint64_t v22 = v21;
          if (*((_BYTE *)v65 + v21) || *((_BYTE *)v64 + v21)) {
            break;
          }
          --v21;
          if (!(_DWORD)v22) {
            goto LABEL_25;
          }
        }

        if ((v21 & 0x80000000) == 0)
        {
          do
          {
            ge_p2_dbl((uint64_t)v40, (uint64_t)v29);
            unint64_t v23 = *((unsigned __int8 *)v65 + v22);
            if (*((char *)v65 + v22) < 1)
            {
              if ((v23 & 0x80) != 0)
              {
                x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
                x25519_ge_sub( (uint64_t)v40,  (uint64_t)v36,  (unint64_t *)&__b[10 * (-(char)v23 >> 1)]);
              }
            }

            else
            {
              x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
              x25519_ge_add((uint64_t)v40, (uint64_t)v36, (unint64_t *)&__b[10 * (v23 >> 1)]);
            }

            int v24 = *((char *)v64 + v22);
            if (v24 < 1)
            {
              if (v24 < 0)
              {
                x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
                v46.i64[0] = 0xAAAAAAAAAAAAAAAALL;
                unint64_t v25 = &Bi[15 * (-(char)v24 >> 1)];
                v26.i64[0] = 0xAAAAAAAAAAAAAAAALL;
                v26.i64[1] = 0xAAAAAAAAAAAAAAAALL;
                int64x2_t v44 = v26;
                int64x2_t v45 = v26;
                unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
                v54[1] = v26;
                v54[0] = v26;
                unint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
                v52[0] = v26;
                v52[1] = v26;
                fe_add(v40, (int64x2_t *)((char *)v37 + 8), v36);
                fe_sub((int64x2_t *)((char *)v41 + 8), (int64x2_t *)((char *)v37 + 8), v36);
                fe_mul_impl((uint64_t)v54, (unint64_t *)v40, v25 + 5);
                fe_mul_impl((uint64_t)&v44, (unint64_t *)v41 + 1, v25);
                fe_mul_impl((uint64_t)v52, v25 + 10, (unint64_t *)v39 + 1);
                fe_add((int64x2_t *)((char *)v43 + 8), v38, v38);
                fe_sub(v40, v54, &v44);
                fe_add((int64x2_t *)((char *)v41 + 8), v54, &v44);
                fe_carry((unint64_t *)v54, (void *)v43 + 1);
                fe_sub(v42, v54, v52);
                fe_add((int64x2_t *)((char *)v43 + 8), v54, v52);
              }
            }

            else
            {
              x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
              ge_madd((uint64_t)v40, (uint64_t)v36, &Bi[15 * (v24 >> 1)]);
            }

            x25519_ge_p1p1_to_p2((uint64_t)v29, (unint64_t *)v40);
          }

          while (v22-- > 0);
        }

uint64_t slide(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0LL; i != 256; ++i)
    *(_BYTE *)(result + i) = (*(unsigned __int8 *)(a2 + (i >> 3)) >> (i & 7)) & 1;
  unint64_t v3 = 0LL;
  uint64_t v4 = result + 1;
  uint64_t v5 = 1LL;
  do
  {
    if (*(_BYTE *)(result + v3) && v3 <= 0xFE)
    {
      unint64_t v6 = v3;
      unint64_t v7 = 1LL;
      uint64_t v8 = v5;
      do
      {
        int v9 = *(char *)(result + v8);
        if (*(_BYTE *)(result + v8))
        {
          int v10 = *(char *)(result + v3);
          int v11 = v9 << v7;
          int v12 = (v9 << v7) + v10;
          if (v12 > 15)
          {
            int v13 = v10 - v11;
            if (v13 < -15) {
              break;
            }
            *(_BYTE *)(result + v3) = v13;
            unint64_t v14 = v6;
            while (*(_BYTE *)(v4 + v14))
            {
              *(_BYTE *)(v4 + v14++) = 0;
              if (v14 >= 0xFF) {
                goto LABEL_16;
              }
            }

            *(_BYTE *)(v4 + v14) = 1;
          }

          else
          {
            *(_BYTE *)(result + v3) = v12;
            *(_BYTE *)(result + v_Block_object_dispose(va, 8) = 0;
          }
        }

int BN_bn2bin(const BIGNUM *a, unsigned __int8 *to)
{
  unsigned int v4 = BN_num_bytes(a);
  bn_words_to_big_endian((char *)to, v4, (char *)a->d, a->top);
  return v4;
}

void *bssl::ssl_session_new@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unsigned int v4 = a1;
  uint64_t result = bssl::New<ssl_session_st,bssl::SSL_X509_METHOD const*&>(&v4);
  *a2 = result;
  return result;
}

uint64_t bssl::ssl_hash_session_id(int *__src, size_t __n)
{
  p_dst = __src;
  int __dst = -1431655766;
  if (__n <= 3)
  {
    int __dst = 0;
    if (__n) {
      memcpy(&__dst, __src, __n);
    }
    p_dst = &__dst;
  }

  return *p_dst;
}

void bssl::ssl_session_renew_timeout(bssl *this, ssl_st *a2, ssl_session_st *a3)
{
  unsigned int v3 = a3;
  bssl::ssl_session_rebase_time(this, a2, a3);
  if (LODWORD(a2->cipher_list) <= v3)
  {
    unsigned int cipher_list_high = HIDWORD(a2->cipher_list);
    if (cipher_list_high >= v3) {
      unsigned int cipher_list_high = v3;
    }
    LODWORD(a2->cipher_list) = cipher_list_high;
  }

void bssl::ssl_set_session(ssl_st **this, SSL_SESSION *a2, ssl_session_st *a3)
{
  unsigned int v3 = (SSL_SESSION **)(this + 13);
  if (this[13] != (ssl_st *)a2)
  {
    if (a2) {
      CRYPTO_refcount_inc((unsigned int *)a2);
    }
    std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](v3, a2);
  }

uint64_t bssl::ssl_ctx_rotate_ticket_encryption_key(bssl *this, ssl_ctx_st *a2)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  bssl::ssl_ctx_get_current_time((uint64_t)this, (uint64_t)v13);
  int v12 = (pthread_rwlock_t *)0xAAAAAAAAAAAAAAAALL;
  bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_read),&(CRYPTO_MUTEX_unlock_read)>::MutexLockBase( &v12,  (pthread_rwlock_t *)((char *)this + 24));
  uint64_t v3 = *((void *)this + 65);
  if (!v3
    || (unint64_t)(*(void *)(v3 + 48) - 1LL) < v13[0]
    || (uint64_t v4 = *((void *)this + 66)) != 0 && *(void *)(v4 + 48) <= v13[0])
  {
    CRYPTO_MUTEX_unlock_read(v12);
    unint64_t v6 = (void **)((char *)this + 520);
    int v12 = (pthread_rwlock_t *)0xAAAAAAAAAAAAAAAALL;
    bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_write),&(CRYPTO_MUTEX_unlock_write)>::MutexLockBase( &v12,  (pthread_rwlock_t *)((char *)this + 24));
    if (!*((void *)this + 65) || (unint64_t)(*(void *)(*((void *)this + 65) + 48LL) - 1LL) < v13[0])
    {
      unint64_t v7 = (unsigned __int8 *)OPENSSL_malloc(0x38uLL);
      uint64_t v8 = v7;
      if (!v7)
      {
        uint64_t v5 = 0LL;
LABEL_17:
        CRYPTO_MUTEX_unlock_read(v12);
        return v5;
      }

      *((void *)v7 + 6) = 0LL;
      *((_OWORD *)v7 + 1) = 0u;
      *((_OWORD *)v7 + 2) = 0u;
      *(_OWORD *)unint64_t v7 = 0u;
      RAND_bytes(v7, 16);
      RAND_bytes(v8 + 16, 16);
      RAND_bytes(v8 + 32, 16);
      *((void *)v8 + 6) = v13[0] + 172800LL;
      int v9 = *v6;
      if (*v6)
      {
        v9[6] += 172800LL;
        *((void *)this + 65) = 0LL;
        std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((void **)this + 66, v9);
      }

      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((void **)this + 65, v8);
    }

    uint64_t v10 = *((void *)this + 66);
    if (v10 && *(void *)(v10 + 48) <= v13[0]) {
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((void **)this + 66, 0LL);
    }
    uint64_t v5 = 1LL;
    goto LABEL_17;
  }

  CRYPTO_MUTEX_unlock_read(v12);
  return 1LL;
}

void sub_1875DC3B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, pthread_rwlock_t *a10)
{
}

BOOL bssl::ssl_encrypt_ticket(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v31 = 0LL;
  if (!SSL_SESSION_to_bytes_for_ticket(a3, &v31, &v30)) {
    return 0LL;
  }
  unint64_t v6 = v30;
  uint64_t v5 = v31;
  uint64_t v7 = *a1;
  uint64_t v8 = *(void *)(*(void *)(*a1 + 128LL) + 784LL);
  if (!v8)
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v37 = v13;
    __int128 v38 = v13;
    *(_OWORD *)&ctx.key[116] = v13;
    __int128 v36 = v13;
    *(_OWORD *)&ctx.key[84] = v13;
    *(_OWORD *)&ctx.key[100] = v13;
    *(_OWORD *)&ctx.key[52] = v13;
    *(_OWORD *)&ctx.key[68] = v13;
    *(_OWORD *)&ctx.key[36] = v13;
    EVP_CIPHER_CTX_init((EVP_CIPHER_CTX *)&ctx.key[36]);
    ctx.o_ctx.md_data = (void *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx.i_ctx.md_data = v14;
    *(_OWORD *)&ctx.o_ctx.engine = v14;
    *(_OWORD *)&ctx.md_ctx.md_data = v14;
    *(_OWORD *)&ctx.i_ctx.engine = v14;
    *(_OWORD *)&ctx.md = v14;
    *(_OWORD *)&ctx.md_ctx.engine = v14;
    HMAC_CTX_init(&ctx);
    if (v6 >> 7 >= 0x1FF)
    {
      int v11 = CBB_add_bytes(a2, "TICKET TOO LARGE", 0x10uLL);
LABEL_33:
      HMAC_CTX_cleanup(&ctx);
      EVP_CIPHER_CTX_cleanup((EVP_CIPHER_CTX *)&ctx.key[36]);
      goto LABEL_34;
    }

    uint64_t v17 = *(void *)(*a1 + 128LL);
    memset(&ctx.key[4], 170, 32);
    __int128 v18 = *(uint64_t (**)(void))(v17 + 536);
    if (v18)
    {
      if ((v18() & 0x80000000) != 0) {
        goto LABEL_32;
      }
    }

    else
    {
      CRYPTO_MUTEX_lock_read((pthread_rwlock_t *)(v17 + 24));
      if (!RAND_bytes(&ctx.key[20], 16)
        || (unint64_t v25 = EVP_aes_128_cbc(),
            !EVP_EncryptInit_ex( (EVP_CIPHER_CTX *)&ctx.key[36],  v25,  0LL,  (const unsigned __int8 *)(*(void *)(v17 + 520) + 32LL),  &ctx.key[20]))
        || (uint64_t v26 = *(void *)(v17 + 520),
            unint64_t v27 = EVP_sha256(),
            HMAC_Init_ex(&ctx, (const void *)(v26 + 16), 16, v27, 0LL),
            !v28))
      {
        CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)(v17 + 24));
        goto LABEL_32;
      }

      *(_OWORD *)&ctx._OWORD key[4] = *(_OWORD *)*(void *)(v17 + 520);
      CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)(v17 + 24));
    }

    out = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (CBB_add_bytes(a2, &ctx.key[4], 0x10uLL))
    {
      unsigned int v19 = EVP_CIPHER_CTX_iv_length((const EVP_CIPHER_CTX *)&ctx.key[36]);
      if (CBB_add_bytes(a2, &ctx.key[20], v19))
      {
        if (CBB_reserve(a2, &out, v6 + 32))
        {
          int outl = -1431655766;
          if (EVP_EncryptUpdate((EVP_CIPHER_CTX *)&ctx.key[36], out, &outl, v5, v6))
          {
            uint64_t v20 = outl;
            if (EVP_EncryptFinal_ex((EVP_CIPHER_CTX *)&ctx.key[36], &out[outl], &outl))
            {
              if (CBB_did_write(a2, outl + v20))
              {
                leunsigned int n = -1431655766;
                unsigned int v21 = (const unsigned __int8 *)CBB_data(a2);
                size_t v22 = CBB_len(a2);
                HMAC_Update(&ctx, v21, v22);
                if (v23)
                {
                  if (CBB_reserve(a2, &out, 64LL))
                  {
                    HMAC_Final(&ctx, out, &len);
                    if (v24)
                    {
                      int v11 = CBB_did_write(a2, len) != 0;
                      goto LABEL_33;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

void sub_1875DC7CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, HMAC_CTX *ctx)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL bssl::ssl_session_is_context_valid(bssl *this, const bssl::SSL_HANDSHAKE *a2, const ssl_session_st *a3)
{
  if (!a2) {
    return 0LL;
  }
  size_t v3 = *((unsigned __int8 *)a2 + 92);
  uint64_t v4 = *(void *)(*((void *)this + 1) + 32LL);
  if (*((_BYTE *)a2 + 92)) {
    return memcmp((char *)a2 + 93, (const void *)(v4 + 89), v3) == 0;
  }
  return 1LL;
}

BOOL bssl::ssl_session_is_time_valid(bssl *this, const ssl_st *a2, const ssl_session_st *a3)
{
  if (!a2) {
    return 0LL;
  }
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  bssl::ssl_get_current_time((uint64_t)this, (uint64_t)v6);
  cipher_list_by_id = a2->cipher_list_by_id;
  return v6[0] >= (unint64_t)cipher_list_by_id
      && v6[0] - (void)cipher_list_by_id < (unint64_t)LODWORD(a2->cipher_list);
}

uint64_t bssl::ssl_session_is_resumable(bssl *this, const EVP_MD_CTX **a2, const ssl_session_st *a3)
{
  uint64_t v5 = *(void *)this;
  uint64_t result = bssl::ssl_session_is_context_valid(this, (const bssl::SSL_HANDSHAKE *)a2, a3);
  if ((_DWORD)result)
  {
    if (((*(unsigned __int8 *)(v5 + 180) ^ (*((unsigned __int8 *)a2 + 440) >> 4)) & 1) == 0)
    {
      uint64_t result = bssl::ssl_session_is_time_valid((bssl *)v5, (const ssl_st *)a2, v7);
      if (!(_DWORD)result) {
        return result;
      }
      if (*(unsigned __int16 *)(v5 + 16) == *((unsigned __int16 *)a2 + 2)
        && *((const EVP_MD_CTX **)this + 194) == a2[25])
      {
        uint64_t v8 = EVP_MD_CTX_md(a2[17]);
        unsigned int v9 = *((unsigned __int8 *)a2 + 440);
        if (!v8 && (v9 & 2) == 0) {
          return (*(void *)(*(void *)this + 168LL) == 0LL) ^ ((v9 & 0x20) >> 5);
        }
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t bssl::ssl_get_prev_session(uint64_t *a1, SSL_SESSION **a2, char *a3, _BYTE *a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  if ((*(_BYTE *)(v6 + 180) & 1) == 0) {
    bssl::ssl_get_prev_session();
  }
  unint64_t v33 = 0LL;
  char v32 = 0;
  *(void *)&__int128 v31 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if ((SSL_get_options(v6) & 0x4000) != 0 || !bssl::ssl_client_hello_get_extension(a5, &v31, 35))
  {
    char v13 = 0;
    goto LABEL_10;
  }

  if (!*((void *)&v31 + 1))
  {
    char v13 = 1;
LABEL_10:
    p_dst = *(unsigned int **)(a5 + 48);
    size_t v14 = *(void *)(a5 + 56);
    unint64_t v35 = p_dst;
    size_t v36 = v14;
    uint64_t v16 = *a1;
    uint64_t v17 = v33;
    unint64_t v33 = 0LL;
    if (v17) {
      bssl::RefCounted<ssl_session_st>::DecRefInternal(v17);
    }
    if (v14 - 33 <= 0xFFFFFFFFFFFFFFDFLL) {
      goto LABEL_37;
    }
    unint64_t v34 = 0LL;
    uint64_t v18 = *(void *)(v16 + 128);
    if ((*(_BYTE *)(v18 + 301) & 1) == 0)
    {
      LODWORD(__dst) = -1431655766;
      if (v14 <= 3)
      {
        LODWORD(__dst) = 0;
        memcpy(&__dst, p_dst, v14);
        p_dst = (unsigned int *)&__dst;
      }

      unsigned int v19 = *p_dst;
      CRYPTO_MUTEX_lock_read((pthread_rwlock_t *)(v18 + 24));
      uint64_t v20 = *(void *)(*(void *)(v16 + 128) + 264LL);
      int __dst = bssl::ssl_lookup_session(bssl::SSL_HANDSHAKE *,std::unique_ptr<ssl_session_st,bssl::internal::Deleter> *,bssl::Span<unsigned char const>)::$_0::__invoke;
      __int128 v38 = &v35;
      key = (unsigned int *)OPENSSL_lh_retrieve_key( v20,  (uint64_t)&__dst,  v19,  (unsigned int (*)(uint64_t, void))lh_SSL_SESSION_call_cmp_key);
      size_t v22 = key;
      if (key) {
        CRYPTO_refcount_inc(key);
      }
      unint64_t v34 = v22;
      CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)(v18 + 24));
      if (v22) {
        goto LABEL_27;
      }
      uint64_t v18 = *(void *)(v16 + 128);
    }

    int v23 = *(uint64_t (**)(uint64_t, unsigned int *, void, BOOL (**)(uint64_t, uint64_t)))(v18 + 328);
    if (!v23)
    {
      size_t v22 = 0LL;
LABEL_31:
      unint64_t v27 = v33;
      unint64_t v33 = (SSL_SESSION *)v22;
      unint64_t v34 = 0LL;
      if (v27) {
        bssl::RefCounted<ssl_session_st>::DecRefInternal(v27);
      }
      goto LABEL_37;
    }

    LODWORD(__dst) = 1;
    int v24 = (unsigned int *)v23(v16, v35, v36, &__dst);
    size_t v22 = v24;
    unint64_t v34 = v24;
    if (!v24)
    {
LABEL_37:
      int v28 = v33;
      unint64_t v33 = 0LL;
      std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](a2, v28);
      *a3 = v13;
      *a4 = v32;
      uint64_t v12 = 1LL;
      goto LABEL_38;
    }

    if (v24 == (unsigned int *)&bssl::g_pending_session_magic)
    {
      uint64_t v12 = 10LL;
      goto LABEL_38;
    }

    if ((_DWORD)__dst) {
      CRYPTO_refcount_inc(v24);
    }
    uint64_t v25 = *(void *)(v16 + 128);
    if ((*(_BYTE *)(v25 + 301) & 2) == 0) {
      SSL_CTX_add_session((SSL_CTX *)v25, (SSL_SESSION *)v22);
    }
LABEL_27:
    int __dst = (BOOL (*)(uint64_t, uint64_t))0xAAAAAAAAAAAAAAAALL;
    __int128 v38 = (unsigned int **)0xAAAAAAAAAAAAAAAALL;
    bssl::ssl_get_current_time(v16, (uint64_t)&__dst);
    unint64_t v26 = *((void *)v22 + 24);
    if ((unint64_t)__dst < v26 || (unint64_t)__dst - v26 >= v22[46])
    {
      bssl::remove_session(*(bssl **)(v16 + 128), (ssl_ctx_st *)v22, (ssl_session_st *)1);
      unint64_t v34 = 0LL;
      bssl::RefCounted<ssl_session_st>::DecRefInternal((ssl_session_st *)v22);
      size_t v22 = 0LL;
    }

    goto LABEL_31;
  }

  int v11 = bssl::ssl_process_ticket( a1,  &v33,  &v32,  (const unsigned __int8 *)v31,  *((unint64_t *)&v31 + 1),  *(void *)(a5 + 48),  *(void *)(a5 + 56));
  if (v11 != 1)
  {
    if (v11 == 2)
    {
      if (v33) {
        __assert_rtn("ssl_get_prev_session", "ssl_session.cc", 737, "!session");
      }
    }

    else if (v11 == 3)
    {
      uint64_t v12 = 0LL;
      goto LABEL_38;
    }

    char v13 = 1;
    goto LABEL_37;
  }

  uint64_t v12 = 11LL;
LABEL_38:
  unint64_t v29 = v33;
  unint64_t v33 = 0LL;
  if (v29) {
    bssl::RefCounted<ssl_session_st>::DecRefInternal(v29);
  }
  return v12;
}

void sub_1875DCCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6 = va_arg(va1, SSL_SESSION *);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va1, 0LL);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va, 0LL);
  _Unwind_Resume(a1);
}

BOOL SSL_SESSION_is_resumable(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 440) & 4) != 0) {
    return 0LL;
  }
  if (*(_BYTE *)(a1 + 59)) {
    return 1LL;
  }
  return *(void *)(a1 + 240) != 0LL;
}

uint64_t bssl::add_session_locked(uint64_t a1, SSL_SESSION **a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void **)(a1 + 264);
  uint64_t v12 = 0LL;
  uint64_t result = OPENSSL_lh_insert( v5,  &v12,  (uint64_t)v4,  (uint64_t (*)(void, uint64_t))lh_SSL_SESSION_call_hash_func,  (unsigned int (*)(void, void, uint64_t))lh_SSL_SESSION_call_cmp_func);
  if ((_DWORD)result)
  {
    uint64_t v7 = v12;
    *a2 = 0LL;
    std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](a2, v7);
    if (v7)
    {
      if (v7 == v4) {
        return 0LL;
      }
      bssl::SSL_SESSION_list_remove(a1, (ssl_ctx_st *)v7, v8);
    }

    if (v4->ex_data.sk && v4->ciphers) {
      bssl::SSL_SESSION_list_remove(a1, (ssl_ctx_st *)v4, v8);
    }
    unsigned int v9 = *(STACK **)(a1 + 280);
    p_comp = (SSL_SESSION **)&v9[6].comp;
    if (!v9) {
      p_comp = (SSL_SESSION **)(a1 + 288);
    }
    *p_comp = v4;
    *(void *)(a1 + 280) = v4;
    if (!v9) {
      unsigned int v9 = (STACK *)(a1 + 288);
    }
    v4->cipherunsigned int s = (STACK *)(a1 + 280);
    v4->ex_data.sk = v9;
    if (SSL_CTX_sess_get_cache_size(a1))
    {
      do
        unint64_t v11 = EVP_AEAD_CTX_aead(*(void *)(a1 + 264));
      while (v11 > SSL_CTX_sess_get_cache_size(a1)
           && (bssl::remove_session((bssl *)a1, *(ssl_ctx_st **)(a1 + 288), 0LL) & 1) != 0);
    }

    return 1LL;
  }

  return result;
}

SSL_SESSION *SSL_SESSION_new(void)
{
  unint64_t v2 = *(void **)(v0 + 16);
  return (SSL_SESSION *)bssl::New<ssl_session_st,bssl::SSL_X509_METHOD const*&>(&v2);
}

uint64_t SSL_SESSION_up_ref(unsigned int *a1)
{
  return 1LL;
}

void bssl::RefCounted<ssl_session_st>::DecRefInternal(ssl_session_st *a1)
{
  if (CRYPTO_refcount_dec_and_test_zero((unsigned int *)a1))
  {
    ssl_session_st::~ssl_session_st(a1);
    OPENSSL_free(v2);
  }

const unsigned __int8 *__cdecl SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
{
  if (len) {
    *leunsigned int n = s->master_key[39];
  }
  return &s->master_key[40];
}

size_t SSL_SESSION_get_master_key(uint64_t a1, void *__dst, size_t a3)
{
  size_t v3 = *(unsigned __int8 *)(a1 + 10);
  if (a3)
  {
    if (v3 >= a3) {
      size_t v3 = a3;
    }
    if (v3) {
      memcpy(__dst, (const void *)(a1 + 11), v3);
    }
  }

  return v3;
}

uint64_t SSL_SESSION_set_ticket(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v5 = (void **)(a1 + 232);
  uint64_t v6 = bssl::Array<unsigned char>::Init(a1 + 232, a3);
  uint64_t v7 = v6;
  if (a3 && (_DWORD)v6) {
    memmove(*v5, a2, a3);
  }
  return v7;
}

uint64_t SSL_SESSION_get0_cipher(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

uint64_t SSL_SESSION_get_max_early_data(uint64_t a1)
{
  return *(unsigned int *)(a1 + 380);
}

int SSL_CTX_add_session(SSL_CTX *s, SSL_SESSION *c)
{
  if (c) {
    CRYPTO_refcount_inc((unsigned int *)c);
  }
  uint64_t v8 = (pthread_rwlock_t *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v9 = c;
  bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_write),&(CRYPTO_MUTEX_unlock_write)>::MutexLockBase( &v8,  (pthread_rwlock_t *)&s->cert_store);
  unsigned int v9 = 0LL;
  uint64_t v7 = c;
  int v4 = bssl::add_session_locked((uint64_t)s, &v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0LL;
  if (v5) {
    bssl::RefCounted<ssl_session_st>::DecRefInternal(v5);
  }
  CRYPTO_MUTEX_unlock_read(v8);
  return v4;
}

void sub_1875DD018(_Unwind_Exception *a1, uint64_t a2, ...)
{
  size_t v3 = va_arg(va1, SSL_SESSION *);
  uint64_t v5 = va_arg(va1, pthread_rwlock_t *);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va, 0LL);
  CRYPTO_MUTEX_unlock_read(v5);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va1, 0LL);
  _Unwind_Resume(a1);
}

uint64_t bssl::remove_session(bssl *this, ssl_ctx_st *a2, ssl_session_st *a3)
{
  if (!a2) {
    return 0LL;
  }
  if (!BYTE3(a2->session_cache_tail)) {
    return 0LL;
  }
  int v4 = (int)a3;
  if ((_DWORD)a3) {
    CRYPTO_MUTEX_lock_write((pthread_rwlock_t *)((char *)this + 24));
  }
  uint64_t v6 = (ssl_ctx_st *)OPENSSL_lh_retrieve( *((void **)this + 33),  (uint64_t)a2,  (uint64_t (*)(void, uint64_t))lh_SSL_SESSION_call_hash_func,  (unsigned int (*)(void, void, uint64_t))lh_SSL_SESSION_call_cmp_func);
  uint64_t v7 = (ssl_session_st *)v6;
  if (v6 == a2)
  {
    uint64_t v7 = (ssl_session_st *)OPENSSL_lh_delete( *((void **)this + 33),  (uint64_t)a2,  (uint64_t (*)(void, uint64_t))lh_SSL_SESSION_call_hash_func,  (unsigned int (*)(void, void, uint64_t))lh_SSL_SESSION_call_cmp_func);
    bssl::SSL_SESSION_list_remove((uint64_t)this, a2, v9);
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (v4) {
LABEL_7:
  }
    CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)((char *)this + 24));
LABEL_8:
  if (v6 != a2) {
    return 0LL;
  }
  uint64_t v10 = (void (*)(bssl *, ssl_session_st *))*((void *)this + 40);
  if (v10) {
    v10(this, v7);
  }
  if (v7) {
    bssl::RefCounted<ssl_session_st>::DecRefInternal(v7);
  }
  return 1LL;
}

int SSL_set_session(SSL *to, SSL_SESSION *session)
{
  handshake_funSHA512_CTX c = to->handshake_func;
  if ((*((_WORD *)handshake_func + 110) & 0x20) != 0
    || (uint64_t v4 = *((void *)handshake_func + 35)) == 0
    || *(_DWORD *)(v4 + 20))
  {
    abort();
  }

  bssl::ssl_set_session((ssl_st **)to, session, v2);
  return 1;
}

void timeout_doall_arg(ssl_ctx_st *a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (!v4
    || (app_gen_cookie_cb = a1->app_gen_cookie_cb,
        uint64_t client_cert_cb_low = LODWORD(a1->client_cert_cb),
        BOOL v7 = __CFADD__(app_gen_cookie_cb, client_cert_cb_low),
        uint64_t v8 = (char *)app_gen_cookie_cb + client_cert_cb_low,
        v7)
    || v4 > (unint64_t)v8)
  {
    OPENSSL_lh_delete( (void *)a2[2],  (uint64_t)a1,  (uint64_t (*)(void, uint64_t))lh_SSL_SESSION_call_hash_func,  (unsigned int (*)(void, void, uint64_t))lh_SSL_SESSION_call_cmp_func);
    bssl::SSL_SESSION_list_remove(*a2, a1, v9);
    uint64_t v10 = *(void (**)(void))(*a2 + 320);
    if (v10) {
      v10();
    }
    if (a1) {
      bssl::RefCounted<ssl_session_st>::DecRefInternal((ssl_session_st *)a1);
    }
  }

uint64_t lh_SSL_SESSION_call_cmp_key(void *a1, const void *a2)
{
  return ((uint64_t (*)(void, const void *))*a1)(a1[1], a2);
}

BOOL bssl::ssl_lookup_session(bssl::SSL_HANDSHAKE *,std::unique_ptr<ssl_session_st,bssl::internal::Deleter> *,bssl::Span<unsigned char const>)::$_0::__invoke( uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 != *(unsigned __int8 *)(a2 + 59) || memcmp(*(const void **)a1, (const void *)(a2 + 60), v2) != 0;
}

uint64_t bssl::SSL_SESSION_list_remove(uint64_t this, ssl_ctx_st *a2, ssl_session_st *a3)
{
  rsa_md5 = (EVP_MD *)a2->rsa_md5;
  if (rsa_md5)
  {
    uint64_t v6 = *(EVP_MD ***)&a2->ex_data.dummy;
    p_dummy = &a2->ex_data.dummy;
    uint64_t v5 = v6;
    if (v6)
    {
      BOOL v7 = (EVP_MD **)(this + 280);
      if (rsa_md5 == (EVP_MD *)(this + 288))
      {
        if (v5 == v7)
        {
          pthread_rwlock_t *v5 = 0LL;
          *(void *)&rsa_md5->type = 0LL;
          goto LABEL_11;
        }

        *(void *)&rsa_md5->type = v5;
      }

      else
      {
        if (v5 == v7)
        {
          pthread_rwlock_t *v5 = rsa_md5;
          *(void *)&rsa_md5[1].ctx_size_t size = v5;
          goto LABEL_11;
        }

        *(void *)&rsa_md5[1].ctx_size_t size = v5;
        uint64_t v5 = *(EVP_MD ***)p_dummy;
      }

      v5[28] = rsa_md5;
LABEL_11:
      *(void *)p_dummy = 0LL;
      *((void *)p_dummy + 1) = 0LL;
    }
  }

  return this;
}

uint64_t lh_SSL_SESSION_call_hash_func(uint64_t (*a1)(const void *), const void *a2)
{
  return a1(a2);
}

uint64_t lh_SSL_SESSION_call_cmp_func( uint64_t (*a1)(const void *, const void *), const void *a2, const void *a3)
{
  return a1(a2, a3);
}

uint64_t lh_SSL_SESSION_call_doall_arg(void *a1, void *a2)
{
  return ((uint64_t (*)(void *, void))*a2)(a1, a2[1]);
}

void std::unique_ptr<unsigned char,bssl::internal::Deleter>::reset[abi:ne180100](void **a1, void *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    OPENSSL_free(v3);
  }
}

uint64_t bssl::ssl_client_cipher_list_contains_cipher(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 72);
  BOOL v7 = *(unsigned __int16 **)(a1 + 64);
  uint64_t v8 = v2;
  if (!v2) {
    return 0LL;
  }
  do
  {
    unsigned __int16 v6 = -21846;
    uint64_t result = CBS_get_u16(&v7, &v6);
    if (!(_DWORD)result) {
      break;
    }
    uint64_t result = v6 == a2;
  }

  while (v6 != a2 && v8 != 0);
  return result;
}

uint64_t bssl::ssl_server_handshake(bssl *this, ssl_st *cipher_by_value, ssl_session_st *a3)
{
  unint64_t v4 = (_OWORD *)((char *)&v219.cipher_list + 2);
  *(void **)((char *)&v219.tlsext_debug_arg + 2) = (void *)*MEMORY[0x1895F89C0];
  v211 = (BUF_MEM **)((char *)this + 424);
  v212 = (ssl_credential_st **)((char *)this + 1504);
  v206 = (void **)((char *)this + 392);
  v207 = (EVP_PKEY **)((char *)this + 1512);
  v208 = (void **)((char *)this + 1448);
  v213 = (char *)this + 1629;
  int __dst = (char *)this + 1597;
  v209 = (_WORD *)((char *)this + 28);
  v210 = (_WORD *)((char *)this + 30);
  v204 = (void *)((char *)this + 736);
  v205 = (void **)((char *)this + 400);
  v202 = (unsigned int **)((char *)this + 1536);
  v203 = (uint64_t *)((char *)this + 600);
  v201 = "hs->new_session->group_id != 0";
  while (2)
  {
    int v5 = *((_DWORD *)this + 5);
    switch(v5)
    {
      case 0:
        bssl::ssl_do_info_callback(*(void *)this, (const ssl_st *)0x10);
        prev_sessiounsigned int n = 1LL;
        goto LABEL_9;
      case 1:
        unsigned int v9 = *(bssl **)this;
        *(void **)((char *)&v219.msg_callback_arg + 2) = (void *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v38 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.s3 + 2) = v38;
        *(_OWORD *)((char *)&v219.read_ahead + 2) = v38;
        *(void *)&__int128 v39 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.sid_ctx_length + 2) = v39;
        *(_OWORD *)&v219.sid_ctx[14] = v39;
        *(_OWORD *)((char *)&v219.enc_write_ctx + 2) = v39;
        *(_OWORD *)((char *)&v219.compress + 2) = v39;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v39;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v39;
        *(_OWORD *)((char *)&v219.param + 2) = v39;
        if ((bssl::ssl_client_hello_init( (uint64_t)v9,  (uint64_t)&v219.param + 2,  *(uint64_t *)((char *)&v219.d1 + 2),  *(uint64_t *)((char *)&v219.read_ahead + 2)) & 1) == 0)
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 687);
          bssl::ssl_send_alert(v9, (ssl_st *)2, 50);
          goto LABEL_403;
        }

        if ((*(unsigned int (**)(bssl *))(*(void *)v9 + 40LL))(v9))
        {
          bssl::ssl_send_alert(v9, (ssl_st *)2, 10);
          ERR_put_error(16, 0, 255, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 696);
          goto LABEL_403;
        }

        if ((*(_WORD *)(*((void *)this + 1) + 301LL) & 0x40) != 0)
        {
          prev_sessiounsigned int n = 6LL;
          goto LABEL_404;
        }

        unsigned __int8 v215 = 50;
        uint64_t v128 = *(void *)this;
        *(BUF_MEM **)((char *)&v219.init_buf + 2) = (BUF_MEM *)0xAAAAAAAAAAAAAAAALL;
        *(void **)((char *)&v219.init_msg + 2) = (void *)0xAAAAAAAAAAAAAAAALL;
        if ((bssl::ssl_client_hello_get_extension( (uint64_t)&v219.param + 2,  (BUF_MEM **)((char *)&v219.init_buf + 2),  65037) & 1) == 0) {
          goto LABEL_279;
        }
        unsigned __int8 v218 = -86;
        if (!CBS_get_u8((BUF_MEM **)((char *)&v219.init_buf + 2), &v218))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 557);
LABEL_472:
          int v119 = 50;
          unsigned __int8 v215 = 50;
          goto LABEL_402;
        }

        if (v218) {
          goto LABEL_279;
        }
        char v217 = -86;
        memset(&v219, 170, 18);
        unsigned __int16 v216 = -21846;
        *(void *)((char *)&v219.quiet_shutdown + 2) = 0xAAAAAAAAAAAAAAAALL;
        *(void *)((char *)&v219.state + 2) = 0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u16((unsigned __int16 **)((char *)&v219.init_buf + 2), &v219)
          || !CBS_get_u16((unsigned __int16 **)((char *)&v219.init_buf + 2), &v216)
          || !CBS_get_u8((BUF_MEM **)((char *)&v219.init_buf + 2), &v217)
          || !CBS_get_u16_length_prefixed( (unsigned __int8 **)((char *)&v219.init_buf + 2),  (unint64_t *)((char *)&v219.version + 2))
          || !CBS_get_u16_length_prefixed( (unsigned __int8 **)((char *)&v219.init_buf + 2),  (unint64_t *)((char *)&v219.quiet_shutdown + 2))
          || *(void **)((char *)&v219.init_msg + 2))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 574);
          goto LABEL_472;
        }

        v172 = (pthread_rwlock_t *)(*(void *)(v128 + 120) + 24LL);
        CRYPTO_MUTEX_lock_read(v172);
        v173 = *(unsigned int **)(*(void *)(v128 + 120) + 752LL);
        if (v173) {
          SSL_CREDENTIAL_up_ref(v173);
        }
        *(int (__cdecl **)(SSL *))((char *)&v219.handshake_func + 2) = 0LL;
        std::unique_ptr<ssl_ech_keys_st,bssl::internal::Deleter>::reset[abi:ne180100](v202, v173);
        std::unique_ptr<ssl_ech_keys_st,bssl::internal::Deleter>::reset[abi:ne180100]( (unsigned int **)((char *)&v219.handshake_func + 2),  0LL);
        CRYPTO_MUTEX_unlock_read(v172);
        v174 = *v202;
        if (!*v202 || (uint64_t v175 = *((void *)v174 + 1)) == 0)
        {
LABEL_465:
          uint64_t v178 = *(void *)(v128 + 48);
          int v179 = 2;
LABEL_466:
          *(_DWORD *)(v178 + 216) = v179;
LABEL_279:
          if ((bssl::SSL_HANDSHAKE::GetClientHello((uint64_t *)this, (uint64_t)&v219.s3 + 2, (uint64_t)&v219.param + 2) & 1) != 0)
          {
            if ((bssl::extract_sni((uint64_t *)this, (char *)&v215, (uint64_t)&v219.param + 2) & 1) != 0)
            {
              int v7 = 2;
              goto LABEL_225;
            }

            bssl::ssl_send_alert(v9, (ssl_st *)2, v215);
          }

          else
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 713);
          }

          goto LABEL_403;
        }

        v176 = (uint64_t *)*((void *)v174 + 2);
        uint64_t v177 = 8 * v175;
        while (2)
        {
          EVP_HPKE_CTX_cleanup((uint64_t)v204);
          EVP_HPKE_CTX_zero((uint64_t)v204);
          if (v217 != *(_BYTE *)(*v176 + 67)
            || !bssl::ECHServerConfig::SetupContext( *v176,  v204,  LOWORD(v219.version),  v216,  *(uint64_t *)((char *)&v219.version + 2),  *(uint64_t *)((char *)&v219.method + 2)))
          {
            ERR_clear_error();
LABEL_464:
            ++v176;
            v177 -= 8LL;
            if (!v177) {
              goto LABEL_465;
            }
            continue;
          }

          break;
        }

        BYTE2(v219.handshake_func) = -86;
        if ((bssl::ssl_client_hello_decrypt( (uint64_t *)this,  &v215,  (_BYTE *)&v219.handshake_func + 2,  v203,  (X509_VERIFY_PARAM **)((char *)&v219.param + 2),  *(char **)((char *)&v219.quiet_shutdown + 2),  *(unint64_t *)((char *)&v219.state + 2)) & 1) != 0)
        {
          *((_BYTE *)this + 1596) = v217;
          uint64_t v178 = *(void *)(v128 + 48);
          int v179 = 1;
          goto LABEL_466;
        }

        if (BYTE2(v219.handshake_func))
        {
          ERR_clear_error();
          unsigned __int8 v215 = 50;
          goto LABEL_464;
        }

        ERR_put_error(16, 0, 138, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 610);
        int v119 = v215;
LABEL_402:
        bssl::ssl_send_alert(v9, (ssl_st *)2, v119);
LABEL_403:
        prev_sessiounsigned int n = 0LL;
LABEL_404:
        if (*((_DWORD *)this + 5) != v5) {
          bssl::ssl_do_info_callback(*(void *)this, (const ssl_st *)0x2001);
        }
        if ((_DWORD)prev_session == 1) {
          continue;
        }
        return prev_session;
      case 2:
        unsigned int v9 = *(bssl **)this;
        *(void **)((char *)&v219.msg_callback_arg + 2) = (void *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.s3 + 2) = v18;
        *(_OWORD *)((char *)&v219.read_ahead + 2) = v18;
        *(_OWORD *)((char *)&v219.sid_ctx_length + 2) = v18;
        *(_OWORD *)&v219.sid_ctx[14] = v18;
        *(_OWORD *)((char *)&v219.enc_write_ctx + 2) = v18;
        *(_OWORD *)((char *)&v219.compress + 2) = v18;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v18;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v18;
        *(_OWORD *)((char *)&v219.param + 2) = v18;
        if (!bssl::SSL_HANDSHAKE::GetClientHello( (uint64_t *)this,  (uint64_t)&v219.s3 + 2,  (uint64_t)&v219.param + 2)) {
          goto LABEL_403;
        }
        unsigned int v19 = *(uint64_t (**)(char *))(*((void *)v9 + 15) + 480LL);
        if (!v19) {
          goto LABEL_189;
        }
        int v20 = v19((char *)&v219.param + 2);
        if (!v20)
        {
          prev_sessiounsigned int n = 5LL;
          goto LABEL_404;
        }

        if (v20 == -1)
        {
          ERR_put_error(16, 0, 133, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 743);
          bssl::ssl_send_alert(v9, (ssl_st *)2, 40);
          goto LABEL_403;
        }

LABEL_189:
        if ((*(_WORD *)(*((void *)this + 1) + 301LL) & 0x100) == 0
          || (bssl::ssl_client_cipher_list_contains_cipher((uint64_t)&v219.param + 2, 4867) & 1) != 0)
        {
          goto LABEL_341;
        }

        uint64_t v107 = 0LL;
        uint64_t v199 = 0LL;
        uint64_t v108 = 0LL;
        unint64_t v109 = 0LL;
        size_t v110 = 0LL;
        unint64_t v111 = 0LL;
        *(void *)((char *)&v219.version + 2) = 0xAAAAAAAAAAAAAAAALL;
        *(SSL_METHOD **)((char *)&v219.method + 2) = (SSL_METHOD *)0xAAAAAAAAAAAAAAAALL;
        *(BUF_MEM **)((char *)&v219.init_buf + 2) = *(BUF_MEM **)&v219.sid_ctx[14];
        *(void **)((char *)&v219.init_msg + 2) = *(void **)&v219.sid_ctx[22];
        do
        {
          *(_OWORD *)((char *)&v219.quiet_shutdown + 2) = *(_OWORD *)((char *)&v219.init_buf + 2);
          LOWORD(v219.version) = -21846;
          if (CBS_get_u16((unsigned __int16 **)((char *)&v219.quiet_shutdown + 2), &v219)
            && LOWORD(v219.version) == (unsigned __int16)bssl::is_probably_jdk11_with_tls13(ssl_early_callback_ctx const*)::kJavaExtensions[v107])
          {
            *(_OWORD *)((char *)&v219.init_buf + 2) = *(_OWORD *)((char *)&v219.quiet_shutdown + 2);
            *(int (__cdecl **)(SSL *))((char *)&v219.handshake_func + 2) = (int (__cdecl *)(SSL *))0xAAAAAAAAAAAAAAAALL;
            *(void *)((char *)&v219.server + 2) = 0xAAAAAAAAAAAAAAAALL;
            if (!CBS_get_u16_length_prefixed( (unsigned __int8 **)((char *)&v219.init_buf + 2),  (unint64_t *)((char *)&v219.handshake_func + 2))) {
              goto LABEL_341;
            }
            if (LOWORD(v219.version) <= 0xCu)
            {
              if (LOWORD(v219.version) == 5)
              {
                HIDWORD(v199) = 1;
              }

              else if (LOWORD(v219.version) == 10)
              {
                *(_OWORD *)((char *)&v219.version + 2) = *(_OWORD *)((char *)&v219.handshake_func + 2);
              }
            }

            else
            {
              switch(LOWORD(v219.version))
              {
                case 0xDu:
                  unint64_t v111 = *(int (__cdecl **)(SSL *))((char *)&v219.handshake_func + 2);
                  size_t v110 = *(void *)((char *)&v219.server + 2);
                  break;
                case 0x11u:
                  LODWORD(v199) = 1;
                  break;
                case 0x32u:
                  unint64_t v109 = *(int (__cdecl **)(SSL *))((char *)&v219.handshake_func + 2);
                  uint64_t v108 = *(void *)((char *)&v219.server + 2);
                  break;
              }
            }
          }

          else if (LOBYTE(bssl::is_probably_jdk11_with_tls13(ssl_early_callback_ctx const*)::kJavaExtensions[v107 + 1]))
          {
            goto LABEL_341;
          }

          v107 += 2LL;
        }

        while (v107 != 32);
        if (!*(void **)((char *)&v219.init_msg + 2))
        {
          while (*(SSL_METHOD **)((char *)&v219.method + 2))
          {
            HIWORD(v219.quiet_shutdown) = -21846;
            if (!CBS_get_u16( (unsigned __int16 **)((char *)&v219.version + 2),  (_WORD *)&v219.quiet_shutdown + 1)
              || HIWORD(v219.quiet_shutdown) == 29)
            {
              goto LABEL_341;
            }
          }
        }

LABEL_341:
        BYTE2(v219.quiet_shutdown) = 50;
        uint64_t v138 = *(void *)this;
        if ((*(_WORD *)(*(void *)(*(void *)this + 48LL) + 220LL) & 2) != 0) {
          bssl::ssl_server_handshake();
        }
        *(BUF_MEM **)((char *)&v219.init_buf + 2) = (BUF_MEM *)0xAAAAAAAAAAAAAAAALL;
        *(void **)((char *)&v219.init_msg + 2) = (void *)0xAAAAAAAAAAAAAAAALL;
        *(void *)((char *)&v219.version + 2) = 0xAAAAAAAAAAAAAAAALL;
        *(SSL_METHOD **)((char *)&v219.method + 2) = (SSL_METHOD *)0xAAAAAAAAAAAAAAAALL;
        if (bssl::ssl_client_hello_get_extension( (uint64_t)&v219.param + 2,  (BUF_MEM **)((char *)&v219.init_buf + 2),  43))
        {
          if (!CBS_get_u8_length_prefixed( (unsigned __int8 **)((char *)&v219.init_buf + 2),  (unint64_t *)((char *)&v219.version + 2))
            || *(void **)((char *)&v219.init_msg + 2)
            || !*(SSL_METHOD **)((char *)&v219.method + 2))
          {
            ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 211);
            int v119 = 50;
            goto LABEL_400;
          }
        }

        else
        {
          if (SSL_is_dtls((unsigned __int8 **)v138))
          {
            uint64_t v139 = 4LL;
            if (WORD1(v219.enc_read_ctx) >= 0xFEFEu) {
              uint64_t v139 = 2LL * (HIBYTE(WORD1(v219.enc_read_ctx)) < 0xFFu);
            }
            uint64_t v140 = (char *)&bssl::negotiate_version(bssl::SSL_HANDSHAKE *,unsigned char *,ssl_early_callback_ctx const*)::kDTLSVersions
                 - v139
                 + 4;
          }

          else
          {
            if (WORD1(v219.enc_read_ctx) <= 0x302u)
            {
              uint64_t v139 = 4LL;
              if (WORD1(v219.enc_read_ctx) != 770) {
                uint64_t v139 = 2LL * (WORD1(v219.enc_read_ctx) > 0x300u);
              }
            }

            else
            {
              uint64_t v139 = 6LL;
            }

            uint64_t v140 = (char *)&bssl::negotiate_version(bssl::SSL_HANDSHAKE *,unsigned char *,ssl_early_callback_ctx const*)::kTLSVersions
                 - v139
                 + 6;
          }

          *(void *)((char *)&v219.version + 2) = v140;
          *(SSL_METHOD **)((char *)&v219.method + 2) = (SSL_METHOD *)v139;
        }

        if (!bssl::ssl_negotiate_version( (uint64_t)this,  (char *)&v219.quiet_shutdown + 2,  (_WORD *)(v138 + 16),  (__int128 *)((char *)&v219.version + 2)))
        {
          int v119 = BYTE2(v219.quiet_shutdown);
          goto LABEL_402;
        }

        *(_WORD *)(*(void *)(v138 + 48) + 220LL) |= 2u;
        bssl::SSLAEADContext::SetVersionIfNullCipher(*(void *)(*(void *)(v138 + 48) + 272LL), *(_WORD *)(v138 + 16));
        if (!bssl::ssl_client_cipher_list_contains_cipher((uint64_t)&v219.param + 2, 22016)
          || bssl::ssl_protocol_version((bssl *)v138, v161) >= (unsigned __int16)*v210)
        {
          *((_WORD *)this + 794) = WORD1(v219.enc_read_ctx);
          if (*(COMP_CTX **)((char *)&v219.expand + 2) != (COMP_CTX *)32)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 770);
            goto LABEL_403;
          }

          uint64_t v162 = *((void *)v9 + 6);
          __int128 v163 = *(_OWORD *)&(*(const EVP_MD **)((char *)&v219.read_hash + 2))->flags;
          *(_OWORD *)(v162 + 4_Block_object_dispose(va, 8) = **(_OWORD **)((char *)&v219.read_hash + 2);
          *(_OWORD *)(v162 + 64) = v163;
          if (!*(void *)&v219.sid_ctx[6]
            || !memchr(*(const void **)((char *)&v219.sid_ctx_length + 2), 0, *(size_t *)&v219.sid_ctx[6])
            || bssl::ssl_protocol_version(v9, v164) >= 0x304 && *(void *)&v219.sid_ctx[6] != 1LL)
          {
            ERR_put_error(16, 0, 256, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 782);
            bssl::ssl_send_alert(v9, (ssl_st *)2, 47);
            goto LABEL_403;
          }

          if ((bssl::ssl_parse_clienthello_tlsext((uint64_t)this, (uint64_t)&v219.param + 2) & 1) == 0)
          {
            ERR_put_error(16, 0, 190, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 789);
            goto LABEL_403;
          }

          int v7 = 3;
LABEL_225:
          *((_DWORD *)this + 5) = v7;
LABEL_226:
          prev_sessiounsigned int n = 1LL;
          goto LABEL_404;
        }

        ERR_put_error(16, 0, 157, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 262);
        int v119 = 86;
LABEL_400:
        BYTE2(v219.quiet_shutdown) = v119;
        goto LABEL_402;
      case 3:
        unsigned int v21 = *(bssl **)this;
        uint64_t v22 = *(void *)(*((void *)this + 1) + 32LL);
        int v23 = *(uint64_t (**)(void, void))(v22 + 64);
        if (!v23) {
          goto LABEL_38;
        }
        int v24 = v23(*(void *)this, *(void *)(v22 + 72));
        if (!v24)
        {
          ERR_put_error(16, 0, 126, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 804);
          bssl::ssl_send_alert(v21, (ssl_st *)2, 80);
          goto LABEL_403;
        }

        if (v24 < 0)
        {
          prev_sessiounsigned int n = 8LL;
          goto LABEL_404;
        }

LABEL_441:
                prev_sessiounsigned int n = 0LL;
LABEL_442:
                v171 = *(SSL_SESSION **)((char *)&v219.version + 2);
                *(void *)((char *)&v219.version + 2) = 0LL;
                if (v171) {
                  SSL_SESSION_free(v171);
                }
                goto LABEL_444;
              }
            }

            *((_DWORD *)this + 396) = *((_DWORD *)this + 396) & 0xFFFF7FFF | (BYTE2(v219.handshake_func) << 15);
            bssl::ssl_set_session((ssl_st **)v44, 0LL, v132);
            if ((*((_BYTE *)this + 1585) & 0x80) == 0 && (*(_BYTE *)(*(void *)(v44 + 120) + 300LL) & 2) != 0)
            {
              uint64_t v146 = *((void *)this + 190);
              *(_BYTE *)(v146 + 59) = 32;
              RAND_bytes((unsigned __int8 *)(v146 + 60), 32);
            }

            goto LABEL_370;
          }

          unint64_t v53 = bssl::choose_params(this, 0LL, (EVP_MD_CTX *)v48, (unsigned __int16 *)shared_group);
          if (v53)
          {
            __int16 v130 = v129;
            goto LABEL_298;
          }

LABEL_285:
          bssl::ssl_send_alert((bssl *)v44, (ssl_st *)2, 40);
          prev_sessiounsigned int n = 0LL;
          unint64_t v4 = v200;
        }

        else
        {
          prev_sessiounsigned int n = 0LL;
        }

LABEL_444:
        OPENSSL_free(*(void **)((char *)&v219.init_buf + 2));
        *(void *)((char *)&v219.quiet_shutdown + 2) = 0LL;
        BUF_MEM_free(v48);
        goto LABEL_404;
      case 6:
        int v58 = *((_DWORD *)this + 396);
        if ((v58 & 0x2000000) != 0 && (*(_BYTE *)(*((void *)this + 194) + 20LL) & 2) == 0)
        {
          v58 &= ~0x2000000u;
          *((_DWORD *)this + 396) = v58;
        }

        uint64_t v59 = *(void *)this;
        uint64_t v60 = *(void *)(*(void *)this + 104LL);
        if (v60 && !*(_BYTE *)(v60 + 368))
        {
          v58 &= ~0x2000000u;
          *((_DWORD *)this + 396) = v58;
        }

        uint64_t v61 = *((void *)this + 197);
        if (v61 && (v58 & 0x80000) == 0 && *(void *)(v61 + 8) == 32LL)
        {
          uint64_t v62 = *(void *)(v59 + 48);
          __int128 v63 = *(_OWORD *)(*(void *)v61 + 16LL);
          *(_OWORD *)(v62 + 16) = *(_OWORD *)*(void *)v61;
          *(_OWORD *)(v62 + 32) = v63;
        }

        else
        {
          *(X509_VERIFY_PARAM **)((char *)&v219.param + 2) = (X509_VERIFY_PARAM *)0xAAAAAAAAAAAAAAAALL;
          *(STACK **)((char *)&v219.cipher_list + 2) = (STACK *)0xAAAAAAAAAAAAAAAALL;
          bssl::ssl_get_current_time(v59, (uint64_t)&v219.param + 2);
          *(_DWORD *)(*(void *)(v59 + 48) + 16LL) = bswap32(*(unsigned int *)((char *)&v219.param + 2));
          if (v61 && (*((_BYTE *)this + 1586) & 8) != 0)
          {
            uint64_t v79 = *(void *)(v59 + 48);
            unint64_t v80 = *(_OWORD **)v61;
            __int128 v81 = *(_OWORD *)(v79 + 32);
            _OWORD *v80 = *(_OWORD *)(v79 + 16);
            v80[1] = v81;
          }
        }

        if (bssl::ssl_supports_version((uint64_t)this, 0x304u))
        {
          int v83 = bssl::ssl_protocol_version((bssl *)v59, v82);
          unint64_t v84 = (uint64_t *)"DOWNGRD";
          if (v83 == 771)
          {
            unint64_t v84 = &bssl::kJDK11DowngradeRandom;
            if ((*((_BYTE *)this + 1586) & 0x80) == 0) {
              unint64_t v84 = &bssl::kTLS13DowngradeRandom;
            }
          }

          *(void *)(*(void *)(v59 + 48) + 4std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100]((bssl::SSLAEADContext ***)va, 0LL) = *v84;
        }

        unint64_t v85 = (unsigned __int8 *)v213;
        unint64_t v86 = __dst;
        if (!*(void *)(v59 + 104))
        {
          uint64_t v87 = *((void *)this + 190);
          unint64_t v86 = (const void *)(v87 + 60);
          unint64_t v85 = (unsigned __int8 *)(v87 + 59);
        }

        size_t v88 = *v85;
        *(void *)&__int128 v89 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v89 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v89;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v89;
        *(_OWORD *)((char *)&v219.param + 2) = v89;
        CBB_zero((X509_VERIFY_PARAM **)((char *)&v219.param + 2));
        *(void *)&__int128 v90 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v90 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.read_ahead + 2) = v90;
        *(_OWORD *)((char *)&v219.msg_callback_arg + 2) = v90;
        *(_OWORD *)((char *)&v219.s3 + 2) = v90;
        *(_OWORD *)((char *)&v219.init_num + 2) = v90;
        *(_OWORD *)((char *)&v219.packet_length + 2) = v90;
        *(_OWORD *)((char *)&v219.init_buf + 2) = v90;
        if (!(*(unsigned int (**)(uint64_t, char *, char *, uint64_t))(*(void *)v59 + 88LL))( v59,  (char *)&v219.param + 2,  (char *)&v219.s3 + 2,  2LL)
          || !CBB_add_u16((uint64_t)&v219.s3 + 2, *(unsigned __int16 *)(v59 + 16))
          || !CBB_add_bytes((uint64_t)&v219.s3 + 2, (const void *)(*(void *)(v59 + 48) + 16LL), 0x20uLL)
          || !CBB_add_u8_length_prefixed((uint64_t *)((char *)&v219.s3 + 2), (uint64_t)&v219.init_buf + 2)
          || !CBB_add_bytes((uint64_t)&v219.init_buf + 2, v86, v88)
          || (unsigned int protocol_id = SSL_CIPHER_get_protocol_id(*((void *)this + 194)),
              !CBB_add_u16((uint64_t)&v219.s3 + 2, protocol_id))
          || !CBB_add_u8((uint64_t)&v219.s3 + 2, 0)
          || !bssl::ssl_add_serverhello_tlsext((uint64_t)this, (uint64_t *)((char *)&v219.s3 + 2))
          || (bssl::ssl_add_message_cbb(v59, (uint64_t)&v219.param + 2) & 1) == 0)
        {
          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1102);
          prev_sessiounsigned int n = 0LL;
          goto LABEL_514;
        }

        if (!*(void *)(v59 + 104))
        {
          int v92 = 7;
          goto LABEL_516;
        }

        if ((*((_BYTE *)this + 1586) & 8) == 0)
        {
          int v92 = 19;
LABEL_516:
          *((_DWORD *)this + 5) = v92;
          prev_sessiounsigned int n = 1LL;
          goto LABEL_514;
        }

        prev_sessiounsigned int n = 17LL;
        goto LABEL_514;
      case 7:
        int v28 = *(void **)this;
        *(void *)&__int128 v29 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v29;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v29;
        *(_OWORD *)((char *)&v219.param + 2) = v29;
        CBB_zero((X509_VERIFY_PARAM **)((char *)&v219.param + 2));
        if (!bssl::ssl_cipher_uses_certificate_auth(*((bssl **)this + 194), v30)) {
          goto LABEL_49;
        }
        if (!*v212) {
          __assert_rtn("do_send_server_certificate", "handshake_server.cc", 1123, "hs->credential != nullptr");
        }
        if ((*((_BYTE *)this + 1584) & 0x40) != 0)
        {
          *(void *)&__int128 v120 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v120 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)((char *)&v219.read_ahead + 2) = v120;
          *(_OWORD *)((char *)&v219.msg_callback_arg + 2) = v120;
          *(_OWORD *)((char *)&v219.s3 + 2) = v120;
          *(_OWORD *)((char *)&v219.init_num + 2) = v120;
          *(_OWORD *)((char *)&v219.packet_length + 2) = v120;
          *(_OWORD *)((char *)&v219.init_buf + 2) = v120;
          if (!(*(unsigned int (**)(void *, char *, char *, uint64_t))(*v28 + 88LL))( v28,  (char *)&v219.param + 2,  (char *)&v219.s3 + 2,  22LL)
            || !CBB_add_u8((uint64_t)&v219.s3 + 2, 1u)
            || !CBB_add_u24_length_prefixed( (uint64_t *)((char *)&v219.s3 + 2),  (uint64_t)&v219.init_buf + 2)
            || (int64_t v121 = (const void *)CRYPTO_BUFFER_data(*((void *)*v212 + 10)),
                size_t v122 = CRYPTO_BUFFER_len(*((void *)*v212 + 10)),
                !CBB_add_bytes((uint64_t)&v219.init_buf + 2, v121, v122))
            || (bssl::ssl_add_message_cbb((uint64_t)v28, (uint64_t)&v219.param + 2) & 1) == 0)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1139);
LABEL_259:
            prev_sessiounsigned int n = 0LL;
LABEL_514:
            CBB_cleanup((uint64_t)&v219.param + 2);
            goto LABEL_404;
          }
        }

LABEL_325:
LABEL_326:
            *((_DWORD *)this + 5) = 8;
            prev_sessiounsigned int n = 1LL;
            goto LABEL_514;
          }

          int v198 = 1173;
        }

        else
        {
          if ((v33 & 8) != 0) {
            goto LABEL_325;
          }
          int v198 = 1217;
          v201 = "alg_k & SSL_kPSK";
        }

        __assert_rtn("do_send_server_certificate", "handshake_server.cc", v198, v201);
      case 8:
        if (!*((void *)this + 182))
        {
          int v7 = 9;
          goto LABEL_225;
        }

        unint64_t v67 = *(bssl **)this;
        *(void *)&__int128 v68 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v68;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v68;
        *(_OWORD *)((char *)&v219.param + 2) = v68;
        CBB_zero((X509_VERIFY_PARAM **)((char *)&v219.param + 2));
        *(void *)&__int128 v69 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v69 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.read_ahead + 2) = v69;
        *(_OWORD *)((char *)&v219.msg_callback_arg + 2) = v69;
        *(_OWORD *)((char *)&v219.s3 + 2) = v69;
        *(_OWORD *)((char *)&v219.init_num + 2) = v69;
        *(_OWORD *)((char *)&v219.packet_length + 2) = v69;
        *(_OWORD *)((char *)&v219.init_buf + 2) = v69;
        if (!(*(unsigned int (**)(bssl *, char *, char *, uint64_t))(*(void *)v67 + 88LL))( v67,  (char *)&v219.param + 2,  (char *)&v219.s3 + 2,  12LL)) {
          goto LABEL_513;
        }
        unint64_t v70 = *((void *)this + 182);
        if (!bssl::ssl_cipher_uses_certificate_auth(*((bssl **)this + 194), v71)) {
          goto LABEL_511;
        }
        WORD1(v219.handshake_func) = -21846;
        if ((bssl::tls1_choose_signature_algorithm( this,  *((EVP_PKEY ***)this + 188),  (const ssl_credential_st *)((char *)&v219.handshake_func + 2),  v72) & 1) != 0)
        {
          if (bssl::ssl_protocol_version(v67, v73) < 0x303
            || CBB_add_u16((uint64_t)&v219.s3 + 2, WORD1(v219.handshake_func)))
          {
            int v74 = EVP_PKEY_size(*((EVP_PKEY **)*v212 + 1));
            *(void *)((char *)&v219.version + 2) = 0xAAAAAAAAAAAAAAAALL;
            if (CBB_add_u16_length_prefixed( (uint64_t *)((char *)&v219.s3 + 2),  (uint64_t)&v219.init_buf + 2)
              && CBB_reserve((uint64_t)&v219.init_buf + 2, (int *)((char *)&v219.version + 2), v74))
            {
              *(void *)((char *)&v219.quiet_shutdown + 2) = v74;
              int v75 = bssl::ssl_private_key_sign( (uint64_t)this,  *(void **)((char *)&v219.version + 2),  (unint64_t *)((char *)&v219.quiet_shutdown + 2),  v74,  (evp_pkey_st *)WORD1(v219.handshake_func),  *((const void **)this + 181),  *((void *)this + 182));
              if (v75)
              {
                if (v75 == 1)
                {
                  prev_sessiounsigned int n = 9LL;
                  goto LABEL_514;
                }

                if (v75 != 2)
                {
LABEL_511:
                  *((_DWORD *)this + 396) |= 0x1000000u;
                  if (bssl::ssl_add_message_cbb((uint64_t)v67, (uint64_t)&v219.param + 2))
                  {
                    OPENSSL_free(*v208);
                    *v208 = 0LL;
                    v208[1] = 0LL;
                    prev_sessiounsigned int n = 1LL;
                    *((_DWORD *)this + 5) = 9;
                    goto LABEL_514;
                  }
                }
              }

              else if (CBB_did_write( (uint64_t)&v219.init_buf + 2,  *(uint64_t *)((char *)&v219.quiet_shutdown + 2)))
              {
                goto LABEL_511;
              }
            }

LABEL_513:
            prev_sessiounsigned int n = 0LL;
            goto LABEL_514;
          }

          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1259);
          int v133 = 80;
        }

        else
        {
          int v133 = 40;
        }

        bssl::ssl_send_alert(v67, (ssl_st *)2, v133);
        goto LABEL_513;
      case 9:
        if ((*((_BYTE *)this + 1586) & 8) != 0)
        {
          prev_sessiounsigned int n = 17LL;
          goto LABEL_404;
        }

        unint64_t v15 = *(bssl **)this;
        *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v16;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v16;
        *(_OWORD *)((char *)&v219.param + 2) = v16;
        CBB_zero((X509_VERIFY_PARAM **)((char *)&v219.param + 2));
        *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.read_ahead + 2) = v17;
        *(_OWORD *)((char *)&v219.msg_callback_arg + 2) = v17;
        *(_OWORD *)((char *)&v219.s3 + 2) = v17;
        if ((*((_BYTE *)this + 1584) & 0x20) == 0
          || (*(_OWORD *)((char *)&v219.init_num + 2) = v17,
              *(_OWORD *)((char *)&v219.packet_length + 2) = v17,
              *(_OWORD *)((char *)&v219.init_buf + 2) = v17,
              *(_OWORD *)((char *)&v219.rbio + 2) = v17,
              *(_OWORD *)((char *)&v219.bbio + 2) = v17,
              *(_OWORD *)((char *)&v219.version + 2) = v17,
              (*(unsigned int (**)(bssl *, char *, char *, uint64_t))(*(void *)v15 + 88LL))( v15,  (char *)&v219.param + 2,  (char *)&v219.s3 + 2,  13LL))
          && CBB_add_u8_length_prefixed((uint64_t *)((char *)&v219.s3 + 2), (uint64_t)&v219.init_buf + 2)
          && CBB_add_u8((uint64_t)&v219.init_buf + 2, 1u)
          && CBB_add_u8((uint64_t)&v219.init_buf + 2, 0x40u)
          && (bssl::ssl_protocol_version(v15, v113) < 0x303
           || CBB_add_u16_length_prefixed((uint64_t *)((char *)&v219.s3 + 2), (uint64_t)&v219.version + 2)
           && bssl::tls12_add_verify_sigalgs((uint64_t)this, (uint64_t)&v219.version + 2))
          && bssl::ssl_add_client_CA_list(this, (uint64_t *)((char *)&v219.s3 + 2))
          && (bssl::ssl_add_message_cbb((uint64_t)v15, (uint64_t)&v219.param + 2) & 1) != 0)
        {
          if ((*(unsigned int (**)(bssl *, char *, char *, uint64_t))(*(void *)v15 + 88LL))( v15,  (char *)&v219.param + 2,  (char *)&v219.s3 + 2,  14LL)
            && (bssl::ssl_add_message_cbb((uint64_t)v15, (uint64_t)&v219.param + 2) & 1) != 0)
          {
            *((_DWORD *)this + 5) = 10;
            prev_sessiounsigned int n = 4LL;
          }

          else
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1328);
            prev_sessiounsigned int n = 0LL;
          }
        }

        else
        {
          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1320);
          prev_sessiounsigned int n = 0LL;
        }

        goto LABEL_514;
      case 10:
        unint64_t v65 = *(bssl **)this;
        int v66 = *((_DWORD *)this + 396);
        if ((v66 & 0x40000) != 0 && *(_DWORD *)(*((void *)this + 194) + 20LL) == 2) {
          goto LABEL_108;
        }
        if ((v66 & 0x20) == 0) {
          goto LABEL_152;
        }
        *(const EVP_MD **)((char *)&v219.read_hash + 2) = (const EVP_MD *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v102 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v102 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.param + 2) = v102;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v102;
        if (!bssl::ssl_check_message_type(v65, (uint64_t)&v219.param + 2, 11)
          || !bssl::ssl_hash_message((uint64_t)this, (uint64_t)&v219.param + 2))
        {
          goto LABEL_403;
        }

        *(_OWORD *)((char *)&v219.s3 + 2) = *v4;
        BYTE2(v219.init_buf) = 50;
        uint64_t v103 = *((void *)this + 190);
        unint64_t v104 = (unint64_t **)(v103 + 136);
        uint64_t v105 = (unsigned __int8 *)(v103 + 272);
        if ((*(_WORD *)(*((void *)this + 1) + 301LL) & 0x20) != 0) {
          uint64_t v106 = v105;
        }
        else {
          uint64_t v106 = 0LL;
        }
        if (!bssl::ssl_parse_cert_chain( (char *)&v219.init_buf + 2,  v104,  v207,  v106,  (unsigned __int8 **)((char *)&v219.s3 + 2),  *(void ***)(*((void *)v65 + 15) + 776LL)))
        {
          bssl::ssl_send_alert(v65, (ssl_st *)2, BYTE2(v219.init_buf));
          goto LABEL_403;
        }

        if (*(dtls1_state_st **)((char *)&v219.d1 + 2)
          || ((*(uint64_t (**)(void))(*(void *)(*((void *)v65 + 15) + 16LL) + 48LL))(*((void *)this + 190)) & 1) == 0)
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1373);
          bssl::ssl_send_alert(v65, (ssl_st *)2, 50);
          goto LABEL_403;
        }

        if (EVP_MD_CTX_md(*(const EVP_MD_CTX **)(*((void *)this + 190) + 136LL)))
        {
          if ((*(_WORD *)(*((void *)this + 1) + 301LL) & 0x20) != 0) {
            *(_BYTE *)(*((void *)this + 190) + 440LL) |= 2u;
          }
        }

        else
        {
          bssl::SSLTranscript::FreeBuffer(v211);
          if ((*(_BYTE *)(*((void *)this + 1) + 300LL) & 2) != 0)
          {
            ERR_put_error(16, 0, 192, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1384);
            bssl::ssl_send_alert(v65, (ssl_st *)2, 40);
            goto LABEL_403;
          }

          *(void *)(*((void *)this + 190) + 176LL) = 0LL;
        }

        (*(void (**)(bssl *))(*(void *)v65 + 32LL))(v65);
LABEL_152:
        int v7 = 11;
        goto LABEL_225;
      case 11:
        if (!EVP_MD_CTX_md(*(const EVP_MD_CTX **)(*((void *)this + 190) + 136LL))) {
          goto LABEL_154;
        }
        int v8 = bssl::ssl_verify_peer_cert(this, (bssl::SSL_HANDSHAKE *)cipher_by_value);
        if (v8 == 1) {
          goto LABEL_403;
        }
        if (v8 == 2)
        {
          prev_sessiounsigned int n = 16LL;
          goto LABEL_404;
        }

LABEL_154:
        int v7 = 12;
        goto LABEL_225;
      case 12:
        unsigned int v9 = *(bssl **)this;
        *(BIO **)((char *)&v219.bbio + 2) = (BIO *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.version + 2) = v10;
        *(_OWORD *)((char *)&v219.rbio + 2) = v10;
        *(_OWORD *)((char *)&v219.quiet_shutdown + 2) = *(_OWORD *)((char *)&v219.method + 2);
        uint64_t v11 = *((void *)this + 194);
        int v12 = *(_DWORD *)(v11 + 20);
        int v13 = *(_DWORD *)(v11 + 24);
        if ((v13 & 8) == 0) {
          goto LABEL_19;
        }
        *(X509_VERIFY_PARAM **)((char *)&v219.param + 2) = (X509_VERIFY_PARAM *)0xAAAAAAAAAAAAAAAALL;
        *(STACK **)((char *)&v219.cipher_list + 2) = (STACK *)0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u16_length_prefixed( (unsigned __int8 **)((char *)&v219.quiet_shutdown + 2),  (unint64_t *)((char *)&v219.param + 2))
          || (v12 & 8) != 0 && *(void *)((char *)&v219.state + 2))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1441);
          int v119 = 50;
          goto LABEL_402;
        }

        if (*(STACK **)((char *)&v219.cipher_list + 2) > (STACK *)0x80
          || CBS_contains_zero_byte((uint64_t)&v219.param + 2))
        {
          ERR_put_error(16, 0, 136, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1448);
          int v119 = 47;
          goto LABEL_402;
        }

        *(ssl3_state_st **)((char *)&v219.s3 + 2) = 0LL;
        if (!CBS_strdup((uint64_t)&v219.param + 2, (void **)((char *)&v219.s3 + 2)))
        {
          bssl::ssl_send_alert(v9, (ssl_st *)2, 80);
          goto LABEL_403;
        }

        std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100]( (void **)(*((void *)this + 190) + 128LL),  *(void **)((char *)&v219.s3 + 2));
LABEL_19:
        *(int (__cdecl **)(SSL *))((char *)&v219.handshake_func + 2) = 0LL;
        *(void *)((char *)&v219.server + 2) = 0LL;
        if ((v12 & 1) == 0)
        {
          if ((v12 & 2) != 0)
          {
            *(X509_VERIFY_PARAM **)((char *)&v219.param + 2) = (X509_VERIFY_PARAM *)0xAAAAAAAAAAAAAAAALL;
            *(STACK **)((char *)&v219.cipher_list + 2) = (STACK *)0xAAAAAAAAAAAAAAAALL;
            if (!CBS_get_u8_length_prefixed( (unsigned __int8 **)((char *)&v219.quiet_shutdown + 2),  (unint64_t *)((char *)&v219.param + 2))
              || *(void *)((char *)&v219.state + 2))
            {
              ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1542);
              bssl::ssl_send_alert(v9, (ssl_st *)2, 50);
              goto LABEL_506;
            }

            BYTE2(v219.s3) = 50;
            if (((*(uint64_t (**)(void, char *, char *, void, void))(**v206 + 40LL))( *v206,  (char *)&v219.handshake_func + 2,  (char *)&v219.s3 + 2,  *(X509_VERIFY_PARAM **)((char *)&v219.param + 2),  *(STACK **)((char *)&v219.cipher_list + 2)) & 1) == 0)
            {
              bssl::ssl_send_alert(v9, (ssl_st *)2, BYTE2(v219.s3));
              goto LABEL_506;
            }

            std::unique_ptr<bssl::SSLKeyShare,bssl::internal::Deleter>::reset[abi:ne180100](v206, 0LL);
            std::unique_ptr<bssl::SSLKeyShare,bssl::internal::Deleter>::reset[abi:ne180100](v205, 0LL);
          }

          else if ((v12 & 8) == 0)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1558);
            int v14 = 40;
LABEL_505:
            bssl::ssl_send_alert(v9, (ssl_st *)2, v14);
            goto LABEL_506;
          }

          LODWORD(prev_session) = 0;
          goto LABEL_480;
        }

        *(X509_VERIFY_PARAM **)((char *)&v219.param + 2) = (X509_VERIFY_PARAM *)0xAAAAAAAAAAAAAAAALL;
        *(STACK **)((char *)&v219.cipher_list + 2) = (STACK *)0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u16_length_prefixed( (unsigned __int8 **)((char *)&v219.quiet_shutdown + 2),  (unint64_t *)((char *)&v219.param + 2))
          || *(void *)((char *)&v219.state + 2))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1467);
          bssl::ssl_send_alert(v9, (ssl_st *)2, 50);
          goto LABEL_506;
        }

        *(ssl3_state_st **)((char *)&v219.s3 + 2) = 0LL;
        *(dtls1_state_st **)((char *)&v219.d1 + 2) = 0LL;
        int v123 = EVP_PKEY_size(*((EVP_PKEY **)*v212 + 1));
        char v124 = bssl::Array<unsigned char>::Init((uint64_t)&v219.s3 + 2, v123);
        int64_t v125 = *(ssl3_state_st **)((char *)&v219.s3 + 2);
        if ((v124 & 1) == 0)
        {
          prev_sessiounsigned int n = 0LL;
          int v141 = 1;
          goto LABEL_479;
        }

        *(BUF_MEM **)((char *)&v219.init_buf + 2) = (BUF_MEM *)0xAAAAAAAAAAAAAAAALL;
        int v126 = bssl::ssl_private_key_decrypt( (uint64_t *)this,  *(uint64_t *)((char *)&v219.s3 + 2),  (uint64_t)&v219.init_buf + 2,  *(uint64_t *)((char *)&v219.d1 + 2),  *(uint64_t *)((char *)&v219.param + 2),  *(uint64_t *)((char *)&v219.cipher_list + 2));
        if (v126 == 1)
        {
          prev_sessiounsigned int n = 9LL;
LABEL_477:
          int v141 = 1;
LABEL_478:
          int64_t v125 = *(ssl3_state_st **)((char *)&v219.s3 + 2);
LABEL_479:
          OPENSSL_free(v125);
          if (v141) {
            goto LABEL_507;
          }
LABEL_480:
          if ((v13 & 8) == 0)
          {
LABEL_481:
            if (bssl::ssl_hash_message((uint64_t)this, (uint64_t)&v219.version + 2))
            {
              char master_secret = bssl::tls1_generate_master_secret( (uint64_t *)this,  (_BYTE *)(*((void *)this + 190) + 11LL),  *(char **)((char *)&v219.handshake_func + 2),  *(unint64_t *)((char *)&v219.server + 2));
              uint64_t v181 = *((void *)this + 190);
              *(_BYTE *)(v181 + 10) = master_secret;
              if (master_secret)
              {
                *(_BYTE *)(v181 + 440) = *(_BYTE *)(v181 + 440) & 0xFE | *((_BYTE *)this + 1586) & 1;
                *((_DWORD *)this + 396) |= 0x1000000u;
                (*(void (**)(bssl *))(*(void *)v9 + 32LL))(v9);
                *((_DWORD *)this + 5) = 13;
                prev_sessiounsigned int n = 1LL;
                goto LABEL_507;
              }
            }

            goto LABEL_506;
          }

          uint64_t v182 = *((void *)this + 1);
          if (!*(void *)(v182 + 72))
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1567);
            int v14 = 80;
            goto LABEL_505;
          }

          v183.sk = (STACK *)0xAAAAAAAAAAAAAAAALL;
          *(void *)&v183.dummy = 0xAAAAAAAAAAAAAAAALL;
          *(CRYPTO_EX_DATA *)((char *)&v219.options + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.max_cert_list + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.ex_data + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.client_CA + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.error + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.debug + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.generate_session_id + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.verify_callback + 2) = v183;
          *(CRYPTO_EX_DATA *)&v219.sid_ctx[14] = v183;
          *(CRYPTO_EX_DATA *)&v219.sid_ctx[30] = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.compress + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.sid_ctx_length + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.read_hash + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.enc_write_ctx + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.param + 2) = v183;
          *(CRYPTO_EX_DATA *)((char *)&v219.cipher_list_by_id + 2) = v183;
          unsigned int v184 = (*(uint64_t (**)(bssl *, void, char *, uint64_t))(v182 + 72))( v9,  *(void *)(*((void *)this + 190) + 128LL),  (char *)&v219.param + 2,  256LL);
          unsigned int v185 = v184;
          if (v184 >= 0x101)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1577);
            int v14 = 80;
            goto LABEL_505;
          }

          if (!v184)
          {
            ERR_put_error(16, 0, 195, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1582);
            int v14 = 115;
            goto LABEL_505;
          }

          if ((v12 & 8) == 0)
          {
LABEL_493:
            *(void *)&__int128 v186 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v186 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)((char *)&v219.read_ahead + 2) = v186;
            *(_OWORD *)((char *)&v219.msg_callback_arg + 2) = v186;
            *(_OWORD *)((char *)&v219.s3 + 2) = v186;
            CBB_zero((ssl3_state_st **)((char *)&v219.s3 + 2));
            *(void *)&__int128 v187 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v187 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)((char *)&v219.init_num + 2) = v187;
            *(_OWORD *)((char *)&v219.packet_length + 2) = v187;
            *(_OWORD *)((char *)&v219.init_buf + 2) = v187;
            if (CBB_init((uint64_t)&v219.s3 + 2, *(void *)((char *)&v219.server + 2) + v185 + 4)
              && CBB_add_u16_length_prefixed( (uint64_t *)((char *)&v219.s3 + 2),  (uint64_t)&v219.init_buf + 2)
              && CBB_add_bytes( (uint64_t)&v219.init_buf + 2,  *(const void **)((char *)&v219.handshake_func + 2),  *(size_t *)((char *)&v219.server + 2))
              && CBB_add_u16_length_prefixed( (uint64_t *)((char *)&v219.s3 + 2),  (uint64_t)&v219.init_buf + 2)
              && CBB_add_bytes((uint64_t)&v219.init_buf + 2, (char *)&v219.param + 2, v185))
            {
              BOOL v188 = bssl::CBBFinishArray((uint64_t)&v219.s3 + 2, (uint64_t)&v219.handshake_func + 2);
              int v189 = !v188;
              if (v188) {
                prev_sessiounsigned int n = prev_session;
              }
              else {
                prev_sessiounsigned int n = 0LL;
              }
            }

            else
            {
              prev_sessiounsigned int n = 0LL;
              int v189 = 1;
            }

            CBB_cleanup((uint64_t)&v219.s3 + 2);
            if (v189)
            {
LABEL_507:
              OPENSSL_free(*(void **)((char *)&v219.handshake_func + 2));
              goto LABEL_404;
            }

            goto LABEL_481;
          }

          if (bssl::Array<unsigned char>::Init((uint64_t)&v219.handshake_func + 2, v184))
          {
            goto LABEL_493;
          }

LABEL_506:
          prev_sessiounsigned int n = 0LL;
          goto LABEL_507;
        }

        if (v126 == 2) {
          goto LABEL_476;
        }
        if (*(BUF_MEM **)((char *)&v219.init_buf + 2) == *(BUF_MEM **)((char *)&v219.d1 + 2))
        {
          if (!bssl::Array<unsigned char>::Init((uint64_t)&v219.handshake_func + 2, 0x30uLL)
            || !RAND_bytes(*(unsigned __int8 **)((char *)&v219.handshake_func + 2), *(int *)((char *)&v219.server + 2)))
          {
            goto LABEL_476;
          }

          if (*(BUF_MEM **)((char *)&v219.init_buf + 2) >= (BUF_MEM *)(*(void *)((char *)&v219.server + 2) + 11LL))
          {
            v190 = *(char **)((char *)&v219.init_buf + 2) - *(void *)((char *)&v219.server + 2);
            if (*(unint64_t *)((char *)&v219.init_buf + 2) - *(void *)((char *)&v219.server + 2) - 1 >= 3)
            {
              v192 = v190 - 3;
              v193 = (unsigned __int8 *)&(*(ssl3_state_st **)((char *)&v219.s3 + 2))->flags + 2;
              do
              {
                unsigned int v194 = *v193++;
                LODWORD(v191) = v191 & ~((v194 - 1LL) >> 63);
                --v192;
              }

              while (v192);
            }

            if (*(void *)((char *)&v219.server + 2))
            {
              unint64_t v195 = 0LL;
              char v196 = v191 & ((((*((_BYTE *)&(*(ssl3_state_st **)((char *)&v219.s3 + 2))->flags
                                                 + (unint64_t)v190) ^ HIBYTE(*((unsigned __int16 *)this + 794)))
                             - 1LL) & (*((_BYTE *)&(*(ssl3_state_st **)((char *)&v219.s3 + 2))->flags
                                                        + (unint64_t)(v190 - 1))
              do
              {
                int v141 = 0;
                prev_sessiounsigned int n = 0LL;
                (*(_BYTE **)((char *)&v219.handshake_func + 2))[v195] = (*(_BYTE **)((char *)&v219.handshake_func + 2))[v195] & ~v196 | *((_BYTE *)&(*(ssl3_state_st **)((char *)&v219.s3 + 2))->flags + (unint64_t)v190 + v195) & v196;
                ++v195;
              }

              while (v195 < *(void *)((char *)&v219.server + 2));
            }

            else
            {
              int v141 = 0;
              prev_sessiounsigned int n = 0LL;
            }

            goto LABEL_478;
          }

          int v127 = 1510;
        }

        else
        {
          int v127 = 1493;
        }

        ERR_put_error(16, 0, 138, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", v127);
        bssl::ssl_send_alert(v9, (ssl_st *)2, 51);
LABEL_476:
        prev_sessiounsigned int n = 0LL;
        goto LABEL_477;
      case 13:
        if (*((void *)this + 189))
        {
          unint64_t v54 = *(bssl **)this;
          *(const EVP_MD **)((char *)&v219.read_hash + 2) = (const EVP_MD *)0xAAAAAAAAAAAAAAAALL;
          *(void *)&__int128 v55 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)((char *)&v219.param + 2) = v55;
          *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v55;
          if (!(*(unsigned int (**)(bssl *, char *))(*(void *)v54 + 24LL))(v54, (char *)&v219.param + 2))
          {
LABEL_187:
            prev_sessiounsigned int n = 3LL;
            goto LABEL_404;
          }

          unint64_t v56 = OPENSSL_sk_value(*(unint64_t **)(*((void *)this + 190) + 136LL), 0LL);
          *(ssl3_state_st **)((char *)&v219.s3 + 2) = (ssl3_state_st *)0xAAAAAAAAAAAAAAAALL;
          *(dtls1_state_st **)((char *)&v219.d1 + 2) = (dtls1_state_st *)0xAAAAAAAAAAAAAAAALL;
          CRYPTO_BUFFER_init_CBS((uint64_t)v56, (ssl3_state_st **)((char *)&v219.s3 + 2));
          *(_OWORD *)((char *)&v219.init_buf + 2) = *v4;
          *(void *)((char *)&v219.version + 2) = 0xAAAAAAAAAAAAAAAALL;
          *(SSL_METHOD **)((char *)&v219.method + 2) = (SSL_METHOD *)0xAAAAAAAAAAAAAAAALL;
          HIWORD(v219.quiet_shutdown) = 0;
          if (bssl::ssl_protocol_version(v54, cipher_by_value) < 0x303)
          {
            if ((bssl::tls1_get_legacy_signature_algorithm( (bssl *)((char *)&v219.quiet_shutdown + 2),  (unsigned __int16 *)*v207,  v57) & 1) == 0)
            {
              ERR_put_error(16, 0, 193, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1676);
              bssl::ssl_send_alert(v54, (ssl_st *)2, 43);
              goto LABEL_403;
            }
          }

          else
          {
            if (!CBS_get_u16( (unsigned __int16 **)((char *)&v219.init_buf + 2),  (_WORD *)&v219.quiet_shutdown + 1))
            {
              ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1664);
              bssl::ssl_send_alert(v54, (ssl_st *)2, 50);
              goto LABEL_403;
            }

            BYTE2(v219.handshake_func) = 50;
            if (!bssl::tls12_check_peer_sigalg( this,  (const bssl::SSL_HANDSHAKE *)((char *)&v219.handshake_func + 2),  (unsigned __int8 *)HIWORD(v219.quiet_shutdown)))
            {
              bssl::ssl_send_alert(v54, (ssl_st *)2, BYTE2(v219.handshake_func));
              goto LABEL_403;
            }

            *(_WORD *)(*((void *)this + 190) + 8LL) = HIWORD(v219.quiet_shutdown);
          }

          if (!CBS_get_u16_length_prefixed( (unsigned __int8 **)((char *)&v219.init_buf + 2),  (unint64_t *)((char *)&v219.version + 2))
            || *(void **)((char *)&v219.init_msg + 2))
          {
            ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1684);
            bssl::ssl_send_alert(v54, (ssl_st *)2, 50);
            goto LABEL_403;
          }

          if (!bssl::ssl_public_key_verify( v54,  *(uint64_t *)((char *)&v219.version + 2),  *(uint64_t *)((char *)&v219.method + 2),  (evp_pkey_st *)HIWORD(v219.quiet_shutdown),  *v207,  (*v211)->data,  *(void *)&(*v211)->length))
          {
            ERR_put_error(16, 0, 114, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1691);
            bssl::ssl_send_alert(v54, (ssl_st *)2, 51);
            goto LABEL_403;
          }

          bssl::SSLTranscript::FreeBuffer(v211);
          (*(void (**)(bssl *))(*(void *)v54 + 32LL))(v54);
        }

        else
        {
          bssl::SSLTranscript::FreeBuffer(v211);
        }

        int v7 = 14;
        goto LABEL_225;
      case 14:
        if ((*((_BYTE *)this + 1586) & 4) != 0 && *(void *)(*(void *)this + 104LL)) {
          goto LABEL_108;
        }
        prev_sessiounsigned int n = 15LL;
LABEL_9:
        *((_DWORD *)this + 5) = prev_session;
        goto LABEL_404;
      case 15:
        int v7 = 16;
        goto LABEL_225;
      case 16:
        if ((*((_BYTE *)this + 1585) & 0x40) == 0) {
          goto LABEL_5;
        }
        unint64_t v93 = *(bssl **)this;
        *(const EVP_MD **)((char *)&v219.read_hash + 2) = (const EVP_MD *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v94 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v94 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.param + 2) = v94;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v94;
        if (!bssl::ssl_check_message_type(v93, (uint64_t)&v219.param + 2, 67)
          || !bssl::ssl_hash_message((uint64_t)this, (uint64_t)&v219.param + 2))
        {
          goto LABEL_403;
        }

        *(_OWORD *)((char *)&v219.s3 + 2) = *v4;
        *(BUF_MEM **)((char *)&v219.init_buf + 2) = (BUF_MEM *)0xAAAAAAAAAAAAAAAALL;
        *(void **)((char *)&v219.init_msg + 2) = (void *)0xAAAAAAAAAAAAAAAALL;
        *(void *)((char *)&v219.version + 2) = 0xAAAAAAAAAAAAAAAALL;
        *(SSL_METHOD **)((char *)&v219.method + 2) = (SSL_METHOD *)0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u8_length_prefixed( (unsigned __int8 **)((char *)&v219.s3 + 2),  (unint64_t *)((char *)&v219.init_buf + 2))
          || !CBS_get_u8_length_prefixed( (unsigned __int8 **)((char *)&v219.s3 + 2),  (unint64_t *)((char *)&v219.version + 2))
          || *(dtls1_state_st **)((char *)&v219.d1 + 2))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1747);
          bssl::ssl_send_alert(v93, (ssl_st *)2, 50);
          goto LABEL_403;
        }

        unint64_t v95 = (void **)(*((void *)v93 + 6) + 480LL);
        unint64_t v96 = *(BUF_MEM **)((char *)&v219.init_buf + 2);
        size_t v97 = *(size_t *)((char *)&v219.init_msg + 2);
        int v98 = bssl::Array<unsigned char>::Init((uint64_t)v95, *(unint64_t *)((char *)&v219.init_msg + 2));
        char v99 = v98 ^ 1;
        if (!v97) {
          char v99 = 1;
        }
        if ((v99 & 1) == 0) {
          memmove(*v95, v96, v97);
        }
        if (!v98) {
          goto LABEL_403;
        }
        (*(void (**)(bssl *))(*(void *)v93 + 32LL))(v93);
LABEL_5:
        int v7 = 17;
        goto LABEL_225;
      case 17:
        if ((*((_BYTE *)this + 1587) & 2) == 0) {
          goto LABEL_64;
        }
        unint64_t v100 = *(bssl **)this;
        *(const EVP_MD **)((char *)&v219.read_hash + 2) = (const EVP_MD *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v101 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v101 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.param + 2) = v101;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v101;
        if (!bssl::ssl_check_message_type(v100, (uint64_t)&v219.param + 2, 203)
          || !bssl::tls1_verify_channel_id((bssl **)this, (uint64_t)&v219.param + 2)
          || !bssl::ssl_hash_message((uint64_t)this, (uint64_t)&v219.param + 2))
        {
          goto LABEL_403;
        }

        (*(void (**)(bssl *))(*(void *)v100 + 32LL))(v100);
LABEL_64:
        int v7 = 18;
        goto LABEL_225;
      case 18:
        uint64_t v64 = *(void *)this;
        prev_sessiounsigned int n = bssl::ssl_get_finished(this, (bssl::SSL_HANDSHAKE *)cipher_by_value);
        if ((_DWORD)prev_session != 1) {
          goto LABEL_404;
        }
        if (*(void *)(v64 + 104))
        {
          int v7 = 20;
          goto LABEL_225;
        }

        *((_DWORD *)this + 5) = 19;
        if ((*(_WORD *)(*(void *)(v64 + 48) + 220LL) & 0x100) != 0
          && !bssl::tls1_record_handshake_hashes_for_channel_id( this,  (bssl::SSL_HANDSHAKE *)cipher_by_value))
        {
          goto LABEL_403;
        }

        goto LABEL_226;
      case 19:
        unint64_t v76 = *(bssl **)this;
        if ((*((_BYTE *)this + 1585) & 0x80) == 0) {
          goto LABEL_239;
        }
        *(void *)((char *)&v219.version + 2) = 0LL;
        unint64_t v77 = (bssl *)*((void *)v76 + 13);
        if (v77)
        {
          bssl::SSL_SESSION_dup(v77, (ssl_session_st *)2, (X509_VERIFY_PARAM **)((char *)&v219.param + 2));
          prev_sessiounsigned int n = *(uint64_t *)((char *)&v219.param + 2);
          *(void *)((char *)&v219.version + 2) = *(X509_VERIFY_PARAM **)((char *)&v219.param + 2);
          bssl::ssl_session_rebase_time(v76, *(ssl_st **)((char *)&v219.param + 2), a3);
          uint64_t v78 = prev_session;
        }

        else
        {
          bssl::ssl_session_rebase_time(v76, *((ssl_st **)this + 190), a3);
          prev_sessiounsigned int n = 0LL;
          uint64_t v78 = *((void *)this + 190);
        }

        *(void *)&__int128 v115 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v115 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.cipher_list_by_id + 2) = v115;
        *(_OWORD *)((char *)&v219.read_hash + 2) = v115;
        *(_OWORD *)((char *)&v219.param + 2) = v115;
        CBB_zero((X509_VERIFY_PARAM **)((char *)&v219.param + 2));
        *(void *)&__int128 v116 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v116 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)((char *)&v219.read_ahead + 2) = v116;
        *(_OWORD *)((char *)&v219.msg_callback_arg + 2) = v116;
        *(_OWORD *)((char *)&v219.s3 + 2) = v116;
        *(_OWORD *)((char *)&v219.init_num + 2) = v116;
        *(_OWORD *)((char *)&v219.packet_length + 2) = v116;
        *(_OWORD *)((char *)&v219.init_buf + 2) = v116;
        if ((*(unsigned int (**)(bssl *, char *, char *, uint64_t))(*(void *)v76 + 88LL))( v76,  (char *)&v219.param + 2,  (char *)&v219.s3 + 2,  4LL)
          && CBB_add_u32((uint64_t)&v219.s3 + 2, *(_DWORD *)(v78 + 184))
          && CBB_add_u16_length_prefixed((uint64_t *)((char *)&v219.s3 + 2), (uint64_t)&v219.init_buf + 2)
          && bssl::ssl_encrypt_ticket(this, (uint64_t)&v219.init_buf + 2, v78))
        {
          int v117 = bssl::ssl_add_message_cbb((uint64_t)v76, (uint64_t)&v219.param + 2) ^ 1;
        }

        else
        {
          int v117 = 1;
        }

        CBB_cleanup((uint64_t)&v219.param + 2);
        *(void *)((char *)&v219.version + 2) = 0LL;
        if (prev_session) {
          SSL_SESSION_free((SSL_SESSION *)prev_session);
        }
        if (v117) {
          goto LABEL_403;
        }
LABEL_239:
        if (!(*(unsigned int (**)(bssl *, ssl_st *))(*(void *)v76 + 112LL))(v76, cipher_by_value)
          || !bssl::tls1_change_cipher_state(this, (const bssl::SSL_HANDSHAKE *)1)
          || !bssl::ssl_send_finished(this, (bssl::SSL_HANDSHAKE *)cipher_by_value))
        {
          goto LABEL_403;
        }

        if (*((void *)v76 + 13)) {
          int v118 = 14;
        }
        else {
          int v118 = 20;
        }
        *((_DWORD *)this + 5) = v118;
        prev_sessiounsigned int n = 4LL;
        goto LABEL_404;
      case 20:
        if ((*((_BYTE *)this + 1586) & 4) != 0)
        {
LABEL_108:
          prev_sessiounsigned int n = 7LL;
          goto LABEL_404;
        }

        uint64_t v40 = *(void *)this;
        (*(void (**)(void, ssl_st *))(**(void **)this + 128LL))(*(void *)this, cipher_by_value);
        uint64_t v41 = *((void *)this + 190);
        if (v41
          && ((*(_WORD *)(*((void *)this + 1) + 301LL) & 0x20) == 0
           || (std::unique_ptr<stack_st_CRYPTO_BUFFER,bssl::internal::Deleter>::reset[abi:ne180100]( (unint64_t **)(v41 + 136),  0LL),  (*(void (**)(void))(*(void *)(*(void *)(v40 + 120) + 16LL) + 64LL))(*((void *)this + 190)),  (uint64_t v41 = *((void *)this + 190)) != 0)))
        {
          if (*(void *)(v40 + 104)) {
            bssl::ssl_server_handshake();
          }
          unint64_t v42 = (SSL_SESSION **)(*(void *)(v40 + 48) + 472LL);
          *((void *)this + 190) = 0LL;
          std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](v42, (SSL_SESSION *)v41);
          *(_BYTE *)(*(void *)(*(void *)(v40 + 48) + 472LL) + 440LL) &= ~4u;
          *((_DWORD *)this + 396) |= 8u;
          *(_WORD *)(*(void *)(v40 + 48) + 220LL) |= 0x20u;
          bssl::ssl_update_cache((bssl *)v40, v43);
        }

        else
        {
          uint64_t v114 = *(SSL_SESSION **)(v40 + 104);
          if (!v114) {
            bssl::ssl_server_handshake();
          }
          SSL_SESSION_up_ref(*(unsigned int **)(v40 + 104));
          std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]( (SSL_SESSION **)(*(void *)(v40 + 48) + 472LL),  v114);
          *((_DWORD *)this + 396) |= 8u;
          *(_WORD *)(*(void *)(v40 + 48) + 220LL) |= 0x20u;
        }

        int v7 = 21;
        goto LABEL_225;
      case 21:
        bssl::ssl_do_info_callback(*(void *)this, (const ssl_st *)0x20);
        return 1LL;
      default:
        goto LABEL_403;
    }
  }

void sub_1875DFC5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

uint64_t bssl::ssl_server_handshake_int_state(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  if (*((_DWORD *)this + 5) == 4) {
    return bssl::tls13_server_handshake_int_state(this, a2);
  }
  else {
    return (4 * *((_DWORD *)this + 5)) | 0x2B291000u;
  }
}

const char *bssl::ssl_server_handshake_state(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  int v2 = *((_DWORD *)this + 5);
  uint64_t result = "TLS server start_accept";
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "TLS server read_client_hello";
      break;
    case 2:
      uint64_t result = "TLS server read_client_hello_after_ech";
      break;
    case 3:
      uint64_t result = "TLS server cert_callback";
      break;
    case 4:
      uint64_t result = bssl::tls13_server_handshake_state(this, a2);
      break;
    case 5:
      uint64_t result = "TLS server select_parameters";
      break;
    case 6:
      uint64_t result = "TLS server send_server_hello";
      break;
    case 7:
      uint64_t result = "TLS server send_server_certificate";
      break;
    case 8:
      uint64_t result = "TLS server send_server_key_exchange";
      break;
    case 9:
      uint64_t result = "TLS server send_server_hello_done";
      break;
    case 10:
      uint64_t result = "TLS server read_client_certificate";
      break;
    case 11:
      uint64_t result = "TLS server verify_client_certificate";
      break;
    case 12:
      uint64_t result = "TLS server read_client_key_exchange";
      break;
    case 13:
      uint64_t result = "TLS server read_client_certificate_verify";
      break;
    case 14:
      uint64_t result = "TLS server read_change_cipher_spec";
      break;
    case 15:
      uint64_t result = "TLS server process_change_cipher_spec";
      break;
    case 16:
      uint64_t result = "TLS server read_next_proto";
      break;
    case 17:
      uint64_t result = "TLS server read_channel_id";
      break;
    case 18:
      uint64_t result = "TLS server read_client_finished";
      break;
    case 19:
      uint64_t result = "TLS server send_server_finished";
      break;
    case 20:
      uint64_t result = "TLS server finish_server_handshake";
      break;
    case 21:
      uint64_t result = "TLS server done";
      break;
    default:
      uint64_t result = "TLS server unknown";
      break;
  }

  return result;
}

uint64_t bssl::extract_sni(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  memset(v12, 170, sizeof(v12));
  char v11 = -86;
  if (CBS_get_u16_length_prefixed((unsigned __int8 **)&v13, &v12[2])
    && CBS_get_u8(&v12[2], &v11)
    && CBS_get_u16_length_prefixed((unsigned __int8 **)&v12[2], v12)
    && !v12[3]
    && !*((void *)&v13 + 1))
  {
    if (v11 || v12[1] - 256 < 0xFFFFFFFFFFFFFF01LL || CBS_contains_zero_byte((uint64_t)v12))
    {
      BOOL v6 = 0LL;
      char v7 = 112;
    }

    else
    {
      __int128 v10 = 0LL;
      BOOL v9 = CBS_strdup((uint64_t)v12, &v10);
      BOOL v6 = v9;
      if (v9)
      {
        std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100]( (void **)(*(void *)(v5 + 48) + 512LL),  v10);
        *((_DWORD *)a1 + 396) |= 0x100u;
        return v6;
      }

      char v7 = 80;
    }
  }

  else
  {
    BOOL v6 = 0LL;
    char v7 = 50;
  }

  *a2 = v7;
  return v6;
}

bssl *bssl::choose_params(bssl *this, bssl::SSL_HANDSHAKE *a2, EVP_MD_CTX *ctx, unsigned __int16 *a4)
{
  if ((_DWORD)a4) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  uint64_t v7 = *((void *)this + 1);
  uint64_t v8 = *(void *)(v7 + 72);
  if (v8) {
    v6 |= 8u;
  }
  int v50 = 8 * (v8 != 0);
  int v51 = v6;
  __int16 v53 = 0;
  if (a2 && !*((_DWORD *)a2 + 1))
  {
    uint64_t v10 = bssl::tls1_choose_signature_algorithm(this, (EVP_PKEY **)a2, (const ssl_credential_st *)&v53, a4);
    ERR_clear_error();
    int v11 = EVP_PKEY_id(*((void *)a2 + 1));
    int v12 = v11;
    if (*(__int16 *)(*((void *)this + 1) + 301LL) < 0 && v11 == 408)
    {
      __int128 v13 = (const EC_KEY *)EVP_PKEY_get0_EC_KEY(*((void *)a2 + 1));
      unsigned __int16 v52 = -21846;
      int v14 = EC_KEY_get0_group(v13);
      int curve_name = (unsigned __int16 *)EC_GROUP_get_curve_name(v14);
      if (bssl::ssl_nid_to_group_id((bssl *)&v52, curve_name))
      {
        uint64_t v16 = *((void *)this + 83);
        uint64_t v17 = *((void *)this + 84);
        if (v17)
        {
          uint64_t v18 = 2 * v17;
          unsigned int v19 = (unsigned __int16 *)*((void *)this + 83);
          while (*v19 != v52)
          {
            ++v19;
            v18 -= 2LL;
            if (!v18)
            {
              unsigned int v19 = (unsigned __int16 *)(v16 + 2 * v17);
              break;
            }
          }
        }

        else
        {
          unsigned int v19 = (unsigned __int16 *)*((void *)this + 83);
        }

        uint64_t v20 = ((uint64_t)v19 - v16) >> 1;
        if (v20 == v17) {
          uint64_t v10 = 0LL;
        }
        else {
          uint64_t v10 = v10;
        }
        if (v20 != v17 || v8 != 0) {
          goto LABEL_26;
        }
LABEL_70:
        int v41 = 243;
        int v42 = 415;
        goto LABEL_59;
      }

      if (!v8) {
        goto LABEL_70;
      }
      uint64_t v10 = 0LL;
    }

void std::unique_ptr<stack_st_SSL_CIPHER,bssl::internal::Deleter>::reset[abi:ne180100]( BUF_MEM **a1, BUF_MEM *a2)
{
  size_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    BUF_MEM_free(v3);
  }
}

double bssl::ssl_done_writing_client_hello(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  size_t v3 = (_OWORD *)((char *)this + 568);
  OPENSSL_free(*((void **)this + 71));
  _OWORD *v3 = 0u;
  OPENSSL_free(*((void **)this + 67));
  *(_OWORD *)((char *)this + 536) = 0u;
  OPENSSL_free(*((void **)this + 77));
  double result = 0.0;
  *(_OWORD *)((char *)this + 616) = 0u;
  return result;
}

uint64_t bssl::ssl_client_handshake_int_state(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  if (*((_DWORD *)this + 5) == 5) {
    return bssl::tls13_client_handshake_int_state(this, a2);
  }
  else {
    return (4 * *((_DWORD *)this + 5)) | 0x2B290C00u;
  }
}

uint64_t sk_SSL_CIPHER_call_cmp_func(uint64_t (*a1)(uint64_t *, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2;
  return a1(&v5, &v4);
}

uint64_t bssl::dtls_open_record( bssl *a1, char *a2, uint64_t a3, unint64_t *a4, _BYTE *a5, unsigned __int8 *a6, unint64_t a7)
{
  __dst[1] = *MEMORY[0x1895F89C0];
  *a4 = 0LL;
  if (*(_DWORD *)(*((void *)a1 + 6) + 172LL) == 1) {
    return 3LL;
  }
  if (!a7) {
    return 2LL;
  }
  __int128 v29 = a6;
  unint64_t v30 = a7;
  char v28 = -86;
  unsigned __int16 v27 = -21846;
  __dst[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v25 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  if (!CBS_get_u8(&v29, &v28)
    || !CBS_get_u16((unsigned __int16 **)&v29, &v27)
    || !CBS_copy_bytes((uint64_t)&v29, __dst, 8uLL)
    || !CBS_get_u16_length_prefixed(&v29, (unint64_t *)&v25)
    || v26 >= 0x4141)
  {
    goto LABEL_21;
  }

  unint64_t v15 = *(bssl::SSLAEADContext **)(*((void *)a1 + 6) + 264LL);
  int v16 = v27;
  if (*(void *)v15)
  {
LABEL_21:
    *a4 = a7;
    return 1LL;
  }

  if ((v27 & 0xFF00) != 0xFE00) {
    goto LABEL_21;
  }
LABEL_11:
  if (a7 >= 0xD) {
    uint64_t v17 = 13LL;
  }
  else {
    uint64_t v17 = a7;
  }
  bssl::ssl_do_msg_callback((uint64_t)a1, 0LL, 256LL, (uint64_t)a6, v17);
  unint64_t v19 = bswap64(__dst[0]);
  uint64_t v20 = *((void *)a1 + 7);
  unint64_t v21 = *(void *)(v20 + 40);
  BOOL v22 = v21 >= v19;
  unint64_t v23 = v21 - v19;
  if (v22 && (v23 > 0xFF || ((*(void *)(v20 + 8 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v23) & 1) != 0)) {
    goto LABEL_28;
  }
  if (!bssl::SSLAEADContext::Open( *(bssl::SSLAEADContext **)(*((void *)a1 + 6) + 264LL),  (char **)a3,  v28,  v27,  v19,  (int)a6,  v17,  v18,  v25,  v26))
  {
    ERR_clear_error();
LABEL_28:
    *a4 = a7 - v30;
    return 1LL;
  }

  *a4 = a7 - v30;
  if (*(void *)(a3 + 8) <= 0x4000uLL)
  {
    bssl::dtls1_bitmap_record((bssl *)(*((void *)a1 + 7) + 8LL), (DTLS1_BITMAP *)v19);
    char v24 = v28;
    if (v28 == 21)
    {
      return bssl::ssl_process_alert(a1, a5, *(unsigned __int8 **)a3, *(void *)(a3 + 8));
    }

    else
    {
      uint64_t result = 0LL;
      *(_BYTE *)(*((void *)a1 + 6) + 211LL) = 0;
      *a2 = v24;
    }
  }

  else
  {
    ERR_put_error(16, 0, 136, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/dtls_record.cc", 240);
    *a5 = 22;
    return 4LL;
  }

  return result;
}

void bssl::dtls1_bitmap_record(bssl *this, DTLS1_BITMAP *a2)
{
  uint64_t v4 = (DTLS1_BITMAP *)*((void *)this + 4);
  BOOL v5 = a2 > v4;
  int v6 = (char *)((char *)a2 - (char *)v4);
  if (v5)
  {
    if ((unint64_t)v6 >= 0x100)
    {
      uint64_t v8 = this;
      int v9 = 0;
      std::__fill_n[abi:ne180100]<false,std::__bitset<4ul,256ul>>((uint64_t)&v8, 0x100uLL);
    }

    else
    {
      std::bitset<256ul>::operator<<=[abi:ne180100]((uint64_t)this, (unint64_t)v6);
    }

    *((void *)this + 4) = a2;
    uint64_t v4 = a2;
  }

  unint64_t v7 = (char *)v4 - (char *)a2;
  if (v7 <= 0xFF) {
    *(void *)((char *)this + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v7;
  }
}

uint64_t bssl::dtls_max_seal_overhead(uint64_t a1, int a2)
{
  int v2 = (bssl::SSLAEADContext *)bssl::get_write_aead(a1, a2);
  return bssl::SSLAEADContext::MaxOverhead(v2) + 13;
}

uint64_t bssl::get_write_aead(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 48) + 272LL;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (!*(_WORD *)(v3 + 4)) {
      bssl::get_write_aead();
    }
    uint64_t v2 = v3 + 64;
  }

  return *(void *)v2;
}

uint64_t bssl::dtls_seal_prefix_len(uint64_t a1, int a2)
{
  uint64_t v2 = (bssl::SSLAEADContext *)bssl::get_write_aead(a1, a2);
  return bssl::SSLAEADContext::ExplicitNonceLen(v2) + 13;
}

uint64_t bssl::dtls_seal_record( uint64_t a1, unint64_t a2, void *a3, unint64_t a4, char a5, char *a6, unint64_t a7, int a8)
{
  int v16 = (bssl::SSLAEADContext *)bssl::get_write_aead(a1, a8);
  uint64_t v17 = bssl::SSLAEADContext::ExplicitNonceLen(v16);
  if (a2 + a4 > (unint64_t)a6
    && (unint64_t)&a6[a7] > a2
    && (v17 + 13 > a4 || (char *)(a2 + v17 + 13) != a6))
  {
    int v23 = 189;
    int v24 = 286;
    goto LABEL_19;
  }

  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(unsigned __int16 *)(v18 + 4);
  if (a8)
  {
    uint64_t v20 = *(void *)(a1 + 48);
    unint64_t v21 = (bssl::SSLAEADContext **)(v20 + 272);
    BOOL v22 = (void *)(v20 + 8);
  }

  else
  {
    if (!*(_WORD *)(v18 + 4)) {
      bssl::dtls_seal_record();
    }
    uint64_t v19 = (v19 - 1);
    unint64_t v21 = (bssl::SSLAEADContext **)(v18 + 64);
    BOOL v22 = (void *)(v18 + 56);
  }

  if (a4 <= 0xC)
  {
    int v23 = 121;
    int v24 = 302;
LABEL_19:
    ERR_put_error(16, 0, v23, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/dtls_record.cc", v24);
    return 0LL;
  }

  int v33 = a3;
  uint64_t v25 = *v21;
  *(_BYTE *)a2 = a5;
  unsigned int v26 = bssl::SSLAEADContext::RecordVersion(*(bssl::SSLAEADContext **)(*(void *)(a1 + 48) + 272LL));
  *(_WORD *)(a2 + 1) = __rev16(v26);
  if ((unint64_t)(*v22 - 0xFFFFFFFFFFFFLL) <= 0xFFFEFFFFFFFFFFFFLL)
  {
    int v23 = 69;
    int v24 = 315;
    goto LABEL_19;
  }

  __int16 v27 = v26;
  unint64_t v28 = *v22 | (v19 << 48);
  *(void *)(a2 + 3) = bswap64(v28);
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  if ((bssl::SSLAEADContext::CiphertextLen(v25, &v35, a7, 0LL) & 1) == 0)
  {
    int v23 = 200;
    int v24 = 324;
    goto LABEL_19;
  }

  *(_WORD *)(a2 + 11) = bswap32((unsigned __int16)v35) >> 16;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v30 = bssl::SSLAEADContext::Seal((uint64_t)v25, (char *)(a2 + 13), &v34, a4 - 13, a5, v27, v28, v29, a2, 13LL, a6, a7);
  if ((_DWORD)v30)
  {
    unint64_t v31 = v35;
    if (v35 != v34) {
      bssl::dtls_seal_record();
    }
    ++*v22;
    *int v33 = v31 + 13;
    bssl::ssl_do_msg_callback(a1, 1LL, 256LL, a2, 13LL);
  }

  return v30;
}

uint64_t std::bitset<256ul>::operator<<=[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x100) {
    unint64_t v3 = 256LL;
  }
  else {
    unint64_t v3 = a2;
  }
  uint64_t v10 = a1;
  int v11 = 0;
  uint64_t v8 = a1 + 8 * ((256 - v3) >> 6);
  if ((-(char)v3 & 0x3F) != 0)
  {
    int v9 = -(char)v3 & 0x3F;
    uint64_t v6 = a1 + 32;
    int v7 = 0;
    std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<4ul,256ul>,false>( (unint64_t)&v10,  (uint64_t)&v8,  (uint64_t)&v6,  (uint64_t)v5);
  }

  else
  {
    int v9 = 0;
    uint64_t v6 = a1 + 32;
    int v7 = 0;
    std::__copy_backward_aligned[abi:ne180100]<std::__bitset<4ul,256ul>,false>( (unsigned int *)&v10,  (uint64_t)&v8,  (uint64_t)&v6,  (uint64_t)v5);
  }

  if (v3)
  {
    uint64_t v10 = a1;
    int v11 = 0;
    std::__fill_n[abi:ne180100]<false,std::__bitset<4ul,256ul>>((uint64_t)&v10, v3);
  }

  return a1;
}

void std::__fill_n[abi:ne180100]<false,std::__bitset<4ul,256ul>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  BOOL v5 = *(void **)a1;
  if (v4)
  {
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1LL << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }

  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    uint64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }

unsigned int *std::__copy_backward_aligned[abi:ne180100]<std::__bitset<4ul,256ul>,false>@<X0>( unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = *(unsigned int *)(a2 + 8);
  uint64_t v7 = result[2];
  uint64_t v8 = v6 + 8LL * (*(void *)a2 - *(void *)result) - v7;
  int v9 = *(unint64_t **)a3;
  if (v8 >= 1)
  {
    if ((_DWORD)v6)
    {
      if (v8 >= v6) {
        uint64_t v11 = *(unsigned int *)(a2 + 8);
      }
      else {
        uint64_t v11 = v6 + 8LL * (*(void *)a2 - *(void *)result) - v7;
      }
      v8 -= v11;
      unint64_t v12 = (-1LL << (v6 - v11)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v6);
      unint64_t *v9 = *v9 & ~v12 | **(void **)a2 & v12;
      *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = (*(_DWORD *)(a3 + 8) - (_BYTE)v11) & 0x3F;
    }

    if (v8 >= 0) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = v8 + 63;
    }
    uint64_t v14 = v13 >> 6;
    *(void *)a3 = &v9[-(v13 >> 6)];
    unint64_t v15 = (const void *)(*(void *)a2 - 8 * (v13 >> 6));
    *(void *)a2 = v15;
    if (v8 - (v14 << 6) <= 0)
    {
      int v9 = *(unint64_t **)a3;
    }

    else
    {
      uint64_t v16 = *(void *)(*(void *)a2 - 8LL);
      *(void *)a2 -= 8LL;
      int v9 = (unint64_t *)(*(void *)a3 - 8LL);
      unint64_t v17 = *v9;
      *(void *)a3 = v9;
      *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = -(int)v8 & 0x3F;
    }
  }

  *(void *)a4 = v9;
  *(_DWORD *)(a4 + _Block_object_dispose(va, 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unint64_t std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<4ul,256ul>,false>@<X0>( unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(unsigned int *)(a2 + 8);
  uint64_t v5 = *(unsigned int *)(result + 8);
  uint64_t v6 = v4 + 8LL * (*(void *)a2 - *(void *)result) - v5;
  if (v6 <= 0)
  {
    LODWORD(v9) = *(_DWORD *)(a3 + 8);
  }

  else
  {
    if ((_DWORD)v4)
    {
      if (v6 >= v4) {
        uint64_t v7 = *(unsigned int *)(a2 + 8);
      }
      else {
        uint64_t v7 = v4 + 8LL * (*(void *)a2 - *(void *)result) - v5;
      }
      v6 -= v7;
      unint64_t v8 = (-1LL << (v4 - v7)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v4) & **(void **)a2;
      unint64_t v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= v9) {
        uint64_t v10 = *(unsigned int *)(a3 + 8);
      }
      else {
        uint64_t v10 = v7;
      }
      if (v10)
      {
        unint64_t v11 = v8 >> (v4 - v9);
        BOOL v12 = v9 >= v4;
        int v14 = v9 - v4;
        BOOL v13 = v14 != 0 && v12;
        unint64_t v15 = v8 << v14;
        if (!v13) {
          unint64_t v15 = v11;
        }
        **(void **)a3 = **(void **)a3 & ~((-1LL << (v9 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v9)) | v15;
        LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v10) & 0x3F;
        *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v9;
        v7 -= v10;
      }

      if (v7 >= 1)
      {
        uint64_t v16 = (unint64_t *)(*(void *)a3 - 8LL);
        unint64_t v9 = *v16;
        *(void *)a3 = v16;
        *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = -(int)v7 & 0x3F;
        uint64_t v17 = v9 & ~(-1LL << -(char)v7);
        int v18 = *(_DWORD *)(a2 + 8) - v7 - v10;
        *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v18;
        LODWORD(v9) = *(_DWORD *)(a3 + 8);
        unint64_t *v16 = (v8 << (v9 - v18)) | v17;
      }
    }

    else
    {
      LODWORD(v9) = *(_DWORD *)(a3 + 8);
    }

    char v19 = 64 - v9;
    unint64_t v20 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v9;
    if (v6 < 64)
    {
      uint64_t v24 = v6;
    }

    else
    {
      do
      {
        unint64_t v21 = *(void *)(*(void *)a2 - 8LL);
        *(void *)a2 -= 8LL;
        BOOL v22 = *(unint64_t **)a3;
        uint64_t result = v21 >> v19;
        *BOOL v22 = **(void **)a3 & ~v20 | (v21 >> v19);
        uint64_t v23 = *--v22;
        *(void *)a3 = v22;
        *BOOL v22 = v23 & v20 | (v21 << v9);
        uint64_t v24 = v6 - 64;
        BOOL v13 = (unint64_t)v6 > 0x7F;
        v6 -= 64LL;
      }

      while (v13);
    }

    if (v24 >= 1)
    {
      uint64_t v25 = *(void *)(*(void *)a2 - 8LL);
      *(void *)a2 -= 8LL;
      unint64_t v26 = v25 & (-1LL << -(char)v24);
      else {
        uint64_t v27 = v24;
      }
      uint64_t v28 = (-1LL << (v9 - v27)) & v20;
      int v29 = *(unint64_t **)a3;
      **(void **)a3 = **(void **)a3 & ~v28 | (v26 >> v19);
      LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v27) & 0x3F;
      *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v9;
      if (v24 - v27 >= 1)
      {
        uint64_t v31 = *(v29 - 1);
        uint64_t v30 = v29 - 1;
        *(void *)a3 = v30;
        *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = (v27 - v24) & 0x3F;
        *uint64_t v30 = v31 & ~(-1LL << (v27 - v24)) | (v26 << (v24 + ((v27 - v24) & 0x3F)));
        LODWORD(v9) = (v27 - v24) & 0x3F;
      }
    }
  }

  *(void *)a4 = *(void *)a3;
  *(_DWORD *)(a4 + _Block_object_dispose(va, 8) = v9;
  return result;
}

void ec_GFp_mont_felem_mul(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
}

void ec_GFp_mont_felem_sqr(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
}

void ec_GFp_mont_felem_to_bytes(uint64_t a1, char *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  _OWORD v8[2] = v7;
  _OWORD v8[3] = v7;
  v8[0] = v7;
  v8[1] = v7;
  bn_from_montgomery_small((unint64_t *)v8, *(int *)(a1 + 328), a4, *(int *)(a1 + 328), a1 + 296);
  ec_GFp_simple_felem_to_bytes(a1, a2, a3, (char *)v8);
}

uint64_t ec_GFp_mont_felem_from_bytes( uint64_t a1, unint64_t *a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t result = ec_GFp_simple_felem_from_bytes(a1, a2, a3, a4);
  if ((_DWORD)result)
  {
    bn_to_montgomery_small(a2, a2, *(int *)(a1 + 328), (unint64_t **)(a1 + 296));
    return 1LL;
  }

  return result;
}

void ec_GFp_mont_felem_reduce(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = (unint64_t **)(a1 + 296);
  bn_from_montgomery_small(a2, *(int *)(a1 + 328), a3, a4, a1 + 296);
  bn_to_montgomery_small(a2, a2, *(int *)(a1 + 328), v6);
  bn_to_montgomery_small(a2, a2, *(int *)(a1 + 328), v6);
}

void ec_GFp_mont_felem_exp(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
}

uint64_t *ec_GFp_mont_add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 == a4) {
    return ec_GFp_mont_dbl(a1, (unint64_t *)a2, (unint64_t *)a3);
  }
  unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v59[2] = v7;
  v59[3] = v7;
  v59[0] = v7;
  v59[1] = v7;
  unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
  v57[2] = v7;
  v57[3] = v7;
  v57[0] = v7;
  v57[1] = v7;
  unint64_t v56 = 0xAAAAAAAAAAAAAAAALL;
  v55[3] = v7;
  v55[2] = v7;
  v55[1] = v7;
  v55[0] = v7;
  uint64_t v8 = ec_felem_non_zero_mask(a1, (uint64_t *)(a3 + 144));
  uint64_t v9 = ec_felem_non_zero_mask(a1, (uint64_t *)(a4 + 144));
  unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[3] = v10;
  v53[2] = v10;
  v53[1] = v10;
  v53[0] = v10;
  bn_mod_mul_montgomery_small( (unint64_t *)v53,  (unint64_t *)(a3 + 144),  (unint64_t *)(a3 + 144),  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v51[3] = v11;
  v51[1] = v11;
  v51[2] = v11;
  v51[0] = v11;
  bn_mod_mul_montgomery_small( (unint64_t *)v51,  (unint64_t *)(a4 + 144),  (unint64_t *)(a4 + 144),  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v50 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49[2] = v12;
  v49[3] = v12;
  v49[0] = v12;
  v49[1] = v12;
  bn_mod_mul_montgomery_small( (unint64_t *)v49,  (unint64_t *)a3,  (unint64_t *)v51,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[2] = v13;
  v47[3] = v13;
  v47[0] = v13;
  v47[1] = v13;
  ec_felem_add(a1, (unint64_t *)v47, (const unint64_t *)(a3 + 144), (const unint64_t *)(a4 + 144));
  bn_mod_mul_montgomery_small( (unint64_t *)v47,  (unint64_t *)v47,  (unint64_t *)v47,  *(int *)(a1 + 328),  a1 + 296);
  ec_felem_sub(a1, (unint64_t *)v47, (const unint64_t *)v47, (const unint64_t *)v53);
  ec_felem_sub(a1, (unint64_t *)v47, (const unint64_t *)v47, (const unint64_t *)v51);
  unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45[2] = v14;
  v45[3] = v14;
  v45[0] = v14;
  v45[1] = v14;
  bn_mod_mul_montgomery_small( (unint64_t *)v45,  (unint64_t *)(a4 + 144),  (unint64_t *)v51,  *(int *)(a1 + 328),  a1 + 296);
  bn_mod_mul_montgomery_small( (unint64_t *)v45,  (unint64_t *)v45,  (unint64_t *)(a3 + 72),  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43[2] = v15;
  _OWORD v43[3] = v15;
  v43[0] = v15;
  v43[1] = v15;
  bn_mod_mul_montgomery_small( (unint64_t *)v43,  (unint64_t *)a4,  (unint64_t *)v53,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41[2] = v16;
  _OWORD v41[3] = v16;
  v41[0] = v16;
  v41[1] = v16;
  ec_felem_sub(a1, (unint64_t *)v41, (const unint64_t *)v43, (const unint64_t *)v49);
  uint64_t v17 = ec_felem_non_zero_mask(a1, (uint64_t *)v41);
  bn_mod_mul_montgomery_small( (unint64_t *)v55,  (unint64_t *)v41,  (unint64_t *)v47,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v39[2] = v18;
  _OWORD v39[3] = v18;
  v39[0] = v18;
  v39[1] = v18;
  bn_mod_mul_montgomery_small( (unint64_t *)v39,  (unint64_t *)(a3 + 144),  (unint64_t *)v53,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  _OWORD v37[2] = v19;
  _OWORD v37[3] = v19;
  v37[0] = v19;
  v37[1] = v19;
  bn_mod_mul_montgomery_small( (unint64_t *)v37,  (unint64_t *)(a4 + 72),  (unint64_t *)v39,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35[2] = v20;
  v35[3] = v20;
  v35[0] = v20;
  v35[1] = v20;
  ec_felem_sub(a1, (unint64_t *)v35, (const unint64_t *)v37, (const unint64_t *)v45);
  ec_felem_add(a1, (unint64_t *)v35, (const unint64_t *)v35, (const unint64_t *)v35);
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[2] = v22;
  v33[3] = v22;
  v33[0] = v22;
  v33[1] = v22;
  ec_felem_add(a1, (unint64_t *)v33, (const unint64_t *)v41, (const unint64_t *)v41);
  bn_mod_mul_montgomery_small( (unint64_t *)v33,  (unint64_t *)v33,  (unint64_t *)v33,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int64x2_t v31[2] = v23;
  v31[3] = v23;
  v31[0] = v23;
  v31[1] = v23;
  bn_mod_mul_montgomery_small( (unint64_t *)v31,  (unint64_t *)v41,  (unint64_t *)v33,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[2] = v24;
  v29[3] = v24;
  v29[0] = v24;
  v29[1] = v24;
  bn_mod_mul_montgomery_small( (unint64_t *)v29,  (unint64_t *)v49,  (unint64_t *)v33,  *(int *)(a1 + 328),  a1 + 296);
  bn_mod_mul_montgomery_small( (unint64_t *)v59,  (unint64_t *)v35,  (unint64_t *)v35,  *(int *)(a1 + 328),  a1 + 296);
  ec_felem_sub(a1, (unint64_t *)v59, (const unint64_t *)v59, (const unint64_t *)v31);
  ec_felem_sub(a1, (unint64_t *)v59, (const unint64_t *)v59, (const unint64_t *)v29);
  ec_felem_sub(a1, (unint64_t *)v59, (const unint64_t *)v59, (const unint64_t *)v29);
  ec_felem_sub(a1, (unint64_t *)v57, (const unint64_t *)v29, (const unint64_t *)v59);
  bn_mod_mul_montgomery_small( (unint64_t *)v57,  (unint64_t *)v57,  (unint64_t *)v35,  *(int *)(a1 + 328),  a1 + 296);
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v25 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[2] = v25;
  _OWORD v27[3] = v25;
  v27[0] = v25;
  v27[1] = v25;
  bn_mod_mul_montgomery_small( (unint64_t *)v27,  (unint64_t *)v45,  (unint64_t *)v31,  *(int *)(a1 + 328),  a1 + 296);
  ec_felem_sub(a1, (unint64_t *)v57, (const unint64_t *)v57, (const unint64_t *)v27);
  ec_felem_sub(a1, (unint64_t *)v57, (const unint64_t *)v57, (const unint64_t *)v27);
  ec_felem_select(a1, (uint64_t *)v59, v8, (uint64_t *)v59, (uint64_t *)a4);
  ec_felem_select(a1, (uint64_t *)a2, v9, (uint64_t *)v59, (uint64_t *)a3);
  ec_felem_select(a1, (uint64_t *)v57, v8, (uint64_t *)v57, (uint64_t *)(a4 + 72));
  ec_felem_select(a1, (uint64_t *)(a2 + 72), v9, (uint64_t *)v57, (uint64_t *)(a3 + 72));
  ec_felem_select(a1, (uint64_t *)v55, v8, (uint64_t *)v55, (uint64_t *)(a4 + 144));
  return ec_felem_select(a1, (uint64_t *)(a2 + 144), v9, (uint64_t *)v55, (uint64_t *)(a3 + 144));
}

uint64_t *ec_GFp_mont_dbl(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (*(_DWORD *)(a1 + 528))
  {
    unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v44 = v6;
    __int128 v45 = v6;
    __int128 v42 = v6;
    __int128 v43 = v6;
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v39 = v6;
    __int128 v40 = v6;
    __int128 v37 = v6;
    __int128 v38 = v6;
    unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v34 = v6;
    __int128 v35 = v6;
    __int128 v32 = v6;
    __int128 v33 = v6;
    unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v29 = v6;
    __int128 v30 = v6;
    __int128 v27 = v6;
    __int128 v28 = v6;
    unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v24 = v6;
    __int128 v25 = v6;
    __int128 v22 = v6;
    __int128 v23 = v6;
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v19 = v6;
    __int128 v20 = v6;
    __int128 v17 = v6;
    __int128 v18 = v6;
    unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
    int64x2_t v15[2] = v6;
    v15[3] = v6;
    v15[0] = v6;
    v15[1] = v6;
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    void v13[2] = v6;
    v13[3] = v6;
    v13[0] = v6;
    v13[1] = v6;
    bn_mod_mul_montgomery_small((unint64_t *)&v42, a3 + 18, a3 + 18, *(int *)(a1 + 328), a1 + 296);
    bn_mod_mul_montgomery_small((unint64_t *)&v37, a3 + 9, a3 + 9, *(int *)(a1 + 328), a1 + 296);
    bn_mod_mul_montgomery_small((unint64_t *)&v32, a3, (unint64_t *)&v37, *(int *)(a1 + 328), a1 + 296);
    ec_felem_sub(a1, (unint64_t *)&v27, a3, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v22, a3, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v22, (const unint64_t *)&v22);
    ec_felem_add(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v17);
    bn_mod_mul_montgomery_small( (unint64_t *)v15,  (unint64_t *)&v27,  (unint64_t *)&v22,  *(int *)(a1 + 328),  a1 + 296);
    bn_mod_mul_montgomery_small(a2, (unint64_t *)v15, (unint64_t *)v15, *(int *)(a1 + 328), a1 + 296);
    ec_felem_add(a1, (unint64_t *)v13, (const unint64_t *)&v32, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)v13, (const unint64_t *)v13, (const unint64_t *)v13);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)v13, (const unint64_t *)v13);
    ec_felem_sub(a1, a2, a2, (const unint64_t *)&v17);
    ec_felem_add(a1, (unint64_t *)&v42, (const unint64_t *)&v37, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v27, a3 + 9, a3 + 18);
    bn_mod_mul_montgomery_small( a2 + 18,  (unint64_t *)&v27,  (unint64_t *)&v27,  *(int *)(a1 + 328),  a1 + 296);
    ec_felem_sub(a1, a2 + 18, a2 + 18, (const unint64_t *)&v42);
    __int128 v7 = a2 + 9;
    ec_felem_sub(a1, a2 + 9, (const unint64_t *)v13, a2);
    ec_felem_add(a1, (unint64_t *)&v37, (const unint64_t *)&v37, (const unint64_t *)&v37);
    bn_mod_mul_montgomery_small( (unint64_t *)&v37,  (unint64_t *)&v37,  (unint64_t *)&v37,  *(int *)(a1 + 328),  a1 + 296);
    bn_mod_mul_montgomery_small(a2 + 9, (unint64_t *)v15, a2 + 9, *(int *)(a1 + 328), a1 + 296);
    ec_felem_add(a1, (unint64_t *)&v37, (const unint64_t *)&v37, (const unint64_t *)&v37);
    uint64_t v8 = (const unint64_t *)&v37;
  }

  else
  {
    unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v44 = v9;
    __int128 v45 = v9;
    __int128 v42 = v9;
    __int128 v43 = v9;
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v39 = v9;
    __int128 v40 = v9;
    __int128 v37 = v9;
    __int128 v38 = v9;
    unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v34 = v9;
    __int128 v35 = v9;
    __int128 v32 = v9;
    __int128 v33 = v9;
    unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v29 = v9;
    __int128 v30 = v9;
    __int128 v27 = v9;
    __int128 v28 = v9;
    bn_mod_mul_montgomery_small((unint64_t *)&v42, a3, a3, *(int *)(a1 + 328), a1 + 296);
    bn_mod_mul_montgomery_small((unint64_t *)&v37, a3 + 9, a3 + 9, *(int *)(a1 + 328), a1 + 296);
    bn_mod_mul_montgomery_small( (unint64_t *)&v32,  (unint64_t *)&v37,  (unint64_t *)&v37,  *(int *)(a1 + 328),  a1 + 296);
    bn_mod_mul_montgomery_small((unint64_t *)&v27, a3 + 18, a3 + 18, *(int *)(a1 + 328), a1 + 296);
    unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v24 = v10;
    __int128 v25 = v10;
    __int128 v22 = v10;
    __int128 v23 = v10;
    ec_felem_add(a1, (unint64_t *)&v22, a3, (const unint64_t *)&v37);
    bn_mod_mul_montgomery_small( (unint64_t *)&v22,  (unint64_t *)&v22,  (unint64_t *)&v22,  *(int *)(a1 + 328),  a1 + 296);
    ec_felem_sub(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v42);
    ec_felem_sub(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v22);
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v19 = v11;
    __int128 v20 = v11;
    __int128 v17 = v11;
    __int128 v18 = v11;
    bn_mod_mul_montgomery_small( (unint64_t *)&v17,  (unint64_t *)&v27,  (unint64_t *)&v27,  *(int *)(a1 + 328),  a1 + 296);
    bn_mod_mul_montgomery_small( (unint64_t *)&v17,  (unint64_t *)(a1 + 360),  (unint64_t *)&v17,  *(int *)(a1 + 328),  a1 + 296);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v17, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v17, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v17, (const unint64_t *)&v42);
    bn_mod_mul_montgomery_small(a2, (unint64_t *)&v17, (unint64_t *)&v17, *(int *)(a1 + 328), a1 + 296);
    ec_felem_sub(a1, a2, a2, (const unint64_t *)&v22);
    ec_felem_sub(a1, a2, a2, (const unint64_t *)&v22);
    ec_felem_add(a1, a2 + 18, a3 + 9, a3 + 18);
    bn_mod_mul_montgomery_small(a2 + 18, a2 + 18, a2 + 18, *(int *)(a1 + 328), a1 + 296);
    ec_felem_sub(a1, a2 + 18, a2 + 18, (const unint64_t *)&v37);
    ec_felem_sub(a1, a2 + 18, a2 + 18, (const unint64_t *)&v27);
    ec_felem_add(a1, (unint64_t *)&v32, (const unint64_t *)&v32, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)&v32, (const unint64_t *)&v32, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)&v32, (const unint64_t *)&v32, (const unint64_t *)&v32);
    __int128 v7 = a2 + 9;
    ec_felem_sub(a1, a2 + 9, (const unint64_t *)&v22, a2);
    bn_mod_mul_montgomery_small(a2 + 9, a2 + 9, (unint64_t *)&v17, *(int *)(a1 + 328), a1 + 296);
    uint64_t v8 = (const unint64_t *)&v32;
  }

  return ec_felem_sub(a1, v7, v7, v8);
}

const EC_METHOD *EC_GFp_mont_method(void)
{
  return (const EC_METHOD *)&EC_GFp_mont_method_storage;
}

void EC_GFp_mont_method_init()
{
  EC_GFp_mont_method_storage = (uint64_t)ec_GFp_mont_point_get_affine_coordinates;
  *(void *)algn_18C4C4E58 = ec_GFp_mont_jacobian_to_affine_batch;
  qword_18C4C4E60 = (uint64_t)ec_GFp_mont_add;
  unk_18C4C4E68 = ec_GFp_mont_dbl;
  qword_18C4C4E70 = (uint64_t)ec_GFp_mont_mul;
  unk_18C4C4E78 = ec_GFp_mont_mul_base;
  qword_18C4C4E80 = (uint64_t)ec_GFp_mont_mul_batch;
  qword_18C4C4E90 = (uint64_t)ec_GFp_mont_mul_public_batch;
  unk_18C4C4E98 = ec_GFp_mont_init_precomp;
  qword_18C4C4EA0 = (uint64_t)ec_GFp_mont_mul_precomp;
  unk_18C4C4EA8 = ec_GFp_mont_felem_mul;
  qword_18C4C4EB0 = (uint64_t)ec_GFp_mont_felem_sqr;
  unk_18C4C4EB8 = ec_GFp_mont_felem_to_bytes;
  qword_18C4C4EC0 = (uint64_t)ec_GFp_mont_felem_from_bytes;
  unk_18C4C4EC8 = ec_GFp_mont_felem_reduce;
  qword_18C4C4ED0 = (uint64_t)ec_GFp_mont_felem_exp;
  unk_18C4C4ED8 = ec_simple_scalar_inv0_montgomery;
  qword_18C4C4EE0 = (uint64_t)ec_simple_scalar_to_montgomery_inv_vartime;
  unk_18C4C4EE8 = ec_GFp_mont_cmp_x_coordinate;
}

uint64_t ec_GFp_mont_point_get_affine_coordinates( uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  if (ec_GFp_simple_is_at_infinity(a1, (uint64_t)a2))
  {
    ERR_put_error( 15,  0,  119,  "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec_montgomery.c",  150);
    return 0LL;
  }

  else
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    _OWORD v12[2] = v9;
    _OWORD v12[3] = v9;
    v12[0] = v9;
    v12[1] = v9;
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    _OWORD v10[2] = v9;
    _OWORD v10[3] = v9;
    v10[0] = v9;
    v10[1] = v9;
    bn_mod_inverse0_prime_mont_small((unint64_t *)v10, (uint64_t)(a2 + 18), *(int *)(a1 + 328), a1 + 296);
    bn_mod_mul_montgomery_small( (unint64_t *)v12,  (unint64_t *)v10,  (unint64_t *)v10,  *(int *)(a1 + 328),  a1 + 296);
    if (a3) {
      bn_mod_mul_montgomery_small(a3, a2, (unint64_t *)v12, *(int *)(a1 + 328), a1 + 296);
    }
    if (a4)
    {
      bn_mod_mul_montgomery_small( (unint64_t *)v12,  (unint64_t *)v12,  (unint64_t *)v10,  *(int *)(a1 + 328),  a1 + 296);
      bn_mod_mul_montgomery_small(a4, a2 + 9, (unint64_t *)v12, *(int *)(a1 + 328), a1 + 296);
    }

    return 1LL;
  }

uint64_t ec_GFp_mont_jacobian_to_affine_batch(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!a4) {
    return 1LL;
  }
  uint64_t v6 = a2;
  *(_OWORD *)a2 = *(_OWORD *)(a3 + 144);
  __int128 v8 = *(_OWORD *)(a3 + 160);
  __int128 v9 = *(_OWORD *)(a3 + 176);
  __int128 v10 = *(_OWORD *)(a3 + 192);
  *(void *)(a2 + 64) = *(void *)(a3 + 208);
  *(_OWORD *)(a2 + 32) = v9;
  *(_OWORD *)(a2 + 4_Block_object_dispose(va, 8) = v10;
  *(_OWORD *)(a2 + 16) = v8;
  unint64_t v11 = a4 - 1;
  if (a4 != 1)
  {
    __int128 v12 = (unint64_t *)(a3 + 360);
    unint64_t v13 = a4 - 1;
    do
    {
      uint64_t v14 = a2 + 144;
      bn_mod_mul_montgomery_small( (unint64_t *)(a2 + 144),  (unint64_t *)a2,  v12,  *(int *)(a1 + 328),  a1 + 296);
      v12 += 27;
      a2 = v14;
      --v13;
    }

    while (v13);
  }

  if (ec_felem_non_zero_mask(a1, (uint64_t *)(v6 + 144 * v11)))
  {
    unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v29 = v15;
    __int128 v30 = v15;
    __int128 v27 = v15;
    __int128 v28 = v15;
    bn_mod_inverse0_prime_mont_small((unint64_t *)&v27, v6 + 144 * v11, *(int *)(a1 + 328), a1 + 296);
    unint64_t v16 = (unint64_t *)(a3 + 216 * a4 - 216);
    __int128 v17 = (unint64_t *)(v6 + 144 * a4 - 144);
    do
    {
      unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v24 = v18;
      __int128 v25 = v18;
      __int128 v22 = v18;
      __int128 v23 = v18;
      unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
      int64x2_t v20[2] = v18;
      v20[3] = v18;
      v20[0] = v18;
      v20[1] = v18;
      if (v11)
      {
        bn_mod_mul_montgomery_small( (unint64_t *)&v22,  (unint64_t *)&v27,  v17 - 18,  *(int *)(a1 + 328),  a1 + 296);
        bn_mod_mul_montgomery_small( (unint64_t *)&v27,  (unint64_t *)&v27,  v16 + 18,  *(int *)(a1 + 328),  a1 + 296);
      }

      else
      {
        __int128 v24 = v29;
        __int128 v25 = v30;
        unint64_t v26 = v31;
        __int128 v22 = v27;
        __int128 v23 = v28;
      }

      bn_mod_mul_montgomery_small( (unint64_t *)v20,  (unint64_t *)&v22,  (unint64_t *)&v22,  *(int *)(a1 + 328),  a1 + 296);
      bn_mod_mul_montgomery_small(v17, v16, (unint64_t *)v20, *(int *)(a1 + 328), a1 + 296);
      bn_mod_mul_montgomery_small(v17 + 9, v16 + 9, (unint64_t *)v20, *(int *)(a1 + 328), a1 + 296);
      bn_mod_mul_montgomery_small(v17 + 9, v17 + 9, (unint64_t *)&v22, *(int *)(a1 + 328), a1 + 296);
      v16 -= 27;
      v17 -= 18;
      --v11;
    }

    while (v11 < a4);
    return 1LL;
  }

  else
  {
    ERR_put_error( 15,  0,  119,  "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec_montgomery.c",  189);
    return 0LL;
  }

uint64_t ec_GFp_mont_cmp_x_coordinate(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(_DWORD *)(a1 + 536) || *(_DWORD *)(a1 + 328) != *(_DWORD *)(a1 + 264)) {
    return ec_GFp_simple_cmp_x_coordinate(a1, a2, a3);
  }
  if (!ec_GFp_simple_is_at_infinity(a1, a2))
  {
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v15 = v7;
    __int128 v16 = v7;
    *(_OWORD *)rp = v7;
    __int128 v14 = v7;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    int64x2_t v11[2] = v7;
    _OWORD v11[3] = v7;
    v11[0] = v7;
    v11[1] = v7;
    unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
    int64x2_t v9[2] = v7;
    void v9[3] = v7;
    v9[0] = v7;
    v9[1] = v7;
    bn_mod_mul_montgomery_small( (unint64_t *)v11,  (unint64_t *)(a2 + 144),  (unint64_t *)(a2 + 144),  *(int *)(a1 + 328),  a1 + 296);
    unint64_t v8 = *(int *)(a1 + 328);
    if ((_DWORD)v8) {
      __memcpy_chk();
    }
    bn_mod_mul_montgomery_small(rp, rp, (unint64_t *)v11, v8, a1 + 296);
    bn_from_montgomery_small((unint64_t *)v9, *(int *)(a1 + 328), a2, *(int *)(a1 + 328), a1 + 296);
    if (!bn_add_words(rp, (const unint64_t *)a3, *(const unint64_t **)(a1 + 256), *(_DWORD *)(a1 + 328)))
    {
      if (bn_less_than_words((uint64_t *)rp, *(uint64_t **)(a1 + 320), *(int *)(a1 + 328)))
      {
        bn_mod_mul_montgomery_small(rp, rp, (unint64_t *)v11, *(int *)(a1 + 328), a1 + 296);
      }
    }
  }

  return 0LL;
}

uint64_t bssl::ssl_create_cipher_list(bssl::SSLCipherPreferenceList **a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0LL;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return v4;
  }
  uint64_t v5 = a3;
  if (!a3) {
    return v4;
  }
  memset(__b, 170, sizeof(__b));
  for (uint64_t i = 0LL; i != 1120; i += 32LL)
  {
    unint64_t v8 = &__b[i];
    __int128 v9 = &__b[i + 32];
    if (i == 1088) {
      __int128 v9 = 0LL;
    }
    unint64_t v10 = v8 - 32;
    if (!i) {
      unint64_t v10 = 0LL;
    }
    *((void *)v8 + 2) = v9;
    *((void *)v8 + 3) = v10;
    *((_WORD *)v8 + 4) = 0;
  }

  uint64_t v47 = &__b[1088];
  unint64_t v48 = (uint64_t *)__b;
  if (a2)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = __b;
    uint64_t v13 = 4LL;
    do
    {
      int v14 = (unsigned __int16)bssl::ssl_create_cipher_list(std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter> *,BOOL,char const*,BOOL)::kAESCiphers[v11];
      unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 __key = v15;
      __int128 v50 = v15;
      LODWORD(v50) = v14 | 0x3000000;
      __int128 v16 = bsearch( &__key,  bssl::kCiphers,  0x26uLL,  0x28uLL,  (int (__cdecl *)(const void *, const void *))ssl_cipher_id_cmp_void);
      void *v12 = v16;
      if (!v16) {
        bssl::ssl_create_cipher_list();
      }
      v12 += 4;
      ++v11;
    }

    while (v11 != 4);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  uint64_t v17 = 0LL;
  __int128 v18 = &__b[32 * v13];
  do
  {
    int v19 = (unsigned __int16)bssl::ssl_create_cipher_list(std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter> *,BOOL,char const*,BOOL)::kChaChaCiphers[v17];
    unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 __key = v20;
    __int128 v50 = v20;
    LODWORD(v50) = v19 | 0x3000000;
    unint64_t v21 = bsearch( &__key,  bssl::kCiphers,  0x26uLL,  0x28uLL,  (int (__cdecl *)(const void *, const void *))ssl_cipher_id_cmp_void);
    void *v18 = v21;
    if (!v21) {
      bssl::ssl_create_cipher_list();
    }
    ++v13;
    v18 += 4;
    ++v17;
  }

  while (v17 != 3);
  if ((a2 & 1) == 0)
  {
    for (uint64_t j = 0LL; j != 4; ++j)
    {
      int v23 = (unsigned __int16)bssl::ssl_create_cipher_list(std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter> *,BOOL,char const*,BOOL)::kAESCiphers[j];
      unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 __key = v24;
      __int128 v50 = v24;
      LODWORD(v50) = v23 | 0x3000000;
      __int128 v25 = bsearch( &__key,  bssl::kCiphers,  0x26uLL,  0x28uLL,  (int (__cdecl *)(const void *, const void *))ssl_cipher_id_cmp_void);
      void *v18 = v25;
      if (!v25) {
        bssl::ssl_create_cipher_list();
      }
      ++v13;
      v18 += 4;
    }
  }

  uint64_t v26 = 0LL;
  uint64_t v27 = 32 * v13;
  do
  {
    int v28 = (unsigned __int16)bssl::ssl_create_cipher_list(std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter> *,BOOL,char const*,BOOL)::kLegacyCiphers[v26];
    unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v29 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 __key = v29;
    __int128 v50 = v29;
    LODWORD(v50) = v28 | 0x3000000;
    __int128 v30 = bsearch( &__key,  bssl::kCiphers,  0x26uLL,  0x28uLL,  (int (__cdecl *)(const void *, const void *))ssl_cipher_id_cmp_void);
    *(void *)&__b[v27] = v30;
    if (!v30) {
      bssl::ssl_create_cipher_list();
    }
    v27 += 32LL;
    ++v26;
  }

  while (v26 != 28);
  if (v27 != 1120) {
    bssl::ssl_create_cipher_list();
  }
  if (!strncmp((const char *)v5, "DEFAULT", 7uLL))
  {
    int v31 = *(unsigned __int8 *)(v5 + 7);
    v5 += 7LL;
    if (v31 == 58) {
      ++v5;
    }
  }

  __int128 v32 = OPENSSL_sk_new_null();
  unint64_t v46 = v32;
  __int128 __key = 0uLL;
  if (!v32)
  {
    __int128 v33 = 0LL;
    goto LABEL_43;
  }

  OPENSSL_free(0LL);
  __int128 __key = 0uLL;
  __int128 v33 = OPENSSL_malloc(0x26uLL);
  *(void *)&__int128 __key = v33;
  if (!v33)
  {
LABEL_43:
    uint64_t v4 = 0LL;
    goto LABEL_58;
  }

  *((void *)&__key + 1) = 38LL;
  __int128 v34 = v48;
  if (v48)
  {
    unint64_t v35 = 0LL;
    do
    {
      if (*((_BYTE *)v34 + 8))
      {
        if (!OPENSSL_sk_push(v32, *v34)) {
          goto LABEL_43;
        }
        *((_BYTE *)v33 + v35++) = *((_BYTE *)v34 + 9);
      }

      __int128 v34 = (uint64_t *)v34[2];
    }

    while (v34);
  }

  else
  {
    unint64_t v35 = 0LL;
  }

  unint64_t v36 = (bssl::SSLCipherPreferenceList *)OPENSSL_malloc(0x10uLL);
  if (!v36)
  {
    uint64_t v4 = 0LL;
    __int128 v45 = 0LL;
    goto LABEL_57;
  }

  *(void *)unint64_t v36 = 0LL;
  *((void *)v36 + 1) = 0LL;
  __int128 v45 = v36;
  unint64_t v46 = 0LL;
  if (v35 >= 0x26) {
    uint64_t v37 = 38LL;
  }
  else {
    uint64_t v37 = v35;
  }
  a = (BUF_MEM *)v32;
  char v38 = bssl::SSLCipherPreferenceList::Init((uint64_t)v36, (const EVP_MD_CTX **)&a, v33, (const EVP_MD *)v37);
  __int128 v39 = a;
  a = 0LL;
  if (v39) {
    BUF_MEM_free(v39);
  }
  if ((v38 & 1) == 0)
  {
LABEL_56:
    __int128 v32 = 0LL;
    uint64_t v4 = 0LL;
    goto LABEL_57;
  }

  __int128 v40 = v45;
  __int128 v45 = 0LL;
  std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter>::reset[abi:ne180100](a1, v40);
  if (!EVP_MD_CTX_md(*(const EVP_MD_CTX **)*a1))
  {
    ERR_put_error(16, 0, 177, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_cipher.cc", 1495);
    goto LABEL_56;
  }

  __int128 v32 = 0LL;
  uint64_t v4 = 1LL;
LABEL_57:
  std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter>::reset[abi:ne180100](&v45, 0LL);
LABEL_58:
  OPENSSL_free(v33);
  unint64_t v46 = 0LL;
  if (v32) {
    BUF_MEM_free((BUF_MEM *)v32);
  }
  return v4;
}

void sub_1875E2664( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, uint64_t a22, char a23)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t bssl::ssl_cipher_auth_mask_for_key(bssl *this, const evp_pkey_st *a2)
{
  int v2 = (int)a2;
  int v3 = EVP_PKEY_id((uint64_t)this);
  if (v3 == 949 || v3 == 408)
  {
    if (v2) {
      return 4LL;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    if (v2) {
      unsigned int v4 = 3;
    }
    else {
      unsigned int v4 = 2;
    }
    if (v3 == 6) {
      return v4;
    }
    else {
      return 0LL;
    }
  }

BOOL bssl::ssl_cipher_uses_certificate_auth(bssl *this, const ssl_cipher_st *a2)
{
  return (*((_BYTE *)this + 24) & 7) != 0;
}

uint64_t bssl::ssl_cipher_requires_server_key_exchange(bssl *this, const ssl_cipher_st *a2)
{
  return (*((unsigned __int8 *)this + 20) >> 1) & 1;
}

uint64_t bssl::ssl_cipher_get_record_split_len(bssl *this, const ssl_cipher_st *a2)
{
  int v2 = *((_DWORD *)this + 7);
  if (v2 == 1)
  {
    uint64_t v4 = 24LL;
  }

  else
  {
    if (v2 != 4 && v2 != 2) {
      return 0LL;
    }
    uint64_t v4 = 32LL;
  }

  if (*((_DWORD *)this + 8) != 1) {
    bssl::ssl_cipher_get_record_split_len();
  }
  return v4;
}

uint64_t SSL_CIPHER_get_cipher_nid(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 28);
  if (v1 <= 15)
  {
    switch(v1)
    {
      case 1:
        return 44LL;
      case 2:
        return 419LL;
      case 4:
        return 427LL;
      case 8:
        return 895LL;
      default:
        goto LABEL_14;
    }
  }

  if (v1 == 16) {
    return 901LL;
  }
  if (v1 == 32) {
    return 0LL;
  }
  if (v1 != 64) {
LABEL_14:
  }
    SSL_CIPHER_get_cipher_nid_cold_1();
  return 950LL;
}

uint64_t SSL_CIPHER_get_digest_nid(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) - 1;
  return dword_1876130F0[v1];
}

uint64_t SSL_CIPHER_get_kx_nid(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if (v1 > 7)
  {
    if (v1 == 8)
    {
      return 953LL;
    }

    else
    {
      if (v1 != 16) {
        goto LABEL_11;
      }
      return 957LL;
    }
  }

  else
  {
    if (v1 != 1)
    {
      if (v1 == 2) {
        return 952LL;
      }
LABEL_11:
      SSL_CIPHER_get_kx_nid_cold_1();
    }

    return 951LL;
  }

const EVP_MD *SSL_CIPHER_get_handshake_digest(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 36);
  if (v1 == 4) {
    return EVP_sha384();
  }
  if (v1 == 2) {
    return EVP_sha256();
  }
  if (v1 != 1) {
    SSL_CIPHER_get_handshake_digest_cold_1();
  }
  return (const EVP_MD *)EVP_md5_sha1();
}

EVP_MD *SSL_CIPHER_get_prf_nid(uint64_t a1)
{
  uint64_t result = (EVP_MD *)SSL_CIPHER_get_handshake_digest(a1);
  if (result) {
    return (EVP_MD *)EVP_MD_nid((unsigned int *)result);
  }
  return result;
}

BOOL SSL_CIPHER_is_block_cipher(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 28) & 0x20) == 0 && *(_DWORD *)(a1 + 32) != 8;
}

int SSL_CIPHER_get_bits(const SSL_CIPHER *c, int *alg_bits)
{
  if (c)
  {
    int algorithms_high = HIDWORD(c->algorithms);
    if (algorithms_high <= 15)
    {
      int v3 = algorithms_high - 1;
      int v4 = 128;
      LODWORD(c) = 128;
      switch(v3)
      {
        case 0:
          LODWORD(c) = 112;
          int v4 = 168;
          if (!alg_bits) {
            return (int)c;
          }
          goto LABEL_11;
        case 1:
        case 7:
          goto LABEL_10;
        case 3:
          goto LABEL_9;
        default:
          goto LABEL_15;
      }
    }

    if (algorithms_high != 64)
    {
      if (algorithms_high == 32)
      {
        int v4 = 0;
        LODWORD(c) = 0;
        if (!alg_bits) {
          return (int)c;
        }
        goto LABEL_11;
      }

      if (algorithms_high != 16) {
LABEL_15:
      }
        SSL_CIPHER_get_bits_cold_1();
    }

char *__cdecl SSL_CIPHER_get_version(const SSL_CIPHER *c)
{
  return "TLSv1/SSLv3";
}

uint64_t bssl::ssl_cipher_apply_rule( uint64_t result, uint64_t a2, int a3, int a4, char a5, uint64_t **a6, void *a7)
{
  int v10 = result;
  if (!(_DWORD)result
    && a4 == -1
    && !*(_WORD *)(a2 + 24)
    && (!*(_DWORD *)(a2 + 8) || !*(_DWORD *)(a2 + 12) || !*(_DWORD *)(a2 + 16) || !*(_DWORD *)(a2 + 20)))
  {
    return result;
  }

  uint64_t v11 = *a6;
  unint64_t v12 = (uint64_t *)*a7;
  if (a3 == 3) {
    uint64_t v13 = (uint64_t *)*a7;
  }
  else {
    uint64_t v13 = *a6;
  }
  if (a3 == 3) {
    int v14 = *a6;
  }
  else {
    int v14 = (uint64_t *)*a7;
  }
  if (v14) {
    BOOL v15 = v13 == 0LL;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15) {
    goto LABEL_97;
  }
  __int128 v33 = a6;
  __int128 v34 = a7;
  while (2)
  {
    unint64_t v35 = v11;
    __int128 v16 = v13;
    while (1)
    {
      if (a3 == 3) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      uint64_t v13 = (uint64_t *)v16[v17];
      uint64_t result = *v16;
      if (v10)
      {
        if (*(_DWORD *)(result + 16) == v10) {
          goto LABEL_48;
        }
        goto LABEL_24;
      }

      if ((a4 & 0x80000000) == 0)
      {
        uint64_t result = SSL_CIPHER_get_bits((const SSL_CIPHER *)result, 0LL);
        if ((_DWORD)result == a4) {
          goto LABEL_48;
        }
        goto LABEL_24;
      }

      int v18 = *(_DWORD *)(result + 20);
      if ((v18 & *(_DWORD *)(a2 + 8)) == 0) {
        goto LABEL_24;
      }
      int v19 = *(_DWORD *)(result + 24);
      if ((v19 & *(_DWORD *)(a2 + 12)) == 0) {
        goto LABEL_24;
      }
      int v20 = *(_DWORD *)(result + 28);
      if ((v20 & *(_DWORD *)(a2 + 16)) == 0 || (*(_DWORD *)(result + 32) & *(_DWORD *)(a2 + 20)) == 0) {
        goto LABEL_24;
      }
      if (*(_WORD *)(a2 + 24)) {
        break;
      }
      if (v20 != 32) {
        goto LABEL_45;
      }
LABEL_24:
      if (v16 != v14)
      {
        __int128 v16 = v13;
        if (v13) {
          continue;
        }
      }

      a6 = v33;
      a7 = v34;
      uint64_t v11 = v35;
      goto LABEL_97;
    }

    if (v18 == 16 || v19 == 16)
    {
      int v22 = 772;
    }

    else if (*(_DWORD *)(result + 36) == 1)
    {
      int v22 = 768;
    }

    else
    {
      int v22 = 771;
    }

uint64_t bssl::Array<int>::Init(uint64_t a1, unint64_t a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  if (!a2) {
    return 1LL;
  }
  if (a2 >> 62)
  {
    ERR_put_error(16, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/internal.h", 297);
    return 0LL;
  }

  uint64_t result = (uint64_t)OPENSSL_malloc(4 * a2);
  *(void *)a1 = result;
  if (result)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
    return 1LL;
  }

  return result;
}

uint64_t boringssl_memory_outstanding_allocations()
{
  return 0LL;
}

uint64_t boringssl_memory_copy_array(const void *a1, size_t __size)
{
  if (!a1)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      boringssl_memory_copy_array_cold_1();
    }
    return 0LL;
  }

  if (!__size)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      boringssl_memory_copy_array_cold_2();
    }
    return 0LL;
  }

  int v4 = malloc(__size);
  if (!v4)
  {
    uint64_t v5 = g_boringssl_log;
    if (!g_boringssl_log) {
      return v5;
    }
    if (os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      boringssl_memory_copy_array_cold_3();
    }
    return 0LL;
  }

  uint64_t v5 = (uint64_t)v4;
  memcpy(v4, a1, __size);
  return v5;
}

void *EVP_aead_chacha20_poly1305()
{
  return &aead_chacha20_poly1305;
}

uint64_t aead_chacha20_poly1305_init(uint64_t a1, _OWORD *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = 16LL;
  if (a4) {
    unint64_t v4 = a4;
  }
  if (v4 < 0x11)
  {
    if (a3 == 32)
    {
      __int128 v5 = a2[1];
      *(_OWORD *)(a1 + _Block_object_dispose(va, 8) = *a2;
      *(_OWORD *)(a1 + 24) = v5;
      *(_BYTE *)(a1 + 40) = v4;
      *(_BYTE *)(a1 + 576) = v4;
      return 1LL;
    }
  }

  else
  {
    ERR_put_error( 30,  0,  117,  "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m",  30);
  }

  return 0LL;
}

uint64_t aead_chacha20_poly1305_cleanup()
{
  return cc_clear();
}

BOOL aead_chacha20_poly1305_open( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a6 != 12)
  {
    int v13 = 121;
    int v14 = 214;
    goto LABEL_7;
  }

  unint64_t v11 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v12 = a8 - v11;
  if (a8 < v11)
  {
    int v13 = 101;
    int v14 = 219;
LABEL_7:
    ERR_put_error( 30,  0,  v13,  "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m",  v14);
    return 0LL;
  }

  if (a8 >= 0x3FFFFFFFC0LL)
  {
    int v13 = 117;
    int v14 = 230;
    goto LABEL_7;
  }

  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v18;
  v19[2] = v18;
  v19[0] = v18;
  if (calc_tag((uint64_t)v19, a1 + 8, a5, a9, a10, a7, v12, 0LL, 0LL))
  {
    if (!g_boringssl_log) {
      return 0LL;
    }
    BOOL result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_2();
      return 0LL;
    }
  }

  else
  {
    if (!ccchacha20())
    {
      if (!CRYPTO_memcmp((char *)v19, (char *)(a7 + v12), *(unsigned __int8 *)(a1 + 40)))
      {
        *a3 = v12;
        return 1LL;
      }

      int v13 = 101;
      int v14 = 250;
      goto LABEL_7;
    }

    if (!g_boringssl_log) {
      return 0LL;
    }
    BOOL result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_1();
      return 0LL;
    }
  }

  return result;
}

BOOL aead_chacha20_poly1305_seal_scatter( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, uint64_t a12, unint64_t a13)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a7 != 12)
  {
    int v13 = 121;
    int v14 = 133;
    goto LABEL_5;
  }

  if (a9 >= 0x3FFFFFFFC0LL)
  {
    int v13 = 117;
    int v14 = 145;
LABEL_5:
    ERR_put_error( 30,  0,  v13,  "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m",  v14);
    return 0LL;
  }

  uint64_t v17 = a4;
  uint64_t v19 = a2;
  uint64_t v20 = a1;
  uint64_t v21 = a1 + 8;
  memset(__src, 0, sizeof(__src));
  if (a11)
  {
    unint64_t v22 = 0LL;
    unint64_t v23 = a9 >> 6;
    unint64_t v24 = a9 & 0x3F;
    while (1)
    {
      LODWORD(v23) = v23 + 1;
      memset(v30, 0, sizeof(v30));
      while (v22 < a11)
      {
        *(_BYTE *)(a3 + v22) = *((_BYTE *)v30 + v24) ^ *(_BYTE *)(a10 + v22);
        ++v22;
        if (v24 > 0x3E) {
          break;
        }
        ++v24;
      }

      unint64_t v24 = 0LL;
      if (v22 >= a11)
      {
        uint64_t v20 = a1;
        uint64_t v17 = a4;
        uint64_t v19 = a2;
        goto LABEL_16;
      }
    }

    uint64_t v25 = (os_log_s *)g_boringssl_log;
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      aead_chacha20_poly1305_seal_scatter_cold_3(v25);
    }
    return 0LL;
  }

BOOL aead_chacha20_poly1305_open_gather( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, char *a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  v15[3] = *MEMORY[0x1895F89C0];
  if (a4 != 12)
  {
    int v11 = 121;
    int v12 = 274;
    goto LABEL_7;
  }

  if (*(unsigned __int8 *)(a1 + 576) != a8)
  {
    int v11 = 101;
    int v12 = 279;
    goto LABEL_7;
  }

  if (a6 >= 0x3FFFFFFFC0LL)
  {
    int v11 = 117;
    int v12 = 291;
LABEL_7:
    ERR_put_error( 30,  0,  v11,  "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m",  v12);
    return 0LL;
  }

  v15[0] = 0xAAAAAAAAAAAAAAAALL;
  v15[1] = 0xAAAAAAAAAAAAAAAALL;
  if (calc_tag((uint64_t)v15, a1 + 8, a3, a9, a10, a5, a6, 0LL, 0LL))
  {
    if (!g_boringssl_log) {
      return 0LL;
    }
    BOOL result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_2();
      return 0LL;
    }
  }

  else
  {
    if (!ccchacha20())
    {
      int v11 = 101;
      int v12 = 310;
      goto LABEL_7;
    }

    if (!g_boringssl_log) {
      return 0LL;
    }
    BOOL result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_1();
      return 0LL;
    }
  }

  return result;
}

uint64_t calc_tag( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = ccchacha20();
  if ((_DWORD)v11)
  {
    uint64_t v12 = v11;
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
      aead_chacha20_poly1305_open_cold_1();
    }
  }

  else
  {
    uint64_t v13 = ccpoly1305_init();
    if ((_DWORD)v13)
    {
      uint64_t v12 = v13;
      if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
        calc_tag_cold_2();
      }
    }

    else
    {
      int v14 = ccpoly1305_update();
      int v15 = v14;
      if ((a5 & 0xF) != 0 && !v14) {
        int v15 = ccpoly1305_update();
      }
      int v16 = ccpoly1305_update() | v15;
      int v17 = v16 | ccpoly1305_update();
      unint64_t v18 = a9 + a7;
      if ((v18 & 0xF) != 0 && !v17) {
        int v17 = ccpoly1305_update();
      }
      uint64_t v19 = 0LL;
      v24[0] = 0xAAAAAAAAAAAAAAAALL;
      do
      {
        *((_BYTE *)v24 + v19) = a5;
        a5 >>= 8;
        ++v19;
      }

      while (v19 != 8);
      int v20 = ccpoly1305_update();
      uint64_t v21 = 0LL;
      v24[0] = 0xAAAAAAAAAAAAAAAALL;
      do
      {
        *((_BYTE *)v24 + v21) = v18;
        v18 >>= 8;
        ++v21;
      }

      while (v21 != 8);
      int v22 = v20 | v17 | ccpoly1305_update();
      uint64_t v12 = v22 | ccpoly1305_final();
      if ((_DWORD)v12 && g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR)) {
        calc_tag_cold_1();
      }
    }
  }

  return v12;
}

void OUTLINED_FUNCTION_0_7( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t CRYPTO_tls1_prf( uint64_t *a1, _BYTE *a2, size_t a3, char *a4, unint64_t a5, const unsigned __int8 *a6, size_t a7, const unsigned __int8 *a8, size_t len, const unsigned __int8 *a10, size_t a11)
{
  if (!a3) {
    return 1LL;
  }
  bzero(a2, a3);
  if (EVP_md5_sha1() == a1)
  {
    unint64_t v18 = (EVP_MD *)EVP_md5();
    uint64_t result = tls1_P_hash(a2, a3, v18, a4, a5 - (a5 >> 1), a6, a7, a8, len, a10, a11);
    if (!(_DWORD)result) {
      return result;
    }
    a4 += a5 >> 1;
    a5 -= a5 >> 1;
    a1 = (uint64_t *)EVP_sha1();
  }

  return tls1_P_hash(a2, a3, (EVP_MD *)a1, a4, a5, a6, a7, a8, len, a10, a11);
}

uint64_t tls1_P_hash( _BYTE *a1, unint64_t a2, EVP_MD *md, const void *a4, int a5, const unsigned __int8 *a6, size_t a7, const unsigned __int8 *a8, size_t len, const unsigned __int8 *a10, size_t a11)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  unint64_t v47 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v45 = v19;
  __int128 v46 = v19;
  __int128 v43 = v19;
  __int128 v44 = v19;
  *(_OWORD *)&v41[57] = v19;
  __int128 v42 = v19;
  *(void *)&v41[53] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v41[45] = v19;
  *(_OWORD *)&v41[49] = v19;
  *(_OWORD *)&v41[37] = v19;
  *(_OWORD *)&v41[41] = v19;
  *(_OWORD *)&v41[33] = v19;
  *(_OWORD *)&v41[29] = v19;
  *(void *)&v41[25] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v41[17] = v19;
  *(_OWORD *)&v41[21] = v19;
  *(_OWORD *)&v41[9] = v19;
  *(_OWORD *)&v41[13] = v19;
  *(_OWORD *)&v41[1] = v19;
  *(_OWORD *)&v41[5] = v19;
  v49[2] = v19;
  v49[3] = v19;
  v49[0] = v19;
  v49[1] = v19;
  v41[0] = -1431655766;
  unint64_t v20 = EVP_MD_size(md);
  HMAC_CTX_init((HMAC_CTX *)&v41[57]);
  HMAC_CTX_init((HMAC_CTX *)&v41[29]);
  HMAC_CTX_init((HMAC_CTX *)&v41[1]);
  HMAC_Init_ex((HMAC_CTX *)&v41[1], a4, a5, md, 0LL);
  if (v21)
  {
    if (HMAC_CTX_copy_ex((uint64_t)&v41[57], (uint64_t)&v41[1]))
    {
      HMAC_Update((HMAC_CTX *)&v41[57], a6, a7);
      if (v22)
      {
        HMAC_Update((HMAC_CTX *)&v41[57], a8, len);
        if (v23)
        {
          HMAC_Update((HMAC_CTX *)&v41[57], a10, a11);
          if (v24)
          {
            HMAC_Final((HMAC_CTX *)&v41[57], (unsigned __int8 *)v49, v41);
            if (v25)
            {
              while (1)
              {
                unsigned int v40 = -1431655766;
                *(void *)&__int128 v26 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v48[2] = v26;
                _OWORD v48[3] = v26;
                v48[0] = v26;
                v48[1] = v26;
                HMAC_Update((HMAC_CTX *)&v41[57], (const unsigned __int8 *)v49, v41[0]);
                HMAC_Update((HMAC_CTX *)&v41[57], a6, a7);
                if (!v28) {
                  break;
                }
                HMAC_Update((HMAC_CTX *)&v41[57], a8, len);
                if (!v29) {
                  break;
                }
                HMAC_Update((HMAC_CTX *)&v41[57], a10, a11);
                if (!v30) {
                  break;
                }
                HMAC_Final((HMAC_CTX *)&v41[57], (unsigned __int8 *)v48, &v40);
                if (!v31) {
                  break;
                }
                if (v20 != v40) {
                  tls1_P_hash_cold_1();
                }
                if (a2 >= v20) {
                  unint64_t v32 = v20;
                }
                else {
                  unint64_t v32 = a2;
                }
                if (v32)
                {
                  __int128 v33 = (char *)v48;
                  __int128 v34 = a1;
                  unint64_t v35 = v32;
                  do
                  {
                    char v36 = *v33++;
                    *v34++ ^= v36;
                    --v35;
                  }

                  while (v35);
                }

                a2 -= v32;
                if (!a2)
                {
                  uint64_t v38 = 1LL;
                  goto LABEL_26;
                }

                HMAC_Final((HMAC_CTX *)&v41[29], (unsigned __int8 *)v49, v41);
                if (!v37) {
                  break;
                }
                a1 += v32;
              }
            }
          }
        }
      }
    }
  }

  uint64_t v38 = 0LL;
LABEL_26:
  OPENSSL_cleanse(v49, 0x40uLL);
  HMAC_CTX_cleanup((HMAC_CTX *)&v41[57]);
  HMAC_CTX_cleanup((HMAC_CTX *)&v41[29]);
  HMAC_CTX_cleanup((HMAC_CTX *)&v41[1]);
  return v38;
}

BOOL CRYPTO_tls13_hkdf_expand_label( int a1, int a2, EVP_MD *a3, uint64_t a4, uint64_t a5, const void *a6, size_t a7, const void *a8, size_t a9)
{
  *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = v15;
  v21[2] = v15;
  int64x2_t v20[2] = v15;
  v21[0] = v15;
  v20[0] = v15;
  v20[1] = v15;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  __int128 v19 = 0LL;
  CBB_zero(v21);
  if (CBB_init((uint64_t)v21, a7 + a9 + 10)
    && CBB_add_u16((uint64_t)v21, (unsigned __int16)a2)
    && CBB_add_u8_length_prefixed((uint64_t *)v21, (uint64_t)v20)
    && CBB_add_bytes((uint64_t)v20, "tls13 ", 6uLL)
    && CBB_add_bytes((uint64_t)v20, a6, a7)
    && CBB_add_u8_length_prefixed((uint64_t *)v21, (uint64_t)v20)
    && CBB_add_bytes((uint64_t)v20, a8, a9)
    && CBB_finish((uint64_t)v21, &v19, &v18))
  {
    BOOL v16 = HKDF_expand(a1, a2, a3);
    OPENSSL_free(v19);
  }

  else
  {
    CBB_cleanup((uint64_t)v21);
    return 0LL;
  }

  return v16;
}

void *bssl::SSLAEADContext::CreatePlaceholderForQUIC@<X0>( bssl::SSLAEADContext *this@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  __int16 v8 = (__int16)this;
  uint64_t v7 = a2;
  char v6 = 0;
  uint64_t result = bssl::New<bssl::SSLAEADContext,unsigned short &,BOOL &,ssl_cipher_st const*&>(&v8, &v6, &v7);
  *a3 = result;
  return result;
}

uint64_t bssl::SSLAEADContext::Seal( uint64_t a1, char *a2, void *a3, unint64_t a4, char a5, __int16 a6, unint64_t a7, int a8, uint64_t a9, uint64_t a10, char *__src, uint64_t a12)
{
  if ((*(_BYTE *)(a1 + 609) & 1) != 0) {
    uint64_t v19 = *(unsigned __int8 *)(a1 + 605);
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a1)
  {
    if (!EVP_AEAD_CTX_tag_len((uint64_t *)(a1 + 8), &v25, a12, 0LL))
    {
      int v20 = 16;
      int v21 = 200;
      int v22 = 404;
LABEL_12:
      ERR_put_error(v20, 0, v21, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_aead_ctx.cc", v22);
      return 0LL;
    }
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  uint64_t v23 = v19 + a12;
  if (__CFADD__(v19, a12) || __CFADD__(v25, v23))
  {
    int v20 = 30;
    int v21 = 200;
    int v22 = 409;
    goto LABEL_12;
  }

  if (v25 + v23 > a4)
  {
    int v20 = 16;
    int v21 = 121;
    int v22 = 413;
    goto LABEL_12;
  }

  uint64_t result = bssl::SSLAEADContext::SealScatter( a1,  a2,  &a2[v19],  &a2[v19 + a12],  a5,  a6,  a7,  a8,  a9,  a10,  __src,  a12,  0LL,  0LL);
  if ((_DWORD)result)
  {
    *a3 = v25 + v23;
    return 1LL;
  }

  return result;
}

void bssl::Delete<bssl::SSLAEADContext>(void *a1)
{
  if (a1)
  {
    EVP_AEAD_CTX_cleanup((uint64_t)(a1 + 1));
    OPENSSL_free(a1);
  }

uint64_t ENGINE_get_RSA_method(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ENGINE_get_ECDSA_method(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t METHOD_unref(uint64_t result)
{
  if (result)
  {
    if (!*(_BYTE *)(result + 4)) {
      METHOD_unref_cold_1();
    }
  }

  return result;
}

int BN_GENCB_call(BN_GENCB *cb, int a, int b)
{
  if (cb) {
    return ((uint64_t (*)(void, void, BN_GENCB *))cb->arg)(*(void *)&a, *(void *)&b, cb);
  }
  else {
    return 1;
  }
}

int BN_generate_prime_ex(BIGNUM *ret, int bits, int safe, const BIGNUM *add, const BIGNUM *rem, BN_GENCB *cb)
{
  if (bits > 3746)
  {
    int v11 = 3;
LABEL_13:
    BOOL v12 = safe != 0;
    goto LABEL_14;
  }

  if (bits > 1344)
  {
    int v11 = 4;
    goto LABEL_13;
  }

  if (bits > 475)
  {
    int v11 = 5;
    goto LABEL_13;
  }

  if (bits > 399)
  {
    int v11 = 6;
    goto LABEL_13;
  }

  if (bits > 346)
  {
    int v11 = 7;
    goto LABEL_13;
  }

  if (bits >= 308)
  {
    int v11 = 8;
    goto LABEL_13;
  }

  if (bits <= 1)
  {
    int v34 = 393;
LABEL_95:
    ERR_put_error(3, 0, 103, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/prime.c", v34);
    return 0;
  }

  else {
    int v11 = 27;
  }
  BOOL v12 = safe != 0;
  if (bits == 2 && safe)
  {
    int v34 = 397;
    goto LABEL_95;
  }

LABEL_48:
      BN_CTX_end(v14);
      cb = v38;
      BOOL v12 = v36;
      int v11 = v37;
      uint64_t v15 = v39;
      if (v38)
      {
LABEL_49:
      }

LABEL_84:
    BN_CTX_end(v14);
  }

BOOL bn_odd_number_is_obviously_composite(unsigned int *a1)
{
  unsigned __int16 v3 = -21846;
  BOOL result = bn_trial_division(&v3, (uint64_t)a1);
  if (result) {
    return !BN_is_word(a1, v3);
  }
  return result;
}

BOOL bn_trial_division(unsigned __int16 *a1, uint64_t a2)
{
  else {
    unint64_t v4 = 1024LL;
  }
  unsigned __int16 v5 = 3;
  if (bn_mod_u16_consttime(a2, 3u))
  {
    uint64_t v7 = 2LL;
    while (v4 != v7)
    {
      unsigned __int16 v5 = kPrimes[v7++];
      if (!bn_mod_u16_consttime(a2, v5))
      {
        BOOL result = v7 - 1 < v4;
        goto LABEL_10;
      }
    }

    return 0LL;
  }

  else
  {
    BOOL result = 1LL;
LABEL_10:
    *a1 = v5;
  }

  return result;
}

uint64_t bn_miller_rabin_init(uint64_t a1, BIGNUM *a2, BN_CTX *ctx)
{
  *(void *)a1 = BN_CTX_get(ctx);
  *(void *)(a1 + _Block_object_dispose(va, 8) = BN_CTX_get(ctx);
  *(void *)(a1 + 16) = BN_CTX_get(ctx);
  char v6 = BN_CTX_get(ctx);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)a1;
  if (!*(void *)a1 || !*(void *)(a1 + 8)) {
    return 0LL;
  }
  __int16 v8 = v6;
  uint64_t result = 0LL;
  if (*(void *)(a1 + 16))
  {
    if (v8)
    {
      int v10 = BN_value_one();
      uint64_t result = bn_usub_consttime(v7, (uint64_t)&a2[1], (uint64_t)v10);
      if ((_DWORD)result)
      {
        unsigned int v11 = BN_count_low_zero_bits(*(void *)a1);
        *(_DWORD *)(a1 + 36) = v11;
        uint64_t result = bn_rshift_secret_shift(*(void *)(a1 + 8), *(const BIGNUM **)a1, v11, ctx);
        if ((_DWORD)result)
        {
          *(_DWORD *)(a1 + 32) = BN_num_bits(a2 + 1);
          uint64_t result = bn_one_to_montgomery(*(BIGNUM **)(a1 + 16), a2, ctx);
          if ((_DWORD)result) {
            return bn_usub_consttime(*(void *)(a1 + 24), (uint64_t)&a2[1], *(void *)(a1 + 16)) != 0;
          }
        }
      }
    }
  }

  return result;
}

uint64_t bn_miller_rabin_iteration(uint64_t a1, _DWORD *a2, const BIGNUM *a3, uint64_t a4, BN_CTX *ctx)
{
  int v10 = BN_CTX_get(ctx);
  if (v10
    && (unsigned int v11 = v10,
        BN_mod_exp_mont_consttime( v10,  a3,  *(const BIGNUM **)(a1 + 8),  (const BIGNUM *)(a4 + 24),  ctx,  (BN_MONT_CTX *)a4))
    && BN_to_montgomery(v11, v11, (BIGNUM *)a4, ctx))
  {
    BOOL v12 = BN_equal_consttime((uint64_t)v11, *(void *)(a1 + 16));
    uint64_t v13 = -(uint64_t)(BN_equal_consttime((uint64_t)v11, *(void *)(a1 + 24)) | v12);
    if (*(int *)(a1 + 32) >= 2)
    {
      int v14 = 1;
      do
      {
        if (v14 == *(_DWORD *)(a1 + 36)) {
          uint64_t v15 = ~v13;
        }
        else {
          uint64_t v15 = 0LL;
        }
        if (v15) {
          break;
        }
        if (!BN_mod_mul_montgomery(v11, v11, v11, (BN_MONT_CTX *)a4, ctx)) {
          goto LABEL_14;
        }
        v13 |= -(uint64_t)BN_equal_consttime((uint64_t)v11, *(void *)(a1 + 24));
        ++v14;
      }

      while (v14 < *(_DWORD *)(a1 + 32));
    }

    *a2 = v13 & 1;
    uint64_t v16 = 1LL;
  }

  else
  {
LABEL_14:
    uint64_t v16 = 0LL;
  }

  BN_CTX_end(ctx);
  return v16;
}

uint64_t BN_primality_test(_DWORD *a1, BIGNUM *a2, int a3, BN_CTX *a4, int a5, uint64_t a6)
{
  *a1 = 0;
  BOOL v12 = BN_value_one();
  if (BN_cmp(a2, v12) < 1) {
    return 1LL;
  }
  if (!BN_is_odd((uint64_t)a2))
  {
    int v14 = (unsigned int *)a2;
    uint64_t v15 = 2LL;
LABEL_6:
    *a1 = BN_is_word(v14, v15);
    return 1LL;
  }

  if (BN_is_word((unsigned int *)a2, 3LL))
  {
    uint64_t v13 = 1LL;
    *a1 = 1;
    return v13;
  }

  if (a5)
  {
    LOWORD(v33[0]) = -21846;
    if (bn_trial_division((unsigned __int16 *)v33, (uint64_t)a2))
    {
      uint64_t v15 = LOWORD(v33[0]);
      int v14 = (unsigned int *)a2;
      goto LABEL_6;
    }
  }

  if (!a3)
  {
    int v17 = BN_num_bits(a2);
    if (v17 <= 3746)
    {
      if (v17 <= 1344)
      {
        if (v17 <= 475)
        {
          if (v17 <= 399)
          {
            if (v17 <= 346)
            {
              if (v17 <= 307)
              {
                if (v17 <= 54) {
                  a3 = 34;
                }
                else {
                  a3 = 27;
                }
              }

              else
              {
                a3 = 8;
              }
            }

            else
            {
              a3 = 7;
            }
          }

          else
          {
            a3 = 6;
          }
        }

        else
        {
          a3 = 5;
        }
      }

      else
      {
        a3 = 4;
      }
    }

    else
    {
      a3 = 3;
    }
  }

  if (a4)
  {
    unint64_t v18 = 0LL;
    goto LABEL_33;
  }

  a4 = BN_CTX_new();
  unint64_t v18 = a4;
  if (!a4) {
    return 0LL;
  }
LABEL_33:
  BN_CTX_start(a4);
  uint64_t v19 = BN_CTX_get(a4);
  int v20 = (BIGNUM *)BN_MONT_CTX_new_consttime(a2, a4);
  uint64_t v21 = (BN_MONT_CTX *)v20;
  uint64_t v13 = 0LL;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[0] = v22;
  v33[1] = v22;
  if (v19 && v20)
  {
    if (bn_miller_rabin_init((uint64_t)v33, v20, a4))
    {
      int v30 = v18;
      unint64_t v23 = a3;
      unint64_t v24 = 0LL;
      unsigned int v25 = 1;
      uint64_t v26 = *(void *)&v33[0];
      do
      {
        int v32 = -1431655766;
        if (!bn_rand_secret_range((uint64_t)v19, &v32, 2uLL, v26)
          || (uint64_t v27 = v32, v31 = 0, !bn_miller_rabin_iteration((uint64_t)v33, &v31, v19, (uint64_t)v21, a4)))
        {
LABEL_50:
          uint64_t v13 = 0LL;
          goto LABEL_52;
        }

        if (!v31)
        {
          *a1 = 0;
          uint64_t v13 = 1LL;
          goto LABEL_52;
        }

        v24 += v27;
        BOOL v29 = v25++ < 0x10;
      }

      while (v29 | ((uint64_t)(((v24 - v23) ^ v24 | v24 ^ v23) ^ v24) >> 63));
      if (v24 < v23) {
        BN_primality_test_cold_1();
      }
      uint64_t v13 = 1LL;
      *a1 = 1;
LABEL_52:
      unint64_t v18 = v30;
    }

    else
    {
      uint64_t v13 = 0LL;
    }
  }

  BN_MONT_CTX_free(v21);
  BN_CTX_end(a4);
  BN_CTX_free(v18);
  return v13;
}

uint64_t CRYPTO_library_init()
{
  return CRYPTO_once(&once, (void (*)(void))do_library_init);
}

uint64_t EVP_DigestSignInit(uint64_t a1, void *a2, const EVP_MD *a3, ENGINE *a4, uint64_t a5)
{
  return do_sigver_init(a1, a2, a3, a4, a5, 0);
}

uint64_t EVP_DigestSignUpdate(uint64_t a1, const void *a2, size_t a3)
{
  if (*(void *)(**(void **)(a1 + 16) + 40LL)) {
    return EVP_DigestUpdate((EVP_MD_CTX *)a1, a2, a3);
  }
  ERR_put_error( 6,  0,  125,  "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/digestsign/digestsign.c",  135);
  return 0LL;
}

uint64_t EVP_DigestSignFinal(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!*(void *)(**(void **)(a1 + 16) + 40LL))
  {
    ERR_put_error( 6,  0,  125,  "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/digestsign/digestsign.c",  154);
    return 0LL;
  }

  if (a2)
  {
    *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx.digest = v3;
    *(_OWORD *)&ctx.flagunsigned int s = v3;
    __int128 v10 = v3;
    __int128 v11 = v3;
    *(_OWORD *)md = v3;
    __int128 v9 = v3;
    unsigned int s = -1431655766;
    EVP_MD_CTX_init(&ctx);
    BOOL v4 = EVP_MD_CTX_copy_ex(&ctx, (const EVP_MD_CTX *)a1)
      && EVP_DigestFinal_ex(&ctx, md, &s)
      && EVP_PKEY_sign(*(_DWORD **)(a1 + 16)) != 0;
    EVP_MD_CTX_cleanup(&ctx);
    return v4;
  }

  EVP_MD_size(*(const EVP_MD **)a1);
  return EVP_PKEY_sign(*(_DWORD **)(a1 + 16));
}

uint64_t EVP_DigestSign(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5)
{
  uint64_t v7 = *(void *)(a1 + 16);
  if (*(void *)(*(void *)v7 + 40LL))
  {
  }

  else
  {
    __int128 v9 = *(uint64_t (**)(void))(*(void *)v7 + 48LL);
    if (v9) {
      return v9();
    }
    ERR_put_error( 6,  0,  125,  "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/digestsign/digestsign.c",  228);
  }

  return 0LL;
}

void md_pctx_ops_init()
{
  md_pctx_ops_storage = (uint64_t)EVP_PKEY_CTX_free;
  *(void *)algn_18C4C5068 = EVP_PKEY_CTX_dup;
}

uint64_t CRYPTO_get_ex_new_index_ex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int16 v8 = OPENSSL_malloc(0x20uLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  __int128 v9 = v8;
  *__int16 v8 = a2;
  v8[1] = a3;
  _OWORD v8[2] = a4;
  _OWORD v8[3] = 0LL;
  CRYPTO_MUTEX_lock_write((pthread_rwlock_t *)a1);
  unint64_t v10 = atomic_load((unsigned int *)(a1 + 216));
  if ((*(unsigned __int8 *)(a1 + 220) ^ 0x7FFFFFFFuLL) < v10)
  {
    ERR_put_error(14, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/ex_data.c", 155);
    CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)a1);
    return 0xFFFFFFFFLL;
  }

  uint64_t v12 = *(void *)(a1 + 208);
  if (v12)
  {
    uint64_t v13 = (void *)(v12 + 24);
  }

  else
  {
    if ((_DWORD)v10) {
      CRYPTO_get_ex_new_index_ex_cold_1();
    }
    uint64_t v13 = (void *)(a1 + 200);
  }

  *uint64_t v13 = v9;
  *(void *)(a1 + 20_Block_object_dispose(va, 8) = v9;
  atomic_store(v10 + 1, (unsigned int *)(a1 + 216));
  CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)a1);
  return v10 + *(unsigned __int8 *)(a1 + 220);
}

void *OPENSSL_zalloc(unint64_t a1)
{
  int v2 = OPENSSL_malloc(a1);
  __int128 v3 = v2;
  if (a1 && v2) {
    bzero(v2, a1);
  }
  return v3;
}

void *OPENSSL_calloc(unint64_t a1, unint64_t a2)
{
  if (!a2 || is_mul_ok(a2, a1)) {
    return OPENSSL_zalloc(a2 * a1);
  }
  ERR_put_error(14, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/mem.c", 302);
  return 0LL;
}

unint64_t OPENSSL_strnlen(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0LL;
  if (a2)
  {
    while (*(_BYTE *)(a1 + v2))
    {
      if (a2 == ++v2)
      {
        unint64_t v2 = a2;
        break;
      }
    }
  }

  if (v2 >= a2) {
    return a2;
  }
  else {
    return v2;
  }
}

BOOL OPENSSL_isxdigit(int a1)
{
  return (a1 - 48) < 0xA || (a1 & 0xFFFFFFDF) - 65 < 6;
}

uint64_t OPENSSL_vasprintf_internal(char **a1, const char *a2, va_list a3, int a4)
{
  char v6 = (void *(*)(unint64_t))MEMORY[0x1895FBC88];
  if (a4)
  {
    uint64_t v7 = (void (*)(char *))MEMORY[0x1895FB398];
  }

  else
  {
    char v6 = OPENSSL_malloc;
    uint64_t v7 = (void (*)(char *))OPENSSL_free;
  }

  if (a4) {
    __int16 v8 = (void *(*)(char *, unint64_t))MEMORY[0x1895FCC68];
  }
  else {
    __int16 v8 = (void *(*)(char *, unint64_t))OPENSSL_realloc;
  }
  __int128 v9 = (char *)v6(64uLL);
  unint64_t v10 = v9;
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t result = vsnprintf(v9, 0x40uLL, a2, a3);
  if ((result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  if (result < 0x40)
  {
    size_t v12 = 64LL;
  }

  else
  {
    size_t v12 = result + 1LL;
    uint64_t v13 = (char *)v8(v10, v12);
    if (!v13) {
      goto LABEL_16;
    }
    int v14 = v13;
    uint64_t result = vsnprintf(v13, v12, a2, a3);
    unint64_t v10 = v14;
    if ((result & 0x80000000) != 0) {
      goto LABEL_16;
    }
  }

  if (v12 > result)
  {
    *a1 = v10;
    return result;
  }

void *OPENSSL_strndup(_BYTE *a1, size_t a2)
{
  size_t v3 = 0LL;
  if (a2)
  {
    while (a1[v3])
    {
      if (a2 == ++v3)
      {
        size_t v3 = a2;
        break;
      }
    }
  }

  if (v3 >= a2) {
    size_t v4 = a2;
  }
  else {
    size_t v4 = v3;
  }
  if (v4 == -1LL)
  {
    ERR_put_error(14, 0, 65, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/mem.c", 592);
    return 0LL;
  }

  else
  {
    unsigned __int16 v5 = OPENSSL_malloc(v4 + 1);
    char v6 = v5;
    if (v5)
    {
      if (v4) {
        memcpy(v5, a1, v4);
      }
      *((_BYTE *)v6 + v4) = 0;
    }
  }

  return v6;
}

size_t OPENSSL_strlcpy(_BYTE *a1, char *__s, unint64_t a3)
{
  if (a3 < 2)
  {
    unint64_t v4 = 0LL;
    if (!a3) {
      return strlen(__s) + v4;
    }
  }

  else
  {
    unint64_t v3 = 0LL;
    unint64_t v4 = a3 - 1;
    while (__s[v3])
    {
      a1[v3] = __s[v3];
      if (v4 == ++v3)
      {
        __s += v3;
        a1 += v3;
        goto LABEL_9;
      }
    }

    __s += v3;
    a1 += v3;
    unint64_t v4 = v3;
  }

size_t OPENSSL_strlcat(_BYTE *a1, char *a2, unint64_t a3)
{
  unint64_t v3 = a3;
  if (a3)
  {
    for (unint64_t i = 0LL; a1[i]; ++i)
    {
      if (!--a3)
      {
        a1 += v3;
        return OPENSSL_strlcpy(a1, a2, a3) + v3;
      }
    }

    a1 += i;
    unint64_t v3 = i;
  }

  return OPENSSL_strlcpy(a1, a2, a3) + v3;
}

uint64_t nw_protocol_boringssl_options_compare()
{
  return sec_protocol_options_contents_compare();
}

uint64_t nw_protocol_boringssl_options_are_equal()
{
  return sec_protocol_options_contents_compare();
}

void nw_protocol_boringssl_prepend_frame_array()
{
  v0[0] = 0LL;
  v0[1] = v0;
  v0[2] = 0x3010000000LL;
  v0[4] = 0LL;
  v0[5] = 0LL;
  v0[3] = "";
  nw_frame_array_init();
  nw_frame_array_foreach();
  nw_frame_array_prepend_array();
  _Block_object_dispose(v0, 8);
}

void sub_1875E5230( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __nw_protocol_boringssl_prepend_frame_array_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  nw_frame_array_remove();
  nw_frame_array_append();

  return 1LL;
}

uint64_t thread_local_init()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&g_thread_local_key, (void (__cdecl *)(void *))thread_local_destructor);
  g_thread_local_key_created = result == 0;
  return result;
}

void BN_init(BIGNUM *a1)
{
  a1->d = 0LL;
  *(void *)&a1->top = 0LL;
  *(void *)&a1->int neg = 0LL;
}

BIGNUM *__cdecl BN_dup(const BIGNUM *a)
{
  if (!a) {
    return 0LL;
  }
  id v2 = BN_new();
  unint64_t v3 = v2;
  if (v2 && !BN_copy(v2, a))
  {
    BN_free(v3);
    return 0LL;
  }

  return v3;
}

BIGNUM *__cdecl BN_copy(BIGNUM *a, const BIGNUM *b)
{
  if (b == a) {
    return (BIGNUM *)b;
  }
  unint64_t v3 = a;
  uint64_t top = b->top;
  if ((_DWORD)top)
  {
    memcpy(v3->d, b->d, 8 * top);
    LODWORD(top) = b->top;
  }

  v3->uint64_t top = top;
  v3->int neg = b->neg;
  return v3;
}

const BIGNUM *BN_value_one(void)
{
  return (const BIGNUM *)&BN_value_one_storage;
}

double BN_value_one_init()
{
  BN_value_one_storage = (uint64_t)&BN_value_one_do_init_kOneLimbs;
  *(void *)&double result = 0x100000001LL;
  unk_18C4C4E40 = xmmword_187613930;
  return result;
}

uint64_t bn_minimal_width(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t result = v2 & ((int)v2 >> 31);
  for (uint64_t i = 8 * v2 - 8; ; i -= 8LL)
  {
    BOOL v5 = __OFSUB__((_DWORD)v2, 1);
    LODWORD(v2) = v2 - 1;
    if (*(void *)(*(void *)a1 + i)) {
      return (v2 + 1);
    }
  }

  return result;
}

uint64_t BN_zero(uint64_t result)
{
  *(_DWORD *)(result + 16) = 0;
  *(_DWORD *)(result + _Block_object_dispose(va, 8) = 0;
  return result;
}

uint64_t BN_one(uint64_t a1)
{
  uint64_t v2 = 1LL;
  *(_DWORD *)(a1 + 16) = 0;
  **(void **)a1 = 1LL;
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = 1;
  return v2;
}

int BN_set_word(BIGNUM *a, unint64_t w)
{
  if (w)
  {
    int result = bn_wexpand(&a->d, 1uLL);
    if (!result) {
      return result;
    }
    a->int neg = 0;
    *a->d = w;
    int v5 = 1;
  }

  else
  {
    int v5 = 0;
    a->int neg = 0;
  }

  a->uint64_t top = v5;
  return 1;
}

void bn_set_static_words(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((*(_BYTE *)(a1 + 20) & 2) == 0) {
    OPENSSL_free(*(void **)a1);
  }
  *(void *)a1 = a2;
  if (a3 >= 0x800000) {
    bn_set_static_words_cold_1();
  }
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = a3;
  *(_DWORD *)(a1 + 12) = a3;
  int v6 = *(_DWORD *)(a1 + 20) | 2;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = v6;
}

BOOL bn_fits_in_words(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(int *)(a1 + 8);
  BOOL v3 = v2 > a2;
  unint64_t v4 = v2 - a2;
  if (!v3) {
    return 1LL;
  }
  uint64_t v5 = 0LL;
  int v6 = (uint64_t *)(*(void *)a1 + 8 * a2);
  do
  {
    uint64_t v7 = *v6++;
    v5 |= v7;
    --v4;
  }

  while (v4);
  return v5 == 0;
}

uint64_t bn_copy_words(void *__dst, unint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16))
  {
    int v3 = 109;
    int v4 = 317;
LABEL_3:
    ERR_put_error(3, 0, v3, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/bn.c", v4);
    return 0LL;
  }

  unint64_t v8 = *(int *)(a3 + 8);
  unint64_t v9 = v8 - a2;
  if (v8 > a2)
  {
    uint64_t v10 = 0LL;
    __int128 v11 = (uint64_t *)(*(void *)a3 + 8 * a2);
    do
    {
      uint64_t v12 = *v11++;
      v10 |= v12;
      --v9;
    }

    while (v9);
    unint64_t v8 = a2;
    if (v10)
    {
      int v3 = 102;
      int v4 = 324;
      goto LABEL_3;
    }
  }

  size_t v13 = 8 * a2;
  if (v13) {
    bzero(__dst, v13);
  }
  if (8 * v8) {
    memcpy(__dst, *(const void **)a3, 8 * v8);
  }
  return 1LL;
}

void BN_set_negative(BIGNUM *b, int n)
{
  BOOL v3 = n && !BN_is_zero((uint64_t)b);
  b->int neg = v3;
}

uint64_t bn_resize_words(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(int *)(a1 + 8);
  BOOL v5 = v4 > a2;
  unint64_t v6 = v4 - a2;
  if (v5)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = (uint64_t *)(*(void *)a1 + 8 * a2);
    do
    {
      uint64_t v9 = *v8++;
      v7 |= v9;
      --v6;
    }

    while (v6);
    if (v7)
    {
      ERR_put_error(3, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/bn.c", 399);
      return 0LL;
    }

    goto LABEL_10;
  }

  uint64_t result = bn_wexpand((void **)a1, a2);
  if ((_DWORD)result)
  {
    uint64_t v11 = *(int *)(a1 + 8);
    size_t v12 = 8 * (a2 - v11);
    if (v12) {
      bzero((void *)(*(void *)a1 + 8 * v11), v12);
    }
LABEL_10:
    *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = a2;
    return 1LL;
  }

  return result;
}

uint64_t *bn_select_words(uint64_t *result, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  {
    uint64_t v6 = *a3++;
    uint64_t v5 = v6;
    uint64_t v7 = *a4++;
    *result++ = a2 & v5 | v7 & ~a2;
  }

  return result;
}

uint64_t bn_set_minimal_width(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  uint64_t v2 = 8 * v1 - 8;
  int v3 = *(_DWORD *)(result + 8);
  while (1)
  {
    BOOL v4 = __OFSUB__(v3--, 1);
    if (v3 < 0 != v4) {
      break;
    }
    uint64_t v5 = *(void *)(*(void *)result + v2);
    v2 -= 8LL;
    if (v5)
    {
      *(_DWORD *)(result + _Block_object_dispose(va, 8) = v3 + 1;
      return result;
    }
  }

  *(_DWORD *)(result + _Block_object_dispose(va, 8) = v1 & ((int)v1 >> 31);
  if ((v1 & 0x80000000) == 0) {
    *(_DWORD *)(result + 16) = 0;
  }
  return result;
}

uint64_t bssl::SSL_HANDSHAKE::GetClientHello(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[76];
  if (v6)
  {
    *(_WORD *)a2 = 256;
    *(void *)(a2 + 24) = a1[75];
    *(void *)(a2 + 32) = v6;
    unint64_t v7 = a1[76];
    if (v7 <= 3) {
      abort();
    }
    uint64_t v8 = a1[75] + 4;
    uint64_t v9 = v7 - 4;
    *(void *)(a2 + _Block_object_dispose(va, 8) = v8;
    *(void *)(a2 + 16) = v7 - 4;
  }

  else
  {
    if (!(*(unsigned int (**)(void))(*(void *)*a1 + 24LL))())
    {
      ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 190);
      return 0LL;
    }

    uint64_t v8 = *(void *)(a2 + 8);
    uint64_t v9 = *(void *)(a2 + 16);
  }

  if ((bssl::ssl_client_hello_init(*a1, a3, v8, v9) & 1) != 0) {
    return 1LL;
  }
  ERR_put_error(16, 0, 131, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 195);
  bssl::ssl_send_alert((bssl *)*a1, (ssl_st *)2, 50);
  return 0LL;
}

uint64_t bssl::ssl_reverify_peer_cert(bssl **this, bssl::SSL_HANDSHAKE *a2)
{
  uint64_t v2 = *this;
  if (*(void *)(*((void *)*this + 6) + 472LL)) {
    bssl::ssl_reverify_peer_cert();
  }
  int v3 = this[1];
  if (!*((_BYTE *)v3 + 300)) {
    bssl::ssl_reverify_peer_cert();
  }
  int v4 = (int)a2;
  LOBYTE(v7) = 46;
  uint64_t v5 = (uint64_t (*)(bssl *, int *))*((void *)v3 + 6);
  if (!v5 || (uint64_t result = v5(v2, &v7), (_DWORD)result == 1))
  {
    ERR_put_error(16, 0, 125, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 442);
    if (v4) {
      bssl::ssl_send_alert(v2, (ssl_st *)2, v7);
    }
    return 1LL;
  }

  return result;
}

uint64_t bssl::ssl_get_finished(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)this;
  size_t v14 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v12 = v4;
  __int128 v13 = v4;
  uint64_t result = bssl::ssl_check_message_type((bssl *)v3, (uint64_t)&v12, 20);
  if ((_DWORD)result)
  {
    *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __src[2] = v6;
    _OWORD __src[3] = v6;
    __src[0] = v6;
    __src[1] = v6;
    __unsigned int n = 0xAAAAAAAAAAAAAAAALL;
    int v7 = (const ssl_session_st *)*((void *)this + 190);
    if (!v7) {
      int v7 = *(const ssl_session_st **)(*(void *)this + 104LL);
    }
    uint64_t result = bssl::SSLTranscript::GetFinishedMAC( (bssl *)((char *)this + 424),  (unsigned __int8 *)__src,  &__n,  v7,  (*(_BYTE *)(v3 + 180) & 1) == 0);
    if ((_DWORD)result)
    {
      if ((_BYTE)v12
        || (uint64_t result = bssl::SSLTranscript::Update((void **)this + 53, *((const void **)&v13 + 1), v14), (_DWORD)result))
      {
        if (!CBS_mem_equal((uint64_t)&v12 + 8, (char *)__src, __n))
        {
          bssl::ssl_send_alert((bssl *)v3, (ssl_st *)2, 51);
          int v9 = 142;
          int v10 = 499;
          goto LABEL_23;
        }

        char v8 = __n;
        if (__n >= 0xD)
        {
          int v9 = 68;
          int v10 = 506;
LABEL_23:
          ERR_put_error(16, 0, v9, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", v10);
          return 0LL;
        }

        if ((*(_BYTE *)(v3 + 180) & 1) != 0)
        {
          if (__n) {
            memcpy((void *)(*(void *)(v3 + 48) + 443LL), __src, __n);
          }
          *(_BYTE *)(*(void *)(v3 + 48) + 455LL) = v8;
        }

        else
        {
          if (__n) {
            memcpy((void *)(*(void *)(v3 + 48) + 457LL), __src, __n);
          }
          *(_BYTE *)(*(void *)(v3 + 48) + 456LL) = v8;
        }

        if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 40LL))(v3))
        {
          bssl::ssl_send_alert((bssl *)v3, (ssl_st *)2, 10);
          int v9 = 255;
          int v10 = 521;
          goto LABEL_23;
        }

        (*(void (**)(uint64_t))(*(void *)v3 + 32LL))(v3);
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t bssl::ssl_send_finished(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)this;
  uint64_t v3 = (const ssl_session_st *)*((void *)this + 190);
  if (!v3) {
    uint64_t v3 = *(const ssl_session_st **)(v2 + 104);
  }
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src[2] = v4;
  _OWORD __src[3] = v4;
  __src[0] = v4;
  __src[1] = v4;
  __unsigned int n = 0xAAAAAAAAAAAAAAAALL;
  if (!bssl::SSLTranscript::GetFinishedMAC( (bssl *)((char *)this + 424),  (unsigned __int8 *)__src,  &__n,  v3,  *(_BYTE *)(v2 + 180) & 1)
    || !bssl::ssl_log_secret(v2, "CLIENT_RANDOM", &v3->key_arg[3], v3->key_arg[2]))
  {
    return 0LL;
  }

  char v5 = __n;
  if (__n >= 0xD)
  {
    ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 549);
    return 0LL;
  }

  if ((*(_BYTE *)(v2 + 180) & 1) != 0)
  {
    if (__n) {
      memcpy((void *)(*(void *)(v2 + 48) + 457LL), __src, __n);
    }
    *(_BYTE *)(*(void *)(v2 + 48) + 456LL) = v5;
  }

  else
  {
    if (__n) {
      memcpy((void *)(*(void *)(v2 + 48) + 443LL), __src, __n);
    }
    *(_BYTE *)(*(void *)(v2 + 48) + 455LL) = v5;
  }

  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = v8;
  int64x2_t v11[2] = v8;
  v11[0] = v8;
  CBB_zero(v11);
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[1] = v9;
  _OWORD v10[2] = v9;
  v10[0] = v9;
  if ((*(unsigned int (**)(uint64_t, _OWORD *, _OWORD *, uint64_t))(*(void *)v2 + 88LL))(v2, v11, v10, 20LL)
    && CBB_add_bytes((uint64_t)v10, __src, __n)
    && (bssl::ssl_add_message_cbb(v2, (uint64_t)v11) & 1) != 0)
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 566);
    uint64_t v6 = 0LL;
  }

  CBB_cleanup((uint64_t)v11);
  return v6;
}

void sub_1875E5CEC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t bssl::ssl_send_tls12_certificate(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[1] = v3;
  v16[2] = v3;
  v16[0] = v3;
  CBB_zero(v16);
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[1] = v4;
  int64x2_t v15[2] = v4;
  v14[2] = v4;
  v15[0] = v4;
  v14[0] = v4;
  v14[1] = v4;
  v13[1] = v4;
  void v13[2] = v4;
  v13[0] = v4;
  if ((*(unsigned int (**)(void, _OWORD *, _OWORD *, uint64_t))(**(void **)this + 88LL))( *(void *)this,  v16,  v15,  11LL)
    && CBB_add_u24_length_prefixed((uint64_t *)v15, (uint64_t)v14))
  {
    uint64_t v5 = *((void *)this + 188);
    if (v5)
    {
      if (*(_DWORD *)(v5 + 4)) {
        __assert_rtn( "ssl_send_tls12_certificate",  "handshake.cc",  583,  "hs->credential->type == SSLCredentialType::kX509");
      }
      unint64_t v6 = 0LL;
      int v7 = *(unint64_t **)(v5 + 48);
      while (v6 < (unint64_t)EVP_MD_CTX_md((const EVP_MD_CTX *)v7))
      {
        __int128 v8 = OPENSSL_sk_value(v7, v6);
        if (CBB_add_u24_length_prefixed((uint64_t *)v14, (uint64_t)v13))
        {
          __int128 v9 = (const void *)CRYPTO_BUFFER_data((uint64_t)v8);
          size_t v10 = CRYPTO_BUFFER_len((uint64_t)v8);
          ++v6;
        }

        goto LABEL_9;
      }
    }

    uint64_t v11 = bssl::ssl_add_message_cbb(*(void *)this, (uint64_t)v16);
  }

  else
  {
LABEL_9:
    uint64_t v11 = 0LL;
  }

  CBB_cleanup((uint64_t)v16);
  return v11;
}

void sub_1875E5E6C(_Unwind_Exception *a1)
{
}

void std::unique_ptr<bssl::SSL_HANDSHAKE_HINTS,bssl::internal::Deleter>::reset[abi:ne180100]( uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    bssl::Delete<bssl::SSL_HANDSHAKE_HINTS>(v3);
  }
}

void bssl::Delete<bssl::SSL_HANDSHAKE_HINTS>(uint64_t a1)
{
  if (a1)
  {
    bssl::Array<unsigned short>::~Array(a1 + 224);
    bssl::Array<unsigned short>::~Array(a1 + 208);
    bssl::Array<unsigned short>::~Array(a1 + 192);
    bssl::Array<unsigned short>::~Array(a1 + 168);
    bssl::Array<unsigned short>::~Array(a1 + 152);
    bssl::Array<unsigned short>::~Array(a1 + 128);
    bssl::Array<unsigned short>::~Array(a1 + 112);
    bssl::Array<unsigned short>::~Array(a1 + 96);
    bssl::Array<unsigned short>::~Array(a1 + 80);
    bssl::Array<unsigned short>::~Array(a1 + 56);
    bssl::Array<unsigned short>::~Array(a1 + 40);
    bssl::Array<unsigned short>::~Array(a1 + 16);
    uint64_t v2 = (void *)bssl::Array<unsigned short>::~Array(a1);
    OPENSSL_free(v2);
  }

RSA *pkey_rsa_keygen(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 8)
    || (uint64_t result = (RSA *)BN_new(), (*(void *)(v3 + 8) = result) != 0LL)
    && (uint64_t result = (RSA *)BN_set_word((BIGNUM *)result, 0x10001uLL), (_DWORD)result))
  {
    uint64_t result = RSA_new();
    if (result)
    {
      uint64_t v5 = result;
      if (RSA_generate_key_ex(result, *(_DWORD *)v3, *(BIGNUM **)(v3 + 8), 0LL))
      {
        EVP_PKEY_assign_RSA(a2, (uint64_t)v5);
        return (RSA *)1;
      }

      else
      {
        RSA_free(v5);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t pkey_rsa_sign( uint64_t a1, unsigned __int8 *a2, void *a3, const unsigned __int8 *a4, unsigned int a5)
{
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(RSA **)(v10 + 8);
  int v12 = EVP_PKEY_size((EVP_PKEY *)v10);
  uint64_t v13 = v12;
  if (!a2) {
    goto LABEL_10;
  }
  if (*a3 < (unint64_t)v12)
  {
    ERR_put_error(6, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_rsa.c", 181);
    return 0LL;
  }

  uint64_t v15 = *(const EVP_MD **)(v9 + 24);
  if (!v15) {
    return RSA_sign_raw();
  }
  sigleunsigned int n = -1431655766;
  int v16 = *(_DWORD *)(v9 + 16);
  if (v16 == 6) {
    return RSA_sign_pss_mgf1();
  }
  if (v16 != 1) {
    return 0LL;
  }
  int v17 = EVP_MD_type(v15);
  uint64_t result = RSA_sign(v17, a4, a5, a2, &siglen, v11);
  if ((_DWORD)result)
  {
    uint64_t v13 = siglen;
LABEL_10:
    *a3 = v13;
    return 1LL;
  }

  return result;
}

uint64_t pkey_rsa_verify_recover(uint64_t a1, unsigned __int8 *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(v11 + 8);
  int v13 = EVP_PKEY_size((EVP_PKEY *)v11);
  uint64_t v14 = v13;
  if (!a2)
  {
    *a3 = v13;
    return 1LL;
  }

  if (*a3 < (unint64_t)v13)
  {
    ERR_put_error(6, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_rsa.c", 253);
    return 0LL;
  }

  int v16 = *(const EVP_MD **)(v10 + 24);
  int v17 = *(_DWORD *)(v10 + 16);
  if (!v16) {
    return RSA_verify_raw(v12, a3, a2, *a3, a4, a5, v17);
  }
  if (v17 != 1) {
    return 0LL;
  }
  size_t v18 = EVP_MD_size(v16);
  memset(v22, 170, sizeof(v22));
  uint64_t result = setup_tbuf(v10, a1);
  if ((_DWORD)result)
  {
    int v19 = EVP_MD_type(*(const EVP_MD **)(v10 + 24));
    uint64_t result = RSA_add_pkcs1_prefix(&v22[3], (size_t *)&v22[1], v22, v19, &pkey_rsa_verify_recover_kDummyHash, v18);
    if ((_DWORD)result)
    {
      unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
      BOOL v20 = !RSA_verify_raw(v12, &v21, *(unsigned __int8 **)(v10 + 48), v14, a4, a5, 1)
         || v21 != *(void *)&v22[1]
         || CRYPTO_memcmp(*(char **)(v10 + 48), *(char **)&v22[3], v21 - v18);
      if (v22[0]) {
        OPENSSL_free(*(void **)&v22[3]);
      }
      if (v20) {
        return 0LL;
      }
      if (v18) {
        memcpy(a2, (const void *)(*(void *)(v10 + 48) + v21 - v18), v18);
      }
      *a3 = v18;
      return 1LL;
    }
  }

  return result;
}

uint64_t pkey_rsa_encrypt(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(v11 + 8);
  int v13 = EVP_PKEY_size((EVP_PKEY *)v11);
  uint64_t v14 = v13;
  if (a2)
  {
    if (*a3 >= (unint64_t)v13)
    {
      int v16 = *(_DWORD *)(v10 + 16);
      if (v16 == 4)
      {
        uint64_t result = setup_tbuf(v10, a1);
        if ((_DWORD)result)
        {
          uint64_t result = RSA_padding_add_PKCS1_OAEP_mgf1();
          if ((_DWORD)result) {
            return RSA_encrypt(v12, a3, a2, *a3, *(void *)(v10 + 48), v14, 3);
          }
        }
      }

      else
      {
        return RSA_encrypt(v12, a3, a2, *a3, a4, a5, v16);
      }
    }

    else
    {
      ERR_put_error(6, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_rsa.c", 317);
      return 0LL;
    }
  }

  else
  {
    *a3 = v13;
    return 1LL;
  }

  return result;
}

uint64_t pkey_rsa_decrypt(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = EVP_PKEY_size(*(EVP_PKEY **)(a1 + 16));
  if (a2)
  {
    if (*a3 >= (unint64_t)v7)
    {
      if (*(_DWORD *)(v6 + 16) == 4)
      {
        uint64_t result = setup_tbuf(v6, a1);
        if ((_DWORD)result)
        {
          uint64_t result = RSA_decrypt();
          if ((_DWORD)result) {
            return RSA_padding_check_PKCS1_OAEP_mgf1() != 0;
          }
        }
      }

      else
      {
        return RSA_decrypt();
      }
    }

    else
    {
      ERR_put_error(6, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_rsa.c", 349);
      return 0LL;
    }
  }

  else
  {
    *a3 = v7;
    return 1LL;
  }

  return result;
}

uint64_t EVP_PKEY_CTX_set_rsa_mgf1_md(uint64_t *a1)
{
  return EVP_PKEY_CTX_ctrl(a1, 6, 248);
}

BOOL setup_tbuf(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48)) {
    return 1LL;
  }
  int v4 = EVP_PKEY_size(*(EVP_PKEY **)(a2 + 16));
  uint64_t v5 = OPENSSL_malloc(v4);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v5;
  return v5 != 0LL;
}

void boringssl_bio_create_cold_1()
{
}

void boringssl_bio_create_cold_2()
{
}

void boringssl_bio_destroy_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0();
  int v2 = 196;
  _os_log_debug_impl(&dword_187560000, v0, OS_LOG_TYPE_DEBUG, "%{public}s(%d) ", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

void boringssl_ciphers_fillout_configuration_string_cold_1()
{
}

void boringssl_ciphers_create_configuration_string_cold_1()
{
}

void boringssl_ciphers_create_configuration_string_cold_2()
{
}

void boringssl_ciphers_create_configuration_string_cold_3()
{
}

void boringssl_ciphers_copy_default_ciphersuites_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( &dword_187560000,  log,  OS_LOG_TYPE_DEBUG,  "Restricted mode: Returning restricted default ciphersuite set.",  v1,  2u);
}

void boringssl_ciphers_copy_supported_list_for_groups_cold_1()
{
}

void boringssl_ciphers_copy_supported_list_for_groups_cold_2()
{
}

#error "1875E6AB8: call analysis failed (funcsize=45)"
#error "1875E6B84: call analysis failed (funcsize=45)"
#error "1875E6C50: call analysis failed (funcsize=45)"
#error "1875E6D1C: call analysis failed (funcsize=45)"
#error "1875E6DF8: call analysis failed (funcsize=49)"
void boringssl_session_handshake_negotiate_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  int a9,  int a10,  int a11,  int a12,  __int128 a13,  int a14,  __int16 a15,  __int16 a16,  int a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24,  uint64_t a25,  uint64_t a26,  uint64_t a27,  uint64_t a28,  uint64_t a29)
{
  char *v29;
  uint64_t v30;
  uint64_t v31;
  os_log_s *v32;
  os_log_s *v33;
  int v34;
  int v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  __int16 v41;
  OUTLINED_FUNCTION_17();
  a28 = v30;
  a29 = v31;
  unsigned int v33 = v32;
  unint64_t v35 = v34;
  a19 = *MEMORY[0x1895F89C0];
  int v37 = OUTLINED_FUNCTION_8(v36, 16LL);
  if (v37)
  {
    BOOL v29 = (char *)OUTLINED_FUNCTION_12();
    uint64_t v38 = v29 + 391;
  }

  else
  {
    uint64_t v38 = &unk_1875F4C23;
  }

  unsigned int v39 = OUTLINED_FUNCTION_12();
  a9 = 136447234;
  OUTLINED_FUNCTION_1_0();
  *(int *)((char *)&a12 + 2) = 410;
  WORD1(a13) = 2082;
  *(void *)((char *)&a13 + 4) = v38;
  WORD6(a13) = 2048;
  *(void *)((char *)&a13 + 14) = v40;
  a16 = v41;
  a17 = v35;
  _os_log_debug_impl( &dword_187560000,  v33,  OS_LOG_TYPE_DEBUG,  "%{public}s(%d) %{public}s[%p] state: %d, ignore handshake negotiate",  (uint8_t *)&a9,  0x2Cu);

  if (v37) {
  OUTLINED_FUNCTION_10();
  }
}

#error "1875E6FD0: call analysis failed (funcsize=45)"
#error "1875E70B4: call analysis failed (funcsize=51)"
#error "1875E7190: call analysis failed (funcsize=49)"
#error "1875E7274: call analysis failed (funcsize=51)"
void boringssl_session_read_cold_2()
{
  id v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OUTLINED_FUNCTION_9();
  uint64_t v2 = OUTLINED_FUNCTION_8(v1, 16LL);
  if (v2) {
    os_log_t v0 = OUTLINED_FUNCTION_20();
  }
  uint64_t v3 = OUTLINED_FUNCTION_20();
  boringssl_helper_get_ssl_error_code_description(2u);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14(&dword_187560000, v4, v5, "%{public}s(%d) %{public}s[%p] %{public}s", v6, v7, v8, v9, 2u);

  if (v2) {
}
  }

#error "1875E7450: call analysis failed (funcsize=45)"
#error "1875E751C: call analysis failed (funcsize=45)"
#error "1875E75E8: call analysis failed (funcsize=45)"
#error "1875E76B4: call analysis failed (funcsize=45)"
#error "1875E7780: call analysis failed (funcsize=45)"
#error "1875E784C: call analysis failed (funcsize=45)"
#error "1875E7918: call analysis failed (funcsize=45)"
#error "1875E79E4: call analysis failed (funcsize=45)"
#error "1875E7AB0: call analysis failed (funcsize=45)"
#error "1875E7B7C: call analysis failed (funcsize=45)"
#error "1875E7C48: call analysis failed (funcsize=45)"
void __boringssl_session_apply_protocol_options_for_transport_block_invoke_2_cold_1()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_187560000, v0, v1, "%{public}s(%d) Clearning PSK data", v2, v3, v4, v5, v6);
}

void __boringssl_session_apply_protocol_options_for_transport_block_invoke_14_cold_1()
{
}

#error "1875E7E04: call analysis failed (funcsize=45)"
#error "1875E7ED0: call analysis failed (funcsize=45)"
#error "1875E7F9C: call analysis failed (funcsize=45)"
#error "1875E8068: call analysis failed (funcsize=45)"
#error "1875E8134: call analysis failed (funcsize=45)"
#error "1875E8200: call analysis failed (funcsize=45)"
void matrix_expand_cold_1()
{
  __assert_rtn("scalar_from_keccak_vartime", "kyber.c", 304, "keccak_ctx->rate_bytes == 168");
}

void matrix_expand_cold_2()
{
  __assert_rtn("scalar_from_keccak_vartime", "kyber.c", 303, "keccak_ctx->squeeze_offset == 0");
}

void reduce_once_cold_1()
{
}

void reduce_cold_1()
{
}

void scalar_compress_cold_1()
{
}

void nw_protocol_boringssl_write_bytes_cold_1()
{
}

void nw_protocol_boringssl_write_bytes_cold_2()
{
  int v2 = 136447490;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_19( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] output_frames is empty; requested min=%d, max=%d",
    v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_3()
{
  int v2 = 136447490;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_19( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] output_frames is empty; requested min=%d, max=%d",
    v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_4()
{
}

void nw_protocol_boringssl_write_bytes_cold_5()
{
  *(_DWORD *)uint64_t v2 = 136447234;
  *(void *)&v2[4] = "nw_protocol_boringssl_write_bytes";
  *(_WORD *)&v2[12] = 1024;
  *(_DWORD *)&v2[14] = 177;
  *(_WORD *)&v2[18] = 2082;
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_16_0( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] failed to use %u frames, marking as failed",  *(void *)v2,  *(void *)&v2[8],  *(_DWORD *)&v2[16]);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_6()
{
}

void nw_protocol_boringssl_write_bytes_cold_7()
{
}

void nw_protocol_boringssl_write_bytes_cold_8()
{
}

void nw_protocol_boringssl_write_bytes_cold_9()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes written: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_10()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes written: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_11()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_16_0( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] claiming frame with %u bytes failed",  v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_12()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] write request: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_13()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] write request: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_14()
{
}

void nw_protocol_boringssl_read_bytes_cold_1()
{
}

void nw_protocol_boringssl_read_bytes_cold_2()
{
}

void nw_protocol_boringssl_read_bytes_cold_3()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes read: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_read_bytes_cold_4()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes read: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_read_bytes_cold_5()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] read request: %u byte(s)", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_read_bytes_cold_6()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] read request: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_read_bytes_cold_7()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = "nw_protocol_boringssl_read_bytes";
  OUTLINED_FUNCTION_13_0();
  int v6 = 229;
  int v4 = v1;
  if ((v2 & 1) != 0) {
    uint64_t v0 = &unk_1875F4C23;
  }
  __int16 v7 = 2082;
  __int128 v8 = v0;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_0(&dword_187560000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_read_frames_cold_1()
{
}

void nw_protocol_boringssl_handshake_negotiate_cold_1()
{
}

void nw_protocol_boringssl_handshake_negotiate_cold_2()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = "nw_protocol_boringssl_handshake_negotiate";
  OUTLINED_FUNCTION_13_0();
  int v6 = 792;
  int v4 = v1;
  if ((v2 & 1) != 0) {
    uint64_t v0 = &unk_1875F4C23;
  }
  __int16 v7 = 2082;
  __int128 v8 = v0;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_0(&dword_187560000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_boringssl_read_cold_1()
{
}

void nw_protocol_boringssl_output_available_cold_1()
{
}

void nw_protocol_boringssl_output_available_cold_2()
{
}

void nw_protocol_boringssl_output_available_cold_3()
{
}

void nw_protocol_boringssl_output_available_cold_4()
{
}

void nw_protocol_boringssl_output_available_cold_5()
{
}

void nw_protocol_boringssl_input_available_cold_1()
{
}

void nw_protocol_boringssl_input_available_cold_2()
{
}

void nw_protocol_boringssl_input_available_cold_3()
{
}

void nw_protocol_boringssl_disconnect_cold_1()
{
}

void nw_protocol_boringssl_add_input_handler_cold_1()
{
}

void nw_protocol_boringssl_add_input_handler_cold_2()
{
}

void nw_protocol_boringssl_add_input_handler_cold_3()
{
}

void nw_protocol_boringssl_add_input_handler_cold_4()
{
}

void nw_protocol_boringssl_add_input_handler_cold_5()
{
}

void nw_protocol_boringssl_add_input_handler_cold_6()
{
}

void nw_protocol_boringssl_add_input_handler_cold_7()
{
}

void nw_protocol_boringssl_replace_input_handler_cold_1()
{
}

void nw_protocol_boringssl_remove_input_handler_cold_1()
{
}

void nw_protocol_boringssl_get_input_frames_cold_1()
{
}

void nw_protocol_boringssl_get_input_frames_cold_2()
{
}

void nw_protocol_boringssl_get_output_frames_cold_1()
{
}

void nw_protocol_boringssl_get_output_frames_cold_2()
{
}

void nw_protocol_boringssl_get_output_frames_cold_3()
{
}

void nw_protocol_boringssl_get_output_frames_cold_4()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] get output frames failed, state %d",  v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_get_output_frames_cold_5()
{
  OUTLINED_FUNCTION_4_0( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] Waiting for writable frames -- returning 0 frames",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_output_frames_cold_6()
{
}

void nw_protocol_boringssl_input_finished_cold_1()
{
}

void nw_protocol_boringssl_input_finished_cold_2()
{
}

void nw_protocol_boringssl_finalize_output_frames_cold_1()
{
}

void nw_protocol_boringssl_finalize_output_frames_cold_2()
{
}

void nw_protocol_boringssl_waiting_for_output_cold_1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v4 = 136447234;
  *(void *)&void v4[4] = "nw_protocol_boringssl_waiting_for_output";
  uint64_t v3 = "false";
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = 2022;
  *(void *)&v4[20] = a1 + 391;
  *(_WORD *)&v4[18] = 2082;
  *(_WORD *)&v4[28] = 2048;
  if ((a2 & 1) != 0) {
    uint64_t v3 = "true";
  }
  *(void *)&v4[30] = a1;
  *(_WORD *)&v4[38] = 2082;
  OUTLINED_FUNCTION_17_0( &dword_187560000,  a2,  a3,  "%{public}s(%d) %{public}s[%p] Waiting for output: %{public}s",  *(void *)v4,  *(void *)&v4[8],  *(void *)&v4[16],  *(void *)&v4[24],  *(void *)&v4[32],  v3);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_waiting_for_output_cold_2()
{
}

void nw_protocol_boringssl_connect_cold_1()
{
}

void nw_protocol_boringssl_connect_cold_2()
{
}

void nw_protocol_boringssl_connect_cold_3()
{
}

void nw_protocol_boringssl_connect_cold_4()
{
}

void nw_protocol_boringssl_connected_cold_1()
{
}

void nw_protocol_boringssl_connected_cold_2()
{
}

void nw_protocol_boringssl_connected_cold_3()
{
}

void nw_protocol_boringssl_reset_cold_1()
{
}

void nw_protocol_boringssl_reset_cold_2()
{
}

void nw_protocol_boringssl_reset_cold_3()
{
}

void nw_protocol_boringssl_reset_cold_4()
{
}

void nw_protocol_boringssl_copy_info_cold_1()
{
}

void nw_protocol_boringssl_error_cold_1()
{
}

void nw_protocol_boringssl_signal_connected_cold_1()
{
}

void nw_protocol_error_print_cold_1()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(_DWORD *)uint64_t v3 = 136446978;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v3[7] = 60;
  v3[9] = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2082;
  uint64_t v6 = v1;
  _os_log_error_impl( &dword_187560000,  v2,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) BoringSSL %p: %{public}s",  (uint8_t *)v3,  0x26u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_frame_input_finalizer_cold_1()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __int16 v5 = "nw_protocol_boringssl_frame_input_finalizer";
  OUTLINED_FUNCTION_13_0();
  int v6 = 580;
  int v4 = v1;
  if ((v2 & 1) != 0) {
    uint64_t v0 = &unk_1875F4C23;
  }
  __int16 v7 = 2082;
  __int128 v8 = v0;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_0(&dword_187560000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_frames_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136446978;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl( &dword_187560000,  v0,  OS_LOG_TYPE_FAULT,  "%{public}s(%d) %{public}s[%p] first frame cannot be larger than the frame array",  (uint8_t *)v1,  0x26u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_frames_cold_2()
{
}

void nw_protocol_boringssl_write_frames_cold_3()
{
}

void __nw_protocol_boringssl_write_frames_block_invoke_129_cold_1()
{
}

void __nw_protocol_boringssl_input_available_block_invoke_cold_1()
{
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_cold_1()
{
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_133_cold_1()
{
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_133_cold_2()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_16_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] system_malloc(%u) failed", v2);
  OUTLINED_FUNCTION_12_0();
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_133_cold_3()
{
}

void nw_protocol_boringssl_frame_output_finalizer_cold_1()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = "nw_protocol_boringssl_frame_output_finalizer";
  OUTLINED_FUNCTION_13_0();
  int v6 = 1099;
  int v4 = v1;
  if ((v2 & 1) != 0) {
    uint64_t v0 = &unk_1875F4C23;
  }
  __int16 v7 = 2082;
  __int128 v8 = v0;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_0(&dword_187560000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_1()
{
}

void nw_protocol_boringssl_begin_connection_cold_2()
{
}

void nw_protocol_boringssl_begin_connection_cold_3()
{
}

void nw_protocol_boringssl_begin_connection_cold_4()
{
}

void nw_protocol_boringssl_begin_connection_cold_5()
{
  *(_DWORD *)uint64_t v2 = 136447234;
  *(void *)&v2[4] = "nw_protocol_boringssl_begin_connection";
  *(_WORD *)&v2[12] = 1024;
  *(_DWORD *)&v2[14] = 559;
  *(_WORD *)&v2[18] = 2082;
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_17_0( &dword_187560000,  v0,  v1,  "%{public}s(%d) %{public}s[%p] unable to copy context from parameters %p",  *(void *)v2,  *(void *)&v2[8],  *(_DWORD *)&v2[16]);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_begin_connection_cold_6()
{
}

void nw_protocol_boringssl_begin_connection_cold_7()
{
  int v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17_0(&dword_187560000, v0, v1, "%{public}s(%d) %{public}s[%p] Failed to set ECHconfig: %@", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_begin_connection_cold_8()
{
}

void nw_protocol_boringssl_begin_connection_cold_9()
{
}

void nw_protocol_boringssl_begin_connection_cold_10()
{
}

void nw_protocol_boringssl_begin_connection_cold_11()
{
}

void boringssl_crypto_hash_nid_to_cc_digest_cold_1()
{
}

void digest_init_cold_1()
{
}

void digest_init_cold_2()
{
  __assert_rtn("digest_init", "boringssl_crypto_digests.m", 21, "ret == 0");
}

void digest_update_cold_1()
{
}

void digest_update_cold_2()
{
  __assert_rtn("digest_update", "boringssl_crypto_digests.m", 31, "ret == 0");
}

void digest_final_cold_1()
{
}

void digest_final_cold_2()
{
  __assert_rtn("digest_final", "boringssl_crypto_digests.m", 41, "ret == 0");
}

void CRYPTO_BUFFER_free_cold_1()
{
  __assert_rtn("CRYPTO_BUFFER_free", "pool.c", 232, "found == buf");
}

void ssl_credential_st::Dup()
{
  __assert_rtn("Dup", "ssl_credential.cc", 115, "type == SSLCredentialType::kX509");
}

void bssl::dtls1_open_handshake()
{
}

{
  __assert_rtn("dtls1_open_handshake", "d1_both.cc", 386, "frag->msg_len == msg_len");
}

{
  __assert_rtn("dtls1_get_incoming_message", "d1_both.cc", 271, "frag->seq == msg_hdr->seq");
}

void bssl::dtls1_hm_fragment_mark()
{
}

{
  __assert_rtn("dtls1_hm_fragment_mark", "d1_both.cc", 215, "msg_len > 0");
}

void bssl::dtls1_next_message()
{
}

{
  __assert_rtn("dtls1_next_message", "d1_both.cc", 423, "dtls1_is_current_message_complete(ssl)");
}

void bssl::dtls_has_unprocessed_handshake_data()
{
}

void bssl::add_outgoing()
{
}

void bssl::send_flight()
{
  __assert_rtn("dtls1_update_mtu", "d1_both.cc", 608, "ssl->d1->mtu >= dtls1_min_mtu()");
}

void hpke_nonce_cold_1()
{
  __assert_rtn("hpke_nonce", "hpke.c", 807, "nonce_len >= 8");
}

void bssl::hkdf_extract_to_secret()
{
  __assert_rtn("hkdf_extract_to_secret", "tls13_enc.cc", 58, "len == hs->secret().size()");
}

void bssl::tls13_init_early_key_schedule()
{
}

void bssl::tls13_export_keying_material()
{
}

void EVP_CipherInit_ex_cold_1()
{
  __assert_rtn( "EVP_CipherInit_ex",  "cipher.c",  189,  "ctx->cipher->block_size == 1 || ctx->cipher->block_size == 8 || ctx->cipher->block_size == 16");
}

void EVP_CipherInit_ex_cold_2()
{
  __assert_rtn("EVP_CipherInit_ex", "cipher.c", 202, "EVP_CIPHER_CTX_iv_length(ctx) <= sizeof(ctx->iv)");
}

void EVP_EncryptUpdate_cold_1()
{
  __assert_rtn("EVP_EncryptUpdate", "cipher.c", 307, "bl <= (int)sizeof(ctx->buf)");
}

void block_remainder_cold_1()
{
  __assert_rtn("block_remainder", "cipher.c", 251, "ctx->cipher->block_size != 0");
}

void block_remainder_cold_2()
{
  __assert_rtn("block_remainder", "cipher.c", 252, "(ctx->cipher->block_size & (ctx->cipher->block_size - 1)) == 0");
}

void EVP_EncryptFinal_ex_cold_1()
{
  __assert_rtn("EVP_EncryptFinal_ex", "cipher.c", 369, "b <= sizeof(ctx->buf)");
}

void EVP_DecryptUpdate_cold_1()
{
  __assert_rtn("EVP_DecryptUpdate", "cipher.c", 434, "b <= sizeof(ctx->final)");
}

void EVP_DecryptFinal_ex_cold_1()
{
  __assert_rtn("EVP_DecryptFinal_ex", "cipher.c", 498, "b <= sizeof(ctx->final)");
}

void sha512_final_impl_cold_1()
{
  __assert_rtn("sha512_final_impl", "sha512.c", 271, "md_len % 8 == 0");
}

void bssl::tls13_server_handshake()
{
}

{
  __assert_rtn("do_send_half_rtt_ticket", "tls13_server.cc", 1025, "hs->expected_client_finished().size() <= 0xff");
}

{
  __assert_rtn("do_send_half_rtt_ticket", "tls13_server.cc", 1024, "!SSL_is_dtls(hs->ssl)");
}

void bssl::add_new_session_tickets()
{
  __assert_rtn("add_new_session_tickets", "tls13_server.cc", 162, "ssl->session_ctx->num_tickets <= kMaxTickets");
}

void EC_KEY_set_group_cold_1()
{
  __assert_rtn("EC_KEY_set_group", "ec_key.c", 223, "key->pub_key == NULL");
}

void EC_KEY_set_group_cold_2()
{
  __assert_rtn("EC_KEY_set_group", "ec_key.c", 222, "key->priv_key == NULL");
}

void boringssl_private_key_sign_cold_1(__CFError **a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a1;
  if (v4) {
    LODWORD(v4) = CFErrorGetCode(v4);
  }
  int v5 = 136446722;
  int v6 = "boringssl_private_key_sign";
  __int16 v7 = 1024;
  int v8 = 84;
  __int16 v9 = 1024;
  int v10 = (int)v4;
  OUTLINED_FUNCTION_0_3(&dword_187560000, a2, a3, "%{public}s(%d) SecKeyCreateSignature failed: %d", (uint8_t *)&v5);
}

void boringssl_private_key_sign_cold_2(unsigned __int16 a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136446722;
  uint64_t v4 = "boringssl_private_key_sign";
  __int16 v5 = 1024;
  int v6 = 24;
  __int16 v7 = 1026;
  int v8 = a1;
  OUTLINED_FUNCTION_0_3( &dword_187560000,  a2,  a3,  "%{public}s(%d) Failed to get signature algorithm: %{public}d",  (uint8_t *)&v3);
}

void bssl::dtls1_open_app_data()
{
}

void bssl::dtls1_write_app_data()
{
}

void bssl::dtls1_write_record()
{
  __assert_rtn("dtls1_write_record", "d1_pkt.cc", 222, "in.size() <= SSL3_RT_MAX_PLAIN_LENGTH");
}

{
  __assert_rtn("dtls1_write_record", "d1_pkt.cc", 226, "buf->empty()");
}

void bssl::tls1_configure_aead()
{
  __assert_rtn("tls1_configure_aead", "t1_enc.cc", 223, "key_block_cache->size() == key_block_size");
}

void bssl::ssl_compare_public_and_private_key()
{
}

void bssl::ssl_check_leaf_certificate()
{
}

void CBB_finish_i2d_cold_1()
{
}

void CBB_finish_i2d_cold_2()
{
}

void bssl::ssl_protocol_version()
{
}

{
  __assert_rtn("ssl_protocol_version", "ssl_versions.cc", 259, "0");
}

void bssl::tls_on_handshake_complete()
{
  __assert_rtn("tls_on_handshake_complete", "tls_method.cc", 79, "!ssl->s3->hs_buf || ssl->s3->hs_buf->length == 0");
}

{
  __assert_rtn("tls_on_handshake_complete", "tls_method.cc", 72, "!ssl->s3->has_message");
}

void bssl::tls_seal_record()
{
  __assert_rtn( "tls_seal_scatter_record",  "tls_record.cc",  502,  "tls_seal_scatter_prefix_len(ssl, type, in_len) == split_record_len + SSL3_RT_HEADER_LENGTH - 1");
}

{
  __assert_rtn( "tls_seal_scatter_record",  "tls_record.cc",  492,  "SSL3_RT_HEADER_LENGTH + ssl_cipher_get_record_split_len( ssl->s3->aead_write_ctx->cipher()) == split_record_len");
}

{
  __assert_rtn("tls_seal_scatter_record", "tls_record.cc", 486, "false");
}

{
  __assert_rtn("tls_seal_scatter_record", "tls_record.cc", 472, "ssl->s3->aead_write_ctx->ExplicitNonceLen() == 0");
}

void bssl::do_seal_record()
{
}

{
  __assert_rtn( "do_seal_record",  "tls_record.cc",  389,  "!buffers_alias(in, in_len, out_prefix, ssl_record_prefix_len(ssl))");
}

{
  __assert_rtn("do_seal_record", "tls_record.cc", 388, "in == out || !buffers_alias(in, in_len, out, in_len)");
}

void bssl::ssl_private_key_decrypt()
{
}

void aead_tls_open_cold_1()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 356, "EVP_CIPHER_CTX_mode(&tls_ctx->cipher_ctx) != EVP_CIPH_CBC_MODE");
}

void aead_tls_open_cold_2()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 367, "mac_len == HMAC_size(&tls_ctx->hmac_ctx)");
}

void aead_tls_open_cold_3()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 349, "mac_len == HMAC_size(&tls_ctx->hmac_ctx)");
}

void aead_tls_open_cold_4()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 316, "data_plus_mac_len >= HMAC_size(&tls_ctx->hmac_ctx)");
}

void aead_tls_open_cold_5()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 294, "total == in_len");
}

void aead_tls_seal_scatter_cold_1()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 212, "block_size <= 256");
}

void aead_tls_seal_scatter_cold_2()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 230, "tag_len == aead_tls_tag_len(ctx, in_len, extra_in_len)");
}

void aead_tls_seal_scatter_cold_3()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 229, "len == 0");
}

void aead_tls_seal_scatter_cold_4()
{
  __assert_rtn( "aead_tls_seal_scatter",  "e_tls.c",  213,  "EVP_CIPHER_CTX_mode(&tls_ctx->cipher_ctx) == EVP_CIPH_CBC_MODE");
}

void aead_tls_seal_scatter_cold_5()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 199, "buf_len == (int)block_size");
}

void aead_tls_seal_scatter_cold_6()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 192, "len + block_size - early_mac_len == in_len");
}

void aead_tls_tag_len_cold_1()
{
  __assert_rtn("aead_tls_tag_len", "e_tls.c", 111, "block_size != 0 && (block_size & (block_size - 1)) == 0");
}

void aead_tls_tag_len_cold_2()
{
  __assert_rtn("aead_tls_tag_len", "e_tls.c", 99, "extra_in_len == 0");
}

void aead_tls_init_cold_1()
{
  __assert_rtn("aead_tls_init", "e_tls.c", 80, "mac_key_len <= EVP_MAX_MD_SIZE");
}

void aead_tls_init_cold_2()
{
  __assert_rtn( "aead_tls_init",  "e_tls.c",  75,  "mac_key_len + enc_key_len + (implicit_iv ? EVP_CIPHER_iv_length(cipher) : 0) == key_len");
}

void BN_mod_exp_mont_cold_1()
{
}

void BN_mod_exp_mont_cold_2()
{
}

void BN_mod_exp_mont_cold_3()
{
}

void bn_mod_exp_mont_small_cold_1()
{
}

void bn_mod_exp_mont_small_cold_2()
{
  __assert_rtn("bn_mod_exp_mont_small", "exponentiation.c", 742, "bits != 0");
}

void bn_mod_exp_mont_small_cold_3()
{
}

void bn_mod_exp_mont_small_cold_4()
{
}

void bn_mod_exp_mont_small_cold_5()
{
}

void BN_mod_exp_mont_consttime_cold_1()
{
  __assert_rtn("BN_mod_exp_mont_consttime", "exponentiation.c", 965, "(size_t)top <= BN_MONTGOMERY_MAX_WORDS");
}

void BN_mod_exp_mont_consttime_cold_2()
{
}

void BN_mod_exp_mont_consttime_cold_3()
{
}

void BN_mod_exp_mont_consttime_cold_4()
{
  __assert_rtn("align_pointer", "internal.h", 340, "((uintptr_t)ptr & (alignment - 1)) == 0");
}

void copy_to_prebuf_cold_1()
{
}

void bn_uadd_consttime_cold_1()
{
  __assert_rtn("CRYPTO_addc_u64", "internal.h", 1279, "constant_time_declassify_int(carry <= 1)");
}

void bn_usub_consttime_cold_1()
{
  __assert_rtn("CRYPTO_subc_u64", "internal.h", 1331, "constant_time_declassify_int(borrow <= 1)");
}

void sha256_final_impl_cold_1()
{
}

void sha256_final_impl_cold_2()
{
  __assert_rtn("sha256_final_impl", "sha256.c", 148, "md_len % 4 == 0");
}

void EVP_AEAD_CTX_open_cold_1()
{
}

void EVP_AEAD_CTX_tag_len_cold_1()
{
}

void RSA_encrypt_cold_1()
{
}

void RSA_encrypt_cold_2()
{
}

void RSA_encrypt_cold_3()
{
}

void RSA_padding_check_PKCS1_OAEP_mgf1_cold_1()
{
}

void RSA_padding_add_PKCS1_OAEP_mgf1_cold_1()
{
}

void RSA_verify_raw_cold_1()
{
}

void RSA_verify_raw_cold_2()
{
}

void RSA_decrypt_cold_1()
{
}

void rsa_default_sign_raw_cold_1()
{
}

void RSA_sign_raw_cold_1()
{
}

void RSA_sign_cold_1()
{
}

void RSA_sign_pss_mgf1_cold_1()
{
}

void ec_GFp_nistp224_point_mul_public_cold_1()
{
}

void bn_mod_u16_consttime_cold_1()
{
  __assert_rtn("bn_mod_u16_consttime", "div_extra.c", 72, "p <= 16");
}

void mod_u16_cold_1()
{
}

void ec_point_to_bytes_cold_1()
{
  __assert_rtn("ec_point_to_bytes", "oct.c", 107, "field_len == BN_num_bytes(&group->field.N)");
}

void ec_point_to_bytes_cold_2()
{
  __assert_rtn("ec_point_to_bytes", "oct.c", 103, "field_len == BN_num_bytes(&group->field.N)");
}

void ec_GFp_nistp256_point_mul_public_cold_1()
{
}

void ec_GFp_nistp256_cmp_x_coordinate_cold_1()
{
  __assert_rtn("ec_GFp_nistp256_cmp_x_coordinate", "p256.c", 713, "group->field.N.width == group->order.N.width");
}

void HMAC_cold_1(void *a1, const EVP_MD *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a1;
  int v4 = 136446722;
  uint64_t v5 = "HMAC";
  __int16 v6 = 1024;
  int v7 = 34;
  __int16 v8 = 1024;
  int v9 = EVP_MD_type(a2);
  _os_log_error_impl( &dword_187560000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) evp_to_ccdigest_info(%d) failed",  (uint8_t *)&v4,  0x18u);
}

void HMAC_Init_ex_cold_1()
{
  __assert_rtn("HMAC_Init_ex", "boringssl_crypto_hmac.m", 97, "block_size <= sizeof(key_block)");
}

void bn_mont_n0_cold_1()
{
}

void bn_mont_n0_cold_2()
{
  __assert_rtn("bn_neg_inv_mod_r_u64", "montgomery_inv.c", 105, "n % 2 == 1");
}

void bn_mont_n0_cold_3()
{
  __assert_rtn( "bn_neg_inv_mod_r_u64",  "montgomery_inv.c",  156,  "constant_time_declassify_int(1 == ((uint128_t)u * 2 * alpha) - ((uint128_t)v * beta))");
}

void bn_mont_n0_cold_4()
{
  __assert_rtn( "bn_neg_inv_mod_r_u64",  "montgomery_inv.c",  120,  "(BN_ULLONG)(1) << (LG_LITTLE_R - i) == ((BN_ULLONG)u * 2 * alpha) - ((BN_ULLONG)v * beta)");
}

void bn_mont_n0_cold_5()
{
}

void bn_mont_n0_cold_6()
{
}

void bn_mont_ctx_set_RR_consttime_cold_1()
{
}

void bn_mont_ctx_set_RR_consttime_cold_2()
{
  __assert_rtn("bn_mont_ctx_set_RR_consttime", "montgomery_inv.c", 176, "lgBigR >= n_bits");
}

void bn_mont_ctx_set_RR_consttime_cold_3()
{
  __assert_rtn("bn_mont_ctx_set_RR_consttime", "montgomery_inv.c", 214, "threshold == mont->N.width");
}

void bn_mont_ctx_set_RR_consttime_cold_4()
{
  __assert_rtn("bn_mont_ctx_set_RR_consttime", "montgomery_inv.c", 169, "n_bits != 0");
}

void bn_mont_ctx_set_RR_consttime_cold_5()
{
  __assert_rtn("bn_mont_ctx_set_RR_consttime", "montgomery_inv.c", 166, "bn_minimal_width(&mont->N) == mont->N.width");
}

void bn_mont_ctx_set_RR_consttime_cold_6()
{
}

void bn_mont_ctx_set_RR_consttime_cold_7()
{
}

void RSA_padding_add_PKCS1_PSS_mgf1_cold_1()
{
  __assert_rtn("RSA_padding_add_PKCS1_PSS_mgf1", "padding.c", 336, "emLen >= 1");
}

void aes_init_key_cold_1(int a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = 136446722;
  uint64_t v3 = "aes_init_key";
  __int16 v4 = 1024;
  int v5 = 99;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_error_impl( &dword_187560000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) Unsupported EVP mode: %d",  (uint8_t *)&v2,  0x18u);
  OUTLINED_FUNCTION_2();
}

void aes_init_key_cold_2()
{
}

void aes_init_key_cold_3()
{
}

void aes_init_key_cold_4()
{
}

void aes_init_key_cold_5()
{
}

void aes_cipher_cold_1()
{
  __assert_rtn("aes_cbc_cipher", "boringssl_crypto_aes.m", 115, "len == 0 || (in != NULL && out != NULL)");
}

void aead_aes_gcm_seal_scatter_cold_1()
{
}

void aead_aes_gcm_seal_scatter_cold_2()
{
}

void aead_aes_gcm_seal_scatter_cold_3()
{
}

void aead_aes_gcm_seal_scatter_cold_4()
{
}

void aead_aes_gcm_seal_scatter_cold_5()
{
}

void aead_aes_gcm_seal_scatter_cold_6()
{
}

void aead_aes_gcm_open_gather_cold_1()
{
}

void aead_aes_gcm_open_gather_cold_2()
{
}

void aead_aes_gcm_open_gather_cold_3()
{
}

void EVP_MD_CTX_cleanup_cold_1()
{
  __assert_rtn("EVP_MD_CTX_cleanup", "digest.c", 99, "ctx->pctx == NULL || ctx->pctx_ops != NULL");
}

void EVP_MD_CTX_copy_ex_cold_1()
{
  __assert_rtn("EVP_MD_CTX_copy_ex", "digest.c", 180, "out->pctx == NULL || out->pctx_ops != NULL");
}

void EVP_MD_CTX_copy_ex_cold_2()
{
  __assert_rtn("EVP_MD_CTX_copy_ex", "digest.c", 154, "in->digest->ctx_size != 0");
}

void EVP_MD_CTX_copy_ex_cold_3()
{
  __assert_rtn("EVP_MD_CTX_copy_ex", "digest.c", 143, "in->pctx == NULL || in->pctx_ops != NULL");
}

void EVP_DigestInit_ex_cold_1()
{
  __assert_rtn("EVP_DigestInit_ex", "digest.c", 220, "ctx->pctx == NULL || ctx->pctx_ops != NULL");
}

void EVP_DigestInit_ex_cold_2()
{
  __assert_rtn("EVP_DigestInit_ex", "digest.c", 209, "type->ctx_size != 0");
}

void EVP_DigestFinal_ex_cold_1()
{
  __assert_rtn("EVP_DigestFinal_ex", "digest.c", 237, "ctx->digest->md_size <= EVP_MAX_MD_SIZE");
}

void bssl::tls13_client_handshake()
{
}

{
  __assert_rtn( "do_send_second_client_hello",  "tls13_client.cc",  343,  "hs->ssl->s3->write_level == ssl_encryption_initial");
}

{
  __assert_rtn("do_read_encrypted_extensions", "tls13_client.cc", 567, "ssl->s3->session_reused");
}

{
  __assert_rtn("do_read_encrypted_extensions", "tls13_client.cc", 571, "ssl->s3->ech_status != ssl_ech_rejected");
}

{
  __assert_rtn("do_send_client_certificate_verify", "tls13_client.cc", 938, "0");
}

void bssl::close_early_data()
{
}

{
  __assert_rtn("close_early_data", "tls13_client.cc", 95, "level == ssl_encryption_handshake");
}

{
  __assert_rtn("close_early_data", "tls13_client.cc", 104, "ssl->s3->write_level == level");
}

void BN_CTX_free_cold_1()
{
  __assert_rtn("BN_CTX_free", "ctx.c", 131, "ctx->used == 0 || ctx->error");
}

void BN_CTX_end_cold_1()
{
}

void bssl::tls13_process_finished()
{
}

void bssl::tls13_add_certificate_verify_in_buffer()
{
  __assert_rtn("tls13_add_certificate_verify_in_buffer", "tls13_both.cc", 788, "hs->signature_algorithm != 0");
}

void bssl::tls1_get_shared_group()
{
}

void bssl::ssl_add_clienthello_tlsext()
{
  __assert_rtn( "ssl_add_clienthello_tlsext",  "extensions.cc",  3995,  "psk_extension_len == CBB_len(&extensions) - len_before");
}

{
  __assert_rtn("ssl_add_clienthello_tlsext", "extensions.cc", 3891, "out_encoded == nullptr");
}

void bssl::ssl_decrypt_ticket_with_cb()
{
  __assert_rtn( "ssl_decrypt_ticket_with_cb",  "extensions.cc",  4319,  "ticket.size() >= SSL_TICKET_KEY_NAME_LEN + EVP_MAX_IV_LENGTH");
}

void bssl::ssl_decrypt_ticket_with_ticket_keys()
{
  __assert_rtn( "ssl_decrypt_ticket_with_ticket_keys",  "extensions.cc",  4346,  "ticket.size() >= SSL_TICKET_KEY_NAME_LEN + EVP_MAX_IV_LENGTH");
}

void bssl::ext_ri_add_clienthello()
{
  __assert_rtn( "ext_ri_add_clienthello",  "extensions.cc",  713,  "ssl->s3->initial_handshake_complete == (ssl->s3->previous_client_finished_len != 0)");
}

void bssl::ext_ri_parse_serverhello()
{
}

{
  __assert_rtn( "ext_ri_parse_serverhello",  "extensions.cc",  761,  "!expected_len || ssl->s3->previous_server_finished_len");
}

{
  __assert_rtn( "ext_ri_parse_serverhello",  "extensions.cc",  763,  "ssl->s3->initial_handshake_complete == (ssl->s3->previous_client_finished_len != 0)");
}

{
  __assert_rtn( "ext_ri_parse_serverhello",  "extensions.cc",  765,  "ssl->s3->initial_handshake_complete == (ssl->s3->previous_server_finished_len != 0)");
}

void bssl::ext_ri_parse_clienthello()
{
}

void bssl::ext_ri_add_serverhello()
{
}

void bssl::ext_ticket_parse_serverhello()
{
  __assert_rtn("ext_ticket_parse_serverhello", "extensions.cc", 996, "(SSL_get_options(ssl) & SSL_OP_NO_TICKET) == 0");
}

void bssl::ext_ticket_add_serverhello()
{
  __assert_rtn( "ext_ticket_add_serverhello",  "extensions.cc",  1012,  "(SSL_get_options(hs->ssl) & SSL_OP_NO_TICKET) == 0");
}

void bssl::ext_alpn_parse_serverhello()
{
}

{
  __assert_rtn("ext_alpn_parse_serverhello", "extensions.cc", 1418, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_npn_parse_serverhello()
{
  __assert_rtn("ext_npn_parse_serverhello", "extensions.cc", 1189, "ssl->ctx->next_proto_select_cb != NULL");
}

{
  __assert_rtn("ext_npn_parse_serverhello", "extensions.cc", 1188, "!SSL_is_dtls(ssl)");
}

{
  __assert_rtn("ext_npn_parse_serverhello", "extensions.cc", 1187, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_sct_parse_serverhello()
{
}

void bssl::ext_sct_add_serverhello()
{
}

void bssl::ext_channel_id_parse_serverhello()
{
}

{
  __assert_rtn("ext_channel_id_parse_serverhello", "extensions.cc", 1638, "!SSL_is_dtls(hs->ssl)");
}

void bssl::ext_srtp_parse_serverhello()
{
}

void bssl::ext_srtp_add_serverhello()
{
}

void bssl::ext_key_share_add_clienthello()
{
}

void bssl::ext_early_data_add_clienthello()
{
  __assert_rtn( "ext_early_data_add_clienthello",  "extensions.cc",  2148,  "ssl->s3->early_data_reason != ssl_early_data_unknown");
}

void bssl::ext_early_data_parse_serverhello()
{
  __assert_rtn( "ext_early_data_parse_serverhello",  "extensions.cc",  2181,  "ssl->s3->early_data_reason != ssl_early_data_unknown");
}

{
  __assert_rtn("ext_early_data_parse_serverhello", "extensions.cc", 2189, "!ssl->s3->used_hello_retry_request");
}

void bssl::ext_quic_transport_params_add_clienthello_impl()
{
}

void bssl::ext_quic_transport_params_parse_serverhello_impl()
{
  __assert_rtn("ext_quic_transport_params_parse_serverhello_impl", "extensions.cc", 2655, "ssl->quic_method != nullptr");
}

{
  __assert_rtn( "ext_quic_transport_params_parse_serverhello_impl",  "extensions.cc",  2657,  "used_legacy_codepoint == hs->config->quic_use_legacy_codepoint");
}

{
  __assert_rtn( "ext_quic_transport_params_parse_serverhello_impl",  "extensions.cc",  2656,  "ssl_protocol_version(ssl) == TLS1_3_VERSION");
}

void bssl::ext_quic_transport_params_parse_clienthello_impl()
{
  __assert_rtn( "ext_quic_transport_params_parse_clienthello_impl",  "extensions.cc",  2707,  "ssl_protocol_version(ssl) == TLS1_3_VERSION");
}

void bssl::ext_quic_transport_params_add_serverhello_impl()
{
  __assert_rtn( "ext_quic_transport_params_add_serverhello_impl",  "extensions.cc",  2735,  "hs->ssl->quic_method != nullptr");
}

void bssl::ext_alps_parse_serverhello_impl()
{
}

{
  __assert_rtn("ext_alps_parse_serverhello_impl", "extensions.cc", 2999, "!hs->config->alps_configs.empty()");
}

{
  __assert_rtn( "ext_alps_parse_serverhello_impl",  "extensions.cc",  3000,  "use_new_codepoint == hs->config->alps_use_new_codepoint");
}

{
  __assert_rtn("ext_alps_parse_serverhello_impl", "extensions.cc", 2997, "!ssl->s3->initial_handshake_complete");
}

void bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_read),&(CRYPTO_MUTEX_unlock_read)>::MutexLockBase()
{
  __assert_rtn("MutexLockBase", "internal.h", 899, "mu_ != nullptr");
}

void bssl::tls_add_message()
{
}

void bssl::add_record_to_flight()
{
  __assert_rtn("add_record_to_flight", "s3_both.cc", 142, "ssl->s3->pending_flight_offset == 0");
}

{
  __assert_rtn("add_record_to_flight", "s3_both.cc", 140, "!ssl->s3->pending_hs_data");
}

void bssl::read_v2_client_hello()
{
  __assert_rtn("read_v2_client_hello", "s3_both.cc", 358, "in.size() >= SSL3_RT_HEADER_LENGTH");
}

{
  __assert_rtn("read_v2_client_hello", "s3_both.cc", 407, "msg_type == SSL2_MT_CLIENT_HELLO");
}

void bssl::tls_next_message()
{
}

void bssl::ssl_tls13_cipher_meets_policy()
{
}

{
  __assert_rtn("ssl_tls13_cipher_meets_policy", "s3_both.cc", 702, "false");
}

{
  __assert_rtn("ssl_tls13_cipher_meets_policy", "s3_both.cc", 714, "false");
}

void bn_mul_impl_cold_1()
{
  __assert_rtn("bn_mul_impl", "mul.c", 473, "al >= j && bl >= j");
}

void bn_mul_impl_cold_2()
{
  __assert_rtn("bn_mul_impl", "mul.c", 461, "j <= al || j <= bl");
}

void bn_sqr_recursive_cold_1()
{
  __assert_rtn("bn_sqr_recursive", "mul.c", 589, "n2 != 0 && (n2 & (n2 - 1)) == 0");
}

void bn_sqr_recursive_cold_2()
{
  __assert_rtn("bn_sqr_recursive", "mul.c", 640, "c == 0");
}

void bn_sub_part_words_cold_1()
{
  __assert_rtn("bn_sub_part_words", "mul.c", 131, "cl >= 0");
}

void bn_mul_part_recursive_cold_1()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 312, "0 <= tna && tna < n");
}

void bn_mul_part_recursive_cold_2()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 313, "0 <= tnb && tnb < n");
}

void bn_mul_part_recursive_cold_3()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 314, "-1 <= tna - tnb && tna - tnb <= 1");
}

void bn_mul_part_recursive_cold_4()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 409, "constant_time_declassify_int(c == 0)");
}

void bn_mul_part_recursive_cold_5()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 310, "n != 0 && (n & (n - 1)) == 0");
}

void bn_mul_recursive_cold_1()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 211, "-BN_MUL_RECURSIVE_SIZE_NORMAL/2 <= dna && dna <= 0");
}

void bn_mul_recursive_cold_2()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 212, "-BN_MUL_RECURSIVE_SIZE_NORMAL/2 <= dnb && dnb <= 0");
}

void bn_mul_recursive_cold_3()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 295, "constant_time_declassify_int(c == 0)");
}

void bn_mul_recursive_cold_4()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 209, "n2 != 0 && (n2 & (n2 - 1)) == 0");
}

void parse_integer_cold_1()
{
  __assert_rtn("parse_integer", "rsa_asn1.c", 73, "*out == NULL");
}

void boringssl_session_state_create_cold_1()
{
}

void boringssl_session_state_create_cold_2()
{
}

void boringssl_session_state_copy_serialized_session_state_cold_1()
{
}

void boringssl_session_state_copy_serialized_session_state_cold_2()
{
}

void boringssl_session_state_copy_serialized_session_state_cold_3()
{
}

void boringssl_session_state_copy_serialized_session_state_cold_4()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  *(_DWORD *)os_log_type_t v2 = 136446722;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v2[7] = 86;
  v2[9] = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl( &dword_187560000,  v1,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) boringssl_memory_malloc(%zu) failed",  (uint8_t *)v2,  0x1Cu);
}

void boringssl_session_state_create_from_dispatch_data_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    os_log_type_t v2 = (char *)OUTLINED_FUNCTION_1_1();
    uint64_t v5 = v2 + 391;
  }

  else
  {
    uint64_t v5 = &unk_1875F4C23;
  }

  id v6 = OUTLINED_FUNCTION_1_1();
  *(_DWORD *)uint64_t v8 = 136446978;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v8[7] = 194;
  v8[9] = 2082;
  int v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_error_impl( &dword_187560000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) %{public}s[%p] Failed to extract the SSL_SESSION bytes.",  (uint8_t *)v8,  0x26u);

  if (WeakRetained) {
}
  }

void bssl::ssl_handle_open_record()
{
}

void bssl::tls_write_app_data()
{
}

{
  __assert_rtn("tls_write_app_data", "s3_pkt.cc", 186, "bytes_written <= to_write");
}

{
  __assert_rtn("tls_write_app_data", "s3_pkt.cc", 134, "ssl_can_write(ssl)");
}

void bssl::tls_open_app_data()
{
}

{
  __assert_rtn("tls_open_app_data", "s3_pkt.cc", 313, "ssl_can_read(ssl)");
}

void bssl::ssl_send_alert_impl()
{
  __assert_rtn("ssl_send_alert_impl", "s3_pkt.cc", 420, "desc != SSL_AD_CLOSE_NOTIFY");
}

{
  __assert_rtn("ssl_send_alert_impl", "s3_pkt.cc", 419, "level == SSL3_AL_FATAL");
}

void bssl::tls_dispatch_alert()
{
  __assert_rtn("tls_dispatch_alert", "s3_pkt.cc", 451, "bytes_written == 2");
}

void bssl::anonymous namespace'::ECKeyShare::Generate()
{
}

void bssl::anonymous namespace'::ECKeyShare::Decap()
{
}

{
  __assert_rtn("Decap", "ssl_key_share.cc", 81, "private_key_");
}

void bssl::anonymous namespace'::ECKeyShare::SerializePrivateKey()
{
}

{
  __assert_rtn("SerializePrivateKey", "ssl_key_share.cc", 120, "private_key_");
}

void bssl::anonymous namespace'::ECKeyShare::DeserializePrivateKey()
{
}

#error "1875EE40C: call analysis failed (funcsize=45)"
#error "1875EE4D8: call analysis failed (funcsize=45)"
#error "1875EE5A4: call analysis failed (funcsize=45)"
#error "1875EE670: call analysis failed (funcsize=45)"
#error "1875EE744: call analysis failed (funcsize=47)"
#error "1875EE810: call analysis failed (funcsize=45)"
#error "1875EE8E4: call analysis failed (funcsize=47)"
void boringssl_helper_create_sec_trust_with_certificates_cold_6( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  __int128 a9,  __int128 a10,  int a11,  __int16 a12,  __int16 a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24,  uint64_t a25,  uint64_t a26)
{
  os_log_s *v26;
  int v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  OUTLINED_FUNCTION_17();
  a25 = v30;
  a26 = v31;
  OUTLINED_FUNCTION_13_1();
  a16 = *MEMORY[0x1895F89C0];
  unsigned int v33 = OUTLINED_FUNCTION_8(v32, 16LL);
  if (v33)
  {
    BOOL v28 = (char *)OUTLINED_FUNCTION_12();
    unint64_t v34 = v28 + 391;
  }

  else
  {
    unint64_t v34 = &unk_1875F4C23;
  }

  unint64_t v35 = OUTLINED_FUNCTION_12();
  BOOL v36 = *(void *)(v29 + 272);
  LODWORD(va_start(va, a9) = 136447490;
  *(void *)((char *)&a9 + 4) = "boringssl_helper_create_sec_trust_with_certificates";
  WORD6(va_start(va, a9) = 1024;
  *(_DWORD *)((char *)&a9 + 14) = 595;
  WORD1(a10) = 2082;
  *(void *)((char *)&a10 + 4) = v34;
  WORD6(a10) = 2048;
  *(void *)((char *)&a10 + 14) = v35;
  a13 = 2048;
  a14 = v36;
  LOWORD(a15) = 1024;
  *(_DWORD *)((char *)&a15 + 2) = v27;
  _os_log_debug_impl( &dword_187560000,  v26,  OS_LOG_TYPE_DEBUG,  "%{public}s(%d) %{public}s[%p] SecTrustSetURLRequestAttribution(%lu) result: %d",  (uint8_t *)&a9,  0x36u);

  if (v33) {
  OUTLINED_FUNCTION_10();
  }
}

#error "1875EEADC: call analysis failed (funcsize=47)"
#error "1875EEBB0: call analysis failed (funcsize=47)"
#error "1875EEC7C: call analysis failed (funcsize=45)"
#error "1875EED48: call analysis failed (funcsize=45)"
#error "1875EEE14: call analysis failed (funcsize=45)"
void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_1()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_187560000, v0, v1, "%{public}s(%d) CFArrayCreateMutable failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_2()
{
}

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_3()
{
}

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_4()
{
}

void boringssl_helper_copy_leaf_private_key_from_identity_array_cold_1()
{
}

void boringssl_helper_copy_leaf_private_key_from_identity_array_cold_2()
{
}

void boringssl_helper_copy_leaf_private_key_from_identity_array_cold_3()
{
}

void bn_reduce_once_cold_1()
{
  __assert_rtn("bn_reduce_once", "div.c", 415, "r != a");
}

void bn_reduce_once_cold_2()
{
  __assert_rtn("bn_reduce_once", "div.c", 428, "constant_time_declassify_int(carry + 1 <= 1)");
}

void bn_reduce_once_in_place_cold_1()
{
  __assert_rtn("bn_reduce_once_in_place", "div.c", 437, "constant_time_declassify_int(carry + 1 <= 1)");
}

void bn_resized_from_ctx_cold_1()
{
}

void ECDH_compute_key_cold_1()
{
}

void ECDH_compute_key_cold_2()
{
}

void ECDH_compute_key_cold_3()
{
}

void ECDH_compute_key_cold_4()
{
}

void ECDH_compute_key_cold_5()
{
}

void ECDH_compute_key_cold_6()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  *(_DWORD *)uint64_t v2 = 136446722;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v2[7] = 16;
  v2[9] = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl( &dword_187560000,  v1,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) Key size %zui is not supported for ECDH.",  (uint8_t *)v2,  0x1Cu);
}

void ECDH_compute_key_cold_7()
{
}

void ECDH_compute_key_cold_8()
{
}

void bn_rand_secret_range_cold_1()
{
}

void bn_rand_secret_range_cold_2()
{
  __assert_rtn("bn_rand_secret_range", "random.c", 320, "mask != 0");
}

void bn_rand_secret_range_cold_3()
{
}

void ec_compute_wNAF_cold_1()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 91, "0 < w && w <= 7");
}

void ec_compute_wNAF_cold_2()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 92, "bits != 0");
}

void ec_compute_wNAF_cold_3()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 147, "window_val == 0");
}

void ec_compute_wNAF_cold_4()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 99, "0 <= window_val && window_val <= next_bit");
}

void ec_compute_wNAF_cold_5()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 143, "window_val <= next_bit");
}

void ec_compute_wNAF_cold_6()
{
}

void ec_compute_wNAF_cold_7()
{
}

void ec_compute_wNAF_cold_8()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 128, "window_val == 0 || window_val == next_bit || window_val == bit");
}

void ec_compute_wNAF_cold_9()
{
}

void ec_GFp_mont_mul_public_batch_cold_1()
{
  __assert_rtn("ec_GFp_mont_mul_public_batch", "wnaf.c", 211, "wNAF_len <= OPENSSL_ARRAY_SIZE(g_wNAF)");
}

void BORINGSSL_keccak_absorb_cold_1()
{
}

void EVP_tls_cbc_copy_mac_cold_1()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 134, "orig_len >= in_len");
}

void EVP_tls_cbc_copy_mac_cold_2()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 135, "in_len >= md_size");
}

void EVP_tls_cbc_copy_mac_cold_3()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 136, "md_size <= EVP_MAX_MD_SIZE");
}

void EVP_tls_cbc_copy_mac_cold_4()
{
}

void EVP_tls_cbc_digest_record_cold_1()
{
}

void EVP_tls_cbc_digest_record_cold_2()
{
}

void EVP_tls_cbc_digest_record_cold_3()
{
  __assert_rtn("EVP_tls_cbc_digest_record", "tls_cbc.c", 391, "mac_secret_length <= sizeof(hmac_pad)");
}

void EVP_tls_cbc_digest_record_cold_4()
{
  __assert_rtn("EVP_tls_cbc_digest_record", "tls_cbc.c", 324, "md_block_size == (1u << md_block_shift)");
}

void bssl::ssl_ctx_get_current_time()
{
}

{
  __assert_rtn("ssl_ctx_get_current_time", "ssl_lib.cc", 384, "0");
}

void ssl_read_impl()
{
}

void SSL_get_extms_support_cold_1()
{
}

void SSL_renegotiate_cold_1()
{
}

void bssl::ssl_can_renegotiate()
{
}

void SSL_get_ciphers_cold_1()
{
}

void SSL_get0_alpn_selected_cold_1()
{
}

void SSL_CTX_add_cert_compression_alg_cold_1()
{
  __assert_rtn("SSL_CTX_add_cert_compression_alg", "ssl_lib.cc", 2740, "compress != nullptr || decompress != nullptr");
}

void SSL_set_shutdown_cold_1()
{
  __assert_rtn("SSL_set_shutdown", "ssl_lib.cc", 2887, "(SSL_get_shutdown(ssl) & mode) == SSL_get_shutdown(ssl)");
}

void SSL_get_psk_identity_hint_cold_1()
{
}

void bssl::hex_char_consttime()
{
}

void boringssl_ecdsa_get_cc_curve_parameters_cold_1()
{
}

void ECDSA_sign_cold_1()
{
}

void ECDSA_do_sign_cold_1()
{
}

void ECDSA_verify_cold_1()
{
}

void ECDSA_verify_cold_2()
{
}

void ECDSA_verify_cold_3()
{
}

void ECDSA_verify_cold_4()
{
}

void ECDSA_size_cold_1()
{
}

void ECDSA_do_verify_cold_1()
{
}

void ECDSA_do_verify_cold_2()
{
}

void ECDSA_do_verify_cold_3()
{
}

void ECDSA_do_verify_cold_4()
{
}

void ECDSA_do_verify_cold_5()
{
}

void ECDSA_do_verify_cold_6()
{
}

void ECDSA_do_verify_cold_7()
{
}

void DTLSv1_get_timeout_cold_1()
{
}

void dtls1_set_read_state()
{
}

void dtls1_set_write_state()
{
}

void parse_integer_cold_1_0()
{
  __assert_rtn("parse_integer", "dsa_asn1.c", 134, "*out == NULL");
}

void boringssl_metrics_create_connection_event_cold_1()
{
}

void boringssl_metrics_create_connection_failure_event_cold_1()
{
}

void boringssl_metrics_create_ech_event_cold_1()
{
}

void boringssl_metrics_log_event_cold_1()
{
}

void __boringssl_metrics_log_metric_block_invoke_cold_1()
{
}

void ec_bignum_to_felem_cold_1()
{
  __assert_rtn("ec_bignum_to_felem", "felem.c", 34, "sizeof(bytes) >= len");
}

void ec_felem_neg_cold_1()
{
  __assert_rtn("ec_felem_neg", "felem.c", 66, "borrow == 0");
}

void OPENSSL_sk_find_cold_1()
{
  __assert_rtn("OPENSSL_sk_find", "stack.c", 315, "lo <= mid && mid < hi");
}

void OPENSSL_sk_find_cold_2()
{
  __assert_rtn("OPENSSL_sk_find", "stack.c", 337, "lo == hi");
}

void OPENSSL_sk_find_cold_3()
{
}

void lh_maybe_resize_cold_1()
{
  __assert_rtn("lh_maybe_resize", "lhash.c", 244, "lh->num_buckets >= kMinNumBuckets");
}

void get_error_values_cold_1()
{
}

void get_error_values_cold_2()
{
}

void print_errors_to_file_cold_1()
{
  __assert_rtn("print_errors_to_file", "err.c", 666, "msg[msg_len] == '\\0'");
}

void ERR_add_error_data_cold_1()
{
}

void ERR_save_state_cold_1()
{
}

void boringssl_context_state_create_cold_1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = 136446466;
  uint64_t v2 = "boringssl_context_state_create";
  __int16 v3 = 1024;
  int v4 = 35;
  _os_log_error_impl( &dword_187560000,  log,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) Failed to allocate a boringssl context state object.",  (uint8_t *)&v1,  0x12u);
}

void BIO_printf_cold_1()
{
  __assert_rtn("BIO_printf", "printf.c", 91, "out_len == requested_len");
}

void cbs_convert_ber_cold_1()
{
}

void CBS_get_asn1_implicit_string_cold_1()
{
}

void CBS_get_asn1_implicit_string_cold_2()
{
}

void CBS_get_asn1_implicit_string_cold_3()
{
}

void CBB_cleanup_cold_1()
{
}

void CBB_flush_cold_1()
{
}

void CBB_flush_cold_2()
{
  __assert_rtn("CBB_flush", "cbb.c", 218, "child->pending_len_len == 1");
}

void CBB_flush_cold_3()
{
  __assert_rtn("CBB_flush", "cbb.c", 200, "child->base == base");
}

void CBB_data_cold_1()
{
  __assert_rtn("CBB_data", "cbb.c", 275, "cbb->child == NULL");
}

void CBB_len_cold_1()
{
  __assert_rtn("CBB_len", "cbb.c", 287, "cbb->u.child.offset + cbb->u.child.pending_len_len <= cbb->u.child.base->len");
}

void CBB_len_cold_2()
{
  __assert_rtn("CBB_len", "cbb.c", 284, "cbb->child == NULL");
}

void cbb_add_child_cold_1()
{
  __assert_rtn("cbb_add_child", "cbb.c", 297, "!is_asn1 || len_len == 1");
}

void cbb_add_child_cold_2()
{
  __assert_rtn("cbb_add_child", "cbb.c", 296, "cbb->child == NULL");
}

void CBB_discard_child_cold_1()
{
}

void cbs_get_any_asn1_element_cold_1()
{
  __assert_rtn("cbs_get_any_asn1_element", "cbs.c", 321, "out_indefinite == NULL");
}

void cbs_get_any_asn1_element_cold_2()
{
  __assert_rtn("cbs_get_any_asn1_element", "cbs.c", 320, "out_ber_found == NULL");
}

void cbs_get_asn1_cold_1()
{
}

void CBS_get_optional_asn1_octet_string_cold_1()
{
}

void EC_GROUP_get0_order_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void ec_get_x_coordinate_as_bytes_cold_1()
{
  __assert_rtn("ec_get_x_coordinate_as_bytes", "ec.c", 994, "len <= EC_MAX_BYTES");
}

#error "1875F0B0C: call analysis failed (funcsize=43)"
#error "1875F0BCC: call analysis failed (funcsize=43)"
#error "1875F0C8C: call analysis failed (funcsize=43)"
#error "1875F0D4C: call analysis failed (funcsize=43)"
void boringssl_context_set_key_exchange_groups_from_list_cold_2()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1( &dword_187560000,  v0,  v1,  "%{public}s(%d) No supported key exchange groups from the provided selection",  v2,  v3,  v4,  v5,  v6);
}

#error "1875F0E84: call analysis failed (funcsize=43)"
#error "1875F0F44: call analysis failed (funcsize=43)"
#error "1875F1004: call analysis failed (funcsize=43)"
#error "1875F10C4: call analysis failed (funcsize=43)"
void boringssl_context_zlib_uncompress_data_cold_1()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_187560000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
}

#error "1875F1218: call analysis failed (funcsize=50)"
void boringssl_context_keylog_handler_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  int a9,  int a10,  int a11,  int a12,  __int128 a13,  int a14,  __int16 a15,  __int16 a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24,  uint64_t a25,  uint64_t a26,  uint64_t a27)
{
  os_log_s *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  id v33;
  void *v34;
  id v35;
  OUTLINED_FUNCTION_18_0();
  a26 = v30;
  a27 = v31;
  OUTLINED_FUNCTION_14_1();
  unsigned int v33 = OUTLINED_FUNCTION_15_1(v32);
  if (v33)
  {
    BOOL v28 = (char *)OUTLINED_FUNCTION_12_2();
    unint64_t v34 = v28 + 391;
  }

  else
  {
    unint64_t v34 = &unk_1875F4C23;
  }

  unint64_t v35 = OUTLINED_FUNCTION_12_2();
  a9 = 136447235;
  OUTLINED_FUNCTION_1_0();
  *(int *)((char *)&a12 + 2) = 838;
  WORD1(a13) = 2082;
  *(void *)((char *)&a13 + 4) = v34;
  OUTLINED_FUNCTION_2_2();
  a16 = 2085;
  a17 = v29;
  _os_log_debug_impl( &dword_187560000,  v27,  OS_LOG_TYPE_DEBUG,  "%{public}s(%d) %{public}s[%p] %{sensitive}s",  (uint8_t *)&a9,  0x30u);

  if (v33) {
  OUTLINED_FUNCTION_7_1();
  }
}

#error "1875F13CC: call analysis failed (funcsize=43)"
#error "1875F148C: call analysis failed (funcsize=43)"
#error "1875F1570: call analysis failed (funcsize=52)"
#error "1875F1630: call analysis failed (funcsize=43)"
#error "1875F171C: call analysis failed (funcsize=54)"
#error "1875F1808: call analysis failed (funcsize=54)"
#error "1875F18C8: call analysis failed (funcsize=43)"
#error "1875F1988: call analysis failed (funcsize=43)"
#error "1875F1A48: call analysis failed (funcsize=43)"
#error "1875F1B08: call analysis failed (funcsize=43)"
#error "1875F1BC8: call analysis failed (funcsize=43)"
#error "1875F1C88: call analysis failed (funcsize=43)"
#error "1875F1D54: call analysis failed (funcsize=46)"
#error "1875F1E14: call analysis failed (funcsize=43)"
#error "1875F1EE8: call analysis failed (funcsize=48)"
#error "1875F1FC0: call analysis failed (funcsize=49)"
#error "1875F2080: call analysis failed (funcsize=43)"
#error "1875F2140: call analysis failed (funcsize=43)"
#error "1875F2200: call analysis failed (funcsize=43)"
#error "1875F22C0: call analysis failed (funcsize=43)"
void boringssl_context_message_handler_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  int a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  id v24;
  uint64_t v25;
  uint64_t v26;
  os_log_s *v27;
  os_log_s *v28;
  id *v29;
  id v30;
  id v31;
  OUTLINED_FUNCTION_18_0();
  a23 = v25;
  a24 = v26;
  BOOL v28 = v27;
  int v30 = OUTLINED_FUNCTION_15_1(v29);
  if (v30) {
    unint64_t v24 = OUTLINED_FUNCTION_12_2();
  }
  int v31 = OUTLINED_FUNCTION_12_2();
  a9 = 136447234;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17_1();
  _os_log_debug_impl( &dword_187560000,  v28,  OS_LOG_TYPE_DEBUG,  "%{public}s(%d) %{public}s[%p] Skipping content type %d",  (uint8_t *)&a9,  0x2Cu);

  if (v30) {
  OUTLINED_FUNCTION_7_1();
  }
}

#error "1875F245C: call analysis failed (funcsize=43)"
#error "1875F252C: call analysis failed (funcsize=47)"
#error "1875F25EC: call analysis failed (funcsize=43)"
#error "1875F26CC: call analysis failed (funcsize=51)"
void fe_tobytes_cold_1()
{
  __assert_rtn( "fe_tobytes",  "curve25519.c",  166,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_sq_tt_cold_1()
{
  __assert_rtn( "fe_sq_tt",  "curve25519.c",  254,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_sq_tt_cold_2()
{
  __assert_rtn( "fe_sq_tt",  "curve25519.c",  256,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_sub_cold_1()
{
  __assert_rtn( "fe_sub",  "curve25519.c",  202,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_sub_cold_2()
{
  __assert_rtn( "fe_sub",  "curve25519.c",  203,  "constant_time_declassify_int(g->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_sub_cold_3()
{
  __assert_rtn( "fe_sub",  "curve25519.c",  205,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_carry_cold_1()
{
  __assert_rtn( "fe_carry",  "curve25519.c",  209,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_carry_cold_2()
{
  __assert_rtn( "fe_carry",  "curve25519.c",  211,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_add_cold_1()
{
  __assert_rtn( "fe_add",  "curve25519.c",  193,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_add_cold_2()
{
  __assert_rtn( "fe_add",  "curve25519.c",  194,  "constant_time_declassify_int(g->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_add_cold_3()
{
  __assert_rtn( "fe_add",  "curve25519.c",  196,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_neg_cold_1()
{
  __assert_rtn( "fe_neg",  "curve25519.c",  281,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_neg_cold_2()
{
  __assert_rtn( "fe_neg",  "curve25519.c",  283,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_frombytes_strict_cold_1()
{
  __assert_rtn("fe_frombytes_strict", "curve25519.c", 153, "constant_time_declassify_int((s[31] & 0x80) == 0)");
}

void fe_frombytes_strict_cold_2()
{
  __assert_rtn( "fe_frombytes_strict",  "curve25519.c",  155,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void table_select_cold_1()
{
}

void X25519_cold_1()
{
  __assert_rtn( "fe_mul121666",  "curve25519.c",  274,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void X25519_cold_2()
{
  __assert_rtn( "fe_mul121666",  "curve25519.c",  276,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_mul_impl_cold_1()
{
  __assert_rtn( "fe_mul_impl",  "curve25519.c",  217,  "constant_time_declassify_int(in1[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_mul_impl_cold_2()
{
  __assert_rtn( "fe_mul_impl",  "curve25519.c",  218,  "constant_time_declassify_int(in2[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_mul_impl_cold_3()
{
  __assert_rtn( "fe_mul_impl",  "curve25519.c",  220,  "constant_time_declassify_int(out[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void fe_sq_tl_cold_1()
{
  __assert_rtn( "fe_sq_tl",  "curve25519.c",  248,  "constant_time_declassify_int(f->v[_assert_fe_i] <= (0x1a666666666664ULL))");
}

void fe_sq_tl_cold_2()
{
  __assert_rtn( "fe_sq_tl",  "curve25519.c",  250,  "constant_time_declassify_int(h->v[_assert_fe_i] <= (0x8ccccccccccccULL))");
}

void BN_bin2bn_cold_1()
{
  __assert_rtn("BN_bin2bn", "bytes.c", 116, "num_words <= INT_MAX");
}

void bn_words_to_big_endian_cold_1()
{
}

void bssl::ssl_session_protocol_version()
{
}

void bssl::ssl_get_prev_session()
{
}

void SSL_get_session_cold_1()
{
  __assert_rtn("SSL_get_session", "ssl_session.cc", 1214, "hs != nullptr");
}

void SSL_get_session_cold_2()
{
}

void bssl::ssl_server_handshake()
{
}

{
  __assert_rtn("do_cert_callback", "handshake_server.cc", 838, "ssl->s3->ech_status != ssl_ech_accepted");
}

{
  __assert_rtn("do_finish_server_handshake", "handshake_server.cc", 1880, "ssl->session != nullptr");
}

{
  __assert_rtn("do_finish_server_handshake", "handshake_server.cc", 1876, "ssl->session == nullptr");
}

void bssl::ssl_client_handshake()
{
}

{
  __assert_rtn("do_read_hello_verify_request", "handshake_client.cc", 685, "SSL_is_dtls(ssl)");
}

{
  __assert_rtn("do_read_hello_verify_request", "handshake_client.cc", 689, "hs->max_version < TLS1_3_VERSION");
}

{
  __assert_rtn( "do_read_server_hello",  "handshake_client.cc",  914,  "CBS_len(&server_hello.session_id) <= SSL3_SESSION_ID_SIZE");
}

{
  __assert_rtn("do_read_server_hello", "handshake_client.cc", 902, "!ssl->s3->initial_handshake_complete");
}

{
  __assert_rtn( "do_read_server_hello",  "handshake_client.cc",  785,  "ssl->s3->have_version == ssl->s3->initial_handshake_complete");
}

{
  __assert_rtn("do_reverify_server_certificate", "handshake_client.cc", 1108, "hs->ssl->ctx->reverify_on_resume");
}

{
  __assert_rtn("do_read_server_key_exchange", "handshake_client.cc", 1284, "alg_a == SSL_aPSK");
}

{
  __assert_rtn("do_read_session_ticket", "handshake_client.cc", 1880, "!hs->new_session");
}

{
  __assert_rtn("do_finish_client_handshake", "handshake_client.cc", 1967, "ssl->session != nullptr");
}

void bssl::get_write_aead()
{
  __assert_rtn("get_write_aead", "dtls_record.cc", 263, "ssl->d1->w_epoch >= 1");
}

void bssl::dtls_seal_record()
{
  __assert_rtn("dtls_seal_record", "dtls_record.cc", 295, "ssl->d1->w_epoch >= 1");
}

{
  __assert_rtn("dtls_seal_record", "dtls_record.cc", 337, "ciphertext_len == len_copy");
}

void bssl::ssl_get_handshake_digest()
{
}

void bssl::ssl_create_cipher_list()
{
  __assert_rtn("ssl_create_cipher_list", "ssl_cipher.cc", 1419, "co_list[num - 1].cipher != nullptr");
}

{
  __assert_rtn("ssl_create_cipher_list", "ssl_cipher.cc", 1424, "co_list[num - 1].cipher != nullptr");
}

{
  __assert_rtn("ssl_create_cipher_list", "ssl_cipher.cc", 1434, "co_list[num - 1].cipher != nullptr");
}

{
  __assert_rtn("ssl_create_cipher_list", "ssl_cipher.cc", 1436, "num == OPENSSL_ARRAY_SIZE(co_list)");
}

{
  __assert_rtn("ssl_create_cipher_list", "ssl_cipher.cc", 1429, "co_list[num - 1].cipher != nullptr");
}

void bssl::ssl_cipher_get_record_split_len()
{
  __assert_rtn("ssl_cipher_get_record_split_len", "ssl_cipher.cc", 1543, "cipher->algorithm_mac == SSL_SHA1");
}

void SSL_CIPHER_get_protocol_id_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_protocol_id", "ssl_cipher.cc", 1596, "(cipher->id & 0xff000000) == 0x03000000");
}

void SSL_CIPHER_get_cipher_nid_cold_1()
{
}

void SSL_CIPHER_get_digest_nid_cold_1()
{
}

void SSL_CIPHER_get_kx_nid_cold_1()
{
}

void SSL_CIPHER_get_auth_nid_cold_1()
{
}

void SSL_CIPHER_get_handshake_digest_cold_1()
{
}

void SSL_CIPHER_get_bits_cold_1()
{
}

void boringssl_memory_copy_array_cold_1()
{
}

void boringssl_memory_copy_array_cold_2()
{
}

void boringssl_memory_copy_array_cold_3()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  *(_DWORD *)uint64_t v2 = 136446722;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v2[7] = 42;
  v2[9] = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl( &dword_187560000,  v1,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) boringssl_memory_malloc(%zu) failed",  (uint8_t *)v2,  0x1Cu);
}

void aead_chacha20_poly1305_open_cold_1()
{
  OUTLINED_FUNCTION_0_7(&dword_187560000, v0, v1, "chacha20 returned an unexpected value.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void aead_chacha20_poly1305_open_cold_2()
{
}

void aead_chacha20_poly1305_seal_scatter_cold_1()
{
}

void aead_chacha20_poly1305_seal_scatter_cold_2()
{
}

void aead_chacha20_poly1305_seal_scatter_cold_3(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = 136446466;
  uint64_t v2 = "aead_chacha20_poly1305_seal_scatter";
  __int16 v3 = 1024;
  int v4 = 168;
  _os_log_error_impl( &dword_187560000,  log,  OS_LOG_TYPE_ERROR,  "%{public}s(%d) ccchacha20 failed",  (uint8_t *)&v1,  0x12u);
}

void calc_tag_cold_1()
{
}

void calc_tag_cold_2()
{
}

void tls1_P_hash_cold_1()
{
  __assert_rtn("tls1_P_hash", "kdf.c", 109, "len == chunk");
}

void bssl::SSLAEADContext::ProtocolVersion()
{
}

void bssl::SSLAEADContext::RecordVersion()
{
}

void bssl::SSLAEADContext::Open()
{
  __assert_rtn("Open", "ssl_aead_ctx.cc", 296, "nonce_len == fixed_nonce_len_");
}

{
  __assert_rtn("Open", "ssl_aead_ctx.cc", 289, "variable_nonce_len_ == 8");
}

void bssl::SSLAEADContext::SealScatter()
{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 393, "!result || written_suffix_len == suffix_len");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 383, "nonce_len == fixed_nonce_len_");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 372, "!xor_fixed_nonce_");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 365, "variable_nonce_len_ == 8");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 358, "variable_nonce_included_in_record_");
}

void METHOD_ref_cold_1()
{
}

void METHOD_unref_cold_1()
{
}

void SSL_get_srtp_profiles_cold_1()
{
}

void BN_primality_test_cold_1()
{
  __assert_rtn( "BN_primality_test",  "prime.c",  776,  "constant_time_declassify_int(uniform_iterations >= (crypto_word_t)checks)");
}

void CRYPTO_get_ex_new_index_ex_cold_1()
{
  __assert_rtn("CRYPTO_get_ex_new_index_ex", "ex_data.c", 167, "num_funcs == 0");
}

void CRYPTO_free_ex_data_cold_1()
{
  __assert_rtn("CRYPTO_free_ex_data", "ex_data.c", 230, "num_funcs <= (size_t)(INT_MAX - ex_data_class->num_reserved)");
}

void bn_set_static_words_cold_1()
{
  __assert_rtn("bn_set_static_words", "bn.c", 299, "num <= BN_MAX_WORDS");
}

void bssl::ssl_parse_extensions()
{
}

void bssl::ssl_verify_peer_cert()
{
}

void bssl::ssl_reverify_peer_cert()
{
  __assert_rtn("ssl_reverify_peer_cert", "handshake.cc", 433, "hs->config->verify_mode != SSL_VERIFY_NONE");
}

{
  __assert_rtn("ssl_reverify_peer_cert", "handshake.cc", 432, "ssl->s3->established_session == nullptr");
}

void bssl::ssl_run_handshake()
{
  __assert_rtn("ssl_run_handshake", "handshake.cc", 763, "ssl->s3->ech_status != ssl_ech_rejected");
}

{
  __assert_rtn("ssl_run_handshake", "handshake.cc", 631, "hs->wait != ssl_hs_read_change_cipher_spec");
}

{
  __assert_rtn("ssl_run_handshake", "handshake.cc", 732, "ssl->s3->early_data_reason != ssl_early_data_unknown");
}

{
  __assert_rtn("ssl_run_handshake", "handshake.cc", 733, "!hs->can_early_write");
}

{
  __assert_rtn("ssl_run_handshake", "handshake.cc", 740, "ssl->s3->ech_status != ssl_ech_rejected");
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

uint64_t CCCryptorGetIV()
{
  return MEMORY[0x1895F8110]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1895F8128](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1895F8168]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x1895F8178]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1895F8190]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x18960B260](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x18960B290](certificate);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x18960B2E0]();
}

uint64_t SecCertificateGetSignatureHashAlgorithm()
{
  return MEMORY[0x18960B310]();
}

uint64_t SecFrameworkIsDNSName()
{
  return MEMORY[0x18960B3C8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x18960B3D8](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x18960B3E0](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x18960B3F0]();
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x18960B468]();
}

CFDataRef SecKeyCreateSignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B4C0](key, algorithm, dataToSign, error);
}

OSStatus SecKeyDecrypt( SecKeyRef key, SecPadding padding, const uint8_t *cipherText, size_t cipherTextLen, uint8_t *plainText, size_t *plainTextLen)
{
  return MEMORY[0x18960B4D0](key, *(void *)&padding, cipherText, cipherTextLen, plainText, plainTextLen);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x18960B4E0]();
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x18960B4E8](key);
}

OSStatus SecKeyRawSign( SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x18960B4F8](key, *(void *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

uint64_t SecPolicyCreateSSLWithKeyUsage()
{
  return MEMORY[0x18960B590]();
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x18960B6B0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x18960B6B8](certificates, policies, trust);
}

OSStatus SecTrustEvaluateAsyncWithError( SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x18960B6D0](trust, queue, result);
}

uint64_t SecTrustReportNetworkingAnalytics()
{
  return MEMORY[0x18960B700]();
}

OSStatus SecTrustSetOCSPResponse(SecTrustRef trust, CFTypeRef responseData)
{
  return MEMORY[0x18960B728](trust, responseData);
}

OSStatus SecTrustSetSignedCertificateTimestamps(SecTrustRef trust, CFArrayRef sctArray)
{
  return MEMORY[0x18960B738](trust, sctArray);
}

uint64_t SecTrustSetURLRequestAttribution()
{
  return MEMORY[0x18960B740]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1895F8A38]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1895F9758]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1895F9760]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1895F9790]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1895F9798]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x1895F97D8]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x1895F97E8]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x1895F97F0]();
}

uint64_t ccchacha20()
{
  return MEMORY[0x1895F9800]();
}

uint64_t cccurve25519_make_pub_with_rng()
{
  return MEMORY[0x1895F9888]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1895F9B08]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895F9B18]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895F9B20]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1895F9BA0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1895F9BA8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1895F9BB0]();
}

uint64_t ccec_signature_r_s_size()
{
  return MEMORY[0x1895F9C30]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1895F9C40]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1895F9C48]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1895F9C70]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1895F9C90]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1895F9D38]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1895F9D48]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1895F9D60]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1895F9D78]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1895F9D80]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1895F9D88]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x1895F9F10]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x1895F9F18]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1895F9F28]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1895F9F30]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1895F9F38]();
}

uint64_t cchpke_initiator_export()
{
  return MEMORY[0x1895F9F48]();
}

uint64_t cchpke_initiator_setup()
{
  return MEMORY[0x1895F9F50]();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return MEMORY[0x1895F9F80]();
}

uint64_t cchpke_responder_export()
{
  return MEMORY[0x1895F9F90]();
}

uint64_t cchpke_responder_setup()
{
  return MEMORY[0x1895F9F98]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1895FA068]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1895FA098]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1895FA0D0]();
}

uint64_t ccn_zero()
{
  return MEMORY[0x1895FA0E8]();
}

uint64_t ccpoly1305_final()
{
  return MEMORY[0x1895FA100]();
}

uint64_t ccpoly1305_init()
{
  return MEMORY[0x1895FA108]();
}

uint64_t ccpoly1305_update()
{
  return MEMORY[0x1895FA110]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x1895FA130]();
}

uint64_t ccrsa_encrypt_eme_pkcs1v15()
{
  return MEMORY[0x1895FA178]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1895FA1C8]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1895FA1D0]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1895FA200]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1895FA268]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1895FA270]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1895FA298]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FA4B8]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x1895FAAA0]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1896175A0](strm, *(void *)&level, version, *(void *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1895FABE8](data, applier);
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1895FAC00]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1895FAEF8]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1895FB290](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1895FB420](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1895FB470](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x189617620](strm, version, *(void *)&stream_size);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1895FB8B0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

uint64_t network_config_register_boringssl_log_debug_updates()
{
  return MEMORY[0x189608F98]();
}

uint64_t nw_array_append()
{
  return MEMORY[0x189609060]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x189609070]();
}

uint64_t nw_association_get_cached_content_for_protocol()
{
  return MEMORY[0x189609088]();
}

uint64_t nw_association_set_cached_content_for_protocol()
{
  return MEMORY[0x189609090]();
}

uint64_t nw_context_copy_registered_endpoint()
{
  return MEMORY[0x189609420]();
}

uint64_t nw_context_get_scheduling_mode()
{
  return MEMORY[0x189609458]();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1896094E0](endpoint);
}

uint64_t nw_endpoint_copy_association()
{
  return MEMORY[0x1896094E8]();
}

uint64_t nw_endpoint_copy_ech_config()
{
  return MEMORY[0x1896094F0]();
}

uint64_t nw_endpoint_copy_original_endpoint()
{
  return MEMORY[0x1896094F8]();
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x189609500]();
}

uint64_t nw_endpoint_copy_proxy_original_endpoint()
{
  return MEMORY[0x189609508]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x189609538](endpoint);
}

uint64_t nw_endpoint_get_bonjour_fullname()
{
  return MEMORY[0x189609548]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x189609558](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x189609568]();
}

uint64_t nw_endpoint_get_srv_name()
{
  return MEMORY[0x189609578]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x189609580](endpoint);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x189609610]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x189609618]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x189609620]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x189609630]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x189609638]();
}

uint64_t nw_frame_array_insert_after()
{
  return MEMORY[0x189609648]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x189609650]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x189609668]();
}

uint64_t nw_frame_array_prepend_array()
{
  return MEMORY[0x189609678]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x189609680]();
}

uint64_t nw_frame_array_unclaimed_length()
{
  return MEMORY[0x189609688]();
}

uint64_t nw_frame_buffer_get_manager()
{
  return MEMORY[0x189609690]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1896096A8]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1896096B0]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1896096C0]();
}

uint64_t nw_frame_create_external()
{
  return MEMORY[0x1896096C8]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1896096D0]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1896096E0]();
}

uint64_t nw_frame_get_buffer_manager_with_context()
{
  return MEMORY[0x1896096E8]();
}

uint64_t nw_frame_get_external_data()
{
  return MEMORY[0x1896096F0]();
}

uint64_t nw_frame_is_wake_packet()
{
  return MEMORY[0x189609708]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x189609710]();
}

uint64_t nw_frame_set_buffer_used_malloc()
{
  return MEMORY[0x189609718]();
}

uint64_t nw_frame_set_buffer_used_manager()
{
  return MEMORY[0x189609720]();
}

uint64_t nw_frame_set_external_data()
{
  return MEMORY[0x189609728]();
}

uint64_t nw_frame_set_is_wake_packet()
{
  return MEMORY[0x189609730]();
}

uint64_t nw_frame_set_metadata()
{
  return MEMORY[0x189609738]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x189609748]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x189609750]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x189609760]();
}

uint64_t nw_frame_uses_external_data()
{
  return MEMORY[0x189609768]();
}

uint64_t nw_mem_buffer_allocate()
{
  return MEMORY[0x189609928]();
}

uint64_t nw_mem_buffer_free()
{
  return MEMORY[0x189609930]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x189609998]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1896099A0](parameters);
}

uint64_t nw_parameters_copy_protocol_options_legacy()
{
  return MEMORY[0x1896099D0]();
}

nw_parameters_attribution_t nw_parameters_get_attribution(nw_parameters_t parameters)
{
  return MEMORY[0x189609A20](parameters);
}

uint64_t nw_parameters_get_enable_tls_keylog()
{
  return MEMORY[0x189609A50]();
}

uint64_t nw_parameters_get_is_probe()
{
  return MEMORY[0x189609A68]();
}

uint64_t nw_parameters_get_logging_disabled()
{
  return MEMORY[0x189609A70]();
}

uint64_t nw_parameters_get_sensitive_redacted_for_endpoint()
{
  return MEMORY[0x189609A98]();
}

uint64_t nw_parameters_get_server_mode()
{
  return MEMORY[0x189609AA0]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x189609FF8]();
}

uint64_t nw_protocol_copy_quic_stream_definition()
{
  return MEMORY[0x18960A008]();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x18960A018]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x18960A020]();
}

uint64_t nw_protocol_definition_create_with_identifier()
{
  return MEMORY[0x18960A080]();
}

BOOL nw_protocol_definition_is_equal( nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x18960A088](definition1, definition2);
}

uint64_t nw_protocol_definition_set_cache_entry_deallocator()
{
  return MEMORY[0x18960A090]();
}

uint64_t nw_protocol_definition_set_metadata_allocator()
{
  return MEMORY[0x18960A130]();
}

uint64_t nw_protocol_definition_set_options_allocator()
{
  return MEMORY[0x18960A140]();
}

uint64_t nw_protocol_definition_set_options_comparator()
{
  return MEMORY[0x18960A148]();
}

uint64_t nw_protocol_definition_set_options_equality_check()
{
  return MEMORY[0x18960A150]();
}

uint64_t nw_protocol_establishment_report_create()
{
  return MEMORY[0x18960A1C8]();
}

uint64_t nw_protocol_metadata_access_handle()
{
  return MEMORY[0x18960A408]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x18960A430]();
}

uint64_t nw_protocol_options_access_handle()
{
  return MEMORY[0x18960A480]();
}

nw_protocol_definition_t nw_protocol_options_copy_definition(nw_protocol_options_t options)
{
  return (nw_protocol_definition_t)MEMORY[0x18960A490](options);
}

uint64_t nw_protocol_options_get_log_id_str()
{
  return MEMORY[0x18960A4A0]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x18960A4C0]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x18960A500]();
}

uint64_t nw_protocol_stack_copy_original_proxied_transport_protocol()
{
  return MEMORY[0x18960A530]();
}

nw_protocol_options_t nw_protocol_stack_copy_transport_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x18960A538](stack);
}

uint64_t nw_queue_activate_source()
{
  return MEMORY[0x18960A5E0]();
}

uint64_t nw_queue_cancel_source()
{
  return MEMORY[0x18960A5E8]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x18960A5F0]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x18960A600]();
}

uint64_t nw_queue_context_create_source()
{
  return MEMORY[0x18960A608]();
}

uint64_t nw_queue_set_timer_values()
{
  return MEMORY[0x18960A620]();
}

uint64_t nw_settings_get_signposts_enabled()
{
  return MEMORY[0x18960AA78]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1895FCAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB18](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

uint64_t sec_array_append()
{
  return MEMORY[0x18960BE98]();
}

uint64_t sec_array_apply()
{
  return MEMORY[0x18960BEA0]();
}

uint64_t sec_array_create()
{
  return MEMORY[0x18960BEA8]();
}

uint64_t sec_array_get_count()
{
  return MEMORY[0x18960BEB0]();
}

SecCertificateRef sec_certificate_copy_ref(sec_certificate_t certificate)
{
  return (SecCertificateRef)MEMORY[0x18960BEB8](certificate);
}

sec_certificate_t sec_certificate_create(SecCertificateRef certificate)
{
  return (sec_certificate_t)MEMORY[0x18960BEC0](certificate);
}

CFArrayRef sec_identity_copy_certificates_ref(sec_identity_t identity)
{
  return (CFArrayRef)MEMORY[0x18960BED0](identity);
}

SecIdentityRef sec_identity_copy_ref(sec_identity_t identity)
{
  return (SecIdentityRef)MEMORY[0x18960BED8](identity);
}

uint64_t sec_protocol_helper_ciphersuite_group_to_ciphersuite_list()
{
  return MEMORY[0x18960BF18]();
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version( sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x18960BFA8](metadata);
}

uint64_t sec_protocol_options_contents_compare()
{
  return MEMORY[0x18960C010]();
}

BOOL sec_protocol_options_get_enable_encrypted_client_hello(sec_protocol_options_t options)
{
  return MEMORY[0x18960C030](options);
}

BOOL sec_protocol_options_get_quic_use_legacy_codepoint(sec_protocol_options_t options)
{
  return MEMORY[0x18960C038](options);
}

sec_trust_t sec_trust_create(SecTrustRef trust)
{
  return (sec_trust_t)MEMORY[0x18960C170](trust);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1895FD088](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

xpc_object_t xpc_array_get_array(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD7F0](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1895FD848](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDA70](object);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1895FDB10](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1895FDD88](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1895FE070](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}