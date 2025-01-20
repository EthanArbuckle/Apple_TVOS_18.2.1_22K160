@interface PallasResponseVerifier
+ (id)CopyDataFromEncodedBase64:(id)a3 range:(_NSRange)a4;
+ (int64_t)verifyReceipt:(id)a3 withSignature:(id)a4;
+ (void)base64DecodeString:(const char *)a3 toBuffer:(char *)a4 length:(unint64_t *)a5;
- (BOOL)determineAlg:(id)a3;
- (BOOL)verifyCerts:(id)a3 error:(id *)a4;
- (BOOL)verifyResponse:(id)a3 signature:(id)a4 error:(id *)a5;
- (PallasResponseVerifier)init;
- (__CFString)keyAlg;
- (__SecKey)leafPublicKey;
- (double)issuanceDate;
@end

@implementation PallasResponseVerifier

- (PallasResponseVerifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PallasResponseVerifier;
  result = -[PallasResponseVerifier init](&v3, "init");
  if (result)
  {
    result->_issuanceDate = 0.0;
    result->_leafPublicKey = 0LL;
  }

  return result;
}

- (BOOL)determineAlg:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ES256"])
  {
    v5 = (__CFString **)&kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
  }

  else
  {
    if (![v4 isEqualToString:@"ES384"])
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }

    v5 = (__CFString **)&kSecKeyAlgorithmECDSASignatureMessageX962SHA384;
  }

  self->_keyAlg = *v5;
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

- (BOOL)verifyCerts:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  id v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  SecTrustRef trust = 0LL;
  SecTrustResultType result = kSecTrustResultInvalid;
  CFErrorRef error = 0LL;
  ApplePinned = (const void *)SecPolicyCreateApplePinned( @"PallasResponse",  @"1.2.840.113635.100.6.2.17",  @"1.2.840.113635.100.6.53");
  if (!ApplePinned)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[PallasResponseVerifier verifyCerts:error:]",  @"Unable to determine pallas policy",  v6,  v7,  v8,  v9,  v29);
    BOOL v15 = 0;
    goto LABEL_7;
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = __44__PallasResponseVerifier_verifyCerts_error___block_invoke;
  v30[3] = &unk_34E728;
  v30[4] = self;
  v30[5] = &v34;
  [v5 enumerateObjectsUsingBlock:v30];
  if (SecTrustCreateWithCertificates((CFTypeRef)v35[5], ApplePinned, &trust))
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[PallasResponseVerifier verifyCerts:error:]",  @"Unable to create trust with provided certs",  v11,  v12,  v13,  v14,  v29);
    BOOL v15 = 0;
  }

  else if (SecTrustEvaluateWithError(trust, &error))
  {
    if (error)
    {
      CFRelease(error);
      CFErrorRef error = 0LL;
    }

    OSStatus TrustResult = SecTrustGetTrustResult(trust, &result);
    if (TrustResult)
    {
      uint64_t v26 = TrustResult;
      v27 = @"Trust result is failure. Unable to get trust result: %ld";
    }

    else
    {
      uint64_t v26 = result;
      if (result == kSecTrustResultUnspecified || result == kSecTrustResultProceed)
      {
        leafPublicKey = self->_leafPublicKey;
        if (leafPublicKey)
        {
          CFRelease(leafPublicKey);
          self->_leafPublicKey = 0LL;
        }

        self->_leafPublicKey = SecTrustCopyPublicKey(trust);
        BOOL v15 = 1;
        goto LABEL_4;
      }

      v27 = @"Trust result is failure. Trust result value: %ld";
    }

    _MobileAssetLog(0LL, 3, (uint64_t)"-[PallasResponseVerifier verifyCerts:error:]", v27, v22, v23, v24, v25, v26);
    BOOL v15 = 0;
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[PallasResponseVerifier verifyCerts:error:]",  @"Trust result is failure. Unable to verify certificates are trusted. Error: %@",  v17,  v18,  v19,  v20,  (uint64_t)error);
    if (error)
    {
      CFRelease(error);
      BOOL v15 = 0;
      CFErrorRef error = 0LL;
    }

    else
    {
      BOOL v15 = 0;
    }
  }

