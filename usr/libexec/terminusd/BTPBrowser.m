@interface BTPBrowser
- (BOOL)start;
- (BTPBrowser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 bonjourType:(id)a5;
- (NSMutableDictionary)resolvers;
- (NSString)bonjourType;
- (_DNSServiceRef_t)sdRefBrowse;
- (unsigned)dstIfIndex;
- (unsigned)srcIfIndex;
- (void)dealloc;
- (void)handleReplyName:(id)a3 type:(id)a4 domain:(id)a5 ifIndex:(unsigned int)a6 add:(BOOL)a7;
- (void)setBonjourType:(id)a3;
- (void)setDstIfIndex:(unsigned int)a3;
- (void)setResolvers:(id)a3;
- (void)setSdRefBrowse:(_DNSServiceRef_t *)a3;
- (void)setSrcIfIndex:(unsigned int)a3;
- (void)stop;
@end

@implementation BTPBrowser

- (BTPBrowser)initWithSrcIfIndex:(unsigned int)a3 dstIfIndex:(unsigned int)a4 bonjourType:(id)a5
{
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___BTPBrowser;
  v10 = -[BTPBrowser init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    v10->_sdRefBrowse = 0LL;
    v10->_srcIfIndex = a3;
    v10->_dstIfIndex = a4;
    objc_storeStrong((id *)&v10->_bonjourType, a5);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    resolvers = v11->_resolvers;
    v11->_resolvers = (NSMutableDictionary *)v12;

    v14 = v11;
  }

  else
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d super init failed",  ",  "-[BTPBrowser initWithSrcIfIndex:dstIfIndex:bonjourType:]"",  170);
    }
  }

  return v11;
}

- (BOOL)start
{
  p_sdRefBrowse = &self->_sdRefBrowse;
  if (self->_sdRefBrowse) {
    return 1;
  }
  uint64_t v5 = DNSServiceBrowse( p_sdRefBrowse,  0,  self->_srcIfIndex,  -[NSString UTF8String](self->_bonjourType, "UTF8String"),  "local",  (DNSServiceBrowseReply)sub_100020198,  self);
  sdRefBrowse = self->_sdRefBrowse;
  if (sdRefBrowse) {
    BOOL v7 = (_DWORD)v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (qword_1001DC6F8 != -1)
    {
      v10 = self->_sdRefBrowse;
      dispatch_once(&qword_1001DC6F8, &stru_1001AE468);
      sdRefBrowse = v10;
    }

    DNSServiceErrorType v8 = DNSServiceSetDispatchQueue(sdRefBrowse, (dispatch_queue_t)qword_1001DC6F0);
    if (!v8)
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC6E0, 2LL))
      {
        if (qword_1001DC6E8 != -1) {
          dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
        }
        _NRLogWithArgs( qword_1001DC6E0,  2LL,  "%s%.30s:%-4d Successfully started browsing for %@ over %u",  ",  "-[BTPBrowser start]"",  200LL,  self->_bonjourType,  self->_srcIfIndex);
      }

      return 1;
    }

    DNSServiceErrorType v9 = v8;
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d DNSServiceSetDispatchQueue failed %d",  ",  "-[BTPBrowser start]"",  196,  v9);
    }

    -[BTPBrowser stop](self, "stop");
    return 0;
  }

  else
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d DNSServiceBrowse for %@ failed %d",  ",  "-[BTPBrowser start]"",  190LL,  self->_bonjourType,  v5);
    }

    BOOL result = 0;
    *p_sdRefBrowse = 0LL;
  }

  return result;
}

- (void)stop
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v3 = self->_resolvers;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      BOOL v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        DNSServiceErrorType v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_resolvers,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7),  (void)v10));
        [v8 stop];

        BOOL v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  sdRefBrowse = self->_sdRefBrowse;
  if (sdRefBrowse)
  {
    DNSServiceRefDeallocate(sdRefBrowse);
    self->_sdRefBrowse = 0LL;
  }

- (void)dealloc
{
  if (self->_sdRefBrowse)
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d _sdRefBrowse is still active",  ",  "-[BTPBrowser dealloc]"",  218);
    }

    -[BTPBrowser stop](self, "stop");
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTPBrowser;
  -[BTPBrowser dealloc](&v3, "dealloc");
}

- (void)handleReplyName:(id)a3 type:(id)a4 domain:(id)a5 ifIndex:(unsigned int)a6 add:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  if (self->_srcIfIndex == (_DWORD)v8)
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 2LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      v14 = "Rmv";
      if (v7) {
        v14 = "Add";
      }
      _NRLogWithArgs( qword_1001DC6E0,  2LL,  "%s%.30s:%-4d browse reply: %s %3u %-20@ %-20@ %@",  ",  "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]"",  233LL,  v14,  v8,  v13,  v12,  v20);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  v20,  v12,  v13));
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resolvers, "objectForKeyedSubscript:", v15));
    v17 = v16;
    if (v7)
    {

      if (v17)
      {
        if (qword_1001DC6E8 != -1) {
          dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
        {
          if (qword_1001DC6E8 != -1) {
            dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
          }
          _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d trying to add already existing resolver for %@",  ",  "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]"",  237LL,  v15);
        }
      }

      else
      {
        v18 = -[BTPResolver initWithSrcIfIndex:dstIfIndex:name:type:domain:]( objc_alloc(&OBJC_CLASS___BTPResolver),  "initWithSrcIfIndex:dstIfIndex:name:type:domain:",  self->_srcIfIndex,  self->_dstIfIndex,  v20,  v12,  v13);
        v19 = v18;
        if (v18 && -[BTPResolver start](v18, "start")) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_resolvers,  "setObject:forKeyedSubscript:",  v19,  v15);
        }
      }
    }

    else
    {
      if (v16)
      {
        [v16 stop];
        -[NSMutableDictionary removeObjectForKey:](self->_resolvers, "removeObjectForKey:", v15);
      }

      else
      {
        if (qword_1001DC6E8 != -1) {
          dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
        {
          if (qword_1001DC6E8 != -1) {
            dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
          }
          _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d trying to remove unknown resolver for %@",  ",  "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]"",  255LL,  v15);
        }
      }
    }
  }

  else
  {
    if (qword_1001DC6E8 != -1) {
      dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6E0, 16LL))
    {
      if (qword_1001DC6E8 != -1) {
        dispatch_once(&qword_1001DC6E8, &stru_1001AE448);
      }
      _NRLogWithArgs( qword_1001DC6E0,  16LL,  "%s%.30s:%-4d received update with invalid ifIndex %u != %u",  ",  "-[BTPBrowser handleReplyName:type:domain:ifIndex:add:]"",  230,  v8,  self->_srcIfIndex);
    }
  }
}

- (_DNSServiceRef_t)sdRefBrowse
{
  return self->_sdRefBrowse;
}

- (void)setSdRefBrowse:(_DNSServiceRef_t *)a3
{
  self->_sdRefBrowse = a3;
}

- (unsigned)srcIfIndex
{
  return self->_srcIfIndex;
}

- (void)setSrcIfIndex:(unsigned int)a3
{
  self->_srcIfIndex = a3;
}

- (unsigned)dstIfIndex
{
  return self->_dstIfIndex;
}

- (void)setDstIfIndex:(unsigned int)a3
{
  self->_dstIfIndex = a3;
}

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourType:(id)a3
{
}

- (NSMutableDictionary)resolvers
{
  return self->_resolvers;
}

- (void)setResolvers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end