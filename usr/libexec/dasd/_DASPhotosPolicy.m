@interface _DASPhotosPolicy
+ (BOOL)isActivity:(id)a3 consideredNonDiscretionary:(id)a4;
+ (BOOL)isCMMActivity:(id)a3;
+ (BOOL)isPhotosForegroundWithContext:(id)a3;
+ (BOOL)isPhotosMessagesAppForegroundWithContext:(id)a3;
+ (BOOL)isPhotosSyncActivity:(id)a3;
+ (BOOL)isPhotosSyncOverriddenWithContext:(id)a3;
+ (BOOL)isiCPLActivity:(id)a3;
+ (BOOL)shouldOverrideForIntentSync:(unint64_t)a3 activity:(id)a4;
+ (id)keyPathForBlockedStartDate;
+ (id)keyPathForPhotosBudgetOverride;
+ (id)keyPathForPhotosIsBlocked;
+ (id)keyPathForPhotosIsUnBlocked;
+ (id)keyPathForSignificantWorkRemaining;
+ (id)photosFocalAppStateChangedPredicate;
+ (id)policyInstance;
+ (void)initialize;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)haveSignificantWorkRemaining:(id)a3;
- (BOOL)intentSyncIsEngaged;
- (BOOL)isDataBudgetAvailableForPhotos:(id)a3;
- (BOOL)isEnergyBudgetAvailableForPhotos:(id)a3;
- (BOOL)isLowPowerModeOverriddenForPhotos:(id)a3;
- (BOOL)photosIsForeground;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldOverrideAll:(id)a3;
- (BOOL)shouldOverrideBudgets:(id)a3;
- (BOOL)shouldOverrideSignificantWork:(id)a3;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASPhotosPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setIntentSyncIsEngaged:(BOOL)a3;
- (void)setPhotosIsForeground:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASPhotosPolicy

+ (id)photosFocalAppStateChangedPredicate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForForegroundApp]( &OBJC_CLASS____CDContextQueries,  "keyPathForForegroundApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:equalToValue:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:equalToValue:",  v2,  @"com.apple.TVPhotos"));

  return v3;
}

+ (void)initialize
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/significantWork"));
  v3 = (void *)qword_100157918;
  qword_100157918 = v2;

  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/budgetOverride"));
  v5 = (void *)qword_100157920;
  qword_100157920 = v4;

  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/isBlocked"));
  v7 = (void *)qword_100157928;
  qword_100157928 = v6;

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/isBlocked/start"));
  v9 = (void *)qword_100157930;
  qword_100157930 = v8;

  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/app/photos/isUnBlocked"));
  v11 = (void *)qword_100157938;
  qword_100157938 = v10;
}

- (id)initializeTriggers
{
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  qword_100157918));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  qword_100157920));
  id v3 = [(id)objc_opt_class(self) photosFocalAppStateChangedPredicate];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v16[0] = @"identifier";
  v16[1] = @"predicate";
  v17[0] = @"com.apple.dueatctivityscheduler.photospolicy.photoswork";
  v17[1] = v11;
  v16[2] = @"deviceSet";
  v16[3] = @"mustWake";
  v17[2] = &off_100121CF0;
  v17[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  4LL));
  v18[0] = v5;
  v14[0] = @"identifier";
  v14[1] = @"predicate";
  v15[0] = @"com.apple.duetactivityscheduler.photospolicy.budgetOverride";
  v15[1] = v10;
  v14[2] = @"deviceSet";
  v14[3] = @"mustWake";
  v15[2] = &off_100121CF0;
  v15[3] = &__kCFBooleanTrue;
  v14[4] = @"qualityOfService";
  v15[4] = &off_100121D08;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));
  v18[1] = v6;
  v12[0] = @"identifier";
  v12[1] = @"predicate";
  v13[0] = @"com.apple.duetactivityscheduler.photospolicy.appchanged";
  v13[1] = v4;
  v12[2] = @"deviceSet";
  v12[3] = @"mustWake";
  v13[2] = &off_100121CF0;
  v13[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  4LL));
  v18[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));

  return v8;
}

- (_DASPhotosPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASPhotosPolicy;
  uint64_t v2 = -[_DASPhotosPolicy init](&v8, "init");
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Photos Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_DASPhotosPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100043A44;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157940 != -1) {
    dispatch_once(&qword_100157940, block);
  }
  return (id)qword_100157948;
}

