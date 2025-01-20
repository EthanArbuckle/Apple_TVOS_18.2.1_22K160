@interface ADBaseService
- (ADBaseService)init;
- (SEL)_selectorForCommandClass:(id)a3 andDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_registerCommandClass:(id)a3 forDomain:(id)a4 withSelector:(SEL)a5 forRegistry:(id)a6;
- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADBaseService

- (ADBaseService)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADBaseService;
  v2 = -[ADBaseService init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[ADService setIdentifier:](v3, "setIdentifier:", v6);

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[ADBaseService _registerCommandHandlersWithRegistry:](v3, "_registerCommandHandlersWithRegistry:", v7);
    v8 = (NSDictionary *)-[NSMutableDictionary copy](v7, "copy");
    commandRegistry = v3->_commandRegistry;
    v3->_commandRegistry = v8;
  }

  return v3;
}

- (void)_registerCommandClass:(id)a3 forDomain:(id)a4 withSelector:(SEL)a5 forRegistry:(id)a6
{
  id v13 = a4;
  id v9 = a6;
  if (v9)
  {
    id v10 = a3;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v13]);
    if (!v11)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v9 setObject:v11 forKey:v13];
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", a5));
    [v11 setObject:v12 forKey:v10];
  }
}

- (SEL)_selectorForCommandClass:(id)a3 andDomain:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_commandRegistry, "objectForKey:", a4));
  v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
    id v10 = v9;
    if (v9) {
      objc_super v11 = (const char *)[v9 pointerValue];
    }
    else {
      objc_super v11 = 0LL;
    }
  }

  else
  {
    objc_super v11 = 0LL;
  }

  return v11;
}

- (id)domains
{
  return -[NSDictionary allKeys](self->_commandRegistry, "allKeys");
}

- (id)commandsForDomain:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_commandRegistry, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  return v4;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v13 = a4;
  id v9 = a6;
  id v10 = a3;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 encodedClassName]);
  v12 = -[ADBaseService _selectorForCommandClass:andDomain:](self, "_selectorForCommandClass:andDomain:", v11, v13);

  if (v12) {
    objc_msgSend(self, v12, v10, v9);
  }
  else {
    -[ADBaseService _unhandledCommand:forDomain:completion:]( self,  "_unhandledCommand:forDomain:completion:",  v10,  v13,  v9);
  }
}

- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    v7 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Command not supported");
    (*((void (**)(id, SACommandFailed *, void))a5 + 2))(v6, v7, 0LL);
  }

- (void).cxx_destruct
{
}

@end