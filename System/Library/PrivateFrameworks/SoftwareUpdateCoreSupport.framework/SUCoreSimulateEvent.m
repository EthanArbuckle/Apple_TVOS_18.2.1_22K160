@interface SUCoreSimulateEvent
+ (BOOL)supportsSecureCoding;
+ (id)nameForSimulateEventBoolean:(int64_t)a3;
- (NSArray)assetBuildVersions;
- (NSArray)assetProductVersions;
- (NSDictionary)errorUserInfo;
- (NSString)alteration;
- (NSString)assetAttributesPlist;
- (NSString)assetState;
- (NSString)errorDomain;
- (NSString)fsmEvent;
- (NSString)fsmState;
- (NSString)identityName;
- (NSString)moduleName;
- (NSString)untilStop;
- (NSString)updateInfoPlist;
- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forMachine:(id)a5 atEvent:(id)a6 inState:(id)a7 alteration:(id)a8 startAt:(int)a9 endAt:(int)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19;
- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atFunction:(id)a6 startAt:(int)a7 endAt:(int)a8 duration:(int)a9 untilStop:(id)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19;
- (SUCoreSimulateEvent)initWithCoder:(id)a3;
- (id)_actionName;
- (id)_descriptionFSM;
- (id)_descriptionStandard;
- (id)_initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atIdentity:(id)a6 atEvent:(id)a7 inState:(id)a8 alteration:(id)a9 startAt:(int)a10 endAt:(int)a11 duration:(int)a12 untilStop:(id)a13 assetBuildVersions:(id)a14 assetProductVersions:(id)a15 assetAttributesPlist:(id)a16 assetState:(id)a17 updateInfoPlist:(id)a18 errorDomain:(id)a19 errorCode:(int64_t)a20 errorUserInfo:(id)a21 errorRecoverable:(int64_t)a22;
- (id)_triggerName;
- (id)buildErrorWithDescription:(id)a3;
- (id)description;
- (id)summary;
- (int)count;
- (int)duration;
- (int)endAt;
- (int)startAt;
- (int64_t)errorCode;
- (int64_t)errorRecoverable;
- (int64_t)simAction;
- (int64_t)simTrigger;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(int)a3;
@end

@implementation SUCoreSimulateEvent

- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atFunction:(id)a6 startAt:(int)a7 endAt:(int)a8 duration:(int)a9 untilStop:(id)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19
{
  LODWORD(v20) = a9;
  return (SUCoreSimulateEvent *)-[SUCoreSimulateEvent _initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:]( self,  "_initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endA t:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:asse tState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:",  a3,  a4,  a5,  a6,  0LL,  0LL,  0LL,  __PAIR64__(a8, a7),  v20,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19);
}

- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forMachine:(id)a5 atEvent:(id)a6 inState:(id)a7 alteration:(id)a8 startAt:(int)a9 endAt:(int)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19
{
  LODWORD(v20) = 0;
  return (SUCoreSimulateEvent *)-[SUCoreSimulateEvent _initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:]( self,  "_initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endA t:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:asse tState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:",  a3,  a4,  @"fsm",  a5,  a6,  a7,  a8,  __PAIR64__(a10, a9),  v20,  0LL,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19);
}