+ (id)keyPathForSignificantWorkRemaining
{
  return (id)qword_100157918;
}

+ (id)keyPathForPhotosBudgetOverride
{
  return (id)qword_100157920;
}

+ (id)keyPathForPhotosIsBlocked
{
  return (id)qword_100157928;
}

+ (id)keyPathForBlockedStartDate
{
  return (id)qword_100157930;
}

+ (id)keyPathForPhotosIsUnBlocked
{
  return (id)qword_100157938;
}

+ (BOOL)isiCPLActivity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.dasd.DataCollection.PoliciesBlockingCriteria"];

  if ((v5 & 1) != 0)
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    if ([v7 containsString:@"com.apple.cloudphotod.sync.discretionary"])
    {
      unsigned __int8 v6 = 1;
    }

    else
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
      if (([v8 containsString:@"com.apple.KeyValueService.Production.Private.sync"] & 1) != 0 || !objc_msgSend(v3, "requiresNetwork")
        || ([v3 requestsApplicationLaunch] & 1) != 0)
      {
        unsigned __int8 v6 = 0;
      }

      else
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
        if ([v10 containsObject:@"com.apple.TVPhotos"])
        {
          unsigned __int8 v6 = 1;
        }

        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
          unsigned __int8 v6 = [v11 containsObject:@"com.apple.mobileslideshow.PhotosMessagesApp"];
        }
      }
    }
  }

  return v6;
}

+ (BOOL)isPhotosSyncActivity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  unsigned __int8 v4 = [v3 containsString:@"com.apple.cloudphotod.sync.discretionary"];

  return v4;
}

+ (BOOL)isCMMActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresNetwork]
    && ([v3 requestsApplicationLaunch] & 1) == 0)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
    unsigned __int8 v4 = [v5 containsObject:@"com.apple.mobileslideshow.PhotosMessagesApp"];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)shouldOverrideForIntentSync:(unint64_t)a3 activity:(id)a4
{
  id v5 = a4;
  id v6 = [v5 uploadSize];
  if (v6 == (id)_DASActivityTransferSizeZero || (unint64_t)[v5 uploadSize] > 0x19000)
  {
    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = 0;
    if (a3 && (a3 & 0xFFFFFFFFFFFFFAFDLL) == 0)
    {
      id v9 = v5;
      objc_sync_enter(v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 policyResponseMetadata]);
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASNetworkQualityPolicy policyInstance]( &OBJC_CLASS____DASNetworkQualityPolicy,  "policyInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 policyName]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v12]);
      id v14 = [v13 reason];

      objc_sync_exit(v9);
      BOOL v7 = (a3 & 0x100) == 0 || v14 == (id)4;
    }
  }

  return v7;
}

- (BOOL)haveSignificantWorkRemaining:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:qword_100157918]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldOverrideBudgets:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:qword_100157920]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldOverrideSignificantWork:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosBudgetOverride]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosBudgetOverride"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 2) & 1;
}

- (BOOL)shouldOverrideAll:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosBudgetOverride]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosBudgetOverride"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 14) & 1;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.photospolicy.appchanged"])
  {
    unsigned __int8 v8 = +[_DASPhotosPolicy isPhotosForegroundWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosForegroundWithContext:",  v7);
  }

  else if ([v6 isEqualToString:@"com.apple.dueatctivityscheduler.photospolicy.photoswork"])
  {
    unsigned __int8 v8 = -[_DASPhotosPolicy haveSignificantWorkRemaining:](self, "haveSignificantWorkRemaining:", v7);
  }

  else
  {
    if (![v6 isEqualToString:@"com.apple.duetactivityscheduler.photospolicy.budgetOverride"])
    {
      char v9 = 0;
      goto LABEL_8;
    }

    unsigned __int8 v8 = -[_DASPhotosPolicy shouldOverrideBudgets:](self, "shouldOverrideBudgets:", v7);
  }

  char v9 = v8 ^ 1;
LABEL_8:

  return v9;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v4 = a3;
  else {
    unsigned __int8 v5 = [(id)objc_opt_class(self) isCMMActivity:v4];
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (BOOL)isPhotosForegroundWithContext:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForForegroundApp]( &OBJC_CLASS____CDContextQueries,  "keyPathForForegroundApp"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  LOBYTE(v4) = [v5 isEqualToString:@"com.apple.TVPhotos"];
  return (char)v4;
}

+ (BOOL)isPhotosMessagesAppForegroundWithContext:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:qword_100157920]);
  unint64_t v4 = ((unint64_t)[v3 unsignedIntegerValue] >> 3) & 1;

  return v4;
}

