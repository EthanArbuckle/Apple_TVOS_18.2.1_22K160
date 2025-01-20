@interface IDSRegistrationReasonTracker
+ (id)sharedInstance;
- (IDSRegistrationReasonTracker)init;
- (IDSRequestReasonContainer)requestReasonContainer;
- (NSMutableDictionary)PNRReasonByUserID;
- (id)registrationRequestReasonString;
- (int64_t)getMostRecentIDSRegistrationReason;
- (int64_t)getPNRReasonForUserUniqueIdentifier:(id)a3;
- (int64_t)mostRecentIDSRegistrationReason;
- (void)clearPNRReasonForUserUniqueIdentifier:(id)a3;
- (void)clearRegistrationRequestReason;
- (void)setMostRecentIDSRegistrationReason:(int64_t)a3;
- (void)setPNRReason:(int64_t)a3 forUserUniqueIdentifier:(id)a4;
- (void)setPNRReasonByUserID:(id)a3;
- (void)setRegistrationRequestReason:(id)a3;
- (void)setRequestReasonContainer:(id)a3;
@end

@implementation IDSRegistrationReasonTracker

+ (id)sharedInstance
{
  if (qword_1009BEB40 != -1) {
    dispatch_once(&qword_1009BEB40, &stru_1008FB4F8);
  }
  return (id)qword_1009BEB48;
}

- (IDSRegistrationReasonTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSRegistrationReasonTracker;
  v2 = -[IDSRegistrationReasonTracker init](&v11, "init");
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100130EA8;
    v8[3] = &unk_1008F97C8;
    objc_copyWeak(&v9, &location);
    uint64_t v5 = im_primary_queue(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    sub_100301AD8(v8, (uint64_t)@"Recent-Registration-Reasons", (uint64_t)v6);

    v2->_mostRecentIDSRegistrationReason = 0LL;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)setPNRReason:(int64_t)a3 forUserUniqueIdentifier:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationReasonTracker PNRReasonByUserID](self, "PNRReasonByUserID"));

    if (!v7)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      -[IDSRegistrationReasonTracker setPNRReasonByUserID:](self, "setPNRReasonByUserID:", Mutable);
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationReasonTracker PNRReasonByUserID](self, "PNRReasonByUserID"));
    [v9 setObject:v10 forKeyedSubscript:v6];
  }

- (void)clearPNRReasonForUserUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationReasonTracker PNRReasonByUserID](self, "PNRReasonByUserID"));
    [v5 setObject:0 forKeyedSubscript:v8];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationReasonTracker PNRReasonByUserID](self, "PNRReasonByUserID"));
    id v7 = [v6 count];

    id v4 = v8;
    if (!v7)
    {
      -[IDSRegistrationReasonTracker setPNRReasonByUserID:](self, "setPNRReasonByUserID:", 0LL);
      id v4 = v8;
    }
  }
}

- (int64_t)getPNRReasonForUserUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationReasonTracker PNRReasonByUserID](self, "PNRReasonByUserID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (void)setMostRecentIDSRegistrationReason:(int64_t)a3
{
  self->_mostRecentIDSRegistrationReason = a3;
}

- (int64_t)getMostRecentIDSRegistrationReason
{
  return self->_mostRecentIDSRegistrationReason;
}

- (void)setRegistrationRequestReason:(id)a3
{
}

- (void)clearRegistrationRequestReason
{
  requestReasonContainer = self->_requestReasonContainer;
  self->_requestReasonContainer = 0LL;
}

- (id)registrationRequestReasonString
{
  requestReasonContainer = self->_requestReasonContainer;
  if (requestReasonContainer)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRequestReasonContainer requestReasonString](requestReasonContainer, "requestReasonString"));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRequestReasonContainer unknownReasonContainer]( &OBJC_CLASS___IDSRequestReasonContainer,  "unknownReasonContainer"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestReasonString]);
  }

  return v3;
}

- (NSMutableDictionary)PNRReasonByUserID
{
  return self->_PNRReasonByUserID;
}

- (void)setPNRReasonByUserID:(id)a3
{
}

- (int64_t)mostRecentIDSRegistrationReason
{
  return self->_mostRecentIDSRegistrationReason;
}

- (IDSRequestReasonContainer)requestReasonContainer
{
  return self->_requestReasonContainer;
}

- (void)setRequestReasonContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end