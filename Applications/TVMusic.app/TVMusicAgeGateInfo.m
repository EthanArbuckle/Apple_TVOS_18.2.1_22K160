@interface TVMusicAgeGateInfo
+ (id)ageGateInfoFromURLBag;
+ (void)initialize;
- (BOOL)isAgeGateEnabled;
- (NSString)dialogMessage;
- (NSString)dialogTitle;
- (TVMusicAgeGateInfo)init;
- (TVMusicAgeGateInfo)initWithRatingThreshold:(int64_t)a3 dialogTitle:(id)a4 dialogMessage:(id)a5;
- (id)description;
- (id)initFromURLBag;
- (int64_t)ratingThreshold;
- (void)setDialogMessage:(id)a3;
- (void)setDialogTitle:(id)a3;
- (void)setIsAgeGateEnabled:(BOOL)a3;
- (void)setRatingThreshold:(int64_t)a3;
@end

@implementation TVMusicAgeGateInfo

+ (id)ageGateInfoFromURLBag
{
  if (qword_1002BE938 != -1) {
    dispatch_once(&qword_1002BE938, &stru_10026B458);
  }
  return (id)qword_1002BE930;
}

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicAgeGateController");
  v3 = (void *)qword_1002BE940;
  qword_1002BE940 = (uint64_t)v2;
}

- (TVMusicAgeGateInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicAgeGateInfo;
  return -[TVMusicAgeGateInfo init](&v3, "init");
}

- (id)initFromURLBag
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicAgeGateInfo;
  os_log_t v2 = -[TVMusicAgeGateInfo init](&v11, "init");
  if (v2)
  {
    objc_super v3 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    v5 = -[ICStoreRequestContext initWithIdentity:](v3, "initWithIdentity:", v4);

    objc_initWeak(&location, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005B698;
    v8[3] = &unk_10026B480;
    objc_copyWeak(&v9, &location);
    [v6 getBagForRequestContext:v5 withCompletionHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (TVMusicAgeGateInfo)initWithRatingThreshold:(int64_t)a3 dialogTitle:(id)a4 dialogMessage:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVMusicAgeGateInfo;
  objc_super v11 = -[TVMusicAgeGateInfo init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_isAgeGateEnabled = 1;
    v11->_ratingThreshold = a3;
    objc_storeStrong((id *)&v11->_dialogTitle, a4);
    objc_storeStrong((id *)&v12->_dialogMessage, a5);
  }

  return v12;
}

- (id)description
{
  if (-[TVMusicAgeGateInfo isAgeGateEnabled](self, "isAgeGateEnabled")) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  int64_t v4 = -[TVMusicAgeGateInfo ratingThreshold](self, "ratingThreshold");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateInfo dialogTitle](self, "dialogTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateInfo dialogMessage](self, "dialogMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Enabled: %@, threshold: %ld, title: %@, message: %@",  v3,  v4,  v5,  v6));

  return v7;
}

- (BOOL)isAgeGateEnabled
{
  return self->_isAgeGateEnabled;
}

- (void)setIsAgeGateEnabled:(BOOL)a3
{
  self->_isAgeGateEnabled = a3;
}

- (int64_t)ratingThreshold
{
  return self->_ratingThreshold;
}

- (void)setRatingThreshold:(int64_t)a3
{
  self->_ratingThreshold = a3;
}

- (NSString)dialogTitle
{
  return self->_dialogTitle;
}

- (void)setDialogTitle:(id)a3
{
}

- (NSString)dialogMessage
{
  return self->_dialogMessage;
}

- (void)setDialogMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end