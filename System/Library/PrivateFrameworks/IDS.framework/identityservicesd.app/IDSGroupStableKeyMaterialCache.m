@interface IDSGroupStableKeyMaterialCache
- (BOOL)hasCachedStableKeyIdentifier:(id)a3;
- (BOOL)hasClientReceivedStableKeyIdentifier:(id)a3;
- (BOOL)sentToRemotes;
- (IDSGroupEncryptionKeyMaterial)currentLocalStableKeyMaterial;
- (IDSGroupEncryptionKeyMaterial)previousLocalStableKeyMaterial;
- (IDSGroupStableKeyMaterialCache)initWithIdentifier:(id)a3;
- (NSMutableDictionary)pushTokenToSKMsMapping;
- (NSMutableSet)stableKeyMaterials;
- (NSSet)stableKeyIdentifiersSentToClient;
- (NSString)identifier;
- (id)cachedStableKeyMaterialCollection;
- (id)debugDescription;
- (id)description;
- (id)updateGroupStableKeyMaterialCacheForPushToken:(id)a3 SKM:(id)a4;
- (void)noteClientReceiptOfStableKeyIdentifier:(id)a3;
- (void)resetRemoteStableKeyMaterialCache;
- (void)resetSKMCache;
- (void)resetSKMSentToClientStatus;
- (void)setCurrentLocalStableKeyMaterial:(id)a3;
- (void)setPreviousLocalStableKeyMaterial:(id)a3;
- (void)setPushTokenToSKMsMapping:(id)a3;
- (void)setSentToRemotes:(BOOL)a3;
- (void)setStableKeyIdentifiersSentToClient:(id)a3;
- (void)setStableKeyMaterials:(id)a3;
@end

@implementation IDSGroupStableKeyMaterialCache

- (IDSGroupStableKeyMaterialCache)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSGroupStableKeyMaterialCache;
  v6 = -[IDSGroupStableKeyMaterialCache init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    stableKeyMaterials = v7->_stableKeyMaterials;
    v7->_stableKeyMaterials = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSSet);
    stableKeyIdentifiersSentToClient = v7->_stableKeyIdentifiersSentToClient;
    v7->_stableKeyIdentifiersSentToClient = v10;

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog StableEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "StableEncryptionController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Created group SKM cache { self: %@ }",  buf,  0xCu);
    }
  }

  return v7;
}

- (void)noteClientReceiptOfStableKeyIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache stableKeyIdentifiersSentToClient]( self,  "stableKeyIdentifiersSentToClient"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 setByAddingObject:v4]);

    -[IDSGroupStableKeyMaterialCache setStableKeyIdentifiersSentToClient:]( self,  "setStableKeyIdentifiersSentToClient:",  v5);
  }

- (BOOL)hasClientReceivedStableKeyIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache stableKeyIdentifiersSentToClient]( self,  "stableKeyIdentifiersSentToClient"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)hasCachedStableKeyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache currentLocalStableKeyMaterial](self, "currentLocalStableKeyMaterial"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyIndex]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  unsigned __int8 v8 = [v4 isEqualToString:v7];

  if ((v8 & 1) != 0)
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001CD844;
    v12[3] = &unk_1008FB520;
    id v13 = v4;
    objc_super v14 = &v15;
    [v10 enumerateObjectsUsingBlock:v12];

    BOOL v9 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

- (void)resetSKMSentToClientStatus
{
}

- (void)resetSKMCache
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog StableEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "StableEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting group SKM cache { self: %@ }",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache currentLocalStableKeyMaterial](self, "currentLocalStableKeyMaterial"));
  -[IDSGroupStableKeyMaterialCache setPreviousLocalStableKeyMaterial:](self, "setPreviousLocalStableKeyMaterial:", v4);

  -[IDSGroupStableKeyMaterialCache setCurrentLocalStableKeyMaterial:](self, "setCurrentLocalStableKeyMaterial:", 0LL);
  -[IDSGroupStableKeyMaterialCache setSentToRemotes:](self, "setSentToRemotes:", 0LL);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[IDSGroupStableKeyMaterialCache setStableKeyMaterials:](self, "setStableKeyMaterials:", v5);

  -[IDSGroupStableKeyMaterialCache setPushTokenToSKMsMapping:](self, "setPushTokenToSKMsMapping:", 0LL);
}

- (void)resetRemoteStableKeyMaterialCache
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog StableEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "StableEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting remote SKM cache { self: %@ }",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[IDSGroupStableKeyMaterialCache setStableKeyMaterials:](self, "setStableKeyMaterials:", v4);

  -[IDSGroupStableKeyMaterialCache setPushTokenToSKMsMapping:](self, "setPushTokenToSKMsMapping:", 0LL);
}

