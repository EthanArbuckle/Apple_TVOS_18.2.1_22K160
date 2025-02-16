@interface IOHIDObsoleteDeviceClass
- (IOHIDObsoleteDeviceClass)init;
- (IOHIDOutputTransactionInterface)allocOutputTransaction;
- (IOHIDQueueInterface)allocQueue;
- (int)copyMatchingElements:(__CFDictionary *)a3 element:(const __CFArray *)a4;
- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4;
- (int)setInterruptReportHandlerCallback:(void *)a3 reportBufferSize:(unsigned int)a4 callback:(void *)a5 callbackTarget:(void *)a6 callbackRefcon:(void *)a7;
- (int)setRemovalCallback:(void *)a3 removalTarget:(void *)a4 removalRefcon:(void *)a5;
- (int)start:(id)a3 service:(unsigned int)a4;
- (void)dealloc;
@end

@implementation IOHIDObsoleteDeviceClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  uint64_t v5 = *(void *)&a3.var8;
  uint64_t v6 = *(void *)&a3.var0;
  CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes(0LL, (CFUUIDBytes)a3);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
  if (CFEqual(v8, v9)
    || (CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v8, v10)))
  {
    uint64_t v11 = 16LL;
LABEL_4:
    *a4 = (char *)self + v11;
    CFRetain(self);
    int Interface_outInterface = 0;
    goto LABEL_5;
  }

  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x78u,  0xBDu,  0x42u,  0xCu,  0x6Fu,  0x14u,  0x11u,  0xD4u,  0x94u,  0x74u,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  if (CFEqual(v8, v14)
    || (CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xB7u,  0xAu,  0xBFu,  0x31u,  0x16u,  0xD5u,  0x11u,  0xD7u,  0xABu,  0x35u,  0,  3u,  0x93u,  0x99u,  0x2Eu,  0x38u),  CFEqual(v8, v15)))
  {
    uint64_t v11 = 176LL;
    goto LABEL_4;
  }

  CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x81u,  0x38u,  0x62u,  0x9Eu,  0x6Fu,  0x14u,  0x11u,  0xD4u,  0x97u,  0xEu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  if (CFEqual(v8, v16))
  {
    v17 = &OBJC_CLASS___IOHIDObsoleteQueueClass;
LABEL_15:
    id v19 = objc_alloc(v17);
    v23 = (void *)objc_msgSend_initWithDevice_(v19, v20, (uint64_t)self, v21, v22);
    int Interface_outInterface = objc_msgSend_queryInterface_outInterface_(v23, v24, v6, v5, (uint64_t)a4);

    goto LABEL_5;
  }

  CFUUIDRef v18 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x80u,  0xCDu,  0xCCu,  0,  0x75u,  0x5Du,  0x11u,  0xD4u,  0x80u,  0xEFu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  if (CFEqual(v8, v18))
  {
    v17 = &OBJC_CLASS___IOHIDOutputTransactionClass;
    goto LABEL_15;
  }

  int Interface_outInterface = -2147483644;
LABEL_5:
  if (v8) {
    CFRelease(v8);
  }
  return Interface_outInterface;
}

- (int)setRemovalCallback:(void *)a3 removalTarget:(void *)a4 removalRefcon:(void *)a5
{
  self->_removalTarget = a4;
  self->_removalRefcon = a5;
  self->_removalCallback = a3;
  if (self->_notification) {
    return 0;
  }
  else {
    return IOServiceAddInterestNotification( self->_notifyPort,  self->super._service,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1890957A4,  self,  &self->_notification);
  }
}

- (int)getElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4 options:(unsigned int)a5
{
  int v5 = -536870206;
  if (a4)
  {
    uint64_t v6 = *(void *)&a5;
    v47.receiver = self;
    v47.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
    CFUUIDRef v9 = -[IOHIDDeviceClass getElement:](&v47, sel_getElement_, *(void *)&a3);
    IOHIDValueRef value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
    if (v9)
    {
      v45.receiver = self;
      v45.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
      int v10 = -[IOHIDDeviceClass getValue:value:timeout:callback:context:options:]( &v45,  sel_getValue_value_timeout_callback_context_options_,  v9,  &value,  0LL,  0LL,  0LL,  v6);
      if (v10)
      {
        return v10;
      }

      else
      {
        IOHIDElementRef Element = IOHIDValueGetElement(value);
        v12 = objc_alloc(&OBJC_CLASS___HIDLibElement);
        CFUUIDRef v16 = (void *)objc_msgSend_initWithElementRef_(v12, v13, (uint64_t)Element, v14, v15);
        objc_msgSend_setValueRef_(v16, v17, (uint64_t)value, v18, v19);
        uint32_t v24 = objc_msgSend_length(v16, v20, v21, v22, v23);
        a4->type = objc_msgSend_type(v16, v25, v26, v27, v28);
        a4->elementCookie = objc_msgSend_elementCookie(v16, v29, v30, v31, v32);
        a4->timestamp = (AbsoluteTime)objc_msgSend_timestamp(v16, v33, v34, v35, v36);
        size_t v41 = v24;
        if (v24 < 5uLL)
        {
          a4->longValueSize = 0;
          a4->longValue = 0LL;
          a4->IOHIDValueRef value = objc_msgSend_integerValue(v16, v37, v38, v39, v40);
        }

        else
        {
          a4->longValueSize = v24;
          v42 = malloc(v24);
          a4->longValue = v42;
          BytePtr = IOHIDValueGetBytePtr(value);
          memmove(v42, BytePtr, v41);
        }

        return 0;
      }
    }
  }

  return v5;
}

