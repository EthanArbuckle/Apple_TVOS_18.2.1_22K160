@interface LSApplicationWorkspaceObserver
+ (BOOL)actuallyOverridesDMFObserverMethod;
+ (BOOL)supportsSecureCoding;
- (LSApplicationWorkspaceObserver)init;
- (LSApplicationWorkspaceObserver)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (void)applicationIconDidChange:(id)a3;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidChangePersonas:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)deviceManagementPolicyDidChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)networkUsageChanged:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation LSApplicationWorkspaceObserver

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[LSApplicationWorkspaceObserver uuid](self, "uuid");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (LSApplicationWorkspaceObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSApplicationWorkspaceObserver;
  v2 = -[LSApplicationWorkspaceObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x189607AB8]);
    uuid = v2->_uuid;
    v2->_uuid = v3;
  }

  return v2;
}

- (LSApplicationWorkspaceObserver)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSApplicationWorkspaceObserver;
  id v5 = -[LSApplicationWorkspaceObserver init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"uuid");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }

  return v5;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidStart:].cold.1();
  }
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidChange:].cold.1();
  }
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidUpdateIcon:].cold.1();
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidInstall:].cold.1();
  }
}

- (void)applicationsWillInstall:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsWillInstall:].cold.1();
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsWillUninstall:].cold.1();
  }
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidFailToInstall:].cold.1();
  }
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidFailToUninstall:].cold.1();
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidUninstall:].cold.1();
  }
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _LSInstallLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsArePrioritized:arePaused:].cold.2(v5);
  }

  _LSInstallLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsArePrioritized:arePaused:].cold.1(v6);
  }
}

- (void)applicationInstallsDidPause:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidPause:].cold.1();
  }
}

- (void)applicationInstallsDidResume:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidResume:].cold.1();
  }
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidCancel:].cold.1();
  }
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationInstallsDidPrioritize:].cold.1();
  }
}

- (void)applicationStateDidChange:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationStateDidChange:].cold.1();
  }
}

- (void)applicationIconDidChange:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationIconDidChange:].cold.1();
  }
}

- (void)networkUsageChanged:(BOOL)a3
{
  BOOL v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver networkUsageChanged:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver deviceManagementPolicyDidChange:].cold.1();
  }
}

+ (BOOL)actuallyOverridesDMFObserverMethod
{
  if ((id)objc_opt_class() == a1) {
    return 0;
  }
  id v3 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v3, sel_deviceManagementPolicyDidChange_);
  return MethodImplementation != class_getMethodImplementation((Class)a1, sel_deviceManagementPolicyDidChange_);
}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v3 = a3;
  _LSInstallLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceObserver applicationsDidChangePersonas:].cold.1();
  }
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)applicationInstallsDidStart:.cold.1()
{
}

- (void)applicationInstallsDidChange:.cold.1()
{
}

- (void)applicationInstallsDidUpdateIcon:.cold.1()
{
}

- (void)applicationsDidInstall:.cold.1()
{
}

- (void)applicationsWillInstall:.cold.1()
{
}

- (void)applicationsWillUninstall:.cold.1()
{
}

- (void)applicationsDidFailToInstall:.cold.1()
{
}

- (void)applicationsDidFailToUninstall:.cold.1()
{
}

- (void)applicationsDidUninstall:.cold.1()
{
}

- (void)applicationInstallsArePrioritized:(void *)a1 arePaused:.cold.1(void *a1)
{
}

- (void)applicationInstallsArePrioritized:(void *)a1 arePaused:.cold.2(void *a1)
{
}

- (void)applicationInstallsDidPause:.cold.1()
{
}

- (void)applicationInstallsDidResume:.cold.1()
{
}

- (void)applicationInstallsDidCancel:.cold.1()
{
}

- (void)applicationInstallsDidPrioritize:.cold.1()
{
}

- (void)applicationStateDidChange:.cold.1()
{
}

- (void)applicationIconDidChange:.cold.1()
{
}

- (void)networkUsageChanged:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)deviceManagementPolicyDidChange:.cold.1()
{
}

- (void)applicationsDidChangePersonas:.cold.1()
{
}

@end