@interface GEOAPLogMsgQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPLogMsgQueueElem)initWithLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 expireTime:(id)a5 createTime:(id)a6;
- (NSData)logMsg;
- (NSDate)expireTime;
- (id)copy;
- (unint64_t)hash;
- (unint64_t)uploadBatchId;
@end

@implementation GEOAPLogMsgQueueElem

- (GEOAPLogMsgQueueElem)initWithLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 expireTime:(id)a5 createTime:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GEOAPLogMsgQueueElem;
  v14 = -[GEOAPQueueElem init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_logMsg, a3);
    v15->_uploadBatchId = a4;
    objc_storeStrong((id *)&v15->_expireTime, a5);
    objc_storeStrong((id *)&v15->super._createTime, a6);
  }

  return v15;
}

- (id)copy
{
  return -[GEOAPLogMsgQueueElem initWithLogMsg:uploadBatchId:expireTime:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPLogMsgQueueElem),  "initWithLogMsg:uploadBatchId:expireTime:createTime:",  self->_logMsg,  self->_uploadBatchId,  self->_expireTime,  self->super._createTime);
}

- (unint64_t)hash
{
  unint64_t uploadBatchId = self->_uploadBatchId;
  unint64_t v4 = (unint64_t)-[NSData hash](self->_logMsg, "hash") ^ uploadBatchId;
  return v4 ^ (unint64_t)-[NSDate hash](self->_expireTime, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id uploadBatchId = (id)self->_uploadBatchId;
    if (uploadBatchId == [v6 uploadBatchId])
    {
      logMsg = self->_logMsg;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 logMsg]);
      if (-[NSData isEqual:](logMsg, "isEqual:", v9))
      {
        expireTime = self->_expireTime;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 expireTime]);
        unsigned __int8 v12 = -[NSDate isEqualToDate:](expireTime, "isEqualToDate:", v11);
      }

      else
      {
        unsigned __int8 v12 = 0;
      }
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (NSData)logMsg
{
  return self->_logMsg;
}

- (unint64_t)uploadBatchId
{
  return self->_uploadBatchId;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (void).cxx_destruct
{
}

@end