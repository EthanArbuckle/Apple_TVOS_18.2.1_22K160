@interface NSError(IOReturn)
+ (id)errorWithIOReturn:()IOReturn;
@end

@implementation NSError(IOReturn)

+ (id)errorWithIOReturn:()IOReturn
{
  v13[50] = *MEMORY[0x1895F89C0];
  v12[0] = &unk_18A02FE48;
  v12[1] = &unk_18A02FE60;
  v13[0] = @"success";
  v13[1] = @"general error";
  v12[2] = &unk_18A02FE78;
  v12[3] = &unk_18A02FE90;
  v13[2] = @"memory allocation error";
  v13[3] = @"resource shortage";
  v12[4] = &unk_18A02FEA8;
  v12[5] = &unk_18A02FEC0;
  v13[4] = @"Mach IPC failure";
  v13[5] = @"no such device";
  v12[6] = &unk_18A02FED8;
  v12[7] = &unk_18A02FEF0;
  v13[6] = @"privilege violation";
  v13[7] = @"invalid argument";
  v12[8] = &unk_18A02FF08;
  v12[9] = &unk_18A02FF20;
  v13[8] = @"device is read locked";
  v13[9] = @"device is write locked";
  v12[10] = &unk_18A02FF38;
  v12[11] = &unk_18A02FF50;
  v13[10] = @"device is exclusive access";
  v13[11] = @"bad IPC message ID";
  v12[12] = &unk_18A02FF68;
  v12[13] = &unk_18A02FF80;
  v13[12] = @"unsupported function";
  v13[13] = @"virtual memory error";
  v12[14] = &unk_18A02FF98;
  v12[15] = &unk_18A02FFB0;
  v13[14] = @"internal driver error";
  v13[15] = @"I/O error";
  v12[16] = &unk_18A02FFC8;
  v12[17] = &unk_18A02FFE0;
  v13[16] = @"cannot acquire lock";
  v13[17] = @"device is not open";
  v12[18] = &unk_18A02FFF8;
  v12[19] = &unk_18A030010;
  v13[18] = @"device is not readable";
  v13[19] = @"device is not writeable";
  v12[20] = &unk_18A030028;
  v12[21] = &unk_18A030040;
  v13[20] = @"alignment error";
  v13[21] = @"media error";
  v12[22] = &unk_18A030058;
  v12[23] = &unk_18A030070;
  v13[22] = @"device is still open";
  v13[23] = @"rld failure";
  v12[24] = &unk_18A030088;
  v12[25] = &unk_18A0300A0;
  v13[24] = @"DMA failure";
  v13[25] = @"device is busy";
  v12[26] = &unk_18A0300B8;
  v12[27] = &unk_18A0300D0;
  v13[26] = @"I/O timeout";
  v13[27] = @"device is offline";
  v12[28] = &unk_18A0300E8;
  v12[29] = &unk_18A030100;
  v13[28] = @"device is not ready";
  v13[29] = @"device/channel is not attached";
  v12[30] = &unk_18A030118;
  v12[31] = &unk_18A030130;
  v13[30] = @"no DMA channels available";
  v13[31] = @"no space for data";
  v12[32] = &unk_18A030148;
  v12[33] = &unk_18A030160;
  v13[32] = @"device port already exists";
  v13[33] = @"cannot wire physical memory";
  v12[34] = &unk_18A030178;
  v12[35] = &unk_18A030190;
  v13[34] = @"no interrupt attached";
  v13[35] = @"no DMA frames enqueued";
  v12[36] = &unk_18A0301A8;
  v12[37] = &unk_18A0301C0;
  v13[36] = @"message is too large";
  v13[37] = @"operation is not permitted";
  v12[38] = &unk_18A0301D8;
  v12[39] = &unk_18A0301F0;
  v13[38] = @"device is without power";
  v13[39] = @"media is not present";
  v12[40] = &unk_18A030208;
  v12[41] = &unk_18A030220;
  v13[40] = @"media is not formatted";
  v13[41] = @"unsupported mode";
  v12[42] = &unk_18A030238;
  v12[43] = &unk_18A030250;
  v13[42] = @"data underrun";
  v13[43] = @"data overrun";
  v12[44] = &unk_18A030268;
  v12[45] = &unk_18A030280;
  v13[44] = @"device error";
  v13[45] = @"no completion routine";
  v12[46] = &unk_18A030298;
  v12[47] = &unk_18A0302B0;
  v13[46] = @"operation was aborted";
  v13[47] = @"bus bandwidth would be exceeded";
  v12[48] = &unk_18A0302C8;
  v12[49] = &unk_18A0302E0;
  v13[48] = @"device is not responding";
  v13[49] = @"unanticipated driver error";
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:50];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"0x%x unknown", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v10 = *MEMORY[0x1896075E0];
  v11 = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607870] errorWithDomain:@"HIDFramework" code:(int)a3 userInfo:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end