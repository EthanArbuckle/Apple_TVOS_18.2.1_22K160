@interface CSDMomentsReportingSession
+ (double)meanFromDoubleNumbers:(id)a3;
+ (id)medianFromNumbers:(id)a3;
+ (unint64_t)bucketedInteger:(unint64_t)a3;
- (BOOL)hasCleanedUp;
- (CSDMomentsReportingSession)init;
- (CSDMomentsReportingSession)initWithStreamToken:(int64_t)a3;
- (CSDMomentsReportingSessionDelegate)delegate;
- (NSMutableArray)photoRequestDurations;
- (NSMutableDictionary)requestStartDateByTransactionID;
- (NSMutableDictionary)requestTimeoutBlockByTransactionID;
- (OS_dispatch_queue)queue;
- (double)meanRequestDuration;
- (id)medianRequestDuration;
- (int)availability;
- (int64_t)streamToken;
- (unint64_t)fuzzyPhotoRequestFailureCount;
- (unint64_t)fuzzyPhotoRequestSuccessCount;
- (unint64_t)photoRequestFailureCount;
- (unint64_t)photoRequestSuccessCount;
- (void)didCleanUp;
- (void)didReceiveResultsWithTransactionID:(id)a3;
- (void)didStartRequestWithTransactionID:(id)a3;
- (void)registeredStreamWithAvailability:(int)a3;
- (void)reportDataCollectionCompleteIfNecessary;
- (void)setAvailability:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setHasCleanedUp:(BOOL)a3;
- (void)setPhotoRequestFailureCount:(unint64_t)a3;
- (void)setPhotoRequestSuccessCount:(unint64_t)a3;
@end

@implementation CSDMomentsReportingSession

- (CSDMomentsReportingSession)initWithStreamToken:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDMomentsReportingSession;
  v4 = -[CSDMomentsReportingSession init](&v14, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.csdmomentsreportingsession", 0LL);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_streamToken = a3;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requestTimeoutBlockByTransactionID = v4->_requestTimeoutBlockByTransactionID;
    v4->_requestTimeoutBlockByTransactionID = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requestStartDateByTransactionID = v4->_requestStartDateByTransactionID;
    v4->_requestStartDateByTransactionID = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    photoRequestDurations = v4->_photoRequestDurations;
    v4->_photoRequestDurations = (NSMutableArray *)v11;

    v4->_hasCleanedUp = 0;
  }

  return v4;
}

- (CSDMomentsReportingSession)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDMomentsReportingSession.m",  47,  @"%s is not available. Use a designated initializer instead.",  "-[CSDMomentsReportingSession init]");

  return 0LL;
}

- (void)registeredStreamWithAvailability:(int)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001577CC;
  v6[3] = &unk_1003D78C8;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)didStartRequestWithTransactionID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100157874;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didReceiveResultsWithTransactionID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100157B38;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)didCleanUp
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100157DD8;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)reportDataCollectionCompleteIfNecessary
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100157E70;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v3, block);
}

- (unint64_t)fuzzyPhotoRequestFailureCount
{
  v3 = (void *)objc_opt_class(self, a2);
  return (unint64_t)_objc_msgSend( v3,  "bucketedInteger:",  -[CSDMomentsReportingSession photoRequestFailureCount](self, "photoRequestFailureCount"));
}

- (unint64_t)fuzzyPhotoRequestSuccessCount
{
  v3 = (void *)objc_opt_class(self, a2);
  return (unint64_t)_objc_msgSend( v3,  "bucketedInteger:",  -[CSDMomentsReportingSession photoRequestSuccessCount](self, "photoRequestSuccessCount"));
}

- (id)medianRequestDuration
{
  v3 = (void *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession photoRequestDurations](self, "photoRequestDurations"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 medianFromNumbers:v4]);

  return v5;
}

- (double)meanRequestDuration
{
  v3 = (void *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMomentsReportingSession photoRequestDurations](self, "photoRequestDurations"));
  [v3 meanFromDoubleNumbers:v4];
  double v6 = v5;

  return v6;
}

+ (id)medianFromNumbers:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"self",  1LL));
  v10 = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingDescriptors:v5]);

  id v7 = [v3 count];
  if (v7) {
    id v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v6, "count") >> 1));
  }
  else {
    id v8 = &off_1003F17E0;
  }

  return v8;
}

+ (double)meanFromDoubleNumbers:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  double v5 = 0.0;
  double v6 = 0.0;
  if (v4)
  {
    id v7 = v4;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) doubleValue];
        double v6 = v6 + v10;
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  if ([v3 count]) {
    double v5 = v6 / (double)(unint64_t)[v3 count];
  }

  return v5;
}

+ (unint64_t)bucketedInteger:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 >= 0xA)
  {
    if (a3 > 0x63)
    {
      if (a3 > 0x3E7) {
        return 1000LL;
      }
      else {
        return a3 - (unsigned __int16)a3 % 0x64u;
      }
    }

    else
    {
      return a3 - a3 % 0xAu;
    }
  }

  return result;
}

- (CSDMomentsReportingSessionDelegate)delegate
{
  return (CSDMomentsReportingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (int)availability
{
  return self->_availability;
}

- (void)setAvailability:(int)a3
{
  self->_availability = a3;
}

- (unint64_t)photoRequestSuccessCount
{
  return self->_photoRequestSuccessCount;
}

- (void)setPhotoRequestSuccessCount:(unint64_t)a3
{
  self->_photoRequestSuccessCount = a3;
}

- (unint64_t)photoRequestFailureCount
{
  return self->_photoRequestFailureCount;
}

- (void)setPhotoRequestFailureCount:(unint64_t)a3
{
  self->_photoRequestFailureCount = a3;
}

- (BOOL)hasCleanedUp
{
  return self->_hasCleanedUp;
}

- (void)setHasCleanedUp:(BOOL)a3
{
  self->_hasCleanedUp = a3;
}

- (NSMutableDictionary)requestTimeoutBlockByTransactionID
{
  return self->_requestTimeoutBlockByTransactionID;
}

- (NSMutableDictionary)requestStartDateByTransactionID
{
  return self->_requestStartDateByTransactionID;
}

- (NSMutableArray)photoRequestDurations
{
  return self->_photoRequestDurations;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end