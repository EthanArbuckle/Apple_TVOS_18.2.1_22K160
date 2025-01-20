@interface DMDActivationPredicateObserver
- (BOOL)lastPredicateEvaluationValue;
- (DMDActivationPredicateObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 predicate:(id)a5;
- (DMDActivationPredicateObserverDelegate)delegate;
- (NSString)predicateType;
- (NSString)uniqueIdentifier;
- (id)calendarForIdentifier:(id)a3;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (void)invalidate;
- (void)reportActivationPredicateObserverDidTrigger;
- (void)setDelegate:(id)a3;
- (void)setLastPredicateEvaluationValue:(BOOL)a3;
@end

@implementation DMDActivationPredicateObserver

- (DMDActivationPredicateObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateObserver;
  v11 = -[DMDActivationPredicateObserver init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    v12->_lastPredicateEvaluationValue = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 payloadType]);
    v14 = (NSString *)[v13 copy];
    predicateType = v12->_predicateType;
    v12->_predicateType = v14;

    v16 = (NSString *)[v9 copy];
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = v16;
  }

  return v12;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  return 0LL;
}

- (void)invalidate
{
}

- (id)metadata
{
  v8[0] = DMFDeclarationStatePredicateTypeKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
  v9[0] = v3;
  v8[1] = DMFDeclarationStatePredicateLastEvaluationValueKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  id v6 = [v5 mutableCopy];

  return v6;
}

- (void)reportActivationPredicateObserverDidTrigger
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "activationPredicateObserverDidTrigger:") & 1) != 0)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10000B3C8;
    v4[3] = &unk_10009D820;
    id v5 = v3;
    id v6 = self;
    dispatch_async(&_dispatch_main_q, v4);
  }
}

- (id)calendarForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = NSCalendarIdentifierGregorian;
  if ([v3 isEqualToString:@"buddhist"])
  {
    id v5 = (id *)&NSCalendarIdentifierBuddhist;
LABEL_32:
    id v6 = (NSString *)*v5;

    v4 = v6;
    goto LABEL_33;
  }

  if ([v3 isEqualToString:@"chinese"])
  {
    id v5 = (id *)&NSCalendarIdentifierChinese;
    goto LABEL_32;
  }

  if ([v3 isEqualToString:@"coptic"])
  {
    id v5 = (id *)&NSCalendarIdentifierCoptic;
    goto LABEL_32;
  }

  if ([v3 isEqualToString:@"ethiopic-amete-alem"])
  {
    id v5 = (id *)&NSCalendarIdentifierEthiopicAmeteAlem;
    goto LABEL_32;
  }

  if ([v3 isEqualToString:@"ethiopic-amete-mihret"])
  {
    id v5 = (id *)&NSCalendarIdentifierEthiopicAmeteMihret;
    goto LABEL_32;
  }

  if (([v3 isEqualToString:@"gregorian"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"hebrew"])
    {
      id v5 = (id *)&NSCalendarIdentifierHebrew;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"indian"])
    {
      id v5 = (id *)&NSCalendarIdentifierIndian;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"islamic"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamic;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"islamic-civil"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamicCivil;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"islamic-tbla"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamicTabular;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"islamic-umalqura"])
    {
      id v5 = (id *)&NSCalendarIdentifierIslamicUmmAlQura;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"iso8601"])
    {
      id v5 = (id *)&NSCalendarIdentifierISO8601;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"japanese"])
    {
      id v5 = (id *)&NSCalendarIdentifierJapanese;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"persian"])
    {
      id v5 = (id *)&NSCalendarIdentifierPersian;
      goto LABEL_32;
    }

    if ([v3 isEqualToString:@"roc"])
    {
      id v5 = (id *)&NSCalendarIdentifierRepublicOfChina;
      goto LABEL_32;
    }
  }

- (DMDActivationPredicateObserverDelegate)delegate
{
  return (DMDActivationPredicateObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)lastPredicateEvaluationValue
{
  return self->_lastPredicateEvaluationValue;
}

- (void)setLastPredicateEvaluationValue:(BOOL)a3
{
  self->_lastPredicateEvaluationValue = a3;
}

- (NSString)predicateType
{
  return self->_predicateType;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
}

@end