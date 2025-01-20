@interface PDAccountManagerExportTransactionRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSDate)statementEndDate;
- (NSDate)statementStartDate;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)fileFormat;
- (NSString)statementIdentifier;
- (NSTimeZone)productTimeZone;
- (PDAccountManagerExportTransactionRequest)initWithAccountIdentifier:(id)a3 statementIdentifier:(id)a4 type:(unint64_t)a5 trigger:(unint64_t)a6 statementStartDate:(id)a7 statementEndDate:(id)a8 fileFormat:(id)a9 productTimeZone:(id)a10;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (unint64_t)trigger;
- (unint64_t)type;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithResponse:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerExportTransactionRequest

- (PDAccountManagerExportTransactionRequest)initWithAccountIdentifier:(id)a3 statementIdentifier:(id)a4 type:(unint64_t)a5 trigger:(unint64_t)a6 statementStartDate:(id)a7 statementEndDate:(id)a8 fileFormat:(id)a9 productTimeZone:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a7;
  id v24 = a8;
  id v16 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PDAccountManagerExportTransactionRequest;
  v18 = -[PDAccountManagerExportTransactionRequest init](&v28, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountIdentifier, a3);
    objc_storeStrong((id *)&v19->_statementIdentifier, a4);
    v19->_type = a5;
    v19->_trigger = a6;
    objc_storeStrong((id *)&v19->_fileFormat, a9);
    objc_storeStrong((id *)&v19->_productTimeZone, a10);
    objc_storeStrong((id *)&v19->_statementStartDate, a7);
    objc_storeStrong((id *)&v19->_statementEndDate, a8);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v19->_completionHandlers;
    v19->_completionHandlers = v20;
  }

  return v19;
}

- (unint64_t)requestType
{
  return 12LL;
}

- (id)requestIdentifier
{
  v3 = sub_1003DE65C(-[PDAccountManagerExportTransactionRequest requestType](self, "requestType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  accountIdentifier = self->_accountIdentifier;
  statementIdentifier = self->_statementIdentifier;
  uint64_t v7 = PKAccountWebServiceExportTransactionDataRequestTypeToString(self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@-%@-%@-%@-%@",  v4,  accountIdentifier,  statementIdentifier,  v8,  self->_statementStartDate,  self->_statementEndDate,  self->_fileFormat));

  return v9;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 == (id)-[PDAccountManagerExportTransactionRequest requestType](self, "requestType"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerExportTransactionRequest requestIdentifier](self, "requestIdentifier"));
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      unsigned __int8 v11 = 1;
    }

    else
    {
      unsigned __int8 v11 = 0;
      if (v8 && v9) {
        unsigned __int8 v11 = [v8 isEqualToString:v9];
      }
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);
  }

- (void)callCompletionsWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_completionHandlers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12) + 16LL))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12));
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  id v5 = sub_1003DE65C(-[PDAccountManagerExportTransactionRequest requestType](self, "requestType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerExportTransactionRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"accountIdentifier: '%@'; ", self->_accountIdentifier);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"statementIdentifier: '%@'; ",
    self->_statementIdentifier);
  uint64_t v8 = PKAccountWebServiceExportTransactionDataRequestTypeToString(self->_type);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"type: '%@'; ", v9);

  uint64_t v10 = PKAccountWebServiceTransactionDataTriggerToString(self->_trigger);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"trigger: '%@'; ", v11);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"statementStartDate: '%@'; ", self->_statementStartDate);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"statementEndDate: '%@'; ", self->_statementEndDate);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"fileFormat: '%@'; ", self->_fileFormat);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (NSString)fileFormat
{
  return self->_fileFormat;
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (NSDate)statementStartDate
{
  return self->_statementStartDate;
}

- (NSDate)statementEndDate
{
  return self->_statementEndDate;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end