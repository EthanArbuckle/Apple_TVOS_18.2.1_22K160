@interface IDSDRegistrationListener
+ (id)sharedInstance;
- (IDSDRegistrationListener)init;
- (NSMutableSet)completionBlocks;
- (id)addBlockForRegistrationCompletion:(id)a3;
- (void)_callBlocksWithResult:(BOOL)a3 registrations:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4;
- (void)removeBlockForIdentifier:(id)a3;
- (void)setCompletionBlocks:(id)a3;
@end

@implementation IDSDRegistrationListener

+ (id)sharedInstance
{
  if (qword_1009BED80 != -1) {
    dispatch_once(&qword_1009BED80, &stru_1008FD320);
  }
  return (id)qword_1009BED88;
}

- (IDSDRegistrationListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSDRegistrationListener;
  v2 = -[IDSDRegistrationListener init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v3 addListener:v2];

    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registrationListener](&OBJC_CLASS___IMRGLog, "registrationListener"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting Up", v6, 2u);
    }
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDRegistrationListener;
  -[IDSDRegistrationListener dealloc](&v4, "dealloc");
}

- (id)addBlockForRegistrationCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_completionBlocks)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionBlocks = self->_completionBlocks;
    self->_completionBlocks = v5;
  }

  id v7 = [v4 copy];

  v8 = self->_completionBlocks;
  id v9 = objc_retainBlock(v7);
  -[NSMutableSet addObject:](v8, "addObject:", v9);

  id v10 = objc_retainBlock(v7);
  return v10;
}

- (void)removeBlockForIdentifier:(id)a3
{
}

- (void)_callBlocksWithResult:(BOOL)a3 registrations:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = self->_completionBlocks;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13) + 16LL))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13));
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v11);
  }
}

- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registrationListener](&OBJC_CLASS___IMRGLog, "registrationListener"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Told all registrations succeeded, calling completion blocks",  v7,  2u);
  }

  -[IDSDRegistrationListener _callBlocksWithResult:registrations:error:]( self,  "_callBlocksWithResult:registrations:error:",  1LL,  v5,  0LL);
}

- (NSMutableSet)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end