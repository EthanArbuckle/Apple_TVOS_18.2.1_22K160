@interface MADCacheDeleteManagerEventInfo
+ (BOOL)supportsSecureCoding;
- (MADCacheDeleteManagerEventInfo)init;
- (MADCacheDeleteManagerEventInfo)initWithCoder:(id)a3;
- (MADCacheDeleteManagerEventInfo)initWithError:(id)a3;
- (MADCacheDeleteManagerEventInfo)initWithError:(id)a3 spaceCheckedID:(id)a4 totalRequiredFreeSpace:(unint64_t)a5 cacheDeleteUrgency:(int)a6 completionQueue:(id)a7 completion:(id)a8;
- (MADCacheDeleteManagerEventInfo)initWithSpaceCheckedID:(id)a3;
- (MADCacheDeleteManagerEventInfo)initWithTotalRequiredFreeSpace:(unint64_t)a3 cacheDeleteUrgency:(int)a4 completionQueue:(id)a5 completion:(id)a6;
- (NSError)error;
- (NSString)spaceCheckedID;
- (OS_dispatch_queue)completionQueue;
- (id)completion;
- (id)description;
- (int)cacheDeleteUrgency;
- (unint64_t)spaceNoLongerNeeded;
- (unint64_t)totalAvailableFromCD;
- (unint64_t)totalAvailableOnFS;
- (unint64_t)totalCDBasePath;
- (unint64_t)totalCDSharedPath;
- (unint64_t)totalRequiredFreeSpace;
- (unint64_t)totalRequiredSpaceForAllRequests;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheDeleteUrgency:(int)a3;
- (void)setCompletion:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setError:(id)a3;
- (void)setSpaceCheckedID:(id)a3;
- (void)setSpaceNoLongerNeeded:(unint64_t)a3;
- (void)setTotalAvailableFromCD:(unint64_t)a3;
- (void)setTotalAvailableOnFS:(unint64_t)a3;
- (void)setTotalCDBasePath:(unint64_t)a3;
- (void)setTotalCDSharedPath:(unint64_t)a3;
- (void)setTotalRequiredFreeSpace:(unint64_t)a3;
- (void)setTotalRequiredSpaceForAllRequests:(unint64_t)a3;
@end

@implementation MADCacheDeleteManagerEventInfo

