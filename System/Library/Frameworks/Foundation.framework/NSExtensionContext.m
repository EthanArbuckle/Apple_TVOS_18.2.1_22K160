@interface NSExtensionContext
+ (BOOL)supportsSecureCoding;
+ (id)_allowedErrorClasses;
+ (id)_defaultExtensionContextProtocol;
+ (id)_defaultExtensionContextVendorProtocol;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)_extensionContextForIdentifier:(id)a3;
+ (id)_extensionContextHostProtocolAllowedClassesForItems;
+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3;
+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken;
- (BOOL)_isDummyExtension;
- (BOOL)_isHost;
- (NSArray)inputItems;
- (NSExtensionContext)init;
- (NSExtensionContext)initWithCoder:(id)a3;
- (NSExtensionContext)initWithInputItems:(id)a3;
- (NSExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (NSExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (NSString)description;
- (NSUUID)_UUID;
- (NSXPCConnection)_auxiliaryConnection;
- (NSXPCListener)_auxiliaryListener;
- (OS_os_transaction)_transaction;
- (_NSExtensionContextHosting)_extensionHostProxy;
- (_NSExtensionContextVending)_extensionVendorProxy;
- (id)_principalObject;
- (id)_processAssertion;
- (id)_requestCleanUpBlock;
- (id)internalImplementation;
- (void)___nsx_pingHost:(id)a3;
- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4;
- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_setAuxiliaryConnection:(id)a3;
- (void)_setAuxiliaryListener:(id)a3;
- (void)_setDummyExtension:(BOOL)a3;
- (void)_setExtensionHostAuditToken:(id *)a3;
- (void)_setExtensionHostProxy:(id)a3;
- (void)_setExtensionVendorProxy:(id)a3;
- (void)_setPrincipalObject:(id)a3;
- (void)_setProcessAssertion:(id)a3;
- (void)_setRequestCleanUpBlock:(id)a3;
- (void)_setTransaction:(id)a3;
- (void)_willPerformHostCallback:(id)a3;
- (void)cancelRequestWithError:(NSError *)error;
- (void)completeRequestReturningItems:(NSArray *)items completionHandler:(void *)completionHandler;
- (void)completeRequestReturningItems:(id)a3 expirationHandler:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)openURL:(NSURL *)URL completionHandler:(void *)completionHandler;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)setInputItems:(id)a3;
- (void)set_UUID:(id)a3;
@end

@implementation NSExtensionContext

+ (id)_extensionContextForIdentifier:(id)a3
{
  return (id)objc_msgSend( +[_NSExtensionContextVendor _sharedExtensionContextVendor]( _NSExtensionContextVendor,  "_sharedExtensionContextVendor"),  "_extensionContextForUUID:",  a3);
}

- (void)setInputItems:(id)a3
{
}

- (NSArray)inputItems
{
  return (NSArray *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "inputItems");
}

- (void)completeRequestReturningItems:(NSArray *)items completionHandler:(void *)completionHandler
{
}

- (void)cancelRequestWithError:(NSError *)error
{
}

- (void)openURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
}

+ (id)_allowedErrorClasses
{
  return 0LL;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return 0LL;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return 0LL;
}

- (NSExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSExtensionContext;
  v8 = -[NSExtensionContext init](&v10, sel_init);
  if (v8)
  {
    if (qword_18C496798 != -1) {
      dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
    }
    v8->_internalImplementation = (id)[objc_alloc((Class)qword_18C496790) initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5 extensionContext:v8];
  }

  return v8;
}

- (NSExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  return -[NSExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]( self,  "initWithInputItems:listenerEndpoint:contextUUID:",  a3,  0LL,  a4);
}

- (NSExtensionContext)initWithInputItems:(id)a3
{
  return -[NSExtensionContext initWithInputItems:contextUUID:](self, "initWithInputItems:contextUUID:", a3, 0LL);
}

- (NSExtensionContext)init
{
  return -[NSExtensionContext initWithInputItems:](self, "initWithInputItems:", MEMORY[0x189604A58]);
}

