@interface FSEventStreamMultiplexerClient
- (FSEventStreamMultiplexerClient)initWithID:(int)a3 name:(id)a4 callback:(id)a5;
- (NSNumber)clientID;
- (NSString)name;
- (id)callback;
- (unint64_t)hash;
@end

@implementation FSEventStreamMultiplexerClient

- (FSEventStreamMultiplexerClient)initWithID:(int)a3 name:(id)a4 callback:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v8 = (__CFString *)a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___FSEventStreamMultiplexerClient;
  v10 = -[FSEventStreamMultiplexerClient init](&v17, "init");
  if (v10)
  {
    v11 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v6);
    clientID = v10->_clientID;
    v10->_clientID = v11;

    if (v8) {
      v13 = v8;
    }
    else {
      v13 = @"unknown";
    }
    objc_storeStrong((id *)&v10->_name, v13);
    id v14 = objc_retainBlock(v9);
    id callback = v10->_callback;
    v10->_id callback = v14;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FSEventStreamMultiplexerClient clientID](self, "clientID"));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (NSNumber)clientID
{
  return self->_clientID;
}

- (NSString)name
{
  return self->_name;
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
}

@end