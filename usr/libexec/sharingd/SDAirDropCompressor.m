@interface SDAirDropCompressor
- (BOOL)readData:(char *)a3 length:(int64_t)a4 fromStream:(__CFReadStream *)a5;
- (BOOL)readIncomingChunk;
- (BOOL)writeData:(char *)a3 length:(int64_t)a4 toStream:(__CFWriteStream *)a5;
- (SDAirDropCompressor)initWithReadStream:(__CFReadStream *)a3 writeStream:(__CFWriteStream *)a4;
- (__CFReadStream)copyReadStream;
- (void)dealloc;
- (void)executeReadWithAdaptiveCompression;
- (void)executeWriteWithAdaptiveCompression;
- (void)fileComplete;
- (void)openStreams;
- (void)processCompressibilityStatistics;
- (void)processNetworkStatistics:(double)a3;
- (void)sendOutgoingChunk:(char *)a3 length:(int64_t)a4 compressed:(BOOL)a5;
@end

@implementation SDAirDropCompressor

- (SDAirDropCompressor)initWithReadStream:(__CFReadStream *)a3 writeStream:(__CFWriteStream *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SDAirDropCompressor;
  v6 = -[SDAirDropCompressor init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_compressible = 1;
    v6->_totalBytesSent = 0;
    v6->_totalNetworkDelay = 0.0;
    v6->_numBlocksProcessed = 0LL;
    v6->_totalBytesProcessed = 0;
    v6->_lastCompressionRatio = 0.0;
    v6->_totalCompressionTime = 0.0;
    v6->_numBlocksCompressed = 0LL;
    v6->_totalCompressedOutput = 0;
    v6->_keepingUpWithNetwork = 1;
    v6->_readStream = (__CFReadStream *)CFRetain(a3);
    v7->_writeStream = (__CFWriteStream *)CFRetain(a4);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.sharingd.adjustment-queue", 0LL);
    adjustmentQueue = v7->_adjustmentQueue;
    v7->_adjustmentQueue = (OS_dispatch_queue *)v8;
  }

  return v7;
}

- (void)dealloc
{
  readStream = self->_readStream;
  if (readStream) {
    CFRelease(readStream);
  }
  writeStream = self->_writeStream;
  if (writeStream) {
    CFRelease(writeStream);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDAirDropCompressor;
  -[SDAirDropCompressor dealloc](&v5, "dealloc");
}

- (__CFReadStream)copyReadStream
{
  result = self->_readStream;
  if (result) {
    return (__CFReadStream *)CFRetain(result);
  }
  return result;
}

- (BOOL)writeData:(char *)a3 length:(int64_t)a4 toStream:(__CFWriteStream *)a5
{
  if (a4 < 1) {
    return 1;
  }
  int64_t v9 = 0LL;
  while (1)
  {
    CFIndex v10 = CFWriteStreamWrite(a5, (const UInt8 *)&a3[v9], a4 - v9);
    if (v10 < 0) {
      break;
    }
    v9 += v10;
    if (v9 >= a4) {
      return 1;
    }
  }

  uint64_t v12 = airdrop_log(v10);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000AB808();
  }

  CFReadStreamClose(self->_readStream);
  return 0;
}

- (BOOL)readData:(char *)a3 length:(int64_t)a4 fromStream:(__CFReadStream *)a5
{
  if (a4 < 1) {
    return 1;
  }
  int64_t v9 = 0LL;
  while (1)
  {
    if (CFReadStreamGetStatus(a5) > kCFStreamStatusWriting) {
      return 1;
    }
    CFIndex v10 = CFReadStreamRead(a5, (UInt8 *)&a3[v9], a4 - v9);
    if (v10 < 0) {
      break;
    }
    v9 += v10;
    if (v9 >= a4) {
      return 1;
    }
  }

  uint64_t v12 = airdrop_log(v10);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000AB868();
  }

  CFWriteStreamClose(self->_writeStream);
  return 0;
}

