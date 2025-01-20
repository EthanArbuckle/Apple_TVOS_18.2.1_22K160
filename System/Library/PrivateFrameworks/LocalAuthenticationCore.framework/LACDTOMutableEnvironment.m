@interface LACDTOMutableEnvironment
+ (id)nullInstance;
- (BOOL)_isBiometryUsable;
- (BOOL)allowsAuthenticationFallbacks;
- (BOOL)allowsGracePeriodUI;
- (BOOL)hasExpiredBiometry;
- (BOOL)inFamiliarLocation;
- (BOOL)isConfirmed;
- (BOOL)isDTOActive;
- (BOOL)isDTOEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGracePeriodActive;
- (BOOL)isStrictModeEnabled;
- (LACDTOBiometryWatchdogPack)biometryWatchdogPack;
- (LACDTOFeatureState)featureState;
- (LACDTOGracePeriodState)gracePeriodState;
- (LACDTOLocationState)locationState;
- (LACDTOLostModeState)lostModeState;
- (LACDTORatchetState)ratchetState;
- (NSString)description;
- (void)setBiometryWatchdogPack:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setFeatureState:(id)a3;
- (void)setGracePeriodState:(id)a3;
- (void)setLocationState:(id)a3;
- (void)setLostModeState:(id)a3;
- (void)setRatchetState:(id)a3;
@end

@implementation LACDTOMutableEnvironment

- (BOOL)allowsAuthenticationFallbacks
{
  return -[LACDTOMutableEnvironment inFamiliarLocation](self, "inFamiliarLocation")
      || !-[LACDTOMutableEnvironment isDTOActive](self, "isDTOActive")
      || -[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry");
}

- (BOOL)allowsGracePeriodUI
{
  return -[LACDTOMutableEnvironment isGracePeriodActive](self, "isGracePeriodActive")
      && -[LACDTOMutableEnvironment isDTOActive](self, "isDTOActive")
      && -[LACDTOMutableEnvironment _isBiometryUsable](self, "_isBiometryUsable");
}

- (BOOL)isGracePeriodActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isActive];

  return v3;
}

- (BOOL)hasExpiredBiometry
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 rawValue] == 4;

  return v3;
}

- (BOOL)isDTOEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)isDTOActive
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isEnabled])
  {
    v4 = -[LACDTOMutableEnvironment featureState](self, "featureState");
    char v5 = [v4 isAvailable];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isStrictModeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isStrictModeEnabled];

  return v3;
}

- (BOOL)inFamiliarLocation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isInFamiliarLocation];

  return v3;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableEnvironment);
  -[LACDTOMutableEnvironment setConfirmed:](v2, "setConfirmed:", 0LL);
  +[LACDTOBiometryWatchdogPack nullInstance](&OBJC_CLASS___LACDTOBiometryWatchdogPack, "nullInstance");
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setBiometryWatchdogPack:](v2, "setBiometryWatchdogPack:", v3);
  v4 = +[LACDTOMutableFeatureState nullInstance](&OBJC_CLASS___LACDTOMutableFeatureState, "nullInstance");
  -[LACDTOMutableEnvironment setFeatureState:](v2, "setFeatureState:", v4);

  +[LACDTOLocationState nullInstance](&OBJC_CLASS___LACDTOLocationState, "nullInstance");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableEnvironment setLocationState:](v2, "setLocationState:", v5);
  v6 = +[LACDTOLostModeState nullInstance](&OBJC_CLASS___LACDTOLostModeState, "nullInstance");
  -[LACDTOMutableEnvironment setLostModeState:](v2, "setLostModeState:", v6);
  v7 = +[LACDTORatchetState nullInstance](&OBJC_CLASS___LACDTORatchetState, "nullInstance");
  -[LACDTOMutableEnvironment setRatchetState:](v2, "setRatchetState:", v7);
  v8 = +[LACDTOGracePeriodState nullInstance](&OBJC_CLASS___LACDTOGracePeriodState, "nullInstance");
  -[LACDTOMutableEnvironment setGracePeriodState:](v2, "setGracePeriodState:", v8);

  return v2;
}

