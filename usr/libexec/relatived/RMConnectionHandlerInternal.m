@interface RMConnectionHandlerInternal
- (BOOL)isEqual:(id)a3;
@end

@implementation RMConnectionHandlerInternal

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___RMConnectionHandlerInternal);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    msgHandler = self->_msgHandler;
    if (v4)
    {
      v7 = (RMConnectionEndpoint *)*((id *)v4 + 1);
      if (msgHandler != (RMConnectionDataDelegate *)v7)
      {
LABEL_4:
        BOOL v8 = 0;
LABEL_8:

        goto LABEL_9;
      }

      v7 = (RMConnectionEndpoint *)*((void *)v4 + 2);
    }

    else
    {
      v7 = 0LL;
      if (msgHandler) {
        goto LABEL_4;
      }
      msgHandler = 0LL;
    }

    BOOL v8 = self->_endpoint == v7;
    v7 = (RMConnectionEndpoint *)msgHandler;
    goto LABEL_8;
  }

  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void).cxx_destruct
{
}

@end