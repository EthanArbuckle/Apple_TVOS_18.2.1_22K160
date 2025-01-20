@interface ErrorHandlerSession
- (BOOL)isEqual:(id)a3;
- (ErrorHandlerSession)init;
- (NSDictionary)sessionProperties;
- (id)valueForSessionProperty:(id)a3;
- (int64_t)sessionIdentifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)setSessionProperties:(id)a3;
- (void)setValue:(id)a3 forSessionProperty:(id)a4;
@end

@implementation ErrorHandlerSession

- (ErrorHandlerSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ErrorHandlerSession;
  v2 = -[ErrorHandlerSession init](&v5, "init");
  if (v2)
  {
    v3 = CFUUIDCreate(0LL);
    v2->_sessionID = *(_OWORD *)&CFUUIDGetUUIDBytes(v3);
    CFRelease(v3);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ErrorHandlerSession;
  -[ErrorHandlerSession dealloc](&v3, "dealloc");
}

- (void)setValue:(id)a3 forSessionProperty:(id)a4
{
  sessionProperties = self->_sessionProperties;
  if (a3)
  {
    if (!sessionProperties)
    {
      sessionProperties = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      self->_sessionProperties = sessionProperties;
    }

    -[NSMutableDictionary setObject:forKey:](sessionProperties, "setObject:forKey:", a3, a4);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](sessionProperties, "removeObjectForKey:", a4);
  }

- (id)valueForSessionProperty:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_sessionProperties, "objectForKey:", a3);
}

- (unint64_t)hash
{
  return self->_sessionID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 != objc_opt_class(a3)) {
    return 0;
  }
  id v7 = -[ErrorHandlerSession sessionIdentifier](self, "sessionIdentifier");
  return v7 == [a3 sessionIdentifier];
}

- (int64_t)sessionIdentifier
{
  return self->_sessionID;
}

- (NSDictionary)sessionProperties
{
  return &self->_sessionProperties->super;
}

- (void)setSessionProperties:(id)a3
{
}

@end