- (BOOL)_isBiometryUsable
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 requirements];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)description
{
  v52[14] = *MEMORY[0x1895F89C0];
  int v3 = os_variant_allows_internal_security_policies();
  v47 = (void *)NSString;
  uint64_t v46 = objc_opt_class();
  v4 = (void *)NSString;
  if (-[LACDTOMutableEnvironment isConfirmed](self, "isConfirmed")) {
    BOOL v5 = @"YES";
  }
  else {
    BOOL v5 = @"NO";
  }
  [v4 stringWithFormat:@"confirmed: %@", v5];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v51;
  v6 = (void *)NSString;
  if (-[LACDTOMutableEnvironment isDTOEnabled](self, "isDTOEnabled")) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v6 stringWithFormat:@"isDTOEnabled: %@", v7];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v50;
  v8 = (void *)NSString;
  if (-[LACDTOMutableEnvironment isDTOActive](self, "isDTOActive")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v8 stringWithFormat:@"isDTOActive: %@", v9];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v49;
  v10 = (void *)NSString;
  if (-[LACDTOMutableEnvironment isGracePeriodActive](self, "isGracePeriodActive")) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v10 stringWithFormat:@"isGracePeriodActive: %@", v11];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v48;
  v12 = (void *)NSString;
  if (-[LACDTOMutableEnvironment isStrictModeEnabled](self, "isStrictModeEnabled")) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v12 stringWithFormat:@"isStrictModeEnabled: %@", v13];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v45;
  v14 = (void *)NSString;
  if (-[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry")) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  [v14 stringWithFormat:@"hasExpiredBiometry: %@", v15];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v44;
  v16 = (void *)NSString;
  if (v3)
  {
    if (-[LACDTOMutableEnvironment allowsAuthenticationFallbacks](self, "allowsAuthenticationFallbacks")) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
  }

  else
  {
    v17 = @"<private>";
  }

  [v16 stringWithFormat:@"allowsAuthenticationFallbacks: %@", v17];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v43;
  v18 = (void *)NSString;
  if (v3)
  {
    if (-[LACDTOMutableEnvironment allowsGracePeriodUI](self, "allowsGracePeriodUI")) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
  }

  else
  {
    v19 = @"<private>";
  }

  [v18 stringWithFormat:@"allowsGracePeriodUI: %@", v19];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v42;
  v20 = (void *)NSString;
  v41 = -[LACDTOMutableEnvironment biometryWatchdogPack](self, "biometryWatchdogPack");
  [v20 stringWithFormat:@"biometryWatchdogPack: %@", v41];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v40;
  v21 = (void *)NSString;
  v39 = -[LACDTOMutableEnvironment locationState](self, "locationState");
  [v21 stringWithFormat:@"locationState: %@", v39];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v38;
  v22 = (void *)NSString;
  v37 = -[LACDTOMutableEnvironment lostModeState](self, "lostModeState");
  [v22 stringWithFormat:@"lostModeState: %@", v37];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v23;
  v24 = (void *)NSString;
  v25 = -[LACDTOMutableEnvironment featureState](self, "featureState");
  [v24 stringWithFormat:@"featureState: %@", v25];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v26;
  v27 = (void *)NSString;
  v28 = -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
  [v27 stringWithFormat:@"ratchetState: %@", v28];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v29;
  v30 = (void *)NSString;
  v31 = -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
  [v30 stringWithFormat:@"gracePeriodState: %@", v31];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v32;
  [MEMORY[0x189603F18] arrayWithObjects:v52 count:14];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 componentsJoinedByString:@"; "];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v47 stringWithFormat:@"<%@ %p; %@>", v46, self, v34];
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C797818])
  {
    id v5 = v4;
    int v6 = -[LACDTOMutableEnvironment isConfirmed](self, "isConfirmed");
    int v7 = -[LACDTOMutableEnvironment inFamiliarLocation](self, "inFamiliarLocation");
    int v8 = -[LACDTOMutableEnvironment isDTOEnabled](self, "isDTOEnabled");
    int v9 = -[LACDTOMutableEnvironment hasExpiredBiometry](self, "hasExpiredBiometry");
    int v10 = -[LACDTOMutableEnvironment allowsAuthenticationFallbacks](self, "allowsAuthenticationFallbacks");
    int v11 = -[LACDTOMutableEnvironment allowsGracePeriodUI](self, "allowsGracePeriodUI");
    int v12 = -[LACDTOMutableEnvironment isGracePeriodActive](self, "isGracePeriodActive");
    int v13 = -[LACDTOMutableEnvironment isStrictModeEnabled](self, "isStrictModeEnabled");
    v14 = -[LACDTOMutableEnvironment biometryWatchdogPack](self, "biometryWatchdogPack");
    uint64_t v15 = [v5 biometryWatchdogPack];
    if (v14 == (void *)v15)
    {
    }

    else
    {
      v16 = (void *)v15;
      v17 = -[LACDTOMutableEnvironment biometryWatchdogPack](self, "biometryWatchdogPack");
      [v5 biometryWatchdogPack];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_29;
      }
    }
    v21 = -[LACDTOMutableEnvironment featureState](self, "featureState");
    uint64_t v22 = [v5 featureState];
    if (v21 == (void *)v22)
    {
    }

    else
    {
      v23 = (void *)v22;
      v24 = -[LACDTOMutableEnvironment featureState](self, "featureState");
      [v5 featureState];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_29;
      }
    }
    v27 = -[LACDTOMutableEnvironment locationState](self, "locationState");
    uint64_t v28 = [v5 locationState];
    if (v27 == (void *)v28)
    {
    }

    else
    {
      v29 = (void *)v28;
      v30 = -[LACDTOMutableEnvironment locationState](self, "locationState");
      [v5 locationState];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      char v32 = [v30 isEqual:v31];

      if ((v32 & 1) != 0) {
        goto LABEL_29;
      }
    }
    v33 = -[LACDTOMutableEnvironment lostModeState](self, "lostModeState");
    uint64_t v34 = [v5 lostModeState];
    if (v33 == (void *)v34)
    {
    }

    else
    {
      v35 = (void *)v34;
      v36 = -[LACDTOMutableEnvironment lostModeState](self, "lostModeState");
      [v5 lostModeState];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_29;
      }
    }
    v39 = -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
    uint64_t v40 = [v5 ratchetState];
    if (v39 == (void *)v40)
    {
    }

    else
    {
      v41 = (void *)v40;
      v42 = -[LACDTOMutableEnvironment ratchetState](self, "ratchetState");
      [v5 ratchetState];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      int v44 = [v42 isEqual:v43];

      if (!v44)
      {
LABEL_29:
        char v20 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }

    -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = [v5 gracePeriodState];
    if (v46 == (void *)v47)
    {
      char v20 = 1;
      v48 = v46;
    }

    else
    {
      v48 = (void *)v47;
      v49 = -[LACDTOMutableEnvironment gracePeriodState](self, "gracePeriodState");
      [v5 gracePeriodState];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      char v20 = [v49 isEqual:v50];
    }

    goto LABEL_30;
  }

  char v20 = 0;
LABEL_31:

  return v20;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (LACDTOBiometryWatchdogPack)biometryWatchdogPack
{
  return self->_biometryWatchdogPack;
}

- (void)setBiometryWatchdogPack:(id)a3
{
}

- (LACDTOFeatureState)featureState
{
  return self->_featureState;
}

- (void)setFeatureState:(id)a3
{
}

- (LACDTOLocationState)locationState
{
  return self->_locationState;
}

- (void)setLocationState:(id)a3
{
}

- (LACDTOLostModeState)lostModeState
{
  return self->_lostModeState;
}

- (void)setLostModeState:(id)a3
{
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
}

- (LACDTOGracePeriodState)gracePeriodState
{
  return self->_gracePeriodState;
}

- (void)setGracePeriodState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end