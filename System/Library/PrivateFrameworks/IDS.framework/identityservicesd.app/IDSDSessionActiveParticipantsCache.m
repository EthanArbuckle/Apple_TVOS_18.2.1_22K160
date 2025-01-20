@interface IDSDSessionActiveParticipantsCache
+ (IDSDSessionActiveParticipantsCache)sharedInstance;
- (IDSDSessionActiveParticipantsCache)init;
- (NSMutableDictionary)cachedTokensBySessionID;
- (id)participantsForSessionID:(id)a3;
- (id)vendTokenListForSessionID:(id)a3;
- (os_unfair_lock_s)lock;
- (void)removeParticipantsForSessionID:(id)a3;
- (void)setCachedTokensBySessionID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)updateParticipants:(id)a3 forSessionID:(id)a4;
@end

@implementation IDSDSessionActiveParticipantsCache

+ (IDSDSessionActiveParticipantsCache)sharedInstance
{
  if (qword_1009C0AB0 != -1) {
    dispatch_once(&qword_1009C0AB0, &stru_100900A40);
  }
  return (IDSDSessionActiveParticipantsCache *)(id)qword_1009C0AB8;
}

- (IDSDSessionActiveParticipantsCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSDSessionActiveParticipantsCache;
  result = -[IDSDSessionActiveParticipantsCache init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)updateParticipants:(id)a3 forSessionID:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "__imSetByApplyingBlock:", &stru_100900A60));
  v8 = v7;
  if (v6 && [v7 count])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDSDSessionActiveParticipantsCache adding sessionID %@ participants %@",  (uint8_t *)&v17,  0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
    if (!v11)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[IDSDSessionActiveParticipantsCache setCachedTokensBySessionID:](self, "setCachedTokensBySessionID:", v12);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v6]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 setByAddingObjectsFromSet:v8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
      [v16 setObject:v15 forKeyedSubscript:v6];
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
      [v15 setObject:v8 forKeyedSubscript:v6];
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)removeParticipantsForSessionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDSDSessionActiveParticipantsCache removing sessionID %@",  (uint8_t *)&v9,  0xCu);
    }

    os_unfair_lock_lock(&self->_lock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
    [v6 setObject:0 forKeyedSubscript:v4];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
    id v8 = [v7 count];

    if (!v8) {
      -[IDSDSessionActiveParticipantsCache setCachedTokensBySessionID:](self, "setCachedTokensBySessionID:", 0LL);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)participantsForSessionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionActiveParticipantsCache cachedTokensBySessionID](self, "cachedTokensBySessionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
    id v8 = [v7 copy];

    os_unfair_lock_unlock(p_lock);
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    id v10 = v9;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }

  return v10;
}

- (id)vendTokenListForSessionID:(id)a3
{
  id v4 = a3;
  v5 = -[IDSParticipantsCacheEntryPointer initWithCache:sessionID:]( objc_alloc(&OBJC_CLASS___IDSParticipantsCacheEntryPointer),  "initWithCache:sessionID:",  self,  v4);

  return v5;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)cachedTokensBySessionID
{
  return self->_cachedTokensBySessionID;
}

- (void)setCachedTokensBySessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end