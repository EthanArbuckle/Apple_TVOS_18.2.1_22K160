@interface LZMADataConsumer
- (LZMADataConsumer)init;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation LZMADataConsumer

- (LZMADataConsumer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LZMADataConsumer;
  v2 = -[LZMADataConsumer init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    buffer = v2->_buffer;
    v2->_buffer = v3;
  }

  return v2;
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  if ([v6 length])
  {
    id v12 = 0LL;
    int v8 = sub_100296F80((uint64_t)self, v6, &v12);
    id v9 = v12;
    if (v8)
    {
      streamAdapter = self->_streamAdapter;
      id v11 = -[NSMutableData copy](self->_buffer, "copy");
      -[AssetDataConsumer consumeData:withCompletionHandler:]( streamAdapter,  "consumeData:withCompletionHandler:",  v11,  v7);
    }

    else
    {
      v7[2](v7, v9, 0LL);
    }
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v13 = 0LL;
  int v5 = sub_100296F80((uint64_t)self, 0LL, &v13);
  id v6 = v13;
  if (v5)
  {
    decoder = self->_decoder;
    self->_decoder = 0LL;

    NSUInteger v8 = -[NSMutableData length](self->_buffer, "length");
    streamAdapter = self->_streamAdapter;
    if (v8)
    {
      id v10 = -[NSMutableData copy](self->_buffer, "copy");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100297220;
      v11[3] = &unk_1003EAC98;
      v11[4] = self;
      id v12 = v4;
      -[AssetDataConsumer consumeData:andWaitWithCompletionHandler:]( streamAdapter,  "consumeData:andWaitWithCompletionHandler:",  v10,  v11);
    }

    else
    {
      -[AssetDataConsumer finishWithCompletionHandler:](self->_streamAdapter, "finishWithCompletionHandler:", v4);
    }
  }

  else
  {
    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = sub_1001B5878((char *)objc_alloc(&OBJC_CLASS___LZMADecoder), self->_digest);
  decoder = self->_decoder;
  self->_decoder = (LZMADecoder *)v4;

  id v6 = self->_decoder;
  if (v6) {
    v6->_disableAutodetection = self->_disableAutodetection;
  }
  -[AssetDataConsumer prepareWithCompletionHandler:](self->_streamAdapter, "prepareWithCompletionHandler:", v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
  decoder = self->_decoder;
  self->_decoder = 0LL;
  id v5 = a3;

  -[AssetDataConsumer resetWithCompletionHandler:](self->_streamAdapter, "resetWithCompletionHandler:", v5);
}

- (void)suspendWithCompletionHandler:(id)a3
{
  decoder = self->_decoder;
  self->_decoder = 0LL;
  id v4 = (void (**)(id, id))a3;

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  400LL,  0LL));
  v4[2](v4, v5);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  decoder = self->_decoder;
  self->_decoder = 0LL;
  id v5 = a3;

  -[AssetDataConsumer truncateWithCompletionHandler:](self->_streamAdapter, "truncateWithCompletionHandler:", v5);
}

- (void).cxx_destruct
{
}

@end