+ (id)_extensionContextHostProtocolAllowedClassesForItems
{
  if (qword_18C496798 != -1) {
    dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
  }
  return (id)[(id)qword_18C496790 _extensionContextHostProtocolAllowedClassesForItems];
}

+ (id)_defaultExtensionContextProtocol
{
  if (qword_18C496798 != -1) {
    dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
  }
  return (id)[(id)qword_18C496790 _defaultExtensionContextProtocol];
}

+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3
{
  if (qword_18C496798 != -1) {
    dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
  }
  return (id)[(id)qword_18C496790 _extensionContextHostProtocolWithAllowedErrorClasses:a3];
}

+ (id)_defaultExtensionContextVendorProtocol
{
  if (qword_18C496798 != -1) {
    dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
  }
  return (id)[(id)qword_18C496790 _defaultExtensionContextVendorProtocol];
}

+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3
{
  if (qword_18C496798 != -1) {
    dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
  }
  return (id)[(id)qword_18C496790 _extensionContextVendorProtocolWithAllowedErrorClasses:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSExtensionContext;
  -[NSExtensionContext dealloc](&v3, sel_dealloc);
}

- (NSExtensionContext)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (qword_18C496798 != -1) {
    dispatch_once(&qword_18C496798, &__block_literal_global_1_0);
  }
  v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"self.internalExtensionContext"];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSExtensionContext;
  v6 = -[NSExtensionContext init](&v8, sel_init);
  if (v6) {
    v6->_internalImplementation = v5;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)completeRequestReturningItems:(id)a3 expirationHandler:(id)a4 completion:(id)a5
{
}

- (void)openURL:(id)a3 completion:(id)a4
{
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_UUID");
}

- (void)set_UUID:(id)a3
{
}

- (NSXPCConnection)_auxiliaryConnection
{
  return (NSXPCConnection *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_auxiliaryConnection");
}

- (void)_setAuxiliaryConnection:(id)a3
{
}

- (NSXPCListener)_auxiliaryListener
{
  return (NSXPCListener *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_auxiliaryListener");
}

- (void)_setAuxiliaryListener:(id)a3
{
}

- (_NSExtensionContextHosting)_extensionHostProxy
{
  return (_NSExtensionContextHosting *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_extensionHostProxy");
}

- (void)_setExtensionHostProxy:(id)a3
{
}

- (BOOL)_isHost
{
  return objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_isHost");
}

- (_NSExtensionContextVending)_extensionVendorProxy
{
  return (_NSExtensionContextVending *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_extensionVendorProxy");
}

- (void)_setExtensionVendorProxy:(id)a3
{
}

- (id)_processAssertion
{
  return (id)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_processAssertion");
}

- (void)_setProcessAssertion:(id)a3
{
}

- (OS_os_transaction)_transaction
{
  return (OS_os_transaction *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_transaction");
}

- (void)_setTransaction:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  result = -[NSExtensionContext internalImplementation](self, "internalImplementation");
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 _extensionHostAuditToken]( result,  "_extensionHostAuditToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)_setExtensionHostAuditToken:(id *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v4 = -[NSExtensionContext internalImplementation](self, "internalImplementation");
  __int128 v5 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v5;
  [v4 _setExtensionHostAuditToken:v6];
}

- (id)_requestCleanUpBlock
{
  return (id)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_requestCleanUpBlock");
}

- (void)_setRequestCleanUpBlock:(id)a3
{
}

- (id)_principalObject
{
  return (id)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "_principalObject");
}

- (void)_setPrincipalObject:(id)a3
{
}

- (void)invalidate
{
}

- (void)_willPerformHostCallback:(id)a3
{
}

- (void)___nsx_pingHost:(id)a3
{
}

- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4
{
}

- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4
{
}

- (void)_openURL:(id)a3 completion:(id)a4
{
}

- (NSString)description
{
  return (NSString *)objc_msgSend( -[NSExtensionContext internalImplementation](self, "internalImplementation"),  "description");
}

- (BOOL)_isDummyExtension
{
  return self->__dummyExtension;
}

- (void)_setDummyExtension:(BOOL)a3
{
  self->__dummyExtension = a3;
}

- (id)internalImplementation
{
  return objc_getProperty(self, a2, 16LL, 1);
}

@end