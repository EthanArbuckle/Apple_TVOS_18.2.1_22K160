@interface ATAOpenURLController
- (id)completionHandler;
- (void)prepareParsedOpenURL:(id)a3 withCompletionHandler:(id)a4;
- (void)setCompletionHandler:(id)a3;
@end

@implementation ATAOpenURLController

- (void)prepareParsedOpenURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (!v6)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"parsedOpenURL");
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"completionHandler");
    goto LABEL_3;
  }

  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end