+ (BOOL)isActivity:(id)a3 consideredNonDiscretionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v5)
    && (+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosSyncOverriddenWithContext:",  v6)
     || +[_DASPhotosPolicy isPhotosForegroundWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosForegroundWithContext:",  v6))
    || +[_DASPhotosPolicy isCMMActivity:](&OBJC_CLASS____DASPhotosPolicy, "isCMMActivity:", v5)
    && +[_DASPhotosPolicy isPhotosMessagesAppForegroundWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosMessagesAppForegroundWithContext:",  v6);

  return v7;
}

- (BOOL)isLowPowerModeOverriddenForPhotos:(id)a3
{
  return 0;
}

- (BOOL)isDataBudgetAvailableForPhotos:(id)a3
{
  return 1;
}

- (BOOL)isEnergyBudgetAvailableForPhotos:(id)a3
{
  return 1;
}

+ (BOOL)isPhotosSyncOverriddenWithContext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosBudgetOverride]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosBudgetOverride"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 14) & 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Photos Policy");
  BOOL v9 = -[_DASPhotosPolicy isDataBudgetAvailableForPhotos:](self, "isDataBudgetAvailableForPhotos:", v6);
  BOOL v10 = -[_DASPhotosPolicy isEnergyBudgetAvailableForPhotos:](self, "isEnergyBudgetAvailableForPhotos:", v6);
  unsigned int v11 = +[_DASPhotosPolicy isCMMActivity:](&OBJC_CLASS____DASPhotosPolicy, "isCMMActivity:", v7);

  if (!v11) {
    goto LABEL_4;
  }
  BOOL v12 = +[_DASPhotosPolicy isPhotosMessagesAppForegroundWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosMessagesAppForegroundWithContext:",  v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isCMMActivity == 1 && isPhotosMessagesAppForeground == %@ && isDataBudgetAvailable == %@ && isEnergyBudgetAvailable == %@",  v13,  v14,  v15));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v16);

  if (!(v12 & v9 & v10))
  {
LABEL_4:
    unsigned int v18 = -[_DASPhotosPolicy shouldOverrideSignificantWork:](self, "shouldOverrideSignificantWork:", v6);
    unsigned __int8 v19 = +[_DASSystemContext isPluggedIn:](&OBJC_CLASS____DASSystemContext, "isPluggedIn:", v6);
    if (-[_DASPhotosPolicy haveSignificantWorkRemaining:](self, "haveSignificantWorkRemaining:", v6) && (v19 & 1) == 0)
    {
      if (!v18)
      {
        -[_DASPolicyResponseRationale setResponseOptions:]( v8,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 2);
        v22 = @"significantWorkRemaining == 1 && pluggedIn == 0";
        uint64_t v17 = 33LL;
        goto LABEL_12;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"shouldOverrideSignificantWork == %@",  v20));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v21);
    }

    if (!-[_DASPhotosPolicy shouldOverrideAll:](self, "shouldOverrideAll:", v6))
    {
      uint64_t v17 = 0LL;
      goto LABEL_13;
    }

    v22 = @"shouldOverrideAll == 1";
    uint64_t v17 = 67LL;
LABEL_12:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v22));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v23);

    goto LABEL_13;
  }

  uint64_t v17 = 67LL;
LABEL_13:
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v17,  v8,  (double)0x384uLL));

  return v24;
}

- (BOOL)intentSyncIsEngaged
{
  return self->_intentSyncIsEngaged;
}

- (void)setIntentSyncIsEngaged:(BOOL)a3
{
  self->_intentSyncIsEngaged = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (BOOL)photosIsForeground
{
  return self->_photosIsForeground;
}

- (void)setPhotosIsForeground:(BOOL)a3
{
  self->_photosIsForeground = a3;
}

- (void).cxx_destruct
{
}

@end