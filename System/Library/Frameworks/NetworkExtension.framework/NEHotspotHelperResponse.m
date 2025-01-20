@interface NEHotspotHelperResponse
- (id)description;
- (void)dealloc;
- (void)deliver;
- (void)setNetwork:(NEHotspotNetwork *)network;
- (void)setNetworkList:(NSArray *)networkList;
@end

@implementation NEHotspotHelperResponse

- (void)dealloc
{
  if (self)
  {
    response = self->_response;
    if (response) {
      CFRelease(response);
    }
    self->_response = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEHotspotHelperResponse;
  -[NEHotspotHelperResponse dealloc](&v4, sel_dealloc);
}

- (id)description
{
  if (self) {
    self = (NEHotspotHelperResponse *)self->_response;
  }
  return (id)(id)CFCopyDescription(self);
}

- (void)setNetwork:(NEHotspotNetwork *)network
{
  v3 = network;
  CNPluginResponseSetNetwork();
}

- (void)setNetworkList:(NSArray *)networkList
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = networkList;
  Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = v3;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10) {
          v11 = *(const void **)(v10 + 8);
        }
        else {
          v11 = 0LL;
        }
        CFArrayAppendValue(Mutable, v11);
        ++v9;
      }

      while (v7 != v9);
      uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      uint64_t v7 = v12;
    }

    while (v12);
  }

  if (Mutable)
  {
    CNPluginResponseSetNetworkList();
    CFRelease(Mutable);
  }
}

- (void)deliver
{
}

@end