@interface IDSParticipantsCacheEntryPointer
- (IDSDSessionActiveParticipantsCache)cache;
- (IDSParticipantsCacheEntryPointer)initWithCache:(id)a3 sessionID:(id)a4;
- (NSString)sessionID;
- (id)prioritizedTokens;
- (void)setCache:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation IDSParticipantsCacheEntryPointer

- (IDSParticipantsCacheEntryPointer)initWithCache:(id)a3 sessionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSParticipantsCacheEntryPointer;
  v9 = -[IDSParticipantsCacheEntryPointer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v10->_sessionID, a4);
  }

  return v10;
}

- (id)prioritizedTokens
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSParticipantsCacheEntryPointer cache](self, "cache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSParticipantsCacheEntryPointer sessionID](self, "sessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 participantsForSessionID:v4]);

  return v5;
}

- (IDSDSessionActiveParticipantsCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end