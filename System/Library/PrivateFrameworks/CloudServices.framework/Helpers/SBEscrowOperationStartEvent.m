@interface SBEscrowOperationStartEvent
- (SBEscrowOperationStartEvent)initWithRequest:(id)a3 type:(unint64_t)a4;
- (SBEscrowOperationStartEvent)initWithRequest:(id)a3 type:(unint64_t)a4 context:(id)a5;
- (id)endEventWithResults:(id)a3 error:(id)a4;
- (id)endEventWithResults:(id)a3 error:(id)a4 context:(id)a5;
@end

@implementation SBEscrowOperationStartEvent

- (SBEscrowOperationStartEvent)initWithRequest:(id)a3 type:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 activityUUID]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activityLabel]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);

  v14 = -[SBEscrowOperationEvent initWithOperationId:activityId:activityLabel:recordId:type:context:]( self,  "initWithOperationId:activityId:activityLabel:recordId:type:context:",  v10,  v11,  v12,  v13,  a4,  v8);
  return v14;
}

- (SBEscrowOperationStartEvent)initWithRequest:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___ESADefaultOperationLoggingContext);
  id v8 = -[SBEscrowOperationStartEvent initWithRequest:type:context:](self, "initWithRequest:type:context:", v6, a4, v7);

  return v8;
}

- (id)endEventWithResults:(id)a3 error:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[SBEscrowOperationEndEvent initWithStartEvent:results:error:context:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationEndEvent),  "initWithStartEvent:results:error:context:",  self,  v10,  v9,  v8);

  return v11;
}

- (id)endEventWithResults:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___ESADefaultOperationLoggingContext);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SBEscrowOperationStartEvent endEventWithResults:error:context:]( self,  "endEventWithResults:error:context:",  v7,  v6,  v8));

  return v9;
}

@end