- (int)setElementValue:(unsigned int)a3 value:(IOHIDEventStruct *)a4
{
  int v4 = -536870212;
  if (!a4) {
    return -536870206;
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
  uint64_t v6 = -[IOHIDDeviceClass getElement:](&v12, sel_getElement_, *(void *)&a3);
  uint64_t v7 = _IOHIDValueCreateWithStruct();
  CFUUIDRef v8 = (const void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (!v7) {
      return v4;
    }
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
    int v4 = -[IOHIDDeviceClass setValue:value:timeout:callback:context:options:]( &v11,  sel_setValue_value_timeout_callback_context_options_,  v6,  v7,  0LL,  0LL,  0LL,  0LL);
  }

  CFRelease(v8);
  return v4;
}

- (IOHIDQueueInterface)allocQueue
{
  uint64_t v6 = 0LL;
  v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x81u,  0x38u,  0x62u,  0x9Eu,  0x6Fu,  0x14u,  0x11u,  0xD4u,  0x97u,  0xEu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(v3);
  objc_msgSend_queryInterface_outInterface_( self,  *(const char **)&v4.byte8,  *(uint64_t *)&v4.byte0,  *(uint64_t *)&v4.byte8,  (uint64_t)&v6);
  return v6;
}

- (IOHIDOutputTransactionInterface)allocOutputTransaction
{
  uint64_t v6 = 0LL;
  v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x80u,  0xCDu,  0xCCu,  0,  0x75u,  0x5Du,  0x11u,  0xD4u,  0x80u,  0xEFu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(v3);
  objc_msgSend_queryInterface_outInterface_( self,  *(const char **)&v4.byte8,  *(uint64_t *)&v4.byte0,  *(uint64_t *)&v4.byte8,  (uint64_t)&v6);
  return v6;
}

- (int)copyMatchingElements:(__CFDictionary *)a3 element:(const __CFArray *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
  return -[IOHIDDeviceClass copyMatchingElements:elements:options:]( &v5,  sel_copyMatchingElements_elements_options_,  a3,  a4,  1LL);
}

- (int)setInterruptReportHandlerCallback:(void *)a3 reportBufferSize:(unsigned int)a4 callback:(void *)a5 callbackTarget:(void *)a6 callbackRefcon:(void *)a7
{
  self->_reportCallbackTarget = a6;
  self->_reportCallbackRefcon = a7;
  self->_reportCallback = a5;
  return MEMORY[0x189616718]( self,  sel_setInputReportCallback_reportLength_callback_context_options_,  a3,  a4,  sub_189095BE4);
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
  -[IOHIDDeviceClass start:service:](&v10, sel_start_service_, a3, *(void *)&a4);
  objc_msgSend_initQueue(self, v5, v6, v7, v8);
  return 0;
}

- (IOHIDObsoleteDeviceClass)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
  v2 = -[IOHIDDeviceClass init](&v10, sel_init);
  if (v2)
  {
    v3 = (char *)malloc(0xB0uLL);
    v2->_interface = (IOHIDDeviceInterface122 *)v3;
    vtbl = v2->super.super.super._vtbl;
    Release = vtbl->Release;
    __int128 v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((void *)v3 + 3) = Release;
    *((void *)v3 + 4) = sub_189095DD0;
    *((void *)v3 + 5) = sub_189095E40;
    *((void *)v3 + 6) = sub_189095E5C;
    *((void *)v3 + 7) = sub_189095E80;
    *((void *)v3 + 8) = sub_189095E9C;
    *((void *)v3 + 9) = sub_189095EAC;
    *((void *)v3 + 10) = sub_189095EBC;
    *((void *)v3 + 11) = sub_189095ED4;
    *((void *)v3 + 12) = sub_189095EEC;
    *((void *)v3 + 13) = sub_189095F00;
    *((void *)v3 + 14) = sub_189095F18;
    *((void *)v3 + 15) = sub_189095F34;
    *((void *)v3 + 16) = sub_189095F50;
    *((void *)v3 + 17) = sub_189095F5C;
    *((void *)v3 + 18) = sub_189095F68;
    *((void *)v3 + 19) = sub_189095FB0;
    *((void *)v3 + 20) = sub_189096078;
    *((void *)v3 + 21) = sub_18909608C;
    uint64_t v7 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
    v2->_notifyPort = v7;
    IONotificationPortSetDispatchQueue(v7, MEMORY[0x1895F8AE0]);
    uint64_t v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  notifyPort = self->_notifyPort;
  if (notifyPort) {
    IONotificationPortDestroy(notifyPort);
  }
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IOHIDObsoleteDeviceClass;
  -[IOHIDDeviceClass dealloc](&v5, sel_dealloc);
}

@end