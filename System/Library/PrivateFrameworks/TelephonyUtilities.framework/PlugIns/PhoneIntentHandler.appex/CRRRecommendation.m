@interface CRRRecommendation
- (BOOL)isFoundInAppsSuggestion;
- (CRRRecommendation)initWithFullyResolvedPerson:(id)a3;
- (CRRRecommendation)initWithPerson:(id)a3;
- (CRRRecommendation)initWithRecommendationType:(int64_t)a3 persons:(id)a4;
- (CRRRecommendation)initWithSiriInferencePerson:(id)a3;
- (NSArray)persons;
- (id)recommendedResult;
- (int64_t)recommendationType;
@end

@implementation CRRRecommendation

- (CRRRecommendation)initWithPerson:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personHandle]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  id v7 = [v6 length];

  if (v7) {
    v8 = -[CRRRecommendation initWithFullyResolvedPerson:](self, "initWithFullyResolvedPerson:", v4);
  }
  else {
    v8 = -[CRRRecommendation initWithSiriInferencePerson:](self, "initWithSiriInferencePerson:", v4);
  }
  v9 = v8;

  return v9;
}

- (CRRRecommendation)initWithSiriInferencePerson:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scoredAlternatives]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  uint64_t v7 = (uint64_t)[v6 recommendation];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 alternatives]);

  v9 = &__NSArray0__struct;
  if (v8) {
    v9 = v8;
  }
  id v10 = v9;

  if (![v6 recommendation])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 person]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 personHandle]);
    unsigned int v13 = [v12 isSuggested];

    if (v13) {
      uint64_t v7 = 1LL;
    }
  }

  v14 = -[CRRRecommendation initWithRecommendationType:persons:](self, "initWithRecommendationType:persons:", v7, v10);

  return v14;
}

- (CRRRecommendation)initWithFullyResolvedPerson:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  v6 = -[CRRRecommendation initWithRecommendationType:persons:]( self,  "initWithRecommendationType:persons:",  0LL,  v5,  v8);
  return v6;
}

- (CRRRecommendation)initWithRecommendationType:(int64_t)a3 persons:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CRRRecommendation;
  id v8 = -[CRRRecommendation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_recommendationType = a3;
    objc_storeStrong((id *)&v8->_persons, a4);
  }

  return v9;
}

- (BOOL)isFoundInAppsSuggestion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRRRecommendation persons](self, "persons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personHandle]);
  unsigned __int8 v5 = [v4 isSuggested];

  return v5;
}

- (id)recommendedResult
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRRRecommendation persons](self, "persons"));
  id v4 = [v3 count];

  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRRRecommendation persons](self, "persons"));
    id v6 = [v5 count];

    if (v6 == (id)1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRRRecommendation persons](self, "persons"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);

      int64_t v9 = -[CRRRecommendation recommendationType](self, "recommendationType");
      if ((unint64_t)(v9 - 1) >= 2)
      {
        if (v9)
        {
          id v13 = IntentHandlerDefaultLog();
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100020D7C(v14);
          }

          uint64_t v10 = objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult unsupported](&OBJC_CLASS___INPersonResolutionResult, "unsupported"));
        }

        else
        {
          uint64_t v10 = objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INPersonResolutionResult,  "successWithResolvedPerson:",  v8));
        }
      }

      else
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult confirmationRequiredWithPersonToConfirm:]( &OBJC_CLASS___INPersonResolutionResult,  "confirmationRequiredWithPersonToConfirm:",  v8));
      }

      objc_super v11 = (void *)v10;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRRRecommendation persons](self, "persons"));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INPersonResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v12));
    }
  }

  else
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult unsupported](&OBJC_CLASS___INPersonResolutionResult, "unsupported"));
  }

  id v15 = IntentHandlerDefaultLog();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100020D08((uint64_t)v11, v16);
  }

  return v11;
}

- (int64_t)recommendationType
{
  return self->_recommendationType;
}

- (NSArray)persons
{
  return self->_persons;
}

- (void).cxx_destruct
{
}

@end