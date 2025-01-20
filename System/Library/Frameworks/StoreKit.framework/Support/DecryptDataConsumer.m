@interface DecryptDataConsumer
- (AssetDataConsumer)streamAdapter;
- (BOOL)_beginSessionWithDPInfo:(id)a3 error:(id *)a4;
- (ChunkedDigest)digest;
- (DecryptDataConsumer)initWithDPInfo:(id)a3 error:(id *)a4;
- (void)_resetDecryptionBufferAndDigestVerifier;
- (void)_resizeSampleSizeArray:(unint64_t)a3;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setDigest:(id)a3;
- (void)setStreamAdapter:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation DecryptDataConsumer

- (DecryptDataConsumer)initWithDPInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DecryptDataConsumer;
  v7 = -[DecryptDataConsumer init](&v13, "init");
  if (v7)
  {
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.storekit.DecryptDataConsumer", v9);
    consumerQueue = v7->_consumerQueue;
    v7->_consumerQueue = (OS_dispatch_queue *)v10;

    v7->_partialSampleBuffer = (char *)malloc(0x8000uLL);
    v7->_partialSampleBufferLength = 0LL;
    v7->_sampleSizes = 0LL;
    v7->_sampleSizesCount = 0LL;
    if (!-[DecryptDataConsumer _beginSessionWithDPInfo:error:](v7, "_beginSessionWithDPInfo:error:", v6, a4))
    {

      v7 = 0LL;
    }
  }

  return v7;
}

- (void)dealloc
{
  self->_partialSampleBuffer = 0LL;
  free(self->_sampleSizes);
  self->_sampleSizes = 0LL;
  session = self->_session;
  if (session)
  {
    sub_1002553F0((uint64_t)session);
    self->_session = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DecryptDataConsumer;
  -[DecryptDataConsumer dealloc](&v4, "dealloc");
}

- (BOOL)_beginSessionWithDPInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10001CB64;
  v21 = sub_10001CB74;
  id v22 = 0LL;
  consumerQueue = self->_consumerQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001CB7C;
  v12[3] = &unk_1002E7710;
  v15 = &v17;
  id v8 = v6;
  id v13 = v8;
  v14 = self;
  v16 = &v23;
  dispatch_sync((dispatch_queue_t)consumerQueue, v12);
  int v9 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v9 = *((unsigned __int8 *)v24 + 24);
  }

  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (void)_resizeSampleSizeArray:(unint64_t)a3
{
  if (self->_sampleSizesCount < a3)
  {
    unint64_t v5 = 4 * a3;
    id v6 = (unsigned int *)realloc(self->_sampleSizes, 4 * a3);
    self->_sampleSizes = v6;
    unint64_t sampleSizesCount = self->_sampleSizesCount;
    if (sampleSizesCount < a3) {
      memset_pattern16(&v6[sampleSizesCount], &unk_1002790D0, v5 - 4 * sampleSizesCount);
    }
    self->_unint64_t sampleSizesCount = a3;
  }

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  consumerQueue = self->_consumerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CE3C;
  block[3] = &unk_1002E7738;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)consumerQueue, block);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001D5B8;
  v7[3] = &unk_1002E77B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)consumerQueue, v7);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001D884;
  v7[3] = &unk_1002E77B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)consumerQueue, v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001DA4C;
  v7[3] = &unk_1002E77B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)consumerQueue, v7);
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001DB50;
  v7[3] = &unk_1002E77B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)consumerQueue, v7);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001DC54;
  v7[3] = &unk_1002E77B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)consumerQueue, v7);
}

- (void)_resetDecryptionBufferAndDigestVerifier
{
  self->_partialSampleBufferLength = 0LL;
  digestVerifier = self->_digestVerifier;
  self->_digestVerifier = 0LL;
}

- (ChunkedDigest)digest
{
  return (ChunkedDigest *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDigest:(id)a3
{
}

- (AssetDataConsumer)streamAdapter
{
  return (AssetDataConsumer *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setStreamAdapter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end