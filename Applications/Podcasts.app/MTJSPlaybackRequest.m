@interface MTJSPlaybackRequest
- (BOOL)firstItemIsRestricted;
- (MTJSPlaybackRequest)init;
- (MTJSPlaybackRequest)initWithJSDictionary:(id)a3;
- (NSArray)items;
- (NSData)recommendationData;
- (NSString)featureName;
- (unint64_t)shuffleMode;
- (unint64_t)startIndex;
- (unint64_t)upNextAction;
- (void)setFirstItemIsRestricted:(BOOL)a3;
@end

@implementation MTJSPlaybackRequest

- (MTJSPlaybackRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTJSPlaybackRequest;
  result = -[MTJSPlaybackRequest init](&v3, "init");
  if (result) {
    result->_startIndex = 0LL;
  }
  return result;
}

- (MTJSPlaybackRequest)initWithJSDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[MTJSPlaybackRequest init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"containerItem"]);
    [v6 isNSDictionary];
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"featureName"]);
    if ([v7 isNSString])
    {
      v8 = (NSString *)[v7 copy];
      featureName = v5->_featureName;
      v5->_featureName = v8;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"items"]);
    if ([v10 isNSArray])
    {
      v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
      v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472LL;
      v30 = sub_10007FBF0;
      v31 = &unk_100242980;
      v12 = v5;
      v32 = v12;
      v33 = v11;
      v13 = v11;
      [v10 enumerateObjectsUsingBlock:&v28];
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[MTStoreManifest storeMediaDictionariesToPlayerItems:]( &OBJC_CLASS___MTStoreManifest,  "storeMediaDictionariesToPlayerItems:",  v13,  v28,  v29,  v30,  v31));
      items = v12->_items;
      v12->_items = (NSArray *)v14;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"recommendationData"]);
    if ([v16 isNSData])
    {
      v17 = (NSData *)[v16 copy];
      recommendationData = v5->_recommendationData;
      v5->_recommendationData = v17;
    }

    else
    {
      if (![v16 isNSString]
        || (v19 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v16,  0LL),  v20 = v5->_recommendationData,  v5->_recommendationData = v19,  v20,  -[NSData length](v5->_recommendationData, "length")))
      {
LABEL_11:
        v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"shuffle"]);
        if ((objc_opt_respondsToSelector(v21, "BOOLValue") & 1) != 0)
        {
          unsigned int v22 = [v21 BOOLValue];
          uint64_t v23 = 1LL;
          if (v22) {
            uint64_t v23 = 2LL;
          }
          v5->_shuffleMode = v23;
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"selectedTrackIndex"]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"upNextAction"]);
        if ([v25 isEqualToString:@"queueNow"])
        {
          uint64_t v26 = 1LL;
        }

        else if ([v25 isEqualToString:@"queueNext"])
        {
          uint64_t v26 = 2LL;
        }

        else
        {
          if (![v25 isEqualToString:@"queueAfter"])
          {
LABEL_25:

            goto LABEL_26;
          }

          uint64_t v26 = 3LL;
        }

        v5->_upNextAction = v26;
        goto LABEL_25;
      }

      recommendationData = v5->_recommendationData;
      v5->_recommendationData = 0LL;
    }

    goto LABEL_11;
  }

- (NSString)featureName
{
  return self->_featureName;
}

- (NSArray)items
{
  return self->_items;
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (unint64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (unint64_t)upNextAction
{
  return self->_upNextAction;
}

- (BOOL)firstItemIsRestricted
{
  return self->_firstItemIsRestricted;
}

- (void)setFirstItemIsRestricted:(BOOL)a3
{
  self->_firstItemIsRestricted = a3;
}

- (void).cxx_destruct
{
}

@end