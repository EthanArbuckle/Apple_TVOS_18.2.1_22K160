@interface SDNetworkBrowser
- (NSDictionary)options;
- (NSNumber)isEntitled;
- (NSString)bundleID;
- (NSString)kind;
- (NSString)objectKey;
- (OS_xpc_object)boostMessage;
- (OS_xpc_object)connection;
- (SDNetworkBrowser)initWithKind:(id)a3 rootNode:(__SFNode *)a4;
- (SDNetworkBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (__SFNode)copyRootNode;
- (id)childrenForNode:(__SFNode *)a3;
- (id)sidebarChildren;
- (int)addNode:(__SFNode *)a3;
- (int)closeNode:(__SFNode *)a3;
- (int)openNode:(__SFNode *)rootNode forProtocol:(id)a4 flags:(unint64_t)a5;
- (int)removeNode:(__SFNode *)a3;
- (int64_t)mode;
- (void)dealloc;
- (void)invalidate;
- (void)nodeBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6;
- (void)setBoostMessage:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setIsEntitled:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setObjectKey:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SDNetworkBrowser

- (SDNetworkBrowser)initWithKind:(id)a3 rootNode:(__SFNode *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SDNetworkBrowser;
  v8 = -[SDNetworkBrowser init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    isEntitled = v8->_isEntitled;
    v8->_isEntitled = 0LL;

    v9->_mode = 0LL;
    objc_storeStrong((id *)&v9->_kind, a3);
    connection = v9->_connection;
    v9->_connection = 0LL;

    v9->_rootNode = (__SFNode *)CFRetain(a4);
    v9->_nodeBrowsers = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v12 = os_transaction_create("com.apple.sharing.SDNetworkBrowser");
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v12;
  }

  return v9;
}

- (void)dealloc
{
  rootNode = self->_rootNode;
  if (rootNode) {
    CFRelease(rootNode);
  }
  nodeBrowsers = self->_nodeBrowsers;
  if (nodeBrowsers) {
    CFRelease(nodeBrowsers);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDNetworkBrowser;
  -[SDNetworkBrowser dealloc](&v5, "dealloc");
}

- (void)nodeBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  p_delegate = &self->_delegate;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkBrowser:self nodesChangedForParent:a4 protocol:v10 error:v6];
}

- (int)openNode:(__SFNode *)rootNode forProtocol:(id)a4 flags:(unint64_t)a5
{
  id v8 = a4;
  if (!rootNode) {
    rootNode = self->_rootNode;
  }
  Value = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(Value);
  if (v10)
  {
    v11 = (SDNodeBrowser *)v10;
  }

  else
  {
    if (!SFNodeIsContainer(rootNode))
    {
      v11 = 0LL;
      int v13 = -1;
      goto LABEL_8;
    }

    v11 = -[SDNodeBrowser initWithNode:protocol:flags:kind:]( objc_alloc(&OBJC_CLASS___SDNodeBrowser),  "initWithNode:protocol:flags:kind:",  rootNode,  v8,  a5,  self->_kind);
    CFDictionarySetValue(self->_nodeBrowsers, rootNode, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDNetworkBrowser helperConnection](self, "helperConnection"));
    -[SDNodeBrowser setHelperConnection:](v11, "setHelperConnection:", v12);

    -[SDNodeBrowser setBundleID:](v11, "setBundleID:", self->_bundleID);
    -[SDNodeBrowser setConnection:](v11, "setConnection:", self->_connection);
    -[SDNodeBrowser setDelegate:](v11, "setDelegate:", self);
    -[SDNodeBrowser setMode:](v11, "setMode:", self->_mode);
    -[SDNodeBrowser setOptions:](v11, "setOptions:", self->_options);
    -[SDNodeBrowser start](v11, "start");
  }

  int v13 = 0;
LABEL_8:

  return v13;
}

- (__SFNode)copyRootNode
{
  result = self->_rootNode;
  if (result) {
    return (__SFNode *)CFRetain(result);
  }
  return result;
}

- (id)childrenForNode:(__SFNode *)a3
{
  rootNode = a3;
  if (!a3) {
    rootNode = self->_rootNode;
  }
  Value = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  uint64_t v6 = v5;
  if (v5) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 nodes]);
  }
  else {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)sidebarChildren
{
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v3 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v4 = v3;
  if (v3) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 sidebarNodes]);
  }
  else {
    objc_super v5 = &__NSArray0__struct;
  }

  return v5;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v5 = (id)objc_claimAutoreleasedReturnValue(Value);
  [v5 setMode:a3];
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOptions:(id)a3
{
  id v5 = a3;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v7 = (id)objc_claimAutoreleasedReturnValue(Value);
  [v7 setOptions:v5];
}

- (NSDictionary)options
{
  return self->_options;
}

- (int)addNode:(__SFNode *)a3
{
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  uint64_t v6 = v5;
  if (v5) {
    int v7 = [v5 addNode:a3];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (int)removeNode:(__SFNode *)a3
{
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  uint64_t v6 = v5;
  if (v5) {
    int v7 = [v5 removeNode:a3];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (int)closeNode:(__SFNode *)a3
{
  rootNode = a3;
  if (!a3) {
    rootNode = self->_rootNode;
  }
  Value = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
  int v7 = v6;
  if (v6)
  {
    [v6 stop];
    [v7 setDelegate:0];
    CFDictionaryRemoveValue(self->_nodeBrowsers, rootNode);
  }

  return 0;
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary allValues](self->_nodeBrowsers, "allValues"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        [v8 setDelegate:0];
        [v8 stop];
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  CFDictionaryRemoveAllValues(self->_nodeBrowsers);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)objectKey
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setObjectKey:(id)a3
{
}

- (OS_xpc_object)boostMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setBoostMessage:(id)a3
{
}

- (SDNetworkBrowserDelegate)delegate
{
  return (SDNetworkBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSNumber)isEntitled
{
  return (NSNumber *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setIsEntitled:(id)a3
{
}

- (void).cxx_destruct
{
}

@end