- (MADCacheDeleteManagerEventInfo)init
{
  return -[MADCacheDeleteManagerEventInfo initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:]( self,  "initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADCacheDeleteManagerEventInfo)initWithTotalRequiredFreeSpace:(unint64_t)a3 cacheDeleteUrgency:(int)a4 completionQueue:(id)a5 completion:(id)a6
{
  return -[MADCacheDeleteManagerEventInfo initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:]( self,  "initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:",  0LL,  0LL,  a3,  *(void *)&a4,  a5,  a6);
}

- (MADCacheDeleteManagerEventInfo)initWithSpaceCheckedID:(id)a3
{
  return -[MADCacheDeleteManagerEventInfo initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:]( self,  "initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL);
}

- (MADCacheDeleteManagerEventInfo)initWithError:(id)a3
{
  return -[MADCacheDeleteManagerEventInfo initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:]( self,  "initWithError:spaceCheckedID:totalRequiredFreeSpace:cacheDeleteUrgency:completionQueue:completion:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADCacheDeleteManagerEventInfo)initWithError:(id)a3 spaceCheckedID:(id)a4 totalRequiredFreeSpace:(unint64_t)a5 cacheDeleteUrgency:(int)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MADCacheDeleteManagerEventInfo;
  v18 = -[MADCacheDeleteManagerEventInfo init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_spaceCheckedID, a4);
    v19->_totalRequiredFreeSpace = a5;
    *(_OWORD *)&v19->_totalRequiredSpaceForAllRequests = 0u;
    *(_OWORD *)&v19->_totalAvailableFromCD = 0u;
    v19->_totalCDSharedPath = 0LL;
    v19->_cacheDeleteUrgency = a6;
    objc_storeStrong((id *)&v19->_completionQueue, a7);
    id v20 = objc_retainBlock(v17);
    id completion = v19->_completion;
    v19->_id completion = v20;

    objc_storeStrong((id *)&v19->_error, a3);
    v19->_spaceNoLongerNeeded = 0LL;
  }

  return v19;
}

- (MADCacheDeleteManagerEventInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MADCacheDeleteManagerEventInfo;
  v5 = -[MADCacheDeleteManagerEventInfo init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"spaceCheckedID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    spaceCheckedID = v5->_spaceCheckedID;
    v5->_spaceCheckedID = (NSString *)v7;

    v5->_totalRequiredFreeSpace = (unint64_t)[v4 decodeInt64ForKey:@"totalRequiredFreeSpace"];
    v5->_totalRequiredSpaceForAllRequests = (unint64_t)[v4 decodeInt64ForKey:@"totalRequiredSpaceForAllRequests"];
    v5->_totalAvailableOnFS = (unint64_t)[v4 decodeInt64ForKey:@"totalAvailableOnFS"];
    v5->_totalAvailableFromCD = (unint64_t)[v4 decodeInt64ForKey:@"totalAvailableFromCD"];
    v5->_totalCDBasePath = (unint64_t)[v4 decodeInt64ForKey:@"totalCDBasePath"];
    v5->_totalCDSharedPath = (unint64_t)[v4 decodeInt64ForKey:@"totalCDSharedPath"];
    v5->_cacheDeleteUrgency = [v4 decodeIntForKey:@"cacheDeleteUrgency"];
    v5->_spaceNoLongerNeeded = (unint64_t)[v4 decodeInt64ForKey:@"spaceNoLongerNeeded"];
    completionQueue = v5->_completionQueue;
    v5->_completionQueue = 0LL;

    id completion = v5->_completion;
    v5->_id completion = 0LL;

    error = v5->_error;
    v5->_error = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo spaceCheckedID](self, "spaceCheckedID"));
  [v5 encodeObject:v4 forKey:@"spaceCheckedID"];

  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo totalRequiredFreeSpace](self, "totalRequiredFreeSpace"),  @"totalRequiredFreeSpace");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo totalRequiredSpaceForAllRequests](self, "totalRequiredSpaceForAllRequests"),  @"totalRequiredSpaceForAllRequests");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo totalAvailableOnFS](self, "totalAvailableOnFS"),  @"totalAvailableOnFS");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo totalAvailableFromCD](self, "totalAvailableFromCD"),  @"totalAvailableFromCD");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo totalCDBasePath](self, "totalCDBasePath"),  @"totalCDBasePath");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo totalCDSharedPath](self, "totalCDSharedPath"),  @"totalCDSharedPath");
  objc_msgSend( v5,  "encodeInt:forKey:",  -[MADCacheDeleteManagerEventInfo cacheDeleteUrgency](self, "cacheDeleteUrgency"),  @"cacheDeleteUrgency");
  objc_msgSend( v5,  "encodeInt64:forKey:",  -[MADCacheDeleteManagerEventInfo spaceNoLongerNeeded](self, "spaceNoLongerNeeded"),  @"spaceNoLongerNeeded");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v4 = @"None";
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo spaceCheckedID](self, "spaceCheckedID"));
  if (v20) {
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo spaceCheckedID](self, "spaceCheckedID"));
  }
  else {
    v19 = @"None";
  }
  unint64_t v18 = -[MADCacheDeleteManagerEventInfo totalRequiredFreeSpace](self, "totalRequiredFreeSpace");
  unint64_t v17 = -[MADCacheDeleteManagerEventInfo totalRequiredSpaceForAllRequests](self, "totalRequiredSpaceForAllRequests");
  unint64_t v16 = -[MADCacheDeleteManagerEventInfo totalAvailableOnFS](self, "totalAvailableOnFS");
  unint64_t v15 = -[MADCacheDeleteManagerEventInfo totalAvailableFromCD](self, "totalAvailableFromCD");
  unint64_t v14 = -[MADCacheDeleteManagerEventInfo totalCDBasePath](self, "totalCDBasePath");
  unint64_t v5 = -[MADCacheDeleteManagerEventInfo totalCDSharedPath](self, "totalCDSharedPath");
  uint64_t v6 = -[MADCacheDeleteManagerEventInfo cacheDeleteUrgency](self, "cacheDeleteUrgency");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo completionQueue](self, "completionQueue"));
  v8 = @"Provided";
  if (v7) {
    v9 = @"Provided";
  }
  else {
    v9 = @"None";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo completion](self, "completion"));
  if (!v10) {
    v8 = @"None";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo error](self, "error"));
  if (v11)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADCacheDeleteManagerEventInfo error](self, "error"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 checkedDescription]);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"spaceCheckedID:%@, totalRequiredFreeSpace:%llu, totalRequiredSpaceForAllRequests:%llu, totalAvailableOnFS:%llu, totalAvailableFromCD:%llu, totalCDBasePath:%llu, totalCDSharedPath:%llu, cacheDeleteUrgency:%d, completionQueue:%@, completion:%@ error:%@ spaceNoLongerNeeded:%llu",  v19,  v18,  v17,  v16,  v15,  v14,  v5,  v6,  v9,  v8,  v4,  -[MADCacheDeleteManagerEventInfo spaceNoLongerNeeded](self, "spaceNoLongerNeeded")));
  if (v11)
  {
  }

  if (v20) {
  return v12;
  }
}

- (NSString)spaceCheckedID
{
  return self->_spaceCheckedID;
}

- (void)setSpaceCheckedID:(id)a3
{
}

- (unint64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(unint64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (unint64_t)totalRequiredSpaceForAllRequests
{
  return self->_totalRequiredSpaceForAllRequests;
}

- (void)setTotalRequiredSpaceForAllRequests:(unint64_t)a3
{
  self->_totalRequiredSpaceForAllRequests = a3;
}

- (unint64_t)totalAvailableOnFS
{
  return self->_totalAvailableOnFS;
}

- (void)setTotalAvailableOnFS:(unint64_t)a3
{
  self->_totalAvailableOnFS = a3;
}

- (unint64_t)totalAvailableFromCD
{
  return self->_totalAvailableFromCD;
}

- (void)setTotalAvailableFromCD:(unint64_t)a3
{
  self->_totalAvailableFromCD = a3;
}

- (unint64_t)totalCDBasePath
{
  return self->_totalCDBasePath;
}

- (void)setTotalCDBasePath:(unint64_t)a3
{
  self->_totalCDBasePath = a3;
}

- (unint64_t)totalCDSharedPath
{
  return self->_totalCDSharedPath;
}

- (void)setTotalCDSharedPath:(unint64_t)a3
{
  self->_totalCDSharedPath = a3;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (unint64_t)spaceNoLongerNeeded
{
  return self->_spaceNoLongerNeeded;
}

- (void)setSpaceNoLongerNeeded:(unint64_t)a3
{
  self->_spaceNoLongerNeeded = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end