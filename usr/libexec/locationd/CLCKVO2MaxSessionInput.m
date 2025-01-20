@interface CLCKVO2MaxSessionInput
+ (Class)inputsType;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)inputs;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)inputsCount;
- (void)addInputs:(id)a3;
- (void)clearInputs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setInputs:(id)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSessionInput

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxSessionInput;
  -[CLCKVO2MaxSessionInput dealloc](&v3, "dealloc");
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0LL;
}

- (void)clearInputs
{
}

- (void)addInputs:(id)a3
{
  inputs = self->_inputs;
  if (!inputs)
  {
    inputs = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_inputs = inputs;
  }

  -[NSMutableArray addObject:](inputs, "addObject:", a3);
}

- (unint64_t)inputsCount
{
  return (unint64_t)-[NSMutableArray count](self->_inputs, "count");
}

- (id)inputsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_inputs, "objectAtIndex:", a3);
}

+ (Class)inputsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CLCKVO2MaxCalorimetryInput);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxSessionInput;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCKVO2MaxSessionInput description](&v3, "description"),  -[CLCKVO2MaxSessionInput dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  if (-[NSMutableArray count](self->_inputs, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_inputs, "count"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    inputs = self->_inputs;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( inputs,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(inputs);
          }
          -[NSMutableArray addObject:]( v6,  "addObject:",  [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( inputs,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"inputs"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100806FDC((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  sessionId = self->_sessionId;
  if (sessionId) {
    PBDataWriterWriteStringField(a3, sessionId, 1LL);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  inputs = self->_inputs;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( inputs,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(inputs);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10), 2LL);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( inputs,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }

- (void)copyTo:(id)a3
{
  if (self->_sessionId) {
    objc_msgSend(a3, "setSessionId:");
  }
  if (-[CLCKVO2MaxSessionInput inputsCount](self, "inputsCount"))
  {
    [a3 clearInputs];
    unint64_t v5 = -[CLCKVO2MaxSessionInput inputsCount](self, "inputsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend(a3, "addInputs:", -[CLCKVO2MaxSessionInput inputsAtIndex:](self, "inputsAtIndex:", i));
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[2] = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  inputs = self->_inputs;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( inputs,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(inputs);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v7 addInputs:v13];

        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( inputs,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    sessionId = self->_sessionId;
    if (!((unint64_t)sessionId | *((void *)a3 + 2))
      || (unsigned int v7 = -[NSString isEqual:](sessionId, "isEqual:")) != 0)
    {
      inputs = self->_inputs;
      else {
        LOBYTE(v7) = 1;
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_sessionId, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_inputs, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[CLCKVO2MaxSessionInput setSessionId:](self, "setSessionId:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  double v5 = (void *)*((void *)a3 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CLCKVO2MaxSessionInput addInputs:](self, "addInputs:", *(void *)(*((void *)&v10 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSMutableArray)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

@end