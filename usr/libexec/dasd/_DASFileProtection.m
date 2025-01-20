@interface _DASFileProtection
- (unint64_t)asBiomeProtectionClass;
@end

@implementation _DASFileProtection

- (unint64_t)asBiomeProtectionClass
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassA]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassA"));
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) != 0) {
    return 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassB]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassB"));
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) != 0) {
    return 2LL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  unsigned __int8 v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) != 0) {
    return 3LL;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFileProtection protectionType](self, "protectionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassD]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassD"));
  unsigned int v15 = [v13 isEqualToString:v14];

  if (v15) {
    return 4LL;
  }
  else {
    return 3LL;
  }
}

@end