- (id)_initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atIdentity:(id)a6 atEvent:(id)a7 inState:(id)a8 alteration:(id)a9 startAt:(int)a10 endAt:(int)a11 duration:(int)a12 untilStop:(id)a13 assetBuildVersions:(id)a14 assetProductVersions:(id)a15 assetAttributesPlist:(id)a16 assetState:(id)a17 updateInfoPlist:(id)a18 errorDomain:(id)a19 errorCode:(int64_t)a20 errorUserInfo:(id)a21 errorRecoverable:(int64_t)a22
{
  id v45 = a5;
  id obj = a6;
  id v43 = a6;
  id v38 = a7;
  id v42 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a13;
  id v46 = a14;
  id v44 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  id v41 = a19;
  id v40 = a21;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___SUCoreSimulateEvent;
  v31 = -[SUCoreSimulateEvent init](&v47, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_simAction = a3;
    v31->_simTrigger = a4;
    objc_storeStrong((id *)&v31->_moduleName, a5);
    objc_storeStrong((id *)&v32->_identityName, obj);
    objc_storeStrong((id *)&v32->_fsmEvent, v38);
    objc_storeStrong((id *)&v32->_fsmState, a8);
    objc_storeStrong((id *)&v32->_alteration, a9);
    v32->_count = 0;
    v32->_startAt = a10;
    v32->_endAt = a11;
    v32->_duration = a12;
    objc_storeStrong((id *)&v32->_untilStop, a13);
    objc_storeStrong((id *)&v32->_assetBuildVersions, a14);
    objc_storeStrong((id *)&v32->_assetProductVersions, a15);
    objc_storeStrong((id *)&v32->_assetAttributesPlist, a16);
    objc_storeStrong((id *)&v32->_assetState, a17);
    objc_storeStrong((id *)&v32->_updateInfoPlist, a18);
    objc_storeStrong((id *)&v32->_errorDomain, a19);
    v32->_errorCode = a20;
    objc_storeStrong((id *)&v32->_errorUserInfo, a21);
    v32->_errorRecoverable = a22;
  }

  return v32;
}

