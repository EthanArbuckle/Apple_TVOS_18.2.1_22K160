@interface ICDMusicUserSocialProfileRequestContext
- (BOOL)isEqual:(id)a3;
- (ICDMusicUserSocialProfileRequestContext)initWithStoreRequestContext:(id)a3 subscriptionStatus:(id)a4;
- (ICMusicSubscriptionStatus)subscriptionStatus;
- (ICStoreRequestContext)storeRequestContext;
- (NSString)cacheKey;
- (NSString)hashedDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation ICDMusicUserSocialProfileRequestContext

- (ICDMusicUserSocialProfileRequestContext)initWithStoreRequestContext:(id)a3 subscriptionStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v151.receiver = self;
  v151.super_class = (Class)&OBJC_CLASS___ICDMusicUserSocialProfileRequestContext;
  v8 = -[ICDMusicUserSocialProfileRequestContext init](&v151, "init");
  if (v8)
  {
    v9 = (ICStoreRequestContext *)[v6 copy];
    storeRequestContext = v8->_storeRequestContext;
    v8->_storeRequestContext = v9;

    objc_storeStrong((id *)&v8->_subscriptionStatus, a4);
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[ICStoreRequestContext identity](v8->_storeRequestContext, "identity"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v150 accountDSID]);
    memset(&v153, 0, sizeof(v153));
    uint64_t v152 = 4001LL;
    CC_SHA1_Init((CC_SHA1_CTX *)&v153);
    id v12 = v11;
    v13 = [v12 UTF8String];
    size_t v14 = (size_t)[v12 length];
    int v15 = v14;
    v16 = &OBJC_CLASS___MSVAutoBugCapture_ptr;
    if (v152 > 3999)
    {
      if (v152 > 4255)
      {
        if (v152 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)&v153, v13, v14);
        }

        else if (v152 == 4512)
        {
          CC_SHA512_Update(&v153, v13, v14);
        }
      }

      else if (v152 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)&v153, v13, v14);
      }

      else if (v152 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)&v153, v13, v14);
      }
    }

    else
    {
      if (v152 <= 2999)
      {
        if (v152)
        {
          if (v152 == 2000)
          {
            int v17 = (((v14 + BYTE3(v153.count[1])) & 3) - BYTE3(v153.count[1]));
            v18 = (char *)&v153.hash[-1] + BYTE3(v153.count[1]);
            switch(v17)
            {
              case 0:
                break;
              case 1:
                _BYTE *v18 = *v13;
                break;
              case 2:
                __int16 v38 = *(_WORD *)v13;
                goto LABEL_53;
              case 3:
                __int16 v38 = *(_WORD *)v13;
                *((_BYTE *)&v153.count[1] + BYTE3(v153.count[1]) + 2) = v13[2];
LABEL_53:
                *(_WORD *)v18 = v38;
                break;
              default:
                memcpy(v18, v13, (((v15 + BYTE3(v153.count[1])) & 3) - BYTE3(v153.count[1])));
                break;
            }

            HIDWORD(v153.count[0]) += v15;
          }
        }

        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)"));
          [v20 handleFailureInFunction:v21 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }

        goto LABEL_55;
      }

      if (v152 == 3000)
      {
        if (!v13) {
          goto LABEL_55;
        }
        BOOL v23 = v14 > 0xF || (LODWORD(v153.count[0]) + v14) > 0xF;
        LODWORD(v153.count[0]) += v14;
        HIDWORD(v153.count[0]) |= v23;
        if (v14 + LODWORD(v153.hash[3]) > 0xF)
        {
          v30 = &v13[v14];
          if (LODWORD(v153.hash[3]))
          {
            memcpy((char *)&v153.wbuf[-7] + LODWORD(v153.hash[3]), v13, (16 - LODWORD(v153.hash[3])));
            HIDWORD(v31) = LODWORD(v153.count[1]) - 2048144777 * LODWORD(v153.hash[1]);
            LODWORD(v31) = HIDWORD(v31);
            int v32 = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = HIDWORD(v153.count[1]) - 2048144777 * HIDWORD(v153.hash[1]);
            LODWORD(v31) = HIDWORD(v31);
            LODWORD(v153.count[1]) = v32;
            HIDWORD(v153.count[1]) = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = LODWORD(v153.hash[0]) - 2048144777 * LODWORD(v153.hash[2]);
            LODWORD(v31) = HIDWORD(v31);
            LODWORD(v153.hash[0]) = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = HIDWORD(v153.hash[0]) - 2048144777 * HIDWORD(v153.hash[2]);
            LODWORD(v31) = HIDWORD(v31);
            v13 += (16 - LODWORD(v153.hash[3]));
            HIDWORD(v153.hash[0]) = -1640531535 * (v31 >> 19);
            LODWORD(v153.hash[3]) = 0;
          }

          if (v13 <= v30 - 16)
          {
            unsigned int v33 = v153.count[1];
            unsigned int v34 = HIDWORD(v153.count[1]);
            unsigned int v35 = v153.hash[0];
            unsigned int v36 = HIDWORD(v153.hash[0]);
            do
            {
              HIDWORD(v37) = v33 - 2048144777 * *(_DWORD *)v13;
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v33 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v34 - 2048144777 * *((_DWORD *)v13 + 1);
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v34 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v35 - 2048144777 * *((_DWORD *)v13 + 2);
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v35 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v36 - 2048144777 * *((_DWORD *)v13 + 3);
              LODWORD(v37) = HIDWORD(v37);
              unsigned int v36 = -1640531535 * (v37 >> 19);
              v13 += 16;
            }

            while (v13 <= v30 - 16);
            v153.count[1] = __PAIR64__(v34, v33);
            v153.hash[0] = __PAIR64__(v36, v35);
          }

          v16 = &OBJC_CLASS___MSVAutoBugCapture_ptr;
          if (v13 >= v30) {
            goto LABEL_55;
          }
          int v24 = (_DWORD)v30 - (_DWORD)v13;
          __memcpy_chk(&v153.hash[1], v13, v30 - v13, 184LL);
        }

        else
        {
          memcpy((char *)&v153.wbuf[-7] + LODWORD(v153.hash[3]), v13, v14);
          int v24 = LODWORD(v153.hash[3]) + v15;
        }

        LODWORD(v153.hash[3]) = v24;
        goto LABEL_55;
      }

      if (v152 != 3001 || !v13) {
        goto LABEL_55;
      }
      v153.count[0] += v14;
      if (v14 + LODWORD(v153.hash[7]) <= 0x1F)
      {
        memcpy((char *)&v153.wbuf[-5] + LODWORD(v153.hash[7]), v13, v14);
        int v19 = LODWORD(v153.hash[7]) + v15;
LABEL_40:
        LODWORD(v153.hash[7]) = v19;
        goto LABEL_55;
      }

      unint64_t v25 = (unint64_t)&v13[v14];
      if (LODWORD(v153.hash[7]))
      {
        memcpy((char *)&v153.wbuf[-5] + LODWORD(v153.hash[7]), v13, (32 - LODWORD(v153.hash[7])));
        v153.count[1] = 0x9E3779B185EBCA87LL * __ROR8__(v153.count[1] - 0x3D4D51C2D82B14B1LL * v153.hash[3], 33);
        v153.hash[0] = 0x9E3779B185EBCA87LL * __ROR8__(v153.hash[0] - 0x3D4D51C2D82B14B1LL * v153.hash[4], 33);
        v153.hash[1] = 0x9E3779B185EBCA87LL * __ROR8__(v153.hash[1] - 0x3D4D51C2D82B14B1LL * v153.hash[5], 33);
        v153.hash[2] = 0x9E3779B185EBCA87LL * __ROR8__(v153.hash[2] - 0x3D4D51C2D82B14B1LL * v153.hash[6], 33);
        v13 += (32 - LODWORD(v153.hash[7]));
        LODWORD(v153.hash[7]) = 0;
      }

      if ((unint64_t)(v13 + 32) <= v25)
      {
        unint64_t v26 = v153.count[1];
        unint64_t v28 = v153.hash[1];
        unint64_t v29 = v153.hash[0];
        unint64_t v27 = v153.hash[2];
        do
        {
          unint64_t v26 = 0x9E3779B185EBCA87LL * __ROR8__(v26 - 0x3D4D51C2D82B14B1LL * *(void *)v13, 33);
          unint64_t v29 = 0x9E3779B185EBCA87LL * __ROR8__(v29 - 0x3D4D51C2D82B14B1LL * *((void *)v13 + 1), 33);
          unint64_t v28 = 0x9E3779B185EBCA87LL * __ROR8__(v28 - 0x3D4D51C2D82B14B1LL * *((void *)v13 + 2), 33);
          unint64_t v27 = 0x9E3779B185EBCA87LL * __ROR8__(v27 - 0x3D4D51C2D82B14B1LL * *((void *)v13 + 3), 33);
          v13 += 32;
        }

        while ((unint64_t)v13 <= v25 - 32);
        v153.count[1] = v26;
        v153.hash[0] = v29;
        v153.hash[1] = v28;
        v153.hash[2] = v27;
      }

      v16 = &OBJC_CLASS___MSVAutoBugCapture_ptr;
      if ((unint64_t)v13 < v25)
      {
        int v19 = v25 - (_DWORD)v13;
        __memcpy_chk(&v153.hash[3], v13, v25 - (void)v13, 168LL);
        goto LABEL_40;
      }
    }

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICDMusicUserSocialProfileRequestContext initWithStoreRequestContext:subscriptionStatus:]( +[ICDMusicUserSocialProfileRequestContext allocWithZone:]( &OBJC_CLASS___ICDMusicUserSocialProfileRequestContext,  "allocWithZone:",  a3),  "initWithStoreRequestContext:subscriptionStatus:",  self->_storeRequestContext,  self->_subscriptionStatus);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 cacheKey]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMusicUserSocialProfileRequestContext cacheKey](self, "cacheKey"));
    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_cacheKey, "hash");
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void).cxx_destruct
{
}

@end