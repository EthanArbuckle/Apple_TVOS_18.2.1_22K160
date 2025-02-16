@interface Endpoint
- (BOOL)isConnected;
- (Endpoint)initWithIdentifier:(id)a3 supportedCommands:(id)a4;
- (NSMutableSet)pipes;
- (NSSet)supportedCommands;
- (NSString)identifier;
- (int64_t)priority;
- (int64_t)type;
- (void)addPipe:(id)a3;
- (void)pipe:(id)a3 didReceiveMessage:(id)a4;
- (void)removePipe:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation Endpoint

- (Endpoint)initWithIdentifier:(id)a3 supportedCommands:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___Endpoint;
  v9 = -[Endpoint init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    *(int64x2_t *)&v10->_type = vdupq_n_s64(2uLL);
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    pipes = v10->_pipes;
    v10->_pipes = v11;

    objc_storeStrong((id *)&v10->_supportedCommands, a4);
  }

  return v10;
}

- (void)addPipe:(id)a3
{
  id v4 = a3;
  id v6 = [self pipes];
  v5 = -[Pipe initWithDelegate:pipe:](objc_alloc(&OBJC_CLASS___Pipe), "initWithDelegate:pipe:", self, v4);

  [v6 addObject:v5];
}

- (void)removePipe:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = -[Endpoint pipes];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = [v10 pipe];

        if (v11 == v4)
        {
          v13 = -[Endpoint pipes];
          [v13 removeObject:v10];

          goto LABEL_12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v12 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003ABBC((uint64_t)v4, v12);
  }
LABEL_12:
}

- (BOOL)isConnected
{
  v2 = [self pipes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)pipe:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[Endpoint supportedCommands](self, "supportedCommands"));
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)[v7 objectForKeyedSubscript:v13];
        if (v14)
        {
          __int128 v15 = [NSString stringWithFormat:@"handle%@Command:message:"];
          __int128 v16 = NSSelectorFromString(v15);

          objc_msgSend(self, v16, v6, v14);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSSet)supportedCommands
{
  return self->_supportedCommands;
}

- (NSMutableSet)pipes
{
  return self->_pipes;
}

- (void).cxx_destruct
{
}

@end