- (BOOL)readIncomingChunk
{
  unsigned int v9 = 0;
  LODWORD(v3) = -[SDAirDropCompressor readData:length:fromStream:]( self,  "readData:length:fromStream:",  &v9,  4LL,  self->_readStream);
  if (CFReadStreamGetStatus(self->_readStream) <= kCFStreamStatusWriting && (_DWORD)v3 != 0)
  {
    unsigned int v9 = bswap32(v9);
    size_t v3 = v9 & 0x7FFFFFFF;
    objc_super v5 = (Bytef *)malloc(v3);
    if (-[SDAirDropCompressor readData:length:fromStream:]( self,  "readData:length:fromStream:",  v5,  v3,  self->_readStream))
    {
      if ((v9 & 0x80000000) != 0)
      {
        LOBYTE(v3) = -[SDAirDropCompressor writeData:length:toStream:]( self,  "writeData:length:toStream:",  v5,  v3,  self->_writeStream);
      }

      else
      {
        uLongf v8 = 0x20000LL;
        v6 = (Bytef *)malloc(0x20000uLL);
        uncompress(v6, &v8, v5, v3);
        LOBYTE(v3) = -[SDAirDropCompressor writeData:length:toStream:]( self,  "writeData:length:toStream:",  v6,  v8,  self->_writeStream);
        if (v6 != v5)
        {
          free(v5);
          objc_super v5 = v6;
        }
      }
    }

    else
    {
      LOBYTE(v3) = 0;
    }

    free(v5);
  }

  return v3;
}

- (void)sendOutgoingChunk:(char *)a3 length:(int64_t)a4 compressed:(BOOL)a5
{
  unsigned int v8 = a4 | 0x80000000;
  if (a5) {
    unsigned int v8 = a4;
  }
  unsigned int v9 = bswap32(v8);
  -[SDAirDropCompressor writeData:length:toStream:](self, "writeData:length:toStream:", &v9, 4LL, self->_writeStream);
  -[SDAirDropCompressor writeData:length:toStream:](self, "writeData:length:toStream:", a3, a4, self->_writeStream);
}

- (void)openStreams
{
  if (CFReadStreamOpen(self->_readStream))
  {
    if (CFWriteStreamOpen(self->_writeStream)) {
      return;
    }
    CFErrorRef v3 = CFWriteStreamCopyError(self->_writeStream);
    uint64_t v4 = airdrop_log(v3);
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000AB928();
    }

    CFReadStreamClose(self->_readStream);
  }

  else
  {
    CFErrorRef v3 = CFReadStreamCopyError(self->_readStream);
    uint64_t v6 = airdrop_log(v3);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000AB8C8();
    }
  }
}

- (void)processNetworkStatistics:(double)a3
{
  if (a3 > 1.0 && !self->_keepingUpWithNetwork)
  {
    uint64_t v10 = airdrop_log(self);
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000AB988(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    self->_keepingUpWithNetwork = 1;
    self->_int64_t numBlocksProcessed = 0LL;
    self->_totalBytesSent = 0;
    double lastCompressionRatio = 0.0;
    uint64_t v19 = 2LL;
    goto LABEL_24;
  }

  int64_t numBlocksProcessed = self->_numBlocksProcessed;
  if (numBlocksProcessed < 21) {
    return;
  }
  unsigned int totalBytesProcessed = self->_totalBytesProcessed;
  double v8 = (double)totalBytesProcessed;
  if (totalBytesProcessed)
  {
    LODWORD(v3) = self->_totalCompressedOutput;
    double lastCompressionRatio = (double)v3 / v8;
  }

  else
  {
    double lastCompressionRatio = self->_lastCompressionRatio;
  }

  LODWORD(v8) = self->_totalBytesSent;
  double v20 = (double)*(unint64_t *)&v8 / self->_totalNetworkDelay;
  double v21 = self->_totalCompressionTime * 128.0 * 1024.0 / (double)totalBytesProcessed
      + lastCompressionRatio * 131072.0 / v20;
  double v22 = 131072.0 / v20;
  if (self->_keepingUpWithNetwork && v21 > v22 + v22)
  {
    uint64_t v23 = airdrop_log(self);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000AB9F0();
    }
    BOOL v25 = 0;
LABEL_22:

    self->_keepingUpWithNetwork = v25;
    goto LABEL_23;
  }

  if (!self->_keepingUpWithNetwork && v22 > v21)
  {
    uint64_t v26 = airdrop_log(self);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1000ABA54();
    }
    BOOL v25 = 1;
    goto LABEL_22;
  }

  if ((unint64_t)numBlocksProcessed <= 0x1F4)
  {
    uint64_t v19 = 7LL;
    goto LABEL_24;
  }

