@interface CPLCloudKitUploadMetric
- (CPLCloudKitUploadMetric)init;
- (id)description;
- (unint64_t)itemCount;
- (unint64_t)otherItemCount;
- (unint64_t)referencedResourcesCount;
- (unint64_t)referencedResourcesSize;
- (unint64_t)uploadSize;
- (unint64_t)uploadedSize;
- (void)prepareCKEventMetric:(id)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setOtherItemCount:(unint64_t)a3;
- (void)setReferencedResourcesCount:(unint64_t)a3;
- (void)setReferencedResourcesSize:(unint64_t)a3;
- (void)setUploadSize:(unint64_t)a3;
- (void)setUploadedSize:(unint64_t)a3;
@end

@implementation CPLCloudKitUploadMetric

- (CPLCloudKitUploadMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLCloudKitUploadMetric;
  return -[CPLCloudKitMetric initWithName:](&v3, "initWithName:", @"batchUpload");
}

- (void)prepareCKEventMetric:(id)a3
{
  unint64_t itemCount = self->_itemCount;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", itemCount));
  [v5 setObject:v6 forKeyedSubscript:@"itemCount"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_uploadSize));
  [v5 setObject:v7 forKeyedSubscript:@"uploadsize"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_referencedResourcesCount));
  [v5 setObject:v8 forKeyedSubscript:@"referencedResourcesCount"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_referencedResourcesSize));
  [v5 setObject:v9 forKeyedSubscript:@"referencedSize"];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_otherItemCount));
  [v5 setObject:v10 forKeyedSubscript:@"otherCount"];

  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_uploadedSize));
  [v5 setObject:v11 forKeyedSubscript:@"uploadedSize"];
}

- (id)description
{
  if (self->_itemCount || self->_otherItemCount)
  {
    if (self->_uploadedSize || -[CPLCloudKitMetric result](self, "result"))
    {
      objc_super v3 = objc_alloc(&OBJC_CLASS___NSString);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric identifier](self, "identifier"));
      unint64_t itemCount = self->_itemCount;
      unint64_t otherItemCount = self->_otherItemCount;
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_uploadSize,  3LL));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_uploadedSize,  3LL));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric resultDescription](self, "resultDescription"));
      v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@ (%lu/%lu/%@ -> %@)%@>",  v4,  itemCount,  otherItemCount,  v7,  v8,  v9);

      return v10;
    }

    else
    {
      v13 = objc_alloc(&OBJC_CLASS___NSString);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric identifier](self, "identifier"));
      unint64_t v15 = self->_itemCount;
      unint64_t v16 = self->_otherItemCount;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_uploadSize,  3LL));
      v18 = -[NSString initWithFormat:](v13, "initWithFormat:", @"<%@ (%lu/%lu/%@)>", v14, v15, v16, v17);

      return v18;
    }
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___CPLCloudKitUploadMetric;
    id v12 = -[CPLCloudKitMetric description](&v19, "description");
    return (id)objc_claimAutoreleasedReturnValue(v12);
  }

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_unint64_t itemCount = a3;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (void)setUploadSize:(unint64_t)a3
{
  self->_uploadSize = a3;
}

- (unint64_t)referencedResourcesCount
{
  return self->_referencedResourcesCount;
}

- (void)setReferencedResourcesCount:(unint64_t)a3
{
  self->_referencedResourcesCount = a3;
}

- (unint64_t)referencedResourcesSize
{
  return self->_referencedResourcesSize;
}

- (void)setReferencedResourcesSize:(unint64_t)a3
{
  self->_referencedResourcesSize = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_unint64_t otherItemCount = a3;
}

- (unint64_t)uploadedSize
{
  return self->_uploadedSize;
}

- (void)setUploadedSize:(unint64_t)a3
{
  self->_uploadedSize = a3;
}

@end