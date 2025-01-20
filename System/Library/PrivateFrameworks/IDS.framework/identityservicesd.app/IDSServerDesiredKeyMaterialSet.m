@interface IDSServerDesiredKeyMaterialSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredKeyMaterialSet)initWithKMs:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6;
- (NSArray)kms;
- (NSString)description;
- (__SecKey)forPublicIdentity;
- (id)materialDataByID;
- (id)wrapMaterial:(id)a3 error:(id *)a4;
- (int)type;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation IDSServerDesiredKeyMaterialSet

- (IDSServerDesiredKeyMaterialSet)initWithKMs:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6
{
  id v11 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSServerDesiredKeyMaterialSet;
  v12 = -[IDSServerDesiredKeyMaterialSet init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_kms, a3);
    v13->_type = a4;
    if (a5) {
      CFRetain(a5);
    }
    v13->_forPublicIdentity = a5;
    v13->_forParticipantID = a6;
    v13->_requireSignature = 1;
    unint64_t v14 = -[IDSServerDesiredKeyMaterialSet forParticipantID](v13, "forParticipantID");
    unint64_t v15 = v14 ^ (unint64_t)-[IDSServerDesiredKeyMaterialSet forPublicIdentity](v13, "forPublicIdentity");
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerDesiredKeyMaterialSet kms](v13, "kms", 0LL));
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)v20) keyIndex]);
          v15 ^= (unint64_t)[v21 hash];

          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v18);
    }

    v13->_hash = v15;
    v22 = v13;
  }

  return v13;
}

- (void)dealloc
{
  forPublicIdentity = self->_forPublicIdentity;
  if (forPublicIdentity)
  {
    CFRelease(forPublicIdentity);
    self->_forPublicIdentity = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSServerDesiredKeyMaterialSet;
  -[IDSServerDesiredKeyMaterialSet dealloc](&v4, "dealloc");
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p forParticipantID:%llu forPublicIdentity:%@ materials:%@ hash:%llu>",  objc_opt_class(self, a2),  self,  self->_forParticipantID,  self->_forPublicIdentity,  self->_kms,  self->_hash);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSServerDesiredKeyMaterialSet, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    id v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 kms]);
    BOOL v9 = [v8 isEqualToArray:self->_kms]
      && [v7 forPublicIdentity] == self->_forPublicIdentity
      && [v7 forParticipantID] == (id)self->_forParticipantID;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)wrapMaterial:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "IDSServerDesiredKeyMaterialSet wrapMaterialOrError",  v11,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 keyMaterial]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping wrapSeed:to:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "wrapSeed:to:legacy:error:",  v8,  self->_forPublicIdentity,  0LL,  a4));

  return v9;
}

- (id)materialDataByID
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerDesiredKeyMaterialSet kms](self, "kms"));
  id v5 = [v4 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v58;
    uint64_t v48 = IDSRealTimeEncryptionSKI;
    uint64_t v47 = IDSRealTimeEncryptionSKM;
    uint64_t v46 = IDSRealTimeEncryptionSKS;
    uint64_t v45 = IDSRealTimeEncryptionSKGC;
    uint64_t v44 = IDSRealTimeEncryptionMKI;
    uint64_t v43 = IDSRealTimeEncryptionMKM;
    uint64_t v42 = IDSRealTimeEncryptionMKS;
    uint64_t v41 = IDSRealTimeEncryptionMKGC;
    uint64_t v51 = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
    uint64_t v50 = IDSRealTimeEncryptionParticipantID;
    do
    {
      v8 = 0LL;
      id v49 = v6;
      do
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v8);
        id v56 = 0LL;
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSServerDesiredKeyMaterialSet wrapMaterial:error:]( self,  "wrapMaterial:error:",  v9,  &v56,  v41));
        id v11 = v56;
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
        v13 = v12;
        if (v11) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v10 == 0LL;
        }
        if (!v14)
        {
          id v53 = v11;
          v55 = v10;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v19 = -[IDSServerDesiredKeyMaterialSet forParticipantID](self, "forParticipantID");
            v20 = -[IDSServerDesiredKeyMaterialSet forPublicIdentity](self, "forPublicIdentity");
            uint64_t v21 = v7;
            v22 = self;
            v23 = v4;
            __int128 v24 = Mutable;
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 keyIndex]);
            *(_DWORD *)buf = 134218498;
            unint64_t v62 = v19;
            __int16 v63 = 2112;
            v64 = v20;
            __int16 v65 = 2112;
            v66 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "IDSServerDesiredKeyMaterialSet materialDataByID: encrypted the key material for participantID: %llu, remot e pub key: %@, mki: %@",  buf,  0x20u);

            CFMutableDictionaryRef Mutable = v24;
            uint64_t v4 = v23;
            self = v22;
            uint64_t v7 = v21;
            id v6 = v49;
          }

          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v9 keyIndex]);
          uint64_t v27 = IDSGetUUIDDataFromNSUUID(v26);
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);

          CFMutableDictionaryRef v28 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFMutableDictionaryRef v29 = v28;
          int type = self->_type;
          if (type == 14)
          {
            -[__CFDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v13, v48);
            -[__CFDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v55, v47);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v9 keySalt]);
            -[__CFDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v36, v46);

            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 generationCounter]));
            CFMutableDictionaryRef v33 = v29;
            v34 = v32;
            uint64_t v35 = v45;
LABEL_19:
            -[__CFDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v34, v35);
          }

          else if (type == 13)
          {
            -[__CFDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v13, v44);
            -[__CFDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v55, v43);
            v31 = (void *)objc_claimAutoreleasedReturnValue([v9 keySalt]);
            -[__CFDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v31, v42);

            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 generationCounter]));
            CFMutableDictionaryRef v33 = v29;
            v34 = v32;
            uint64_t v35 = v41;
            goto LABEL_19;
          }

          -[__CFDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &off_100947728, v51);
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 participantID]));
          -[__CFDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v37, v50);

          uint64_t v38 = JWEncodeDictionary(v29);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v39, v13);

          id v11 = v53;
          v10 = v55;
          goto LABEL_21;
        }

        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v54 = v10;
          unint64_t v15 = -[IDSServerDesiredKeyMaterialSet forParticipantID](self, "forParticipantID");
          id v52 = v11;
          v16 = -[IDSServerDesiredKeyMaterialSet forPublicIdentity](self, "forPublicIdentity");
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 keyIndex]);
          *(_DWORD *)buf = 134218498;
          unint64_t v62 = v15;
          __int16 v63 = 2112;
          v64 = v16;
          id v11 = v52;
          v10 = v54;
          __int16 v65 = 2112;
          v66 = v17;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "IDSServerDesiredKeyMaterialSet materialDataByID: could not encrypt the key material for participantID: %llu, remote pub key: %@, mki: %@",  buf,  0x20u);
        }

- (NSArray)kms
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (int)type
{
  return self->_type;
}

- (__SecKey)forPublicIdentity
{
  return self->_forPublicIdentity;
}

- (BOOL)requireSignature
{
  return self->_requireSignature;
}

- (unint64_t)forParticipantID
{
  return self->_forParticipantID;
}

- (void).cxx_destruct
{
}

@end