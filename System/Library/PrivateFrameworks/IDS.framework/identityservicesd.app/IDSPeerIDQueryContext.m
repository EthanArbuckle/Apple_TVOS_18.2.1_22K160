@interface IDSPeerIDQueryContext
- (BOOL)forMessaging;
- (BOOL)forRefresh;
- (BOOL)forSending;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContext:(id)a3;
- (BOOL)isForced;
- (BOOL)preventNewQuery;
- (BOOL)resultExpected;
- (IDSPeerIDQueryContext)initWithSending:(BOOL)a3 refresh:(BOOL)a4 messaging:(BOOL)a5 resultExpected:(BOOL)a6 preventNewQuery:(BOOL)a7;
- (IDSPeerIDQueryContext)initWithSending:(BOOL)a3 refresh:(BOOL)a4 messaging:(BOOL)a5 resultExpected:(BOOL)a6 preventNewQuery:(BOOL)a7 isForced:(BOOL)a8;
@end

@implementation IDSPeerIDQueryContext

- (IDSPeerIDQueryContext)initWithSending:(BOOL)a3 refresh:(BOOL)a4 messaging:(BOOL)a5 resultExpected:(BOOL)a6 preventNewQuery:(BOOL)a7
{
  return -[IDSPeerIDQueryContext initWithSending:refresh:messaging:resultExpected:preventNewQuery:isForced:]( self,  "initWithSending:refresh:messaging:resultExpected:preventNewQuery:isForced:",  a3,  a4,  a5,  a6,  a7,  0LL);
}

- (IDSPeerIDQueryContext)initWithSending:(BOOL)a3 refresh:(BOOL)a4 messaging:(BOOL)a5 resultExpected:(BOOL)a6 preventNewQuery:(BOOL)a7 isForced:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSPeerIDQueryContext;
  result = -[IDSPeerIDQueryContext init](&v15, "init");
  if (result)
  {
    result->_forSending = a3;
    result->_forRefresh = a4;
    result->_forMessaging = a5;
    result->_resultExpected = a6;
    result->_preventNewQuery = a7;
    result->_isForced = a8;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSPeerIDQueryContext isEqualToContext:](self, "isEqualToContext:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToContext:(id)a3
{
  id v4 = (IDSPeerIDQueryContext *)a3;
  BOOL v5 = self == v4
    || v4->_forSending == self->_forSending
    && v4->_forRefresh == self->_forRefresh
    && v4->_forMessaging == self->_forMessaging
    && v4->_resultExpected == self->_resultExpected
    && v4->_preventNewQuery == self->_preventNewQuery
    && v4->_isForced == self->_isForced;

  return v5;
}

- (BOOL)forSending
{
  return self->_forSending;
}

- (BOOL)forRefresh
{
  return self->_forRefresh;
}

- (BOOL)forMessaging
{
  return self->_forMessaging;
}

- (BOOL)resultExpected
{
  return self->_resultExpected;
}

- (BOOL)preventNewQuery
{
  return self->_preventNewQuery;
}

- (BOOL)isForced
{
  return self->_isForced;
}

@end