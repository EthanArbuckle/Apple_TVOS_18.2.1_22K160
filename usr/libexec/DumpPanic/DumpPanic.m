uint64_t ccaes_arm_encrypt_cbc(uint64_t result, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  BOOL v15;
  int8x16_t v17;
  if (a3)
  {
    v5 = *(unsigned int *)(result + 240);
    if ((_DWORD)v5 == 160 || (_DWORD)v5 == 192 || (_DWORD)v5 == 224)
    {
      do
      {
        v6 = v5 - 16;
        a4 += 16LL;
        _Q2 = *(int8x16_t *)result;
        v7 = (int8x16_t *)(result + 16);
        do
        {
          __asm
          {
            AESE            V0.16B, V2.16B
            AESMC           V0.16B, V0.16B
          }

          _Q2 = *v7++;
          v15 = v6 <= 16;
          v6 -= 16LL;
        }

        while (!v15);
        __asm { AESE            V0.16B, V2.16B }

        v17 = veorq_s8(_Q0, *v7);
        result = (uint64_t)v7->i64 - v5;
        *a5++ = v17;
        v15 = a3-- <= 1;
      }

      while (!v15);
      result = 0LL;
      *a2 = v17;
    }

    else
    {
      return -1LL;
    }
  }

  return result;
}

uint64_t ccentropy_rng_init(void *a1, uint64_t a2)
{
  BOOL v5 = timingsafe_enable_if_supported();
  *a1 = &off_1000307F8;
  a1[1] = a2;
  cc_disable_dit_with_sb((unsigned int *)&v5);
  return 0LL;
}

uint64_t sub_100002288(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t sub_1000022A0(unint64_t *a1, uint64_t a2, int a3, int a4)
{
  v4 = &byte_100026100;
  *(_DWORD *)(a2 + 240) = 16 * a4;
  if (a3 == 6)
  {
    unint64_t v15 = *a1;
    unint64_t v16 = a1[1];
    v14 = (uint64_t *)(a1 + 2);
    *(void *)a2 = v15;
    *(void *)(a2 + 8) = v16;
    v17 = (uint64_t *)(a2 + 16);
    uint64_t v18 = *v14;
    uint64_t *v17 = *v14;
    v19 = (unint64_t *)(v17 + 1);
    int v20 = 4 * a4 - 2;
    do
    {
      HIDWORD(v21) = HIDWORD(v18);
      LODWORD(v21) = HIDWORD(v18);
      unsigned int v22 = *v4++;
      uint64_t result = v22;
      uint64_t v23 = (byte_10002610C[BYTE5(v18)] | (byte_10002610C[(v21 >> 8) >> 24] << 24) | (byte_10002610C[((v21 >> 8) >> 16)] << 16) | (byte_10002610C[(unsigned __int16)(HIDWORD(v18) >> 8) >> 8] << 8)) ^ v22;
      v15 ^= v23 ^ ((v15 ^ v23) << 32);
      v16 ^= HIDWORD(v15) ^ ((v16 ^ HIDWORD(v15)) << 32);
      v18 ^= HIDWORD(v16) ^ ((v18 ^ HIDWORD(v16)) << 32);
      unint64_t *v19 = v15;
      v19[1] = v16;
      v24 = v19 + 2;
      void *v24 = v18;
      v19 = v24 + 1;
      BOOL v13 = __OFSUB__(v20, 6);
      v20 -= 6;
    }

    while (!((v20 < 0) ^ v13 | (v20 == 0)));
  }

  else if (a3 == 8)
  {
    unint64_t v26 = *a1;
    unint64_t v27 = a1[1];
    v25 = a1 + 2;
    *(void *)a2 = v26;
    *(void *)(a2 + 8) = v27;
    v28 = (unint64_t *)(a2 + 16);
    unint64_t v29 = *v25;
    unint64_t v30 = v25[1];
    unint64_t *v28 = *v25;
    v28[1] = v30;
    v31 = v28 + 2;
    int v32 = 4 * a4 - 4;
    do
    {
      HIDWORD(v33) = HIDWORD(v30);
      LODWORD(v33) = HIDWORD(v30);
      unsigned int v34 = *v4++;
      uint64_t result = v34;
      uint64_t v35 = (byte_10002610C[BYTE5(v30)] | (byte_10002610C[(v33 >> 8) >> 24] << 24) | (byte_10002610C[((v33 >> 8) >> 16)] << 16) | (byte_10002610C[(unsigned __int16)(HIDWORD(v30) >> 8) >> 8] << 8)) ^ v34;
      v26 ^= v35 ^ ((v26 ^ v35) << 32);
      v27 ^= HIDWORD(v26) ^ ((v27 ^ HIDWORD(v26)) << 32);
      unint64_t *v31 = v26;
      v31[1] = v27;
      v36 = v31 + 2;
      int v37 = v32 - 4;
      if (!v37) {
        break;
      }
      uint64_t result = byte_10002610C[HIBYTE(HIDWORD(v27))];
      uint64_t v38 = byte_10002610C[BYTE4(v27)] | ((_DWORD)result << 24) | (byte_10002610C[BYTE6(v27)] << 16) | (byte_10002610C[BYTE5(v27)] << 8);
      v29 ^= v38 ^ ((v29 ^ v38) << 32);
      v30 ^= HIDWORD(v29) ^ ((v30 ^ HIDWORD(v29)) << 32);
      unint64_t *v36 = v29;
      v36[1] = v30;
      v31 = v36 + 2;
      BOOL v13 = __OFSUB__(v37, 4);
      int v32 = v37 - 4;
    }

    while (!((v32 < 0) ^ v13 | (v32 == 0)));
  }

  else
  {
    unint64_t v5 = *a1;
    unint64_t v6 = a1[1];
    *(void *)a2 = *a1;
    *(void *)(a2 + 8) = v6;
    v7 = (unint64_t *)(a2 + 16);
    int v8 = 4 * a4;
    do
    {
      HIDWORD(v9) = HIDWORD(v6);
      LODWORD(v9) = HIDWORD(v6);
      unsigned int v11 = *v4++;
      uint64_t result = v11;
      uint64_t v12 = (byte_10002610C[BYTE5(v6)] | (byte_10002610C[(v9 >> 8) >> 24] << 24) | (byte_10002610C[((v9 >> 8) >> 16)] << 16) | (byte_10002610C[(unsigned __int16)(HIDWORD(v6) >> 8) >> 8] << 8)) ^ v11;
      v5 ^= v12 ^ ((v5 ^ v12) << 32);
      v6 ^= HIDWORD(v5) ^ ((v6 ^ HIDWORD(v5)) << 32);
      unint64_t *v7 = v5;
      v7[1] = v6;
      v7 += 2;
      BOOL v13 = __OFSUB__(v8, 4);
      v8 -= 4;
    }

    while (!((v8 < 0) ^ v13 | (v8 == 0)));
  }

  return result;
}

uint64_t ccaes_arm_encrypt_key128(unint64_t *a1, uint64_t a2)
{
  return sub_1000022A0(a1, a2, 4, 10);
}

uint64_t ccaes_arm_encrypt_key192(unint64_t *a1, uint64_t a2)
{
  return sub_1000022A0(a1, a2, 6, 12);
}

uint64_t ccaes_arm_encrypt_key256(unint64_t *a1, uint64_t a2)
{
  return sub_1000022A0(a1, a2, 8, 14);
}

__n128 sub_1000024C0(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  v4 = (__n128 *)(a2 + 16);
  uint64_t v5 = a4 - 1;
  do
  {
    --v5;
    _Q0 = *v4;
    __asm { AESIMC          V0.16B, V0.16B }

    *v4++ = result;
  }

  while (!(_NF ^ _VF | _ZF));
  return result;
}

double ccaes_arm_decrypt_key128(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = sub_1000024C0(a1, a2, 4, 10LL).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key192(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = sub_1000024C0(a1, a2, 6, 12LL).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key256(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = sub_1000024C0(a1, a2, 8, 14LL).n128_u64[0];
  return result;
}

uint64_t ccaes_arm_encrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_encrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_encrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_encrypt_key256(a4, v6);
      break;
    default:
      return -1LL;
  }

  return 0LL;
}

uint64_t ccaes_arm_decrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_decrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_decrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_decrypt_key256(a4, v6);
      break;
    default:
      return -1LL;
  }

  return 0LL;
}

uint64_t *ccrng_prng(_DWORD *a1)
{
  BOOL v3 = timingsafe_enable_if_supported();
  pthread_once(&stru_100035A50, (void (*)(void))sub_100002698);
  if (a1) {
    *a1 = 0;
  }
  cc_disable_dit_with_sb((unsigned int *)&v3);
  return &qword_100035B50;
}

uint64_t sub_100002698()
{
  if (ccrng_process_init( (uint64_t)&off_100035B60,  sub_10000272C,  (uint64_t (**)(void, uint64_t, _OWORD *))&ccrng_getentropy)) {
    cc_abort();
  }
  uint64_t result = pthread_atfork((void (*)(void))sub_100002774, (void (*)(void))sub_1000027A0, (void (*)(void))sub_1000027CC);
  if ((_DWORD)result) {
    cc_abort();
  }
  qword_100035B50 = (uint64_t)sub_1000027F8;
  return result;
}

uint64_t *ccrng(_DWORD *a1)
{
  return &qword_100035B50;
}

uint64_t sub_10000272C()
{
  v1.tv_sec = 0LL;
  v1.tv_nsec = 0LL;
  if (clock_gettime(_CLOCK_MONOTONIC, &v1)) {
    cc_abort();
  }
  return v1.tv_nsec + 1000000000 * v1.tv_sec;
}

uint64_t sub_100002774()
{
  uint64_t result = ccrng_process_atfork_prepare((os_unfair_lock_s *)&off_100035B60);
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_1000027A0()
{
  uint64_t result = ccrng_process_atfork_parent((os_unfair_lock_s *)&off_100035B60);
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_1000027CC()
{
  uint64_t result = ccrng_process_atfork_child((uint64_t)&off_100035B60);
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_1000027F8()
{
  uint64_t result = off_100035B60();
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t sub_100002828(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289LL;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }

  return 4294967289LL;
}

uint64_t ccec_mult_blinded_ws( uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v10 = *a2;
  unint64_t v11 = ccn_bitlen_internal(*a2, a4);
  uint64_t v17 = 1LL;
  if (a6)
  {
    uint64_t result = (*a6)(a6, 8LL, &v17);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v13 = v17 | 0x80000000LL;
  }

  else
  {
    uint64_t v13 = 2147483649LL;
  }

  uint64_t v17 = v13;
  uint64_t v14 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v10);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v10);
  ccn_mux_seed_mask(v17);
  uint64_t v17 = v17;
  uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    uint64_t v16 = 0LL;
    ccn_divmod_ws(a1, v10, a4, v10, v15, 1LL, (char *)&v16, (uint64_t)&v17);
    cczp_bitlen((uint64_t)a2);
    uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
    if (!(_DWORD)result)
    {
      uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
      if (!(_DWORD)result)
      {
        ccec_full_add_ws(a1, (uint64_t)a2);
        uint64_t result = 0LL;
      }
    }
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t sub_100002A48(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289LL;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }

  return 4294967289LL;
}

uint64_t ccecdh_compute_shared_secret_ws( uint64_t a1, unint64_t **a2, unint64_t **a3, unint64_t *a4, char *a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v11 = *a2;
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v12 = 3 * **a2;
  uint64_t v13 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v15 = *a4;
  *a4 = 0LL;
  unint64_t v16 = ccn_write_uint_size_internal(*v11, v11 + 3);
  if (v15 < v16
    || *a2 != *a3
    || (unint64_t v17 = v16,
        ccec_validate_point_and_projectify_ws(a1, (uint64_t *)v11, (uint64_t)v14, (uint64_t)(a3 + 2)))
    || ccec_validate_scalar(v11, (uint64_t)&a2[3 * **a2 + 2])
    || ccec_mult_blinded_ws(a1, v11, (uint64_t)v13, (uint64_t)&a2[3 * **a2 + 2], (uint64_t)v14, a6)
    || !ccec_is_point_projective_ws(a1, v11)
    || ccec_affinify_x_only_ws(a1, (uint64_t *)v11, (uint64_t)v13, (uint64_t)v13))
  {
    uint64_t v18 = 0xFFFFFFFFLL;
  }

  else
  {
    ccn_write_uint_padded_ct_internal(*v11, v13, v17, a5);
    uint64_t v18 = 0LL;
    *a4 = v17;
  }

  cc_clear(24 * *v11, v13);
  cc_clear(24 * *v11, v14);
  *(void *)(a1 + 16) = v21;
  return v18;
}

void *ccaes_cbc_encrypt_mode()
{
  return &ccaes_arm_cbc_encrypt_mode;
}

uint64_t ccec_generate_scalar_fips_retry_ws( uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *), void *a4)
{
  unint64_t v8 = a2 + 4;
  uint64_t v9 = (uint64_t)&a2[5 * *a2 + 4];
  uint64_t v10 = cczp_n(v9);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  uint64_t v13 = (void *)cczp_prime(v9);
  ccn_set(v10, v12, v13);
  *v12 &= ~1uLL;
  uint64_t v14 = 100LL;
  while (1)
  {
    uint64_t v15 = cczp_bitlen((uint64_t)&v8[5 * *a2]);
    uint64_t result = ccn_random_bits_fips(v15, a4, a3);
    if ((_DWORD)result) {
      break;
    }
    if ((ccn_cmp_internal(v10, a4, v12) & 0x80000000) != 0)
    {
      ccn_add1_ws(a1, v10, a4, a4, 1LL);
      uint64_t result = 0LL;
      break;
    }

    if (!--v14)
    {
      uint64_t result = 4294967281LL;
      break;
    }
  }

  *(void *)(a1 + 16) = v11;
  return result;
}

uint64_t ccn_cond_swap(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555LL, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v10 = *a4 ^ *a3;
    *a3 ^= result;
    uint64_t v11 = *a4 ^ result;
    *a4 = v11;
    uint64_t v12 = *a3 ^ v10 & 0x5555555555555555LL;
    uint64_t v13 = v11 ^ v10 & 0x5555555555555555LL;
    uint64_t v14 = v10 & i;
    *a3++ = v12 ^ v14 ^ result;
    *a4++ = v13 ^ v14 ^ result;
  }

  return result;
}

uint64_t *ccaes_ctr_crypt_mode()
{
  unint64_t v0 = ((*(void *)ccaes_ecb_encrypt_mode() + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 48;
  timespec v1 = ccaes_ecb_encrypt_mode();
  qword_1000364A0 = v0;
  unk_1000364A8 = xmmword_100026210;
  qword_1000364B8 = (uint64_t)ccmode_ctr_init;
  unk_1000364C0 = ccmode_ctr_setctr;
  qword_1000364C8 = (uint64_t)ccaes_vng_ctr_crypt;
  unk_1000364D0 = v1;
  return &qword_1000364A0;
}

void *ccaes_ecb_encrypt_mode()
{
  return &ccaes_arm_ecb_encrypt_mode;
}

uint64_t ccrng_schedule_read(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8)) {
    return 3LL;
  }
  uint64_t result = (**(uint64_t (***)(uint64_t))a1)(a1);
  *(_BYTE *)(a1 + 8) = (_DWORD)result == 3;
  return result;
}

uint64_t ccrng_schedule_notify_reseed(_BYTE *a1)
{
  a1[8] = 0;
  return (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 8LL))(a1);
}

uint64_t ccrng_schedule_atomic_flag_init(uint64_t result)
{
  *(void *)uint64_t result = off_100030868;
  *(_BYTE *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 1;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_set(uint64_t result)
{
  *(_DWORD *)(result + 16) = 3;
  return result;
}

uint64_t ccrng_schedule_timer_init(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  *(void *)a1 = off_100030878;
  *(_BYTE *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  uint64_t result = a2();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_init(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = off_100030888;
  *(_BYTE *)(result + 8) = 0;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  return result;
}

uint64_t sub_100002F2C(uint64_t a1)
{
  timespec v1 = (unsigned int *)(a1 + 16);
  do
    uint64_t result = __ldxr(v1);
  while (__stxr(1u, v1));
  return result;
}

uint64_t sub_100002F48(uint64_t a1)
{
  else {
    return 3LL;
  }
}

uint64_t sub_100002F80(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 16))();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_100002FA8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v2 + 8))
  {
    unsigned int v3 = 3;
  }

  else
  {
    unsigned int v3 = (**(uint64_t (***)(void))v2)(*(void *)(a1 + 16));
    *(_BYTE *)(v2 + 8) = v3 == 3;
  }

  uint64_t v4 = *(void *)(a1 + 24);
  if (*(_BYTE *)(v4 + 8))
  {
    LODWORD(result) = 3;
  }

  else
  {
    LODWORD(result) = (**(uint64_t (***)(uint64_t))v4)(v4);
    *(_BYTE *)(v4 + 8) = (_DWORD)result == 3;
  }

  else {
    return v3;
  }
}

uint64_t sub_100003038(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 16);
  v2[8] = 0;
  (*(void (**)(_BYTE *))(*(void *)v2 + 8LL))(v2);
  unsigned int v3 = *(_BYTE **)(a1 + 24);
  v3[8] = 0;
  return (*(uint64_t (**)(_BYTE *))(*(void *)v3 + 8LL))(v3);
}

uint64_t ccn_n_asm(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0LL;
    unint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = *a2++;
      ++v3;
      if (v4) {
        uint64_t result = v3;
      }
    }

    while (v3 < v2);
  }

  return result;
}

uint64_t ccaes_vng_ctr_crypt( void *a1, unint64_t a2, int8x16_t *a3, int8x16_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a1[1];
  if (a2)
  {
    unint64_t v10 = a2;
    uint64_t v11 = *a1;
    unint64_t v12 = (unint64_t)(*(void *)(*a1 + 8LL) + 7LL) >> 3;
    uint64_t v13 = a1 + 2;
    uint64_t v14 = (int8x16_t *)&a1[2 * v12 + 2];
    uint64_t v15 = (int8x16_t *)&a1[v12 + 2];
    unint64_t v16 = &a1[v12];
    while (1)
    {
      if (v7 == 16)
      {
        if (v10 >= 0x10)
        {
          aes_ctr_crypt(a3, a4, v10 & 0xFFFFFFFFFFFFFFF0LL, v15, v14, a6);
          a4 = (int8x16_t *)((char *)a4 + (v10 & 0xFFFFFFFFFFFFFFF0LL));
          a3 = (int8x16_t *)((char *)a3 + (v10 & 0xFFFFFFFFFFFFFFF0LL));
          v10 &= 0xFu;
        }

        (*(void (**)(int8x16_t *, uint64_t, int8x16_t *, void *))(v11 + 24))(v14, 1LL, v15, a1 + 2);
        uint64_t v17 = 31LL;
        do
        {
          __int16 v18 = (*((_BYTE *)v16 + v17--))++ + 1;
        }

        while ((v18 & 0x100) != 0);
        uint64_t v7 = 0LL;
        uint64_t v19 = 0LL;
        if (!v10) {
          break;
        }
      }

      uint64_t v20 = 0LL;
      do
      {
        uint64_t v21 = v20 + 1;
        a4->i8[v20] = *((_BYTE *)v13 + v7 + v20) ^ a3->i8[v20];
        BOOL v22 = (unint64_t)(v20 + 1 + v7) > 0xF || v10 - 1 == v20;
        ++v20;
      }

      while (!v22);
      v7 += v21;
      a3 = (int8x16_t *)((char *)a3 + v21);
      a4 = (int8x16_t *)((char *)a4 + v21);
      v10 -= v21;
      if (!v10) {
        goto LABEL_17;
      }
    }
  }

  else
  {
LABEL_17:
    uint64_t v19 = v7;
  }

  a1[1] = v19;
  return 0LL;
}

void *cczp_to_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);
  return ccn_set(v6, a3, a4);
}

uint64_t cczp_to_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 56LL))();
}

void cc_try_abort()
{
}

uint64_t cc_try_abort_if (uint64_t result)
{
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t sizeof_struct_ccec_full_ctx()
{
  return 16LL;
}

unint64_t cczp_negate(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = cczp_n(a1);
  BOOL v7 = ccn_n(v6, a3) != 0;
  unint64_t v8 = (uint64_t *)cczp_prime(a1);
  return ccn_cond_rsub(v6, v7, a2, a3, v8);
}

unint64_t cczp_cond_negate(uint64_t a1, unsigned __int8 a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v8 = cczp_n(a1);
  uint64_t v9 = (ccn_n(v8, a4) != 0) & a2;
  unint64_t v10 = (uint64_t *)cczp_prime(a1);
  return ccn_cond_rsub(v8, v9, a3, a4, v10);
}

void *cczp_from_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);
  return ccn_set(v6, a3, a4);
}

uint64_t cczp_from_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 64LL))();
}

unint64_t ccn_mul1_asm(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0LL;
  if ((a1 & 1) != 0)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4) >> 64;
    *a2++ = v5 * a4;
    --a1;
  }

  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned __int128 v8 = v6 * (unsigned __int128)a4 + __PAIR128__(v7 * a4, v4);
    unint64_t v4 = (__CFADD__(__CFADD__(v6 * a4, v4), (v6 * (unsigned __int128)a4) >> 64) | __CFADD__( v7 * a4,  *((void *)&v8 + 1)))
       + ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v8;
    a2 += 2;
    a1 -= 2LL;
  }

  while (1)
  {
    BOOL v9 = a1 < 4;
    a1 -= 4LL;
    if (v9) {
      break;
    }
    unint64_t v11 = *a3;
    unint64_t v12 = a3[1];
    unint64_t v10 = a3 + 2;
    unint64_t v14 = *v10;
    unint64_t v15 = v10[1];
    a3 = v10 + 2;
    uint64_t v16 = (v12 * (unsigned __int128)a4) >> 64;
    BOOL v17 = __CFADD__(__CFADD__(v11 * a4, v4), (v11 * (unsigned __int128)a4) >> 64);
    unsigned __int128 v13 = v11 * (unsigned __int128)a4 + __PAIR128__(v12 * a4, v4);
    *(_OWORD *)a2 = v13;
    __int16 v18 = a2 + 2;
    uint64_t v19 = (v14 * (unsigned __int128)a4) >> 64;
    uint64_t v20 = v16 + (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4;
    uint64_t v22 = __CFADD__(v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1)), v14 * a4) | __CFADD__(v16, (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4);
    BOOL v17 = __CFADD__(v22, v19);
    uint64_t v21 = v22 + v19;
    unint64_t v4 = (v17 | __CFADD__(v15 * a4, v21)) + ((v15 * (unsigned __int128)a4) >> 64);
    *__int16 v18 = v20;
    v18[1] = v15 * a4 + v21;
    a2 = v18 + 2;
  }

  return v4;
}

uint64_t ccdigest_internal(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  size_t v8 = (*(void *)(a1 + 8) + *(void *)(a1 + 16) + 19LL) & 0xFFFFFFFFFFFFFFF8LL;
  BOOL v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v9, v8);
  ccdigest_init_internal(a1, v9);
  ccdigest_update_internal((unint64_t *)a1, v9, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v9, a4);
  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12LL, v9);
}

uint64_t ccdigest(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  BOOL v9 = timingsafe_enable_if_supported();
  ccdigest_internal(a1, a2, a3, a4);
  return cc_disable_dit_with_sb((unsigned int *)&v9);
}

uint64_t ccdigest_final_64be(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = (uint64_t)a2 + v7 + 8;
  size_t v9 = (v7 + v6 + 19) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  bzero(v10, v9);
  memcpy(v10, a2, v7 + v6 + 12);
  uint64_t v11 = (char *)v10 + v7;
  uint64_t v12 = (uint64_t)v10 + v7 + 8;
  unsigned __int128 v13 = (char *)(v12 + v6);
  uint64_t v14 = *(unsigned int *)(v12 + v6);
  *v10 += (8 * v14);
  *(_DWORD *)(v12 + v6) = v14 + 1;
  *(_BYTE *)(v12 + v14) = 0x80;
  unint64_t v15 = *(unsigned int *)(v12 + v6);
  if (v15 < 0x39)
  {
    if (v15 == 56) {
      goto LABEL_9;
    }
  }

  else
  {
    if (v15 <= 0x3F)
    {
      do
      {
        *(_DWORD *)unsigned __int128 v13 = v15 + 1;
        *(_BYTE *)(v12 + v15) = 0;
        unint64_t v15 = *(unsigned int *)v13;
      }

      while (v15 < 0x40);
    }

    (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1LL);
    unint64_t v15 = 0LL;
    uint64_t v11 = (char *)v10 + *(void *)(a1 + 8);
    uint64_t v12 = (uint64_t)(v11 + 8);
    unsigned __int128 v13 = &v11[*(void *)(a1 + 16) + 8];
    *(_DWORD *)unsigned __int128 v13 = 0;
  }

  do
  {
    *(_DWORD *)unsigned __int128 v13 = v15 + 1;
    *(_BYTE *)(v12 + v15) = 0;
    unint64_t v15 = *(unsigned int *)v13;
  }

  while (v15 < 0x38);
LABEL_9:
  *((void *)v11 + 8) = bswap64(*v10);
  (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1LL);
  if (*(void *)a1 >= 4uLL)
  {
    unsigned int v16 = 0;
    unint64_t v17 = 0LL;
    unsigned int v18 = 1;
    do
    {
      *(_DWORD *)(a3 + v16) = bswap32(*((_DWORD *)v10 + v17 + 2));
      unint64_t v17 = v18++;
      v16 += 4;
    }

    while (v17 < *(void *)a1 >> 2);
  }

  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12LL, v10);
}

void *ccdigest_init_internal(uint64_t a1, void *a2)
{
  uint64_t result = memcpy(a2 + 1, *(const void **)(a1 + 40), *(void *)(a1 + 8));
  *a2 = 0LL;
  *(_DWORD *)((char *)a2 + *(void *)(a1 + 8) + *(void *)(a1 + 16) + 8) = 0;
  return result;
}

unint64_t *ccdigest_update_internal(unint64_t *result, void *a2, size_t a3, char *__src)
{
  size_t v5 = a3;
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  uint64_t v9 = (uint64_t)a2 + result[1] + 8;
  if (a3)
  {
    unint64_t v10 = a2 + 1;
    do
    {
      size_t v11 = v7[2];
      uint64_t v12 = (char *)v10 + v7[1];
      uint64_t v13 = *(unsigned int *)&v12[v11];
      if (v5 > v11 && (_DWORD)v13 == 0)
      {
        if (v11 == 128)
        {
          size_t v22 = v5 >> 7;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFF80LL;
        }

        else if (v11 == 64)
        {
          size_t v22 = v5 >> 6;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFFC0LL;
        }

        else
        {
          size_t v22 = v5 / v11;
          size_t v16 = v5 / v11 * v11;
        }

        uint64_t result = (unint64_t *)((uint64_t (*)(void *, size_t, char *))v7[6])(a2 + 1, v22, __src);
        *a2 += 8 * v16;
      }

      else
      {
        size_t v15 = v11 - v13;
        if (v15 >= v5) {
          size_t v16 = v5;
        }
        else {
          size_t v16 = v15;
        }
        uint64_t result = (unint64_t *)memcpy(&v12[v13], __src, v16);
        unint64_t v17 = v7[2];
        unsigned int v18 = (char *)v10 + v7[1];
        uint64_t v19 = (*(_DWORD *)&v18[v17] + v16);
        *(_DWORD *)&v18[v17] = v19;
        if (v17 == v19)
        {
          uint64_t result = (unint64_t *)((uint64_t (*)(void *, uint64_t))v7[6])(a2 + 1, 1LL);
          unint64_t v20 = v7[2];
          uint64_t v21 = (char *)v10 + v7[1];
          *a2 += (8 * *(_DWORD *)&v21[v20]);
          *(_DWORD *)&v21[v20] = 0;
        }
      }

      __src += v16;
      v5 -= v16;
    }

    while (v5);
  }

  return result;
}

void *ccdrbg_factory_nistctr(void *result, uint64_t a2)
{
  *uint64_t result = 88LL;
  result[1] = sub_1000038F0;
  result[2] = sub_100003D30;
  result[3] = sub_100003AEC;
  result[4] = sub_100003E78;
  result[5] = a2;
  result[6] = sub_100003EB4;
  return result;
}

uint64_t sub_1000038F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v13 = *(uint64_t **)(a1 + 40);
  cc_clear(0x58uLL, (void *)a2);
  uint64_t v19 = *v13;
  rsize_t v20 = v13[1];
  *(void *)(a2 + 56) = *v13;
  *(void *)(a2 + 64) = v20;
  *(_DWORD *)(a2 + 72) = *((_DWORD *)v13 + 4);
  uint64_t v21 = v13[3];
  *(void *)(a2 + 80) = v21;
  if (v20 >= 0x21 || *(void *)(v19 + 16) != 16LL) {
    cc_try_abort();
  }
  if (!v21)
  {
    if (v20 + 16 >= a7 && v20 + 16 == a3)
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 __s = 0u;
      __memcpy_chk(&__s, a4, a3, 48LL);
      for (; a7; --a7)
        *((_BYTE *)&v27 + a7 + 7) ^= *(_BYTE *)(a8 - 1 + a7);
      goto LABEL_8;
    }

    uint64_t v22 = 4294967233LL;
LABEL_16:
    cc_clear(0x20uLL, (void *)a2);
    cc_clear(0x10uLL, (void *)(a2 + 32));
    uint64_t v24 = -1LL;
    goto LABEL_9;
  }

  uint64_t v22 = 4294967233LL;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 __s = 0u;
  HIBYTE(v27) = HIBYTE(a8);
  uint64_t v23 = sub_100003ED8(a2, &__s, 3u, v14, v15, v16, v17, v18, a3);
  if ((_DWORD)v23)
  {
    uint64_t v22 = v23;
    goto LABEL_16;
  }

  rsize_t v20 = *(void *)(a2 + 64);
LABEL_8:
  cc_clear(v20, (void *)a2);
  cc_clear(0x10uLL, (void *)(a2 + 32));
  sub_100003F98(a2, (uint64_t)&__s);
  uint64_t v22 = 0LL;
  uint64_t v24 = 1LL;
LABEL_9:
  *(void *)(a2 + 48) = v24;
  cc_clear(0x30uLL, &__s);
  return v22;
}

uint64_t sub_100003AEC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  v25[0] = 0LL;
  v25[1] = 0LL;
  size_t v10 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0LL;
  size_t v11 = (char *)v24 - v10;
  bzero((char *)v24 - v10, v10);
  if (a2 > 0x10000) {
    goto LABEL_22;
  }
  if (*(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL)
  {
    uint64_t v18 = 4294967234LL;
    goto LABEL_21;
  }

  if (!a4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 80))
  {
    if (a4 <= 0x10000)
    {
      uint64_t v17 = sub_100003ED8(a1, __s, 1u, v12, v13, v14, v15, v16, a4);
      if ((_DWORD)v17)
      {
        uint64_t v18 = v17;
        goto LABEL_21;
      }

      goto LABEL_11;
    }

LABEL_22:
    uint64_t v18 = 4294967233LL;
    goto LABEL_21;
  }

  if (*(void *)(a1 + 64) + 16LL < a4) {
    goto LABEL_22;
  }
  cc_clear(0x30uLL, __s);
  __memcpy_chk(__s, a5, a4, 48LL);
LABEL_11:
  sub_100003F98(a1, (uint64_t)__s);
LABEL_12:
  v24[1] = v24;
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  for (uint64_t i = -(int)a2 & 0xFLL; a2; a2 -= v20)
  {
    if (a2 >= 0x80) {
      uint64_t v20 = 128LL;
    }
    else {
      uint64_t v20 = a2;
    }
    ccctr_update_internal(*(void *)(a1 + 56), (uint64_t)v11, v20, (uint64_t)&unk_100026220, a3);
    a3 += v20;
  }

  ccctr_update_internal(*(void *)(a1 + 56), (uint64_t)v11, i, (uint64_t)&unk_100026220, (uint64_t)v25);
  cc_clear(i, v25);
  if (a4) {
    uint64_t v21 = __s;
  }
  else {
    uint64_t v21 = &unk_100026220;
  }
  sub_10000405C(a1, (uint64_t)v11, (uint64_t)v21);
  rsize_t v22 = ccctr_context_size(*(void *)(a1 + 56));
  cc_clear(v22, v11);
  uint64_t v18 = 0LL;
  ++*(void *)(a1 + 48);
LABEL_21:
  cc_clear(0x30uLL, __s);
  return v18;
}

            ;
          }

          size_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

uint64_t sub_100003D30( void *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a4;
  memset(__s, 0, sizeof(__s));
  if (!a1[10])
  {
    unint64_t v14 = a1[8] + 16LL;
    if (v14 < a4 || v14 != a2) {
      return 4294967233LL;
    }
    __memcpy_chk(__s, a3, a2, 48LL);
    for (; v9; --v9)
      *((_BYTE *)&v16 + v9 + 7) ^= *(_BYTE *)(a5 - 1 + v9);
    goto LABEL_6;
  }

  uint64_t v11 = 4294967233LL;
  if (a2 <= 0x10000 && a4 <= 0x10000 && *(void *)(a1[7] + 16LL) <= a2)
  {
    HIBYTE(v16) = HIBYTE(a5);
    uint64_t v12 = sub_100003ED8((uint64_t)a1, __s, 2u, a4, a5, a6, a7, a8, a2);
    if ((_DWORD)v12)
    {
      uint64_t v11 = v12;
      goto LABEL_7;
    }

LABEL_6:
    sub_100003F98((uint64_t)a1, (uint64_t)__s);
    uint64_t v11 = 0LL;
    a1[6] = 1LL;
LABEL_7:
    cc_clear(a1[8] + 16LL, __s);
  }

  return v11;
}

uint64_t sub_100003E78(char *__s)
{
  uint64_t result = cc_clear(0x10uLL, __s + 32);
  *((void *)__s + 6) = -1LL;
  return result;
}

BOOL sub_100003EB4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL;
}

uint64_t sub_100003ED8( uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = &a9;
  if (a3)
  {
    uint64_t v10 = a3;
    uint64_t v11 = (uint64_t *)v16 + 1;
    uint64_t v12 = a3;
    do
    {
      uint64_t v13 = v15;
      *uint64_t v11 = *v15;
      v15 += 2;
      *(v11 - 1) = v13[1];
      v11 += 2;
      --v12;
    }

    while (v12);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return ccdrbg_df_derive_keys(*(uint64_t (***)(void))(a1 + 80), v10, (uint64_t)v16, *(void *)(a1 + 64) + 16LL, a2);
}

uint64_t sub_100003F98(uint64_t a1, uint64_t a2)
{
  size_t v4 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0LL;
  size_t v5 = (char *)&v8 - v4;
  bzero((char *)&v8 - v4, v4);
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  sub_10000405C(a1, (uint64_t)v5, a2);
  rsize_t v6 = ccctr_context_size(*(void *)(a1 + 56));
  return cc_clear(v6, v5);
}

uint64_t sub_10000405C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ccctr_update_internal(*(void *)(a1 + 56), a2, 16LL, a3 + *(void *)(a1 + 64), a1 + 32);
}

uint64_t ccec_affinify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccec_affinify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 80LL))();
}

uint64_t ccec_affinify_x_only_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  cczp_sqr_ws(a1, (uint64_t)a2);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccn_sqr_ws(uint64_t a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * a2);
  uint64_t result = ccn_mul1(a2 - 1, v9 + 8, a4 + 1, *a4);
  *(void *)(v9 + 8 * a2) = result;
  __int128 v11 = *a4;
  *a3 = *a4 * *a4;
  unint64_t v12 = *(void *)(v9 + 8);
  else {
    uint64_t v13 = v12 >> 63;
  }
  a3[1] = (__PAIR128__(2LL, v11) * v11) >> 64;
  unint64_t v14 = a2 - 2;
  if (a2 >= 2)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = v9 + 8 * a2 + 8;
    uint64_t v17 = (unint64_t *)(v9 + 24);
    uint64_t v18 = a3 + 3;
    do
    {
      uint64_t result = ccn_addmul1(v14, v17, &a4[v15 + 2], a4[v15 + 1]);
      *(void *)(v16 + v15 * 8) = result;
      unint64_t v19 = a4[v15 + 1];
      uint64_t v20 = (v19 * (unsigned __int128)v19) >> 64;
      unint64_t v21 = v19 * v19;
      BOOL v22 = __CFADD__(v21, v13);
      unint64_t v23 = v21 + v13;
      if (v22) {
        ++v20;
      }
      unint64_t v24 = *(v17 - 1);
      *(v18 - 1) = v23 + 2 * v24;
      unint64_t v25 = *v17;
      v17 += 2;
      uint64_t v26 = v25 >> 63;
      BOOL v22 = __CFADD__(v20, 2 * v25);
      uint64_t v27 = v20 + 2 * v25;
      if (v22) {
        uint64_t v28 = v26 + 1;
      }
      else {
        uint64_t v28 = v26;
      }
      BOOL v22 = __CFADD__(__CFADD__(v23, 2 * v24), v27) | __CFADD__(v24 >> 63, __CFADD__(v23, 2 * v24) + v27);
      unint64_t v29 = (v24 >> 63) + __CFADD__(v23, 2 * v24) + v27;
      if (v22) {
        uint64_t v13 = v28 + 1;
      }
      else {
        uint64_t v13 = v28;
      }
      *uint64_t v18 = v29;
      v18 += 2;
      ++v15;
      --v14;
    }

    while (v14 != -1LL);
  }

  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccn_p256_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

uint64_t ccec_double_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_export_pub(uint64_t *a1, char *a2)
{
  unint64_t v3 = (unint64_t *)(a1 + 2);
  uint64_t v4 = (unint64_t *)*a1;
  unint64_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
  return ccec_export_affine_point_public_value(v4, 1, v3, &v6, a2);
}

uint64_t ccec_add_normalized_ws(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9 = *a2;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  if (a6) {
    cczp_add_ws(a1, (uint64_t)a2);
  }
  else {
    cczp_sub_ws(a1, (uint64_t)a2);
  }
  if (ccn_n(v9, v10) || ccn_n(v9, v11))
  {
    if (ccn_n(v9, v10) || !ccn_n(v9, v11))
    {
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t result = cczp_div2_ws(a1, (uint64_t)a2, (int8x16_t *)&a3[v9], &a3[v9]);
    }

    else
    {
      ccn_seti(v9, a3, 1LL);
      cczp_to_ws(a1, (uint64_t)a2);
      ccn_set(v9, &a3[v9], a3);
      uint64_t result = cc_clear(8 * v9, &a3[2 * v9]);
    }
  }

  else
  {
    uint64_t result = ccec_double_ws(a1, a2);
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_full_add_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    ccn_set(v11, &a3[8 * *a2], &a5[8 * *a2]);
    uint64_t result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }

  else
  {
    uint64_t result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 0);
  }

  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_add_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = cczp_n((uint64_t)a2);
  uint64_t v16 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  sub_10000521C(a1, (uint64_t)a2);
  sub_10000521C(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  uint64_t v7 = cczp_n((uint64_t)a2);
  uint64_t v8 = *a2;
  uint64_t v9 = &a3[*a2];
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  ccn_set(v7, v10, v9);
  cczp_from_ws(a1, (uint64_t)a2);
  BOOL v12 = ccn_n(v7, v11) == 1 && *v11 == 1LL;
  uint64_t v13 = &a3[2 * v8];
  if (ccn_n(v7, a3)) {
    BOOL v12 = 0;
  }
  char v14 = v12 & (ccn_n(v7, v13) == 0);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  ccn_mux(v7, v14, a3, (uint64_t *)v10, a3);
  uint64_t result = ccn_mux(v7, v14, v9, (uint64_t *)v10, v9);
  *(void *)(a1 + 16) = v16;
  return result;
}

uint64_t sub_10000521C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = cczp_n(a2);
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  uint64_t result = cczp_mul_ws(a1, a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_full_add_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 88LL))();
}

int8x16_t *aes_ctr_crypt(int8x16_t *a1, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6)
{
  int v6 = a5[15].i32[0];
  BOOL v8 = __OFSUB__(a3, 128LL);
  BOOL v7 = a3 - 128 < 0;
  uint64_t v9 = a3 - 128;
  if (v7 != v8) {
    return sub_1000057CC(a1, a2, v9, a4, a5, a6, v6);
  }
  else {
    return (int8x16_t *)sub_100005380(a1, a2, v9, (uint64_t)a4, a5, a6, v6);
  }
}

uint64_t sub_100005380(_OWORD *a1, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6, int a7)
{
  do
  {
    int64x2_t v8 = vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, v8))));
    _Q20 = *a5;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[1];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[2];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[3];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[4];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[5];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[6];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[7];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[8];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[9];
    int8x16_t v167 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }

      _Q20 = a5[10];
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }

      _Q20 = a5[11];
      int8x16_t v167 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }

        _Q20 = a5[12];
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }

        _Q20 = a5[13];
        int8x16_t v167 = a5[14];
      }
    }

    int8x16_t v235 = *(int8x16_t *)a1;
    int8x16_t v236 = *((int8x16_t *)a1 + 1);
    int8x16_t v237 = *((int8x16_t *)a1 + 2);
    int8x16_t v238 = *((int8x16_t *)a1 + 3);
    v234 = a1 + 4;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESE            V23.16B, V20.16B
      AESE            V24.16B, V20.16B
      AESE            V25.16B, V20.16B
    }

    int8x16_t v243 = veorq_s8(v235, veorq_s8(_Q22, v167));
    int8x16_t v244 = veorq_s8(v236, veorq_s8(_Q23, v167));
    int8x16_t v245 = veorq_s8(v237, veorq_s8(_Q24, v167));
    int8x16_t v246 = veorq_s8(v238, veorq_s8(_Q25, v167));
    int8x16_t v247 = *(int8x16_t *)v234;
    int8x16_t v248 = *((int8x16_t *)v234 + 1);
    int8x16_t v249 = *((int8x16_t *)v234 + 2);
    int8x16_t v250 = *((int8x16_t *)v234 + 3);
    a1 = v234 + 4;
    __asm
    {
      AESE            V26.16B, V20.16B
      AESE            V27.16B, V20.16B
      AESE            V28.16B, V20.16B
      AESE            V29.16B, V20.16B
    }

    *a2 = v243;
    a2[1] = v244;
    a2[2] = v245;
    a2[3] = v246;
    v255 = a2 + 4;
    int8x16_t *v255 = veorq_s8(v247, veorq_s8(_Q26, v167));
    v255[1] = veorq_s8(v248, veorq_s8(_Q27, v167));
    v255[2] = veorq_s8(v249, veorq_s8(_Q28, v167));
    v255[3] = veorq_s8(v250, veorq_s8(_Q29, v167));
    a2 = v255 + 4;
    _VF = __OFSUB__(a3, 128LL);
    _NF = a3 - 128 < 0;
    a3 -= 128LL;
  }

  while (_NF == _VF);
  return sub_1000057CC();
}

int8x16_t *sub_1000057CC( int8x16_t *result, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6, int a7)
{
  BOOL v10 = a3 < -112;
  for (uint64_t i = a3 + 112; !v10; i -= 16LL)
  {
    _Q4 = *a5;
    _Q5 = a5[1];
    _Q6 = a5[2];
    int64x2_t v9 = vaddq_s64(v7, v9);
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }

    _Q4 = a5[3];
    _Q5 = a5[4];
    _Q6 = a5[5];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }

    _Q4 = a5[6];
    _Q5 = a5[7];
    _Q6 = a5[8];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }

    _Q20 = a5[9];
    _Q21 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V7.16B, V20.16B
        AESMC           V7.16B, V7.16B
        AESE            V7.16B, V21.16B
        AESMC           V7.16B, V7.16B
      }

      _Q20 = a5[11];
      _Q21 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V7.16B, V20.16B
          AESMC           V7.16B, V7.16B
          AESE            V7.16B, V21.16B
          AESMC           V7.16B, V7.16B
        }

        _Q20 = a5[13];
        _Q21 = a5[14];
      }
    }

    __asm { AESE            V7.16B, V20.16B }

    int8x16_t v54 = *result++;
    *a2++ = veorq_s8(v54, veorq_s8(_Q7, _Q21));
    BOOL v10 = i < 16;
  }

  *a4 = vqtbl1q_s8((int8x16_t)v9, v8);
  return result;
}

uint64_t ccec_affine_point_from_x_ws(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  if ((ccn_cmp_internal(*a2, a4, a2 + 3) & 0x80000000) != 0)
  {
    cczp_to_ws(a1, (uint64_t)a2);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_sub_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    uint64_t result = cczp_sqrt_ws(a1, (uint64_t)a2);
    if (!(_DWORD)result)
    {
      cczp_from_ws(a1, (uint64_t)a2);
      cczp_from_ws(a1, (uint64_t)a2);
      uint64_t result = 0LL;
    }
  }

  else
  {
    uint64_t result = 4294967289LL;
  }

  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccec_mult_default_ws( uint64_t a1, uint64_t *a2, uint64_t *a3, _BYTE *a4, unint64_t a5, uint64_t *a6)
{
  BOOL v12 = a2 + 4;
  v51 = a3;
  __src = a4;
  int8x16_t v54 = v12;
  uint64_t v14 = *a2;
  unint64_t v15 = (a5 + 63) >> 6;
  uint64_t v53 = *(void *)(a1 + 16);
  uint64_t v16 = 3 * *a2;
  uint64_t v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v16);
  uint64_t v18 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v14);
  BOOL v55 = ccn_n(v14, a6) == 0;
  if (a5 + 63 >= 0x40) {
    ccn_set((a5 + 63) >> 6, v18, a4);
  }
  ccn_zero(v14 - v15, (char *)v18 + 8 * v15);
  v18->i64[v15 - 1] &= 0xFFFFFFFFFFFFFFFFLL >> -(char)a5;
  unint64_t v50 = (a5 + 63) >> 6;
  v57 = v18;
  ccn_shift_right(v50, v18, v18, v55);
  ccec_double_ws(a1, a2);
  ccn_mux(3 * v14, !v55, v17, a6, v17);
  if (!ccn_n(v14, v17))
  {
LABEL_13:
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_16;
  }

  if (cczp_bitlen((uint64_t)&v54[5 * *a2]) >= a5)
  {
    uint64_t v19 = *a2;
    if (ccn_n(*a2, v17))
    {
      uint64_t v47 = v16;
      uint64_t v45 = *(void *)(a1 + 16);
      uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v49 = v19;
      unint64_t v21 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v56 = 2 * v19;
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v23 = *a2;
      uint64_t v42 = *(void *)(a1 + 16);
      __dst = (void *)v22;
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      v46 = v17;
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t v24 = a1;
      uint64_t v25 = a1;
      uint64_t v26 = (uint64_t *)v20;
      cczp_sub_ws(v24, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_add_ws(v25, (uint64_t)a2);
      cczp_sub_ws(v25, (uint64_t)a2);
      uint64_t v48 = v25;
      *(void *)(v25 + 16) = v42;
      uint64_t v27 = v18;
      unint64_t v28 = *(unint64_t *)((char *)v18->i64 + (((a5 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> (a5
                                                                                                 - 1);
      char v29 = v28 & 1;
      unsigned __int8 v30 = !(v28 & 1);
      unint64_t v31 = a5 - 2;
      if (a5 == 2)
      {
        char v43 = !(v28 & 1);
        LOBYTE(v32) = v28 & 1;
      }

      else
      {
        LOBYTE(v32) = v28 & 1;
        do
        {
          char v33 = v32;
          uint64_t v32 = (*(unint64_t *)((char *)v27->i64 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v31) & 1;
          cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
          ccn_cond_swap(v56, v32 ^ v33 | v29 ^ 1, v26, v21);
          sub_100006254(v25, a2);
          sub_1000064A0(v25, a2);
          unsigned __int8 v30 = v32 & (v29 ^ 1);
          uint64_t v27 = v18;
          v29 |= v32;
          --v31;
        }

        while (v31);
        char v43 = v29 ^ 1;
      }

      cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
      ccn_cond_swap(v56, v27->i8[0] & 1 ^ v32, v26, v21);
      sub_100006254(v25, a2);
      ccn_set(v56, __dst, v21);
      uint64_t v41 = v27->i64[0] & 1;
      ccn_cond_swap(v56, v27->i8[0] & 1, v26, v21);
      unsigned int v34 = v26;
      a1 = v25;
      uint64_t v35 = v51;
      uint64_t v40 = *(void *)(v25 + 16);
      cczp_sub_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      *(void *)(v25 + 16) = v40;
      ccn_cond_swap(v56, v41, v34, v21);
      sub_1000064A0(v25, a2);
      ccn_mux(v56, v41, v34, v21, v34);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      v36 = (unint64_t *)cczp_prime((uint64_t)&v54[5 * *a2]);
      ccn_sub1(v49, __dst, v36, 1uLL);
      unsigned __int8 v37 = (ccn_cmpn_internal(v50, v57, v49, __dst) & 1) == 0;
      BOOL is_point_at_infinity = ccec_is_point_at_infinity(a2, (uint64_t)v46);
      ccn_mux(3 * v49, v43 | is_point_at_infinity | v37, v35, v46, v35);
      cczp_cond_negate((uint64_t)a2, v37, &v35[*a2], (unint64_t *)&v35[*a2]);
      char v39 = v43 & ~v57->i32[0] & 1;
      ccn_cond_clear(v49, v39, &v51[2 * *a2]);
      ccn_seti(v49, v34, 1LL);
      cczp_to_ws(v48, (uint64_t)a2);
      ccn_mux(v49, v39, v35, v34, v35);
      ccn_mux(v49, v39, &v35[*a2], v34, &v35[*a2]);
      *(void *)(v48 + 16) = v45;
      ccec_full_add_ws(v48, (uint64_t)a2);
      ccn_mux(v47, *__src & v55, v35, v46, v35);
      uint64_t result = 0LL;
      goto LABEL_16;
    }

    goto LABEL_13;
  }

  uint64_t result = 4294967289LL;
LABEL_16:
  *(void *)(a1 + 16) = v53;
  return result;
}

uint64_t ccec_mult_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 96LL))();
}

uint64_t sub_100006254(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_1000064A0(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

unint64_t ccn_addmul1_asm( uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0LL;
  if ((a1 & 1) != 0)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4 + *a2) >> 64;
    *a2++ += v5 * a4;
    --a1;
  }

  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned __int128 v8 = *(_OWORD *)a2 + __PAIR128__(v7 * a4, v4);
    unsigned __int128 v9 = v8 + v6 * (unsigned __int128)a4;
    unint64_t v4 = (__CFADD__(__CFADD__((void)v8, v6 * a4), *((void *)&v8 + 1)) | __CFADD__( (v6 * (unsigned __int128)a4) >> 64,  *((void *)&v9 + 1)))
    *(_OWORD *)a2 = v9;
    a2 += 2;
    a1 -= 2LL;
  }

  while (1)
  {
    BOOL v10 = a1 < 4;
    a1 -= 4LL;
    if (v10) {
      break;
    }
    unint64_t v11 = a2[2];
    unint64_t v12 = a2[3];
    unint64_t v14 = *a3;
    unint64_t v15 = a3[1];
    uint64_t v13 = a3 + 2;
    unint64_t v16 = *v13;
    unint64_t v17 = v13[1];
    a3 = v13 + 2;
    uint64_t v18 = (v15 * (unsigned __int128)a4) >> 64;
    unsigned __int128 v19 = *(_OWORD *)a2 + __PAIR128__(v15 * a4, v4);
    BOOL v20 = __CFADD__( __CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1)),  v11);
    unint64_t v21 = (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1))) + v11;
    v20 |= __CFADD__(v18, v21);
    v21 += v18;
    BOOL v23 = v20;
    BOOL v20 = __CFADD__(v20, v12);
    unint64_t v22 = v23 + v12;
    v20 |= __CFADD__(v17 * a4, v22);
    v22 += v17 * a4;
    uint64_t v24 = v20 + ((v17 * (unsigned __int128)a4) >> 64);
    unsigned __int128 v25 = v19 + v14 * (unsigned __int128)a4;
    *(_OWORD *)a2 = v25;
    uint64_t v26 = a2 + 2;
    uint64_t v27 = (v16 * (unsigned __int128)a4) >> 64;
    uint64_t v29 = __CFADD__(__CFADD__((void)v19, v14 * a4), *((void *)&v19 + 1)) | __CFADD__( (v14 * (unsigned __int128)a4) >> 64,  *((void *)&v25 + 1));
    BOOL v20 = __CFADD__(v29, v21);
    uint64_t v28 = v29 + v21;
    uint64_t v31 = v20 | __CFADD__(v16 * a4, v28);
    BOOL v20 = __CFADD__(v31, v22);
    uint64_t v30 = v31 + v22;
    unint64_t v4 = (v20 | __CFADD__(v27, v30)) + v24;
    *uint64_t v26 = v16 * a4 + v28;
    v26[1] = v27 + v30;
    a2 = v26 + 2;
  }

  return v4;
}

uint64_t (**ccec_projectify_jacobian_ws( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(void, unint64_t, uint64_t)))(void, unint64_t, uint64_t)
{
  unint64_t v5 = a5;
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5)
  {
    uint64_t v10 = cczp_bitlen((uint64_t)a2);
    unint64_t v5 = (uint64_t (**)(void, unint64_t, uint64_t))ccn_random_bits(v10 - 1, a3 + 16 * *a2, v5);
    ccn_set_bit(a3 + 16 * *a2, v10 - 2, 1LL);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
  }

  else
  {
    ccn_seti(*a2, (void *)(a3 + 16 * *a2), 1LL);
    cczp_to_ws(a1, (uint64_t)a2);
  }

  cczp_to_ws(a1, (uint64_t)a2);
  cczp_to_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v9;
  return v5;
}

uint64_t ccec_projectify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 72LL))();
}

unint64_t cc_cmp_safe_internal(uint64_t a1, char *a2, char *a3)
{
  if (!a1) {
    return 1LL;
  }
  unsigned __int8 v3 = 0;
  do
  {
    char v5 = *a2++;
    char v4 = v5;
    char v6 = *a3++;
    v3 |= v6 ^ v4;
    --a1;
  }

  while (a1);
  return ((unint64_t)v3 + 0xFFFFFFFF) >> 32;
}

uint64_t ccec_x963_export(int a1, char *a2, uint64_t *a3)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v6 = ccec_export_pub(a3, a2);
  uint64_t v7 = v6;
  if (a1 && !(_DWORD)v6)
  {
    uint64_t v8 = *a3;
    unint64_t v9 = *(void *)*a3;
    unint64_t v10 = (unint64_t)(cczp_bitlen(*a3 + 40 * v9 + 32) + 7) >> 3;
    uint64_t v11 = cczp_bitlen(v8);
    int v12 = ccn_write_uint_padded_ct_internal( v9,  (unint64_t *)&a3[3 * v9 + 2],  v10,  &a2[((unint64_t)(v11 + 7) >> 2) | 1]);
    uint64_t v7 = v12 & (v12 >> 31);
  }

  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v7;
}

uint64_t ccec_x963_import_priv_ws( uint64_t a1, unint64_t *a2, unint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  unsigned int v5 = *a4;
  BOOL v6 = v5 > 7;
  int v7 = (1 << v5) & 0xD0;
  if (v6 || v7 == 0) {
    return 4294967289LL;
  }
  BOOL v14 = a2 + 4;
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = cczp_bitlen((uint64_t)&v14[5 * *a2]);
  uint64_t result = ccec_x963_import_pub_ws(a1, a2, a3 - ((unint64_t)(v16 + 7) >> 3), a4, a5);
  if (!(_DWORD)result)
  {
    unint64_t v18 = *a2;
    uint64_t v19 = (uint64_t)&a5[3 * **a5 + 2];
    unint64_t v20 = (unint64_t)(cczp_bitlen((uint64_t)&v14[5 * *a2]) + 7) >> 3;
    uint64_t v21 = cczp_bitlen((uint64_t)a2);
    uint64_t result = ccn_read_uint_internal(v18, v19, v20, &a4[((unint64_t)(v21 + 7) >> 2) | 1]);
  }

  *(void *)(a1 + 16) = v15;
  return result;
}

uint64_t ccec_x963_import_priv( unint64_t *a1, unint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v8 = cc_malloc_clear(160 * *a1);
  uint64_t v9 = 20 * *a1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 0LL;
  v12[3] = cc_ws_alloc;
  uint64_t v13 = cc_ws_free;
  if (v8)
  {
    uint64_t v10 = ccec_x963_import_priv_ws((uint64_t)v12, a1, a2, a3, a4);
    v13((uint64_t)v12);
  }

  else
  {
    uint64_t v10 = 4294967283LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v10;
}

uint64_t ccec_x963_import_pub_ws( uint64_t a1, unint64_t *a2, uint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  if (!a3) {
    return 4294967289LL;
  }
  if (a3 == 1)
  {
    int v10 = *a4;
    if (!*a4) {
      return 4294967136LL;
    }
  }

  else
  {
    int v10 = *a4;
  }

  unsigned int v12 = v10 - 2;
  if (v12 > 5 || ((0x37u >> v12) & 1) == 0) {
    return 4294967289LL;
  }
  int v13 = dword_1000262A0[(char)v12];
  uint64_t v14 = *(void *)(a1 + 16);
  *a5 = a2;
  uint64_t result = ccec_import_affine_point_ws(a1, a2, v13, a3, a4, a5 + 2);
  if (!(_DWORD)result)
  {
    ccn_seti(*a2, &a5[2 * **a5 + 2], 1LL);
    uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * *a2);
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, (uint64_t *)a2, v15, (uint64_t)(a5 + 2));
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_x963_import_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  uint64_t v8 = cc_malloc_clear(160 * *a1);
  uint64_t v9 = 20 * *a1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 0LL;
  v12[3] = cc_ws_alloc;
  int v13 = cc_ws_free;
  if (!v8) {
    return 4294967283LL;
  }
  uint64_t v10 = ccec_x963_import_pub_ws((uint64_t)v12, a1, a2, a3, a4);
  v13((uint64_t)v12);
  return v10;
}

uint64_t ccrng_crypto_generate(uint64_t a1, rsize_t a2, char *a3)
{
  if (!a2) {
    return 0LL;
  }
  rsize_t v6 = a2;
  int v7 = a3;
  while (1)
  {
    uint64_t v8 = *(os_unfair_lock_s **)(a1 + 24);
    if (v8)
    {
      os_unfair_lock_lock(v8);
      uint64_t v9 = *(os_unfair_lock_s **)(a1 + 24);
      if (v9) {
        os_unfair_lock_assert_owner(v9);
      }
    }

    memset(v29, 0, sizeof(v29));
    rsize_t v10 = *(void *)(a1 + 56);
    int v11 = ccrng_schedule_read(*(void *)(a1 + 16));
    if (v11 == 1) {
      goto LABEL_13;
    }
    int v12 = v11;
    uint64_t seed = ccentropy_get_seed(*(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 8), v10, (uint64_t)v29);
    if ((_DWORD)seed == -10) {
      break;
    }
    uint64_t v14 = seed;
    if ((_DWORD)seed) {
      goto LABEL_40;
    }
    uint64_t v15 = sub_100006F60((void *)a1, v10, (uint64_t)v29, 0LL, 0LL);
    if ((_DWORD)v15)
    {
      uint64_t v14 = v15;
LABEL_40:
      cc_clear(v10, v29);
      goto LABEL_36;
    }

    ccrng_schedule_notify_reseed(*(_BYTE **)(a1 + 16));
    cc_clear(v10, v29);
LABEL_13:
    if (v6 >= *(void *)(a1 + 48)) {
      unint64_t v16 = *(void *)(a1 + 48);
    }
    else {
      unint64_t v16 = v6;
    }
    unint64_t v17 = *(os_unfair_lock_s **)(a1 + 24);
    if (v17) {
      os_unfair_lock_assert_owner(v17);
    }
    if (a2 <= 0xB && (unint64_t v18 = *(void *)(a1 + 64), v18 >= v16))
    {
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v22 = *(void *)(a1 + 80);
      BOOL v23 = (void *)(v21 + v22);
      uint64_t v24 = v21 + v18;
      unint64_t v25 = v24 - (v21 + v22);
      if (v25 >= v16) {
        size_t v26 = v16;
      }
      else {
        size_t v26 = v24 - (v21 + v22);
      }
      memcpy(v7, (const void *)(v21 + v22), v26);
      cc_clear(v26, v23);
      *(void *)(a1 + 80) += v26;
      if (v25 < v16)
      {
        uint64_t v19 = sub_100007010((void *)a1, *(void *)(a1 + 64), *(void *)(a1 + 72));
        if ((_DWORD)v19)
        {
LABEL_41:
          uint64_t v14 = v19;
          goto LABEL_36;
        }

        memcpy(&v7[v26], *(const void **)(a1 + 72), v16 - v26);
        cc_clear(v16 - v26, *(void **)(a1 + 72));
        *(void *)(a1 + 80) = v16 - v26;
      }
    }

    else
    {
      uint64_t v19 = sub_100007010((void *)a1, v16, (uint64_t)v7);
      if ((_DWORD)v19) {
        goto LABEL_41;
      }
    }

    unint64_t v20 = *(os_unfair_lock_s **)(a1 + 24);
    if (v20) {
      os_unfair_lock_unlock(v20);
    }
    v7 += v16;
    v6 -= v16;
    if (!v6) {
      return 0LL;
    }
  }

  if (v12 == 2) {
    goto LABEL_13;
  }
  if (v12 == 3) {
    uint64_t v14 = 4294967134LL;
  }
  else {
    uint64_t v14 = 0xFFFFFFFFLL;
  }
LABEL_36:
  uint64_t v28 = *(os_unfair_lock_s **)(a1 + 24);
  if (v28) {
    os_unfair_lock_unlock(v28);
  }
  cc_clear(a2, a3);
  return v14;
}

uint64_t sub_100006F60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  rsize_t v10 = (os_unfair_lock_s *)a1[3];
  if (v10) {
    os_unfair_lock_assert_owner(v10);
  }
  uint64_t result = ccdrbg_reseed(a1[4], a1[5], a2, a3, a4, a5);
  if (!(_DWORD)result) {
    a1[10] = a1[8];
  }
  return result;
}

uint64_t ccrng_crypto_init( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a8 > 0x40) {
    return 4294967291LL;
  }
  uint64_t result = 0LL;
  *a1 = j__ccrng_crypto_generate;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = a4;
  a1[4] = a5;
  a1[5] = a6;
  a1[6] = a7;
  a1[7] = a8;
  a1[8] = a9;
  a1[9] = a10;
  a1[10] = a9;
  return result;
}

uint64_t sub_100007010(void *a1, uint64_t a2, uint64_t a3)
{
  rsize_t v6 = (os_unfair_lock_s *)a1[3];
  if (v6) {
    os_unfair_lock_assert_owner(v6);
  }
  return ccdrbg_generate(a1[4], a1[5], a2, a3, 0LL, 0LL);
}

uint64_t cczp_inv_default_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = cczp_n(a2);
  uint64_t v9 = cczp_prime(v6);
  uint64_t v46 = *(void *)(a1 + 16);
  __int128 __s = a3;
  int v11 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  int v12 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  cczp_from_ws(a1, v6);
  int v13 = (void *)cczp_prime(v6);
  ccn_set(v8, v12, v13);
  uint64_t v14 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v53 = v14;
  ccn_seti(v8, v14, 1LL);
  uint64_t __n = 8 * v8;
  int8x16_t v54 = v15;
  cc_clear(8 * v8, v15);
  v52 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  unint64_t v16 = (v8 << 7) | 0x1E;
  if (v16 != 30)
  {
    uint64_t v17 = 0LL;
    unint64_t v49 = v8 - 1;
    unint64_t v50 = v16 / 0x1F;
    unint64_t v48 = v8 - 2;
    v51 = (void *)v6;
    uint64_t v56 = v8;
    do
    {
      uint64_t v18 = v11[v49];
      uint64_t v19 = v12[v49];
      uint64_t v55 = v17;
      if (v8 >= 2)
      {
        unint64_t v20 = v48;
        do
        {
          char v21 = __clz(v19 | v18 | 1);
          uint64_t v18 = (v11[v20] >> v22) | (v18 << v21);
          uint64_t v19 = (v12[v20--] >> v22) | (v19 << v21);
        }

        while (v20 < v8);
      }

      unint64_t v23 = 0LL;
      uint64_t v24 = 0LL;
      unint64_t v25 = v18 & 0xFFFFFFFF80000000LL | *v11 & 0x7FFFFFFFLL;
      unint64_t v26 = v19 & 0xFFFFFFFF80000000LL | *v12 & 0x7FFFFFFFLL;
      uint64_t v27 = 31LL;
      uint64_t v28 = 0x80000000LL;
      unint64_t v29 = 0x80000000LL;
      do
      {
        unint64_t v30 = v25 & 1;
        unint64_t v31 = v25 >> !(v25 & 1);
        unint64_t v32 = v31 ^ v26;
        unint64_t v33 = v25 & ((((v31 - v26) ^ v31 | v31 ^ v26) ^ v31) >> 63);
        uint64_t v34 = -(uint64_t)v33;
        unint64_t v35 = v26 & -(uint64_t)v33--;
        unint64_t v36 = v33 & v31 | v35;
        unint64_t v26 = v32 ^ v36;
        unint64_t v37 = v33 & v29 | v24 & v34;
        v24 ^= v29 ^ v37;
        unint64_t v38 = v33 & v23 | v28 & v34;
        v28 ^= v23 ^ v38;
        unint64_t v25 = (v36 - (v26 & -(uint64_t)v30)) >> v30;
        unint64_t v29 = (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v37 - (v24 & -(uint64_t)v30)) >> 1);
        unint64_t v23 = (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v38 - (v28 & -(uint64_t)v30)) >> 1);
        --v27;
      }

      while (v27);
      uint64_t v39 = a1;
      unint64_t v40 = sub_100007490( a1,  v8,  v52,  v11,  (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v37 - (v24 & -(uint64_t)v30)) >> 1),  v12,  (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v38 - (v28 & -(uint64_t)v30)) >> 1));
      unint64_t v41 = sub_100007490(v39, v56, v12, v11, v24, v12, v28);
      ccn_set(v56, v11, v52);
      unint64_t v42 = v40 - 1;
      uint64_t v43 = -(uint64_t)v40;
      a1 = v39;
      uint64_t v44 = v42 & v23 | v43 & -(uint64_t)v23;
      uint64_t v6 = (uint64_t)v51;
      unint64_t v8 = v56;
      sub_10000760C(v39, v51, v52, v53, v42 & v29 | v43 & -(uint64_t)v29, v54, v44);
      sub_10000760C( v39,  v51,  v54,  v53,  (v41 - 1) & v24 | -(uint64_t)v41 & -v24,  v54,  (v41 - 1) & v28 | -(uint64_t)v41 & -v28);
      ccn_set(v56, v53, v52);
      uint64_t v17 = v55 + 1;
    }

    while (v55 + 1 != v50);
  }

  if (ccn_n(v8, v12) == 1 && *v12 == 1LL)
  {
    cczp_to_ws(a1, v6);
    uint64_t result = 0LL;
  }

  else
  {
    cc_clear(__n, __s);
    uint64_t result = 4294967289LL;
  }

  *(void *)(a1 + 16) = v46;
  return result;
}

unint64_t sub_100007490(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v13 = a2 + 1;
  uint64_t v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2 + 1);
  uint64_t v15 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  if (a2) {
    ccn_set(a2, v14, a4);
  }
  ccn_zero(1LL, (char *)v14 + 8 * a2);
  ccn_cond_neg(v13, a5 < 0, v14->i64, v14->i64);
  if (a2) {
    ccn_set(a2, v15, a6);
  }
  ccn_zero(1LL, &v15[8 * a2]);
  ccn_cond_neg(v13, a7 < 0, (uint64_t *)v15, (uint64_t *)v15);
  ccn_mul1(v13, v14, v14, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  ccn_addmul1(v13, v14, v15, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  unint64_t v16 = (unint64_t)v14->i64[a2] >> 63;
  ccn_cond_neg(v13, v14->i64[a2] < 0, v14->i64, v14->i64);
  ccn_shift_right(v13, v14, v14, 31LL);
  ccn_set(a2, a3, v14);
  *(void *)(a1 + 16) = v19;
  return v16;
}

uint64_t sub_10000760C( uint64_t a1, void *a2, void *a3, unint64_t *a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v12 = cczp_n((uint64_t)a2);
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v13 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v14 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  cczp_cond_negate((uint64_t)a2, a5 < 0, v13->i64, a4);
  cczp_cond_negate((uint64_t)a2, a7 < 0, v14, a6);
  v13->i64[v12] = ccn_mul1(v12, v13, v13, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  v13->i64[v12] += ccn_addmul1(v12, v13, v14, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  uint64_t v15 = cczp_prime((uint64_t)a2);
  v13->i64[v12] += ccn_addmul1(v12, v13, v15, (LODWORD(a2[*a2 + 3]) * v13->i32[0]) & 0x7FFFFFFF);
  ccn_shift_right(v12 + 1, v13, v13, 31LL);
  ccn_set(v12, a3, v13);
  unint64_t v16 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v17 = ccn_subn(v12 + 1, v13, v13->i64, v12, v16);
  uint64_t result = ccn_mux(v12, v17, (uint64_t *)a3, (uint64_t *)a3, v13->i64);
  *(void *)(a1 + 16) = v21;
  return result;
}

uint64_t cczp_inv_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 40LL))();
}

uint64_t cczp_n(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t cczp_bitlen(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccn_mul(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result *= -8LL;
    char v4 = (unint64_t *)(a2 - result);
    uint64_t v5 = a3 - result;
    uint64_t v6 = a4 - result;
    uint64_t v7 = result;
    uint64_t v8 = result;
    unint64_t v9 = 0LL;
    unint64_t v10 = *(void *)(v6 + result);
    do
    {
      unsigned __int128 v11 = *(unint64_t *)(v5 + v8) * (unsigned __int128)v10 + v9;
      *(unint64_t *)((char *)v4 + v8) = v11;
      unint64_t v9 = *((void *)&v11 + 1);
      v8 += 8LL;
    }

    while (v8);
    while (1)
    {
      unint64_t *v4 = v9;
      v7 += 8LL;
      if (!v7) {
        break;
      }
      ++v4;
      uint64_t v12 = result;
      unint64_t v9 = 0LL;
      unint64_t v13 = *(void *)(v6 + v7);
      do
      {
        unsigned __int128 v14 = *(unint64_t *)(v5 + v12) * (unsigned __int128)v13 + v9 + *(unint64_t *)((char *)v4 + v12);
        *(unint64_t *)((char *)v4 + v12) = v14;
        unint64_t v9 = *((void *)&v14 + 1);
        v12 += 8LL;
      }

      while (v12);
    }
  }

  return result;
}

uint64_t ccmode_ctr_init(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 48);
  *a2 = v8;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, void *, uint64_t))(a1 + 32))(a1, a2, a5);
  return v9;
}

uint64_t ccn_cmpn_public_value(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = a1;
  }
  if (a1 >= a3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a4;
  }
  if (a1 <= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a1;
  }
  if (a1 < a3) {
    unsigned int v7 = -1;
  }
  else {
    unsigned int v7 = 1;
  }
  unsigned int v8 = ccn_cmp_public_value(v4, a2, a4);
  if (ccn_n(v6 - v4, v5 + 8 * v4)) {
    return v7;
  }
  else {
    return v8;
  }
}

uint64_t cczp_sqrt_tonelli_shanks_precomp_ws( uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12 = cczp_n(a2);
  uint64_t v23 = *(void *)(a1 + 16);
  unint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unsigned __int128 v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, a6);
  uint64_t v18 = v23;
  if (!(_DWORD)result)
  {
    ccn_seti(v12, v16, 1LL);
    unint64_t v25 = v16;
    cczp_to_ws(a1, a2);
    ccn_set(v12, v15, a7);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    if (a5 >= 2)
    {
      while (1)
      {
        ccn_set(v12, v14, v13);
        if (a5 - 1 < 2) {
          break;
        }
        uint64_t v19 = 2LL;
        do
        {
          cczp_sqr_ws(a1, a2);
          ++v19;
        }

        while (a5 != v19);
        char v20 = ccn_cmp_internal(v12, v14, v25) & 1;
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, a3, (uint64_t *)v14, a3);
        cczp_sqr_ws(a1, a2);
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
        --a5;
      }

      char v21 = ccn_cmp_internal(v12, v14, v25) & 1;
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, a3, (uint64_t *)v14, a3);
      cczp_sqr_ws(a1, a2);
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
    }

    cczp_sqr_ws(a1, a2);
    else {
      uint64_t result = 0LL;
    }
    uint64_t v18 = v23;
  }

  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_sqrt_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = ~*(_DWORD *)cczp_prime(a2) & 3LL;
  uint64_t v9 = cczp_n(a2);
  uint64_t v10 = *(void *)(a1 + 16);
  unsigned __int128 v11 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  uint64_t v12 = (void *)cczp_prime(a2);
  if (v8)
  {
    ccn_set(v9, v11, v12);
    v11->i64[0] &= ~1uLL;
    unint64_t v14 = ccn_trailing_zeros(v9, (uint64_t)v11);
    ccn_shift_right_multi(v9, v11, v11, v14);
    uint64_t v15 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_sub1(v9, v15, (unint64_t *)v11, 1uLL);
    ccn_shift_right(v9, v15, v15, 1LL);
    unint64_t v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_seti(v9, v16, 1LL);
    uint64_t result = cczp_power_fast_ws(a1, a2, v16, v16, (uint64_t)v11);
    if (!(_DWORD)result) {
      uint64_t result = cczp_sqrt_tonelli_shanks_precomp_ws(a1, a2, a3, a4, v14, (uint64_t)v15, v16);
    }
  }

  else
  {
    ccn_add1_ws(a1, v9, v11, (uint64_t *)v12, 1LL);
    ccn_shift_right(v9, v11, v11, 2LL);
    uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, (uint64_t)v11);
    if (!(_DWORD)result)
    {
      cczp_sqr_ws(a1, a2);
      else {
        uint64_t result = 0LL;
      }
    }
  }

  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sqrt_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 48LL))();
}

BOOL ccec_is_point_projective_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  BOOL result = ccn_cmp_internal(v4, v7, v6) == 0;
  *(void *)(a1 + 16) = v5;
  return result;
}

BOOL ccec_is_point_at_infinity(void *a1, uint64_t a2)
{
  return ccn_n(*a1, a2 + 16LL * *a1) == 0;
}

uint64_t ccentropy_get_seed(uint64_t (***a1)(void, uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  BOOL v8 = timingsafe_enable_if_supported();
  uint64_t v6 = (**a1)(a1, a2, a3);
  cc_disable_dit_with_sb((unsigned int *)&v8);
  return v6;
}

uint64_t ccec_make_pub_from_priv_ws( uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t a4, uint64_t a5, uint64_t **a6)
{
  *a6 = a2;
  uint64_t v12 = *a2;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  if (ccec_validate_scalar(a2, a4))
  {
    uint64_t result = 4294967274LL;
    goto LABEL_10;
  }

  if (a5)
  {
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, a2, v14, a5);
    if ((_DWORD)result) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
    if ((_DWORD)result) {
      goto LABEL_10;
    }
  }

  if (ccec_mult_blinded_ws(a1, (unint64_t *)a2, (uint64_t)(a6 + 2), a4, v14, a3))
  {
    uint64_t result = 4294967280LL;
  }

  else if (ccec_is_point_projective_ws(a1, a2))
  {
    if (ccec_affinify_ws(a1, (uint64_t)a2))
    {
      uint64_t result = 4294967279LL;
    }

    else
    {
      ccn_seti(v12, &a6[2 * **a6 + 2], 1LL);
      uint64_t result = 0LL;
    }
  }

  else
  {
    uint64_t result = 4294967277LL;
  }

LABEL_10:
  *(void *)(a1 + 16) = v13;
  return result;
}

BOOL ccn_add_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, uint64_t *a5)
{
  return ccn_add_asm(a2, a3, a4, a5);
}

BOOL ccn_add_asm(BOOL result, void *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL v4 = 0;
  if (result)
  {
    if (result)
    {
      uint64_t v6 = *a3++;
      uint64_t v5 = v6;
      uint64_t v7 = *a4++;
      BOOL v4 = __CFADD__(v5, v7);
      *a2++ = v5 + v7;
    }

    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      uint64_t v10 = *a4;
      uint64_t v11 = a4[1];
      a4 += 2;
      uint64_t v13 = v4 + v8;
      BOOL v4 = __CFADD__(v4, v8) | __CFADD__(v10, v13);
      uint64_t v12 = v10 + v13;
      uint64_t v14 = v4 + v9;
      BOOL v4 = __CFADD__(v4, v9) | __CFADD__(v11, v14);
      *a2 = v12;
      a2[1] = v11 + v14;
      a2 += 2;
    }

    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      char v17 = a3 + 2;
      uint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      char v20 = a4 + 2;
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      uint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        uint64_t v30 = v4 + v18;
        BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v30);
        uint64_t v29 = v21 + v30;
        uint64_t v32 = v4 + v19;
        BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v32);
        uint64_t v31 = v22 + v32;
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        uint64_t v35 = v4 + v24;
        BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v35);
        uint64_t v34 = v27 + v35;
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        uint64_t v37 = v4 + v25;
        BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v37);
        uint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        void *v36 = v34;
        v36[1] = v28 + v37;
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        uint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }

      uint64_t v40 = v4 + v18;
      BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v40);
      uint64_t v39 = v21 + v40;
      uint64_t v42 = v4 + v19;
      BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v42);
      uint64_t v41 = v22 + v42;
      uint64_t v44 = v4 + v24;
      BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v44);
      uint64_t v43 = v27 + v44;
      uint64_t v45 = v4 + v25;
      BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v45);
      *a2 = v39;
      a2[1] = v41;
      uint64_t v46 = a2 + 2;
      void *v46 = v43;
      v46[1] = v28 + v45;
    }

    return v4;
  }

  return result;
}

BOOL ccn_add1_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5)
{
  if (a2) {
    return ccn_add1_asm(a2, a3, a4, a5);
  }
  else {
    return a5;
  }
}

unint64_t ccecdh_pairwise_consistency_check_ws( uint64_t a1, unint64_t **a2, uint64_t a3, uint64_t (**a4)(void, uint64_t, uint64_t *))
{
  uint64_t v6 = (uint64_t *)*a2;
  unint64_t v7 = **a2;
  uint64_t v28 = *(void *)(a1 + 16);
  uint64_t v8 = (unint64_t **)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))( a1,  (4 * (v7 & 0x7FFFFFFFFFFFFFFLL)) | 2);
  *uint64_t v8 = (unint64_t *)v6;
  uint64_t v9 = *v6;
  uint64_t v10 = (uint64_t)&v8[3 * *v6 + 2];
  ccn_set(1LL, (void *)v10, &unk_1000262B8);
  ccn_zero(v9 - 1, (void *)(v10 + 8));
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *v6);
  uint64_t v13 = v28;
  unint64_t result = sub_100008568(a1, v6, v12, (uint64_t)&v8[3 * **v8 + 2]);
  if (!(_DWORD)result)
  {
    unint64_t result = ccec_affinify_ws(a1, (uint64_t)v6);
    *(void *)(a1 + 16) = v11;
    if ((_DWORD)result) {
      goto LABEL_13;
    }
    BOOL v15 = v8 + 2;
    unint64_t v16 = (unint64_t)(cczp_bitlen((uint64_t)v6) + 7) >> 3;
    unint64_t v29 = v16;
    char v17 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v7);
    uint64_t v18 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v7);
    cc_clear(v16, v17);
    cc_clear(v16, v18);
    unint64_t result = ccecdh_compute_shared_secret_ws(a1, a2, v8, &v29, (char *)v17, a4);
    if ((_DWORD)result) {
      goto LABEL_13;
    }
    if (!v29) {
      goto LABEL_12;
    }
    uint64_t v19 = 0LL;
    int v20 = 0;
    do
      v20 |= v17[v19++];
    while (v29 != v19);
    if (!v20)
    {
LABEL_12:
      unint64_t result = 4294967278LL;
LABEL_13:
      uint64_t v13 = v28;
      goto LABEL_14;
    }

    uint64_t v21 = *v8;
    unint64_t v22 = **v8;
    uint64_t v23 = *(void *)(a1 + 16);
    uint64_t v24 = (void *)(*(uint64_t (**)(uint64_t))(a1 + 24))(a1);
    unint64_t result = sub_100008568(a1, (uint64_t *)v21, v24, (uint64_t)&v15[3 * v22]);
    uint64_t v13 = v28;
    if (!(_DWORD)result)
    {
      uint64_t v25 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v22);
      unint64_t result = ccec_affinify_x_only_ws(a1, (uint64_t *)v21, (uint64_t)v25, (uint64_t)v24);
      if (!(_DWORD)result)
      {
        uint64_t v26 = cczp_bitlen((uint64_t)v21);
        ccn_write_uint_padded_internal(v22, v25, (unint64_t)(v26 + 7) >> 3, (char *)v18);
        *(void *)(a1 + 16) = v23;
        if (v29 == v16)
        {
          unint64_t result = cc_cmp_safe_internal(v16, (char *)v17, (char *)v18);
          if (!(_DWORD)result) {
            goto LABEL_13;
          }
        }

        goto LABEL_12;
      }
    }
  }

LABEL_14:
  *(void *)(a1 + 16) = v13;
  return result;
}

      unint64_t v16 = 0LL;
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v14,  v25,  v26));
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v23 = _os_assert_log(0LL, v6);
    uint64_t v8 = (id)_os_crash(v23);
    __break(1u);
  }

  uint64_t v24 = _os_assert_log(v8, v9);
  unint64_t result = _os_crash(v24);
  __break(1u);
  return result;
}

uint64_t sub_100008568(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = 3 * *a2;
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  uint64_t v12 = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!(_DWORD)v12)
  {
    ccn_set(v10, a3, v11);
    uint64_t v13 = ccn_bitlen_internal(v8, a4);
    if (v13 != 1)
    {
      unint64_t v14 = v13 - 2;
      do
      {
        ccec_double_ws(a1, a2);
        if (((*(void *)(a4 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v14) & 1) != 0) {
          ccec_full_add_normalized_ws(a1, a2, (char *)a3, (uint64_t)a3, (char *)v11);
        }
        --v14;
      }

      while (v14 != -1LL);
    }
  }

  *(void *)(a1 + 16) = v9;
  return v12;
}

uint64_t ccn_mux(uint64_t result, char a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t v5 = qword_100035A60 ^ (qword_100035A60 << 13) ^ ((qword_100035A60 ^ (unint64_t)(qword_100035A60 << 13)) >> 7);
  uint64_t v6 = v5 ^ (v5 << 17);
  qword_100035A60 = v6;
  for (uint64_t i = __ROR8__(0x5555555555555555LL, a2 | (2 * v6)); result; --result)
  {
    uint64_t v9 = *a4++;
    uint64_t v8 = v9;
    uint64_t v10 = *a5++;
    *a3 = v10 ^ v6;
    *a3++ = (v10 ^ v8) & 0x5555555555555555LL ^ v10 ^ v6 ^ (v10 ^ v8) & i ^ v6;
  }

  return result;
}

uint64_t ccn_mux_next_mask()
{
  unint64_t v0 = qword_100035A60 ^ (qword_100035A60 << 13) ^ ((qword_100035A60 ^ (unint64_t)(qword_100035A60 << 13)) >> 7);
  uint64_t result = v0 ^ (v0 << 17);
  qword_100035A60 = result;
  return result;
}

uint64_t ccn_mux_seed_mask(uint64_t result)
{
  qword_100035A60 ^= result;
  return result;
}

uint64_t cczp_power_fast_ws(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = ccn_bitlen_internal(v10, a5);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v10);
    ccn_set(v10, v13, a4);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> (v12 - 1)) & 1LL;
    if ((v12 & 1) == 0) {
      uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 2) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> (v12 - 2)) & 1LL | (2 * v14);
    }
    ccn_set(v10, a3, &v13[8 * (v14 - 1) * v10]);
    if ((v12 | 0xFFFFFFFFFFFFFFFELL) + v12)
    {
      unint64_t v15 = v12 + (v12 | 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        cczp_sqr_ws(a1, a2);
        cczp_sqr_ws(a1, a2);
        v15 -= 2LL;
      }

      while (v15 != -1LL);
    }

    *(void *)(a1 + 16) = v17;
  }

  else
  {
    ccn_seti(v10, a3, 1LL);
    cczp_to_ws(a1, a2);
  }

  return 0LL;
}

unint64_t ccn_bitlen_public_value(unint64_t result, unint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0LL;
    uint64_t v3 = 64LL;
    do
    {
      unint64_t v4 = *a2++;
      uint64_t result = ((((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32) - 1) & result | (v3 - __clz(v4 | 1)) & -(uint64_t)(((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32);
      v3 += 64LL;
      --v2;
    }

    while (v2);
  }

  return result;
}

void cc_abort()
{
}

uint64_t ccn_mul_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ccn_mul(a2, a3, a4, a5);
}

uint64_t ccn_divmod_ws( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v12 = ccn_n(a6, a8);
  unint64_t v13 = a2 - v12;
  uint64_t v50 = *(void *)(a1 + 16);
  uint64_t v14 = v12 + 1;
  unint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  unint64_t v16 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v59 = a1;
  uint64_t v17 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v15[v12] = 0LL;
  uint64_t v57 = v12 - 1;
  unint64_t v18 = __clz(*(void *)(a8 + 8 * (v12 - 1)));
  ccn_shift_left(v12, (uint64_t)v15, a8, v18, v19);
  int v20 = -(int)v18;
  unint64_t v60 = v18;
  unint64_t v21 = v18 + 0xFFFFFFFF;
  if (v12) {
    ccn_set(v12, v16, (void *)(a3 + 8 * v13));
  }
  uint64_t v53 = -(uint64_t)HIDWORD(v21);
  char v54 = v20 & 0x3F;
  ccn_zero(1LL, (char *)v16 + 8 * v12);
  ccn_shift_left(v14, (uint64_t)v16, (uint64_t)v16, v60, v22);
  unint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = v15[v57];
  uint64_t v27 = -v26;
  unint64_t v29 = (unsigned __int128)-(__int128)__PAIR128__(v28, v26) >> 64;
  uint64_t v30 = 65LL;
  unint64_t v31 = v26;
  do
  {
    unsigned __int128 v32 = __PAIR128__(v29, v27) - __PAIR128__(v31, v23);
    unint64_t v33 = (unint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63;
    uint64_t v34 = v29 & ((uint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63);
    uint64_t v27 = (v33 - 1) & v32 | v27 & (*((uint64_t *)&v32 + 1) >> 63);
    *((void *)&v35 + 1) = v25;
    *(void *)&__int128 v35 = v24;
    uint64_t v25 = v35 >> 63;
    *((void *)&v35 + 1) = v24;
    *(void *)&__int128 v35 = *((void *)&v32 + 1);
    unint64_t v29 = (v33 != 0 ? 0 : *((void *)&v32 + 1)) | v34;
    uint64_t v24 = (v35 >> 63) ^ 1;
    *((void *)&v35 + 1) = v31;
    *(void *)&__int128 v35 = v23;
    unint64_t v23 = v35 >> 1;
    v31 >>= 1;
    --v30;
  }

  while (v30);
  unint64_t v56 = (v24 + 2) | ((((HIDWORD(v15[v57]) ^ 0x80000000 | v15[v57]) + 0xFFFFFFFF) >> 32) - 1);
  size_t v52 = 8 * v12;
  uint64_t v58 = v12;
  unint64_t v36 = (void *)(a3 - 8 * v12 + 8 * a2);
  unint64_t v37 = v13;
  do
  {
    unint64_t v38 = v13;
    uint64_t v39 = *v36 << v60;
    v16->i64[0] = v39;
    if (v37) {
      v16->i64[0] = ((*(v36 - 1) & (unint64_t)v53) >> v54) | v39;
    }
    unint64_t v40 = v16->u64[v58];
    uint64_t v41 = v16->i64[v57];
    uint64_t v63 = v15[v57];
    unint64_t v42 = ((__PAIR128__(v40, v41) - (unint64_t)v63) >> 64) + ((v40 * (unsigned __int128)v56) >> 64) + 2;
    if (v42 < v40) {
      unint64_t v42 = -1LL;
    }
    unint64_t v62 = v42;
    v65[0] = 0LL;
    v65[1] = 0LL;
    ccn_mul(1LL, (uint64_t)v65, (uint64_t)&v62, (uint64_t)&v63);
    v64[0] = v41;
    v64[1] = v40;
    BOOL v43 = ccn_sub_ws(0LL, 2LL, v65, v64, (unint64_t *)v65);
    v62 -= 2 * v43;
    BOOL v44 = ccn_add1_ws(0LL, 2LL, v65, v65, v63);
    unint64_t v45 = v62 + v44;
    v17[v58] = ccn_mul1(v58, v17, v15, v62 + v44);
    BOOL v46 = ccn_sub_ws(v59, v14, v16, v16->i64, v17);
    uint64_t v47 = v46 - ccn_cond_add(v14, v46, v16->i64, v16->i64, v15);
    uint64_t result = ccn_cond_add(v14, v47, v16->i64, v16->i64, v15);
    if (a5 && v37 < a4) {
      *(void *)(a5 + 8 * v37) = v45 - (v46 + v47);
    }
    if (v37) {
      uint64_t result = (uint64_t)memmove(&v16->u64[1], v16, v52);
    }
    --v37;
    --v36;
    unint64_t v13 = v38;
  }

  while (v37 <= v38);
  if (a5 && a4 > v38 + 1) {
    uint64_t result = cc_clear(8 * (a4 - (v38 + 1)), (void *)(a5 + 8 * (v38 + 1)));
  }
  if (a7)
  {
    ccn_shift_right(v58, v16, v16, v60);
    if (v58) {
      ccn_set(v58, a7, v16);
    }
    uint64_t result = ccn_zero(a6 - v58, &a7[8 * v58]);
  }

  *(void *)(v59 + 16) = v50;
  return result;
}

uint64_t cccbc_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t cccbc_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
}

uint64_t ccmode_ctr_setctr(int a1, void *a2, void *__src)
{
  uint64_t v3 = *a2;
  a2[1] = *(void *)(*a2 + 8LL);
  memcpy((char *)a2 + ((*(void *)(v3 + 8) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16, __src, *(void *)(v3 + 8));
  return 0LL;
}

uint64_t ccn_random_bits( uint64_t a1, uint64_t a2, uint64_t (**a3)(void, unint64_t, uint64_t))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  uint64_t result = (*a3)(a3, 8 * v5, a2);
  if (!(_DWORD)result) {
    *(void *)(a2 + 8 * v5 - 8) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return result;
}

uint64_t ccn_random_bits_fips( uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  if ((unint64_t)(a1 + 63) > 0x7F)
  {
    uint64_t v6 = (*a3)(a3, 8 * v5, a2);
  }

  else
  {
    int v9 = 0;
    uint64_t __src = 0LL;
    uint64_t v6 = (*a3)(a3, 12uLL, &__src);
    memcpy(a2, &__src, 8 * v5);
    cc_clear(8 * v5, &__src);
  }

  if (!(_DWORD)v6) {
    *((void *)a2 + v5 - 1) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return v6;
}

uint64_t ccn_read_uint_public_value( unint64_t a1, void *a2, unint64_t a3, unsigned __int8 *a4)
{
  unint64_t v4 = 8 * a1;
  if (a3 > 8 * a1)
  {
    int v5 = 0;
    unint64_t v6 = a3 - v4;
    unint64_t v7 = a4;
    do
    {
      int v8 = *v7++;
      v5 |= v8;
      --a3;
    }

    while (a3 > v4);
    if (v5) {
      return 4294967289LL;
    }
    a4 += v6;
    a3 = 8 * a1;
  }

  if (a3 < 8)
  {
    unint64_t v10 = 0LL;
  }

  else
  {
    unint64_t v10 = ((a3 - 8) >> 3) + 1;
    uint64_t v11 = a2;
    unint64_t v12 = v10;
    do
    {
      *v11++ = bswap64(*(void *)&a4[a3 - 8]);
      a3 -= 8LL;
      --v12;
    }

    while (v12);
  }

  if (a3)
  {
    unint64_t v13 = 0LL;
    uint64_t v14 = -(uint64_t)a3;
    do
      unint64_t v13 = a4[a3 + v14] | (v13 << 8);
    while (!__CFADD__(v14++, 1LL));
    a2[v10++] = v13;
  }

  if (v10 < a1) {
    bzero(&a2[v10], v4 - 8 * v10);
  }
  return 0LL;
}

void *ccn_set(uint64_t a1, void *__dst, void *__src)
{
  return memmove(__dst, __src, 8 * a1);
}

uint64_t ccrng_process_init( uint64_t a1, uint64_t (*a2)(void), uint64_t (**a3)(void, uint64_t, _OWORD *))
{
  uint64_t v6 = a1 + 128;
  ccrng_schedule_timer_init(a1 + 128, a2, 5000000000LL);
  ccrng_schedule_atomic_flag_init(a1 + 168);
  ccrng_schedule_tree_init(a1 + 96, v6, a1 + 168);
  uint64_t result = cc_lock_init((_DWORD *)(a1 + 208));
  if (!(_DWORD)result)
  {
    uint64_t result = ccentropy_rng_init((void *)(a1 + 192), (uint64_t)a3);
    if (!(_DWORD)result)
    {
      int v8 = ccaes_cbc_encrypt_mode();
      uint64_t result = ccdrbg_df_bc_init_internal((void *)(a1 + 224), v8, 0x20uLL);
      if (!(_DWORD)result)
      {
        int v9 = ccaes_ctr_crypt_mode();
        __int128 v10 = xmmword_1000262C0;
        DWORD2(v10) = 1;
        uint64_t v11 = a1 + 224;
        ccdrbg_factory_nistctr((void *)(a1 + 768), (uint64_t)&v9);
        memset(v13, 0, sizeof(v13));
        uint64_t result = (*a3)(a3, 32LL, v13);
        if (!(_DWORD)result)
        {
          a2();
          strcpy(v12, "corecrypto process rng");
          uint64_t result = ccdrbg_init_internal(a1 + 768);
          if (!(_DWORD)result)
          {
            uint64_t result = ccrng_crypto_init( (void *)(a1 + 8),  a1 + 192,  a1 + 96,  a1 + 208,  a1 + 768,  a1 + 824,  4096LL,  0x20uLL,  256LL,  a1 + 2104);
            if (!(_DWORD)result) {
              *(void *)a1 = sub_100009228;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100009228(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(a1 + 8);
}

uint64_t ccrng_process_atfork_prepare(os_unfair_lock_s *a1)
{
  return 0LL;
}

uint64_t ccrng_process_atfork_parent(os_unfair_lock_s *a1)
{
  return 0LL;
}

uint64_t ccrng_process_atfork_child(uint64_t a1)
{
  return cc_lock_init((_DWORD *)(a1 + 208));
}

uint64_t ccn_shift_right(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result) {
    return ccn_shift_right_asm(result, a2, a3, a4);
  }
  return result;
}

uint64_t ccn_shift_right_multi(uint64_t a1, int8x16_t *a2, int8x16_t *a3, unint64_t a4)
{
  uint64_t result = ccn_shift_right(a1, a2, a3, a4 & 0x3F);
  if (a1)
  {
    uint64_t v8 = 0LL;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v8;
      do
      {
        v9 |= ((((v10 ^ ((_DWORD)v8 + (a4 >> 6)) | ((v10 ^ (v8 + (a4 >> 6))) >> 32))
               + 0xFFFFFFFF) >> 32)
             - 1) & a2->i64[v10];
        ++v10;
      }

      while (a1 != v10);
      a2->i64[v8++] = v9;
    }

    while (v8 != a1);
  }

  return result;
}

BOOL ccn_sub_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, unint64_t *a5)
{
  return ccn_sub_asm(a2, a3, a4, a5);
}

BOOL ccn_sub_asm(BOOL result, void *a2, uint64_t *a3, unint64_t *a4)
{
  _BOOL1 v4 = 1;
  if (result)
  {
    if (result)
    {
      unint64_t v6 = *a3++;
      unint64_t v5 = v6;
      unint64_t v7 = *a4++;
      _BOOL1 v4 = v5 >= v7;
      *a2++ = v5 - v7;
    }

    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      unint64_t v10 = *a4;
      unint64_t v11 = a4[1];
      a4 += 2;
      _BOOL1 v13 = v4;
      _BOOL1 v4 = __CFSUB__(v8, v10, v4);
      uint64_t v12 = v8 - (v10 + !v13);
      _BOOL1 v14 = v4;
      _BOOL1 v4 = __CFSUB__(v9, v11, v4);
      *a2 = v12;
      a2[1] = v9 - (v11 + !v14);
      a2 += 2;
    }

    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      uint64_t v17 = a3 + 2;
      unint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      int v20 = (uint64_t *)(a4 + 2);
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      unint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        _BOOL1 v30 = v4;
        _BOOL1 v4 = __CFSUB__(v18, v21, v4);
        uint64_t v29 = v18 - (v21 + !v30);
        _BOOL1 v32 = v4;
        _BOOL1 v4 = __CFSUB__(v19, v22, v4);
        uint64_t v31 = v19 - (v22 + !v32);
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        _BOOL1 v35 = v4;
        _BOOL1 v4 = __CFSUB__(v24, v27, v4);
        uint64_t v34 = v24 - (v27 + !v35);
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        _BOOL1 v37 = v4;
        _BOOL1 v4 = __CFSUB__(v25, v28, v4);
        unint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        void *v36 = v34;
        v36[1] = v25 - (v28 + !v37);
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        unint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }

      _BOOL1 v40 = v4;
      _BOOL1 v4 = __CFSUB__(v18, v21, v4);
      uint64_t v39 = v18 - (v21 + !v40);
      _BOOL1 v42 = v4;
      _BOOL1 v4 = __CFSUB__(v19, v22, v4);
      uint64_t v41 = v19 - (v22 + !v42);
      _BOOL1 v44 = v4;
      _BOOL1 v4 = __CFSUB__(v24, v27, v4);
      uint64_t v43 = v24 - (v27 + !v44);
      _BOOL1 v45 = v4;
      _BOOL1 v4 = __CFSUB__(v25, v28, v4);
      *a2 = v39;
      a2[1] = v41;
      BOOL v46 = a2 + 2;
      void *v46 = v43;
      v46[1] = v25 - (v28 + !v45);
    }

    return !v4;
  }

  return result;
}

unint64_t ccn_sub1(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  {
    unint64_t v4 = *a3++;
    unsigned __int128 v5 = v4 - (unsigned __int128)a4;
    *a2++ = v5;
    a4 = *((void *)&v5 + 1) >> 63;
  }

  return a4;
}

unint64_t ccn_write_uint_size_internal(unint64_t a1, unint64_t *a2)
{
  return (ccn_bitlen_public_value(a1, a2) + 7) >> 3;
}

uint64_t ccn_write_uint_padded_ct_internal( unint64_t a1, unint64_t *a2, unint64_t a3, char *__s)
{
  if (a3 > 0x7FFFFFFE) {
    return 4294967289LL;
  }
  unint64_t v6 = 8 * a1;
  if (8 * a1 > 0x7FFFFFFE) {
    return 4294967289LL;
  }
  unint64_t v7 = __s;
  unint64_t v8 = a3;
  unint64_t v10 = a3 - v6;
  if (a3 <= v6)
  {
    LODWORD(v10) = 0;
  }

  else
  {
    cc_clear(a3 - v6, __s);
    v7 += v10;
    unint64_t v8 = v6;
  }

  unint64_t v11 = ccn_bitlen_public_value(a1, a2);
  if (v8 < (v11 + 7) >> 3) {
    return 4294967289LL;
  }
  uint64_t result = (_DWORD)v10 + (_DWORD)v8 - ((v11 + 7) >> 3);
  if (v8 < 8)
  {
    unint64_t v12 = 0LL;
  }

  else
  {
    unint64_t v12 = ((v8 - 8) >> 3) + 1;
    _BOOL1 v13 = a2;
    unint64_t v14 = v12;
    do
    {
      unint64_t v15 = *v13++;
      *(void *)&v7[v8 - 8] = bswap64(v15);
      v8 -= 8LL;
      --v14;
    }

    while (v14);
  }

  if (v8)
  {
    unint64_t v16 = a2[v12];
    uint64_t v17 = &v7[v8 - 1];
    do
    {
      *v17-- = v16;
      v16 >>= 8;
      --v8;
    }

    while (v8);
  }

  return result;
}

unint64_t ccn_write_uint_public_value( unint64_t a1, unint64_t *a2, unint64_t a3, uint64_t a4)
{
  unint64_t result = ccn_bitlen_public_value(a1, a2);
  unint64_t v9 = (result + 7) >> 3;
  if (v9 >= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = (result + 7) >> 3;
  }
  uint64_t v11 = a4 + v10;
  unint64_t v12 = v9 - v10;
  unint64_t v13 = v12 >> 3;
  unint64_t v14 = v12 & 7;
  unint64_t v15 = a2[v12 >> 3] >> (8 * (v12 & 7u));
  if (v10 >= 8)
  {
    do
    {
      unint64_t v16 = v10 - 8;
      unint64_t v17 = v14 - 8;
      do
      {
        *(_BYTE *)--uint64_t v11 = v15;
        v15 >>= 8;
      }

      while (!__CFADD__(v17++, 1LL));
      if (v13 + 1 < a1) {
        unint64_t v15 = a2[++v13];
      }
      unint64_t v10 = v16 + v14;
      unint64_t v14 = 0LL;
    }

    while (v10 > 7);
  }

  if (v10)
  {
    uint64_t v19 = (_BYTE *)(v11 - 1);
    do
    {
      *v19-- = v15;
      v15 >>= 8;
      --v10;
    }

    while (v10);
  }

  return result;
}

BOOL ccn_add1_asm(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4)
{
  if (!a1) {
    return a4;
  }
  uint64_t v5 = *a3;
  unint64_t v4 = a3 + 1;
  BOOL v6 = __CFADD__(v5, a4);
  *a2 = v5 + a4;
  for (uint64_t i = a2 + 1; --a1; ++i)
  {
    uint64_t v8 = *v4++;
    BOOL v9 = v6;
    BOOL v6 = __CFADD__(v6, v8);
    *uint64_t i = v9 + v8;
  }

  return v6;
}

uint64_t ccn_cond_neg(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  uint64_t v9 = __ROR8__(0x5555555555555555LL, a2 | (2 * result));
  if (a1)
  {
    BOOL v10 = 1LL;
    do
    {
      uint64_t v12 = *a4++;
      uint64_t v11 = v12;
      BOOL v13 = v10 + ~v12;
      BOOL v10 = __CFADD__(v10, ~v12);
      uint64_t v14 = v11 ^ v13;
      uint64_t v15 = v11 ^ result;
      *a3 = v15;
      *a3++ = v14 & v9 ^ v14 & 0x5555555555555555LL ^ v15 ^ result;
      --a1;
    }

    while (a1);
  }

  return result;
}

unint64_t ccec_compressed_x962_export_pub_size(uint64_t a1)
{
  return ((unint64_t)(cczp_bitlen(a1) + 7) >> 3) + 1;
}

uint64_t sizeof_cc_unit()
{
  return 8LL;
}

BOOL ccec_validate_pub(uint64_t **a1)
{
  BOOL v19 = timingsafe_enable_if_supported();
  unint64_t v2 = *a1;
  uint64_t v3 = **a1;
  unint64_t v4 = sizeof_cc_unit();
  unint64_t v5 = 5 * v3 + (v4 + 7) / v4 + 3;
  if (v5 <= 7 * v3) {
    unint64_t v5 = 7 * v3;
  }
  BOOL v6 = cc_malloc_clear(8 * (v5 + 3 * v3));
  v15[0] = v6;
  uint64_t v7 = *v2;
  unint64_t v8 = sizeof_cc_unit();
  unint64_t v9 = 5 * v7 + (v8 + 7) / v8 + 3;
  if (v9 <= 7 * v7) {
    unint64_t v9 = 7 * v7;
  }
  v15[1] = v9 + 3 * v7;
  uint64_t v16 = 0LL;
  unint64_t v17 = cc_ws_alloc;
  uint64_t v18 = cc_ws_free;
  if (v6)
  {
    BOOL v10 = *a1;
    uint64_t v11 = cc_ws_alloc(v15, 3 * **a1);
    int v12 = ccec_validate_point_and_projectify_ws((uint64_t)v15, v10, v11, (uint64_t)(a1 + 2));
    uint64_t v16 = 0LL;
    v18((uint64_t)v15);
    BOOL v13 = v12 == 0;
  }

  else
  {
    BOOL v13 = 0LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v19);
  return v13;
}

uint64_t cc_lock_init(_DWORD *a1)
{
  *a1 = 0;
  return 0LL;
}

unint64_t ccn_subn(uint64_t a1, void *a2, uint64_t *a3, BOOL a4, unint64_t *a5)
{
  uint64_t v5 = a1 - a4;
  BOOL v6 = &a2[a4];
  uint64_t v7 = (unint64_t *)&a3[a4];
  unint64_t v8 = ccn_sub_ws(0LL, a4, a2, a3, a5);
  return ccn_sub1(v5, v6, v7, v8);
}

uint64_t ccec_validate_scalar(void *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = cczp_prime((uint64_t)&a1[5 * *a1 + 4]);
  if (ccn_n(*a1, a2)) {
    return 0LL;
  }
  return 0xFFFFFFFFLL;
}

int32x4_t *AccelerateCrypto_SHA256_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int8x16_t v4 = *a3;
    int8x16_t v5 = a3[1];
    int8x16_t v6 = a3[2];
    int8x16_t v7 = a3[3];
    uint64_t v3 = a3 + 4;
    _Q1 = (int32x4_t)vrev32q_s8(v5);
    int32x4_t v9 = *result;
    _Q2 = (int32x4_t)vrev32q_s8(v6);
    _Q17 = result[1];
    _Q3 = (int32x4_t)vrev32q_s8(v7);
    _Q18 = *result;
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v4), (int32x4_t)xmmword_100009900);
    _Q5 = vaddq_s32(_Q1, (int32x4_t)xmmword_100009910);
    _Q19 = _Q17;
    _Q6 = vaddq_s32(_Q2, (int32x4_t)xmmword_100009920);
    _Q7 = vaddq_s32(_Q3, (int32x4_t)xmmword_100009930);
    BOOL v19 = &xmmword_100009940;
    int v20 = 3;
    do
    {
      _Q20 = _Q18;
      int32x4_t v22 = (int32x4_t)*v19;
      __asm { SHA256SU0       V0.4S, V1.4S }

      int32x4_t v28 = (int32x4_t)v19[1];
      __asm { SHA256H         Q18, Q19, V4.4S }

      int32x4_t v30 = (int32x4_t)v19[2];
      __asm { SHA256SU1       V0.4S, V2.4S, V3.4S }

      int32x4_t v32 = (int32x4_t)v19[3];
      __asm { SHA256H2        Q19, Q20, V4.4S }

      v19 += 4;
      _Q4 = vaddq_s32(_Q0, v22);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V1.4S, V2.4S
        SHA256H         Q18, Q19, V5.4S
        SHA256SU1       V1.4S, V3.4S, V0.4S
        SHA256H2        Q19, Q20, V5.4S
      }

      _Q5 = vaddq_s32(_Q1, v28);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V2.4S, V3.4S
        SHA256H         Q18, Q19, V6.4S
        SHA256SU1       V2.4S, V0.4S, V1.4S
        SHA256H2        Q19, Q20, V6.4S
      }

      _Q6 = vaddq_s32(_Q2, v30);
      --v20;
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V3.4S, V0.4S
        SHA256H         Q18, Q19, V7.4S
        SHA256SU1       V3.4S, V1.4S, V2.4S
        SHA256H2        Q19, Q20, V7.4S
      }

      _Q7 = vaddq_s32(_Q3, v32);
    }

    while (!(_NF ^ _VF | _ZF));
    BOOL v44 = a2 <= 1;
    uint64_t v45 = a2 - 1;
    if (!v44)
    {
      BOOL v46 = (int32x4_t *)(v19 - 16);
      do
      {
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V4.4S }

        int8x16_t v49 = v3[1];
        int8x16_t v50 = v3[2];
        __asm { SHA256H2        Q19, Q20, V4.4S }

        int8x16_t v52 = v3[3];
        _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(*v3), *v46);
        _Q20 = _Q18;
        v3 += 4;
        __asm { SHA256H         Q18, Q19, V5.4S }

        _Q1 = (int32x4_t)vrev32q_s8(v49);
        __asm { SHA256H2        Q19, Q20, V5.4S }

        _Q5 = vaddq_s32(_Q1, v46[1]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V6.4S }

        _Q2 = (int32x4_t)vrev32q_s8(v50);
        __asm { SHA256H2        Q19, Q20, V6.4S }

        _Q6 = vaddq_s32(_Q2, v46[2]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V7.4S }

        _Q3 = (int32x4_t)vrev32q_s8(v52);
        __asm { SHA256H2        Q19, Q20, V7.4S }

        _Q7 = vaddq_s32(_Q3, v46[3]);
        int32x4_t v9 = vaddq_s32(v9, _Q18);
        _Q17 = vaddq_s32(_Q17, _Q19);
        _Q20 = v9;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }

        _Q4 = vaddq_s32(_Q0, v46[4]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }

        _Q5 = vaddq_s32(_Q1, v46[5]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }

        _Q6 = vaddq_s32(_Q2, v46[6]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }

        _Q7 = vaddq_s32(_Q3, v46[7]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }

        _Q4 = vaddq_s32(_Q0, v46[8]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }

        _Q5 = vaddq_s32(_Q1, v46[9]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }

        _Q6 = vaddq_s32(_Q2, v46[10]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }

        _Q7 = vaddq_s32(_Q3, v46[11]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }

        _Q4 = vaddq_s32(_Q0, v46[12]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }

        _Q5 = vaddq_s32(_Q1, v46[13]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }

        _Q6 = vaddq_s32(_Q2, v46[14]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }

        _Q7 = vaddq_s32(_Q3, v46[15]);
        BOOL v44 = v45-- <= 1;
      }

      while (!v44);
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V4.4S
      SHA256H2        Q19, Q20, V4.4S
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V5.4S
      SHA256H2        Q19, Q20, V5.4S
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V6.4S
      SHA256H2        Q19, Q20, V6.4S
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V7.4S
      SHA256H2        Q19, Q20, V7.4S
    }

    *uint64_t result = vaddq_s32(v9, _Q18);
    result[1] = vaddq_s32(_Q17, _Q19);
  }

  return result;
}

uint64_t ccec_import_affine_point_ws( uint64_t a1, unint64_t *a2, int a3, uint64_t a4, unsigned __int8 *a5, void *a6)
{
  if (!a4) {
    return 4294967289LL;
  }
  unint64_t v11 = *a2;
  if (a4 == 1 && !*a5) {
    return 4294967136LL;
  }
  switch(a3)
  {
    case 4:
      uint64_t v12 = 4294967124LL;
      goto LABEL_20;
    case 1:
      uint64_t v12 = 4294967126LL;
      if (*a5 != 4) {
        return v12;
      }
LABEL_20:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v11);
      if (a3 == 4) {
        uint64_t v16 = a5;
      }
      else {
        uint64_t v16 = a5 + 1;
      }
      uint64_t v17 = cczp_bitlen((uint64_t)a2);
      uint64_t uint_public_value = ccn_read_uint_public_value(v11, a6, (unint64_t)(v17 + 7) >> 3, v16);
      if (ccn_cmp_public_value(v11, a6, a2 + 3) == -1)
      {
        if ((a3 - 3) <= 1)
        {
          uint64_t uint_public_value = ccec_affine_point_from_x_ws(a1, a2, (uint64_t)a6, (uint64_t)a6);
          if (!(_DWORD)uint_public_value)
          {
            cczp_negate((uint64_t)a2, v15, &a6[*a2]);
            BOOL v19 = &a6[*a2];
            if (a3 == 4) {
              unsigned int v20 = ccn_cmp_public_value(v11, v15, v19) >> 31;
            }
            else {
              LOBYTE(v20) = (*v19 & 1) != (*a5 & 1);
            }
            ccn_mux(v11, v20, v19, v15, v19);
            goto LABEL_35;
          }

LABEL_38:
          uint64_t v12 = uint_public_value;
          goto LABEL_36;
        }

        unint64_t v21 = &a5[((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3) + 1];
        int32x4_t v22 = &a6[*a2];
        uint64_t v23 = cczp_bitlen((uint64_t)a2);
        uint64_t v12 = ccn_read_uint_public_value(v11, v22, (unint64_t)(v23 + 7) >> 3, v21);
        if (!(_DWORD)v12)
        {
          if (a3 != 2 || (a6[*a2] & 1LL) == (*a5 & 1))
          {
LABEL_35:
            uint64_t v12 = 0LL;
            goto LABEL_36;
          }

          uint64_t v12 = 4294967125LL;
        }
      }

LABEL_36:
      *(void *)(a1 + 16) = v14;
      return v12;
    case 2:
      unsigned int v13 = *a5 - 8;
      uint64_t v12 = 4294967125LL;
      goto LABEL_19;
  }

  if (a3 != 3) {
    return 4294967289LL;
  }
  unsigned int v13 = *a5 - 4;
  uint64_t v12 = 4294967135LL;
LABEL_19:
  if (v13 >= 0xFFFFFFFE) {
    goto LABEL_20;
  }
  return v12;
}

              CFRelease(v25);
              goto LABEL_37;
            }

            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "SOCD data collection still in progress",  buf,  2u);
            }

            usleep(0x186A0u);
            if (!(_BYTE)--v26) {
              goto LABEL_36;
            }
          }

          unint64_t v36 = (void *)qword_100036550;
          if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
          {
            uint64_t v47 = v36;
            unint64_t v48 = CFGetTypeID(v28);
            *(_DWORD *)buf = 136315394;
            v61 = (void *)a4;
            unint64_t v62 = 2048;
            uint64_t v63 = v48;
            _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s of unexpected type %lu",  buf,  0x16u);
          }

          CFRelease(v28);
          CFRelease(v25);
        }

        else
        {
          unint64_t v33 = qword_100036550;
          if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v61 = (void *)a4;
            uint64_t v34 = (os_log_s *)v33;
            _BOOL1 v35 = "Error creating CFString for key %s";
            goto LABEL_49;
          }
        }

        goto LABEL_51;
      }

int8x16_t gcm_init( int8x16_t *a1, int8x16_t *a2, double a3, double a4, double a5, double a6, double a7, int8x16_t a8)
{
  int32x4_t v8 = (int32x4_t)vqtbl1q_s8(*a2, *(int8x16_t *)qword_10000A600);
  int8x16_t v9 = veorq_s8(a8, a8);
  int8x16_t v10 = veorq_s8( vandq_s8( vextq_s8(*(int8x16_t *)&qword_10000A600[2], *(int8x16_t *)&qword_10000A600[2], 8uLL),  (int8x16_t)vshrq_n_s32(vdupq_laneq_s32(v8, 3), 0x1FuLL)),  vorrq_s8( vextq_s8(v9, (int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x3FuLL), 8uLL),  (int8x16_t)vshlq_n_s64((int64x2_t)v8, 1uLL)));
  *a1 = v10;
  a1[8] = veorq_s8(v10, vextq_s8(v10, v10, 8uLL));
  int8x16_t v11 = (int8x16_t)vmull_high_p64((uint64x2_t)v10, (uint64x2_t)v10);
  int8x16_t v12 = (int8x16_t)vmull_p64(v10.u64[0], v10.u64[0]);
  int8x16_t v13 = veorq_s8( v12,  veorq_s8( v11,  (int8x16_t)vmull_p64( veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0],  veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0])));
  int8x16_t v14 = veorq_s8(vextq_s8(v9, v13, 8uLL), v12);
  int8x16_t v15 = veorq_s8(vextq_s8(v14, v14, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v14.u64[0]));
  int8x16_t v16 = veorq_s8( veorq_s8(vextq_s8(v13, v9, 8uLL), v11),  veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v15.u64[0])));
  a1[1] = v16;
  a1[9] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL));
  v13.i64[0] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL)).u64[0];
  int8x16_t v17 = (int8x16_t)vmull_high_p64((uint64x2_t)v16, (uint64x2_t)v10);
  int8x16_t v18 = (int8x16_t)vmull_p64(v16.u64[0], v10.u64[0]);
  int8x16_t v19 = veorq_s8(v18, veorq_s8(v17, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v13.u64[0])));
  int8x16_t v20 = veorq_s8(vextq_s8(v9, v19, 8uLL), v18);
  int8x16_t v21 = veorq_s8(vextq_s8(v20, v20, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v20.u64[0]));
  int8x16_t v22 = veorq_s8( veorq_s8(vextq_s8(v19, v9, 8uLL), v17),  veorq_s8(vextq_s8(v21, v21, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v21.u64[0])));
  a1[2] = v22;
  a1[10] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL));
  v19.i64[0] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL)).u64[0];
  int8x16_t v23 = (int8x16_t)vmull_high_p64((uint64x2_t)v22, (uint64x2_t)v10);
  int8x16_t v24 = (int8x16_t)vmull_p64(v22.u64[0], v10.u64[0]);
  int8x16_t v25 = veorq_s8(v24, veorq_s8(v23, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v19.u64[0])));
  int8x16_t v26 = veorq_s8(vextq_s8(v9, v25, 8uLL), v24);
  int8x16_t v27 = veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v26.u64[0]));
  int8x16_t v28 = veorq_s8( veorq_s8(vextq_s8(v25, v9, 8uLL), v23),  veorq_s8(vextq_s8(v27, v27, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v27.u64[0])));
  a1[3] = v28;
  a1[11] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL));
  v25.i64[0] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0];
  int8x16_t v29 = (int8x16_t)vmull_high_p64((uint64x2_t)v28, (uint64x2_t)v10);
  int8x16_t v30 = (int8x16_t)vmull_p64(v28.u64[0], v10.u64[0]);
  int8x16_t v31 = veorq_s8(v30, veorq_s8(v29, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v25.u64[0])));
  int8x16_t v32 = veorq_s8(vextq_s8(v9, v31, 8uLL), v30);
  int8x16_t v33 = veorq_s8(vextq_s8(v32, v32, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v32.u64[0]));
  int8x16_t v34 = veorq_s8( veorq_s8(vextq_s8(v31, v9, 8uLL), v29),  veorq_s8(vextq_s8(v33, v33, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v33.u64[0])));
  a1[4] = v34;
  a1[12] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL));
  v31.i64[0] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL)).u64[0];
  int8x16_t v35 = (int8x16_t)vmull_high_p64((uint64x2_t)v34, (uint64x2_t)v10);
  int8x16_t v36 = (int8x16_t)vmull_p64(v34.u64[0], v10.u64[0]);
  int8x16_t v37 = veorq_s8(v36, veorq_s8(v35, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v31.u64[0])));
  int8x16_t v38 = veorq_s8(vextq_s8(v9, v37, 8uLL), v36);
  int8x16_t v39 = veorq_s8(vextq_s8(v38, v38, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v38.u64[0]));
  int8x16_t v40 = veorq_s8( veorq_s8(vextq_s8(v37, v9, 8uLL), v35),  veorq_s8(vextq_s8(v39, v39, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v39.u64[0])));
  a1[5] = v40;
  a1[13] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL));
  v37.i64[0] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL)).u64[0];
  int8x16_t v41 = (int8x16_t)vmull_high_p64((uint64x2_t)v40, (uint64x2_t)v10);
  int8x16_t v42 = (int8x16_t)vmull_p64(v40.u64[0], v10.u64[0]);
  int8x16_t v43 = veorq_s8(v42, veorq_s8(v41, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v37.u64[0])));
  int8x16_t v44 = veorq_s8(vextq_s8(v9, v43, 8uLL), v42);
  int8x16_t v45 = veorq_s8(vextq_s8(v44, v44, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v44.u64[0]));
  int8x16_t v46 = veorq_s8( veorq_s8(vextq_s8(v43, v9, 8uLL), v41),  veorq_s8(vextq_s8(v45, v45, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v45.u64[0])));
  a1[6] = v46;
  a1[14] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL));
  v43.i64[0] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL)).u64[0];
  int8x16_t v47 = (int8x16_t)vmull_high_p64((uint64x2_t)v46, (uint64x2_t)v10);
  int8x16_t v48 = (int8x16_t)vmull_p64(v46.u64[0], v10.u64[0]);
  int8x16_t v49 = veorq_s8(v48, veorq_s8(v47, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v43.u64[0])));
  int8x16_t v50 = veorq_s8(vextq_s8(v9, v49, 8uLL), v48);
  int8x16_t v51 = veorq_s8(vextq_s8(v50, v50, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v50.u64[0]));
  int8x16_t result = veorq_s8( veorq_s8(vextq_s8(v49, v9, 8uLL), v47),  veorq_s8(vextq_s8(v51, v51, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v51.u64[0])));
  a1[7] = result;
  a1[15] = veorq_s8(result, vextq_s8(result, result, 8uLL));
  return result;
}

int8x16_t gcm_gmult( int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, double a4, double a5, double a6, double a7, double a8, int8x16_t a9)
{
  int8x16_t v9 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10000A600);
  int8x16_t v10 = veorq_s8(a9, a9);
  unint64_t v11 = veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0];
  int8x16_t v12 = (int8x16_t)vmull_high_p64((uint64x2_t)v9, *a2);
  int8x16_t v13 = (int8x16_t)vmull_p64(v9.u64[0], a2->i64[0]);
  int8x16_t v14 = veorq_s8( v13,  veorq_s8( v12,  (int8x16_t)vmull_p64( veorq_s8(*(int8x16_t *)a2, vextq_s8(*(int8x16_t *)a2, *(int8x16_t *)a2, 8uLL)).u64[0],  v11)));
  int8x16_t v15 = veorq_s8(vextq_s8(v10, v14, 8uLL), v13);
  int8x16_t v16 = veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v15.u64[0]));
  int8x16_t result = vqtbl1q_s8( veorq_s8( veorq_s8(vextq_s8(v14, v10, 8uLL), v12),  veorq_s8(vextq_s8(v16, v16, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v16.u64[0]))),  *(int8x16_t *)qword_10000A600);
  *a3 = result;
  return result;
}

int8x16_t gcm_ghash(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, uint64_t a4)
{
  int8x16_t v5 = veorq_s8(v4, v4);
  int8x16_t v6 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10000A600);
  BOOL v7 = a4 < 128;
  for (uint64_t i = a4 - 128; !v7; i -= 128LL)
  {
    int8x16_t v9 = vqtbl1q_s8(a3[7], *(int8x16_t *)qword_10000A600);
    int8x16_t v10 = (int8x16_t)vmull_p64(a2->i64[0], v9.u64[0]);
    int8x16_t v11 = (int8x16_t)vmull_high_p64(*a2, (uint64x2_t)v9);
    int8x16_t v12 = (int8x16_t)vmull_p64(a2[8].u64[0], veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0]);
    int8x16_t v13 = vqtbl1q_s8(a3[6], *(int8x16_t *)qword_10000A600);
    uint64x2_t v14 = a2[1];
    int8x16_t v15 = veorq_s8(v10, (int8x16_t)vmull_p64(v14.u64[0], v13.u64[0]));
    int8x16_t v16 = veorq_s8(v11, (int8x16_t)vmull_high_p64(v14, (uint64x2_t)v13));
    int8x16_t v17 = veorq_s8(v12, (int8x16_t)vmull_p64(a2[9].u64[0], veorq_s8(v13, vextq_s8(v13, v13, 8uLL)).u64[0]));
    int8x16_t v18 = vqtbl1q_s8(a3[5], *(int8x16_t *)qword_10000A600);
    uint64x2_t v19 = a2[2];
    int8x16_t v20 = veorq_s8(v15, (int8x16_t)vmull_p64(v19.u64[0], v18.u64[0]));
    int8x16_t v21 = veorq_s8(v16, (int8x16_t)vmull_high_p64(v19, (uint64x2_t)v18));
    int8x16_t v22 = veorq_s8(v17, (int8x16_t)vmull_p64(a2[10].u64[0], veorq_s8(v18, vextq_s8(v18, v18, 8uLL)).u64[0]));
    int8x16_t v23 = vqtbl1q_s8(a3[4], *(int8x16_t *)qword_10000A600);
    uint64x2_t v24 = a2[3];
    int8x16_t v25 = veorq_s8(v20, (int8x16_t)vmull_p64(v24.u64[0], v23.u64[0]));
    int8x16_t v26 = veorq_s8(v21, (int8x16_t)vmull_high_p64(v24, (uint64x2_t)v23));
    int8x16_t v27 = veorq_s8(v22, (int8x16_t)vmull_p64(a2[11].u64[0], veorq_s8(v23, vextq_s8(v23, v23, 8uLL)).u64[0]));
    int8x16_t v28 = vqtbl1q_s8(a3[3], *(int8x16_t *)qword_10000A600);
    uint64x2_t v29 = a2[4];
    int8x16_t v30 = veorq_s8(v25, (int8x16_t)vmull_p64(v29.u64[0], v28.u64[0]));
    int8x16_t v31 = veorq_s8(v26, (int8x16_t)vmull_high_p64(v29, (uint64x2_t)v28));
    int8x16_t v32 = veorq_s8(v27, (int8x16_t)vmull_p64(a2[12].u64[0], veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0]));
    int8x16_t v33 = vqtbl1q_s8(a3[2], *(int8x16_t *)qword_10000A600);
    uint64x2_t v34 = a2[5];
    int8x16_t v35 = veorq_s8(v30, (int8x16_t)vmull_p64(v34.u64[0], v33.u64[0]));
    int8x16_t v36 = veorq_s8(v31, (int8x16_t)vmull_high_p64(v34, (uint64x2_t)v33));
    int8x16_t v37 = veorq_s8(v32, (int8x16_t)vmull_p64(a2[13].u64[0], veorq_s8(v33, vextq_s8(v33, v33, 8uLL)).u64[0]));
    int8x16_t v38 = vqtbl1q_s8(a3[1], *(int8x16_t *)qword_10000A600);
    uint64x2_t v39 = a2[6];
    int8x16_t v40 = veorq_s8(v35, (int8x16_t)vmull_p64(v39.u64[0], v38.u64[0]));
    int8x16_t v41 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v39, (uint64x2_t)v38));
    int8x16_t v42 = veorq_s8(v37, (int8x16_t)vmull_p64(a2[14].u64[0], veorq_s8(v38, vextq_s8(v38, v38, 8uLL)).u64[0]));
    uint64x2_t v43 = a2[7];
    int8x16_t v44 = veorq_s8(vqtbl1q_s8(*a3, *(int8x16_t *)qword_10000A600), v6);
    int8x16_t v45 = veorq_s8(v40, (int8x16_t)vmull_p64(v43.u64[0], v44.u64[0]));
    int8x16_t v46 = veorq_s8(v41, (int8x16_t)vmull_high_p64(v43, (uint64x2_t)v44));
    int8x16_t v47 = veorq_s8( v46,  veorq_s8( v45,  veorq_s8(v42, (int8x16_t)vmull_p64(a2[15].u64[0], veorq_s8(v44, vextq_s8(v44, v44, 8uLL)).u64[0]))));
    int8x16_t v48 = veorq_s8(v45, vextq_s8(v5, v47, 8uLL));
    int8x16_t v49 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v48.u64[0]), vextq_s8(v48, v48, 8uLL));
    int8x16_t v6 = veorq_s8( veorq_s8(v46, vextq_s8(v47, v5, 8uLL)),  veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v49.u64[0]), vextq_s8(v49, v49, 8uLL)));
    a3 += 8;
    BOOL v7 = i < 128;
  }

  BOOL v7 = i < -112;
  uint64_t v50 = i + 112;
  if (!v7)
  {
    int8x16_t v52 = *a3;
    int8x16_t v51 = a3 + 1;
    int8x16_t v53 = veorq_s8(v6, vqtbl1q_s8(v52, *(int8x16_t *)qword_10000A600));
    char v54 = (uint64x2_t *)((char *)a2 + v50);
    uint64x2_t v55 = *(uint64x2_t *)((char *)a2 + v50);
    int8x16_t v56 = (int8x16_t)vmull_p64(v53.u64[0], v55.u64[0]);
    int8x16_t v57 = (int8x16_t)vmull_high_p64((uint64x2_t)v53, v55);
    int8x16_t v58 = (int8x16_t)vmull_p64( veorq_s8(v53, vextq_s8(v53, v53, 8uLL)).u64[0],  *(unint64_t *)((char *)a2[8].u64 + v50));
    BOOL v7 = v50 < 16;
    for (uint64_t j = v50 - 16; !v7; j -= 16LL)
    {
      --v54;
      int8x16_t v60 = *v51++;
      int8x16_t v61 = vqtbl1q_s8(v60, *(int8x16_t *)qword_10000A600);
      int8x16_t v56 = veorq_s8(v56, (int8x16_t)vmull_p64(v61.u64[0], v54->i64[0]));
      int8x16_t v57 = veorq_s8(v57, (int8x16_t)vmull_high_p64((uint64x2_t)v61, *v54));
      int8x16_t v58 = veorq_s8(v58, (int8x16_t)vmull_p64(veorq_s8(v61, vextq_s8(v61, v61, 8uLL)).u64[0], v54[8].u64[0]));
      BOOL v7 = j < 16;
    }

    int8x16_t v62 = veorq_s8(v57, veorq_s8(v56, v58));
    int8x16_t v63 = veorq_s8(v56, vextq_s8(v5, v62, 8uLL));
    int8x16_t v64 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v63.u64[0]), vextq_s8(v63, v63, 8uLL));
    int8x16_t v6 = veorq_s8( veorq_s8(v57, vextq_s8(v62, v5, 8uLL)),  veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v64.u64[0]), vextq_s8(v64, v64, 8uLL)));
  }

  int8x16_t result = vqtbl1q_s8(v6, *(int8x16_t *)qword_10000A600);
  *a1 = result;
  return result;
}

void *ccec_cp_256_asm()
{
  return &unk_1000308E0;
}

_OWORD *sub_10000A62C(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p256(a3, a4, a5);
}

_OWORD *sub_10000A63C(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  return ccn_mulmod_p256(a3, a4, a4);
}

uint64_t sub_10000A64C(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  int v8 = 4;
  int8x16_t v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4LL);
  int8x16_t v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4LL);
  int8x16_t v11 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4LL);
  ccn_mulmod_p256(v11, a4, a4);
  ccn_mulmod_p256(v10, v11, a4);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v9, v10, a4);
  ccn_mulmod_p256(v10, v9, v11);
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v8;
  }

  while (v8);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v12 = 8;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v12;
  }

  while (v12);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v13 = 16;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v13;
  }

  while (v13);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  ccn_set(4LL, v11, v10);
  int v14 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v14;
  }

  while (v14);
  ccn_mulmod_p256(v11, v11, a4);
  int v15 = 128;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v15;
  }

  while (v15);
  ccn_mulmod_p256(v11, v11, v10);
  int v16 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v16;
  }

  while (v16);
  ccn_mulmod_p256(v11, v11, v10);
  int v17 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v17;
  }

  while (v17);
  ccn_mulmod_p256(v10, v11, v9);
  ccn_mulmod_p256(v9, v10, a4);
  v19[0] = xmmword_1000262D0;
  v19[1] = unk_1000262E0;
  ccn_mulmod_p256(v9, v9, (unint64_t *)v19);
  if (ccn_n(4LL, v9) == 1 && *v9 == 1)
  {
    ccn_set(4LL, a3, v10);
    uint64_t result = 0LL;
  }

  else
  {
    uint64_t result = 4294967254LL;
  }

  *(void *)(a1 + 16) = v7;
  return result;
}

_OWORD *sub_10000A934(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  v5[0] = xmmword_1000262D0;
  v5[1] = unk_1000262E0;
  return ccn_mulmod_p256(a3, a4, (unint64_t *)v5);
}

uint64_t cczp_mm_redc_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v8 = cczp_n((uint64_t)a2);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = a2[*a2 + 3];
    int8x16_t v11 = a4;
    uint64_t v12 = v8;
    do
    {
      uint64_t v13 = cczp_prime((uint64_t)a2);
      *int8x16_t v11 = ccn_addmul1(v9, v11, v13, *v11 * v10);
      ++v11;
      --v12;
    }

    while (v12);
  }

  BOOL v14 = ccn_add_ws(a1, v9, &a4[v9], &a4[v9], a4);
  int v15 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v16 = ccn_sub_ws(a1, v9, a4, &a4[v9], v15) ^ v14;
  return ccn_mux(v9, v16, a3, &a4[v9], a4);
}

uint64_t inc_uint(uint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = (_BYTE *)(a2 + result - 1);
    unint64_t v3 = 2LL;
    do
    {
      if (++*v2--) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v3 > a2;
      }
      ++v3;
    }

    while (!v5);
  }

  return result;
}

uint64_t ccn_cond_clear(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555LL, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v8 = *a3;
    uint64_t v9 = *a3 ^ result;
    *a3 = v9;
    *a3++ = v9 ^ v8 & 0x5555555555555555LL ^ v8 & i ^ result;
  }

  return result;
}

uint64_t ccn_shift_right_asm(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result)
  {
    unint64_t v4 = a3->i64[0];
    char v5 = 64 - a4;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(64 - a4);
    uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(-a4);
    BOOL v8 = result == 4;
    BOOL v9 = result < 4;
    result -= 4LL;
    if (!v9)
    {
      if (v8)
      {
        int8x16_t v13 = a3[1];
        *a2 = veorq_s8( (int8x16_t)vshlq_u64(*(uint64x2_t *)a3, v7),  (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(*a3, v13, 8uLL), v6));
        a2[1] = veorq_s8( (int8x16_t)vshlq_u64((uint64x2_t)v13, v7),  (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v13, v13, 8uLL).u64[0], v6));
        return result;
      }

      do
      {
        int8x16_t v10 = *a3;
        int8x16_t v11 = a3[1];
        a3 += 2;
        unint64_t v4 = a3->i64[0];
        v12.i64[0] = vextq_s8(v11, v11, 8uLL).u64[0];
        v12.i64[1] = a3->i64[0];
        *a2 = veorq_s8( (int8x16_t)vshlq_u64((uint64x2_t)v10, v7),  (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v10, v11, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v7), (int8x16_t)vshlq_u64(v12, v6));
        a2 += 2;
        BOOL v9 = result <= 4;
        result -= 4LL;
      }

      while (!v9);
    }

    uint64_t v14 = result + 4;
    int v15 = &a3->u64[1];
    BOOL v16 = v14 == 2;
    BOOL v9 = v14 < 2;
    uint64_t result = v14 - 2;
    if (!v9)
    {
      if (v16)
      {
        uint64_t v19 = *v15 >> a4;
        a2->i64[0] = (v4 >> a4) | (*v15 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = v19;
        return result;
      }

      do
      {
        unint64_t v17 = *v15;
        unint64_t v18 = v15[1];
        v15 += 2;
        a2->i64[0] = (v4 >> a4) | (v17 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = (v17 >> a4) | (v18 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        ++a2;
        unint64_t v4 = v18;
        BOOL v9 = result <= 2;
        result -= 2LL;
      }

      while (!v9);
    }

    a2->i64[0] = v4 >> a4;
  }

  return result;
}

uint64_t ccn_set_bit(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 1LL << a2;
  uint64_t v4 = (a2 >> 3) & 0x1FFFFFFFFFFFFFF8LL;
  if (a3) {
    uint64_t v5 = *(void *)(result + v4) | v3;
  }
  else {
    uint64_t v5 = *(void *)(result + v4) & ~v3;
  }
  *(void *)(result + v4) = v5;
  return result;
}

uint64_t ccn_write_uint_padded_internal( unint64_t a1, unint64_t *a2, unint64_t a3, char *a4)
{
  LODWORD(result) = ccn_write_uint_padded_ct_internal(a1, a2, a3, a4);
  if ((result & 0x80000000) == 0) {
    return result;
  }
  ccn_write_uint_internal(a1, a2, a3, a4);
  return 0LL;
}

uint64_t ccn_zero(uint64_t a1, void *a2)
{
  return cc_clear(8 * a1, a2);
}

uint64_t ccn_seti(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = a3;
  return cc_clear(8 * a1 - 8, a2 + 1);
}

unint64_t ccn_cond_rsub(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555LL, a2 | (2 * mask));
  if (a1)
  {
    uint64_t v12 = 0LL;
    do
    {
      unint64_t v14 = *a4++;
      unint64_t v13 = v14;
      uint64_t v15 = *a5++;
      unsigned __int128 v16 = __PAIR128__(v12, v12) - v13;
      uint64_t v17 = v16 + v15;
      if (__CFADD__((void)v16, v15)) {
        uint64_t v18 = *((void *)&v16 + 1) + 1LL;
      }
      else {
        uint64_t v18 = (__PAIR128__(v12, v12) - v13) >> 64;
      }
      uint64_t v12 = v18 >> 63;
      uint64_t v19 = v13 ^ v17;
      uint64_t v20 = v13 ^ mask;
      *a3 = v20;
      *a3++ = v19 & v11 ^ v19 & 0x5555555555555555LL ^ v20 ^ mask;
      --a1;
    }

    while (a1);
    unint64_t v21 = (unint64_t)v18 >> 63;
  }

  else
  {
    unint64_t v21 = 0LL;
  }

  return v21 & a2;
}

BOOL timingsafe_enable_if_supported()
{
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000LL) != 0)
  {
    BOOL v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) != 0;
    __asm { MSR             DIT, #1 }
  }

  else
  {
    BOOL v0 = 0LL;
  }

  if ((MEMORY[0xFFFFFC010] & 0x200000000000LL) != 0)
  {
    sub_10000ADFC();
  }

  else
  {
    __dsb(0xFu);
    __isb(0xFu);
  }

  return v0;
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((result & 1) == 0 && (MEMORY[0xFFFFFC010] & 0x200000000000000LL) != 0) {
    __asm { MSR             DIT, #0 }
  }

  return result;
}

void sub_10000ADFC()
{
  __asm { SB }
}

uint64_t AccelerateCrypto_ecb_AES_encrypt(__int128 *a1, int a2, uint64_t a3, int8x16_t *a4)
{
  uint64_t v4 = *((unsigned int *)a1 + 60);
  _VF = __OFSUB__(a2, 4);
  int v6 = a2 - 4;
  for (int8x16_t i = *(int8x16_t *)((char *)a1 + v4); v6 < 0 == _VF; v6 -= 4)
  {
    _Q4 = *a1;
    uint64_t v9 = 16LL;
    a3 += 64LL;
    do
    {
      __asm
      {
        AESE            V0.16B, V4.16B
        AESMC           V0.16B, V0.16B
        AESE            V1.16B, V4.16B
        AESMC           V1.16B, V1.16B
        AESE            V2.16B, V4.16B
        AESMC           V2.16B, V2.16B
        AESE            V3.16B, V4.16B
        AESMC           V3.16B, V3.16B
      }

      _Q4 = a1[(unint64_t)v9 / 0x10];
      v9 += 16LL;
    }

    while (v9 < v4);
    __asm
    {
      AESE            V0.16B, V4.16B
      AESE            V1.16B, V4.16B
      AESE            V2.16B, V4.16B
      AESE            V3.16B, V4.16B
    }

    *a4 = veorq_s8(_Q0, i);
    a4[1] = veorq_s8(_Q1, i);
    a4[2] = veorq_s8(_Q2, i);
    a4[3] = veorq_s8(_Q3, i);
    a4 += 4;
    _VF = __OFSUB__(v6, 4);
  }

  int v25 = v6 & 3;
  if (v25)
  {
    do
    {
      _Q4 = *a1;
      uint64_t v27 = 16LL;
      a3 += 16LL;
      do
      {
        __asm
        {
          AESE            V0.16B, V4.16B
          AESMC           V0.16B, V0.16B
        }

        _Q4 = a1[(unint64_t)v27 / 0x10];
        v27 += 16LL;
      }

      while (v27 < v4);
      __asm { AESE            V0.16B, V4.16B }

      *a4++ = veorq_s8(_Q0, i);
      _VF = __OFSUB__(v25--, 1);
    }

    while (!((v25 < 0) ^ _VF | (v25 == 0)));
  }

  return 0LL;
}

unint64_t ccec_export_affine_point_size(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
    case 2:
      unint64_t result = ((unint64_t)(cczp_bitlen(a1) + 7) >> 2) | 1;
      break;
    case 3:
      unint64_t result = ccec_compressed_x962_export_pub_size(a1);
      break;
    case 4:
      unint64_t result = (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
      break;
    default:
      unint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t ccec_export_affine_point_public_value( unint64_t *a1, int a2, unint64_t *a3, unint64_t *a4, char *a5)
{
  unint64_t v10 = ccec_export_affine_point_size((uint64_t)a1, a2);
  if (!v10) {
    return 4294967289LL;
  }
  if (*a4 < v10) {
    return 4294967133LL;
  }
  *a4 = v10;
  unsigned int v11 = a2 - 1;
  unint64_t v12 = *a1;
  if (a2 == 4) {
    unint64_t v13 = a5;
  }
  else {
    unint64_t v13 = a5 + 1;
  }
  uint64_t v14 = cczp_bitlen((uint64_t)a1);
  if (v11 <= 1)
  {
    uint64_t v15 = &v13[(unint64_t)(cczp_bitlen((uint64_t)a1) + 7) >> 3];
    unsigned __int128 v16 = &a3[*a1];
    uint64_t v17 = cczp_bitlen((uint64_t)a1);
  }

  uint64_t result = 0LL;
  if ((a2 & 0xFFFFFFFE) == 2) {
    *a5 |= a3[*a1] & 1;
  }
  return result;
}

unint64_t ccn_trailing_zeros(unint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0LL;
    unint64_t v3 = v2 - 1;
    uint64_t v4 = (v2 << 6) - 64;
    do
    {
      unint64_t v5 = *(void *)(a2 + 8 * v3);
      --v3;
      v4 -= 64LL;
    }

    while (v3 < v2);
  }

  return result;
}

double ccn_shift_left(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64x2_t a5)
{
  uint64_t v5 = a2 + 8 * a1;
  uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(a4);
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(a4 - 64);
  BOOL v8 = (unint64_t *)(a3 + 8 * a1 - 8);
  BOOL v9 = a1 == 4;
  BOOL v10 = a1 < 4;
  uint64_t v11 = a1 - 4;
  if (!v10)
  {
    if (v9)
    {
      v16.i64[0] = 0LL;
      v16.i64[1] = *(v8 - 3);
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v16, v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 3), v6));
      int8x16_t v17 = veorq_s8( (int8x16_t)vshlq_u64(*((uint64x2_t *)v8 - 1), v7),  (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = v17;
      return *(double *)a5.i64;
    }

    do
    {
      uint64x2_t v12 = *(uint64x2_t *)(v8 - 3);
      uint64x2_t v13 = *(uint64x2_t *)(v8 - 1);
      uint64x2_t v14 = *((uint64x2_t *)v8 - 2);
      uint64x2_t v15 = *((uint64x2_t *)v8 - 1);
      v8 -= 4;
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v14, v7), (int8x16_t)vshlq_u64(v12, v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = veorq_s8((int8x16_t)vshlq_u64(v15, v7), (int8x16_t)vshlq_u64(v13, v6));
      v5 -= 32LL;
      BOOL v10 = v11 <= 4;
      v11 -= 4LL;
    }

    while (!v10);
  }

  uint64_t v18 = v11 & 3;
  if (!v18) {
    return *(double *)a5.i64;
  }
  if (v18 == 3)
  {
    uint64x2_t v19 = *((uint64x2_t *)v8 - 1);
  }

  else
  {
    if ((v18 & 2) == 0) {
      goto LABEL_13;
    }
    v19.i64[0] = 0LL;
    v19.i64[1] = *(v8 - 1);
  }

  a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6), (int8x16_t)vshlq_u64(v19, v7));
  v8 -= 2;
  *(uint64x2_t *)(v5 - 16) = a5;
  v5 -= 16LL;
LABEL_13:
  if ((v18 & 1) != 0)
  {
    a5.i64[0] = *v8;
    a5.i64[0] = vshlq_u64(a5, v6).u64[0];
    *(void *)(v5 - 8) = a5.i64[0];
  }

  return *(double *)a5.i64;
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t ccn_cond_add(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555LL, a2 | (2 * mask));
  uint64_t v12 = 0LL;
  if (a1)
  {
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v15 = *a4++;
      uint64_t v14 = v15;
      uint64_t v17 = *a5++;
      uint64_t v16 = v17;
      BOOL v18 = __CFADD__(v12, v14);
      uint64_t v19 = v12 + v14;
      if (v18) {
        uint64_t v13 = 1LL;
      }
      BOOL v18 = __CFADD__(v19, v16);
      uint64_t v20 = v19 + v16;
      if (v18) {
        uint64_t v12 = v13 + 1;
      }
      else {
        uint64_t v12 = v13;
      }
      uint64_t v21 = v14 ^ v20;
      uint64_t v22 = v14 ^ mask;
      *a3 = v22;
      *a3++ = v21 & v11 ^ v21 & 0x5555555555555555LL ^ v22 ^ mask;
      uint64_t v13 = 0LL;
      --a1;
    }

    while (a1);
  }

  return v12 & a2;
}

uint64_t cczp_is_quadratic_residue_ws(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = cczp_n(a2);
  uint64_t v7 = *(void *)(a1 + 16);
  BOOL v8 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  BOOL v9 = (void *)cczp_prime(a2);
  ccn_set(v6, v8, v9);
  v8->i64[0] &= ~1uLL;
  BOOL v10 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccn_shift_right(v6, v10, v8, 1LL);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  unsigned int v12 = cczp_power_fast_ws(a1, a2, v11, a3, (uint64_t)v10);
  cczp_from_ws(a1, a2);
  BOOL v13 = ccn_n(v6, v11) == 1 && *v11 == 1LL;
  uint64_t result = v13 & ~(((v12 | ((unint64_t)(int)v12 >> 32)) + 0xFFFFFFFF) >> 32);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccdrbg_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t ccdrbg_reseed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t ccdrbg_generate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t cczp_add_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  uint64_t v12 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v11);
  LOBYTE(a5) = ccn_add_ws(a1, v11, a3, a4, a5);
  BOOL v13 = (unint64_t *)cczp_prime(a2);
  BOOL v14 = ccn_sub_ws(a1, v11, v12, a3, v13);
  uint64_t result = ccn_mux(v11, !v14 | a5, a3, v12, a3);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_add_ws(uint64_t a1, uint64_t a2)
{
  return (**(uint64_t (***)(void))(a2 + 16))();
}

uint64_t cczp_div2_ws(uint64_t a1, uint64_t a2, int8x16_t *a3, uint64_t *a4)
{
  uint64_t v7 = cczp_n(a2);
  uint64_t v8 = *a4 & 1;
  BOOL v9 = (uint64_t *)cczp_prime(a2);
  uint64_t v10 = ccn_cond_add(v7, v8, a3->i64, a4, v9);
  uint64_t result = ccn_shift_right(v7, a3, a3, 1LL);
  a3->i64[v7 - 1] |= v10 << 63;
  return result;
}

uint64_t cczp_modn_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, char *a5)
{
  unint64_t v10 = cczp_n((uint64_t)a2);
  uint64_t v11 = v10;
  if ((a4 - 1) / v10 <= 1) {
    unint64_t v12 = 1LL;
  }
  else {
    unint64_t v12 = (a4 - 1) / v10;
  }
  uint64_t v17 = a4;
  uint64_t v18 = *(void *)(a1 + 16);
  BOOL v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v10);
  uint64_t v19 = a5;
  ccn_set(v11, v13, a5);
  unint64_t v14 = v12 - 1;
  if (v12 != 1)
  {
    uint64_t v15 = &v19[8 * v11];
    do
    {
      ccn_set(v11, &v13[8 * v11], v15);
      cczp_mm_redc_ws(a1, a2, (uint64_t *)v13, (uint64_t *)v13);
      v15 += 8 * v11;
      --v14;
    }

    while (v14);
  }

  if (v17 != v12 * v11) {
    ccn_set(v17 - v12 * v11, &v13[8 * v11], &v19[8 * v12 * v11]);
  }
  ccn_zero(v11 - (v17 - v12 * v11), &v13[8 * v11 + 8 * (v17 - v12 * v11)]);
  cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
  do
  {
    ccn_mul_ws(a1, v11, (uint64_t)v13, (uint64_t)a3, (uint64_t)&a2[*a2 + 4]);
    uint64_t result = cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
    --v12;
  }

  while (v12);
  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_mod_default_ws(uint64_t a1, void *a2, uint64_t *a3, char *a4)
{
  uint64_t v8 = 2 * cczp_n((uint64_t)a2);
  return cczp_modn_ws(a1, a2, a3, v8, a4);
}

uint64_t cczp_mod_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 32LL))();
}

uint64_t cczp_mul_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v10);
  uint64_t v12 = cczp_n(a2);
  ccn_mul_ws(a1, v12, v11, a4, a5);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t cczp_mul_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 16LL))();
}

_OWORD *ccn_mulmod_p256(void *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  unint64_t v3 = a2 + 2;
  unint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  unint64_t v9 = *a3;
  unint64_t v10 = a3[1];
  uint64_t v8 = a3 + 2;
  unint64_t v11 = *v8;
  unint64_t v12 = v8[1];
  unint64_t v13 = v4 * v9;
  uint64_t v14 = (v5 * (unsigned __int128)v9) >> 64;
  uint64_t v15 = *v3 * v9;
  uint64_t v16 = (v6 * (unsigned __int128)v9) >> 64;
  unint64_t v18 = v9;
  uint64_t v17 = (__PAIR128__(v5, v4) * v9) >> 64;
  _BOOL1 v19 = __CFADD__(__CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9), v14);
  uint64_t v20 = __CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9) + v14;
  v19 |= __CFADD__(v15, v20);
  v20 += v15;
  uint64_t v21 = (v7 * (unsigned __int128)v9) >> 64;
  uint64_t v22 = (v7 * (unsigned __int128)v10) >> 64;
  BOOL v24 = v19;
  _BOOL1 v19 = __CFADD__(v19, v16);
  uint64_t v23 = v24 + v16;
  v19 |= __CFADD__(v7 * v9, v23);
  v23 += v7 * v9;
  BOOL v26 = v19;
  _BOOL1 v19 = __CFADD__(v19, v21);
  uint64_t v25 = v26 + v21;
  v19 |= __CFADD__(v7 * v10, v25);
  v25 += v7 * v10;
  uint64_t v27 = v7 * *v8;
  uint64_t v28 = (v7 * (unsigned __int128)v11) >> 64;
  BOOL v30 = v19;
  _BOOL1 v19 = __CFADD__(v19, v22);
  uint64_t v29 = v30 + v22;
  v19 |= __CFADD__(v27, v29);
  v29 += v27;
  BOOL v32 = v19;
  _BOOL1 v19 = __CFADD__(v19, v28);
  uint64_t v31 = v32 + v28;
  v19 |= __CFADD__(v7 * v12, v31);
  v31 += v7 * v12;
  uint64_t v33 = v19 + ((v7 * (unsigned __int128)v12) >> 64);
  uint64_t v34 = (v4 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v17, v4 * v10);
  uint64_t v35 = (__PAIR128__(v10, v18) * __PAIR128__(v5, v4)) >> 64;
  BOOL v37 = v19;
  _BOOL1 v19 = __CFADD__(v19, v20);
  uint64_t v36 = v37 + v20;
  v19 |= __CFADD__(v34, v36);
  v36 += v34;
  uint64_t v38 = (v6 * (unsigned __int128)v10) >> 64;
  BOOL v40 = v19;
  _BOOL1 v19 = __CFADD__(v19, v23);
  uint64_t v39 = v40 + v23;
  v19 |= __CFADD__(v6 * v10, v39);
  v39 += v6 * v10;
  BOOL v42 = v19;
  _BOOL1 v19 = __CFADD__(v19, v25);
  uint64_t v41 = v42 + v25;
  v19 |= __CFADD__(v38, v41);
  v41 += v38;
  uint64_t v43 = (v6 * (unsigned __int128)v12) >> 64;
  BOOL v45 = v19;
  _BOOL1 v19 = __CFADD__(v19, v29);
  uint64_t v44 = v45 + v29;
  v19 |= __CFADD__(v6 * v12, v44);
  v44 += v6 * v12;
  BOOL v47 = v19;
  _BOOL1 v19 = __CFADD__(v19, v31);
  uint64_t v46 = v47 + v31;
  v19 |= __CFADD__(v43, v46);
  v46 += v43;
  uint64_t v48 = v19 + v33;
  uint64_t v49 = (v5 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v36, v5 * v10);
  uint64_t v50 = v36 + v5 * v10;
  BOOL v52 = v19;
  _BOOL1 v19 = __CFADD__(v19, v39);
  uint64_t v51 = v52 + v39;
  v19 |= __CFADD__(v49, v51);
  v51 += v49;
  uint64_t v53 = (v6 * (unsigned __int128)v11) >> 64;
  BOOL v55 = v19;
  _BOOL1 v19 = __CFADD__(v19, v41);
  uint64_t v54 = v55 + v41;
  v19 |= __CFADD__(v6 * v11, v54);
  v54 += v6 * v11;
  BOOL v57 = v19;
  _BOOL1 v19 = __CFADD__(v19, v44);
  uint64_t v56 = v57 + v44;
  v19 |= __CFADD__(v53, v56);
  v56 += v53;
  BOOL v58 = v19;
  uint64_t v59 = (v4 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v50, v4 * v11);
  uint64_t v60 = v50 + v4 * v11;
  BOOL v62 = v19;
  _BOOL1 v19 = __CFADD__(v19, v51);
  uint64_t v61 = v62 + v51;
  v19 |= __CFADD__(v59, v61);
  v61 += v59;
  uint64_t v63 = (v5 * (unsigned __int128)v12) >> 64;
  BOOL v65 = v19;
  _BOOL1 v19 = __CFADD__(v19, v54);
  uint64_t v64 = v65 + v54;
  v19 |= __CFADD__(v5 * v12, v64);
  v64 += v5 * v12;
  BOOL v67 = v19;
  _BOOL1 v19 = __CFADD__(v19, v56);
  uint64_t v66 = v67 + v56;
  v19 |= __CFADD__(v63, v66);
  v66 += v63;
  uint64_t v68 = v19 + v58;
  uint64_t v69 = (v5 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v61, v5 * v11);
  uint64_t v70 = v61 + v5 * v11;
  BOOL v72 = v19;
  _BOOL1 v19 = __CFADD__(v19, v64);
  uint64_t v71 = v72 + v64;
  v19 |= __CFADD__(v69, v71);
  v71 += v69;
  uint64_t v73 = v19;
  uint64_t v74 = (v4 * (unsigned __int128)v12) >> 64;
  _BOOL1 v19 = __CFADD__(v70, v4 * v12);
  uint64_t v75 = v70 + v4 * v12;
  BOOL v77 = v19;
  _BOOL1 v19 = __CFADD__(v19, v71);
  uint64_t v76 = v77 + v71;
  v19 |= __CFADD__(v74, v76);
  v76 += v74;
  BOOL v79 = v19;
  _BOOL1 v19 = __CFADD__(v19, v66);
  uint64_t v78 = v79 + v66;
  v19 |= __CFADD__(v73, v78);
  v78 += v73;
  BOOL v81 = v19;
  _BOOL1 v19 = __CFADD__(v19, v46);
  uint64_t v80 = v81 + v46;
  v19 |= __CFADD__(v68, v80);
  v80 += v68;
  uint64_t v82 = v19 + v48;
  _BOOL1 v19 = __CFADD__(v35, v13 << 32);
  unint64_t v83 = v35 + (v13 << 32);
  BOOL v85 = v19;
  _BOOL1 v19 = __CFADD__(v19, v60);
  uint64_t v84 = v85 + v60;
  v19 |= __CFADD__(HIDWORD(v13), v84);
  v84 += HIDWORD(v13);
  BOOL v87 = v19;
  _BOOL1 v19 = __CFADD__(v19, v75);
  uint64_t v86 = v87 + v75;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v13, v86);
  v86 += 0xFFFFFFFF00000001LL * v13;
  uint64_t v88 = v19 + ((v13 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v84, v83 << 32);
  unint64_t v89 = v84 + (v83 << 32);
  BOOL v91 = v19;
  _BOOL1 v19 = __CFADD__(v19, v86);
  uint64_t v90 = v91 + v86;
  v19 |= __CFADD__(HIDWORD(v83), v90);
  v90 += HIDWORD(v83);
  BOOL v93 = v19;
  _BOOL1 v19 = __CFADD__(v19, v76);
  uint64_t v92 = v93 + v76;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v83, v92);
  v92 += 0xFFFFFFFF00000001LL * v83;
  uint64_t v94 = v19 + ((v83 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v90, v89 << 32);
  unint64_t v95 = v90 + (v89 << 32);
  BOOL v97 = v19;
  _BOOL1 v19 = __CFADD__(v19, v92);
  uint64_t v96 = v97 + v92;
  v19 |= __CFADD__(HIDWORD(v89), v96);
  v96 += HIDWORD(v89);
  BOOL v99 = v19;
  _BOOL1 v19 = __CFADD__(v19, v78);
  uint64_t v98 = v99 + v78;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v89, v98);
  v98 += 0xFFFFFFFF00000001LL * v89;
  uint64_t v100 = v19 + ((v89 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v96, v95 << 32);
  uint64_t v101 = v96 + (v95 << 32);
  BOOL v103 = v19;
  _BOOL1 v19 = __CFADD__(v19, v98);
  uint64_t v102 = v103 + v98;
  v19 |= __CFADD__(HIDWORD(v95), v102);
  v102 += HIDWORD(v95);
  BOOL v105 = v19;
  _BOOL1 v19 = __CFADD__(v19, v80);
  uint64_t v104 = v105 + v80;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v95, v104);
  v104 += 0xFFFFFFFF00000001LL * v95;
  uint64_t v106 = v19 + ((v95 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v88, v101);
  uint64_t v107 = v88 + v101;
  BOOL v109 = v19;
  _BOOL1 v19 = __CFADD__(v19, v94);
  uint64_t v108 = v109 + v94;
  v19 |= __CFADD__(v102, v108);
  v108 += v102;
  BOOL v111 = v19;
  _BOOL1 v19 = __CFADD__(v19, v100);
  unint64_t v110 = v111 + v100;
  v19 |= __CFADD__(v104, v110);
  v110 += v104;
  BOOL v113 = v19;
  _BOOL1 v19 = __CFADD__(v19, v106);
  uint64_t v112 = v113 + v106;
  v19 |= __CFADD__(v82, v112);
  v112 += v82;
  BOOL v114 = v19;
  _BOOL1 v19 = __CFADD__(v107++, 1LL);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v108, 0xFFFFFFFFLL, v19);
  uint64_t v115 = v108 - (!v113 + 0xFFFFFFFFLL);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = v110 >= !v19;
  unint64_t v116 = v110 - !v113;
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v112, 0xFFFFFFFF00000001LL, v19);
  BOOL v117 = v114 - !v19;
  uint64_t v118 = v114 - !v19;
  _BOOL1 v19 = __CFADD__(__CFADD__(v107, v117), v115);
  uint64_t v119 = __CFADD__(v107, v117) + v115;
  *a1 = v107 + v117;
  a1[1] = v118 + v119;
  uint64_t result = a1 + 2;
  return result;
}

uint64_t cczp_sqr_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = cczp_n(a2);
  unint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v8);
  ccn_sqr_ws(a1, v8, v9, a4);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t cczp_sqr_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 24LL))();
}

uint64_t cczp_prime(uint64_t a1)
{
  return a1 + 24;
}

uint64_t cczp_sub_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  BOOL v12 = ccn_sub_ws(a1, v11, a3, a4, a5);
  unint64_t v13 = (uint64_t *)cczp_prime(a2);
  uint64_t result = ccn_cond_add(v11, v12, a3, a3, v13);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sub_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 8LL))();
}

uint64_t sub_10000BBA8(int a1, unint64_t a2, char *buffer)
{
  if (a2)
  {
    unint64_t v4 = a2;
    do
    {
      if (v4 >= 0x100) {
        size_t v5 = 256LL;
      }
      else {
        size_t v5 = v4;
      }
      if (getentropy(buffer, v5) == -1) {
        cc_abort();
      }
      buffer += v5;
      v4 -= v5;
    }

    while (v4);
  }

  return 0LL;
}

uint64_t ccecdh_generate_key_ws( uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = ccec_generate_key_internal_fips_ws(a1, a2, a3, a4);
  if (!(_DWORD)result)
  {
    else {
      uint64_t result = 0LL;
    }
  }

  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccecdh_generate_key( uint64_t *a1, uint64_t (**a2)(void, uint64_t, uint64_t *), uint64_t **a3)
{
  BOOL v16 = timingsafe_enable_if_supported();
  uint64_t v6 = *a1;
  uint64_t v7 = sizeof_struct_ccec_full_ctx();
  unint64_t v8 = sizeof_cc_unit();
  v14[0] = cc_malloc_clear(8 * ((v7 + v8 + 4 * v6 * v8 - 1) / v8 - v6 + 32 * v6));
  uint64_t v9 = *a1;
  uint64_t v10 = sizeof_struct_ccec_full_ctx();
  unint64_t v11 = sizeof_cc_unit();
  v14[1] = (v10 + v11 + 4 * v9 * v11 - 1) / v11 - v9 + 32 * v9;
  v14[2] = 0LL;
  v14[3] = cc_ws_alloc;
  uint64_t v15 = cc_ws_free;
  if (v14[0])
  {
    uint64_t key_ws = ccecdh_generate_key_ws((uint64_t)v14, a1, a2, a3);
    v15((uint64_t)v14);
  }

  else
  {
    uint64_t key_ws = 4294967283LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v16);
  return key_ws;
}

void *ccsha256_di()
{
  return &ccsha256_vng_arm_di;
}

uint64_t ccdrbg_df_derive_keys(uint64_t (**a1)(void), uint64_t a2, uint64_t a3, rsize_t a4, void *a5)
{
  uint64_t v7 = (*a1)();
  if ((_DWORD)v7) {
    cc_clear(a4, a5);
  }
  return v7;
}

uint64_t ccdrbg_df_bc_derive_keys(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, void *a5)
{
  BOOL v32 = a5;
  uint64_t v9 = *(void **)(a1 + 8);
  size_t v10 = (*v9 + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v33 = (char *)&v31 - v10;
  bzero((char *)&v31 - v10, v10);
  size_t v11 = (v9[1] + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  BOOL v12 = (char *)&v31 - v11;
  unsigned int v13 = 0;
  if (a2)
  {
    uint64_t v14 = (uint64_t *)(a3 + 8);
    uint64_t v15 = a2;
    do
    {
      uint64_t v16 = *v14;
      v14 += 2;
      v13 += v16;
      --v15;
    }

    while (v15);
  }

  bzero(v12, v11);
  __src[0] = 0LL;
  __src[1] = 0LL;
  unsigned int v43 = bswap32(v13);
  unsigned int v44 = bswap32(a4);
  __int128 v41 = xmmword_100026320;
  memset(v40, 0, sizeof(v40));
  uint64_t v17 = *(void *)(a1 + 16);
  v39[0] = 0LL;
  v39[1] = 0LL;
  unint64_t v37 = v17 + 16;
  if (v17 == -16)
  {
LABEL_13:
    uint64_t v23 = v33;
    uint64_t inited = cccbc_init_internal((uint64_t)v9);
    uint64_t v25 = v32;
    if (!(_DWORD)inited)
    {
      if (!a4)
      {
LABEL_26:
        uint64_t v29 = 0LL;
        goto LABEL_27;
      }

      BOOL v26 = (void *)((char *)v40 + *(void *)(a1 + 16));
      while (1)
      {
        uint64_t v27 = (uint64_t)v26;
        cc_clear(*(void *)(*(void *)(a1 + 8) + 8LL), v12);
        BOOL v26 = a4 <= 0xF ? v39 : v25;
        uint64_t inited = cccbc_update_internal(*(void *)(a1 + 8), (uint64_t)v23, (uint64_t)v12, 1LL, v27, (uint64_t)v26);
        if ((_DWORD)inited) {
          break;
        }
        if (a4 <= 0xF) {
          memcpy(v25, v26, a4);
        }
        if (a4 >= 0x10) {
          uint64_t v28 = 16LL;
        }
        else {
          uint64_t v28 = a4;
        }
        uint64_t v25 = (void *)((char *)v25 + v28);
        a4 -= v28;
        if (!a4) {
          goto LABEL_26;
        }
      }
    }

    uint64_t v29 = inited;
    goto LABEL_27;
  }

  uint64_t v36 = a2;
  unsigned int v18 = 0;
  unint64_t v19 = 0LL;
  size_t v34 = 16LL - (((_BYTE)v13 + 8) & 0xF);
  uint64_t v35 = (size_t *)(a3 + 8);
  while (1)
  {
    cc_clear(*(void *)(*(void *)(a1 + 8) + 8LL), v12);
    LODWORD(__src[0]) = bswap32(v18);
    uint64_t v38 = 0LL;
    uint64_t v20 = sub_10000C0B8( *(void *)(a1 + 8),  a1 + 32,  (uint64_t)v12,  (uint64_t)&v40[v19 / 0x10],  &v38,  0x18uLL,  (char *)__src);
    if ((_DWORD)v20) {
      break;
    }
    uint64_t v21 = v35;
    uint64_t v22 = v36;
    if (v36)
    {
      do
      {
        uint64_t v20 = sub_10000C0B8( *(void *)(a1 + 8),  a1 + 32,  (uint64_t)v12,  (uint64_t)&v40[v19 / 0x10],  &v38,  *v21,  (char *)*(v21 - 1));
        if ((_DWORD)v20) {
          goto LABEL_28;
        }
        v21 += 2;
      }

      while (--v22);
    }

    uint64_t v20 = sub_10000C0B8(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, v34, (char *)&v41);
    if ((_DWORD)v20) {
      break;
    }
    ++v18;
    v19 += 16LL;
    if (v19 >= v37)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      goto LABEL_13;
    }
  }

LABEL_28:
  uint64_t v29 = v20;
  uint64_t v23 = v33;
LABEL_27:
  cc_clear(**(void **)(a1 + 8), v23);
  cc_clear(*(void *)(*(void *)(a1 + 8) + 8LL), v12);
  return v29;
}

                if (!a7)
                {
LABEL_32:
                  uint64_t v22 = 1;
LABEL_68:
                  uint64_t v48 = v56;
LABEL_69:

                  goto LABEL_70;
                }

                size_t v34 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"full_key"]);
                if (v34)
                {
                  uint64_t v36 =  -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v34,  0LL);
                  *a7 = v36;
                  if (v36)
                  {

                    goto LABEL_32;
                  }

                  BOOL v52 = self->_log_handle;
                  if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_66;
                  }
                  *(_WORD *)buf = 0;
                  uint64_t v53 = "Failed to parse the Base64-encoded key";
                  goto LABEL_65;
                }

                BOOL v52 = self->_log_handle;
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  uint64_t v53 = "Misformatted key file. Full key not found";
                  goto LABEL_65;
                }

    close(v16->_corefile_fd);
    goto LABEL_29;
  }

  uint64_t v31 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v53 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Found corefile with signature %#llx",  buf,  0xCu);
  }

  BOOL v32 = v16;
LABEL_30:

  return v32;
}

uint64_t sub_10000C0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, size_t __n, char *__src)
{
  uint64_t v7 = __src;
  size_t v8 = __n;
  unint64_t v14 = 16LL - *a5;
  if (*a5) {
    BOOL v15 = __n >= v14;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    memcpy((void *)(a4 + *a5), __src, 16LL - *a5);
    uint64_t result = cccbc_update_internal(a1, a2, a3, 1LL, a4, a4);
    if ((_DWORD)result) {
      return result;
    }
    v8 -= v14;
    v7 += v14;
    *a5 = 0LL;
  }

  if (v8 < 0x10)
  {
LABEL_11:
    if (v8)
    {
      memcpy((void *)(a4 + *a5), v7, v8);
      uint64_t result = 0LL;
      *a5 += v8;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    while (1)
    {
      uint64_t result = cccbc_update_internal(a1, a2, a3, 1LL, (uint64_t)v7, a4);
      if ((_DWORD)result) {
        break;
      }
      v8 -= 16LL;
      v7 += 16;
      if (v8 <= 0xF) {
        goto LABEL_11;
      }
    }
  }

  return result;
}

uint64_t ccdrbg_df_bc_init_internal(void *a1, void *a2, unint64_t a3)
{
  uint64_t result = 4294967291LL;
  if (a3 <= 0x20 && *a2 <= 0x200uLL && a2[1] == 16LL)
  {
    *a1 = ccdrbg_df_bc_derive_keys;
    a1[1] = a2;
    a1[2] = a3;
    return cccbc_init_internal((uint64_t)a2);
  }

  return result;
}

void *cc_malloc_clear(size_t a1)
{
  unint64_t v2 = malloc(a1);
  unint64_t v3 = v2;
  if (v2) {
    bzero(v2, a1);
  }
  return v3;
}

uint64_t cc_ws_alloc(void *a1, uint64_t a2)
{
  unint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1 + 8 * v2;
  unint64_t v5 = v2 + a2;
  a1[2] = v5;
  cc_try_abort_if (v5 > v3);
  return v4;
}

void cc_ws_free(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
}

uint64_t ccctr_context_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccctr_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t ccctr_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
}

uint64_t ccec_generate_key_internal_fips_ws( uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v8 = *a2;
  *a4 = a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  uint64_t v11 = cczp_bitlen((uint64_t)a2);
  uint64_t result = (*a3)(a3, ((unint64_t)(v11 + 62) >> 3) & 0x1FFFFFFFFFFFFFF8LL, (uint64_t *)v10);
  if (!(_DWORD)result)
  {
    uint64_t result = ccec_generate_scalar_fips_retry_ws( a1,  a2,  (uint64_t (**)(void, unint64_t, void *))a3,  &a4[3 * **a4 + 2]);
    if (!(_DWORD)result) {
      uint64_t result = ccec_make_pub_from_priv_ws(a1, a2, a3, (uint64_t)&a4[3 * **a4 + 2], 0LL, a4);
    }
  }

  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t ccec_validate_point_and_projectify_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = cczp_prime((uint64_t)a2);
  uint64_t v10 = *a2;
  uint64_t v11 = a4 + 8 * *a2;
  uint64_t v12 = cczp_prime((uint64_t)a2);
  uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    else {
      return 4294967289LL;
    }
  }

  return result;
}

uint64_t ccn_cmp_asm(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  if (result)
  {
    unint64_t v3 = result;
    uint64_t result = 0LL;
    do
    {
      unint64_t v5 = *a2++;
      unint64_t v4 = v5;
      unint64_t v6 = *a3++;
      BOOL v7 = v4 >= v6;
      if (v4 > v6) {
        uint64_t result = 1LL;
      }
      if (!v7) {
        uint64_t result = -1LL;
      }
    }

    while (v3-- > 1);
  }

  return result;
}

uint64_t cc_disable_dit_with_sb(unsigned int *a1)
{
  return timingsafe_restore_if_supported(*a1);
}

id sub_10000C528(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    [v7 setObject:v8 forKeyedSubscript:kOSALogOptionOverridePath];
  }

  if (a3 != 0.0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v7 setObject:v9 forKeyedSubscript:kOSALogOptionCaptureTime];
  }

  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:kOSALogOptionOverrideFilePrefix];
  }
  [v7 setObject:@"ips" forKeyedSubscript:kOSALogOptionOverrideFileExtension];

  return v7;
}

uint64_t sub_10000C62C(uint64_t a1, const char *a2, _DWORD *a3)
{
  if (!a1)
  {
    uint64_t v14 = _os_assert_log(0LL, a2);
    _os_crash(v14);
    __break(1u);
    goto LABEL_18;
  }

  if (!a2)
  {
LABEL_18:
    uint64_t v15 = _os_assert_log(0LL, a2);
    _os_crash(v15);
    __break(1u);
LABEL_19:
    uint64_t v16 = _os_assert_log(0LL, a2);
    _os_crash(v16);
    __break(1u);
  }

  if (!a3) {
    goto LABEL_19;
  }
  *a3 = 0;
  *(_OWORD *)path = *(_OWORD *)"IODeviceTree:/";
  __int128 v20 = unk_100026448;
  __int128 v21 = xmmword_100026458;
  __int128 v22 = unk_100026468;
  __strlcat_chk(path, a1, 64LL, 64LL);
  io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMainPortDefault, path);
  id v6 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (!v6)
  {
    uint64_t v11 = (os_log_s *)qword_100036550;
    if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      unsigned int v18 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Error creating CFString %s",  (uint8_t *)&v17,  0xCu);
    }

    return 0xFFFFFFFFLL;
  }

  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v5, v6, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v5);
    return 0xFFFFFFFFLL;
  }

  uint64_t v8 = (void *)CFProperty;
  CFTypeID v9 = CFGetTypeID(CFProperty);
  if (v9 == CFDataGetTypeID()) {
    id v10 = [v8 mutableCopy];
  }
  else {
    id v10 = 0LL;
  }
  CFRelease(v8);
  IOObjectRelease(v5);
  if (v10)
  {
    id v13 = v10;
    *a3 = *(_DWORD *)[v13 bytes];
  }

  return 0LL;
}

BOOL sub_10000C804(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  io_registry_entry_t v5 = @"OK";
  id v6 = @"Cancel";
  if (!v3)
  {
    uint64_t v18 = _os_assert_log(0LL, v7);
    _os_crash(v18);
    __break(1u);
LABEL_16:
    uint64_t v19 = _os_assert_log(0LL, v7);
    _os_crash(v19);
    __break(1u);
  }

  if (!v4) {
    goto LABEL_16;
  }
  v24[0] = kCFUserNotificationAlertHeaderKey;
  v24[1] = kCFUserNotificationAlertMessageKey;
  v25[0] = v3;
  v25[1] = v4;
  void v24[2] = kCFUserNotificationDefaultButtonTitleKey;
  void v25[2] = @"OK";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  3LL));
  CFTypeID v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));

  [v9 setObject:@"Cancel" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  SInt32 error = 0;
  id v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, &error, (CFDictionaryRef)v9);
  BOOL v11 = (BOOL)v10;
  SInt32 v12 = error;
  if (v10 && !error)
  {
    CFOptionFlags responseFlags = 0LL;
    SInt32 v13 = CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags);
    if (!v13)
    {
      CFRelease((CFTypeRef)v11);
      BOOL v11 = (responseFlags & 3) == 0;
      goto LABEL_12;
    }

    SInt32 v14 = v13;
    uint64_t v15 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      SInt32 v22 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to get response for tap to radar notification with error: %d",  buf,  8u);
    }

    goto LABEL_10;
  }

  uint64_t v16 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    LODWORD(responseFlags) = 67109120;
    HIDWORD(responseFlags) = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to display tap to radar notification with error: %d",  (uint8_t *)&responseFlags,  8u);
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  if (v11)
  {
LABEL_10:
    CFRelease((CFTypeRef)v11);
    BOOL v11 = 0LL;
  }

LABEL_12:
  return v11;
}

  SInt32 v22 = 0;
LABEL_13:

  return v22;
}

void sub_10000CA88(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  if (!v15)
  {
    uint64_t v45 = _os_assert_log(0LL, v23);
    _os_crash(v45);
    __break(1u);
    goto LABEL_29;
  }

  if (!v16)
  {
LABEL_29:
    uint64_t v46 = _os_assert_log(0LL, v23);
    _os_crash(v46);
    __break(1u);
LABEL_30:
    uint64_t v47 = _os_assert_log(0LL, v23);
    _os_crash(v47);
    __break(1u);
  }

  if (!v17) {
    goto LABEL_30;
  }
  BOOL v24 = v22;
  if (objc_opt_class(&OBJC_CLASS___TapToRadarService))
  {
    id v53 = v15;
    uint64_t v54 = v24;
    uint64_t v25 = (void *)objc_opt_new(&OBJC_CLASS___RadarDraft);
    id v50 = v16;
    [v25 setTitle:v16];
    [v25 setProblemDescription:v17];
    id v52 = v20;
    id v48 = v19;
    id v49 = v18;
    id v26 = objc_msgSend( [RadarComponent alloc],  "initWithName:version:identifier:",  v18,  v19,  objc_msgSend(v20, "integerValue"));
    [v25 setComponent:v26];

    [v25 setClassification:2];
    [v25 setAutoDiagnostics:1];
    [v25 setIsUserInitiated:1];
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v51 = v21;
    id v28 = v21;
    id v29 = [v28 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v61;
      do
      {
        for (int8x16_t i = 0LL; i != v30; int8x16_t i = (char *)i + 1)
        {
          if (*(void *)v61 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  *(void *)(*((void *)&v60 + 1) + 8LL * (void)i)));
          -[NSMutableArray addObject:](v27, "addObject:", v33);
        }

        id v30 = [v28 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }

      while (v30);
    }

    [v25 setAttachments:v27];
    size_t v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v35 = v54;
    id v36 = [v35 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v57;
      do
      {
        for (uint64_t j = 0LL; j != v37; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v57 != v38) {
            objc_enumerationMutation(v35);
          }
          BOOL v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) intValue]));
          -[NSMutableArray addObject:](v34, "addObject:", v40);
        }

        id v37 = [v35 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }

      while (v37);
    }

    [v25 setKeywords:v34];
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
    id v55 = 0LL;
    id v15 = v53;
    [v41 createDraft:v25 forProcessNamed:0 withDisplayReason:v53 error:&v55];
    id v42 = v55;

    unsigned int v43 = (os_log_s *)qword_100036568;
    if (v42)
    {
      id v18 = v49;
      id v16 = v50;
      id v19 = v48;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v42;
        _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Failed to create draft in Tap-to-Radar: %@",  buf,  0xCu);
      }
    }

    else
    {
      id v18 = v49;
      id v16 = v50;
      id v19 = v48;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Received confirmation that a Tap-to-Radar draft has been started",  buf,  2u);
      }
    }

    id v21 = v51;
    id v20 = v52;
    BOOL v24 = v54;
  }

  else
  {
    unsigned int v44 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "TapToRadarService does not exist and thus we cannot start a radar",  buf,  2u);
    }
  }
}

uint64_t sub_10000CF20()
{
  BOOL v0 = @"stress-rack";
  if (qword_1000364E0 != -1) {
    dispatch_once(&qword_1000364E0, &stru_100030AB0);
  }
  if (dword_1000364DC)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_1000364DC, @"stress-rack", 0LL, 0);

    if (CFProperty)
    {
      CFRelease(CFProperty);
      return 1LL;
    }
  }

  else
  {
    id v3 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "NVRAM is not supported on this system",  v4,  2u);
    }
  }

  return 0LL;
}

void sub_10000D008(id a1)
{
  dword_1000364DC = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
}

id sub_10000D038()
{
  size_t __size = 0LL;
  int v0 = sysctlbyname("kern.bootargs", 0LL, &__size, 0LL, 0LL);
  if (v0)
  {
    int v1 = v0;
    uint64_t v2 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 67109120;
    int v15 = v1;
    CFTypeID v9 = "Failed to query the size of the boot-args. Error: %d";
    goto LABEL_14;
  }

  if (!__size) {
    goto LABEL_3;
  }
  io_registry_entry_t v5 = malloc(__size);
  if (!v5)
  {
    uint64_t v10 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_WORD *)buf = 0;
    CFTypeID v9 = "Failed to allocate memory for the boot-args";
    BOOL v11 = (os_log_s *)v10;
    uint32_t v12 = 2;
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, buf, v12);
    goto LABEL_3;
  }

  id v6 = v5;
  int v7 = sysctlbyname("kern.bootargs", v5, &__size, 0LL, 0LL);
  if (!v7)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    free(v6);
    return v3;
  }

  int v8 = v7;
  free(v6);
  uint64_t v2 = qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = v8;
    CFTypeID v9 = "Failed to query the boot-args. Error: %d";
LABEL_14:
    BOOL v11 = (os_log_s *)v2;
    uint32_t v12 = 8;
    goto LABEL_15;
  }

LABEL_3:
  id v3 = 0LL;
  return v3;
}

uint64_t sub_10000D1E4(void *a1, void *a2, unint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v6)
  {
    uint64_t v26 = _os_assert_log(0LL, v7);
    _os_crash(v26);
    __break(1u);
LABEL_25:
    uint64_t v27 = _os_assert_log(0LL, v9);
    _os_crash(v27);
    __break(1u);
  }

  int v8 = v6;

  if (!a3) {
    goto LABEL_25;
  }
  *a3 = 0LL;
  if (v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(?:^|[ \t\r\n])%@=(0x[a-fA-F0-9]+|-?[0-9]+)(?:[ \t\r\n]|$)",  v8));
    id v29 = 0LL;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v10,  0LL,  &v29));
    id v12 = v29;
    if (v12)
    {
      SInt32 v13 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to create a regex matching expression: %@",  buf,  0xCu);
      }

      uint64_t v14 = 0LL;
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")));
      id v17 = v16;
      if (v16)
      {
        id v18 = [v16 rangeAtIndex:1];
        __endptr = 0LL;
        id v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v18, v19));
        unint64_t v21 = strtoull((const char *)[v20 UTF8String], &__endptr, 0);
        id v22 = __endptr;
        if (*__endptr)
        {
          uint64_t v23 = (os_log_s *)qword_100036568;
          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v8;
            __int16 v32 = 2080;
            uint64_t v33 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to parse the value of the '%@' boot-arg as an integer. Remainder = '%s'",  buf,  0x16u);
          }

          uint64_t v14 = 0LL;
        }

        else
        {
          *a3 = v21;
          uint64_t v14 = 1LL;
        }
      }

      else
      {
        BOOL v24 = (os_log_s *)qword_100036568;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "boot-args NVRAM variable does not have a '%@'=<value> arg",  buf,  0xCu);
        }

        uint64_t v14 = 0LL;
      }
    }
  }

  else
  {
    int v15 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "boot-args NVRAM variable is either not set or inaccessible",  buf,  2u);
    }

    uint64_t v14 = 0LL;
  }

  return v14;
}

void sub_10000D4E4(id a1)
{
  int v2 = 0;
  size_t v1 = 4LL;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0LL, 0LL)) {
    dword_1000364E8 = v2 != 0;
  }
}

uint64_t sub_10000D53C(uint64_t a1)
{
  else {
    uint64_t result = _os_feature_enabled_impl("DumpPanic", "EnablePanicPatternMatching");
  }
  byte_100036500 = result;
  return result;
}

void sub_10000D584(void *a1, _BYTE *a2, uint64_t a3)
{
  id v5 = a1;
  if (a3 >= 1)
  {
    unint64_t v6 = (unint64_t)&a2[a3];
    int v7 = (int)a2;
    int v8 = a2;
    do
    {
      if (*v8 == 10)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v10 = v7 - (_DWORD)a2;
          __int16 v11 = 2080;
          id v12 = a2;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%.*s", buf, 0x12u);
        }

        a2 = v8 + 1;
      }

      else if (!*v8)
      {
        break;
      }

      ++v8;
      ++v7;
    }

    while ((unint64_t)v8 < v6);
  }
}

BOOL sub_10000D69C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 bytes];
  id v3 = [v1 length];

  int v4 = sysctlbyname("kern.coredump_encryption_key", 0LL, 0LL, v2, (size_t)v3);
  if (v4)
  {
    id v5 = (void *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      int v7 = v5;
      int v8 = *__error();
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to notify kernel of new public encryption key. Error: %{errno}d",  (uint8_t *)v9,  8u);
    }
  }

  return v4 == 0;
}

void sub_10000D7A8(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = v1;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByDeletingLastPathComponent]);
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v5 = [v4 fileExistsAtPath:v2];

    unint64_t v6 = v2;
    if ((v5 & 1) == 0)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Retired"]);
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v8]);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v10 = [v9 fileExistsAtPath:v6];

    if ((v10 & 1) == 0)
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@".synced"]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

      if ((v13 & 1) != 0)
      {
        unint64_t v6 = v11;
      }

      else
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Retired"]);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:v15]);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v17 = [v16 fileExistsAtPath:v6];

    uint64_t v18 = qword_100036568;
    BOOL v19 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        int v24 = 138412290;
        uint64_t v25 = v6;
        id v20 = "attempting to discard safe log at %@";
        unint64_t v21 = (os_log_s *)v18;
        uint32_t v22 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, v22);
      }
    }

    else if (v19)
    {
      LOWORD(v24) = 0;
      id v20 = "no safe log will be discarded";
      unint64_t v21 = (os_log_s *)v18;
      uint32_t v22 = 2;
      goto LABEL_13;
    }

    id v23 = v6;
    unlink((const char *)[v23 UTF8String]);
  }

__CFString *sub_10000DA0C(const char *a1, uint64_t a2)
{
  if (a1)
  {
    if ((_DWORD)a2) {
      id v2 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  a1,  strnlen(a1, a2),  4LL,  0LL);
    }
    else {
      id v2 = &stru_100031290;
    }
    return v2;
  }

  else
  {
    uint64_t v4 = _os_assert_log(0LL, a2);
    uint64_t result = (__CFString *)_os_crash(v4);
    __break(1u);
  }

  return result;
}

void sub_10000DD5C(id *a1)
{
}

void sub_10000DDA4(io_registry_entry_t a1)
{
  kern_return_t v1;
  kern_return_t v2;
  os_log_s *v3;
  _DWORD v4[2];
  if (a1)
  {
    id v1 = IORegistryEntrySetCFProperty(a1, @"IOPMUBootErrorClear", &off_1000336A0);
    if (v1)
    {
      id v2 = v1;
      id v3 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        v4[0] = 67109120;
        v4[1] = v2;
        _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "failed to clear PMU boot-properties with error: %d",  (uint8_t *)v4,  8u);
      }

      if (qword_1000364F0 != -1) {
        dispatch_once(&qword_1000364F0, &stru_100030AD0);
      }
      if (!dword_1000364E8)
      {
        if (os_variant_has_internal_diagnostics("com.apple.dumppanic"))
        {
          _os_crash("failed to clear PMU boot properties");
          __break(1u);
        }
      }
    }
  }

id sub_10000DEB4(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  id result = a2[5];
  a1[5] = result;
  return result;
}

id sub_10000DF1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  v4[0] = @"bootStage";
  v4[1] = @"type";
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = v1;
  v5[1] = v2;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL));
}

NSMutableDictionary *sub_10000DF9C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 80);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  id v6 = v1;
  id v7 = v2;
  id v8 = v3;
  id v9 = v4;
  unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"bootStage");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, @"panicCount");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, @"otherResetCount");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"bootStage");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v5, @"resetType");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  off_100035AF0,  @"bootAppHash");
  else {
    __int16 v11 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, @"backpow");
  else {
    id v12 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, @"btn_rst");
  else {
    unsigned __int8 v13 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, @"btn_shdn");
  else {
    uint64_t v14 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, @"chg_pok_fall");
  else {
    int v15 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, @"cpu_therm");
  else {
    id v16 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, @"crash");
  else {
    unsigned int v17 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, @"dbg_rst");
  else {
    uint64_t v18 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v18, @"force_off");
  else {
    BOOL v19 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, @"gpu_therm");
  else {
    id v20 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v20, @"ntc_shdn");
  else {
    unint64_t v21 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v21, @"oc");
  else {
    uint32_t v22 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v22, @"ot");
  else {
    id v23 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v23, @"ov");
  else {
    int v24 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v24, @"por");
  else {
    uint64_t v25 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v25, @"remote_pmic");
  else {
    uint64_t v26 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v26, @"rst");
  else {
    uint64_t v27 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v27, @"sgpio");
  else {
    id v28 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v28, @"sochot");
  else {
    id v29 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v29, @"spmi");
  else {
    id v30 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v30, @"sstate");
  else {
    id v31 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v31, @"timeout");
  else {
    __int16 v32 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v32, @"upc_reset");
  else {
    uint64_t v33 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v33, @"uv");
  else {
    size_t v34 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v34,  @"vdd_hi_and_chg_pok");
  unsigned int v35 = [v6 containsObject:@"wdog"];

  if (v35) {
    id v36 = &__kCFBooleanTrue;
  }
  else {
    id v36 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v36, @"wdog");
  return v10;
}

void sub_10000E4A0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 crashReporterKey]);
  uint64_t v7 = OSADateFormat(1LL, *(double *)(a1 + 40));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) componentsJoinedByString:@" "]);
  id v12 = [*(id *)(a1 + 64) unsignedIntValue];
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Incident Identifier: %@\nCrashReporter Key:   %@\nDate: %@\nReset count: %@\nBoot failure count: %@\nBoot faults: %@\nBoot stage: 0x%x\nBoot app: %@\nsocId: %x\nsocRevision: %x",  v3,  v6,  v8,  v9,  v10,  v11,  v12,  off_100035AF0,  *(unsigned int *)(a1 + 96),  *(unsigned int *)(a1 + 100)));

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v14 dataUsingEncoding:4 allowLossyConversion:1]);
  [v4 writeData:v13];
}

id sub_10000E5CC(uint64_t a1, uint64_t a2)
{
  return sub_10000DEB4((void *)(a1 + 48), (id *)(a2 + 48));
}

void sub_10000E5D8(uint64_t a1)
{
}

id sub_10000E5E0(uint64_t a1, uint64_t a2)
{
  return sub_10000DEB4((void *)(a1 + 40), (id *)(a2 + 40));
}

void sub_10000E5EC(uint64_t a1)
{
}

uint64_t sub_10000E5F4()
{
  if (qword_100036518 != -1) {
    dispatch_once(&qword_100036518, &stru_100030BC0);
  }
  return qword_100036508;
}

void sub_10000E638(id a1)
{
  LOWORD(qword_100036508) = 0;
  BYTE2(qword_100036508) = 0;
  qword_100036510 = 0LL;
  if (os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
  {
    unint64_t v17 = 0LL;
    id v1 = sub_10000D038();
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    sub_10000D1E4(v2, @"dumppanic", &v17);

    LOBYTE(qword_100036508) = v17 & 1;
    if ((v17 & 1) != 0)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      if ([v3 fileExistsAtPath:@"/var/tmp/dumppanic"])
      {
        id v16 = 0LL;
        unsigned __int8 v4 = [v3 removeItemAtPath:@"/var/tmp/dumppanic" error:&v16];
        id v5 = v16;
        if ((v4 & 1) == 0)
        {
          id v6 = (os_log_s *)qword_100036568;
          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = @"/var/tmp/dumppanic";
            __int16 v19 = 2112;
            id v20 = v5;
            _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to remove directory: %@ -> %@",  buf,  0x16u);
          }
        }
      }

      else
      {
        id v5 = 0LL;
      }

      id v15 = v5;
      unsigned __int8 v7 = [v3 createDirectoryAtPath:@"/var/tmp/dumppanic" withIntermediateDirectories:1 attributes:0 error:&v15];
      id v8 = v15;

      if ((v7 & 1) == 0)
      {
        uint64_t v9 = (os_log_s *)qword_100036568;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"/var/tmp/dumppanic";
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to create directory: %@ -> %@",  buf,  0x16u);
        }
      }
    }

    *(void *)buf = 0LL;
    id v10 = sub_10000D038();
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v12 = sub_10000D1E4(v11, @"BATS_TESTPLAN_ID", (unint64_t *)buf);

    if (v12) {
      qword_100036510 = *(void *)buf;
    }
    if (sub_10000CF20())
    {
      char v13 = 1;
    }

    else
    {
      if (v12) {
        BOOL v14 = *(void *)buf == 0LL;
      }
      else {
        BOOL v14 = 1;
      }
      char v13 = !v14;
    }

    BYTE1(qword_100036508) = v13;
    BYTE2(qword_100036508) = (v17 & 2) != 0;
  }

BOOL sub_10000E8C0(void *a1, const void *a2, size_t a3)
{
  id v5 = a1;
  if (!v5)
  {
    uint64_t v14 = _os_assert_log(0LL, v6);
    _os_crash(v14);
    __break(1u);
    goto LABEL_14;
  }

  unsigned __int8 v7 = v5;

  if (!a2)
  {
LABEL_14:
    uint64_t v15 = _os_assert_log(0LL, v8);
    _os_crash(v15);
    __break(1u);
LABEL_15:
    uint64_t v16 = _os_assert_log(0LL, v8);
    _os_crash(v16);
    __break(1u);
  }

  if (!a3) {
    goto LABEL_15;
  }
  if (a3 > 0x240000)
  {
    uint64_t v9 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      size_t v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Paniclog data size (%llu bytes) size greater than max buffer size. Truncating.",  (uint8_t *)&v17,  0xCu);
    }

    a3 = 2359296LL;
  }

  id v10 = objc_claimAutoreleasedReturnValue([v7 path]);
  __int16 v11 = fopen((const char *)[v10 UTF8String], "w");

  if (v11)
  {
    fwrite(a2, a3, 1uLL, v11);
    fclose(v11);
  }

  else
  {
    int v12 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      size_t v18 = (size_t)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to open file: %@",  (uint8_t *)&v17,  0xCu);
    }
  }

  return v11 != 0LL;
}

uint64_t sub_10000EA70(uint64_t a1)
{
  int v1 = a1;
  if ((a1 - 101) <= 0xFFFFFF9B)
  {
    id v4 = objc_msgSend( objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Implausible embedded panic header version: %d", a1)), "UTF8String");
    _os_crash(v4);
    __break(1u);
  }

  uint64_t v3 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = v1;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Unknown embedded panic header version: %d",  buf,  8u);
  }

  return 177LL;
}

__CFString *sub_10000EB68(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    unint64_t v4 = 0LL;
    id v5 = &stru_100031290;
    do
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02hhx%02hhx",  *(unsigned __int8 *)(a1 + v4),  *(unsigned __int8 *)(a1 + v4 + 1)));
      unsigned __int8 v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6));

      v4 += 2LL;
      id v5 = v7;
    }

    while (v2 > v4);
  }

  else
  {
    unsigned __int8 v7 = &stru_100031290;
  }

  return v7;
}

void sub_10000EC24(_DWORD *a1, uint64_t a2, unint64_t a3, void *a4)
{
  if (a1[2] <= 4u)
  {
    *a4 = 0LL;
    uint64_t v5 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v20) = 0;
    int v6 = "Extensible Paniclog not supported. Skipping.";
    unsigned __int8 v7 = (os_log_s *)v5;
    uint32_t v8 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
    return;
  }

  int v12 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = *(_DWORD *)((char *)a1 + 161);
    int v14 = *(_DWORD *)((char *)a1 + 165);
    int v20 = 67109376;
    unsigned int v21 = v13;
    __int16 v22 = 1024;
    int v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Extensible Paniclog offset %u Length %u",  (uint8_t *)&v20,  0xEu);
  }

  unsigned int v15 = *(_DWORD *)((char *)a1 + 165);
  if ((v15 - 1) >> 15)
  {
    uint64_t v19 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v20 = 67109120;
    unsigned int v21 = v15;
    int v6 = "Did not find a valid ext paniclog. Found with length: %d";
    unsigned __int8 v7 = (os_log_s *)v19;
    uint32_t v8 = 8;
    goto LABEL_15;
  }

  unint64_t v16 = *(unsigned int *)((char *)a1 + 161);
  int v17 = (os_log_s *)qword_100036568;
  if (v16 < a3 && v16 >= a1[6] + a1[5])
  {
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109120;
      unsigned int v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "found ext paniclog with %u bytes",  (uint8_t *)&v20,  8u);
      unint64_t v16 = *(unsigned int *)((char *)a1 + 161);
      unsigned int v15 = *(_DWORD *)((char *)a1 + 165);
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a2 + v16,  v15,  0LL));
  }

  else if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    int v20 = 67109376;
    unsigned int v21 = v15;
    __int16 v22 = 1024;
    int v23 = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "invalid extensible paniclog eph_ext_paniclog_len %u eph_ext_paniclog_offset %u,",  (uint8_t *)&v20,  0xEu);
  }

void sub_10000EE80(_DWORD *a1, uint64_t a2, unint64_t a3, void *a4)
{
  unsigned int v8 = a1[2];
  uint64_t v9 = (os_log_s *)qword_100036568;
  BOOL v10 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
  if (v8 <= 5)
  {
    if (!v10) {
      return;
    }
    LOWORD(v22) = 0;
    __int16 v11 = "Panic Initiator not supported. Skipping.";
    int v12 = v9;
    uint32_t v13 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, v13);
    return;
  }

  if (v10)
  {
    int v14 = *(_DWORD *)((char *)a1 + 169);
    int v15 = *(_DWORD *)((char *)a1 + 173);
    int v22 = 67109376;
    int v23 = v14;
    __int16 v24 = 1024;
    int v25 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Panic Initiator offset %u Length %u",  (uint8_t *)&v22,  0xEu);
  }

  uint64_t v16 = *(unsigned int *)((char *)a1 + 173);
  if ((v16 - 1) > 0xFF)
  {
    uint64_t v20 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = 67109120;
    int v23 = v16;
    __int16 v11 = "Did not find a valid panic initiator. Found with length: %d";
    int v12 = (os_log_s *)v20;
    uint32_t v13 = 8;
    goto LABEL_15;
  }

  unint64_t v17 = *(unsigned int *)((char *)a1 + 169);
  size_t v18 = (os_log_s *)qword_100036568;
  if (v17 < a3 && v17 >= a1[6] + a1[5])
  {
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 67109120;
      int v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "found panic initiator with %u bytes",  (uint8_t *)&v22,  8u);
      unint64_t v17 = *(unsigned int *)((char *)a1 + 169);
      uint64_t v16 = *(unsigned int *)((char *)a1 + 173);
    }

    unsigned int v21 = sub_10000DA0C((const char *)(a2 + v17), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v21);
  }

  else if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    int v22 = 67109376;
    int v23 = v16;
    __int16 v24 = 1024;
    int v25 = v17;
    _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "invalid panic initiator eph_panic_initiator_len %u eph_panic_initiator_offset %u,",  (uint8_t *)&v22,  0xEu);
  }

void sub_10000F0B8( unsigned int *a1, unint64_t a2, void *a3, void *a4, void *a5, PanicReport *a6, uint64_t *a7, void *a8, double a9, void *a10)
{
  id v14 = a3;
  int v15 = a5;
  id v16 = a8;
  unint64_t v17 = a10;
  size_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Source: %@", 0LL));
  -[NSMutableArray addObject:](v18, "addObject:", v19);

  if (v15)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"OTA UUID: %.*s\n", [v15 length], objc_msgSend(v15, "bytes")));
    -[NSMutableArray addObject:](v18, "addObject:", v20);
  }

  v302 = v16;
  v287 = v17;
  v305 = v18;
  v306 = a1;
  if (a1 && a2 >= 0xB1 && *a1 == 1179995723)
  {
    unint64_t v21 = (unint64_t)v14;
    v290 = 0LL;
    v291 = 0LL;
    int v22 = 0LL;
    unint64_t v23 = a2;
    __int16 v24 = a1;
    goto LABEL_15;
  }

  unint64_t v21 = (unint64_t)v14;
  int v22 = 0LL;
  v290 = 0LL;
  unint64_t v23 = 0LL;
  __int16 v24 = 0LL;
  if (!a1)
  {
    v291 = 0LL;
    goto LABEL_15;
  }

  v291 = 0LL;
  if (a2 >= 8)
  {
    if (*a1 != 1346717008)
    {
      uint64_t v26 = (Bytef *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iBoot panic header magic invalid: found 0x%x, expected 0x%x",  *a1,  1346717008LL));
      BOOL v67 = (os_log_s *)qword_100036568;
      id v25 = (id)v21;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }

      -[NSMutableArray addObject:](v18, "addObject:", v26);
      if (byte_100036528) {
        uint64_t v68 = @"iBoot header contained bad magic (possible legacy panic data)";
      }
      else {
        uint64_t v68 = @"iBoot header contained bad magic";
      }
      id v29 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)v21 path]);
      sub_100011960(v68, v18, (uint64_t)a4, v29, a6, a7, a9);
      id v28 = v302;
      goto LABEL_189;
    }

    id v25 = (id)v21;
    if (a1[1] - 6 <= 0xFFFFFFFA)
    {
      uint64_t v26 = (Bytef *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iBoot panic header indicates invalid number of logs available (%d)",  a1[1]));
      uint64_t v27 = (os_log_s *)qword_100036568;
      id v28 = v302;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }

      -[NSMutableArray addObject:](v18, "addObject:", v26);
      id v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 path]);
      sub_100011960(@"iBoot header contains invalid number of logs", v18, (uint64_t)a4, v29, a6, a7, a9);
      goto LABEL_189;
    }

    unint64_t v89 = (os_log_s *)(id)qword_100036568;
    id v28 = v302;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v90 = a1[1];
      LODWORD(buf.next_in) = 67109120;
      HIDWORD(buf.next_in) = v90;
      _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "iBoot panic header indicates %d panic logs available",  (uint8_t *)&buf,  8u);
    }

    uint64_t v91 = a1[1];
    if (!(_DWORD)v91) {
      goto LABEL_199;
    }
    unint64_t v297 = (unint64_t)v25;
    unsigned int v92 = 0;
    int v93 = 0;
    int v22 = 0LL;
    v290 = 0LL;
    v291 = 0LL;
    uint64_t v94 = (Bytef **)(a1 + 6);
    while (1)
    {
      int v95 = *((_DWORD *)v94 - 4);
      switch(v95)
      {
        case 4:
          uint64_t v98 = (os_log_s *)(id)qword_100036568;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v99 = *v94;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v99;
            _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "Found SOCD container with length 0x%llx",  (uint8_t *)&buf,  0xCu);
          }

          ++v93;
          v290 = v94 - 2;
          break;
        case 2:
          uint64_t v100 = (os_log_s *)(id)qword_100036568;
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v101 = *v94;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v101;
            _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "Found storage dump log of length 0x%llx",  (uint8_t *)&buf,  0xCu);
          }

          ++v93;
          v291 = v94 - 2;
          break;
        case 0:
          uint64_t v96 = (os_log_s *)(id)qword_100036568;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v97 = *v94;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v97;
            _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEFAULT,  "Found embedded panic log of length 0x%llx",  (uint8_t *)&buf,  0xCu);
          }

          ++v93;
          int v22 = v94 - 2;
          goto LABEL_85;
        default:
          uint64_t v102 = (os_log_s *)(id)qword_100036568;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            int v103 = *((_DWORD *)v94 - 4);
            uint64_t v104 = *v94;
            LODWORD(buf.next_in) = 67109376;
            HIDWORD(buf.next_in) = v103;
            LOWORD(buf.avail_in) = 2048;
            *(void *)((char *)&buf.avail_in + 2) = v104;
            _os_log_error_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_ERROR,  "Found panic log of unknown type (%d) length 0x%llx",  (uint8_t *)&buf,  0x12u);
          }

          break;
      }

      a1 = v306;
LABEL_85:
      uint64_t v91 = a1[1];
      ++v92;
      v94 += 3;
      if (v92 >= v91)
      {
        id v28 = v302;
        if (v93)
        {
          unint64_t v23 = 0LL;
          __int16 v24 = 0LL;
          unint64_t v21 = v297;
          unint64_t v17 = v287;
          break;
        }

        unint64_t v17 = v287;
        size_t v18 = v305;
LABEL_199:
        uint64_t v26 = (Bytef *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to find usable panic log after traversing %d iBoot metadata logs",  v91));
        v202 = (os_log_s *)qword_100036568;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.next_in) = 138412290;
          *(Bytef **)((char *)&buf.next_in + 4) = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
        }

        -[NSMutableArray addObject:](v18, "addObject:", v26);
        id v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 path]);
        sub_100011960(@"No usable panic logs available from iBoot headers", v18, (uint64_t)a4, v29, a6, a7, a9);
LABEL_189:

        return;
      }
    }
  }

LABEL_15:
  v299 = (Bytef *)v23;
  char v30 = sub_10000E5F4();
  char v31 = v30;
  if (v17 && (v30 & 1) != 0)
  {
    __int16 v32 = (Bytef *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  &off_1000339B8));
    uint64_t v33 = v17;
    if (!sub_10000E8C0(v32, -[__CFString bytes](v33, "bytes"), (size_t)-[__CFString length](v33, "length")))
    {
      size_t v34 = (os_log_s *)(id)qword_100036568;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "failed to write fallback data to file: %@",  (uint8_t *)&buf,  0xCu);
      }
    }

    a1 = v306;
  }

  v298 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v22)
  {
    unsigned int v35 = (os_log_s *)(id)qword_100036568;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = v22[2];
      LODWORD(buf.next_in) = 134217984;
      *(Bytef **)((char *)&buf.next_in + 4) = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Found embedded panic log of length 0x%llx",  (uint8_t *)&buf,  0xCu);
    }

    if ((v31 & 1) != 0)
    {
      id v37 = (Bytef *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  &off_1000339D0));
      if (!sub_10000E8C0(v37, &v22[1][(void)a1], (size_t)v22[2]))
      {
        uint64_t v38 = (os_log_s *)(id)qword_100036568;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.next_in) = 138412290;
          *(Bytef **)((char *)&buf.next_in + 4) = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "failed to write embedded panic data to file: %@",  (uint8_t *)&buf,  0xCu);
        }
      }
    }

    int v39 = *((_DWORD *)v22 + 1);
    if ((v39 & 2) != 0)
    {
      unint64_t v17 = @"BAD MAGIC! (flag set in iBoot panic header), no panic log available";
      BOOL v40 = (Bytef *)v305;
    }

    else
    {
      BOOL v40 = (Bytef *)v305;
      if ((v39 & 4) != 0)
      {
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iBoot indicates CRC mismatch"));
        -[NSMutableArray addObject:](v305, "addObject:", v41);
      }

      id v317 = 0LL;
      int v42 = sub_100011B00((unsigned int *)v22, a2, &v317);
      unint64_t v17 = (__CFString *)v317;
      if (!v42)
      {
        v299 = v22[2];
        unsigned int v43 = (unsigned int *)&v22[1][(void)v306];
LABEL_42:
        id v25 = (id)v21;
        *(void *)a6->OSAStackShotReport_opaque = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v17,  0LL));
        uint64_t v50 = 1LL;
        v288 = @"panic";
LABEL_43:
        id v49 = v299;
        goto LABEL_44;
      }
    }

    unsigned int v43 = v24;
    goto LABEL_42;
  }

  if (!v17)
  {
    uint64_t v50 = 0LL;
    v288 = @"panic";
    BOOL v40 = (Bytef *)v305;
    unsigned int v43 = v24;
    id v25 = (id)v21;
    goto LABEL_43;
  }

  unsigned int v44 = (void *)qword_100036568;
  BOOL v40 = (Bytef *)v305;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = v44;
    uint64_t v46 = (Bytef *)-[__CFString length](v17, "length");
    LODWORD(buf.next_in) = 134217984;
    *(Bytef **)((char *)&buf.next_in + 4) = v46;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Falling back to corefile embedded panic log of length 0x%lx",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DRAM panic log missing; corefile fallback log in use"));
  -[NSMutableArray addObject:](v305, "addObject:", v47);

  id v48 = v17;
  unsigned int v43 = (unsigned int *)-[__CFString bytes](v48, "bytes");
  id v49 = (Bytef *)-[__CFString length](v48, "length");
  unint64_t v17 = 0LL;
  uint64_t v50 = 1LL;
  v288 = @"interrupted coredump panic";
  id v25 = (id)v21;
LABEL_44:
  v294 = v43;
  v296 = v25;
  v300 = v49;
  v285 = v15;
  int v275 = v50;
  if (!v43 || !v49)
  {

    int v282 = 0;
    __int128 v63 = 0LL;
    uint64_t v59 = 0LL;
    id v25 = 0LL;
    BOOL v40 = 0LL;
    uint64_t v64 = 0LL;
    int v15 = 0LL;
    id v65 = 0LL;
    uint64_t v66 = @"embedded panic data not available";
    goto LABEL_105;
  }

  id v315 = 0LL;
  id v51 = v40;
  id v52 = v298;
  id v53 = v51;
  if (!v53)
  {
    uint64_t v265 = _os_assert_log(0LL, v54);
    __int128 v56 = (NSMutableDictionary *)_os_crash(v265);
    __break(1u);
    goto LABEL_294;
  }

  id v55 = v53;

  __int128 v56 = v52;
  if (!v56)
  {
LABEL_294:
    uint64_t v266 = _os_assert_log(v56, v57);
    v123 = (__CFString *)_os_crash(v266);
    __break(1u);
    goto LABEL_295;
  }

  v286 = v56;

  id v316 = 0LL;
  __int128 v58 = (os_log_s *)qword_100036568;
  v281 = v17;
  if ((unint64_t)v300 <= 0xB0)
  {
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "rejecting implausible buffer!",  (uint8_t *)&buf,  2u);
    }

    int v282 = 0;
    v279 = 0LL;
    uint64_t v59 = 0LL;
    __int128 v60 = 0LL;
    __int128 v61 = 0LL;
    uint64_t v50 = 0LL;
    __int128 v62 = 0LL;
LABEL_91:
    uint64_t v107 = v286;
    goto LABEL_103;
  }

  v278 = v55;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
  {
    uInt v69 = *v43;
    unsigned int v70 = v43[2];
    uint64_t v71 = *(Bytef **)(v43 + 3);
    LODWORD(v277) = v43[5];
    unsigned int v280 = v43[6];
    BOOL v72 = (const char *)(v43 + 13);
    unsigned int v73 = v43[9];
    unsigned int v283 = v294[10];
    uint64_t v74 = v58;
    uint64_t v75 = sub_10000DA0C(v72, 32LL);
    uint64_t v76 = (internal_state *)objc_claimAutoreleasedReturnValue(v75);
    BOOL v77 = sub_10000DA0C((const char *)v294 + 84, 32LL);
    uint64_t v78 = (voidpf (__cdecl *)(voidpf, uInt, uInt))objc_claimAutoreleasedReturnValue(v77);
    BOOL v79 = sub_10000DA0C((const char *)v294 + 116, 37LL);
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
    uint64_t v81 = *(void *)((char *)v294 + 153);
    LODWORD(buf.next_in) = 134220802;
    *(Bytef **)((char *)&buf.next_in + 4) = v300;
    *((_WORD *)&buf.avail_in + 2) = 1024;
    *(uInt *)((char *)&buf.avail_in + 6) = v69;
    WORD1(buf.total_in) = 1024;
    HIDWORD(buf.total_in) = v70;
    LOWORD(buf.next_out) = 2048;
    *(Bytef **)((char *)&buf.next_out + 2) = v71;
    HIWORD(buf.avail_out) = 1024;
    *(&buf.avail_out + 1) = v277;
    LOWORD(buf.total_out) = 1024;
    *(_DWORD *)((char *)&buf.total_out + 2) = v280;
    HIWORD(buf.total_out) = 1024;
    LODWORD(buf.msg) = v73;
    unsigned int v43 = v294;
    WORD2(buf.msg) = 1024;
    *(_DWORD *)((char *)&buf.msg + 6) = v283;
    WORD1(buf.state) = 2112;
    *(internal_state **)((char *)&buf.state + 4) = v76;
    WORD2(buf.zalloc) = 2112;
    *(alloc_func *)((char *)&buf.zalloc + 6) = v78;
    HIWORD(buf.zfree) = 2112;
    buf.opaque = v80;
    LOWORD(buf.data_type) = 2048;
    *(void *)((char *)&buf.data_type + 2) = v81;
    _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "(embedded) length: %zu eph: magic %08X vers %u flags 0x%016llX panic_log offset %u, len %u, other_log offset %u, l en %u, osversion: %@, macosversion: %@, bootsessionuuid: %@, roots_installed: %lld",  (uint8_t *)&buf,  0x62u);
  }

  unint64_t v21 = *v43;
  if ((_DWORD)v21 != 1179995723)
  {
    BOOL v105 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 67109120;
      HIDWORD(buf.next_in) = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_ERROR,  "invalid eph_magic 0x%08X",  (uint8_t *)&buf,  8u);
      unint64_t v21 = *v43;
    }

    uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Embedded panic header contains invalid magic, expected 0x%x found 0x%x",  1179995723LL,  v21));
    -[Bytef addObject:](v55, "addObject:", v106);

    int v282 = 0;
    v279 = 0LL;
    uint64_t v59 = 0LL;
    __int128 v60 = 0LL;
    __int128 v61 = 0LL;
    uint64_t v50 = 0LL;
    __int128 v62 = @"Embedded panic log header contained bad magic";
    goto LABEL_91;
  }

  uint64_t v82 = *(id **)(v43 + 3);
  unint64_t v83 = sub_10000DA0C((const char *)v43 + 116, 37LL);
  v277 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v83);
  uint64_t v84 = sub_10000DA0C((const char *)v43 + 52, 32LL);
  id v85 = (id)objc_claimAutoreleasedReturnValue(v84);
  uint64_t v59 = *(void *)((char *)v43 + 153);
  v279 = v82;
  if (!v43[6])
  {
    uint64_t v88 = 0LL;
    goto LABEL_99;
  }

  uint64_t v86 = v43;
  unsigned int v87 = v43[5];
  if (v87 < sub_10000EA70(v86[2]))
  {
    uint64_t v88 = v86[6];
    unsigned int v43 = v86;
    id v55 = v278;
LABEL_99:
    BOOL v117 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      uInt v118 = v43[5];
      LODWORD(buf.next_in) = 67109632;
      HIDWORD(buf.next_in) = v88;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v118;
      *((_WORD *)&buf.avail_in + 3) = 2048;
      buf.total_in = (uLong)v300;
      _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "invalid eph_panic_log_len %u eph_panic_log_offset %u, embedded_panic_length %lu",  (uint8_t *)&buf,  0x18u);
      uint64_t v119 = v300;
      id v55 = v278;
      uint64_t v88 = v43[6];
    }

    else
    {
      uint64_t v119 = v300;
    }

    uint64_t v50 = (uint64_t)v277;
    v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Embedded panic header doesn't contain valid panic log: eph_panic_log_len %u eph_panic_log_offset %u embedded_panic_length %lu",  v88,  v43[5],  v119));
    -[Bytef addObject:](v55, "addObject:", v120);

    int v282 = 0;
    __int128 v60 = 0LL;
    __int128 v62 = @"Embedded panic log header contains invalid panic log offset";
    uint64_t v107 = v286;
    __int128 v61 = v85;
    goto LABEL_103;
  }

  unint64_t v108 = v86[5];
  uint64_t v88 = v86[6];
  unsigned int v43 = v86;
  id v55 = v278;
  BOOL v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v88));
  -[NSMutableDictionary setObject:forKey:](v286, "setObject:forKey:", v109, @"PanicLogLengthInBytes");

  unint64_t v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v43[10]));
  -[NSMutableDictionary setObject:forKey:](v286, "setObject:forKey:", v110, @"OtherLogLengthInBytes");

  BOOL v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v43[8]));
  -[NSMutableDictionary setObject:forKey:](v286, "setObject:forKey:", v111, @"StackshotLengthInBytes");

  uint64_t v112 = v43;
  int v113 = v43[10] + v43[6] + v43[8];
  uint64_t v114 = v113 + sub_10000EA70(v112[2]);
  uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v114));
  -[NSMutableDictionary setObject:forKey:](v286, "setObject:forKey:", v115, @"UsedSizeInBytes");

  *(void *)v319 = 0LL;
  if (sub_10000C62C((uint64_t)"chosen", "embedded-panic-log-size", v319))
  {
    unint64_t v116 = (os_log_s *)qword_100036568;
    id v55 = v278;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "WARNING: unable to calculate panic region utilization",  (uint8_t *)&buf,  2u);
    }
  }

  else
  {
    if (*(void *)v319)
    {
      v227 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  100 * (unint64_t)v114 / *(void *)v319));
      v228 = v286;
      -[NSMutableDictionary setObject:forKey:](v286, "setObject:forKey:", v227, @"PercentUsed");

      uint64_t v229 = *(void *)v319;
    }

    else
    {
      uint64_t v229 = 0LL;
      v228 = v286;
    }

    v231 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v229));
    -[NSMutableDictionary setObject:forKey:](v228, "setObject:forKey:", v231, @"PanicRegionSizeInBytes");

    id v55 = v278;
  }

  uint64_t v232 = v294[5];
  unint64_t v21 = v294[6];
  if ((unint64_t)&v300[-v232] < v21)
  {
    uint64_t v233 = ((_DWORD)v300 - v232);
    v234 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 67109376;
      HIDWORD(buf.next_in) = v232;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v234,  OS_LOG_TYPE_ERROR,  "truncating eph_panic_log_offset %u, eph_panic_log_len %u (ignoring other log)",  (uint8_t *)&buf,  0xEu);
      unint64_t v21 = v294[6];
    }

    __int128 v61 = v85;
    int8x16_t v235 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Truncated panic string from 0x%x to 0x%x bytes (ignoring other log)",  v21,  v233));
    -[Bytef addObject:](v55, "addObject:", v235);

    __int128 v62 =  -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  (char *)v294 + v294[5],  v233,  4LL,  0LL);
    int v282 = 0;
    __int128 v60 = 0LL;
    goto LABEL_278;
  }

  int8x16_t v236 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v236,  OS_LOG_TYPE_DEFAULT,  "found embedded panic log with %u bytes",  (uint8_t *)&buf,  8u);
  }

  int8x16_t v237 = v294;
  int8x16_t v238 =  -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  (char *)v294 + v294[5],  v294[6],  4LL,  0LL);
  __int128 v61 = v85;
  if (v238)
  {
    v284 = (Bytef *)v238;
    v239 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.next_in) = 138412290;
      *(Bytef **)((char *)&buf.next_in + 4) = v284;
      _os_log_impl( (void *)&_mh_execute_header,  v239,  OS_LOG_TYPE_DEFAULT,  "embedded panic string decoded: %@",  (uint8_t *)&buf,  0xCu);
    }

    int8x16_t v237 = v294;
    v240 = v278;
  }

  else
  {
    v241 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Parsed empty panic string from panic log buffer even though expected non-zero length: eph_panic_log_len %u eph_panic_log_offset %u embedded_panic_length %lu",  v294[6],  v294[5],  v300));
    -[Bytef addObject:](v278, "addObject:", v241);

    if (v294[6] < 0xF1)
    {
      v284 = 0LL;
      v240 = v278;
    }

    else
    {
      v240 = v278;
      v284 =  -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  (char *)v294 + v294[5],  240LL,  4LL,  0LL);
      if (v284) {
        goto LABEL_257;
      }
    }

    unsigned int v242 = v294[6];
    if (v242 >= 0x64) {
      uint64_t v243 = 100LL;
    }
    else {
      uint64_t v243 = v242;
    }
    int8x16_t v244 = sub_10000EB68((uint64_t)v294 + v294[5], v243);
    int8x16_t v245 = (void *)objc_claimAutoreleasedReturnValue(v244);
    int8x16_t v246 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Prefix of panic string dumped as hex: %@",  v245));
    -[Bytef addObject:](v240, "addObject:", v246);
  }

  unsigned int v87 = v11;
  uint64_t v88 = v4;
  int v95 = v3;
  if ((unint64_t)-[NSMutableArray count](v12, "count") < 2)
  {
    int v22 = v89;
  }

  else
  {
    unint64_t v21 = (void *)qword_100036568;
    int v22 = v89;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      unint64_t v83 = v21;
      uint64_t v84 = -[NSMutableArray count](v12, "count");
      *(_DWORD *)z_stream buf = 134217984;
      BOOL v117 = v84;
      _os_log_error_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "Found %lu sets of cores under staged folder",  buf,  0xCu);
    }

    unint64_t v23 = sub_1000144E0(v86, v4);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    BOOL v111 = 0u;
    uint64_t v112 = 0u;
    BOOL v109 = 0u;
    unint64_t v110 = 0u;
    int v12 = v24;
    id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v109,  v124,  16LL);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = 0LL;
      id v28 = *(void *)v110;
      do
      {
        id v29 = 0LL;
        char v30 = v27;
        do
        {
          if (*(void *)v110 != v28) {
            objc_enumerationMutation(v12);
          }
          uint64_t v27 = *(id *)(*((void *)&v109 + 1) + 8LL * (void)v29);

          char v31 = (os_log_s *)qword_100036568;
          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)z_stream buf = 138412290;
            BOOL v117 = v27;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ left in pull in list", buf, 0xCu);
          }

          id v29 = (char *)v29 + 1;
          char v30 = v27;
        }

        while (v26 != v29);
        uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v109,  v124,  16LL);
      }

      while (v26);

      int v22 = v89;
    }

    int v6 = v93;
  }

  -[NSMutableOrderedSet sortUsingComparator:](v6, "sortUsingComparator:", &stru_100030C00);
  if (-[NSMutableArray count](v12, "count") && -[NSMutableOrderedSet count](v6, "count"))
  {
    __int16 v32 = (void *)qword_100036568;
    unsigned int v90 = v12;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = v32;
      size_t v34 = -[NSMutableOrderedSet count](v6, "count");
      unsigned int v35 = -[NSMutableArray count](v12, "count");
      *(_DWORD *)z_stream buf = 138413058;
      BOOL v117 = v4;
      uInt v118 = 2048;
      uint64_t v119 = v34;
      v120 = 1024;
      v121 = 1;
      v122 = 2048;
      v123 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Removing prior %@ corefiles, found %lu sets (policy limit %u, %lu set staged)",  buf,  0x26u);
    }

    id v36 = 0LL;
LABEL_38:
    while ((unint64_t)-[NSMutableOrderedSet count](v6, "count") > v36)
    {
      int v42 = (void *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v43 = v42;
        unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndex:](v6, "objectAtIndex:", 0LL));
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v22, "stringFromDate:", v44));
        *(_DWORD *)z_stream buf = 138412290;
        BOOL v117 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removing cores from time %@", buf, 0xCu);

        int v6 = v93;
      }

      -[NSMutableOrderedSet removeObjectAtIndex:](v6, "removeObjectAtIndex:", 0LL);
    }

    uint64_t v107 = 0u;
    unint64_t v108 = 0u;
    BOOL v105 = 0u;
    uint64_t v106 = 0u;
    uint64_t v46 = v87;
    uint64_t v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v105,  v115,  16LL);
    id v48 = v95;
    if (v47)
    {
      id v49 = v47;
      uint64_t v50 = 0LL;
      id v51 = *(void *)v106;
      do
      {
        for (int8x16_t i = 0LL; i != v49; int8x16_t i = (char *)i + 1)
        {
          id v53 = v50;
          if (*(void *)v106 != v51) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(id *)(*((void *)&v105 + 1) + 8LL * (void)i);

          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v50 lastPathComponent]);
          id v55 = sub_10001268C(v54);
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        }

        id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v105,  v115,  16LL);
      }

      while (v49);

      int v22 = v89;
    }

    -[NSMutableArray removeObjectsInArray:](v46, "removeObjectsInArray:", v92);
    int v103 = 0u;
    uint64_t v104 = 0u;
    uint64_t v101 = 0u;
    uint64_t v102 = 0u;
    uint64_t v57 = v92;
    __int128 v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v101,  v114,  16LL);
    if (v58)
    {
      uint64_t v59 = v58;
      __int128 v60 = 0LL;
      __int128 v61 = *(void *)v102;
      do
      {
        __int128 v62 = 0LL;
        __int128 v63 = v60;
        do
        {
          if (*(void *)v102 != v61) {
            objc_enumerationMutation(v57);
          }
          __int128 v60 = *(id *)(*((void *)&v101 + 1) + 8LL * (void)v62);

          uint64_t v64 = (os_log_s *)qword_100036568;
          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)z_stream buf = 138412290;
            BOOL v117 = v60;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Removing file %@", buf, 0xCu);
          }

          id v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v65 removeItemAtPath:v60 error:0];

          __int128 v62 = (char *)v62 + 1;
          __int128 v63 = v60;
        }

        while (v59 != v62);
        uint64_t v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v101,  v114,  16LL);
      }

      while (v59);

      int v22 = v89;
    }

    int v12 = v90;
    goto LABEL_64;
  }

  id v37 = -[NSMutableOrderedSet count](v6, "count");
  uint64_t v38 = (void *)qword_100036568;
  int v39 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v37 >= 2)
  {
    unsigned int v90 = v12;
    id v36 = 1LL;
    if (v39)
    {
      BOOL v40 = v38;
      __int128 v41 = -[NSMutableOrderedSet count](v6, "count");
      *(_DWORD *)z_stream buf = 138412802;
      BOOL v117 = v4;
      uInt v118 = 2048;
      uint64_t v119 = v41;
      v120 = 1024;
      v121 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Removing prior %@ corefiles, found %lu sets (policy limit %u)",  buf,  0x1Cu);
    }

    goto LABEL_38;
  }

  id v48 = v95;
  if (v39)
  {
    uint64_t v80 = v38;
    uint64_t v81 = -[NSMutableOrderedSet count](v6, "count");
    uint64_t v82 = -[NSMutableArray count](v12, "count");
    *(_DWORD *)z_stream buf = 134218754;
    BOOL v117 = v81;
    uInt v118 = 2112;
    uint64_t v119 = v88;
    v120 = 1024;
    v121 = 1;
    v122 = 2048;
    v123 = v82;
    _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Found %lu sets of %@ corefiles (policy limit %u, %lu set staged), not cleaning up",  buf,  0x26u);
  }

LABEL_257:
  unint64_t v21 = v237[10];
  if (!(_DWORD)v21)
  {
    int8x16_t v250 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v250,  OS_LOG_TYPE_DEFAULT,  "no 'other' log found in embedded panic log",  (uint8_t *)&buf,  2u);
    }

    __int128 v60 = 0LL;
    v251 = v294;
    goto LABEL_277;
  }

  unint64_t v247 = v237[9];
  unsigned int v248 = v237[6];
  if (v247 >= v248 + v237[5])
  {
    int8x16_t v249 = (os_log_s *)qword_100036568;
    if ((unint64_t)v300 > v247)
    {
      if ((unint64_t)&v300[-v247] >= v21)
      {
        __int128 v61 = v85;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.next_in) = 67109120;
          HIDWORD(buf.next_in) = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v249,  OS_LOG_TYPE_DEFAULT,  "found other log with %u bytes",  (uint8_t *)&buf,  8u);
        }

        v254 = objc_alloc(&OBJC_CLASS___NSString);
        v251 = v294;
        uint64_t v256 = v294[10];
        v255 = (char *)v294 + v294[9];
      }

      else
      {
        __int128 v61 = v85;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.next_in) = 67109376;
          HIDWORD(buf.next_in) = v247;
          LOWORD(buf.avail_in) = 1024;
          *(uInt *)((char *)&buf.avail_in + 2) = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v249,  OS_LOG_TYPE_ERROR,  "truncating eph_other_log_offset %u, eph_other_log_len %u",  (uint8_t *)&buf,  0xEu);
        }

        v252 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"truncated other string"));
        -[Bytef addObject:](v240, "addObject:", v252);

        uint64_t v253 = v300 - v294[9];
        v251 = v294;
        v254 = objc_alloc(&OBJC_CLASS___NSString);
        v255 = (char *)v251 + v251[9];
        uint64_t v256 = v253;
      }

      __int128 v60 =  -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( v254,  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v255,  v256,  4LL,  0LL);
      goto LABEL_277;
    }
  }

  else
  {
    int8x16_t v249 = (os_log_s *)qword_100036568;
  }

  if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.next_in) = 67109376;
    HIDWORD(buf.next_in) = v248;
    LOWORD(buf.avail_in) = 1024;
    *(uInt *)((char *)&buf.avail_in + 2) = v247;
    _os_log_error_impl( (void *)&_mh_execute_header,  v249,  OS_LOG_TYPE_ERROR,  "invalid eph_panic_log_len %u eph_other_log_offset %u,",  (uint8_t *)&buf,  0xEu);
  }

  __int128 v60 = 0LL;
  v251 = v294;
  __int128 v61 = v85;
LABEL_277:
  __int128 v62 = (__CFString *)v284;
  sub_10000EC24(v251, (uint64_t)v251, (unint64_t)v300, &v316);
  sub_10000EE80(v251, (uint64_t)v251, (unint64_t)v300, &v315);
  int v282 = 1;
  id v55 = v278;
LABEL_278:
  if (!v62) {
    __int128 v62 = @"embedded panic data was failed to be parsed from panic buffer, check notes for more details";
  }
  uint64_t v107 = v286;
  uint64_t v50 = (uint64_t)v277;
LABEL_103:

  v121 = v62;
  v122 = v60;
  id v65 = (__CFString *)v316;
  int v15 = (id *)v315;
  BOOL v40 = v61;
  id v25 = (id)v50;
  v123 = v121;
  if (!v123)
  {
LABEL_295:
    uint64_t v267 = _os_assert_log(v123, v124);
    _os_crash(v267);
    __break(1u);
LABEL_296:
    v268 = (os_log_s *)v15[173];
    if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 134217984;
      *(Bytef **)((char *)&buf.next_in + 4) = v40;
      _os_log_error_impl( (void *)&_mh_execute_header,  v268,  OS_LOG_TYPE_ERROR,  "Couldn't allocate a large enough (%zu bytes) buffer for inflating the compressed panic stackshot",  (uint8_t *)&buf,  0xCu);
    }

LABEL_298:
    v203 = v300;
    v201 = v300;
    goto LABEL_236;
  }

  uint64_t v66 = v123;

  *(void *)a6->OSAStackShotReport_opaque = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v66,  v122));
  uint64_t v64 = v122;
  __int128 v63 = v279;
LABEL_105:
  v125 = objc_alloc(&OBJC_CLASS___PanicReport);
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v59));
  v277 = (__CFString *)v66;
  v278 = v40;
  v286 = (NSMutableDictionary *)v64;
  v127 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:]( v125,  "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:",  v66,  v64,  v40,  v63,  v288,  v25,  v126);

  id v128 = sub_10000C528(v296, 0LL, a9);
  uint64_t v129 = objc_claimAutoreleasedReturnValue(v128);
  -[PanicReport setSOCIdAndRev](v127, "setSOCIdAndRev");
  -[PanicReport setUtilizationInfo:](v127, "setUtilizationInfo:", v298);
  -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:]( v127,  "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:",  0LL,  0LL,  0LL,  a4,  0xFFFFFFFFLL,  a9);
  -[PanicReport addNotes:](v127, "addNotes:", v305);
  -[NSMutableArray removeAllObjects](v305, "removeAllObjects");
  -[PanicReport useExtPaniclog:](v127, "useExtPaniclog:", v65);
  v279 = v15;
  -[PanicReport setPanicInitiator:](v127, "setPanicInitiator:", v15);
  a4 = (void *)v129;
  id v28 = v302;
  v130 = v306;
  if ((-[PanicReport saveWithOptions:](v127, "saveWithOptions:", v129) & 1) == 0)
  {
    v131 = (os_log_s *)(id)qword_100036568;
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_ERROR,  "Failed to write initial safe panic log",  (uint8_t *)&buf,  2u);
    }
  }

  v276 = v25;
  v281 = v65;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v127, "logfile"));
  v288 = (__CFString *)[v132 copy];

  uint64_t v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v311 = 0u;
  __int128 v312 = 0u;
  __int128 v313 = 0u;
  __int128 v314 = 0u;
  id v133 = v302;
  id v134 = [v133 countByEnumeratingWithState:&v311 objects:v318 count:16];
  a6 = v127;
  if (v134)
  {
    id v135 = v134;
    uint64_t v136 = *(void *)v312;
    do
    {
      for (int8x16_t i = 0LL; i != v135; int8x16_t i = (char *)i + 1)
      {
        if (*(void *)v312 != v136) {
          objc_enumerationMutation(v133);
        }
        v138 = *(void **)(*((void *)&v311 + 1) + 8LL * (void)i);
        v139 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v140 = sub_100013108(v138);
        v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
        int v142 = sub_100013098(v138);
        v143 = (void *)objc_claimAutoreleasedReturnValue([v138 base64EncodedStringWithOptions:0]);
        if (v143) {
          -[NSMutableArray addObject:](v139, "addObject:", v143);
        }
        if (v141) {
          -[NSMutableArray addObject:](v139, "addObject:", v141);
        }
        [(id)v50 addObject:v139];
      }

      id v135 = [v133 countByEnumeratingWithState:&v311 objects:v318 count:16];
    }

    while (v135);
    id v25 = v296;
    v127 = a6;
    id v28 = v302;
    v130 = v306;
  }

  else
  {
    int v142 = 0;
    id v25 = v296;
  }

  v144 = v294;
  if (v290)
  {
    if ((*((_BYTE *)v290 + 4) & 2) == 0)
    {
      v145 = v130;
      id v310 = 0LL;
      int v146 = sub_100011B00((unsigned int *)v290, a2, &v310);
      id v147 = v310;
      v148 = v147;
      if (v146)
      {
        v290 = (Bytef **)v147;
        -[PanicReport useSocdContainer:](v127, "useSocdContainer:", v50);
        id v28 = v302;
        id v25 = v296;
        if (!v142) {
          goto LABEL_131;
        }
      }

      else
      {
        v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  &v290[1][(void)v145],  *((unsigned int *)v290 + 4),  0LL));
        uint64_t v163 = objc_claimAutoreleasedReturnValue([v162 base64EncodedStringWithOptions:0]);

        uint64_t v164 = v163;
        if (!v163) {
          uint64_t v164 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to base64 encode SOCD container of length %u",  v290[2]));
        }
        v290 = (Bytef **)v164;
        if (v275)
        {
          v127 = a6;
          -[PanicReport useSocdNandContainer:](a6, "useSocdNandContainer:", v164);

          -[PanicReport useSocdContainer:](a6, "useSocdContainer:", v50);
          id v28 = v302;
          id v25 = v296;
          if ((v142 & 1) == 0) {
            goto LABEL_131;
          }
        }

        else
        {
          [v133 addObject:v162];
          v172 = sub_100013108(v162);
          v173 = (void *)objc_claimAutoreleasedReturnValue(v172);
          uint64_t v174 = v164;
          char v175 = sub_100013098(v162);
          v176 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableArray addObject:](v176, "addObject:", v174);
          -[NSMutableArray addObject:](v176, "addObject:", v173);
          [(id)v50 addObject:v176];
          -[PanicReport setPanicString:](a6, "setPanicString:", v173);

          id v28 = v302;
          v144 = v294;

          v127 = a6;
          -[PanicReport useSocdContainer:](a6, "useSocdContainer:", v50);
          id v25 = v296;
          if ((v175 & 1) == 0) {
            goto LABEL_131;
          }
        }
      }

      goto LABEL_130;
    }

    -[PanicReport useSocdContainer:](v127, "useSocdContainer:", v50);
    v149 = @"BAD MAGIC! (flag set in iBoot panic header), no SOCD container available";
  }

  else
  {
    -[PanicReport useSocdContainer:](v127, "useSocdContainer:", v50);
    v149 = @"No valid SOCD nand container present";
  }

  v290 = (Bytef **)v149;
  if ((v142 & 1) != 0)
  {
LABEL_130:
    v150 = off_100035AF0;
    -[PanicReport setForegroundAppHash:](v127, "setForegroundAppHash:", v150);
  }

LABEL_131:
  -[PanicReport addNotes:](v127, "addNotes:", v305);
  -[NSMutableArray removeAllObjects](v305, "removeAllObjects");
  unsigned int v151 = -[PanicReport saveWithOptions:](v127, "saveWithOptions:", a4);
  int v15 = (id *)&unk_100036000;
  v152 = (os_log_s *)(id)qword_100036568;
  v153 = v152;
  if (v151)
  {
    unint64_t v17 = v287;
    v154 = v291;
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_DEFAULT,  "Wrote log with SOCD data, discarding initial safe log",  (uint8_t *)&buf,  2u);
    }

    sub_10000D7A8(v288);
    v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](a6, "logfile"));
    v155 = (__CFString *)-[os_log_s copy](v153, "copy");

    v288 = v155;
  }

  else
  {
    unint64_t v17 = v287;
    v154 = v291;
    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_ERROR,  "Failed to write panic log with SOCD data",  (uint8_t *)&buf,  2u);
    }
  }

  if (v154)
  {
    id v156 = v25;
    if ((*((_BYTE *)v154 + 4) & 2) != 0)
    {
      v158 = (os_log_s *)(id)qword_100036568;
      int v161 = v282;
      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v158,  OS_LOG_TYPE_DEFAULT,  "No valid storage dump data found",  (uint8_t *)&buf,  2u);
      }

      v159 = v286;
      v160 = a6;
    }

    else
    {
      id v309 = 0LL;
      int v157 = sub_100011B00((unsigned int *)v154, a2, &v309);
      v158 = (os_log_s *)v309;
      if (v157)
      {
        -[NSMutableArray addObject:](v305, "addObject:", v158);
        v159 = v286;
        v160 = a6;
      }

      else
      {
        if ((*((_BYTE *)v154 + 4) & 4) != 0)
        {
          v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iBoot indicates storage dump CRC mismatch"));
          -[NSMutableArray addObject:](v305, "addObject:", v165);
        }

        v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  &v154[1][(void)v306],  *((int *)v154 + 4),  0LL));
        uint64_t v167 = objc_claimAutoreleasedReturnValue([v166 base64EncodedStringWithOptions:0]);

        v158 = (os_log_s *)v167;
        if (!v167) {
          v158 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to base64 encode storage dump of length %llu",  v154[2]);
        }
        -[PanicReport useStoragePanicData:](a6, "useStoragePanicData:", v158);
        -[PanicReport addNotes:](a6, "addNotes:", v305);
        -[NSMutableArray removeAllObjects](v305, "removeAllObjects");
        unsigned int v168 = -[PanicReport saveWithOptions:](a6, "saveWithOptions:", a4);
        v169 = (os_log_s *)(id)qword_100036568;
        v170 = v169;
        if (v168)
        {
          v159 = v286;
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_DEFAULT,  "Wrote log with storage data, discarding initial safe log",  (uint8_t *)&buf,  2u);
          }

          sub_10000D7A8(v288);
          v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](a6, "logfile"));
          v171 = (__CFString *)-[os_log_s copy](v170, "copy");

          v288 = v171;
          v160 = a6;
          int v15 = (id *)&unk_100036000;
        }

        else
        {
          v159 = v286;
          if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_ERROR,  "Failed to write panic log with storage data",  (uint8_t *)&buf,  2u);
          }

          v160 = a6;
        }

        unint64_t v17 = v287;
      }

      int v161 = v282;
    }

    id v25 = v156;
    v144 = v294;
    if (!v161) {
      goto LABEL_168;
    }
  }

  else
  {
    v159 = v286;
    v160 = a6;
    if (!v282)
    {
LABEL_168:
      v177 = (os_log_s *)v15[173];
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "no stackshot found", (uint8_t *)&buf, 2u);
      }

LABEL_175:
      v181 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v160, "logfile"));
      *a7 = (uint64_t)[v181 copy];

      if (byte_100036500)
      {
        v182 = v28;
        id v183 = -[PanicPatternMatchingSupport init:](objc_alloc(&OBJC_CLASS___PanicPatternMatchingSupport), "init:", 0LL);
        v184 = (void *)qword_100036520;
        qword_100036520 = (uint64_t)v183;

        v185 = (void *)qword_100036520;
        if (qword_100036520)
        {
          v186 = v160;
          v187 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport incidentID](v160, "incidentID"));
          v188 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logType](v186, "logType"));
          uint64_t v189 = *a7;
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport panicString](v186, "panicString"));
          v191 = (os_log_s *)objc_claimAutoreleasedReturnValue([v185 createPanicCriterials:v187 :v188 :v189 :v190]);

          if (v191)
          {
            unsigned int v192 = [(id)qword_100036520 lookForKnownPanic:v191];
            v193 = (os_log_s *)v15[173];
            if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
            {
              v194 = "Cannot find";
              if (v192) {
                v194 = "Found";
              }
              LODWORD(buf.next_in) = 136315138;
              *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)v194;
              _os_log_impl( (void *)&_mh_execute_header,  v193,  OS_LOG_TYPE_INFO,  "%s matched panic pattern",  (uint8_t *)&buf,  0xCu);
            }
          }

          else
          {
            v193 = (os_log_s *)v15[173];
            if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.next_in) = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v193,  OS_LOG_TYPE_ERROR,  "Failed to create Panic Criterials object, bailing out pattern matching",  (uint8_t *)&buf,  2u);
            }
          }

          v159 = v286;
          unint64_t v17 = v287;
          v160 = a6;
        }

        else
        {
          v191 = (os_log_s *)v15[173];
          if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v191,  OS_LOG_TYPE_ERROR,  "Failed to create PanicPatternMatchingSupport object, bailing out pattern matching",  (uint8_t *)&buf,  2u);
          }
        }

        id v28 = v182;
      }

      int v15 = v285;
      size_t v18 = v305;
      id v29 = v281;
      uint64_t v26 = (Bytef *)v290;
      goto LABEL_189;
    }
  }

  if ((v144[3] & 2) == 0) {
    goto LABEL_168;
  }
  unsigned int v178 = v144[7];
  if (v178 < sub_10000EA70(v144[2])
    || (unsigned int v179 = v144[8]) == 0
    || (uint64_t v180 = v144[7], (unint64_t)v300 < v180 + v179))
  {
    v177 = (os_log_s *)v15[173];
    if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
    {
      unsigned int v223 = v144[7];
      uInt v224 = v144[8];
      LODWORD(buf.next_in) = 67109376;
      HIDWORD(buf.next_in) = v223;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v224;
      _os_log_error_impl( (void *)&_mh_execute_header,  v177,  OS_LOG_TYPE_ERROR,  "invalid eph_stackshot_offset %u, eph_stackshot_len %u",  (uint8_t *)&buf,  0xEu);
    }

    goto LABEL_175;
  }

  id v195 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)v144 + v180));
  v196 = [v195 bytes];
  id v197 = [v195 length];

  int v198 = 0;
  if ((unint64_t)v197 >= 5)
  {
    if (*v196 == 1503811591) {
      int v198 = 1;
    }
    else {
      int v198 = 2 * (*v196 == 1129270608);
    }
  }

  v199 = (os_log_s *)v15[173];
  if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v198;
    _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_INFO, "panic stackshot is type %d", (uint8_t *)&buf, 8u);
  }

  id v200 = v195;
  unint64_t v21 = (unint64_t)v200;
  v159 = v286;
  if (v198 != 2)
  {
    v201 = (Bytef *)v200;
LABEL_285:

    v177 = v201;
    -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:]( a6,  "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:",  -[os_log_s bytes](v177, "bytes"),  -[os_log_s length](v177, "length"),  0LL,  mach_absolute_time(),  1LL,  a9);
    -[PanicReport addNotes:](a6, "addNotes:", v305);
    -[NSMutableArray removeAllObjects](v305, "removeAllObjects");
    unsigned int v262 = -[PanicReport saveWithOptions:](a6, "saveWithOptions:", a4);
    v263 = (os_log_s *)v15[173];
    v264 = v263;
    if (v262)
    {
      id v28 = v302;
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)v288;
        _os_log_impl( (void *)&_mh_execute_header,  v264,  OS_LOG_TYPE_DEFAULT,  "Discarding 'safe' log %@",  (uint8_t *)&buf,  0xCu);
      }

      sub_10000D7A8(v288);
    }

    else
    {
      id v28 = v302;
      if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v264,  OS_LOG_TYPE_ERROR,  "Failed to write full panic log",  (uint8_t *)&buf,  2u);
      }
    }

    v160 = a6;
    goto LABEL_175;
  }

  v203 = (Bytef *)v200;
  v204 = (uInt *)-[Bytef bytes](v203, "bytes");
  id v205 = -[Bytef length](v203, "length");
  uInt v206 = *v204;
  unsigned int v207 = *v204 & 0xFFFFFFF0;
  if (*v204 != 1129270608 || v207 == 32)
  {
    v225 = (os_log_s *)v15[173];
    if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
    {
      if (v207 == 32) {
        uInt v226 = 17;
      }
      else {
        uInt v226 = v206;
      }
      LODWORD(buf.next_in) = 136315394;
      *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)"decompress_stackshot";
      *((_WORD *)&buf.avail_in + 2) = 1024;
      *(uInt *)((char *)&buf.avail_in + 6) = v226;
      _os_log_error_impl( (void *)&_mh_execute_header,  v225,  OS_LOG_TYPE_ERROR,  "invalid kcdata iter type in %s(): %d",  (uint8_t *)&buf,  0x12u);
    }

  v130 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  v131 = v130;
  v132 = &unk_100036000;
  if (!v130)
  {
    v138 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v138,  OS_LOG_TYPE_ERROR,  "Error getting a reference to IODeviceTree:/defaults",  (uint8_t *)&block,  2u);
    }

    goto LABEL_191;
  }

  id v133 = IORegistryEntryCreateCFProperty(v130, @"supported-legacy-panic-flow", kCFAllocatorDefault, 0);
  if (v133)
  {
    byte_100036528 = 1;
    CFRelease(v133);
  }

  IOObjectRelease(v131);
  if ((byte_100036528 & 1) == 0)
  {
    v139 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    LOWORD(block.st_dev) = 0;
    id v135 = "Device tree indicates that device never supported legacy panic path";
    p_block = (uint8_t *)&block;
LABEL_189:
    v137 = (os_log_s *)v139;
    goto LABEL_190;
  }

  if (!lstat("/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed", &block))
  {
    v139 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_WORD *)z_stream buf = 0;
    id v135 = "Device supported legacy panic path, file marker found";
    p_block = buf;
    goto LABEL_189;
  }

  uint64_t v107 = *__error();
  uint64_t v74 = (__CFString *)qword_100036568;
  id v134 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v107 != 2)
  {
    if (v134)
    {
      uint64_t v74 = v74;
      int8x16_t v250 = __error();
      v251 = strerror(*v250);
      *(_DWORD *)z_stream buf = 136315394;
      *(void *)&uint8_t buf[4] = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
      *(_WORD *)&_BYTE buf[12] = 2080;
      *(void *)&buf[14] = v251;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v74,  OS_LOG_TYPE_DEFAULT,  "Failed to stat %s with error %s",  buf,  0x16u);
    }

    goto LABEL_191;
  }

  if (v134)
  {
    *(_WORD *)z_stream buf = 0;
    id v135 = "Device supported legacy panic path, no existing marker file found";
    p_block = buf;
    v137 = (os_log_s *)v74;
LABEL_190:
    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, v135, p_block, 2u);
  }

LABEL_283:
    v201 = v203;
    goto LABEL_284;
  }

  v300 = v203;
  v307 = 0LL;
  uint64_t v208 = 0LL;
  v304 = 0LL;
  id v292 = v205;
  unint64_t v209 = (unint64_t)v204 + (void)v205;
  v295 = v204;
  unint64_t v210 = (unint64_t)v204 + v204[1] + 16;
  int v211 = 3;
  do
  {
    if (v210 + 16 > v209 || (unint64_t v212 = v210, v210 += 16LL + *(unsigned int *)(v210 + 4), v210 > v209))
    {
      v230 = (os_log_s *)v15[173];
      if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v230,  OS_LOG_TYPE_ERROR,  "kcdata iterator was invalid while collecting compression metadata",  (uint8_t *)&buf,  2u);
      }

      v203 = v300;
      v201 = v300;
      id v25 = v296;
LABEL_236:
      v159 = v286;
      unint64_t v17 = v287;
      goto LABEL_284;
    }

    unint64_t v213 = v212 + 16;
    if (!strcmp((const char *)(v212 + 16), "kcd_c_type"))
    {
      v307 = *(Bytef **)(v213 + 32);
    }

    else if (!strcmp((const char *)v213, "kcd_c_totalout"))
    {
      uint64_t v208 = *(void *)(v213 + 32);
    }

    else if (!strcmp((const char *)v213, "kcd_c_totalin"))
    {
      v304 = *(Bytef **)(v213 + 32);
    }

    --v211;
  }

  while (v211);
  v214 = (os_log_s *)v15[173];
  if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.next_in) = 134218496;
    *(Bytef **)((char *)&buf.next_in + 4) = v307;
    *((_WORD *)&buf.avail_in + 2) = 2048;
    *(void *)((char *)&buf.avail_in + 6) = v208;
    HIWORD(buf.total_in) = 2048;
    buf.next_out = v304;
    _os_log_impl( (void *)&_mh_execute_header,  v214,  OS_LOG_TYPE_INFO,  "Compressed stackshot metadata: type: %lld totalout: %lld totalin %lld",  (uint8_t *)&buf,  0x20u);
  }

  id v25 = v296;
  v159 = v286;
  unint64_t v17 = v287;
  if (v307 != (Bytef *)1 || !v208 || !v304)
  {
    v257 = (os_log_s *)v15[173];
    if (!os_log_type_enabled(v257, OS_LOG_TYPE_ERROR))
    {
LABEL_282:
      v203 = v300;
      goto LABEL_283;
    }

    LODWORD(buf.next_in) = 134218496;
    *(Bytef **)((char *)&buf.next_in + 4) = v307;
    *((_WORD *)&buf.avail_in + 2) = 2048;
    *(void *)((char *)&buf.avail_in + 6) = v208;
    HIWORD(buf.total_in) = 2048;
    buf.next_out = v304;
    v258 = "Required metadata from compressed panic stackshot is unexpected: type: %lld totalout %lld totalin %lld";
    v259 = v257;
    uint32_t v260 = 32;
LABEL_309:
    _os_log_error_impl((void *)&_mh_execute_header, v259, OS_LOG_TYPE_ERROR, v258, (uint8_t *)&buf, v260);
    goto LABEL_282;
  }

  uint64_t v215 = v208;
  int v216 = *(_DWORD *)v210;
  unsigned int v217 = *(_DWORD *)v210 & 0xFFFFFFF0;
  if (*(_DWORD *)v210 != 1503811591 || v217 == 32)
  {
    v261 = (os_log_s *)v15[173];
    if (!os_log_type_enabled(v261, OS_LOG_TYPE_ERROR)) {
      goto LABEL_282;
    }
    if (v217 == 32) {
      int v273 = 17;
    }
    else {
      int v273 = v216;
    }
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v273;
    v258 = "Compressed kcdata buffer doesn't contain a stackshot, iter_type is %d";
    v259 = v261;
    uint32_t v260 = 8;
    goto LABEL_309;
  }

  BOOL v40 = &v304[(unint64_t)v304 >> 3];
  v218 = (Bytef *)malloc((size_t)v40);
  if (!v218) {
    goto LABEL_296;
  }
  v219 = v218;
  memset(&buf, 0, sizeof(buf));
  int v220 = inflateInit_(&buf, "1.2.12", 112);
  if (v220)
  {
    int v221 = v220;
    v222 = (os_log_s *)v15[173];
    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v319 = 67109120;
      *(_DWORD *)&v319[4] = v221;
      _os_log_error_impl( (void *)&_mh_execute_header,  v222,  OS_LOG_TYPE_ERROR,  "Failed to initialize the z_stream for this panic stackshot: rc = %d",  v319,  8u);
    }

    free(v219);
    goto LABEL_298;
  }

  *(void *)v219 = 1503811591LL;
  *((void *)v219 + 1) = 0LL;
  unint64_t v269 = v210 + 16;
  buf.next_in = (Bytef *)(v210 + 16);
  buf.avail_in = v215;
  buf.next_out = v219 + 16;
  buf.avail_out = (_DWORD)v40 - 16;
  int v308 = inflate(&buf, 4);
  if (v308 != 1)
  {
    v272 = (os_log_s *)v15[173];
    if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v319 = 67109120;
      *(_DWORD *)&v319[4] = v308;
      _os_log_error_impl( (void *)&_mh_execute_header,  v272,  OS_LOG_TYPE_ERROR,  "Failed to inflate the compresssed panic stackshot buffer: rc = %d",  v319,  8u);
    }

    free(v219);
    v203 = v300;
    v201 = v300;
    id v25 = v296;
    v159 = v286;
    unint64_t v17 = v287;
LABEL_284:

    goto LABEL_285;
  }

  inflateEnd(&buf);
  size_t v271 = (size_t)v292 + (void)v295 - v269 - v215;
  if (v271 <= (unint64_t)&v40[-buf.total_out - 16])
  {
    memcpy(&v219[buf.total_out + 16], (const void *)(v269 + v215), v271);
    v201 = (Bytef *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:",  v219,  v40));
    id v25 = v296;
    v159 = v286;
    unint64_t v17 = v287;
    v203 = v300;
    goto LABEL_284;
  }

  uint64_t v274 = _os_assert_log(0LL, v270);
  _os_crash(v274);
  __break(1u);
}

void sub_100011960(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, double a7)
{
  id v13 = a1;
  id v14 = a4;
  id v15 = a2;
  id v16 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:]( objc_alloc(&OBJC_CLASS___PanicReport),  "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:",  v13,  0LL,  0LL,  0LL,  @"corrupt data",  0LL,  0LL);
  -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:]( v16,  "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:",  0LL,  0LL,  0LL,  a3,  0xFFFFFFFFLL,  a7);
  -[PanicReport addNotes:](v16, "addNotes:", v15);

  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14));
  id v18 = sub_10000C528(v17, 0LL, a7);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  LOBYTE(v15) = -[PanicReport saveWithOptions:](v16, "saveWithOptions:", v19);

  if ((v15 & 1) == 0)
  {
    uint64_t v20 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to write out error panic log",  buf,  2u);
    }
  }

  *a5 = [v13 copy];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v16, "logfile"));
  *a6 = [v21 copy];
}

uint64_t sub_100011B00(unsigned int *a1, unint64_t a2, void *a3)
{
  *a3 = 0LL;
  uint64_t v4 = *a1;
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 == 2)
    {
      unint64_t v5 = 8LL;
    }

    else
    {
      if ((_DWORD)v4 != 4)
      {
        uint64_t result = _os_crash("check_log_metadata called with invalid log_type");
        __break(1u);
        return result;
      }

      unint64_t v5 = 20LL;
    }
  }

  else
  {
    unint64_t v5 = 44LL;
  }

  unint64_t v6 = *((void *)a1 + 2);
  if (v6 < v5)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid iBoot log metadata: (type %d) size invalid, found %llu, expected at least %lu",  v4,  v6,  v5));
    *a3 = v7;
    unsigned int v8 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)z_stream buf = 138412290;
      id v13 = v7;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      return 0xFFFFFFFFLL;
    }

    return 0xFFFFFFFFLL;
  }

  uint64_t v9 = *((void *)a1 + 1);
  if (v9 + v6 > a2)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid iBoot log metadata: (type %d) points outside of panic buffer : offset: %llu, size: %llu, bytes_read: %llu",  v4,  v9,  v6,  a2));
    *a3 = v10;
    unsigned int v8 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)z_stream buf = 138412290;
      id v13 = v10;
      goto LABEL_13;
    }

    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

size_t sub_100011C98(uint64_t a1, void *__dst, size_t a3)
{
  size_t v3 = 0LL;
  if (!a3) {
    return v3;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (!v5) {
    return v3;
  }
  size_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    uint64_t v9 = *(const void **)(a1 + 32);
LABEL_12:
    if (v8 >= a3) {
      size_t v3 = a3;
    }
    else {
      size_t v3 = v8;
    }
    memcpy(__dst, v9, v3);
    size_t v14 = *(void *)(a1 + 40) - v3;
    *(void *)(a1 + 32) += v3;
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 8) -= v3;
    return v3;
  }

  int v10 = *(_DWORD *)a1;
  vm_size_t v11 = (vm_page_size + v5 - 1) / vm_page_size * vm_page_size;
  if (*(void *)(a1 + 24) >= v11) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = *(void *)(a1 + 24);
  }
  unint64_t v13 = read(v10, *(void **)(a1 + 16), v12);
  if (v13 != -1LL)
  {
    size_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = *(const void **)(a1 + 16);
    if (v13 < v8) {
      size_t v8 = v13;
    }
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v8;
    goto LABEL_12;
  }

  id v16 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v17 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to read from kernelcore file.",  v17,  2u);
  }

  return -1LL;
}

uint64_t sub_100011DB4(void *a1)
{
  return 0LL;
}

ssize_t sub_100011DCC(uint64_t a1, void *a2, size_t a3)
{
  ssize_t v3 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), a2, a3);
  if (v3 == -1)
  {
    uint64_t v4 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v6 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to read from AEA decrypt stream source.",  v6,  2u);
    }
  }

  return v3;
}

uint64_t sub_100011E48(AEAContext *a1)
{
  uint64_t v2 = AAByteStreamClose(a1[1]);
  if ((_DWORD)v2 == -1)
  {
    ssize_t v3 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Failed to close AEA decrypt stream source.",  v5,  2u);
    }
  }

  AEAContextDestroy(*a1);
  free(a1);
  return v2;
}

uint64_t sub_100011EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0LL;
  if (!a3 || *(_BYTE *)(a1 + 48)) {
    return result;
  }
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  while (1)
  {
    if (*(void *)(a1 + 32))
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }

    ssize_t v7 = AAByteStreamRead(*(AAByteStream *)a1, *(void **)(a1 + 56), 8uLL);
    if (v7 == -1) {
      break;
    }
    *(void *)(a1 + 24) = *(void *)(a1 + 56);
    *(void *)(a1 + 32) = v7;
    BOOL v6 = v7 == 0;
LABEL_8:
    compression_status v8 = compression_stream_process((compression_stream *)(a1 + 8), v6);
    if (v8)
    {
      if (v8 == COMPRESSION_STATUS_END)
      {
        *(_BYTE *)(a1 + 48) = 1;
      }

      else if (v8 == COMPRESSION_STATUS_ERROR)
      {
        uint64_t v9 = (os_log_s *)qword_100036538;
        if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
        {
          __int16 v12 = 0;
          int v10 = "Failed to decode from lz4 stream source.";
          vm_size_t v11 = (uint8_t *)&v12;
          goto LABEL_21;
        }

        return -1LL;
      }

      return a3 - *(void *)(a1 + 16);
    }

    if (*(void *)(a1 + 16) != a3) {
      return a3 - *(void *)(a1 + 16);
    }
  }

  uint64_t v9 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)z_stream buf = 0;
    int v10 = "Failed to read from lz4 decode stream source.";
    vm_size_t v11 = buf;
LABEL_21:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
  }

  return -1LL;
}

uint64_t sub_10001201C(uint64_t a1)
{
  return 0LL;
}

z_size_t sub_100012054(gzFile *a1, voidpc buf, z_size_t nitems)
{
  z_size_t v3 = nitems;
  if (nitems && gzfwrite(buf, 1uLL, nitems, *a1) != nitems)
  {
    uint64_t v5 = (void *)gzerror(*a1, &errnum);
    if (errnum == -1)
    {
      BOOL v6 = __error();
      uint64_t v5 = strerror(*v6);
    }

    ssize_t v7 = v5;
    compression_status v8 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)bufa = 136315138;
      __int16 v12 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to write to gzip output file with error: %s.",  bufa,  0xCu);
    }

    return -1LL;
  }

  return v3;
}

uint64_t sub_100012148(gzFile *a1)
{
  return 0LL;
}

uint64_t sub_100012470(void *a1, void *a2, int a3)
{
  id v5 = a1;
  if (a2)
  {
    ssize_t v7 = v5;
    id v8 = [v5 length];
    if (v8)
    {
      *a2 = 0LL;
      id v10 = v7;
      int v11 = open((const char *)[v10 UTF8String], 0x20000000);
      if (v11 < 0)
      {
        if (*__error() == 2)
        {
          id v15 = v10;
          if (mkdir((const char *)[v15 UTF8String], a3) != -1)
          {
            uint64_t v16 = 1LL;
LABEL_18:

            return v16;
          }

          uint64_t v19 = __error();
          id v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error creating directory at : %@ : %s",  v15,  strerror(*v19));
        }

        else
        {
          unint64_t v17 = __error();
          id v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to open directory at path : %@ with error : %s",  v10,  strerror(*v17));
        }

        uint64_t v16 = 0LL;
        *a2 = (id)objc_claimAutoreleasedReturnValue(v18);
        goto LABEL_18;
      }

      int v12 = v11;
      if (fstat(v11, &v27))
      {
        unint64_t v13 = __error();
        id v25 = v10;
        uint64_t v26 = strerror(*v13);
        size_t v14 = @"fstat of %@ failed with error: %s";
      }

      else
      {
        if ((v27.st_mode & 0xF000) == 0x4000)
        {
          if (v27.st_mode != a3)
          {
            if (fchmod(v12, a3))
            {
              unint64_t v21 = __error();
              id v25 = v10;
              uint64_t v26 = strerror(*v21);
              size_t v14 = @"fchmod of path : %@ failed with error : %s";
              goto LABEL_14;
            }

            if (fchown(v12, 0, 0) == -1)
            {
              int v22 = __error();
              id v25 = v10;
              uint64_t v26 = strerror(*v22);
              size_t v14 = @"fchown of path : %@ failed with error : %s";
              goto LABEL_14;
            }
          }

          uint64_t v16 = 1LL;
LABEL_15:
          close(v12);
          goto LABEL_18;
        }

        id v25 = v10;
        size_t v14 = @"path exists but is not directory : %@";
      }

id sub_10001268C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  z_size_t v3 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 lastPathComponent]);
  if ([v4 containsString:@".core"])
  {
    id v5 = (char *)[v1 rangeOfString:@".core"];
    if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = _os_assert_log(0LL, v6);
      _os_crash(v15);
      __break(1u);
    }

    ssize_t v7 = v5;
    id v8 = 0LL;
    do
    {
      uint64_t v9 = v8;
      unsigned int v10 = [v4 characterAtIndex:v8];
      if (v7 == v9) {
        break;
      }
      id v8 = v9 + 1;
    }

    while (v10 != 46);
    if (v9 != v7)
    {
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 substringToIndex:v9]);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v2, "dateFromString:", v13));

      goto LABEL_14;
    }

    int v11 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      unint64_t v17 = v4;
LABEL_11:
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "unable to parse date from filename %@, skipping",  (uint8_t *)&v16,  0xCu);
    }
  }

  else
  {
    int v11 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      unint64_t v17 = v4;
      goto LABEL_11;
    }
  }

  int v12 = 0LL;
LABEL_14:

  return v12;
}

void sub_100012888(id a1)
{
  size_t __size = 0LL;
  int v1 = sysctlbyname("kern.kdp_corefile", 0LL, &__size, 0LL, 0LL);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)z_stream buf = 67109120;
    int v14 = v2;
    id v8 = "Failed to query the size of kdp_corefile. Error: %d";
    goto LABEL_13;
  }

  if (__size)
  {
    uint64_t v4 = (char *)malloc(__size);
    if (v4)
    {
      id v5 = v4;
      int v6 = sysctlbyname("kern.kdp_corefile", v4, &__size, 0LL, 0LL);
      if (!v6)
      {
        off_100035B48 = v5;
        return;
      }

      int v7 = v6;
      free(v5);
      uint64_t v3 = qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)z_stream buf = 67109120;
        int v14 = v7;
        id v8 = "Failed to query kdp_corefile. Error: %d";
LABEL_13:
        unsigned int v10 = (os_log_s *)v3;
        uint32_t v11 = 8;
        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v9 = qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        id v8 = "Failed to allocate memory for kdp_corefile buffer";
        unsigned int v10 = (os_log_s *)v9;
        uint32_t v11 = 2;
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v8, buf, v11);
      }
    }
  }

NSMutableArray *sub_100012A14(const char *a1, const char *a2, char *a3, const char *a4, unsigned int a5)
{
  kern_return_t MatchingServices;
  kern_return_t v14;
  uint64_t v15;
  const char *v16;
  os_log_s *v17;
  uint32_t v18;
  uint64_t v19;
  int v21;
  io_object_t v22;
  io_registry_entry_t v23;
  os_log_s *v24;
  CFStringRef v25;
  int v26;
  CFBooleanRef CFProperty;
  CFBooleanRef v28;
  CFTypeID v29;
  int Value;
  os_log_s *v31;
  BOOL v32;
  uint64_t v33;
  os_log_s *v34;
  const char *v35;
  void *v36;
  CFStringRef v37;
  CFStringRef v38;
  void *v39;
  CFStringRef v40;
  CFStringRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint32_t v45;
  uint64_t v46;
  os_log_s *v47;
  CFTypeID v48;
  kern_return_t v49;
  kern_return_t v50;
  os_log_s *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableArray *v55;
  char *cStr;
  int v57;
  io_iterator_t existing;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  CFTypeID v63;
  if (!a1)
  {
    id v52 = _os_assert_log(0LL, a2);
    _os_crash(v52);
    __break(1u);
    goto LABEL_65;
  }

  if (!a2)
  {
LABEL_65:
    id v53 = _os_assert_log(0LL, a2);
    _os_crash(v53);
    __break(1u);
LABEL_66:
    uint64_t v54 = _os_assert_log(0LL, a2);
    _os_crash(v54);
    __break(1u);
  }

  if (!a3) {
    goto LABEL_66;
  }
  CFMutableDictionaryRef v10 = IOServiceMatching(a1);
  if (!v10)
  {
    uint64_t v19 = qword_100036550;
    if (!os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)z_stream buf = 0;
    int v16 = "Failed to create matching dict";
LABEL_62:
    unint64_t v17 = (os_log_s *)v19;
    id v18 = 2;
    goto LABEL_63;
  }

  uint32_t v11 = v10;
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  uint64_t v59 = v12;
  CFDictionarySetValue( v11,  @"IOPropertyExistsMatch",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));

  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v11, &existing);
  if (MatchingServices)
  {
    int v14 = MatchingServices;
    uint64_t v15 = qword_100036550;
    if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)z_stream buf = 67109120;
      LODWORD(v61) = v14;
      int v16 = "Failed to get matching socd ioservices: 0x%x";
      unint64_t v17 = (os_log_s *)v15;
      id v18 = 8;
LABEL_63:
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    }

LABEL_9:
    id v55 = 0LL;
    return v55;
  }

  if (!existing)
  {
    uint64_t v19 = qword_100036550;
    if (!os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)z_stream buf = 0;
    int v16 = "IOService match returned an empty iterator";
    goto LABEL_62;
  }

  cStr = a3;
  id v55 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (a5 <= 1) {
    unint64_t v21 = 1;
  }
  else {
    unint64_t v21 = a5;
  }
  uint64_t v57 = v21;
LABEL_16:
  if (IOIteratorIsValid(existing))
  {
    while (1)
    {
      int v22 = IOIteratorNext(existing);
      if (!v22)
      {
        if (!IOIteratorIsValid(existing))
        {
          IOIteratorReset(existing);
          -[NSMutableArray removeAllObjects](v55, "removeAllObjects");
          goto LABEL_16;
        }

        goto LABEL_56;
      }

      uint64_t v23 = v22;
      if (a4)
      {
        uint64_t v24 = (os_log_s *)qword_100036550;
        if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)z_stream buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Waiting for SOCD data collection to complete",  buf,  2u);
        }

        id v25 = CFStringCreateWithCString(kCFAllocatorDefault, a4, 0x8000100u);
        uint64_t v26 = v57;
        if (v25)
        {
          while (1)
          {
            CFTypeRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v23, v25, kCFAllocatorDefault, 0);
            if (!CFProperty) {
              goto LABEL_36;
            }
            id v28 = CFProperty;
            id v29 = CFGetTypeID(CFProperty);
            if (v29 != CFBooleanGetTypeID()) {
              break;
            }
            Value = CFBooleanGetValue(v28);
            CFRelease(v28);
            char v31 = (os_log_s *)qword_100036550;
            __int16 v32 = os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_DEFAULT);
            if (!Value)
            {
              if (v32)
              {
                *(_WORD *)z_stream buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "SOCD data collection is complete. Checking for data",  buf,  2u);
              }

  CFMutableDictionaryRef v10 = _os_assert_log(0LL, a2);
  _os_crash(v10);
  __break(1u);
}

LABEL_37:
      id v37 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (!v37) {
        break;
      }
      uint64_t v38 = v37;
      int v39 = (void *)IORegistryEntryCreateCFProperty(v23, v37, kCFAllocatorDefault, 0);
      CFRelease(v38);
      if (!v39)
      {
        unsigned int v44 = qword_100036550;
        if (!os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        *(_DWORD *)z_stream buf = 136315394;
        __int128 v61 = (void *)a2;
        __int128 v62 = 2080;
        __int128 v63 = (CFTypeID)a1;
        size_t v34 = (os_log_s *)v44;
        unsigned int v35 = "Failed to read %s in %s. This most probably means there's just no SOCD data";
        uint64_t v45 = 22;
        goto LABEL_50;
      }

      BOOL v40 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
      if (!v40)
      {
        uint64_t v46 = qword_100036550;
        if (!os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        *(_DWORD *)z_stream buf = 136315138;
        __int128 v61 = cStr;
        size_t v34 = (os_log_s *)v46;
        unsigned int v35 = "Error creating CFString for key %s";
        goto LABEL_49;
      }

      __int128 v41 = v40;
      if (IORegistryEntrySetCFProperty(v23, v40, &off_1000336B8))
      {
        int v42 = qword_100036550;
        if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)z_stream buf = 136315138;
          __int128 v61 = cStr;
          size_t v34 = (os_log_s *)v42;
          unsigned int v35 = "Failed to write %s";
          goto LABEL_49;
        }

LABEL_51:
        int v39 = 0LL;
        goto LABEL_52;
      }

      CFRelease(v41);
      -[NSMutableArray addObject:](v55, "addObject:", v39);
LABEL_52:
      IOObjectRelease(v23);
    }

    unsigned int v43 = qword_100036550;
    if (!os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_DWORD *)z_stream buf = 136315138;
    __int128 v61 = (void *)a2;
    size_t v34 = (os_log_s *)v43;
    unsigned int v35 = "Error creating CFString for key %s";
LABEL_49:
    uint64_t v45 = 12;
LABEL_50:
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, v45);
    goto LABEL_51;
  }

LABEL_56:
  id v49 = IOObjectRelease(existing);
  if (v49)
  {
    uint64_t v50 = v49;
    id v51 = (os_log_s *)qword_100036550;
    if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)z_stream buf = 136315394;
      __int128 v61 = (void *)a1;
      __int128 v62 = 1024;
      LODWORD(v63) = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Failed to release socd ioservice (%s) iterator: 0x%x",  buf,  0x12u);
    }
  }

  return v55;
}

  return v11;
}

uint64_t sub_100013098(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v3 = v1;

    BOOL v4 = (unint64_t)[v3 length] >= 0x14
      && (*((_BYTE *)[v3 bytes] + 6) & 0x18) != 0;

    return v4;
  }

  else
  {
    uint64_t v6 = _os_assert_log(0LL, v2);
    uint64_t result = _os_crash(v6);
    __break(1u);
  }

  return result;
}

__CFString *sub_100013108(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v3 = v1;

    if ((unint64_t)[v3 length] < 0x14)
    {
      BOOL v4 = @"SOCD report detected: socd buffer doesn't accommodate the socd header";
LABEL_17:

      return v4;
    }

    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    char v7 = v6[6];
    char v8 = v6[5];
    BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SOCD report detected:"));
    if (sub_100013098(v5))
    {
      -[__CFString appendString:](v4, "appendString:", @" (AP watchdog expired)");
      int v9 = 1;
    }

    else
    {
      int v9 = 0;
    }

    if ((v7 & 6) != 0)
    {
      -[__CFString appendString:](v4, "appendString:", @" (SMC panic)");
      int v9 = 1;
    }

    if ((v8 & 0x18) != 0)
    {
      -[__CFString appendString:](v4, "appendString:", @" (iBoot async abort)");
      int v9 = 1;
    }

    if ((v8 & 6) != 0)
    {
      -[__CFString appendString:](v4, "appendString:", @" (iBoot sync abort)");
      if ((v8 & 0x60) == 0) {
        goto LABEL_17;
      }
    }

    else if ((v8 & 0x60) == 0)
    {
      if (v9) {
        goto LABEL_17;
      }
      CFMutableDictionaryRef v10 = @" (Unknown)";
      goto LABEL_16;
    }

    CFMutableDictionaryRef v10 = @" (iBoot panic)";
LABEL_16:
    -[__CFString appendString:](v4, "appendString:", v10);
    goto LABEL_17;
  }

  uint64_t v12 = _os_assert_log(0LL, v2);
  uint64_t result = (__CFString *)_os_crash(v12);
  __break(1u);
  return result;
}

uint64_t sub_100013254(void *a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a1;
  id v10 = a4;
  if (!a2)
  {
    uint64_t v49 = _os_assert_log(0LL, v11);
    _os_crash(v49);
    __break(1u);
    goto LABEL_41;
  }

  if (!a3)
  {
LABEL_41:
    uint64_t v50 = _os_assert_log(0LL, v11);
    id v12 = (id)_os_crash(v50);
    __break(1u);
    goto LABEL_42;
  }

  id v12 = v10;
  if (!v12)
  {
LABEL_42:
    uint64_t v51 = _os_assert_log(v12, v13);
    id v30 = (id)_os_crash(v51);
    __break(1u);
    goto LABEL_43;
  }

  int v14 = v12;

  *a2 = 0LL;
  *a3 = 0LL;
  if (![v14 count])
  {
    uint64_t v28 = 1LL;
    goto LABEL_39;
  }

  uint64_t v54 = a2;
  id v55 = a3;
  __int128 v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v56 = v14;
  obuint64_t j = v14;
  id v15 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v15)
  {
    id v16 = v15;
    id v53 = v9;
    id v17 = 0LL;
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = *(void *)v61;
    do
    {
      unint64_t v21 = 0LL;
      int v22 = v17;
      uint64_t v23 = v18;
      uint64_t v24 = v19;
      do
      {
        if (*(void *)v61 != v20) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v60 + 1) + 8LL * (void)v21);

        id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v26 = sub_100013108(v17);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v26);

        int v27 = sub_100013098(v17);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 base64EncodedStringWithOptions:0]);

        -[NSMutableArray addObject:](v25, "addObject:", v18);
        -[NSMutableArray addObject:](v25, "addObject:", v19);
        -[NSMutableArray addObject:](v58, "addObject:", v25);

        unint64_t v21 = (char *)v21 + 1;
        int v22 = v17;
        uint64_t v23 = v18;
        uint64_t v24 = v19;
      }

      while (v16 != v21);
      id v16 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
    }

    while (v16);

    id v9 = v53;
  }

  else
  {
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    int v27 = 0;
  }

  id v29 = objc_alloc(&OBJC_CLASS___PanicReport);
  id v30 = (id)objc_claimAutoreleasedReturnValue([obj lastObject]);
  if (!v30)
  {
LABEL_43:
    uint64_t v52 = _os_assert_log(v30, v31);
    _os_crash(v52);
    __break(1u);
  }

  __int16 v32 = v30;

  uint64_t v33 = @"socd";
  if ((unint64_t)[v32 length] >= 0x14)
  {
    id v34 = v32;
    unsigned int v35 = [v34 bytes];
    char v36 = v35[6];
    char v37 = v35[5];
    unsigned int v38 = sub_100013098(v34);
    int v39 = @"socd-ap watchdog";
    if (v38)
    {
      unsigned int v40 = 2;
    }

    else
    {
      int v39 = @"socd";
      unsigned int v40 = 1;
    }

    if ((v36 & 6) != 0) {
      int v39 = @"socd-smc panic";
    }
    else {
      unsigned int v40 = v38;
    }
    if ((v37 & 0x18) != 0)
    {
      ++v40;
      int v39 = @"socd-iboot async abort";
    }

    if ((v37 & 6) != 0)
    {
      ++v40;
      int v39 = @"socd-iboot sync abort";
    }

    if ((v37 & 0x60) != 0)
    {
      ++v40;
      int v39 = @"socd-iboot panic";
    }

    if (v40 <= 1) {
      uint64_t v33 = (__CFString *)v39;
    }
    else {
      uint64_t v33 = @"socd-multi";
    }
  }

  __int128 v41 = v33;
  int v42 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:]( v29,  "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:",  v19,  &stru_100031290,  &stru_100031290,  0LL,  v41,  0LL,  0LL);

  -[PanicReport useSocdContainer:](v42, "useSocdContainer:", v58);
  -[PanicReport setSOCIdAndRev](v42, "setSOCIdAndRev");
  if (v27)
  {
    unsigned int v43 = off_100035AF0;
    -[PanicReport setForegroundAppHash:](v42, "setForegroundAppHash:", v43);
  }

  id v44 = sub_10000C528(v9, 0LL, a5);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  uint64_t v28 = (uint64_t)-[PanicReport saveWithOptions:](v42, "saveWithOptions:", v45);
  if ((v28 & 1) != 0)
  {
    *uint64_t v54 = v19;
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v42, "logfile"));
    *id v55 = [v46 copy];
  }

  else
  {
    uint64_t v47 = (os_log_s *)qword_100036550;
    if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to write panic file", buf, 2u);
    }
  }

  int v14 = v56;
LABEL_39:

  return v28;
}

LABEL_2:
  id v12 = feof(input_core);
  uint64_t v13 = (void *)qword_100036568;
  int v14 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      id v15 = self->_input_corefile_name;
      id v16 = v13;
      *(_DWORD *)z_stream buf = 136315138;
      char v37 = -[NSString UTF8String](v15, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s core is empty", buf, 0xCu);
    }

    goto LABEL_21;
  }

  if (v14)
  {
    uint64_t v20 = self->_input_corefile_name;
    unint64_t v21 = v13;
    *(_DWORD *)z_stream buf = 136315394;
    char v37 = -[NSString UTF8String](v20, "UTF8String");
    unsigned int v38 = 2080;
    int v39 = a4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found %s core at %s", buf, 0x16u);
  }

  if (getxattr(a4, "UserSpaceCoreCompressed", &value, 5uLL, 0, 0) != -1)
  {
    int v22 = (void *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:
      fclose(self->_input_core);
      int v27 = 0LL;
      self->_input_core = 0LL;
      goto LABEL_22;
    }

    uint64_t v23 = self->_input_corefile_name;
    uint64_t v24 = v22;
    id v25 = -[NSString UTF8String](v23, "UTF8String");
    *(_DWORD *)z_stream buf = 136315138;
    char v37 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s core already compressed, skipping collection",  buf,  0xCu);
LABEL_14:

    goto LABEL_21;
  }

  if (*__error() != 93)
  {
    uint64_t v28 = (void *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v24 = v28;
    __int16 v32 = __error();
    uint64_t v33 = strerror(*v32);
    *(_DWORD *)z_stream buf = 136315394;
    char v37 = "UserSpaceCoreCompressed";
    unsigned int v38 = 2080;
    int v39 = v33;
    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "getxattr %s returned error : %s",  buf,  0x16u);
    goto LABEL_14;
  }

  int v27 = self;
LABEL_22:

  return v27;
}

LABEL_17:
    ;
  }

  while (!feof(v4->_input_core));
  free(v21);
  fclose(v4->_input_core);
  v4->_input_core = 0LL;
  id v29 = gzclose(v23);
  if (v29)
  {
    id v30 = v29;
    if (v29 == -1)
    {
      uint64_t v31 = (void *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = v4->_input_corefile_name;
        uint64_t v33 = v31;
        id v34 = -[NSString UTF8String](v32, "UTF8String");
        unsigned int v35 = __error();
        char v36 = strerror(*v35);
        *(_DWORD *)z_stream buf = 136315394;
        BOOL v99 = v34;
        uint64_t v100 = 2080;
        uint64_t v101 = v36;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to close compressed %s core with error : %s",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v68 = (void *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        unint64_t v89 = v4->_input_corefile_name;
        unsigned int v90 = v68;
        uint64_t v91 = -[NSString UTF8String](v89, "UTF8String");
        *(_DWORD *)z_stream buf = 136315394;
        BOOL v99 = v91;
        uint64_t v100 = 1024;
        LODWORD(v101) = v30;
        _os_log_error_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_ERROR,  "Failed to close compressed %s core with error : %d",  buf,  0x12u);
      }
    }

    remove("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX");
    goto LABEL_35;
  }

  char v8 = &AAByteStreamClose_ptr;
  __int128 v63 = sub_100019BE8(a3);
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%s%@.core.gz",  v64,  "",  v4->_input_corefile_name));

  id v65 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%s/%@", "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged", v5));
  uint64_t v66 = rename( "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX",  (const char *)[v65 UTF8String]);

  if (v66)
  {
    BOOL v67 = (void *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      unsigned int v92 = v4->_input_corefile_name;
      int v93 = v67;
      uint64_t v94 = -[NSString UTF8String](v92, "UTF8String");
      int v95 = [v5 UTF8String];
      *(_DWORD *)z_stream buf = 136315650;
      BOOL v99 = v94;
      uint64_t v100 = 2080;
      uint64_t v101 = "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX";
      uint64_t v102 = 2080;
      int v103 = v95;
      _os_log_error_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_ERROR,  "Failed to rename compressed %s from %s to %s",  buf,  0x20u);
    }

    remove("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX");
    goto LABEL_46;
  }

  uInt v69 = sub_10000CF20();
  uint64_t v6 = (void *)qword_100036568;
  unsigned int v70 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
  if (!v69)
  {
LABEL_59:
    if (v70)
    {
      uint64_t v81 = v4->_input_corefile_name;
      uint64_t v82 = v6;
      unint64_t v83 = -[NSString UTF8String](v81, "UTF8String");
      *(_DWORD *)z_stream buf = 136315138;
      BOOL v99 = v83;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Removing original %s core", buf, 0xCu);
    }

    remove(-[NSString UTF8String](v4->_input_corefile_path, "UTF8String"));
    goto LABEL_62;
  }

  if (v70)
  {
    uint64_t v71 = v4->_input_corefile_name;
    BOOL v72 = v6;
    unsigned int v73 = -[NSString UTF8String](v71, "UTF8String");
    *(_DWORD *)z_stream buf = 136315138;
    BOOL v99 = v73;
    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Detected stress rack device, setting xattr on original %s core",  buf,  0xCu);
  }

  if (setxattr( -[NSString UTF8String](v4->_input_corefile_path, "UTF8String"),  "UserSpaceCoreCompressed",  "YES",  4uLL,  0,  0))
  {
    uint64_t v74 = (void *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      uint64_t v75 = v74;
      uint64_t v76 = __error();
      BOOL v77 = strerror(*v76);
      *(_DWORD *)z_stream buf = 136315394;
      BOOL v99 = "UserSpaceCoreCompressed";
      uint64_t v100 = 2080;
      uint64_t v101 = v77;
      _os_log_error_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_ERROR,  "Failed to set %s xattr returned error : %s",  buf,  0x16u);
    }

LABEL_46:
    unsigned int v38 = 0LL;
LABEL_36:
    int v39 = 0LL;
    goto LABEL_37;
  }

LABEL_62:
  uint64_t v84 = sub_1000144E0(@"/private/var/mobile/Library/Logs/CrashReporter/Panics", v4->_input_corefile_name);
  unsigned int v38 = (char *)objc_claimAutoreleasedReturnValue( [v8[69] stringWithFormat:@"%s/%@", "/private/var/mobile/Library/Logs/CrashReporter/Panics", v5]);
  id v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v86 = [v85 fileExistsAtPath:v38];

  unsigned int v87 = (os_log_s *)*((void *)v7 + 173);
  if ((v86 & 1) == 0)
  {
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)z_stream buf = 138412290;
      BOOL v99 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Cannot find %@", buf, 0xCu);
    }

    goto LABEL_36;
  }

  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v88 = v4->_input_corefile_name;
    *(_DWORD *)z_stream buf = 138412546;
    BOOL v99 = (const char *)v88;
    uint64_t v100 = 2112;
    uint64_t v101 = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "Finished processing %@ core, available at %@",  buf,  0x16u);
  }

  unsigned int v38 = v38;
  int v39 = v38;
LABEL_37:

  return v39;
}

NSMutableArray *sub_1000144E0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  id v85 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
  -[NSDateFormatter setLocale:](v5, "setLocale:");
  unint64_t v89 = v5;
  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableOrderedSet);
  uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"staged"]);
  char v7 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)z_stream buf = 138412546;
    id v117 = v4;
    __int16 v118 = 2112;
    id v119 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prune %@ core files in %@", buf, 0x16u);
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enumeratorAtPath:v3]);

  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unsigned int v92 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v11 = v10;
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v91 = v9;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
  int v93 = v6;
  if (v13)
  {
    int v14 = (void *)v13;
    while (![v14 containsString:v4])
    {
LABEL_14:
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v91 nextObject]);

      int v14 = (void *)v20;
      if (!v20) {
        goto LABEL_15;
      }
    }

    unsigned int v15 = [v14 containsString:@"staged"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v14]);
    if (v15)
    {
      -[NSMutableArray addObject:](v12, "addObject:", v16);
    }

    else
    {
      -[NSMutableArray addObject:](v11, "addObject:", v16);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
      id v18 = sub_10001268C(v17);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (v16)
      {
        uint64_t v19 = (os_log_s *)qword_100036568;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)z_stream buf = 138412290;
          id v117 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "found timestamp %@", buf, 0xCu);
        }

        uint64_t v6 = v93;
        -[NSMutableOrderedSet addObject:](v93, "addObject:", v16);
        goto LABEL_13;
      }
    }

    uint64_t v6 = v93;
LABEL_13:

    goto LABEL_14;
  }

LABEL_64:
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  uint64_t v66 = v12;
  id v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v66,  "countByEnumeratingWithState:objects:count:",  &v97,  v113,  16LL);
  if (v67)
  {
    id v68 = v67;
    uInt v69 = 0LL;
    id v70 = 0LL;
    uint64_t v94 = *(void *)v98;
    do
    {
      for (uint64_t j = 0LL; j != v68; uint64_t j = (char *)j + 1)
      {
        BOOL v72 = v70;
        if (*(void *)v98 != v94) {
          objc_enumerationMutation(v66);
        }
        id v73 = *(id *)(*((void *)&v97 + 1) + 8LL * (void)j);

        uInt v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v66, "objectAtIndex:", 0LL));
        uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v69 lastPathComponent]);
        uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v48 stringByAppendingPathComponent:v75]);
        id v96 = v72;
        unsigned __int8 v77 = [v74 moveItemAtPath:v69 toPath:v76 error:&v96];
        id v70 = v96;

        if ((v77 & 1) == 0)
        {
          uint64_t v78 = (os_log_s *)qword_100036568;
          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)z_stream buf = 138543618;
            id v117 = v69;
            __int16 v118 = 2114;
            id v119 = v70;
            _os_log_error_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "Cannot move staged '%{public}@' to panics folder : %{public}@",  buf,  0x16u);
          }
        }

        id v48 = v95;
      }

      id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v66,  "countByEnumeratingWithState:objects:count:",  &v97,  v113,  16LL);
    }

    while (v68);

    int v22 = v89;
  }

  return v87;
}

int64_t sub_10001503C(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

LABEL_65:
                  _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v53, buf, 2u);
                  goto LABEL_66;
                }

LABEL_66:
LABEL_67:
                int v22 = 0;
                goto LABEL_68;
              }

              id v47 = self->_log_handle;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                uint64_t v54 = v47;
                id v55 = [v57 intValue];
                *(_DWORD *)z_stream buf = 67109120;
                LODWORD(v64) = v55;
                _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "Unknown file version %d",  buf,  8u);
              }
            }

            else
            {
              id v44 = self->_log_handle;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)z_stream buf = 0;
                _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Misformatted key file. Version not found",  buf,  2u);
              }
            }

            int v22 = 0;
LABEL_70:

            goto LABEL_71;
          }

          int v42 = self->_log_handle;
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
LABEL_44:
            int v22 = 0;
LABEL_71:

            id v26 = v58;
            goto LABEL_72;
          }

          *(_WORD *)z_stream buf = 0;
          unsigned int v43 = "Misformatted key file. Mismatched magic";
        }

        else
        {
          int v42 = self->_log_handle;
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            goto LABEL_44;
          }
          *(_WORD *)z_stream buf = 0;
          unsigned int v43 = "Not a key file. Magic not found";
        }

        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
        goto LABEL_44;
      }

      id v41 = self->_log_handle;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to parse the file contents as a dictionary",  buf,  2u);
      }
    }

    else
    {
      unsigned int v38 = self->_log_handle;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        BOOL v39 = v38;
        unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v59 localizedDescription]);
        *(_DWORD *)z_stream buf = 138412290;
        uint64_t v64 = v40;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to parse the file contents as JSON. Error: %@",  buf,  0xCu);

        id v26 = 0LL;
      }
    }

    int v22 = 0;
LABEL_72:

    unsigned int v15 = v59;
LABEL_73:

    goto LABEL_13;
  }

  id v17 = self->_log_handle;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)z_stream buf = 138412290;
    uint64_t v64 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping non-file type '%@'", buf, 0xCu);
  }

LABEL_43:
    }

    uint64_t v57 = [v34 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v57) {
      continue;
    }
    break;
  }

LABEL_45:
  uint64_t v6 = v54;
LABEL_48:

LABEL_49:
  uint64_t v20 = 0LL;
LABEL_50:

  return v20;
}

LABEL_29:
    __int16 v32 = 0LL;
    goto LABEL_30;
  }

  if (fstat(v24, &v56) == -1)
  {
    BOOL v39 = (void *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      unsigned int v40 = (unint64_t)v16->_corefilePath;
      id v35 = v39;
      id v41 = *__error();
      *(_DWORD *)z_stream buf = 138412546;
      id v53 = v40;
      uint64_t v54 = 1024;
      LODWORD(v55) = v41;
      id v37 = "stat(%@): -1 (%{errno}d)";
      unsigned int v38 = buf;
      goto LABEL_18;
    }

    goto LABEL_29;
  }

  v16->_corefileSize = v56.st_size;
  id v25 = (a8 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  id v26 = aligned_alloc(vm_page_size, v25);
  if (!v26) {
    goto LABEL_34;
  }
  uint64_t v28 = v26;
  id v29 = read(v16->_corefile_fd, v26, v25);
  if (v29 != v25)
  {
    int v42 = v29;
    unsigned int v43 = (void *)qword_100036538;
    id v44 = os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR);
    if (v42 == -1)
    {
      if (v44)
      {
        id v47 = v43;
        id v48 = *__error();
        *(_DWORD *)z_stream buf = 134218240;
        id v53 = v25;
        uint64_t v54 = 1024;
        LODWORD(v55) = v48;
        _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "failed to read header from corefile (%zd bytes) with error: %{errno}d",  buf,  0x12u);
      }
    }

    else if (v44)
    {
      *(_DWORD *)z_stream buf = 134218240;
      id v53 = v25;
      uint64_t v54 = 2048;
      id v55 = v42;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v43,  OS_LOG_TYPE_ERROR,  "Read of %lu bytes from fileoffset 0 only read %lu bytes",  buf,  0x16u);
    }

    free(v28);
    goto LABEL_28;
  }

  memcpy(a7, v28, a8);
  free(v28);
  id v30 = *(void *)a7;
  if (*(void *)a7 != a6)
  {
    uint64_t v45 = (os_log_s *)qword_100036538;
    if (v30)
    {
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)z_stream buf = 134218240;
        id v53 = v30;
        uint64_t v54 = 2048;
        id v55 = a6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "invalid core file signature: %#llx (expected :%#llx)",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "no core file data found", buf, 2u);
    }

LABEL_27:
      fsync(v8);
      close(v8);
      free(v6);
      id v27 = (os_log_s *)qword_100036538;
      id v3 = v35;
      uint64_t v2 = v36;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "erased corefile contents", buf, 2u);
      }
    }
  }

  v37.receiver = v2;
  v37.super_class = (Class)&OBJC_CLASS___CoreFileHandler;
  -[CoreFileHandler dealloc](&v37, "dealloc");
}

LABEL_26:
  char v8 = 0LL;
  return v8;
}

LABEL_31:
    unsigned int v43 = (os_log_s *)qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)z_stream buf = 0;
    id v44 = "Failed to open section input stream.";
    goto LABEL_50;
  }

  uint64_t v19 = v16;
  log = v14;
  uint64_t v20 = v15;
  corefile_fd = self->_corefile_fd;
  scratchBuf = self->_scratchBuf;
  scratchBufSize = self->_scratchBufSize;
  uint64_t v24 = calloc(1uLL, 0x30uLL);
  if (!v24)
  {
    uint64_t v45 = (os_log_s *)qword_100036538;
    unsigned int v15 = v20;
    int v14 = log;
    id v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      uint64_t v46 = "Failed to allocate section input stream data.";
      goto LABEL_23;
    }

    goto LABEL_31;
  }

  id v25 = v24;
  if (lseek(corefile_fd, a3, 0) == -1)
  {
    id v47 = (os_log_s *)qword_100036538;
    id v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)z_stream buf = 134217984;
      uint64_t v115 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Failed to seek to offset %lld in kernelcore.",  buf,  0xCu);
    }

    free(v25);
    unsigned int v15 = v20;
    goto LABEL_30;
  }

  *(_DWORD *)id v25 = corefile_fd;
  v25[1] = a4;
  void v25[2] = scratchBuf;
  v25[4] = 0LL;
  v25[5] = 0LL;
  void v25[3] = scratchBufSize;
  id v26 = AACustomByteStreamOpen();
  if (!v26)
  {
    id v48 = (os_log_s *)qword_100036538;
    unsigned int v15 = v20;
    id v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "Failed to allocate section input stream.",  buf,  2u);
    }

    free(v25);
LABEL_30:
    int v14 = log;
    goto LABEL_31;
  }

  id v27 = v26;
  AACustomByteStreamSetData(v26, v25);
  AACustomByteStreamSetReadProc(v27, (AAByteStreamReadProc)sub_100011C98);
  AACustomByteStreamSetCloseProc(v27, (AAByteStreamCloseProc)sub_100011DB4);
  __int128 v112 = v27;
  unsigned int v15 = v20;
  id v16 = v19;
  if ((v18 & 4) != 0)
  {
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[ReadOnlyKeyStore getMatchingPrivateKey::](self->_keystore, "getMatchingPrivateKey::", 1LL, v20));
    uint64_t v52 = v51;
    int v14 = log;
    uint64_t v31 = &unk_100036000;
    if (!v51)
    {
      uint64_t v66 = (os_log_s *)qword_100036538;
      if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
LABEL_127:

        AAByteStreamClose(v27);
        goto LABEL_32;
      }

      *(_WORD *)z_stream buf = 0;
      id v67 = "Failed to find a matching private key for the public key.";
LABEL_129:
      _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, buf, 2u);
      goto LABEL_127;
    }

    id v53 = v51;
    if (&_AACustomByteStreamOpen)
    {
      uint64_t v54 = (AEAContext *)calloc(1uLL, 0x10uLL);
      if (v54)
      {
        id v55 = v54;
        __int128 v56 = AEAContextCreateWithEncryptedStream(v27);
        *id v55 = v56;
        if (!v56)
        {
          id v81 = (os_log_s *)qword_100036538;
          if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)z_stream buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_ERROR,  "Failed to create an AEA context.",  buf,  2u);
          }

          goto LABEL_125;
        }

        uint64_t v57 = v56;
        __int128 v107 = v53;
        __int128 v106 = v53;
        id v58 = AEAContextSetFieldBlob( v57,  0xBu,  1u,  (const uint8_t *)[v106 bytes],  (size_t)objc_msgSend(v106, "length"));
        if (v58 < 0)
        {
          id v82 = v58;
          unint64_t v83 = (os_log_s *)qword_100036538;
          if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)z_stream buf = 67109120;
            LODWORD(v115) = v82;
            _os_log_error_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "Failed to set the private key. Error %d",  buf,  8u);
          }

          AEAContextDestroy(*v55);
          free(v55);
          id v53 = v107;
          goto LABEL_126;
        }

        id v59 = AEADecryptionInputStreamOpen(v27, *v55, 0LL, 1);
        v55[1] = v59;
        if (v59)
        {
          id v60 = AACustomByteStreamOpen();
          if (v60)
          {
            uint64_t v28 = v60;
            AACustomByteStreamSetData(v60, v55);
            AACustomByteStreamSetReadProc(v28, (AAByteStreamReadProc)sub_100011DCC);
            AACustomByteStreamSetCloseProc(v28, (AAByteStreamCloseProc)sub_100011E48);

            __int128 v111 = v28;
            id v29 = &v111;
            id v30 = v28;
            if ((v18 & 2) == 0) {
              goto LABEL_10;
            }
            goto LABEL_42;
          }

          id v96 = (os_log_s *)qword_100036538;
          if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)z_stream buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to allocate AEA decryption stream.",  buf,  2u);
          }

          if (AAByteStreamClose(v55[1]) != -1) {
            goto LABEL_124;
          }
          uint64_t v86 = (os_log_s *)qword_100036538;
          if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
            goto LABEL_124;
          }
          *(_WORD *)z_stream buf = 0;
          unsigned int v87 = "Failed to close AEA decrypt stream source.";
        }

        else
        {
          uint64_t v86 = (os_log_s *)qword_100036538;
          if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
          {
LABEL_124:
            AEAContextDestroy(*v55);
LABEL_125:
            free(v55);
            goto LABEL_126;
          }

          *(_WORD *)z_stream buf = 0;
          unsigned int v87 = "Failed to open AEA decryption stream.";
        }

        _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, v87, buf, 2u);
        goto LABEL_124;
      }

      id v68 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        uInt v69 = "Failed to allocate AEA decryption stream data.";
        goto LABEL_72;
      }
    }

    else
    {
      id v68 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        uInt v69 = "AppleArchive is not supported.";
LABEL_72:
        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v69, buf, 2u);
      }
    }

LABEL_126:
    uint64_t v66 = (os_log_s *)qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_127;
    }
    *(_WORD *)z_stream buf = 0;
    id v67 = "Failed to open AEA decryption stream.";
    goto LABEL_129;
  }

  uint64_t v28 = 0LL;
  id v29 = &v112;
  id v30 = v27;
  int v14 = log;
  uint64_t v31 = &unk_100036000;
  if ((v18 & 2) == 0)
  {
LABEL_10:
    __int16 v32 = 0LL;
    goto LABEL_11;
  }

LABEL_42:
  if (!&_AACustomByteStreamOpen)
  {
    uint64_t v75 = (os_log_s *)qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)z_stream buf = 0;
    uint64_t v76 = "AppleArchive is not supported.";
LABEL_82:
    _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_91;
  }

  if (!&_compression_stream_init)
  {
    uint64_t v75 = (os_log_s *)qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_WORD *)z_stream buf = 0;
    uint64_t v76 = "LZ4 decode stream is not supported.";
    goto LABEL_82;
  }

  uint64_t v61 = calloc(1uLL, 0x40uLL);
  if (v61)
  {
    __int128 v62 = v61;
    *uint64_t v61 = v30;
    __int128 v63 = calloc(1uLL, 0x8000uLL);
    v62[7] = v63;
    if (v63)
    {
      if (compression_stream_init((compression_stream *)(v62 + 1), COMPRESSION_STREAM_DECODE, COMPRESSION_LZ4) == COMPRESSION_STATUS_OK)
      {
        id v95 = AACustomByteStreamOpen();
        if (v95)
        {
          __int16 v32 = v95;
          AACustomByteStreamSetData(v95, v62);
          AACustomByteStreamSetReadProc(v32, (AAByteStreamReadProc)sub_100011EE0);
          AACustomByteStreamSetCloseProc(v32, (AAByteStreamCloseProc)sub_10001201C);
          __int128 v110 = v32;
          id v29 = &v110;
LABEL_11:
          uint64_t v33 = [v16 hasSuffix:@".gz"];
          id v34 = (const char *)[v16 UTF8String];
          id v35 = v34;
          if (!v33)
          {
            id v70 = AAFileStreamOpenWithPath(v34, 1537, 0x1B6u);
            if (v70)
            {
              id v41 = v70;
              unsigned int v40 = 0LL;
              int v42 = v70;
LABEL_57:
              uint64_t v71 = AAByteStreamProcess(*v29, v42);
              BOOL v72 = v71 >> 63;
              if ((v71 & 0x8000000000000000LL) != 0)
              {
                id v73 = v71;
                loga = (os_log_s *)qword_100036538;
                if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)z_stream buf = 134217984;
                  uint64_t v115 = v73;
                  _os_log_error_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_ERROR,  "Failed to process the coredump through the byte streams. Error %lld",  buf,  0xCu);
                }
              }

              uint64_t v74 = v72 ^ 1;
              if (v41) {
                AAByteStreamClose(v41);
              }
              uint64_t v31 = &unk_100036000;
              if (v40) {
                AAByteStreamClose(v40);
              }
              goto LABEL_102;
            }

            BOOL v79 = (os_log_s *)qword_100036538;
            if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
            {
LABEL_101:
              uint64_t v74 = 0;
LABEL_102:
              if (v32) {
                AAByteStreamClose(v32);
              }
              goto LABEL_104;
            }

            *(_WORD *)z_stream buf = 0;
            uint64_t v80 = "Failed to open file output stream.";
LABEL_131:
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, v80, buf, 2u);
            goto LABEL_101;
          }

          if (&_AACustomByteStreamOpen)
          {
            unint64_t v36 = (gzFile *)calloc(1uLL, 8uLL);
            if (v36)
            {
              id v37 = v36;
              unsigned int v38 = gzopen(v35, "wb");
              *id v37 = v38;
              if (v38)
              {
                BOOL v39 = AACustomByteStreamOpen();
                if (v39)
                {
                  unsigned int v40 = v39;
                  AACustomByteStreamSetData(v39, v37);
                  AACustomByteStreamSetWriteProc(v40, (AAByteStreamWriteProc)sub_100012054);
                  AACustomByteStreamSetCloseProc(v40, (AAByteStreamCloseProc)sub_100012148);
                  id v41 = 0LL;
                  int v42 = v40;
                  goto LABEL_57;
                }

                uint64_t v88 = (os_log_s *)qword_100036538;
                if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)z_stream buf = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_ERROR,  "Failed to allocate gzip output stream.",  buf,  2u);
                }

                free(v37);
                gzclose(*v37);
              }

              else
              {
                id v84 = (void *)qword_100036538;
                if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
                {
                  __int128 v103 = v84;
                  __int128 v104 = __error();
                  __int128 v105 = strerror(*v104);
                  *(_DWORD *)z_stream buf = 136315394;
                  uint64_t v115 = (unint64_t)v35;
                  unint64_t v116 = 2080;
                  id v117 = (unint64_t)v105;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_ERROR,  "gzopen(%s, wb) error: %s",  buf,  0x16u);
                }

                free(v37);
                uint64_t v31 = &unk_100036000;
              }

              goto LABEL_100;
            }

            unsigned __int8 v77 = (os_log_s *)qword_100036538;
            if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)z_stream buf = 0;
              uint64_t v78 = "Failed to allocate gzip output stream data.";
              goto LABEL_79;
            }
          }

          else
          {
            unsigned __int8 v77 = (os_log_s *)qword_100036538;
            if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)z_stream buf = 0;
              uint64_t v78 = "AppleArchive is not supported.";
LABEL_79:
              _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v78, buf, 2u);
            }
          }

LABEL_100:
          BOOL v79 = (os_log_s *)*((void *)v31 + 167);
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            goto LABEL_101;
          }
          *(_WORD *)z_stream buf = 0;
          uint64_t v80 = "Failed to open gzip output stream.";
          goto LABEL_131;
        }

        uint64_t v64 = (os_log_s *)qword_100036538;
        if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
          goto LABEL_90;
        }
        *(_WORD *)z_stream buf = 0;
        id v65 = "Failed to allocate lz4 decode stream.";
        goto LABEL_135;
      }

      uint64_t v64 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        id v65 = "Failed to initialize lz4 decode stream data.";
LABEL_135:
        _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v65, buf, 2u);
      }
    }

    else
    {
      uint64_t v64 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)z_stream buf = 0;
        id v65 = "Failed to allocate lz4 decode stream data buffer.";
        goto LABEL_135;
      }
    }

LABEL_90:
    free(v62);
    goto LABEL_91;
  }

  uint64_t v75 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)z_stream buf = 0;
    uint64_t v76 = "Failed to allocate lz4 decode stream data.";
    goto LABEL_82;
  }

LABEL_91:
  id v85 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)z_stream buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_ERROR,  "Failed to open lz4 decode stream.",  buf,  2u);
  }

  uint64_t v74 = 0;
LABEL_104:
  if (v28) {
    AAByteStreamClose(v28);
  }
  AAByteStreamClose(v27);
  if ((v74 & 1) != 0)
  {
    unint64_t v89 = (const char *)[v16 UTF8String];
    unsigned int v90 = open(v89, 0);
    if (v90 < 0)
    {
      int v93 = (void *)*((void *)v31 + 167);
      if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_ERROR))
      {
        __int128 v100 = v93;
        __int128 v101 = __error();
        __int128 v102 = strerror(*v101);
        *(_DWORD *)z_stream buf = 136315394;
        uint64_t v115 = (unint64_t)v89;
        unint64_t v116 = 2080;
        id v117 = (unint64_t)v102;
        _os_log_error_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_ERROR,  "Failed to open %s to mark as purgeable. Error: %s",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v91 = v90;
      int v113 = 67589;
      if (!ffsctl(v90, 0xC0084A44uLL, &v113, 0))
      {
        close(v91);
LABEL_117:
        id v49 = 1;
        goto LABEL_33;
      }

      unsigned int v92 = (void *)*((void *)v31 + 167);
      if (os_log_type_enabled((os_log_t)v92, OS_LOG_TYPE_ERROR))
      {
        __int128 v97 = v92;
        __int128 v98 = __error();
        __int128 v99 = strerror(*v98);
        *(_DWORD *)z_stream buf = 136315394;
        uint64_t v115 = (unint64_t)v89;
        unint64_t v116 = 2080;
        id v117 = (unint64_t)v99;
        _os_log_error_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_ERROR,  "Failed to mark %s as purgeable. Error: %s",  buf,  0x16u);
      }

      close(v91);
    }

    uint64_t v94 = (os_log_s *)*((void *)v31 + 167);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)z_stream buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "Failed to mark the coredump output file as purgeable.",  buf,  2u);
    }

    goto LABEL_117;
  }

LABEL_32:
  id v49 = 0;
LABEL_33:

  return v49;
}

id sub_100019BE8(double a1)
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  id v3 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a1));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

id sub_100019C98(void *a1, unsigned int a2)
{
  id v3 = a1;
  id v4 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  unint64_t v83 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
  -[NSDateFormatter setLocale:](v4, "setLocale:");
  id v84 = v4;
  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  uint64_t v86 = objc_opt_new(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v98 = v3;
  id v85 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"staged"]);
  id v5 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)z_stream buf = 138412290;
    id v121 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prune core files in %@", buf, 0xCu);
  }

  if (a2)
  {
    unsigned int v95 = a2;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 enumeratorAtPath:v3]);

    char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v94 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    unsigned int v87 = v7;
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 nextObject]);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v96 = 0LL;
      id v12 = v86;
      do
      {
        unsigned __int8 v13 = [v11 containsString:@"staged"];
        if ((v13 & 1) != 0)
        {
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
          id v15 = sub_10001268C(v14);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          id v17 = v9;
        }

        else
        {
          id v18 = sub_10001268C(v11);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
          id v17 = v8;
        }

        id v19 = v17;
        uint64_t v20 = v19;
        if (v16)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v16]);

          int v22 = (NSMutableArray *)v21;
          if (!v21) {
            int v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          }
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v98 stringByAppendingPathComponent:v11]);
          -[NSMutableArray addObject:](v22, "addObject:", v23);

          id v96 = v22;
          [v20 setObject:v22 forKeyedSubscript:v16];
          if ((v13 & 1) == 0) {
            -[NSMutableOrderedSet addObject:](v86, "addObject:", v16);
          }
        }

        uint64_t v24 = objc_claimAutoreleasedReturnValue([v7 nextObject]);
        uint64_t v11 = (void *)v24;
      }

      while (v24);
    }

    else
    {
      id v96 = 0LL;
      id v12 = v86;
    }

    id v26 = v9;
    if ((unint64_t)[v9 count] < 2)
    {
      unsigned int v28 = v95;
    }

    else
    {
      id v27 = (void *)qword_100036538;
      unsigned int v28 = v95;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        id v81 = v27;
        id v82 = [v9 count];
        *(_DWORD *)z_stream buf = 134217984;
        id v121 = v82;
        _os_log_error_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_ERROR,  "Found %lu sets of cores under staged folder",  buf,  0xCu);
      }

      uint64_t v29 = sub_100019C98(v85, 1LL);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(v29);
    }

    -[NSMutableOrderedSet sortUsingComparator:](v12, "sortUsingComparator:", &stru_100030C88);
    unsigned int v90 = v26;
    id v30 = v96;
    if ([v26 count]
      && (unint64_t v31 = v28 - 1, (unint64_t)-[NSMutableOrderedSet count](v12, "count") > v31))
    {
      __int16 v32 = (void *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = v32;
        id v34 = -[NSMutableOrderedSet count](v12, "count");
        id v35 = [v90 count];
        *(_DWORD *)z_stream buf = 134218496;
        id v121 = v34;
        __int16 v122 = 1024;
        *(_DWORD *)id v123 = v28;
        *(_WORD *)&v123[4] = 2048;
        *(void *)&v123[6] = v35;
        unint64_t v36 = "Removing prior corefiles, found %lu sets (policy limit %u, %lu set staged)";
        id v37 = v33;
        uint32_t v38 = 28;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
      }
    }

    else
    {
      id v39 = -[NSMutableOrderedSet count](v12, "count");
      unsigned int v40 = (void *)qword_100036538;
      BOOL v41 = os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT);
      if ((unint64_t)v39 <= v28)
      {
        if (v41)
        {
          uint64_t v61 = v40;
          id v62 = -[NSMutableOrderedSet count](v12, "count");
          id v63 = [v90 count];
          *(_DWORD *)z_stream buf = 134218496;
          id v121 = v62;
          __int16 v122 = 1024;
          *(_DWORD *)id v123 = v28;
          *(_WORD *)&v123[4] = 2048;
          *(void *)&v123[6] = v63;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Found %lu sets of corefiles (policy limit %u, %lu set staged), not cleaning up",  buf,  0x1Cu);
        }

        goto LABEL_56;
      }

      unint64_t v31 = v28;
      if (v41)
      {
        uint64_t v33 = v40;
        id v42 = -[NSMutableOrderedSet count](v12, "count");
        *(_DWORD *)z_stream buf = 134218240;
        id v121 = v42;
        __int16 v122 = 1024;
        *(_DWORD *)id v123 = v28;
        unint64_t v36 = "Removing prior corefiles, found %lu sets (policy limit %u)";
        id v37 = v33;
        uint32_t v38 = 18;
        goto LABEL_32;
      }
    }

    while ((unint64_t)-[NSMutableOrderedSet count](v12, "count") > v31)
    {
      __int128 v114 = 0uLL;
      __int128 v115 = 0uLL;
      __int128 v112 = 0uLL;
      __int128 v113 = 0uLL;
      unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndex:](v12, "objectAtIndex:", 0LL));
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v43]);

      id v45 = [v44 countByEnumeratingWithState:&v112 objects:v119 count:16];
      if (v45)
      {
        id v46 = v45;
        id v47 = 0LL;
        uint64_t v48 = *(void *)v113;
        do
        {
          id v49 = 0LL;
          id v50 = v47;
          do
          {
            if (*(void *)v113 != v48) {
              objc_enumerationMutation(v44);
            }
            id v47 = *(id *)(*((void *)&v112 + 1) + 8LL * (void)v49);

            -[NSMutableArray addObject:](v94, "addObject:", v47);
            id v49 = (char *)v49 + 1;
            id v50 = v47;
          }

          while (v46 != v49);
          id v46 = [v44 countByEnumeratingWithState:&v112 objects:v119 count:16];
        }

        while (v46);

        id v12 = v86;
      }

      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndex:](v12, "objectAtIndex:", 0LL));
      [v8 removeObjectForKey:v51];

      -[NSMutableOrderedSet removeObjectAtIndex:](v12, "removeObjectAtIndex:", 0LL);
    }

    __int128 v110 = 0uLL;
    __int128 v111 = 0uLL;
    __int128 v108 = 0uLL;
    __int128 v109 = 0uLL;
    uint64_t v52 = v94;
    id v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v108,  v118,  16LL);
    if (v53)
    {
      id v54 = v53;
      id v55 = 0LL;
      uint64_t v56 = *(void *)v109;
      do
      {
        uint64_t v57 = 0LL;
        id v58 = v55;
        do
        {
          if (*(void *)v109 != v56) {
            objc_enumerationMutation(v52);
          }
          id v55 = *(id *)(*((void *)&v108 + 1) + 8LL * (void)v57);

          id v59 = (os_log_s *)qword_100036538;
          if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)z_stream buf = 138412290;
            id v121 = v55;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Removing file %@", buf, 0xCu);
          }

          id v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v60 removeItemAtPath:v55 error:0];

          uint64_t v57 = (char *)v57 + 1;
          id v58 = v55;
        }

        while (v54 != v57);
        id v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v108,  v118,  16LL);
      }

      while (v54);
    }

    id v30 = v96;
LABEL_56:
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    uint64_t v64 = v90;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue([v90 allValues]);
    id v92 = [obj countByEnumeratingWithState:&v104 objects:v117 count:16];
    id v65 = 0LL;
    if (v92)
    {
      uint64_t v91 = *(void *)v105;
      unint64_t v89 = v8;
      do
      {
        uint64_t v66 = 0LL;
        do
        {
          if (*(void *)v105 != v91) {
            objc_enumerationMutation(obj);
          }
          uint64_t v93 = v66;
          id v67 = *(id *)(*((void *)&v104 + 1) + 8 * v66);

          __int128 v102 = 0u;
          __int128 v103 = 0u;
          __int128 v100 = 0u;
          __int128 v101 = 0u;
          id v30 = (NSMutableArray *)v67;
          id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v100,  v116,  16LL);
          if (v68)
          {
            id v69 = v68;
            __int128 v97 = v30;
            id v70 = 0LL;
            uint64_t v71 = *(void *)v101;
            do
            {
              for (int8x16_t i = 0LL; i != v69; int8x16_t i = (char *)i + 1)
              {
                id v73 = v65;
                uint64_t v74 = v70;
                if (*(void *)v101 != v71) {
                  objc_enumerationMutation(v97);
                }
                id v70 = *(id *)(*((void *)&v100 + 1) + 8LL * (void)i);

                uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v70 lastPathComponent]);
                unsigned __int8 v77 = (void *)objc_claimAutoreleasedReturnValue([v98 stringByAppendingPathComponent:v76]);
                id v99 = v73;
                unsigned __int8 v78 = [v75 moveItemAtPath:v70 toPath:v77 error:&v99];
                id v65 = v99;

                BOOL v79 = (os_log_s *)qword_100036538;
                if ((v78 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)z_stream buf = 138543362;
                    id v121 = v70;
                    _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Moved staged '%{public}@ to panics folder",  buf,  0xCu);
                  }
                }

                else if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)z_stream buf = 138543618;
                  id v121 = v70;
                  __int16 v122 = 2114;
                  *(void *)id v123 = v65;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "Cannot move staged '%{public}@' to panics folder : %{public}@",  buf,  0x16u);
                }
              }

              id v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v97,  "countByEnumeratingWithState:objects:count:",  &v100,  v116,  16LL);
            }

            while (v69);

            char v8 = v89;
            uint64_t v64 = v90;
            id v30 = v97;
          }

          uint64_t v66 = v93 + 1;
        }

        while ((id)(v93 + 1) != v92);
        id v92 = [obj countByEnumeratingWithState:&v104 objects:v117 count:16];
      }

      while (v92);
    }

    goto LABEL_77;
  }

  id v25 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)z_stream buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Not pruning because the policy limit is set to 0",  buf,  2u);
  }

  char v8 = 0LL;
LABEL_77:

  return v8;
}

id sub_10001A734(uint64_t a1)
{
  v10[0] = @"CorefileDataSize";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(v8 + v9) >> 20));
  v11[0] = v2;
  v10[1] = @"NumCores";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40)));
  v11[1] = v3;
  v10[2] = @"DRAMSizeMB";
  if (qword_100036548 != -1) {
    dispatch_once(&qword_100036548, &stru_100030CA8);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", dword_100036540));
  v11[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v5;
}

id sub_10001A880(uint64_t a1)
{
  v9[0] = @"coreName";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 32)));
  v10[0] = v2;
  v9[1] = @"coreSize";
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  if (v3 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v10[1] = v5;
  _DWORD v9[2] = @"DRAMSizeMB";
  if (qword_100036548 != -1) {
    dispatch_once(&qword_100036548, &stru_100030CA8);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", dword_100036540));
  v10[2] = v6;
  char v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

void sub_10001A9B4(id a1)
{
  size_t v5 = 8LL;
  if (sysctlbyname("hw.memsize", &v6, &v5, 0LL, 0LL))
  {
    id v1 = (void *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = v1;
      unsigned int v3 = __error();
      uint64_t v4 = strerror(*v3);
      *(_DWORD *)z_stream buf = 136315138;
      uint64_t v8 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "failed to query sysct hw.memsize: %s",  buf,  0xCu);
    }
  }

  else
  {
    dword_100036540 = v6 >> 20;
  }

int64_t sub_10001AAA0(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

LABEL_18:
  free(v18);
LABEL_19:
  unsigned int v28 = 0LL;
LABEL_20:

  return v28;
}

LABEL_39:
        uint64_t v11 = v5;
        goto LABEL_40;
      }

      id v35 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Public encryption key is empty. Corefile is not encrypted",  buf,  2u);
      }
    }

    else
    {
      p_encryptionPublicKey = &v5->_encryptionPublicKey;
    }

    id v42 = *p_encryptionPublicKey;
    *p_encryptionPublicKey = 0LL;

    goto LABEL_39;
  }

  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  while (1)
  {
    if (strnlen((const char *)&corefileHeader[1].pub_key_offset + v20, 0x10uLL) == 16)
    {
      id v44 = qword_100036538;
      if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      *(_DWORD *)z_stream buf = 134217984;
      uint64_t v57 = v21;
      id v37 = "Corefile corrupted. File %zu's name was not terminated.";
LABEL_45:
      uint32_t v38 = (os_log_s *)v44;
      id v39 = 12;
      goto LABEL_36;
    }

    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)&corefileHeader[1].pub_key_offset + v20));

    if (!v22)
    {
      id v44 = qword_100036538;
      if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      *(_DWORD *)z_stream buf = 134217984;
      uint64_t v57 = v21;
      id v37 = "Corefile corrupted. File %zu's name is not a valid string.";
      goto LABEL_45;
    }

    uint64_t v23 = (char *)corefileHeader + v20;
    id v25 = *(void *)((char *)&corefileHeader[1].version + v20);
    uint64_t v24 = *(uint64_t *)((char *)&corefileHeader[1].flags + v20);
    if (__CFADD__(v25, v24)) {
      goto LABEL_47;
    }
    if (v25 + v24 > v5->super._corefileSize) {
      break;
    }
    ++v21;
    corefileHeader = v5->_corefileHeader;
    v20 += 40LL;
    if (v21 >= corefileHeader->num_files) {
      goto LABEL_22;
    }
  }

  uint64_t v23 = (char *)corefileHeader + v20;
LABEL_47:
  id v45 = v23 + 88;
  id v46 = qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    id v47 = v5->super._corefileSize;
    *(_DWORD *)z_stream buf = 134219010;
    uint64_t v57 = v21;
    id v58 = 2080;
    *(void *)id v59 = v45;
    *(_WORD *)&v59[8] = 2048;
    *(void *)&v59[10] = v25;
    id v60 = 2048;
    uint64_t v61 = v24;
    id v62 = 2048;
    id v63 = v47;
    id v37 = "Corefile corrupted. File %zu's (name %s, offset %llu, length %llu) extends past end of file (length %zu).";
    uint32_t v38 = (os_log_s *)v46;
    id v39 = 52;
LABEL_36:
    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
  }

LABEL_7:
  uint64_t v11 = 0LL;
LABEL_40:

  return v11;
}

uint64_t start_0(uint64_t a1, uint64_t a2)
{
  kern_return_t MatchingServices;
  uint64_t v69;
  const char *v70;
  os_log_s *v71;
  uint32_t v72;
  os_log_s *v73;
  __CFString *v74;
  void *v75;
  os_log_s *v76;
  int *v77;
  char *v78;
  const char *v79;
  os_log_s *v80;
  const char *v81;
  os_log_s *v82;
  int *v83;
  char *v84;
  int v85;
  int v86;
  __darwin_ino64_t v87;
  int v88;
  const char *v89;
  dev_t v90;
  int v91;
  const char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  os_log_s *v97;
  const void *Value;
  const void *v99;
  const void *v100;
  const void *v101;
  _UNKNOWN **v102;
  _UNKNOWN **v103;
  const void *v104;
  void *v105;
  os_log_s *v106;
  unint64_t v107;
  BOOL v108;
  void *v109;
  id v110;
  uint64_t v111;
  id v112;
  id v113;
  uint64_t v114;
  __darwin_ino64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  id v119;
  uint64_t v120;
  id v121;
  id v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  os_log_s *v127;
  const char *v128;
  os_log_s *v129;
  io_registry_entry_t v130;
  io_object_t v131;
  _BYTE *v132;
  CFTypeRef v133;
  BOOL v134;
  const char *v135;
  uint8_t *p_block;
  os_log_s *v137;
  os_log_s *v138;
  uint64_t v139;
  int Size;
  size_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  int PanicLogData;
  os_log_s *v146;
  CFIndex AppIntegerValue;
  uint64_t v148;
  uint64_t v149;
  __CFDictionary *v150;
  io_service_t MatchingService;
  io_object_t v152;
  CFStringRef v153;
  CFBooleanRef v154;
  os_log_s *v155;
  os_log_s *v156;
  id v157;
  int v158;
  unsigned __int8 *v159;
  id v160;
  uint64_t v161;
  BOOL v162;
  const char *v163;
  os_log_s *v164;
  uint32_t v165;
  uint64_t v166;
  int v167;
  void *v168;
  void *v169;
  os_log_s *v170;
  int *v171;
  char *v172;
  os_log_s *v173;
  BOOL v174;
  os_log_s *v175;
  __CFString *v176;
  void *v177;
  __CFDictionary *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  __CFDictionary *v184;
  NSFileAttributeType v185;
  BOOL v186;
  os_log_s *v187;
  unsigned __int8 v188;
  uint64_t v189;
  os_log_s *v190;
  const char *v191;
  os_log_s *v192;
  unsigned __int8 v193;
  uint64_t v194;
  os_log_s *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  unsigned int *v200;
  unint64_t v201;
  void *v202;
  void *v203;
  unsigned int v204;
  int v205;
  unsigned int v206;
  uint64_t v207;
  NSMutableArray *v208;
  CFStringRef v209;
  id v210;
  double v211;
  CFUUIDRef v212;
  __CFString *v213;
  void *v214;
  id v215;
  void *v216;
  os_log_s *v217;
  os_log_s *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  NSMutableArray *v226;
  id v227;
  id v228;
  id v229;
  id v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  unsigned int v234;
  id v235;
  BOOL v236;
  char v237;
  int v238;
  BOOL v239;
  char v240;
  void *v241;
  void *v242;
  unsigned int v243;
  int v244;
  int v245;
  os_log_s *v246;
  id v247;
  unint64_t v248;
  BOOL v249;
  int *v250;
  char *v251;
  os_log_s *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  __darwin_time_t v257;
  void *v258;
  os_log_s *v259;
  void *v260;
  id v261;
  void *v262;
  ssize_t v263;
  void *v264;
  os_log_s *v265;
  void *v266;
  os_log_s *v267;
  int v268;
  int *v269;
  char *v270;
  io_iterator_t v271;
  __CFString *v272;
  const char *v273;
  os_log_s *v274;
  uint32_t v275;
  os_log_s *v276;
  void *v277;
  void *v278;
  id v279;
  CFStringRef v280;
  uint64_t v281;
  CFStringRef v282;
  PanicReport *v283;
  id v284;
  void *v285;
  unsigned int v286;
  id v287;
  os_log_s *v288;
  id v289;
  id v290;
  void *v291;
  void *v292;
  unsigned int v293;
  id v294;
  void *v295;
  void *v296;
  id v297;
  void *v298;
  id v299;
  uint64_t v300;
  void *v301;
  BOOL v302;
  os_log_s *v303;
  void *v304;
  id v305;
  void *v306;
  int v307;
  dev_t st_dev;
  os_log_s *v309;
  BOOL v310;
  void *v311;
  os_log_s *v312;
  id v313;
  id v314;
  os_log_s *v315;
  void *v316;
  NSDictionary *v317;
  CFStringRef v318;
  NSDictionary *v319;
  os_log_s *v320;
  uint64_t v321;
  void *v322;
  id v323;
  id v324;
  void *v325;
  void *v326;
  NSFileHandle *v327;
  void *v328;
  uint64_t v329;
  uint64_t j;
  char v331;
  char v332;
  UserCoreFileHandler *v333;
  UserCoreFileHandler *v334;
  os_log_s *v335;
  id v336;
  os_log_t v337;
  FILE *v338;
  os_log_s *v339;
  int *v340;
  void *v341;
  int v342;
  os_log_s *v343;
  char *v344;
  os_log_s *v345;
  BOOL v346;
  id v347;
  void *v348;
  void *v349;
  CFStringRef v350;
  CFStringRef v351;
  int v352;
  uint64_t v353;
  __CFString *v354;
  id v355;
  id v356;
  id v357;
  os_log_s *v358;
  void *v359;
  uint64_t v360;
  void *k;
  int v362;
  os_log_s *v363;
  void *v364;
  os_log_s *v365;
  const char *v366;
  os_log_s *v367;
  CFStringRef v368;
  __CFString *v369;
  void *v370;
  unsigned int v371;
  id v372;
  __CFString *v373;
  os_log_s *v374;
  id v375;
  id v376;
  void *v377;
  BOOL v378;
  void *v379;
  os_log_s *v380;
  int *v381;
  char *v382;
  int *v383;
  char *v384;
  os_log_s *v385;
  int *v386;
  char *v387;
  os_log_s *v388;
  int *v389;
  char *v390;
  void *v391;
  os_log_s *v392;
  void *v393;
  void *v394;
  os_log_s *v395;
  int v396;
  os_log_s *v397;
  void *v398;
  char v399;
  id v400;
  os_log_s *v401;
  os_log_s *v402;
  const char *v403;
  void *v404;
  id v405;
  id v406;
  uint64_t v407;
  void *m;
  void *v409;
  void *v410;
  __CFString *v411;
  __CFString *v412;
  __CFString *v413;
  __CFString *v414;
  os_log_s *v415;
  id v416;
  id v417;
  const void *v418;
  uint64_t v419;
  os_log_s *v420;
  NSMutableArray *v421;
  __CFString *v422;
  uint64_t v423;
  id v424;
  void *v425;
  os_log_s *v426;
  unsigned int v427;
  unsigned int v428;
  unsigned int v429;
  unsigned int v430;
  int *v431;
  void *v432;
  int v433;
  os_log_s *v434;
  char *v435;
  os_log_s *v436;
  id v437;
  id v438;
  os_log_s *v439;
  int *v440;
  char *v441;
  uint64_t v442;
  void *v443;
  CFStringRef v444;
  CFStringRef v445;
  int *v446;
  char *v447;
  uint64_t v448;
  int v449;
  uint64_t v450;
  void *v451;
  KeyStore *v452;
  id v453;
  void *v454;
  os_log_s *v455;
  uint64_t result;
  os_log_s *v457;
  os_log_s *v458;
  int *v459;
  char *v460;
  void *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  os_log_s *v469;
  int v470;
  int *v471;
  char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  void *v480;
  id v481;
  __CFString *v482;
  void *v483;
  __CFString *v484;
  __CFString *v485;
  id v486;
  id v487;
  __CFString *v488;
  id v489;
  unsigned int v490;
  unint64_t v491;
  void *v492;
  void *v493;
  unsigned int *v494;
  void *v495;
  id v496;
  void *v497;
  void *v498;
  os_log_s *v499;
  void *v500;
  uint64_t v501;
  NSMutableArray *v502;
  id v503;
  id obj;
  id obja;
  id objb;
  id v507;
  id v508;
  id v509;
  id v510;
  id v511;
  id v512;
  id v513;
  id v514;
  id v515;
  id v516[6];
  _UNKNOWN **v517;
  _UNKNOWN **v518;
  _UNKNOWN **v519;
  void *v520;
  __darwin_time_t v521;
  NSMutableArray *v522;
  uint8_t v523[8];
  id v524[6];
  uint64_t v525;
  CFMutableDictionaryRef properties[6];
  stat block;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  _BYTE v533[31];
  id v534[2];
  id v535[2];
  _BYTE v536[26];
  __int16 v537;
  void *v538;
  __int16 v539;
  _BYTE v540[10];
  uint8_t buf[32];
  __int128 v542;
  __int128 v543;
  v499 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DumpPanicArgParser withArgs:count:]( &OBJC_CLASS___DumpPanicArgParser,  "withArgs:count:",  a2,  a1));
  os_log_t v3 = v499;
  if (-[os_log_s help](v499, "help"))
  {
    -[os_log_s usage](v499, "usage");
    goto LABEL_3;
  }

  int v5 = pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0);
  if (v5)
  {
    v462 = _os_assert_log(v5, v6);
    _os_crash(v462);
    __break(1u);
    goto LABEL_682;
  }

  os_log_t v7 = os_log_create("com.apple.DumpPanic", "panicprocessing");
  uint64_t v8 = (void *)qword_100036568;
  qword_100036568 = (uint64_t)v7;

  if (!qword_100036568)
  {
LABEL_682:
    v463 = _os_assert_log(0LL, v9);
    _os_crash(v463);
    __break(1u);
    goto LABEL_683;
  }

  v532 = 0u;
  memset(v533, 0, sizeof(v533));
  v530 = 0u;
  v531 = 0u;
  v528 = 0u;
  v529 = 0u;
  memset(&block, 0, sizeof(block));
  *(void *)v536 = 255LL;
  if (sysctlbyname("hw.osenvironment", &block, (size_t *)v536, 0LL, 0LL))
  {
    uint64_t v10 = (void *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      id v82 = v10;
      unint64_t v83 = __error();
      id v84 = strerror(*v83);
      id v85 = *__error();
      *(_DWORD *)z_stream buf = 136315394;
      *(void *)&uint8_t buf[4] = v84;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = v85;
      _os_log_error_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "failed to look up hw.osenvironment: %s(%d)",  buf,  0x12u);
    }

    BOOL v11 = 0;
  }

  else
  {
    BOOL v12 = *(void *)&block.st_dev == 0x797265766F636572LL
       && *(void *)((char *)&block.st_dev + 3) == 0x736F797265766FLL;
    BOOL v11 = v12 || *(void *)&block.st_dev == 0x74736F6E67616964LL && LODWORD(block.st_ino) == 7562089;
    int v14 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)z_stream buf = 136315138;
      *(void *)&uint8_t buf[4] = &block;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "found hw.osenvironment: %s", buf, 0xCu);
    }
  }

  byte_1000364D8 = v11;
  id v15 = v499;
  if ((-[os_log_s force_run](v499, "force_run") & 1) == 0)
  {
    if (!lstat("/var/run/com.apple.DumpPanic.finishedThisBoot", &block))
    {
      id v18 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "DumpPanic has already finished running for current boot",  buf,  2u);
        id v18 = (os_log_s *)qword_100036568;
      }

      uint64_t v4 = 0LL;
      os_log_t v3 = v499;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_671;
      }
      LOWORD(block.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Use '-f/--force' to run DumpPanic manually",  (uint8_t *)&block,  2u);
LABEL_3:
      uint64_t v4 = 0LL;
LABEL_671:

      return v4;
    }

    int v16 = *__error();
    id v17 = (os_log_s *)qword_100036568;
    if (v16 == 2)
    {
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)z_stream buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No previous DumpPanic finish cookie",  buf,  2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      v388 = v17;
      v389 = __error();
      v390 = strerror(*v389);
      *(_DWORD *)z_stream buf = 136315394;
      *(void *)&uint8_t buf[4] = "/var/run/com.apple.DumpPanic.finishedThisBoot";
      *(_WORD *)&_BYTE buf[12] = 2080;
      *(void *)&buf[14] = v390;
      _os_log_error_impl( (void *)&_mh_execute_header,  v388,  OS_LOG_TYPE_ERROR,  "Failed to stat %s with error %s",  buf,  0x16u);
    }

    id v15 = v499;
  }

  io_registry_entry_t v19 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v19)
  {
    uint64_t v24 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Error getting a reference to IODeviceTree:/options",  (uint8_t *)&block,  2u);
    }

    uint64_t v4 = 1LL;
LABEL_670:
    os_log_t v3 = v499;
    goto LABEL_671;
  }

  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v19, @"ota-uuid", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    uint64_t v21 = (void *)CFProperty;
    CFTypeID v22 = CFGetTypeID(CFProperty);
    if (v22 == CFDataGetTypeID())
    {
      id v23 = [v21 mutableCopy];
      [v23 appendBytes:&unk_100026490 length:1];
      v489 = v23;
    }

    else
    {
      v489 = 0LL;
    }

    CFRelease(v21);
  }

  else
  {
LABEL_40:
    v489 = 0LL;
  }

  id v25 = (os_log_s *)(id)qword_100036568;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "DumpPanic launched after boot to check for device panic data",  (uint8_t *)&block,  2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  v486 = (id)mach_absolute_time();
  os_log_t v26 = os_log_create("com.apple.DumpPanic", "socd");
  id v27 = (void *)qword_100036550;
  qword_100036550 = (uint64_t)v26;

  if (qword_100036550)
  {
    *(void *)z_stream buf = 0LL;
    uint64_t v29 = os_log_create("com.apple.osanalytics.preoslog", "default");
    os_log_t v3 = os_log_create("com.apple.osanalytics.preoslog", "buffer");
    v536[0] = 1;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Flush preoslog", (uint8_t *)&block, 2u);
    }

    if (sysctlbyname("kern.preoslog", 0LL, (size_t *)buf, v536, 1uLL))
    {
      if (*__error() == 2)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(block.st_dev) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "kern.preoslog is not supported by this kernel",  (uint8_t *)&block,  2u);
        }
      }

      else
      {
        uint64_t v33 = v29;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v383 = __error();
          v384 = strerror(*v383);
          block.st_dev = 136315138;
          *(void *)&block.st_mode = v384;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Couldn't obtain preoslog buffer size, result %s",  (uint8_t *)&block,  0xCu);
        }
      }

      __error();
LABEL_65:

      rollAppleCareLogs();
      v501 = sub_10000E5F4();
      unsigned __int8 v34 = -[os_log_s restoreos](v499, "restoreos");
      *(void *)&block.st_dev = _NSConcreteStackBlock;
      block.st_ino = 3221225472LL;
      *(void *)&block.st_uid = sub_10000D53C;
      *(void *)&block.st_rdev = &unk_100030AF0;
      LOBYTE(block.st_atimespec.tv_sec) = v34;
      if (qword_1000364F8 == -1) {
        goto LABEL_66;
      }
      goto LABEL_684;
    }

    if (*(void *)buf)
    {
      id v30 = malloc(*(size_t *)buf);
      if (v30)
      {
        unint64_t v31 = v30;
        if (sysctlbyname("kern.preoslog", v30, (size_t *)buf, 0LL, 0LL))
        {
          __int16 v32 = v29;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v446 = __error();
            v447 = strerror(*v446);
            block.st_dev = 136315138;
            *(void *)&block.st_mode = v447;
            _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Couldn't obtain preoslog buffer, sysctl failed with result %s",  (uint8_t *)&block,  0xCu);
          }

          goto LABEL_579;
        }

        uint64_t v86 = *v31;
        if (*v31 == 1280528208)
        {
          unsigned int v87 = *(void *)buf;
          if (*(void *)buf == v31[1])
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v88 = *((unsigned __int8 *)v31 + 12);
              unint64_t v89 = "UNKNOWN";
              unsigned int v90 = v31[2];
              if (v88 == 1) {
                unint64_t v89 = "macefi";
              }
              uint64_t v91 = *((unsigned __int8 *)v31 + 13);
              BOOL v12 = v88 == 0;
              block.st_dev = 134284547;
              id v92 = "iboot";
              if (!v12) {
                id v92 = v89;
              }
              *(void *)&block.st_mode = v31;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v87;
              HIWORD(block.st_gid) = 1024;
              block.st_rdev = v90;
              *((_WORD *)&block.st_rdev + 2) = 2080;
              *(void *)((char *)&block.st_rdev + 6) = v92;
              HIWORD(block.st_atimespec.tv_sec) = 1024;
              LODWORD(block.st_atimespec.tv_nsec) = v91;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Found a valid preoslog buffer at va %{private}p, size %zu bytes, write offset %d, source %s, wrapped %d",  (uint8_t *)&block,  0x2Cu);
            }

            uint64_t v93 = (char *)v31 + 14;
            uint64_t v94 = (v31[2] + 1);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              block.st_dev = 134218240;
              *(void *)&block.st_mode = (char *)v31 + 14;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v94;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Lower buffer is at va %p, size %zu bytes",  (uint8_t *)&block,  0x16u);
            }

            unsigned int v95 = v31[1] - v94 - 14;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              block.st_dev = 134218240;
              *(void *)&block.st_mode = &v93[v94];
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v95;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Upper buffer is at va %p, size %zu bytes",  (uint8_t *)&block,  0x16u);
            }

            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Warning: preoslog log timestamps are not original, they are assigned later when the buffer is being flushed",  (uint8_t *)&block,  2u);
            }

            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "preoslog dump begin",  (uint8_t *)&block,  2u);
            }

            if (*((_BYTE *)v31 + 13)) {
              sub_10000D584(v3, &v93[v94], v95);
            }
            sub_10000D584(v3, (_BYTE *)v31 + 14, v94);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "preoslog dump end",  (uint8_t *)&block,  2u);
            }

            goto LABEL_579;
          }

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
LABEL_579:
            free(v31);
            goto LABEL_65;
          }

          LOWORD(block.st_dev) = 0;
          int v273 = "Buffer size returned by sysctl doesn't match buffer size recorded in the header, preoslog buffer is corrupted";
          uint64_t v274 = v29;
          int v275 = 2;
        }

        else
        {
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_579;
          }
          block.st_dev = 67109376;
          *(_DWORD *)&block.st_mode = 1280528208;
          LOWORD(block.st_ino) = 1024;
          *(_DWORD *)((char *)&block.st_ino + 2) = v86;
          int v273 = "Magic for preoslog buffer doesn't match, expected %08X, given %08X";
          uint64_t v274 = v29;
          int v275 = 14;
        }

        _os_log_error_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_ERROR, v273, (uint8_t *)&block, v275);
        goto LABEL_579;
      }

      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      LOWORD(block.st_dev) = 0;
      BOOL v79 = "Failed to allocate memory for preoslog buffer";
    }

    else
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      LOWORD(block.st_dev) = 0;
      BOOL v79 = "preoslog buffer size is 0";
    }

    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v79, (uint8_t *)&block, 2u);
    goto LABEL_65;
  }

LABEL_683:
  v464 = _os_assert_log(0LL, v28);
  _os_crash(v464);
  __break(1u);
LABEL_684:
  dispatch_once(&qword_1000364F8, &block);
LABEL_66:
  id v35 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0LL));
  if (!v35)
  {
    v465 = _os_assert_log(0LL, v36);
    _os_crash(v465);
    __break(1u);
    goto LABEL_686;
  }

  v498 = v35;

  id v37 = sub_100012A14("AppleDialogSPMIPMU", "IOPMUBootSOCD", "IOPMUBootSOCDClear", 0LL, 0);
  uint32_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  if (v38)
  {
    [v498 addObjectsFromArray:v38];
    id v39 = (os_log_s *)qword_100036550;
    if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_DEFAULT))
    {
      block.st_dev = 138412290;
      *(void *)&block.st_mode = @"AppleDialogSPMIPMU";
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "loaded socd data from: %@",  (uint8_t *)&block,  0xCu);
    }
  }

  unsigned int v40 = sub_100012A14("AppleSMC", "socd-data", "remove-socd-data", "socd-data-in-progress", 0x32u);
  BOOL v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

  if (v41)
  {
    [v498 addObjectsFromArray:v41];
    id v42 = (os_log_s *)qword_100036550;
    if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_DEFAULT))
    {
      block.st_dev = 138412290;
      *(void *)&block.st_mode = @"AppleSMC";
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "loaded socd data from: %@",  (uint8_t *)&block,  0xCu);
    }
  }

  BOOL v43 = [v498 count] == 0;

  id v44 = (os_log_s *)(id)qword_100036568;
  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
  if (v43)
  {
    if (v45)
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "No socd data found in local device",  (uint8_t *)&block,  2u);
    }

LABEL_94:
    goto LABEL_95;
  }

  if (v45)
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "socd data found in local device",  (uint8_t *)&block,  2u);
  }

  if ((v501 & 1) != 0)
  {
    id v46 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  &off_100033A18));
    id v47 = v498;
    uint64_t v48 = (os_log_s *)v46;
    if (!v48)
    {
      v473 = _os_assert_log(0LL, v49);
      __int128 v110 = (id)_os_crash(v473);
      __break(1u);
      goto LABEL_693;
    }

    id v44 = v48;

    id v50 = v47;
    v542 = 0u;
    v543 = 0u;
    memset(buf, 0, sizeof(buf));
    obuint64_t j = v50;
    id v51 = [obj countByEnumeratingWithState:buf objects:&block count:16];
    if (v51)
    {
      uint64_t v52 = **(void **)&buf[16];
      while (2)
      {
        for (int8x16_t i = 0LL; i != v51; int8x16_t i = (char *)i + 1)
        {
          if (**(void **)&buf[16] != v52) {
            objc_enumerationMutation(obj);
          }
          id v54 = *(void **)(*(void *)&buf[8] + 8LL * (void)i);
          id v55 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v44, "path"));
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 stringValue]);
          id v58 = (void *)objc_claimAutoreleasedReturnValue([v55 stringByAppendingString:v57]);
          LOBYTE(v54) = [v54 writeToFile:v58 atomically:1];

          if ((v54 & 1) == 0)
          {
            id v59 = (os_log_s *)qword_100036550;
            if (os_log_type_enabled((os_log_t)qword_100036550, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v536 = 138412290;
              *(void *)&v536[4] = v44;
              _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "unable to write socd data to file: %@",  v536,  0xCu);
            }

            id v60 = (os_log_s *)(id)qword_100036568;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              block.st_dev = 138412290;
              *(void *)&block.st_mode = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "failed to write socd data to file: %@",  (uint8_t *)&block,  0xCu);
            }

            goto LABEL_94;
          }
        }

        id v51 = [obj countByEnumeratingWithState:buf objects:&block count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }

    goto LABEL_94;
  }

LABEL_95:
  v517 = &off_100033688;
  v518 = &off_100033688;
  v519 = &off_100033688;
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  v520 = v61;
  __darwin_time_t v62 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  v521 = v62;
  id v63 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0LL));
  v522 = v63;
  if (!access("/var/run/com.apple.DumpPanic.finishedPMUFaultHandling", 0))
  {
    id v73 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "PMU fault data already processed this boot",  (uint8_t *)&block,  2u);
    }

    goto LABEL_105;
  }

  if (*__error() != 2)
  {
    uint64_t v75 = (void *)qword_100036568;
    uint64_t v74 = 0LL;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_151;
    }
    uint64_t v76 = v75;
    unsigned __int8 v77 = __error();
    unsigned __int8 v78 = strerror(*v77);
    block.st_dev = 136315394;
    *(void *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedPMUFaultHandling";
    WORD2(block.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v78;
    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "failed to check whether PMU fault data has been processed using access(%s, O_RDONLY) returned: %s",  (uint8_t *)&block,  0x16u);

    goto LABEL_150;
  }

  uint64_t v64 = IOServiceMatching("IOService");
  id v65 = v64;
  if (!v64)
  {
    uint64_t v80 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      id v81 = "Failed to allocate matching dictionary to match against PMU";
LABEL_117:
      _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, v81, (uint8_t *)&block, 2u);
    }

LABEL_150:
    uint64_t v74 = 0LL;
    goto LABEL_151;
  }

  CFDictionarySetValue(v64, @"IOPropertyMatch", &off_1000338C8);
  LODWORD(obj) = IOServiceGetMatchingService(kIOMainPortDefault, v65);
  if (!(_DWORD)obj)
  {
    uint64_t v80 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      id v81 = "Failed to locate primary PMU service";
      goto LABEL_117;
    }

    goto LABEL_150;
  }

  uint64_t v66 = IOServiceMatching("IOService");
  id v67 = v66;
  if (!v66)
  {
    id v96 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_139;
    }
    LOWORD(block.st_dev) = 0;
    id v70 = "Failed to allocate matching dictionary to match against PMU";
    goto LABEL_676;
  }

  CFDictionarySetValue(v66, @"IOPropertyMatch", &off_1000338F0);
  *(_DWORD *)z_stream buf = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v67, (io_iterator_t *)buf);
  if (!MatchingServices)
  {
    size_t v271 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      while (IOIteratorIsValid(v271))
      {
        while (1)
        {
          v272 = (__CFString *)IOIteratorNext(*(io_iterator_t *)buf);
          uint64_t v74 = v272;
          if (!(_DWORD)v272) {
            break;
          }
          if ((_DWORD)v272 != (_DWORD)obj) {
            goto LABEL_140;
          }
        }

        if (IOIteratorIsValid(*(io_iterator_t *)buf)) {
          break;
        }
        IOIteratorReset(*(io_iterator_t *)buf);
        size_t v271 = *(_DWORD *)buf;
      }

      goto LABEL_139;
    }

    id v96 = qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_139;
    }
    LOWORD(block.st_dev) = 0;
    id v70 = "IOService match returned an empty iterator for PMU services";
LABEL_676:
    uint64_t v71 = (os_log_s *)v96;
    BOOL v72 = 2;
    goto LABEL_677;
  }

  id v69 = qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    block.st_dev = 67109120;
    *(_DWORD *)&block.st_mode = MatchingServices;
    id v70 = "Failed to get matching PMU ioservices: 0x%x";
    uint64_t v71 = (os_log_s *)v69;
    BOOL v72 = 8;
LABEL_677:
    _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, v70, (uint8_t *)&block, v72);
  }

LABEL_139:
  uint64_t v74 = 0LL;
LABEL_140:
  if (!IORegistryEntryCreateCFProperties((io_registry_entry_t)obj, properties, kCFAllocatorDefault, 0))
  {
    Value = CFDictionaryGetValue(properties[0], @"IOPMUBootErrorPanicCount");
    v517 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(Value);

    id v99 = CFDictionaryGetValue(properties[0], @"IOPMUBootErrorFailCount");
    v518 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v99);

    __int128 v100 = CFDictionaryGetValue(properties[0], @"IOPMUBootErrorStage");
    v519 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v100);

    __int128 v101 = CFDictionaryGetValue(properties[0], @"IOPMUBootErrorAppName");
    __int128 v102 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v101);
    __int128 v103 = off_100035AF0;
    off_100035AF0 = v102;

    __int128 v104 = CFDictionaryGetValue(properties[0], @"IOPMUBootFaultInfo");
    __int128 v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
    v520 = v105;

    if ((_DWORD)v74)
    {
      if (IORegistryEntryCreateCFProperties( (io_registry_entry_t)v74,  (CFMutableDictionaryRef *)buf,  kCFAllocatorDefault,  0))
      {
        __int128 v106 = (os_log_s *)qword_100036568;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
        {
          LOWORD(block.st_dev) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_ERROR,  "unable to read out auxiliary PMU properties",  (uint8_t *)&block,  2u);
        }

        IOObjectRelease((io_object_t)obj);
        IOObjectRelease((io_object_t)v74);
        goto LABEL_150;
      }

      v418 = CFDictionaryGetValue(*(CFDictionaryRef *)buf, @"IOPMUBootFaultInfo");
      v419 = objc_claimAutoreleasedReturnValue(v418);
      v521 = v419;

      v420 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 138412290;
        *(void *)&block.st_mode = v419;
        _os_log_impl( (void *)&_mh_execute_header,  v420,  OS_LOG_TYPE_DEFAULT,  "read out auxiliary PMU fault data: boot fault info: %@",  (uint8_t *)&block,  0xCu);
      }
    }

    v421 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v522 = v421;

    v542 = 0u;
    v543 = 0u;
    memset(buf, 0, sizeof(buf));
    v337 = v105;
    __darwin_time_t v62 = (__darwin_time_t)-[os_log_s countByEnumeratingWithState:objects:count:]( v337,  "countByEnumeratingWithState:objects:count:",  buf,  &block,  16LL);
    if (v62)
    {
      v422 = 0LL;
      v349 = **(void ***)&buf[16];
      v354 = @",";
      do
      {
        for (uint64_t j = 0LL; j != v62; ++j)
        {
          v414 = (__CFString *)*(id *)(*(void *)&buf[8] + 8 * j);

          v422 = v414;
          if ((-[__CFString containsString:](v414, "containsString:", @",") & 1) != 0)
          {
            v424 = -[__CFString rangeOfString:](v414, "rangeOfString:", @",");
            if (v424 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v448 = _os_assert_log(0LL, v423);
              _os_crash(v448);
              __break(1u);
              goto LABEL_656;
            }

            v421 = v522;
            __int128 v105 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v422, "substringToIndex:", v424));
            -[NSMutableArray addObject:](v522, "addObject:", v105);
          }

          else
          {
            v421 = v522;
            -[NSMutableArray addObject:](v522, "addObject:", v422);
          }
        }

        __darwin_time_t v62 = (__darwin_time_t)-[os_log_s countByEnumeratingWithState:objects:count:]( v337,  "countByEnumeratingWithState:objects:count:",  buf,  &block,  16LL);
      }

      while (v62);
    }

    sub_10000DDA4((io_registry_entry_t)obj);
    sub_10000DDA4((io_registry_entry_t)v74);
    IOObjectRelease((io_object_t)obj);
    if ((_DWORD)v74) {
      IOObjectRelease((io_object_t)v74);
    }
    v425 = (void *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      v426 = v425;
      v427 = [v517 intValue];
      v428 = [v518 intValue];
      v429 = [v519 intValue];
      v430 = [off_100035AF0 intValue];
      *(_DWORD *)v536 = 67110402;
      *(_DWORD *)&v536[4] = v427;
      *(_WORD *)&v536[8] = 1024;
      *(_DWORD *)&v536[10] = v428;
      *(_WORD *)&v536[14] = 1024;
      *(_DWORD *)&v536[16] = v429;
      *(_WORD *)&v536[20] = 1024;
      *(_DWORD *)&v536[22] = v430;
      v537 = 2112;
      v538 = v520;
      v539 = 2112;
      *(void *)v540 = v421;
      _os_log_impl( (void *)&_mh_execute_header,  v426,  OS_LOG_TYPE_DEFAULT,  "read out PMU fault data: resetCount: %d, bootFailCount: %d, boot stage: 0x%x, boot app hash: %d, boot faults: %@ , universal boot faults: %@:",  v536,  0x2Eu);
    }

    if (creat("/var/run/com.apple.DumpPanic.finishedPMUFaultHandling", 0x100u) < 0)
    {
      v431 = __error();
      v432 = (void *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        v433 = *v431;
        v434 = v432;
        v435 = strerror(v433);
        *(_DWORD *)v536 = 136315394;
        *(void *)&v536[4] = "/var/run/com.apple.DumpPanic.finishedPMUFaultHandling";
        *(_WORD *)&v536[12] = 2080;
        *(void *)&v536[14] = v435;
        _os_log_error_impl( (void *)&_mh_execute_header,  v434,  OS_LOG_TYPE_ERROR,  "failed to creat() PMU fault data processed cookie at path %s with error %s",  v536,  0x16u);
      }
    }

LABEL_105:
    uint64_t v74 = (__CFString *)1;
    goto LABEL_151;
  }

  __int128 v97 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_ERROR,  "unable to read out primary PMU properties",  (uint8_t *)&block,  2u);
  }

  IOObjectRelease((io_object_t)obj);
  if ((_DWORD)v74)
  {
    IOObjectRelease((io_object_t)v74);
    goto LABEL_150;
  }

LABEL_151:
  __int128 v107 = (unint64_t)(id)qword_100036568;
  __int128 v108 = os_log_type_enabled((os_log_t)v107, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v74)
  {
    if (v108)
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v107,  OS_LOG_TYPE_DEFAULT,  "No boot fault data found in local device",  (uint8_t *)&block,  2u);
    }

    goto LABEL_174;
  }

  if (v108)
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v107,  OS_LOG_TYPE_DEFAULT,  "boot fault data found in local device",  (uint8_t *)&block,  2u);
  }

  if ((v501 & 1) != 0)
  {
    __int128 v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  &off_100033A30));
    sub_10000DEB4(v516, (id *)&v517);
    __int128 v107 = v109;
    __int128 v110 = v516[0];
    if (v110)
    {
      __int128 v112 = v110;

      __int128 v113 = v516[1];
      if (v113)
      {
        __int128 v115 = (__darwin_ino64_t)v113;

        unint64_t v116 = v516[2];
        if (v116)
        {
          __int16 v118 = v116;

          id v119 = v516[3];
          if (v119)
          {
            id v121 = v119;

            __int16 v122 = v516[5];
            if (v122)
            {
              __darwin_time_t v62 = (__darwin_time_t)v122;

              *(void *)z_stream buf = @"resetCount";
              *(void *)&buf[8] = @"bootFailCount";
              *(void *)&block.st_dev = v112;
              block.st_ino = v115;
              *(void *)&uint8_t buf[16] = @"bootStage";
              *(void *)&buf[24] = @"rawBootFaults";
              *(void *)&block.st_uid = v118;
              *(void *)&block.st_rdev = v121;
              *(void *)&v542 = @"universalBootFaults";
              block.st_atimespec.tv_sec = v62;
              uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &block,  buf,  5LL));
              properties[0] = 0LL;
              v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v124,  0LL,  properties));
              uint64_t v74 = properties[0];
              if (v74 || !v125)
              {
                v127 = (os_log_s *)qword_100036568;
                if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_171;
                }
                *(_DWORD *)v536 = 138412290;
                *(void *)&v536[4] = v74;
                id v128 = "unable to serialize json: %@";
              }

              else
              {
                v126 = (void *)objc_claimAutoreleasedReturnValue([(id)v107 path]);
                __darwin_time_t v62 = (__darwin_time_t)[v125 writeToFile:v126 atomically:1];

                v127 = (os_log_s *)qword_100036568;
                if ((v62 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v536 = 138412290;
                    *(void *)&v536[4] = v107;
                    _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "wrote boot fault data to: %@",  v536,  0xCu);
                  }

                  sub_10000DD5C(v516);
LABEL_174:

                  goto LABEL_175;
                }

                if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                {
LABEL_171:

                  sub_10000DD5C(v516);
                  uint64_t v129 = (os_log_s *)(id)qword_100036568;
                  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                  {
                    block.st_dev = 138412290;
                    *(void *)&block.st_mode = v107;
                    _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "failed to write boot fault data to file: %@",  (uint8_t *)&block,  0xCu);
                  }

                  goto LABEL_174;
                }

                *(_DWORD *)v536 = 138412290;
                *(void *)&v536[4] = v107;
                id v128 = "unable to write json to file: %@";
              }

              _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, v128, v536, 0xCu);
              goto LABEL_171;
            }

LABEL_697:
            v478 = _os_assert_log(v122, v123);
            v255 = (void *)_os_crash(v478);
            __break(1u);
            goto LABEL_698;
          }

LABEL_696:
          v477 = _os_assert_log(v119, v120);
          __int16 v122 = (id)_os_crash(v477);
          __break(1u);
          goto LABEL_697;
        }

LABEL_695:
        v476 = _os_assert_log(v116, v117);
        id v119 = (id)_os_crash(v476);
        __break(1u);
        goto LABEL_696;
      }

LABEL_694:
      v475 = _os_assert_log(v113, v114);
      unint64_t v116 = (id)_os_crash(v475);
      __break(1u);
      goto LABEL_695;
    }

LABEL_693:
    v474 = _os_assert_log(v110, v111);
    __int128 v113 = (id)_os_crash(v474);
    __break(1u);
    goto LABEL_694;
  }

LABEL_191:
  if (!AppleNVMeDeviceSupportsPanicLogAccess())
  {
    v524[0] = 0LL;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PanicDev", @"com.apple.DumpPanic", 0LL);
    if (AppIntegerValue >= 1) {
      v148 = AppIntegerValue;
    }
    else {
      v148 = 15LL;
    }
    v149 = 1LL;
    while (1)
    {
      v150 = IOServiceMatching("IOMedia");
      *(void *)v536 = @"IOPropertyMatch";
      *(void *)z_stream buf = &off_100033918;
      CFDictionarySetValue( v150,  @"IOParentMatch",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v536,  1LL));
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v150);
      v152 = MatchingService;
      if (MatchingService)
      {
        if (IORegistryEntryCreateCFProperties(MatchingService, properties, kCFAllocatorDefault, 0))
        {
          IOObjectRelease(v152);
        }

        else
        {
          v153 = (const __CFString *)CFDictionaryGetValue(properties[0], @"BSD Name");
          v154 = (const __CFBoolean *)CFDictionaryGetValue(properties[0], @"Whole");
          if (v153 && v154 == kCFBooleanTrue)
          {
            CFStringGetCString(v153, &aDevRdiskx[6], 74LL, 0x8000100u);
            v132 = (_BYTE *)&unk_100036000;
            v252 = (os_log_s *)qword_100036568;
            if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
            {
              block.st_dev = 136315138;
              *(void *)&block.st_mode = aDevRdiskx;
              _os_log_impl( (void *)&_mh_execute_header,  v252,  OS_LOG_TYPE_DEFAULT,  "Matched registered panic device: %s",  (uint8_t *)&block,  0xCu);
            }

            CFRelease(properties[0]);
            IOObjectRelease(v152);
            uint64_t v253 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  aDevRdiskx));
            v254 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v253));

            if (!v254)
            {
LABEL_214:
              id v156 = (os_log_s *)qword_100036568;
              if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(block.st_dev) = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  "This device does not support the AppleNVMeDevice API and no paniclog block device was found.",  (uint8_t *)&block,  2u);
              }

              v144 = 0LL;
              goto LABEL_217;
            }

            uint64_t v74 = v254;

            v524[0] = 0LL;
            v255 = valloc(0x240000uLL);
            if (v255)
            {
              v257 = (__darwin_time_t)v255;
              bzero(v255, 0x240000uLL);
              v524[0] = 0LL;
              v258 = (void *)qword_100036568;
              __darwin_time_t v62 = v257;
              if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
              {
                v259 = v258;
                uint32_t v260 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v74, "path"));
                block.st_dev = 138412290;
                *(void *)&block.st_mode = v260;
                _os_log_impl( (void *)&_mh_execute_header,  v259,  OS_LOG_TYPE_DEFAULT,  "Opening paniclog path '%@'\n",  (uint8_t *)&block,  0xCu);
              }

              v261 = objc_claimAutoreleasedReturnValue(-[__CFString path](v74, "path"));
              LODWORD(v141) = open((const char *)[v261 UTF8String], 0);

              if ((v141 & 0x80000000) != 0)
              {
                v377 = (void *)qword_100036568;
                v378 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR);
                v379 = (void *)v62;
                if (v378)
                {
                  v458 = v377;
                  v459 = __error();
                  v460 = strerror(*v459);
                  v461 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v74, "path"));
                  block.st_dev = 136315394;
                  *(void *)&block.st_mode = v460;
                  WORD2(block.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v461;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v458,  OS_LOG_TYPE_ERROR,  "ERROR: '%s' when opening '%@'",  (uint8_t *)&block,  0x16u);

                  v379 = (void *)v62;
                }

                free(v379);
                unsigned int v262 = 0LL;
                goto LABEL_652;
              }

              unsigned int v262 = (void *)v62;
              v263 = pread(v141, (void *)v62, 0x240000uLL, 0LL);
              v264 = (void *)v263;
              if (v263 == -1)
              {
                if (*__error() == 22)
                {
                  v391 = (void *)qword_100036568;
                  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                  {
                    v392 = v391;
                    v393 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v74, "path"));
                    block.st_dev = 138412290;
                    *(void *)&block.st_mode = v393;
                    _os_log_impl( (void *)&_mh_execute_header,  v392,  OS_LOG_TYPE_DEFAULT,  "No panic data detected from '%@'",  (uint8_t *)&block,  0xCu);

                    unsigned int v262 = (void *)v62;
                  }

                  free(v262);
                  unsigned int v262 = 0LL;
                  goto LABEL_651;
                }
              }

              else if ((v263 & 0x8000000000000000LL) == 0)
              {
                uint64_t v265 = (os_log_s *)qword_100036568;
                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                {
                  block.st_dev = 134217984;
                  *(void *)&block.st_mode = v264;
                  _os_log_impl( (void *)&_mh_execute_header,  v265,  OS_LOG_TYPE_DEFAULT,  "Read %ld bytes from panic device",  (uint8_t *)&block,  0xCu);
                }

                v524[0] = v264;
                LODWORD(properties[0]) = 0;
                if (ioctl(v141, 0x40046418uLL, properties))
                {
                  uint64_t v266 = (void *)qword_100036568;
                  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v267 = v266;
                    v268 = *__error();
                    unint64_t v269 = __error();
                    uint64_t v270 = strerror(*v269);
                    block.st_dev = 67109378;
                    *(_DWORD *)&block.st_mode = v268;
                    LOWORD(block.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&block.st_ino + 2) = (__darwin_ino64_t)v270;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v267,  OS_LOG_TYPE_ERROR,  "Failed to query disk block size -- DKIOCGETBLOCKSIZE failed with %d : %s",  (uint8_t *)&block,  0x12u);

                    goto LABEL_577;
                  }

LABEL_651:
                  close(v141);
LABEL_652:

                  v144 = v262;
LABEL_217:
                  int v157 = v524[0];
                  if (v524[0])
                  {
                    v158 = 0;
                    v159 = 0LL;
                    do
                      v158 |= (v159++)[(void)v144];
                    while (v524[0] != v159);
                    if (v524[0] >= (id)8 && v158) {
                      goto LABEL_232;
                    }
                  }

                  free(v144);
                  v160 = v524[0];
                  if (v524[0])
                  {
                    int v161 = qword_100036568;
                    v162 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
                    if ((unint64_t)v160 <= 7)
                    {
                      if (v162)
                      {
                        block.st_dev = 134218240;
                        *(void *)&block.st_mode = v160;
                        WORD2(block.st_ino) = 2048;
                        *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = 8LL;
                        uint64_t v163 = "%llu bytes were read from the file or device, but at least %lu are required to fit the iB"
                               "oot panic header.";
                        uint64_t v164 = (os_log_s *)v161;
                        v165 = 22;
                        goto LABEL_230;
                      }

LABEL_231:
                      v144 = 0LL;
                      int v157 = 0LL;
LABEL_232:
                      v494 = (unsigned int *)v144;
                      v496 = v157;
                      if (v132[1320] == 1)
                      {
                        if (mkdir("/var/root/Library/Application Support/DumpPanic/", 0x1A4u) && *__error() != 17)
                        {
                          v169 = (void *)qword_100036568;
                          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                          {
                            v170 = v169;
                            v171 = __error();
                            v172 = strerror(*v171);
                            block.st_dev = 136315394;
                            *(void *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/";
                            WORD2(block.st_ino) = 2080;
                            *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v172;
                            _os_log_error_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_ERROR,  "Failed to create directory: %s with error: %s",  (uint8_t *)&block,  0x16u);
                          }
                        }

                        else
                        {
                          uint64_t v167 = open_dprotected_np( "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed",  520,  4,  0,  420LL);
                          unsigned int v168 = (void *)qword_100036568;
                          if (v167 == -1)
                          {
                            if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                            {
                              v439 = v168;
                              v440 = __error();
                              v441 = strerror(*v440);
                              block.st_dev = 136315394;
                              *(void *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
                              WORD2(block.st_ino) = 2080;
                              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v441;
                              _os_log_error_impl( (void *)&_mh_execute_header,  v439,  OS_LOG_TYPE_ERROR,  "Failed to create file: %s with error: %s",  (uint8_t *)&block,  0x16u);
                            }
                          }

                          else
                          {
                            if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                            {
                              block.st_dev = 136315138;
                              *(void *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
                              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v168,  OS_LOG_TYPE_DEFAULT,  "Created legacy panic data marker file: %s",  (uint8_t *)&block,  0xCu);
                            }

                            close(v167);
                          }
                        }
                      }

                      v173 = (os_log_s *)(id)qword_100036568;
                      uint64_t v174 = os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT);
                      if (v144)
                      {
                        if (v174)
                        {
                          block.st_dev = 134217984;
                          *(void *)&block.st_mode = v157;
                          _os_log_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_DEFAULT,  "0x%llx bytes of paniclog data found in local device",  (uint8_t *)&block,  0xCu);
                        }

                        if ((v501 & 1) != 0 && v157)
                        {
                          v173 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPathComponents:]( &OBJC_CLASS___NSURL,  "fileURLWithPathComponents:",  &off_100033A48));
                          if (!sub_10000E8C0(v173, v144, (size_t)v157))
                          {
                            char v175 = (os_log_s *)(id)qword_100036568;
                            if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                            {
                              block.st_dev = 138412290;
                              *(void *)&block.st_mode = v173;
                              _os_log_impl( (void *)&_mh_execute_header,  v175,  OS_LOG_TYPE_DEFAULT,  "failed to write paniclog data to file: %@",  (uint8_t *)&block,  0xCu);
                            }
                          }

                          goto LABEL_254;
                        }
                      }

                      else
                      {
                        if (v174)
                        {
                          LOWORD(block.st_dev) = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_DEFAULT,  "No paniclog data found in local device",  (uint8_t *)&block,  2u);
                        }

LABEL_254:
                      }

                      v500 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                      v176 = @"/private/var/db/DumpPanic";
                      v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                      properties[0] = 0LL;
                      v497 = (void *)objc_claimAutoreleasedReturnValue( [v177 contentsOfDirectoryAtPath:@"/private/var/db/DumpPanic" error:properties]);
                      unsigned int v178 = properties[0];
                      if (!v497)
                      {
                        id v195 = (os_log_s *)qword_100036568;
                        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                        {
                          block.st_dev = 138412290;
                          *(void *)&block.st_mode = v178;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v195,  OS_LOG_TYPE_ERROR,  "Failed to enumerate the contents of the sandbox directory: %@",  (uint8_t *)&block,  0xCu);
                        }

                        goto LABEL_280;
                      }

                      v542 = 0u;
                      v543 = 0u;
                      memset(buf, 0, sizeof(buf));
                      obja = v497;
                      unsigned int v179 = [obja countByEnumeratingWithState:buf objects:&block count:16];
                      if (!v179) {
                        goto LABEL_277;
                      }
                      uint64_t v180 = **(void **)&buf[16];
                      while (2)
                      {
                        v181 = 0LL;
LABEL_259:
                        if (**(void **)&buf[16] != v180) {
                          objc_enumerationMutation(obja);
                        }
                        v182 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/private/var/db/DumpPanic",  *(void *)(*(void *)&buf[8] + 8 * v181)));
                        v524[0] = v178;
                        id v183 = (void *)objc_claimAutoreleasedReturnValue([v177 attributesOfItemAtPath:v182 error:v524]);
                        v184 = (__CFDictionary *)v524[0];

                        if (v183)
                        {
                          v185 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v183 fileType]);
                          v186 = v185 == NSFileTypeDirectory;

                          if (v186)
                          {
                            unsigned int v178 = v184;
                          }

                          else
                          {
                            v187 = (os_log_s *)qword_100036568;
                            if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v536 = 138412290;
                              *(void *)&v536[4] = v182;
                              _os_log_impl( (void *)&_mh_execute_header,  v187,  OS_LOG_TYPE_DEFAULT,  "Removing non-directory entry '%@'",  v536,  0xCu);
                            }

                            v534[0] = v184;
                            v188 = [v177 removeItemAtPath:v182 error:v534];
                            unsigned int v178 = (__CFDictionary *)v534[0];

                            if ((v188 & 1) == 0)
                            {
                              uint64_t v189 = qword_100036568;
                              if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)v536 = 138412546;
                                *(void *)&v536[4] = v182;
                                *(_WORD *)&v536[12] = 2112;
                                *(void *)&v536[14] = v178;
                                v190 = (os_log_s *)v189;
                                v191 = "Failed to remove non-directory entry '%@'. Error: %@";
                                goto LABEL_273;
                              }
                            }
                          }
                        }

                        else
                        {
                          unsigned int v192 = (os_log_s *)qword_100036568;
                          if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v536 = 138412546;
                            *(void *)&v536[4] = v182;
                            *(_WORD *)&v536[12] = 2112;
                            *(void *)&v536[14] = v184;
                            _os_log_error_impl( (void *)&_mh_execute_header,  v192,  OS_LOG_TYPE_ERROR,  "Failed to gather the file attributes for '%@'. Error: %@",  v536,  0x16u);
                          }

                          v535[0] = v184;
                          v193 = [v177 removeItemAtPath:v182 error:v535];
                          unsigned int v178 = (__CFDictionary *)v535[0];

                          if ((v193 & 1) == 0)
                          {
                            v194 = qword_100036568;
                            if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v536 = 138412546;
                              *(void *)&v536[4] = v182;
                              *(_WORD *)&v536[12] = 2112;
                              *(void *)&v536[14] = v178;
                              v190 = (os_log_s *)v194;
                              v191 = "Failed to remove inaccessible entry '%@'. Error: %@";
LABEL_273:
                              _os_log_error_impl( (void *)&_mh_execute_header,  v190,  OS_LOG_TYPE_ERROR,  v191,  v536,  0x16u);
                            }
                          }
                        }

                        if (v179 == (id)++v181)
                        {
                          unsigned int v179 = [obja countByEnumeratingWithState:buf objects:&block count:16];
                          if (!v179)
                          {
LABEL_277:

LABEL_280:
                            if (!v497)
                            {
                              v493 = 0LL;
                              id v200 = v494;
                              v201 = (unint64_t)v496;
                              goto LABEL_294;
                            }

                            v196 = objc_autoreleasePoolPush();
                            if (qword_100036530 != -1) {
                              goto LABEL_689;
                            }
                            while (2)
                            {
                              id v197 = (void *)objc_claimAutoreleasedReturnValue( +[CoreFileHandler coreFileWithCoreFilePath::::]( &OBJC_CLASS___CoreFileHandler,  "coreFileWithCoreFilePath::::",  off_100035B48,  1LL,  0LL,  qword_100036568));
                              int v198 = v197;
                              if (v197)
                              {
                                v199 = (void *)objc_claimAutoreleasedReturnValue( [v197 saveKernelCoreToDisk:"/private/var/mobile/Library/Logs/CrashReporter/Panics" :3 :0 :0 :Current]);
                                if (v199) {
                                  [v500 addObjectsFromArray:v199];
                                }
                                if (v496
                                  || sub_10000CF20()
                                  && !os_parse_boot_arg_int("-interrupted_coredump_paniclog", 0LL))
                                {
                                  v493 = 0LL;
                                }

                                else
                                {
                                  free(v494);
                                  v493 = (void *)objc_claimAutoreleasedReturnValue([v198 getPanicRegion]);
                                  v494 = 0LL;
                                }
                              }

                              else
                              {
                                v493 = 0LL;
                              }

                              objc_autoreleasePoolPop(v196);
                              id v200 = v494;
                              v201 = (unint64_t)v496;
LABEL_294:
                              if (v201 || v493)
                              {
                                v202 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s output_dir](v499, "output_dir"));
                                v514 = 0LL;
                                v515 = 0LL;
                                sub_10000F0B8( v200,  v201,  v202,  v486,  v489,  (PanicReport *)&v515,  (uint64_t *)&v514,  v498,  Current,  v493);
                                v503 = v515;
                                v496 = v514;
                              }

                              else
                              {
                                v503 = 0LL;
                                v496 = 0LL;
                              }

                              sub_10000DEB4(&v509, (id *)&v517);
                              objb = (id)objc_claimAutoreleasedReturnValue(-[os_log_s output_dir](v499, "output_dir"));
                              sub_10000DEB4(v536, &v509);
                              v203 = *(void **)v536;
                              v204 = [*(id *)v536 intValue];
                              id v205 = [*(id *)&v536[8] intValue] + v204;
                              if (v205 > 1)
                              {
                                uInt v206 = 8;
                                goto LABEL_310;
                              }

                              unsigned int v207 = *(void *)&v540[2];
                              if ([*(id *)&v540[2] count])
                              {
                                uint64_t v208 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  v207);
                                if (-[NSMutableArray containsObject:]( v208,  "containsObject:",  @"rst")) {
                                  -[NSMutableArray removeObject:](v208, "removeObject:", @"rst");
                                }
                                if (-[NSMutableArray count](v208, "count")
                                  && (unint64_t)-[NSMutableArray count](v208, "count") <= 1)
                                {
                                  if (-[NSMutableArray containsObject:]( v208,  "containsObject:",  @"wdog"))
                                  {
                                    uInt v206 = [*(id *)&v536[16] intValue] == 227;
                                  }

                                  else if ((-[NSMutableArray containsObject:]( v208,  "containsObject:",  @"uv") & 1) != 0)
                                  {
                                    uInt v206 = 2;
                                  }

                                  else if ((-[NSMutableArray containsObject:]( v208,  "containsObject:",  @"ov") & 1) != 0)
                                  {
                                    uInt v206 = 3;
                                  }

                                  else if ((-[NSMutableArray containsObject:]( v208,  "containsObject:",  @"ot") & 1) != 0)
                                  {
                                    uInt v206 = 5;
                                  }

                                  else if ((-[NSMutableArray containsObject:]( v208,  "containsObject:",  @"crash") & 1) != 0)
                                  {
                                    uInt v206 = 4;
                                  }

                                  else
                                  {
                                    if (v205)
                                    {
                                      v457 = (os_log_s *)qword_100036568;
                                      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                      {
                                        block.st_dev = 138412290;
                                        *(void *)&block.st_mode = v207;
                                        _os_log_error_impl( (void *)&_mh_execute_header,  v457,  OS_LOG_TYPE_ERROR,  "bootFaults contained uncategorized PMU fault(s) : %@",  (uint8_t *)&block,  0xCu);
                                      }

                                      goto LABEL_305;
                                    }

                                    uInt v206 = 7;
                                  }
                                }

                                else
                                {
LABEL_305:
                                  uInt v206 = 8;
                                }
                              }

                              else if ([v203 intValue] == 1)
                              {
                                uInt v206 = 6;
                              }

                              else
                              {
                                uInt v206 = 8;
                              }

LABEL_310:
                              sub_10000DD5C((id *)v536);
                              sub_10000DEB4(properties, &v509);
                              if (&_AnalyticsSendEventLazy)
                              {
                                if (v206 > 7) {
                                  unint64_t v209 = @"unknown";
                                }
                                else {
                                  unint64_t v209 = *(&off_100030B80 + v206);
                                }
                                *(void *)&block.st_dev = _NSConcreteStackBlock;
                                block.st_ino = 3254779904LL;
                                *(void *)&block.st_uid = sub_10000DF1C;
                                *(void *)&block.st_rdev = &unk_100030B50;
                                sub_10000DEB4(&block.st_atimespec.tv_nsec, (id *)properties);
                                block.st_atimespec.tv_sec = (__darwin_time_t)v209;
                                AnalyticsSendEventLazy(@"com.apple.coreOS.restartReason", &block);
                                *(void *)z_stream buf = _NSConcreteStackBlock;
                                *(void *)&buf[8] = 3254779904LL;
                                *(void *)&uint8_t buf[16] = sub_10000DF9C;
                                *(void *)&buf[24] = &unk_100030B50;
                                *(void *)&v542 = v209;
                                sub_10000DEB4((void *)&v542 + 1, (id *)properties);
                                AnalyticsSendEventLazy(@"com.apple.coreOS.resetTelemetry", buf);
                                sub_10000DD5C((id *)&v542 + 1);

                                sub_10000DD5C((id *)&block.st_atimespec.tv_nsec);
                              }

                              sub_10000DD5C((id *)properties);
                              unint64_t v210 = v509;
                              if ([v509 intValue]
                                || [v510 intValue])
                              {
                                int v211 = CFAbsoluteTimeGetCurrent();
                                unint64_t v212 = CFUUIDCreate(kCFAllocatorDefault);
                                unint64_t v213 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, v212);
                                CFRelease(v212);
                                v525 = 0LL;
                                sub_10000C62C((uint64_t)"chosen", "chip-id", (_DWORD *)&v525 + 1);
                                sub_10000C62C((uint64_t)"arm-io", "chip-revision", &v525);
                                v534[0] = (id)kOSALogMetadataAppName;
                                v534[1] = (id)kOSALogMetadataIncidentID;
                                v535[0] = @"Reset count";
                                v535[1] = v213;
                                v214 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v535,  v534,  2LL));
                                uint64_t v215 = sub_10000C528(objb, @"ResetCounter", 0.0);
                                int v216 = (void *)objc_claimAutoreleasedReturnValue(v215);
                                *(void *)&block.st_dev = _NSConcreteStackBlock;
                                block.st_ino = 3254779904LL;
                                *(void *)&block.st_uid = sub_10000E4A0;
                                *(void *)&block.st_rdev = &unk_100030B18;
                                v488 = v213;
                                block.st_atimespec.tv_sec = (__darwin_time_t)v488;
                                *(double *)&block.st_atimespec.tv_nsec = v211;
                                sub_10000DEB4(&block.st_mtimespec.tv_sec, &v509);
                                block.st_size = __PAIR64__(v525, HIDWORD(v525));
                                v495 = (void *)objc_claimAutoreleasedReturnValue( +[OSALog createForSubmission:metadata:options:error:writing:]( &OBJC_CLASS___OSALog,  "createForSubmission:metadata:options:error:writing:",  @"115",  v214,  v216,  0LL,  &block));

                                unsigned int v217 = (os_log_s *)(id)qword_100036568;
                                v218 = v217;
                                if (v495)
                                {
                                  if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
                                  {
                                    v219 = (void *)objc_claimAutoreleasedReturnValue([v495 filepath]);
                                    *(_DWORD *)z_stream buf = 138412290;
                                    *(void *)&uint8_t buf[4] = v219;
                                    _os_log_impl( (void *)&_mh_execute_header,  v218,  OS_LOG_TYPE_INFO,  "wrote ResetCounter log to disk: %@",  buf,  0xCu);
                                  }

                                  v218 = (os_log_s *)objc_claimAutoreleasedReturnValue([v495 filepath]);
                                  v491 = (unint64_t)-[os_log_s copy](v218, "copy");
                                }

                                else
                                {
                                  if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)z_stream buf = 0;
                                    _os_log_error_impl( (void *)&_mh_execute_header,  v218,  OS_LOG_TYPE_ERROR,  "failed to write ResetCounter log to disk",  buf,  2u);
                                  }

                                  v491 = 0LL;
                                }

                                if ((MGGetBoolAnswer(@"3kmXfug8VcxLI5yEmsqQKw") & 1) == 0)
                                {
                                  *(void *)z_stream buf = @"115";
                                  *(void *)&buf[8] = v488;
                                  int v220 = (void *)objc_claimAutoreleasedReturnValue([v210 stringValue]);
                                  *(void *)&uint8_t buf[16] = v220;
                                  int v221 = (void *)objc_claimAutoreleasedReturnValue([v510 stringValue]);
                                  *(void *)&buf[24] = v221;
                                  v222 = (void *)objc_claimAutoreleasedReturnValue([v511 stringValue]);
                                  *(void *)&v542 = v222;
                                  unsigned int v223 = (void *)objc_claimAutoreleasedReturnValue([off_100035AF0 stringValue]);
                                  *((void *)&v542 + 1) = v223;
                                  uInt v224 = (void *)objc_claimAutoreleasedReturnValue([v512 componentsJoinedByString:@";"]);
                                  *(void *)&v543 = v224;
                                  v225 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  buf,  7LL));
                                  logForAppleCare(v211);
                                }

                                uInt v226 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                                sub_10000DEB4(v524, &v509);
                                v502 = v226;
                                v227 = v524[0];
                                v228 = v524[1];
                                uint64_t v229 = v524[2];
                                v230 = v524[5];
                                v231 = [v227 intValue];
                                uint64_t v232 = [v228 intValue];
                                uint64_t v233 = [v230 containsObject:@"wdog"];
                                v234 = [v230 containsObject:@"spmi"];
                                int8x16_t v235 = [v230 count];
                                int8x16_t v236 = [v229 intValue] == 224
                                    || [v229 intValue] == 225
                                    || [v229 intValue] == 229
                                    || [v229 intValue] == 230
                                    || [v229 intValue] == 231;
                                if (v235 == (id)1) {
                                  int8x16_t v237 = v233;
                                }
                                else {
                                  int8x16_t v237 = 0;
                                }
                                if ((v237 & 1) != 0
                                  || v233
                                  && ([v230 count] == (id)2
                                   && ([v230 containsObject:@"rst"] & 1) != 0
                                   || [v230 count] == (id)2
                                   && ([v230 containsObject:@"btn_shdn"] & 1) != 0))
                                {
                                  int8x16_t v238 = 0;
                                }

                                else
                                {
                                  int8x16_t v238 = v234 ^ 1 | v233;
                                }

                                if (v231) {
                                  v239 = 0;
                                }
                                else {
                                  v239 = v232 == 1;
                                }
                                if (!v239) {
                                  int8x16_t v238 = 1;
                                }
                                if (((v238 ^ 1 | v236) & 1) != 0)
                                {
                                  v240 = !v236;
                                  if (!v502) {
                                    v240 = 1;
                                  }
                                  if ((v240 & 1) == 0)
                                  {
                                    v241 = (void *)objc_claimAutoreleasedReturnValue([v524[3] componentsJoinedByString:@" "]);
                                    unsigned int v242 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iBoot panic-save unexpected reset, boot faults: %@",  v241));

                                    -[NSMutableArray addObject:](v502, "addObject:", v242);
                                  }

                                  uint64_t v243 = [v229 intValue];
                                  int8x16_t v244 = 0;
                                  int8x16_t v245 = 0;
                                  switch(v243)
                                  {
                                    case '@':
                                      int8x16_t v244 = 2;
                                      goto LABEL_409;
                                    case 'A':
                                      int8x16_t v244 = 8;
                                      goto LABEL_409;
                                    case 'B':
                                      int8x16_t v244 = 3;
                                      goto LABEL_409;
                                    case 'C':
                                      int8x16_t v244 = 5;
                                      goto LABEL_409;
                                    case 'D':
                                      int8x16_t v244 = 6;
                                      goto LABEL_409;
                                    case 'E':
                                      int8x16_t v244 = 9;
                                      goto LABEL_409;
                                    case 'F':
                                      int8x16_t v244 = 4;
                                      goto LABEL_409;
                                    case 'G':
                                      int8x16_t v244 = 7;
                                      goto LABEL_409;
                                    case 'H':
                                    case 'I':
                                    case 'J':
                                    case 'K':
                                    case 'L':
                                    case 'M':
                                    case 'N':
                                    case 'O':
                                      break;
                                    case 'P':
                                      int8x16_t v244 = 15;
                                      goto LABEL_409;
                                    default:
                                      int8x16_t v245 = 0;
                                      switch(v243)
                                      {
                                        case 0xE0u:
                                          int8x16_t v244 = 10;
                                          break;
                                        case 0xE1u:
                                          int8x16_t v244 = 11;
                                          break;
                                        case 0xE2u:
                                          goto LABEL_410;
                                        case 0xE3u:
                                          if (!v234) {
                                            goto LABEL_404;
                                          }
                                          int8x16_t v244 = 16;
                                          break;
                                        case 0xE4u:
                                          int8x16_t v244 = 17;
                                          break;
                                        case 0xE5u:
                                          int8x16_t v244 = 12;
                                          break;
                                        case 0xE6u:
                                          int8x16_t v244 = 13;
                                          break;
                                        case 0xE7u:
                                          int8x16_t v244 = 14;
                                          break;
                                        default:
                                          int8x16_t v245 = 0;
                                          if (v243 != 255) {
                                            goto LABEL_410;
                                          }
                                          int8x16_t v244 = 1;
                                          break;
                                      }

LABEL_409:
                                      int8x16_t v245 = 1;
                                      break;
                                  }
                                }

                                else
                                {
LABEL_404:
                                  int8x16_t v244 = 0;
                                  int8x16_t v245 = 0;
                                }

LABEL_410:
                                sub_10000DD5C(v524);
                                if (v245)
                                {
                                  v276 = (os_log_s *)(id)qword_100036568;
                                  if (os_log_type_enabled(v276, OS_LOG_TYPE_INFO))
                                  {
                                    *(_WORD *)v523 = 0;
                                    _os_log_impl( (void *)&_mh_execute_header,  v276,  OS_LOG_TYPE_INFO,  "detected interesting reset, promoting to panic",  v523,  2u);
                                  }

                                  v277 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"sys watchdog"));
                                  v278 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"Unexpected uncategorized reset occurred"));
                                  v279 = v513;
                                  if ([v513 containsObject:@"wdog"])
                                  {
                                    unsigned int v280 = @"Unexpected SoC (system) watchdog reset occurred";
                                    goto LABEL_418;
                                  }

                                  if ([v279 containsObject:@"spmi"])
                                  {
                                    unsigned int v280 = @"Unexpected SPMI fault reset occurred";
LABEL_418:
                                    v281 = objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v280));

                                    v278 = (void *)v281;
                                  }

                                  switch(v244)
                                  {
                                    case 0:
                                      goto LABEL_715;
                                    case 2:
                                      [v277 appendString:@" panic start"];
                                      int v282 = @" after panic called";
                                      goto LABEL_436;
                                    case 3:
                                      [v277 appendString:@" panic diags"];
                                      int v282 = @" while panic diagnostics being saved";
                                      goto LABEL_436;
                                    case 4:
                                      [v277 appendString:@" panic diags complete"];
                                      int v282 = @" after panic diagnostics were completed";
                                      goto LABEL_436;
                                    case 5:
                                      [v277 appendString:@" x86 panic diags"];
                                      int v282 = @" while x86 panic diagnostics being saved";
                                      goto LABEL_436;
                                    case 6:
                                      [v277 appendString:@" panic DRAM flush"];
                                      int v282 = @" while panic DRAM flush in progress";
                                      goto LABEL_436;
                                    case 7:
                                      [v277 appendString:@" panic save CE trigger"];
                                      int v282 = @" after panic save CE trigger";
                                      goto LABEL_436;
                                    case 8:
                                      [v277 appendString:@" panic save chip reset"];
                                      int v282 = @" after panic save chip reset initiated";
                                      goto LABEL_436;
                                    case 9:
                                      [v277 appendString:@" panic save x86 panic diags interrupted"];
                                      int v282 = @" after panic save chip reset initiated and x86 panic diagnostics were interrupted";
                                      goto LABEL_436;
                                    case 10:
                                      [v277 appendString:@" iBoot panic save entry"];
                                      int v282 = @" after iBoot panic save entry";
                                      goto LABEL_436;
                                    case 11:
                                      [v277 appendString:@" iBoot panic save reboot"];
                                      int v282 = @" during iBoot panic save reboot";
                                      goto LABEL_436;
                                    case 12:
                                      [v277 appendString:@" iBoot panic save power init"];
                                      int v282 = @" after iBoot panic save power init";
                                      goto LABEL_436;
                                    case 13:
                                      [v277 appendString:@" iBoot panic save memory init"];
                                      int v282 = @" after iBoot panic save memory init";
                                      goto LABEL_436;
                                    case 14:
                                      [v277 appendString:@" iBoot panic save storage init"];
                                      int v282 = @" after iBoot panic save storage init";
                                      goto LABEL_436;
                                    case 15:
                                      [v277 appendString:@" sleep/wake transition"];
                                      int v282 = @" during sleep/wake transition";
                                      goto LABEL_436;
                                    case 16:
                                      [v277 appendString:@" AP Watchdog reboot"];
                                      int v282 = @" after AP Watchdog reboot";
                                      goto LABEL_436;
                                    case 17:
                                      [v277 appendString:@" AP Watchdog expired"];
                                      int v282 = @" after AP Watchdog expired";
LABEL_436:
                                      [v278 appendString:v282];
                                      break;
                                    default:
                                      break;
                                  }

                                  unint64_t v247 = v278;
                                  unsigned int v283 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:]( objc_alloc(&OBJC_CLASS___PanicReport),  "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:",  v247,  0LL,  0LL,  0LL,  v277,  0LL,  0LL);
                                  -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:]( v283,  "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:",  0LL,  0LL,  0LL,  v486,  0xFFFFFFFFLL,  Current);
                                  -[PanicReport setForegroundAppHash:](v283, "setForegroundAppHash:", off_100035AF0);
                                  -[PanicReport setSOCIdAndRev](v283, "setSOCIdAndRev");
                                  if (v502 && -[NSMutableArray count](v502, "count"))
                                  {
                                    -[PanicReport addNotes:](v283, "addNotes:", v502);
                                    -[NSMutableArray removeAllObjects](v502, "removeAllObjects");
                                  }

                                  v284 = sub_10000C528(objb, 0LL, Current);
                                  v285 = (void *)objc_claimAutoreleasedReturnValue(v284);
                                  v286 = -[PanicReport saveWithOptions:](v283, "saveWithOptions:", v285);

                                  if (v286)
                                  {
                                    v287 = (id)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v283, "logfile"));
                                    unsigned int v248 = (unint64_t)[v287 copy];
                                  }

                                  else
                                  {
                                    v287 = (id)qword_100036568;
                                    if (os_log_type_enabled((os_log_t)v287, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_WORD *)v523 = 0;
                                      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v287,  OS_LOG_TYPE_ERROR,  "failed to write system watchdog reset panic log",  v523,  2u);
                                    }

                                    unsigned int v248 = 0LL;
                                  }
                                }

                                else
                                {
                                  unint64_t v247 = 0LL;
                                  unsigned int v248 = 0LL;
                                }

                                int8x16_t v249 = (v491 | v248) != 0;

                                sub_10000DD5C((id *)&block.st_mtimespec);
                              }

                              else
                              {
                                int8x16_t v246 = (os_log_s *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl( (void *)&_mh_execute_header,  v246,  OS_LOG_TYPE_DEFAULT,  "Skipping writing ResetCounter log as no unexpected resets detected",  (uint8_t *)&block,  2u);
                                }

                                unint64_t v247 = 0LL;
                                v491 = 0LL;
                                unsigned int v248 = 0LL;
                                int8x16_t v249 = 1;
                              }

                              sub_10000DD5C(&v509);
                              v487 = v247;
                              v486 = (id)v491;
                              v494 = (unsigned int *)(id)v248;

                              if (!v249)
                              {
                                v288 = (os_log_s *)(id)qword_100036568;
                                if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_error_impl( (void *)&_mh_execute_header,  v288,  OS_LOG_TYPE_ERROR,  "Failed to write boot fault report",  (uint8_t *)&block,  2u);
                                }
                              }

                              if (v496) {
                                v490 = [v496 containsString:@"forceReset"];
                              }
                              else {
                                v490 = 0;
                              }
                              if ([v503 length]
                                || [v496 length]
                                || ![v498 count])
                              {
LABEL_456:
                                v289 = v496;
                              }

                              else
                              {
                                if (os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
                                {
                                  *(void *)&block.st_dev = 0LL;
                                  v305 = sub_10000D038();
                                  v306 = (void *)objc_claimAutoreleasedReturnValue(v305);
                                  v307 = sub_10000D1E4(v306, @"debug", (unint64_t *)&block);

                                  if (v307)
                                  {
                                    st_dev = block.st_dev;
                                    id v309 = (os_log_s *)qword_100036568;
                                    id v310 = os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT);
                                    if ((st_dev & 0x100000) == 0)
                                    {
                                      if (v310)
                                      {
                                        *(_WORD *)z_stream buf = 0;
                                        _os_log_impl( (void *)&_mh_execute_header,  v309,  OS_LOG_TYPE_DEFAULT,  "Machine configured to NOT reboot on a panic",  buf,  2u);
                                      }

                                      goto LABEL_456;
                                    }

                                    if (v310)
                                    {
                                      *(_WORD *)z_stream buf = 0;
                                      _os_log_impl( (void *)&_mh_execute_header,  v309,  OS_LOG_TYPE_DEFAULT,  "Machine configured to reboot on a panic",  buf,  2u);
                                    }
                                  }
                                }

                                v397 = (os_log_s *)(id)qword_100036550;
                                if (os_log_type_enabled(v397, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl( (void *)&_mh_execute_header,  v397,  OS_LOG_TYPE_DEFAULT,  "Write a standalone socd panic report",  (uint8_t *)&block,  2u);
                                }

                                v398 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s output_dir](v499, "output_dir"));
                                v507 = v496;
                                v508 = v503;
                                v399 = sub_100013254(v398, &v508, &v507, v498, Current);
                                v400 = v508;

                                v289 = v507;
                                if ((v399 & 1) == 0)
                                {
                                  v401 = (os_log_s *)(id)qword_100036550;
                                  if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR))
                                  {
                                    LOWORD(block.st_dev) = 0;
                                    _os_log_error_impl( (void *)&_mh_execute_header,  v401,  OS_LOG_TYPE_ERROR,  "Failed to write standalone socd panic report",  (uint8_t *)&block,  2u);
                                  }
                                }

                                v503 = v400;
                              }

                              os_log_t v3 = (os_log_t)v289;
                              if (qword_100036560 != -1) {
LABEL_686:
                              }
                                dispatch_once(&qword_100036560, &stru_100030D28);
                              v290 = (id)qword_100036558;
                              v291 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager defaultManager]( &OBJC_CLASS___NSFileManager,  "defaultManager"));
                              id v292 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"));
                              v293 = [v291 fileExistsAtPath:v292];

                              if (v293)
                              {
                                v294 = v290;
                                v295 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"));
                                *(void *)z_stream buf = 0LL;
                                v296 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v295,  0LL,  buf));
                                unint64_t v297 = *(id *)buf;

                                if (v296)
                                {
                                  *(void *)v536 = 0LL;
                                  v298 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v296,  0LL,  0LL,  v536));
                                  v299 = *(id *)v536;

                                  if (v298)
                                  {
                                    v300 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                                    if ((objc_opt_isKindOfClass(v298, v300) & 1) != 0)
                                    {
                                      v301 = (void *)objc_claimAutoreleasedReturnValue([v298 objectForKey:v294]);
                                      v302 = v301 == 0LL;

                                      if (!v302)
                                      {

                                        v303 = (os_log_s *)qword_100036568;
                                        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                        {
                                          LOWORD(block.st_dev) = 0;
                                          _os_log_error_impl( (void *)&_mh_execute_header,  v303,  OS_LOG_TYPE_ERROR,  "Found panic log breadcrumb with duplicated boot session uuid",  (uint8_t *)&block,  2u);
                                        }

                                        goto LABEL_479;
                                      }
                                    }

                                    else
                                    {
                                      id v315 = (os_log_s *)qword_100036568;
                                      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                      {
                                        LOWORD(block.st_dev) = 0;
                                        _os_log_error_impl( (void *)&_mh_execute_header,  v315,  OS_LOG_TYPE_ERROR,  "Breadcrumb file contains invalid data",  (uint8_t *)&block,  2u);
                                      }
                                    }
                                  }

                                  else
                                  {
                                    __int128 v311 = (void *)qword_100036568;
                                    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                    {
                                      __int128 v312 = v311;
                                      __int128 v313 = objc_claimAutoreleasedReturnValue([v299 description]);
                                      __int128 v314 = [v313 UTF8String];
                                      block.st_dev = 136315138;
                                      *(void *)&block.st_mode = v314;
                                      _os_log_error_impl( (void *)&_mh_execute_header,  v312,  OS_LOG_TYPE_ERROR,  "Failed to parse breadcrumb with error : %s",  (uint8_t *)&block,  0xCu);
                                    }
                                  }

                                  goto LABEL_479;
                                }

                                v304 = (void *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                {
                                  v415 = v304;
                                  v416 = objc_claimAutoreleasedReturnValue([v297 description]);
                                  v417 = [v416 UTF8String];
                                  block.st_dev = 136315138;
                                  *(void *)&block.st_mode = v417;
                                  _os_log_error_impl( (void *)&_mh_execute_header,  v415,  OS_LOG_TYPE_ERROR,  "Read from panic log breadcrumb failed due to %s",  (uint8_t *)&block,  0xCu);
                                }

LABEL_479:
                                if (unlink("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"))
                                {
                                  id v316 = (void *)qword_100036568;
                                  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                  {
                                    v385 = v316;
                                    v386 = __error();
                                    v387 = strerror(*v386);
                                    block.st_dev = 136315138;
                                    *(void *)&block.st_mode = v387;
                                    _os_log_error_impl( (void *)&_mh_execute_header,  v385,  OS_LOG_TYPE_ERROR,  "Failed to unlink prior stashed panic log breadcrumb %s",  (uint8_t *)&block,  0xCu);
                                  }
                                }
                              }

                              id v317 = objc_alloc(&OBJC_CLASS___NSDictionary);
                              if (v3) {
                                v318 = (const __CFString *)v3;
                              }
                              else {
                                v318 = &stru_100031290;
                              }
                              v319 = -[NSDictionary initWithObjectsAndKeys:]( v317,  "initWithObjectsAndKeys:",  v318,  v290,  0LL);
                              v320 = (os_log_s *)qword_100036568;
                              if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                              {
                                block.st_dev = 138412546;
                                *(void *)&block.st_mode = v319;
                                WORD2(block.st_ino) = 2080;
                                *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)"/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb";
                                _os_log_impl( (void *)&_mh_execute_header,  v320,  OS_LOG_TYPE_DEFAULT,  "write %@ to %s",  (uint8_t *)&block,  0x16u);
                              }

                              v321 = open("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb", 2561, 420LL);
                              if ((v321 & 0x80000000) != 0)
                              {
                                v326 = (void *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                {
                                  v380 = v326;
                                  v381 = __error();
                                  v382 = strerror(*v381);
                                  block.st_dev = 136315138;
                                  *(void *)&block.st_mode = v382;
                                  _os_log_error_impl( (void *)&_mh_execute_header,  v380,  OS_LOG_TYPE_ERROR,  "Failed to safely open file : %s",  (uint8_t *)&block,  0xCu);
                                }

                                v324 = 0LL;
                              }

                              else
                              {
                                *(void *)z_stream buf = 0LL;
                                v322 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v319,  100LL,  0LL,  buf));
                                v323 = *(id *)buf;
                                if (v323)
                                {
                                  v324 = v323;
                                  v325 = (void *)qword_100036568;
                                  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                  {
                                    v374 = v325;
                                    v375 = objc_claimAutoreleasedReturnValue([v324 description]);
                                    v376 = [v375 UTF8String];
                                    block.st_dev = 136315138;
                                    *(void *)&block.st_mode = v376;
                                    _os_log_error_impl( (void *)&_mh_execute_header,  v374,  OS_LOG_TYPE_ERROR,  "Failed to construct panic log breadcrumb: %s",  (uint8_t *)&block,  0xCu);
                                  }

                                  close(v321);
                                }

                                else
                                {
                                  v327 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v321,  0LL);
                                  *(void *)v536 = 0LL;
                                  -[NSFileHandle writeData:error:](v327, "writeData:error:", v322, v536);
                                  v324 = *(id *)v536;
                                  if (v324)
                                  {
                                    v328 = (void *)qword_100036568;
                                    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                    {
                                      v436 = v328;
                                      v437 = objc_claimAutoreleasedReturnValue([v324 description]);
                                      v438 = [v437 UTF8String];
                                      block.st_dev = 136315138;
                                      *(void *)&block.st_mode = v438;
                                      _os_log_error_impl( (void *)&_mh_execute_header,  v436,  OS_LOG_TYPE_ERROR,  "Faled to write panic log breadcrumb: %s",  (uint8_t *)&block,  0xCu);
                                    }
                                  }

                                  close(v321);
                                }
                              }

                              v329 = 0LL;
                              uint64_t j = 0LL;
                              v331 = 1;
                              do
                              {
                                v332 = v331;

                                v333 = -[UserCoreFileHandler initWithCoreFilePath::]( objc_alloc(&OBJC_CLASS___UserCoreFileHandler),  "initWithCoreFilePath::",  "launchd",  *((void *)&unk_100030CC8 + 4 * v329 + 2));
                                v334 = v333;
                                if (v333)
                                {
                                  uint64_t j = objc_claimAutoreleasedReturnValue( -[UserCoreFileHandler saveUserSpaceCoreToDisk:]( v333,  "saveUserSpaceCoreToDisk:",  Current));
                                  if (j)
                                  {
                                    [v500 addObject:j];
                                    v335 = (os_log_s *)(id)qword_100036568;
                                    if (os_log_type_enabled(v335, OS_LOG_TYPE_DEFAULT))
                                    {
                                      v336 = [(id) j UTF8String];
                                      block.st_dev = 136315138;
                                      *(void *)&block.st_mode = v336;
                                      _os_log_impl( (void *)&_mh_execute_header,  v335,  OS_LOG_TYPE_DEFAULT,  "ready to submit %s",  (uint8_t *)&block,  0xCu);
                                    }
                                  }
                                }

                                else
                                {
                                  uint64_t j = 0LL;
                                }

                                v331 = 0;
                                v329 = 1LL;
                              }

                              while ((v332 & 1) != 0);
                              v337 = v3;
                              if (creat("/var/run/com.apple.DumpPanic.finishedThisBoot", 0x100u) < 0)
                              {
                                v340 = __error();
                                v341 = (void *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                {
                                  v342 = *v340;
                                  v343 = v341;
                                  v344 = strerror(v342);
                                  block.st_dev = 136315394;
                                  *(void *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedThisBoot";
                                  WORD2(block.st_ino) = 2080;
                                  *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v344;
                                  _os_log_error_impl( (void *)&_mh_execute_header,  v343,  OS_LOG_TYPE_ERROR,  "failed to creat() DumpPanicDone cookie at path %s with error %s",  (uint8_t *)&block,  0x16u);
                                }
                              }

                              else
                              {
                                v338 = fopen("/var/run/com.apple.DumpPanic.finishedThisBoot", "w");
                                if (v338)
                                {
                                  v339 = v337;
                                  fwrite( -[os_log_s UTF8String](v339, "UTF8String"),  (size_t)-[os_log_s length](v339, "length"),  1uLL,  v338);
                                  fclose(v338);
                                }

                                else
                                {
                                  v345 = (os_log_s *)qword_100036568;
                                  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                  {
                                    block.st_dev = 136315138;
                                    *(void *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedThisBoot";
                                    _os_log_error_impl( (void *)&_mh_execute_header,  v345,  OS_LOG_TYPE_ERROR,  "Unable to open DumpPanicDone cookie at path: %s",  (uint8_t *)&block,  0xCu);
                                  }
                                }
                              }

                              if (v494) {
                                v346 = v3 == 0LL;
                              }
                              else {
                                v346 = 0;
                              }
                              if (v346)
                              {
                                v337 = v494;
                                v347 = v487;

                                v503 = v347;
                              }

                              v348 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                              v196 = v497;
                              v349 = v348;
                              v350 = @"864503";
                              if (v346) {
                                v350 = @"1111324";
                              }
                              if (v490) {
                                v351 = @"864502";
                              }
                              else {
                                v351 = v350;
                              }
                              [v348 addObject:v351];
                              if (!v337 && ![v500 count])
                              {
LABEL_661:
                                if (v196)
                                {
                                  v451 = objc_autoreleasePoolPush();
                                  v452 = objc_alloc(&OBJC_CLASS___KeyStore);
                                  v453 = -[ReadOnlyKeyStore init:](v452, "init:", qword_100036568);
                                  v454 = v453;
                                  if (v453 && [v453 unlock])
                                  {
                                    [v454 RotateKeys:sub_10000D69C];
                                  }

                                  else
                                  {
                                    v455 = (os_log_s *)(id)qword_100036568;
                                    if (os_log_type_enabled(v455, OS_LOG_TYPE_ERROR))
                                    {
                                      LOWORD(block.st_dev) = 0;
                                      _os_log_error_impl( (void *)&_mh_execute_header,  v455,  OS_LOG_TYPE_ERROR,  "Failed to unlock a keystore. Encryption not vailable.",  (uint8_t *)&block,  2u);
                                    }
                                  }

                                  objc_autoreleasePoolPop(v451);
                                }

                                sub_10000DD5C((id *)&v517);
                                uint64_t v4 = 0LL;
                                goto LABEL_670;
                              }

                              v352 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
                              if (v352)
                              {
                                v466 = _os_assert_log(v352, v353);
                                v449 = _os_crash(v466);
                                __break(1u);
                                goto LABEL_688;
                              }

                              v354 = v337;
                              v485 = (__CFString *)v503;
                              v355 = v500;
                              v496 = v349;
                              obuint64_t j = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                              if (v337) {
                                [obj addObject:v354];
                              }
                              if (v355) {
                                [obj addObjectsFromArray:v355];
                              }
                              v501 = (uint64_t)v355;
                              if (MGGetBoolAnswer(@"ExclaveCapability"))
                              {
                                v542 = 0u;
                                v543 = 0u;
                                memset(buf, 0, sizeof(buf));
                                v356 = (id)v501;
                                v357 = [v356 countByEnumeratingWithState:buf objects:&block count:16];
                                if (v357)
                                {
                                  v484 = v354;
                                  v358 = v337;
                                  v359 = v349;
                                  v360 = **(void **)&buf[16];
                                  while (2)
                                  {
                                    for (k = 0LL; k != v357; k = (char *)k + 1)
                                    {
                                      if (**(void **)&buf[16] != v360) {
                                        objc_enumerationMutation(v356);
                                      }
                                      if ([*(id *)(*(void *)&buf[8] + 8 * (void)k) rangeOfString:@"secure" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
                                      {
                                        v362 = 1;
                                        goto LABEL_544;
                                      }
                                    }

                                    v357 = [v356 countByEnumeratingWithState:buf objects:&block count:16];
                                    if (v357) {
                                      continue;
                                    }
                                    break;
                                  }

                                  v362 = 0;
LABEL_544:
                                  v349 = v359;
                                  v337 = v358;
                                  v354 = v484;
                                }

                                else
                                {
                                  v362 = 0;
                                }
                              }

                              else
                              {
                                v362 = 0;
                              }

                              if (sub_10000CF20())
                              {
                                v363 = (os_log_s *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl( (void *)&_mh_execute_header,  v363,  OS_LOG_TYPE_DEFAULT,  "Detected stress rack device, skipping prompting user for panic",  (uint8_t *)&block,  2u);
                                }

                                goto LABEL_660;
                              }

                              if (!objc_opt_class(&OBJC_CLASS___TapToRadarServiceSettings))
                              {
                                v367 = (os_log_s *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_error_impl( (void *)&_mh_execute_header,  v367,  OS_LOG_TYPE_ERROR,  "TapToRadarServiceSettings does not exist and thus we cannot start a radar",  (uint8_t *)&block,  2u);
                                }

                                goto LABEL_660;
                              }

                              v364 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
                              v483 = (void *)objc_claimAutoreleasedReturnValue([v364 serviceSettings]);

                              if ([v483 authorizationStatus] == (id)1)
                              {
                                v365 = (os_log_s *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v366 = "TapToRadarService reports the user has turned off DumpPanic prompts, skipping p"
                                         "rompting user for panic";
                                  goto LABEL_565;
                                }

                                goto LABEL_659;
                              }

                              v368 = @"Your device has recovered from a panic";
                              if (v346) {
                                v368 = @"Your device has rebooted after an unexpected reset";
                              }
                              if (v490) {
                                v369 = @"Your device has rebooted after a force reset";
                              }
                              else {
                                v369 = (__CFString *)v368;
                              }
                              v370 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
                              v371 = [v370 BOOLForKey:@"skipTTR"];

                              if (v371)
                              {
                                v365 = (os_log_s *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v366 = "skipping launching TTR because of user defaults...";
LABEL_565:
                                  _os_log_impl( (void *)&_mh_execute_header,  v365,  OS_LOG_TYPE_DEFAULT,  v366,  (uint8_t *)&block,  2u);
                                }

LABEL_659:
LABEL_660:
                                v449 = pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0);
                                v196 = v497;
                                if (!v449) {
                                  goto LABEL_661;
                                }
LABEL_688:
                                v467 = _os_assert_log(v449, v450);
                                _os_crash(v467);
                                __break(1u);
LABEL_689:
                                dispatch_once(&qword_100036530, &stru_100030BE0);
                                continue;
                              }

                              break;
                            }

                            v372 = [v483 authorizationStatus];
                            if (v362) {
                              v373 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"Select 'OK' to start a new draft in Tap-to-Radar on a nearby iOS or macOS device." stringByAppendingFormat:@"\n%@", @"[Warning: The attachments may contain privacy-sensitive sensor data.]"]);
                            }
                            else {
                              v373 = @"Select 'OK' to start a new draft in Tap-to-Radar on a nearby iOS or macOS device.";
                            }
                            if (MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 7)
                            {
                              if (v372 == (id)2)
                              {
                                v402 = (os_log_s *)qword_100036568;
                                if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v403 = "skipping launching TTR because DumpPanic is currently rate limited...";
                                  goto LABEL_646;
                                }

                                goto LABEL_658;
                              }
                            }

                            else if (!sub_10000C804(v369, v373))
                            {
                              v402 = (os_log_s *)qword_100036568;
                              if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
                              {
                                LOWORD(block.st_dev) = 0;
                                v403 = "skipping launching TTR...";
LABEL_646:
                                _os_log_impl( (void *)&_mh_execute_header,  v402,  OS_LOG_TYPE_DEFAULT,  v403,  (uint8_t *)&block,  2u);
                              }

LABEL_658:
                              goto LABEL_659;
                            }

                            v482 = v373;
                            if ((v490 & 1) != 0)
                            {
                              v404 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager defaultManager]( &OBJC_CLASS___NSFileManager,  "defaultManager"));
                              *(void *)v536 = 0LL;
                              v492 = (void *)objc_claimAutoreleasedReturnValue( [v404 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" error:v536]);
                              v481 = *(id *)v536;
                              if (!v481)
                              {
                                v542 = 0u;
                                v543 = 0u;
                                memset(buf, 0, sizeof(buf));
                                v405 = v492;
                                v406 = [v405 countByEnumeratingWithState:buf objects:&block count:16];
                                v480 = v404;
                                if (v406)
                                {
                                  v407 = **(void **)&buf[16];
                                  do
                                  {
                                    for (m = 0LL; m != v406; m = (char *)m + 1)
                                    {
                                      if (**(void **)&buf[16] != v407) {
                                        objc_enumerationMutation(v405);
                                      }
                                      v409 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" stringByAppendingPathComponent:*(void *)(*(void *)&buf[8] + 8 * (void)m)]);
                                      [obj addObject:v409];
                                    }

                                    v406 = [v405 countByEnumeratingWithState:buf objects:&block count:16];
                                  }

                                  while (v406);
                                }

                                v404 = v480;
                              }

                              v410 = (void *)objc_claimAutoreleasedReturnValue([obj componentsJoinedByString:@"\n"]);
                              __int128 v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"I force reset my device while …\n\nExpected attachments:\n (sysdiagnose)\n%@",  v410));

                              v411 = @"1028387";
                              v412 = @"Triage";
                              v413 = @"Force Resets";
                              uint64_t v74 = @"device force reset";
                              v414 = @"it rebooted after a force reset";
                            }

                            else
                            {
                              if (v346) {
                                v414 = @"it rebooted after an unexpected reset";
                              }
                              else {
                                v414 = @"it recovered from a panic";
                              }
                              if (v346) {
                                uint64_t v74 = @"device unexpected reset";
                              }
                              else {
                                uint64_t v74 = @"device panic";
                              }
                              v442 = objc_claimAutoreleasedReturnValue([obj componentsJoinedByString:@"\n"]);
                              v443 = (void *)v442;
                              v444 = @"No panic log found";
                              if (v485) {
                                v444 = v485;
                              }
                              if (v346) {
                                v445 = @"My device unexpectedly reset while …\n\n%@\n\nExpected attachments:\n (sysdiagnose)\n%@";
                              }
                              else {
                                v445 = @"My device panicked while …\n\n%@\n\nExpected attachments:\n (sysdiagnose)\n%@";
                              }
                              __int128 v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v445,  v444,  v442));

                              if (v346)
                              {
                                v411 = @"1176064";
                                v412 = @"Triage";
                                v413 = @"Unexpected Resets";
                              }

                              else
                              {
LABEL_656:
                                v411 = @"609970";
                                v412 = @"iOS";
                                v413 = @"Panic Triage";
                              }
                            }

                            sub_10000CA88(v414, v74, v105, v413, v412, v411, obj, v496);

                            v373 = v482;
                            goto LABEL_658;
                          }

                          continue;
                        }

                        goto LABEL_259;
                      }
                    }

                    if (!v162) {
                      goto LABEL_231;
                    }
                    block.st_dev = 134217984;
                    *(void *)&block.st_mode = v160;
                    uint64_t v163 = "%llu bytes were read from the file or device, but it did not contain any paniclog data (buffe"
                           "r was all zeros).";
                    uint64_t v164 = (os_log_s *)v161;
                    v165 = 12;
                  }

                  else
                  {
                    v166 = qword_100036568;
                    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_231;
                    }
                    LOWORD(block.st_dev) = 0;
                    uint64_t v163 = "No data was read from the file or device (buffer length was zero).";
                    uint64_t v164 = (os_log_s *)v166;
                    v165 = 2;
                  }

LABEL_230:
                  _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, v163, (uint8_t *)&block, v165);
                  goto LABEL_231;
                }

                *(void *)z_stream buf = 0LL;
                *(void *)&buf[8] = LODWORD(properties[0]);
                *(void *)v536 = buf;
                *(void *)&v536[8] = 1LL;
                if (!ioctl(v141, 0x8010641FuLL, v536)) {
                  goto LABEL_651;
                }
                __int128 v107 = qword_100036568;
                if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_651;
                }
LABEL_691:
                v469 = (os_log_s *)(id)v107;
                v470 = *__error();
                v471 = __error();
                v472 = strerror(*v471);
                block.st_dev = 67109378;
                *(_DWORD *)&block.st_mode = v470;
                LOWORD(block.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&block.st_ino + 2) = (__darwin_ino64_t)v472;
                _os_log_error_impl( (void *)&_mh_execute_header,  v469,  OS_LOG_TYPE_ERROR,  "Failed to unlink panic data -- DKIOCUNMAP failed with %d : %s",  (uint8_t *)&block,  0x12u);

LABEL_577:
                unsigned int v262 = (void *)v62;
                goto LABEL_651;
              }

              v394 = (void *)qword_100036568;
              if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_651;
              }
              v395 = v394;
              v396 = *__error();
              block.st_dev = 134218754;
              *(void *)&block.st_mode = v264;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = 2359296LL;
              HIWORD(block.st_gid) = 2112;
              *(void *)&block.st_rdev = v74;
              LOWORD(block.st_atimespec.tv_sec) = 1024;
              *(_DWORD *)((char *)&block.st_atimespec.tv_sec + 2) = v396;
              _os_log_impl( (void *)&_mh_execute_header,  v395,  OS_LOG_TYPE_DEFAULT,  "Unexpected pread result (%zd of %zu bytes) of panic data (%@): errno %d",  (uint8_t *)&block,  0x26u);

              goto LABEL_577;
            }

LABEL_698:
            v479 = _os_assert_log(v255, v256);
            PanicLogData = _os_crash(v479);
            __break(1u);
LABEL_699:
            switch(PanicLogData)
            {
              case 1:
                _os_crash("AppleNVMeReadPanicLogData could not find panic log namespace service in registry.");
                __break(1u);
                return result;
              case 2:
                goto LABEL_708;
              case 3:
                goto LABEL_709;
              case 4:
                goto LABEL_710;
              case 5:
                goto LABEL_711;
              case 6:
                goto LABEL_712;
              case 7:
                goto LABEL_713;
              default:
                goto LABEL_707;
            }
          }

          CFRelease(properties[0]);
          IOObjectRelease(v152);
        }
      }

      v155 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 134217984;
        *(void *)&block.st_mode = v149;
        _os_log_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_DEFAULT,  "searching IORegistry again after %lds sleep",  (uint8_t *)&block,  0xCu);
      }

      sleep(v149);
      v149 *= 2LL;
      if (v149 > v148)
      {
        v132 = &unk_100036000;
        goto LABEL_214;
      }
    }
  }

  Size = AppleNVMePanicLogGetSize(&block);
  if (!Size)
  {
    if (*(void *)&block.st_dev <= 0x240000uLL) {
      v141 = 2359296LL;
    }
    else {
      v141 = *(void *)&block.st_dev;
    }
    v524[0] = 0LL;
    int v142 = valloc(v141);
    if (!v142)
    {
      v468 = _os_assert_log(0LL, v143);
      _os_crash(v468);
      __break(1u);
      goto LABEL_691;
    }

    v144 = v142;
    bzero(v142, v141);
    PanicLogData = AppleNVMeReadPanicLogData(0LL, v144, v141, v524);
    if (!PanicLogData)
    {
      int v146 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 134217984;
        *(id *)&block.st_mode = v524[0];
        _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_DEFAULT,  "AppleNVMeReadPanicLogData successfully extracted %llu bytes of data.",  (uint8_t *)&block,  0xCu);
      }

      goto LABEL_217;
    }

    goto LABEL_699;
  }

  switch(Size)
  {
    case 1:
      _os_crash("AppleNVMePanicLogGetSize could not find panic log namespace service in registry.");
      __break(1u);
      goto LABEL_703;
    case 2:
LABEL_703:
      _os_crash("AppleNVMePanicLogGetSize could not connect to panic log namespace service.");
      __break(1u);
      goto LABEL_704;
    case 3:
LABEL_704:
      _os_crash("AppleNVMePanicLogGetSize failed to query panic log namespace size.");
      __break(1u);
      goto LABEL_705;
    case 6:
LABEL_705:
      _os_crash("AppleNVMePanicLogGetSize received an invalid argument.");
      __break(1u);
      goto LABEL_706;
    case 7:
LABEL_706:
      _os_crash("AppleNVMePanicLogGetSize suffered from an internal error.");
      __break(1u);
LABEL_707:
      _os_crash("AppleNVMeReadPanicLogData suffered from an unknown error.");
      __break(1u);
LABEL_708:
      _os_crash("AppleNVMeReadPanicLogData could not connect to panic log namespace service.");
      __break(1u);
LABEL_709:
      _os_crash("AppleNVMeReadPanicLogData failed to query panic log namespace size.");
      __break(1u);
LABEL_710:
      _os_crash("AppleNVMeReadPanicLogData failed to read data from panic log namespace.");
      __break(1u);
LABEL_711:
      _os_crash("AppleNVMeReadPanicLogData failed to unmap data from panic log namespace.");
      __break(1u);
LABEL_712:
      _os_crash("AppleNVMeReadPanicLogData received an invalid argument.");
      __break(1u);
LABEL_713:
      _os_crash("AppleNVMeReadPanicLogData suffered from an internal error.");
      __break(1u);
      break;
    default:
      break;
  }

  _os_crash("AppleNVMePanicLogGetSize suffered from an unknown error.");
  __break(1u);
LABEL_715:
  uint64_t result = _os_crash("invalid reset type");
  __break(1u);
  return result;
}

void sub_100020A30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, id a49)
{
}

void sub_100020C70(id a1)
{
  size_t v5 = 37LL;
  if (sysctlbyname("kern.bootsessionuuid", v6, &v5, 0LL, 0LL))
  {
    id v1 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Failed to get kern.bootsessionuuid", v4, 2u);
    }
  }

  else
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v6, 4LL));
    os_log_t v3 = (void *)qword_100036558;
    qword_100036558 = v2;
  }

LABEL_34:
      goto LABEL_41;
    }

    id v37 = 1;
    -[PanicReport processExtPaniclogFlags:data_id:data:additionalBuffers:addToExtPaniclog:]( self,  "processExtPaniclogFlags:data_id:data:additionalBuffers:addToExtPaniclog:",  v15,  v19,  v25,  v36,  &v37);
    if (!v37) {
      goto LABEL_22;
    }
    os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v19,  @"Data ID",  v25,  @"Data",  0LL));
    if (!v26) {
      break;
    }
    id v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v35, "objectForKey:", v33));
    if (!v27)
    {
      id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if (!v27)
      {
        __int16 v32 = (os_log_s *)qword_100036568;
        if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)z_stream buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to create array", buf, 2u);
        }

        goto LABEL_40;
      }

      -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v27, v33);
    }

    -[NSMutableArray addObject:](v27, "addObject:", v26);

LABEL_22:
    BOOL v12 = v22 + v23;
    if (!--v7) {
      goto LABEL_41;
    }
  }

  unint64_t v31 = (os_log_s *)qword_100036568;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)z_stream buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Unable to create Data ID and Data dict",  buf,  2u);
  }

LABEL_40:
LABEL_41:
  if (-[NSMutableDictionary count](v35, "count")) {
    -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v35, @"extPaniclogData");
  }
  if (-[NSMutableDictionary count](v36, "count")) {
    -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v36, @"additionalData");
  }
  if (-[NSMutableDictionary count](v34, "count"))
  {
    uint64_t v10 = v34;
    goto LABEL_9;
  }

LABEL_8:
  uint64_t v10 = 0LL;
LABEL_9:

  return v10;
}

void sub_10002258C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 buf)
{
  if (a2 == 1)
  {
    id v19 = objc_begin_catch(a1);
    uint64_t v20 = (os_log_s *)(id)qword_100036568;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      CFTypeID v22 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v21 = (os_log_s *)(id)qword_100036568;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 reason]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Reason: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100022474LL);
  }

  _Unwind_Resume(a1);
}

id sub_100023358(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  os_log_t v3 = @"type";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

NSDictionary *__cdecl sub_1000233C8(id a1)
{
  return (NSDictionary *)&off_100033940;
}

id objc_msgSend_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:");
}

id objc_msgSend_initWithPanicString_otherString_buildVersion_panicFlags_panicType_incidentID_rootsInstalled_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:");
}

id objc_msgSend_saveCoreDumpAtOffset_withLength_named_encryptedWithPublicKey_toFileName_flags_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}