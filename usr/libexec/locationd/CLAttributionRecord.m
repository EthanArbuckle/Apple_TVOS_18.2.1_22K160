@interface CLAttributionRecord
- (CLAttributionRecord)initWithAttributionId:(id)a3 andTimer:(id)a4;
- (CLTimer)attributionTimer;
- (STLocationStatusDomainLocationAttribution)attributionIdentifier;
- (id)description;
- (int)totalAttributionCount;
- (void)dealloc;
- (void)decrementAttributionCountForServiceType:(unint64_t)a3;
- (void)incrementAttributionCountForServiceType:(unint64_t)a3;
- (void)setAttributionIdentifier:(id)a3;
- (void)setAttributionTimer:(id)a3;
@end

@implementation CLAttributionRecord

- (CLAttributionRecord)initWithAttributionId:(id)a3 andTimer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLAttributionRecord;
  v6 = -[CLAttributionRecord init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLAttributionRecord setAttributionIdentifier:](v6, "setAttributionIdentifier:", a3);
    -[CLAttributionRecord setAttributionTimer:](v7, "setAttributionTimer:", a4);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAttributionRecord;
  -[CLAttributionRecord dealloc](&v3, "dealloc");
}

- (void)incrementAttributionCountForServiceType:(unint64_t)a3
{
}

- (void)decrementAttributionCountForServiceType:(unint64_t)a3
{
  int v3 = a3;
  int v5 = self->_serviceTypeAttributionCounts[a3];
  if (v5)
  {
    self->_serviceTypeAttributionCounts[a3] = v5 - 1;
    --self->_totalAttributionCount;
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101870A90);
    }
    v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v8 = 68289538;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      int v13 = v3;
      __int16 v14 = 2114;
      v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#AttributionRecord count for servicetype is already 0 before decrementing, ServiceTyp e:%{public}d, Record:%{public, location:escape_only}@}",  (uint8_t *)&v8,  0x22u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101870A90);
      }
    }

    v7 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v8 = 68289538;
      int v9 = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      int v13 = v3;
      __int16 v14 = 2114;
      v15 = self;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AttributionRecord count for servicetype is already 0 before decrementing",  "{msg%{public}.0s:#AttributionRecord count for servicetype is already 0 before decrementing, ServiceTyp e:%{public}d, Record:%{public, location:escape_only}@}",  (uint8_t *)&v8,  0x22u);
    }
  }

- (id)description
{
  id v3 = objc_msgSend( objc_msgSend( objc_msgSend( -[STLocationStatusDomainLocationAttribution activityAttribution]( -[CLAttributionRecord attributionIdentifier](self, "attributionIdentifier"),  "activityAttribution"),  "attributedEntity"),  "executableIdentity"),  "bundleIdentifier");
  if (!v3)
  {
    id v3 = objc_msgSend( objc_msgSend( objc_msgSend( -[STLocationStatusDomainLocationAttribution activityAttribution]( -[CLAttributionRecord attributionIdentifier](self, "attributionIdentifier"),  "activityAttribution"),  "attributedEntity"),  "executableIdentity"),  "bundlePath");
    if (!v3) {
      id v3 = objc_msgSend( objc_msgSend( objc_msgSend( -[STLocationStatusDomainLocationAttribution activityAttribution]( -[CLAttributionRecord attributionIdentifier](self, "attributionIdentifier"),  "activityAttribution"),  "attributedEntity"),  "executableIdentity"),  "executablePath");
    }
  }

  -[CLTimer nextFireDelay](-[CLAttributionRecord attributionTimer](self, "attributionTimer"), "nextFireDelay");
  if (v4 == 1.79769313e308) {
    double v5 = -1.0;
  }
  else {
    double v5 = v4;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ID:%@ TimeLeft:%f, TotalCount:%d",  v3,  *(void *)&v5,  -[CLAttributionRecord totalAttributionCount](self, "totalAttributionCount"));
}

- (int)totalAttributionCount
{
  return self->_totalAttributionCount;
}

- (STLocationStatusDomainLocationAttribution)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (void)setAttributionIdentifier:(id)a3
{
}

- (CLTimer)attributionTimer
{
  return self->_attributionTimer;
}

- (void)setAttributionTimer:(id)a3
{
}

@end