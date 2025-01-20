@interface DebugHierarchyRequest
- (id)lldbExpressionInPlaceOutError:(id *)a3;
- (id)lldbExpressionReturningNSDataOutError:(id *)a3;
@end

@implementation DebugHierarchyRequest

- (id)lldbExpressionReturningNSDataOutError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequest serializedCompatibilitySupportRepresentation]( self,  "serializedCompatibilitySupportRepresentation"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequest serializedCompatibilitySupportRepresentation]( self,  "serializedCompatibilitySupportRepresentation"));
LABEL_3:
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 base64EncodedStringWithOptions:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(id)[[(Class)objc_getClass(DBGTargetHub) sharedHub] performRequestWithRequestInBase64:@%@]",  v7));

    id v9 = 0LL;
    goto LABEL_4;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v12 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v11 generateJSONDataWithError:&v12]);
  id v9 = v12;

  if (!v9) {
    goto LABEL_3;
  }
  if (a3)
  {
    id v9 = v9;
    v8 = 0LL;
    *a3 = v9;
  }

  else
  {
    v8 = 0LL;
  }

- (id)lldbExpressionInPlaceOutError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequest serializedCompatibilitySupportRepresentation]( self,  "serializedCompatibilitySupportRepresentation"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequest serializedCompatibilitySupportRepresentation]( self,  "serializedCompatibilitySupportRepresentation"));
LABEL_3:
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 base64EncodedStringWithOptions:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(BOOL)[[(Class)objc_getClass(DebugHierarchyTargetHub) sharedHub] performRequestInPlaceWithRequestInBase64:@%@]",  v7));

    id v9 = 0LL;
    goto LABEL_4;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v12 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v11 generateJSONDataWithError:&v12]);
  id v9 = v12;

  if (!v9) {
    goto LABEL_3;
  }
  if (a3)
  {
    id v9 = v9;
    v8 = 0LL;
    *a3 = v9;
  }

  else
  {
    v8 = 0LL;
  }

@end