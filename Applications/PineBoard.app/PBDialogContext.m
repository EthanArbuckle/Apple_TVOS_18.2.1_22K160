@interface PBDialogContext
+ (PBDialogContext)contextWithViewController:(id)a3;
+ (PBDialogContext)contextWithViewService:(id)a3;
+ (PBDialogContext)contextWithViewServiceName:(id)a3 className:(id)a4;
- (NSString)identifier;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBDialogContext)initWithIdentifier:(id)a3 provider:(id)a4;
- (PBSystemOverlayUIProvider)provider;
- (void)_invalidate;
- (void)setCoordinatedTransitionToken:(id)a3;
@end

@implementation PBDialogContext

- (PBDialogContext)initWithIdentifier:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBDialogContext;
  v8 = -[PBDialogContext init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provider, a4);
    if (v6)
    {
      v10 = (NSString *)[v6 copy];
      identifier = v9->_identifier;
      v9->_identifier = v10;
    }

    else
    {
      identifier = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSString UUIDString](identifier, "UUIDString"));
      v13 = v9->_identifier;
      v9->_identifier = (NSString *)v12;
    }
  }

  return v9;
}

+ (PBDialogContext)contextWithViewController:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A9C60;
  v10[3] = &unk_1003D2108;
  id v11 = v4;
  id v6 = v4;
  id v7 = -[PBBlockSystemOverlayUIProvider initWithBlock:](v5, "initWithBlock:", v10);
  id v8 = [objc_alloc((Class)a1) initWithIdentifier:0 provider:v7];

  return (PBDialogContext *)v8;
}

+ (PBDialogContext)contextWithViewService:(id)a3
{
  id v4 = a3;
  v5 = -[_PBDialogManagerViewServiceUIProvider initWithViewController:]( objc_alloc(&OBJC_CLASS____PBDialogManagerViewServiceUIProvider),  "initWithViewController:",  v4);

  id v6 = [objc_alloc((Class)a1) initWithIdentifier:0 provider:v5];
  return (PBDialogContext *)v6;
}

+ (PBDialogContext)contextWithViewServiceName:(id)a3 className:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[_PBDialogManagerViewServiceUIProvider initWithService:className:]( objc_alloc(&OBJC_CLASS____PBDialogManagerViewServiceUIProvider),  "initWithService:className:",  v7,  v6);

  id v9 = [objc_alloc((Class)a1) initWithIdentifier:0 provider:v8];
  return (PBDialogContext *)v9;
}

- (void)_invalidate
{
  provider = self->_provider;
  self->_provider = 0LL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PBSystemOverlayUIProvider)provider
{
  return self->_provider;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (void)setCoordinatedTransitionToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end