- (SUCoreSimulateEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___SUCoreSimulateEvent;
  v5 = -[SUCoreSimulateEvent init](&v39, sel_init);
  if (v5)
  {
    v5->_simAction = [v4 decodeInt64ForKey:@"simAction"];
    v5->_simTrigger = [v4 decodeInt64ForKey:@"simTrigger"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moduleName"];
    moduleName = v5->_moduleName;
    v5->_moduleName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityName"];
    identityName = v5->_identityName;
    v5->_identityName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fsmEvent"];
    fsmEvent = v5->_fsmEvent;
    v5->_fsmEvent = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fsmState"];
    fsmState = v5->_fsmState;
    v5->_fsmState = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alteration"];
    alteration = v5->_alteration;
    v5->_alteration = (NSString *)v14;

    v5->_count = [v4 decodeIntForKey:@"count"];
    v5->_startAt = [v4 decodeIntForKey:@"startAt"];
    v5->_endAt = [v4 decodeIntForKey:@"endAt"];
    v5->_duration = [v4 decodeIntForKey:@"duration"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untilStop"];
    untilStop = v5->_untilStop;
    v5->_untilStop = (NSString *)v16;

    v18 = (void *)MEMORY[0x189604010];
    uint64_t v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"assetBuildVersions"];
    assetBuildVersions = v5->_assetBuildVersions;
    v5->_assetBuildVersions = (NSArray *)v21;

    v23 = (void *)MEMORY[0x189604010];
    uint64_t v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"assetProductVersions"];
    assetProductVersions = v5->_assetProductVersions;
    v5->_assetProductVersions = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetAttributesPlist"];
    assetAttributesPlist = v5->_assetAttributesPlist;
    v5->_assetAttributesPlist = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetState"];
    assetState = v5->_assetState;
    v5->_assetState = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateInfoPlist"];
    updateInfoPlist = v5->_updateInfoPlist;
    v5->_updateInfoPlist = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorDomain"];
    errorDomain = v5->_errorDomain;
    v5->_errorDomain = (NSString *)v34;

    v5->_errorCode = [v4 decodeInt64ForKey:@"errorCode"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorUserInfo"];
    errorUserInfo = v5->_errorUserInfo;
    v5->_errorUserInfo = (NSDictionary *)v36;

    v5->_errorRecoverable = (int)[v4 decodeIntForKey:@"errorRecoverable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t simAction = self->_simAction;
  id v5 = a3;
  [v5 encodeInt64:simAction forKey:@"simAction"];
  [v5 encodeInt64:self->_simTrigger forKey:@"simTrigger"];
  [v5 encodeObject:self->_moduleName forKey:@"moduleName"];
  [v5 encodeObject:self->_identityName forKey:@"identityName"];
  [v5 encodeObject:self->_fsmEvent forKey:@"fsmEvent"];
  [v5 encodeObject:self->_fsmState forKey:@"fsmState"];
  [v5 encodeObject:self->_alteration forKey:@"alteration"];
  [v5 encodeInt:self->_count forKey:@"count"];
  [v5 encodeInt:self->_startAt forKey:@"startAt"];
  [v5 encodeInt:self->_endAt forKey:@"endAt"];
  [v5 encodeInt:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_untilStop forKey:@"untilStop"];
  [v5 encodeObject:self->_assetBuildVersions forKey:@"assetBuildVersions"];
  [v5 encodeObject:self->_assetProductVersions forKey:@"assetProductVersions"];
  [v5 encodeObject:self->_assetAttributesPlist forKey:@"assetAttributesPlist"];
  [v5 encodeObject:self->_assetState forKey:@"assetState"];
  [v5 encodeObject:self->_updateInfoPlist forKey:@"updateInfoPlist"];
  [v5 encodeObject:self->_errorDomain forKey:@"errorDomain"];
  [v5 encodeInt64:self->_errorCode forKey:@"errorCode"];
  [v5 encodeObject:self->_errorUserInfo forKey:@"errorUserInfo"];
  [v5 encodeInt:LODWORD(self->_errorRecoverable) forKey:@"errorRecoverable"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)buildErrorWithDescription:(id)a3
{
  id v4 = a3;
  -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = @"SUCoreError";
  }

  v7 = v6;

  if (-[SUCoreSimulateEvent errorCode](self, "errorCode")) {
    int64_t v8 = -[SUCoreSimulateEvent errorCode](self, "errorCode");
  }
  else {
    int64_t v8 = 9900LL;
  }
  v9 = -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
  uint64_t v10 = (void *)MEMORY[0x189603FC8];
  if (v9)
  {
    v11 = -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
    [v10 dictionaryWithDictionary:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v12 setSafeObject:v4 forKey:*MEMORY[0x1896075E0]];
  int64_t v13 = -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable");
  if (v13)
  {
    if (v13 == 2)
    {
      uint64_t v14 = MEMORY[0x189604A88];
    }

    else
    {
      if (v13 != 1)
      {
        v15 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        uint64_t v16 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"unknown value for errorRecoverable:%d",  -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
        [v15 trackError:@"[SIMULATE] EVENT" forReason:v16 withResult:8116 withError:0];

        goto LABEL_17;
      }

      uint64_t v14 = MEMORY[0x189604A80];
    }

    [v12 setSafeObject:v14 forKey:@"Recoverable"];
  }

- (id)description
{
  if (-[SUCoreSimulateEvent simTrigger](self, "simTrigger") == 3) {
    -[SUCoreSimulateEvent _descriptionFSM](self, "_descriptionFSM");
  }
  else {
    -[SUCoreSimulateEvent _descriptionStandard](self, "_descriptionStandard");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqualToString:@"fsm"];

  id v27 = objc_alloc(NSString);
  uint64_t v28 = -[SUCoreSimulateEvent _actionName](self, "_actionName");
  -[SUCoreSimulateEvent _triggerName](self, "_triggerName");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v33 = -[SUCoreSimulateEvent identityName](self, "identityName");
    -[SUCoreSimulateEvent fsmEvent](self, "fsmEvent");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SUCoreSimulateEvent fsmState](self, "fsmState");
    -[SUCoreSimulateEvent alteration](self, "alteration");
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = -[SUCoreSimulateEvent count](self, "count");
    uint64_t v23 = -[SUCoreSimulateEvent startAt](self, "startAt");
    uint64_t v5 = -[SUCoreSimulateEvent endAt](self, "endAt");
    -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
    -[SUCoreSimulateEvent assetState](self, "assetState");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v11 = @"SUCoreError";
    }

    +[SUCore errorNameForCode:]( &OBJC_CLASS___SUCore,  "errorNameForCode:",  -[SUCoreSimulateEvent errorCode](self, "errorCode"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:]( &OBJC_CLASS___SUCoreSimulateEvent,  "nameForSimulateEventBoolean:",  -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
    uint64_t v22 = v5;
    uint64_t v16 = (void *)v28;
    v17 = (void *)[v27 initWithFormat:@"action:%@ trigger:%@ fsm:%@ event:%@ state:%@ alteration:%@ count:%d startAt:%d endAt:%d assetBuildVersions:%@ assetProductVersions:%@ assetAttributesPlist:%@ assetState:%@ updateInfoPlist:%@ errorDomain:%@ errorCode:%@ errorRecoverable:%@", v28, v34, v33, v32, v31, v30, v25, v23, v22, v29, v6, v7, v8, v9, v11, v14, v15];

    if (v10) {
LABEL_11:
    }

    goto LABEL_12;
  }
  v33 = -[SUCoreSimulateEvent moduleName](self, "moduleName");
  -[SUCoreSimulateEvent identityName](self, "identityName");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = -[SUCoreSimulateEvent count](self, "count");
  uint64_t v24 = -[SUCoreSimulateEvent startAt](self, "startAt");
  uint64_t v12 = -[SUCoreSimulateEvent endAt](self, "endAt");
  uint64_t v13 = -[SUCoreSimulateEvent duration](self, "duration");
  v31 = -[SUCoreSimulateEvent untilStop](self, "untilStop");
  -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreSimulateEvent assetState](self, "assetState");
  -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  if (v9)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v10 = @"SUCoreError";
  }
  v18 = +[SUCore errorNameForCode:]( &OBJC_CLASS___SUCore,  "errorNameForCode:",  -[SUCoreSimulateEvent errorCode](self, "errorCode"));
  +[SUCoreSimulateEvent nameForSimulateEventBoolean:]( &OBJC_CLASS___SUCoreSimulateEvent,  "nameForSimulateEventBoolean:",  -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v12;
  uint64_t v16 = (void *)v28;
  v17 = (void *)[v27 initWithFormat:@"action:%@ trigger:%@ module:%@ function:%@ count:%d startAt:%d endAt:%d duration:%d untilStop:%@ assetBuildVersions:%@ assetProductVersions:%@ assetAttributesPlist:%@ assetState:%@ updateInfoPlist:%@ errorDomain:%@ errorCode:%@ errorRecoverable:%@", v28, v34, v33, v32, v26, v24, v21, v13, v31, v30, v29, v6, v7, v8, v10, v18, v19];

  if (v9) {
    goto LABEL_11;
  }
LABEL_12:

  return v17;
}

- (id)_descriptionFSM
{
  id v17 = objc_alloc(NSString);
  -[SUCoreSimulateEvent _actionName](self, "_actionName");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent _triggerName](self, "_triggerName");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent identityName](self, "identityName");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent fsmEvent](self, "fsmEvent");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent fsmState](self, "fsmState");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent alteration](self, "alteration");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = -[SUCoreSimulateEvent count](self, "count");
  uint64_t v15 = -[SUCoreSimulateEvent startAt](self, "startAt");
  uint64_t v14 = -[SUCoreSimulateEvent endAt](self, "endAt");
  v18 = -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
  v3 = -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
  -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetState](self, "assetState");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  if (v7)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    int64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v8 = @"SUCoreError";
  }
  v9 = +[SUCore errorNameForCode:]( &OBJC_CLASS___SUCore,  "errorNameForCode:",  -[SUCoreSimulateEvent errorCode](self, "errorCode"));
  -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:]( &OBJC_CLASS___SUCoreSimulateEvent,  "nameForSimulateEventBoolean:",  -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
  uint64_t v12 = (void *)[v17 initWithFormat:@"\n[>>>\n               action: %@\n              trigger: %@\n                  fsm: %@\n                event: %@\n                state: %@\n           alteration: %@\n                count: %d\n              startAt: %d\n                endAt: %d\n   assetBuildVersions: %@\n assetProductVersions: %@\n assetAttributesPlist: %@\n           assetState: %@\n      updateInfoPlist: %@\n          errorDomain: %@\n            errorCode: %@\n        errorUserInfo: %@\n     errorRecoverable: %@\n<<<]", v24, v23, v22, v21, v20, v19, v16, v15, v14, v18, v3, v4, v5, v6, v8, v9, v10, v11];

  if (v7) {
  return v12;
  }
}