void __44__PallasResponseVerifier_verifyCerts_error___block_invoke( uint64_t a1,  const __CFData *a2,  uint64_t a3)
{
  SecCertificateRef v5 = SecCertificateCreateWithData(0LL, a2);
  if (v5)
  {
    SecCertificateRef v10 = v5;
    if (!a3) {
      *(double *)(*(void *)(a1 + 32) + 8LL) = SecCertificateNotValidBefore(v5);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
    CFRelease(v10);
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[PallasResponseVerifier verifyCerts:error:]_block_invoke",  @"No cert able to be determined at index: %lu",  v6,  v7,  v8,  v9,  a3);
  }

- (BOOL)verifyResponse:(id)a3 signature:(id)a4 error:(id *)a5
{
  uint64_t v7 = (const __CFData *)a3;
  uint64_t v8 = (const __CFData *)a4;
  leafPublicKey = self->_leafPublicKey;
  BOOL v10 = leafPublicKey && !SecKeyVerifySignature(leafPublicKey, self->_keyAlg, v7, v8, 0LL);

  return v10;
}

+ (void)base64DecodeString:(const char *)a3 toBuffer:(char *)a4 length:(unint64_t *)a5
{
  *a5 = 0LL;
  int v5 = index_table[*a3];
  if ((v5 & 0x80000000) == 0)
  {
    *a5 = 1LL;
    char v6 = 4 * v5;
    *a4 = v6;
    uint64_t v7 = a3[1];
    if (v7 != 61)
    {
      unsigned int v8 = index_table[v7];
      if ((v8 & 0x80000000) == 0)
      {
        *a4 = (v8 >> 4) & 3 | v6;
        a4[1] = 16 * v8;
        uint64_t v9 = a3[2];
        if (v9 != 61)
        {
          unsigned int v10 = index_table[v9];
          if ((v10 & 0x80000000) == 0)
          {
            *a5 = 2LL;
            a4[1] |= (v10 >> 2) & 0xF;
            a4[2] = (_BYTE)v10 << 6;
            uint64_t v11 = a3[3];
            if (v11 != 61)
            {
              int v12 = index_table[v11];
              if ((v12 & 0x80000000) == 0)
              {
                *a5 = 3LL;
                a4[2] |= v12 & 0x3F;
              }
            }
          }
        }
      }
    }
  }

+ (id)CopyDataFromEncodedBase64:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  uint64_t v11 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v12 = @"{CopyDataFromEncodedBase64} Invalid range";
LABEL_6:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[PallasResponseVerifier CopyDataFromEncodedBase64:range:]",  v12,  v7,  v8,  v9,  v10,  v27);
    uint64_t v13 = 0LL;
    goto LABEL_22;
  }

  if (!length)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[PallasResponseVerifier CopyDataFromEncodedBase64:range:]",  @"{CopyDataFromEncodedBase64} range is 0",  v7,  v8,  v9,  v10,  v27);
    uint64_t v13 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    goto LABEL_22;
  }

  if (location + length > (unint64_t)[v6 length])
  {
    int v12 = @"{CopyDataFromEncodedBase64} range larger than data length";
    goto LABEL_6;
  }

  v28 = (char *)[v11 bytes] + location;
  uint64_t v14 = 3 * (length >> 2);
  uint64_t v15 = (length & 3) - 1 < 2;
  if ((length & 3) == 3) {
    uint64_t v15 = 2LL;
  }
  uint64_t v13 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v14 + v15);
  v16 = -[NSMutableData mutableBytes](v13, "mutableBytes");
  uint64_t v17 = v16;
  if (length >= 4)
  {
    if (length >> 2 <= 1) {
      uint64_t v18 = 1LL;
    }
    else {
      uint64_t v18 = length >> 2;
    }
    uint64_t v19 = v28;
    uint64_t v20 = v16;
    while (1)
    {
      uint64_t v30 = 0LL;
      +[PallasResponseVerifier base64DecodeString:toBuffer:length:]( &OBJC_CLASS___PallasResponseVerifier,  "base64DecodeString:toBuffer:length:",  v19,  v20,  &v30);
      if (v30 != 3) {
        break;
      }
      v20 += 3;
      v19 += 4;
      if (!--v18) {
        goto LABEL_17;
      }
    }

    -[NSMutableData setLength:](v13, "setLength:", 0LL);
    uint64_t v25 = @"{CopyDataFromEncodedBase64} decode error, decoded data size is not 3";
    goto LABEL_21;
  }

+ (int64_t)verifyReceipt:(id)a3 withSignature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v26 = 0LL;
  uint64_t AppleAssetReceipt = SecPolicyCreateAppleAssetReceipt();
  if (AppleAssetReceipt)
  {
    int v12 = (const void *)AppleAssetReceipt;
    uint64_t v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v6,  0LL);
    if (v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:10]);
      if (v18)
      {
        int v19 = SecCMSVerifyCopyDataAndAttributes(v17, v18, v12, 0LL, 0LL, &v26);
        if (v19)
        {
          uint64_t v20 = v19;
          _MobileAssetLog( 0LL,  6,  (uint64_t)"+[PallasResponseVerifier verifyReceipt:withSignature:]",  @"validate status failure: %ld",  v13,  v14,  v15,  v16,  v19);
          id v21 = 0LL;
          uint64_t v22 = 0LL;
        }

        else
        {
          id v21 = v26;
          if (v26)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:kSecCMSExpirationDate]);
            if (v22)
            {
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.0));
              id v25 = [v22 compare:v24];

              if (v25 != (id)-1LL)
              {
                uint64_t v20 = 0LL;
                goto LABEL_10;
              }

              uint64_t v20 = 101LL;
            }

            else
            {
              uint64_t v20 = 13LL;
            }
          }

          else
          {
            uint64_t v22 = 0LL;
            uint64_t v20 = 12LL;
          }
        }
      }

      else
      {
        id v21 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v20 = 11LL;
      }
    }

    else
    {
      uint64_t v18 = 0LL;
      id v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v20 = 10LL;
    }

    _MobileAssetLog( 0LL,  5,  (uint64_t)"+[PallasResponseVerifier verifyReceipt:withSignature:]",  @"MobileAsset verifyReceipt error: %ld",  v13,  v14,  v15,  v16,  v20);
LABEL_10:
    CFRelease(v12);

    goto LABEL_11;
  }

  uint64_t v20 = 9LL;
  _MobileAssetLog( 0LL,  5,  (uint64_t)"+[PallasResponseVerifier verifyReceipt:withSignature:]",  @"MobileAsset verifyReceipt error: %ld",  v8,  v9,  v10,  v11,  9LL);
LABEL_11:

  return v20;
}

- (double)issuanceDate
{
  return self->_issuanceDate;
}

- (__SecKey)leafPublicKey
{
  return self->_leafPublicKey;
}

- (__CFString)keyAlg
{
  return self->_keyAlg;
}

@end