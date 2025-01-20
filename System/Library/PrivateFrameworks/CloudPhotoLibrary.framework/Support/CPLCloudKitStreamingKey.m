@interface CPLCloudKitStreamingKey
- ($9AC8AD2FEA0B9A5F24CD76D172BBF93B)timeRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)useEncryptedStream;
- (CKRecordID)recordID;
- (CPLCloudKitStreamingKey)initWithRecordID:(id)a3 resourceKey:(id)a4 fingerPrint:(id)a5 filename:(id)a6 groupName:(id)a7 timeRange:(id *)a8 useEncryptedStream:(BOOL)a9;
- (NSString)filename;
- (NSString)fingerPrint;
- (NSString)groupName;
- (NSString)resourceKey;
- (unint64_t)hash;
- (void)setUseEncryptedStream:(BOOL)a3;
@end

@implementation CPLCloudKitStreamingKey

- (CPLCloudKitStreamingKey)initWithRecordID:(id)a3 resourceKey:(id)a4 fingerPrint:(id)a5 filename:(id)a6 groupName:(id)a7 timeRange:(id *)a8 useEncryptedStream:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CPLCloudKitStreamingKey;
  v20 = -[CPLCloudKitStreamingKey init](&v34, "init");
  if (v20)
  {
    id v21 = [v15 copy];
    v22 = (void *)*((void *)v20 + 2);
    *((void *)v20 + 2) = v21;

    id v23 = [v16 copy];
    v24 = (void *)*((void *)v20 + 3);
    *((void *)v20 + 3) = v23;

    id v25 = [v18 copy];
    v26 = (void *)*((void *)v20 + 5);
    *((void *)v20 + 5) = v25;

    id v27 = [v17 copy];
    v28 = (void *)*((void *)v20 + 4);
    *((void *)v20 + 4) = v27;

    id v29 = [v19 copy];
    v30 = (void *)*((void *)v20 + 6);
    *((void *)v20 + 6) = v29;

    __int128 v31 = *(_OWORD *)&a8->var0.var0;
    __int128 v32 = *(_OWORD *)&a8->var0.var3;
    *(_OWORD *)(v20 + 88) = *(_OWORD *)&a8->var1.var1;
    *(_OWORD *)(v20 + 72) = v32;
    *(_OWORD *)(v20 + 56) = v31;
    v20[8] = a9;
  }

  return (CPLCloudKitStreamingKey *)v20;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_fingerPrint, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLCloudKitStreamingKey *)a3;
  if (v4 != self)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CPLCloudKitStreamingKey);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0
      || !-[CKRecordID isEqual:](self->_recordID, "isEqual:", v4->_recordID)
      || !-[NSString isEqual:](self->_resourceKey, "isEqual:", v4->_resourceKey)
      || !-[NSString isEqual:](self->_fingerPrint, "isEqual:", v4->_fingerPrint)
      || !-[NSString isEqual:](self->_filename, "isEqual:", v4->_filename))
    {
      goto LABEL_15;
    }

    unint64_t v6 = self->_groupName;
    v7 = (void *)v6;
    groupName = v4->_groupName;
    if (v6 && groupName)
    {
      unsigned __int8 v9 = objc_msgSend((id)v6, "isEqual:");

      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v11 = v6 | (unint64_t)groupName;

      if (v11) {
        goto LABEL_15;
      }
    }

    __int128 v12 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range1.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range1.start.epoch = v12;
    *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    __int128 v13 = *(_OWORD *)&v4->_timeRange.start.epoch;
    *(_OWORD *)&v15.start.value = *(_OWORD *)&v4->_timeRange.start.value;
    *(_OWORD *)&v15.start.epoch = v13;
    *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&v4->_timeRange.duration.timescale;
    if (CMTimeRangeEqual(&range1, &v15))
    {
      BOOL v10 = self->_useEncryptedStream == v4->_useEncryptedStream;
      goto LABEL_16;
    }

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)resourceKey
{
  return self->_resourceKey;
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)groupName
{
  return self->_groupName;
}

- ($9AC8AD2FEA0B9A5F24CD76D172BBF93B)timeRange
{
  __int128 v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (BOOL)useEncryptedStream
{
  return self->_useEncryptedStream;
}

- (void)setUseEncryptedStream:(BOOL)a3
{
  self->_useEncryptedStream = a3;
}

- (void).cxx_destruct
{
}

@end