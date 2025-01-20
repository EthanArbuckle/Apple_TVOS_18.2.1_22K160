@interface IDSMMLMessage
- (BOOL)addAggregateMessage:(id)a3;
- (BOOL)expectingMoreResponses;
- (BOOL)hasSpaceForAggregateMessage:(id)a3;
- (BOOL)isMMLMessage;
- (BOOL)wantsMultipleResponses;
- (BOOL)wantsResponse;
- (BOOL)wantsUserAgentInHeaders;
- (IDSMMLMessage)initWithSendMode:(id)a3 topic:(id)a4 maxSize:(unint64_t)a5;
- (NSMutableOrderedSet)aggregateMessages;
- (NSNumber)chunkNumber;
- (NSNumber)sendMode;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)currentSize;
- (int64_t)maxSize;
- (void)noteResponseForToken:(id)a3;
- (void)setAggregateMessages:(id)a3;
- (void)setChunkNumber:(id)a3;
- (void)setCurrentSize:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxSize:(int64_t)a3;
- (void)setSendMode:(id)a3;
@end

@implementation IDSMMLMessage

- (IDSMMLMessage)initWithSendMode:(id)a3 topic:(id)a4 maxSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSMMLMessage;
  v10 = -[IDSMMLMessage init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[IDSMMLMessage setSendMode:](v10, "setSendMode:", v8);
    -[IDSMMLMessage setTopic:](v11, "setTopic:", v9);
    -[IDSMMLMessage setMaxSize:](v11, "setMaxSize:", a5);
  }

  return v11;
}

- (BOOL)hasSpaceForAggregateMessage:(id)a3
{
  int64_t currentSize = self->_currentSize;
  return (unint64_t)[a3 sizeOfKeysWithValues] + currentSize <= self->_maxSize;
}

- (BOOL)addAggregateMessage:(id)a3
{
  id v4 = a3;
  aggregateMessages = self->_aggregateMessages;
  if (!aggregateMessages)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v7 = self->_aggregateMessages;
    self->_aggregateMessages = v6;

    aggregateMessages = self->_aggregateMessages;
  }

  -[NSMutableOrderedSet addObject:](aggregateMessages, "addObject:", v4);
  int64_t currentSize = self->_currentSize;
  self->_int64_t currentSize = (int64_t)[v4 sizeOfKeysWithValues] + currentSize;

  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSMMLMessage;
  id v4 = -[IDSMMLMessage copyWithZone:](&v10, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMMLMessage sendMode](self, "sendMode"));
  [v4 setSendMode:v5];

  objc_msgSend(v4, "setMaxSize:", -[IDSMMLMessage maxSize](self, "maxSize"));
  objc_msgSend(v4, "setCurrentSize:", -[IDSMMLMessage currentSize](self, "currentSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMMLMessage chunkNumber](self, "chunkNumber"));
  [v4 setChunkNumber:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMMLMessage identifier](self, "identifier"));
  [v4 setIdentifier:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMMLMessage aggregateMessages](self, "aggregateMessages"));
  [v4 setAggregateMessages:v8];

  return v4;
}

- (int64_t)command
{
  return 254LL;
}

- (BOOL)wantsUserAgentInHeaders
{
  return 0;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (BOOL)wantsMultipleResponses
{
  return 1;
}

- (BOOL)isMMLMessage
{
  return 1;
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IDSMMLMessage;
  id v3 = -[IDSMMLMessage messageBody](&v19, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (__CFDictionary *)[v4 mutableCopy];

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v7 = self->_aggregateMessages;
  id v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v11), "messageBody", (void)v15));
        -[NSMutableArray addObject:](v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v9);
  }

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMMLMessage sendMode](self, "sendMode"));
  if (v13) {
    CFDictionarySetValue(v5, IDSDeliverySendModeKey, v13);
  }

  if (v6) {
    CFDictionarySetValue(v5, IDSMadridMessageListKey, v6);
  }

  return v5;
}

- (void)noteResponseForToken:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_aggregateMessages;
  id v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "noteResponseForToken:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (BOOL)expectingMoreResponses
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_aggregateMessages;
  id v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend( *(id *)(*((void *)&v7 + 1) + 8 * (void)i),  "expectingMoreResponses",  (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (NSMutableOrderedSet)aggregateMessages
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setAggregateMessages:(id)a3
{
}

- (NSNumber)sendMode
{
  return (NSNumber *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setSendMode:(id)a3
{
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int64_t)a3
{
  self->_maxSize = a3;
}

- (int64_t)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(int64_t)a3
{
  self->_int64_t currentSize = a3;
}

- (NSNumber)chunkNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setChunkNumber:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end