- (void)processCompressibilityStatistics
{
  if (self->_compressible && self->_numBlocksCompressed >= 11)
  {
    LODWORD(v2) = self->_totalCompressedOutput;
    LODWORD(v3) = self->_totalBytesProcessed;
    if ((double)v2 / (double)v3 > 0.8)
    {
      self->_compressible = 0;
      uint64_t v4 = airdrop_log(self);
      objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1000ABAB8(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }

- (void)fileComplete
{
  adjustmentQueue = (dispatch_queue_s *)self->_adjustmentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AB280;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_sync(adjustmentQueue, block);
}

- (void)executeReadWithAdaptiveCompression
{
  CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
  if (Status < kCFStreamStatusAtEnd)
  {
    do
    {
      unsigned __int8 v4 = -[SDAirDropCompressor readIncomingChunk](self, "readIncomingChunk");
      CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
    }

    while (Status < kCFStreamStatusAtEnd && (v4 & 1) != 0);
  }

  if (Status <= kCFStreamStatusAtEnd)
  {
    CFReadStreamClose(self->_readStream);
LABEL_10:
    CFErrorRef v5 = 0LL;
    goto LABEL_11;
  }

  if (Status != kCFStreamStatusError) {
    goto LABEL_10;
  }
  CFErrorRef v5 = CFReadStreamCopyError(self->_readStream);
  uint64_t v6 = airdrop_log(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000ABB20();
  }

LABEL_11:
  CFWriteStreamClose(self->_writeStream);
}

- (void)executeWriteWithAdaptiveCompression
{
  unint64_t v3 = dispatch_semaphore_create(2LL);
  unsigned __int8 v4 = dispatch_queue_create("com.apple.sharingd.compression-queue", &_dispatch_queue_attr_concurrent);
  CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
  if (Status >= kCFStreamStatusAtEnd)
  {
    dispatch_semaphore_t v6 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_15;
  }

  dispatch_semaphore_t v6 = 0LL;
  uint64_t v7 = 0LL;
  while (1)
  {
    dispatch_semaphore_t v8 = v6;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);

    uint64_t v9 = (UInt8 *)malloc(0x20000uLL);
    CFIndex v10 = CFReadStreamRead(self->_readStream, v9, 0x20000LL);
    if (!v10)
    {
      free(v9);
      goto LABEL_7;
    }

    CFIndex v11 = v10;
    if (v10 < 0) {
      break;
    }
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000AB5C4;
    v19[3] = &unk_1005CD5B0;
    CFIndex v23 = v11;
    v24 = v9;
    v19[4] = self;
    double v20 = v7;
    uint64_t v12 = v6;
    double v21 = v12;
    double v22 = v3;
    uint64_t v13 = v7;
    dispatch_async(v4, v19);
    uint64_t v7 = v12;

LABEL_7:
    CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
    if (Status >= kCFStreamStatusAtEnd)
    {
      if (!v7) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  uint64_t v14 = airdrop_log(v10);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000AB868();
  }

  free(v9);
  if (v7) {
LABEL_14:
  }
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
LABEL_15:
  if (Status <= kCFStreamStatusAtEnd)
  {
    CFReadStreamClose(self->_readStream);
    goto LABEL_21;
  }

  if (Status == kCFStreamStatusError)
  {
    CFErrorRef v16 = CFReadStreamCopyError(self->_readStream);
    uint64_t v17 = airdrop_log(v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000ABB80();
    }
  }

  else
  {
LABEL_21:
    CFErrorRef v16 = 0LL;
  }

  CFWriteStreamClose(self->_writeStream);
}

- (void).cxx_destruct
{
}

  ;
}

@end