- (id)updateGroupStableKeyMaterialCacheForPushToken:(id)a3 SKM:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
  unsigned __int8 v9 = [v8 containsObject:v7];

  if ((v9 & 1) != 0)
  {
    v10 = 0LL;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
    [v11 addObject:v7];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
    if (!v12)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      -[IDSGroupStableKeyMaterialCache setPushTokenToSKMsMapping:](self, "setPushTokenToSKMsMapping:", Mutable);
    }

    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v6]);

    if (!v15)
    {
      CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
      [v17 setObject:v16 forKeyedSubscript:v6];
    }

    char v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v6]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 objectForKey:@"ids-group-stable-key-material-cache-previous-remote-SKM-key"]);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v6]);
    v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 objectForKey:@"ids-group-stable-key-material-cache-current-remote-SKM-key"]);

    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog StableEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "StableEncryptionController"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
      int v38 = 138413570;
      v39 = self;
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      id v43 = v7;
      __int16 v44 = 2112;
      v45 = v23;
      __int16 v46 = 2112;
      v47 = v20;
      __int16 v48 = 2048;
      id v49 = [v25 count];
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "updateGroupStableKeyMaterialCacheForPushToken: { self: %@ pushToken: %@, SKM: %@ current SKM: %@, previousSKM: % @ stableKeyMaterials count: %lu}",  (uint8_t *)&v38,  0x3Eu);
    }

    if (v23)
    {
      id v26 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
      v28 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v6]);
      CFDictionarySetValue(v28, @"ids-group-stable-key-material-cache-previous-remote-SKM-key", v26);
    }

    id v29 = v7;
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache pushTokenToSKMsMapping](self, "pushTokenToSKMsMapping"));
      v31 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v6]);
      CFDictionarySetValue(v31, @"ids-group-stable-key-material-cache-current-remote-SKM-key", v29);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A0678();
    }

    if (v20)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
      [v32 removeObject:v20];

      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog StableEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "StableEncryptionController"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
        id v35 = [v34 count];
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
        int v38 = 138413058;
        v39 = self;
        __int16 v40 = 2112;
        id v41 = v6;
        __int16 v42 = 2048;
        id v43 = v35;
        __int16 v44 = 2112;
        v45 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "updateGroupStableKeyMaterialCacheForPushToken: { self: %@ pushToken: %@, remove outdated SKM from cache: stabl eKeyMaterials count: %lu, %@",  (uint8_t *)&v38,  0x2Au);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue([v20 keyIndex]);
    }

    else
    {
      v10 = 0LL;
    }
  }

  return v10;
}

- (id)cachedStableKeyMaterialCollection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v3));

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache currentLocalStableKeyMaterial](self, "currentLocalStableKeyMaterial"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache currentLocalStableKeyMaterial]( self,  "currentLocalStableKeyMaterial"));
    [v4 addObject:v6];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache previousLocalStableKeyMaterial]( self,  "previousLocalStableKeyMaterial"));

  if (v7)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache previousLocalStableKeyMaterial]( self,  "previousLocalStableKeyMaterial"));
    [v4 addObject:v8];
  }

  unsigned __int8 v9 = objc_alloc(&OBJC_CLASS___IDSGroupStableKeyMaterialCollection);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  v11 = -[IDSGroupStableKeyMaterialCollection initWithStableKeyMaterials:](v9, "initWithStableKeyMaterials:", v10);

  return v11;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache identifier](self, "identifier"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache currentLocalStableKeyMaterial](self, "currentLocalStableKeyMaterial"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache previousLocalStableKeyMaterial]( self,  "previousLocalStableKeyMaterial"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p identifier: %@, currentLocalSKM: %@, previousLocalSKM: %@, SKMsCount: %lu>",  v3,  self,  v4,  v5,  v6,  [v7 count]));

  return v8;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache identifier](self, "identifier"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache currentLocalStableKeyMaterial](self, "currentLocalStableKeyMaterial"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStableKeyMaterialCache previousLocalStableKeyMaterial]( self,  "previousLocalStableKeyMaterial"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStableKeyMaterialCache stableKeyMaterials](self, "stableKeyMaterials"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p identifier: %@, currentLocalSKM: %@, previousLocalSKM: %@, SKMs: %@>",  v3,  self,  v4,  v5,  v6,  v7));

  return v8;
}

- (IDSGroupEncryptionKeyMaterial)currentLocalStableKeyMaterial
{
  return self->_currentLocalStableKeyMaterial;
}

- (void)setCurrentLocalStableKeyMaterial:(id)a3
{
}

- (IDSGroupEncryptionKeyMaterial)previousLocalStableKeyMaterial
{
  return self->_previousLocalStableKeyMaterial;
}

- (void)setPreviousLocalStableKeyMaterial:(id)a3
{
}

- (BOOL)sentToRemotes
{
  return self->_sentToRemotes;
}

- (void)setSentToRemotes:(BOOL)a3
{
  self->_sentToRemotes = a3;
}

- (NSMutableDictionary)pushTokenToSKMsMapping
{
  return self->_pushTokenToSKMsMapping;
}

- (void)setPushTokenToSKMsMapping:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableSet)stableKeyMaterials
{
  return self->_stableKeyMaterials;
}

- (void)setStableKeyMaterials:(id)a3
{
}

- (NSSet)stableKeyIdentifiersSentToClient
{
  return self->_stableKeyIdentifiersSentToClient;
}

- (void)setStableKeyIdentifiersSentToClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end