- (id)_descriptionStandard
{
  id v18 = objc_alloc(NSString);
  -[SUCoreSimulateEvent _actionName](self, "_actionName");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent _triggerName](self, "_triggerName");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent moduleName](self, "moduleName");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent identityName](self, "identityName");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = -[SUCoreSimulateEvent count](self, "count");
  uint64_t v16 = -[SUCoreSimulateEvent startAt](self, "startAt");
  uint64_t v15 = -[SUCoreSimulateEvent endAt](self, "endAt");
  uint64_t v14 = -[SUCoreSimulateEvent duration](self, "duration");
  -[SUCoreSimulateEvent untilStop](self, "untilStop");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
  -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetState](self, "assetState");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  if (v7)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    int64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v8 = @"SUCoreError";
  }
  v9 = +[SUCore errorNameForCode:]( &OBJC_CLASS___SUCore,  "errorNameForCode:",  -[SUCoreSimulateEvent errorCode](self, "errorCode"));
  -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:]( &OBJC_CLASS___SUCoreSimulateEvent,  "nameForSimulateEventBoolean:",  -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
  uint64_t v12 = (void *)[v18 initWithFormat:@"\n[>>>\n               action: %@\n              trigger: %@\n               module: %@\n             function: %@\n                count: %d\n              startAt: %d\n                endAt: %d\n             duration: %d\n            untilStop: %@\n   assetBuildVersions: %@\n assetProductVersions: %@\n assetAttributesPlist: %@\n           assetState: %@\n      updateInfoPlist: %@\n          errorDomain: %@\n            errorCode: %@\n        errorUserInfo: %@\n     errorRecoverable: %@\n<<<]", v24, v23, v22, v21, v17, v16, v15, v14, v20, v19, v3, v4, v5, v6, v8, v9, v10, v11];

  if (v7) {
  return v12;
  }
}

