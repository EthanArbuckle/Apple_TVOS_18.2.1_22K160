@interface CSSiriAudioMessageFileRetainLock
- (CSSiriAudioMessageFileRetainLock)initWithRequestId:(id)a3;
- (NSString)UUIDString;
- (NSString)requestId;
@end

@implementation CSSiriAudioMessageFileRetainLock

- (CSSiriAudioMessageFileRetainLock)initWithRequestId:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSSiriAudioMessageFileRetainLock;
  v6 = -[CSSiriAudioMessageFileRetainLock init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestId, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    UUIDString = v7->_UUIDString;
    v7->_UUIDString = (NSString *)v9;
  }

  return v7;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void).cxx_destruct
{
}

@end