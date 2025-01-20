@interface PanicPatternMatchingSupport
- (BOOL)lookForKnownPanic:(id)a3;
- (BOOL)takeAction;
- (id)createPanicCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (id)init:(BOOL)a3;
- (objcDiagnosticPatternMatching)patternMatching;
- (void)setPatternMatching:(id)a3;
- (void)setTakeAction:(BOOL)a3;
@end

@implementation PanicPatternMatchingSupport

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  if (!NSClassFromString(@"objcDiagnosticPatternMatching"))
  {
LABEL_10:
    v12 = 0LL;
    goto LABEL_11;
  }

  -[PanicPatternMatchingSupport setTakeAction:](self, "setTakeAction:", v3);
  v5 = -[objcDiagnosticPatternMatching initWithType:]( objc_alloc(&OBJC_CLASS___objcDiagnosticPatternMatching),  "initWithType:",  2LL);
  -[PanicPatternMatchingSupport setPatternMatching:](self, "setPatternMatching:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));
  v7 = (os_log_s *)qword_100036568;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to initialize Pattern Matching",  (uint8_t *)&v14,  2u);
    }

    goto LABEL_10;
  }

  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));
    unsigned int v10 = [v9 isPatternPayloadAvailable];
    v11 = "No";
    if (v10) {
      v11 = "Yes";
    }
    int v14 = 136315138;
    v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Pattern Matching initialized with payload available: %s",  (uint8_t *)&v14,  0xCu);
  }

  v12 = self;
LABEL_11:

  return v12;
}

- (id)createPanicCriterials:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (NSClassFromString(@"objcPanicCriterials")) {
    id v13 = [[objcPanicCriterials alloc] initWithCriterials:v9 :v10 :v11 :v12];
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)lookForKnownPanic:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PanicPatternMatchingSupport patternMatching](self, "patternMatching"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 getPanicCriterials]);
    unsigned __int8 v8 = [v6 lookForPattern:v7 :0];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (objcDiagnosticPatternMatching)patternMatching
{
  return (objcDiagnosticPatternMatching *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPatternMatching:(id)a3
{
}

- (BOOL)takeAction
{
  return self->_takeAction;
}

- (void)setTakeAction:(BOOL)a3
{
  self->_takeAction = a3;
}

- (void).cxx_destruct
{
}

@end