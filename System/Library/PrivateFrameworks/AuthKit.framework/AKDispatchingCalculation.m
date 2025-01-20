@interface AKDispatchingCalculation
+ (id)calculationWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6;
- (AKDispatchingCalculation)initWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6;
- (NSDate)dispatchDate;
- (NSString)algorithmIdentifier;
- (NSString)headerValue;
- (id)debugDescription;
- (unint64_t)dispatchCounter;
- (void)dealloc;
- (void)relinquish;
@end

@implementation AKDispatchingCalculation

- (AKDispatchingCalculation)initWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AKDispatchingCalculation;
  v14 = -[AKDispatchingCalculation init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dispatchDate, a3);
    v15->_dispatchCounter = a4;
    objc_storeStrong((id *)&v15->_algorithmIdentifier, a5);
    id v16 = objc_retainBlock(v13);
    id relinquishmentHandler = v15->_relinquishmentHandler;
    v15->_id relinquishmentHandler = v16;
  }

  return v15;
}

+ (id)calculationWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDate:v12 counter:a4 algorithm:v11 relinquisher:v10];

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AKDispatchingCalculation;
  -[AKDispatchingCalculation dealloc](&v3, "dealloc");
}

- (NSString)headerValue
{
  unint64_t v3 = -[AKDispatchingCalculation dispatchCounter](self, "dispatchCounter");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchingCalculation algorithmIdentifier](self, "algorithmIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu%@", v3, v4));

  return (NSString *)v5;
}

- (void)relinquish
{
  id relinquishmentHandler = (void (**)(id, SEL))self->_relinquishmentHandler;
  if (relinquishmentHandler)
  {
    relinquishmentHandler[2](relinquishmentHandler, a2);
    id relinquishmentHandler = (void (**)(id, SEL))self->_relinquishmentHandler;
  }

  self->_id relinquishmentHandler = 0LL;
}

- (id)debugDescription
{
  unint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  algorithmIdentifier = self->_algorithmIdentifier;
  unint64_t dispatchCounter = self->_dispatchCounter;
  dispatchDate = self->_dispatchDate;
  id v9 = objc_retainBlock(self->_relinquishmentHandler);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchingCalculation headerValue](self, "headerValue"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p {\n\tdispatchDate: %@,\n\tdispatchCounter: %lu,\n\talgorithmIdentifier: %@,\n\trelinquishmentHandler: %@,\n\theaderValue: %@,\n}>",  v5,  self,  dispatchDate,  dispatchCounter,  algorithmIdentifier,  v9,  v10));

  return v11;
}

- (NSDate)dispatchDate
{
  return self->_dispatchDate;
}

- (NSString)algorithmIdentifier
{
  return self->_algorithmIdentifier;
}

- (unint64_t)dispatchCounter
{
  return self->_dispatchCounter;
}

- (void).cxx_destruct
{
}

@end