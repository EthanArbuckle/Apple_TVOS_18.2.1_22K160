@interface SFIESOperation
@end

@implementation SFIESOperation

_SFIESCiphertext *__41___SFIESOperation_encrypt_withKey_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
    v6 = 0LL;
  }

  else
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v8 + 40);
    v6 = (_SFIESCiphertext *)[v7 _ccDigestInfoWithError:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    if (v6)
    {
      ccaes_gcm_encrypt_mode();
      ccecies_encrypt_gcm_setup();
      [*(id *)(a1 + 40) length];
      size_t v9 = ccecies_encrypt_gcm_ciphertext_size();
      v10 = malloc(v9);
      v11 = malloc(__size);
      size_t v12 = ccecies_pub_key_size();
      v13 = malloc(v12);
      [*(id *)(a1 + 40) bytes];
      if (ccecies_encrypt_gcm_composite())
      {
        free(v10);
        free(v11);
        free(v13);
        uint64_t v14 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"SFCryptoServicesErrorDomain",  2,  0,  0,  0,  0);
        v6 = 0LL;
        uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
        v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }

      else
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F48]), "initWithBytes:length:", v10, v9, 0, 0, 0);
        v17 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v11 length:__size];
        v18 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v13 length:v12];
        free(v10);
        free(v11);
        free(v13);
        v19 = objc_alloc(&OBJC_CLASS____SFIESCiphertext);
        v20 = objc_alloc(&OBJC_CLASS____SFECPublicKey);
        [*(id *)(a1 + 48) keySpecifier];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[_SFPublicKey initWithData:specifier:error:](v20, "initWithData:specifier:error:", v18, v21, 0LL);
        v6 = -[_SFIESCiphertext initWithCiphertext:ephemeralSenderPublicKey:authenticationCode:]( v19,  "initWithCiphertext:ephemeralSenderPublicKey:authenticationCode:",  v16,  v22,  v17);
      }
    }
  }

  return v6;
}

id __41___SFIESOperation_decrypt_withKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
LABEL_3:
    v6 = 0LL;
    goto LABEL_9;
  }

  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v7 _ccDigestInfoWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (!v9) {
    goto LABEL_3;
  }
  [*(id *)(a1 + 40) ciphertext];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) authenticationCode];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) ephemeralSenderPublicKey];
  size_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 keyData];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  size_t v14 = [v10 length];
  ccaes_gcm_decrypt_mode();
  [v11 length];
  ccecies_decrypt_gcm_setup();
  uint64_t v15 = ccecies_decrypt_gcm_plaintext_size();
  v16 = malloc(v14);
  id v17 = v10;
  uint64_t v18 = [v17 bytes];
  id v19 = v13;
  uint64_t v20 = [v19 bytes];
  id v21 = v11;
  uint64_t v26 = [v21 bytes];
  if (ccecies_decrypt_gcm_composite())
  {
    free(v16);
    uint64_t v22 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"SFCryptoServicesErrorDomain",  3,  0,  v18,  v20,  v26);
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    v6 = 0LL;
  }

  else
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v16, v15, v18, v20, v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(v16);
  }

LABEL_9:
  return v6;
}

@end