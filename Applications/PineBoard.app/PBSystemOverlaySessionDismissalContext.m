@interface PBSystemOverlaySessionDismissalContext
- (BOOL)dismissedByClient;
- (NSError)error;
- (NSSecureCoding)result;
- (PBSystemOverlaySessionDismissalContext)initWithResult:(id)a3 error:(id)a4 dismissedByClient:(BOOL)a5;
@end

@implementation PBSystemOverlaySessionDismissalContext

- (PBSystemOverlaySessionDismissalContext)initWithResult:(id)a3 error:(id)a4 dismissedByClient:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBSystemOverlaySessionDismissalContext;
  v11 = -[PBSystemOverlaySessionDismissalContext init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_result, a3);
    objc_storeStrong((id *)&v12->_error, a4);
    v12->_dismissedByClient = a5;
  }

  return v12;
}

- (NSSecureCoding)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)dismissedByClient
{
  return self->_dismissedByClient;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end