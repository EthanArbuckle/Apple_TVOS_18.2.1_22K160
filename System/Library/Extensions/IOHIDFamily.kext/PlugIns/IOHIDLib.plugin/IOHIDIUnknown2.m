@interface IOHIDIUnknown2
- (IOHIDIUnknown2)init;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (void)dealloc;
@end

@implementation IOHIDIUnknown2

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  return -2147483644;
}

- (IOHIDIUnknown2)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IOHIDIUnknown2;
  v2 = -[IOHIDIUnknown2 init](&v6, sel_init);
  if (v2)
  {
    v3 = (IUnknownVTbl *)malloc(0x20uLL);
    v2->_vtbl = v3;
    v3->_reserved = v2;
    v3->QueryInterface = (HRESULT (__cdecl *)(void *, REFIID, LPVOID *))sub_1890899B8;
    v3->AddRef = (ULONG (__cdecl *)(void *))sub_1890899D0;
    v3->Release = (ULONG (__cdecl *)(void *))sub_189089A10;
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IOHIDIUnknown2;
  -[IOHIDIUnknown2 dealloc](&v3, sel_dealloc);
}

@end