@interface CPLCloudKitDownloadMetric
- (CPLCloudKitDownloadMetric)init;
- (id)description;
- (unint64_t)downloadedItemCount;
- (unint64_t)downloadedSize;
- (unint64_t)expectedSize;
- (unint64_t)requestedItemCount;
- (unint64_t)transcodedItemCount;
- (void)prepareCKEventMetric:(id)a3;
- (void)setDownloadedItemCount:(unint64_t)a3;
- (void)setDownloadedSize:(unint64_t)a3;
- (void)setExpectedSize:(unint64_t)a3;
- (void)setRequestedItemCount:(unint64_t)a3;
- (void)setTranscodedItemCount:(unint64_t)a3;
@end

@implementation CPLCloudKitDownloadMetric

- (CPLCloudKitDownloadMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLCloudKitDownloadMetric;
  return -[CPLCloudKitMetric initWithName:](&v3, "initWithName:", @"resourcesDownload");
}

- (void)prepareCKEventMetric:(id)a3
{
  unint64_t requestedItemCount = self->_requestedItemCount;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  requestedItemCount));
  [v5 setObject:v6 forKeyedSubscript:@"requestedCount"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_expectedSize));
  [v5 setObject:v7 forKeyedSubscript:@"expectedSize"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_downloadedItemCount));
  [v5 setObject:v8 forKeyedSubscript:@"downloadedCount"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_downloadedSize));
  [v5 setObject:v9 forKeyedSubscript:@"downloadedSize"];

  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_transcodedItemCount));
  [v5 setObject:v10 forKeyedSubscript:@"transcodedCount"];
}

- (id)description
{
  if (self->_requestedItemCount)
  {
    if (self->_downloadedItemCount || -[CPLCloudKitMetric result](self, "result"))
    {
      objc_super v3 = objc_alloc(&OBJC_CLASS___NSString);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric identifier](self, "identifier"));
      unint64_t requestedItemCount = self->_requestedItemCount;
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_expectedSize,  3LL));
      unint64_t downloadedItemCount = self->_downloadedItemCount;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_downloadedSize,  3LL));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric resultDescription](self, "resultDescription"));
      id v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@ (%lu/%@ -> %lu/%@)%@>",  v4,  requestedItemCount,  v6,  downloadedItemCount,  v8,  v9);

      return v10;
    }

    else
    {
      v13 = objc_alloc(&OBJC_CLASS___NSString);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric identifier](self, "identifier"));
      unint64_t v15 = self->_requestedItemCount;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_expectedSize,  3LL));
      v17 = -[NSString initWithFormat:](v13, "initWithFormat:", @"<%@ (%lu/%@)>", v14, v15, v16);

      return v17;
    }
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___CPLCloudKitDownloadMetric;
    id v12 = -[CPLCloudKitMetric description](&v18, "description");
    return (id)objc_claimAutoreleasedReturnValue(v12);
  }

- (unint64_t)requestedItemCount
{
  return self->_requestedItemCount;
}

- (void)setRequestedItemCount:(unint64_t)a3
{
  self->_unint64_t requestedItemCount = a3;
}

- (unint64_t)expectedSize
{
  return self->_expectedSize;
}

- (void)setExpectedSize:(unint64_t)a3
{
  self->_expectedSize = a3;
}

- (unint64_t)downloadedItemCount
{
  return self->_downloadedItemCount;
}

- (void)setDownloadedItemCount:(unint64_t)a3
{
  self->_unint64_t downloadedItemCount = a3;
}

- (unint64_t)downloadedSize
{
  return self->_downloadedSize;
}

- (void)setDownloadedSize:(unint64_t)a3
{
  self->_downloadedSize = a3;
}

- (unint64_t)transcodedItemCount
{
  return self->_transcodedItemCount;
}

- (void)setTranscodedItemCount:(unint64_t)a3
{
  self->_transcodedItemCount = a3;
}

@end