- (id)_actionName
{
  if (-[SUCoreSimulateEvent simAction](self, "simAction") < 0
    || -[SUCoreSimulateEvent simAction](self, "simAction") > 11)
  {
    v3 = @"UNKNOWN";
  }

  else
  {
    v3 = kSUCoreSimulateEventActionName[-[SUCoreSimulateEvent simAction](self, "simAction")];
  }

  return v3;
}

- (id)_triggerName
{
  if (-[SUCoreSimulateEvent simTrigger](self, "simTrigger") < 0
    || -[SUCoreSimulateEvent simTrigger](self, "simTrigger") > 3)
  {
    v3 = @"UNKNOWN";
  }

  else
  {
    v3 = kSUCoreSimulateEventTriggerName[-[SUCoreSimulateEvent simTrigger](self, "simTrigger")];
  }

  return v3;
}

+ (id)nameForSimulateEventBoolean:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)simAction
{
  return self->_simAction;
}

- (int64_t)simTrigger
{
  return self->_simTrigger;
}

- (NSString)moduleName
{
  return self->_moduleName;
}

- (NSString)identityName
{
  return self->_identityName;
}

- (NSString)fsmEvent
{
  return self->_fsmEvent;
}

- (NSString)fsmState
{
  return self->_fsmState;
}

- (NSString)alteration
{
  return self->_alteration;
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (int)startAt
{
  return self->_startAt;
}

- (int)endAt
{
  return self->_endAt;
}

- (int)duration
{
  return self->_duration;
}

- (NSString)untilStop
{
  return self->_untilStop;
}

- (NSArray)assetBuildVersions
{
  return self->_assetBuildVersions;
}

- (NSArray)assetProductVersions
{
  return self->_assetProductVersions;
}

- (NSString)assetAttributesPlist
{
  return self->_assetAttributesPlist;
}

- (NSString)assetState
{
  return self->_assetState;
}

- (NSString)updateInfoPlist
{
  return self->_updateInfoPlist;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSDictionary)errorUserInfo
{
  return self->_errorUserInfo;
}

- (int64_t)errorRecoverable
{
  return self->_errorRecoverable;
}

- (void).cxx_destruct
{
}

@end